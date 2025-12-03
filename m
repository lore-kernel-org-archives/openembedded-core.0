Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CEFFD15D87
	for <webhook@archiver.kernel.org>; Wed,  3 Dec 2025 15:24:37 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17891.1764775473521399836
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Dec 2025 07:24:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Ey3UiBbZ;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 73DEB1A1F00
	for <openembedded-core@lists.openembedded.org>; Wed,  3 Dec 2025 15:24:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 48A1A60706;
	Wed,  3 Dec 2025 15:24:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E3C79119206EB;
	Wed,  3 Dec 2025 16:24:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764775470; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0EmmL6mJk/hVa/gVNZ8qaKtKaOSP4Hh4LQoYIu4ayq0=;
	b=Ey3UiBbZX3AHW2BCEV0XgS48GD+yOBGOxepOoALoPYFCiOQAObL+CwsJ0uxkmdtULW8XB4
	P8jvyQUecqk8uz29jBexVKb74RycCBEdbgkids/LdmZ/ubnO+CeWs+xiS3hX/ASCZiLDwp
	74adrCXv6OxslTx9uzbhHpC+gusUaTsgJGXBHiRyE8Hg/etpIBOi+KLUDOcYGgb7O5TYqo
	OGsKHD9Aqsf8Bc7PmsSgjd6ANgRxRFNGyh+/QZcY9qfItGMg2AmDIyUOkkEnT8rjPvfx1z
	NCmkmu1ITVUiM6BBluBLzhEAB8rsHUZYScv+XJ1Lle2B1Gcrk9nxCalfB8HiDQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 03 Dec 2025 16:24:29 +0100
Message-Id: <DEOOOYG9B8GR.21NMUE2VCUZ6A@bootlin.com>
Subject: Re: [OE-core] [PATCH v3 1/2]
 python3-sphinxcontrib-svg2pdfconverter: add new recipe
Cc: "Antonin Godard" <antonin.godard@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>, "Quentin Schulz"
 <foss@0leil.net>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251203-svg2pdf-v3-0-879d05cb101b@cherry.de>
 <20251203-svg2pdf-v3-1-879d05cb101b@cherry.de>
 <DEOKQA0V2JMN.2N90MYX04GK3E@bootlin.com>
 <51ec8963-34b6-466d-9d16-10cb191036c9@cherry.de>
In-Reply-To: <51ec8963-34b6-466d-9d16-10cb191036c9@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Dec 2025 15:24:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227232

On Wed Dec 3, 2025 at 1:41 PM CET, Quentin Schulz wrote:
> Hi Mathieu,
>
>
> It says "Finished two hours ago" at the top of the provided link but I=20
> sent v3 more recently than that.
>
> How do I know which patch(es) were applied from the logs? I went into=20
> "Build properties" and it points at mathieu/master-next branch for=20
> oe-core from openembedded-core-contrib repo at commit=20
> 687147e96e53a1ddb3842a3d190a683161e82167 but this isn't the proper HEAD=
=20
> anymore, so I had to start from commit=20
> 687147e96e53a1ddb3842a3d190a683161e82167 from cgit and then go to its=20
> parent recursively until I reached=20
> https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dmathie=
u/master-next&id=3D141b8fdfdc311053d69eab6adbec5c3b09e3acee=20
> which is v2. Is there any chance we can have an easier way to figure=20
> this out?
>
> I also ran the test locally with
>
> oe-selftest -r distrodata.Distrodata.test_maintainers
>
> and it passed.
>
> Cheers,
> Quentin

My bad, this was indeed an earlier revision:
https://git.yoctoproject.org/poky-ci-archive/commit/?h=3Doecore/autobuilder=
.yoctoproject.org/valkyrie/a-full-2814&id=3D141b8fdfdc311053d69eab6adbec5c3=
b09e3acee

Sorry for the noise.

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


