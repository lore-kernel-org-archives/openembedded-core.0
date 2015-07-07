Return-Path: <rich.tollerton@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id C806373F9E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jul 2015 16:37:10 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t67Gb3SX013776; Tue, 7 Jul 2015 11:37:03 -0500
Received: from weregild.amer.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2015070711370282-726732 ;
	Tue, 7 Jul 2015 11:37:02 -0500 
From: Richard Tollerton <rich.tollerton@ni.com>
To: "Burton\, Ross" <ross.burton@intel.com>
In-Reply-To: <CAJTo0Lb1Nth4VGocNqTDWFnrzO4_FGFbeg6Akk7ZmSvFLPP6Ew@mail.gmail.com>
References: <alpine.LFD.2.11.1502190508290.29947@localhost>
	<CAF3SDA6sUY=4cg-pihtftzTNDREm5cKMS7MqQp4DJ9M81ez5UQ@mail.gmail.com>
	<87vbdwy88m.fsf@weregild.amer.corp.natinst.com>
	<CAJTo0Lb1Nth4VGocNqTDWFnrzO4_FGFbeg6Akk7ZmSvFLPP6Ew@mail.gmail.com>
User-Agent: Notmuch/0.20.1 (http://notmuchmail.org) Emacs/24.5.2
	(x86_64-unknown-linux-gnu)
Date: Tue, 07 Jul 2015 11:37:02 -0500
Message-ID: <87io9vyle9.fsf@weregild.amer.corp.natinst.com>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 07/07/2015 11:37:03 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 07/07/2015 11:37:03 AM,
	Serialize complete at 07/07/2015 11:37:03 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-07-07_06:, , signatures=0
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	"Daniel." <danielhilst@gmail.com>,
	Yocto discussion list <yocto@yoctoproject.org>
Subject: Re: [PATCH] cross-localedef-native_2.20.bb: fix for gcc5
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
X-List-Received-Date: Tue, 07 Jul 2015 16:37:15 -0000
Content-Type: text/plain

"Burton, Ross" <ross.burton@intel.com> writes:

> On 7 July 2015 at 03:54, Richard Tollerton <rich.tollerton@ni.com> wrote:
>
>> The build of cross-localedef-native is observed to fail under gcc5 hosts
>> with multiple definition errors, e.g.:
>>
>
> Is this patch intended for fido?  Master doesn't have 2.20 anymore (2.21)
> and I believe that works with gcc5 hosts.

It was nominally written for dizzy.

It looks like Khem already added -fgnu89-inline in his initial commit of
cross-localedef-native_2.21.bb, so that's why this works in fido (and
master).

