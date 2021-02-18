Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web09.7189.1613657584504897692
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Feb 2021 06:13:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZuTg5B81;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id o24so4061979wmh.5
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Feb 2021 06:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=3bLzlZmm9iJfc2s3VZoS/5Z87uAueMhIdHxid7NtAsc=;
        b=ZuTg5B81Lms6ndzbSmqFHsuUmEkr/eLzlWAk8MJanrBuGRIysvogrmF+Sjy0PO+OSa
         Rn5vLNtQqeCc7C+RACWP0jErqVEplytVzPyK0se8eByM5apd28G605n29YbJIw/eAn4f
         FcPUr/PvPD1cOzv4oAddmRY0rZQZaNYB7nY7E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=3bLzlZmm9iJfc2s3VZoS/5Z87uAueMhIdHxid7NtAsc=;
        b=C5OXTiaib9lbuY4QkCZCN4JIyhTdlVx3XvGaeLJ+GpCYU0baHAXn8c6l3Qj1gp8C9h
         zr/X9fFZ1CDruUXyooVwYZ3zF5+WMRKHqhZg+NSOoT7v74Q3apWnX9U8wpqKxKd6faP4
         OfoeHHBgD4zuTfx5iVQ+XzLnbPQr+/51zJ/nIC+3UO9jLvDW/W3oKNRURQptRdpwOt2i
         XTIDv6mOoHPB8jZzSaoZR48HjF2cxfnmpdHJNuZJlFV/ahtRDC0Lg0Kh8gq5EMF0vQ7I
         6zDEmAUakhMVPxodRoPGtM8Octj1UsFhzoZHt5rTTx3/4wtViSy/JR6cfb0tuAUx7tHp
         4wTw==
X-Gm-Message-State: AOAM531d4Kcj62gumdxOjfO3XfeGkvaSSrk360ClRTw7avAA6hTBTeBm
	uuHJc8b3Lv6RRv1EMVnjVpmlAA==
X-Google-Smtp-Source: ABdhPJw0oQ4GSEx5KxG6RuMoBJJbiTceALo6mOycfQBnBuIFPnDTmVo73WHmyTS0nEMd2sBVZEyCjQ==
X-Received: by 2002:a05:600c:47d7:: with SMTP id l23mr3934765wmo.16.1613657582878;
        Thu, 18 Feb 2021 06:13:02 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:7504:d16b:192:2652? ([2001:8b0:aba:5f3c:7504:d16b:192:2652])
        by smtp.gmail.com with ESMTPSA id i8sm11380800wry.90.2021.02.18.06.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Feb 2021 06:13:02 -0800 (PST)
Message-ID: <68bd854a48ff4d072130f6625e91333d44b111e6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 06/12] wpebackend-fdo: upgrade 1.8.0 -> 1.9.1
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Anuj Mittal <anuj.mittal@intel.com>, 
	openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Date: Thu, 18 Feb 2021 14:13:01 +0000
In-Reply-To: <20210218042418.281245-6-anuj.mittal@intel.com>
References: <20210218042418.281245-1-anuj.mittal@intel.com>
	 <20210218042418.281245-6-anuj.mittal@intel.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-02-18 at 12:24 +0800, Anuj Mittal wrote:
> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> ---
>  .../webkit/{wpebackend-fdo_1.8.0.bb => wpebackend-fdo_1.9.1.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-sato/webkit/{wpebackend-fdo_1.8.0.bb => wpebackend-fdo_1.9.1.bb} (85%)
> 
> diff --git a/meta/recipes-sato/webkit/wpebackend-fdo_1.8.0.bb b/meta/recipes-sato/webkit/wpebackend-fdo_1.9.1.bb
> similarity index 85%
> rename from meta/recipes-sato/webkit/wpebackend-fdo_1.8.0.bb
> rename to meta/recipes-sato/webkit/wpebackend-fdo_1.9.1.bb
> index 69d6098d36..4547efc57d 100644
> --- a/meta/recipes-sato/webkit/wpebackend-fdo_1.8.0.bb
> +++ b/meta/recipes-sato/webkit/wpebackend-fdo_1.9.1.bb
> @@ -13,5 +13,5 @@ inherit meson features_check
>  REQUIRED_DISTRO_FEATURES = "opengl"
>  
> 
> 
> 
>  SRC_URI = "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz"
> -SRC_URI[sha256sum] = "9652a99c75fe1c6eab0585b6395f4e104b2427e4d1f42969f1f77df29920d253"
> +SRC_URI[sha256sum] = "a1dc4e506413719a0d84757797b645fa76590e6c8db23d2403d990dc2e196a64"

I suspect this may be causing a musl failure:

https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/3086

but I haven't bisected to confirm it.

Cheers,

Richard

