Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 1BA97771E8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2016 09:34:04 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u7B9Xwwo008156; Thu, 11 Aug 2016 04:33:58 -0500
Received: from adi-pc-linux ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016081104335842-926773 ;
	Thu, 11 Aug 2016 04:33:58 -0500 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: "Burton\, Ross" <ross.burton@intel.com>
In-Reply-To: <87r39vn11t.fsf@ni.com>
References: <20160810155851.17172-1-adrian.ratiu@ni.com>
	<CAJTo0LYN2OoK5qBJiLpa_5YJ_qBDCqjEpqeWacnNqQ48Ad9FnA@mail.gmail.com>
	<87r39vn11t.fsf@ni.com>
User-Agent: Notmuch/0.22.1 (https://notmuchmail.org) Emacs/25.1.50.1
	(x86_64-unknown-linux-gnu)
Date: Thu, 11 Aug 2016 12:32:47 +0300
Message-ID: <87oa4zmz0g.fsf@ni.com>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 08/11/2016 04:33:58 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 08/11/2016 04:33:58 AM,
	Serialize complete at 08/11/2016 04:33:58 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-08-11_06:, , signatures=0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH RESEND] kernel.bbclass: fix	emit_depmod_pkgdata() workdir
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Aug 2016 09:34:05 -0000
Content-Type: text/plain

On Thu, 11 Aug 2016, Ioan-Adrian Ratiu <adrian.ratiu@ni.com> wrote:
> On Wed, 10 Aug 2016, "Burton, Ross" <ross.burton@intel.com> wrote:
>> On 10 August 2016 at 16:58, Ioan-Adrian Ratiu <adrian.ratiu@ni.com> wrote:
>>
>>> bitbake commit 67a7b8b02 "build: don't use $B as the default cwd for
>>> functions" breaks the assumption that this function is running under
>>> ${B}. This causes build failures because System.map is under ${B}.
>>>
>>
>> For clarity, can the function simply always use absolute paths instead of
>> relying on cwd?
>
> Yes, but other functions inside this bbclass also rely on cwd being
> ${B}; should I modify only this one to absolute paths or modify all of
> these functions (do_shared_workdir, or do_strip) to maintain consistency?
>

Ah nvm, I've looked closer at them functions and their use of cwd = $B
makes sense so it doesn't need modyfing. I'll resubmit only this patch.

>>
>> Ross
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

