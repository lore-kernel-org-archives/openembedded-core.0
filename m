Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CF5BC3ABD8
	for <webhook@archiver.kernel.org>; Fri, 16 May 2025 13:35:05 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.13425.1747402503442184722
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 May 2025 06:35:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=kRrdA3tZ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4F4C743B68;
	Fri, 16 May 2025 13:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747402501;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Yk8daaaQOuCOr549ngIU+GOZkps74qGLlBPJeR7XtI8=;
	b=kRrdA3tZO3WQKv3fTaRDwAzbpDNaRbCO8uWC9/87qKbgyuZj4Jc4bB32iW1Nzt3N7hcU1N
	Lqbj6mRNQMXwokZXdPigK6KslYw2GTJT9Hf5KWNCwK1rZv0Yp1QpzKZhX7SaEicZdLEEjv
	u9B7cSmc8vRGJT0eAxoDZsOPSa3MtWouZNUneuRCbwvR5yqeuuerc26YB+hCDY0Ox2Bmxw
	CEr3FXIr/YNGTOeyQf/Y7CQP2igY86ciPQd3L92TJyG8Qh0l0dtqJJKrOLZw+jLUXOvbfG
	B595BHYUpFLHh53pKdKTzRsKxUQz4u0xk6Dtu1vknuOvjDAJRVocECnWXqR9dg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 May 2025 15:35:01 +0200
Message-Id: <D9XMHMXOU4SN.EDYVQGG8UO7G@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <Oliver.Rohe@wago.com>, "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] kernel-fitImage: allow overwrite the
 configuration dtb label
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <DB4PR08MB8102C882795C5B8725105A0F9E93A@DB4PR08MB8102.eurprd08.prod.outlook.com>
In-Reply-To: <DB4PR08MB8102C882795C5B8725105A0F9E93A@DB4PR08MB8102.eurprd08.prod.outlook.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefuddvkeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffhvffuofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeffedvjeelfeeikeefheeljeetheeuledutdehledttdegleeiffefvedvfeekvdenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopefqlhhivhgvrhdrtfhohhgvseifrghgohdrtghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhst
 hhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 May 2025 13:35:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216752

On Fri May 16, 2025 at 2:32 PM CEST, Oliver ROHE via lists.openembedded.org=
 wrote:
> This allows to provide a custom label for each dtb
> without having to overwrite the whole function.
>
> Signed-off-by: Oliver Rohe <oliver.rohe@wago.com>
> ---

Hi Oliver,

Thanks for your patch.

Just a first note about it: it looks like tabs in the patch were
replaced by spaces, so this is a bit painful to apply on our side. It
might come from your mailer setup. Are you using git send-email command?

I've corrected the spacing on my side for this patch, but may you have a
look at your configuration for the next time?

Thanks
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


