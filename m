Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E993C7EE30
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 08:07:11 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.5233.1751357228122227182
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 01:07:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=G3s9lyPi;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C6ECB43292;
	Tue,  1 Jul 2025 08:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751357226;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D03UoP1I9J4ziA2QjG3pyZC93yW363hyT7ZMmay94mY=;
	b=G3s9lyPi00Y00MATIkXxEau+dYEnAsjftvIFxPgVeytixuh2V5F7xQcHYLpj1L5u9zeWSo
	TkX0i4lDN117wYxtM+weYN7tvZ0S3psM06likQ2AkoQK2BsSIwMsHetrEynDT87tQu7Kg1
	Ha2UnWlkQPOSd+23ozS1VDCCW0Qx3lhr3hZOLRjTEss8Neh4/VwfRF5aijqCvl6XRnViGN
	MX/+XTROo39mIw4vjS7y4KiNbSSz1oXJGBN9LyMnqLzYIfY1cWcT4+gchOVwX2ZKCyreGq
	bQTHLZCdH1Vekh0a+Pawq7KI9e3F4KPNPnMLUdSOJ64iNA2sloltgljhmFKDkw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 01 Jul 2025 10:07:04 +0200
Message-Id: <DB0KBLR1ZFU8.ROPW1SV1CYF9@bootlin.com>
Subject: Re: [OE-core] [PATCH v2 0/3] cmake: Major version bump to 4.0.3
Cc: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>,
 "quentin.schulz@cherry.de" <quentin.schulz@cherry.de>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Haase Moritz, JD-62" <Moritz.Haase@bmw.de>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20250630104104.4093207-1-Moritz.Haase@bmw.de>
 <DAZYFBTDZ6SU.9Z5XXGYAZXRN@bootlin.com>
 <DB3PR09MB6202B03623EBCB0CFDB4DBE0EA41A@DB3PR09MB6202.eurprd09.prod.outlook.com>
In-Reply-To: <DB3PR09MB6202B03623EBCB0CFDB4DBE0EA41A@DB3PR09MB6202.eurprd09.prod.outlook.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugedtiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuvefhvfhfjgesthhqredttddtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgfekieeufeeiveekkeevjeetveelkeejiefgfeeihfeghfeghfduvdejuddvvdenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepofhorhhithiirdfjrggrshgvsegsmhifrdguvgdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhop
 hgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtthhopegrlhgvgidrkhgrnhgrvhhinhesghhmrghilhdrtghomhdprhgtphhtthhopehquhgvnhhtihhnrdhstghhuhhliiestghhvghrrhihrdguvg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 08:07:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219557

On Tue Jul 1, 2025 at 9:10 AM CEST, JD-62 Haase Moritz wrote:
> Hi Antonin,
>
>> Some builds are failing on the Autobuilder after applying this patchset.
>> [...]
>> An overview of the errors can be found here:
>> [...]
>
> thanks! I've been able to reproduce most of those locally (via a 'bitbake
> world') and they are easily fixable / there are backportable patches by
> upstream. I'll add those to the series and post an updated version.
>
> The musl-locales failure I couldn't reproduce yet (I guess since my local=
 build
> isn't set up to use musl). Is there an easy way to replicate an autobuild=
er
> build config locally? I couldn't tell from the docs I found at [0].

There's some container configuration here:
https://git.yoctoproject.org/yocto-autobuilder2/tree/docker

But it isn't trivial to setup, and the amount of build and resources it use=
s is
non-negligible. I'd say the easiest would be to try to reproduce the build
locally, for that use can read to get more insights on what's going on for =
a
specific build:
https://git.yoctoproject.org/yocto-autobuilder-helper/tree/config.json

Thanks!
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


