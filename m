Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5B59CA0EE4
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 14:22:02 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web11.6.1755699713803931496
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Aug 2025 07:21:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=i6amHQdI;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 395B54E40BEE
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 14:21:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 13211606A0;
	Wed, 20 Aug 2025 14:21:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B446D1C22D089;
	Wed, 20 Aug 2025 16:21:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1755699711; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ubU6YzsO1r7dyPSy3H2QabLYBSBJ/4sioGJrYCphbTA=;
	b=i6amHQdIP0J1xBlQXk5z05vWYFmR4a+zXB7qcbPxCs67elC3QUqcm3fXDnl0wWhZDrajzD
	qpHnnWn9nK7ibCpGkPX9MCv76cFoZVU/0v9YyqMHmv3tNe1mAGSvCOMfam8yddetcdC3OO
	ejY90WAMQn+8bO/s15TTb2u4WVI4lPQpIpTjCD6Ya1ZU+0Kv2xK2xQFmJfIw/1uoQn68af
	Rne86M/k8Tx9DYw3oOaEYu8gxFQ14Rz5gm5W1jHwHdSxEfcG88nrs6k2d+wlv4t1UaGueB
	QLkel+vXHuB1Edy5G4axUViLedJ+V1tTAQRr4TraQnQ3f3VrBuFtEyuCWsFjcw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 20 Aug 2025 16:21:46 +0200
Message-Id: <DC7BLQNJQSDT.14IQYI2LY4PH7@bootlin.com>
To: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
Subject: Re: [OE-core] [PATCHv4 1/2] systemd-systemctl-native: Install
 systemd-sysv-install
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250817201832.2462509-1-pkj@axis.com>
 <DC660IEPZE9T.1VEW6S4PFZICU@bootlin.com>
 <DB5PR02MB10213A1E35598F2EBC48B4F7AEF33A@DB5PR02MB10213.eurprd02.prod.outlook.com> <DC78V5ZY2JLN.264DJH3F8F7D8@bootlin.com> <DB5PR02MB10213921DE9C137BB2B97A6E1EF33A@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: <DB5PR02MB10213921DE9C137BB2B97A6E1EF33A@DB5PR02MB10213.eurprd02.prod.outlook.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 14:22:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222185

On Wed Aug 20, 2025 at 3:45 PM CEST, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
>>=20
>> The sources have been archived here:
>> https://git.yoctoproject.org/poky-ci-archive/log/?h=3Dautobuilder.yoctop=
roject.org/valkyrie/a-full-2227
>
> That was very useful. I did not know of the autobuilder.yoctoproject.org/=
valkyrie/*=20
> tags before. Is the above link present anywhere in the output from the jo=
b=20
> on the autobuilder?
>

There is some message, but only in the parent build (a-full or a-quick)
and on a specific step, so there is no real way you would find this
information in the log previously attached.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/2240/ste=
ps/4/logs/stdio

But pattern is always the same, so as long as you know the id of the
a-full build, you can find out the correct tag.

>>=20
>> I was able to reproduce the build with:
>> MACHINE =3D "genericx86-64"
>> DISTRO =3D "poky-altcfg"
>>=20
>> Then building any image, such as core-image-minimal.
>
> I figured out the problem: systemd-sysv-install needs to always be=20
> installed by the systemd-systemctl-native recipe, regardless of=20
> DISTRO_FEATURES. I have sent an updated version of the patches.

Thanks !

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


