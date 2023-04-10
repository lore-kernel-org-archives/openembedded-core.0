Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34908C77B61
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 17:25:21 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.50567.1681147511145445602
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Apr 2023 10:25:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=OMngTOo/;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 9B1251C0002;
	Mon, 10 Apr 2023 17:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1681147509;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WOqt2nNDaknbgUB2DwhOxH6HTn4Eiv90dtvj+oGqIME=;
	b=OMngTOo/COX9YOt1LXNhAkYsjvZLTcKq5NSMIz5Yh/WC8rQlMAT1eIM8o6AE57NL8rn4Ui
	DJFvXUZACmQJ40lWDxx6Lg5gTg88eBlXHd7DT7xipAWz5OkJ+Foc7/YebyBHA0cJ8+exEc
	cUwT7oz6jROQMuxgMCJcolKOJx+eGlsN6VQXPvBvpXcWrux5hLsyfLxq0NgRv1sZ4tcp6Z
	JVGnjXtvCCdZkcNAVP1JqX5g72ZqCzri+T5YkgnholrxhRENN7aWP09YNRw4RKneRUPnOv
	uYyJpEtxoGmNLRBm0tRF4CigZkBOAWpAN0ZxbJDEpK9vi7bGUoNpi6egBPQbGQ==
Date: Mon, 10 Apr 2023 19:25:07 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] python3-cryptography-vectors: upgrade 39.0.2
 -> 40.0.1
Message-ID: <20230410172507260304fa@mail.local>
References: <1681119440-25219-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1681119440-25219-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 17:25:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179899

Error: 
 Problem: conflicting requests
  - nothing provides python3-cryptography-vectors = 39.0.2 needed by python3-cryptography-ptest-39.0.2-r0.core2_64
(try to add '--skip-broken' to skip uninstallable packages)


On 10/04/2023 17:37:16+0800, wangmy wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
> 
> Changelog:
> https://github.com/pyca/cryptography/blob/main/CHANGELOG.rst
> 
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  ...vectors_39.0.2.bb => python3-cryptography-vectors_40.0.1.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-devtools/python/{python3-cryptography-vectors_39.0.2.bb => python3-cryptography-vectors_40.0.1.bb} (90%)
> 
> diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.2.bb b/meta/recipes-devtools/python/python3-cryptography-vectors_40.0.1.bb
> similarity index 90%
> rename from meta/recipes-devtools/python/python3-cryptography-vectors_39.0.2.bb
> rename to meta/recipes-devtools/python/python3-cryptography-vectors_40.0.1.bb
> index 795e27f75b..aa305dd736 100644
> --- a/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.2.bb
> +++ b/meta/recipes-devtools/python/python3-cryptography-vectors_40.0.1.bb
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
>  # NOTE: Make sure to keep this recipe at the same version as python3-cryptography
>  #       Upgrade both recipes at the same time
>  
> -SRC_URI[sha256sum] = "a68f106f7a4322cf1e7ed51e3fc6d5c1e0b11d337ed918ec879e8afe0c2a5220"
> +SRC_URI[sha256sum] = "8460706b5b5d0ce4a85571ca3389cf88f700bb6a0c6133dc9fe0f5a2f5bda041"
>  
>  PYPI_PACKAGE = "cryptography_vectors"
>  
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#179873): https://lists.openembedded.org/g/openembedded-core/message/179873
> Mute This Topic: https://lists.openembedded.org/mt/98172280/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

