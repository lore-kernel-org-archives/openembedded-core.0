Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.36755.1611582555102182842
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jan 2021 05:49:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gA8EMr9q;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id s24so10473666wmj.0
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Jan 2021 05:49:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=sDq+60sTCcXQwl8Liv4A1qDPVLs1kz1gdESaeFblW3s=;
        b=gA8EMr9q+BrIG37M6H172l84B4cm3oPmDoG5NmsNToYNCE0lAUiBfZE67BYtLL/Eyx
         xWhZ0jscltj4281FtwKZma4A81SUNiHz+IdUKnS481UYCdqbyJEN6sZuplbx+hqqSZw+
         wMuv8LQuRwRO0qDfFQqiEHSg887osSsrJr+sc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=sDq+60sTCcXQwl8Liv4A1qDPVLs1kz1gdESaeFblW3s=;
        b=IpoX4Sp27B/TOCX5Zds+dVo8AmzZSSULCvwaDMraLmgkApHVvJnUz8k007sDnsXN5C
         nJYUVtjoYMNPNORFsWPCe+oczCcJCumJ7o2DSxua+Op2drScmU2vEWCX7XMvNHcuG795
         +T7bMPWw+uqh2nBDDL9Kbxbn3ffORmNQ1/kAUl0AHwyz9qMASjcC9fgnUQf8WJRlqyac
         KgOot9ozRPo/2TKDk6e1EVvMapyCXBM0/scRzRy+xXXPX6EvRf+rTcUVrducOthzYWM/
         90f6XNxWwzFuOytar1SQ8RX2W0jhd97H26BqiE7ne1e0DtxK3+DKiq/YPwo8cVqBJS/B
         zv9Q==
X-Gm-Message-State: AOAM5334y7Lp0gx2jMdyhWrokDNlvcuKPnayG4KP6fXaHs5Frhi3cLHo
	20MV8wwCzOuSgdxka0WJF9fw7w==
X-Google-Smtp-Source: ABdhPJzzG6Rm5D0/No0x/vSq/4OgQq6A+vrPUvzjv8GvTcZzhNoF8IQtRoUbZPark67KFu1nab9i8Q==
X-Received: by 2002:a1c:f415:: with SMTP id z21mr235242wma.114.1611582553551;
        Mon, 25 Jan 2021 05:49:13 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:cbb3:266e:4b67:be20? ([2001:8b0:aba:5f3c:cbb3:266e:4b67:be20])
        by smtp.gmail.com with ESMTPSA id s25sm24600444wrs.49.2021.01.25.05.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 05:49:13 -0800 (PST)
Message-ID: <a7f0be5bf19d3e85146c4e3166fc0b37baf1685c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] libdrm: upgrade 2.4.103 -> 2.4.104
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Wang Mingyu <wangmy@cn.fujitsu.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 25 Jan 2021 13:49:09 +0000
In-Reply-To: <1611541232-1991-2-git-send-email-wangmy@cn.fujitsu.com>
References: <1611541232-1991-1-git-send-email-wangmy@cn.fujitsu.com>
	 <1611541232-1991-2-git-send-email-wangmy@cn.fujitsu.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2021-01-25 at 10:20 +0800, Wang Mingyu wrote:
> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  .../drm/{libdrm_2.4.103.bb => libdrm_2.4.104.bb}              | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-graphics/drm/{libdrm_2.4.103.bb => libdrm_2.4.104.bb} (95%)
> 
> diff --git a/meta/recipes-graphics/drm/libdrm_2.4.103.bb b/meta/recipes-graphics/drm/libdrm_2.4.104.bb
> similarity index 95%
> rename from meta/recipes-graphics/drm/libdrm_2.4.103.bb
> rename to meta/recipes-graphics/drm/libdrm_2.4.104.bb
> index 1028d618ae..e7007e1330 100644
> --- a/meta/recipes-graphics/drm/libdrm_2.4.103.bb
> +++ b/meta/recipes-graphics/drm/libdrm_2.4.104.bb
> @@ -12,7 +12,7 @@ DEPENDS = "libpthread-stubs"
>  
> 
> 
> 
>  SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.xz"
>  
> 
> 
> 
> -SRC_URI[sha256sum] = "3fe0affdba6460166a7323290c18cf68e9b59edcb520722826cb244e9cb50222"
> +SRC_URI[sha256sum] = "d66ad8b5c2441015ac1333e40137bb803c3bde3612ff040286fcc12158ea1bcb"
>  
> 
> 
> 
>  inherit meson pkgconfig manpages
>  
> 
> 
> 
> @@ -34,7 +34,7 @@ PACKAGECONFIG[valgrind] = "-Dvalgrind=true,-Dvalgrind=false,valgrind"
>  PACKAGECONFIG[install-test-programs] = "-Dinstall-test-programs=true,-Dinstall-test-programs=false"
>  PACKAGECONFIG[cairo-tests] = "-Dcairo-tests=true,-Dcairo-tests=false"
>  PACKAGECONFIG[udev] = "-Dudev=true,-Dudev=false,udev"
> -PACKAGECONFIG[manpages] = "-Dman-pages=true,-Dman-pages=false,libxslt-native xmlto-native"
> +PACKAGECONFIG[manpages] = "-Dman-pages=true,-Dman-pages=false,libxslt-native xmlto-native python3-docutils-native"
>  
> 
> 
> 
>  ALLOW_EMPTY_${PN}-drivers = "1"
>  PACKAGES =+ "${PN}-tests ${PN}-drivers ${PN}-radeon ${PN}-nouveau ${PN}-omap \

Still fails I'm afraid:

https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/1291

Cheers,

Richard

