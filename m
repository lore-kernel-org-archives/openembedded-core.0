Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web12.16434.1604948413807579539
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2020 11:00:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EyO/xwUv;
 spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id n132so7858992qke.1
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2020 11:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=obVusXgxJnijcYSRK91bZC3bC0zsPu5+6peum225tsA=;
        b=EyO/xwUvY6Yj2RnfKJBgnCk3CWeNGPFX39OcwXHq0hQDackRfasKDKIc/wYfTWQKpS
         QNif7/WE4F5HNp0zvZJt9nUE809kf3DN4tH485nhSWtXx0GzVmlo74FSz40fGIy1GAHx
         4V0EEvxXfXV7fKnsNSLeO8VQxXgxCc3MpbRNnBNV6JsitYf8DBxWgEI9yj/ySJlfE8mT
         AKnxsciX6iqH4jN83SDviyB3B99nxV3qEropxUeF8sjLU6RO9MxrhJmz8nsQF/iswKGf
         oRnJJXJ4/J9aGNzHqaEX57F1khgi9G5lYRXY9Z4qnuoWCKplNkYYaLXUAkz7QRYC3JUO
         0xQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=obVusXgxJnijcYSRK91bZC3bC0zsPu5+6peum225tsA=;
        b=TXPjBsgkyW67adgsIWRlpXk6msOo28svh+8W1SLcgt1lKLh1NPgpo70ihWZ1sHhRQI
         uvqj0scL8FqzR7yoNTlwEMnj23rrUDsL5Lf+YE0+ZMTf3YTh9/TvivIGE6/l+AV9I3Pq
         wj8veKzOYFiIGZW4QkUZ7gSqwhhmDmmPDOTVquRO2D412j4Gs/sTsk9+ugzdBBOTEtAu
         gxrkzk/6oG7tyV17YScjGI/Qi2HiXnO6FB2cWdKTKbxzQk6lP1RphNR14GTP2ujR0BTW
         YEIL3/HsN6W0Z0GF8NTj7yySFu8bncvuZ0vSq+vhNGthQKIcj/oflZfypZ7MzVBXdHtS
         fqmA==
X-Gm-Message-State: AOAM533/sACsaRqQ35EPJpZlqq9j2jlKNMTVzh7s4Qu06aIsfTggJ28W
	i/oDmW/BKyiayKxI8mUCcDTN/0EOFQgp80RxfNbhdSL2bfU=
X-Google-Smtp-Source: ABdhPJxj2IIa8NFXFTiegT3mVwaBxbta60Kw7H9i02xYL7j6RvQLiJ1x7fZ6VQUqszKeEa5oG9gUErjETroerKGZ2Pc=
X-Received: by 2002:a37:7fc7:: with SMTP id a190mr15230861qkd.337.1604948412743;
 Mon, 09 Nov 2020 11:00:12 -0800 (PST)
MIME-Version: 1.0
References: <1604898797-61898-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <1604898797-61898-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 9 Nov 2020 10:59:45 -0800
Message-ID: <CAMKF1sq0deaFzmc+bHxenUj2vWVayZ2pKt2Sb8-_0hZCbGzsow@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] iproute2: upgrade 5.8.0 -> 5.9.0
To: zangrc <zangrc.fnst@cn.fujitsu.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, Nov 8, 2020 at 9:13 PM zangrc <zangrc.fnst@cn.fujitsu.com> wrote:
>
> 0001-devlink.c-add-missing-include.patch
> Removed since this is included in 5.9.0.
>

you need to git rm this patch as well. I do not see this in patch,

> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../iproute2/{iproute2_5.8.0.bb => iproute2_5.9.0.bb}          | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>  rename meta/recipes-connectivity/iproute2/{iproute2_5.8.0.bb => iproute2_5.9.0.bb} (64%)
>
> diff --git a/meta/recipes-connectivity/iproute2/iproute2_5.8.0.bb b/meta/recipes-connectivity/iproute2/iproute2_5.9.0.bb
> similarity index 64%
> rename from meta/recipes-connectivity/iproute2/iproute2_5.8.0.bb
> rename to meta/recipes-connectivity/iproute2/iproute2_5.9.0.bb
> index 3a590f9122..0e6a53e6a4 100644
> --- a/meta/recipes-connectivity/iproute2/iproute2_5.8.0.bb
> +++ b/meta/recipes-connectivity/iproute2/iproute2_5.9.0.bb
> @@ -2,10 +2,9 @@ require iproute2.inc
>
>  SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
>             file://0001-libc-compat.h-add-musl-workaround.patch \
> -           file://0001-devlink.c-add-missing-include.patch \
>             "
>
> -SRC_URI[sha256sum] = "cfcd1f890290f8c8afcc91d9444ad929b9252c16f9ab3f286c50dd3c59dc646e"
> +SRC_URI[sha256sum] = "a25dac94bcdcf2f73316c7f812115ea7a5710580bad892b08a83d00c6b33dacf"
>
>  # CFLAGS are computed in Makefile and reference CCOPTS
>  #
> --
> 2.25.1
>
>
>
>
> 
>
