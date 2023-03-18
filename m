Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CC45C74A5B
	for <webhook@archiver.kernel.org>; Sat, 18 Mar 2023 08:02:13 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.2772.1679126530001204070
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Mar 2023 01:02:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WWIWhrvK;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id g17so9162893lfv.4
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Mar 2023 01:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679126528;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DQ5Shu/BiWL8jACFna6J80wdRujeg8duYSKAJFkAbmU=;
        b=WWIWhrvKAh2WScqMqgC0ZnozDl9aCxP+xxQcD22wW4/KCCSQd9IOwqqNFExgn2clAv
         aZxN3QGANFOwyanF42Kbo53WW9HfjDnz5GTiHMefaPy1v9mLUj3Ya83THh+es2/m7023
         lDWBagotawa5K/S15Gn0yWNNLxw3tgd/iuVDluNMu0/pIWVlN+uYd6U9RZf2Mcd+ZZ66
         Rb+BEcgtb8TZwFrA8AYkmjH4BZiZJC9OrXSo4Jnxk2PVJ+l8nGVKdvqJ29PYhwIrmwk3
         AS6Ms03kuRiuur7fvHLKSSdDtFCqo9DP6ToocxgVefFizMKsRG3aC6/utFHwDuBnuRMf
         o1OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679126528;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DQ5Shu/BiWL8jACFna6J80wdRujeg8duYSKAJFkAbmU=;
        b=cHcZ85k9Ov2a8ws5m3mxHyPs7g4LIbmK3jeg/Asqh6kD892s3OHtGLx4ZVpSaFnzkg
         Wp5bOx16n9oF8aMgEuKvZZJgheuL7OQEzkx/sX6qeLqfkQyjuZCkbA7JE+26+CByXemt
         DFThVAG4ClxhNTKL49HkjoqarO5NT2l3Tq0NYuqQQ65OFJ2l/irPTUhBXFrotLrbdXv3
         rqxUvn3ScVo688maGcqLVZuoICE5PJTo0rgt8FlolA3Ssif/gNd8MJUo24xQlJQG2695
         K8m3Tc7TRoyd3W8BzbPKc9zZax9hQuS8tA10gi9jQAxLNZDZPbp+y+jVZ3hXPz2F0FBP
         NqqQ==
X-Gm-Message-State: AO0yUKXIxI5cw0NcXUHH/Hu2RXhxu10UD17y4aLOayIVXdDOwIaJ9PHl
	d/COADt+SB8eHOiVT0xfDJypRLQxOW/Q0me6PyI=
X-Google-Smtp-Source: AK7set/5sFi5TCww7WxwUMIryBmebIHhGkioZD4l/hRlJ4JJvaqn64CB9NPtXjGPl/iTyJc4rBfF1u4jdPcbfqR2r2c=
X-Received: by 2002:a05:6512:486:b0:4e9:5b3a:e8a2 with SMTP id
 v6-20020a056512048600b004e95b3ae8a2mr2625024lfq.11.1679126527922; Sat, 18 Mar
 2023 01:02:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230316094102.2628727-1-alex@linutronix.de> <20230316094102.2628727-6-alex@linutronix.de>
 <CAMKF1sqhwupoW0kV7ao94DvdbxTH4B5i3HfMwOnp6M+g0g85Sg@mail.gmail.com>
In-Reply-To: <CAMKF1sqhwupoW0kV7ao94DvdbxTH4B5i3HfMwOnp6M+g0g85Sg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 18 Mar 2023 08:01:57 +0000
Message-ID: <CANNYZj9rnnKP_wGaqqg8ozVz1Q5ikbqccQCADshnFpuozG3MyQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 6/6] mesa: update 22.3.5 -> 23.0.0
To: Khem Raj <raj.khem@gmail.com>
Cc: Alexander Kanavin <alex@linutronix.de>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000003ad5cc05f7281ceb"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Mar 2023 08:02:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178784

--0000000000003ad5cc05f7281ceb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ubuntu 18.04 goes EOL next month, so it should perhaps be dropped from the
builders and supported distro list?

Alex

On Sat 18. Mar 2023 at 2.47, Khem Raj <raj.khem@gmail.com> wrote:

> mesa 23.x fails to build with default gcc ( 7.5.0 ) Ubuntu
> 7.5.0-3ubuntu1~18.04, it ends up with
>
> ../mesa-23.0.0/src/intel/compiler/brw_simd_selection.cpp: In function
> =E2=80=98int brw_simd_select_for_workgroup_size(const intel_device_info*,
> const brw_cs_prog_data*, const unsigned int*)=E2=80=99:
> ../mesa-23.0.0/src/intel/compiler/brw_simd_selection.cpp:205:7: sorry,
> unimplemented: non-trivial designated initializers not supported
>        };
>        ^
>
> see mesa-native failure
>
> https://errors.yoctoproject.org/Errors/Details/698144/
>
> I wonder how it works on AB nodes running Ubuntu 18.04. Do we enforce
> gcc from buildtools tarball there ?
>
> On Thu, Mar 16, 2023 at 2:41=E2=80=AFAM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > Drop patches:
> > 0001-gbm-backend-fix-gbm-compile-without-dri.patch
> > 0001-freedreno-pm4-Use-unsigned-instead-of-uint-to-fix-mu.patch
> > (backports)
> >
> > 0001-util-format-Check-for-NEON-before-using-it.patch
> > (upstream submission has stalled with unanswered concerns from upstream=
;
> > patch no longer applies; issue does not reproduce with
> 'raspberrypi0-wifi' MACHINE)
> >
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > ---
> >  ...e-unsigned-instead-of-uint-to-fix-mu.patch | 44 -------------
> >  ...-backend-fix-gbm-compile-without-dri.patch | 65 -------------------
> >  ...ormat-Check-for-NEON-before-using-it.patch | 47 --------------
> >  .../{mesa-gl_22.3.5.bb =3D> mesa-gl_23.0.0.bb}  |  0
> >  meta/recipes-graphics/mesa/mesa.inc           |  5 +-
> >  .../mesa/{mesa_22.3.5.bb =3D> mesa_23.0.0.bb}   |  0
> >  6 files changed, 1 insertion(+), 160 deletions(-)
> >  delete mode 100644
> meta/recipes-graphics/mesa/files/0001-freedreno-pm4-Use-unsigned-instead-=
of-uint-to-fix-mu.patch
> >  delete mode 100644
> meta/recipes-graphics/mesa/files/0001-gbm-backend-fix-gbm-compile-without=
-dri.patch
> >  delete mode 100644
> meta/recipes-graphics/mesa/files/0001-util-format-Check-for-NEON-before-u=
sing-it.patch
> >  rename meta/recipes-graphics/mesa/{mesa-gl_22.3.5.bb =3D>
> mesa-gl_23.0.0.bb} (100%)
> >  rename meta/recipes-graphics/mesa/{mesa_22.3.5.bb =3D> mesa_23.0.0.bb}
> (100%)
> >
> > diff --git
> a/meta/recipes-graphics/mesa/files/0001-freedreno-pm4-Use-unsigned-instea=
d-of-uint-to-fix-mu.patch
> b/meta/recipes-graphics/mesa/files/0001-freedreno-pm4-Use-unsigned-instea=
d-of-uint-to-fix-mu.patch
> > deleted file mode 100644
> > index 3ab22889bf..0000000000
> > ---
> a/meta/recipes-graphics/mesa/files/0001-freedreno-pm4-Use-unsigned-instea=
d-of-uint-to-fix-mu.patch
> > +++ /dev/null
> > @@ -1,44 +0,0 @@
> > -From 8a5de0b6cf1090d7f29f3974ec79c32776cf2745 Mon Sep 17 00:00:00 2001
> > -From: Jami Kettunen <jami.kettunen@protonmail.com>
> > -Date: Tue, 31 Aug 2021 00:15:58 +0300
> > -Subject: [PATCH] freedreno/pm4: Use unsigned instead of uint to fix
> musl build
> > -
> > -Upstream-Status: Backport
> > -
> > -Fixes the following error I noticed when building against aarch64 with
> > -musl libc:
> > -
> > -  In file included from ../src/freedreno/decode/crashdec.h:38,
> > -                   from ../src/freedreno/decode/crashdec.c:40:
> > -  ../src/freedreno/common/freedreno_pm4.h:104:15: error: unknown type
> name 'uint'
> > -    104 | static inline uint
> > -        |               ^~~~
> > -  ../src/freedreno/common/freedreno_pm4.h:105:25: error: unknown type
> name 'uint'; did you mean 'int'?
> > -    105 | pm4_calc_odd_parity_bit(uint val)
> > -        |                         ^~~~
> > -        |                         int
> > -
> > -Signed-off-by: Jami Kettunen <jami.kettunen@protonmail.com>
> > -Part-of: <
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/19665>
> > ----
> > - src/freedreno/common/freedreno_pm4.h | 4 ++--
> > - 1 file changed, 2 insertions(+), 2 deletions(-)
> > -
> > -diff --git a/src/freedreno/common/freedreno_pm4.h
> b/src/freedreno/common/freedreno_pm4.h
> > -index 8f958953d693..091247e709a0 100644
> > ---- a/src/freedreno/common/freedreno_pm4.h
> > -+++ b/src/freedreno/common/freedreno_pm4.h
> > -@@ -105,8 +105,8 @@ pm4_pkt7_hdr(uint8_t opcode, uint16_t cnt)
> > - #define cp_type3_opcode(pkt) (((pkt) >> 8) & 0xFF)
> > - #define type3_pkt_size(pkt)  ((((pkt) >> 16) & 0x3FFF) + 1)
> > -
> > --static inline uint
> > --pm4_calc_odd_parity_bit(uint val)
> > -+static inline unsigned
> > -+pm4_calc_odd_parity_bit(unsigned val)
> > - {
> > -    return (0x9669 >> (0xf & ((val) ^ ((val) >> 4) ^ ((val) >> 8) ^
> > -                              ((val) >> 12) ^ ((val) >> 16) ^ ((val) >=
>
> 20) ^
> > ---
> > -2.39.2
> > -
> > diff --git
> a/meta/recipes-graphics/mesa/files/0001-gbm-backend-fix-gbm-compile-witho=
ut-dri.patch
> b/meta/recipes-graphics/mesa/files/0001-gbm-backend-fix-gbm-compile-witho=
ut-dri.patch
> > deleted file mode 100644
> > index 6541671b7a..0000000000
> > ---
> a/meta/recipes-graphics/mesa/files/0001-gbm-backend-fix-gbm-compile-witho=
ut-dri.patch
> > +++ /dev/null
> > @@ -1,65 +0,0 @@
> > -From 25946100e21cf2095bea334e8d7096798561d0b7 Mon Sep 17 00:00:00 2001
> > -From: Vincent Davis Jr <vince@underview.tech>
> > -Date: Wed, 28 Dec 2022 16:28:01 -0600
> > -Subject: [PATCH] gbm/backend: fix gbm compile without dri
> > -
> > -Upstream-Status: Backport
> > -
> > -https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/20447
> > -
> https://gitlab.freedesktop.org/mesa/mesa/-/commit/842ca284650f066e5870674=
1a7d22d67b5088e60
> > -
> > -At mesa version 22.2.3 patch wasn't introduced until after.
> > -
> > -Commit introduces a fix that allows for gbm to be built with an empty
> > -backend. There are situation especially in a Yocto/OE cross compilatio=
n
> > -environment where you want to build with an empty backend. The
> particular
> > -situation is as such:
> > -
> > -The mesa-gl recipe is the preferred provider for virtual/libgbm,
> virtual/libgl,
> > -virtual/mesa, etc... But the x11 DISTRO_FEATURE in't included this
> leads to build
> > -errors such as:
> > -
> > -| /../../../ld: src/gbm/libgbm.so.1.0.0.p/main_backend.c.o: in functio=
n
> `find_backend':
> > -| backend.c:(.text.find_backend+0xa4): undefined reference to
> `gbm_dri_backend'
> > -| /../../../ld:
> src/gbm/libgbm.so.1.0.0.p/main_backend.c.o:(.data.rel.ro.builtin_backends=
+0x4):
> > -                undefined reference to `gbm_dri_backend'
> > -| collect2: error: ld returned 1 exit status
> > -
> > -Issue should be replicable by setting -Ddri3=3Ddisabled and -Dgbm=3Den=
abled
> > -
> > -Add fix to bypasses compilation issue by excluding gbm dri backend. If
> > -HAVE_DRI || HAVE_DRIX not specified.
> > -
> > -Acked-by: David Heidelberg <david.heidelberg@collabora.com>
> > -Signed-off-by: Vincent Davis Jr <vince@underview.tech>
> > ----
> > - src/gbm/main/backend.c | 4 ++++
> > - 1 file changed, 4 insertions(+)
> > -
> > -diff --git a/src/gbm/main/backend.c b/src/gbm/main/backend.c
> > -index 974d0a76a4e..feee0703495 100644
> > ---- a/src/gbm/main/backend.c
> > -+++ b/src/gbm/main/backend.c
> > -@@ -42,7 +42,9 @@
> > - #define ARRAY_SIZE(a) (sizeof(a)/sizeof((a)[0]))
> > - #define VER_MIN(a, b) ((a) < (b) ? (a) : (b))
> > -
> > -+#if defined(HAVE_DRI) || defined(HAVE_DRI2) || defined(HAVE_DRI3)
> > - extern const struct gbm_backend gbm_dri_backend;
> > -+#endif
> > -
> > - struct gbm_backend_desc {
> > -    const char *name;
> > -@@ -51,7 +53,9 @@ struct gbm_backend_desc {
> > - };
> > -
> > - static const struct gbm_backend_desc builtin_backends[] =3D {
> > -+#if defined(HAVE_DRI) || defined(HAVE_DRI2) || defined(HAVE_DRI3)
> > -    { "dri", &gbm_dri_backend },
> > -+#endif
> > - };
> > -
> > - #define BACKEND_LIB_SUFFIX "_gbm"
> > ---
> > -2.34.1
> > -
> > diff --git
> a/meta/recipes-graphics/mesa/files/0001-util-format-Check-for-NEON-before=
-using-it.patch
> b/meta/recipes-graphics/mesa/files/0001-util-format-Check-for-NEON-before=
-using-it.patch
> > deleted file mode 100644
> > index d22ff3c8a8..0000000000
> > ---
> a/meta/recipes-graphics/mesa/files/0001-util-format-Check-for-NEON-before=
-using-it.patch
> > +++ /dev/null
> > @@ -1,47 +0,0 @@
> > -From f17e836ef9b1bbc6056790596420b699e48128c2 Mon Sep 17 00:00:00 2001
> > -From: Khem Raj <raj.khem@gmail.com>
> > -Date: Thu, 2 Dec 2021 19:57:42 -0800
> > -Subject: [PATCH] util/format: Check for NEON before using it
> > -
> > -This fixes build on rpi0-w and any other machine which does not have
> > -neon unit and is not used as FPU unit
> > -
> > -Fixes errors e.g.
> > -
> > -In file included from
> ../mesa-21.3.0/src/util/format/u_format_unpack_neon.c:35:
> >
> -/mnt/b/yoe/master/build/tmp/work/arm1176jzfshf-vfp-yoe-linux-gnueabi/mes=
a/2_21.3.0-r0/recipe-sysroot-native/usr/lib/clang/13.0.1/include/arm_neon.h=
:32:2:
> error: "NEON support not enabled"
> > -
> > -Upstream-Status: Submitted [
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/14032]
> > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > -
> > ----
> > - src/util/format/u_format.c             | 2 +-
> > - src/util/format/u_format_unpack_neon.c | 2 +-
> > - 2 files changed, 2 insertions(+), 2 deletions(-)
> > -
> > -diff --git a/src/util/format/u_format.c b/src/util/format/u_format.c
> > -index c071250..0880984 100644
> > ---- a/src/util/format/u_format.c
> > -+++ b/src/util/format/u_format.c
> > -@@ -1184,7 +1184,7 @@ static void
> > - util_format_unpack_table_init(void)
> > - {
> > -    for (enum pipe_format format =3D PIPE_FORMAT_NONE; format <
> PIPE_FORMAT_COUNT; format++) {
> > --#if (defined(PIPE_ARCH_AARCH64) || defined(PIPE_ARCH_ARM)) &&
> !defined(NO_FORMAT_ASM) && !defined(__SOFTFP__)
> > -+#if (defined(PIPE_ARCH_AARCH64) || (defined(__ARM_NEON) &&
> defined(PIPE_ARCH_ARM))) && !defined(NO_FORMAT_ASM)
> > -       const struct util_format_unpack_description *unpack =3D
> util_format_unpack_description_neon(format);
> > -       if (unpack) {
> > -          util_format_unpack_table[format] =3D unpack;
> > -diff --git a/src/util/format/u_format_unpack_neon.c
> b/src/util/format/u_format_unpack_neon.c
> > -index a4a5cb1..1e4f794 100644
> > ---- a/src/util/format/u_format_unpack_neon.c
> > -+++ b/src/util/format/u_format_unpack_neon.c
> > -@@ -23,7 +23,7 @@
> > -
> > - #include <u_format.h>
> > -
> > --#if (defined(PIPE_ARCH_AARCH64) || defined(PIPE_ARCH_ARM)) &&
> !defined(NO_FORMAT_ASM) && !defined(__SOFTFP__)
> > -+#if (defined(PIPE_ARCH_AARCH64) || (defined(__ARM_NEON) &&
> defined(PIPE_ARCH_ARM))) && !defined(NO_FORMAT_ASM)
> > -
> > - /* armhf builds default to vfp, not neon, and refuses to compile neon
> intrinsics
> > -  * unless you tell it "no really".
> > diff --git a/meta/recipes-graphics/mesa/mesa-gl_22.3.5.bb
> b/meta/recipes-graphics/mesa/mesa-gl_23.0.0.bb
> > similarity index 100%
> > rename from meta/recipes-graphics/mesa/mesa-gl_22.3.5.bb
> > rename to meta/recipes-graphics/mesa/mesa-gl_23.0.0.bb
> > diff --git a/meta/recipes-graphics/mesa/mesa.inc
> b/meta/recipes-graphics/mesa/mesa.inc
> > index b082b49400..8f72f25c17 100644
> > --- a/meta/recipes-graphics/mesa/mesa.inc
> > +++ b/meta/recipes-graphics/mesa/mesa.inc
> > @@ -17,12 +17,9 @@ PE =3D "2"
> >  SRC_URI =3D "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
> >
>  file://0001-meson.build-check-for-all-linux-host_os-combinations.patch \
> >
>  file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
> > -           file://0001-util-format-Check-for-NEON-before-using-it.patc=
h
> \
> > -           file://0001-gbm-backend-fix-gbm-compile-without-dri.patch \
> > -
>  file://0001-freedreno-pm4-Use-unsigned-instead-of-uint-to-fix-mu.patch \
> >             "
> >
> > -SRC_URI[sha256sum] =3D
> "3eed2ecae2bc674494566faab9fcc9beb21cd804c7ba2b59a1694f3d7236e6a9"
> > +SRC_URI[sha256sum] =3D
> "01f3cff3763f09e0adabcb8011e4aebc6ad48f6a4dd4bae904fe918707d253e4"
> >
> >  UPSTREAM_CHECK_GITTAGREGEX =3D "mesa-(?P<pver>\d+(\.\d+)+)"
> >
> > diff --git a/meta/recipes-graphics/mesa/mesa_22.3.5.bb
> b/meta/recipes-graphics/mesa/mesa_23.0.0.bb
> > similarity index 100%
> > rename from meta/recipes-graphics/mesa/mesa_22.3.5.bb
> > rename to meta/recipes-graphics/mesa/mesa_23.0.0.bb
> > --
> > 2.30.2
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#178696):
> https://lists.openembedded.org/g/openembedded-core/message/178696
> > Mute This Topic: https://lists.openembedded.org/mt/97647023/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--0000000000003ad5cc05f7281ceb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Ubuntu 18.04 goes EOL next month, so it should perhaps be=
 dropped from the builders and supported distro list?</div><div dir=3D"auto=
"><br></div><div dir=3D"auto">Alex</div><div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Sat 18. Mar 2023 at 2.47, Khem Ra=
j &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-=
left-color:rgb(204,204,204)">mesa 23.x fails to build with default gcc ( 7.=
5.0 ) Ubuntu<br>
7.5.0-3ubuntu1~18.04, it ends up with<br>
<br>
../mesa-23.0.0/src/intel/compiler/brw_simd_selection.cpp: In function<br>
=E2=80=98int brw_simd_select_for_workgroup_size(const intel_device_info*,<b=
r>
const brw_cs_prog_data*, const unsigned int*)=E2=80=99:<br>
../mesa-23.0.0/src/intel/compiler/brw_simd_selection.cpp:205:7: sorry,<br>
unimplemented: non-trivial designated initializers not supported<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0^<br>
<br>
see mesa-native failure<br>
<br>
<a href=3D"https://errors.yoctoproject.org/Errors/Details/698144/" rel=3D"n=
oreferrer" target=3D"_blank">https://errors.yoctoproject.org/Errors/Details=
/698144/</a><br>
<br>
I wonder how it works on AB nodes running Ubuntu 18.04. Do we enforce<br>
gcc from buildtools tarball there ?<br>
<br>
On Thu, Mar 16, 2023 at 2:41=E2=80=AFAM Alexander Kanavin<br>
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavi=
n@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Drop patches:<br>
&gt; 0001-gbm-backend-fix-gbm-compile-without-dri.patch<br>
&gt; 0001-freedreno-pm4-Use-unsigned-instead-of-uint-to-fix-mu.patch<br>
&gt; (backports)<br>
&gt;<br>
&gt; 0001-util-format-Check-for-NEON-before-using-it.patch<br>
&gt; (upstream submission has stalled with unanswered concerns from upstrea=
m;<br>
&gt; patch no longer applies; issue does not reproduce with &#39;raspberryp=
i0-wifi&#39; MACHINE)<br>
&gt;<br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix=
.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...e-unsigned-instead-of-uint-to-fix-mu.patch | 44 -------------=
<br>
&gt;=C2=A0 ...-backend-fix-gbm-compile-without-dri.patch | 65 -------------=
------<br>
&gt;=C2=A0 ...ormat-Check-for-NEON-before-using-it.patch | 47 -------------=
-<br>
&gt;=C2=A0 .../{<a href=3D"http://mesa-gl_22.3.5.bb" rel=3D"noreferrer" tar=
get=3D"_blank">mesa-gl_22.3.5.bb</a> =3D&gt; <a href=3D"http://mesa-gl_23.0=
.0.bb" rel=3D"noreferrer" target=3D"_blank">mesa-gl_23.0.0.bb</a>}=C2=A0 |=
=C2=A0 0<br>
&gt;=C2=A0 meta/recipes-graphics/mesa/mesa.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 5 +-<br>
&gt;=C2=A0 .../mesa/{<a href=3D"http://mesa_22.3.5.bb" rel=3D"noreferrer" t=
arget=3D"_blank">mesa_22.3.5.bb</a> =3D&gt; <a href=3D"http://mesa_23.0.0.b=
b" rel=3D"noreferrer" target=3D"_blank">mesa_23.0.0.bb</a>}=C2=A0 =C2=A0|=
=C2=A0 0<br>
&gt;=C2=A0 6 files changed, 1 insertion(+), 160 deletions(-)<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-graphics/mesa/files/0001-freedre=
no-pm4-Use-unsigned-instead-of-uint-to-fix-mu.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-graphics/mesa/files/0001-gbm-bac=
kend-fix-gbm-compile-without-dri.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-graphics/mesa/files/0001-util-fo=
rmat-Check-for-NEON-before-using-it.patch<br>
&gt;=C2=A0 rename meta/recipes-graphics/mesa/{<a href=3D"http://mesa-gl_22.=
3.5.bb" rel=3D"noreferrer" target=3D"_blank">mesa-gl_22.3.5.bb</a> =3D&gt; =
<a href=3D"http://mesa-gl_23.0.0.bb" rel=3D"noreferrer" target=3D"_blank">m=
esa-gl_23.0.0.bb</a>} (100%)<br>
&gt;=C2=A0 rename meta/recipes-graphics/mesa/{<a href=3D"http://mesa_22.3.5=
.bb" rel=3D"noreferrer" target=3D"_blank">mesa_22.3.5.bb</a> =3D&gt; <a hre=
f=3D"http://mesa_23.0.0.bb" rel=3D"noreferrer" target=3D"_blank">mesa_23.0.=
0.bb</a>} (100%)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-graphics/mesa/files/0001-freedreno-pm4-Use-u=
nsigned-instead-of-uint-to-fix-mu.patch b/meta/recipes-graphics/mesa/files/=
0001-freedreno-pm4-Use-unsigned-instead-of-uint-to-fix-mu.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 3ab22889bf..0000000000<br>
&gt; --- a/meta/recipes-graphics/mesa/files/0001-freedreno-pm4-Use-unsigned=
-instead-of-uint-to-fix-mu.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,44 +0,0 @@<br>
&gt; -From 8a5de0b6cf1090d7f29f3974ec79c32776cf2745 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Jami Kettunen &lt;<a href=3D"mailto:jami.kettunen@protonmail.co=
m" target=3D"_blank">jami.kettunen@protonmail.com</a>&gt;<br>
&gt; -Date: Tue, 31 Aug 2021 00:15:58 +0300<br>
&gt; -Subject: [PATCH] freedreno/pm4: Use unsigned instead of uint to fix m=
usl build<br>
&gt; -<br>
&gt; -Upstream-Status: Backport<br>
&gt; -<br>
&gt; -Fixes the following error I noticed when building against aarch64 wit=
h<br>
&gt; -musl libc:<br>
&gt; -<br>
&gt; -=C2=A0 In file included from ../src/freedreno/decode/crashdec.h:38,<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
from ../src/freedreno/decode/crashdec.c:40:<br>
&gt; -=C2=A0 ../src/freedreno/common/freedreno_pm4.h:104:15: error: unknown=
 type name &#39;uint&#39;<br>
&gt; -=C2=A0 =C2=A0 104 | static inline uint<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0^~~~<br>
&gt; -=C2=A0 ../src/freedreno/common/freedreno_pm4.h:105:25: error: unknown=
 type name &#39;uint&#39;; did you mean &#39;int&#39;?<br>
&gt; -=C2=A0 =C2=A0 105 | pm4_calc_odd_parity_bit(uint val)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int<br>
&gt; -<br>
&gt; -Signed-off-by: Jami Kettunen &lt;<a href=3D"mailto:jami.kettunen@prot=
onmail.com" target=3D"_blank">jami.kettunen@protonmail.com</a>&gt;<br>
&gt; -Part-of: &lt;<a href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/me=
rge_requests/19665" rel=3D"noreferrer" target=3D"_blank">https://gitlab.fre=
edesktop.org/mesa/mesa/-/merge_requests/19665</a>&gt;<br>
&gt; ----<br>
&gt; - src/freedreno/common/freedreno_pm4.h | 4 ++--<br>
&gt; - 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/src/freedreno/common/freedreno_pm4.h b/src/freedreno/com=
mon/freedreno_pm4.h<br>
&gt; -index 8f958953d693..091247e709a0 100644<br>
&gt; ---- a/src/freedreno/common/freedreno_pm4.h<br>
&gt; -+++ b/src/freedreno/common/freedreno_pm4.h<br>
&gt; -@@ -105,8 +105,8 @@ pm4_pkt7_hdr(uint8_t opcode, uint16_t cnt)<br>
&gt; - #define cp_type3_opcode(pkt) (((pkt) &gt;&gt; 8) &amp; 0xFF)<br>
&gt; - #define type3_pkt_size(pkt)=C2=A0 ((((pkt) &gt;&gt; 16) &amp; 0x3FFF=
) + 1)<br>
&gt; -<br>
&gt; --static inline uint<br>
&gt; --pm4_calc_odd_parity_bit(uint val)<br>
&gt; -+static inline unsigned<br>
&gt; -+pm4_calc_odd_parity_bit(unsigned val)<br>
&gt; - {<br>
&gt; -=C2=A0 =C2=A0 return (0x9669 &gt;&gt; (0xf &amp; ((val) ^ ((val) &gt;=
&gt; 4) ^ ((val) &gt;&gt; 8) ^<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((val) &gt;&gt; 12) ^ ((val) &gt;&gt; 1=
6) ^ ((val) &gt;&gt; 20) ^<br>
&gt; ---<br>
&gt; -2.39.2<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-graphics/mesa/files/0001-gbm-backend-fix-gbm=
-compile-without-dri.patch b/meta/recipes-graphics/mesa/files/0001-gbm-back=
end-fix-gbm-compile-without-dri.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 6541671b7a..0000000000<br>
&gt; --- a/meta/recipes-graphics/mesa/files/0001-gbm-backend-fix-gbm-compil=
e-without-dri.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,65 +0,0 @@<br>
&gt; -From 25946100e21cf2095bea334e8d7096798561d0b7 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Vincent Davis Jr &lt;vince@underview.tech&gt;<br>
&gt; -Date: Wed, 28 Dec 2022 16:28:01 -0600<br>
&gt; -Subject: [PATCH] gbm/backend: fix gbm compile without dri<br>
&gt; -<br>
&gt; -Upstream-Status: Backport<br>
&gt; -<br>
&gt; -<a href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/=
20447" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/=
mesa/mesa/-/merge_requests/20447</a><br>
&gt; -<a href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/commit/842ca284=
650f066e58706741a7d22d67b5088e60" rel=3D"noreferrer" target=3D"_blank">http=
s://gitlab.freedesktop.org/mesa/mesa/-/commit/842ca284650f066e58706741a7d22=
d67b5088e60</a><br>
&gt; -<br>
&gt; -At mesa version 22.2.3 patch wasn&#39;t introduced until after.<br>
&gt; -<br>
&gt; -Commit introduces a fix that allows for gbm to be built with an empty=
<br>
&gt; -backend. There are situation especially in a Yocto/OE cross compilati=
on<br>
&gt; -environment where you want to build with an empty backend. The partic=
ular<br>
&gt; -situation is as such:<br>
&gt; -<br>
&gt; -The mesa-gl recipe is the preferred provider for virtual/libgbm, virt=
ual/libgl,<br>
&gt; -virtual/mesa, etc... But the x11 DISTRO_FEATURE in&#39;t included thi=
s leads to build<br>
&gt; -errors such as:<br>
&gt; -<br>
&gt; -| /../../../ld: src/gbm/libgbm.so.1.0.0.p/main_backend.c.o: in functi=
on `find_backend&#39;:<br>
&gt; -| backend.c:(.text.find_backend+0xa4): undefined reference to `gbm_dr=
i_backend&#39;<br>
&gt; -| /../../../ld: src/gbm/libgbm.so.1.0.0.p/main_backend.c.o:(.data.rel=
.ro.builtin_backends+0x4):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 undefined ref=
erence to `gbm_dri_backend&#39;<br>
&gt; -| collect2: error: ld returned 1 exit status<br>
&gt; -<br>
&gt; -Issue should be replicable by setting -Ddri3=3Ddisabled and -Dgbm=3De=
nabled<br>
&gt; -<br>
&gt; -Add fix to bypasses compilation issue by excluding gbm dri backend. I=
f<br>
&gt; -HAVE_DRI || HAVE_DRIX not specified.<br>
&gt; -<br>
&gt; -Acked-by: David Heidelberg &lt;<a href=3D"mailto:david.heidelberg@col=
labora.com" target=3D"_blank">david.heidelberg@collabora.com</a>&gt;<br>
&gt; -Signed-off-by: Vincent Davis Jr &lt;vince@underview.tech&gt;<br>
&gt; ----<br>
&gt; - src/gbm/main/backend.c | 4 ++++<br>
&gt; - 1 file changed, 4 insertions(+)<br>
&gt; -<br>
&gt; -diff --git a/src/gbm/main/backend.c b/src/gbm/main/backend.c<br>
&gt; -index 974d0a76a4e..feee0703495 100644<br>
&gt; ---- a/src/gbm/main/backend.c<br>
&gt; -+++ b/src/gbm/main/backend.c<br>
&gt; -@@ -42,7 +42,9 @@<br>
&gt; - #define ARRAY_SIZE(a) (sizeof(a)/sizeof((a)[0]))<br>
&gt; - #define VER_MIN(a, b) ((a) &lt; (b) ? (a) : (b))<br>
&gt; -<br>
&gt; -+#if defined(HAVE_DRI) || defined(HAVE_DRI2) || defined(HAVE_DRI3)<br=
>
&gt; - extern const struct gbm_backend gbm_dri_backend;<br>
&gt; -+#endif<br>
&gt; -<br>
&gt; - struct gbm_backend_desc {<br>
&gt; -=C2=A0 =C2=A0 const char *name;<br>
&gt; -@@ -51,7 +53,9 @@ struct gbm_backend_desc {<br>
&gt; - };<br>
&gt; -<br>
&gt; - static const struct gbm_backend_desc builtin_backends[] =3D {<br>
&gt; -+#if defined(HAVE_DRI) || defined(HAVE_DRI2) || defined(HAVE_DRI3)<br=
>
&gt; -=C2=A0 =C2=A0 { &quot;dri&quot;, &amp;gbm_dri_backend },<br>
&gt; -+#endif<br>
&gt; - };<br>
&gt; -<br>
&gt; - #define BACKEND_LIB_SUFFIX &quot;_gbm&quot;<br>
&gt; ---<br>
&gt; -2.34.1<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-graphics/mesa/files/0001-util-format-Check-f=
or-NEON-before-using-it.patch b/meta/recipes-graphics/mesa/files/0001-util-=
format-Check-for-NEON-before-using-it.patch<br>
&gt; deleted file mode 100644<br>
&gt; index d22ff3c8a8..0000000000<br>
&gt; --- a/meta/recipes-graphics/mesa/files/0001-util-format-Check-for-NEON=
-before-using-it.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,47 +0,0 @@<br>
&gt; -From f17e836ef9b1bbc6056790596420b699e48128c2 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;<br>
&gt; -Date: Thu, 2 Dec 2021 19:57:42 -0800<br>
&gt; -Subject: [PATCH] util/format: Check for NEON before using it<br>
&gt; -<br>
&gt; -This fixes build on rpi0-w and any other machine which does not have<=
br>
&gt; -neon unit and is not used as FPU unit<br>
&gt; -<br>
&gt; -Fixes errors e.g.<br>
&gt; -<br>
&gt; -In file included from ../mesa-21.3.0/src/util/format/u_format_unpack_=
neon.c:35:<br>
&gt; -/mnt/b/yoe/master/build/tmp/work/arm1176jzfshf-vfp-yoe-linux-gnueabi/=
mesa/2_21.3.0-r0/recipe-sysroot-native/usr/lib/clang/13.0.1/include/arm_neo=
n.h:32:2: error: &quot;NEON support not enabled&quot;<br>
&gt; -<br>
&gt; -Upstream-Status: Submitted [<a href=3D"https://gitlab.freedesktop.org=
/mesa/mesa/-/merge_requests/14032" rel=3D"noreferrer" target=3D"_blank">htt=
ps://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/14032</a>]<br>
&gt; -Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; -<br>
&gt; ----<br>
&gt; - src/util/format/u_format.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 2 +-<br>
&gt; - src/util/format/u_format_unpack_neon.c | 2 +-<br>
&gt; - 2 files changed, 2 insertions(+), 2 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/src/util/format/u_format.c b/src/util/format/u_format.c<=
br>
&gt; -index c071250..0880984 100644<br>
&gt; ---- a/src/util/format/u_format.c<br>
&gt; -+++ b/src/util/format/u_format.c<br>
&gt; -@@ -1184,7 +1184,7 @@ static void<br>
&gt; - util_format_unpack_table_init(void)<br>
&gt; - {<br>
&gt; -=C2=A0 =C2=A0 for (enum pipe_format format =3D PIPE_FORMAT_NONE; form=
at &lt; PIPE_FORMAT_COUNT; format++) {<br>
&gt; --#if (defined(PIPE_ARCH_AARCH64) || defined(PIPE_ARCH_ARM)) &amp;&amp=
; !defined(NO_FORMAT_ASM) &amp;&amp; !defined(__SOFTFP__)<br>
&gt; -+#if (defined(PIPE_ARCH_AARCH64) || (defined(__ARM_NEON) &amp;&amp; d=
efined(PIPE_ARCH_ARM))) &amp;&amp; !defined(NO_FORMAT_ASM)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct util_format_unpack_descriptio=
n *unpack =3D util_format_unpack_description_neon(format);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (unpack) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 util_format_unpack_table[format] =
=3D unpack;<br>
&gt; -diff --git a/src/util/format/u_format_unpack_neon.c b/src/util/format=
/u_format_unpack_neon.c<br>
&gt; -index a4a5cb1..1e4f794 100644<br>
&gt; ---- a/src/util/format/u_format_unpack_neon.c<br>
&gt; -+++ b/src/util/format/u_format_unpack_neon.c<br>
&gt; -@@ -23,7 +23,7 @@<br>
&gt; -<br>
&gt; - #include &lt;u_format.h&gt;<br>
&gt; -<br>
&gt; --#if (defined(PIPE_ARCH_AARCH64) || defined(PIPE_ARCH_ARM)) &amp;&amp=
; !defined(NO_FORMAT_ASM) &amp;&amp; !defined(__SOFTFP__)<br>
&gt; -+#if (defined(PIPE_ARCH_AARCH64) || (defined(__ARM_NEON) &amp;&amp; d=
efined(PIPE_ARCH_ARM))) &amp;&amp; !defined(NO_FORMAT_ASM)<br>
&gt; -<br>
&gt; - /* armhf builds default to vfp, not neon, and refuses to compile neo=
n intrinsics<br>
&gt; -=C2=A0 * unless you tell it &quot;no really&quot;.<br>
&gt; diff --git a/meta/recipes-graphics/mesa/<a href=3D"http://mesa-gl_22.3=
.5.bb" rel=3D"noreferrer" target=3D"_blank">mesa-gl_22.3.5.bb</a> b/meta/re=
cipes-graphics/mesa/<a href=3D"http://mesa-gl_23.0.0.bb" rel=3D"noreferrer"=
 target=3D"_blank">mesa-gl_23.0.0.bb</a><br>
&gt; similarity index 100%<br>
&gt; rename from meta/recipes-graphics/mesa/<a href=3D"http://mesa-gl_22.3.=
5.bb" rel=3D"noreferrer" target=3D"_blank">mesa-gl_22.3.5.bb</a><br>
&gt; rename to meta/recipes-graphics/mesa/<a href=3D"http://mesa-gl_23.0.0.=
bb" rel=3D"noreferrer" target=3D"_blank">mesa-gl_23.0.0.bb</a><br>
&gt; diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphi=
cs/mesa/mesa.inc<br>
&gt; index b082b49400..8f72f25c17 100644<br>
&gt; --- a/meta/recipes-graphics/mesa/mesa.inc<br>
&gt; +++ b/meta/recipes-graphics/mesa/mesa.inc<br>
&gt; @@ -17,12 +17,9 @@ PE =3D &quot;2&quot;<br>
&gt;=C2=A0 SRC_URI =3D &quot;<a href=3D"https://mesa.freedesktop.org/archiv=
e/mesa-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">https://mesa.=
freedesktop.org/archive/mesa-${PV}.tar.xz</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-meson.build=
-check-for-all-linux-host_os-combinations.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-meson-misde=
tects-64bit-atomics-on-mips-clang.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-util-format-Chec=
k-for-NEON-before-using-it.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-gbm-backend-fix-=
gbm-compile-without-dri.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-freedreno-pm4-Us=
e-unsigned-instead-of-uint-to-fix-mu.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;3eed2ecae2bc674494566faab9fcc9beb21cd804=
c7ba2b59a1694f3d7236e6a9&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;01f3cff3763f09e0adabcb8011e4aebc6ad48f6a=
4dd4bae904fe918707d253e4&quot;<br>
&gt;<br>
&gt;=C2=A0 UPSTREAM_CHECK_GITTAGREGEX =3D &quot;mesa-(?P&lt;pver&gt;\d+(\.\=
d+)+)&quot;<br>
&gt;<br>
&gt; diff --git a/meta/recipes-graphics/mesa/<a href=3D"http://mesa_22.3.5.=
bb" rel=3D"noreferrer" target=3D"_blank">mesa_22.3.5.bb</a> b/meta/recipes-=
graphics/mesa/<a href=3D"http://mesa_23.0.0.bb" rel=3D"noreferrer" target=
=3D"_blank">mesa_23.0.0.bb</a><br>
&gt; similarity index 100%<br>
&gt; rename from meta/recipes-graphics/mesa/<a href=3D"http://mesa_22.3.5.b=
b" rel=3D"noreferrer" target=3D"_blank">mesa_22.3.5.bb</a><br>
&gt; rename to meta/recipes-graphics/mesa/<a href=3D"http://mesa_23.0.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">mesa_23.0.0.bb</a><br>
&gt; --<br>
&gt; 2.30.2<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#178696): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/178696" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/178696</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/97647023=
/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/97647023/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" t=
arget=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div></div>

--0000000000003ad5cc05f7281ceb--

