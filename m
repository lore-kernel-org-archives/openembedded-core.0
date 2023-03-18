Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 262CEC6FD1D
	for <webhook@archiver.kernel.org>; Sat, 18 Mar 2023 02:48:02 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web11.261.1679107678944303455
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Mar 2023 19:47:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ih3arNQR;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-177ca271cb8so7671052fac.2
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 19:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679107678;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VealOwJRExPcLZTjS7E8BZhJsxI1hyDjr83X+BCl8A8=;
        b=ih3arNQRqiq5KeSy16CnWUpwlR30z1N6Uz7f2SSQWyj+hPZe+meFsZHsyfmKk6iryN
         zrWNh1FFo3jMgDp6h9mU4EhIPWVeGILc/+jZL4OZDGB8vL2pcHZqSLCVyNpp932TaRym
         VYtOz1o5uMvBeymV1n9xayUb+GW6rPjKPHxMGkGHfM5pK9ovVeQNE2lCgLXHh6kv7Mnm
         K3U0ElwufTZpVVCyxs/JuotlsXtUgHPnPZNkZC+g3OlIEPerVej06EWQ4wePoI/FMwYr
         UgEn3gp20HikpS7Yvltubk02iovePWlxYYA9HvbaByNH4ElYegpG6UcwkcdFmgnx8UBf
         duTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679107678;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VealOwJRExPcLZTjS7E8BZhJsxI1hyDjr83X+BCl8A8=;
        b=gj5cIIG5cgcWnD0hSlBRU2vvxDoHIe2CFVjw8VK/8FhXQjKrB0N4d19t//nRvujZFe
         QygPUtjGcAkTK6zRVqIlE9ZM23Y5W+4dYry+omTisa9O7Qv+P87KM11qf13dl5SmdcRF
         5i8D5NwM17W/4Ozg6h5B0W31WlzVG6C61Jpd1oLA0mLA5UihEbecm6vIU2wqo+S+Zkfr
         KAKbfQhJgJ36aCku8PXzdXPt1kEMrz5Y8n53PJxjVaPkdjQlRyodwXvndJsAO015rR9E
         BTo+I9ua1JIxEApZcyLuZydLQ2AeN5Fdg+k7Tka0EmyY/O1XWSj3qbqnfCyWqPN4G0+E
         UnDQ==
X-Gm-Message-State: AO0yUKXIoGxK1CWQ4qis4GB+SGEzab7LTxIzKF2kQmPJEhWufCW5fq7k
	DnxnYfEiokKDMoeQRC3egb7lEFrXyueE8etDwzc=
X-Google-Smtp-Source: AK7set+OZeJgSbA0Y2Xkqanc0jDEdIL7hzEiNE+9YnWSBuMPklKFMVZHSOUtdTzOV8dABGO4yuuf8iCu5xwYtnhesKM=
X-Received: by 2002:a05:6871:8a93:b0:17a:a52d:9df7 with SMTP id
 tm19-20020a0568718a9300b0017aa52d9df7mr184449oab.4.1679107678003; Fri, 17 Mar
 2023 19:47:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230316094102.2628727-1-alex@linutronix.de> <20230316094102.2628727-6-alex@linutronix.de>
In-Reply-To: <20230316094102.2628727-6-alex@linutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 17 Mar 2023 19:47:32 -0700
Message-ID: <CAMKF1sqhwupoW0kV7ao94DvdbxTH4B5i3HfMwOnp6M+g0g85Sg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 6/6] mesa: update 22.3.5 -> 23.0.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Mar 2023 02:48:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178783

mesa 23.x fails to build with default gcc ( 7.5.0 ) Ubuntu
7.5.0-3ubuntu1~18.04, it ends up with

../mesa-23.0.0/src/intel/compiler/brw_simd_selection.cpp: In function
=E2=80=98int brw_simd_select_for_workgroup_size(const intel_device_info*,
const brw_cs_prog_data*, const unsigned int*)=E2=80=99:
../mesa-23.0.0/src/intel/compiler/brw_simd_selection.cpp:205:7: sorry,
unimplemented: non-trivial designated initializers not supported
       };
       ^

see mesa-native failure

https://errors.yoctoproject.org/Errors/Details/698144/

I wonder how it works on AB nodes running Ubuntu 18.04. Do we enforce
gcc from buildtools tarball there ?

On Thu, Mar 16, 2023 at 2:41=E2=80=AFAM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Drop patches:
> 0001-gbm-backend-fix-gbm-compile-without-dri.patch
> 0001-freedreno-pm4-Use-unsigned-instead-of-uint-to-fix-mu.patch
> (backports)
>
> 0001-util-format-Check-for-NEON-before-using-it.patch
> (upstream submission has stalled with unanswered concerns from upstream;
> patch no longer applies; issue does not reproduce with 'raspberrypi0-wifi=
' MACHINE)
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  ...e-unsigned-instead-of-uint-to-fix-mu.patch | 44 -------------
>  ...-backend-fix-gbm-compile-without-dri.patch | 65 -------------------
>  ...ormat-Check-for-NEON-before-using-it.patch | 47 --------------
>  .../{mesa-gl_22.3.5.bb =3D> mesa-gl_23.0.0.bb}  |  0
>  meta/recipes-graphics/mesa/mesa.inc           |  5 +-
>  .../mesa/{mesa_22.3.5.bb =3D> mesa_23.0.0.bb}   |  0
>  6 files changed, 1 insertion(+), 160 deletions(-)
>  delete mode 100644 meta/recipes-graphics/mesa/files/0001-freedreno-pm4-U=
se-unsigned-instead-of-uint-to-fix-mu.patch
>  delete mode 100644 meta/recipes-graphics/mesa/files/0001-gbm-backend-fix=
-gbm-compile-without-dri.patch
>  delete mode 100644 meta/recipes-graphics/mesa/files/0001-util-format-Che=
ck-for-NEON-before-using-it.patch
>  rename meta/recipes-graphics/mesa/{mesa-gl_22.3.5.bb =3D> mesa-gl_23.0.0=
.bb} (100%)
>  rename meta/recipes-graphics/mesa/{mesa_22.3.5.bb =3D> mesa_23.0.0.bb} (=
100%)
>
> diff --git a/meta/recipes-graphics/mesa/files/0001-freedreno-pm4-Use-unsi=
gned-instead-of-uint-to-fix-mu.patch b/meta/recipes-graphics/mesa/files/000=
1-freedreno-pm4-Use-unsigned-instead-of-uint-to-fix-mu.patch
> deleted file mode 100644
> index 3ab22889bf..0000000000
> --- a/meta/recipes-graphics/mesa/files/0001-freedreno-pm4-Use-unsigned-in=
stead-of-uint-to-fix-mu.patch
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -From 8a5de0b6cf1090d7f29f3974ec79c32776cf2745 Mon Sep 17 00:00:00 2001
> -From: Jami Kettunen <jami.kettunen@protonmail.com>
> -Date: Tue, 31 Aug 2021 00:15:58 +0300
> -Subject: [PATCH] freedreno/pm4: Use unsigned instead of uint to fix musl=
 build
> -
> -Upstream-Status: Backport
> -
> -Fixes the following error I noticed when building against aarch64 with
> -musl libc:
> -
> -  In file included from ../src/freedreno/decode/crashdec.h:38,
> -                   from ../src/freedreno/decode/crashdec.c:40:
> -  ../src/freedreno/common/freedreno_pm4.h:104:15: error: unknown type na=
me 'uint'
> -    104 | static inline uint
> -        |               ^~~~
> -  ../src/freedreno/common/freedreno_pm4.h:105:25: error: unknown type na=
me 'uint'; did you mean 'int'?
> -    105 | pm4_calc_odd_parity_bit(uint val)
> -        |                         ^~~~
> -        |                         int
> -
> -Signed-off-by: Jami Kettunen <jami.kettunen@protonmail.com>
> -Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/1966=
5>
> ----
> - src/freedreno/common/freedreno_pm4.h | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/src/freedreno/common/freedreno_pm4.h b/src/freedreno/common=
/freedreno_pm4.h
> -index 8f958953d693..091247e709a0 100644
> ---- a/src/freedreno/common/freedreno_pm4.h
> -+++ b/src/freedreno/common/freedreno_pm4.h
> -@@ -105,8 +105,8 @@ pm4_pkt7_hdr(uint8_t opcode, uint16_t cnt)
> - #define cp_type3_opcode(pkt) (((pkt) >> 8) & 0xFF)
> - #define type3_pkt_size(pkt)  ((((pkt) >> 16) & 0x3FFF) + 1)
> -
> --static inline uint
> --pm4_calc_odd_parity_bit(uint val)
> -+static inline unsigned
> -+pm4_calc_odd_parity_bit(unsigned val)
> - {
> -    return (0x9669 >> (0xf & ((val) ^ ((val) >> 4) ^ ((val) >> 8) ^
> -                              ((val) >> 12) ^ ((val) >> 16) ^ ((val) >> =
20) ^
> ---
> -2.39.2
> -
> diff --git a/meta/recipes-graphics/mesa/files/0001-gbm-backend-fix-gbm-co=
mpile-without-dri.patch b/meta/recipes-graphics/mesa/files/0001-gbm-backend=
-fix-gbm-compile-without-dri.patch
> deleted file mode 100644
> index 6541671b7a..0000000000
> --- a/meta/recipes-graphics/mesa/files/0001-gbm-backend-fix-gbm-compile-w=
ithout-dri.patch
> +++ /dev/null
> @@ -1,65 +0,0 @@
> -From 25946100e21cf2095bea334e8d7096798561d0b7 Mon Sep 17 00:00:00 2001
> -From: Vincent Davis Jr <vince@underview.tech>
> -Date: Wed, 28 Dec 2022 16:28:01 -0600
> -Subject: [PATCH] gbm/backend: fix gbm compile without dri
> -
> -Upstream-Status: Backport
> -
> -https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/20447
> -https://gitlab.freedesktop.org/mesa/mesa/-/commit/842ca284650f066e587067=
41a7d22d67b5088e60
> -
> -At mesa version 22.2.3 patch wasn't introduced until after.
> -
> -Commit introduces a fix that allows for gbm to be built with an empty
> -backend. There are situation especially in a Yocto/OE cross compilation
> -environment where you want to build with an empty backend. The particula=
r
> -situation is as such:
> -
> -The mesa-gl recipe is the preferred provider for virtual/libgbm, virtual=
/libgl,
> -virtual/mesa, etc... But the x11 DISTRO_FEATURE in't included this leads=
 to build
> -errors such as:
> -
> -| /../../../ld: src/gbm/libgbm.so.1.0.0.p/main_backend.c.o: in function =
`find_backend':
> -| backend.c:(.text.find_backend+0xa4): undefined reference to `gbm_dri_b=
ackend'
> -| /../../../ld: src/gbm/libgbm.so.1.0.0.p/main_backend.c.o:(.data.rel.ro=
.builtin_backends+0x4):
> -                undefined reference to `gbm_dri_backend'
> -| collect2: error: ld returned 1 exit status
> -
> -Issue should be replicable by setting -Ddri3=3Ddisabled and -Dgbm=3Denab=
led
> -
> -Add fix to bypasses compilation issue by excluding gbm dri backend. If
> -HAVE_DRI || HAVE_DRIX not specified.
> -
> -Acked-by: David Heidelberg <david.heidelberg@collabora.com>
> -Signed-off-by: Vincent Davis Jr <vince@underview.tech>
> ----
> - src/gbm/main/backend.c | 4 ++++
> - 1 file changed, 4 insertions(+)
> -
> -diff --git a/src/gbm/main/backend.c b/src/gbm/main/backend.c
> -index 974d0a76a4e..feee0703495 100644
> ---- a/src/gbm/main/backend.c
> -+++ b/src/gbm/main/backend.c
> -@@ -42,7 +42,9 @@
> - #define ARRAY_SIZE(a) (sizeof(a)/sizeof((a)[0]))
> - #define VER_MIN(a, b) ((a) < (b) ? (a) : (b))
> -
> -+#if defined(HAVE_DRI) || defined(HAVE_DRI2) || defined(HAVE_DRI3)
> - extern const struct gbm_backend gbm_dri_backend;
> -+#endif
> -
> - struct gbm_backend_desc {
> -    const char *name;
> -@@ -51,7 +53,9 @@ struct gbm_backend_desc {
> - };
> -
> - static const struct gbm_backend_desc builtin_backends[] =3D {
> -+#if defined(HAVE_DRI) || defined(HAVE_DRI2) || defined(HAVE_DRI3)
> -    { "dri", &gbm_dri_backend },
> -+#endif
> - };
> -
> - #define BACKEND_LIB_SUFFIX "_gbm"
> ---
> -2.34.1
> -
> diff --git a/meta/recipes-graphics/mesa/files/0001-util-format-Check-for-=
NEON-before-using-it.patch b/meta/recipes-graphics/mesa/files/0001-util-for=
mat-Check-for-NEON-before-using-it.patch
> deleted file mode 100644
> index d22ff3c8a8..0000000000
> --- a/meta/recipes-graphics/mesa/files/0001-util-format-Check-for-NEON-be=
fore-using-it.patch
> +++ /dev/null
> @@ -1,47 +0,0 @@
> -From f17e836ef9b1bbc6056790596420b699e48128c2 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Thu, 2 Dec 2021 19:57:42 -0800
> -Subject: [PATCH] util/format: Check for NEON before using it
> -
> -This fixes build on rpi0-w and any other machine which does not have
> -neon unit and is not used as FPU unit
> -
> -Fixes errors e.g.
> -
> -In file included from ../mesa-21.3.0/src/util/format/u_format_unpack_neo=
n.c:35:
> -/mnt/b/yoe/master/build/tmp/work/arm1176jzfshf-vfp-yoe-linux-gnueabi/mes=
a/2_21.3.0-r0/recipe-sysroot-native/usr/lib/clang/13.0.1/include/arm_neon.h=
:32:2: error: "NEON support not enabled"
> -
> -Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/m=
erge_requests/14032]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> ----
> - src/util/format/u_format.c             | 2 +-
> - src/util/format/u_format_unpack_neon.c | 2 +-
> - 2 files changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/src/util/format/u_format.c b/src/util/format/u_format.c
> -index c071250..0880984 100644
> ---- a/src/util/format/u_format.c
> -+++ b/src/util/format/u_format.c
> -@@ -1184,7 +1184,7 @@ static void
> - util_format_unpack_table_init(void)
> - {
> -    for (enum pipe_format format =3D PIPE_FORMAT_NONE; format < PIPE_FOR=
MAT_COUNT; format++) {
> --#if (defined(PIPE_ARCH_AARCH64) || defined(PIPE_ARCH_ARM)) && !defined(=
NO_FORMAT_ASM) && !defined(__SOFTFP__)
> -+#if (defined(PIPE_ARCH_AARCH64) || (defined(__ARM_NEON) && defined(PIPE=
_ARCH_ARM))) && !defined(NO_FORMAT_ASM)
> -       const struct util_format_unpack_description *unpack =3D util_form=
at_unpack_description_neon(format);
> -       if (unpack) {
> -          util_format_unpack_table[format] =3D unpack;
> -diff --git a/src/util/format/u_format_unpack_neon.c b/src/util/format/u_=
format_unpack_neon.c
> -index a4a5cb1..1e4f794 100644
> ---- a/src/util/format/u_format_unpack_neon.c
> -+++ b/src/util/format/u_format_unpack_neon.c
> -@@ -23,7 +23,7 @@
> -
> - #include <u_format.h>
> -
> --#if (defined(PIPE_ARCH_AARCH64) || defined(PIPE_ARCH_ARM)) && !defined(=
NO_FORMAT_ASM) && !defined(__SOFTFP__)
> -+#if (defined(PIPE_ARCH_AARCH64) || (defined(__ARM_NEON) && defined(PIPE=
_ARCH_ARM))) && !defined(NO_FORMAT_ASM)
> -
> - /* armhf builds default to vfp, not neon, and refuses to compile neon i=
ntrinsics
> -  * unless you tell it "no really".
> diff --git a/meta/recipes-graphics/mesa/mesa-gl_22.3.5.bb b/meta/recipes-=
graphics/mesa/mesa-gl_23.0.0.bb
> similarity index 100%
> rename from meta/recipes-graphics/mesa/mesa-gl_22.3.5.bb
> rename to meta/recipes-graphics/mesa/mesa-gl_23.0.0.bb
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
> index b082b49400..8f72f25c17 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -17,12 +17,9 @@ PE =3D "2"
>  SRC_URI =3D "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
>             file://0001-meson.build-check-for-all-linux-host_os-combinati=
ons.patch \
>             file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patc=
h \
> -           file://0001-util-format-Check-for-NEON-before-using-it.patch =
\
> -           file://0001-gbm-backend-fix-gbm-compile-without-dri.patch \
> -           file://0001-freedreno-pm4-Use-unsigned-instead-of-uint-to-fix=
-mu.patch \
>             "
>
> -SRC_URI[sha256sum] =3D "3eed2ecae2bc674494566faab9fcc9beb21cd804c7ba2b59=
a1694f3d7236e6a9"
> +SRC_URI[sha256sum] =3D "01f3cff3763f09e0adabcb8011e4aebc6ad48f6a4dd4bae9=
04fe918707d253e4"
>
>  UPSTREAM_CHECK_GITTAGREGEX =3D "mesa-(?P<pver>\d+(\.\d+)+)"
>
> diff --git a/meta/recipes-graphics/mesa/mesa_22.3.5.bb b/meta/recipes-gra=
phics/mesa/mesa_23.0.0.bb
> similarity index 100%
> rename from meta/recipes-graphics/mesa/mesa_22.3.5.bb
> rename to meta/recipes-graphics/mesa/mesa_23.0.0.bb
> --
> 2.30.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#178696): https://lists.openembedded.org/g/openembedde=
d-core/message/178696
> Mute This Topic: https://lists.openembedded.org/mt/97647023/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

