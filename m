Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B972AC47258
	for <webhook@archiver.kernel.org>; Wed, 17 Jan 2024 14:40:59 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.3929.1705502454626821995
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jan 2024 06:40:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Hh92LSAs;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B38A14000A;
	Wed, 17 Jan 2024 14:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1705502452;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+IX4o5YMq4nHxKhvZMAnvHlEA7NPtcdF2GWVlEYmAVI=;
	b=Hh92LSAs7Km2O+xDfBUyhuV+9l9NubDIaSfK0/jeqnumLebzIeNCe3hNBXHVrc2T6QhbKQ
	62tGOecj8y9jtRDfV7Gtbrt7YfDFSHI+5bqU0a0kKq4Gp4EqsFyoi+xuOAHxf/gMeUVxWE
	8ZvmsIHk2hSCucnx8qrgNxfbUeHPT487Jb0YBIzHtI2XykH/OHwYq4WTvKLbtiHx8kX/2J
	jbaiaxM/1sbCHikdR8edQS8MU1b09qsBJAmFzVxadKBsWVTRs4CRaU8j4w9GNUFc46Yl7l
	XKFqFGxntdlcdjWwB+Dk3JBE0q4LCMYigC/uJvKoPasqR55Vgru4SqYsglgTvw==
Date: Wed, 17 Jan 2024 15:40:51 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] python3-wcwidth: upgrade 0.2.12 -> 0.2.13
Message-ID: <202401171440519bf85e44@mail.local>
References: <1705310800-24766-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1705310800-24766-1-git-send-email-wangmy@fujitsu.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 14:40:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193914

New ptest failures:

https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/5977/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/6163/steps/12/logs/stdio

On 15/01/2024 17:26:40+0800, wangmy wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
> 
> Changelog:
>  Bugfix zero-width support for Hangul Jamo
> 
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../{python3-wcwidth_0.2.12.bb => python3-wcwidth_0.2.13.bb}    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-devtools/python/{python3-wcwidth_0.2.12.bb => python3-wcwidth_0.2.13.bb} (87%)
> 
> diff --git a/meta/recipes-devtools/python/python3-wcwidth_0.2.12.bb b/meta/recipes-devtools/python/python3-wcwidth_0.2.13.bb
> similarity index 87%
> rename from meta/recipes-devtools/python/python3-wcwidth_0.2.12.bb
> rename to meta/recipes-devtools/python/python3-wcwidth_0.2.13.bb
> index ae845a39a7..320a34a5f5 100644
> --- a/meta/recipes-devtools/python/python3-wcwidth_0.2.12.bb
> +++ b/meta/recipes-devtools/python/python3-wcwidth_0.2.13.bb
> @@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/jquast/wcwidth"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=b15979c39a2543892fca8cd86b4b52cb"
>  
> -SRC_URI[sha256sum] = "f01c104efdf57971bcb756f054dd58ddec5204dd15fa31d6503ea57947d97c02"
> +SRC_URI[sha256sum] = "72ea0c06399eb286d978fdedb6923a9eb47e1c486ce63e9b4e64fc18303972b5"
>  
>  inherit pypi setuptools3 ptest
>  
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193662): https://lists.openembedded.org/g/openembedded-core/message/193662
> Mute This Topic: https://lists.openembedded.org/mt/103735720/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

