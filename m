Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C43AC61DA4
	for <webhook@archiver.kernel.org>; Sat, 18 Mar 2023 18:38:16 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web11.2075.1679164686359619754
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Mar 2023 11:38:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=F4xKPrke;
 spf=pass (domain: gmail.com, ip: 209.85.167.171, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f171.google.com with SMTP id t10so2351192oiw.4
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Mar 2023 11:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679164685;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fbSRZEotOcmyLuFcO9KdS06wUl8nCmXsWYoU4LtoK4E=;
        b=F4xKPrkexriVUk17xrT7cUr3lL/EPKFPw43VKuTy3K5ogF8WcpWxn4lsAXmgz1cCe9
         3u2IlhINhvCacxfiDwJhEnaRHNBjnyrUMJpMWDxtG0/DDOgWXdOOSdtTzf8O9H7srTRk
         DyYz7oQI9GZC7GmU1Vivkeby7KoO4IWjxuhOkDVzTWtMWMqbVdlXgX9fDLAmDBF+/QcC
         4P1qGnUxm07/FYo4Uwuk1KRbvE2FnpUp1DHdjWQvKi2G26FkndrKxQ6ICR5Wc4MdruyH
         /KrjDGdrdLwAOJIi+lepc/PJOq+vZA46ClrhtJe8DE9hVJ3YfUjXKZV2y5jnVl2HBBIl
         Pa7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679164685;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fbSRZEotOcmyLuFcO9KdS06wUl8nCmXsWYoU4LtoK4E=;
        b=Ph3HrQXbWnnjvBxjmhbK/GdDS2anh2o2yFkyz0GxSZHr1nu3UbenuRVQOW8/w8/xxC
         Rmonlp/SxjWWXnyJZ2gcdyUD+ic1n4BcFP1oUQeeUdmJu1AOeD0fygeTvYXHfV2ZnzxF
         mkGQdz46moYjI+apiiY9a3zC+OSdT2QzFMZFSRaf81W0QFvlu9mj5RRlvqF6spW7Y7Un
         /mo4tdzAo1K/6YDxTBO71KgPsmPMWjW456qLAsOOJWXPALeoXingAjp0O0Vcxyty0coC
         3kq9ydoMtAnign19rVY1FTALQNOC4Mw3cKPWzyFyek8mwut1E/+Pg4SIAbpcelE9L0T9
         GiZA==
X-Gm-Message-State: AO0yUKWO4cQkObSfcbM5dSH84yB/IGCqAjKJA0JuPIVM8x1k220WnvDm
	2x4JPDiSM34BLu7MZuSNyqf3ZxcEiW6yHAhtG5c=
X-Google-Smtp-Source: AK7set+t7LQplR5uovpHPdOAOo0sxGoyhg94GByUs77qCRPoqYzg7HGnHykQfslQ3pfeDmLZqIfwP01iaOtP7G7nJ7k=
X-Received: by 2002:aca:d08:0:b0:384:3518:df33 with SMTP id
 8-20020aca0d08000000b003843518df33mr4359668oin.4.1679164685380; Sat, 18 Mar
 2023 11:38:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230316094102.2628727-1-alex@linutronix.de> <20230316094102.2628727-6-alex@linutronix.de>
 <CAMKF1sqhwupoW0kV7ao94DvdbxTH4B5i3HfMwOnp6M+g0g85Sg@mail.gmail.com> <CANNYZj9rnnKP_wGaqqg8ozVz1Q5ikbqccQCADshnFpuozG3MyQ@mail.gmail.com>
In-Reply-To: <CANNYZj9rnnKP_wGaqqg8ozVz1Q5ikbqccQCADshnFpuozG3MyQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 18 Mar 2023 11:37:39 -0700
Message-ID: <CAMKF1spQmR-yy3nvjDs6aDMKd-NB3yBMPTTCvp8XNptfYRPjPQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 6/6] mesa: update 22.3.5 -> 23.0.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Alexander Kanavin <alex@linutronix.de>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Mar 2023 18:38:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178791

On Sat, Mar 18, 2023 at 1:02=E2=80=AFAM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Ubuntu 18.04 goes EOL next month, so it should perhaps be dropped from th=
e builders and supported distro list?
>

Perhaps in the next cycle yes and definitely for the next LTS it
should be dropped.

Its stll supported via Extended Security Maintenance (ESM)  and users
maybe still be using it.

mesa needs gcc > 8 as per
https://docs.mesa3d.org/install.html?highlight=3Dgcc+version#compiler
so 7.5 default on ubuntu 18.04 is falling under unsupported compilers
for mesa. So we should be recommending
buildtools-tarball-extra and also installing it on ubuntu 18.04 workers.

> Alex
>
> On Sat 18. Mar 2023 at 2.47, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> mesa 23.x fails to build with default gcc ( 7.5.0 ) Ubuntu
>> 7.5.0-3ubuntu1~18.04, it ends up with
>>
>> ../mesa-23.0.0/src/intel/compiler/brw_simd_selection.cpp: In function
>> =E2=80=98int brw_simd_select_for_workgroup_size(const intel_device_info*=
,
>> const brw_cs_prog_data*, const unsigned int*)=E2=80=99:
>> ../mesa-23.0.0/src/intel/compiler/brw_simd_selection.cpp:205:7: sorry,
>> unimplemented: non-trivial designated initializers not supported
>>        };
>>        ^
>>
>> see mesa-native failure
>>
>> https://errors.yoctoproject.org/Errors/Details/698144/
>>
>> I wonder how it works on AB nodes running Ubuntu 18.04. Do we enforce
>> gcc from buildtools tarball there ?
>>
>> On Thu, Mar 16, 2023 at 2:41=E2=80=AFAM Alexander Kanavin
>> <alex.kanavin@gmail.com> wrote:
>> >
>> > Drop patches:
>> > 0001-gbm-backend-fix-gbm-compile-without-dri.patch
>> > 0001-freedreno-pm4-Use-unsigned-instead-of-uint-to-fix-mu.patch
>> > (backports)
>> >
>> > 0001-util-format-Check-for-NEON-before-using-it.patch
>> > (upstream submission has stalled with unanswered concerns from upstrea=
m;
>> > patch no longer applies; issue does not reproduce with 'raspberrypi0-w=
ifi' MACHINE)
>> >
>> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>> > ---
>> >  ...e-unsigned-instead-of-uint-to-fix-mu.patch | 44 -------------
>> >  ...-backend-fix-gbm-compile-without-dri.patch | 65 ------------------=
-
>> >  ...ormat-Check-for-NEON-before-using-it.patch | 47 --------------
>> >  .../{mesa-gl_22.3.5.bb =3D> mesa-gl_23.0.0.bb}  |  0
>> >  meta/recipes-graphics/mesa/mesa.inc           |  5 +-
>> >  .../mesa/{mesa_22.3.5.bb =3D> mesa_23.0.0.bb}   |  0
>> >  6 files changed, 1 insertion(+), 160 deletions(-)
>> >  delete mode 100644 meta/recipes-graphics/mesa/files/0001-freedreno-pm=
4-Use-unsigned-instead-of-uint-to-fix-mu.patch
>> >  delete mode 100644 meta/recipes-graphics/mesa/files/0001-gbm-backend-=
fix-gbm-compile-without-dri.patch
>> >  delete mode 100644 meta/recipes-graphics/mesa/files/0001-util-format-=
Check-for-NEON-before-using-it.patch
>> >  rename meta/recipes-graphics/mesa/{mesa-gl_22.3.5.bb =3D> mesa-gl_23.=
0.0.bb} (100%)
>> >  rename meta/recipes-graphics/mesa/{mesa_22.3.5.bb =3D> mesa_23.0.0.bb=
} (100%)
>> >
>> > diff --git a/meta/recipes-graphics/mesa/files/0001-freedreno-pm4-Use-u=
nsigned-instead-of-uint-to-fix-mu.patch b/meta/recipes-graphics/mesa/files/=
0001-freedreno-pm4-Use-unsigned-instead-of-uint-to-fix-mu.patch
>> > deleted file mode 100644
>> > index 3ab22889bf..0000000000
>> > --- a/meta/recipes-graphics/mesa/files/0001-freedreno-pm4-Use-unsigned=
-instead-of-uint-to-fix-mu.patch
>> > +++ /dev/null
>> > @@ -1,44 +0,0 @@
>> > -From 8a5de0b6cf1090d7f29f3974ec79c32776cf2745 Mon Sep 17 00:00:00 200=
1
>> > -From: Jami Kettunen <jami.kettunen@protonmail.com>
>> > -Date: Tue, 31 Aug 2021 00:15:58 +0300
>> > -Subject: [PATCH] freedreno/pm4: Use unsigned instead of uint to fix m=
usl build
>> > -
>> > -Upstream-Status: Backport
>> > -
>> > -Fixes the following error I noticed when building against aarch64 wit=
h
>> > -musl libc:
>> > -
>> > -  In file included from ../src/freedreno/decode/crashdec.h:38,
>> > -                   from ../src/freedreno/decode/crashdec.c:40:
>> > -  ../src/freedreno/common/freedreno_pm4.h:104:15: error: unknown type=
 name 'uint'
>> > -    104 | static inline uint
>> > -        |               ^~~~
>> > -  ../src/freedreno/common/freedreno_pm4.h:105:25: error: unknown type=
 name 'uint'; did you mean 'int'?
>> > -    105 | pm4_calc_odd_parity_bit(uint val)
>> > -        |                         ^~~~
>> > -        |                         int
>> > -
>> > -Signed-off-by: Jami Kettunen <jami.kettunen@protonmail.com>
>> > -Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/1=
9665>
>> > ----
>> > - src/freedreno/common/freedreno_pm4.h | 4 ++--
>> > - 1 file changed, 2 insertions(+), 2 deletions(-)
>> > -
>> > -diff --git a/src/freedreno/common/freedreno_pm4.h b/src/freedreno/com=
mon/freedreno_pm4.h
>> > -index 8f958953d693..091247e709a0 100644
>> > ---- a/src/freedreno/common/freedreno_pm4.h
>> > -+++ b/src/freedreno/common/freedreno_pm4.h
>> > -@@ -105,8 +105,8 @@ pm4_pkt7_hdr(uint8_t opcode, uint16_t cnt)
>> > - #define cp_type3_opcode(pkt) (((pkt) >> 8) & 0xFF)
>> > - #define type3_pkt_size(pkt)  ((((pkt) >> 16) & 0x3FFF) + 1)
>> > -
>> > --static inline uint
>> > --pm4_calc_odd_parity_bit(uint val)
>> > -+static inline unsigned
>> > -+pm4_calc_odd_parity_bit(unsigned val)
>> > - {
>> > -    return (0x9669 >> (0xf & ((val) ^ ((val) >> 4) ^ ((val) >> 8) ^
>> > -                              ((val) >> 12) ^ ((val) >> 16) ^ ((val) =
>> 20) ^
>> > ---
>> > -2.39.2
>> > -
>> > diff --git a/meta/recipes-graphics/mesa/files/0001-gbm-backend-fix-gbm=
-compile-without-dri.patch b/meta/recipes-graphics/mesa/files/0001-gbm-back=
end-fix-gbm-compile-without-dri.patch
>> > deleted file mode 100644
>> > index 6541671b7a..0000000000
>> > --- a/meta/recipes-graphics/mesa/files/0001-gbm-backend-fix-gbm-compil=
e-without-dri.patch
>> > +++ /dev/null
>> > @@ -1,65 +0,0 @@
>> > -From 25946100e21cf2095bea334e8d7096798561d0b7 Mon Sep 17 00:00:00 200=
1
>> > -From: Vincent Davis Jr <vince@underview.tech>
>> > -Date: Wed, 28 Dec 2022 16:28:01 -0600
>> > -Subject: [PATCH] gbm/backend: fix gbm compile without dri
>> > -
>> > -Upstream-Status: Backport
>> > -
>> > -https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/20447
>> > -https://gitlab.freedesktop.org/mesa/mesa/-/commit/842ca284650f066e587=
06741a7d22d67b5088e60
>> > -
>> > -At mesa version 22.2.3 patch wasn't introduced until after.
>> > -
>> > -Commit introduces a fix that allows for gbm to be built with an empty
>> > -backend. There are situation especially in a Yocto/OE cross compilati=
on
>> > -environment where you want to build with an empty backend. The partic=
ular
>> > -situation is as such:
>> > -
>> > -The mesa-gl recipe is the preferred provider for virtual/libgbm, virt=
ual/libgl,
>> > -virtual/mesa, etc... But the x11 DISTRO_FEATURE in't included this le=
ads to build
>> > -errors such as:
>> > -
>> > -| /../../../ld: src/gbm/libgbm.so.1.0.0.p/main_backend.c.o: in functi=
on `find_backend':
>> > -| backend.c:(.text.find_backend+0xa4): undefined reference to `gbm_dr=
i_backend'
>> > -| /../../../ld: src/gbm/libgbm.so.1.0.0.p/main_backend.c.o:(.data.rel=
.ro.builtin_backends+0x4):
>> > -                undefined reference to `gbm_dri_backend'
>> > -| collect2: error: ld returned 1 exit status
>> > -
>> > -Issue should be replicable by setting -Ddri3=3Ddisabled and -Dgbm=3De=
nabled
>> > -
>> > -Add fix to bypasses compilation issue by excluding gbm dri backend. I=
f
>> > -HAVE_DRI || HAVE_DRIX not specified.
>> > -
>> > -Acked-by: David Heidelberg <david.heidelberg@collabora.com>
>> > -Signed-off-by: Vincent Davis Jr <vince@underview.tech>
>> > ----
>> > - src/gbm/main/backend.c | 4 ++++
>> > - 1 file changed, 4 insertions(+)
>> > -
>> > -diff --git a/src/gbm/main/backend.c b/src/gbm/main/backend.c
>> > -index 974d0a76a4e..feee0703495 100644
>> > ---- a/src/gbm/main/backend.c
>> > -+++ b/src/gbm/main/backend.c
>> > -@@ -42,7 +42,9 @@
>> > - #define ARRAY_SIZE(a) (sizeof(a)/sizeof((a)[0]))
>> > - #define VER_MIN(a, b) ((a) < (b) ? (a) : (b))
>> > -
>> > -+#if defined(HAVE_DRI) || defined(HAVE_DRI2) || defined(HAVE_DRI3)
>> > - extern const struct gbm_backend gbm_dri_backend;
>> > -+#endif
>> > -
>> > - struct gbm_backend_desc {
>> > -    const char *name;
>> > -@@ -51,7 +53,9 @@ struct gbm_backend_desc {
>> > - };
>> > -
>> > - static const struct gbm_backend_desc builtin_backends[] =3D {
>> > -+#if defined(HAVE_DRI) || defined(HAVE_DRI2) || defined(HAVE_DRI3)
>> > -    { "dri", &gbm_dri_backend },
>> > -+#endif
>> > - };
>> > -
>> > - #define BACKEND_LIB_SUFFIX "_gbm"
>> > ---
>> > -2.34.1
>> > -
>> > diff --git a/meta/recipes-graphics/mesa/files/0001-util-format-Check-f=
or-NEON-before-using-it.patch b/meta/recipes-graphics/mesa/files/0001-util-=
format-Check-for-NEON-before-using-it.patch
>> > deleted file mode 100644
>> > index d22ff3c8a8..0000000000
>> > --- a/meta/recipes-graphics/mesa/files/0001-util-format-Check-for-NEON=
-before-using-it.patch
>> > +++ /dev/null
>> > @@ -1,47 +0,0 @@
>> > -From f17e836ef9b1bbc6056790596420b699e48128c2 Mon Sep 17 00:00:00 200=
1
>> > -From: Khem Raj <raj.khem@gmail.com>
>> > -Date: Thu, 2 Dec 2021 19:57:42 -0800
>> > -Subject: [PATCH] util/format: Check for NEON before using it
>> > -
>> > -This fixes build on rpi0-w and any other machine which does not have
>> > -neon unit and is not used as FPU unit
>> > -
>> > -Fixes errors e.g.
>> > -
>> > -In file included from ../mesa-21.3.0/src/util/format/u_format_unpack_=
neon.c:35:
>> > -/mnt/b/yoe/master/build/tmp/work/arm1176jzfshf-vfp-yoe-linux-gnueabi/=
mesa/2_21.3.0-r0/recipe-sysroot-native/usr/lib/clang/13.0.1/include/arm_neo=
n.h:32:2: error: "NEON support not enabled"
>> > -
>> > -Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/=
-/merge_requests/14032]
>> > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> > -
>> > ----
>> > - src/util/format/u_format.c             | 2 +-
>> > - src/util/format/u_format_unpack_neon.c | 2 +-
>> > - 2 files changed, 2 insertions(+), 2 deletions(-)
>> > -
>> > -diff --git a/src/util/format/u_format.c b/src/util/format/u_format.c
>> > -index c071250..0880984 100644
>> > ---- a/src/util/format/u_format.c
>> > -+++ b/src/util/format/u_format.c
>> > -@@ -1184,7 +1184,7 @@ static void
>> > - util_format_unpack_table_init(void)
>> > - {
>> > -    for (enum pipe_format format =3D PIPE_FORMAT_NONE; format < PIPE_=
FORMAT_COUNT; format++) {
>> > --#if (defined(PIPE_ARCH_AARCH64) || defined(PIPE_ARCH_ARM)) && !defin=
ed(NO_FORMAT_ASM) && !defined(__SOFTFP__)
>> > -+#if (defined(PIPE_ARCH_AARCH64) || (defined(__ARM_NEON) && defined(P=
IPE_ARCH_ARM))) && !defined(NO_FORMAT_ASM)
>> > -       const struct util_format_unpack_description *unpack =3D util_f=
ormat_unpack_description_neon(format);
>> > -       if (unpack) {
>> > -          util_format_unpack_table[format] =3D unpack;
>> > -diff --git a/src/util/format/u_format_unpack_neon.c b/src/util/format=
/u_format_unpack_neon.c
>> > -index a4a5cb1..1e4f794 100644
>> > ---- a/src/util/format/u_format_unpack_neon.c
>> > -+++ b/src/util/format/u_format_unpack_neon.c
>> > -@@ -23,7 +23,7 @@
>> > -
>> > - #include <u_format.h>
>> > -
>> > --#if (defined(PIPE_ARCH_AARCH64) || defined(PIPE_ARCH_ARM)) && !defin=
ed(NO_FORMAT_ASM) && !defined(__SOFTFP__)
>> > -+#if (defined(PIPE_ARCH_AARCH64) || (defined(__ARM_NEON) && defined(P=
IPE_ARCH_ARM))) && !defined(NO_FORMAT_ASM)
>> > -
>> > - /* armhf builds default to vfp, not neon, and refuses to compile neo=
n intrinsics
>> > -  * unless you tell it "no really".
>> > diff --git a/meta/recipes-graphics/mesa/mesa-gl_22.3.5.bb b/meta/recip=
es-graphics/mesa/mesa-gl_23.0.0.bb
>> > similarity index 100%
>> > rename from meta/recipes-graphics/mesa/mesa-gl_22.3.5.bb
>> > rename to meta/recipes-graphics/mesa/mesa-gl_23.0.0.bb
>> > diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphi=
cs/mesa/mesa.inc
>> > index b082b49400..8f72f25c17 100644
>> > --- a/meta/recipes-graphics/mesa/mesa.inc
>> > +++ b/meta/recipes-graphics/mesa/mesa.inc
>> > @@ -17,12 +17,9 @@ PE =3D "2"
>> >  SRC_URI =3D "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
>> >             file://0001-meson.build-check-for-all-linux-host_os-combin=
ations.patch \
>> >             file://0001-meson-misdetects-64bit-atomics-on-mips-clang.p=
atch \
>> > -           file://0001-util-format-Check-for-NEON-before-using-it.pat=
ch \
>> > -           file://0001-gbm-backend-fix-gbm-compile-without-dri.patch =
\
>> > -           file://0001-freedreno-pm4-Use-unsigned-instead-of-uint-to-=
fix-mu.patch \
>> >             "
>> >
>> > -SRC_URI[sha256sum] =3D "3eed2ecae2bc674494566faab9fcc9beb21cd804c7ba2=
b59a1694f3d7236e6a9"
>> > +SRC_URI[sha256sum] =3D "01f3cff3763f09e0adabcb8011e4aebc6ad48f6a4dd4b=
ae904fe918707d253e4"
>> >
>> >  UPSTREAM_CHECK_GITTAGREGEX =3D "mesa-(?P<pver>\d+(\.\d+)+)"
>> >
>> > diff --git a/meta/recipes-graphics/mesa/mesa_22.3.5.bb b/meta/recipes-=
graphics/mesa/mesa_23.0.0.bb
>> > similarity index 100%
>> > rename from meta/recipes-graphics/mesa/mesa_22.3.5.bb
>> > rename to meta/recipes-graphics/mesa/mesa_23.0.0.bb
>> > --
>> > 2.30.2
>> >
>> >
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> > Links: You receive all messages sent to this group.
>> > View/Reply Online (#178696): https://lists.openembedded.org/g/openembe=
dded-core/message/178696
>> > Mute This Topic: https://lists.openembedded.org/mt/97647023/1997914
>> > Group Owner: openembedded-core+owner@lists.openembedded.org
>> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[raj.khem@gmail.com]
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >

