Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D89D5C433F5
	for <webhook@archiver.kernel.org>; Tue,  7 Dec 2021 13:36:42 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.66972.1638884201432367896
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Dec 2021 05:36:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VStXl57x;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id j3so29599322wrp.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Dec 2021 05:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=ru4tw6Bn1hPWQkbHRiCimc4eH4XQexL4pspdQOG/s70=;
        b=VStXl57xka37xEbxbJMJX3F4wF/d9vJieIL+kJr8v6BC/4E0cpVJ3g/TOZhOQym81c
         9kk5B4rtPZCyMHN4XTR3Av4mMI22PCGf9An7LpERl44h1hno82dAZPQLtWaSk1RJl839
         Hc3vu62DfmInRJ5FMNH9f59y3IpDY6SLrUJlc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=ru4tw6Bn1hPWQkbHRiCimc4eH4XQexL4pspdQOG/s70=;
        b=BUee0z8s4SrvCW2aXOcMdyGSgzKHYD223wlbI7KBF+dt5vX/INx9sdoZdMSv/1yO9z
         qd5mDIlkcy8sDtkRLVeXev/RF5RAthuifYC6AQiwbajGCbcFCQkuf0LcRAJICzC6PenY
         jvKYfR+nAFc8tNeUuZdRJdNs8MoM7LP7D7a9oxJjF9l2n5RRkdzlTQDduN7C/Iy76NKu
         EpchwkBDOZ7ha+kRH3LUr13wtN5VxsmvOmDhwBiYQLDPj9U0YDhSZD6webQRY1IRS4Pt
         ytZAYDycm2AJLJjje6OuK9riy0fhqUtkWYAg8a1l3RwfnXxemdKWNpeyv+yS2L7hdJGy
         9Bkw==
X-Gm-Message-State: AOAM53279oFng4htnh9GLuhvpGvGZWpvtu/wNTqPyjIDks3wnMdCMLqQ
	cnI2IYdw1iqkayWUXgyKvceC3Q==
X-Google-Smtp-Source: 
 ABdhPJwyVEz44MWvY1Rd3jQCHlZiumE3M2bLXqTFkdZ3YrW9jAtQJBOaz5zht1+DQ3o2zzuaI/U6Hg==
X-Received: by 2002:a05:6000:1a88:: with SMTP id
 f8mr51035130wry.54.1638884199789;
        Tue, 07 Dec 2021 05:36:39 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:a430:ef69:a06e:8b4a?
 ([2001:8b0:aba:5f3c:a430:ef69:a06e:8b4a])
        by smtp.gmail.com with ESMTPSA id
 o25sm2725639wms.17.2021.12.07.05.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 05:36:39 -0800 (PST)
Message-ID: 
 <f206d7acc80b1d4f4425898539f06b33dfd091b8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] pango: upgrade 1.48.10 -> 1.50.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: wangmy <wangmy@fujitsu.com>, openembedded-core@lists.openembedded.org
Date: Tue, 07 Dec 2021 13:36:35 +0000
In-Reply-To: <1638804078-8183-1-git-send-email-wangmy@fujitsu.com>
References: <1638804078-8183-1-git-send-email-wangmy@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Dec 2021 13:36:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159304

On Mon, 2021-12-06 at 23:21 +0800, wangmy wrote:
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../pango/{pango_1.48.10.bb => pango_1.50.0.bb}                 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-graphics/pango/{pango_1.48.10.bb => pango_1.50.0.bb} (94%)
> 
> diff --git a/meta/recipes-graphics/pango/pango_1.48.10.bb b/meta/recipes-graphics/pango/pango_1.50.0.bb
> similarity index 94%
> rename from meta/recipes-graphics/pango/pango_1.48.10.bb
> rename to meta/recipes-graphics/pango/pango_1.50.0.bb
> index 40df7042e6..db17158d20 100644
> --- a/meta/recipes-graphics/pango/pango_1.48.10.bb
> +++ b/meta/recipes-graphics/pango/pango_1.50.0.bb
> @@ -20,7 +20,7 @@ GIR_MESON_DISABLE_FLAG = "disabled"
>  
>  SRC_URI += "file://run-ptest"
>  
> -SRC_URI[archive.sha256sum] = "21e1f5798bcdfda75eabc4280514b0896ab56f656d4e7e66030b9a2535ecdc98"
> +SRC_URI[archive.sha256sum] = "dba8b62ddf86e10f73f93c3d2256b73238b2bcaf87037ca229b40bdc040eb3f3"
>  
>  DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz fribidi"
>  

Seems to break x32 unfortunately:

https://autobuilder.yoctoproject.org/typhoon/#/builders/57/builds/4403

Cheers,

Richard


