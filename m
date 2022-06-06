Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6F0DCCA473
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 15:25:25 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.33400.1654529123077506918
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 08:25:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CdREqHBw;
 spf=pass (domain: gmail.com, ip: 209.85.167.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id u23so23882729lfc.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 08:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nlR7IwJY3qIwXopMQL3RWx5lTaR+EGGlnQkgoLIzmsI=;
        b=CdREqHBw7jJWXITsnW8ciXoI5//5rvjewmStkNI0eBngL+2A0QJMZW3G+GYCb9kSli
         LkUqXxalAziuTIUrRd0kw49L4eIwXN60HQffxKbBZ+L0J/2DT8kOIiJkx5vDhxDwPRH3
         ISOKBF1X7ow8MeZ8xOlE3X4ijL6aiaZMGZjUDhbMxj4d90RL0Bkj755arfCxtmjgL7nn
         ZukPwjkDIim0skxw5T+uZ0cJ9nABsGrrnGpH8bXUQjEUDJGsGZ2/lbDqYncRYkrNY4WK
         s2FiL/Z2W8NuqyKMy23zET0BYyjk1bs2pIdCFEqrey8ULNa9cZtIZGKjL+QLThDYJO59
         BZIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nlR7IwJY3qIwXopMQL3RWx5lTaR+EGGlnQkgoLIzmsI=;
        b=exyGfVH8w8ZS4LsRJhX5AbD9aP7DVLQaa87Yx5iTvQUDbas6NQDN0KpgA3rBzZZUYo
         bcyELh1ft01V3Rxjnm1Ah1k+IVzGyzd5QxqaRWgs+ML8r8dTWbu4nIHTnmRKGSiou+yS
         kaEq3Zwq4lQnjxHjWGdLII/SKEiuxTF4ebFNj2BfLQADE2HTwsgUX3a747cuZN3GWQAX
         O2je7ynfv+v2vn7NzGJ1+eyZey49dy7IK8Q25cxR5rAaI+L9+HilLs1s9QTMaWRvyRRx
         9wWxf8x9LOszZkiLAzTZ2CZcHDeFKtOuUGYbXMHBCVPZ7sgUrTu+3KcW+XB197eg4u0y
         c7RA==
X-Gm-Message-State: AOAM533xIs1nUfRjGksmQoc7095/YMcv3eoNx6s9TbwbwQfOydU2tPgd
	Ak6svJ2Gfn0LftKiGjOjfiXjQDNTPxAcqdDz51k=
X-Google-Smtp-Source: 
 ABdhPJxBOhR7VQA5o518p5XrVPUpeR2VrTnGqnpKjcvvy4s9omYYHCoQv2gL2F6f3tv+LJuPqfbtV9G7Su68bv03qgU=
X-Received: by 2002:a05:6512:224d:b0:479:20f7:a19a with SMTP id
 i13-20020a056512224d00b0047920f7a19amr8807543lfu.26.1654529121151; Mon, 06
 Jun 2022 08:25:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220606141056.2054477-1-jan.vermaete@gmail.com>
In-Reply-To: <20220606141056.2054477-1-jan.vermaete@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 6 Jun 2022 17:25:10 +0200
Message-ID: 
 <CANNYZj8FfTTwMqh8Ct59pUT=RkXNnmKPH_0hwQCw-DL-V_JnXw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] zstd: added compression and decompression as
 packageconfig
To: Jan Vermaete <jan.vermaete@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jun 2022 15:25:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166649

pzstd changes need to be either explained or split into a separate patch.

Alex

On Mon, 6 Jun 2022 at 16:11, Jan Vermaete <jan.vermaete@gmail.com> wrote:
>
> The default is the same as before.
> So both target and native can do compression and decompression.
>
> Native will probably always needed both.  E.g. to create rpm packages.
> Target could have enough with decompression only.  E.g. for OTA systems.
>
> The difference between default and decompression only:
>   packages/cortexa72-poky-linux/zstd/libzstd: PKGSIZE changed from 661912 to 210776 (-68%)
>   packages/cortexa72-poky-linux/zstd/zstd: PKGSIZE changed from 1430839 to 785007 (-45%)
>
> Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
> ---
>  meta/recipes-extended/zstd/zstd_1.5.2.bb | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-extended/zstd/zstd_1.5.2.bb b/meta/recipes-extended/zstd/zstd_1.5.2.bb
> index 3887f31ecf..924e7db7f7 100644
> --- a/meta/recipes-extended/zstd/zstd_1.5.2.bb
> +++ b/meta/recipes-extended/zstd/zstd_1.5.2.bb
> @@ -18,22 +18,31 @@ CVE_PRODUCT = "zstandard"
>
>  S = "${WORKDIR}/git"
>
> -PACKAGECONFIG ??= ""
> +PACKAGECONFIG:class-native ??= "compression decompression pzstd"
> +PACKAGECONFIG:class-target ??= "compression decompression pzstd"
> +PACKAGECONFIG[compression] = "ZSTD_LIB_COMPRESSION=1,ZSTD_LIB_COMPRESSION=0"
> +PACKAGECONFIG[decompression] = "ZSTD_LIB_DECOMPRESSION=1,ZSTD_LIB_DECOMPRESSION=0"
>  PACKAGECONFIG[lz4] = "HAVE_LZ4=1,HAVE_LZ4=0,lz4"
>  PACKAGECONFIG[lzma] = "HAVE_LZMA=1,HAVE_LZMA=0,xz"
> +PACKAGECONFIG[pzstd] = ""
>  PACKAGECONFIG[zlib] = "HAVE_ZLIB=1,HAVE_ZLIB=0,zlib"
>
> +
>  # See programs/README.md for how to use this
>  ZSTD_LEGACY_SUPPORT ??= "4"
>
>  do_compile () {
>      oe_runmake ${PACKAGECONFIG_CONFARGS} ZSTD_LEGACY_SUPPORT=${ZSTD_LEGACY_SUPPORT}
> -    oe_runmake ${PACKAGECONFIG_CONFARGS} ZSTD_LEGACY_SUPPORT=${ZSTD_LEGACY_SUPPORT} -C contrib/pzstd
> +    if ${@bb.utils.contains('PACKAGECONFIG', 'pzstd', 'true', 'false', d)}; then
> +        oe_runmake ${PACKAGECONFIG_CONFARGS} ZSTD_LEGACY_SUPPORT=${ZSTD_LEGACY_SUPPORT} -C contrib/pzstd
> +    fi
>  }
>
>  do_install () {
>      oe_runmake install 'DESTDIR=${D}'
> -    oe_runmake install 'DESTDIR=${D}' PREFIX=${prefix} -C contrib/pzstd
> +    if ${@bb.utils.contains('PACKAGECONFIG', 'pzstd', 'true', 'false', d)}; then
> +        oe_runmake install 'DESTDIR=${D}' PREFIX=${prefix} -C contrib/pzstd
> +    fi
>  }
>
>  PACKAGE_BEFORE_PN = "libzstd"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#166632): https://lists.openembedded.org/g/openembedded-core/message/166632
> Mute This Topic: https://lists.openembedded.org/mt/91577767/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

