Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89EF3EE14D0
	for <webhook@archiver.kernel.org>; Thu,  7 Sep 2023 08:50:07 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.8548.1694076598176206775
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Sep 2023 01:49:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Z13W1IVC;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-4ff8f2630e3so1095626e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Sep 2023 01:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694076596; x=1694681396; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vQ+d+Rwp2C1kPqSIW+JFpJkFeF8q/+tFdMAHQqH70rQ=;
        b=Z13W1IVC6/zUvsT3LE8C8kiSY739f5lr1wPFQJMb0Lpd+jg59Fuy+DyIlgbRJSrKou
         cWEVCboFzfdtQxJoyEO8GsIyxvxAFY4o6QiqhJO/hEauLNwiF1Pn7NMkMMA0GQ/Ad1BY
         Cr+BEl7luoCCLo2CqGJugvU1w4tV0Xhg8LOFfZUi+HfZjxs8oeh0THieXllsMFicK9MU
         xqlbf/dHNjRZuNOzyHIpOYIDCXzgzBNB4bHWtn9qVXEyQD1b6Y454VRWa0XW4D75cuaK
         NlPbEbcAipKbkYJFdFGq5wp55+DMFcp90Amxo/ph103PQA9TpJjparGau5pkqj8ZIO6A
         zdUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694076596; x=1694681396;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vQ+d+Rwp2C1kPqSIW+JFpJkFeF8q/+tFdMAHQqH70rQ=;
        b=BoOdpbEQXhbvKZY2pvbo3Oah5CaeHJWKbhWNth5sQm5ZPTGGBtcfuwiiBaqNAqqgX7
         2ELBZyLuvTdkcBOIMKFKQkBGQkTZdXobkraMPc7RY+GrGQSGHJ3WhF1j2NlfOl1k6nqH
         Sfudz2QNKjK4dd32lNGsZPJONcftYqREzF8UJNHTVekMdkMV/mdrM9nVE7qUszEdRPtr
         DjzoH1UvVOtsQ1r3IU1e605R9hEobvk01yMkuJ6/xVwaugP3QJ4xJWOu5KaeO5HZqSM1
         UZo9zYr784dE26UPYYD9XV8+3bIOpZ0D+VgAaS/Dq+l6bgg1s0BH/Y4X1QdzZZzt7W68
         kXPw==
X-Gm-Message-State: AOJu0YwHoyAnEMB4rUaX8r7IlONET5ZYk0gpT+mqB1LpBGFDcJgB8MT7
	0aF3qFPn8lJ//XmCx+8KVR9lApZTuyJUMxae6S4=
X-Google-Smtp-Source: AGHT+IFoiiXcZUyMADF4WQGlk3GQs6mQ8aiBhcpT3A9GFzjKpsZvIKV9LphrQ6BhfvAu9duBdRZjfwAxsE1Edx7t+Uc=
X-Received: by 2002:ac2:4d01:0:b0:500:7f51:d129 with SMTP id
 r1-20020ac24d01000000b005007f51d129mr3817234lfi.34.1694076596108; Thu, 07 Sep
 2023 01:49:56 -0700 (PDT)
MIME-Version: 1.0
References: <1694053444-23870-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1694053444-23870-1-git-send-email-wangmy@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 7 Sep 2023 10:49:44 +0200
Message-ID: <CANNYZj8iiVEcgiF9a627aFW_KUuvKuDe26j6qMRRY-LQRR=PJQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] librepo: upgrade 1.15.2 -> 1.16.0
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Sep 2023 08:50:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187364

Thank you, this looks good.

Alex

On Thu, 7 Sept 2023 at 04:24, wangmy <wangmy@fujitsu.com> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Changelog:
>  Implement OpenPGP using librpm API
>
> 0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch
> refreshed for 1.16.0
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  ...les-with-pkg-config-not-with-cmake-m.patch | 21 +++++++++++--------
>  .../{librepo_1.15.2.bb => librepo_1.16.0.bb}  |  2 +-
>  2 files changed, 13 insertions(+), 10 deletions(-)
>  rename meta/recipes-devtools/librepo/{librepo_1.15.2.bb => librepo_1.16.0.bb} (94%)
>
> diff --git a/meta/recipes-devtools/librepo/librepo/0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch b/meta/recipes-devtools/librepo/librepo/0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch
> index d61d8fbf85..a0a4d490f1 100644
> --- a/meta/recipes-devtools/librepo/librepo/0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch
> +++ b/meta/recipes-devtools/librepo/librepo/0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch
> @@ -12,16 +12,19 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
>  diff --git a/CMakeLists.txt b/CMakeLists.txt
> -index a45d5c4..40249e6 100644
> +index cd975a8..713cc87 100644
>  --- a/CMakeLists.txt
>  +++ b/CMakeLists.txt
> -@@ -32,7 +32,8 @@ PKG_CHECK_MODULES(GLIB2 glib-2.0 REQUIRED)
> - PKG_SEARCH_MODULE(LIBCRYPTO REQUIRED libcrypto openssl)
> - PKG_CHECK_MODULES(LIBXML2 libxml-2.0 REQUIRED)
> +@@ -35,7 +35,8 @@ PKG_CHECK_MODULES(LIBXML2 libxml-2.0 REQUIRED)
>   FIND_PACKAGE(CURL 7.52.0 REQUIRED)
> --FIND_PACKAGE(Gpgme REQUIRED)
> -+PKG_CHECK_MODULES(GPGME gpgme REQUIRED)
> -+set(GPGME_VANILLA_LIBRARIES ${GPGME_LIBRARIES})
>
> -
> - IF (WITH_ZCHUNK)
> + IF (USE_GPGME)
> +-    FIND_PACKAGE(Gpgme REQUIRED)
> ++    PKG_CHECK_MODULES(GPGME gpgme REQUIRED)
> ++    set(GPGME_VANILLA_LIBRARIES ${GPGME_LIBRARIES})
> + ELSE (USE_GPGME)
> +     PKG_CHECK_MODULES(RPM REQUIRED rpm>=4.18.0)
> + ENDIF (USE_GPGME)
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-devtools/librepo/librepo_1.15.2.bb b/meta/recipes-devtools/librepo/librepo_1.16.0.bb
> similarity index 94%
> rename from meta/recipes-devtools/librepo/librepo_1.15.2.bb
> rename to meta/recipes-devtools/librepo/librepo_1.16.0.bb
> index 995301d601..4710a6b72a 100644
> --- a/meta/recipes-devtools/librepo/librepo_1.15.2.bb
> +++ b/meta/recipes-devtools/librepo/librepo_1.16.0.bb
> @@ -10,7 +10,7 @@ SRC_URI = "git://github.com/rpm-software-management/librepo.git;branch=master;pr
>             file://0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch \
>             "
>
> -SRCREV = "1a0a5fd2b040d00872118b32d09d1f79730897a2"
> +SRCREV = "7c9af219abd49f8961542b7622fc82cfdaa572e3"
>
>  S = "${WORKDIR}/git"
>
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#187360): https://lists.openembedded.org/g/openembedded-core/message/187360
> Mute This Topic: https://lists.openembedded.org/mt/101207751/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

