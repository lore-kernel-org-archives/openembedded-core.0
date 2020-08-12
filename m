Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web10.16400.1597243770173618731
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2020 07:49:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XIj5zwgy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id 88so2312474wrh.3
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2020 07:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=aOxsEchE5wV/myOfTx9j1RbbnKdA/8EGc5g5C1Gpx5U=;
        b=XIj5zwgy6Fmv3T1L+yYzXcY1kfQusMRIS9CXjXq4l0b3+6hWV1cS/TWDXxaXbDWUXV
         U8/sJHY1VKUz33+FmQE7oLMdb1t9P5Uv39stL7ZYY5vJOh4JnTlXP4DcmaFHSdDBMMrz
         zrNzm61/1Zn5CSNasn4EIP52uLIH+ZHGlfWZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=aOxsEchE5wV/myOfTx9j1RbbnKdA/8EGc5g5C1Gpx5U=;
        b=h5KkhqMdB3yrjgfuGpSjT+z5ovLzpv3bv8hoxweQ1j36H1DTPjYUK1anhhhz/QICRQ
         ri9W73kEQNFZBU2YraQdhqjlf6JWKkT9yt/dniQUw7fKZXzTw2PrTvkfsr/GB/t91Wv1
         N6ojmf0Gp5F+m1uDbIYpBtxEiff8yswS0Mgi/FpFlhUFjhCVUCDers5p8W6upg43jB3d
         peMb2N9yXZSsV8zouSXuON7IETL2eEGQTsL7F7tNWm81/4bp0B19AWTJ0S4Z0AMvxR2m
         XB/aQHGh3yGRcKMwPdMDPiINnlBc10FylVJlyHIqtzQgswIE3L1+BDUq+hWzgKjPzVcj
         GdcQ==
X-Gm-Message-State: AOAM530ONJ8oAqJa79GxevO10vJ2Dh5huG4qyLTQrGC6G2fogbU5Bu30
	qksWlhCLE/dkwavxBKtxZR3e4g==
X-Google-Smtp-Source: ABdhPJxJrNV3pkLuNuUANy15nduZGR2ysXMlhUW2bFrTFYRQIRFwzfnrBoDUMXV9yGdv3acBx8xwtQ==
X-Received: by 2002:adf:efd2:: with SMTP id i18mr52511wrp.32.1597243768673;
        Wed, 12 Aug 2020 07:49:28 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 9.a.c.c.d.f.6.e.e.7.9.e.9.0.c.e.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (9.a.c.c.d.f.6.e.e.7.9.e.9.0.c.e.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:ec09:e97e:e6fd:cca9])
        by smtp.gmail.com with ESMTPSA id r11sm4266157wrw.78.2020.08.12.07.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 07:49:28 -0700 (PDT)
Message-ID: <caae9f9f867092660daf0dc8c667763af76c6996.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] iproute2: update to 5.8.0
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 12 Aug 2020 15:49:25 +0100
In-Reply-To: <20200812001018.554194-1-open.source@oleksandr-kravchuk.com>
References: <20200812001018.554194-1-open.source@oleksandr-kravchuk.com>
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-08-12 at 02:10 +0200, Oleksandr Kravchuk wrote:
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  .../0001-devlink.c-add-missing-include.patch  | 23 -------------------
>  ...01-libc-compat.h-add-musl-workaround.patch | 10 ++++----
>  .../{iproute2_5.7.0.bb => iproute2_5.8.0.bb}  |  2 +-
>  3 files changed, 5 insertions(+), 30 deletions(-)
>  delete mode 100644 meta/recipes-connectivity/iproute2/iproute2/0001-devlink.c-add-missing-include.patch
>  rename meta/recipes-connectivity/iproute2/{iproute2_5.7.0.bb => iproute2_5.8.0.bb} (79%)
> 
> diff --git a/meta/recipes-connectivity/iproute2/iproute2/0001-devlink.c-add-missing-include.patch b/meta/recipes-connectivity/iproute2/iproute2/0001-devlink.c-add-missing-include.patch
> deleted file mode 100644
> index f9580b7d44..0000000000
> --- a/meta/recipes-connectivity/iproute2/iproute2/0001-devlink.c-add-missing-include.patch
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -From 5df629d825df4ccc4283228bc0739da126326072 Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex.kanavin@gmail.com>
> -Date: Sat, 6 Jun 2020 18:00:13 +0000
> -Subject: [PATCH] devlink.c: add missing include
> -
> -Upstream-Status: Pending
> -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ----
> - devlink/devlink.c | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/devlink/devlink.c b/devlink/devlink.c
> -index 16602ab..c278e6d 100644
> ---- a/devlink/devlink.c
> -+++ b/devlink/devlink.c
> -@@ -26,6 +26,7 @@
> - #include <libmnl/libmnl.h>
> - #include <netinet/ether.h>
> - #include <sys/types.h>
> -+#include <signal.h>
> - 
> - #include "SNAPSHOT.h"
> - #include "list.h"
> diff --git a/meta/recipes-connectivity/iproute2/iproute2/0001-libc-compat.h-add-musl-workaround.patch b/meta/recipes-connectivity/iproute2/iproute2/0001-libc-compat.h-add-musl-workaround.patch
> index 50c4bfb0f2..60f31db9a2 100644
> --- a/meta/recipes-connectivity/iproute2/iproute2/0001-libc-compat.h-add-musl-workaround.patch
> +++ b/meta/recipes-connectivity/iproute2/iproute2/0001-libc-compat.h-add-musl-workaround.patch
> @@ -1,4 +1,4 @@
> -From b7d96340c55afb7023ded0041107c63dbd886196 Mon Sep 17 00:00:00 2001
> +From c6109138e9e13c7e40313aacc3ea582c52ffd61f Mon Sep 17 00:00:00 2001
>  From: Baruch Siach <baruch@tkos.co.il>
>  Date: Thu, 22 Dec 2016 15:26:30 +0200
>  Subject: [PATCH] libc-compat.h: add musl workaround
> @@ -14,15 +14,16 @@ https://git.buildroot.net/buildroot/tree/package/iproute2/0001-Add-the-musl-work
>  
>  Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>  Signed-off-by: Maxin B. John <maxin.john@intel.com>
> +
>  ---
>   include/uapi/linux/libc-compat.h | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>  
>  diff --git a/include/uapi/linux/libc-compat.h b/include/uapi/linux/libc-compat.h
> -index f38571d..30f0b67 100644
> +index a159991..22198fa 100644
>  --- a/include/uapi/linux/libc-compat.h
>  +++ b/include/uapi/linux/libc-compat.h
> -@@ -49,10 +49,12 @@
> +@@ -50,10 +50,12 @@
>   #define _LIBC_COMPAT_H
>   
>   /* We have included glibc headers... */
> @@ -36,6 +37,3 @@ index f38571d..30f0b67 100644
>   
>   /* GLIBC headers included first so don't define anything
>    * that would already be defined. */
> --- 
> -2.4.0
> -
> diff --git a/meta/recipes-connectivity/iproute2/iproute2_5.7.0.bb b/meta/recipes-connectivity/iproute2/iproute2_5.8.0.bb
> similarity index 79%
> rename from meta/recipes-connectivity/iproute2/iproute2_5.7.0.bb
> rename to meta/recipes-connectivity/iproute2/iproute2_5.8.0.bb
> index 276afeab11..3a590f9122 100644
> --- a/meta/recipes-connectivity/iproute2/iproute2_5.7.0.bb
> +++ b/meta/recipes-connectivity/iproute2/iproute2_5.8.0.bb
> @@ -5,7 +5,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
>             file://0001-devlink.c-add-missing-include.patch \
>             "

The patch mentioned above in SRC_URI is deleted above?

Cheers,

Richard

