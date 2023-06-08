Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 708C8C7EE23
	for <webhook@archiver.kernel.org>; Thu,  8 Jun 2023 09:19:18 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.4791.1686215948377675790
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jun 2023 02:19:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=e9gQnGrl;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: alexandre.belloni@bootlin.com)
X-GND-Sasl: alexandre.belloni@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686215945;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=G1w0UGROfSi9KJfC9WRvYxobu/Hhn4jXPLOd0XDhS1s=;
	b=e9gQnGrlTP1IHqzf9l/ED/n5zwp92DxwpHGP/szBT0xI7GxOmpQ6oIc+Omb1YTjZhMTguG
	cxFGKb1XFFow2/cyRYA3WGTjeWJXFz0nag5AI5w68gVd+DVkHYweUEbKzkWwfclmSgWEXH
	ToO5xBQSS1I7nMMKULwJbUzXrMRuiAXDbpDQ7PBCzeX7XScHiNfxr1wNv7c1Ya6qPW82bH
	RHAJClWsICyWCeUex1+Y+f7LTMYqxx7xQiwHSVMQUD4D0rt6EoyXhEHZIWROYGbDuAIOsX
	TKRbZWvKdUeueKk0sBMFiD5hBMhzMOXOYbDEEeUmoj+oxgtZyrZBFmAbExg9Ug==
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5761640004;
	Thu,  8 Jun 2023 09:19:05 +0000 (UTC)
Date: Thu, 8 Jun 2023 11:19:05 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org, nd@arm.com
Subject: Re: [OE-core] [PATCH] nettle: inherit lib_package
Message-ID: <20230608091905237b3e22@mail.local>
References: <20230606123732.3924953-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230606123732.3924953-1-ross.burton@arm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jun 2023 09:19:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182498

Hello Ross,

It seemed to have caused new ptest failures:

{'nettle': ['nettle-pbkdf2-test', 'sexp-conv-test']}

On 06/06/2023 13:37:32+0100, Ross Burton wrote:
> From: Ross Burton <ross.burton@arm.com>
> 
> Nettle is primarily a library that ships some tools, so inherit the
> lib_package class to package the tools in nettle-bin.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-support/nettle/nettle_3.8.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-support/nettle/nettle_3.8.1.bb b/meta/recipes-support/nettle/nettle_3.8.1.bb
> index bf491322354..5e60948c8f6 100644
> --- a/meta/recipes-support/nettle/nettle_3.8.1.bb
> +++ b/meta/recipes-support/nettle/nettle_3.8.1.bb
> @@ -28,7 +28,7 @@ SRC_URI[sha256sum] = "364f3e2b77cd7dcde83fd7c45219c834e54b0c75e428b6f894a23d12dd
>  
>  UPSTREAM_CHECK_REGEX = "nettle-(?P<pver>\d+(\.\d+)+)\.tar"
>  
> -inherit autotools ptest multilib_header
> +inherit autotools ptest multilib_header lib_package
>  
>  EXTRA_AUTORECONF += "--exclude=aclocal"
>  
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#182435): https://lists.openembedded.org/g/openembedded-core/message/182435
> Mute This Topic: https://lists.openembedded.org/mt/99362169/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

