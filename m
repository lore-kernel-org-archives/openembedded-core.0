Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D56D8C07E98
	for <webhook@archiver.kernel.org>; Wed, 29 Nov 2023 04:22:50 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web11.24176.1701231765636157937
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Nov 2023 20:22:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hrCCYCLn;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-1fa486a0e10so1939013fac.3
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 20:22:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701231765; x=1701836565; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RHNHZ609O66tVkYUyDfVbtprSXXVa3r3D/+AhA3d6WE=;
        b=hrCCYCLnB4kQSB/aOnBCu6b17za7aakTAqUIWnfwJGSTBj5++xKljO4X1yX/XN5PsD
         iNuyRFdSdQqb11PphbfgWUdhVPzukZ0GUeUPIVJaCIiKeeWZjYuXvbsauSOkUBQ/88dj
         NT5ZRbeXwrTSZi7E5BxX7FwdZaqL9/snpH8/QiixKViYhps6oCP+RmfVV1Nbq5OvR90z
         pJTkEpNuPlRNqg7/HrseQv8O+UmXPAAL0OVETajwr234bfbbCSdFvn62/8JgVfjPMHTu
         Zk6QzifChDGkCMTINuX0qRJmNqmkzk6fVRTOG6XWoJ7hvQnJTITvRduzfyziLZGpQHzV
         XR8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701231765; x=1701836565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RHNHZ609O66tVkYUyDfVbtprSXXVa3r3D/+AhA3d6WE=;
        b=FwvCPPtinWUkaZGOvCWTp+Sszb17eTCtCZdogHrgu+FWQcL+Prq4L9QSq+4RAsBPqd
         AphHM8Rk1QaK8RQZXl6c9NYHU1WkB5xfZyxWxTGZhyzy8xyZMYt02+KZEoSno1MykxVK
         uw1fPOcRp3Mz7fs8CPCcTT+S8u3nw8mdNBQYK9ihYhB8hHIfteun9X06p++BX1kJwElc
         kvhgRgwPVCa04ZgHGWKHlanxy8DV48Niri4HEjw3SECGMJJayhAvSqbBaqHmOuKmk2ZZ
         YSlfUSEQZi3wKyntF1iT7xleFG3r5lmmyh2PNUNATCTr7V6MhLfkN4F+qJoYzVUFtpof
         dwzQ==
X-Gm-Message-State: AOJu0YzQFOdS8xKUZ6GK+BVBBNNBKyS/hqjosHikhYhOo5g2LHotdGNj
	kEmScDzLuk/fB+rdDgkgeRrZsxURAl/cMGcoZb8=
X-Google-Smtp-Source: AGHT+IFCY9tuVXd2gATRh8H6uthDumUwSvWv+y01OXzfM98H66f4NxFFfNcjU1MfUUowJ1nzfNojeDaHMBldWSI9Hzc=
X-Received: by 2002:a05:6871:5824:b0:1fa:26b7:af18 with SMTP id
 oj36-20020a056871582400b001fa26b7af18mr15213971oac.17.1701231764742; Tue, 28
 Nov 2023 20:22:44 -0800 (PST)
MIME-Version: 1.0
References: <20231127101751.3187950-1-alex@linutronix.de> <20231127101751.3187950-11-alex@linutronix.de>
In-Reply-To: <20231127101751.3187950-11-alex@linutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 28 Nov 2023 20:22:18 -0800
Message-ID: <CAMKF1sqQv078nu1BD91+Lx=c8xSS+7J=MND55ocWEuEDucNT0Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 11/19] virglrenderer: upgrade 0.10.4 -> 1.0.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 04:22:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191426

This fails to compile with clang as it finds undefined behavior
similar to vim -
https://github.com/vim/vim/commit/d315cf551f1d15609c4d7cf724e471de55f5cdac

| x86_64-yoe-linux-clang -target x86_64-yoe-linux -m64 -march=3Dcore2
-mtune=3Dcore2 -msse3 -mfpmath=3Dsse -mlittle-endian --dyld-prefix=3D/usr
-Qunused-arguments -fstack-protector-strong -O2 -D_F
ORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-security
--sysroot=3D/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux/virglrender=
er/1.0.0/recipe-sysroot
-Ivtest/virgl_test_serve
r.p -Ivtest -I../git/vtest -I../git/src/gallium/include
-I../git/src/gallium/auxiliary -I../git/src/gallium/auxiliary/util -I.
-I../git -Isrc -I../git/src -I../git/src/venus -I../git/src/d
rm -Isrc/mesa -I../git/src/mesa -I../git/src/mesa/compat
-I../git/src/mesa/pipe -I../git/src/mesa/util
-fdiagnostics-color=3Dalways -DNDEBUG -D_FILE_OFFSET_BITS=3D64 -Wall
-Winvalid-pch -Wextr
a -Wpedantic -std=3Dgnu11 -Werror=3Dimplicit-function-declaration
-Werror=3Dmissing-prototypes -Werror=3Dpedantic -Wmissing-prototypes
-Werror=3Dincompatible-pointer-types -Werror=3Dint-to-pointer-cas
t -Werror=3Dswitch -Wno-overlength-strings
-Wno-missing-field-initializers -fvisibility=3Dhidden -imacros
/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux/virglrenderer/1.0.0/bui=
ld/config.h
-DHAVE_CONFIG_H=3D1 -O2 -pipe -g -feliminate-unused-debug-types
-fmacro-prefix-map=3D/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux/vi=
rglrenderer/1.0.0/git=3D/usr/src/debug/virglrenderer/1
.0.0 -fdebug-prefix-map=3D/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-lin=
ux/virglrenderer/1.0.0/git=3D/usr/src/debug/virglrenderer/1.0.0
-fmacro-prefix-map=3D/mnt/b/yoe/master/build/tmp/work/c
ore2-64-yoe-linux/virglrenderer/1.0.0/build=3D/usr/src/debug/virglrenderer/=
1.0.0
-fdebug-prefix-map=3D/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux/vi=
rglrenderer/1.0.0/build=3D/usr/src/deb
ug/virglrenderer/1.0.0
-fdebug-prefix-map=3D/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux/vi=
rglrenderer/1.0.0/recipe-sysroot=3D
-fmacro-prefix-map=3D/mnt/b/yoe/master/build/tmp/work/core2-
64-yoe-linux/virglrenderer/1.0.0/recipe-sysroot=3D
-fdebug-prefix-map=3D/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux/vi=
rglrenderer/1.0.0/recipe-sysroot-native=3D
-pthread -MD -MQ vtest/vi
rgl_test_server.p/vtest_server.c.o -MF
vtest/virgl_test_server.p/vtest_server.c.o.d -o
vtest/virgl_test_server.p/vtest_server.c.o -c
../git/vtest/vtest_server.c
| ../git/vtest/vtest_server.c:244:2: error: embedding a directive
within macro arguments has undefined behavior
[-Werror,-Wembedded-directive]
|   244 | #ifdef ENABLE_VENUS
|       |  ^
| ../git/vtest/vtest_server.c:246:2: error: embedding a directive
within macro arguments has undefined behavior
[-Werror,-Wembedded-directive]
|   246 | #endif
|       |  ^
| 2 errors generated.

On Mon, Nov 27, 2023 at 2:18=E2=80=AFAM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> venus (virtual vulkan support) is no longer experimental.
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  ...1-meson.build-use-python3-directly-for-python.patch | 10 +++++-----
>  ...{virglrenderer_0.10.4.bb =3D> virglrenderer_1.0.0.bb} |  8 ++++----
>  2 files changed, 9 insertions(+), 9 deletions(-)
>  rename meta/recipes-graphics/virglrenderer/{virglrenderer_0.10.4.bb =3D>=
 virglrenderer_1.0.0.bb} (84%)
>
> diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson=
.build-use-python3-directly-for-python.patch b/meta/recipes-graphics/virglr=
enderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.patc=
h
> index 8230ba588b5..06379ee7166 100644
> --- a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-=
use-python3-directly-for-python.patch
> +++ b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-=
use-python3-directly-for-python.patch
> @@ -1,4 +1,4 @@
> -From c853c9e5c44f1b23a15a7ba629ee02f7d8ec23a0 Mon Sep 17 00:00:00 2001
> +From 2afe24fc95dbb89e99df29ccbe73afa835f58202 Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Mon, 6 Jan 2020 12:44:42 +0100
>  Subject: [PATCH] meson.build: use 'python3' directly for python
> @@ -14,15 +14,15 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.=
com>
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/meson.build b/meson.build
> -index 13d95bb..b241eb2 100644
> +index de6d16b5..79cedbf6 100644
>  --- a/meson.build
>  +++ b/meson.build
> -@@ -64,7 +64,7 @@ flags =3D [
> +@@ -68,7 +68,7 @@ flags =3D [
>
>   add_project_arguments(cc.get_supported_arguments(flags), language : 'c'=
)
>
>  -prog_python =3D import('python').find_installation('python3')
>  +prog_python =3D 'python3'
>
> - libdrm_dep =3D dependency('libdrm', version : '>=3D2.4.50')
> - thread_dep =3D dependency('threads')
> + not_found =3D dependency('', required: false)
> + libdrm_dep =3D dependency('libdrm', version : '>=3D2.4.50', required: g=
et_option('drm').enabled() or get_option('venus'))
> diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_0.10.4.bb =
b/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.0.bb
> similarity index 84%
> rename from meta/recipes-graphics/virglrenderer/virglrenderer_0.10.4.bb
> rename to meta/recipes-graphics/virglrenderer/virglrenderer_1.0.0.bb
> index f76e7cb1b94..ffe30a9c525 100644
> --- a/meta/recipes-graphics/virglrenderer/virglrenderer_0.10.4.bb
> +++ b/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.0.bb
> @@ -9,8 +9,8 @@ LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc81c08eeefd9418fca8f88309a76d=
b10"
>
>  DEPENDS =3D "libdrm libepoxy virtual/egl virtual/libgbm"
> -SRCREV =3D "88b9fe3bfc64b23a701e4875006dbc0e769f14f6"
> -SRC_URI =3D "git://gitlab.freedesktop.org/virgl/virglrenderer.git;branch=
=3Dmaster;protocol=3Dhttps \
> +SRCREV =3D "9c9d55ecbe502e0d71ee99529709efcca69aac42"
> +SRC_URI =3D "git://gitlab.freedesktop.org/virgl/virglrenderer.git;branch=
=3Dmain;protocol=3Dhttps \
>             file://0001-meson.build-use-python3-directly-for-python.patch=
 \
>             "
>
> @@ -18,9 +18,9 @@ S =3D "${WORKDIR}/git"
>
>  inherit meson pkgconfig features_check
>
> -PACKAGECONFIG ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'vulkan', 'v=
enus-experimental', '', d)}"
> +PACKAGECONFIG ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'vulkan', 'v=
enus', '', d)}"
>
> -PACKAGECONFIG[venus-experimental] =3D "-Dvenus-experimental=3Dtrue,-Dven=
us-experimental=3Dfalse,vulkan-loader vulkan-headers"
> +PACKAGECONFIG[venus] =3D "-Dvenus=3Dtrue,-Dvenus=3Dfalse,vulkan-loader v=
ulkan-headers"
>  PACKAGECONFIG[va] =3D "-Dvideo=3Dtrue,-Dvideo=3Dfalse,libva"
>  PACKAGECONFIG[render-server] =3D "-Drender-server=3Dtrue,-Drender-server=
=3Dfalse"
>  PACKAGECONFIG[drm-msm-experimental] =3D "-Ddrm-msm-experimental=3Dtrue,-=
Ddrm-msm-experimental=3Dfalse"
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191278): https://lists.openembedded.org/g/openembedde=
d-core/message/191278
> Mute This Topic: https://lists.openembedded.org/mt/102826378/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

