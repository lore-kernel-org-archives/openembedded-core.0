Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29DC5C6FD19
	for <webhook@archiver.kernel.org>; Mon, 13 Mar 2023 07:52:33 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.14243.1678693946587784054
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Mar 2023 00:52:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hrVUgivf;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id g17so14513088lfv.4
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 00:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678693945;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y8BCyHkqz6JZI5tGsE/OmA87LojAdduvX1xbrXmlLO4=;
        b=hrVUgivfYpYojFLN9he3vRlQg0tiwNW/knCotRtebXDTqIaiCwXg9fNXiH/AnAFxkY
         7iOU+9riS1I16vpqT0c5Uv4gX0QixVzbsBQoZzDXbcEChmf0Yeh5nZ35FYxpgaGeWgTY
         S5Eu09Eh/XC1WLy/i5nOFLrtkHIGFFVaQ/WtQLebWMBeirlhu1rMfmJmkW96BeYFMeKm
         rZsugI/0jU4vlecSnGyY7ctHQs1tZAvn+I1qSF/7njxiIlH++sXa++gFBcE7tD+r+bpS
         D/s+S27IaDW31/SxeEXs4j/SgIt76hZ/D+B23qfdh4Sjy7Yi86LdVWDdQjKvDqY4y9Uo
         vWNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678693945;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y8BCyHkqz6JZI5tGsE/OmA87LojAdduvX1xbrXmlLO4=;
        b=mE70vZUkiCp4nrvDLDLzBQPT2PmRqVhzT19NNLyrDhdmBN9Y4OprgwTGPpJxtfbPi2
         8Yzogwtf5Helx6zU+kOG4dlOoIPJoSxpy0WfohNgkgmNoyhv8uI27dRqt7Ql2iZTt30j
         Kx7umho7RVsbQFeu5Dei6J3nfZeftivV+OhKc/wzssNt6JxJbrepKSbt1IgPM+6W4L62
         vpd19xyy+/ZHcQzF+6uJM/hoYCz1xLqTKTQu5eufb8nawd8yDuXCUjAmeLF9vCbFTinq
         byJL3kiGgD76N//nBr6yxaTZnd1OtIEf5OSOUAYFhEE1+LAiirrRoA7Swy8Rp0eRY8zg
         D4DA==
X-Gm-Message-State: AO0yUKXLkV410yILfeuEczYKI0bw3slwmVqocY/8HQPdeuWNmCppZJpK
	aMk/DMM99MXdXDSVay2HxCe/9ISqAZXBIJmp+Ro=
X-Google-Smtp-Source: AK7set8G17Fy8lOetmDX75XdshJ8PqmUz0H2m2q6AkUGbL5/ht4nH0Qs+izndgpmKMdn1vXRb1y2Rf/B5R5rMzoEq5U=
X-Received: by 2002:a19:e019:0:b0:4d8:86c2:75ea with SMTP id
 x25-20020a19e019000000b004d886c275eamr4531783lfg.3.1678693944546; Mon, 13 Mar
 2023 00:52:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230312145053.1427377-1-alex@linutronix.de> <20230312145053.1427377-7-alex@linutronix.de>
 <dd1d39aa-1f3c-c986-9d2d-cb4707365c0d@gmail.com>
In-Reply-To: <dd1d39aa-1f3c-c986-9d2d-cb4707365c0d@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 13 Mar 2023 08:52:13 +0100
Message-ID: <CANNYZj_XDHjeCA_n-PAECPyomYMu4qh2=bZ1dVkR+9i+x-jt1A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 7/7] mesa: update 22.3.5 -> 23.0.0
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 07:52:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178411

We are in the feature freeze now (see weekly status emails). If there
are more pressing concerns for release stability (and there usually
are), the patchset won't be taken until after the release. If you want
it to go in sooner, help with those issues would be appreciated (you
can ask on #yocto irc).

Alex

On Mon, 13 Mar 2023 at 07:15, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zbosz=
or@gmail.com> wrote:
>
> Thanks for taking care of this series.
>
> Will this be in Mickledore?
>
> 2023. 03. 12. 15:50 keltez=C3=A9ssel, Alexander Kanavin =C3=ADrta:
> > Drop patches:
> > 0001-gbm-backend-fix-gbm-compile-without-dri.patch
> > 0001-freedreno-pm4-Use-unsigned-instead-of-uint-to-fix-mu.patch
> > (backports)
> >
> > 0001-util-format-Check-for-NEON-before-using-it.patch
> > (upstream submission has stalled with unanswered concerns from upstream=
;
> > patch no longer applies; issue does not reproduce with 'raspberrypi0-wi=
fi' MACHINE)
> >
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > ---
> >   ...e-unsigned-instead-of-uint-to-fix-mu.patch | 44 -------------
> >   ...-backend-fix-gbm-compile-without-dri.patch | 65 ------------------=
-
> >   ...ormat-Check-for-NEON-before-using-it.patch | 47 --------------
> >   .../{mesa-gl_22.3.5.bb =3D> mesa-gl_23.0.0.bb}  |  0
> >   meta/recipes-graphics/mesa/mesa.inc           |  5 +-
> >   .../mesa/{mesa_22.3.5.bb =3D> mesa_23.0.0.bb}   |  0
> >   6 files changed, 1 insertion(+), 160 deletions(-)
> >   delete mode 100644 meta/recipes-graphics/mesa/files/0001-freedreno-pm=
4-Use-unsigned-instead-of-uint-to-fix-mu.patch
> >   delete mode 100644 meta/recipes-graphics/mesa/files/0001-gbm-backend-=
fix-gbm-compile-without-dri.patch
> >   delete mode 100644 meta/recipes-graphics/mesa/files/0001-util-format-=
Check-for-NEON-before-using-it.patch
> >   rename meta/recipes-graphics/mesa/{mesa-gl_22.3.5.bb =3D> mesa-gl_23.=
0.0.bb} (100%)
> >   rename meta/recipes-graphics/mesa/{mesa_22.3.5.bb =3D> mesa_23.0.0.bb=
} (100%)
> >
> > diff --git a/meta/recipes-graphics/mesa/files/0001-freedreno-pm4-Use-un=
signed-instead-of-uint-to-fix-mu.patch b/meta/recipes-graphics/mesa/files/0=
001-freedreno-pm4-Use-unsigned-instead-of-uint-to-fix-mu.patch
> > deleted file mode 100644
> > index 3ab22889bf..0000000000
> > --- a/meta/recipes-graphics/mesa/files/0001-freedreno-pm4-Use-unsigned-=
instead-of-uint-to-fix-mu.patch
> > +++ /dev/null
> > @@ -1,44 +0,0 @@
> > -From 8a5de0b6cf1090d7f29f3974ec79c32776cf2745 Mon Sep 17 00:00:00 2001
> > -From: Jami Kettunen <jami.kettunen@protonmail.com>
> > -Date: Tue, 31 Aug 2021 00:15:58 +0300
> > -Subject: [PATCH] freedreno/pm4: Use unsigned instead of uint to fix mu=
sl build
> > -
> > -Upstream-Status: Backport
> > -
> > -Fixes the following error I noticed when building against aarch64 with
> > -musl libc:
> > -
> > -  In file included from ../src/freedreno/decode/crashdec.h:38,
> > -                   from ../src/freedreno/decode/crashdec.c:40:
> > -  ../src/freedreno/common/freedreno_pm4.h:104:15: error: unknown type =
name 'uint'
> > -    104 | static inline uint
> > -        |               ^~~~
> > -  ../src/freedreno/common/freedreno_pm4.h:105:25: error: unknown type =
name 'uint'; did you mean 'int'?
> > -    105 | pm4_calc_odd_parity_bit(uint val)
> > -        |                         ^~~~
> > -        |                         int
> > -
> > -Signed-off-by: Jami Kettunen <jami.kettunen@protonmail.com>
> > -Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/19=
665>
> > ----
> > - src/freedreno/common/freedreno_pm4.h | 4 ++--
> > - 1 file changed, 2 insertions(+), 2 deletions(-)
> > -
> > -diff --git a/src/freedreno/common/freedreno_pm4.h b/src/freedreno/comm=
on/freedreno_pm4.h
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
> 20) ^
> > ---
> > -2.39.2
> > -
> > diff --git a/meta/recipes-graphics/mesa/files/0001-gbm-backend-fix-gbm-=
compile-without-dri.patch b/meta/recipes-graphics/mesa/files/0001-gbm-backe=
nd-fix-gbm-compile-without-dri.patch
> > deleted file mode 100644
> > index 6541671b7a..0000000000
> > --- a/meta/recipes-graphics/mesa/files/0001-gbm-backend-fix-gbm-compile=
-without-dri.patch
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
> > -https://gitlab.freedesktop.org/mesa/mesa/-/commit/842ca284650f066e5870=
6741a7d22d67b5088e60
> > -
> > -At mesa version 22.2.3 patch wasn't introduced until after.
> > -
> > -Commit introduces a fix that allows for gbm to be built with an empty
> > -backend. There are situation especially in a Yocto/OE cross compilatio=
n
> > -environment where you want to build with an empty backend. The particu=
lar
> > -situation is as such:
> > -
> > -The mesa-gl recipe is the preferred provider for virtual/libgbm, virtu=
al/libgl,
> > -virtual/mesa, etc... But the x11 DISTRO_FEATURE in't included this lea=
ds to build
> > -errors such as:
> > -
> > -| /../../../ld: src/gbm/libgbm.so.1.0.0.p/main_backend.c.o: in functio=
n `find_backend':
> > -| backend.c:(.text.find_backend+0xa4): undefined reference to `gbm_dri=
_backend'
> > -| /../../../ld: src/gbm/libgbm.so.1.0.0.p/main_backend.c.o:(.data.rel.=
ro.builtin_backends+0x4):
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
> > diff --git a/meta/recipes-graphics/mesa/files/0001-util-format-Check-fo=
r-NEON-before-using-it.patch b/meta/recipes-graphics/mesa/files/0001-util-f=
ormat-Check-for-NEON-before-using-it.patch
> > deleted file mode 100644
> > index d22ff3c8a8..0000000000
> > --- a/meta/recipes-graphics/mesa/files/0001-util-format-Check-for-NEON-=
before-using-it.patch
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
> > -In file included from ../mesa-21.3.0/src/util/format/u_format_unpack_n=
eon.c:35:
> > -/mnt/b/yoe/master/build/tmp/work/arm1176jzfshf-vfp-yoe-linux-gnueabi/m=
esa/2_21.3.0-r0/recipe-sysroot-native/usr/lib/clang/13.0.1/include/arm_neon=
.h:32:2: error: "NEON support not enabled"
> > -
> > -Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-=
/merge_requests/14032]
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
> > -    for (enum pipe_format format =3D PIPE_FORMAT_NONE; format < PIPE_F=
ORMAT_COUNT; format++) {
> > --#if (defined(PIPE_ARCH_AARCH64) || defined(PIPE_ARCH_ARM)) && !define=
d(NO_FORMAT_ASM) && !defined(__SOFTFP__)
> > -+#if (defined(PIPE_ARCH_AARCH64) || (defined(__ARM_NEON) && defined(PI=
PE_ARCH_ARM))) && !defined(NO_FORMAT_ASM)
> > -       const struct util_format_unpack_description *unpack =3D util_fo=
rmat_unpack_description_neon(format);
> > -       if (unpack) {
> > -          util_format_unpack_table[format] =3D unpack;
> > -diff --git a/src/util/format/u_format_unpack_neon.c b/src/util/format/=
u_format_unpack_neon.c
> > -index a4a5cb1..1e4f794 100644
> > ---- a/src/util/format/u_format_unpack_neon.c
> > -+++ b/src/util/format/u_format_unpack_neon.c
> > -@@ -23,7 +23,7 @@
> > -
> > - #include <u_format.h>
> > -
> > --#if (defined(PIPE_ARCH_AARCH64) || defined(PIPE_ARCH_ARM)) && !define=
d(NO_FORMAT_ASM) && !defined(__SOFTFP__)
> > -+#if (defined(PIPE_ARCH_AARCH64) || (defined(__ARM_NEON) && defined(PI=
PE_ARCH_ARM))) && !defined(NO_FORMAT_ASM)
> > -
> > - /* armhf builds default to vfp, not neon, and refuses to compile neon=
 intrinsics
> > -  * unless you tell it "no really".
> > diff --git a/meta/recipes-graphics/mesa/mesa-gl_22.3.5.bb b/meta/recipe=
s-graphics/mesa/mesa-gl_23.0.0.bb
> > similarity index 100%
> > rename from meta/recipes-graphics/mesa/mesa-gl_22.3.5.bb
> > rename to meta/recipes-graphics/mesa/mesa-gl_23.0.0.bb
> > diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphic=
s/mesa/mesa.inc
> > index 370b54ca6b..09a35ef33e 100644
> > --- a/meta/recipes-graphics/mesa/mesa.inc
> > +++ b/meta/recipes-graphics/mesa/mesa.inc
> > @@ -17,12 +17,9 @@ PE =3D "2"
> >   SRC_URI =3D "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
> >              file://0001-meson.build-check-for-all-linux-host_os-combin=
ations.patch \
> >              file://0001-meson-misdetects-64bit-atomics-on-mips-clang.p=
atch \
> > -           file://0001-util-format-Check-for-NEON-before-using-it.patc=
h \
> > -           file://0001-gbm-backend-fix-gbm-compile-without-dri.patch \
> > -           file://0001-freedreno-pm4-Use-unsigned-instead-of-uint-to-f=
ix-mu.patch \
> >              "
> >
> > -SRC_URI[sha256sum] =3D "3eed2ecae2bc674494566faab9fcc9beb21cd804c7ba2b=
59a1694f3d7236e6a9"
> > +SRC_URI[sha256sum] =3D "01f3cff3763f09e0adabcb8011e4aebc6ad48f6a4dd4ba=
e904fe918707d253e4"
> >
> >   UPSTREAM_CHECK_GITTAGREGEX =3D "mesa-(?P<pver>\d+(\.\d+)+)"
> >
> > diff --git a/meta/recipes-graphics/mesa/mesa_22.3.5.bb b/meta/recipes-g=
raphics/mesa/mesa_23.0.0.bb
> > similarity index 100%
> > rename from meta/recipes-graphics/mesa/mesa_22.3.5.bb
> > rename to meta/recipes-graphics/mesa/mesa_23.0.0.bb
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#178398): https://lists.openembedded.org/g/openembed=
ded-core/message/178398
> > Mute This Topic: https://lists.openembedded.org/mt/97560257/3617728
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
zboszor@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

