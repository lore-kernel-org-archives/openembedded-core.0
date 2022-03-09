Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 599D5C433EF
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 18:04:18 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.670.1646849056808711879
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Mar 2022 10:04:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VjpSKnPJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id p9so4290750wra.12
        for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Mar 2022 10:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=gJKwZ+tA8Rz4iA+FAI9YhuvPz0DrVEj0WLinb+5Asq0=;
        b=VjpSKnPJJFjR8c0gx2RSYUMX9O4r/V6PVFk88h7F4hkBiaMSMIXz0/Opi8YESLjUlU
         omu+mb+Z+rYCYwYpbwLm8xIyMaF8mbpVIv0J/amlCZA5YlCEgzw+Vq2yzXT3kvqDKAQU
         GyoudrObsrDewq62ZLey1jiBIemUZ0HfU6Nvk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=gJKwZ+tA8Rz4iA+FAI9YhuvPz0DrVEj0WLinb+5Asq0=;
        b=7THeu5qHTWBuZsQ5Whv6OyxnoYBm7sr726ijC2mb5gZA2L4VhmPxs/3UH/3w3DyL1H
         VQa+ifiJr7yALwsXN2hmOWwfk0P8bzcAq7qu2/3OeVj49Bw5P/eVfxh2qJ/jg6HFXEYN
         V9e6rs6Qqnrsug4jlXfhz2zzL8h/nIYOEvC1LRYwlBSJEcjd7/yOV4KB3xIh51phd8M1
         G8PeE+QMC1MP/5u6DLBGbt+JE2Po74LjJh29c3p8PggrlMcffz1bUUDh0kejzI9xHCHS
         y+h826CSm7HL/nLYhyeaFm3a0+fKJLy4fObMNNcWDZDghweV1+Q2R0kvZlK0uHdiYj58
         RRlw==
X-Gm-Message-State: AOAM531B/bzgrNqL8j0f/+3jS86cctsNZzqI3YZgAmi+2L7rAfJbbU39
	Pm6N61I1fioVvQjS89VBjv9VdA==
X-Google-Smtp-Source: 
 ABdhPJxPmnhx78a0lPksb58QcEhhTLZYn4BmW5h8wcFePOzjqgmPAoL6AZuTi8sS13tLVrgN+TF/Dg==
X-Received: by 2002:a5d:5982:0:b0:203:7e01:49c3 with SMTP id
 n2-20020a5d5982000000b002037e0149c3mr630723wri.330.1646849055190;
        Wed, 09 Mar 2022 10:04:15 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:32b1:4783:6b7d:78e6?
 ([2001:8b0:aba:5f3c:32b1:4783:6b7d:78e6])
        by smtp.gmail.com with ESMTPSA id
 n20-20020a05600c501400b0038995ede299sm2277048wmr.17.2022.03.09.10.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Mar 2022 10:04:14 -0800 (PST)
Message-ID: 
 <cd1ff15bdcc14666f972a14e8eaba5b4af663b0a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] pango: upgrade 1.50.4 -> 1.50.5
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: wangmy <wangmy@fujitsu.com>, openembedded-core@lists.openembedded.org
Date: Wed, 09 Mar 2022 18:04:13 +0000
In-Reply-To: <1646735675-58918-2-git-send-email-wangmy@fujitsu.com>
References: <1646735675-58918-1-git-send-email-wangmy@fujitsu.com>
	 <1646735675-58918-2-git-send-email-wangmy@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Mar 2022 18:04:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162987

On Tue, 2022-03-08 at 18:34 +0800, wangmy wrote:
> Changelog:
> =========
> * Fix compiler warnings
> * Enable cairo by default
> * pango-view: Show more baselines
> * layout: Handle baselines
> * Windows: build cleanups
> 
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../recipes-graphics/pango/{pango_1.50.4.bb => pango_1.50.5.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-graphics/pango/{pango_1.50.4.bb => pango_1.50.5.bb} (94%)
> 
> diff --git a/meta/recipes-graphics/pango/pango_1.50.4.bb b/meta/recipes-graphics/pango/pango_1.50.5.bb
> similarity index 94%
> rename from meta/recipes-graphics/pango/pango_1.50.4.bb
> rename to meta/recipes-graphics/pango/pango_1.50.5.bb
> index 0ea621bf67..3a0cbd57f0 100644
> --- a/meta/recipes-graphics/pango/pango_1.50.4.bb
> +++ b/meta/recipes-graphics/pango/pango_1.50.5.bb
> @@ -20,7 +20,7 @@ GIR_MESON_DISABLE_FLAG = "disabled"
>  
>  SRC_URI += "file://run-ptest"
>  
> -SRC_URI[archive.sha256sum] = "f4ad63e87dc2b145300542a4fb004d07a9f91b34152fae0ddbe50ecdd851c162"
> +SRC_URI[archive.sha256sum] = "6d136872da6207fe88c5cd2c95c36bcaf4ed29402b854663a86cd7efe99b0cf5"
>  
>  DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz fribidi"


I worry this may be causing:

https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/3211

Cheers,

Richard


