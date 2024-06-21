Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A4D7C2BA1A
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 06:24:47 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.66773.1718951080562562706
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jun 2024 23:24:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=lZeoMGsA;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 50494C0008;
	Fri, 21 Jun 2024 06:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718951078;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KFZo47F64EGgIumKmeNoxr9xX8FGGfP+AR148Q1v1Rs=;
	b=lZeoMGsA4UfQymBQBobGZjIGH1kR7zpYn5dbUIVFLy5w28SAv/lBn2agfZ4S+ADU5vI/8C
	BUwkjQ+dCWwN6vihZ9j05eWsERNbKkbVSh9vnvWqF+rPpN21/EQZi1869pcBvgXAZJcM/Q
	70tQEfkwfCODt9y6SxAJ7WCvrWEgfsT+1GyMcfwHiEwKPpsXGm5G65QIIMQyk+RYiiYCwR
	ITQGzoiGaeAOE9bYVdXE0Undxf1goj+BnlWqxKwMHHqgFfXJXtZov9P82jlj2riIjIETBg
	4ABF1oAwCKYuq6ipHBJdtbc9+fcGTwMZjfu89NvGm7vaDpVBI6ukX5EbGDhAag==
Date: Fri, 21 Jun 2024 08:24:38 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH v2 0/7] Add SPDX 3.0 support
Message-ID: <2024062106243817fca166@mail.local>
References: <20240610214456.2757397-1-JPEWhacker@gmail.com>
 <20240619221805.3038528-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240619221805.3038528-1-JPEWhacker@gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 06:24:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200995

Unfortunately, this still causes failures:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/7060/steps/23/logs/stdio

https://autobuilder.yoctoproject.org/typhoon/#/builders/23/builds/9481/steps/14/logs/stdio

https://autobuilder.yoctoproject.org/typhoon/#/builders/20/builds/9574/steps/11/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/89/builds/9149/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/6555/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/4969/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/9220/steps/11/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/166/builds/518/steps/11/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/165/builds/514/steps/11/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/48/builds/9186/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/37/builds/9166/steps/11/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/104/builds/8044/steps/11/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/103/builds/8038/steps/11/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/100/builds/6112/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/9159/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/9145/steps/11/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/6733/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/8994/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/6122/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/6122/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/58/builds/8923/steps/15/logs/stdio

https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/6837/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/6881/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/6906/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/6892/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/3501/steps/15/logs/stdio

https://autobuilder.yoctoproject.org/typhoon/#/builders/76/builds/9099/steps/23/logs/stdio


On 19/06/2024 16:13:22-0600, Joshua Watt wrote:
> This patch series add support for SPDX 3.0 and sets it as the default.
> Currently it is not possible to have SPDX 2.2 and SPDX 3.0 enabled at
> the same time; users may choose to specifically use SPDX 3.0 instead of
> 2.2 by doing INHERIT += "create-spdx-3.0"
> 
> v2: Added tests and addressed feedback
> 
> 
> Joshua Watt (7):
>   classes-recipe/image: Add image file manifest
>   classes/create-spdx-3.0: Add class
>   classes-recipe/image_types: Add SPDX_IMAGE_PURPOSE to images
>   selftest: spdx: Add SPDX 3.0 test cases
>   classes-recipe: nospdx: Add class
>   classes/spdx-common: Move SPDX_SUPPLIER
>   Switch default spdx version to 3.0
> 
>  meta/classes-recipe/image.bbclass            |   58 +
>  meta/classes-recipe/image_types.bbclass      |    2 +
>  meta/classes-recipe/image_types_wic.bbclass  |    1 +
>  meta/classes-recipe/nospdx.bbclass           |   13 +
>  meta/classes-recipe/packagegroup.bbclass     |    2 +
>  meta/classes/create-spdx-2.2.bbclass         |    8 +
>  meta/classes/create-spdx-3.0.bbclass         | 1116 ++++
>  meta/classes/create-spdx-image-3.0.bbclass   |  203 +
>  meta/classes/create-spdx.bbclass             |    2 +-
>  meta/classes/spdx-common.bbclass             |   32 +-
>  meta/lib/oe/sbom30.py                        | 1118 ++++
>  meta/lib/oe/spdx30.py                        | 5996 ++++++++++++++++++
>  meta/lib/oeqa/selftest/cases/spdx.py         |  119 +-
>  meta/recipes-core/meta/build-sysroots.bb     |    5 +-
>  meta/recipes-core/meta/meta-world-pkgdata.bb |    3 +-
>  15 files changed, 8654 insertions(+), 24 deletions(-)
>  create mode 100644 meta/classes-recipe/nospdx.bbclass
>  create mode 100644 meta/classes/create-spdx-3.0.bbclass
>  create mode 100644 m: failures:eta/classes/create-spdx-image-3.0.bbclass
>  create mode 100644 meta/lib/oe/sbom30.py
>  create mode 100644 meta/lib/oe/spdx30.py
> 
> -- 
> 2.43.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#200929): https://lists.openembedded.org/g/openembedded-core/message/200929
> Mute This Topic: https://lists.openembedded.org/mt/106770352/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

