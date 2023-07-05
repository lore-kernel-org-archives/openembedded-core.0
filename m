Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6516EB64DD
	for <webhook@archiver.kernel.org>; Wed,  5 Jul 2023 14:48:46 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web11.19637.1688568523492838891
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jul 2023 07:48:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=LIdD6LhJ;
 spf=pass (domain: gmail.com, ip: 209.85.167.182, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3a3b7f992e7so1798508b6e.2
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Jul 2023 07:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688568523; x=1691160523;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hT27H0RyHAXkRaYaQAYjamP9lbGdQsQu8tU+YuAY3vA=;
        b=LIdD6LhJNqf5EIC6PZ9DwJNtNMtogx6IN9QaIlra1cBeNs9Ycx7Iw5dmQ+Vcpmt0Sx
         DEOrR+BRxOpsngG+W6C6Oh/XWZdoHpiGQXqZNRWT2eo6DLprZED/2dTFx17G7y4887Ys
         Vbc1d4wDFL+0ohQLhFs/DVg8bmlhYu/xY2m+MxJA1nbe0gBM6qmMKZ8Kv93uuCuO33ha
         ihFfPHAO0D0oMOKyjuc1YYzjxv/b5E/R8BPoGbbmwZ2eJCwwgAKB1Qvvykf8EpQ1o2e2
         +20XtTCvT5edrKhwPw7NPyba5aGFbu6QI/t1/6xpe/xfHy0PtgPA/rdE9Zyo6WY9Sz72
         KXxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688568523; x=1691160523;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hT27H0RyHAXkRaYaQAYjamP9lbGdQsQu8tU+YuAY3vA=;
        b=YDHT8yamJ5JDoOq6MXlQ6fwKdkxXMa6wlXi9CYhS+W2xqjM6vx801HAnxN7PvAdnrT
         DJ4+Ww1SG9gkMiU361xTxCPT0MfOUT8bT285Wa6I3Sb+UxKtVi7y3eAbgiNKQ54/pcEm
         1KJvgJAQM1cPS93oNRga8ktsMgCe2sr7bA5NAklro5H6UT9sBTFVtbx+c+GmdCfkVrp8
         VKq1K6zNCBjGYrWhVGcqz7sYPGRFSLgW/bnhev7ETw7xHCyHcUPfyQSoc4ACDhfPnBHe
         WncO8YXTBhA/BiOzFPJOygslhUL6WrhIw9fMTmX3QL7paoYQCnqXh+46Ko1bFUDPl1xX
         0NnA==
X-Gm-Message-State: AC+VfDxmlYxmXR+89Fd8IfVwvJpxEEkFpx7j6nRXk4Kb3vpOTZfW/8C4
	uAqpjsDRub4/PpiHa4CGju8QyWI2ljCx14Y3TlI=
X-Google-Smtp-Source: ACHHUZ6LEsqSApD60Fe/ykr5+ceb2cwtKtMhWPrShMX8AM05GNlk+bfdJPe0ibLTriCdy/WUIdnJylx2nC0vwmz+og8=
X-Received: by 2002:a05:6808:1910:b0:3a1:dc2a:a1dd with SMTP id
 bf16-20020a056808191000b003a1dc2aa1ddmr16872622oib.47.1688568522524; Wed, 05
 Jul 2023 07:48:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230704102307.3654880-1-ross.burton@arm.com>
In-Reply-To: <20230704102307.3654880-1-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 5 Jul 2023 07:48:16 -0700
Message-ID: <CAMKF1srqdCHyyOcpZzzhvB+=mAE+38E4hYKhwG-a+6LSf7bpTQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libjpeg-turbo: upgrade to 3.0.0
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org, nd@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jul 2023 14:48:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183889

I wonder of this failure is related to this
https://errors.yoctoproject.org/Errors/Details/711770/

On Tue, Jul 4, 2023 at 3:23=E2=80=AFAM Ross Burton <ross.burton@arm.com> wr=
ote:
>
> From: Ross Burton <ross.burton@arm.com>
>
> Remove 0001-libjpeg-turbo-fix-package_qa-error.patch, doesn't appear to
> be needed anymore.
>
> Use the full upstream license for LICENSE, and change LIC_FILES_CHKSUM
> to point at just the license overview in LICENSE.md.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  ...1-libjpeg-turbo-fix-package_qa-error.patch | 32 -------------------
>  ...urbo_2.1.5.1.bb =3D> libjpeg-turbo_3.0.0.bb} | 14 +++-----
>  2 files changed, 5 insertions(+), 41 deletions(-)
>  delete mode 100644 meta/recipes-graphics/jpeg/files/0001-libjpeg-turbo-f=
ix-package_qa-error.patch
>  rename meta/recipes-graphics/jpeg/{libjpeg-turbo_2.1.5.1.bb =3D> libjpeg=
-turbo_3.0.0.bb} (83%)
>
> diff --git a/meta/recipes-graphics/jpeg/files/0001-libjpeg-turbo-fix-pack=
age_qa-error.patch b/meta/recipes-graphics/jpeg/files/0001-libjpeg-turbo-fi=
x-package_qa-error.patch
> deleted file mode 100644
> index fab5109f831..00000000000
> --- a/meta/recipes-graphics/jpeg/files/0001-libjpeg-turbo-fix-package_qa-=
error.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -From 5cf847b5bef8dc3f9f89bd09dd5af4e6603f393c Mon Sep 17 00:00:00 2001
> -From: Changqing Li <changqing.li@windriver.com>
> -Date: Mon, 27 Aug 2018 16:10:55 +0800
> -Subject: [PATCH] libjpeg-turbo: fix package_qa error
> -
> -Fix package qa errors like below:
> -libjpeg.so.62.3.0 contains probably-redundant RPATH /usr/lib [useless-rp=
aths]
> -usr/bin/cjpeg contains probably-redundant RPATH /usr/lib
> -
> -Upstream-Status: Inappropriate [oe-specific]
> -
> -Signed-off-by: Changqing Li <changqing.li@windriver.com>
> -Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> ----
> - CMakeLists.txt | 4 ----
> - 1 file changed, 4 deletions(-)
> -
> -diff --git a/CMakeLists.txt b/CMakeLists.txt
> -index 2bc3458..ea3041e 100644
> ---- a/CMakeLists.txt
> -+++ b/CMakeLists.txt
> -@@ -191,10 +191,6 @@ endif()
> - report_option(ENABLE_SHARED "Shared libraries")
> - report_option(ENABLE_STATIC "Static libraries")
> -
> --if(ENABLE_SHARED)
> --  set(CMAKE_INSTALL_RPATH ${CMAKE_INSTALL_FULL_LIBDIR})
> --endif()
> --
> - if(WITH_JPEG8 OR WITH_JPEG7)
> -   set(WITH_ARITH_ENC 1)
> -   set(WITH_ARITH_DEC 1)
> diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb b/meta/r=
ecipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb
> similarity index 83%
> rename from meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb
> rename to meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb
> index e086830c021..146d80008c5 100644
> --- a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb
> +++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb
> @@ -2,19 +2,15 @@ SUMMARY =3D "Hardware accelerated JPEG compression/deco=
mpression library"
>  DESCRIPTION =3D "libjpeg-turbo is a derivative of libjpeg that uses SIMD=
 instructions (MMX, SSE2, NEON) to accelerate baseline JPEG compression and=
 decompression"
>  HOMEPAGE =3D "http://libjpeg-turbo.org/"
>
> -LICENSE =3D "BSD-3-Clause"
> -LIC_FILES_CHKSUM =3D "file://cdjpeg.h;endline=3D13;md5=3D8a61af33cc1c681=
cd5cc297150bbb5bd \
> -                    file://jpeglib.h;endline=3D16;md5=3D52b5eaade8d5b6a4=
52a7693dfe52c084 \
> -                    file://djpeg.c;endline=3D11;md5=3D510b386442ab6a27ee=
241fc5669bc5ea \
> -                    "
> +LICENSE =3D "IJG & BSD-3-Clause & Zlib"
> +LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D2a8e0d8226a102f07ab63ed7fd=
6ce155"
> +
>  DEPENDS:append:x86-64:class-target =3D " nasm-native"
>  DEPENDS:append:x86:class-target =3D " nasm-native"
>
> -SRC_URI =3D "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
> -           file://0001-libjpeg-turbo-fix-package_qa-error.patch \
> -           "
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
>
> -SRC_URI[sha256sum] =3D "2fdc3feb6e9deb17adec9bafa3321419aa19f8f4e5dea7bf=
8486844ca22207bf"
> +SRC_URI[sha256sum] =3D "c77c65fcce3d33417b2e90432e7a0eb05f59a7fff884022a=
9d931775d583bfaa"
>  UPSTREAM_CHECK_URI =3D "http://sourceforge.net/projects/libjpeg-turbo/fi=
les/"
>  UPSTREAM_CHECK_REGEX =3D "/libjpeg-turbo/files/(?P<pver>(\d+[\.\-_]*)+)/=
"
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#183821): https://lists.openembedded.org/g/openembedde=
d-core/message/183821
> Mute This Topic: https://lists.openembedded.org/mt/99943765/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

