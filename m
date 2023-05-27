Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4AC2C77B7E
	for <webhook@archiver.kernel.org>; Sat, 27 May 2023 05:15:48 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.5332.1685164546329801869
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 May 2023 22:15:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=qFe0yLNa;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-30adc69c0dbso692610f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 26 May 2023 22:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685164545; x=1687756545;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QEl1y/6LXKKdLKc926m3mvs5uYaQnhLAqQl8/I35aOw=;
        b=qFe0yLNa5ios3jCJZjaeBzLzzJsv2O9lrYt8rzUdbc0BTThDrFIW4RzmAYvb81Tgt+
         J734EaYC5om960kM0yjIa/l8kUYSizHMecz8teptsJSN1T0EhSw9dSqYlF4brd0FrFaK
         Yfeae2iX/RlB9P+mMXawWLhD0VHqjpFxEW71mNneNeurOD8zUp3oy4IRLmecPYv326/K
         l7qIvccxlMiOauG7C6TqgjSJQW+HiVZsI/Nz7Yc80SQ5kjAWmbCz5ZiqXwjMVh5+P7SX
         sZdKSAf283QuOX5Tnsk9kAFRBwDEr84Qb0zujSjb+qaajgnypXQCUltvkkP/hYeJ6BT7
         Rc9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685164545; x=1687756545;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QEl1y/6LXKKdLKc926m3mvs5uYaQnhLAqQl8/I35aOw=;
        b=cx51V4EhguPrYSa1uWLEpE7Ke7MJGJ5UWTbMltsMA0Dc4drrOP5Eijr27A5xXq6CTC
         /cbzix66U96VAb2kXcUio5bvgvxal0nADIH7mwPAF6B6i0K281eqjzpOVXY9VY3MDMgN
         dcAOeeuwL4cWlsuPRfhipdM62kKJ5Tu30aqK6DsVQUObiPq4fPoyf26GN9eYcHa9RG7T
         kynN2D8LPwn4En8FhAWqSRNtEARdUBL6FbLitsdZsfvduEMtiwIl56IsLVt0FFxr+nBF
         OXyLQjnrcuZLyKhicYegCr2hbldr41jLMWJG2t47lio5o5uMca/ncfidmjHdtXRSI4BE
         4J9A==
X-Gm-Message-State: AC+VfDxrl7ODjlWkk4GFkuVSaG1CwQ7kF7ZlT0okHxqX9KzhavxACTWy
	S4d8Z88XDfcO7nTVnH7uhXg7fPO/crozT2tBG9E=
X-Google-Smtp-Source: ACHHUZ4Q7UBNypG3a6PHCY02uHWHPUPJjemrs3wbQPCcorFIi25pn1Qd0PlS80d5PpDVpWRkNsyAq3EpeYbDkkFfIGo=
X-Received: by 2002:a5d:400d:0:b0:30a:e511:e65c with SMTP id
 n13-20020a5d400d000000b0030ae511e65cmr121221wrp.37.1685164544472; Fri, 26 May
 2023 22:15:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230527022115.143341-1-raj.khem@gmail.com>
In-Reply-To: <20230527022115.143341-1-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 27 May 2023 07:15:32 +0200
Message-ID: <CA+chaQefuQLnxn0sf9b8J7O2sP_5UMSCM_AgRRm3hKDS8anMMg@mail.gmail.com>
Subject: Re: [PATCH] gcc: Upgrade to 13.1.1
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000000fba7c05fca5f22b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 May 2023 05:15:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181787

--0000000000000fba7c05fca5f22b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I was using the same change with locally built uninative-tarball (
https://git.openembedded.org/openembedded-core-contrib/log/?h=3Djansa/maste=
r-uninative-3.9-gcc-13)
since yesterday and can confirm that selftest passes (except
test_gpt_partition_name which was expected and test_testimage_virgl_gtk_sdl
because of Invalid MIT-MAGIC-COOKIE-1)

2023-05-27 03:41:58,384 - oe-selftest - INFO - RESULTS -
buildoptions.SourceMirroring.test_yocto_source_mirror: SKIPPED (0.00s)
2023-05-27 03:41:58,384 - oe-selftest - INFO - RESULTS -
devtool.DevtoolAddTests.test_devtool_add_npm: SKIPPED (5.95s)
2023-05-27 03:41:58,384 - oe-selftest - INFO - RESULTS -
distrodata.Distrodata.test_checkpkg: SKIPPED (0.00s)
2023-05-27 03:41:58,384 - oe-selftest - INFO - RESULTS -
oescripts.OEGitproxyTests.test_oegitproxy_proxy_dash: SKIPPED (0.01s)
2023-05-27 03:41:58,384 - oe-selftest - INFO - RESULTS -
recipetool.RecipetoolCreateTests.test_recipetool_create_npm: SKIPPED (5.97s=
)
2023-05-27 03:41:58,384 - oe-selftest - INFO - RESULTS -
reproducible.DiffoscopeTests.test_diffoscope: SKIPPED
2023-05-27 03:41:58,384 - oe-selftest - INFO - RESULTS -
reproducible.ReproducibleTests.test_reproducible_builds: SKIPPED
2023-05-27 03:41:58,384 - oe-selftest - INFO - RESULTS -
runtime_test.TestImage.test_testimage_virgl_gtk_sdl: FAILED (469.13s)
2023-05-27 03:41:58,384 - oe-selftest - INFO - RESULTS -
wic.Wic2.test_gpt_partition_name: FAILED (61.75s)
2023-05-27 03:41:58,397 - oe-selftest - INFO - SUMMARY:
2023-05-27 03:41:58,397 - oe-selftest - INFO - oe-selftest () - Ran 528
tests in 15220.973s
2023-05-27 03:41:58,397 - oe-selftest - INFO - oe-selftest - FAIL -
Required tests failed (successes=3D519, skipped=3D7, failures=3D2, errors=
=3D0)

Tested-by: Martin Jansa <Martin.Jansa@gmail.com>

On Sat, May 27, 2023 at 4:21=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote=
:

> Some distros e.g. gentoo have latest on gcc-13 branch and we have a
> situation where libstdc++ ABI is changed between 13.1 and 13.2 so
> official 13.1 release based uninative will no longer work on these
> distros, therefore switch to a snapshot that includes [1] which fixes
> it
>
> [1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D108969
>
> Reported-by: Martin Jansa <Martin.Jansa@gmail.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/conf/distro/include/maintainers.inc      |  2 +-
>  meta/recipes-devtools/gcc/gcc-13.1.inc        | 18 +++---
>  ...AMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch | 64 ++++---------------
>  3 files changed, 24 insertions(+), 60 deletions(-)
>
> diff --git a/meta/conf/distro/include/maintainers.inc
> b/meta/conf/distro/include/maintainers.inc
> index 619fe073810..359a29c0768 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -188,7 +188,7 @@
> RECIPE_MAINTAINER:pn-gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "Kh=
em
> Raj <r
>  RECIPE_MAINTAINER:pn-gcc-crosssdk-${SDK_SYS} =3D "Khem Raj <
> raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-gcc-runtime =3D "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-gcc-sanitizers =3D "Khem Raj <raj.khem@gmail.com>"
> -RECIPE_MAINTAINER:pn-gcc-source-13.1.0 =3D "Khem Raj <raj.khem@gmail.com=
>"
> +RECIPE_MAINTAINER:pn-gcc-source-13.1.1 =3D "Khem Raj <raj.khem@gmail.com=
>"
>  RECIPE_MAINTAINER:pn-gconf =3D "Ross Burton <ross.burton@arm.com>"
>  RECIPE_MAINTAINER:pn-gcr3 =3D "Markus Volk <f_l_k@t-online.de>"
>  RECIPE_MAINTAINER:pn-gcr =3D "Alexander Kanavin <alex.kanavin@gmail.com>=
"
> diff --git a/meta/recipes-devtools/gcc/gcc-13.1.inc
> b/meta/recipes-devtools/gcc/gcc-13.1.inc
> index d361b680f47..4da703db52e 100644
> --- a/meta/recipes-devtools/gcc/gcc-13.1.inc
> +++ b/meta/recipes-devtools/gcc/gcc-13.1.inc
> @@ -2,11 +2,11 @@ require gcc-common.inc
>
>  # Third digit in PV should be incremented after a minor release
>
> -PV =3D "13.1.0"
> +PV =3D "13.1.1"
>
>  # BINV should be incremented to a revision after a minor gcc release
>
> -BINV =3D "13.1.0"
> +BINV =3D "13.1.1"
>
>  FILESEXTRAPATHS =3D. "${FILE_DIRNAME}/gcc:${FILE_DIRNAME}/gcc/backport:"
>
> @@ -30,14 +30,14 @@ LIC_FILES_CHKSUM =3D "\
>  #SOURCEDIR ?=3D "official-gcc-${@'${RELEASE}'[0:7]}"
>
>  # from snapshot
> -#RELEASE ?=3D "13.1.0-RC-20230421"
> -#SOURCEDIR ?=3D "gcc-${RELEASE}"
> -#BASEURI ?=3D "
> https://gcc.gnu.org/pub/gcc/snapshots/${RELEASE}/gcc-${RELEASE}.tar.xz"
> +RELEASE ?=3D "13-20230520"
> +SOURCEDIR ?=3D "gcc-${RELEASE}"
> +BASEURI ?=3D "
> https://gcc.gnu.org/pub/gcc/snapshots/${RELEASE}/gcc-${RELEASE}.tar.xz"
>
>  # official release
> -RELEASE ?=3D "${PV}"
> -BASEURI ?=3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.xz"
> -SOURCEDIR ?=3D "gcc-${PV}"
> +#RELEASE ?=3D "${PV}"
> +#BASEURI ?=3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.xz"
> +#SOURCEDIR ?=3D "gcc-${PV}"
>
>  SRC_URI =3D "${BASEURI} \
>             file://0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
> @@ -65,7 +65,7 @@ SRC_URI =3D "${BASEURI} \
>             file://0023-Fix-install-path-of-linux64.h.patch \
>             file://0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch=
 \
>  "
> -SRC_URI[sha256sum] =3D
> "61d684f0aa5e76ac6585ad8898a2427aade8979ed5e7f85492286c4dfc13ee86"
> +SRC_URI[sha256sum] =3D
> "b8716f92e468086fca5aea8873f7405f1cd7d309ad0719f0a90c57b3483e448c"
>
>  S =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/${SOURCEDIR}"
>  B =3D "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
> diff --git
> a/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER-and-UCLI=
BC_DYNAMIC_LINKE.patch
> b/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER-and-UCLI=
BC_DYNAMIC_LINKE.patch
> index a42a0441424..e3af0bf161f 100644
> ---
> a/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER-and-UCLI=
BC_DYNAMIC_LINKE.patch
> +++
> b/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER-and-UCLI=
BC_DYNAMIC_LINKE.patch
> @@ -35,8 +35,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   gcc/config/sparc/linux64.h         |  4 ++--
>   18 files changed, 53 insertions(+), 58 deletions(-)
>
> -diff --git a/gcc/config/aarch64/aarch64-linux.h
> b/gcc/config/aarch64/aarch64-linux.h
> -index 4277f03da2a..e4c92c03291 100644
>  --- a/gcc/config/aarch64/aarch64-linux.h
>  +++ b/gcc/config/aarch64/aarch64-linux.h
>  @@ -21,10 +21,10 @@
> @@ -52,11 +50,9 @@ index 4277f03da2a..e4c92c03291 100644
>
>   #undef  ASAN_CC1_SPEC
>   #define ASAN_CC1_SPEC "%{%:sanitize(address):-funwind-tables}"
> -diff --git a/gcc/config/alpha/linux-elf.h b/gcc/config/alpha/linux-elf.h
> -index 03f783f2ad1..4fa02668aa7 100644
>  --- a/gcc/config/alpha/linux-elf.h
>  +++ b/gcc/config/alpha/linux-elf.h
> -@@ -23,8 +23,8 @@ along with GCC; see the file COPYING3.  If not see
> +@@ -23,8 +23,8 @@ along with GCC; see the file COPYING3.
>   #define EXTRA_SPECS \
>   { "elf_dynamic_linker", ELF_DYNAMIC_LINKER },
>
> @@ -67,8 +63,6 @@ index 03f783f2ad1..4fa02668aa7 100644
>   #if DEFAULT_LIBC =3D=3D LIBC_UCLIBC
>   #define CHOOSE_DYNAMIC_LINKER(G, U) "%{mglibc:" G ";:" U "}"
>   #elif DEFAULT_LIBC =3D=3D LIBC_GLIBC
> -diff --git a/gcc/config/arm/linux-eabi.h b/gcc/config/arm/linux-eabi.h
> -index a119875599d..dce7f59eeea 100644
>  --- a/gcc/config/arm/linux-eabi.h
>  +++ b/gcc/config/arm/linux-eabi.h
>  @@ -62,8 +62,8 @@
> @@ -91,8 +85,6 @@ index a119875599d..dce7f59eeea 100644
>
>   /* At this point, bpabi.h will have clobbered LINK_SPEC.  We want to
>      use the GNU/Linux version, not the generic BPABI version.  */
> -diff --git a/gcc/config/arm/linux-elf.h b/gcc/config/arm/linux-elf.h
> -index 7b7b7cbbe14..98ef2267117 100644
>  --- a/gcc/config/arm/linux-elf.h
>  +++ b/gcc/config/arm/linux-elf.h
>  @@ -60,7 +60,7 @@
> @@ -104,11 +96,9 @@ index 7b7b7cbbe14..98ef2267117 100644
>
>   #define LINUX_TARGET_LINK_SPEC  "%{h*} \
>      %{static:-Bstatic} \
> -diff --git a/gcc/config/i386/linux.h b/gcc/config/i386/linux.h
> -index bbb7cc7115e..7d9272040ee 100644
>  --- a/gcc/config/i386/linux.h
>  +++ b/gcc/config/i386/linux.h
> -@@ -20,7 +20,7 @@ along with GCC; see the file COPYING3.  If not see
> +@@ -20,7 +20,7 @@ along with GCC; see the file COPYING3.
>   <http://www.gnu.org/licenses/>.  */
>
>   #define GNU_USER_LINK_EMULATION "elf_i386"
> @@ -118,11 +108,9 @@ index bbb7cc7115e..7d9272040ee 100644
>   #undef MUSL_DYNAMIC_LINKER
>  -#define MUSL_DYNAMIC_LINKER "/lib/ld-musl-i386.so.1"
>  +#define MUSL_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-musl-i386.so.1"
> -diff --git a/gcc/config/i386/linux64.h b/gcc/config/i386/linux64.h
> -index 2bd9f48e271..dbbe7ca5440 100644
>  --- a/gcc/config/i386/linux64.h
>  +++ b/gcc/config/i386/linux64.h
> -@@ -27,13 +27,13 @@ see the files COPYING3 and COPYING.RUNTIME
> respectively.  If not, see
> +@@ -27,13 +27,13 @@ see the files COPYING3 and COPYING.RUNTI
>   #define GNU_USER_LINK_EMULATION64 "elf_x86_64"
>   #define GNU_USER_LINK_EMULATIONX32 "elf32_x86_64"
>
> @@ -142,11 +130,9 @@ index 2bd9f48e271..dbbe7ca5440 100644
>   #undef MUSL_DYNAMIC_LINKERX32
>  -#define MUSL_DYNAMIC_LINKERX32 "/lib/ld-musl-x32.so.1"
>  +#define MUSL_DYNAMIC_LINKERX32 SYSTEMLIBS_DIR "ld-musl-x32.so.1"
> -diff --git a/gcc/config/linux.h b/gcc/config/linux.h
> -index e3aca79cccc..6491c6b84f5 100644
>  --- a/gcc/config/linux.h
>  +++ b/gcc/config/linux.h
> -@@ -86,10 +86,10 @@ see the files COPYING3 and COPYING.RUNTIME
> respectively.  If not, see
> +@@ -86,10 +86,10 @@ see the files COPYING3 and COPYING.RUNTI
>      GLIBC_DYNAMIC_LINKER must be defined for each target using them, or
>      GLIBC_DYNAMIC_LINKER32 and GLIBC_DYNAMIC_LINKER64 for targets
>      supporting both 32-bit and 64-bit compilation.  */
> @@ -161,11 +147,9 @@ index e3aca79cccc..6491c6b84f5 100644
>   #define BIONIC_DYNAMIC_LINKER "/system/bin/linker"
>   #define BIONIC_DYNAMIC_LINKER32 "/system/bin/linker"
>   #define BIONIC_DYNAMIC_LINKER64 "/system/bin/linker64"
> -diff --git a/gcc/config/loongarch/gnu-user.h
> b/gcc/config/loongarch/gnu-user.h
> -index aecaa02a199..62f88f7f9a2 100644
>  --- a/gcc/config/loongarch/gnu-user.h
>  +++ b/gcc/config/loongarch/gnu-user.h
> -@@ -31,11 +31,11 @@ along with GCC; see the file COPYING3.  If not see
> +@@ -31,11 +31,11 @@ along with GCC; see the file COPYING3.
>
>   #undef GLIBC_DYNAMIC_LINKER
>   #define GLIBC_DYNAMIC_LINKER \
> @@ -179,8 +163,6 @@ index aecaa02a199..62f88f7f9a2 100644
>
>   #undef GNU_USER_TARGET_LINK_SPEC
>   #define GNU_USER_TARGET_LINK_SPEC \
> -diff --git a/gcc/config/microblaze/linux.h b/gcc/config/microblaze/linux=
.h
> -index e2e2c421c52..6f26480e3b5 100644
>  --- a/gcc/config/microblaze/linux.h
>  +++ b/gcc/config/microblaze/linux.h
>  @@ -28,7 +28,7 @@
> @@ -201,11 +183,9 @@ index e2e2c421c52..6f26480e3b5 100644
>
>   #undef  SUBTARGET_EXTRA_SPECS
>   #define SUBTARGET_EXTRA_SPECS \
> -diff --git a/gcc/config/mips/linux.h b/gcc/config/mips/linux.h
> -index 5add34ea134..34692b433b8 100644
>  --- a/gcc/config/mips/linux.h
>  +++ b/gcc/config/mips/linux.h
> -@@ -22,29 +22,29 @@ along with GCC; see the file COPYING3.  If not see
> +@@ -22,29 +22,29 @@ along with GCC; see the file COPYING3.
>   #define GNU_USER_LINK_EMULATIONN32 "elf32%{EB:b}%{EL:l}tsmipn32"
>
>   #define GLIBC_DYNAMIC_LINKER32 \
> @@ -244,8 +224,6 @@ index 5add34ea134..34692b433b8 100644
>
>   #define BIONIC_DYNAMIC_LINKERN32 "/system/bin/linker32"
>   #define GNU_USER_DYNAMIC_LINKERN32 \
> -diff --git a/gcc/config/nios2/linux.h b/gcc/config/nios2/linux.h
> -index 2ce097ebbce..1d45d7b4962 100644
>  --- a/gcc/config/nios2/linux.h
>  +++ b/gcc/config/nios2/linux.h
>  @@ -29,10 +29,10 @@
> @@ -261,11 +239,9 @@ index 2ce097ebbce..1d45d7b4962 100644
>
>   #undef LINK_SPEC
>   #define LINK_SPEC LINK_SPEC_ENDIAN \
> -diff --git a/gcc/config/riscv/linux.h b/gcc/config/riscv/linux.h
> -index b9557a75dc7..e10ca1f97e7 100644
>  --- a/gcc/config/riscv/linux.h
>  +++ b/gcc/config/riscv/linux.h
> -@@ -22,7 +22,7 @@ along with GCC; see the file COPYING3.  If not see
> +@@ -22,7 +22,7 @@ along with GCC; see the file COPYING3.
>       GNU_USER_TARGET_OS_CPP_BUILTINS();                                \
>     } while (0)
>
> @@ -274,17 +250,15 @@ index b9557a75dc7..e10ca1f97e7 100644
>
>   #define MUSL_ABI_SUFFIX \
>     "%{mabi=3Dilp32:-sf}" \
> -@@ -33,7 +33,7 @@ along with GCC; see the file COPYING3.  If not see
> +@@ -33,7 +33,7 @@ along with GCC; see the file COPYING3.
>     "%{mabi=3Dlp64d:}"
>
>   #undef MUSL_DYNAMIC_LINKER
>  -#define MUSL_DYNAMIC_LINKER "/lib/ld-musl-riscv" XLEN_SPEC
> MUSL_ABI_SUFFIX ".so.1"
>  +#define MUSL_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-musl-riscv" XLEN_SPEC
> MUSL_ABI_SUFFIX ".so.1"
>
> - /* Because RISC-V only has word-sized atomics, it requries libatomic
> where
> -    others do not.  So link libatomic by default, as needed.  */
> -diff --git a/gcc/config/rs6000/linux64.h b/gcc/config/rs6000/linux64.h
> -index 9e457033d11..2ddab7c99c1 100644
> + #define ICACHE_FLUSH_FUNC "__riscv_flush_icache"
> +
>  --- a/gcc/config/rs6000/linux64.h
>  +++ b/gcc/config/rs6000/linux64.h
>  @@ -339,24 +339,19 @@ extern int dot_symbols;
> @@ -317,8 +291,6 @@ index 9e457033d11..2ddab7c99c1 100644
>
>   #undef  DEFAULT_ASM_ENDIAN
>   #if (TARGET_DEFAULT & MASK_LITTLE_ENDIAN)
> -diff --git a/gcc/config/rs6000/sysv4.h b/gcc/config/rs6000/sysv4.h
> -index ae932fc22f0..26db003cb3a 100644
>  --- a/gcc/config/rs6000/sysv4.h
>  +++ b/gcc/config/rs6000/sysv4.h
>  @@ -771,10 +771,10 @@ GNU_USER_TARGET_CC1_SPEC
> @@ -334,11 +306,9 @@ index ae932fc22f0..26db003cb3a 100644
>
>   #ifndef GNU_USER_DYNAMIC_LINKER
>   #define GNU_USER_DYNAMIC_LINKER GLIBC_DYNAMIC_LINKER
> -diff --git a/gcc/config/s390/linux.h b/gcc/config/s390/linux.h
> -index 02aa1edaff8..fab268d61f4 100644
>  --- a/gcc/config/s390/linux.h
>  +++ b/gcc/config/s390/linux.h
> -@@ -72,13 +72,13 @@ along with GCC; see the file COPYING3.  If not see
> +@@ -72,13 +72,13 @@ along with GCC; see the file COPYING3.
>   #define MULTILIB_DEFAULTS { "m31" }
>   #endif
>
> @@ -356,11 +326,9 @@ index 02aa1edaff8..fab268d61f4 100644
>
>   #undef  LINK_SPEC
>   #define LINK_SPEC \
> -diff --git a/gcc/config/sh/linux.h b/gcc/config/sh/linux.h
> -index 29f5902b98b..83d1e53e6e2 100644
>  --- a/gcc/config/sh/linux.h
>  +++ b/gcc/config/sh/linux.h
> -@@ -61,10 +61,10 @@ along with GCC; see the file COPYING3.  If not see
> +@@ -61,10 +61,10 @@ along with GCC; see the file COPYING3.
>
>   #undef MUSL_DYNAMIC_LINKER
>   #define MUSL_DYNAMIC_LINKER \
> @@ -373,11 +341,9 @@ index 29f5902b98b..83d1e53e6e2 100644
>
>   #undef SUBTARGET_LINK_EMUL_SUFFIX
>   #define SUBTARGET_LINK_EMUL_SUFFIX "%{mfdpic:_fd;:_linux}"
> -diff --git a/gcc/config/sparc/linux.h b/gcc/config/sparc/linux.h
> -index 0e33b3cac2c..84f29adbb35 100644
>  --- a/gcc/config/sparc/linux.h
>  +++ b/gcc/config/sparc/linux.h
> -@@ -78,7 +78,7 @@ extern const char *host_detect_local_cpu (int argc,
> const char **argv);
> +@@ -78,7 +78,7 @@ extern const char *host_detect_local_cpu
>      When the -shared link option is used a final link is not being
>      done.  */
>
> @@ -386,11 +352,9 @@ index 0e33b3cac2c..84f29adbb35 100644
>
>   #undef  LINK_SPEC
>   #define LINK_SPEC "-m elf32_sparc %{shared:-shared} \
> -diff --git a/gcc/config/sparc/linux64.h b/gcc/config/sparc/linux64.h
> -index f1cc0a19e49..94bc2032803 100644
>  --- a/gcc/config/sparc/linux64.h
>  +++ b/gcc/config/sparc/linux64.h
> -@@ -78,8 +78,8 @@ along with GCC; see the file COPYING3.  If not see
> +@@ -78,8 +78,8 @@ along with GCC; see the file COPYING3.
>      When the -shared link option is used a final link is not being
>      done.  */
>
> --
> 2.40.1
>
>

--0000000000000fba7c05fca5f22b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I was using the same change with locally built uninat=
ive-tarball (<a href=3D"https://git.openembedded.org/openembedded-core-cont=
rib/log/?h=3Djansa/master-uninative-3.9-gcc-13">https://git.openembedded.or=
g/openembedded-core-contrib/log/?h=3Djansa/master-uninative-3.9-gcc-13</a>)=
 since yesterday and can confirm that selftest passes (except test_gpt_part=
ition_name which was expected and test_testimage_virgl_gtk_sdl because of I=
nvalid MIT-MAGIC-COOKIE-1)</div><div><br></div><div>2023-05-27 03:41:58,384=
 - oe-selftest - INFO - RESULTS - buildoptions.SourceMirroring.test_yocto_s=
ource_mirror: SKIPPED (0.00s)<br>2023-05-27 03:41:58,384 - oe-selftest - IN=
FO - RESULTS - devtool.DevtoolAddTests.test_devtool_add_npm: SKIPPED (5.95s=
)<br>2023-05-27 03:41:58,384 - oe-selftest - INFO - RESULTS - distrodata.Di=
strodata.test_checkpkg: SKIPPED (0.00s)<br>2023-05-27 03:41:58,384 - oe-sel=
ftest - INFO - RESULTS - oescripts.OEGitproxyTests.test_oegitproxy_proxy_da=
sh: SKIPPED (0.01s)<br>2023-05-27 03:41:58,384 - oe-selftest - INFO - RESUL=
TS - recipetool.RecipetoolCreateTests.test_recipetool_create_npm: SKIPPED (=
5.97s)<br>2023-05-27 03:41:58,384 - oe-selftest - INFO - RESULTS - reproduc=
ible.DiffoscopeTests.test_diffoscope: SKIPPED<br>2023-05-27 03:41:58,384 - =
oe-selftest - INFO - RESULTS - reproducible.ReproducibleTests.test_reproduc=
ible_builds: SKIPPED<br>2023-05-27 03:41:58,384 - oe-selftest - INFO - RESU=
LTS - runtime_test.TestImage.test_testimage_virgl_gtk_sdl: FAILED (469.13s)=
<br>2023-05-27 03:41:58,384 - oe-selftest - INFO - RESULTS - wic.Wic2.test_=
gpt_partition_name: FAILED (61.75s)<br>2023-05-27 03:41:58,397 - oe-selftes=
t - INFO - SUMMARY:<br>2023-05-27 03:41:58,397 - oe-selftest - INFO - oe-se=
lftest () - Ran 528 tests in 15220.973s<br>2023-05-27 03:41:58,397 - oe-sel=
ftest - INFO - oe-selftest - FAIL - Required tests failed (successes=3D519,=
 skipped=3D7, failures=3D2, errors=3D0)<br></div><div><br></div><div>Tested=
-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" target=3D"_=
blank">Martin.Jansa@gmail.com</a>&gt;</div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Sat, May 27, 2023 at 4:21=E2=80=AFA=
M Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Some=
 distros e.g. gentoo have latest on gcc-13 branch and we have a<br>
situation where libstdc++ ABI is changed between 13.1 and 13.2 so<br>
official 13.1 release based uninative will no longer work on these<br>
distros, therefore switch to a snapshot that includes [1] which fixes<br>
it<br>
<br>
[1] <a href=3D"https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D108969" rel=
=3D"noreferrer" target=3D"_blank">https://gcc.gnu.org/bugzilla/show_bug.cgi=
?id=3D108969</a><br>
<br>
Reported-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" tar=
get=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
Cc: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" target=3D"_b=
lank">Martin.Jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/distro/include/maintainers.inc=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
2 +-<br>
=C2=A0meta/recipes-devtools/gcc/gcc-13.1.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1=
8 +++---<br>
=C2=A0...AMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch | 64 ++++--------------=
-<br>
=C2=A03 files changed, 24 insertions(+), 60 deletions(-)<br>
<br>
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/in=
clude/maintainers.inc<br>
index 619fe073810..359a29c0768 100644<br>
--- a/meta/conf/distro/include/maintainers.inc<br>
+++ b/meta/conf/distro/include/maintainers.inc<br>
@@ -188,7 +188,7 @@ RECIPE_MAINTAINER:pn-gcc-cross-canadian-${TRANSLATED_TA=
RGET_ARCH} =3D &quot;Khem Raj &lt;r<br>
=C2=A0RECIPE_MAINTAINER:pn-gcc-crosssdk-${SDK_SYS} =3D &quot;Khem Raj &lt;<=
a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</=
a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-gcc-runtime =3D &quot;Khem Raj &lt;<a href=3D"ma=
ilto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;&quot;=
<br>
=C2=A0RECIPE_MAINTAINER:pn-gcc-sanitizers =3D &quot;Khem Raj &lt;<a href=3D=
"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;&qu=
ot;<br>
-RECIPE_MAINTAINER:pn-gcc-source-13.1.0 =3D &quot;Khem Raj &lt;<a href=3D"m=
ailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;&quot=
;<br>
+RECIPE_MAINTAINER:pn-gcc-source-13.1.1 =3D &quot;Khem Raj &lt;<a href=3D"m=
ailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;&quot=
;<br>
=C2=A0RECIPE_MAINTAINER:pn-gconf =3D &quot;Ross Burton &lt;<a href=3D"mailt=
o:ross.burton@arm.com" target=3D"_blank">ross.burton@arm.com</a>&gt;&quot;<=
br>
=C2=A0RECIPE_MAINTAINER:pn-gcr3 =3D &quot;Markus Volk &lt;<a href=3D"mailto=
:f_l_k@t-online.de" target=3D"_blank">f_l_k@t-online.de</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-gcr =3D &quot;Alexander Kanavin &lt;<a href=3D"m=
ailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&=
gt;&quot;<br>
diff --git a/meta/recipes-devtools/gcc/gcc-13.1.inc b/meta/recipes-devtools=
/gcc/gcc-13.1.inc<br>
index d361b680f47..4da703db52e 100644<br>
--- a/meta/recipes-devtools/gcc/gcc-13.1.inc<br>
+++ b/meta/recipes-devtools/gcc/gcc-13.1.inc<br>
@@ -2,11 +2,11 @@ require gcc-common.inc<br>
<br>
=C2=A0# Third digit in PV should be incremented after a minor release<br>
<br>
-PV =3D &quot;13.1.0&quot;<br>
+PV =3D &quot;13.1.1&quot;<br>
<br>
=C2=A0# BINV should be incremented to a revision after a minor gcc release<=
br>
<br>
-BINV =3D &quot;13.1.0&quot;<br>
+BINV =3D &quot;13.1.1&quot;<br>
<br>
=C2=A0FILESEXTRAPATHS =3D. &quot;${FILE_DIRNAME}/gcc:${FILE_DIRNAME}/gcc/ba=
ckport:&quot;<br>
<br>
@@ -30,14 +30,14 @@ LIC_FILES_CHKSUM =3D &quot;\<br>
=C2=A0#SOURCEDIR ?=3D &quot;official-gcc-${@&#39;${RELEASE}&#39;[0:7]}&quot=
;<br>
<br>
=C2=A0# from snapshot<br>
-#RELEASE ?=3D &quot;13.1.0-RC-20230421&quot;<br>
-#SOURCEDIR ?=3D &quot;gcc-${RELEASE}&quot;<br>
-#BASEURI ?=3D &quot;<a href=3D"https://gcc.gnu.org/pub/gcc/snapshots/$%7BR=
ELEASE%7D/gcc-$%7BRELEASE%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">h=
ttps://gcc.gnu.org/pub/gcc/snapshots/${RELEASE}/gcc-${RELEASE}.tar.xz</a>&q=
uot;<br>
+RELEASE ?=3D &quot;13-20230520&quot;<br>
+SOURCEDIR ?=3D &quot;gcc-${RELEASE}&quot;<br>
+BASEURI ?=3D &quot;<a href=3D"https://gcc.gnu.org/pub/gcc/snapshots/$%7BRE=
LEASE%7D/gcc-$%7BRELEASE%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">ht=
tps://gcc.gnu.org/pub/gcc/snapshots/${RELEASE}/gcc-${RELEASE}.tar.xz</a>&qu=
ot;<br>
<br>
=C2=A0# official release<br>
-RELEASE ?=3D &quot;${PV}&quot;<br>
-BASEURI ?=3D &quot;${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.xz&quot;<br>
-SOURCEDIR ?=3D &quot;gcc-${PV}&quot;<br>
+#RELEASE ?=3D &quot;${PV}&quot;<br>
+#BASEURI ?=3D &quot;${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.xz&quot;<br>
+#SOURCEDIR ?=3D &quot;gcc-${PV}&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;${BASEURI} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-gcc-4.3.1-ARCH_FLAGS_=
FOR_TARGET.patch \<br>
@@ -65,7 +65,7 @@ SRC_URI =3D &quot;${BASEURI} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0023-Fix-install-path-of-l=
inux64.h.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0024-Avoid-hardcoded-build=
-paths-into-ppc-libgcc.patch \<br>
=C2=A0&quot;<br>
-SRC_URI[sha256sum] =3D &quot;61d684f0aa5e76ac6585ad8898a2427aade8979ed5e7f=
85492286c4dfc13ee86&quot;<br>
+SRC_URI[sha256sum] =3D &quot;b8716f92e468086fca5aea8873f7405f1cd7d309ad071=
9f0a90c57b3483e448c&quot;<br>
<br>
=C2=A0S =3D &quot;${TMPDIR}/work-shared/gcc-${PV}-${PR}/${SOURCEDIR}&quot;<=
br>
=C2=A0B =3D &quot;${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}&quot=
;<br>
diff --git a/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER=
-and-UCLIBC_DYNAMIC_LINKE.patch b/meta/recipes-devtools/gcc/gcc/0007-Define=
-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch<br>
index a42a0441424..e3af0bf161f 100644<br>
--- a/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER-and-UC=
LIBC_DYNAMIC_LINKE.patch<br>
+++ b/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER-and-UC=
LIBC_DYNAMIC_LINKE.patch<br>
@@ -35,8 +35,6 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gm=
ail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0 gcc/config/sparc/linux64.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
4 ++--<br>
=C2=A0 18 files changed, 53 insertions(+), 58 deletions(-)<br>
<br>
-diff --git a/gcc/config/aarch64/aarch64-linux.h b/gcc/config/aarch64/aarch=
64-linux.h<br>
-index 4277f03da2a..e4c92c03291 100644<br>
=C2=A0--- a/gcc/config/aarch64/aarch64-linux.h<br>
=C2=A0+++ b/gcc/config/aarch64/aarch64-linux.h<br>
=C2=A0@@ -21,10 +21,10 @@<br>
@@ -52,11 +50,9 @@ index 4277f03da2a..e4c92c03291 100644<br>
<br>
=C2=A0 #undef=C2=A0 ASAN_CC1_SPEC<br>
=C2=A0 #define ASAN_CC1_SPEC &quot;%{%:sanitize(address):-funwind-tables}&q=
uot;<br>
-diff --git a/gcc/config/alpha/linux-elf.h b/gcc/config/alpha/linux-elf.h<b=
r>
-index 03f783f2ad1..4fa02668aa7 100644<br>
=C2=A0--- a/gcc/config/alpha/linux-elf.h<br>
=C2=A0+++ b/gcc/config/alpha/linux-elf.h<br>
-@@ -23,8 +23,8 @@ along with GCC; see the file COPYING3.=C2=A0 If not see<=
br>
+@@ -23,8 +23,8 @@ along with GCC; see the file COPYING3.<br>
=C2=A0 #define EXTRA_SPECS \<br>
=C2=A0 { &quot;elf_dynamic_linker&quot;, ELF_DYNAMIC_LINKER },<br>
<br>
@@ -67,8 +63,6 @@ index 03f783f2ad1..4fa02668aa7 100644<br>
=C2=A0 #if DEFAULT_LIBC =3D=3D LIBC_UCLIBC<br>
=C2=A0 #define CHOOSE_DYNAMIC_LINKER(G, U) &quot;%{mglibc:&quot; G &quot;;:=
&quot; U &quot;}&quot;<br>
=C2=A0 #elif DEFAULT_LIBC =3D=3D LIBC_GLIBC<br>
-diff --git a/gcc/config/arm/linux-eabi.h b/gcc/config/arm/linux-eabi.h<br>
-index a119875599d..dce7f59eeea 100644<br>
=C2=A0--- a/gcc/config/arm/linux-eabi.h<br>
=C2=A0+++ b/gcc/config/arm/linux-eabi.h<br>
=C2=A0@@ -62,8 +62,8 @@<br>
@@ -91,8 +85,6 @@ index a119875599d..dce7f59eeea 100644<br>
<br>
=C2=A0 /* At this point, bpabi.h will have clobbered LINK_SPEC.=C2=A0 We wa=
nt to<br>
=C2=A0 =C2=A0 =C2=A0use the GNU/Linux version, not the generic BPABI versio=
n.=C2=A0 */<br>
-diff --git a/gcc/config/arm/linux-elf.h b/gcc/config/arm/linux-elf.h<br>
-index 7b7b7cbbe14..98ef2267117 100644<br>
=C2=A0--- a/gcc/config/arm/linux-elf.h<br>
=C2=A0+++ b/gcc/config/arm/linux-elf.h<br>
=C2=A0@@ -60,7 +60,7 @@<br>
@@ -104,11 +96,9 @@ index 7b7b7cbbe14..98ef2267117 100644<br>
<br>
=C2=A0 #define LINUX_TARGET_LINK_SPEC=C2=A0 &quot;%{h*} \<br>
=C2=A0 =C2=A0 =C2=A0%{static:-Bstatic} \<br>
-diff --git a/gcc/config/i386/linux.h b/gcc/config/i386/linux.h<br>
-index bbb7cc7115e..7d9272040ee 100644<br>
=C2=A0--- a/gcc/config/i386/linux.h<br>
=C2=A0+++ b/gcc/config/i386/linux.h<br>
-@@ -20,7 +20,7 @@ along with GCC; see the file COPYING3.=C2=A0 If not see<=
br>
+@@ -20,7 +20,7 @@ along with GCC; see the file COPYING3.<br>
=C2=A0 &lt;<a href=3D"http://www.gnu.org/licenses/" rel=3D"noreferrer" targ=
et=3D"_blank">http://www.gnu.org/licenses/</a>&gt;.=C2=A0 */<br>
<br>
=C2=A0 #define GNU_USER_LINK_EMULATION &quot;elf_i386&quot;<br>
@@ -118,11 +108,9 @@ index bbb7cc7115e..7d9272040ee 100644<br>
=C2=A0 #undef MUSL_DYNAMIC_LINKER<br>
=C2=A0-#define MUSL_DYNAMIC_LINKER &quot;/lib/ld-musl-i386.so.1&quot;<br>
=C2=A0+#define MUSL_DYNAMIC_LINKER SYSTEMLIBS_DIR &quot;ld-musl-i386.so.1&q=
uot;<br>
-diff --git a/gcc/config/i386/linux64.h b/gcc/config/i386/linux64.h<br>
-index 2bd9f48e271..dbbe7ca5440 100644<br>
=C2=A0--- a/gcc/config/i386/linux64.h<br>
=C2=A0+++ b/gcc/config/i386/linux64.h<br>
-@@ -27,13 +27,13 @@ see the files COPYING3 and COPYING.RUNTIME respectivel=
y.=C2=A0 If not, see<br>
+@@ -27,13 +27,13 @@ see the files COPYING3 and COPYING.RUNTI<br>
=C2=A0 #define GNU_USER_LINK_EMULATION64 &quot;elf_x86_64&quot;<br>
=C2=A0 #define GNU_USER_LINK_EMULATIONX32 &quot;elf32_x86_64&quot;<br>
<br>
@@ -142,11 +130,9 @@ index 2bd9f48e271..dbbe7ca5440 100644<br>
=C2=A0 #undef MUSL_DYNAMIC_LINKERX32<br>
=C2=A0-#define MUSL_DYNAMIC_LINKERX32 &quot;/lib/ld-musl-x32.so.1&quot;<br>
=C2=A0+#define MUSL_DYNAMIC_LINKERX32 SYSTEMLIBS_DIR &quot;ld-musl-x32.so.1=
&quot;<br>
-diff --git a/gcc/config/linux.h b/gcc/config/linux.h<br>
-index e3aca79cccc..6491c6b84f5 100644<br>
=C2=A0--- a/gcc/config/linux.h<br>
=C2=A0+++ b/gcc/config/linux.h<br>
-@@ -86,10 +86,10 @@ see the files COPYING3 and COPYING.RUNTIME respectivel=
y.=C2=A0 If not, see<br>
+@@ -86,10 +86,10 @@ see the files COPYING3 and COPYING.RUNTI<br>
=C2=A0 =C2=A0 =C2=A0GLIBC_DYNAMIC_LINKER must be defined for each target us=
ing them, or<br>
=C2=A0 =C2=A0 =C2=A0GLIBC_DYNAMIC_LINKER32 and GLIBC_DYNAMIC_LINKER64 for t=
argets<br>
=C2=A0 =C2=A0 =C2=A0supporting both 32-bit and 64-bit compilation.=C2=A0 */=
<br>
@@ -161,11 +147,9 @@ index e3aca79cccc..6491c6b84f5 100644<br>
=C2=A0 #define BIONIC_DYNAMIC_LINKER &quot;/system/bin/linker&quot;<br>
=C2=A0 #define BIONIC_DYNAMIC_LINKER32 &quot;/system/bin/linker&quot;<br>
=C2=A0 #define BIONIC_DYNAMIC_LINKER64 &quot;/system/bin/linker64&quot;<br>
-diff --git a/gcc/config/loongarch/gnu-user.h b/gcc/config/loongarch/gnu-us=
er.h<br>
-index aecaa02a199..62f88f7f9a2 100644<br>
=C2=A0--- a/gcc/config/loongarch/gnu-user.h<br>
=C2=A0+++ b/gcc/config/loongarch/gnu-user.h<br>
-@@ -31,11 +31,11 @@ along with GCC; see the file COPYING3.=C2=A0 If not se=
e<br>
+@@ -31,11 +31,11 @@ along with GCC; see the file COPYING3.<br>
<br>
=C2=A0 #undef GLIBC_DYNAMIC_LINKER<br>
=C2=A0 #define GLIBC_DYNAMIC_LINKER \<br>
@@ -179,8 +163,6 @@ index aecaa02a199..62f88f7f9a2 100644<br>
<br>
=C2=A0 #undef GNU_USER_TARGET_LINK_SPEC<br>
=C2=A0 #define GNU_USER_TARGET_LINK_SPEC \<br>
-diff --git a/gcc/config/microblaze/linux.h b/gcc/config/microblaze/linux.h=
<br>
-index e2e2c421c52..6f26480e3b5 100644<br>
=C2=A0--- a/gcc/config/microblaze/linux.h<br>
=C2=A0+++ b/gcc/config/microblaze/linux.h<br>
=C2=A0@@ -28,7 +28,7 @@<br>
@@ -201,11 +183,9 @@ index e2e2c421c52..6f26480e3b5 100644<br>
<br>
=C2=A0 #undef=C2=A0 SUBTARGET_EXTRA_SPECS<br>
=C2=A0 #define SUBTARGET_EXTRA_SPECS \<br>
-diff --git a/gcc/config/mips/linux.h b/gcc/config/mips/linux.h<br>
-index 5add34ea134..34692b433b8 100644<br>
=C2=A0--- a/gcc/config/mips/linux.h<br>
=C2=A0+++ b/gcc/config/mips/linux.h<br>
-@@ -22,29 +22,29 @@ along with GCC; see the file COPYING3.=C2=A0 If not se=
e<br>
+@@ -22,29 +22,29 @@ along with GCC; see the file COPYING3.<br>
=C2=A0 #define GNU_USER_LINK_EMULATIONN32 &quot;elf32%{EB:b}%{EL:l}tsmipn32=
&quot;<br>
<br>
=C2=A0 #define GLIBC_DYNAMIC_LINKER32 \<br>
@@ -244,8 +224,6 @@ index 5add34ea134..34692b433b8 100644<br>
<br>
=C2=A0 #define BIONIC_DYNAMIC_LINKERN32 &quot;/system/bin/linker32&quot;<br=
>
=C2=A0 #define GNU_USER_DYNAMIC_LINKERN32 \<br>
-diff --git a/gcc/config/nios2/linux.h b/gcc/config/nios2/linux.h<br>
-index 2ce097ebbce..1d45d7b4962 100644<br>
=C2=A0--- a/gcc/config/nios2/linux.h<br>
=C2=A0+++ b/gcc/config/nios2/linux.h<br>
=C2=A0@@ -29,10 +29,10 @@<br>
@@ -261,11 +239,9 @@ index 2ce097ebbce..1d45d7b4962 100644<br>
<br>
=C2=A0 #undef LINK_SPEC<br>
=C2=A0 #define LINK_SPEC LINK_SPEC_ENDIAN \<br>
-diff --git a/gcc/config/riscv/linux.h b/gcc/config/riscv/linux.h<br>
-index b9557a75dc7..e10ca1f97e7 100644<br>
=C2=A0--- a/gcc/config/riscv/linux.h<br>
=C2=A0+++ b/gcc/config/riscv/linux.h<br>
-@@ -22,7 +22,7 @@ along with GCC; see the file COPYING3.=C2=A0 If not see<=
br>
+@@ -22,7 +22,7 @@ along with GCC; see the file COPYING3.<br>
=C2=A0 =C2=A0 =C2=A0 GNU_USER_TARGET_OS_CPP_BUILTINS();=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 \<br>
=C2=A0 =C2=A0 } while (0)<br>
<br>
@@ -274,17 +250,15 @@ index b9557a75dc7..e10ca1f97e7 100644<br>
<br>
=C2=A0 #define MUSL_ABI_SUFFIX \<br>
=C2=A0 =C2=A0 &quot;%{mabi=3Dilp32:-sf}&quot; \<br>
-@@ -33,7 +33,7 @@ along with GCC; see the file COPYING3.=C2=A0 If not see<=
br>
+@@ -33,7 +33,7 @@ along with GCC; see the file COPYING3.<br>
=C2=A0 =C2=A0 &quot;%{mabi=3Dlp64d:}&quot;<br>
<br>
=C2=A0 #undef MUSL_DYNAMIC_LINKER<br>
=C2=A0-#define MUSL_DYNAMIC_LINKER &quot;/lib/ld-musl-riscv&quot; XLEN_SPEC=
 MUSL_ABI_SUFFIX &quot;.so.1&quot;<br>
=C2=A0+#define MUSL_DYNAMIC_LINKER SYSTEMLIBS_DIR &quot;ld-musl-riscv&quot;=
 XLEN_SPEC MUSL_ABI_SUFFIX &quot;.so.1&quot;<br>
<br>
- /* Because RISC-V only has word-sized atomics, it requries libatomic wher=
e<br>
-=C2=A0 =C2=A0 others do not.=C2=A0 So link libatomic by default, as needed=
.=C2=A0 */<br>
-diff --git a/gcc/config/rs6000/linux64.h b/gcc/config/rs6000/linux64.h<br>
-index 9e457033d11..2ddab7c99c1 100644<br>
+ #define ICACHE_FLUSH_FUNC &quot;__riscv_flush_icache&quot;<br>
+ <br>
=C2=A0--- a/gcc/config/rs6000/linux64.h<br>
=C2=A0+++ b/gcc/config/rs6000/linux64.h<br>
=C2=A0@@ -339,24 +339,19 @@ extern int dot_symbols;<br>
@@ -317,8 +291,6 @@ index 9e457033d11..2ddab7c99c1 100644<br>
<br>
=C2=A0 #undef=C2=A0 DEFAULT_ASM_ENDIAN<br>
=C2=A0 #if (TARGET_DEFAULT &amp; MASK_LITTLE_ENDIAN)<br>
-diff --git a/gcc/config/rs6000/sysv4.h b/gcc/config/rs6000/sysv4.h<br>
-index ae932fc22f0..26db003cb3a 100644<br>
=C2=A0--- a/gcc/config/rs6000/sysv4.h<br>
=C2=A0+++ b/gcc/config/rs6000/sysv4.h<br>
=C2=A0@@ -771,10 +771,10 @@ GNU_USER_TARGET_CC1_SPEC<br>
@@ -334,11 +306,9 @@ index ae932fc22f0..26db003cb3a 100644<br>
<br>
=C2=A0 #ifndef GNU_USER_DYNAMIC_LINKER<br>
=C2=A0 #define GNU_USER_DYNAMIC_LINKER GLIBC_DYNAMIC_LINKER<br>
-diff --git a/gcc/config/s390/linux.h b/gcc/config/s390/linux.h<br>
-index 02aa1edaff8..fab268d61f4 100644<br>
=C2=A0--- a/gcc/config/s390/linux.h<br>
=C2=A0+++ b/gcc/config/s390/linux.h<br>
-@@ -72,13 +72,13 @@ along with GCC; see the file COPYING3.=C2=A0 If not se=
e<br>
+@@ -72,13 +72,13 @@ along with GCC; see the file COPYING3.<br>
=C2=A0 #define MULTILIB_DEFAULTS { &quot;m31&quot; }<br>
=C2=A0 #endif<br>
<br>
@@ -356,11 +326,9 @@ index 02aa1edaff8..fab268d61f4 100644<br>
<br>
=C2=A0 #undef=C2=A0 LINK_SPEC<br>
=C2=A0 #define LINK_SPEC \<br>
-diff --git a/gcc/config/sh/linux.h b/gcc/config/sh/linux.h<br>
-index 29f5902b98b..83d1e53e6e2 100644<br>
=C2=A0--- a/gcc/config/sh/linux.h<br>
=C2=A0+++ b/gcc/config/sh/linux.h<br>
-@@ -61,10 +61,10 @@ along with GCC; see the file COPYING3.=C2=A0 If not se=
e<br>
+@@ -61,10 +61,10 @@ along with GCC; see the file COPYING3.<br>
<br>
=C2=A0 #undef MUSL_DYNAMIC_LINKER<br>
=C2=A0 #define MUSL_DYNAMIC_LINKER \<br>
@@ -373,11 +341,9 @@ index 29f5902b98b..83d1e53e6e2 100644<br>
<br>
=C2=A0 #undef SUBTARGET_LINK_EMUL_SUFFIX<br>
=C2=A0 #define SUBTARGET_LINK_EMUL_SUFFIX &quot;%{mfdpic:_fd;:_linux}&quot;=
<br>
-diff --git a/gcc/config/sparc/linux.h b/gcc/config/sparc/linux.h<br>
-index 0e33b3cac2c..84f29adbb35 100644<br>
=C2=A0--- a/gcc/config/sparc/linux.h<br>
=C2=A0+++ b/gcc/config/sparc/linux.h<br>
-@@ -78,7 +78,7 @@ extern const char *host_detect_local_cpu (int argc, cons=
t char **argv);<br>
+@@ -78,7 +78,7 @@ extern const char *host_detect_local_cpu<br>
=C2=A0 =C2=A0 =C2=A0When the -shared link option is used a final link is no=
t being<br>
=C2=A0 =C2=A0 =C2=A0done.=C2=A0 */<br>
<br>
@@ -386,11 +352,9 @@ index 0e33b3cac2c..84f29adbb35 100644<br>
<br>
=C2=A0 #undef=C2=A0 LINK_SPEC<br>
=C2=A0 #define LINK_SPEC &quot;-m elf32_sparc %{shared:-shared} \<br>
-diff --git a/gcc/config/sparc/linux64.h b/gcc/config/sparc/linux64.h<br>
-index f1cc0a19e49..94bc2032803 100644<br>
=C2=A0--- a/gcc/config/sparc/linux64.h<br>
=C2=A0+++ b/gcc/config/sparc/linux64.h<br>
-@@ -78,8 +78,8 @@ along with GCC; see the file COPYING3.=C2=A0 If not see<=
br>
+@@ -78,8 +78,8 @@ along with GCC; see the file COPYING3.<br>
=C2=A0 =C2=A0 =C2=A0When the -shared link option is used a final link is no=
t being<br>
=C2=A0 =C2=A0 =C2=A0done.=C2=A0 */<br>
<br>
-- <br>
2.40.1<br>
<br>
</blockquote></div></div>

--0000000000000fba7c05fca5f22b--

