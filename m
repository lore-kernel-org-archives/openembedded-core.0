Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web11.459.1625678164164907213
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jul 2021 10:16:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=k/6bvOrb;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id i125so2690181qke.12
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Jul 2021 10:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=4x2g2m4N5StXRs+GFqznnXyJQzwU5g8S9LHXY07WqnA=;
        b=k/6bvOrbQvXp9UGNBFbcn9Qwxh4vQTSkyApbagb1oaV8TSuM0J1Dzmo4/s/voroc1r
         Td9VyBQXCEmaSjgnbxnAEKrTOjfyhxm+FFTUSHexjhD3FmJ+P3tqOQThusiWArbxAAmI
         eKSVuqz3ZpOeH4fRo5do0zIGkbqctGHSePILeutEWZnLAb7ND/HPPEN9tmAl/wEk8Flb
         oqcuscP21GKhv2D5vmY51HxO0sCMYrWPQ9ecp0krAdYqiln38c6jhFbjS5psDyvurgyt
         2eZFkh1VQx2X5eDwbHhwTEg82krkaznxCKM8sUThRllKLuhX9iwnSokmTFQY/w33wGK0
         1dVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=4x2g2m4N5StXRs+GFqznnXyJQzwU5g8S9LHXY07WqnA=;
        b=TIw2rSm4dUpRxBTLfeOg7CiVwYzq4N0KPNR8Xzoz1VFaI7UmF2Evf3BryN+0c5lyJo
         JFeIJyG/TRKO6LRvT7hhtUOLzsiSz+RwGroaPrxcn6Oa6ttYTLD3ZnYsjRaRDHv6Lcb0
         0cwt50WCzGv1nQBbAv7+jrr1I6KMYfJuTsE0KqGX3ANi4Hw68D1jji3GHlulfY+Ithwi
         lmpc7mT0V3Fy1iHmue9YU26v9Frd0vQPS3xvcMMglFQ0NXrjIUOvxKym8mz5gBURsA5f
         SS6ByeeWyQWNJEGVxxUnfNL1HXQll0F/0XeOZ2h1z73HwuyEiPrjrrTwXnrye5Iok+oB
         C84w==
X-Gm-Message-State: AOAM531ejhLcQQMDZtSnsIK+XNV+HNd6YRig8lzrzYxnRIwkUHAHy8bF
	4go1PN9J10QUGsI+OFOq/HMvkEQieSNV2miOELZwE5wY2J0=
X-Google-Smtp-Source: ABdhPJzWQXAPeOioTX2G7O2EO7nLSxFQy0LMPCJi4KHVTjJhzkmpWO6f5/Fqu6kRts1cJxpzlcrCpO+m+ZIDlgXMu2g=
X-Received: by 2002:ae9:f201:: with SMTP id m1mr25970449qkg.381.1625678163133;
 Wed, 07 Jul 2021 10:16:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210704210740.581650-1-raj.khem@gmail.com>
In-Reply-To: <20210704210740.581650-1-raj.khem@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 7 Jul 2021 10:15:37 -0700
Message-ID: <CAMKF1sqg7QMojTsPo=GSjzpEEb-QwmF8_GNXXj8SaC45wtJ73Q@mail.gmail.com>
Subject: Re: [PATCH] libubootenv: Disable for ppc/ppc64 qemu machines
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

ping

On Sun, Jul 4, 2021 at 2:07 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> This recipe depends on u-boot and u-boot is not available for
> qemuppc/qemuppc64 and there is no defconfig available either
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-bsp/u-boot/libubootenv_0.3.2.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-bsp/u-boot/libubootenv_0.3.2.bb b/meta/recipes-bsp/u-boot/libubootenv_0.3.2.bb
> index 306296922c..88a8397c3c 100644
> --- a/meta/recipes-bsp/u-boot/libubootenv_0.3.2.bb
> +++ b/meta/recipes-bsp/u-boot/libubootenv_0.3.2.bb
> @@ -25,6 +25,9 @@ RPROVIDES_${PN}-bin += "u-boot-fw-utils"
>
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>
> +COMPATIBLE_HOST_qemuppc64 = "null"
> +COMPATIBLE_HOST_qemuppc = "null"
> +
>  RRECOMMENDS_${PN}-bin_append_class-target = " u-boot-default-env"
>
>  BBCLASSEXTEND = "native"
> --
> 2.32.0
>
