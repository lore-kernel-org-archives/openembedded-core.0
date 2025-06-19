Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 119BFC71159
	for <webhook@archiver.kernel.org>; Thu, 19 Jun 2025 04:45:52 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.7298.1750308344024733223
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jun 2025 21:45:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=WeeBy4Of;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CF5954443F;
	Thu, 19 Jun 2025 04:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750308342;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BIP9Wmk581Bf42vmsvhreKjTuxvcXlcN/ZOPXaM+vQU=;
	b=WeeBy4OfukEInMUVyAgpGcjODS+LONw4KH+xVtsBvQn0sdiYiLa05rvm8WOFXl01Ukk1B7
	L4ML+zEYsB/sf01fhUZjtK6NZwgrdo9PpAdr90QoC/Z95HjfE5RdEX3g8dw4Hrh2eYrDzY
	8Ps6Cy1GKvXnoNJGSElJs+djkGlKGzE2rardUFE8qpoc13SvRIOmIH++tgNuhU1zjkhFB4
	4pCFbAsfnkSpnFwQE20HVkc3WVJVPtSfOVMI5noKSlgXlrCV7HFpr88kGcmSqqSy7FbwKw
	VjUlWa6hSBEM3QRCkWlmF7MR/10LLk/5kfHCNMORCFbE4XDHqh9jF731t9naCQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Jun 2025 06:45:40 +0200
Message-Id: <DAQ8IV6QATNI.5KU5EZV9S8MH@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <dixitparmar19@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2] meta/meta-selftest: add selftest-hello-mod
 recipe
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250609134119.11666-1-dixitparmar19@gmail.com>
In-Reply-To: <20250609134119.11666-1-dixitparmar19@gmail.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdegheelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffhvffuofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeffedvjeelfeeikeefheeljeetheeuledutdehledttdegleeiffefvedvfeekvdenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemrgeiieemfedukedtmeguieeiugemtgdvsgemvggvugdvmeeivdejheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemrgeiieemfedukedtmeguieeiugemtgdvsgemvggvugdvmeeivdejhedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopeguihigihhtphgrrhhmrghrudelsehgmhgrihhlrdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdro
 hhpvghnvghmsggvugguvggurdhorhhg
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jun 2025 04:45:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219047

On Mon Jun 9, 2025 at 3:41 PM CEST, Dixit Parmar via lists.openembedded.org=
 wrote:
> Kernel module specific oe test cases requires a test kernel
> module package to work with. Added selftest-hello-mod
> derived from meta-skeleton/recipes-kernel/hello-mod.
>
> Signed-off-by: Dixit Parmar <dixitparmar19@gmail.com>
> ---

Thanks or your patch.

> +S =3D "${WORKDIR}/hello-mod"

This will trigger an error if some patches in master-next are merged,
you can rebase on master-next to see the error. The hello-mod recipe of
meta-skeleton was also updated accordingly.

https://lists.openembedded.org/g/openembedded-core/message/218806
https://lists.openembedded.org/g/openembedded-core/message/218804

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


