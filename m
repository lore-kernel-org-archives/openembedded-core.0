Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ACA8C982D6
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 14:05:23 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40350.1789653919807132973
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 07:05:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=lmcBSElI;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 22E90C5CD78
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 14:06:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B0AF05FAA3;
	Thu, 17 Sep 2026 14:05:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2ED2411C7B034;
	Thu, 17 Sep 2026 16:05:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789653917; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=UCEuDZtvuFOVE9k3FsnuzVPfnjRI07067knWxVbMXCA=;
	b=lmcBSElIe9kjfiIb7RY7VNAHnxKw8b7KAkZHStW5BSUOKPalBn/S2B0MM1Sgpt4xeFfMtv
	rOJLMSwH58o30awYQ8U2E+XiotD+U/I/oYyO8HDu8SS8uhEQD9S9vHStvi7edjQN+qdYgI
	vY2moNBsKO+0VXeDgM9g2egf90tWaBQmSu561Ck1Uh1TZxypqHXNgJKQE/UfjIQXJrUIt8
	hQGiOQ4ITGmYgh9vXeIv1MkEXrzkBhOk+ZjolpBenB98KpQJTybvsm0EwwRvi/V9Z0vpvn
	wRrOrGmoJFcv7I+FamnNdAwawtgEgFniYhFx2QFtddzEwKXlsCvmEo5ggKV8Tg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 17 Sep 2026 16:05:12 +0200
Message-Id: <DLHND5FZBEYT.3LPLI9L0JOBP5@bootlin.com>
Subject: Re: [OE-core] [meta][PATCH 03/06] linux-yocto/7.2: update to v7.2.6
Cc: <openembedded-core@lists.openembedded.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <bruce.ashfield@gmail.com>, <richard.purdie@linuxfoundation.org>
References: <20260917051340.1472139-1-bruce.ashfield@gmail.com>
 <20260917051340.1472139-4-bruce.ashfield@gmail.com>
In-Reply-To: <20260917051340.1472139-4-bruce.ashfield@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 14:05:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246067

Hi,

Am I missing something or this series is missing a patch to meta-yocto-bsp =
to
update SRCREV_machine:genericarm64 to 7.2.6?

Antonin

