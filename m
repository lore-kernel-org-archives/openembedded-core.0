Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D959DC54EE9
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 16:57:26 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com
 [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web08.1192.1662569846323551832
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 09:57:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XzxTKPOi;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id
 586e51a60fabf-127d10b4f19so11774065fac.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 09:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=FlsrPOsGA5IGU+Jda2ryDztgpHgDtVzHYKwhQLrOty0=;
        b=XzxTKPOiXbVAqNxTdJridc2IjPydHpXRMbkSC1Nqx25pvIwTirHeUcGSBBitcMjPtq
         oSes4J9VlZKYkUYHEpo3e4o/plyAqVpMG0R3qDUqVoRU4vNm2CL5hcP+eIRbKOECwhh0
         203nZb62HevDi2EPuiVvLqytrmYBja01g7R00NfKx7N6GXoYqIrJfzO0rwvmPGqC2Ocl
         gfa8GkxzB970LDBTKdLphcSBCAkXcC99xNsigVoPIreRpIXh/z0JSv1+eGGp5S0LuZVk
         tBk/x4vpGs9U7W7/buaCID30QA4Kzn1hcQRTVbLSSzfVOtemAXrLIVE8tdjEOdDlc69l
         Ylxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=FlsrPOsGA5IGU+Jda2ryDztgpHgDtVzHYKwhQLrOty0=;
        b=ViHE/jNBElMAlI+0Hb3Ui54Dpls+zbru9+DKTu9t4XUA3x/fdEJ6pdMKlGk5iqJpKX
         DUc8Eu0kTZz0U3cS/CHYwCZiPJrOEE7gjxDNlM7yCIqKiMbPL1Pw3FRU0dtHedoa9/v/
         rlDP0Q81Do+hxjnsU7Ay8WIcz68SOawautEBrx5A3qcPdrjqxDhwZCGQLV2BTAdEsk1g
         E5GpDWVia/Jt8uKLMwkS3TlSYRssTKcQbhECooz8PFKb/Y+yfe+cQAPCjMm2qBbbKg2S
         +Ne125UGIRLtoMEUFmKlvErLNK4DXUen2mj0gySp4pmuTD2k1aES0f+PObbb3rDFzcOW
         gKMQ==
X-Gm-Message-State: ACgBeo0obiWHluERoJV63ikdFVK95Cs2mqRI9QP1wJL/ZMkm8K7iMAcj
	7uR0Kzp94Cc5OgWmoZKm1A3nYCEkS0yu+DZ2o/lRVwTNOoU=
X-Google-Smtp-Source: 
 AA6agR78KHUaHz0EhqAmD6SF5uXsCe0ylJc2tTAHZ5p2bMXIKG4ZnQcU6L4aPNB5h/22qcjgZpif5iiL96A/shlMZI8=
X-Received: by 2002:a05:6808:13cc:b0:343:6da1:42f3 with SMTP id
 d12-20020a05680813cc00b003436da142f3mr12048164oiw.262.1662569845430; Wed, 07
 Sep 2022 09:57:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220907130207.2258074-1-ross.burton@arm.com>
 <20220907130207.2258074-3-ross.burton@arm.com>
In-Reply-To: <20220907130207.2258074-3-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 7 Sep 2022 09:56:59 -0700
Message-ID: 
 <CAMKF1spgQ=yaqL+6weNo2eW6vX3Kv8=6nwT84cT3BN=w8gAcBg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] gcc: remove obsolete 0012-export-CPP.patch
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org, nd@arm.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Sep 2022 16:57:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170424

lgtm. it should have been dropped for I forgot.

On Wed, Sep 7, 2022 at 6:02 AM Ross Burton <ross.burton@arm.com> wrote:
>
> This patch is no longer needed, the upstream Makefile exports CPP from
> CPP_FOR_BUILD since 12.1.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-devtools/gcc/gcc-12.2.inc        |  1 -
>  .../gcc/gcc/0012-export-CPP.patch             | 50 -------------------
>  2 files changed, 51 deletions(-)
>  delete mode 100644 meta/recipes-devtools/gcc/gcc/0012-export-CPP.patch
>
> diff --git a/meta/recipes-devtools/gcc/gcc-12.2.inc b/meta/recipes-devtools/gcc/gcc-12.2.inc
> index 572fd8b6692..7cc34b26215 100644
> --- a/meta/recipes-devtools/gcc/gcc-12.2.inc
> +++ b/meta/recipes-devtools/gcc/gcc-12.2.inc
> @@ -49,7 +49,6 @@ SRC_URI = "${BASEURI} \
>             file://0009-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch \
>             file://0010-Use-the-multilib-config-files-from-B-instead-of-usin.patch \
>             file://0011-Avoid-using-libdir-from-.la-which-usually-points-to-.patch \
> -           file://0012-export-CPP.patch \
>             file://0013-Ensure-target-gcc-headers-can-be-included.patch \
>             file://0014-Don-t-search-host-directory-during-relink-if-inst_pr.patch \
>             file://0015-libcc1-fix-libcc1-s-install-path-and-rpath.patch \
> diff --git a/meta/recipes-devtools/gcc/gcc/0012-export-CPP.patch b/meta/recipes-devtools/gcc/gcc/0012-export-CPP.patch
> deleted file mode 100644
> index 7e1ebef463a..00000000000
> --- a/meta/recipes-devtools/gcc/gcc/0012-export-CPP.patch
> +++ /dev/null
> @@ -1,50 +0,0 @@
> -From 20afebc61199cd74481b0b831c1b56465cd37fa0 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 20 Feb 2015 09:40:59 +0000
> -Subject: [PATCH] export CPP
> -
> -The OE environment sets and exports CPP as being the target gcc. When
> -building gcc-cross-canadian for a mingw targetted sdk, the following can be found
> -in build.x86_64-pokysdk-mingw32.i586-poky-linux/build-x86_64-linux/libiberty/config.log:
> -
> -configure:3641: checking for _FILE_OFFSET_BITS value needed for large files
> -configure:3666: gcc  -c -isystem/media/build1/poky/build/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe  conftest.c >&5
> -configure:3666: $? = 0
> -configure:3698: result: no
> -configure:3786: checking how to run the C preprocessor
> -configure:3856: result: x86_64-pokysdk-mingw32-gcc -E --sysroot=/media/build1/poky/build/tmp/sysroots/x86_64-nativesdk-mingw32-pokysdk-mingw32
> -configure:3876: x86_64-pokysdk-mingw32-gcc -E --sysroot=/media/build1/poky/build/tmp/sysroots/x86_64-nativesdk-mingw32-pokysdk-mingw32 conftest.c
> -configure:3876: $? = 0
> -
> -Note this is a *build* target (in build-x86_64-linux) so it should be
> -using the host "gcc", not x86_64-pokysdk-mingw32-gcc. Since the mingw32
> -headers are very different, using the wrong cpp is a real problem. It is leaking
> -into configure through the CPP variable. Ultimately this leads to build
> -failures related to not being able to include a process.h file for pem-unix.c.
> -
> -The fix is to ensure we export a sane CPP value into the build
> -environment when using build targets. We could define a CPP_FOR_BUILD value which may be
> -the version which needs to be upstreamed but for now, this fix is good enough to
> -avoid the problem.
> -
> -RP 22/08/2013
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - Makefile.in | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/Makefile.in b/Makefile.in
> -index 1d9c83cc566..11819667751 100644
> ---- a/Makefile.in
> -+++ b/Makefile.in
> -@@ -152,6 +152,7 @@ BUILD_EXPORTS = \
> -       AR="$(AR_FOR_BUILD)"; export AR; \
> -       AS="$(AS_FOR_BUILD)"; export AS; \
> -       CC="$(CC_FOR_BUILD)"; export CC; \
> -+      CPP="$(CC_FOR_BUILD) -E"; export CPP; \
> -       CFLAGS="$(CFLAGS_FOR_BUILD)"; export CFLAGS; \
> -       CONFIG_SHELL="$(SHELL)"; export CONFIG_SHELL; \
> -       CPP="$(CPP_FOR_BUILD)"; export CPP; \
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#170391): https://lists.openembedded.org/g/openembedded-core/message/170391
> Mute This Topic: https://lists.openembedded.org/mt/93524139/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

