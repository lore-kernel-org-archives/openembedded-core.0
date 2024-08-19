Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21426C52D7C
	for <webhook@archiver.kernel.org>; Mon, 19 Aug 2024 08:57:56 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.206386.1724057871674274897
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Aug 2024 01:57:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fmmUxwfW;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52efdf02d13so5335297e87.2
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Aug 2024 01:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724057870; x=1724662670; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SwswWssawzKEoFUCVHH+8BAaCmM3WO8yJoEU9tL4X6o=;
        b=fmmUxwfWKrv05DxJHZhZxSnr6PitE6c9efakMAMylu3SrbFXrcfnhXgXolVw9SFZ6B
         daKeb9EPAvdW4f/uMlAw5wy7kNqisFglSp1/g5d2JNCyvsWGK+8UMm7nILLnOJOKfstM
         GlP7PF72MpSAJZYODksonx96kFV7+pyeum50wnK7JRVyFHR2K+VCIdP3Ca+w/Iy69nM2
         KXKEyx8XrcXuvwGX2d5sSeRMnAO6uhVagMPlAmaq+XRhc3vyUwJoGP9rYGBtAox6NL75
         3JzWrRCWeCtlJ6fQAq1eQWu13ydzBvkCgW3rQ0D/4/01MAyww2aqQ5WjItOUDIWEjMSx
         IvkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724057870; x=1724662670;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SwswWssawzKEoFUCVHH+8BAaCmM3WO8yJoEU9tL4X6o=;
        b=dUwZjmWND0heX6YE3bOfGAcl5j9xfpn7rGT6LyWDEAHUf+jVjujNNfzosh/JOl7cvf
         DP+w4SnKPDUAmPAzdx0LBpFYOBDGUYDqQIOn89rGklBCoruWZD0U13c3ySnezjEL0Vbo
         xokTeL8aENhr9D0VDRpyvarfamziv8cc4C7ePxzGti7G8h3g0k52d+VQa+BqUccZt9LK
         f9ZTLcBJQHR69CMs8mB7gZNfwu3UcHUZezQmIuyDBAB80mu8Yq8777jrJD+A2Wnub/2h
         6EftJEoi1/zMdK8dV4I67NWWcg2amOsiaWJbMgPGqRWgJYNa815mAMon7XC/PEOYiMMH
         zC+A==
X-Gm-Message-State: AOJu0YynvzVunvPTp05y9UqJ2+vyxuQlNgZp0bcf9UBmB3zhRupY7Rih
	pYlObbgRiEq02v30FfPWx5w3nypNgs511WGqbFROmrrR5kz7TauYx9r30ahA16F4MFoUzTfe0im
	o7miKH64hQY8Dv7g7WNVKqvecqe0=
X-Google-Smtp-Source: AGHT+IE+wGI8PSySsNnOgpa0+nPIhQH55u/196pMRD8SUeAPb3ZcJ2uTUu9TcruqgVCyXT+RS+AjjvXqX4jIUyby2/Q=
X-Received: by 2002:a05:6512:3b8b:b0:52e:fa5f:b6a7 with SMTP id
 2adb3069b0e04-5331c6a0569mr7402042e87.13.1724057869235; Mon, 19 Aug 2024
 01:57:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240818164844.2738771-1-f_l_k@t-online.de>
In-Reply-To: <20240818164844.2738771-1-f_l_k@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 19 Aug 2024 10:57:38 +0200
Message-ID: <CANNYZj9x08BYKYpxpL-djuBg5C_rLqfJ-qmJ19_kp0+D-nKB6Q@mail.gmail.com>
Subject: Re: [RFC][oe-core][PATCH 1/2] mesa: update 24.1.4 -> 24.2.0
To: f_l_k@t-online.de
Cc: openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Aug 2024 08:57:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203493

Has anything changes in this release w.r.t intel drivers? Do they
still requiure bits of meta-clang?

Given that we're now two major releases behind, I just do not think
that one vendor should be holding everyone else hostage to their
'special requirements'. I still think it's better to disable Intel
drivers, and move on. The vendor can re-enable them through their BSP
layer, and allocate resources towards integrating clang into core if
they so wish. Can this be raised privately with them or in a TSC
meeting?

Alex

On Sun, 18 Aug 2024 at 18:47, Markus Volk via lists.openembedded.org
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:
>
> - Remove 0001-amd-Include-missing-llvm-IR-header-Module.h.patch -> merged
> - INSANE_SKIP dev-so. All .so files that are installed in ${libdir}/dri
>   are now links to libdril_dri.so, but they should still not be part of
>   the dev package, I assume?
> - add PACKAGE for mesa-gallium-drivers and install libgallium-24.2.0.so
> - add python3-pyyaml-native-dependency
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  ...lude-missing-llvm-IR-header-Module.h.patch | 41 -------------------
>  .../{mesa-gl_24.1.4.bb =3D> mesa-gl_24.2.0.bb}  |  0
>  meta/recipes-graphics/mesa/mesa.inc           |  9 ++--
>  .../mesa/{mesa_24.1.4.bb =3D> mesa_24.2.0.bb}   |  0
>  4 files changed, 5 insertions(+), 45 deletions(-)
>  delete mode 100644 meta/recipes-graphics/mesa/files/0001-amd-Include-mis=
sing-llvm-IR-header-Module.h.patch
>  rename meta/recipes-graphics/mesa/{mesa-gl_24.1.4.bb =3D> mesa-gl_24.2.0=
.bb} (100%)
>  rename meta/recipes-graphics/mesa/{mesa_24.1.4.bb =3D> mesa_24.2.0.bb} (=
100%)
>
> diff --git a/meta/recipes-graphics/mesa/files/0001-amd-Include-missing-ll=
vm-IR-header-Module.h.patch b/meta/recipes-graphics/mesa/files/0001-amd-Inc=
lude-missing-llvm-IR-header-Module.h.patch
> deleted file mode 100644
> index 82ad88a079..0000000000
> --- a/meta/recipes-graphics/mesa/files/0001-amd-Include-missing-llvm-IR-h=
eader-Module.h.patch
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -From 777d69cf15b80ab1f109a4936d6e4801c4b0e0f3 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Mon, 1 Jul 2024 23:09:29 -0700
> -Subject: [PATCH] amd: Include missing llvm IR header Module.h
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -With LLVM-19, Module.h header is not being pulled, which results in
> -compile errors e.g.
> -
> -src/amd/llvm/ac_llvm_helper.cpp:102:10: error: no matching function for =
call to =E2=80=98unwrap(LLVMOpaqueModule*&)=E2=80=99
> -  102 |    unwrap(module)->setTargetTriple(TM->getTargetTriple().getTrip=
le());
> -      |    ~~~~~~^~~~~~~~
> -In file included from /mnt/b/yoe/master/build/tmp/work/x86_64-linux/mesa=
-native/24.0.7/recipe-sysroot-native/usr/include/llvm/IR/Type.h:18,
> -                 from /mnt/b/yoe/master/build/tmp/work/x86_64-linux/mesa=
-native/24.0.7/recipe-sysroot-native/usr/include/llvm/IR/DerivedTypes.h:23,
> -                 from /mnt/b/yoe/master/build/tmp/work/x86_64-linux/mesa=
-native/24.0.7/recipe-sysroot-native/usr/include/llvm/IR/InstrTypes.h:26,
> -                 from /mnt/b/yoe/master/build/tmp/work/x86_64-linux/mesa=
-native/24.0.7/recipe-sysroot-native/usr/include/llvm/Analysis/TargetLibrar=
yInfo.h:14,
> -                 from ../mesa-24.0.7/src/amd/llvm/ac_llvm_helper.cpp:8:
> -
> -Its getting the definition from llvm/IR/Type.h instead of Module.h and c=
aused
> -confusion to compiler
> -
> -Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/m=
erge_requests/29993]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - src/amd/llvm/ac_llvm_helper.cpp | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/src/amd/llvm/ac_llvm_helper.cpp b/src/amd/llvm/ac_llvm_help=
er.cpp
> -index 5d065279ad1..af4a50f8409 100644
> ---- a/src/amd/llvm/ac_llvm_helper.cpp
> -+++ b/src/amd/llvm/ac_llvm_helper.cpp
> -@@ -8,6 +8,7 @@
> - #include <llvm/Analysis/TargetLibraryInfo.h>
> - #include <llvm/IR/IRBuilder.h>
> - #include <llvm/IR/LegacyPassManager.h>
> -+#include <llvm/IR/Module.h>
> - #include <llvm/IR/Verifier.h>
> - #include <llvm/Target/TargetMachine.h>
> - #include <llvm/MC/MCSubtargetInfo.h>
> diff --git a/meta/recipes-graphics/mesa/mesa-gl_24.1.4.bb b/meta/recipes-=
graphics/mesa/mesa-gl_24.2.0.bb
> similarity index 100%
> rename from meta/recipes-graphics/mesa/mesa-gl_24.1.4.bb
> rename to meta/recipes-graphics/mesa/mesa-gl_24.2.0.bb
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
> index 499006655d..40e7bed648 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -16,11 +16,10 @@ PE =3D "2"
>
>  SRC_URI =3D "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
>             file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patc=
h \
> -           file://0001-amd-Include-missing-llvm-IR-header-Module.h.patch=
 \
>             file://0001-freedreno-don-t-encode-build-path-into-binaries.p=
atch\
>  "
>
> -SRC_URI[sha256sum] =3D "7cf7c6f665263ad0122889c1d4b076654c1eedea7a2f38c6=
9c8c51579937ade1"
> +SRC_URI[sha256sum] =3D "c02bb72cea290f78b11895a0c95c7c92394f180d7ff66d4a=
762ec6950a58addf"
>
>  UPSTREAM_CHECK_GITTAGREGEX =3D "mesa-(?P<pver>\d+(\.\d+)+)"
>
> @@ -34,7 +33,7 @@ do_install:append() {
>    fi
>  }
>
> -DEPENDS =3D "expat makedepend-native flex-native bison-native libxml2-na=
tive zlib chrpath-replacement-native python3-mako-native gettext-native"
> +DEPENDS =3D "expat makedepend-native flex-native bison-native libxml2-na=
tive zlib chrpath-replacement-native python3-mako-native gettext-native pyt=
hon3-pyyaml-native"
>  DEPENDS:append:class-target =3D " ${@bb.utils.contains('PACKAGECONFIG', =
'opencl', 'mesa-native', '', d)}"
>  EXTRANATIVEPATH +=3D "chrpath-native"
>  PROVIDES =3D " \
> @@ -243,7 +242,7 @@ PACKAGES =3D+ "libegl-mesa libegl-mesa-dev \
>               libopencl-mesa libopencl-mesa-dev \
>               libxatracker libxatracker-dev \
>               mesa-megadriver mesa-vulkan-drivers \
> -             mesa-vdpau-drivers mesa-tools \
> +             mesa-vdpau-drivers mesa-gallium-drivers mesa-tools \
>              "
>
>  do_install:append () {
> @@ -335,6 +334,7 @@ FILES:mesa-megadriver =3D "${libdir}/dri/* ${datadir}=
/drirc.d"
>  FILES:mesa-vulkan-drivers =3D "${libdir}/libvulkan_*.so ${libdir}/libpow=
ervr_rogue.so ${datadir}/vulkan"
>  FILES:${PN}-vdpau-drivers =3D "${libdir}/vdpau/*.so.*"
>  FILES:libegl-mesa =3D "${libdir}/libEGL*.so.* ${datadir}/glvnd/egl_vendo=
r.d"
> +FILES:mesa-gallium-drivers =3D "${libdir}/libgallium-*.so"
>  FILES:libgbm =3D "${libdir}/libgbm.so.*"
>  FILES:libgles1-mesa =3D "${libdir}/libGLESv1*.so.*"
>  FILES:libgles2-mesa =3D "${libdir}/libGLESv2.so.*"
> @@ -362,6 +362,7 @@ FILES:libxatracker-dev =3D "${libdir}/libxatracker.so=
 ${libdir}/libxatracker.la \
>  # catch all to get all the tools and data
>  FILES:${PN}-tools =3D "${bindir} ${datadir}"
>  ALLOW_EMPTY:${PN}-tools =3D "1"
> +INSANE_SKIP:${PN}-megadriver =3D "dev-so"
>
>  # Fix upgrade path from mesa to mesa-megadriver
>  RREPLACES:mesa-megadriver =3D "mesa"
> diff --git a/meta/recipes-graphics/mesa/mesa_24.1.4.bb b/meta/recipes-gra=
phics/mesa/mesa_24.2.0.bb
> similarity index 100%
> rename from meta/recipes-graphics/mesa/mesa_24.1.4.bb
> rename to meta/recipes-graphics/mesa/mesa_24.2.0.bb
> --
> 2.45.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#203484): https://lists.openembedded.org/g/openembedde=
d-core/message/203484
> Mute This Topic: https://lists.openembedded.org/mt/107965743/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

