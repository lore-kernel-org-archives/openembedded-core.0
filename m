Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A2D8C64EC4
	for <webhook@archiver.kernel.org>; Tue, 28 Feb 2023 22:17:43 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.7102.1677622661740833458
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Feb 2023 14:17:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=B3PXjq87;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 2C45760002;
	Tue, 28 Feb 2023 22:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1677622659;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sYs+kP7C0kBtHKWCnvaInz31bGb2YBkf2nZpc+hagfQ=;
	b=B3PXjq87TCxGu93IaJBuGyAHGJt1KZICK+GknfTBrbSo9AUgz2BuacNV5QxVp9ap5RIgqd
	4aIqwROn+PA+v5qVmFtLfT0jvoF6fzmxUtCZLhQ8dDZZwRtWkGHuX57tf2NSCO1j8+xWB7
	tx/QQRkOExO7qdTsjEQrP415X5QnMbl/i9AOZGhhYFin6ZImZtjKZOrmren4p78YF7MS7Y
	xAmxv3mz7mB+RFgNONe0iL3TQfGwTm3S5myaqvIjvwo+FaOwiwUbkdXAYdT9HXjHSImUBO
	E6t8DkaNuxHqsTSgDyLzVLgQd4GuDiQeG0iicez01srRdEeWdnJX/Y2MESmUMw==
Date: Tue, 28 Feb 2023 23:17:38 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] enchant2: upgrade 2.3.3 -> 2.3.4
Message-ID: <Y/59glKJ9prAGatj@mail.local>
References: <1677577759-20868-1-git-send-email-wangmy@fujitsu.com>
 <1677577759-20868-2-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1677577759-20868-2-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Feb 2023 22:17:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177858

Hello,

This failed on the autobuilders:

https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/2471/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/6734/steps/11/logs/errors

On 28/02/2023 17:49:16+0800, wangmy wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
> 
> Changelog:
> ===========
> - Document the personal wordlist format.
> - Improve the man pages in various ways, and make online versions, now linked
>   from the web site.
> - Fix some potential crashes (double-free and NULL dereferences).
> - Update the build system to use autoconf 2.71.
> 
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../enchant/{enchant2_2.3.3.bb => enchant2_2.3.4.bb}            | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-support/enchant/{enchant2_2.3.3.bb => enchant2_2.3.4.bb} (92%)
> 
> diff --git a/meta/recipes-support/enchant/enchant2_2.3.3.bb b/meta/recipes-support/enchant/enchant2_2.3.4.bb
> similarity index 92%
> rename from meta/recipes-support/enchant/enchant2_2.3.3.bb
> rename to meta/recipes-support/enchant/enchant2_2.3.4.bb
> index c892f570c4..fe28d323c2 100644
> --- a/meta/recipes-support/enchant/enchant2_2.3.3.bb
> +++ b/meta/recipes-support/enchant/enchant2_2.3.4.bb
> @@ -12,7 +12,7 @@ DEPENDS = "glib-2.0"
>  inherit autotools pkgconfig github-releases
>  
>  SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/enchant-${PV}.tar.gz"
> -SRC_URI[sha256sum] = "3da12103f11cf49c3cf2fd2ce3017575c5321a489e5b9bfa81dd91ec413f3891"
> +SRC_URI[sha256sum] = "1f7e26744db1c9a0fea61d2169f4e5c1ce435cf8c2731c37e3e4054119e994a0"
>  
>  GITHUB_BASE_URI = "https://github.com/AbiWord/enchant/releases"
>  
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#177827): https://lists.openembedded.org/g/openembedded-core/message/177827
> Mute This Topic: https://lists.openembedded.org/mt/97287062/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

