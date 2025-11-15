Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65103CEBF86
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 20:15:31 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15880.1763237721758361452
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Nov 2025 12:15:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IM14syd6;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-30cce892b7dso1470599fac.1
        for <openembedded-core@lists.openembedded.org>; Sat, 15 Nov 2025 12:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763237721; x=1763842521; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y6gjGgFAsmdthajpTUEzc/17mAN8k5m+2GuQX653UNE=;
        b=IM14syd6MAB7QxpLCbH0D+V8K1AKfOeAHe+T88uZtbga2P/epCU4cLmuAzQs1Xk6v5
         jywaFih49yOCidkWGlRHOGncR2UWTw7Vgq2CAREM9qQe5TPfwwtaSkuRGPNdfPmR3EdT
         d6WmIEmcYPmyitVWJOrYBi/1AZnluPD48Izk7xBboLe6Any3cjjojzgu2QwdYcetQ2lO
         LoF2BeDjPQ4v4VFW8tQaqMnAs7iKYmAa3oh5Bl2CYVkFRkpgKJJHavIkJH5wLGdAbfO0
         mzspduRrXLZnWCJQwH1hkeh3x417tZgb5CAShcrxgcAhfDvYXB+qJDZG4nx2JjlANQKV
         /Q+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763237721; x=1763842521;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y6gjGgFAsmdthajpTUEzc/17mAN8k5m+2GuQX653UNE=;
        b=B/Id9OrL2XXsF2QxFNXmikceRVJTgsFrVi90f52JS5bXA1HK3nwmG4BY1cxNRZRMCC
         FuP8iEWXiR0kfuqp+YZHrSsQY0YbChfN7T2RVQqVyD8uVHqmFI5B6MWM+L6TGMcWNcje
         MSCZiBhtow4WxHEoYrrLrLbT4Qc3+VnTwquHqxJ9gSm2BwF7Q23uIrw/7BzfUYL1ieGi
         TYtLHgTQgAq7rxZRjCHHxZi03xbPigpBzT5WHv48GUHvPCY2TOrLt7deuOu0UcGbM5om
         ZDjtef4abNeEbx05lrY7aN8A2I+vhQcC+FJeYzHdZhcOEgTTb+4vYXqhlbZIHhMN09GF
         kiBA==
X-Gm-Message-State: AOJu0YzfwP3x3uof5ZqQG3NVOb9nEi8XULLDdxT4GwWsIjRp55X944dN
	sjCe9ZcmbfXF4SAt5R1hHg7oRbxFlljqfLYoFESfB23c7V+aKciqHrEuA9oSOGECz2+/8kZ2wCO
	SU1TKEZWHqR7U4Xx1oMlwFyOKTVYlUkw=
X-Gm-Gg: ASbGncumwTBY9VhbY7Y3SEb7z7gIJWeECjsc7+7NiVzRY8RtwDIHPpPplg3ifoezCZ5
	r3YUz+jW7VSmo/1WCHX3W7gIu1fVFsjWp+jzW9JVJN65r5b6i7kOO2Hu7qTyXWRs1rtMP/7QHO6
	9sw7Zft7vclqp+5rwfq/k+UhK+wb5Qk6sTECgerBGVptt9W6hHAfKTLvq5c8jZljE7b3Mg/X7tC
	UlHgJJaWdP/4RLMcoiKF9GMF2njsWVum/iG2/NHPI/YR7xR4dC/N0Yg1HWCNw==
X-Google-Smtp-Source: AGHT+IGuKXEQjF3SLYdxM40455YLKDlsHSsxucdnwj6Fxvs3ysQAyyDbl2k8VKR0tQ+hyXC0ObinMmg0uTMXDVsQuc0=
X-Received: by 2002:a05:6871:22c6:b0:3e8:8e88:3e78 with SMTP id
 586e51a60fabf-3e88e8842c8mr1179659fac.3.1763237720942; Sat, 15 Nov 2025
 12:15:20 -0800 (PST)
MIME-Version: 1.0
References: <1876328ECE5FEE71.660630@lists.openembedded.org>
In-Reply-To: <1876328ECE5FEE71.660630@lists.openembedded.org>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Sun, 16 Nov 2025 09:15:10 +1300
X-Gm-Features: AWmQ_bmKlyQECNL94Sh8ezs8Xv1oYj-MD0-sN06MXKjVlzm1GrPO_mqkEV7fBP8
Message-ID: <CADySD0FSgoO8RHnQHt3Eqv5b-SOdbQ3Y7edYPpGcSD79jgRMfQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2] nghttp2: upgrade 1.66.0 -> 1.68.0
To: ankur.tyagi85@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Nov 2025 20:15:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226465

ping, please let me know if any other issue with this patch.

On Sun, Nov 9, 2025 at 2:31=E2=80=AFPM Ankur Tyagi via lists.openembedded.o=
rg
<ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
>
> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>
> Changelog:
> https://github.com/nghttp2/nghttp2/releases/tag/v1.67.0
> https://github.com/nghttp2/nghttp2/releases/tag/v1.67.1
> https://github.com/nghttp2/nghttp2/releases/tag/v1.68.0
>
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  ...xt-Fix-NGHTTP2_CONFIG_INSTALL_DIR-pa.patch | 26 +++++++++++++++++++
>  .../{nghttp2_1.66.0.bb =3D> nghttp2_1.68.0.bb}  |  8 ++++--
>  2 files changed, 32 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-support/nghttp2/nghttp2/0001-lib-CMakeLi=
sts.txt-Fix-NGHTTP2_CONFIG_INSTALL_DIR-pa.patch
>  rename meta/recipes-support/nghttp2/{nghttp2_1.66.0.bb =3D> nghttp2_1.68=
.0.bb} (62%)
>
> diff --git a/meta/recipes-support/nghttp2/nghttp2/0001-lib-CMakeLists.txt=
-Fix-NGHTTP2_CONFIG_INSTALL_DIR-pa.patch b/meta/recipes-support/nghttp2/ngh=
ttp2/0001-lib-CMakeLists.txt-Fix-NGHTTP2_CONFIG_INSTALL_DIR-pa.patch
> new file mode 100644
> index 0000000000..32adb05e07
> --- /dev/null
> +++ b/meta/recipes-support/nghttp2/nghttp2/0001-lib-CMakeLists.txt-Fix-NG=
HTTP2_CONFIG_INSTALL_DIR-pa.patch
> @@ -0,0 +1,26 @@
> +From eb5812d018eb96284aa6ef82569d0b6b75bcd020 Mon Sep 17 00:00:00 2001
> +From: Ankur Tyagi <ankur.tyagi85@gmail.com>
> +Date: Sun, 9 Nov 2025 12:45:25 +1300
> +Subject: [PATCH] lib/CMakeLists.txt: Fix NGHTTP2_CONFIG_INSTALL_DIR path
> +
> +Remove hard coded path to fix installation on 64-bit arch.
> +
> +Upstream-Status: Submitted [https://github.com/nghttp2/nghttp2/pull/2551=
]
> +Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> +---
> + lib/CMakeLists.txt | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/lib/CMakeLists.txt b/lib/CMakeLists.txt
> +index 98e3dbe7..3b6a4400 100644
> +--- a/lib/CMakeLists.txt
> ++++ b/lib/CMakeLists.txt
> +@@ -51,7 +51,7 @@ set(NGHTTP2_GENERATED_DIR "${CMAKE_CURRENT_BINARY_DIR}=
/generated")
> + set(NGHTTP2_VERSION_CONFIG "${NGHTTP2_GENERATED_DIR}/${PROJECT_NAME}Con=
figVersion.cmake")
> + set(NGHTTP2_PROJECT_CONFIG "${NGHTTP2_GENERATED_DIR}/${PROJECT_NAME}Con=
fig.cmake")
> + set(NGHTTP2_TARGETS_EXPORT_NAME "${PROJECT_NAME}Targets")
> +-set(NGHTTP2_CONFIG_INSTALL_DIR "lib/cmake/${PROJECT_NAME}")
> ++set(NGHTTP2_CONFIG_INSTALL_DIR "${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT=
_NAME}")
> + set(NGHTTP2_NAMESPACE "${PROJECT_NAME}::")
> + set(NGHTTP2_VERSION ${PROJECT_VERSION})
> +
> diff --git a/meta/recipes-support/nghttp2/nghttp2_1.66.0.bb b/meta/recipe=
s-support/nghttp2/nghttp2_1.68.0.bb
> similarity index 62%
> rename from meta/recipes-support/nghttp2/nghttp2_1.66.0.bb
> rename to meta/recipes-support/nghttp2/nghttp2_1.68.0.bb
> index 49d6d7e632..dae7285c1e 100644
> --- a/meta/recipes-support/nghttp2/nghttp2_1.66.0.bb
> +++ b/meta/recipes-support/nghttp2/nghttp2_1.68.0.bb
> @@ -4,8 +4,12 @@ SECTION =3D "libs"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D764abdf30b2eadd37ce47dcbce0ea=
1ec"
>
> -SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/nghttp2-${PV}.tar.xz"
> -SRC_URI[sha256sum] =3D "00ba1bdf0ba2c74b2a4fe6c8b1069dc9d82f82608af24442=
d430df97c6f9e631"
> +SRC_URI =3D "\
> +    ${GITHUB_BASE_URI}/download/v${PV}/nghttp2-${PV}.tar.xz \
> +    file://0001-lib-CMakeLists.txt-Fix-NGHTTP2_CONFIG_INSTALL_DIR-pa.pat=
ch \
> +"
> +
> +SRC_URI[sha256sum] =3D "5511d3128850e01b5b26ec92bf39df15381c767a63441438=
b25ad6235def902c"
>
>  inherit cmake manpages python3native github-releases
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#226087): https://lists.openembedded.org/g/openembedde=
d-core/message/226087
> Mute This Topic: https://lists.openembedded.org/mt/116197206/3619737
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [an=
kur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

