Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3905AC7115B
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 07:55:58 +0000 (UTC)
Received: from relay16.mail.gandi.net (relay16.mail.gandi.net [217.70.178.236])
 by mx.groups.io with SMTP id smtpd.web10.14449.1750665338277810826
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Jun 2025 00:55:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=AeFoefVg;
 spf=pass (domain: bootlin.com, ip: 217.70.178.236, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3FCE344A3F;
	Mon, 23 Jun 2025 07:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750665336;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AxJ7Yg4qf+aAbIo/uEfg8eS2gojUo8qvhkYOid+9sBg=;
	b=AeFoefVgVPEJtjgKbd0CDZBbMEYzEGnH9CxghmITyvvri5AGAIfVusHUqrFOGOfNEyZ9Ts
	wpxsXeRZtXssXv0NjuIGrHZDKmbB1a8g2vRD2cRGwIZ2yMPpJGu6qVG03sSswh83KtGp/l
	9iWe1cVqbp7QrQsnyLgVGBzpWi20ZQpQ9e66Dgp2L0NgFDswUs6xkrbh/myg8ZlUuzqXk1
	4WHYQHCR3Jg2inDuxQexi/JidRxYuSECMmqWqR60Jps3hwroMDfzlng7DlMhksLGAYLXUy
	LvO5WN2bYi4sFIvj5EvztmlXZ43xfbzoc4gP89FyNke3MtUSvi+w3N8+IENhYA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Jun 2025 09:55:35 +0200
Message-Id: <DATR2GJI4K9U.17X02XHLY2PHP@bootlin.com>
Subject: Re: [OE-core] [PATCH v4] kernel-module-split: fix conf file
 generation when KERNEL_SPLIT_MODULES=0
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <dixitparmar19@gmail.com>, <openembedded-core@lists.openembedded.org>
References: <20250609134535.11816-1-dixitparmar19@gmail.com>
 <4472.1750490310087296886@lists.openembedded.org>
In-Reply-To: <4472.1750490310087296886@lists.openembedded.org>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdduieegjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpegggfgtfffkuffhvfhfjgesthhqredttddtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehgfeljeeggfdtueduvefghefgiefhgfefjeetkeeitedtffeggeevudefteevteenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepughigihithhprghrmhgrrhduleesghhmrghilhdrtghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Jun 2025 07:55:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219200

On Sat Jun 21, 2025 at 9:18 AM CEST, Dixit Parmar via lists.openembedded.or=
g wrote:
> Can someone review this please?
> -Dixit

Hello,

This was applied on master: cf998576ccfd ("kernel-module-split: fix conf fi=
le
generation when KERNEL_SPLIT_MODULES=3D0").

Regards,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


