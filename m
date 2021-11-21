Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB5EBC433F5
	for <webhook@archiver.kernel.org>; Sun, 21 Nov 2021 11:14:17 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web09.9586.1637493256870868072
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Nov 2021 03:14:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BqcVeKvY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id s13so27047797wrb.3
        for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Nov 2021 03:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=Emjde8p117w0IUuQ4joRzaaujjx+ogcMxgZAn+Kr9FY=;
        b=BqcVeKvY2xecbvz+xiPQMsL4QX4ByYTUIY2/u8chvxWP7/VhZODaAIbs07wJuSQY27
         nUIA+NOIWa/99gAqH15jYvKE7AKxHpkRdZbpj4Y4Vd6jvJtMFiQqBPMlf6MPsIa9yCKg
         Rwp34JdD9CiD20TUOUvYaR4df/Yp2pA6fvEUo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Emjde8p117w0IUuQ4joRzaaujjx+ogcMxgZAn+Kr9FY=;
        b=Z0VrxIpmQtrf+w1QDLwOwrlGKauBSNQHGiBseyQhfNovpbvpasSdhxNYtmC02naTXh
         +HhyQ6q3A0E08oz/QDx0v2ODteHxPQkxVzJD5/eoxTYwoA8SkFDgoLnNGOAXipkZf8aV
         vMV3xOen4ynpmT8x7jqUOiCFwK+QWkwjXDiD6Rum6y/zW4exiw33f/CtbSj7xyHN9Ix9
         YSAc4GtR5XQNe43cyhb0wotuXCZ6AucBsomCLEbmvCURTXM63CpmFKrDzSfq47VN5v5D
         XCMxAcPR+Uj/DZ54KrOG8/ZycSAtcBlVHCR0jAv2Hn9kmLksxh51g9SDj99NaQ26UdF0
         gZLw==
X-Gm-Message-State: AOAM532DAwTjk5iK1B3qSp63cjKAdkkhNtk8zJShHh221e7ryHD3YAFh
	iY6fC97f9yR/pge7M7nBsNzRlQ==
X-Google-Smtp-Source: 
 ABdhPJyKIIK5+SjLVxzAgwuSVVSx9KqrbaqXfAjtJUSNmXE0kFFQgnAOCp1+Ao+FTVgblkkDsNM4gA==
X-Received: by 2002:a5d:4846:: with SMTP id n6mr25863477wrs.249.1637493254969;
        Sun, 21 Nov 2021 03:14:14 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:d569:c290:d407:39b3?
 ([2001:8b0:aba:5f3c:d569:c290:d407:39b3])
        by smtp.gmail.com with ESMTPSA id
 t189sm5558273wma.8.2021.11.21.03.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Nov 2021 03:14:14 -0800 (PST)
Message-ID: 
 <88f06a64bfdc18fbf152ecf371413fb7b6086fa6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] core-image-base: Remove psplash from
 required features
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Sun, 21 Nov 2021 11:14:12 +0000
In-Reply-To: <20211120180507.1970003-2-raj.khem@gmail.com>
References: <20211120180507.1970003-1-raj.khem@gmail.com>
	 <20211120180507.1970003-2-raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 21 Nov 2021 11:14:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158531

On Sat, 2021-11-20 at 10:05 -0800, Khem Raj wrote:
> base-image boots in degraded mode when using systems without display
> system since there is no fb device detected and pslash service would
> fail to start. Removing this image feature means that core-image-base is
> complete for headless devices
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-core/images/core-image-base.bb | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/meta/recipes-core/images/core-image-base.bb b/meta/recipes-core/images/core-image-base.bb
> index 75a08cfc92a..ced8de6c14f 100644
> --- a/meta/recipes-core/images/core-image-base.bb
> +++ b/meta/recipes-core/images/core-image-base.bb
> @@ -1,8 +1,6 @@
>  SUMMARY = "A console-only image that fully supports the target device \
>  hardware."
>  
> -IMAGE_FEATURES += "splash"
> -
>  LICENSE = "MIT"
>  
>  inherit core-image

I think the way this was originally intended to work was to have a
MACHINE_FEATURE which represented the possibility of a display, then the image
could configure itself accordingly. Removing features from images to the lowest
common denominator of any given hardware doesn't seem like the correct thing to
do...

Cheers,

Richard


