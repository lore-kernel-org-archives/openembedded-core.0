Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A389DC001E0
	for <webhook@archiver.kernel.org>; Mon, 31 Jul 2023 18:11:33 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.2646.1690827089291355460
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jul 2023 11:11:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=QdukKVaF;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.52, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-99bdeae1d0aso640869766b.1
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 11:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1690827087; x=1691431887;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iRhm5rdo+0wf3p0PC8xyNzgWgFVsYWhS3sYdNdD1UMQ=;
        b=QdukKVaFIvziOWpWGbj1PhgDhsekoYdXcjzuRQbc30GHc2yJgfrvDfXeewoccxBWYf
         KIFByFXloAiOWNQ0+oofFGX0+SXQlMKUB6vaK9Rk4a3uh48IHSwo6niuyKBBCxYkzwDM
         cH+cBTw4xNM856zwBVu23JN7ggQo6GCAWGgCLyeNSeXW0CCapbcZR+ezivwn3Nj0UDN0
         z9bdiKzaynut2drBuGJzqokqsQedfhoYf7KUzFTWNXk+v7y0dSj98eMxNbsi3wnTYh+2
         EFStg2bwa0JWw9PQzdfDXvHHGjpu0VcpSj2YF4u5XW2NITCNAvIpLZ6oc99l94wmDX5w
         8hjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690827087; x=1691431887;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iRhm5rdo+0wf3p0PC8xyNzgWgFVsYWhS3sYdNdD1UMQ=;
        b=HCz8ZAZU5c2GbOZEB/hq9IpLm8A5GIlUzgbM/jqJ6VC+PMNurgit5rJN7xM3qCasO8
         En+R4mU98djL5bwNAPctlIXLkgavlvhf/PiOg/SgOStYPEsEg7jgO9LG5q8YSsdP+RqC
         U+wEjZUlv/v/0npDC6S0bRbrPqQEEaItSiXrK8k3fVo2xLTIddNqIX1bUo4iAISPhEJG
         V1xiQBjFBuVpCRpTNntNdUbrretsiVcBd2ixe1QK1dZI3j0x1xhIuzw0wrx3n9oOvdpI
         uixf8yZXjqpxALO/Ck3CrRK61mhLl+6yhjW+tx5uKmzvKlgbrvz7Hx3pa7lK0xb4Bl+L
         2vqQ==
X-Gm-Message-State: ABy/qLbvh76I5wyfX56Bn0CYO0fIe2p5UHlPL4BQUByIRHGVjyCM9UlM
	DKM9qSgQVC26DWIwu31YwI/AzALc8eb0VfDJlddUcuF7fkrgJ39F
X-Google-Smtp-Source: APBJJlH8y2GVdQSTHNSDup9X0K+Qy3zozc4cxwyuUFzxW5RwColenmKGq5qsrwsypIPFIJRIGF4JAu4gDzijtJ9Oqx8=
X-Received: by 2002:a17:906:29a:b0:992:a90a:5d1f with SMTP id
 26-20020a170906029a00b00992a90a5d1fmr457116ejf.68.1690827087073; Mon, 31 Jul
 2023 11:11:27 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1690739937.git.steve@sakoman.com> <1776B726C0E12BA1.27447@lists.openembedded.org>
In-Reply-To: <1776B726C0E12BA1.27447@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 31 Jul 2023 08:11:15 -1000
Message-ID: <CAOSpxdYzm+1J9k7=-KRJ2OzfHs_tjmYXQP8Fcw6ytNGxgf2hLQ@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 14/30] gcc : upgrade to v11.4
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 18:11:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185160

I see that there is some discussion on the list about possible
regressions from this patch, so I will remove it from this patch set
until the issues are resolved.

Steve


On Sun, Jul 30, 2023 at 8:01=E2=80=AFAM Steve Sakoman via
lists.openembedded.org <steve=3Dsakoman.com@lists.openembedded.org>
wrote:
>
> From: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
>
> gcc stable version upgraded from v11.3 to v11.4
>
> For changes in v11.4 see - https://gcc.gnu.org/gcc-11/changes.html
>
> Below is the bug fix list for v11.4
> https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=3DRESOLVED&order=3Dsh=
ort_desc%2Cbug_status%2Cpriority%2Cassigned_to%2Cbug_id&query_format=3Dadva=
nced&resolution=3DFIXED&target_milestone=3D11.4
>
> There are a total 115 bugs are fixed in this release, below is the list o=
f bugs fixed excluding the regression fixes.
>
> ID      Product Comp        Resolution  Summary=E2=96=B2
> 108199  gcc     tree-opt        FIXE    Bitfields, unions and SRA and sto=
rage_order_attribute
> 107801  gcc     libstdc+        FIXE    Building cross compiler for H8 fa=
mily fails in libstdc++ (c++17/memory_resource.cc)
> 108265  gcc     libstdc+        FIXE    chrono::hh_mm_ss can't be constru=
cted from unsigned durations
> 104443  gcc     libstdc+        FIXE    common_iterator<I, S>::operator->=
 is not correctly implemented
> 98056   gcc     c++             FIXE    coroutines: ICE tree check: expec=
ted record_type or union_type or qual_union_type, have array_type since r11=
-2183-g0f66b8486cea8668
> 107061  gcc     target          FIXE    ENCODEKEY128 clobbers xmm4-xmm6
> 105433  gcc     testsuit        FIXE    FAIL: gcc.target/i386/iamcu/test_=
3_element_struct_and_unions.c
> 105095  gcc     testsuit        FIXE    gcc.dg/vect/complex/fast-math-com=
plex-* tests are not executed
> 100474  gcc     c++             FIXE    ICE: in diagnose_trait_expr, at c=
p/constraint.cc:3706
> 105854  gcc     target          FIXE    ICE: in extract_constrain_insn, a=
t recog.cc:2692 (insn does not satisfy its constraints: sse2_lshrv1ti3)
> 104462  gcc     target          FIXE    ICE: in extract_constrain_insn_ca=
ched, at recog.cc:2682 with -mavx512fp16 -mno-xsave
> 106045  gcc     libgomp         FIXE    Incorrect testcase in libgomp.c/t=
arget-31.c at -O0
> 56189   gcc     c++             FIXE    Infinite recursion with noexcept =
when instantiating function template
> 100295  gcc     c++             FIXE    Internal compiler error from gene=
ric lambda capturing parameter pack and expanding it in if constexpr
> 100613  gcc     jit             FIXE    libgccjit should produce dylib on=
 macOS
> 104875  gcc     libstdc+        FIXE    libstdc++-v3/src/c++11/codecvt.cc=
:312:24: warning: left shift count >=3D width of type
> 107471  gcc     libstdc+        FIXE    mismatching constraints in common=
_iterator
> 105284  gcc     libstdc+        FIXE    missing syncstream and spanstream=
 forward decl. in <iosfwd>
> 98821   gcc     c++             FIXE    modules : c++tools configures wit=
h CC but code fragments assume CXX.
> 109846  gcc     fortran         FIXE    Pointer-valued function reference=
 rejected as actual argument
> 101324  gcc     target          FIXE    powerpc64le: hashst appears befor=
e mflr at -O1 or higher
> 102479  gcc     c++             FIXE    segfault when deducing class temp=
late arguments for tuple with libc++-14
> 105128  gcc     libstdc+        FIXE    source_location compile error for=
 latest clang 15
> 106183  gcc     libstdc+        FIXE    std::atomic::wait might fail to b=
e unblocked by notify_one/all on platforms without platform_wait()
> 102994  gcc     libstdc+        FIXE    std::atomic<ptr>::wait is not mar=
ked const
> 105324  gcc     libstdc+        FIXE    std::from_chars() assertion at fl=
oating_from_chars.cc:78 when parsing 1.11111111....
> 105375  gcc     libstdc+        FIXE    std::packaged_task has no deducti=
on guide.
> 104602  gcc     libstdc+        FIXE    std::source_location::current use=
s cast from void*
> 106808  gcc     libstdc+        FIXE    std::string_view range concept re=
quirement causes compile error with Boost.Filesystem
> 105725  gcc     c++             FIXE    [ICE] segfault with `-Wmismatched=
-tags`
> 105920  gcc     target          FIXE    __builtin_cpu_supports ("f16c") s=
hould check AVX
>
> Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  meta/conf/distro/include/maintainers.inc      |   2 +-
>  .../gcc/{gcc-11.3.inc =3D> gcc-11.4.inc}        |   6 +-
>  ...ian_11.3.bb =3D> gcc-cross-canadian_11.4.bb} |   0
>  .../{gcc-cross_11.3.bb =3D> gcc-cross_11.4.bb}  |   0
>  ...-crosssdk_11.3.bb =3D> gcc-crosssdk_11.4.bb} |   0
>  ...cc-runtime_11.3.bb =3D> gcc-runtime_11.4.bb} |   0
>  ...itizers_11.3.bb =3D> gcc-sanitizers_11.4.bb} |   0
>  ...{gcc-source_11.3.bb =3D> gcc-source_11.4.bb} |   0
>  ...rch64-Update-Neoverse-N2-core-defini.patch |  20 ++--
>  ...rm-add-armv9-a-architecture-to-march.patch |  54 +++++-----
>  ...AMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch | 102 +++++++++---------
>  ...s-fix-v4bx-to-linker-to-support-EABI.patch |   6 +-
>  .../gcc/{gcc_11.3.bb =3D> gcc_11.4.bb}          |   0
>  ...initial_11.3.bb =3D> libgcc-initial_11.4.bb} |   0
>  .../gcc/{libgcc_11.3.bb =3D> libgcc_11.4.bb}    |   0
>  ...ibgfortran_11.3.bb =3D> libgfortran_11.4.bb} |   0
>  16 files changed, 93 insertions(+), 97 deletions(-)
>  rename meta/recipes-devtools/gcc/{gcc-11.3.inc =3D> gcc-11.4.inc} (97%)
>  rename meta/recipes-devtools/gcc/{gcc-cross-canadian_11.3.bb =3D> gcc-cr=
oss-canadian_11.4.bb} (100%)
>  rename meta/recipes-devtools/gcc/{gcc-cross_11.3.bb =3D> gcc-cross_11.4.=
bb} (100%)
>  rename meta/recipes-devtools/gcc/{gcc-crosssdk_11.3.bb =3D> gcc-crosssdk=
_11.4.bb} (100%)
>  rename meta/recipes-devtools/gcc/{gcc-runtime_11.3.bb =3D> gcc-runtime_1=
1.4.bb} (100%)
>  rename meta/recipes-devtools/gcc/{gcc-sanitizers_11.3.bb =3D> gcc-saniti=
zers_11.4.bb} (100%)
>  rename meta/recipes-devtools/gcc/{gcc-source_11.3.bb =3D> gcc-source_11.=
4.bb} (100%)
>  rename meta/recipes-devtools/gcc/{gcc_11.3.bb =3D> gcc_11.4.bb} (100%)
>  rename meta/recipes-devtools/gcc/{libgcc-initial_11.3.bb =3D> libgcc-ini=
tial_11.4.bb} (100%)
>  rename meta/recipes-devtools/gcc/{libgcc_11.3.bb =3D> libgcc_11.4.bb} (1=
00%)
>  rename meta/recipes-devtools/gcc/{libgfortran_11.3.bb =3D> libgfortran_1=
1.4.bb} (100%)
>
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
> index 1d5e070223..bfc14951fe 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -189,7 +189,7 @@ RECIPE_MAINTAINER:pn-gcc-cross-canadian-${TRANSLATED_=
TARGET_ARCH} =3D "Khem Raj <r
>  RECIPE_MAINTAINER:pn-gcc-crosssdk-${SDK_SYS} =3D "Khem Raj <raj.khem@gma=
il.com>"
>  RECIPE_MAINTAINER:pn-gcc-runtime =3D "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-gcc-sanitizers =3D "Khem Raj <raj.khem@gmail.com>"
> -RECIPE_MAINTAINER:pn-gcc-source-11.3.0 =3D "Khem Raj <raj.khem@gmail.com=
>"
> +RECIPE_MAINTAINER:pn-gcc-source-11.4.0 =3D "Khem Raj <raj.khem@gmail.com=
>"
>  RECIPE_MAINTAINER:pn-gconf =3D "Ross Burton <ross.burton@arm.com>"
>  RECIPE_MAINTAINER:pn-gcr =3D "Alexander Kanavin <alex.kanavin@gmail.com>=
"
>  RECIPE_MAINTAINER:pn-gdb =3D "Khem Raj <raj.khem@gmail.com>"
> diff --git a/meta/recipes-devtools/gcc/gcc-11.3.inc b/meta/recipes-devtoo=
ls/gcc/gcc-11.4.inc
> similarity index 97%
> rename from meta/recipes-devtools/gcc/gcc-11.3.inc
> rename to meta/recipes-devtools/gcc/gcc-11.4.inc
> index ab2ece3cce..a907661df4 100644
> --- a/meta/recipes-devtools/gcc/gcc-11.3.inc
> +++ b/meta/recipes-devtools/gcc/gcc-11.4.inc
> @@ -2,11 +2,11 @@ require gcc-common.inc
>
>  # Third digit in PV should be incremented after a minor release
>
> -PV =3D "11.3.0"
> +PV =3D "11.4.0"
>
>  # BINV should be incremented to a revision after a minor gcc release
>
> -BINV =3D "11.3.0"
> +BINV =3D "11.4.0"
>
>  FILESEXTRAPATHS =3D. "${FILE_DIRNAME}/gcc:${FILE_DIRNAME}/gcc/backport:"
>
> @@ -70,7 +70,7 @@ SRC_URI =3D "\
>            file://0004-arm-add-armv9-a-architecture-to-march.patch \
>  "
>
> -SRC_URI[sha256sum] =3D "b47cf2818691f5b1e21df2bb38c795fac2cfbd640ede2d0a=
5e1c89e338a3ac39"
> +SRC_URI[sha256sum] =3D "3f2db222b007e8a4a23cd5ba56726ef08e8b1f1eb2055ee7=
2c1402cea73a8dd9"
>
>  S =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
>
> diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_11.3.bb b/meta/=
recipes-devtools/gcc/gcc-cross-canadian_11.4.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-cross-canadian_11.3.bb
> rename to meta/recipes-devtools/gcc/gcc-cross-canadian_11.4.bb
> diff --git a/meta/recipes-devtools/gcc/gcc-cross_11.3.bb b/meta/recipes-d=
evtools/gcc/gcc-cross_11.4.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-cross_11.3.bb
> rename to meta/recipes-devtools/gcc/gcc-cross_11.4.bb
> diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk_11.3.bb b/meta/recipe=
s-devtools/gcc/gcc-crosssdk_11.4.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-crosssdk_11.3.bb
> rename to meta/recipes-devtools/gcc/gcc-crosssdk_11.4.bb
> diff --git a/meta/recipes-devtools/gcc/gcc-runtime_11.3.bb b/meta/recipes=
-devtools/gcc/gcc-runtime_11.4.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-runtime_11.3.bb
> rename to meta/recipes-devtools/gcc/gcc-runtime_11.4.bb
> diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_11.3.bb b/meta/reci=
pes-devtools/gcc/gcc-sanitizers_11.4.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-sanitizers_11.3.bb
> rename to meta/recipes-devtools/gcc/gcc-sanitizers_11.4.bb
> diff --git a/meta/recipes-devtools/gcc/gcc-source_11.3.bb b/meta/recipes-=
devtools/gcc/gcc-source_11.4.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-source_11.3.bb
> rename to meta/recipes-devtools/gcc/gcc-source_11.4.bb
> diff --git a/meta/recipes-devtools/gcc/gcc/0001-aarch64-Update-Neoverse-N=
2-core-defini.patch b/meta/recipes-devtools/gcc/gcc/0001-aarch64-Update-Neo=
verse-N2-core-defini.patch
> index 8429242348..a0c9db72e1 100644
> --- a/meta/recipes-devtools/gcc/gcc/0001-aarch64-Update-Neoverse-N2-core-=
defini.patch
> +++ b/meta/recipes-devtools/gcc/gcc/0001-aarch64-Update-Neoverse-N2-core-=
defini.patch
> @@ -19,24 +19,20 @@ diff --git a/gcc/config/aarch64/aarch64-cores.def b/g=
cc/config/aarch64/aarch64-c
>  index 4643e0e27..3478e567a 100644
>  --- a/gcc/config/aarch64/aarch64-cores.def
>  +++ b/gcc/config/aarch64/aarch64-cores.def
> -@@ -145,9 +145,6 @@ AARCH64_CORE("neoverse-512tvb", neoverse512tvb, cort=
exa57, 8_4A,  AARCH64_FL_FOR
> - /* Qualcomm ('Q') cores. */
> - AARCH64_CORE("saphira",     saphira,    saphira,    8_4A,  AARCH64_FL_F=
OR_ARCH8_4 | AARCH64_FL_CRYPTO | AARCH64_FL_RCPC, saphira,   0x51, 0xC01, -=
1)
> -
> --/* Armv8.5-A Architecture Processors.  */
> +@@ -147,7 +147,6 @@
> + AARCH64_CORE("saphira",     saphira,    saphira,    8_4A,  AARCH64_FL_F=
OR_ARCH8_4 | AARCH64_FL_CRYPTO, saphira,   0x51, 0xC01, -1)
> +
> + /* Armv8.5-A Architecture Processors.  */
>  -AARCH64_CORE("neoverse-n2", neoversen2, cortexa57, 8_5A, AARCH64_FL_FOR=
_ARCH8_5 | AARCH64_FL_I8MM | AARCH64_FL_BF16 | AARCH64_FL_F16 | AARCH64_FL_=
SVE | AARCH64_FL_SVE2 | AARCH64_FL_SVE2_BITPERM | AARCH64_FL_RNG | AARCH64_=
FL_MEMTAG, neoversen2, 0x41, 0xd49, -1)
> --
> + AARCH64_CORE("neoverse-v2", neoversev2, cortexa57, 8_5A, AARCH64_FL_FOR=
_ARCH8_5 | AARCH64_FL_I8MM | AARCH64_FL_BF16 | AARCH64_FL_F16 | AARCH64_FL_=
SVE | AARCH64_FL_SVE2 | AARCH64_FL_SVE2_BITPERM | AARCH64_FL_RNG | AARCH64_=
FL_MEMTAG, neoverse512tvb, 0x41, 0xd4f, -1)
> +
>   /* ARMv8-A big.LITTLE implementations.  */
> -
> - AARCH64_CORE("cortex-a57.cortex-a53",  cortexa57cortexa53, cortexa53, 8=
A,  AARCH64_FL_FOR_ARCH8 | AARCH64_FL_CRC, cortexa57, 0x41, AARCH64_BIG_LIT=
TLE (0xd07, 0xd03), -1)
> -@@ -163,4 +160,7 @@ AARCH64_CORE("cortex-a76.cortex-a55",  cortexa76cort=
exa55, cortexa53, 8_2A,  AAR
> +@@ -165,4 +164,7 @@
>   /* Armv8-R Architecture Processors.  */
>   AARCH64_CORE("cortex-r82", cortexr82, cortexa53, 8R, AARCH64_FL_FOR_ARC=
H8_R, cortexa53, 0x41, 0xd15, -1)
> -
> +
>  +/* Armv9-A Architecture Processors. */
>  +AARCH64_CORE("neoverse-n2", neoversen2, cortexa57, 9A, AARCH64_FL_FOR_A=
RCH9 | AARCH64_FL_I8MM | AARCH64_FL_BF16 | AARCH64_FL_SVE2_BITPERM | AARCH6=
4_FL_RNG | AARCH64_FL_MEMTAG | AARCH64_FL_PROFILE, neoversen2, 0x41, 0xd49,=
 -1)
>  +
>   #undef AARCH64_CORE
> ---
> -2.32.0
>
> diff --git a/meta/recipes-devtools/gcc/gcc/0004-arm-add-armv9-a-architect=
ure-to-march.patch b/meta/recipes-devtools/gcc/gcc/0004-arm-add-armv9-a-arc=
hitecture-to-march.patch
> index 864c8b3017..b9b0988d5a 100644
> --- a/meta/recipes-devtools/gcc/gcc/0004-arm-add-armv9-a-architecture-to-=
march.patch
> +++ b/meta/recipes-devtools/gcc/gcc/0004-arm-add-armv9-a-architecture-to-=
march.patch
> @@ -43,10 +43,10 @@ Signed-off-by: Ruiqiang Hao <Ruiqiang.Hao@windriver.c=
om>
>   gcc/testsuite/lib/target-supports.exp     |  3 ++-
>   9 files changed, 79 insertions(+), 8 deletions(-)
>
> -Index: gcc-11.3.0/gcc/config/arm/arm-cpus.in
> +Index: gcc/gcc/config/arm/arm-cpus.in
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-11.3.0.orig/gcc/config/arm/arm-cpus.in
> -+++ gcc-11.3.0/gcc/config/arm/arm-cpus.in
> +--- a/gcc/config/arm/arm-cpus.in
> ++++ b/gcc/config/arm/arm-cpus.in
>  @@ -132,6 +132,9 @@ define feature cmse
>   # Architecture rel 8.1-M.
>   define feature armv8_1m_main
> @@ -87,10 +87,10 @@ Index: gcc-11.3.0/gcc/config/arm/arm-cpus.in
>   begin arch iwmmxt
>    tune for iwmmxt
>    tune flags LDSCHED STRONG XSCALE
> -Index: gcc-11.3.0/gcc/config/arm/arm-tables.opt
> +Index: gcc/gcc/config/arm/arm-tables.opt
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-11.3.0.orig/gcc/config/arm/arm-tables.opt
> -+++ gcc-11.3.0/gcc/config/arm/arm-tables.opt
> +--- a/gcc/config/arm/arm-tables.opt
> ++++ b/gcc/config/arm/arm-tables.opt
>  @@ -380,10 +380,13 @@ EnumValue
>   Enum(arm_arch) String(armv8.1-m.main) Value(30)
>
> @@ -107,10 +107,10 @@ Index: gcc-11.3.0/gcc/config/arm/arm-tables.opt
>
>   Enum
>   Name(arm_fpu) Type(enum fpu_type)
> -Index: gcc-11.3.0/gcc/config/arm/arm.h
> +Index: gcc/gcc/config/arm/arm.h
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-11.3.0.orig/gcc/config/arm/arm.h
> -+++ gcc-11.3.0/gcc/config/arm/arm.h
> +--- a/gcc/config/arm/arm.h
> ++++ b/gcc/config/arm/arm.h
>  @@ -456,7 +456,8 @@ enum base_architecture
>     BASE_ARCH_8A =3D 8,
>     BASE_ARCH_8M_BASE =3D 8,
> @@ -121,10 +121,10 @@ Index: gcc-11.3.0/gcc/config/arm/arm.h
>   };
>
>   /* The major revision number of the ARM Architecture implemented by the=
 target.  */
> -Index: gcc-11.3.0/gcc/config/arm/t-aprofile
> +Index: gcc/gcc/config/arm/t-aprofile
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-11.3.0.orig/gcc/config/arm/t-aprofile
> -+++ gcc-11.3.0/gcc/config/arm/t-aprofile
> +--- a/gcc/config/arm/t-aprofile
> ++++ b/gcc/config/arm/t-aprofile
>  @@ -26,8 +26,8 @@
>
>   # Arch and FPU variants to build libraries with
> @@ -180,10 +180,10 @@ Index: gcc-11.3.0/gcc/config/arm/t-aprofile
>  -                           $(foreach ARCH, armv7-a armv8-a, \
>  +                           $(foreach ARCH, armv7-a armv8-a armv9-a, \
>                                mthumb/march.$(ARCH)/mfloat-abi.soft=3Dm$(=
MODE)/march.$(ARCH)/mfloat-abi.softfp))
> -Index: gcc-11.3.0/gcc/config/arm/t-arm-elf
> +Index: gcc/gcc/config/arm/t-arm-elf
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-11.3.0.orig/gcc/config/arm/t-arm-elf
> -+++ gcc-11.3.0/gcc/config/arm/t-arm-elf
> +--- a/gcc/config/arm/t-arm-elf
> ++++ b/gcc/config/arm/t-arm-elf
>  @@ -38,6 +38,8 @@ v7ve_fps     :=3D vfpv3-d16 vfpv3 vfpv3-d16-fp
>   # it seems to work ok.
>   v8_fps                :=3D simd fp16 crypto fp16+crypto dotprod fp16fml
> @@ -214,10 +214,10 @@ Index: gcc-11.3.0/gcc/config/arm/t-arm-elf
>   MULTILIB_MATCHES     +=3D $(foreach ARCH, armv7e-m armv8-m.mainline, \
>                           march?armv7+fp=3Dmarch?$(ARCH)+fp.dp)
>
> -Index: gcc-11.3.0/gcc/config/arm/t-multilib
> +Index: gcc/gcc/config/arm/t-multilib
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-11.3.0.orig/gcc/config/arm/t-multilib
> -+++ gcc-11.3.0/gcc/config/arm/t-multilib
> +--- a/gcc/config/arm/t-multilib
> ++++ b/gcc/config/arm/t-multilib
>  @@ -78,6 +78,8 @@ v8_4_a_simd_variants :=3D $(call all_feat_
>   v8_5_a_simd_variants  :=3D $(call all_feat_combs, simd fp16 crypto i8mm=
 bf16)
>   v8_6_a_simd_variants  :=3D $(call all_feat_combs, simd fp16 crypto i8mm=
 bf16)
> @@ -244,10 +244,10 @@ Index: gcc-11.3.0/gcc/config/arm/t-multilib
>   endif         # Not APROFILE.
>
>   # Use Thumb libraries for everything.
> -Index: gcc-11.3.0/gcc/doc/invoke.texi
> +Index: gcc/gcc/doc/invoke.texi
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-11.3.0.orig/gcc/doc/invoke.texi
> -+++ gcc-11.3.0/gcc/doc/invoke.texi
> +--- a/gcc/doc/invoke.texi
> ++++ b/gcc/doc/invoke.texi
>  @@ -19701,6 +19701,7 @@ Permissible names are:
>   @samp{armv7-m}, @samp{armv7e-m},
>   @samp{armv8-m.base}, @samp{armv8-m.main},
> @@ -256,10 +256,10 @@ Index: gcc-11.3.0/gcc/doc/invoke.texi
>   @samp{iwmmxt} and @samp{iwmmxt2}.
>
>   Additionally, the following architectures, which lack support for the
> -Index: gcc-11.3.0/gcc/testsuite/gcc.target/arm/multilib.exp
> +Index: gcc/gcc/testsuite/gcc.target/arm/multilib.exp
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-11.3.0.orig/gcc/testsuite/gcc.target/arm/multilib.exp
> -+++ gcc-11.3.0/gcc/testsuite/gcc.target/arm/multilib.exp
> +--- a/gcc/testsuite/gcc.target/arm/multilib.exp
> ++++ b/gcc/testsuite/gcc.target/arm/multilib.exp
>  @@ -135,6 +135,14 @@ if {[multilib_config "aprofile"] } {
>         {-march=3Darmv8.6-a+simd+fp16 -mfloat-abi=3Dsoftfp} "thumb/v8-a+s=
imd/softfp"
>         {-march=3Darmv8.6-a+simd+fp16+nofp -mfloat-abi=3Dsoftfp} "thumb/v=
8-a/nofp"
> @@ -275,10 +275,10 @@ Index: gcc-11.3.0/gcc/testsuite/gcc.target/arm/mult=
ilib.exp
>         {-mcpu=3Dcortex-a53+crypto -mfloat-abi=3Dhard} "thumb/v8-a+simd/h=
ard"
>         {-mcpu=3Dcortex-a53+nofp -mfloat-abi=3Dsoftfp} "thumb/v8-a/nofp"
>         {-march=3Darmv8-a+crc -mfloat-abi=3Dhard -mfpu=3Dvfp} "thumb/v8-a=
+simd/hard"
> -Index: gcc-11.3.0/gcc/testsuite/lib/target-supports.exp
> +Index: gcc/gcc/testsuite/lib/target-supports.exp
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-11.3.0.orig/gcc/testsuite/lib/target-supports.exp
> -+++ gcc-11.3.0/gcc/testsuite/lib/target-supports.exp
> +--- a/gcc/testsuite/lib/target-supports.exp
> ++++ b/gcc/testsuite/lib/target-supports.exp
>  @@ -4820,7 +4820,8 @@ foreach { armfunc armflag armdefs } {
>         v8m_base "-march=3Darmv8-m.base -mthumb -mfloat-abi=3Dsoft"
>                 __ARM_ARCH_8M_BASE__
> diff --git a/meta/recipes-devtools/gcc/gcc/0006-Define-GLIBC_DYNAMIC_LINK=
ER-and-UCLIBC_DYNAMIC_LINKE.patch b/meta/recipes-devtools/gcc/gcc/0006-Defi=
ne-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
> index b3515c9734..ece5873258 100644
> --- a/meta/recipes-devtools/gcc/gcc/0006-Define-GLIBC_DYNAMIC_LINKER-and-=
UCLIBC_DYNAMIC_LINKE.patch
> +++ b/meta/recipes-devtools/gcc/gcc/0006-Define-GLIBC_DYNAMIC_LINKER-and-=
UCLIBC_DYNAMIC_LINKE.patch
> @@ -39,10 +39,10 @@ Signed-off-by: Pavel Zhukov <pavel@zhukoff.net>
>   gcc/config/sparc/linux64.h         |  4 ++--
>   17 files changed, 53 insertions(+), 58 deletions(-)
>
> -Index: gcc-11.3.0/gcc/config/aarch64/aarch64-linux.h
> +Index: gcc/gcc/config/aarch64/aarch64-linux.h
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-11.3.0.orig/gcc/config/aarch64/aarch64-linux.h
> -+++ gcc-11.3.0/gcc/config/aarch64/aarch64-linux.h
> +--- a/gcc/config/aarch64/aarch64-linux.h
> ++++ b/gcc/config/aarch64/aarch64-linux.h
>  @@ -21,10 +21,10 @@
>   #ifndef GCC_AARCH64_LINUX_H
>   #define GCC_AARCH64_LINUX_H
> @@ -56,10 +56,10 @@ Index: gcc-11.3.0/gcc/config/aarch64/aarch64-linux.h
>
>   #undef  ASAN_CC1_SPEC
>   #define ASAN_CC1_SPEC "%{%:sanitize(address):-funwind-tables}"
> -Index: gcc-11.3.0/gcc/config/alpha/linux-elf.h
> +Index: gcc/gcc/config/alpha/linux-elf.h
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-11.3.0.orig/gcc/config/alpha/linux-elf.h
> -+++ gcc-11.3.0/gcc/config/alpha/linux-elf.h
> +--- a/gcc/config/alpha/linux-elf.h
> ++++ b/gcc/config/alpha/linux-elf.h
>  @@ -23,8 +23,8 @@ along with GCC; see the file COPYING3.
>   #define EXTRA_SPECS \
>   { "elf_dynamic_linker", ELF_DYNAMIC_LINKER },
> @@ -71,10 +71,10 @@ Index: gcc-11.3.0/gcc/config/alpha/linux-elf.h
>   #if DEFAULT_LIBC =3D=3D LIBC_UCLIBC
>   #define CHOOSE_DYNAMIC_LINKER(G, U) "%{mglibc:" G ";:" U "}"
>   #elif DEFAULT_LIBC =3D=3D LIBC_GLIBC
> -Index: gcc-11.3.0/gcc/config/arm/linux-eabi.h
> +Index: gcc/gcc/config/arm/linux-eabi.h
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-11.3.0.orig/gcc/config/arm/linux-eabi.h
> -+++ gcc-11.3.0/gcc/config/arm/linux-eabi.h
> +--- a/gcc/config/arm/linux-eabi.h
> ++++ b/gcc/config/arm/linux-eabi.h
>  @@ -65,8 +65,8 @@
>      GLIBC_DYNAMIC_LINKER_DEFAULT and TARGET_DEFAULT_FLOAT_ABI.  */
>
> @@ -95,10 +95,10 @@ Index: gcc-11.3.0/gcc/config/arm/linux-eabi.h
>
>   /* At this point, bpabi.h will have clobbered LINK_SPEC.  We want to
>      use the GNU/Linux version, not the generic BPABI version.  */
> -Index: gcc-11.3.0/gcc/config/arm/linux-elf.h
> +Index: gcc/gcc/config/arm/linux-elf.h
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-11.3.0.orig/gcc/config/arm/linux-elf.h
> -+++ gcc-11.3.0/gcc/config/arm/linux-elf.h
> +--- a/gcc/config/arm/linux-elf.h
> ++++ b/gcc/config/arm/linux-elf.h
>  @@ -60,7 +60,7 @@
>
>   #define LIBGCC_SPEC "%{mfloat-abi=3Dsoft*:-lfloat} -lgcc"
> @@ -108,10 +108,10 @@ Index: gcc-11.3.0/gcc/config/arm/linux-elf.h
>
>   #define LINUX_TARGET_LINK_SPEC  "%{h*} \
>      %{static:-Bstatic} \
> -Index: gcc-11.3.0/gcc/config/i386/linux.h
> +Index: gcc/gcc/config/i386/linux.h
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-11.3.0.orig/gcc/config/i386/linux.h
> -+++ gcc-11.3.0/gcc/config/i386/linux.h
> +--- a/gcc/config/i386/linux.h
> ++++ b/gcc/config/i386/linux.h
>  @@ -20,7 +20,7 @@ along with GCC; see the file COPYING3.
>   <http://www.gnu.org/licenses/>.  */
>
> @@ -122,10 +122,10 @@ Index: gcc-11.3.0/gcc/config/i386/linux.h
>   #undef MUSL_DYNAMIC_LINKER
>  -#define MUSL_DYNAMIC_LINKER "/lib/ld-musl-i386.so.1"
>  +#define MUSL_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-musl-i386.so.1"
> -Index: gcc-11.3.0/gcc/config/i386/linux64.h
> +Index: gcc/gcc/config/i386/linux64.h
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-11.3.0.orig/gcc/config/i386/linux64.h
> -+++ gcc-11.3.0/gcc/config/i386/linux64.h
> +--- a/gcc/config/i386/linux64.h
> ++++ b/gcc/config/i386/linux64.h
>  @@ -27,13 +27,13 @@ see the files COPYING3 and COPYING.RUNTI
>   #define GNU_USER_LINK_EMULATION64 "elf_x86_64"
>   #define GNU_USER_LINK_EMULATIONX32 "elf32_x86_64"
> @@ -146,10 +146,10 @@ Index: gcc-11.3.0/gcc/config/i386/linux64.h
>   #undef MUSL_DYNAMIC_LINKERX32
>  -#define MUSL_DYNAMIC_LINKERX32 "/lib/ld-musl-x32.so.1"
>  +#define MUSL_DYNAMIC_LINKERX32 SYSTEMLIBS_DIR "ld-musl-x32.so.1"
> -Index: gcc-11.3.0/gcc/config/linux.h
> +Index: gcc/gcc/config/linux.h
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-11.3.0.orig/gcc/config/linux.h
> -+++ gcc-11.3.0/gcc/config/linux.h
> +--- a/gcc/config/linux.h
> ++++ b/gcc/config/linux.h
>  @@ -94,10 +94,10 @@ see the files COPYING3 and COPYING.RUNTI
>      GLIBC_DYNAMIC_LINKER must be defined for each target using them, or
>      GLIBC_DYNAMIC_LINKER32 and GLIBC_DYNAMIC_LINKER64 for targets
> @@ -165,10 +165,10 @@ Index: gcc-11.3.0/gcc/config/linux.h
>   #define BIONIC_DYNAMIC_LINKER "/system/bin/linker"
>   #define BIONIC_DYNAMIC_LINKER32 "/system/bin/linker"
>   #define BIONIC_DYNAMIC_LINKER64 "/system/bin/linker64"
> -Index: gcc-11.3.0/gcc/config/microblaze/linux.h
> +Index: gcc/gcc/config/microblaze/linux.h
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-11.3.0.orig/gcc/config/microblaze/linux.h
> -+++ gcc-11.3.0/gcc/config/microblaze/linux.h
> +--- a/gcc/config/microblaze/linux.h
> ++++ b/gcc/config/microblaze/linux.h
>  @@ -28,7 +28,7 @@
>   #undef TLS_NEEDS_GOT
>   #define TLS_NEEDS_GOT 1
> @@ -187,10 +187,10 @@ Index: gcc-11.3.0/gcc/config/microblaze/linux.h
>
>   #undef  SUBTARGET_EXTRA_SPECS
>   #define SUBTARGET_EXTRA_SPECS \
> -Index: gcc-11.3.0/gcc/config/mips/linux.h
> +Index: gcc/gcc/config/mips/linux.h
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-11.3.0.orig/gcc/config/mips/linux.h
> -+++ gcc-11.3.0/gcc/config/mips/linux.h
> +--- a/gcc/config/mips/linux.h
> ++++ b/gcc/config/mips/linux.h
>  @@ -22,29 +22,29 @@ along with GCC; see the file COPYING3.
>   #define GNU_USER_LINK_EMULATIONN32 "elf32%{EB:b}%{EL:l}tsmipn32"
>
> @@ -230,10 +230,10 @@ Index: gcc-11.3.0/gcc/config/mips/linux.h
>
>   #define BIONIC_DYNAMIC_LINKERN32 "/system/bin/linker32"
>   #define GNU_USER_DYNAMIC_LINKERN32 \
> -Index: gcc-11.3.0/gcc/config/nios2/linux.h
> +Index: gcc/gcc/config/nios2/linux.h
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-11.3.0.orig/gcc/config/nios2/linux.h
> -+++ gcc-11.3.0/gcc/config/nios2/linux.h
> +--- a/gcc/config/nios2/linux.h
> ++++ b/gcc/config/nios2/linux.h
>  @@ -29,7 +29,7 @@
>   #undef CPP_SPEC
>   #define CPP_SPEC "%{posix:-D_POSIX_SOURCE} %{pthread:-D_REENTRANT}"
> @@ -243,10 +243,10 @@ Index: gcc-11.3.0/gcc/config/nios2/linux.h
>
>   #undef LINK_SPEC
>   #define LINK_SPEC LINK_SPEC_ENDIAN \
> -Index: gcc-11.3.0/gcc/config/riscv/linux.h
> +Index: gcc/gcc/config/riscv/linux.h
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-11.3.0.orig/gcc/config/riscv/linux.h
> -+++ gcc-11.3.0/gcc/config/riscv/linux.h
> +--- a/gcc/config/riscv/linux.h
> ++++ b/gcc/config/riscv/linux.h
>  @@ -22,7 +22,7 @@ along with GCC; see the file COPYING3.
>       GNU_USER_TARGET_OS_CPP_BUILTINS();                                \
>     } while (0)
> @@ -265,10 +265,10 @@ Index: gcc-11.3.0/gcc/config/riscv/linux.h
>
>   /* Because RISC-V only has word-sized atomics, it requries libatomic wh=
ere
>      others do not.  So link libatomic by default, as needed.  */
> -Index: gcc-11.3.0/gcc/config/rs6000/linux64.h
> +Index: gcc/gcc/config/rs6000/linux64.h
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-11.3.0.orig/gcc/config/rs6000/linux64.h
> -+++ gcc-11.3.0/gcc/config/rs6000/linux64.h
> +--- a/gcc/config/rs6000/linux64.h
> ++++ b/gcc/config/rs6000/linux64.h
>  @@ -336,24 +336,19 @@ extern int dot_symbols;
>   #undef        LINK_OS_DEFAULT_SPEC
>   #define LINK_OS_DEFAULT_SPEC "%(link_os_linux)"
> @@ -299,10 +299,10 @@ Index: gcc-11.3.0/gcc/config/rs6000/linux64.h
>
>   #undef  DEFAULT_ASM_ENDIAN
>   #if (TARGET_DEFAULT & MASK_LITTLE_ENDIAN)
> -Index: gcc-11.3.0/gcc/config/rs6000/sysv4.h
> +Index: gcc/gcc/config/rs6000/sysv4.h
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-11.3.0.orig/gcc/config/rs6000/sysv4.h
> -+++ gcc-11.3.0/gcc/config/rs6000/sysv4.h
> +--- a/gcc/config/rs6000/sysv4.h
> ++++ b/gcc/config/rs6000/sysv4.h
>  @@ -780,10 +780,10 @@ GNU_USER_TARGET_CC1_SPEC
>
>   #define MUSL_DYNAMIC_LINKER_E ENDIAN_SELECT("","le","")
> @@ -316,10 +316,10 @@ Index: gcc-11.3.0/gcc/config/rs6000/sysv4.h
>
>   #ifndef GNU_USER_DYNAMIC_LINKER
>   #define GNU_USER_DYNAMIC_LINKER GLIBC_DYNAMIC_LINKER
> -Index: gcc-11.3.0/gcc/config/s390/linux.h
> +Index: gcc/gcc/config/s390/linux.h
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-11.3.0.orig/gcc/config/s390/linux.h
> -+++ gcc-11.3.0/gcc/config/s390/linux.h
> +--- a/gcc/config/s390/linux.h
> ++++ b/gcc/config/s390/linux.h
>  @@ -72,13 +72,13 @@ along with GCC; see the file COPYING3.
>   #define MULTILIB_DEFAULTS { "m31" }
>   #endif
> @@ -338,10 +338,10 @@ Index: gcc-11.3.0/gcc/config/s390/linux.h
>
>   #undef  LINK_SPEC
>   #define LINK_SPEC \
> -Index: gcc-11.3.0/gcc/config/sh/linux.h
> +Index: gcc/gcc/config/sh/linux.h
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-11.3.0.orig/gcc/config/sh/linux.h
> -+++ gcc-11.3.0/gcc/config/sh/linux.h
> +--- a/gcc/config/sh/linux.h
> ++++ b/gcc/config/sh/linux.h
>  @@ -61,10 +61,10 @@ along with GCC; see the file COPYING3.
>
>   #undef MUSL_DYNAMIC_LINKER
> @@ -355,10 +355,10 @@ Index: gcc-11.3.0/gcc/config/sh/linux.h
>
>   #undef SUBTARGET_LINK_EMUL_SUFFIX
>   #define SUBTARGET_LINK_EMUL_SUFFIX "%{mfdpic:_fd;:_linux}"
> -Index: gcc-11.3.0/gcc/config/sparc/linux.h
> +Index: gcc/gcc/config/sparc/linux.h
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-11.3.0.orig/gcc/config/sparc/linux.h
> -+++ gcc-11.3.0/gcc/config/sparc/linux.h
> +--- a/gcc/config/sparc/linux.h
> ++++ b/gcc/config/sparc/linux.h
>  @@ -78,7 +78,7 @@ extern const char *host_detect_local_cpu
>      When the -shared link option is used a final link is not being
>      done.  */
> @@ -368,10 +368,10 @@ Index: gcc-11.3.0/gcc/config/sparc/linux.h
>
>   #undef  LINK_SPEC
>   #define LINK_SPEC "-m elf32_sparc %{shared:-shared} \
> -Index: gcc-11.3.0/gcc/config/sparc/linux64.h
> +Index: gcc/gcc/config/sparc/linux64.h
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-11.3.0.orig/gcc/config/sparc/linux64.h
> -+++ gcc-11.3.0/gcc/config/sparc/linux64.h
> +--- a/gcc/config/sparc/linux64.h
> ++++ b/gcc/config/sparc/linux64.h
>  @@ -78,8 +78,8 @@ along with GCC; see the file COPYING3.
>      When the -shared link option is used a final link is not being
>      done.  */
> diff --git a/meta/recipes-devtools/gcc/gcc/0009-gcc-armv4-pass-fix-v4bx-t=
o-linker-to-support-EABI.patch b/meta/recipes-devtools/gcc/gcc/0009-gcc-arm=
v4-pass-fix-v4bx-to-linker-to-support-EABI.patch
> index 0f94936140..1ec942e977 100644
> --- a/meta/recipes-devtools/gcc/gcc/0009-gcc-armv4-pass-fix-v4bx-to-linke=
r-to-support-EABI.patch
> +++ b/meta/recipes-devtools/gcc/gcc/0009-gcc-armv4-pass-fix-v4bx-to-linke=
r-to-support-EABI.patch
> @@ -18,10 +18,10 @@ Upstream-Status: Pending
>   gcc/config/arm/linux-eabi.h | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> -Index: gcc-11.3.0/gcc/config/arm/linux-eabi.h
> +Index: gcc/gcc/config/arm/linux-eabi.h
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-11.3.0.orig/gcc/config/arm/linux-eabi.h
> -+++ gcc-11.3.0/gcc/config/arm/linux-eabi.h
> +--- a/gcc/config/arm/linux-eabi.h
> ++++ b/gcc/config/arm/linux-eabi.h
>  @@ -91,10 +91,14 @@
>   #define MUSL_DYNAMIC_LINKER \
>     SYSTEMLIBS_DIR "ld-musl-arm" MUSL_DYNAMIC_LINKER_E "%{mfloat-abi=3Dha=
rd:hf}%{mfdpic:-fdpic}.so.1"
> diff --git a/meta/recipes-devtools/gcc/gcc_11.3.bb b/meta/recipes-devtool=
s/gcc/gcc_11.4.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc_11.3.bb
> rename to meta/recipes-devtools/gcc/gcc_11.4.bb
> diff --git a/meta/recipes-devtools/gcc/libgcc-initial_11.3.bb b/meta/reci=
pes-devtools/gcc/libgcc-initial_11.4.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/libgcc-initial_11.3.bb
> rename to meta/recipes-devtools/gcc/libgcc-initial_11.4.bb
> diff --git a/meta/recipes-devtools/gcc/libgcc_11.3.bb b/meta/recipes-devt=
ools/gcc/libgcc_11.4.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/libgcc_11.3.bb
> rename to meta/recipes-devtools/gcc/libgcc_11.4.bb
> diff --git a/meta/recipes-devtools/gcc/libgfortran_11.3.bb b/meta/recipes=
-devtools/gcc/libgfortran_11.4.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/libgfortran_11.3.bb
> rename to meta/recipes-devtools/gcc/libgfortran_11.4.bb
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#185092): https://lists.openembedded.org/g/openembedde=
d-core/message/185092
> Mute This Topic: https://lists.openembedded.org/mt/100447625/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

