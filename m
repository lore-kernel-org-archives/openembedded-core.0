Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 10332731AC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2016 13:49:16 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u7GDn0XU019690; Tue, 16 Aug 2016 08:49:15 -0500
Received: from adi-pc-linux ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016081608403115-397786 ;
	Tue, 16 Aug 2016 08:40:31 -0500 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: "Burton\, Ross" <ross.burton@intel.com>
In-Reply-To: <CAJTo0LYORQDBfrtEdkuhk7F1f=a2fgZP8fr34ZZtaoy110YUeQ@mail.gmail.com>
References: <20160812131549.32088-1-adrian.ratiu@ni.com>
	<CAJTo0LYORQDBfrtEdkuhk7F1f=a2fgZP8fr34ZZtaoy110YUeQ@mail.gmail.com>
User-Agent: Notmuch/0.22.1 (https://notmuchmail.org) Emacs/25.1.50.1
	(x86_64-unknown-linux-gnu)
Date: Tue, 16 Aug 2016 16:39:12 +0300
Message-ID: <874m6kn88v.fsf@ni.com>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 08/16/2016 08:40:31 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 08/16/2016 08:49:15 AM,
	Serialize complete at 08/16/2016 08:49:15 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-08-16_09:, , signatures=0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] grub: split grub-editenv into it's own package
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
X-List-Received-Date: Tue, 16 Aug 2016 13:49:17 -0000
Content-Type: text/plain

On Tue, 16 Aug 2016, "Burton, Ross" <ross.burton@intel.com> wrote:
> On 12 August 2016 at 14:15, Ioan-Adrian Ratiu <adrian.ratiu@ni.com> wrote:
>
>> +PACKAGES =+ "grub-editenv"
>> +
>> +FILES_grub-editenv = "${bindir}/grub-editenv"
>>
>
> Shouldn't grub rdepend, or at least rrecommend, grub-editenv?

Good catch. RDEPENDS_grub would preserve the previous behaviour.
I'll send v2.

Thank you!

>
> Ross

