Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BEBECD5BCF
	for <webhook@archiver.kernel.org>; Tue, 26 May 2026 07:08:17 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31878.1779779288683372676
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2026 00:08:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=LV5fKhhQ;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 838254E42D4A
	for <openembedded-core@lists.openembedded.org>; Tue, 26 May 2026 07:08:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 51BCD60733;
	Tue, 26 May 2026 07:08:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D4B891088837F;
	Tue, 26 May 2026 09:08:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779779285; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dfVimzz1dSciNWD61yohE8QgYaPyDUF5LFyRH/MlCdk=;
	b=LV5fKhhQ5Riu0prAIYQ0W/hwxJEhGcEldbntGZ2R3/dSn1Re6AWmGeLTE1MiUJKzw3ZyDz
	0mR6aomqcUGBtqFTxosk7R2cexKdCxvD3CfMQCGZACtBRCf4NBnCYnZBXsJ0+EDZF4Rgj4
	yONRxmRloLvduUkJYfl8FmzdsB3LAAbPNQrEV4D9YgFsPgFCD7sKuaXjdovVwt45WuriR+
	6HzAzF3F3kFhMJ2tfqLdH0Xcmp9qdMoYhZV1/80YMwRcxF7mLpIG4mfb4xsEsSncHn1/1v
	LF5djMpuKvGenC3kpJhCGDd+O8a+z2/wGOyTD+yZ0KgsKGRxjT0dmnu9BIPm0g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 26 May 2026 09:08:03 +0200
Message-Id: <DISF3NO6O6O3.2L721ZD94ZUN9@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <richard.purdie@linuxfoundation.org>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] xserver-xorg/xwayland: 'Clarify' xserver
 license
References: <20260521154434.2273692-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20260521154434.2273692-1-richard.purdie@linuxfoundation.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 May 2026 07:08:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237587

Hi Richard,

The autobuilder wasn't happy with this change I think:

ERROR: xserver-xorg-2_21.1.22-r0 do_populate_lic: QA Issue: xserver-xorg-2_=
21.1.22-r0: Failed to parse LICENSE: MIT && Adobe-Display-PostScript && BSD=
-3-Clause && DEC-3-Clause && HPND && HPND-Netrek && HPND-sell-MIT-disclaime=
r-xserver && HPND-sell-variant && HPND-UC && ICU && ISC && MIT-open-group &=
& NTP && SGI-B-2.0 && SMLNJ && X11 && X11-no-permit-persons && X11-swapped =
[license-syntax]
ERROR: xserver-xorg-2_21.1.22-r0 do_populate_lic: Fatal QA errors were foun=
d, failing task.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/2/builds/3808

I think it's "&", not "&&"?

This was seen across multiple jobs on a-full:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3862

Antonin

