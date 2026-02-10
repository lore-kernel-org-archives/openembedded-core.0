Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02D1CEA811B
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 14:08:45 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20378.1770732516445815010
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 06:08:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=sCcsfglS;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C13DA1A0D4B;
	Tue, 10 Feb 2026 14:08:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7D5CE606BD;
	Tue, 10 Feb 2026 14:08:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ED74910B92003;
	Tue, 10 Feb 2026 15:08:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770732514; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XN4i2ndKGWAly/yjQqWDofpEapgdxUTuTnMk/d2AhGs=;
	b=sCcsfglSOkdy46bwXxAdvGu5CRGezTaOaCF2Faq2W8dJ58oMUOlGo1N2QBgYpq4iFjCO+C
	0kgqcGisxRWOh2G2d/i+25ouWJ/iZT1tWfANXmMwmT62jZFo8CNzRoSvx1UD3Ug04q5vgb
	/ciIpTUBEhnBfZd58k5faRKojhNrK5bgedo2G4cUYPwvRKN/U51ZR5I0TnWMMJxFTYXn1x
	7ldN7WJl8Fzs2aZymCaIQ0ukB6jBLfQTkMml1cUbguGztQz8Kpp75tU8wNDhi1+yqq4ce/
	nGhXa5Xs/pvyQgVeDqANB44ks4y6Mv1nvk8tUkV2r6nKlhpSG1mhH18Ewu03rw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Feb 2026 15:08:32 +0100
Message-Id: <DGBCAE5TXZG4.2B7KRHDG5GBV4@bootlin.com>
Subject: Re: [OE-core] [PATCH 0/13] kernel-yocto: 6.18 updates and 6.12/6.16
 removal
Cc: =?utf-8?q?Jan-Simon_M=C3=B6ller?= <jsmoeller@linuxfoundation.org>,
 <openembedded-core@lists.openembedded.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <bruce.ashfield@gmail.com>, "Richard Purdie"
 <richard.purdie@linuxfoundation.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260206202732.1080699-1-bruce.ashfield@gmail.com>
 <DGB77NZHNM3V.2EJ7FXYV0OH5Q@bootlin.com>
 <e8f2e5e39f2ced4d3fd25d33159ce8bdaaa5313a.camel@linuxfoundation.org>
 <CADkTA4Nn8UA1Y9raEU4d+GT8q6yTKKxvCnmW1fDBwOHGitC_xQ@mail.gmail.com>
In-Reply-To: <CADkTA4Nn8UA1Y9raEU4d+GT8q6yTKKxvCnmW1fDBwOHGitC_xQ@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 14:08:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230900

On Tue Feb 10, 2026 at 2:42 PM CET, Bruce Ashfield via lists.openembedded.o=
rg wrote:
> On Tue, Feb 10, 2026 at 8:19=E2=80=AFAM Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
>
>> On Tue, 2026-02-10 at 11:09 +0100, Mathieu Dubois-Briand wrote:
>> > On Fri Feb 6, 2026 at 9:27 PM CET, Bruce Ashfield via
>> lists.openembedded.org wrote:
>> > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
>> > >
>> > > Hi all,
>> > >
>> > > Here's my series for the two repositories combined into one.
>> > > I usually do end up missing some reference to the old kernels,
>> > > so I'm never completely sure that I've gotten them all.
>> > >
>> > > But with this (and thanks to Kevin getting the beaglebone
>> > > working with 6.18/standard/base), we are down to just the
>> > > single reference kernel.
>> > >
>> > > As usual, I'll continue updating any kernel that is active
>> > > upstream, and I'll send -stable updates to the appropriate
>> > > branches.
>> > >
>> > > I also plan to make my scripts available for those that may
>> > > want to bump SRCREVs by themselves to continue consuming my
>> > > merges.
>> > >
>> > > I'm out for the weekend, but will pick up any issues with
>> > > this on first thing Monday morning.
>> >
>> > Looks correct on the autobuilder.
>> >
>> > Just a quick note for Jan-Simon: once merged, this will break meta-
>> > agl
>> > layer, as it refers to 6.16 as a preferred version:
>> >
>> > WARNING: preferred version 6.16% of linux-yocto not available (for
>> > item virtual/kernel)
>> > WARNING: versions of linux-yocto available: 6.18.8+git
>> >
>> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/55/builds/298=
7
>>
>> It mostly worked in my testing except for:
>>
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/60/builds/3148
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/22/builds/3176
>>
>> linux-yocto-6.18.7+git-r0 do_kernel_version_sanity_check: Package Versio=
n
>> (6.18.7+git) does not match of kernel being built (6.18.8). Please updat=
e
>> the PV variable to match the kernel source or set
>> KERNEL_VERSION_SANITY_SKIP=3D"1" in your recipe.
>>
>> Did I miss a patch or something?
>>
>
> Something may have misfired in my scripts. I'm still adapting them
> to non-poky combo layer.
>
> I'll have a look and see if one of mv PVs didn't bump properly.
>
> Bruce
>

I believe your series is complete, as it did build correctly with my
branch. I think Richard is missing some commits in his branch,
including:
linux-yocto/6.18: update to v6.18.8

Just a note about the process while we are at it: picking this series
was not straightforward, at least with b4: it got confused by patches
1-4 appearing twice (1 oe-core, 1 meta-yocto). It was not a big deal and
I have no suggestion for a better process so far, but it would be
helpful if patch numbers were unique.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


