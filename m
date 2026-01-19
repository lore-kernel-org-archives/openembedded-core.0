Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC71FCCF2CB
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 08:55:19 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31538.1768812914733113540
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jan 2026 00:55:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=0QTH96A7;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B6BD7C2033E
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 08:54:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BDEBB60731;
	Mon, 19 Jan 2026 08:55:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B14D210B69754;
	Mon, 19 Jan 2026 09:55:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768812912; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=TCyRPpI2NyZwFdpXbUHGeY6YiY4O9fjeZO7Qm+COgmw=;
	b=0QTH96A7po0ffSo2BDqbVQ6OMXLP/YU01qTpkFOeXnRTVjTXjcxTWVtRHZLCaxLZKHNJnx
	G6gOoWW+hlELeFCpczq/fF/YZ9zCrXi6IUgJaQ5XbH8s78PXswPgVUGpt5q0vOkSSnPWJT
	Uqod3pxq3gzXyTI8+SarSOTpZWnUTo+9l7QEQecdiqugYB+iDa1A6rg6HnjyrVhftRH6KM
	ZKv7DsobOQThCWIwaomjdm9lSXLdOpLNCGAcDVwsVe/WGL4u9iXcjmGALb8U5hlAuHNGi2
	kM60ISOJvcbNGOEGQeg6eQP/KsGoTODyQNfH1sFaavv82c3M4XB3jqn6seQrTw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Jan 2026 09:55:11 +0100
Message-Id: <DFSFUHL8KJ10.EUC79B0M6745@bootlin.com>
Subject: Re: [OE-core] [PATCH v5 1/6] wic: extra-partition: Small code
 cleanup
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <adam.duskett@amarulasolutions.com>,
 <openembedded-core@lists.openembedded.org>
References: <20260116093215.26108-1-adam.duskett@amarulasolutions.com>
In-Reply-To: <20260116093215.26108-1-adam.duskett@amarulasolutions.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 08:55:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229597

Hi,

Sorry, this conflicts with another series from Louis right now which has pa=
ssed
testing:
https://lore.kernel.org/r/20260112-extrafiles-v2-0-67f0f6c37c4e@non.se.com

I cannot apply your patches on top for now. As it's still undecided whether
these will make it to master, you can wait a while before rebasing your
series, or rebase now if you want me to run your patches in our test infra.

Regards,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


