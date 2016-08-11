Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 25A1E771DA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2016 10:50:31 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u7BAoV4l012502; Thu, 11 Aug 2016 05:50:31 -0500
Received: from adi-pc-linux ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016081105503058-232522 ;
	Thu, 11 Aug 2016 05:50:30 -0500 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: "Burton\, Ross" <ross.burton@intel.com>
In-Reply-To: <CAJTo0LZ_Ka0jK8HyaoutN9bw72mhOaO4qVnmS_s-0xLN0qsrpg@mail.gmail.com>
References: <20160811093906.353-1-adrian.ratiu@ni.com>
	<CAJTo0LZ_Ka0jK8HyaoutN9bw72mhOaO4qVnmS_s-0xLN0qsrpg@mail.gmail.com>
User-Agent: Notmuch/0.22.1 (https://notmuchmail.org) Emacs/25.1.50.1
	(x86_64-unknown-linux-gnu)
Date: Thu, 11 Aug 2016 13:49:18 +0300
Message-ID: <87eg5vmvgx.fsf@ni.com>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 08/11/2016 05:50:30 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 08/11/2016 05:50:31 AM,
	Serialize complete at 08/11/2016 05:50:31 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-08-11_07:, , signatures=0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] kernel.bbclass: fix emit_depmod_pkgdata() workdir
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
X-List-Received-Date: Thu, 11 Aug 2016 10:50:32 -0000
Content-Type: text/plain

On Thu, 11 Aug 2016, "Burton, Ross" <ross.burton@intel.com> wrote:
> On 11 August 2016 at 10:39, Ioan-Adrian Ratiu <adrian.ratiu@ni.com> wrote:
>
>> bitbake commit 67a7b8b02 "build: don't use $B as the default cwd for
>> functions" breaks the assumption that this function is running under
>> ${B}. This causes build failures because System.map is under ${B}.
>> Fix this by using an absolute path instead of relying on cwd.
>>
>
> This failed to apply and I noticed that I fixed this myself in July...

What commit id is the fix on the master branch? I can't find it..

>
> Ross

