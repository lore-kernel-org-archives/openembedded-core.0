Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B9D7EB64DC
	for <webhook@archiver.kernel.org>; Fri, 21 Jul 2023 09:30:59 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.3597.1689931857852900788
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jul 2023 02:30:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=B/apKBIh;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 018F8C000C;
	Fri, 21 Jul 2023 09:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689931855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=36FrOwmTpbNrgFg90BZth+31a6UFE/yXmB5BvpMRZfE=;
	b=B/apKBIhtqbppSoS3dnriPkJ+BH51bD3dG0TZkFXCry3V0a00awoJXo8mF+LczdyBzIP1m
	c445zDDOEp2PQ9QLxcVE0aG+4obJPsbxrSkFj72NP5Ve0yUUVigzelbv/xRuB+Aq9EaNCW
	h4xoci9sCzmctVI7Jtj2Ur/52Ss3iYHS6NsqQvBwwHhiOmEzKTnPgsEpeW2P6xg2bTiRUY
	NTDE8bvV7pIYKxSKwXZYehFYsNTqEOp+N2iQmfwYkaByPdakIlf17F4AQQwoHqDyPqkGGB
	+rtmYrg9846VeXKwPxgWQlCpkX63MFTjKyMEM5igFzecMxMBYSy3Zk5W+33yoA==
Date: Fri, 21 Jul 2023 11:30:54 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Piotr =?utf-8?Q?=C5=81obacz?= <p.lobacz@welotec.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-Core][PATCH v6 1/6] bitbake.conf: add acl and xattr distro
 native features support
Message-ID: <202307210930548e9d76ad@mail.local>
References: <20230719194843.330741-1-p.lobacz@welotec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230719194843.330741-1-p.lobacz@welotec.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jul 2023 09:30:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184679

Hello,

I want to give this a shot again, can you rebase on top of my
master-next branch ?

On 19/07/2023 21:48:38+0200, Piotr Łobacz wrote:
> Include support for ACLs and extended file attributes for native
> builds, by default.
> 
> Signed-off-by: Piotr Łobacz <p.lobacz@welotec.com>
> ---
>  meta/conf/bitbake.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 9625a6fef4..8daaaad615 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -904,7 +904,7 @@ IMAGE_FEATURES += "${EXTRA_IMAGE_FEATURES}"
>  
>  # Native distro features (will always be used for -native, even if they
>  # are not enabled for target)
> -DISTRO_FEATURES_NATIVE ?= "x11 ipv6 xattr"
> +DISTRO_FEATURES_NATIVE ?= "acl x11 ipv6 xattr"
>  DISTRO_FEATURES_NATIVESDK ?= "x11"
>  
>  # Normally target distro features will not be applied to native builds:
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184594): https://lists.openembedded.org/g/openembedded-core/message/184594
> Mute This Topic: https://lists.openembedded.org/mt/100242732/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

