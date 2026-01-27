Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACB67D3408C
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 15:42:50 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14437.1769528566875140862
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jan 2026 07:42:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=sBU921Z+;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E301D1A2A96;
	Tue, 27 Jan 2026 15:42:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id ADA60606F5;
	Tue, 27 Jan 2026 15:42:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 84A9A119A8647;
	Tue, 27 Jan 2026 16:42:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769528564; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=YiDDPdBdt0KKJ+RiqZcEFfBEYtBuTtgDdVlC9Cz7AqQ=;
	b=sBU921Z+jz2pjsAmDVuX1u26NGC+WZn5JQWd3i0Cwqm3+ywk/7gZIzQkyVaugxjEoJIidP
	gaBvuzWyZklLSU7uh+9SCw8YcRWxSz9B0bmEi+B3EHUvl4BhedwXqnRAsW9OizH7FsrEV1
	eICHEMWZHBIEsUPjQAKCwh42wUDttHHQpRybGSW+Su1SdWHeg0pcziGpthuImAYzE0qRc9
	WKqJzH73rAQmZV4DjqqQDQ0lTbhFh7XVsaXvugvLk67mTPg9t8UyBzER3Z8DA7EYqsM3wr
	VPldDP83JGLXAQRWWVlAGgPg9bwnRKoUDJ/Rh5+Dv0LybMeCescDMSLbuW3ngQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 27 Jan 2026 16:42:42 +0100
Message-Id: <DFZHIVF68NIV.KQ0S80RPIHUF@bootlin.com>
Subject: Re: [OE-core] [PATCH 12/17] python3-pycparser: upgrade 2.23 -> 3.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <wangmy@fujitsu.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260126123844.1052-1-wangmy@fujitsu.com>
In-Reply-To: <20260126123844.1052-1-wangmy@fujitsu.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jan 2026 15:42:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230054

On Mon Jan 26, 2026 at 1:38 PM CET, wangmy via lists.openembedded.org wrote=
:
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---

Hi Wang,

Thanks for your patch.

It looks like we have some warnings during the build:

WARNING: python3-pycparser-native-3.0-r0 do_check_backend: QA Issue: inheri=
ts setuptools3 but has pyproject.toml with setuptools.build_meta, use the c=
orrect class [pep517-backend]

https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/2989

Can you update the recipe?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


