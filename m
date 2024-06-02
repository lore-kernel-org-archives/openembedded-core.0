Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14B65C25B74
	for <webhook@archiver.kernel.org>; Sun,  2 Jun 2024 09:51:29 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.55846.1717321882814209426
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Jun 2024 02:51:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=aUhgMPvF;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9C42F1C0004;
	Sun,  2 Jun 2024 09:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1717321881;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yNwRi5V2LGu36csvgymCMrHjbZC7HsLatnRM1uV25ac=;
	b=aUhgMPvFwC7Kn511GQZPVGW3MlSaJae5Y/hrwSgNsgxbWQ4G6FU8/Yc8gmHFiqT1JoaT/F
	PBoDdRqLbq3+aLCt9u27dR+vekCxpacHCtCIvSsq2nK1n0kQdyipT37PPTiQjGKeJvWKlR
	9wQfo1+wJgl51iwzKmHDPRuf++GaM/OqKX7lsXirJCiRzL7/rfxqEtN0sY+7TtWLKKXSGF
	pEaAV2MbE6iKucw04oZVo4dT2jfPKS3wOolgrv9ij6CFkY6tzmrIGNCzTkJox7SDu1XzO5
	6QHFJnljMAu8sjOxnI8y05c5yrM1pjj8y02XMXTdNAgavS+Ib/lX4PKphf8K1A==
Date: Sun, 2 Jun 2024 11:51:20 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Changqing Li <changqing.li@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 4/4] man-pages: upgrade 6.06 -> 6.8
Message-ID: <2024060209512044239c59@mail.local>
References: <20240527013705.2781009-1-changqing.li@windriver.com>
 <20240527013705.2781009-4-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240527013705.2781009-4-changqing.li@windriver.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Jun 2024 09:51:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200202

On 27/05/2024 09:37:05+0800, Changqing Li wrote:
> diff --git a/meta/recipes-extended/man-pages/man-pages_6.06.bb b/meta/recipes-extended/man-pages/man-pages_6.8.bb
> similarity index 84%
> rename from meta/recipes-extended/man-pages/man-pages_6.06.bb
> rename to meta/recipes-extended/man-pages/man-pages_6.8.bb
> index 0f091bbd7d..fd19fa3b97 100644
> --- a/meta/recipes-extended/man-pages/man-pages_6.06.bb
> +++ b/meta/recipes-extended/man-pages/man-pages_6.8.bb
> @@ -17,18 +17,12 @@ LIC_FILES_CHKSUM = "file://README;md5=72cff06b7954222c24d38bc2c41b234e \
>                      file://LICENSES/Linux-man-pages-copyleft-var.txt;md5=d33708712c5918521f47f23b0c4e0d20 \
>                      file://LICENSES/MIT.txt;md5=7dda4e90ded66ab88b86f76169f28663 \
>                      "
> -SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/${BP}.tar.gz \
> -           file://0001-man.ml-do-not-use-dev-stdin.patch \
> -           file://0001-GNUmakefile-use-env-from-PATH.patch \
> -           "
> +SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/${BP}.tar.gz"
>  
> -SRC_URI[sha256sum] = "006906e7be81a71c2d347809597bcb91485fa7fa488acdaa79e681ddfa894568"
> +SRC_URI[sha256sum] = "f4d5b9756b4ee52e34ca9d895095c92312ced6292395b811e11069ab007e6f06"
>  
>  inherit manpages
>  
> -# can be dropped when ubuntu 18.04 is not in use anymore
> -DEPENDS += "coreutils-native"
> -

But we still have an ARM ubuntu 18.04 worker, will it still work?


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

