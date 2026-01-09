Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D94A3D26D72
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 16:17:00 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13716.1767975418409911625
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jan 2026 08:16:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=puFP33Gv;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 329754E42021;
	Fri,  9 Jan 2026 16:16:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DC608606C6;
	Fri,  9 Jan 2026 16:16:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 81179103C8962;
	Fri,  9 Jan 2026 17:16:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767975415; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=fwWTIfyxzy1jdZVuH21txzQ2EzUO5LmBFADV8NaxKgo=;
	b=puFP33GvTAEiva3rRskaQy1Aze/HyPVKki1py5s9WsFE81S/0bZmLdLAcBtpn9Vr8OyPBf
	RnsK3/H5f85xg4YRYxp8TRjNnfeaUOLhjBNOO03q1KS9tMcn1o3Yi1mxnMMlf+Vt3FdnMT
	xCMdL4eehrovaqaYkQ0UZLwGzMNclN1lP7b7GMjY5aCxGyoSwo/RV0p/VEwipL8NnXboDl
	0pZi778dWucXUyVZrRWGsbXIH6L0tjrobRR6hYqhRKJfooTCliBxKA2v+nEraCJqjmJzJj
	VOPPSQKjApGpDhX6qrhKn7oI1LhouJKABwYUAGgIT+xRsHAmxs9XluAW6avB7A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Jan 2026 17:16:53 +0100
Message-Id: <DFK6Z8JLFKXM.2TCBCVDL3QD0W@bootlin.com>
Subject: Re: [OE-core] [PATCH v2 1/6] alsa-utils: build more manpages with
 rst2man
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <ross.burton@arm.com>, <openembedded-core@lists.openembedded.org>
References: <20260109135852.3187805-1-ross.burton@arm.com>
In-Reply-To: <20260109135852.3187805-1-ross.burton@arm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jan 2026 16:17:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229134

Hi,

I think the series triggered warnings on the Autobuilder:

stdio: WARNING: Nothing RPROVIDES 'pulseaudio-module-x11-publish' (but /srv=
/pokybuild/yocto-worker/a-full/build/layers/openembedded-core/meta/recipes-=
multimedia/pulseaudio/pulseaudio_17.0.bb RDEPENDS on or otherwise requires =
it)
stdio: WARNING: Nothing RPROVIDES 'pulseaudio-module-device-manager' (but /=
srv/pokybuild/yocto-worker/a-full/build/layers/openembedded-core/meta/recip=
es-multimedia/pulseaudio/pulseaudio_17.0.bb RDEPENDS on or otherwise requir=
es it)
stdio: WARNING: Nothing RPROVIDES 'pulseaudio' (but /srv/pokybuild/yocto-wo=
rker/a-full/build/layers/openembedded-core/meta/recipes-multimedia/pulseaud=
io/pulseaudio_17.0.bb RDEPENDS on or otherwise requires it)
stdio: WARNING: Nothing RPROVIDES 'pulseaudio-module-native-protocol-unix' =
(but /srv/pokybuild/yocto-worker/a-full/build/layers/openembedded-core/meta=
/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb RDEPENDS on or otherwise =
requires it)
stdio: WARNING: Nothing RPROVIDES 'pulseaudio-module-x11-cork-request' (but=
 /srv/pokybuild/yocto-worker/a-full/build/layers/openembedded-core/meta/rec=
ipes-multimedia/pulseaudio/pulseaudio_17.0.bb RDEPENDS on or otherwise requ=
ires it)
stdio: WARNING: Nothing RPROVIDES 'alsa-plugins-pulseaudio-conf' (but /srv/=
pokybuild/yocto-worker/a-full/build/layers/openembedded-core/meta/recipes-m=
ultimedia/pulseaudio/pulseaudio_17.0.bb RDEPENDS on or otherwise requires i=
t)
stdio: WARNING: Nothing RPROVIDES 'pulseaudio-module-switch-on-port-availab=
le' (but /srv/pokybuild/yocto-worker/a-full/build/layers/openembedded-core/=
meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb RDEPENDS on or otherw=
ise requires it)
stdio: WARNING: Nothing RPROVIDES 'pulseaudio-module-alsa-sink' (but /srv/p=
okybuild/yocto-worker/a-full/build/layers/openembedded-core/meta/recipes-mu=
ltimedia/pulseaudio/pulseaudio_17.0.bb RDEPENDS on or otherwise requires it=
)
stdio: WARNING: Nothing RPROVIDES 'pulseaudio-module-position-event-sounds'=
 (but /srv/pokybuild/yocto-worker/a-full/build/layers/openembedded-core/met=
a/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb RDEPENDS on or otherwise=
 requires it)
...

https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/4891681/raw_inlin=
e
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3023

Can you have a look?

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


