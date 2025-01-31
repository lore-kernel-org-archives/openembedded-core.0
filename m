Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9861CC0218F
	for <webhook@archiver.kernel.org>; Fri, 31 Jan 2025 14:16:51 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.19679.1738333001966802582
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jan 2025 06:16:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=IEeGeXo8;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C0801440F7;
	Fri, 31 Jan 2025 14:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738333000;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qUWqESyUgSRwgh0wrRL8To7GaTBZevYDJ2JdcBnCMb8=;
	b=IEeGeXo8hcRtDFLlV1kZ3wpVuqT0dVu5bved+g+ZijzG4u9zOHGf46J/mumT55PwH+Un9R
	zgILkAGq3U22klR9MayDurGsLvjSvl6B9/vnf2VlNhmgzIIEOwKjr18S8LyxAkku9fMyTz
	dmXZwsG/4Ij9Cf6/Y+Q1Snzwit3Y4wTp0+RLwjPCK2NBekXP0j2sXxi+CLcBm1sLfZZweD
	5wkfbhZTWTSpgWkoYw9DYW2ycFgZkAQwlIM36jgIK13o6wp2ETukXlipa05w1t6H1HfCt1
	x9t0I67zOVdTW8DTqApI7BpYTOsJXzIFvzy4pkRe9qfJZNobS2E6dn8U5msGUA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 31 Jan 2025 15:16:39 +0100
Message-Id: <D7GBMBCF2JEQ.3TH1BIIDJTQ09@bootlin.com>
Subject: Re: [OE-core] [PATCH 1/2] systemd-serialgetty: add comments
 explaining use
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <ross.burton@arm.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20250130175901.938043-1-ross.burton@arm.com>
In-Reply-To: <20250130175901.938043-1-ross.burton@arm.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekleelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffuhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevvddvhfehgeetgfehteejuedvieevfeehhfeikeehfedvjeelleetjeeigfetieenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtoheprhhoshhsrdgsuhhrthhonhesrghrmhdrtghomhdprhgtphhtthhopehophgvnhgvmhgsv
 gguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jan 2025 14:16:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210487

On Thu Jan 30, 2025 at 6:59 PM CET, Ross Burton via lists.openembedded.org =
wrote:
> Add some comments to clarify exactly what this recipe is for.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---

Hi Ross,

Sorry, I believe this is breaking the autobuilder builds using QEMU:
maybe something with the detection of finished boot ?

Final symptom is:

RuntimeError: core-image-minimal - FAILED to start qemu - check the task lo=
g and the boot log

Some example logs:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/833/step=
s/14/logs/stdio
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/882/step=
s/14/logs/stdio
https://autobuilder.yoctoproject.org/valkyrie/#/builders/26/builds/904/step=
s/23/logs/stdio

Can you have a look at this please ?

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


