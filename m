Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13D33EA4FCE
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 14:58:26 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36795.1771858702358545041
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Feb 2026 06:58:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=2oQX/564;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 37467C143CB;
	Mon, 23 Feb 2026 14:58:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0D2A25FD59;
	Mon, 23 Feb 2026 14:58:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1109210368F9A;
	Mon, 23 Feb 2026 15:58:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771858699; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=deIhkiM2GOHo6hyj9vbBxticOpDEg3cNQBmW19HZsiE=;
	b=2oQX/564sCqiAChW0a9+B7xAQ/jtCfzF1C2xrPZ7FHAWbe2ogIBM9qcV6i/2xY3k2M8eiH
	NOedPRnMZn6Bhj47sD8dwnFvzF6VyinKPGVfGy0b2MoEQV+7x4WFEOWwrpaekN6FRn7etO
	onjVRGwNF4kt+LXEk8ZLzTU94SecDy6L60/168P7dTkjtPnyBgJ1Gcci9NaW3cQdV78aj8
	Tt68+4KlFQZ6TXnOys5Vm5vZIuZWlpPUU+obB5FinNfTGiiLp13nsY5ptJ0mOomU6Wu/GI
	R2LiJjciwflQtW38NxVSYN4qTS+xj2Y92aplwkXeht32Xdp955z2G1PsmtjiMg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Feb 2026 15:58:17 +0100
Message-Id: <DGMFHKEHBIY4.24DUCLY3ZXN7N@bootlin.com>
Subject: Re: [OE-core] [PATCH v6 0/7] rpm: 4.20.1 -> 6.0.1
Cc: <liezhi.yang@windriver.com>, <openembedded-core@lists.openembedded.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <alex.kanavin@gmail.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <cover.1771409846.git.liezhi.yang@windriver.com>
 <DGIA0D4P60DI.1CA8PWS58YCCF@bootlin.com>
 <212e8187-1b6f-4c2c-8d57-97cc66387c56@windriver.com>
 <DGKMRZ496JHU.1T1MJETE5VNUN@bootlin.com>
 <CANNYZj9DHuV3rmaAsZsPcbZ2ZsbMrNe+keNgVazav=3hUnYQKQ@mail.gmail.com>
In-Reply-To: <CANNYZj9DHuV3rmaAsZsPcbZ2ZsbMrNe+keNgVazav=3hUnYQKQ@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 14:58:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231670

On Mon Feb 23, 2026 at 1:27 PM CET, Alexander Kanavin via lists.openembedde=
d.org wrote:
> On Sat, 21 Feb 2026 at 13:15, Mathieu Dubois-Briand via
> lists.openembedded.org
> <mathieu.dubois-briand=3Dbootlin.com@lists.openembedded.org> wrote:
>
>> > I'm sorry about that, but I can't reproduce the error, here are my set=
tings:
>> >
>> > PACKAGE_CLASSES =3D "package_rpm"
>> > MACHINE =3D "genericx86"
>> > DISTRO =3D "poky"
>> >
>> > $ bitbake core-image-sato -cpopulate_sdk
>> >
>> > I checked
>> > tmp/deploy/sdk/poky-glibc-x86_64-core-image-sato-core2-32-genericx86-t=
oolchain-5.3.99+snapshot.target.manifest,
>> > All the required packages are installed correctly:
>> >
>> > flac-dev core2_32 1.5.0
>> > libcomps-dev core2_32 0.1.23
>> > libreadline-dev core2_32 8.3
>> > libogg-dev core2_32 1.3.6
>> > libxml2-dev core2_32 2.15.1
>> > ncurses-dev core2_32 6.5
>> >
>> > I also tested with IMAGE_CLASSES +=3D "testimage", it also works well.
>> >
>> > Do you have more info on how I can reproduce the issue, please?
>>
>> I tried to reproduce it locally yesterday, and I had the same issue: the
>> failure did not reproduce. Yet I tried again to apply your patches and
>> got a similar error on the autobuilder.
>>
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/19/builds/3218
>>
>> I will try to investigate this next week.
>
> Note that the autobuilder enables the
> 'core/yocto-autobuilder/autobuilder' fragment, which contains
> significant SDK tweaks:
>
> SDK_EXT_TYPE =3D 'minimal'
> SDK_INCLUDE_TOOLCHAIN =3D '1'
> ESDK_LOCALCONF_REMOVE:append =3D 'BB_HASHSERVE'
> SDK_TOOLCHAIN_LANGS +=3D 'go rust'
>
> I suspect the above may be enough to trigger the issue (or maybe if
> you enable the whole fragment).
>
> Alex

Of course! It was definitely the missing config, thanks!

So it was reproduced locally, with basically the template local.conf
and the following added lines:
PACKAGE_CLASSES =3D "package_rpm"
OE_FRAGMENTS +=3D 'machine/qemux86 distro/poky'
OE_FRAGMENTS +=3D 'core/yocto-autobuilder/autobuilder'

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


