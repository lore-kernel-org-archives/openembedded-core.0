Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A273C4345F
	for <webhook@archiver.kernel.org>; Sun, 21 Apr 2024 17:50:16 +0000 (UTC)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
 by mx.groups.io with SMTP id smtpd.web11.790.1713721814042725520
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Apr 2024 10:50:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Zb3xKXpu;
 spf=pass (domain: gmail.com, ip: 209.85.161.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-5aa20adda1dso2438661eaf.1
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Apr 2024 10:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713721813; x=1714326613; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bkyTBdbhoaD58jMwwYYwQq4Edgeo6gNX8YZmSPSTvRI=;
        b=Zb3xKXpuoBfruKsScfcFcsi7sFRJBXrqmFf8f+0LBMFFNKE9kcGMIutd//rN9p6yRV
         Yv6zVT9I8rHsuxym+98bhzBKmD0WThgmbhUyRwPIvEp6iDSwRH4SExbO5GLEunrIMyAz
         vGck/3c0iAwkwHe/H/JhhGZyq1FR8cfTr2gO9cA/aXLmn2yl+cXbfedLiCjWzA9+pP9M
         xQCuR25z237aB3FsHOA2rFUg9J8Vn1h57Ffm/dpQJGbq3HtV08FOxXfiLE/AlOC7U983
         TL8d8ryHV1dmpPg5ivQZ+LLC9lF1vtvmCQZqy+E66iZBzigFqG6wo7BFxD7vdrJIRC17
         LRxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713721813; x=1714326613;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bkyTBdbhoaD58jMwwYYwQq4Edgeo6gNX8YZmSPSTvRI=;
        b=t8Nmognnt34y+IZselX4V4YaiuxqSsgV1txHiw4y2gM6BzEDsA/oI8vfFbTxzqyLGI
         BJaDSfL1pRPjWKTF5O9l7QQbNy0htl1ETVPpmVcNUi/hnCJPkkn9eKd+0lyP2lBWhaMX
         6i2qIloy6S2n6qvjH/9vGNm4zpeuNDWV5drNH0l4H9nL3x0OMBh3K83KsOaji+NiEWIo
         6QYnjeN8oIzE1yKU7j74hhtKzMkvqtvH8wHVufot3VFlpqlDMXX8u73SjVoBseuc1uYM
         XbVdlZIKVyxOEy37w28UiCf2f2j3TWvedWJ/CrmhYcqM53dtGAvvNb88SUJ8hga1FR1w
         NikQ==
X-Gm-Message-State: AOJu0Yw71z2IbriWx8GcRTlPKhgpFJcp9Auoxcb5P5EztnbgzgIFETzF
	505KslCoP2C20I888qwMw0z3B0+zyXiYArAoHSqgUG4V4e0bBi+GgsesYl6f9LS/S9nB3MnB4d9
	rWKvUmhTUT+CGT+yZ/rGrUbL9juQ=
X-Google-Smtp-Source: AGHT+IHChAheJFm71gxvkKYM0Vn9WFPB60zCBynR2gvacHxKM66VDOC7NimlJEIccOW+P5rOj+0PHJbrLHNJ+w+7oqg=
X-Received: by 2002:a05:6871:821:b0:22e:c860:9a6a with SMTP id
 q33-20020a056871082100b0022ec8609a6amr10048063oap.49.1713721813004; Sun, 21
 Apr 2024 10:50:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240419121945.1920944-1-alex@linutronix.de> <20240419121945.1920944-12-alex@linutronix.de>
In-Reply-To: <20240419121945.1920944-12-alex@linutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 21 Apr 2024 10:49:46 -0700
Message-ID: <CAMKF1soLsrQ=geOLS3xDUqc0Yx1=zmAC=a13hHar3ewV5xWeUQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 12/19] mpeg2dec: remove the recipe
To: alex.kanavin@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 21 Apr 2024 17:50:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198577

vlc has a dependency on it, perhaps vlc needs tweaking too.

On Fri, Apr 19, 2024 at 5:20=E2=80=AFAM Alexander Kanavin via
lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
wrote:
>
> This is as well inactive for over 10 years, and has been superseded by ff=
mpeg long time ago.
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/conf/distro/include/maintainers.inc      |   1 -
>  .../gstreamer1.0-plugins-ugly_1.22.11.bb      |   1 -
>  ...-1206-from-upstream-to-fix-PIE-build.patch | 156 ------------------
>  ...heck-for-available-arm-optimizations.patch |  55 ------
>  ...f-global-symbols-used-in-ARM-specifi.patch |  63 -------
>  .../files/61_global-symbol-test.patch         |  70 --------
>  .../mpeg2dec/files/altivec_h_needed.patch     |  43 -----
>  .../mpeg2dec/mpeg2dec_0.5.1.bb                |  51 ------
>  8 files changed, 440 deletions(-)
>  delete mode 100644 meta/recipes-multimedia/mpeg2dec/files/0001-Import-re=
vision-1206-from-upstream-to-fix-PIE-build.patch
>  delete mode 100644 meta/recipes-multimedia/mpeg2dec/files/0001-check-for=
-available-arm-optimizations.patch
>  delete mode 100644 meta/recipes-multimedia/mpeg2dec/files/0002-Set-visib=
ility-of-global-symbols-used-in-ARM-specifi.patch
>  delete mode 100644 meta/recipes-multimedia/mpeg2dec/files/61_global-symb=
ol-test.patch
>  delete mode 100644 meta/recipes-multimedia/mpeg2dec/files/altivec_h_need=
ed.patch
>  delete mode 100644 meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb
>
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
> index 52bb542483d..a11859890e5 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -523,7 +523,6 @@ RECIPE_MAINTAINER:pn-mkfontscale =3D "Unassigned <una=
ssigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-mmc-utils =3D "Anuj Mittal <anuj.mittal@intel.com>"
>  RECIPE_MAINTAINER:pn-mobile-broadband-provider-info =3D "Alexander Kanav=
in <alex.kanavin@gmail.com>"
>  RECIPE_MAINTAINER:pn-modutils-initscripts =3D "Yi Zhao <yi.zhao@windrive=
r.com>"
> -RECIPE_MAINTAINER:pn-mpeg2dec =3D "Alexander Kanavin <alex.kanavin@gmail=
.com>"
>  RECIPE_MAINTAINER:pn-mpfr =3D "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-mpg123 =3D "Alexander Kanavin <alex.kanavin@gmail.c=
om>"
>  RECIPE_MAINTAINER:pn-msmtp =3D "Wang Mingyu <wangmy@fujitsu.com>"
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_=
1.22.11.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.=
22.11.bb
> index d89442d7893..99f41d4f3dc 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.11=
.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.11=
.bb
> @@ -25,7 +25,6 @@ GST_PLUGIN_SET_HAS_EXAMPLES =3D "0"
>
>  PACKAGECONFIG ??=3D " \
>      ${GSTREAMER_ORC} \
> -    mpeg2dec \
>  "
>
>  PACKAGECONFIG[amrnb]    =3D "-Damrnb=3Denabled,-Damrnb=3Ddisabled,openco=
re-amr"
> diff --git a/meta/recipes-multimedia/mpeg2dec/files/0001-Import-revision-=
1206-from-upstream-to-fix-PIE-build.patch b/meta/recipes-multimedia/mpeg2de=
c/files/0001-Import-revision-1206-from-upstream-to-fix-PIE-build.patch
> deleted file mode 100644
> index b2544cb44d8..00000000000
> --- a/meta/recipes-multimedia/mpeg2dec/files/0001-Import-revision-1206-fr=
om-upstream-to-fix-PIE-build.patch
> +++ /dev/null
> @@ -1,156 +0,0 @@
> -From 0cafb99b57f43cf6ac2c6208718e49ad2dbe462d Mon Sep 17 00:00:00 2001
> -From: Jan Schmidt <thaytan@noraisin.net>
> -Date: Sun, 10 Nov 2013 00:49:52 +1100
> -Subject: [PATCH] Import revision 1206 from upstream to fix PIE build.
> -
> -Functions MC_put_o_16_arm, MC_put_o_8_arm, MC_put_x_16_arm, MC_put_x_8_a=
rm
> -in libmpeg2/motion_comp_arm_s.S have addresses in .text, which is bad
> -for shared libraries.  Some environments demand that .text actually be
> -read-only all the time, yet MC_put_o_16_arm etc require that the address=
es
> -be modified by the dynamic linking mechanism (dlopen, LoadLibrary, etc.)
> -Even in those environments which permit the dynamic linker to modify the
> -.text segment, the runtime cost of doing the relocation can be noticeabl=
e.
> -
> -This commit rewrites the linkage, discarding the tables of addresses
> -in favor of tables of offsets.  All transfers are local within each indi=
vidual
> -function, so there can be no interference by processing that occurs
> -after assembly, such as link-time re-ordering (even of individual functi=
ons.)
> -
> -Patch by John Reiser <jreiser@bitwagon.com>
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -Upstream-Status: Backport [https://code.videolan.org/videolan/libmpeg2/c=
ommit/946bf4b518aacc224f845e73708f99e394744499]
> ----
> - libmpeg2/motion_comp_arm_s.S | 70 +++++++++++++++++-------------------
> - 1 file changed, 33 insertions(+), 37 deletions(-)
> -
> -diff --git a/libmpeg2/motion_comp_arm_s.S b/libmpeg2/motion_comp_arm_s.S
> -index c921f7c..82143f8 100644
> ---- a/libmpeg2/motion_comp_arm_s.S
> -+++ b/libmpeg2/motion_comp_arm_s.S
> -@@ -30,9 +30,13 @@ MC_put_o_16_arm:
> -       pld [r1]
> -         stmfd sp!, {r4-r11, lr} @ R14 is also called LR
> -       and r4, r1, #3
> --      adr r5, MC_put_o_16_arm_align_jt
> --      add r5, r5, r4, lsl #2
> --      ldr pc, [r5]
> -+      ldrb r4, [pc, r4]
> -+      add pc, pc, r4, lsl #2
> -+      .byte (MC_put_o_16_arm_align0 - 0f)>>2
> -+      .byte (MC_put_o_16_arm_align1 - 0f)>>2
> -+      .byte (MC_put_o_16_arm_align2 - 0f)>>2
> -+      .byte (MC_put_o_16_arm_align3 - 0f)>>2
> -+0:
> -
> - MC_put_o_16_arm_align0:
> -       ldmia r1, {r4-r7}
> -@@ -76,11 +80,6 @@ MC_put_o_16_arm_align3:
> - 1:    PROC(24)
> -       bne 1b
> -         ldmfd sp!, {r4-r11, pc} @@ update PC with LR content.
> --MC_put_o_16_arm_align_jt:
> --      .word MC_put_o_16_arm_align0
> --      .word MC_put_o_16_arm_align1
> --      .word MC_put_o_16_arm_align2
> --      .word MC_put_o_16_arm_align3
> -
> - @ ----------------------------------------------------------------
> -       .align
> -@@ -91,9 +90,14 @@ MC_put_o_8_arm:
> -       pld [r1]
> -         stmfd sp!, {r4-r10, lr} @ R14 is also called LR
> -       and r4, r1, #3
> --      adr r5, MC_put_o_8_arm_align_jt
> --      add r5, r5, r4, lsl #2
> --      ldr pc, [r5]
> -+      ldrb r4, [pc, r4]
> -+      add pc, pc, r4, lsl #2
> -+      .byte (MC_put_o_8_arm_align0 - 0f)>>2
> -+      .byte (MC_put_o_8_arm_align1 - 0f)>>2
> -+      .byte (MC_put_o_8_arm_align2 - 0f)>>2
> -+      .byte (MC_put_o_8_arm_align3 - 0f)>>2
> -+0:
> -+
> - MC_put_o_8_arm_align0:
> -       ldmia r1, {r4-r5}
> -       add r1, r1, r2
> -@@ -135,12 +139,6 @@ MC_put_o_8_arm_align3:
> -       bne 1b
> -         ldmfd sp!, {r4-r10, pc} @@ update PC with LR content.
> -
> --MC_put_o_8_arm_align_jt:
> --      .word MC_put_o_8_arm_align0
> --      .word MC_put_o_8_arm_align1
> --      .word MC_put_o_8_arm_align2
> --      .word MC_put_o_8_arm_align3
> --
> - @ ----------------------------------------------------------------
> - .macro        AVG_PW rW1, rW2
> -       mov \rW2, \rW2, lsl #24
> -@@ -160,12 +158,17 @@ MC_put_x_16_arm:
> -       @@ void func(uint8_t * dest, const uint8_t * ref, int stride, int=
 height)
> -       pld [r1]
> -         stmfd sp!, {r4-r11,lr} @ R14 is also called LR
> -+      ldr r11, 0f
> -       and r4, r1, #3
> --      adr r5, MC_put_x_16_arm_align_jt
> --      ldr r11, [r5]
> -       mvn r12, r11
> --      add r5, r5, r4, lsl #2
> --      ldr pc, [r5, #4]
> -+      ldrb r4, [pc, r4]
> -+      add pc, pc, r4, lsl #2
> -+      .byte (MC_put_x_16_arm_align0 - 0f)>>2
> -+      .byte (MC_put_x_16_arm_align1 - 0f)>>2
> -+      .byte (MC_put_x_16_arm_align2 - 0f)>>2
> -+      .byte (MC_put_x_16_arm_align3 - 0f)>>2
> -+0:
> -+        .word 0x01010101
> -
> - .macro        ADJ_ALIGN_QW shift, R0, R1, R2, R3, R4
> -       mov \R0, \R0, lsr #(\shift)
> -@@ -238,12 +241,6 @@ MC_put_x_16_arm_align3:
> -       add r0, r0, r2
> -       bne 1b
> -         ldmfd sp!, {r4-r11,pc} @@ update PC with LR content.
> --MC_put_x_16_arm_align_jt:
> --      .word 0x01010101
> --      .word MC_put_x_16_arm_align0
> --      .word MC_put_x_16_arm_align1
> --      .word MC_put_x_16_arm_align2
> --      .word MC_put_x_16_arm_align3
> -
> - @ ----------------------------------------------------------------
> -       .align
> -@@ -253,12 +250,17 @@ MC_put_x_8_arm:
> -       @@ void func(uint8_t * dest, const uint8_t * ref, int stride, int=
 height)
> -       pld [r1]
> -         stmfd sp!, {r4-r11,lr} @ R14 is also called LR
> -+      ldr r11, 0f
> -       and r4, r1, #3
> --      adr r5, MC_put_x_8_arm_align_jt
> --      ldr r11, [r5]
> -       mvn r12, r11
> --      add r5, r5, r4, lsl #2
> --      ldr pc, [r5, #4]
> -+      ldrb r4, [pc, r4]
> -+      add pc, pc, r4, lsl #2
> -+      .byte (MC_put_x_8_arm_align0 - 0f)>>2
> -+      .byte (MC_put_x_8_arm_align1 - 0f)>>2
> -+      .byte (MC_put_x_8_arm_align2 - 0f)>>2
> -+      .byte (MC_put_x_8_arm_align3 - 0f)>>2
> -+0:
> -+        .word 0x01010101
> -
> - .macro        ADJ_ALIGN_DW shift, R0, R1, R2
> -       mov \R0, \R0, lsr #(\shift)
> -@@ -319,9 +321,3 @@ MC_put_x_8_arm_align3:
> -       add r0, r0, r2
> -       bne 1b
> -         ldmfd sp!, {r4-r11,pc} @@ update PC with LR content.
> --MC_put_x_8_arm_align_jt:
> --      .word 0x01010101
> --      .word MC_put_x_8_arm_align0
> --      .word MC_put_x_8_arm_align1
> --      .word MC_put_x_8_arm_align2
> --      .word MC_put_x_8_arm_align3
> diff --git a/meta/recipes-multimedia/mpeg2dec/files/0001-check-for-availa=
ble-arm-optimizations.patch b/meta/recipes-multimedia/mpeg2dec/files/0001-c=
heck-for-available-arm-optimizations.patch
> deleted file mode 100644
> index 5bf68b39ee6..00000000000
> --- a/meta/recipes-multimedia/mpeg2dec/files/0001-check-for-available-arm=
-optimizations.patch
> +++ /dev/null
> @@ -1,55 +0,0 @@
> -From cbcff58ed670c8edc0be1004384cbe0fd07d8d26 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Wed, 5 Jul 2017 18:49:21 -0700
> -Subject: [PATCH 1/2] check for available arm optimizations
> -
> -Taken From
> -http://sources.debian.net/src/mpeg2dec/0.5.1-7/debian/patches/65_arm-tes=
t-with-compiler.patch/
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - configure.ac | 12 ++++++++----
> - 1 file changed, 8 insertions(+), 4 deletions(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index acdcb1e..2c0a721 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -59,7 +59,7 @@ elif test x"$GCC" =3D x"yes"; then
> -     AC_TRY_CFLAGS([$TRY_CFLAGS $CFLAGS],[OPT_CFLAGS=3D"$TRY_CFLAGS"])
> -
> -     dnl arch-specific flags
> --    arm_conditional=3Dfalse
> -+    build_arm_opt=3Dfalse
> -     case "$host" in
> -     i?86-* | k?-* | x86_64-* | amd64-*)
> -       AC_DEFINE([ARCH_X86],,[x86 architecture])
> -@@ -102,8 +102,12 @@ elif test x"$GCC" =3D x"yes"; then
> -     alpha*)
> -       AC_DEFINE([ARCH_ALPHA],,[alpha architecture]);;
> -     arm*)
> --      arm_conditional=3D:
> --      AC_DEFINE([ARCH_ARM],,[ARM architecture]);;
> -+      AC_LANG(C)
> -+      AC_COMPILE_IFELSE(
> -+              [AC_LANG_SOURCE([[
> -+                      void foo(void) { __asm__ volatile("pld [r1]"); }]=
])],
> -+              build_arm_opt=3Dtrue; AC_DEFINE([ARCH_ARM],,[ARM architec=
ture]),
> -+              build_arm_opt=3Dfalse);;
> -     esac
> - elif test x"$CC" =3D x"tendracc"; then
> -     dnl TenDRA portability checking compiler
> -@@ -123,7 +127,7 @@ else
> -     esac
> - fi
> -
> --AM_CONDITIONAL(ARCH_ARM, ${arm_conditional})
> -+AM_CONDITIONAL(ARCH_ARM, test x$build_arm_opt =3D xtrue)
> -
> - dnl Checks for libtool - this must be done after we set cflags
> - AC_LIBTOOL_WIN32_DLL
> ---
> -2.13.2
> -
> diff --git a/meta/recipes-multimedia/mpeg2dec/files/0002-Set-visibility-o=
f-global-symbols-used-in-ARM-specifi.patch b/meta/recipes-multimedia/mpeg2d=
ec/files/0002-Set-visibility-of-global-symbols-used-in-ARM-specifi.patch
> deleted file mode 100644
> index 83016923685..00000000000
> --- a/meta/recipes-multimedia/mpeg2dec/files/0002-Set-visibility-of-globa=
l-symbols-used-in-ARM-specifi.patch
> +++ /dev/null
> @@ -1,63 +0,0 @@
> -From f9d9dc92d75f8910e3cd5fdcbea72e505cdf3493 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Wed, 5 Jul 2017 19:03:36 -0700
> -Subject: [PATCH 2/2] Set visibility of global symbols used in ARM specif=
ic
> - assembly file to internal
> -
> -Taken from
> -http://sources.debian.net/src/mpeg2dec/0.5.1-7/debian/patches/60_arm-pri=
vate-symbols.patch/
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - libmpeg2/motion_comp_arm_s.S | 12 ++++++++----
> - 1 file changed, 8 insertions(+), 4 deletions(-)
> -
> -diff --git a/libmpeg2/motion_comp_arm_s.S b/libmpeg2/motion_comp_arm_s.S
> -index f6c3d7d..c921f7c 100644
> ---- a/libmpeg2/motion_comp_arm_s.S
> -+++ b/libmpeg2/motion_comp_arm_s.S
> -@@ -23,7 +23,8 @@
> -
> - @ ----------------------------------------------------------------
> -       .align
> --      .global MC_put_o_16_arm
> -+      .global   MC_put_o_16_arm
> -+      .internal MC_put_o_16_arm
> - MC_put_o_16_arm:
> -       @@ void func(uint8_t * dest, const uint8_t * ref, int stride, int=
 height)
> -       pld [r1]
> -@@ -83,7 +84,8 @@ MC_put_o_16_arm_align_jt:
> -
> - @ ----------------------------------------------------------------
> -       .align
> --      .global MC_put_o_8_arm
> -+      .global   MC_put_o_8_arm
> -+      .internal MC_put_o_8_arm
> - MC_put_o_8_arm:
> -       @@ void func(uint8_t * dest, const uint8_t * ref, int stride, int=
 height)
> -       pld [r1]
> -@@ -152,7 +154,8 @@ MC_put_o_8_arm_align_jt:
> - .endm
> -
> -       .align
> --      .global MC_put_x_16_arm
> -+      .global   MC_put_x_16_arm
> -+      .internal MC_put_x_16_arm
> - MC_put_x_16_arm:
> -       @@ void func(uint8_t * dest, const uint8_t * ref, int stride, int=
 height)
> -       pld [r1]
> -@@ -244,7 +247,8 @@ MC_put_x_16_arm_align_jt:
> -
> - @ ----------------------------------------------------------------
> -       .align
> --      .global MC_put_x_8_arm
> -+      .global   MC_put_x_8_arm
> -+      .internal MC_put_x_8_arm
> - MC_put_x_8_arm:
> -       @@ void func(uint8_t * dest, const uint8_t * ref, int stride, int=
 height)
> -       pld [r1]
> ---
> -2.13.2
> -
> diff --git a/meta/recipes-multimedia/mpeg2dec/files/61_global-symbol-test=
.patch b/meta/recipes-multimedia/mpeg2dec/files/61_global-symbol-test.patch
> deleted file mode 100644
> index 00b667d3365..00000000000
> --- a/meta/recipes-multimedia/mpeg2dec/files/61_global-symbol-test.patch
> +++ /dev/null
> @@ -1,70 +0,0 @@
> -Rewrite the public symbol check to verify the shared libraries, to check=
 for
> -more things, and to avoid duplication; fixes make check on ARM
> -
> -Taken From
> -https://sources.debian.org/src/mpeg2dec/0.5.1-8/debian/patches/61_global=
-symbol-test.patch/
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - test/globals |   42 +++++++++++++++++++++++++++---------------
> - 1 file changed, 27 insertions(+), 15 deletions(-)
> -
> ---- mpeg2dec.orig/test/globals
> -+++ mpeg2dec/test/globals
> -@@ -1,4 +1,8 @@
> - #!/bin/sh
> -+# TODO
> -+# - fix checking of .a libs; problem is that "nm -g --defined-only" lis=
ts
> -+#   internal symbols; this can be solved by using objdump, but it's pro=
bably
> -+#   good enough to just run the tests on the shared lib
> -
> - if test x"$srcdir" !=3D x""; then
> -     builddir=3D"."      # running from make check, but it does not defi=
ne that
> -@@ -14,22 +18,30 @@ builddir=3D`cd $builddir;pwd`
> -
> - error=3D0
> -
> --bad_globals=3D`nm -g --defined-only $builddir/../libmpeg2/*.o |\
> --    awk '{if ($3) print $3}' | grep -v '^_\?mpeg2_'`
> --
> --if test x"$bad_globals" !=3D x""; then
> --    echo BAD GLOBAL SYMBOLS:
> --    for s in $bad_globals; do echo $s; done
> -+# check_bad_public_symbols <symbol prefix> <lib file> [<lib file>...]
> -+#
> -+# checks public symbols in shared libs:
> -+# - allow prefix_anything
> -+# - reject _prefixanything
> -+# - allow _anything
> -+# - reject anything else
> -+#
> -+# NB: skips missing files
> -+check_bad_public_symbols() {
> -+    symbols_prefix=3D"$1"
> -+    shift
> -+    lib_files=3D`ls "$@" 2>/dev/null`
> -+    [ -z "$lib_files" ] && return
> -+    bad_globals=3D`nm -g --defined-only $lib_files |
> -+        awk '{if ($3) print $3}' |
> -+        sed -n "/^${symbols_prefix}_/ d; /^_${symbols_prefix}/ { p; d }=
; /^_/ d; p"`
> -+    [ -z "$bad_globals" ] && return
> -     error=3D1
> --fi
> --
> --bad_globals=3D`nm -g --defined-only $builddir/../libmpeg2/convert/*.o |=
\
> --    awk '{if ($3) print $3}' | grep -v '^_\?mpeg2convert_'`
> -+    echo BAD GLOBAL SYMBOLS in $lib_files:
> -+    echo "$bad_globals"
> -+}
> -
> --if test x"$bad_globals" !=3D x""; then
> --    echo BAD GLOBAL SYMBOLS:
> --    for s in $bad_globals; do echo $s; done
> --    error=3D1
> --fi
> -+check_bad_public_symbols mpeg2 $builddir/../libmpeg2/.libs/libmpeg2.so
> -+check_bad_public_symbols mpeg2convert $builddir/../libmpeg2/convert/.li=
bs/libmpeg2convert.so
> -
> - exit $error
> diff --git a/meta/recipes-multimedia/mpeg2dec/files/altivec_h_needed.patc=
h b/meta/recipes-multimedia/mpeg2dec/files/altivec_h_needed.patch
> deleted file mode 100644
> index 5113ad44fe4..00000000000
> --- a/meta/recipes-multimedia/mpeg2dec/files/altivec_h_needed.patch
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -Add new method to judge whether <altivec.h> is needed
> -
> -The original logic will use "typedef vector int t;" to judge
> -whether <altivec.h> is needed. altivec.h contains the following
> -statement:
> -
> - #if !defined(__APPLE_ALTIVEC__)
> - #define vector __vector
> - #define pixel __pixel
> - #define bool
> - #endif
> -
> -In gcc-4.3.3, __APPLE_ALTIVEC__ is not defined by compiler, neither
> -as vector, pixel, and bool. In order to make "typedef vector int t;"
> -pass the compilation, we need to include altivec.h.
> -
> -However in gcc-4.5.0, __APPLE_ALTIVEC__ is defined by compiler,
> -so as vector, pixel, and bool. We could not judge whether
> -altivec.h is needed by "typedef vector int t;".
> -Here we include another statement "int tmp =3D __CR6_EQ;", in
> -which __CR6_EQ is defined in altivec.h.
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
> -
> -diff -ruN a/configure.in b/configure.in
> ---- a/configure.ac     2010-09-14 20:55:42.399687663 +0800
> -+++ b/configure.ac     2010-09-14 20:56:43.403204648 +0800
> -@@ -79,11 +79,11 @@
> -                CFLAGS=3D"$OPT_CFLAGS $TRY_CFLAGS $CFLAGS"
> -                AC_MSG_CHECKING([if <altivec.h> is needed])
> -                AC_TRY_COMPILE([],
> --                  [typedef vector int t;
> -+                  [typedef vector int t; int tmp =3D __CR6_EQ;
> -                    vec_ld(0, (unsigned char *)0);],
> -                   [have_altivec=3Dyes; AC_MSG_RESULT(no)],
> -                   [AC_TRY_COMPILE([#include <altivec.h>],
> --                      [typedef vector int t; vec_ld(0, (unsigned char *=
)0);],
> -+                      [typedef vector int t; int tmp =3D __CR6_EQ; vec_=
ld(0, (unsigned char *)0);],
> -                       [AC_DEFINE([HAVE_ALTIVEC_H],,
> -                           [Define to 1 if you have the <altivec.h> head=
er.])
> -                        have_altivec=3Dyes; AC_MSG_RESULT(yes)],
> diff --git a/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb b/meta/re=
cipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb
> deleted file mode 100644
> index fd8b561657d..00000000000
> --- a/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb
> +++ /dev/null
> @@ -1,51 +0,0 @@
> -SUMMARY =3D "Library and test program for decoding MPEG-2 and MPEG-1 vid=
eo streams"
> -DESCRIPTION =3D "mpeg2dec is a test program for libmpeg2. It decodes \
> -mpeg-1 and mpeg-2 video streams, and also includes a demultiplexer \
> -for mpeg-1 and mpeg-2 program streams. The main purpose of mpeg2dec \
> -is to have a simple test bed for libmpeg2."
> -HOMEPAGE =3D "https://libmpeg2.sourceforge.io/"
> -SECTION =3D "libs"
> -LICENSE =3D "GPL-2.0-or-later"
> -LICENSE_FLAGS =3D "commercial"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f \
> -                    file://include/mpeg2.h;beginline=3D1;endline=3D22;md=
5=3D7766f4fcb58f0f8413c49a746f2ab89b"
> -
> -SRC_URI =3D "http://libmpeg2.sourceforge.net/files/libmpeg2-${PV}.tar.gz=
 \
> -           file://altivec_h_needed.patch \
> -           file://0001-check-for-available-arm-optimizations.patch \
> -           file://0002-Set-visibility-of-global-symbols-used-in-ARM-spec=
ifi.patch \
> -           file://61_global-symbol-test.patch \
> -           file://0001-Import-revision-1206-from-upstream-to-fix-PIE-bui=
ld.patch \
> -           "
> -
> -S =3D "${WORKDIR}/libmpeg2-${PV}"
> -
> -SRC_URI[md5sum] =3D "0f92c7454e58379b4a5a378485bbd8ef"
> -SRC_URI[sha256sum] =3D "dee22e893cb5fc2b2b6ebd60b88478ab8556cb3b93f9a0d7=
ce8f3b61851871d4"
> -
> -UPSTREAM_CHECK_URI =3D "http://libmpeg2.sourceforge.net/downloads.html"
> -
> -inherit autotools pkgconfig
> -
> -EXTRA_OECONF =3D "--enable-shared --disable-sdl"
> -
> -PACKAGECONFIG ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
> -PACKAGECONFIG[x11] =3D "--with-x,--without-x,virtual/libx11 libxext libx=
v"
> -
> -PACKAGES =3D "mpeg2dec-dbg mpeg2dec mpeg2dec-doc libmpeg2 libmpeg2-dev l=
ibmpeg2convert libmpeg2convert-dev libmpeg2-staticdev libmpeg2convert-stati=
cdev"
> -
> -FILES:${PN} =3D "${bindir}/*"
> -FILES:libmpeg2 =3D "${libdir}/libmpeg2.so.*"
> -FILES:libmpeg2convert =3D "${libdir}/libmpeg2convert.so.*"
> -FILES:libmpeg2-dev =3D "${libdir}/libmpeg2.so \
> -                      ${libdir}/libmpeg2.la \
> -                      ${libdir}/libmpeg2arch.la \
> -                      ${libdir}/pkgconfig/libmpeg2.pc \
> -                      ${includedir}/mpeg2dec/mpeg2.h"
> -FILES:libmpeg2-staticdev =3D "${libdir}/libmpeg2.a"
> -FILES:libmpeg2convert-dev =3D "${libdir}/libmpeg2convert.so \
> -                             ${libdir}/libmpeg2convert.la \
> -                             ${libdir}/libmpeg2convertarch.la \
> -                             ${libdir}/pkgconfig/libmpeg2convert.pc \
> -                             ${includedir}/mpeg2dec/mpeg2convert.h"
> -FILES:libmpeg2convert-staticdev =3D "${libdir}/libmpeg2convert.a"
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#198540): https://lists.openembedded.org/g/openembedde=
d-core/message/198540
> Mute This Topic: https://lists.openembedded.org/mt/105616504/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

