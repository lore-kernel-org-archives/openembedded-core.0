Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9265BECAAA1
	for <webhook@archiver.kernel.org>; Tue, 30 Aug 2022 20:16:56 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.17021.1661890615801881780
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Aug 2022 13:16:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=BeEM/fR6;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199,
 mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 26792FF804;
	Tue, 30 Aug 2022 20:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1661890613;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XdjPRsbkX9pHMwS6FrJoeWhqXdU5HyLKTYB7BZ3AngY=;
	b=BeEM/fR6uwcBrrndrqvSU/M1etjbK84OroHzfwv6zDZ9wy0Or7s2zOoxFyEBZYoSSy8Sdc
	HF0SPSFRhQps7xkwOtDW40vlVj5LFWpO+uc6ca6siWp7Lp8T6igAWwMYp4pLgy6Z1eXl6M
	Gil55nIqFiDe9CzbBRoYxD/spgw+eH9fhh60SkB7m3jhvBhE9I6RqbkTFvodpeofo68+jn
	lDo1SptsPzPpT6mQf6L/4yneZ5AxouAVgYpAYmyVN5ojK294/IpUOQdQ6Ob6FptZRBbjBd
	yznqDdS2iXFzXJnKEfIFBCmYTgLuGwuvanjhLPDuC6piEjzsLJYEs7vLWFBa0A==
Date: Tue, 30 Aug 2022 22:16:52 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] mesa: upgrade 22.1.6 -> 22.1.7
Message-ID: <Yw5wNHBWfXqF5d1g@mail.local>
References: <1661832712-12546-1-git-send-email-wangmy@fujitsu.com>
 <1661832712-12546-3-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1661832712-12546-3-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Aug 2022 20:16:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170089

On 30/08/2022 12:11:50+0800, wangmy wrote:
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  meta/recipes-graphics/mesa/mesa.inc                           | 2 +-
>  meta/recipes-graphics/mesa/{mesa_22.1.6.bb => mesa_22.1.7.bb} | 0

I believe you forgot meta/recipes-graphics/mesa/mesa-gl_22.1.6.bb

>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-graphics/mesa/{mesa_22.1.6.bb => mesa_22.1.7.bb} (100%)
> 
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> index c4efc13438..a2c5679bcc 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -25,7 +25,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
>             file://0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patch \
>             "
>  
> -SRC_URI[sha256sum] = "22ced061eb9adab8ea35368246c1995c09723f3f71653cd5050c5cec376e671a"
> +SRC_URI[sha256sum] = "da838eb2cf11d0e08d0e9944f6bd4d96987fdc59ea2856f8c70a31a82b355d89"
>  
>  UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
>  
> diff --git a/meta/recipes-graphics/mesa/mesa_22.1.6.bb b/meta/recipes-graphics/mesa/mesa_22.1.7.bb
> similarity index 100%
> rename from meta/recipes-graphics/mesa/mesa_22.1.6.bb
> rename to meta/recipes-graphics/mesa/mesa_22.1.7.bb
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#170054): https://lists.openembedded.org/g/openembedded-core/message/170054
> Mute This Topic: https://lists.openembedded.org/mt/93342793/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

