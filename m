Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 037FEC3600C
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 08:20:10 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.46971.1743409199858582556
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Mar 2025 01:20:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Hr31o0ip;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CB9B141C84;
	Mon, 31 Mar 2025 08:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743409198;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1l2oIuWDxncNx63KHHT0L6JLzlVVLZLpE3KpCx5zYoU=;
	b=Hr31o0ipXl+hoHBo89Q5smMk9paHYmyWcZPoG8dpJvYvctvG3r8XRjKXwlBCpIYlIa4Hw7
	5RCFGL9WIEAVXbMAFktp2FOuu0pQoIZqPq2UFDHHxWAI1iffbPAYzIIvivzWzwjQrRWIua
	a67YgJIoA2t5dObhag5rDqi41iGz3bWNIQ0JYZWz3xJFTcQX/2k0sZwJMrvzTJIVHUYKmI
	1If0Ry6KyWg/7MYlw+942i0VnaTx4k0rqcqzB0FnjVfnPsyexVFbVFuWokBn86wVNoAmgl
	s3dyGRczeTbndW2aJDaOmrn26xWLBsVAs5whz+VdTAE3lr/edjiyrNDVydUzTg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 31 Mar 2025 10:19:57 +0200
Message-Id: <D8UAZCO62KTS.2SUM8QYTTL1WF@bootlin.com>
Subject: Re: [OE-core] [PATCH] python3-exhale: new recipe (0.3.7)
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <jan.vermaete@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20250330130052.2664988-1-jan.vermaete@gmail.com>
In-Reply-To: <20250330130052.2664988-1-jan.vermaete@gmail.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujeelgeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffuhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevvddvhfehgeetgfehteejuedvieevfeehhfeikeehfedvjeelleetjeeigfetieenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepjhgrnhdrvhgvrhhmrggvthgvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepohhpv
 ghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 08:20:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213950

On Sun Mar 30, 2025 at 3:00 PM CEST, Jan Vermaete via lists.openembedded.or=
g wrote:
> Automatic C++ library API documentation generator using Doxygen, Sphinx, =
and Breathe.
> Exhale revives Doxygen's class, file, and page hierarchies in reStructure=
dText documents
> to make these hierarchies available in Sphinx documented projects.
>
> No pytests are distributed in the pypi package.
>
> Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
> ---

Hi Jan,

Thanks for your patch.

We get the following warning on the autobuilder as no maintainer is
defined, can you fix this please?

WARNING: python3-exhale-0.3.7-r0 do_recipe_qa: QA Issue: Recipe python3-exh=
ale in /srv/pokybuild/yocto-worker/a-full/build/meta/recipes-devtools/pytho=
n/python3-exhale_0.3.7.bb does not have an assigned maintainer. Please add =
an entry into meta/conf/distro/include/maintainers.inc. [missing-maintainer=
]

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1300/ste=
ps/13/logs/stdio


--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


