Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C5A6ECAAD1
	for <webhook@archiver.kernel.org>; Wed, 31 Aug 2022 16:31:27 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.1042.1661963479141835027
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Aug 2022 09:31:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=is6IKIo9;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199,
 mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id C1FC7FF808;
	Wed, 31 Aug 2022 16:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1661963477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HUrNdBQZyZ7B1mNcgdVc0VqLdLfNOpS93TZzQCJwhmc=;
	b=is6IKIo9cN88pXolZ1JkxtVilz35yVBH9pdsxWjGLIGYBmvtuZEuzkwd4SDDQXSEZR/hU3
	NpZZpY4EKYS7KxoVOZdvtHxt77+Dr121ANtNWe0vmMtJUAdh9WSQdIhHBqVTKJzumajmwn
	bYJmyFCzrVcXsWuXkJO1vQwvvjQGCffAv4xlNtDlFACzw6An79pFiMc2lbb3267paE4ts7
	QOPPX38wTH22uZqi7nGX5q9LYrMOxzNULxiV6rcgfn8v2s7JO7GSpVikBMGeGoyG3uaKdB
	w9OUGqLcW7HkQsYGsPll0mjn+ppFUGv4y5sE6kjJ534Mos+MPhzzPvb35ZhIHg==
Date: Wed, 31 Aug 2022 18:31:16 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] python3-setuptools: upgrade 65.0.2 -> 65.3.0
Message-ID: <Yw+M1LJMyyKfinpm@mail.local>
References: <1661833494-12657-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1661833494-12657-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Aug 2022 16:31:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170139

Hello,

On 30/08/2022 12:24:50+0800, wangmy wrote:
> Changelog:
> ===========
>  attribute
>  Dependency management section of the Quickstart guid
> 

This causes the following error:

https://autobuilder.yoctoproject.org/typhoon/#/builders/20/builds/6155/steps/11/logs/stdio

> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  ...ython3-setuptools_65.0.2.bb => python3-setuptools_65.3.0.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-devtools/python/{python3-setuptools_65.0.2.bb => python3-setuptools_65.3.0.bb} (95%)
> 
> diff --git a/meta/recipes-devtools/python/python3-setuptools_65.0.2.bb b/meta/recipes-devtools/python/python3-setuptools_65.3.0.bb
> similarity index 95%
> rename from meta/recipes-devtools/python/python3-setuptools_65.0.2.bb
> rename to meta/recipes-devtools/python/python3-setuptools_65.3.0.bb
> index 1a639ea333..3471d2805d 100644
> --- a/meta/recipes-devtools/python/python3-setuptools_65.0.2.bb
> +++ b/meta/recipes-devtools/python/python3-setuptools_65.3.0.bb
> @@ -11,7 +11,7 @@ SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-e
>  SRC_URI += "file://0001-change-shebang-to-python3.patch \
>              file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
>  
> -SRC_URI[sha256sum] = "101bf15ca723beef42c8db91a761f3748d4d697e17fae904db60c0b619d8d094"
> +SRC_URI[sha256sum] = "7732871f4f7fa58fb6bdcaeadb0161b2bd046c85905dbaa066bdcbcc81953b57"
>  
>  DEPENDS += "${PYTHON_PN}"
>  
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#170057): https://lists.openembedded.org/g/openembedded-core/message/170057
> Mute This Topic: https://lists.openembedded.org/mt/93342914/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

