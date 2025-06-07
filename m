Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F029AC5B543
	for <webhook@archiver.kernel.org>; Sat,  7 Jun 2025 08:35:19 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.14205.1749285314866684919
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Jun 2025 01:35:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=IctQQ3+T;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C7AB54311F;
	Sat,  7 Jun 2025 08:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749285313;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d9VgD1WrRvMMo5mQNeT2YhAiOze6gj3WMhFpgNAyrVE=;
	b=IctQQ3+TWMkzJbXQPGPbeAe2TY5UYxdUHXUSyccimU4aozDiJkfTkEcw3rgEwjAjFx3fgF
	BXCJNnuz9eRtIp0oqDK6XDUdIRgds/dPtNQdkidj326yopIfxayyxAeaypcPrasOqc62gC
	6DUxbXFIxS2Qx8heMD0NfufsxwoyrO/5WaqPvqLrXEywrB98UfMPY3Cl9y+qaQmJyM8rAz
	0FSx9nhTFPhdbRQXnMAmpGsWC2/QfEvBnsQKsKlw/mhQ2Ap0mGHEGf1ka5E8/zJe/1V9Kn
	13VZrqvOS5aoSs5744D9OAw9buqf49q7pXSpAAfy7M+GLOvldJIAMzD71+DrmA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 07 Jun 2025 10:35:10 +0200
Message-Id: <DAG5W1R0QSFK.2XDS67U8XLJ61@bootlin.com>
Subject: Re: [OE-core] [PATCH] libtheora: upgrade 1.1.1 -> 1.2.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <skandigraun@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250606114337.611299-1-skandigraun@gmail.com>
In-Reply-To: <20250606114337.611299-1-skandigraun@gmail.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdeivdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffuhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevvddvhfehgeetgfehteejuedvieevfeehhfeikeehfedvjeelleetjeeigfetieenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtdegmegtvggttdemudelvdgumedvudgukeemvggvsggrmehfgegtvgemleelsgdvmedvudgrkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtgeemtggvtgdtmeduledvugemvdduugekmegvvggsrgemfhegtggvmeellegsvdemvddurgekpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepshhkrghnughighhrrghunhesghhmrghilhdrtghomhdprhgtphhtthhopehophgvn
 hgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Jun 2025 08:35:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218191

On Fri Jun 6, 2025 at 1:43 PM CEST, Gyorgy Sarvari via lists.openembedded.o=
rg wrote:
> Major changes:
>   - New 'ptalarbvorm' encoder
>   - New th_encode_ctl option for copying configuration from an existing
>     setup header, useful for splicing streams.
>   - Added support for RISC OS.
>   - Improved ARM support.
>   - Various speed, bug fixes and code quality improvements.
>
> See CHANGES file for full changelog.
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---

Hi Gyorgy,

Thanks for your patch.

It looks like this upgrade is failing on the autobuilder:

ERROR: libtheora-1.2.0-r0 do_compile: Execution of '/srv/pokybuild/yocto-wo=
rker/qemuarm-oecore/build/build/tmp/work/cortexa15t2hf-neon-oe-linux-gnueab=
i/libtheora/1.2.0/temp/run.do_compile.2385' failed with exit code 1
...
| cc1: fatal error: armloop-gnu.S: No such file or directory

https://autobuilder.yoctoproject.org/valkyrie/#/builders/40/builds/1783

Can you fix this issue please?

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


