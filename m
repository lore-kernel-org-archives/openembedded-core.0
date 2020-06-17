Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.2173.1592377330943674769
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2020 00:02:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: kai.kang@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 05H71D6i005352
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Wed, 17 Jun 2020 00:01:38 -0700
Received: from [128.224.162.131] (128.224.162.131) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Wed, 17 Jun 2020
 00:01:07 -0700
Subject: Re: [OE-core] [PATCH V3 1/3] gcc10: Update to GCC 10.1 Release
To: Khem Raj <raj.khem@gmail.com>, <openembedded-core@lists.openembedded.org>
References: <20200511182812.441561-1-raj.khem@gmail.com>
From: "kai" <kai.kang@windriver.com>
Message-ID: <d793d0fe-3255-a76b-832b-443ad4f4daf9@windriver.com>
Date: Wed, 17 Jun 2020 14:59:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200511182812.441561-1-raj.khem@gmail.com>
Content-Type: multipart/alternative;
	boundary="------------45B96BB3D28EAB9EA02D9BAD"
Content-Language: en-US

--------------45B96BB3D28EAB9EA02D9BAD
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mail5.wrs.com id 05H71D6i005352

On 2020/5/12 =E4=B8=8A=E5=8D=882:28, Khem Raj wrote:
> * Package new gomp header acc_prof.h
> * Package lto-dump which is a new tool in gcc10
> * All Changes are here [1]
> * Porting apps to gcc 10 help is here [2]
> * Backport a patch to fix CET errors on cross builds
> * Add patch to fix mingw libstdc++

Hi Khem,

I found that the size of buildtools-extended-tarball increased a lot=20
after this commit. It increases from 47MB to 54MB without recipe update.

Any thought of what may cause that problem, please?

Thanks.

Kai



>
> [1] https://gcc.gnu.org/gcc-10/changes.html
> [2] https://gcc.gnu.org/gcc-10/porting_to.html
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v2: Correct SRC_URI checksums
> v3: Drop icu change
>      Backport a patch for CET cross compile
>
>   meta/conf/distro/include/maintainers.inc      |   2 +-
>   meta/conf/distro/include/tcmode-default.inc   |   2 +-
>   .../gcc/{gcc-9.3.inc =3D> gcc-10.1.inc}         |  53 +++----
>   ...0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch |  15 +-
>   .../0002-gcc-poison-system-directories.patch  |  47 +++---
>   ...-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch |  11 +-
>   .../0004-64-bit-multilib-hack.patch           |  15 +-
>   .../0005-optional-libstdc.patch               |  29 ++--
>   .../0006-COLLECT_GCC_OPTIONS.patch            |  11 +-
>   ...ts.h-in-B-instead-of-S-and-t-oe-in-B.patch |  20 +--
>   .../0008-fortran-cross-compile-hack.patch     |  15 +-
>   .../0009-cpp-honor-sysroot.patch              |  13 +-
>   .../0010-MIPS64-Default-to-N64-ABI.patch      |  11 +-
>   ...AMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch |  33 ++--
>   ...gcc-Fix-argument-list-too-long-error.patch |  11 +-
>   .../0013-Disable-sdt.patch                    |  23 ++-
>   .../{gcc-9.3 =3D> gcc-10.1}/0014-libtool.patch  |   9 +-
>   ...s-fix-v4bx-to-linker-to-support-EABI.patch |  11 +-
>   ...-config-files-from-B-instead-of-usin.patch |  25 ++-
>   ...ir-from-.la-which-usually-points-to-.patch |  11 +-
>   .../0018-export-CPP.patch                     |   9 +-
>   ...e-target-gcc-headers-can-be-included.patch |  13 +-
>   ...-directory-during-relink-if-inst_pr.patch} |  11 +-
>   ...R-replacement-instead-of-hardcoding.patch} |   9 +-
>   ...2-aarch64-Add-support-for-musl-ldso.patch} |   9 +-
>   ...fix-libcc1-s-install-path-and-rpath.patch} |   9 +-
>   ...e-sysroot-support-for-nativesdk-gcc.patch} | 112 ++++++-------
>   ...root-gcc-version-specific-dirs-with.patch} |  13 +-
>   ...us-_FOR_BUILD-and-related-variables.patch} |  27 ++--
>   ...27-nios2-Define-MUSL_DYNAMIC_LINKER.patch} |   9 +-
>   ...-to-link-commandline-for-musl-targe.patch} |  15 +-
>   ...sing-LDFLAGS-not-just-SHLIB_LDFLAGS.patch} |   9 +-
>   .../0030-sync-gcc-stddef.h-with-musl.patch}   |   9 +-
>   ...fault-in-precompiled-header-generat.patch} |  11 +-
>   .../0032-Fix-for-testsuite-failure.patch}     |   9 +-
>   ...e-introduce-spe-commandline-options.patch} |  11 +-
>   ...s-for-__cpu_indicator_init-instead-.patch} |  29 ++--
>   ...-Do-not-use-__LINE__-for-maintainin.patch} |  55 +++----
>   ...le-CET-in-cross-compiler-if-possible.patch | 150 ++++++++++++++++++
>   ...v3-Include-system_error-for-std-errc.patch |  23 +++
>   ...ild-with-disable-dependency-tracking.patch |  54 -------
>   .../gcc/gcc-9.3/0030-ldbl128-config.patch     |  79 ---------
>   ...heck-zero-value-in-simple_object_elf.patch |  48 ------
>   ...ands-Don-t-match-user-defined-regs-o.patch | 100 ------------
>   ...dian_9.3.bb =3D> gcc-cross-canadian_10.1.bb} |   0
>   .../{gcc-cross_9.3.bb =3D> gcc-cross_10.1.bb}   |   0
>   ...c-crosssdk_9.3.bb =3D> gcc-crosssdk_10.1.bb} |   0
>   meta/recipes-devtools/gcc/gcc-runtime.inc     |   1 +
>   ...gcc-runtime_9.3.bb =3D> gcc-runtime_10.1.bb} |   0
>   ...nitizers_9.3.bb =3D> gcc-sanitizers_10.1.bb} |   0
>   .../{gcc-source_9.3.bb =3D> gcc-source_10.1.bb} |   0
>   meta/recipes-devtools/gcc/gcc-target.inc      |   1 +
>   .../gcc/{gcc_9.3.bb =3D> gcc_10.1.bb}           |   0
>   ...-initial_9.3.bb =3D> libgcc-initial_10.1.bb} |   0
>   .../gcc/{libgcc_9.3.bb =3D> libgcc_10.1.bb}     |   0
>   ...libgfortran_9.3.bb =3D> libgfortran_10.1.bb} |   0
>   meta/recipes-support/icu/icu/filter.json      |   2 -
>   57 files changed, 491 insertions(+), 703 deletions(-)
>   rename meta/recipes-devtools/gcc/{gcc-9.3.inc =3D> gcc-10.1.inc} (65%)
>   rename meta/recipes-devtools/gcc/{gcc-9.3 =3D> gcc-10.1}/0001-gcc-4.3.=
1-ARCH_FLAGS_FOR_TARGET.patch (79%)
>   rename meta/recipes-devtools/gcc/{gcc-9.3 =3D> gcc-10.1}/0002-gcc-pois=
on-system-directories.patch (85%)
>   rename meta/recipes-devtools/gcc/{gcc-9.3 =3D> gcc-10.1}/0003-gcc-4.3.=
3-SYSROOT_CFLAGS_FOR_TARGET.patch (92%)
>   rename meta/recipes-devtools/gcc/{gcc-9.3 =3D> gcc-10.1}/0004-64-bit-m=
ultilib-hack.patch (95%)
>   rename meta/recipes-devtools/gcc/{gcc-9.3 =3D> gcc-10.1}/0005-optional=
-libstdc.patch (86%)
>   rename meta/recipes-devtools/gcc/{gcc-9.3 =3D> gcc-10.1}/0006-COLLECT_=
GCC_OPTIONS.patch (80%)
>   rename meta/recipes-devtools/gcc/{gcc-9.3 =3D> gcc-10.1}/0007-Use-the-=
defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch (87%)
>   rename meta/recipes-devtools/gcc/{gcc-9.3 =3D> gcc-10.1}/0008-fortran-=
cross-compile-hack.patch (81%)
>   rename meta/recipes-devtools/gcc/{gcc-9.3 =3D> gcc-10.1}/0009-cpp-hono=
r-sysroot.patch (87%)
>   rename meta/recipes-devtools/gcc/{gcc-9.3 =3D> gcc-10.1}/0010-MIPS64-D=
efault-to-N64-ABI.patch (85%)
>   rename meta/recipes-devtools/gcc/{gcc-9.3 =3D> gcc-10.1}/0011-Define-G=
LIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch (93%)
>   rename meta/recipes-devtools/gcc/{gcc-9.3 =3D> gcc-10.1}/0012-gcc-Fix-=
argument-list-too-long-error.patch (85%)
>   rename meta/recipes-devtools/gcc/{gcc-9.3 =3D> gcc-10.1}/0013-Disable-=
sdt.patch (88%)
>   rename meta/recipes-devtools/gcc/{gcc-9.3 =3D> gcc-10.1}/0014-libtool.=
patch (87%)
>   rename meta/recipes-devtools/gcc/{gcc-9.3 =3D> gcc-10.1}/0015-gcc-armv=
4-pass-fix-v4bx-to-linker-to-support-EABI.patch (87%)
>   rename meta/recipes-devtools/gcc/{gcc-9.3 =3D> gcc-10.1}/0016-Use-the-=
multilib-config-files-from-B-instead-of-usin.patch (81%)
>   rename meta/recipes-devtools/gcc/{gcc-9.3 =3D> gcc-10.1}/0017-Avoid-us=
ing-libdir-from-.la-which-usually-points-to-.patch (76%)
>   rename meta/recipes-devtools/gcc/{gcc-9.3 =3D> gcc-10.1}/0018-export-C=
PP.patch (93%)
>   rename meta/recipes-devtools/gcc/{gcc-9.3 =3D> gcc-10.1}/0019-Ensure-t=
arget-gcc-headers-can-be-included.patch (88%)
>   rename meta/recipes-devtools/gcc/{gcc-9.3/0021-Don-t-search-host-direc=
tory-during-relink-if-inst_pr.patch =3D> gcc-10.1/0020-Don-t-search-host-di=
rectory-during-relink-if-inst_pr.patch} (80%)
>   rename meta/recipes-devtools/gcc/{gcc-9.3/0022-Use-SYSTEMLIBS_DIR-repl=
acement-instead-of-hardcoding.patch =3D> gcc-10.1/0021-Use-SYSTEMLIBS_DIR-r=
eplacement-instead-of-hardcoding.patch} (81%)
>   rename meta/recipes-devtools/gcc/{gcc-9.3/0023-aarch64-Add-support-for=
-musl-ldso.patch =3D> gcc-10.1/0022-aarch64-Add-support-for-musl-ldso.patch=
} (83%)
>   rename meta/recipes-devtools/gcc/{gcc-9.3/0024-libcc1-fix-libcc1-s-ins=
tall-path-and-rpath.patch =3D> gcc-10.1/0023-libcc1-fix-libcc1-s-install-pa=
th-and-rpath.patch} (91%)
>   rename meta/recipes-devtools/gcc/{gcc-9.3/0025-handle-sysroot-support-=
for-nativesdk-gcc.patch =3D> gcc-10.1/0024-handle-sysroot-support-for-nativ=
esdk-gcc.patch} (84%)
>   rename meta/recipes-devtools/gcc/{gcc-9.3/0026-Search-target-sysroot-g=
cc-version-specific-dirs-with.patch =3D> gcc-10.1/0025-Search-target-sysroo=
t-gcc-version-specific-dirs-with.patch} (90%)
>   rename meta/recipes-devtools/gcc/{gcc-9.3/0027-Fix-various-_FOR_BUILD-=
and-related-variables.patch =3D> gcc-10.1/0026-Fix-various-_FOR_BUILD-and-r=
elated-variables.patch} (89%)
>   rename meta/recipes-devtools/gcc/{gcc-9.3/0028-nios2-Define-MUSL_DYNAM=
IC_LINKER.patch =3D> gcc-10.1/0027-nios2-Define-MUSL_DYNAMIC_LINKER.patch} =
(79%)
>   rename meta/recipes-devtools/gcc/{gcc-9.3/0029-Add-ssp_nonshared-to-li=
nk-commandline-for-musl-targe.patch =3D> gcc-10.1/0028-Add-ssp_nonshared-to=
-link-commandline-for-musl-targe.patch} (89%)
>   rename meta/recipes-devtools/gcc/{gcc-9.3/0031-Link-libgcc-using-LDFLA=
GS-not-just-SHLIB_LDFLAGS.patch =3D> gcc-10.1/0029-Link-libgcc-using-LDFLAG=
S-not-just-SHLIB_LDFLAGS.patch} (80%)
>   rename meta/recipes-devtools/gcc/{gcc-9.3/0033-sync-gcc-stddef.h-with-=
musl.patch =3D> gcc-10.1/0030-sync-gcc-stddef.h-with-musl.patch} (93%)
>   rename meta/recipes-devtools/gcc/{gcc-9.3/0034-fix-segmentation-fault-=
in-precompiled-header-generat.patch =3D> gcc-10.1/0031-fix-segmentation-fau=
lt-in-precompiled-header-generat.patch} (86%)
>   rename meta/recipes-devtools/gcc/{gcc-9.3/0035-Fix-for-testsuite-failu=
re.patch =3D> gcc-10.1/0032-Fix-for-testsuite-failure.patch} (98%)
>   rename meta/recipes-devtools/gcc/{gcc-9.3/0036-Re-introduce-spe-comman=
dline-options.patch =3D> gcc-10.1/0033-Re-introduce-spe-commandline-options=
.patch} (81%)
>   rename meta/recipes-devtools/gcc/{gcc-9.3/0032-libgcc_s-Use-alias-for-=
__cpu_indicator_init-instead-.patch =3D> gcc-10.1/0034-libgcc_s-Use-alias-f=
or-__cpu_indicator_init-instead-.patch} (77%)
>   rename meta/recipes-devtools/gcc/{gcc-9.3/0038-gentypes-genmodes-Do-no=
t-use-__LINE__-for-maintainin.patch =3D> gcc-10.1/0035-gentypes-genmodes-Do=
-not-use-__LINE__-for-maintainin.patch} (80%)
>   create mode 100644 meta/recipes-devtools/gcc/gcc-10.1/0036-Enable-CET-=
in-cross-compiler-if-possible.patch
>   create mode 100644 meta/recipes-devtools/gcc/gcc-10.1/0037-libstdc-v3-=
Include-system_error-for-std-errc.patch
>   delete mode 100644 meta/recipes-devtools/gcc/gcc-9.3/0020-gcc-4.8-won-=
t-build-with-disable-dependency-tracking.patch
>   delete mode 100644 meta/recipes-devtools/gcc/gcc-9.3/0030-ldbl128-conf=
ig.patch
>   delete mode 100644 meta/recipes-devtools/gcc/gcc-9.3/0037-CVE-2019-142=
50-Check-zero-value-in-simple_object_elf.patch
>   delete mode 100644 meta/recipes-devtools/gcc/gcc-9.3/0039-process_alt_=
operands-Don-t-match-user-defined-regs-o.patch
>   rename meta/recipes-devtools/gcc/{gcc-cross-canadian_9.3.bb =3D> gcc-c=
ross-canadian_10.1.bb} (100%)
>   rename meta/recipes-devtools/gcc/{gcc-cross_9.3.bb =3D> gcc-cross_10.1=
.bb} (100%)
>   rename meta/recipes-devtools/gcc/{gcc-crosssdk_9.3.bb =3D> gcc-crosssd=
k_10.1.bb} (100%)
>   rename meta/recipes-devtools/gcc/{gcc-runtime_9.3.bb =3D> gcc-runtime_=
10.1.bb} (100%)
>   rename meta/recipes-devtools/gcc/{gcc-sanitizers_9.3.bb =3D> gcc-sanit=
izers_10.1.bb} (100%)
>   rename meta/recipes-devtools/gcc/{gcc-source_9.3.bb =3D> gcc-source_10=
.1.bb} (100%)
>   rename meta/recipes-devtools/gcc/{gcc_9.3.bb =3D> gcc_10.1.bb} (100%)
>   rename meta/recipes-devtools/gcc/{libgcc-initial_9.3.bb =3D> libgcc-in=
itial_10.1.bb} (100%)
>   rename meta/recipes-devtools/gcc/{libgcc_9.3.bb =3D> libgcc_10.1.bb} (=
100%)
>   rename meta/recipes-devtools/gcc/{libgfortran_9.3.bb =3D> libgfortran_=
10.1.bb} (100%)
>   delete mode 100644 meta/recipes-support/icu/icu/filter.json
>
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro=
/include/maintainers.inc
> index 6dc6baf9f0..dc2ec131b3 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -193,7 +193,7 @@ RECIPE_MAINTAINER_pn-gcc-cross-canadian-${TRANSLATED=
_TARGET_ARCH} =3D "Khem Raj <r
>   RECIPE_MAINTAINER_pn-gcc-crosssdk-${SDK_SYS} =3D "Khem Raj <raj.khem@g=
mail.com>"
>   RECIPE_MAINTAINER_pn-gcc-runtime =3D "Khem Raj <raj.khem@gmail.com>"
>   RECIPE_MAINTAINER_pn-gcc-sanitizers =3D "Khem Raj <raj.khem@gmail.com>=
"
> -RECIPE_MAINTAINER_pn-gcc-source-9.3.0 =3D "Khem Raj <raj.khem@gmail.com=
>"
> +RECIPE_MAINTAINER_pn-gcc-source-10.0.1 =3D "Khem Raj <raj.khem@gmail.co=
m>"
>   RECIPE_MAINTAINER_pn-gconf =3D "Ross Burton <ross.burton@intel.com>"
>   RECIPE_MAINTAINER_pn-gcr =3D "Alexander Kanavin <alex.kanavin@gmail.co=
m>"
>   RECIPE_MAINTAINER_pn-gdb =3D "Khem Raj <raj.khem@gmail.com>"
> diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/dis=
tro/include/tcmode-default.inc
> index 849bcf6900..ab4333144b 100644
> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -16,7 +16,7 @@ PREFERRED_PROVIDER_virtual/${SDK_PREFIX}compilerlibs =
=3D "nativesdk-gcc-runtime"
>   # Default libc config
>   PREFERRED_PROVIDER_virtual/gettext ??=3D "gettext"
>  =20
> -GCCVERSION ?=3D "9.%"
> +GCCVERSION ?=3D "10.%"
>   SDKGCCVERSION ?=3D "${GCCVERSION}"
>   BINUVERSION ?=3D "2.34%"
>   GDBVERSION ?=3D "9.%"
> diff --git a/meta/recipes-devtools/gcc/gcc-9.3.inc b/meta/recipes-devtoo=
ls/gcc/gcc-10.1.inc
> similarity index 65%
> rename from meta/recipes-devtools/gcc/gcc-9.3.inc
> rename to meta/recipes-devtools/gcc/gcc-10.1.inc
> index b0411078d3..4f383900cf 100644
> --- a/meta/recipes-devtools/gcc/gcc-9.3.inc
> +++ b/meta/recipes-devtools/gcc/gcc-10.1.inc
> @@ -2,13 +2,13 @@ require gcc-common.inc
>  =20
>   # Third digit in PV should be incremented after a minor release
>  =20
> -PV =3D "9.3.0"
> +PV =3D "10.1.0"
>  =20
>   # BINV should be incremented to a revision after a minor gcc release
>  =20
> -BINV =3D "9.3.0"
> +BINV =3D "10.1.0"
>  =20
> -FILESEXTRAPATHS =3D. "${FILE_DIRNAME}/gcc-9.3:${FILE_DIRNAME}/gcc-9.3/b=
ackport:"
> +FILESEXTRAPATHS =3D. "${FILE_DIRNAME}/gcc-10.1:${FILE_DIRNAME}/gcc-10.1=
/backport:"
>  =20
>   DEPENDS =3D+ "mpfr gmp libmpc zlib flex-native"
>   NATIVEDEPS =3D "mpfr-native gmp-native libmpc-native zlib-native flex-=
native"
> @@ -24,8 +24,8 @@ LIC_FILES_CHKSUM =3D "\
>   "
>  =20
>   BASEURI ?=3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.xz"
> -#RELEASE ?=3D "5a5ca2d"
> -#BASEURI ?=3D "https://repo.or.cz/official-gcc.git/snapshot/${RELEASE}.=
tar.gz;downloadfilename=3Dgcc-${RELEASE}.tar.gz"
> +#RELEASE ?=3D "93a49d2d2292893b9b7f38132df949c70942838c"
> +#BASEURI ?=3D "https://github.com/gcc-mirror/gcc/archive/${RELEASE}.zip=
;downloadfilename=3Dgcc-${PV}-${RELEASE}.zip"
>   SRC_URI =3D "\
>              ${BASEURI} \
>              file://0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
> @@ -47,31 +47,30 @@ SRC_URI =3D "\
>              file://0017-Avoid-using-libdir-from-.la-which-usually-point=
s-to-.patch \
>              file://0018-export-CPP.patch \
>              file://0019-Ensure-target-gcc-headers-can-be-included.patch=
 \
> -           file://0020-gcc-4.8-won-t-build-with-disable-dependency-trac=
king.patch \
> -           file://0021-Don-t-search-host-directory-during-relink-if-ins=
t_pr.patch \
> -           file://0022-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardco=
ding.patch \
> -           file://0023-aarch64-Add-support-for-musl-ldso.patch \
> -           file://0024-libcc1-fix-libcc1-s-install-path-and-rpath.patch=
 \
> -           file://0025-handle-sysroot-support-for-nativesdk-gcc.patch \
> -           file://0026-Search-target-sysroot-gcc-version-specific-dirs-=
with.patch \
> -           file://0027-Fix-various-_FOR_BUILD-and-related-variables.pat=
ch \
> -           file://0028-nios2-Define-MUSL_DYNAMIC_LINKER.patch \
> -           file://0029-Add-ssp_nonshared-to-link-commandline-for-musl-t=
arge.patch \
> -           file://0030-ldbl128-config.patch \
> -           file://0031-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS=
.patch \
> -           file://0032-libgcc_s-Use-alias-for-__cpu_indicator_init-inst=
ead-.patch \
> -           file://0033-sync-gcc-stddef.h-with-musl.patch \
> -           file://0034-fix-segmentation-fault-in-precompiled-header-gen=
erat.patch \
> -           file://0035-Fix-for-testsuite-failure.patch \
> -           file://0036-Re-introduce-spe-commandline-options.patch \
> -           file://0037-CVE-2019-14250-Check-zero-value-in-simple_object=
_elf.patch \
> -           file://0038-gentypes-genmodes-Do-not-use-__LINE__-for-mainta=
inin.patch \
> -           file://0039-process_alt_operands-Don-t-match-user-defined-re=
gs-o.patch \
> +           file://0020-Don-t-search-host-directory-during-relink-if-ins=
t_pr.patch \
> +           file://0021-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardco=
ding.patch \
> +           file://0022-aarch64-Add-support-for-musl-ldso.patch \
> +           file://0023-libcc1-fix-libcc1-s-install-path-and-rpath.patch=
 \
> +           file://0024-handle-sysroot-support-for-nativesdk-gcc.patch \
> +           file://0025-Search-target-sysroot-gcc-version-specific-dirs-=
with.patch \
> +           file://0026-Fix-various-_FOR_BUILD-and-related-variables.pat=
ch \
> +           file://0027-nios2-Define-MUSL_DYNAMIC_LINKER.patch \
> +           file://0028-Add-ssp_nonshared-to-link-commandline-for-musl-t=
arge.patch \
> +           file://0029-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS=
.patch \
> +           file://0030-sync-gcc-stddef.h-with-musl.patch \
> +           file://0031-fix-segmentation-fault-in-precompiled-header-gen=
erat.patch \
> +           file://0032-Fix-for-testsuite-failure.patch \
> +           file://0033-Re-introduce-spe-commandline-options.patch \
> +           file://0034-libgcc_s-Use-alias-for-__cpu_indicator_init-inst=
ead-.patch \
> +           file://0035-gentypes-genmodes-Do-not-use-__LINE__-for-mainta=
inin.patch \
> +           file://0036-Enable-CET-in-cross-compiler-if-possible.patch \
> +           file://0037-libstdc-v3-Include-system_error-for-std-errc.pat=
ch \
>   "
> +SRC_URI[sha256sum] =3D "b6898a23844b656f1b68691c5c012036c2e694ac4b53a89=
18d4712ad876e7ea2"
> +
>   S =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
> -SRC_URI[sha256sum] =3D "71e197867611f6054aa1119b13a0c0abac12834765fe2d8=
1f35ac57f84f742d1"
>   # For dev release snapshotting
> -#S =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/official-gcc-${RELEASE}"
> +#S =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${RELEASE}"
>   #B =3D "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
>  =20
>   # Language Overrides
> diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0001-gcc-4.3.1-ARCH_FLAGS=
_FOR_TARGET.patch b/meta/recipes-devtools/gcc/gcc-10.1/0001-gcc-4.3.1-ARCH_=
FLAGS_FOR_TARGET.patch
> similarity index 79%
> rename from meta/recipes-devtools/gcc/gcc-9.3/0001-gcc-4.3.1-ARCH_FLAGS_=
FOR_TARGET.patch
> rename to meta/recipes-devtools/gcc/gcc-10.1/0001-gcc-4.3.1-ARCH_FLAGS_F=
OR_TARGET.patch
> index 0d9222df17..a8e36f57a8 100644
> --- a/meta/recipes-devtools/gcc/gcc-9.3/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TA=
RGET.patch
> +++ b/meta/recipes-devtools/gcc/gcc-10.1/0001-gcc-4.3.1-ARCH_FLAGS_FOR_T=
ARGET.patch
> @@ -1,7 +1,7 @@
> -From 02b1789dbbb184726782b5038a4dd96515ec790c Mon Sep 17 00:00:00 2001
> +From 8e774023f4f40d6df576f430b4e49e5f8f7888a1 Mon Sep 17 00:00:00 2001
>   From: Khem Raj <raj.khem@gmail.com>
>   Date: Fri, 29 Mar 2013 08:37:11 +0400
> -Subject: [PATCH 01/39] gcc-4.3.1: ARCH_FLAGS_FOR_TARGET
> +Subject: [PATCH] gcc-4.3.1: ARCH_FLAGS_FOR_TARGET
>  =20
>   Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  =20
> @@ -12,10 +12,10 @@ Upstream-Status: Inappropriate [embedded specific]
>    2 files changed, 2 insertions(+), 2 deletions(-)
>  =20
>   diff --git a/configure b/configure
> -index abd93a990a9..b121088d778 100755
> +index 4cc938ebb7d..226a64939d1 100755
>   --- a/configure
>   +++ b/configure
> -@@ -7603,7 +7603,7 @@ fi
> +@@ -7722,7 +7722,7 @@ fi
>    # for target_alias and gcc doesn't manage it consistently.
>    target_configargs=3D"--cache-file=3D./config.cache ${target_configarg=
s}"
>    
> @@ -25,10 +25,10 @@ index abd93a990a9..b121088d778 100755
>     *" newlib "*)
>      case " $target_configargs " in
>   diff --git a/configure.ac b/configure.ac
> -index 9db4fd14aa2..aad93c4d183 100644
> +index c78d9cbea62..f024f4bac9b 100644
>   --- a/configure.ac
>   +++ b/configure.ac
> -@@ -3119,7 +3119,7 @@ fi
> +@@ -3227,7 +3227,7 @@ fi
>    # for target_alias and gcc doesn't manage it consistently.
>    target_configargs=3D"--cache-file=3D./config.cache ${target_configarg=
s}"
>    
> @@ -37,6 +37,3 @@ index 9db4fd14aa2..aad93c4d183 100644
>    case " $target_configdirs " in
>     *" newlib "*)
>      case " $target_configargs " in
> ---
> -2.25.1
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0002-gcc-poison-system-di=
rectories.patch b/meta/recipes-devtools/gcc/gcc-10.1/0002-gcc-poison-system=
-directories.patch
> similarity index 85%
> rename from meta/recipes-devtools/gcc/gcc-9.3/0002-gcc-poison-system-dir=
ectories.patch
> rename to meta/recipes-devtools/gcc/gcc-10.1/0002-gcc-poison-system-dire=
ctories.patch
> index f427ee67c1..1ea79c0e5c 100644
> --- a/meta/recipes-devtools/gcc/gcc-9.3/0002-gcc-poison-system-directori=
es.patch
> +++ b/meta/recipes-devtools/gcc/gcc-10.1/0002-gcc-poison-system-director=
ies.patch
> @@ -1,7 +1,7 @@
> -From 5368cd0293ce50a69ced6e4b25ba6c8d8e014256 Mon Sep 17 00:00:00 2001
> +From 828710f9b85c85b2c8dbf1ac3a32b60c60c4054d Mon Sep 17 00:00:00 2001
>   From: Khem Raj <raj.khem@gmail.com>
>   Date: Fri, 29 Mar 2013 08:59:00 +0400
> -Subject: [PATCH 02/39] gcc: poison-system-directories
> +Subject: [PATCH] gcc: poison-system-directories
>  =20
>   Add /sw/include and /opt/include based on the original
>   zecke-no-host-includes.patch patch.  The original patch checked for
> @@ -26,10 +26,10 @@ Upstream-Status: Pending
>    7 files changed, 68 insertions(+)
>  =20
>   diff --git a/gcc/common.opt b/gcc/common.opt
> -index d342c4f3749..c64fd4a6c50 100644
> +index 65a82410abc..415f38fa1f4 100644
>   --- a/gcc/common.opt
>   +++ b/gcc/common.opt
> -@@ -684,6 +684,10 @@ Wreturn-local-addr
> +@@ -682,6 +682,10 @@ Wreturn-local-addr
>    Common Var(warn_return_local_addr) Init(1) Warning
>    Warn about returning a pointer/reference to a local or temporary vari=
able.
>    
> @@ -41,10 +41,10 @@ index d342c4f3749..c64fd4a6c50 100644
>    Common Var(warn_shadow) Warning
>    Warn when one variable shadows another.  Same as -Wshadow=3Dglobal.
>   diff --git a/gcc/config.in b/gcc/config.in
> -index a718ceaf3da..5713342efb1 100644
> +index 809e7b26823..5adeaeed36b 100644
>   --- a/gcc/config.in
>   +++ b/gcc/config.in
> -@@ -200,6 +200,12 @@
> +@@ -224,6 +224,12 @@
>    #endif
>    
>    
> @@ -58,10 +58,10 @@ index a718ceaf3da..5713342efb1 100644
>       optimizer and back end) to be checked for dynamic type safety at r=
untime.
>       This is quite expensive. */
>   diff --git a/gcc/configure b/gcc/configure
> -index a065ba23728..2e26dd33310 100755
> +index cd3d9516fce..8de766a942c 100755
>   --- a/gcc/configure
>   +++ b/gcc/configure
> -@@ -996,6 +996,7 @@ with_system_zlib
> +@@ -1010,6 +1010,7 @@ with_system_zlib
>    enable_maintainer_mode
>    enable_link_mutex
>    enable_version_specific_runtime_libs
> @@ -69,7 +69,7 @@ index a065ba23728..2e26dd33310 100755
>    enable_plugin
>    enable_host_shared
>    enable_libquadmath_support
> -@@ -1749,6 +1750,8 @@ Optional Features:
> +@@ -1766,6 +1767,8 @@ Optional Features:
>      --enable-version-specific-runtime-libs
>                              specify that runtime libraries should be in=
stalled
>                              in a compiler-specific directory
> @@ -78,7 +78,7 @@ index a065ba23728..2e26dd33310 100755
>      --enable-plugin         enable plugin support
>      --enable-host-shared    build host code as shared libraries
>      --disable-libquadmath-support
> -@@ -29753,6 +29756,19 @@ if test "${enable_version_specific_runtime_lib=
s+set}" =3D set; then :
> +@@ -30235,6 +30238,19 @@ if test "${enable_version_specific_runtime_lib=
s+set}" =3D set; then :
>    fi
>    
>    
> @@ -99,10 +99,10 @@ index a065ba23728..2e26dd33310 100755
>    
>    
>   diff --git a/gcc/configure.ac b/gcc/configure.ac
> -index 3a7251102ef..12d1d04e645 100644
> +index 0de3b4bf97b..8bfd6feb780 100644
>   --- a/gcc/configure.ac
>   +++ b/gcc/configure.ac
> -@@ -6380,6 +6380,16 @@ AC_ARG_ENABLE(version-specific-runtime-libs,
> +@@ -6595,6 +6595,16 @@ AC_ARG_ENABLE(version-specific-runtime-libs,
>                    [specify that runtime libraries should be
>                     installed in a compiler-specific directory])])
>    
> @@ -120,18 +120,18 @@ index 3a7251102ef..12d1d04e645 100644
>    AC_SUBST(subdirs)
>    AC_SUBST(srcdir)
>   diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
> -index 0ab6c9c6449..c3d3d51a28f 100644
> +index f98161391a0..f12d8d12150 100644
>   --- a/gcc/doc/invoke.texi
>   +++ b/gcc/doc/invoke.texi
> -@@ -333,6 +333,7 @@ Objective-C and Objective-C++ Dialects}.
> - -Wpacked  -Wpacked-bitfield-compat -Wpacked-not-aligned  -Wpadded @gol
> +@@ -348,6 +348,7 @@ Objective-C and Objective-C++ Dialects}.
> + -Wpacked  -Wno-packed-bitfield-compat  -Wpacked-not-aligned  -Wpadded =
@gol
>    -Wparentheses  -Wno-pedantic-ms-format @gol
> - -Wplacement-new  -Wplacement-new=3D@var{n} @gol
> + -Wpointer-arith  -Wno-pointer-compare  -Wno-pointer-to-int-cast @gol
>   +-Wno-poison-system-directories @gol
> - -Wpointer-arith  -Wpointer-compare  -Wno-pointer-to-int-cast @gol
>    -Wno-pragmas  -Wno-prio-ctor-dtor  -Wredundant-decls @gol
> - -Wrestrict  -Wno-return-local-addr @gol
> -@@ -6290,6 +6291,14 @@ made up of data only and thus requires no specia=
l treatment.  But, for
> + -Wrestrict  -Wno-return-local-addr  -Wreturn-type @gol
> + -Wno-scalar-storage-order  -Wsequence-point @gol
> +@@ -6924,6 +6925,14 @@ made up of data only and thus requires no specia=
l treatment.  But, for
>    most targets, it is made up of code and thus requires the stack to be
>    made executable in order for the program to work properly.
>    
> @@ -147,10 +147,10 @@ index 0ab6c9c6449..c3d3d51a28f 100644
>    @opindex Wfloat-equal
>    @opindex Wno-float-equal
>   diff --git a/gcc/gcc.c b/gcc/gcc.c
> -index 4f57765b012..a2601a6bb06 100644
> +index 9f790db0daf..b2200c5185a 100644
>   --- a/gcc/gcc.c
>   +++ b/gcc/gcc.c
> -@@ -1042,6 +1042,8 @@ proper position among the other output files.  */
> +@@ -1041,6 +1041,8 @@ proper position among the other output files.  */
>       "%{fuse-ld=3D*:-fuse-ld=3D%*} " LINK_COMPRESS_DEBUG_SPEC \
>       "%X %{o*} %{e*} %{N} %{n} %{r}\
>        %{s} %{t} %{u*} %{z} %{Z} %{!nostdlib:%{!r:%{!nostartfiles:%S}}} =
\
> @@ -160,7 +160,7 @@ index 4f57765b012..a2601a6bb06 100644
>        VTABLE_VERIFICATION_SPEC " " SANITIZER_EARLY_SPEC " %o "" \
>        %{fopenacc|fopenmp|%:gt(%{ftree-parallelize-loops=3D*:%*} 1):\
>   diff --git a/gcc/incpath.c b/gcc/incpath.c
> -index bcbe2082905..5752298bbf2 100644
> +index 8a2bda00f80..9098ab044ab 100644
>   --- a/gcc/incpath.c
>   +++ b/gcc/incpath.c
>   @@ -26,6 +26,7 @@
> @@ -198,6 +198,3 @@ index bcbe2082905..5752298bbf2 100644
>    }
>    
>    /* Use given -I paths for #include "..." but not #include <...>, and
> ---
> -2.25.1
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0003-gcc-4.3.3-SYSROOT_CF=
LAGS_FOR_TARGET.patch b/meta/recipes-devtools/gcc/gcc-10.1/0003-gcc-4.3.3-S=
YSROOT_CFLAGS_FOR_TARGET.patch
> similarity index 92%
> rename from meta/recipes-devtools/gcc/gcc-9.3/0003-gcc-4.3.3-SYSROOT_CFL=
AGS_FOR_TARGET.patch
> rename to meta/recipes-devtools/gcc/gcc-10.1/0003-gcc-4.3.3-SYSROOT_CFLA=
GS_FOR_TARGET.patch
> index 23ec5bce03..d2a96d938b 100644
> --- a/meta/recipes-devtools/gcc/gcc-9.3/0003-gcc-4.3.3-SYSROOT_CFLAGS_FO=
R_TARGET.patch
> +++ b/meta/recipes-devtools/gcc/gcc-10.1/0003-gcc-4.3.3-SYSROOT_CFLAGS_F=
OR_TARGET.patch
> @@ -1,7 +1,7 @@
> -From df90dbdba7a85c20bad95de71525f0f400a849d2 Mon Sep 17 00:00:00 2001
> +From d3652267200febeaca61485577315f353e5231f5 Mon Sep 17 00:00:00 2001
>   From: Khem Raj <raj.khem@gmail.com>
>   Date: Fri, 29 Mar 2013 09:08:31 +0400
> -Subject: [PATCH 03/39] gcc-4.3.3: SYSROOT_CFLAGS_FOR_TARGET
> +Subject: [PATCH] gcc-4.3.3: SYSROOT_CFLAGS_FOR_TARGET
>  =20
>   Before committing, I noticed that PR/32161 was marked as a dup of PR/3=
2009, but my previous patch did not fix it.
>  =20
> @@ -26,10 +26,10 @@ Upstream-Status: Pending
>    1 file changed, 32 insertions(+)
>  =20
>   diff --git a/configure b/configure
> -index b121088d778..93aae5bb26f 100755
> +index 226a64939d1..b31dc137fc9 100755
>   --- a/configure
>   +++ b/configure
> -@@ -6864,6 +6864,38 @@ fi
> +@@ -6971,6 +6971,38 @@ fi
>    
>    
>    
> @@ -68,6 +68,3 @@ index b121088d778..93aae5bb26f 100755
>    # Handle --with-headers=3DXXX.  If the value is not "yes", the conten=
ts of
>    # the named directory are copied to $(tooldir)/sys-include.
>    if test x"${with_headers}" !=3D x && test x"${with_headers}" !=3D xno=
 ; then
> ---
> -2.25.1
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0004-64-bit-multilib-hack=
.patch b/meta/recipes-devtools/gcc/gcc-10.1/0004-64-bit-multilib-hack.patch
> similarity index 95%
> rename from meta/recipes-devtools/gcc/gcc-9.3/0004-64-bit-multilib-hack.=
patch
> rename to meta/recipes-devtools/gcc/gcc-10.1/0004-64-bit-multilib-hack.p=
atch
> index 17ec8986c1..3bc390085f 100644
> --- a/meta/recipes-devtools/gcc/gcc-9.3/0004-64-bit-multilib-hack.patch
> +++ b/meta/recipes-devtools/gcc/gcc-10.1/0004-64-bit-multilib-hack.patch
> @@ -1,7 +1,7 @@
> -From 2e00d0a9a809153f693659e977c1e0550665e65c Mon Sep 17 00:00:00 2001
> +From 1eae2020a733d94ca73d433f1debd94c3eb7165b Mon Sep 17 00:00:00 2001
>   From: Khem Raj <raj.khem@gmail.com>
>   Date: Fri, 29 Mar 2013 09:10:06 +0400
> -Subject: [PATCH 04/39] 64-bit multilib hack.
> +Subject: [PATCH] 64-bit multilib hack.
>  =20
>   GCC has internal multilib handling code but it assumes a very specific=
 rigid directory
>   layout. The build system implementation of multilib layout is very gen=
eric and allows
> @@ -37,7 +37,7 @@ Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>    5 files changed, 15 insertions(+), 20 deletions(-)
>  =20
>   diff --git a/gcc/config/aarch64/t-aarch64-linux b/gcc/config/aarch64/t=
-aarch64-linux
> -index 5ad670ba2ce..e26019e7157 100644
> +index 83e59e33b85..b1356be1fb4 100644
>   --- a/gcc/config/aarch64/t-aarch64-linux
>   +++ b/gcc/config/aarch64/t-aarch64-linux
>   @@ -21,8 +21,8 @@
> @@ -54,7 +54,7 @@ index 5ad670ba2ce..e26019e7157 100644
>   -MULTILIB_OSDIRNAMES +=3D mabi.ilp32=3D../libilp32$(call if_multiarch,=
:aarch64$(AARCH_BE)-linux-gnu_ilp32)
>   +#MULTILIB_OSDIRNAMES +=3D mabi.ilp32=3D../libilp32$(call if_multiarch=
,:aarch64$(AARCH_BE)-linux-gnu_ilp32)
>   diff --git a/gcc/config/i386/t-linux64 b/gcc/config/i386/t-linux64
> -index c686ab2f0d2..c82b60dadcd 100644
> +index 1171e218578..5e057b7e5db 100644
>   --- a/gcc/config/i386/t-linux64
>   +++ b/gcc/config/i386/t-linux64
>   @@ -32,7 +32,5 @@
> @@ -68,7 +68,7 @@ index c686ab2f0d2..c82b60dadcd 100644
>   +MULTILIB_DIRNAMES =3D . .
>   +MULTILIB_OSDIRNAMES =3D ../$(shell basename $(base_libdir)) ../$(shel=
l basename $(base_libdir))
>   diff --git a/gcc/config/mips/t-linux64 b/gcc/config/mips/t-linux64
> -index 3a2ff700d7d..13ef19576b5 100644
> +index ceb58d3b5f3..43fe2bf28ab 100644
>   --- a/gcc/config/mips/t-linux64
>   +++ b/gcc/config/mips/t-linux64
>   @@ -17,10 +17,6 @@
> @@ -98,7 +98,7 @@ index 216d2776a18..e4d817621fc 100644
>   +#MULTILIB_OSDIRNAMES :=3D $(patsubst lib%,../lib%,$(MULTILIB_DIRNAMES=
))
>   +MULTILIB_OSDIRNAMES :=3D ../$(shell basename $(base_libdir)) ../$(she=
ll basename $(base_libdir))
>   diff --git a/gcc/config/rs6000/t-linux64 b/gcc/config/rs6000/t-linux64
> -index f3c6e2be1d9..bd0393155fa 100644
> +index 264a7e27524..dc9d440f66b 100644
>   --- a/gcc/config/rs6000/t-linux64
>   +++ b/gcc/config/rs6000/t-linux64
>   @@ -26,10 +26,9 @@
> @@ -114,6 +114,3 @@ index f3c6e2be1d9..bd0393155fa 100644
>    
>    rs6000-linux.o: $(srcdir)/config/rs6000/rs6000-linux.c
>    	$(COMPILE) $<
> ---
> -2.25.1
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0005-optional-libstdc.pat=
ch b/meta/recipes-devtools/gcc/gcc-10.1/0005-optional-libstdc.patch
> similarity index 86%
> rename from meta/recipes-devtools/gcc/gcc-9.3/0005-optional-libstdc.patc=
h
> rename to meta/recipes-devtools/gcc/gcc-10.1/0005-optional-libstdc.patch
> index 3c28aeac63..10160440e5 100644
> --- a/meta/recipes-devtools/gcc/gcc-9.3/0005-optional-libstdc.patch
> +++ b/meta/recipes-devtools/gcc/gcc-10.1/0005-optional-libstdc.patch
> @@ -1,7 +1,7 @@
> -From 435e45592e944018f33bff32f1202b0872a23141 Mon Sep 17 00:00:00 2001
> +From 64167c2783508bc14f78c60269997a0a6f19b08a Mon Sep 17 00:00:00 2001
>   From: Khem Raj <raj.khem@gmail.com>
>   Date: Fri, 29 Mar 2013 09:12:56 +0400
> -Subject: [PATCH 05/39] optional libstdc
> +Subject: [PATCH] optional libstdc
>  =20
>   gcc-runtime builds libstdc++ separately from gcc-cross-*. Its configur=
e tests using g++
>   will not run correctly since by default the linker will try to link ag=
ainst libstdc++
> @@ -25,10 +25,10 @@ Upstream-Status: Inappropriate [embedded specific]
>    4 files changed, 37 insertions(+), 1 deletion(-)
>  =20
>   diff --git a/gcc/c-family/c.opt b/gcc/c-family/c.opt
> -index 916cc67b453..41619fa591c 100644
> +index c49da99d395..35f712e2c84 100644
>   --- a/gcc/c-family/c.opt
>   +++ b/gcc/c-family/c.opt
> -@@ -1952,6 +1952,10 @@ nostdinc++
> +@@ -2025,6 +2025,10 @@ nostdinc++
>    C++ ObjC++
>    Do not search standard system include directories for C++.
>    
> @@ -40,7 +40,7 @@ index 916cc67b453..41619fa591c 100644
>    C ObjC C++ ObjC++ Joined Separate
>    ; Documented in common.opt
>   diff --git a/gcc/cp/g++spec.c b/gcc/cp/g++spec.c
> -index 6c4574a837d..0e2657f00ee 100644
> +index 0ab63bcd211..7b081e9e4f0 100644
>   --- a/gcc/cp/g++spec.c
>   +++ b/gcc/cp/g++spec.c
>   @@ -137,6 +137,7 @@ lang_specific_driver (struct cl_decoded_option **i=
n_decoded_options,
> @@ -52,10 +52,10 @@ index 6c4574a837d..0e2657f00ee 100644
>    	  library =3D -1;
>    	  break;
>   diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
> -index c3d3d51a28f..2f7ffe456c3 100644
> +index f12d8d12150..cf6cb428e7d 100644
>   --- a/gcc/doc/invoke.texi
>   +++ b/gcc/doc/invoke.texi
> -@@ -228,6 +228,9 @@ in the following sections.
> +@@ -230,6 +230,9 @@ in the following sections.
>    -fno-weak  -nostdinc++ @gol
>    -fvisibility-inlines-hidden @gol
>    -fvisibility-ms-compat @gol
> @@ -63,9 +63,9 @@ index c3d3d51a28f..2f7ffe456c3 100644
>   +-fvtv-counts -fvtv-debug @gol
>   +-nostdlib++ @gol
>    -fext-numeric-literals @gol
> - -Wabi=3D@var{n}  -Wabi-tag  -Wconversion-null  -Wctor-dtor-privacy @go=
l
> - -Wdelete-non-virtual-dtor  -Wdeprecated-copy  -Wdeprecated-copy-dtor @=
gol
> -@@ -539,7 +542,7 @@ Objective-C and Objective-C++ Dialects}.
> + -Wabi-tag  -Wcatch-value  -Wcatch-value=3D@var{n} @gol
> + -Wno-class-conversion  -Wclass-memaccess @gol
> +@@ -599,7 +602,7 @@ Objective-C and Objective-C++ Dialects}.
>    -pie  -pthread  -r  -rdynamic @gol
>    -s  -static  -static-pie  -static-libgcc  -static-libstdc++ @gol
>    -static-libasan  -static-libtsan  -static-liblsan  -static-libubsan @=
gol
> @@ -74,7 +74,7 @@ index c3d3d51a28f..2f7ffe456c3 100644
>    -T @var{script}  -Wl,@var{option}  -Xlinker @var{option} @gol
>    -u @var{symbol}  -z @var{keyword}}
>    
> -@@ -13321,6 +13324,33 @@ Specify that the program entry point is @var{e=
ntry}.  The argument is
> +@@ -14407,6 +14410,33 @@ Specify that the program entry point is @var{e=
ntry}.  The argument is
>    interpreted by the linker; the GNU linker accepts either a symbol nam=
e
>    or an address.
>    
> @@ -109,10 +109,10 @@ index c3d3d51a28f..2f7ffe456c3 100644
>    @opindex pie
>    Produce a dynamically linked position independent executable on targe=
ts
>   diff --git a/gcc/gcc.c b/gcc/gcc.c
> -index a2601a6bb06..cd6c6fc95db 100644
> +index b2200c5185a..f8be58ce0a6 100644
>   --- a/gcc/gcc.c
>   +++ b/gcc/gcc.c
> -@@ -1052,6 +1052,7 @@ proper position among the other output files.  */
> +@@ -1051,6 +1051,7 @@ proper position among the other output files.  */
>        %(mflib) " STACK_SPLIT_SPEC "\
>        %{fprofile-arcs|fprofile-generate*|coverage:-lgcov} " SANITIZER_S=
PEC " \
>        %{!nostdlib:%{!r:%{!nodefaultlibs:%(link_ssp) %(link_gcc_c_sequen=
ce)}}}\
> @@ -120,6 +120,3 @@ index a2601a6bb06..cd6c6fc95db 100644
>        %{!nostdlib:%{!r:%{!nostartfiles:%E}}} %{T*}  \n%(post_link) }}}}=
}}"
>    #endif
>    
> ---
> -2.25.1
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0006-COLLECT_GCC_OPTIONS.=
patch b/meta/recipes-devtools/gcc/gcc-10.1/0006-COLLECT_GCC_OPTIONS.patch
> similarity index 80%
> rename from meta/recipes-devtools/gcc/gcc-9.3/0006-COLLECT_GCC_OPTIONS.p=
atch
> rename to meta/recipes-devtools/gcc/gcc-10.1/0006-COLLECT_GCC_OPTIONS.pa=
tch
> index 906f3a7317..8e9fc17c97 100644
> --- a/meta/recipes-devtools/gcc/gcc-9.3/0006-COLLECT_GCC_OPTIONS.patch
> +++ b/meta/recipes-devtools/gcc/gcc-10.1/0006-COLLECT_GCC_OPTIONS.patch
> @@ -1,7 +1,7 @@
> -From c99684477ec66f290ec74efe732acd3c24db7dcc Mon Sep 17 00:00:00 2001
> +From 1e9a0bc60b179d9a199028aabbdb72c4ecdd3b9b Mon Sep 17 00:00:00 2001
>   From: Khem Raj <raj.khem@gmail.com>
>   Date: Fri, 29 Mar 2013 09:16:28 +0400
> -Subject: [PATCH 06/39] COLLECT_GCC_OPTIONS
> +Subject: [PATCH] COLLECT_GCC_OPTIONS
>  =20
>   This patch adds --sysroot into COLLECT_GCC_OPTIONS which is used to
>   invoke collect2.
> @@ -14,10 +14,10 @@ Upstream-Status: Pending
>    1 file changed, 9 insertions(+)
>  =20
>   diff --git a/gcc/gcc.c b/gcc/gcc.c
> -index cd6c6fc95db..7da9c5d457b 100644
> +index f8be58ce0a6..48b0f9dde81 100644
>   --- a/gcc/gcc.c
>   +++ b/gcc/gcc.c
> -@@ -4804,6 +4804,15 @@ set_collect_gcc_options (void)
> +@@ -4806,6 +4806,15 @@ set_collect_gcc_options (void)
>    	=09sizeof ("COLLECT_GCC_OPTIONS=3D") - 1);
>    
>      first_time =3D TRUE;
> @@ -33,6 +33,3 @@ index cd6c6fc95db..7da9c5d457b 100644
>      for (i =3D 0; (int) i < n_switches; i++)
>        {
>          const char *const *args;
> ---
> -2.25.1
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0007-Use-the-defaults.h-i=
n-B-instead-of-S-and-t-oe-in-B.patch b/meta/recipes-devtools/gcc/gcc-10.1/0=
007-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
> similarity index 87%
> rename from meta/recipes-devtools/gcc/gcc-9.3/0007-Use-the-defaults.h-in=
-B-instead-of-S-and-t-oe-in-B.patch
> rename to meta/recipes-devtools/gcc/gcc-10.1/0007-Use-the-defaults.h-in-=
B-instead-of-S-and-t-oe-in-B.patch
> index 68a876cb95..1f3abd29b6 100644
> --- a/meta/recipes-devtools/gcc/gcc-9.3/0007-Use-the-defaults.h-in-B-ins=
tead-of-S-and-t-oe-in-B.patch
> +++ b/meta/recipes-devtools/gcc/gcc-10.1/0007-Use-the-defaults.h-in-B-in=
stead-of-S-and-t-oe-in-B.patch
> @@ -1,8 +1,7 @@
> -From d6f4edaab0ad0e742fb1e3a6f76908a2ac9927d5 Mon Sep 17 00:00:00 2001
> +From 5022d71694fd41deeb0789f597468e05aeafc22d Mon Sep 17 00:00:00 2001
>   From: Khem Raj <raj.khem@gmail.com>
>   Date: Fri, 29 Mar 2013 09:17:25 +0400
> -Subject: [PATCH 07/39] Use the defaults.h in ${B} instead of ${S}, and =
t-oe in
> - ${B}
> +Subject: [PATCH] Use the defaults.h in ${B} instead of ${S}, and t-oe i=
n ${B}
>  =20
>   Use the defaults.h in ${B} instead of ${S}, and t-oe in ${B}, so that
>   the source can be shared between gcc-cross-initial,
> @@ -27,7 +26,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>    4 files changed, 7 insertions(+), 7 deletions(-)
>  =20
>   diff --git a/gcc/Makefile.in b/gcc/Makefile.in
> -index abae872cd63..fef6c4c61e3 100644
> +index 543b477ff18..a67d2cc18d6 100644
>   --- a/gcc/Makefile.in
>   +++ b/gcc/Makefile.in
>   @@ -540,7 +540,7 @@ TARGET_SYSTEM_ROOT =3D @TARGET_SYSTEM_ROOT@
> @@ -40,10 +39,10 @@ index abae872cd63..fef6c4c61e3 100644
>    TM_MULTILIB_CONFIG=3D@TM_MULTILIB_CONFIG@
>    TM_MULTILIB_EXCEPTIONS_CONFIG=3D@TM_MULTILIB_EXCEPTIONS_CONFIG@
>   diff --git a/gcc/configure b/gcc/configure
> -index 2e26dd33310..ed7931daed3 100755
> +index 8de766a942c..b26e8fc7fee 100755
>   --- a/gcc/configure
>   +++ b/gcc/configure
> -@@ -12342,8 +12342,8 @@ for f in $tm_file; do
> +@@ -12705,8 +12705,8 @@ for f in $tm_file; do
>           tm_include_list=3D"${tm_include_list} $f"
>           ;;
>        defaults.h )
> @@ -55,10 +54,10 @@ index 2e26dd33310..ed7931daed3 100755
>        * )
>           tm_file_list=3D"${tm_file_list} \$(srcdir)/config/$f"
>   diff --git a/gcc/configure.ac b/gcc/configure.ac
> -index 12d1d04e645..e0500e30d50 100644
> +index 8bfd6feb780..26fa46802c7 100644
>   --- a/gcc/configure.ac
>   +++ b/gcc/configure.ac
> -@@ -1968,8 +1968,8 @@ for f in $tm_file; do
> +@@ -2138,8 +2138,8 @@ for f in $tm_file; do
>           tm_include_list=3D"${tm_include_list} $f"
>           ;;
>        defaults.h )
> @@ -70,7 +69,7 @@ index 12d1d04e645..e0500e30d50 100644
>        * )
>           tm_file_list=3D"${tm_file_list} \$(srcdir)/config/$f"
>   diff --git a/gcc/mkconfig.sh b/gcc/mkconfig.sh
> -index 308b87d0cc1..19068cbc24a 100644
> +index d2c677a4a42..d03852481cb 100644
>   --- a/gcc/mkconfig.sh
>   +++ b/gcc/mkconfig.sh
>   @@ -77,7 +77,7 @@ if [ -n "$HEADERS" ]; then
> @@ -91,6 +90,3 @@ index 308b87d0cc1..19068cbc24a 100644
>    fi
>    
>    # Add multiple inclusion protection guard, part two.
> ---
> -2.25.1
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0008-fortran-cross-compil=
e-hack.patch b/meta/recipes-devtools/gcc/gcc-10.1/0008-fortran-cross-compil=
e-hack.patch
> similarity index 81%
> rename from meta/recipes-devtools/gcc/gcc-9.3/0008-fortran-cross-compile=
-hack.patch
> rename to meta/recipes-devtools/gcc/gcc-10.1/0008-fortran-cross-compile-=
hack.patch
> index 6acd2b0cf9..0d9d007e0a 100644
> --- a/meta/recipes-devtools/gcc/gcc-9.3/0008-fortran-cross-compile-hack.=
patch
> +++ b/meta/recipes-devtools/gcc/gcc-10.1/0008-fortran-cross-compile-hack=
.patch
> @@ -1,7 +1,7 @@
> -From 2c514ada36ffbf70177909f633e9f68811de61e0 Mon Sep 17 00:00:00 2001
> +From e915473c21e9350d46f2c038f02bb3c13cfedeb4 Mon Sep 17 00:00:00 2001
>   From: Khem Raj <raj.khem@gmail.com>
>   Date: Fri, 29 Mar 2013 09:20:01 +0400
> -Subject: [PATCH 08/39] fortran cross-compile hack.
> +Subject: [PATCH] fortran cross-compile hack.
>  =20
>   * Fortran would have searched for arm-angstrom-gnueabi-gfortran but wo=
uld have used
>   used gfortan. For gcc_4.2.2.bb we want to use the gfortran compiler fr=
om our cross
> @@ -16,10 +16,10 @@ Upstream-Status: Inappropriate [embedded specific]
>    2 files changed, 2 insertions(+), 2 deletions(-)
>  =20
>   diff --git a/libgfortran/configure b/libgfortran/configure
> -index 60867b93d0e..3fc9fca5b7b 100755
> +index b4cf854ddb3..e8e0ac3b1cf 100755
>   --- a/libgfortran/configure
>   +++ b/libgfortran/configure
> -@@ -13071,7 +13071,7 @@ esac
> +@@ -13090,7 +13090,7 @@ esac
>    
>    # We need gfortran to compile parts of the library
>    #AC_PROG_FC(gfortran)
> @@ -29,10 +29,10 @@ index 60867b93d0e..3fc9fca5b7b 100755
>    ac_compile=3D'$FC -c $FCFLAGS $ac_fcflags_srcext conftest.$ac_ext >&5=
'
>    ac_link=3D'$FC -o conftest$ac_exeext $FCFLAGS $LDFLAGS $ac_fcflags_sr=
cext conftest.$ac_ext $LIBS >&5'
>   diff --git a/libgfortran/configure.ac b/libgfortran/configure.ac
> -index 7cfce28ab69..6cd515ee1a4 100644
> +index 711dc60ff78..3c9bbfbf47d 100644
>   --- a/libgfortran/configure.ac
>   +++ b/libgfortran/configure.ac
> -@@ -250,7 +250,7 @@ AC_SUBST(enable_static)
> +@@ -258,7 +258,7 @@ AC_SUBST(enable_static)
>    
>    # We need gfortran to compile parts of the library
>    #AC_PROG_FC(gfortran)
> @@ -41,6 +41,3 @@ index 7cfce28ab69..6cd515ee1a4 100644
>    AC_PROG_FC(gfortran)
>    
>    # extra LD Flags which are required for targets
> ---
> -2.25.1
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0009-cpp-honor-sysroot.pa=
tch b/meta/recipes-devtools/gcc/gcc-10.1/0009-cpp-honor-sysroot.patch
> similarity index 87%
> rename from meta/recipes-devtools/gcc/gcc-9.3/0009-cpp-honor-sysroot.pat=
ch
> rename to meta/recipes-devtools/gcc/gcc-10.1/0009-cpp-honor-sysroot.patc=
h
> index 5a9e527606..4c58196a2f 100644
> --- a/meta/recipes-devtools/gcc/gcc-9.3/0009-cpp-honor-sysroot.patch
> +++ b/meta/recipes-devtools/gcc/gcc-10.1/0009-cpp-honor-sysroot.patch
> @@ -1,7 +1,7 @@
> -From 0a7c03a9cf925ba09a510a32e684f01ec5a50650 Mon Sep 17 00:00:00 2001
> +From 4c05d097090428972e7d90530851153809cb734d Mon Sep 17 00:00:00 2001
>   From: Khem Raj <raj.khem@gmail.com>
>   Date: Fri, 29 Mar 2013 09:22:00 +0400
> -Subject: [PATCH 09/39] cpp: honor sysroot.
> +Subject: [PATCH] cpp: honor sysroot.
>  =20
>   Currently, if the gcc toolchain is relocated and installed from sstate=
, then you try and compile
>   preprocessed source (.i or .ii files), the compiler will try and acces=
s the builtin sysroot location
> @@ -26,7 +26,7 @@ Upstream-Status: Pending
>    2 files changed, 2 insertions(+), 2 deletions(-)
>  =20
>   diff --git a/gcc/cp/lang-specs.h b/gcc/cp/lang-specs.h
> -index c6e42eda283..e1ddf066467 100644
> +index 0ad4a33b93e..16c744f4f90 100644
>   --- a/gcc/cp/lang-specs.h
>   +++ b/gcc/cp/lang-specs.h
>   @@ -66,5 +66,5 @@ along with GCC; see the file COPYING3.  If not see
> @@ -37,10 +37,10 @@ index c6e42eda283..e1ddf066467 100644
>   +      "  cc1plus -fpreprocessed %i %I %(cc1_options) %2"
>          "  %{!fsyntax-only:%(invoke_as)}}}}", 0, 0, 0},
>   diff --git a/gcc/gcc.c b/gcc/gcc.c
> -index 7da9c5d457b..4e7c45b268c 100644
> +index 48b0f9dde81..c87f603955f 100644
>   --- a/gcc/gcc.c
>   +++ b/gcc/gcc.c
> -@@ -1349,7 +1349,7 @@ static const struct compiler default_compilers[] =
=
=3D
> +@@ -1348,7 +1348,7 @@ static const struct compiler default_compilers[] =
=
=3D
>    	=09	=09	   %W{o*:--output-pch=3D%*}}%V}}}}}}}", 0, 0, 0},
>      {".i", "@cpp-output", 0, 0, 0},
>      {"@cpp-output",
> @@ -49,6 +49,3 @@ index 7da9c5d457b..4e7c45b268c 100644
>      {".s", "@assembler", 0, 0, 0},
>      {"@assembler",
>       "%{!M:%{!MM:%{!E:%{!S:as %(asm_debug) %(asm_options) %i %A }}}}", =
0, 0, 0},
> ---
> -2.25.1
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0010-MIPS64-Default-to-N6=
4-ABI.patch b/meta/recipes-devtools/gcc/gcc-10.1/0010-MIPS64-Default-to-N64=
-ABI.patch
> similarity index 85%
> rename from meta/recipes-devtools/gcc/gcc-9.3/0010-MIPS64-Default-to-N64=
-ABI.patch
> rename to meta/recipes-devtools/gcc/gcc-10.1/0010-MIPS64-Default-to-N64-=
ABI.patch
> index a8103b951e..3b7f4c631b 100644
> --- a/meta/recipes-devtools/gcc/gcc-9.3/0010-MIPS64-Default-to-N64-ABI.p=
atch
> +++ b/meta/recipes-devtools/gcc/gcc-10.1/0010-MIPS64-Default-to-N64-ABI.=
patch
> @@ -1,7 +1,7 @@
> -From 374aab6a88200fbd7343467d97f7ee6455bbce61 Mon Sep 17 00:00:00 2001
> +From ce72d817507a52cd4fe365b3cd8f1e206dba5843 Mon Sep 17 00:00:00 2001
>   From: Khem Raj <raj.khem@gmail.com>
>   Date: Fri, 29 Mar 2013 09:23:08 +0400
> -Subject: [PATCH 10/39] MIPS64: Default to N64 ABI
> +Subject: [PATCH] MIPS64: Default to N64 ABI
>  =20
>   MIPS64 defaults to n32 ABI, this patch makes it
>   so that it defaults to N64 ABI
> @@ -14,10 +14,10 @@ Upstream-Status: Inappropriate [OE config specific]
>    1 file changed, 5 insertions(+), 5 deletions(-)
>  =20
>   diff --git a/gcc/config.gcc b/gcc/config.gcc
> -index b2282ecdf0b..69c0e4a005b 100644
> +index cf1a87e2efd..37c4221a39f 100644
>   --- a/gcc/config.gcc
>   +++ b/gcc/config.gcc
> -@@ -2282,29 +2282,29 @@ mips*-*-linux*)	=09	=09# Linux MIPS, either end=
ian.
> +@@ -2511,29 +2511,29 @@ mips*-*-linux*)	=09	=09# Linux MIPS, either end=
ian.
>    	=09	default_mips_arch=3Dmips32
>    	=09	;;
>    	=09mips64el-st-linux-gnu)
> @@ -52,6 +52,3 @@ index b2282ecdf0b..69c0e4a005b 100644
>    	=09	enable_mips_multilibs=3D"yes"
>    	=09	;;
>    	esac
> ---
> -2.25.1
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0011-Define-GLIBC_DYNAMIC=
_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch b/meta/recipes-devtools/gcc/gcc-10.1=
/0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
> similarity index 93%
> rename from meta/recipes-devtools/gcc/gcc-9.3/0011-Define-GLIBC_DYNAMIC_=
LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
> rename to meta/recipes-devtools/gcc/gcc-10.1/0011-Define-GLIBC_DYNAMIC_L=
INKER-and-UCLIBC_DYNAMIC_LINKE.patch
> index d9d563d0f7..98d0bb1286 100644
> --- a/meta/recipes-devtools/gcc/gcc-9.3/0011-Define-GLIBC_DYNAMIC_LINKER=
-and-UCLIBC_DYNAMIC_LINKE.patch
> +++ b/meta/recipes-devtools/gcc/gcc-10.1/0011-Define-GLIBC_DYNAMIC_LINKE=
R-and-UCLIBC_DYNAMIC_LINKE.patch
> @@ -1,7 +1,7 @@
> -From dcd7891d6aea5327969132fea6ca4c199f14e985 Mon Sep 17 00:00:00 2001
> +From 25d4b627f02f771acaec373609a8225911b67fc7 Mon Sep 17 00:00:00 2001
>   From: Khem Raj <raj.khem@gmail.com>
>   Date: Fri, 29 Mar 2013 09:24:50 +0400
> -Subject: [PATCH 11/39] Define GLIBC_DYNAMIC_LINKER and UCLIBC_DYNAMIC_L=
INKER
> +Subject: [PATCH] Define GLIBC_DYNAMIC_LINKER and UCLIBC_DYNAMIC_LINKER
>    relative to SYSTEMLIBS_DIR
>  =20
>   This patch defines GLIBC_DYNAMIC_LINKER and UCLIBC_DYNAMIC_LINKER
> @@ -31,7 +31,7 @@ Upstream-Status: Inappropriate [OE configuration]
>    12 files changed, 29 insertions(+), 34 deletions(-)
>  =20
>   diff --git a/gcc/config/alpha/linux-elf.h b/gcc/config/alpha/linux-elf=
.h
> -index 824861befec..6afacce3292 100644
> +index e25fcac3c59..01aca0c6542 100644
>   --- a/gcc/config/alpha/linux-elf.h
>   +++ b/gcc/config/alpha/linux-elf.h
>   @@ -23,8 +23,8 @@ along with GCC; see the file COPYING3.  If not see
> @@ -46,7 +46,7 @@ index 824861befec..6afacce3292 100644
>    #define CHOOSE_DYNAMIC_LINKER(G, U) "%{mglibc:" G ";:" U "}"
>    #elif DEFAULT_LIBC =3D=3D LIBC_GLIBC
>   diff --git a/gcc/config/arm/linux-eabi.h b/gcc/config/arm/linux-eabi.h
> -index 66ec0ea3980..e4ade2e2ab0 100644
> +index 5bdcfa0c5d3..0c0332f317f 100644
>   --- a/gcc/config/arm/linux-eabi.h
>   +++ b/gcc/config/arm/linux-eabi.h
>   @@ -65,8 +65,8 @@
> @@ -61,7 +61,7 @@ index 66ec0ea3980..e4ade2e2ab0 100644
>    
>    #define GLIBC_DYNAMIC_LINKER \
>   diff --git a/gcc/config/arm/linux-elf.h b/gcc/config/arm/linux-elf.h
> -index 9a360defd21..98f6e960b64 100644
> +index 0ec3aa53189..abfa9566d74 100644
>   --- a/gcc/config/arm/linux-elf.h
>   +++ b/gcc/config/arm/linux-elf.h
>   @@ -60,7 +60,7 @@
> @@ -74,7 +74,7 @@ index 9a360defd21..98f6e960b64 100644
>    #define LINUX_TARGET_LINK_SPEC  "%{h*} \
>       %{static:-Bstatic} \
>   diff --git a/gcc/config/i386/linux.h b/gcc/config/i386/linux.h
> -index 9a6e2d99896..31efbb73016 100644
> +index 9f823f125ed..e0390b7d5e3 100644
>   --- a/gcc/config/i386/linux.h
>   +++ b/gcc/config/i386/linux.h
>   @@ -20,7 +20,7 @@ along with GCC; see the file COPYING3.  If not see
> @@ -87,7 +87,7 @@ index 9a6e2d99896..31efbb73016 100644
>    #undef MUSL_DYNAMIC_LINKER
>    #define MUSL_DYNAMIC_LINKER "/lib/ld-musl-i386.so.1"
>   diff --git a/gcc/config/i386/linux64.h b/gcc/config/i386/linux64.h
> -index c08221c4210..dbb474d792b 100644
> +index 6cb68d1ccfa..7de09ec857c 100644
>   --- a/gcc/config/i386/linux64.h
>   +++ b/gcc/config/i386/linux64.h
>   @@ -27,9 +27,9 @@ see the files COPYING3 and COPYING.RUNTIME respectiv=
ely.  If not, see
> @@ -104,7 +104,7 @@ index c08221c4210..dbb474d792b 100644
>    #undef MUSL_DYNAMIC_LINKER32
>    #define MUSL_DYNAMIC_LINKER32 "/lib/ld-musl-i386.so.1"
>   diff --git a/gcc/config/linux.h b/gcc/config/linux.h
> -index c3c4a219e67..4b05d8e93d1 100644
> +index 95654bcdb5a..0c1a8118a26 100644
>   --- a/gcc/config/linux.h
>   +++ b/gcc/config/linux.h
>   @@ -94,10 +94,10 @@ see the files COPYING3 and COPYING.RUNTIME respect=
ively.  If not, see
> @@ -123,7 +123,7 @@ index c3c4a219e67..4b05d8e93d1 100644
>    #define BIONIC_DYNAMIC_LINKER32 "/system/bin/linker"
>    #define BIONIC_DYNAMIC_LINKER64 "/system/bin/linker64"
>   diff --git a/gcc/config/mips/linux.h b/gcc/config/mips/linux.h
> -index 6f79ac9c01a..25de96f9561 100644
> +index 54446e58e5f..4786ee304c1 100644
>   --- a/gcc/config/mips/linux.h
>   +++ b/gcc/config/mips/linux.h
>   @@ -22,20 +22,20 @@ along with GCC; see the file COPYING3.  If not see
> @@ -154,7 +154,7 @@ index 6f79ac9c01a..25de96f9561 100644
>    #undef MUSL_DYNAMIC_LINKER32
>    #define MUSL_DYNAMIC_LINKER32 \
>   diff --git a/gcc/config/riscv/linux.h b/gcc/config/riscv/linux.h
> -index 58dd18b89f3..112ba9cd764 100644
> +index 4afef7c228c..01997330741 100644
>   --- a/gcc/config/riscv/linux.h
>   +++ b/gcc/config/riscv/linux.h
>   @@ -22,7 +22,7 @@ along with GCC; see the file COPYING3.  If not see
> @@ -167,10 +167,10 @@ index 58dd18b89f3..112ba9cd764 100644
>    #define MUSL_ABI_SUFFIX \
>      "%{mabi=3Dilp32:-sf}" \
>   diff --git a/gcc/config/rs6000/linux64.h b/gcc/config/rs6000/linux64.h
> -index 9946d3fed94..45a9a7cae59 100644
> +index 34776c8421e..967c1c43c63 100644
>   --- a/gcc/config/rs6000/linux64.h
>   +++ b/gcc/config/rs6000/linux64.h
> -@@ -423,24 +423,19 @@ extern int dot_symbols;
> +@@ -419,24 +419,19 @@ extern int dot_symbols;
>    #undef	LINK_OS_DEFAULT_SPEC
>    #define LINK_OS_DEFAULT_SPEC "%(link_os_linux)"
>    
> @@ -201,7 +201,7 @@ index 9946d3fed94..45a9a7cae59 100644
>    #undef  DEFAULT_ASM_ENDIAN
>    #if (TARGET_DEFAULT & MASK_LITTLE_ENDIAN)
>   diff --git a/gcc/config/sh/linux.h b/gcc/config/sh/linux.h
> -index c9897b7aca5..82f275319cc 100644
> +index c1d0441d488..81373eb8336 100644
>   --- a/gcc/config/sh/linux.h
>   +++ b/gcc/config/sh/linux.h
>   @@ -64,7 +64,7 @@ along with GCC; see the file COPYING3.  If not see
> @@ -214,7 +214,7 @@ index c9897b7aca5..82f275319cc 100644
>    #undef SUBTARGET_LINK_EMUL_SUFFIX
>    #define SUBTARGET_LINK_EMUL_SUFFIX "%{mfdpic:_fd;:_linux}"
>   diff --git a/gcc/config/sparc/linux.h b/gcc/config/sparc/linux.h
> -index 08476f1d94d..80440e712ad 100644
> +index 81201e67a2f..8b6fc577594 100644
>   --- a/gcc/config/sparc/linux.h
>   +++ b/gcc/config/sparc/linux.h
>   @@ -84,7 +84,7 @@ extern const char *host_detect_local_cpu (int argc, =
const char **argv);
> @@ -227,7 +227,7 @@ index 08476f1d94d..80440e712ad 100644
>    #undef  LINK_SPEC
>    #define LINK_SPEC "-m elf32_sparc %{shared:-shared} \
>   diff --git a/gcc/config/sparc/linux64.h b/gcc/config/sparc/linux64.h
> -index 789d1df4bd5..b920c680fb1 100644
> +index a1a0efd8f28..85d1084afc2 100644
>   --- a/gcc/config/sparc/linux64.h
>   +++ b/gcc/config/sparc/linux64.h
>   @@ -84,8 +84,8 @@ along with GCC; see the file COPYING3.  If not see
> @@ -241,6 +241,3 @@ index 789d1df4bd5..b920c680fb1 100644
>    
>    #ifdef SPARC_BI_ARCH
>    
> ---
> -2.25.1
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0012-gcc-Fix-argument-lis=
t-too-long-error.patch b/meta/recipes-devtools/gcc/gcc-10.1/0012-gcc-Fix-ar=
gument-list-too-long-error.patch
> similarity index 85%
> rename from meta/recipes-devtools/gcc/gcc-9.3/0012-gcc-Fix-argument-list=
-too-long-error.patch
> rename to meta/recipes-devtools/gcc/gcc-10.1/0012-gcc-Fix-argument-list-=
too-long-error.patch
> index 9d98878096..40fc8df030 100644
> --- a/meta/recipes-devtools/gcc/gcc-9.3/0012-gcc-Fix-argument-list-too-l=
ong-error.patch
> +++ b/meta/recipes-devtools/gcc/gcc-10.1/0012-gcc-Fix-argument-list-too-=
long-error.patch
> @@ -1,7 +1,7 @@
> -From faa0f712a67005ef0260f95eebe7c7c57a6f8360 Mon Sep 17 00:00:00 2001
> +From 1d7a392b1ca7b01f29d87f46911fead91cda25d3 Mon Sep 17 00:00:00 2001
>   From: Khem Raj <raj.khem@gmail.com>
>   Date: Fri, 29 Mar 2013 09:26:37 +0400
> -Subject: [PATCH 12/39] gcc: Fix argument list too long error.
> +Subject: [PATCH] gcc: Fix argument list too long error.
>  =20
>   There would be an "Argument list too long" error when the
>   build directory is longer than 200, this is caused by:
> @@ -23,10 +23,10 @@ Upstream-Status: Pending
>    1 file changed, 1 insertion(+), 1 deletion(-)
>  =20
>   diff --git a/gcc/Makefile.in b/gcc/Makefile.in
> -index fef6c4c61e3..57cf7804f0a 100644
> +index a67d2cc18d6..480c9366418 100644
>   --- a/gcc/Makefile.in
>   +++ b/gcc/Makefile.in
> -@@ -3538,7 +3538,7 @@ install-plugin: installdirs lang.install-plugin s=
-header-vars install-gengtype
> +@@ -3606,7 +3606,7 @@ install-plugin: installdirs lang.install-plugin s=
-header-vars install-gengtype
>    # We keep the directory structure for files in config or c-family and=
 .def
>    # files. All other files are flattened to a single directory.
>    	$(mkinstalldirs) $(DESTDIR)$(plugin_includedir)
> @@ -35,6 +35,3 @@ index fef6c4c61e3..57cf7804f0a 100644
>    	srcdirstrip=3D`echo "$(srcdir)" | sed 's/[].[^$$\\*|]/\\\\&/g'`; \
>    	for file in $$headers; do \
>    	  if [ -f $$file ] ; then \
> ---
> -2.25.1
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0013-Disable-sdt.patch b/=
meta/recipes-devtools/gcc/gcc-10.1/0013-Disable-sdt.patch
> similarity index 88%
> rename from meta/recipes-devtools/gcc/gcc-9.3/0013-Disable-sdt.patch
> rename to meta/recipes-devtools/gcc/gcc-10.1/0013-Disable-sdt.patch
> index 455858354f..c6fa48653c 100644
> --- a/meta/recipes-devtools/gcc/gcc-9.3/0013-Disable-sdt.patch
> +++ b/meta/recipes-devtools/gcc/gcc-10.1/0013-Disable-sdt.patch
> @@ -1,7 +1,7 @@
> -From 4df5a747265983092afd6fbc5329dd808cc1da3c Mon Sep 17 00:00:00 2001
> +From ee71f764766a6d47fa04905fa30fdcd77a25af73 Mon Sep 17 00:00:00 2001
>   From: Khem Raj <raj.khem@gmail.com>
>   Date: Fri, 29 Mar 2013 09:28:10 +0400
> -Subject: [PATCH 13/39] Disable sdt.
> +Subject: [PATCH] Disable sdt.
>  =20
>   We don't list dtrace in DEPENDS so we shouldn't be depending on this h=
eader.
>   It may or may not exist from preivous builds though. To be determinsti=
c, disable
> @@ -25,10 +25,10 @@ Upstream-Status: Inappropriate [hack]
>    4 files changed, 19 insertions(+), 19 deletions(-)
>  =20
>   diff --git a/gcc/configure b/gcc/configure
> -index ed7931daed3..52f52b0ec86 100755
> +index b26e8fc7fee..6080f86145e 100755
>   --- a/gcc/configure
>   +++ b/gcc/configure
> -@@ -29333,12 +29333,12 @@ fi
> +@@ -29789,12 +29789,12 @@ fi
>    { $as_echo "$as_me:${as_lineno-$LINENO}: checking sys/sdt.h in the ta=
rget C library" >&5
>    $as_echo_n "checking sys/sdt.h in the target C library... " >&6; }
>    have_sys_sdt_h=3Dno
> @@ -48,10 +48,10 @@ index ed7931daed3..52f52b0ec86 100755
>    $as_echo "$have_sys_sdt_h" >&6; }
>    
>   diff --git a/gcc/configure.ac b/gcc/configure.ac
> -index e0500e30d50..242ad28ec83 100644
> +index 26fa46802c7..42be5252778 100644
>   --- a/gcc/configure.ac
>   +++ b/gcc/configure.ac
> -@@ -5995,15 +5995,15 @@ fi
> +@@ -6190,15 +6190,15 @@ fi
>    AC_SUBST([enable_default_ssp])
>    
>    # Test for <sys/sdt.h> on the target.
> @@ -77,10 +77,10 @@ index e0500e30d50..242ad28ec83 100644
>    # Check if TFmode long double should be used by default or not.
>    # Some glibc targets used DFmode long double, but with glibc 2.4
>   diff --git a/libstdc++-v3/configure b/libstdc++-v3/configure
> -index 1225edc596b..3b89b880fc8 100755
> +index 9f9c5a2419a..71ed13b815b 100755
>   --- a/libstdc++-v3/configure
>   +++ b/libstdc++-v3/configure
> -@@ -22325,11 +22325,11 @@ ac_compile=3D'$CC -c $CFLAGS $CPPFLAGS confte=
st.$ac_ext >&5'
> +@@ -22615,11 +22615,11 @@ ac_compile=3D'$CC -c $CFLAGS $CPPFLAGS confte=
st.$ac_ext >&5'
>    ac_link=3D'$CC -o conftest$ac_exeext $CFLAGS $CPPFLAGS $LDFLAGS conft=
est.$ac_ext $LIBS >&5'
>    ac_compiler_gnu=3D$ac_cv_c_compiler_gnu
>    
> @@ -96,10 +96,10 @@ index 1225edc596b..3b89b880fc8 100755
>    $as_echo "$glibcxx_cv_sys_sdt_h" >&6; }
>    
>   diff --git a/libstdc++-v3/configure.ac b/libstdc++-v3/configure.ac
> -index d8455e41574..844cf1acbce 100644
> +index 699e55fd829..5c7a7bda439 100644
>   --- a/libstdc++-v3/configure.ac
>   +++ b/libstdc++-v3/configure.ac
> -@@ -232,7 +232,7 @@ GLIBCXX_CHECK_SC_NPROCESSORS_ONLN
> +@@ -241,7 +241,7 @@ GLIBCXX_CHECK_SC_NPROCESSORS_ONLN
>    GLIBCXX_CHECK_SC_NPROC_ONLN
>    GLIBCXX_CHECK_PTHREADS_NUM_PROCESSORS_NP
>    GLIBCXX_CHECK_SYSCTL_HW_NCPU
> @@ -108,6 +108,3 @@ index d8455e41574..844cf1acbce 100644
>    
>    # Check for available headers.
>    AC_CHECK_HEADERS([endian.h execinfo.h float.h fp.h ieeefp.h inttypes.=
h \
> ---
> -2.25.1
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0014-libtool.patch b/meta=
/recipes-devtools/gcc/gcc-10.1/0014-libtool.patch
> similarity index 87%
> rename from meta/recipes-devtools/gcc/gcc-9.3/0014-libtool.patch
> rename to meta/recipes-devtools/gcc/gcc-10.1/0014-libtool.patch
> index 2953859238..6602edcc22 100644
> --- a/meta/recipes-devtools/gcc/gcc-9.3/0014-libtool.patch
> +++ b/meta/recipes-devtools/gcc/gcc-10.1/0014-libtool.patch
> @@ -1,7 +1,7 @@
> -From 34977d994666a90983c96a9240dfa3540562da35 Mon Sep 17 00:00:00 2001
> +From 60c5681918db0cfad0072db14a50ec94caf034ed Mon Sep 17 00:00:00 2001
>   From: Khem Raj <raj.khem@gmail.com>
>   Date: Fri, 29 Mar 2013 09:29:11 +0400
> -Subject: [PATCH 14/39] libtool
> +Subject: [PATCH] libtool
>  =20
>   libstdc++ from gcc-runtime gets created with -rpath=3D/usr/lib/../lib =
for qemux86-64
>   when running on am x86_64 build host.
> @@ -23,7 +23,7 @@ Upstream-Status: Pending
>    1 file changed, 4 insertions(+)
>  =20
>   diff --git a/ltmain.sh b/ltmain.sh
> -index 79f9ba89af5..8e222f7c16b 100644
> +index 70990740b6c..ee938056bef 100644
>   --- a/ltmain.sh
>   +++ b/ltmain.sh
>   @@ -6359,6 +6359,10 @@ func_mode_link ()
> @@ -37,6 +37,3 @@ index 79f9ba89af5..8e222f7c16b 100644
>    
>          oldlibs=3D
>          if test -z "$rpath"; then
> ---
> -2.25.1
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0015-gcc-armv4-pass-fix-v=
4bx-to-linker-to-support-EABI.patch b/meta/recipes-devtools/gcc/gcc-10.1/00=
15-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
> similarity index 87%
> rename from meta/recipes-devtools/gcc/gcc-9.3/0015-gcc-armv4-pass-fix-v4=
bx-to-linker-to-support-EABI.patch
> rename to meta/recipes-devtools/gcc/gcc-10.1/0015-gcc-armv4-pass-fix-v4b=
x-to-linker-to-support-EABI.patch
> index d4445244e2..02e34346b1 100644
> --- a/meta/recipes-devtools/gcc/gcc-9.3/0015-gcc-armv4-pass-fix-v4bx-to-=
linker-to-support-EABI.patch
> +++ b/meta/recipes-devtools/gcc/gcc-10.1/0015-gcc-armv4-pass-fix-v4bx-to=
-linker-to-support-EABI.patch
> @@ -1,7 +1,7 @@
> -From 4558ba7fa020c111f9a204021a418c0ce55d77f9 Mon Sep 17 00:00:00 2001
> +From df02c640cb526179817eaa7c90b89989e54aa5d7 Mon Sep 17 00:00:00 2001
>   From: Khem Raj <raj.khem@gmail.com>
>   Date: Fri, 29 Mar 2013 09:30:32 +0400
> -Subject: [PATCH 15/39] gcc: armv4: pass fix-v4bx to linker to support E=
ABI.
> +Subject: [PATCH] gcc: armv4: pass fix-v4bx to linker to support EABI.
>  =20
>   The LINK_SPEC for linux gets overwritten by linux-eabi.h which
>   means the value of TARGET_FIX_V4BX_SPEC gets lost and as a result
> @@ -19,12 +19,12 @@ Upstream-Status: Pending
>    1 file changed, 5 insertions(+), 1 deletion(-)
>  =20
>   diff --git a/gcc/config/arm/linux-eabi.h b/gcc/config/arm/linux-eabi.h
> -index e4ade2e2ab0..108863f69d2 100644
> +index 0c0332f317f..7b3769e8459 100644
>   --- a/gcc/config/arm/linux-eabi.h
>   +++ b/gcc/config/arm/linux-eabi.h
>   @@ -91,10 +91,14 @@
>    #define MUSL_DYNAMIC_LINKER \
> -   "/lib/ld-musl-arm" MUSL_DYNAMIC_LINKER_E "%{mfloat-abi=3Dhard:hf}.so=
.1"
> +   "/lib/ld-musl-arm" MUSL_DYNAMIC_LINKER_E "%{mfloat-abi=3Dhard:hf}%{m=
fdpic:-fdpic}.so.1"
>    
>   +/* For armv4 we pass --fix-v4bx to linker to support EABI */
>   +#undef TARGET_FIX_V4BX_SPEC
> @@ -38,6 +38,3 @@ index e4ade2e2ab0..108863f69d2 100644
>      LINUX_OR_ANDROID_LD (LINUX_TARGET_LINK_SPEC,	=09	=09\
>    	=09       LINUX_TARGET_LINK_SPEC " " ANDROID_LINK_SPEC)
>    
> ---
> -2.25.1
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0016-Use-the-multilib-con=
fig-files-from-B-instead-of-usin.patch b/meta/recipes-devtools/gcc/gcc-10.1=
/0016-Use-the-multilib-config-files-from-B-instead-of-usin.patch
> similarity index 81%
> rename from meta/recipes-devtools/gcc/gcc-9.3/0016-Use-the-multilib-conf=
ig-files-from-B-instead-of-usin.patch
> rename to meta/recipes-devtools/gcc/gcc-10.1/0016-Use-the-multilib-confi=
g-files-from-B-instead-of-usin.patch
> index 6f0833ccda..5d8bbbe208 100644
> --- a/meta/recipes-devtools/gcc/gcc-9.3/0016-Use-the-multilib-config-fil=
es-from-B-instead-of-usin.patch
> +++ b/meta/recipes-devtools/gcc/gcc-10.1/0016-Use-the-multilib-config-fi=
les-from-B-instead-of-usin.patch
> @@ -1,8 +1,8 @@
> -From 7effc632d65c2d72bf6fa32a219ec2f82fef9405 Mon Sep 17 00:00:00 2001
> +From 3eb59c29bbb38e8f0ad7d19cf0a55b9d0a88fcb7 Mon Sep 17 00:00:00 2001
>   From: Khem Raj <raj.khem@gmail.com>
>   Date: Fri, 29 Mar 2013 09:33:04 +0400
> -Subject: [PATCH 16/39] Use the multilib config files from ${B} instead =
of
> - using the ones from ${S}
> +Subject: [PATCH] Use the multilib config files from ${B} instead of usi=
ng the
> + ones from ${S}
>  =20
>   Use the multilib config files from ${B} instead of using the ones from=
 ${S}
>   so that the source can be shared between gcc-cross-initial,
> @@ -18,10 +18,10 @@ Upstream-Status: Inappropriate [configuration]
>    2 files changed, 36 insertions(+), 8 deletions(-)
>  =20
>   diff --git a/gcc/configure b/gcc/configure
> -index 52f52b0ec86..a5f208af7cf 100755
> +index 6080f86145e..825a9652329 100755
>   --- a/gcc/configure
>   +++ b/gcc/configure
> -@@ -12322,10 +12322,20 @@ done
> +@@ -12685,10 +12685,20 @@ done
>    tmake_file_=3D
>    for f in ${tmake_file}
>    do
> @@ -44,9 +44,9 @@ index 52f52b0ec86..a5f208af7cf 100755
>   +       ;;
>   +  esac
>    done
> - tmake_file=3D"${tmake_file_}"
> + tmake_file=3D"${tmake_file_}${omp_device_property_tmake_file}"
>    
> -@@ -12336,6 +12346,10 @@ tm_file_list=3D"options.h"
> +@@ -12699,6 +12709,10 @@ tm_file_list=3D"options.h"
>    tm_include_list=3D"options.h insn-constants.h"
>    for f in $tm_file; do
>      case $f in
> @@ -58,10 +58,10 @@ index 52f52b0ec86..a5f208af7cf 100755
>           f=3D`echo $f | sed 's/^..//'`
>           tm_file_list=3D"${tm_file_list} $f"
>   diff --git a/gcc/configure.ac b/gcc/configure.ac
> -index 242ad28ec83..b7a7ead1c02 100644
> +index 42be5252778..6099eb3251f 100644
>   --- a/gcc/configure.ac
>   +++ b/gcc/configure.ac
> -@@ -1948,10 +1948,20 @@ done
> +@@ -2118,10 +2118,20 @@ done
>    tmake_file_=3D
>    for f in ${tmake_file}
>    do
> @@ -84,9 +84,9 @@ index 242ad28ec83..b7a7ead1c02 100644
>   +       ;;
>   +  esac
>    done
> - tmake_file=3D"${tmake_file_}"
> + tmake_file=3D"${tmake_file_}${omp_device_property_tmake_file}"
>    
> -@@ -1962,6 +1972,10 @@ tm_file_list=3D"options.h"
> +@@ -2132,6 +2142,10 @@ tm_file_list=3D"options.h"
>    tm_include_list=3D"options.h insn-constants.h"
>    for f in $tm_file; do
>      case $f in
> @@ -97,6 +97,3 @@ index 242ad28ec83..b7a7ead1c02 100644
>        ./* )
>           f=3D`echo $f | sed 's/^..//'`
>           tm_file_list=3D"${tm_file_list} $f"
> ---
> -2.25.1
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0017-Avoid-using-libdir-f=
rom-.la-which-usually-points-to-.patch b/meta/recipes-devtools/gcc/gcc-10.1=
/0017-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
> similarity index 76%
> rename from meta/recipes-devtools/gcc/gcc-9.3/0017-Avoid-using-libdir-fr=
om-.la-which-usually-points-to-.patch
> rename to meta/recipes-devtools/gcc/gcc-10.1/0017-Avoid-using-libdir-fro=
m-.la-which-usually-points-to-.patch
> index 96da013bf2..f61216745d 100644
> --- a/meta/recipes-devtools/gcc/gcc-9.3/0017-Avoid-using-libdir-from-.la=
-which-usually-points-to-.patch
> +++ b/meta/recipes-devtools/gcc/gcc-10.1/0017-Avoid-using-libdir-from-.l=
a-which-usually-points-to-.patch
> @@ -1,8 +1,8 @@
> -From a2b2bf77621f344a849e55ab179ece8587d19234 Mon Sep 17 00:00:00 2001
> +From bdbd108a1ee05bf867bd4f8c0c341d029fc6044a Mon Sep 17 00:00:00 2001
>   From: Khem Raj <raj.khem@gmail.com>
>   Date: Fri, 20 Feb 2015 09:39:38 +0000
> -Subject: [PATCH 17/39] Avoid using libdir from .la which usually points=
 to a
> - host path
> +Subject: [PATCH] Avoid using libdir from .la which usually points to a =
host
> + path
>  =20
>   Upstream-Status: Inappropriate [embedded specific]
>  =20
> @@ -13,7 +13,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>    1 file changed, 3 insertions(+)
>  =20
>   diff --git a/ltmain.sh b/ltmain.sh
> -index 8e222f7c16b..0a93b4e5c3b 100644
> +index ee938056bef..9ebc7e3d1e0 100644
>   --- a/ltmain.sh
>   +++ b/ltmain.sh
>   @@ -5628,6 +5628,9 @@ func_mode_link ()
> @@ -26,6 +26,3 @@ index 8e222f7c16b..0a93b4e5c3b 100644
>    	    dir=3D"$libdir"
>    	    absdir=3D"$libdir"
>    	  fi
> ---
> -2.25.1
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0018-export-CPP.patch b/m=
eta/recipes-devtools/gcc/gcc-10.1/0018-export-CPP.patch
> similarity index 93%
> rename from meta/recipes-devtools/gcc/gcc-9.3/0018-export-CPP.patch
> rename to meta/recipes-devtools/gcc/gcc-10.1/0018-export-CPP.patch
> index 2385099c25..1faab9cd2e 100644
> --- a/meta/recipes-devtools/gcc/gcc-9.3/0018-export-CPP.patch
> +++ b/meta/recipes-devtools/gcc/gcc-10.1/0018-export-CPP.patch
> @@ -1,7 +1,7 @@
> -From cafb6a621c05c1f238679d52fc026446f38c8af5 Mon Sep 17 00:00:00 2001
> +From 145ffb001cdffcda198f1c6ba98cf8b198f2e52d Mon Sep 17 00:00:00 2001
>   From: Khem Raj <raj.khem@gmail.com>
>   Date: Fri, 20 Feb 2015 09:40:59 +0000
> -Subject: [PATCH 18/39] export CPP
> +Subject: [PATCH] export CPP
>  =20
>   The OE environment sets and exports CPP as being the target gcc. When
>   building gcc-cross-canadian for a mingw targetted sdk, the following c=
an be found
> @@ -37,7 +37,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>    1 file changed, 1 insertion(+)
>  =20
>   diff --git a/Makefile.in b/Makefile.in
> -index 64e091ba71d..255822e3f27 100644
> +index 36e369df6e7..c717903bb13 100644
>   --- a/Makefile.in
>   +++ b/Makefile.in
>   @@ -149,6 +149,7 @@ BUILD_EXPORTS =3D \
> @@ -48,6 +48,3 @@ index 64e091ba71d..255822e3f27 100644
>    	CFLAGS=3D"$(CFLAGS_FOR_BUILD)"; export CFLAGS; \
>    	CONFIG_SHELL=3D"$(SHELL)"; export CONFIG_SHELL; \
>    	CXX=3D"$(CXX_FOR_BUILD)"; export CXX; \
> ---
> -2.25.1
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0019-Ensure-target-gcc-he=
aders-can-be-included.patch b/meta/recipes-devtools/gcc/gcc-10.1/0019-Ensur=
e-target-gcc-headers-can-be-included.patch
> similarity index 88%
> rename from meta/recipes-devtools/gcc/gcc-9.3/0019-Ensure-target-gcc-hea=
ders-can-be-included.patch
> rename to meta/recipes-devtools/gcc/gcc-10.1/0019-Ensure-target-gcc-head=
ers-can-be-included.patch
> index e0129d1f96..ec8510758b 100644
> --- a/meta/recipes-devtools/gcc/gcc-9.3/0019-Ensure-target-gcc-headers-c=
an-be-included.patch
> +++ b/meta/recipes-devtools/gcc/gcc-10.1/0019-Ensure-target-gcc-headers-=
can-be-included.patch
> @@ -1,7 +1,7 @@
> -From 182057b80891edc0e8d46835e2d8bfd28330a55a Mon Sep 17 00:00:00 2001
> +From f770ac2adbc90fe570d60765070403e6882e1a95 Mon Sep 17 00:00:00 2001
>   From: Khem Raj <raj.khem@gmail.com>
>   Date: Fri, 20 Feb 2015 10:25:11 +0000
> -Subject: [PATCH 19/39] Ensure target gcc headers can be included
> +Subject: [PATCH] Ensure target gcc headers can be included
>  =20
>   There are a few headers installed as part of the OpenEmbedded
>   gcc-runtime target (omp.h, ssp/*.h). Being installed from a recipe
> @@ -21,7 +21,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>    2 files changed, 6 insertions(+)
>  =20
>   diff --git a/gcc/Makefile.in b/gcc/Makefile.in
> -index 57cf7804f0a..7772342ad5e 100644
> +index 480c9366418..011c7ac2db6 100644
>   --- a/gcc/Makefile.in
>   +++ b/gcc/Makefile.in
>   @@ -618,6 +618,7 @@ libexecdir =3D @libexecdir@
> @@ -32,7 +32,7 @@ index 57cf7804f0a..7772342ad5e 100644
>    # Directory in which the compiler finds executables
>    libexecsubdir =3D $(libexecdir)/gcc/$(real_target_noncanonical)/$(ver=
sion)$(accel_dir_suffix)
>    # Directory in which all plugin resources are installed
> -@@ -2867,6 +2868,7 @@ CFLAGS-intl.o +=3D -DLOCALEDIR=3D\"$(localedir)\"
> +@@ -2946,6 +2947,7 @@ CFLAGS-intl.o +=3D -DLOCALEDIR=3D\"$(localedir)\"
>    
>    PREPROCESSOR_DEFINES =3D \
>      -DGCC_INCLUDE_DIR=3D\"$(libsubdir)/include\" \
> @@ -41,7 +41,7 @@ index 57cf7804f0a..7772342ad5e 100644
>      -DGPLUSPLUS_INCLUDE_DIR=3D\"$(gcc_gxx_include_dir)\" \
>      -DGPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT=3D$(gcc_gxx_include_dir_add_sys=
root) \
>   diff --git a/gcc/cppdefault.c b/gcc/cppdefault.c
> -index c4796385643..980e2bd47a7 100644
> +index af38cc494ea..2f43b88a0c3 100644
>   --- a/gcc/cppdefault.c
>   +++ b/gcc/cppdefault.c
>   @@ -59,6 +59,10 @@ const struct default_include cpp_include_defaults[]
> @@ -55,6 +55,3 @@ index c4796385643..980e2bd47a7 100644
>    #ifdef LOCAL_INCLUDE_DIR
>        /* /usr/local/include comes before the fixincluded header files. =
 */
>        { LOCAL_INCLUDE_DIR, 0, 0, 1, 1, 2 },
> ---
> -2.25.1
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0021-Don-t-search-host-di=
rectory-during-relink-if-inst_pr.patch b/meta/recipes-devtools/gcc/gcc-10.1=
/0020-Don-t-search-host-directory-during-relink-if-inst_pr.patch
> similarity index 80%
> rename from meta/recipes-devtools/gcc/gcc-9.3/0021-Don-t-search-host-dir=
ectory-during-relink-if-inst_pr.patch
> rename to meta/recipes-devtools/gcc/gcc-10.1/0020-Don-t-search-host-dire=
ctory-during-relink-if-inst_pr.patch
> index e363c7d445..e73ea762a2 100644
> --- a/meta/recipes-devtools/gcc/gcc-9.3/0021-Don-t-search-host-directory=
-during-relink-if-inst_pr.patch
> +++ b/meta/recipes-devtools/gcc/gcc-10.1/0020-Don-t-search-host-director=
y-during-relink-if-inst_pr.patch
> @@ -1,8 +1,8 @@
> -From f3edad81d80dde5d64bf77e6abafda54db10b824 Mon Sep 17 00:00:00 2001
> +From 9b780bac624905904fba9fc5210853d075e87490 Mon Sep 17 00:00:00 2001
>   From: Khem Raj <raj.khem@gmail.com>
>   Date: Tue, 3 Mar 2015 08:21:19 +0000
> -Subject: [PATCH 21/39] Don't search host directory during "relink" if
> - $inst_prefix is provided
> +Subject: [PATCH] Don't search host directory during "relink" if $inst_p=
refix
> + is provided
>  =20
>   http://lists.gnu.org/archive/html/libtool-patches/2011-01/msg00026.htm=
l
>  =20
> @@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>    1 file changed, 3 insertions(+), 2 deletions(-)
>  =20
>   diff --git a/ltmain.sh b/ltmain.sh
> -index 0a93b4e5c3b..6de6ed2f9a0 100644
> +index 9ebc7e3d1e0..7ea79fa8be6 100644
>   --- a/ltmain.sh
>   +++ b/ltmain.sh
>   @@ -6004,12 +6004,13 @@ func_mode_link ()
> @@ -33,6 +33,3 @@ index 0a93b4e5c3b..6de6ed2f9a0 100644
>    	=09    ;;
>    	=09esac
>    	      fi
> ---
> -2.25.1
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0022-Use-SYSTEMLIBS_DIR-r=
eplacement-instead-of-hardcoding.patch b/meta/recipes-devtools/gcc/gcc-10.1=
/0021-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
> similarity index 81%
> rename from meta/recipes-devtools/gcc/gcc-9.3/0022-Use-SYSTEMLIBS_DIR-re=
placement-instead-of-hardcoding.patch
> rename to meta/recipes-devtools/gcc/gcc-10.1/0021-Use-SYSTEMLIBS_DIR-rep=
lacement-instead-of-hardcoding.patch
> index 846c0de5e8..e381579928 100644
> --- a/meta/recipes-devtools/gcc/gcc-9.3/0022-Use-SYSTEMLIBS_DIR-replacem=
ent-instead-of-hardcoding.patch
> +++ b/meta/recipes-devtools/gcc/gcc-10.1/0021-Use-SYSTEMLIBS_DIR-replace=
ment-instead-of-hardcoding.patch
> @@ -1,7 +1,7 @@
> -From b8ea2c2c7d33376f5dd651646c7e822000e47749 Mon Sep 17 00:00:00 2001
> +From 05f392f2cbfe5d4944ca5ba0f73538c661fbdf2a Mon Sep 17 00:00:00 2001
>   From: Khem Raj <raj.khem@gmail.com>
>   Date: Tue, 28 Apr 2015 23:15:27 -0700
> -Subject: [PATCH 22/39] Use SYSTEMLIBS_DIR replacement instead of hardco=
ding
> +Subject: [PATCH] Use SYSTEMLIBS_DIR replacement instead of hardcoding
>    base_libdir
>  =20
>   Upstream-Status: Pending
> @@ -12,7 +12,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>    1 file changed, 1 insertion(+), 1 deletion(-)
>  =20
>   diff --git a/gcc/config/aarch64/aarch64-linux.h b/gcc/config/aarch64/a=
arch64-linux.h
> -index 5e8b34ded03..7e628bf661e 100644
> +index e587e2e9ad6..ddc62895693 100644
>   --- a/gcc/config/aarch64/aarch64-linux.h
>   +++ b/gcc/config/aarch64/aarch64-linux.h
>   @@ -21,7 +21,7 @@
> @@ -24,6 +24,3 @@ index 5e8b34ded03..7e628bf661e 100644
>    
>    #undef MUSL_DYNAMIC_LINKER
>    #define MUSL_DYNAMIC_LINKER "/lib/ld-musl-aarch64%{mbig-endian:_be}%{=
mabi=3Dilp32:_ilp32}.so.1"
> ---
> -2.25.1
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0023-aarch64-Add-support-=
for-musl-ldso.patch b/meta/recipes-devtools/gcc/gcc-10.1/0022-aarch64-Add-s=
upport-for-musl-ldso.patch
> similarity index 83%
> rename from meta/recipes-devtools/gcc/gcc-9.3/0023-aarch64-Add-support-f=
or-musl-ldso.patch
> rename to meta/recipes-devtools/gcc/gcc-10.1/0022-aarch64-Add-support-fo=
r-musl-ldso.patch
> index 102d6fc742..d92d6bc2c5 100644
> --- a/meta/recipes-devtools/gcc/gcc-9.3/0023-aarch64-Add-support-for-mus=
l-ldso.patch
> +++ b/meta/recipes-devtools/gcc/gcc-10.1/0022-aarch64-Add-support-for-mu=
sl-ldso.patch
> @@ -1,7 +1,7 @@
> -From 8645b57e7c0dfd93afee5caeaa534c714f449ba1 Mon Sep 17 00:00:00 2001
> +From bdf408e3e2de44b420365cb7ead2e995fff5d782 Mon Sep 17 00:00:00 2001
>   From: Khem Raj <raj.khem@gmail.com>
>   Date: Tue, 28 Apr 2015 23:18:39 -0700
> -Subject: [PATCH 23/39] aarch64: Add support for musl ldso
> +Subject: [PATCH] aarch64: Add support for musl ldso
>  =20
>   Upstream-Status: Pending
>  =20
> @@ -11,7 +11,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>    1 file changed, 1 insertion(+), 1 deletion(-)
>  =20
>   diff --git a/gcc/config/aarch64/aarch64-linux.h b/gcc/config/aarch64/a=
arch64-linux.h
> -index 7e628bf661e..1717cbe5471 100644
> +index ddc62895693..b301825313a 100644
>   --- a/gcc/config/aarch64/aarch64-linux.h
>   +++ b/gcc/config/aarch64/aarch64-linux.h
>   @@ -24,7 +24,7 @@
> @@ -23,6 +23,3 @@ index 7e628bf661e..1717cbe5471 100644
>    
>    #undef  ASAN_CC1_SPEC
>    #define ASAN_CC1_SPEC "%{%:sanitize(address):-funwind-tables}"
> ---
> -2.25.1
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0024-libcc1-fix-libcc1-s-=
install-path-and-rpath.patch b/meta/recipes-devtools/gcc/gcc-10.1/0023-libc=
c1-fix-libcc1-s-install-path-and-rpath.patch
> similarity index 91%
> rename from meta/recipes-devtools/gcc/gcc-9.3/0024-libcc1-fix-libcc1-s-i=
nstall-path-and-rpath.patch
> rename to meta/recipes-devtools/gcc/gcc-10.1/0023-libcc1-fix-libcc1-s-in=
stall-path-and-rpath.patch
> index 443e0a2ca6..f82eab7af9 100644
> --- a/meta/recipes-devtools/gcc/gcc-9.3/0024-libcc1-fix-libcc1-s-install=
-path-and-rpath.patch
> +++ b/meta/recipes-devtools/gcc/gcc-10.1/0023-libcc1-fix-libcc1-s-instal=
l-path-and-rpath.patch
> @@ -1,7 +1,7 @@
> -From b1666565e4e133ee41f32fa8032165bcb06afe9a Mon Sep 17 00:00:00 2001
> +From 452df78b61553cf881604b996f7beb6ccc344110 Mon Sep 17 00:00:00 2001
>   From: Robert Yang <liezhi.yang@windriver.com>
>   Date: Sun, 5 Jul 2015 20:25:18 -0700
> -Subject: [PATCH 24/39] libcc1: fix libcc1's install path and rpath
> +Subject: [PATCH] libcc1: fix libcc1's install path and rpath
>  =20
>   * Install libcc1.so and libcc1plugin.so into
>     $(libexecdir)/gcc/$(target_noncanonical)/$(gcc_version), as what we
> @@ -20,7 +20,7 @@ Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>    2 files changed, 4 insertions(+), 4 deletions(-)
>  =20
>   diff --git a/libcc1/Makefile.am b/libcc1/Makefile.am
> -index 72c6aead475..42a87740b31 100644
> +index c005b0dad4a..ec31d35b7b9 100644
>   --- a/libcc1/Makefile.am
>   +++ b/libcc1/Makefile.am
>   @@ -37,8 +37,8 @@ libiberty =3D $(if $(wildcard $(libiberty_noasan)),$=
(Wc)$(libiberty_noasan), \
> @@ -49,6 +49,3 @@ index 7104b649026..2103c477468 100644
>    @ENABLE_PLUGIN_TRUE@plugin_LTLIBRARIES =3D libcc1plugin.la libcp1plug=
in.la
>    @ENABLE_PLUGIN_TRUE@cc1lib_LTLIBRARIES =3D libcc1.la
>    shared_source =3D callbacks.cc callbacks.hh connection.cc connection.=
hh \
> ---
> -2.25.1
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0025-handle-sysroot-suppo=
rt-for-nativesdk-gcc.patch b/meta/recipes-devtools/gcc/gcc-10.1/0024-handle=
-sysroot-support-for-nativesdk-gcc.patch
> similarity index 84%
> rename from meta/recipes-devtools/gcc/gcc-9.3/0025-handle-sysroot-suppor=
t-for-nativesdk-gcc.patch
> rename to meta/recipes-devtools/gcc/gcc-10.1/0024-handle-sysroot-support=
-for-nativesdk-gcc.patch
> index 59ac97eaed..3fd14ff7da 100644
> --- a/meta/recipes-devtools/gcc/gcc-9.3/0025-handle-sysroot-support-for-=
nativesdk-gcc.patch
> +++ b/meta/recipes-devtools/gcc/gcc-10.1/0024-handle-sysroot-support-for=
-nativesdk-gcc.patch
> @@ -1,7 +1,7 @@
> -From 7d614a84709d7dc4a2529c3d529e2da8541f9fd4 Mon Sep 17 00:00:00 2001
> +From 1c1069fc86abd39e83183158561cf9af8fa8b541 Mon Sep 17 00:00:00 2001
>   From: Khem Raj <raj.khem@gmail.com>
>   Date: Mon, 7 Dec 2015 23:39:54 +0000
> -Subject: [PATCH 25/39] handle sysroot support for nativesdk-gcc
> +Subject: [PATCH] handle sysroot support for nativesdk-gcc
>  =20
>   Being able to build a nativesdk gcc is useful, particularly in cases
>   where the host compiler may be of an incompatible version (or a 32
> @@ -32,18 +32,33 @@ implementation.)
>  =20
>   Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
>   ---
> - c-family/c-opts.c |    4 +--
> - cppdefault.c      |   63 +++++++++++++++++++++++++++++++++------------=
---------
> - cppdefault.h      |   13 ++++-------
> - gcc.c             |   20 ++++++++++++-----
> - incpath.c         |   12 +++++-----
> - prefix.c          |    4 +--
> - 6 files changed, 68 insertions(+), 48 deletions(-)
> + gcc/c-family/c-opts.c |  4 +--
> + gcc/cppdefault.c      | 63 ++++++++++++++++++++++++++-----------------
> + gcc/cppdefault.h      | 13 ++++-----
> + gcc/gcc.c             | 20 +++++++++-----
> + gcc/incpath.c         | 12 ++++-----
> + gcc/prefix.c          |  6 +++--
> + 6 files changed, 70 insertions(+), 48 deletions(-)
>  =20
> -Index: gcc-9.3.0/gcc/cppdefault.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-9.3.0.orig/gcc/cppdefault.c
> -+++ gcc-9.3.0/gcc/cppdefault.c
> +diff --git a/gcc/c-family/c-opts.c b/gcc/c-family/c-opts.c
> +index 58ba0948e79..806bbcfb7a5 100644
> +--- a/gcc/c-family/c-opts.c
> ++++ b/gcc/c-family/c-opts.c
> +@@ -1409,8 +1409,8 @@ add_prefixed_path (const char *suffix, incpath_ki=
nd chain)
> +   size_t prefix_len, suffix_len;
> +
> +   suffix_len =3D strlen (suffix);
> +-  prefix     =3D iprefix ? iprefix : cpp_GCC_INCLUDE_DIR;
> +-  prefix_len =3D iprefix ? strlen (iprefix) : cpp_GCC_INCLUDE_DIR_len;
> ++  prefix     =3D iprefix ? iprefix : GCC_INCLUDE_DIRVAR;
> ++  prefix_len =3D iprefix ? strlen (iprefix) : strlen(GCC_INCLUDE_DIRVA=
R) - 7;
> +
> +   path =3D (char *) xmalloc (prefix_len + suffix_len + 1);
> +   memcpy (path, prefix, prefix_len);
> +diff --git a/gcc/cppdefault.c b/gcc/cppdefault.c
> +index 2f43b88a0c3..6b6be04686c 100644
> +--- a/gcc/cppdefault.c
> ++++ b/gcc/cppdefault.c
>   @@ -35,6 +35,30 @@
>    # undef CROSS_INCLUDE_DIR
>    #endif
> @@ -75,7 +90,7 @@ Index: gcc-9.3.0/gcc/cppdefault.c
>    const struct default_include cpp_include_defaults[]
>    #ifdef INCLUDE_DEFAULTS
>    =3D INCLUDE_DEFAULTS;
> -@@ -42,38 +66,38 @@ const struct default_include cpp_include
> +@@ -42,38 +66,38 @@ const struct default_include cpp_include_defaults[]
>    =3D {
>    #ifdef GPLUSPLUS_INCLUDE_DIR
>        /* Pick up GNU C++ generic include files.  */
> @@ -123,7 +138,7 @@ Index: gcc-9.3.0/gcc/cppdefault.c
>          /* A multilib suffix needs adding if different multilibs use
>    	 different headers.  */
>    #ifdef SYSROOT_HEADERS_SUFFIX_SPEC
> -@@ -85,33 +109,24 @@ const struct default_include cpp_include
> +@@ -85,33 +109,24 @@ const struct default_include cpp_include_defaults[=
]
>    #endif
>    #ifdef CROSS_INCLUDE_DIR
>        /* One place the target system's headers might be.  */
> @@ -163,10 +178,10 @@ Index: gcc-9.3.0/gcc/cppdefault.c
>    
>    /* This value is set by cpp_relocated at runtime */
>    const char *gcc_exec_prefix;
> -Index: gcc-9.3.0/gcc/cppdefault.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-9.3.0.orig/gcc/cppdefault.h
> -+++ gcc-9.3.0/gcc/cppdefault.h
> +diff --git a/gcc/cppdefault.h b/gcc/cppdefault.h
> +index a681264f75e..5e10a2fa140 100644
> +--- a/gcc/cppdefault.h
> ++++ b/gcc/cppdefault.h
>   @@ -33,7 +33,8 @@
>    
>    struct default_include
> @@ -198,11 +213,11 @@ Index: gcc-9.3.0/gcc/cppdefault.h
>    /* The run-time execution prefix.  This is typically the lib/gcc
>       subdirectory of the actual installation.  */
>    extern const char *gcc_exec_prefix;
> -Index: gcc-9.3.0/gcc/gcc.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-9.3.0.orig/gcc/gcc.c
> -+++ gcc-9.3.0/gcc/gcc.c
> -@@ -253,6 +253,8 @@ FILE *report_times_to_file =3D NULL;
> +diff --git a/gcc/gcc.c b/gcc/gcc.c
> +index c87f603955f..535d5c3bb65 100644
> +--- a/gcc/gcc.c
> ++++ b/gcc/gcc.c
> +@@ -252,6 +252,8 @@ FILE *report_times_to_file =3D NULL;
>    #endif
>    static const char *target_system_root =3D DEFAULT_TARGET_SYSTEM_ROOT;
>    
> @@ -211,7 +226,7 @@ Index: gcc-9.3.0/gcc/gcc.c
>    /* Nonzero means pass the updated target_system_root to the compiler.=
  */
>    
>    static int target_system_root_changed;
> -@@ -527,6 +529,7 @@ or with constant text in a single argume
> +@@ -526,6 +528,7 @@ or with constant text in a single argument.
>     %G     process LIBGCC_SPEC as a spec.
>     %R     Output the concatenation of target_system_root and
>            target_sysroot_suffix.
> @@ -219,7 +234,7 @@ Index: gcc-9.3.0/gcc/gcc.c
>     %S     process STARTFILE_SPEC as a spec.  A capital S is actually us=
ed here.
>     %E     process ENDFILE_SPEC as a spec.  A capital E is actually used=
 here.
>     %C     process CPP_SPEC as a spec.
> -@@ -1500,10 +1503,10 @@ static const char *gcc_libexec_prefix;
> +@@ -1499,10 +1502,10 @@ static const char *gcc_libexec_prefix;
>       gcc_exec_prefix is set because, in that case, we know where the
>       compiler has been installed, and use paths relative to that
>       location instead.  */
> @@ -234,7 +249,7 @@ Index: gcc-9.3.0/gcc/gcc.c
>    
>    /* For native compilers, these are well-known paths containing
>       components that may be provided by the system.  For cross
> -@@ -1511,9 +1514,9 @@ static const char *const standard_startf
> +@@ -1510,9 +1513,9 @@ static const char *const standard_startfile_prefi=
x =3D STANDARD_STARTFILE_PREFIX;
>    static const char *md_exec_prefix =3D MD_EXEC_PREFIX;
>    static const char *md_startfile_prefix =3D MD_STARTFILE_PREFIX;
>    static const char *md_startfile_prefix_1 =3D MD_STARTFILE_PREFIX_1;
> @@ -246,7 +261,7 @@ Index: gcc-9.3.0/gcc/gcc.c
>      =3D STANDARD_STARTFILE_PREFIX_2;
>    
>    /* A relative path to be used in finding the location of tools
> -@@ -5922,6 +5925,11 @@ do_spec_1 (const char *spec, int inswitc
> +@@ -5952,6 +5955,11 @@ do_spec_1 (const char *spec, int inswitch, const=
 char *soft_matched_part)
>    	      }
>    	    break;
>    
> @@ -258,26 +273,11 @@ Index: gcc-9.3.0/gcc/gcc.c
>    	  case 'S':
>    	    value =3D do_spec_1 (startfile_spec, 0, NULL);
>    	    if (value !=3D 0)
> -Index: gcc-9.3.0/gcc/c-family/c-opts.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-9.3.0.orig/gcc/c-family/c-opts.c
> -+++ gcc-9.3.0/gcc/c-family/c-opts.c
> -@@ -1382,8 +1382,8 @@ add_prefixed_path (const char *suffix, i
> -   size_t prefix_len, suffix_len;
> -
> -   suffix_len =3D strlen (suffix);
> --  prefix     =3D iprefix ? iprefix : cpp_GCC_INCLUDE_DIR;
> --  prefix_len =3D iprefix ? strlen (iprefix) : cpp_GCC_INCLUDE_DIR_len;
> -+  prefix     =3D iprefix ? iprefix : GCC_INCLUDE_DIRVAR;
> -+  prefix_len =3D iprefix ? strlen (iprefix) : strlen(GCC_INCLUDE_DIRVA=
R) - 7;
> -
> -   path =3D (char *) xmalloc (prefix_len + suffix_len + 1);
> -   memcpy (path, prefix, prefix_len);
> -Index: gcc-9.3.0/gcc/incpath.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-9.3.0.orig/gcc/incpath.c
> -+++ gcc-9.3.0/gcc/incpath.c
> -@@ -131,7 +131,7 @@ add_standard_paths (const char *sysroot,
> +diff --git a/gcc/incpath.c b/gcc/incpath.c
> +index 9098ab044ab..bfad4ebe382 100644
> +--- a/gcc/incpath.c
> ++++ b/gcc/incpath.c
> +@@ -131,7 +131,7 @@ add_standard_paths (const char *sysroot, const char=
 *iprefix,
>      int relocated =3D cpp_relocated ();
>      size_t len;
>    
> @@ -286,7 +286,7 @@ Index: gcc-9.3.0/gcc/incpath.c
>        {
>          /* Look for directories that start with the standard prefix.
>    	 "Translate" them, i.e. replace /usr/local/lib/gcc... with
> -@@ -145,7 +145,7 @@ add_standard_paths (const char *sysroot,
> +@@ -145,7 +145,7 @@ add_standard_paths (const char *sysroot, const char=
 *iprefix,
>    	=09 now.  */
>    	      if (sysroot && p->add_sysroot)
>    	=09continue;
> @@ -295,7 +295,7 @@ Index: gcc-9.3.0/gcc/incpath.c
>    	=09{
>    	=09  char *str =3D concat (iprefix, p->fname + len, NULL);
>    	=09  if (p->multilib =3D=3D 1 && imultilib)
> -@@ -185,7 +185,7 @@ add_standard_paths (const char *sysroot,
> +@@ -185,7 +185,7 @@ add_standard_paths (const char *sysroot, const char=
 *iprefix,
>    	      free (sysroot_no_trailing_dir_separator);
>    	    }
>    	  else if (!p->add_sysroot && relocated
> @@ -304,7 +304,7 @@ Index: gcc-9.3.0/gcc/incpath.c
>    	    {
>     =09      static const char *relocated_prefix;
>    	      char *ostr;
> -@@ -202,12 +202,12 @@ add_standard_paths (const char *sysroot,
> +@@ -202,12 +202,12 @@ add_standard_paths (const char *sysroot, const ch=
ar *iprefix,
>    	=09  dummy =3D concat (gcc_exec_prefix, "dummy", NULL);
>    	=09  relocated_prefix
>    	=09    =3D make_relative_prefix (dummy,
> @@ -320,11 +320,11 @@ Index: gcc-9.3.0/gcc/incpath.c
>    	=09	     NULL);
>    	      str =3D update_path (ostr, p->component);
>    	      free (ostr);
> -Index: gcc-9.3.0/gcc/prefix.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-9.3.0.orig/gcc/prefix.c
> -+++ gcc-9.3.0/gcc/prefix.c
> -@@ -72,7 +72,9 @@ License along with GCC; see the file COP
> +diff --git a/gcc/prefix.c b/gcc/prefix.c
> +index 1a403e535bd..3257ed3cd3e 100644
> +--- a/gcc/prefix.c
> ++++ b/gcc/prefix.c
> +@@ -72,7 +72,9 @@ License along with GCC; see the file COPYING3.  If no=
t see
>    #include "prefix.h"
>    #include "common/common-target.h"
>    
> diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0026-Search-target-sysroo=
t-gcc-version-specific-dirs-with.patch b/meta/recipes-devtools/gcc/gcc-10.1=
/0025-Search-target-sysroot-gcc-version-specific-dirs-with.patch
> similarity index 90%
> rename from meta/recipes-devtools/gcc/gcc-9.3/0026-Search-target-sysroot=
-gcc-version-specific-dirs-with.patch
> rename to meta/recipes-devtools/gcc/gcc-10.1/0025-Search-target-sysroot-=
gcc-version-specific-dirs-with.patch
> index abfa7516da..d9ed9c134c 100644
> --- a/meta/recipes-devtools/gcc/gcc-9.3/0026-Search-target-sysroot-gcc-v=
ersion-specific-dirs-with.patch
> +++ b/meta/recipes-devtools/gcc/gcc-10.1/0025-Search-target-sysroot-gcc-=
version-specific-dirs-with.patch
> @@ -1,7 +1,7 @@
> -From 6c39a22c3e85d20dee9e2fc2274e95da980de4d0 Mon Sep 17 00:00:00 2001
> +From d84ec3b4661b46899e7ceaedf0436f5b9f14528d Mon Sep 17 00:00:00 2001
>   From: Khem Raj <raj.khem@gmail.com>
>   Date: Mon, 7 Dec 2015 23:41:45 +0000
> -Subject: [PATCH 26/39] Search target sysroot gcc version specific dirs =
with
> +Subject: [PATCH] Search target sysroot gcc version specific dirs with
>    multilib.
>  =20
>   We install the gcc libraries (such as crtbegin.p) into
> @@ -51,10 +51,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>    1 file changed, 28 insertions(+), 1 deletion(-)
>  =20
>   diff --git a/gcc/gcc.c b/gcc/gcc.c
> -index 59fb64f5fd5..3e79da4238c 100644
> +index 535d5c3bb65..04647ae812d 100644
>   --- a/gcc/gcc.c
>   +++ b/gcc/gcc.c
> -@@ -2617,7 +2617,7 @@ for_each_path (const struct path_prefix *paths,
> +@@ -2616,7 +2616,7 @@ for_each_path (const struct path_prefix *paths,
>          if (path =3D=3D NULL)
>    	{
>    	  len =3D paths->max_len + extra_space + 1;
> @@ -63,7 +63,7 @@ index 59fb64f5fd5..3e79da4238c 100644
>    	  path =3D XNEWVEC (char, len);
>    	}
>    
> -@@ -2629,6 +2629,33 @@ for_each_path (const struct path_prefix *paths,
> +@@ -2628,6 +2628,33 @@ for_each_path (const struct path_prefix *paths,
>    	  /* Look first in MACHINE/VERSION subdirectory.  */
>    	  if (!skip_multi_dir)
>    	    {
> @@ -97,6 +97,3 @@ index 59fb64f5fd5..3e79da4238c 100644
>    	      memcpy (path + len, multi_suffix, suffix_len + 1);
>    	      ret =3D callback (path, callback_info);
>    	      if (ret)
> ---
> -2.25.1
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0027-Fix-various-_FOR_BUI=
LD-and-related-variables.patch b/meta/recipes-devtools/gcc/gcc-10.1/0026-Fi=
x-various-_FOR_BUILD-and-related-variables.patch
> similarity index 89%
> rename from meta/recipes-devtools/gcc/gcc-9.3/0027-Fix-various-_FOR_BUIL=
D-and-related-variables.patch
> rename to meta/recipes-devtools/gcc/gcc-10.1/0026-Fix-various-_FOR_BUILD=
-and-related-variables.patch
> index ae8acc7f13..de9b9151d3 100644
> --- a/meta/recipes-devtools/gcc/gcc-9.3/0027-Fix-various-_FOR_BUILD-and-=
related-variables.patch
> +++ b/meta/recipes-devtools/gcc/gcc-10.1/0026-Fix-various-_FOR_BUILD-and=
-related-variables.patch
> @@ -1,7 +1,7 @@
> -From 07db34b16b6c8e3d948b417f2fc052500ffb77d3 Mon Sep 17 00:00:00 2001
> +From bccf2b22c5cc705e35406008686c9b85adf42176 Mon Sep 17 00:00:00 2001
>   From: Khem Raj <raj.khem@gmail.com>
>   Date: Mon, 7 Dec 2015 23:42:45 +0000
> -Subject: [PATCH 27/39] Fix various _FOR_BUILD and related variables
> +Subject: [PATCH] Fix various _FOR_BUILD and related variables
>  =20
>   When doing a FOR_BUILD thing, you have to override CFLAGS with
>   CFLAGS_FOR_BUILD. And if you use C++, you also have to override
> @@ -26,7 +26,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>    5 files changed, 14 insertions(+), 3 deletions(-)
>  =20
>   diff --git a/Makefile.in b/Makefile.in
> -index 255822e3f27..9dc0dff0474 100644
> +index c717903bb13..5abc649868d 100644
>   --- a/Makefile.in
>   +++ b/Makefile.in
>   @@ -152,6 +152,7 @@ BUILD_EXPORTS =3D \
> @@ -55,7 +55,7 @@ index 255822e3f27..9dc0dff0474 100644
>    	ADA_CFLAGS=3D"$(ADA_CFLAGS)"; export ADA_CFLAGS; \
>    	CFLAGS=3D"$(CFLAGS)"; export CFLAGS; \
>    	CONFIG_SHELL=3D"$(SHELL)"; export CONFIG_SHELL; \
> -@@ -775,6 +780,7 @@ BASE_FLAGS_TO_PASS =3D \
> +@@ -776,6 +781,7 @@ BASE_FLAGS_TO_PASS =3D \
>    	"CC_FOR_BUILD=3D$(CC_FOR_BUILD)" \
>    	"CFLAGS_FOR_BUILD=3D$(CFLAGS_FOR_BUILD)" \
>    	"CXX_FOR_BUILD=3D$(CXX_FOR_BUILD)" \
> @@ -64,7 +64,7 @@ index 255822e3f27..9dc0dff0474 100644
>    	"FLEX=3D$(FLEX)" \
>    	"INSTALL=3D$(INSTALL)" \
>   diff --git a/Makefile.tpl b/Makefile.tpl
> -index 41cae58a267..d3f6b79acdc 100644
> +index efed1511750..778beb705b4 100644
>   --- a/Makefile.tpl
>   +++ b/Makefile.tpl
>   @@ -154,6 +154,7 @@ BUILD_EXPORTS =3D \
> @@ -94,7 +94,7 @@ index 41cae58a267..d3f6b79acdc 100644
>    	CFLAGS=3D"$(CFLAGS)"; export CFLAGS; \
>    	CONFIG_SHELL=3D"$(SHELL)"; export CONFIG_SHELL; \
>   diff --git a/gcc/Makefile.in b/gcc/Makefile.in
> -index 7772342ad5e..02fec881b6d 100644
> +index 011c7ac2db6..2f1165f7b5e 100644
>   --- a/gcc/Makefile.in
>   +++ b/gcc/Makefile.in
>   @@ -805,7 +805,7 @@ BUILD_LDFLAGS=3D@BUILD_LDFLAGS@
> @@ -107,10 +107,10 @@ index 7772342ad5e..02fec881b6d 100644
>    # Actual name to use when installing a native compiler.
>    GCC_INSTALL_NAME :=3D $(shell echo gcc|sed '$(program_transform_name)=
')
>   diff --git a/gcc/configure b/gcc/configure
> -index a5f208af7cf..0788b7bf0b5 100755
> +index 825a9652329..ff46cf58960 100755
>   --- a/gcc/configure
>   +++ b/gcc/configure
> -@@ -11966,7 +11966,7 @@ else
> +@@ -12314,7 +12314,7 @@ else
>    	CC=3D"${CC_FOR_BUILD}" CFLAGS=3D"${CFLAGS_FOR_BUILD}" \
>    	CXX=3D"${CXX_FOR_BUILD}" CXXFLAGS=3D"${CXXFLAGS_FOR_BUILD}" \
>    	LD=3D"${LD_FOR_BUILD}" LDFLAGS=3D"${LDFLAGS_FOR_BUILD}" \
> @@ -118,12 +118,12 @@ index a5f208af7cf..0788b7bf0b5 100755
>   +	GMPINC=3D"" CPPFLAGS=3D"${CPPFLAGS_FOR_BUILD} -DGENERATOR_FILE" \
>    	${realsrcdir}/configure \
>    	=09--enable-languages=3D${enable_languages-all} \
> - =09	--target=3D$target_alias --host=3D$build_alias --build=3D$build_al=
ias
> + =09	${enable_obsolete+--enable-obsolete=3D"$enable_obsolete"} \
>   diff --git a/gcc/configure.ac b/gcc/configure.ac
> -index b7a7ead1c02..5ab50fae0f3 100644
> +index 6099eb3251f..b3c345b61dc 100644
>   --- a/gcc/configure.ac
>   +++ b/gcc/configure.ac
> -@@ -1743,7 +1743,7 @@ else
> +@@ -1898,7 +1898,7 @@ else
>    	CC=3D"${CC_FOR_BUILD}" CFLAGS=3D"${CFLAGS_FOR_BUILD}" \
>    	CXX=3D"${CXX_FOR_BUILD}" CXXFLAGS=3D"${CXXFLAGS_FOR_BUILD}" \
>    	LD=3D"${LD_FOR_BUILD}" LDFLAGS=3D"${LDFLAGS_FOR_BUILD}" \
> @@ -131,7 +131,4 @@ index b7a7ead1c02..5ab50fae0f3 100644
>   +	GMPINC=3D"" CPPFLAGS=3D"${CPPFLAGS_FOR_BUILD} -DGENERATOR_FILE" \
>    	${realsrcdir}/configure \
>    	=09--enable-languages=3D${enable_languages-all} \
> - =09	--target=3D$target_alias --host=3D$build_alias --build=3D$build_al=
ias
> ---
> -2.25.1
> -
> + =09	${enable_obsolete+--enable-obsolete=3D"$enable_obsolete"} \
> diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0028-nios2-Define-MUSL_DY=
NAMIC_LINKER.patch b/meta/recipes-devtools/gcc/gcc-10.1/0027-nios2-Define-M=
USL_DYNAMIC_LINKER.patch
> similarity index 79%
> rename from meta/recipes-devtools/gcc/gcc-9.3/0028-nios2-Define-MUSL_DYN=
AMIC_LINKER.patch
> rename to meta/recipes-devtools/gcc/gcc-10.1/0027-nios2-Define-MUSL_DYNA=
MIC_LINKER.patch
> index 52a5d97aef..36094b0f4a 100644
> --- a/meta/recipes-devtools/gcc/gcc-9.3/0028-nios2-Define-MUSL_DYNAMIC_L=
INKER.patch
> +++ b/meta/recipes-devtools/gcc/gcc-10.1/0027-nios2-Define-MUSL_DYNAMIC_=
LINKER.patch
> @@ -1,7 +1,7 @@
> -From 59543e897eb35194fb47288f7762e40a18fff611 Mon Sep 17 00:00:00 2001
> +From 0d043a8a23b6a36bdde61248b6bfbbe751b0e1e7 Mon Sep 17 00:00:00 2001
>   From: Khem Raj <raj.khem@gmail.com>
>   Date: Tue, 2 Feb 2016 10:26:10 -0800
> -Subject: [PATCH 28/39] nios2: Define MUSL_DYNAMIC_LINKER
> +Subject: [PATCH] nios2: Define MUSL_DYNAMIC_LINKER
>  =20
>   Upstream-Status: Pending
>  =20
> @@ -12,7 +12,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>    1 file changed, 1 insertion(+)
>  =20
>   diff --git a/gcc/config/nios2/linux.h b/gcc/config/nios2/linux.h
> -index 698734add35..eeee60ecfea 100644
> +index 4bdcdcca1f0..e7943a9d640 100644
>   --- a/gcc/config/nios2/linux.h
>   +++ b/gcc/config/nios2/linux.h
>   @@ -30,6 +30,7 @@
> @@ -23,6 +23,3 @@ index 698734add35..eeee60ecfea 100644
>    
>    #undef LINK_SPEC
>    #define LINK_SPEC LINK_SPEC_ENDIAN \
> ---
> -2.25.1
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0029-Add-ssp_nonshared-to=
-link-commandline-for-musl-targe.patch b/meta/recipes-devtools/gcc/gcc-10.1=
/0028-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
> similarity index 89%
> rename from meta/recipes-devtools/gcc/gcc-9.3/0029-Add-ssp_nonshared-to-=
link-commandline-for-musl-targe.patch
> rename to meta/recipes-devtools/gcc/gcc-10.1/0028-Add-ssp_nonshared-to-l=
ink-commandline-for-musl-targe.patch
> index bfa7e19dd0..fbfbae2345 100644
> --- a/meta/recipes-devtools/gcc/gcc-9.3/0029-Add-ssp_nonshared-to-link-c=
ommandline-for-musl-targe.patch
> +++ b/meta/recipes-devtools/gcc/gcc-10.1/0028-Add-ssp_nonshared-to-link-=
commandline-for-musl-targe.patch
> @@ -1,7 +1,7 @@
> -From 8df99af0a65ef740bcf2b7dc9a109cc57f15c3aa Mon Sep 17 00:00:00 2001
> +From 9a8ad7d099a077e1dc86b92f391945d3d385ef85 Mon Sep 17 00:00:00 2001
>   From: Khem Raj <raj.khem@gmail.com>
>   Date: Tue, 27 Jun 2017 18:10:54 -0700
> -Subject: [PATCH 29/39] Add ssp_nonshared to link commandline for musl t=
argets
> +Subject: [PATCH] Add ssp_nonshared to link commandline for musl targets
>  =20
>   when -fstack-protector options are enabled we need to
>   link with ssp_shared on musl since it does not provide
> @@ -23,7 +23,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>    3 files changed, 27 insertions(+)
>  =20
>   diff --git a/gcc/config/linux.h b/gcc/config/linux.h
> -index 4b05d8e93d1..0ca117e2ed4 100644
> +index 0c1a8118a26..bdc2a2d0659 100644
>   --- a/gcc/config/linux.h
>   +++ b/gcc/config/linux.h
>   @@ -195,6 +195,13 @@ see the files COPYING3 and COPYING.RUNTIME respec=
tively.  If not, see
> @@ -41,7 +41,7 @@ index 4b05d8e93d1..0ca117e2ed4 100644
>    
>    #if (DEFAULT_LIBC =3D=3D LIBC_UCLIBC) && defined (SINGLE_LIBC) /* uCl=
inux */
>   diff --git a/gcc/config/rs6000/linux.h b/gcc/config/rs6000/linux.h
> -index ffceb32bf65..c82cb2ad05b 100644
> +index b7026fcbee7..dd54d6c393e 100644
>   --- a/gcc/config/rs6000/linux.h
>   +++ b/gcc/config/rs6000/linux.h
>   @@ -94,6 +94,16 @@
> @@ -62,10 +62,10 @@ index ffceb32bf65..c82cb2ad05b 100644
>    #define LINK_OS_LINUX_SPEC LINK_OS_LINUX_EMUL " %{!shared: %{!static:=
 \
>      %{!static-pie: \
>   diff --git a/gcc/config/rs6000/linux64.h b/gcc/config/rs6000/linux64.h
> -index 45a9a7cae59..d1e88a40e82 100644
> +index 967c1c43c63..dc5e4d97975 100644
>   --- a/gcc/config/rs6000/linux64.h
>   +++ b/gcc/config/rs6000/linux64.h
> -@@ -456,6 +456,16 @@ extern int dot_symbols;
> +@@ -452,6 +452,16 @@ extern int dot_symbols;
>    	=09	=09	   " -m elf64ppc")
>    #endif
>    
> @@ -82,6 +82,3 @@ index 45a9a7cae59..d1e88a40e82 100644
>    #define LINK_OS_LINUX_SPEC32 LINK_OS_LINUX_EMUL32 " %{!shared: %{!sta=
tic: \
>      %{!static-pie: \
>        %{rdynamic:-export-dynamic} \
> ---
> -2.25.1
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0031-Link-libgcc-using-LD=
FLAGS-not-just-SHLIB_LDFLAGS.patch b/meta/recipes-devtools/gcc/gcc-10.1/002=
9-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
> similarity index 80%
> rename from meta/recipes-devtools/gcc/gcc-9.3/0031-Link-libgcc-using-LDF=
LAGS-not-just-SHLIB_LDFLAGS.patch
> rename to meta/recipes-devtools/gcc/gcc-10.1/0029-Link-libgcc-using-LDFL=
AGS-not-just-SHLIB_LDFLAGS.patch
> index 60a29fc94d..9262a40ccc 100644
> --- a/meta/recipes-devtools/gcc/gcc-9.3/0031-Link-libgcc-using-LDFLAGS-n=
ot-just-SHLIB_LDFLAGS.patch
> +++ b/meta/recipes-devtools/gcc/gcc-10.1/0029-Link-libgcc-using-LDFLAGS-=
not-just-SHLIB_LDFLAGS.patch
> @@ -1,7 +1,7 @@
> -From 31d008f5573627c6192ce9fcf729f0be464a7cf5 Mon Sep 17 00:00:00 2001
> +From 0f20c29a225e5c5eeff9ac646269ee6b8f2a4c3d Mon Sep 17 00:00:00 2001
>   From: Khem Raj <raj.khem@gmail.com>
>   Date: Wed, 4 May 2016 21:11:34 -0700
> -Subject: [PATCH 31/39] Link libgcc using LDFLAGS, not just SHLIB_LDFLAG=
S
> +Subject: [PATCH] Link libgcc using LDFLAGS, not just SHLIB_LDFLAGS
>  =20
>   Upstream-Status: Pending
>  =20
> @@ -12,7 +12,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>    1 file changed, 1 insertion(+), 1 deletion(-)
>  =20
>   diff --git a/libgcc/config/t-slibgcc b/libgcc/config/t-slibgcc
> -index 099bf23e62f..436b277a79f 100644
> +index c997553447c..330352c2c81 100644
>   --- a/libgcc/config/t-slibgcc
>   +++ b/libgcc/config/t-slibgcc
>   @@ -32,7 +32,7 @@ SHLIB_INSTALL_SOLINK =3D $(LN_S) $(SHLIB_SONAME) \
> @@ -24,6 +24,3 @@ index 099bf23e62f..436b277a79f 100644
>    	-o $(SHLIB_DIR)/$(SHLIB_SONAME).tmp @multilib_flags@ \
>    	$(SHLIB_OBJS) $(SHLIB_LC) && \
>    	rm -f $(SHLIB_DIR)/$(SHLIB_SOLINK) && \
> ---
> -2.25.1
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0033-sync-gcc-stddef.h-wi=
th-musl.patch b/meta/recipes-devtools/gcc/gcc-10.1/0030-sync-gcc-stddef.h-w=
ith-musl.patch
> similarity index 93%
> rename from meta/recipes-devtools/gcc/gcc-9.3/0033-sync-gcc-stddef.h-wit=
h-musl.patch
> rename to meta/recipes-devtools/gcc/gcc-10.1/0030-sync-gcc-stddef.h-with=
-musl.patch
> index f080b0596f..7d2a359c30 100644
> --- a/meta/recipes-devtools/gcc/gcc-9.3/0033-sync-gcc-stddef.h-with-musl=
.patch
> +++ b/meta/recipes-devtools/gcc/gcc-10.1/0030-sync-gcc-stddef.h-with-mus=
l.patch
> @@ -1,7 +1,7 @@
> -From 126e342fb39d7af70c1e5a6df8ffafc8dfc3bf08 Mon Sep 17 00:00:00 2001
> +From 8be698ff1552a872415cfe4e89caea24fc70121f Mon Sep 17 00:00:00 2001
>   From: Khem Raj <raj.khem@gmail.com>
>   Date: Fri, 3 Feb 2017 12:56:00 -0800
> -Subject: [PATCH 33/39] sync gcc stddef.h with musl
> +Subject: [PATCH] sync gcc stddef.h with musl
>  =20
>   musl defines ptrdiff_t size_t and wchar_t
>   so dont define them here if musl is definining them
> @@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>    1 file changed, 9 insertions(+)
>  =20
>   diff --git a/gcc/ginclude/stddef.h b/gcc/ginclude/stddef.h
> -index da692e1c01a..9a00c261adb 100644
> +index 9d67eac4947..6cb5edbedb4 100644
>   --- a/gcc/ginclude/stddef.h
>   +++ b/gcc/ginclude/stddef.h
>   @@ -128,6 +128,7 @@ _TYPE_wchar_t;
> @@ -86,6 +86,3 @@ index da692e1c01a..9a00c261adb 100644
>    #undef	__need_wchar_t
>    #endif /* _STDDEF_H or __need_wchar_t.  */
>    
> ---
> -2.25.1
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0034-fix-segmentation-fau=
lt-in-precompiled-header-generat.patch b/meta/recipes-devtools/gcc/gcc-10.1=
/0031-fix-segmentation-fault-in-precompiled-header-generat.patch
> similarity index 86%
> rename from meta/recipes-devtools/gcc/gcc-9.3/0034-fix-segmentation-faul=
t-in-precompiled-header-generat.patch
> rename to meta/recipes-devtools/gcc/gcc-10.1/0031-fix-segmentation-fault=
-in-precompiled-header-generat.patch
> index 3b7ccb3e3d..487bb553b2 100644
> --- a/meta/recipes-devtools/gcc/gcc-9.3/0034-fix-segmentation-fault-in-p=
recompiled-header-generat.patch
> +++ b/meta/recipes-devtools/gcc/gcc-10.1/0031-fix-segmentation-fault-in-=
precompiled-header-generat.patch
> @@ -1,7 +1,7 @@
> -From d26fa9ededccc7e1ec47ead7f18afc80971483a3 Mon Sep 17 00:00:00 2001
> +From 3c6b6c5fd768f7e2422279ab164c61fbf78c161a Mon Sep 17 00:00:00 2001
>   From: Juro Bystricky <juro.bystricky@intel.com>
>   Date: Mon, 19 Mar 2018 22:31:20 -0700
> -Subject: [PATCH 34/39] fix segmentation fault in precompiled header gen=
eration
> +Subject: [PATCH] fix segmentation fault in precompiled header generatio=
n
>  =20
>   Prevent a segmentation fault which occurs when using incorrect
>   structure trying to access name of some named operators, such as
> @@ -19,10 +19,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>    1 file changed, 21 insertions(+), 5 deletions(-)
>  =20
>   diff --git a/libcpp/lex.c b/libcpp/lex.c
> -index eedfcbb3146..15040a1b1f0 100644
> +index 56ac3a1dd73..73a951148b3 100644
>   --- a/libcpp/lex.c
>   +++ b/libcpp/lex.c
> -@@ -3280,11 +3280,27 @@ cpp_spell_token (cpp_reader *pfile, const cpp_t=
oken *token,
> +@@ -3311,11 +3311,27 @@ cpp_spell_token (cpp_reader *pfile, const cpp_t=
oken *token,
>        spell_ident:
>        case SPELL_IDENT:
>          if (forstring)
> @@ -55,6 +55,3 @@ index eedfcbb3146..15040a1b1f0 100644
>          else
>    	buffer =3D _cpp_spell_ident_ucns (buffer, token->val.node.node);
>          break;
> ---
> -2.25.1
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0035-Fix-for-testsuite-fa=
ilure.patch b/meta/recipes-devtools/gcc/gcc-10.1/0032-Fix-for-testsuite-fai=
lure.patch
> similarity index 98%
> rename from meta/recipes-devtools/gcc/gcc-9.3/0035-Fix-for-testsuite-fai=
lure.patch
> rename to meta/recipes-devtools/gcc/gcc-10.1/0032-Fix-for-testsuite-fail=
ure.patch
> index 5e199fbcfd..da4a54c929 100644
> --- a/meta/recipes-devtools/gcc/gcc-9.3/0035-Fix-for-testsuite-failure.p=
atch
> +++ b/meta/recipes-devtools/gcc/gcc-10.1/0032-Fix-for-testsuite-failure.=
patch
> @@ -1,7 +1,7 @@
> -From fb5bdf8f8527228d587e8af9fc700e5164b3c18c Mon Sep 17 00:00:00 2001
> +From 7ffa170c957a19081638d5d2c01211ab0c796ffe Mon Sep 17 00:00:00 2001
>   From: RAGHUNATH LOLUR <raghunath.lolur@kpit.com>
>   Date: Wed, 6 Dec 2017 22:52:26 -0800
> -Subject: [PATCH 35/39] Fix for testsuite failure
> +Subject: [PATCH] Fix for testsuite failure
>  =20
>   2017-11-16  Raghunath Lolur  <raghunath.lolur@kpit.com>
>  =20
> @@ -220,7 +220,7 @@ index 96006b3e338..4287e4538bf 100644
>    /* This test uses __builtin_trap () instead of e.g. abort,
>       because due to -mpreferred-stack-boundary=3D3 it should not call
>   diff --git a/gcc/testsuite/gcc.target/i386/pr62120.c b/gcc/testsuite/g=
cc.target/i386/pr62120.c
> -index bfb8c4703eb..ed04cf181f3 100644
> +index 28d85d37712..c93266bd4bc 100644
>   --- a/gcc/testsuite/gcc.target/i386/pr62120.c
>   +++ b/gcc/testsuite/gcc.target/i386/pr62120.c
>   @@ -1,5 +1,5 @@
> @@ -253,6 +253,3 @@ index 6cda1534311..26e37f5b8ba 100644
>    #define vector(elcount, type)  \
>    __attribute__((vector_size((elcount)*sizeof(type)))) type
>    
> ---
> -2.25.1
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0036-Re-introduce-spe-com=
mandline-options.patch b/meta/recipes-devtools/gcc/gcc-10.1/0033-Re-introdu=
ce-spe-commandline-options.patch
> similarity index 81%
> rename from meta/recipes-devtools/gcc/gcc-9.3/0036-Re-introduce-spe-comm=
andline-options.patch
> rename to meta/recipes-devtools/gcc/gcc-10.1/0033-Re-introduce-spe-comma=
ndline-options.patch
> index 825e070aa3..ff4410cb3c 100644
> --- a/meta/recipes-devtools/gcc/gcc-9.3/0036-Re-introduce-spe-commandlin=
e-options.patch
> +++ b/meta/recipes-devtools/gcc/gcc-10.1/0033-Re-introduce-spe-commandli=
ne-options.patch
> @@ -1,7 +1,7 @@
> -From dc23cabac6a7b2ca85b02d2a58a8916c98f382e0 Mon Sep 17 00:00:00 2001
> +From 1774145c378bf1f1e402bc984c8f28bc9141c552 Mon Sep 17 00:00:00 2001
>   From: Khem Raj <raj.khem@gmail.com>
>   Date: Wed, 6 Jun 2018 12:10:22 -0700
> -Subject: [PATCH 36/39] Re-introduce spe commandline options
> +Subject: [PATCH] Re-introduce spe commandline options
>  =20
>   This should ensure that we keep accepting
>   spe options
> @@ -14,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>    1 file changed, 12 insertions(+)
>  =20
>   diff --git a/gcc/config/rs6000/rs6000.opt b/gcc/config/rs6000/rs6000.o=
pt
> -index f4b5c91e11f..69869350fce 100644
> +index f95b8279270..0e52d51409d 100644
>   --- a/gcc/config/rs6000/rs6000.opt
>   +++ b/gcc/config/rs6000/rs6000.opt
> -@@ -345,6 +345,18 @@ mdebug=3D
> +@@ -344,6 +344,18 @@ mdebug=3D
>    Target RejectNegative Joined
>    -mdebug=3D	Enable debug output.
>    
> @@ -36,6 +36,3 @@ index f4b5c91e11f..69869350fce 100644
>    mabi=3Daltivec
>    Target RejectNegative Var(rs6000_altivec_abi) Save
>    Use the AltiVec ABI extensions.
> ---
> -2.25.1
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0032-libgcc_s-Use-alias-f=
or-__cpu_indicator_init-instead-.patch b/meta/recipes-devtools/gcc/gcc-10.1=
/0034-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
> similarity index 77%
> rename from meta/recipes-devtools/gcc/gcc-9.3/0032-libgcc_s-Use-alias-fo=
r-__cpu_indicator_init-instead-.patch
> rename to meta/recipes-devtools/gcc/gcc-10.1/0034-libgcc_s-Use-alias-for=
-__cpu_indicator_init-instead-.patch
> index 6f048dab82..ba75ce3560 100644
> --- a/meta/recipes-devtools/gcc/gcc-9.3/0032-libgcc_s-Use-alias-for-__cp=
u_indicator_init-instead-.patch
> +++ b/meta/recipes-devtools/gcc/gcc-10.1/0034-libgcc_s-Use-alias-for-__c=
pu_indicator_init-instead-.patch
> @@ -1,7 +1,7 @@
> -From 761fa6e3e37608cfd1b288e721a2ff89288cd6aa Mon Sep 17 00:00:00 2001
> +From fb1025195693da0bbb8559632ba22f458abecdfb Mon Sep 17 00:00:00 2001
>   From: Szabolcs Nagy <nsz@port70.net>
>   Date: Sat, 24 Oct 2015 20:09:53 +0000
> -Subject: [PATCH 32/39] libgcc_s: Use alias for __cpu_indicator_init ins=
tead of
> +Subject: [PATCH] libgcc_s: Use alias for __cpu_indicator_init instead o=
f
>    symver
>  =20
>   Adapter from
> @@ -26,23 +26,23 @@ gcc/Changelog:
>  =20
>   2015-05-11  Szabolcs Nagy  <szabolcs.nagy@arm.com>
>  =20
> -	* config/i386/i386.c (ix86_expand_builtin): Make __builtin_cpu_init
> +	* config/i386/i386-expand.c (ix86_expand_builtin): Make __builtin_cpu_=
init
>   =09call __cpu_indicator_init_local instead of __cpu_indicator_init.
>  =20
>   Upstream-Status: Pending
>  =20
>   Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   ---
> - gcc/config/i386/i386.c       | 4 ++--
> - libgcc/config/i386/cpuinfo.c | 6 +++---
> - libgcc/config/i386/t-linux   | 2 +-
> + gcc/config/i386/i386-expand.c | 4 ++--
> + libgcc/config/i386/cpuinfo.c  | 6 +++---
> + libgcc/config/i386/t-linux    | 2 +-
>    3 files changed, 6 insertions(+), 6 deletions(-)
>  =20
> -diff --git a/gcc/config/i386/i386.c b/gcc/config/i386/i386.c
> -index 1bca5a7eea6..096c4bc8e25 100644
> ---- a/gcc/config/i386/i386.c
> -+++ b/gcc/config/i386/i386.c
> -@@ -36685,10 +36685,10 @@ ix86_expand_builtin (tree exp, rtx target, rt=
x subtarget,
> +diff --git a/gcc/config/i386/i386-expand.c b/gcc/config/i386/i386-expan=
d.c
> +index 48f00c5fcfc..468f5f71fac 100644
> +--- a/gcc/config/i386/i386-expand.c
> ++++ b/gcc/config/i386/i386-expand.c
> +@@ -10941,10 +10941,10 @@ ix86_expand_builtin (tree exp, rtx target, rt=
x subtarget,
>        {
>        case IX86_BUILTIN_CPU_INIT:
>          {
> @@ -56,10 +56,10 @@ index 1bca5a7eea6..096c4bc8e25 100644
>    	return expand_expr (call_expr, target, mode, EXPAND_NORMAL);
>          }
>   diff --git a/libgcc/config/i386/cpuinfo.c b/libgcc/config/i386/cpuinfo=
.c
> -index d6cb2de6265..ce04ef78205 100644
> +index 00322c58622..f42bbb8af98 100644
>   --- a/libgcc/config/i386/cpuinfo.c
>   +++ b/libgcc/config/i386/cpuinfo.c
> -@@ -504,7 +504,7 @@ __cpu_indicator_init (void)
> +@@ -508,7 +508,7 @@ __cpu_indicator_init (void)
>      return 0;
>    }
>    
> @@ -81,6 +81,3 @@ index 8506a635790..564296f788e 100644
>   -HOST_LIBGCC2_CFLAGS +=3D -mlong-double-80 -DUSE_ELF_SYMVER $(CET_FLAG=
S)
>   +HOST_LIBGCC2_CFLAGS +=3D -mlong-double-80 $(CET_FLAGS)
>    CRTSTUFF_T_CFLAGS +=3D $(CET_FLAGS)
> ---
> -2.25.1
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0038-gentypes-genmodes-Do=
-not-use-__LINE__-for-maintainin.patch b/meta/recipes-devtools/gcc/gcc-10.1=
/0035-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch
> similarity index 80%
> rename from meta/recipes-devtools/gcc/gcc-9.3/0038-gentypes-genmodes-Do-=
not-use-__LINE__-for-maintainin.patch
> rename to meta/recipes-devtools/gcc/gcc-10.1/0035-gentypes-genmodes-Do-n=
ot-use-__LINE__-for-maintainin.patch
> index a79fc03d15..65b469c94a 100644
> --- a/meta/recipes-devtools/gcc/gcc-9.3/0038-gentypes-genmodes-Do-not-us=
e-__LINE__-for-maintainin.patch
> +++ b/meta/recipes-devtools/gcc/gcc-10.1/0035-gentypes-genmodes-Do-not-u=
se-__LINE__-for-maintainin.patch
> @@ -1,7 +1,7 @@
> -From 075e0929e04913538391052c32178b6a14ef0ae3 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Thu, 12 Mar 2020 14:41:40 -0700
> -Subject: [PATCH 38/39] gentypes/genmodes: Do not use __LINE__ for maint=
aining
> +From 8a9d79b105484ec9c71971e194cd9a8b6b0f099e Mon Sep 17 00:00:00 2001
> +From: Richard Purdie <richard.purdie@linuxfoundation.org>
> +Date: Tue, 10 Mar 2020 08:26:53 -0700
> +Subject: [PATCH] gentypes/genmodes: Do not use __LINE__ for maintaining
>    reproducibility
>  =20
>   Inserting line numbers into generated code means its not always reprod=
ucible wth
> @@ -17,7 +17,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>    2 files changed, 19 insertions(+), 19 deletions(-)
>  =20
>   diff --git a/gcc/gengtype.c b/gcc/gengtype.c
> -index 53317337cf8..bbb26151671 100644
> +index 981577481af..d5700fff401 100644
>   --- a/gcc/gengtype.c
>   +++ b/gcc/gengtype.c
>   @@ -991,7 +991,7 @@ create_field_at (pair_p next, type_p type, const c=
har *name, options_p opt,
> @@ -38,7 +38,7 @@ index 53317337cf8..bbb26151671 100644
>    
>    /* Reverse a linked list of 'struct pair's in place.  */
>    pair_p
> -@@ -5186,7 +5186,7 @@ main (int argc, char **argv)
> +@@ -5187,7 +5187,7 @@ main (int argc, char **argv)
>          /* These types are set up with #define or else outside of where
>             we can see them.  We should initialize them before calling
>             read_input_list.  */
> @@ -48,10 +48,10 @@ index 53317337cf8..bbb26151671 100644
>          POS_HERE (do_scalar_typedef ("CUMULATIVE_ARGS", &pos));
>          POS_HERE (do_scalar_typedef ("REAL_VALUE_TYPE", &pos));
>   diff --git a/gcc/genmodes.c b/gcc/genmodes.c
> -index f33eefa2494..07bef9eebe2 100644
> +index bd78310ea24..dbd02c51a4c 100644
>   --- a/gcc/genmodes.c
>   +++ b/gcc/genmodes.c
> -@@ -429,7 +429,7 @@ complete_all_modes (void)
> +@@ -430,7 +430,7 @@ complete_all_modes (void)
>    }
>    
>    /* For each mode in class CLASS, construct a corresponding complex mo=
de.  */
> @@ -60,16 +60,16 @@ index f33eefa2494..07bef9eebe2 100644
>    static void
>    make_complex_modes (enum mode_class cl,
>    	=09    const char *file, unsigned int line)
> -@@ -487,7 +487,7 @@ make_complex_modes (enum mode_class cl,
> - /* For all modes in class CL, construct vector modes of width
> -    WIDTH, having as many components as necessary.  */
> - #define VECTOR_MODES_WITH_PREFIX(PREFIX, C, W) \
> --  make_vector_modes (MODE_##C, #PREFIX, W, __FILE__, __LINE__)
> -+  make_vector_modes (MODE_##C, #PREFIX, W, __FILE__, 0)
> - #define VECTOR_MODES(C, W) VECTOR_MODES_WITH_PREFIX (V, C, W)
> +@@ -489,7 +489,7 @@ make_complex_modes (enum mode_class cl,
> +    having as many components as necessary.  ORDER is the sorting order
> +    of the mode, with smaller numbers indicating a higher priority.  */
> + #define VECTOR_MODES_WITH_PREFIX(PREFIX, C, W, ORDER) \
> +-  make_vector_modes (MODE_##C, #PREFIX, W, ORDER, __FILE__, __LINE__)
> ++  make_vector_modes (MODE_##C, #PREFIX, W, ORDER, __FILE__, 0)
> + #define VECTOR_MODES(C, W) VECTOR_MODES_WITH_PREFIX (V, C, W, 0)
>    static void ATTRIBUTE_UNUSED
>    make_vector_modes (enum mode_class cl, const char *prefix, unsigned i=
nt width,
> -@@ -538,7 +538,7 @@ make_vector_modes (enum mode_class cl, const char *=
prefix, unsigned int width,
> +@@ -541,7 +541,7 @@ make_vector_modes (enum mode_class cl, const char *=
prefix, unsigned int width,
>    /* Create a vector of booleans called NAME with COUNT elements and
>       BYTESIZE bytes in total.  */
>    #define VECTOR_BOOL_MODE(NAME, COUNT, BYTESIZE) \
> @@ -78,7 +78,7 @@ index f33eefa2494..07bef9eebe2 100644
>    static void ATTRIBUTE_UNUSED
>    make_vector_bool_mode (const char *name, unsigned int count,
>    	=09       unsigned int bytesize, const char *file,
> -@@ -560,7 +560,7 @@ make_vector_bool_mode (const char *name, unsigned i=
nt count,
> +@@ -563,7 +563,7 @@ make_vector_bool_mode (const char *name, unsigned i=
nt count,
>    /* Input.  */
>    
>    #define _SPECIAL_MODE(C, N) \
> @@ -87,7 +87,7 @@ index f33eefa2494..07bef9eebe2 100644
>    #define RANDOM_MODE(N) _SPECIAL_MODE (RANDOM, N)
>    #define CC_MODE(N) _SPECIAL_MODE (CC, N)
>    
> -@@ -573,7 +573,7 @@ make_special_mode (enum mode_class cl, const char *=
name,
> +@@ -576,7 +576,7 @@ make_special_mode (enum mode_class cl, const char *=
name,
>    
>    #define INT_MODE(N, Y) FRACTIONAL_INT_MODE (N, -1U, Y)
>    #define FRACTIONAL_INT_MODE(N, B, Y) \
> @@ -96,7 +96,7 @@ index f33eefa2494..07bef9eebe2 100644
>    
>    static void
>    make_int_mode (const char *name,
> -@@ -586,16 +586,16 @@ make_int_mode (const char *name,
> +@@ -589,16 +589,16 @@ make_int_mode (const char *name,
>    }
>    
>    #define FRACT_MODE(N, Y, F) \
> @@ -117,7 +117,7 @@ index f33eefa2494..07bef9eebe2 100644
>    
>    /* Create a fixed-point mode by setting CL, NAME, BYTESIZE, IBIT, FBI=
T,
>       FILE, and LINE.  */
> -@@ -616,7 +616,7 @@ make_fixed_point_mode (enum mode_class cl,
> +@@ -619,7 +619,7 @@ make_fixed_point_mode (enum mode_class cl,
>    
>    #define FLOAT_MODE(N, Y, F)             FRACTIONAL_FLOAT_MODE (N, -1U=
, Y, F)
>    #define FRACTIONAL_FLOAT_MODE(N, B, Y, F) \
> @@ -126,7 +126,7 @@ index f33eefa2494..07bef9eebe2 100644
>    
>    static void
>    make_float_mode (const char *name,
> -@@ -633,7 +633,7 @@ make_float_mode (const char *name,
> +@@ -636,7 +636,7 @@ make_float_mode (const char *name,
>    #define DECIMAL_FLOAT_MODE(N, Y, F)	\
>    	FRACTIONAL_DECIMAL_FLOAT_MODE (N, -1U, Y, F)
>    #define FRACTIONAL_DECIMAL_FLOAT_MODE(N, B, Y, F)	\
> @@ -135,7 +135,7 @@ index f33eefa2494..07bef9eebe2 100644
>    
>    static void
>    make_decimal_float_mode (const char *name,
> -@@ -648,7 +648,7 @@ make_decimal_float_mode (const char *name,
> +@@ -651,7 +651,7 @@ make_decimal_float_mode (const char *name,
>    }
>    
>    #define RESET_FLOAT_FORMAT(N, F) \
> @@ -144,7 +144,7 @@ index f33eefa2494..07bef9eebe2 100644
>    static void ATTRIBUTE_UNUSED
>    reset_float_format (const char *name, const char *format,
>    	=09    const char *file, unsigned int line)
> -@@ -669,7 +669,7 @@ reset_float_format (const char *name, const char *f=
ormat,
> +@@ -672,7 +672,7 @@ reset_float_format (const char *name, const char *f=
ormat,
>    
>    /* __intN support.  */
>    #define INT_N(M,PREC)	=09	=09\
> @@ -153,7 +153,7 @@ index f33eefa2494..07bef9eebe2 100644
>    static void ATTRIBUTE_UNUSED
>    make_int_n (const char *m, int bitsize,
>                const char *file, unsigned int line)
> -@@ -698,7 +698,7 @@ make_int_n (const char *m, int bitsize,
> +@@ -701,7 +701,7 @@ make_int_n (const char *m, int bitsize,
>    /* Partial integer modes are specified by relation to a full integer
>       mode.  */
>    #define PARTIAL_INT_MODE(M,PREC,NAME)	=09	=09\
> @@ -162,7 +162,7 @@ index f33eefa2494..07bef9eebe2 100644
>    static void ATTRIBUTE_UNUSED
>    make_partial_integer_mode (const char *base, const char *name,
>    	=09	   unsigned int precision,
> -@@ -725,7 +725,7 @@ make_partial_integer_mode (const char *base, const =
char *name,
> +@@ -728,7 +728,7 @@ make_partial_integer_mode (const char *base, const =
char *name,
>    /* A single vector mode can be specified by naming its component
>       mode and the number of components.  */
>    #define VECTOR_MODE(C, M, N) \
> @@ -171,7 +171,7 @@ index f33eefa2494..07bef9eebe2 100644
>    static void ATTRIBUTE_UNUSED
>    make_vector_mode (enum mode_class bclass,
>    	=09  const char *base,
> -@@ -768,7 +768,7 @@ make_vector_mode (enum mode_class bclass,
> +@@ -771,7 +771,7 @@ make_vector_mode (enum mode_class bclass,
>    
>    /* Adjustability.  */
>    #define _ADD_ADJUST(A, M, X, C1, C2) \
> @@ -180,6 +180,3 @@ index f33eefa2494..07bef9eebe2 100644
>    
>    #define ADJUST_NUNITS(M, X)    _ADD_ADJUST (nunits, M, X, RANDOM, RAN=
DOM)
>    #define ADJUST_BYTESIZE(M, X)  _ADD_ADJUST (bytesize, M, X, RANDOM, R=
ANDOM)
> ---
> -2.25.1
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-10.1/0036-Enable-CET-in-cross=
-compiler-if-possible.patch b/meta/recipes-devtools/gcc/gcc-10.1/0036-Enabl=
e-CET-in-cross-compiler-if-possible.patch
> new file mode 100644
> index 0000000000..8183fe733e
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-10.1/0036-Enable-CET-in-cross-compil=
er-if-possible.patch
> @@ -0,0 +1,150 @@
> +From f9a395da5cf37c00246d6ecc28aa07da5243ad54 Mon Sep 17 00:00:00 2001
> +From: "H.J. Lu" <hjl.tools@gmail.com>
> +Date: Fri, 8 May 2020 06:11:05 -0700
> +Subject: [PATCH] Enable CET in cross compiler if possible
> +
> +Don't perform CET run-time check for host when cross compiling.  Instea=
d,
> +enable CET in cross compiler if possible so that it will run on both CE=
T
> +and non-CET hosts.
> +
> +config/
> +
> +	PR bootstrap/94998
> +	* cet.m4 (GCC_CET_HOST_FLAGS): Enable CET in cross compiler if
> +	possible.
> +
> +libiberty/
> +
> +	PR bootstrap/94998
> +	* configure: Regenerated.
> +
> +lto-plugin/
> +
> +	PR bootstrap/94998
> +	* configure: Regenerated.
> +
> +Upstream-Status: Submitted [https://patchwork.ozlabs.org/project/gcc/pa=
tch/20200508131105.170077-1-hjl.tools@gmail.com/]
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + config/cet.m4        | 18 ++++++++++++------
> + libiberty/configure  | 12 +++++++++---
> + lto-plugin/configure | 16 +++++++++++-----
> + 3 files changed, 32 insertions(+), 14 deletions(-)
> +
> +diff --git a/config/cet.m4 b/config/cet.m4
> +index ea616b728a9..d9608699cd5 100644
> +--- a/config/cet.m4
> ++++ b/config/cet.m4
> +@@ -111,7 +111,8 @@ if test x$may_have_cet =3D xyes; then
> + fi
> +
> + if test x$may_have_cet =3D xyes; then
> +-  AC_TRY_RUN([
> ++  if test x$cross_compiling =3D xno; then
> ++    AC_TRY_RUN([
> + static void
> + foo (void)
> + {
> +@@ -137,12 +138,17 @@ main ()
> +   bar ();
> +   return 0;
> + }
> +-  ],
> +-  [have_cet=3Dno],
> +-  [have_cet=3Dyes])
> +-  if test x$enable_cet =3D xno -a x$have_cet =3D xyes; then
> +-    AC_MSG_ERROR([Intel CET must be enabled on Intel CET enabled host]=
)
> ++    ],
> ++    [have_cet=3Dno],
> ++    [have_cet=3Dyes])
> ++    if test x$enable_cet =3D xno -a x$have_cet =3D xyes; then
> ++      AC_MSG_ERROR([Intel CET must be enabled on Intel CET enabled hos=
t])
> ++    fi
> +   fi
> ++else
> ++  # Enable CET in cross compiler if possible so that it will run on bo=
th
> ++  # CET and non-CET hosts.
> ++  have_cet=3Dyes
> + fi
> + if test x$enable_cet =3D xyes; then
> +   $1=3D"-fcf-protection"
> +diff --git a/libiberty/configure b/libiberty/configure
> +index bb76cf1b823..3f82c5bb865 100755
> +--- a/libiberty/configure
> ++++ b/libiberty/configure
> +@@ -5375,7 +5375,8 @@ rm -f core conftest.err conftest.$ac_objext \
> + fi
> +
> + if test x$may_have_cet =3D xyes; then
> +-  if test "$cross_compiling" =3D yes; then :
> ++  if test x$cross_compiling =3D xno; then
> ++    if test "$cross_compiling" =3D yes; then :
> +   { { $as_echo "$as_me:${as_lineno-$LINENO}: error: in \`$ac_pwd':" >&=
5
> + $as_echo "$as_me: error: in \`$ac_pwd':" >&2;}
> + as_fn_error $? "cannot run test program while cross compiling
> +@@ -5420,9 +5421,14 @@ rm -f core *.core core.conftest.* gmon.out bb.ou=
t conftest$ac_exeext \
> +   conftest.$ac_objext conftest.beam conftest.$ac_ext
> + fi
> +
> +-  if test x$enable_cet =3D xno -a x$have_cet =3D xyes; then
> +-    as_fn_error $? "Intel CET must be enabled on Intel CET enabled hos=
t" "$LINENO" 5
> ++    if test x$enable_cet =3D xno -a x$have_cet =3D xyes; then
> ++      as_fn_error $? "Intel CET must be enabled on Intel CET enabled h=
ost" "$LINENO" 5
> ++    fi
> +   fi
> ++else
> ++  # Enable CET in cross compiler if possible so that it will run on bo=
th
> ++  # CET and non-CET hosts.
> ++  have_cet=3Dyes
> + fi
> + if test x$enable_cet =3D xyes; then
> +   CET_HOST_FLAGS=3D"-fcf-protection"
> +diff --git a/lto-plugin/configure b/lto-plugin/configure
> +index 1baf6cc70b8..36c6ecc5875 100755
> +--- a/lto-plugin/configure
> ++++ b/lto-plugin/configure
> +@@ -5768,7 +5768,8 @@ rm -f core conftest.err conftest.$ac_objext \
> + fi
> +
> + if test x$may_have_cet =3D xyes; then
> +-  if test "$cross_compiling" =3D yes; then :
> ++  if test x$cross_compiling =3D xno; then
> ++    if test "$cross_compiling" =3D yes; then :
> +   { { $as_echo "$as_me:${as_lineno-$LINENO}: error: in \`$ac_pwd':" >&=
5
> + $as_echo "$as_me: error: in \`$ac_pwd':" >&2;}
> + as_fn_error $? "cannot run test program while cross compiling
> +@@ -5813,9 +5814,14 @@ rm -f core *.core core.conftest.* gmon.out bb.ou=
t conftest$ac_exeext \
> +   conftest.$ac_objext conftest.beam conftest.$ac_ext
> + fi
> +
> +-  if test x$enable_cet =3D xno -a x$have_cet =3D xyes; then
> +-    as_fn_error $? "Intel CET must be enabled on Intel CET enabled hos=
t" "$LINENO" 5
> ++    if test x$enable_cet =3D xno -a x$have_cet =3D xyes; then
> ++      as_fn_error $? "Intel CET must be enabled on Intel CET enabled h=
ost" "$LINENO" 5
> ++    fi
> +   fi
> ++else
> ++  # Enable CET in cross compiler if possible so that it will run on bo=
th
> ++  # CET and non-CET hosts.
> ++  have_cet=3Dyes
> + fi
> + if test x$enable_cet =3D xyes; then
> +   CET_HOST_FLAGS=3D"-fcf-protection"
> +@@ -11941,7 +11947,7 @@ else
> +   lt_dlunknown=3D0; lt_dlno_uscore=3D1; lt_dlneed_uscore=3D2
> +   lt_status=3D$lt_dlunknown
> +   cat > conftest.$ac_ext <<_LT_EOF
> +-#line 11944 "configure"
> ++#line 11950 "configure"
> + #include "confdefs.h"
> +
> + #if HAVE_DLFCN_H
> +@@ -12047,7 +12053,7 @@ else
> +   lt_dlunknown=3D0; lt_dlno_uscore=3D1; lt_dlneed_uscore=3D2
> +   lt_status=3D$lt_dlunknown
> +   cat > conftest.$ac_ext <<_LT_EOF
> +-#line 12050 "configure"
> ++#line 12056 "configure"
> + #include "confdefs.h"
> +
> + #if HAVE_DLFCN_H
> diff --git a/meta/recipes-devtools/gcc/gcc-10.1/0037-libstdc-v3-Include-=
system_error-for-std-errc.patch b/meta/recipes-devtools/gcc/gcc-10.1/0037-l=
ibstdc-v3-Include-system_error-for-std-errc.patch
> new file mode 100644
> index 0000000000..54f37006ba
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-10.1/0037-libstdc-v3-Include-system_=
error-for-std-errc.patch
> @@ -0,0 +1,23 @@
> +From d20764eaca1029c61c79f0f3ed2c3823b0cb2e92 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Mon, 11 May 2020 07:59:01 -0700
> +Subject: [PATCH] libstdc++-v3: Include system_error for std::errc
> +
> +Upstream-Status: Pending
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + libstdc++-v3/src/filesystem/ops.cc | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/libstdc++-v3/src/filesystem/ops.cc b/libstdc++-v3/src/file=
system/ops.cc
> +index 29ea9c0ce87..f7291271f1e 100644
> +--- a/libstdc++-v3/src/filesystem/ops.cc
> ++++ b/libstdc++-v3/src/filesystem/ops.cc
> +@@ -33,6 +33,7 @@
> + #include <functional>
> + #include <ostream>
> + #include <stack>
> ++#include <system_error>
> + #include <ext/stdio_filebuf.h>
> + #include <stdlib.h>
> + #include <stdio.h>
> diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0020-gcc-4.8-won-t-build-=
with-disable-dependency-tracking.patch b/meta/recipes-devtools/gcc/gcc-9.3/=
0020-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
> deleted file mode 100644
> index 1d2182140f..0000000000
> --- a/meta/recipes-devtools/gcc/gcc-9.3/0020-gcc-4.8-won-t-build-with-di=
sable-dependency-tracking.patch
> +++ /dev/null
> @@ -1,54 +0,0 @@
> -From a4740f1290e6a602fbbfa27b863be2e3b2675685 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 20 Feb 2015 11:17:19 +0000
> -Subject: [PATCH 20/39] gcc 4.8+ won't build with --disable-dependency-t=
racking
> -
> -since the *.Ppo files don't get created unless --enable-dependency-trac=
king is true.
> -
> -This patch ensures we only use those compiler options when its enabled.
> -
> -Upstream-Status: Submitted
> -
> -(Problem was already reported upstream, attached this patch there
> -http://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D55930)
> -
> -RP
> -2012/09/22
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - libatomic/Makefile.am | 3 ++-
> - libatomic/Makefile.in | 3 ++-
> - 2 files changed, 4 insertions(+), 2 deletions(-)
> -
> -diff --git a/libatomic/Makefile.am b/libatomic/Makefile.am
> -index c1b7c73934a..ef43d62c07a 100644
> ---- a/libatomic/Makefile.am
> -+++ b/libatomic/Makefile.am
> -@@ -101,7 +101,8 @@ PAT_S	=09=3D $(word 3,$(PAT_SPLIT))
> - IFUNC_DEF	=3D -DIFUNC_ALT=3D$(PAT_S)
> - IFUNC_OPT	=3D $(word $(PAT_S),$(IFUNC_OPTIONS))
> -
> --M_DEPS	=09=3D -MT $@ -MD -MP -MF $(DEPDIR)/$(@F).Ppo
> -+@AMDEP_TRUE@M_DEPS	=09=3D -MT $@ -MD -MP -MF $(DEPDIR)/$(@F).Ppo
> -+@AMDEP_FALSE@M_DEPS	=09=3D
> - M_SIZE	=09=3D -DN=3D$(PAT_N)
> - M_IFUNC	=09=3D $(if $(PAT_S),$(IFUNC_DEF) $(IFUNC_OPT))
> - M_FILE	=09=3D $(PAT_BASE)_n.c
> -diff --git a/libatomic/Makefile.in b/libatomic/Makefile.in
> -index 29324e3e0ac..d5cdb4259ef 100644
> ---- a/libatomic/Makefile.in
> -+++ b/libatomic/Makefile.in
> -@@ -414,7 +414,8 @@ PAT_N =3D $(word 2,$(PAT_SPLIT))
> - PAT_S =3D $(word 3,$(PAT_SPLIT))
> - IFUNC_DEF =3D -DIFUNC_ALT=3D$(PAT_S)
> - IFUNC_OPT =3D $(word $(PAT_S),$(IFUNC_OPTIONS))
> --M_DEPS =3D -MT $@ -MD -MP -MF $(DEPDIR)/$(@F).Ppo
> -+@AMDEP_TRUE@M_DEPS =3D -MT $@ -MD -MP -MF $(DEPDIR)/$(@F).Ppo
> -+@AMDEP_FALSE@M_DEPS =3D
> - M_SIZE =3D -DN=3D$(PAT_N)
> - M_IFUNC =3D $(if $(PAT_S),$(IFUNC_DEF) $(IFUNC_OPT))
> - M_FILE =3D $(PAT_BASE)_n.c
> ---
> -2.25.1
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0030-ldbl128-config.patch=
 b/meta/recipes-devtools/gcc/gcc-9.3/0030-ldbl128-config.patch
> deleted file mode 100644
> index f8e8c07f62..0000000000
> --- a/meta/recipes-devtools/gcc/gcc-9.3/0030-ldbl128-config.patch
> +++ /dev/null
> @@ -1,79 +0,0 @@
> -From 1bfae624b27ea4a1f5c5a92050d741b511e7b3d5 Mon Sep 17 00:00:00 2001
> -From: Szabolcs Nagy <nsz@port70.net>
> -Date: Wed, 28 Feb 2018 00:54:05 +0000
> -Subject: [PATCH 30/39] ldbl128 config
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - gcc/configure    | 13 +++++++++++++
> - gcc/configure.ac | 16 ++++++++++++++--
> - 2 files changed, 27 insertions(+), 2 deletions(-)
> -
> -diff --git a/gcc/configure b/gcc/configure
> -index 0788b7bf0b5..eb1a45bb263 100755
> ---- a/gcc/configure
> -+++ b/gcc/configure
> -@@ -29370,6 +29370,15 @@ if test "${with_long_double_128+set}" =3D set;=
 then :
> -   withval=3D$with_long_double_128; gcc_cv_target_ldbl128=3D"$with_long=
_double_128"
> - else
> -
> -+      case "$target" in
> -+	s390*-*-linux-musl*)
> -+	  gcc_cv_target_ldbl128=3Dyes
> -+	  ;;
> -+	powerpc*-*-linux-musl*)
> -+	  gcc_cv_target_ldbl128=3Dno
> -+	  ;;
> -+	*)
> -+
> - if test $glibc_version_major -gt 2 \
> -   || ( test $glibc_version_major -eq 2 && test $glibc_version_minor -g=
e 4 ); then :
> -   gcc_cv_target_ldbl128=3Dyes
> -@@ -29381,6 +29390,10 @@ else
> -       && gcc_cv_target_ldbl128=3Dyes
> -
> - fi
> -+
> -+	  ;;
> -+      esac
> -+
> - fi
> -
> -     ;;
> -diff --git a/gcc/configure.ac b/gcc/configure.ac
> -index 5ab50fae0f3..7ffe35ee1c3 100644
> ---- a/gcc/configure.ac
> -+++ b/gcc/configure.ac
> -@@ -6030,13 +6030,25 @@ case "$target" in
> -     AC_ARG_WITH(long-double-128,
> -       [AS_HELP_STRING([--with-long-double-128],
> - =09	      [use 128-bit long double by default])],
> --      gcc_cv_target_ldbl128=3D"$with_long_double_128",
> -+      gcc_cv_target_ldbl128=3D"$with_long_double_128", [
> -+      case "$target" in
> -+	s390*-*-linux-musl*)
> -+	  gcc_cv_target_ldbl128=3Dyes
> -+	  ;;
> -+	powerpc*-*-linux-musl*)
> -+	  gcc_cv_target_ldbl128=3Dno
> -+	  ;;
> -+	*)]
> -       [GCC_GLIBC_VERSION_GTE_IFELSE([2], [4], [gcc_cv_target_ldbl128=
=3Dyes], [
> -       [gcc_cv_target_ldbl128=3Dno
> -       grep '^[ =09]*#[ =09]*define[ =09][ =09]*__LONG_DOUBLE_MATH_OPTI=
ONAL' \
> -         $target_header_dir/bits/wordsize.h > /dev/null 2>&1 \
> -       && gcc_cv_target_ldbl128=3Dyes
> --      ]])])
> -+      ]])]
> -+      [
> -+	  ;;
> -+      esac
> -+      ])
> -     ;;
> - esac
> - if test x$gcc_cv_target_ldbl128 =3D xyes; then
> ---
> -2.25.1
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0037-CVE-2019-14250-Check=
-zero-value-in-simple_object_elf.patch b/meta/recipes-devtools/gcc/gcc-9.3/=
0037-CVE-2019-14250-Check-zero-value-in-simple_object_elf.patch
> deleted file mode 100644
> index f268a4eb58..0000000000
> --- a/meta/recipes-devtools/gcc/gcc-9.3/0037-CVE-2019-14250-Check-zero-v=
alue-in-simple_object_elf.patch
> +++ /dev/null
> @@ -1,48 +0,0 @@
> -From ac4af583bd59f6631671ad4abf985799ce4a53d9 Mon Sep 17 00:00:00 2001
> -From: rguenth <rguenth@138bc75d-0d04-0410-961f-82ee72b054a4>
> -Date: Thu, 25 Jul 2019 10:46:54 +0000
> -Subject: [PATCH 37/39] CVE-2019-14250: Check zero value in
> - simple_object_elf_match
> -
> -2019-07-25 Richard Biener <rguenther@suse.de>
> -
> -	PR lto/90924
> -	Backport from mainline
> -	2019-07-12  Ren Kimura  <rkx1209dev@gmail.com>
> -
> -	* simple-object-elf.c (simple_object_elf_match): Check zero value
> -	shstrndx.
> -
> -git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-9-branch@273793 =
138bc75d-0d04-0410-961f-82ee72b054a4
> -
> -Upstream-Status: Backport
> -Affectes: <  9.2
> -CVE: CVE-2019-14250
> -Dropped changelog
> -Signed-off-by: Armin Kuster <Akustre@mvista.com>
> ----
> - libiberty/simple-object-elf.c | 8 ++++++++
> - 1 file changed, 8 insertions(+)
> -
> -diff --git a/libiberty/simple-object-elf.c b/libiberty/simple-object-el=
f.c
> -index 3d49f339631..c00cebdb6c7 100644
> ---- a/libiberty/simple-object-elf.c
> -+++ b/libiberty/simple-object-elf.c
> -@@ -557,6 +557,14 @@ simple_object_elf_match (unsigned char header[SIMP=
LE_OBJECT_MATCH_HEADER_LEN],
> -       return NULL;
> -     }
> -
> -+  if (eor->shstrndx =3D=3D 0)
> -+    {
> -+      *errmsg =3D "invalid ELF shstrndx =3D=3D 0";
> -+      *err =3D 0;
> -+      XDELETE (eor);
> -+      return NULL;
> -+    }
> -+
> -   return (void *) eor;
> - }
> -
> ---
> -2.25.1
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0039-process_alt_operands=
-Don-t-match-user-defined-regs-o.patch b/meta/recipes-devtools/gcc/gcc-9.3/=
0039-process_alt_operands-Don-t-match-user-defined-regs-o.patch
> deleted file mode 100644
> index b69114d1e5..0000000000
> --- a/meta/recipes-devtools/gcc/gcc-9.3/0039-process_alt_operands-Don-t-=
match-user-defined-regs-o.patch
> +++ /dev/null
> @@ -1,100 +0,0 @@
> -From e75bcc2ec4f1e7e081ce18713f0a25913ba15340 Mon Sep 17 00:00:00 2001
> -From: Vladimir Makarov <vmakarov@redhat.com>
> -Date: Wed, 10 Jul 2019 16:07:10 +0000
> -Subject: [PATCH 39/39] process_alt_operands: Don't match user defined r=
egs
> - only if they are early clobbers
> -
> -PR target/91102 (aarch64 ICE on Linux kernel with -Os starting with r27=
0266)
> -
> -2019-07-10  Vladimir Makarov  <vmakarov@redhat.com>
> -
> -	PR target/91102
> -	* lra-constraints.c (process_alt_operands): Don't match user
> -	defined regs only if they are early clobbers.
> -
> -2019-07-10  Vladimir Makarov  <vmakarov@redhat.com>
> -
> -	PR target/91102
> -	* gcc.target/aarch64/pr91102.c: New test.
> -
> -From-SVN: r273357
> -Upstream-Status: Backport [https://github.com/gcc-mirror/gcc/commit/613=
caed2feb9cfc8158308670b59df3d031ec629]
> -[takondra: dropped conflicting ChangeLog changes]
> -Signed-off-by: Taras Kondratiuk <takondra@cisco.com>
> ----
> - gcc/lra-constraints.c                      | 17 ++++++++++----
> - gcc/testsuite/gcc.target/aarch64/pr91102.c | 26 ++++++++++++++++++++++
> - 2 files changed, 39 insertions(+), 4 deletions(-)
> - create mode 100644 gcc/testsuite/gcc.target/aarch64/pr91102.c
> -
> -diff --git a/gcc/lra-constraints.c b/gcc/lra-constraints.c
> -index cf33da8013e..6382dbf852b 100644
> ---- a/gcc/lra-constraints.c
> -+++ b/gcc/lra-constraints.c
> -@@ -2172,8 +2172,9 @@ process_alt_operands (int only_alternative)
> - =09	    else
> - =09	      {
> - =09	=09/* Operands don't match.  If the operands are
> --	=09	   different user defined explicit hard registers,
> --	=09	   then we cannot make them match.  */
> -+	=09	   different user defined explicit hard
> -+	=09	   registers, then we cannot make them match
> -+	=09	   when one is early clobber operand.  */
> - =09	=09if ((REG_P (*curr_id->operand_loc[nop])
> - =09	=09     || SUBREG_P (*curr_id->operand_loc[nop]))
> - =09	=09    && (REG_P (*curr_id->operand_loc[m])
> -@@ -2192,9 +2193,17 @@ process_alt_operands (int only_alternative)
> - =09	=09	&& REG_P (m_reg)
> - =09	=09	&& HARD_REGISTER_P (m_reg)
> - =09	=09	&& REG_USERVAR_P (m_reg))
> --	=09	      break;
> -+	=09	      {
> -+	=09	=09int i;
> -+	=09	=09
> -+	=09	=09for (i =3D 0; i < early_clobbered_regs_num; i++)
> -+	=09	=09  if (m =3D=3D early_clobbered_nops[i])
> -+	=09	=09    break;
> -+	=09	=09if (i < early_clobbered_regs_num
> -+	=09	=09    || early_clobber_p)
> -+	=09	=09  break;
> -+	=09	      }
> - =09	=09  }
> --
> - =09	=09/* Both operands must allow a reload register,
> - =09	=09   otherwise we cannot make them match.  */
> - =09	=09if (curr_alt[m] =3D=3D NO_REGS)
> -diff --git a/gcc/testsuite/gcc.target/aarch64/pr91102.c b/gcc/testsuite=
/gcc.target/aarch64/pr91102.c
> -new file mode 100644
> -index 00000000000..70b99045a48
> ---- /dev/null
> -+++ b/gcc/testsuite/gcc.target/aarch64/pr91102.c
> -@@ -0,0 +1,26 @@
> -+/* PR target/91102 */
> -+/* { dg-do compile } */
> -+/* { dg-options "-O2" } */
> -+
> -+int
> -+foo (long d, long l)
> -+{
> -+  register long e asm ("x1") =3D d;
> -+  register long f asm("x2") =3D l;
> -+  asm ("" : : "r" (e), "r" (f));
> -+  return 3;
> -+}
> -+
> -+struct T { int i; int j; };
> -+union S { long h; struct T t; };
> -+
> -+void
> -+bar (union S b)
> -+{
> -+  while (1)
> -+    {
> -+      union S c =3D b;
> -+      c.t.j++;
> -+      b.h =3D foo (b.h, c.h);
> -+    }
> -+}
> ---
> -2.25.1
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_9.3.bb b/meta/=
recipes-devtools/gcc/gcc-cross-canadian_10.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-cross-canadian_9.3.bb
> rename to meta/recipes-devtools/gcc/gcc-cross-canadian_10.1.bb
> diff --git a/meta/recipes-devtools/gcc/gcc-cross_9.3.bb b/meta/recipes-d=
evtools/gcc/gcc-cross_10.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-cross_9.3.bb
> rename to meta/recipes-devtools/gcc/gcc-cross_10.1.bb
> diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk_9.3.bb b/meta/recipe=
s-devtools/gcc/gcc-crosssdk_10.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-crosssdk_9.3.bb
> rename to meta/recipes-devtools/gcc/gcc-crosssdk_10.1.bb
> diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-de=
vtools/gcc/gcc-runtime.inc
> index d9a4e483cc..38c1672876 100644
> --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
> +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
> @@ -263,6 +263,7 @@ FILES_libgomp-dev =3D "\
>       ${libdir}/libgomp*${SOLIBSDEV} \
>       ${libdir}/libgomp*.la \
>       ${libdir}/libgomp.spec \
> +    ${libdir}/${TARGET_SYS}/${BINV}/include/acc_prof.h \
>       ${libdir}/${TARGET_SYS}/${BINV}/include/omp.h \
>       ${libdir}/${TARGET_SYS}/${BINV}/include/openacc.h \
>   "
> diff --git a/meta/recipes-devtools/gcc/gcc-runtime_9.3.bb b/meta/recipes=
-devtools/gcc/gcc-runtime_10.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-runtime_9.3.bb
> rename to meta/recipes-devtools/gcc/gcc-runtime_10.1.bb
> diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_9.3.bb b/meta/reci=
pes-devtools/gcc/gcc-sanitizers_10.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-sanitizers_9.3.bb
> rename to meta/recipes-devtools/gcc/gcc-sanitizers_10.1.bb
> diff --git a/meta/recipes-devtools/gcc/gcc-source_9.3.bb b/meta/recipes-=
devtools/gcc/gcc-source_10.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-source_9.3.bb
> rename to meta/recipes-devtools/gcc/gcc-source_10.1.bb
> diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-dev=
tools/gcc/gcc-target.inc
> index 6263e81497..1e25dad86b 100644
> --- a/meta/recipes-devtools/gcc/gcc-target.inc
> +++ b/meta/recipes-devtools/gcc/gcc-target.inc
> @@ -42,6 +42,7 @@ PACKAGES =3D "\
>  =20
>   FILES_${PN} =3D "\
>       ${bindir}/${TARGET_PREFIX}gcc* \
> +    ${bindir}/${TARGET_PREFIX}lto* \
>       ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/collect2* \
>       ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/cc1plus \
>       ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/lto* \
> diff --git a/meta/recipes-devtools/gcc/gcc_9.3.bb b/meta/recipes-devtool=
s/gcc/gcc_10.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc_9.3.bb
> rename to meta/recipes-devtools/gcc/gcc_10.1.bb
> diff --git a/meta/recipes-devtools/gcc/libgcc-initial_9.3.bb b/meta/reci=
pes-devtools/gcc/libgcc-initial_10.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/libgcc-initial_9.3.bb
> rename to meta/recipes-devtools/gcc/libgcc-initial_10.1.bb
> diff --git a/meta/recipes-devtools/gcc/libgcc_9.3.bb b/meta/recipes-devt=
ools/gcc/libgcc_10.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/libgcc_9.3.bb
> rename to meta/recipes-devtools/gcc/libgcc_10.1.bb
> diff --git a/meta/recipes-devtools/gcc/libgfortran_9.3.bb b/meta/recipes=
-devtools/gcc/libgfortran_10.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/libgfortran_9.3.bb
> rename to meta/recipes-devtools/gcc/libgfortran_10.1.bb
> diff --git a/meta/recipes-support/icu/icu/filter.json b/meta/recipes-sup=
port/icu/icu/filter.json
> deleted file mode 100644
> index 2c63c08510..0000000000
> --- a/meta/recipes-support/icu/icu/filter.json
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -{
> -}
>
>=20


--=20
Kai Kang
Wind River Linux


--------------45B96BB3D28EAB9EA02D9BAD
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+CiAgPGhlYWQ+CiAgICA8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRl
bnQ9InRleHQvaHRtbDsgY2hhcnNldD1VVEYtOCI+CiAgPC9oZWFkPgogIDxib2R5PgogICAgPGRp
diBjbGFzcz0ibW96LWNpdGUtcHJlZml4Ij5PbiAyMDIwLzUvMTIg5LiK5Y2IMjoyOCwgS2hlbSBS
YWogd3JvdGU6PGJyPgogICAgPC9kaXY+CiAgICA8YmxvY2txdW90ZSB0eXBlPSJjaXRlIgogICAg
ICBjaXRlPSJtaWQ6MjAyMDA1MTExODI4MTIuNDQxNTYxLTEtcmFqLmtoZW1AZ21haWwuY29tIj4K
ICAgICAgPHByZSBjbGFzcz0ibW96LXF1b3RlLXByZSIgd3JhcD0iIj4qIFBhY2thZ2UgbmV3IGdv
bXAgaGVhZGVyIGFjY19wcm9mLmgKKiBQYWNrYWdlIGx0by1kdW1wIHdoaWNoIGlzIGEgbmV3IHRv
b2wgaW4gZ2NjMTAKKiBBbGwgQ2hhbmdlcyBhcmUgaGVyZSBbMV0KKiBQb3J0aW5nIGFwcHMgdG8g
Z2NjIDEwIGhlbHAgaXMgaGVyZSBbMl0KKiBCYWNrcG9ydCBhIHBhdGNoIHRvIGZpeCBDRVQgZXJy
b3JzIG9uIGNyb3NzIGJ1aWxkcwoqIEFkZCBwYXRjaCB0byBmaXggbWluZ3cgbGlic3RkYysrPC9w
cmU+CiAgICA8L2Jsb2NrcXVvdGU+CiAgICA8cD5IaSBLaGVtLDwvcD4KICAgIDxwPkkgZm91bmQg
dGhhdCB0aGUgc2l6ZSBvZiBidWlsZHRvb2xzLWV4dGVuZGVkLXRhcmJhbGwgaW5jcmVhc2VkIGEK
ICAgICAgbG90IGFmdGVyIHRoaXMgY29tbWl0LiBJdCBpbmNyZWFzZXMgZnJvbSA0N01CIHRvIDU0
TUIgd2l0aG91dAogICAgICByZWNpcGUgdXBkYXRlLjwvcD4KICAgIDxwPkFueSB0aG91Z2h0IG9m
IHdoYXQgbWF5IGNhdXNlIHRoYXQgcHJvYmxlbSwgcGxlYXNlPzwvcD4KICAgIDxwPlRoYW5rcy48
YnI+CiAgICA8L3A+CiAgICA8cD5LYWk8YnI+CiAgICA8L3A+CiAgICA8cD48YnI+CiAgICA8L3A+
CiAgICA8cD48YnI+CiAgICA8L3A+CiAgICA8YmxvY2txdW90ZSB0eXBlPSJjaXRlIgogICAgICBj
aXRlPSJtaWQ6MjAyMDA1MTExODI4MTIuNDQxNTYxLTEtcmFqLmtoZW1AZ21haWwuY29tIj4KICAg
ICAgPHByZSBjbGFzcz0ibW96LXF1b3RlLXByZSIgd3JhcD0iIj4KClsxXSA8YSBjbGFzcz0ibW96
LXR4dC1saW5rLWZyZWV0ZXh0IiBocmVmPSJodHRwczovL2djYy5nbnUub3JnL2djYy0xMC9jaGFu
Z2VzLmh0bWwiPmh0dHBzOi8vZ2NjLmdudS5vcmcvZ2NjLTEwL2NoYW5nZXMuaHRtbDwvYT4KWzJd
IDxhIGNsYXNzPSJtb3otdHh0LWxpbmstZnJlZXRleHQiIGhyZWY9Imh0dHBzOi8vZ2NjLmdudS5v
cmcvZ2NjLTEwL3BvcnRpbmdfdG8uaHRtbCI+aHR0cHM6Ly9nY2MuZ251Lm9yZy9nY2MtMTAvcG9y
dGluZ190by5odG1sPC9hPgoKU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPGEgY2xhc3M9Im1vei10
eHQtbGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOnJhai5raGVtQGdtYWlsLmNvbSI+Jmx0O3Jh
ai5raGVtQGdtYWlsLmNvbSZndDs8L2E+Ci0tLQp2MjogQ29ycmVjdCBTUkNfVVJJIGNoZWNrc3Vt
cwp2MzogRHJvcCBpY3UgY2hhbmdlCiAgICBCYWNrcG9ydCBhIHBhdGNoIGZvciBDRVQgY3Jvc3Mg
Y29tcGlsZQoKIG1ldGEvY29uZi9kaXN0cm8vaW5jbHVkZS9tYWludGFpbmVycy5pbmMgICAgICB8
ICAgMiArLQogbWV0YS9jb25mL2Rpc3Ryby9pbmNsdWRlL3RjbW9kZS1kZWZhdWx0LmluYyAgIHwg
ICAyICstCiAuLi4vZ2NjL3tnY2MtOS4zLmluYyA9Jmd0OyBnY2MtMTAuMS5pbmN9ICAgICAgICAg
fCAgNTMgKysrLS0tLQogLi4uMDAwMS1nY2MtNC4zLjEtQVJDSF9GTEFHU19GT1JfVEFSR0VULnBh
dGNoIHwgIDE1ICstCiAuLi4vMDAwMi1nY2MtcG9pc29uLXN5c3RlbS1kaXJlY3Rvcmllcy5wYXRj
aCAgfCAgNDcgKysrLS0tCiAuLi4tZ2NjLTQuMy4zLVNZU1JPT1RfQ0ZMQUdTX0ZPUl9UQVJHRVQu
cGF0Y2ggfCAgMTEgKy0KIC4uLi8wMDA0LTY0LWJpdC1tdWx0aWxpYi1oYWNrLnBhdGNoICAgICAg
ICAgICB8ICAxNSArLQogLi4uLzAwMDUtb3B0aW9uYWwtbGlic3RkYy5wYXRjaCAgICAgICAgICAg
ICAgIHwgIDI5ICsrLS0KIC4uLi8wMDA2LUNPTExFQ1RfR0NDX09QVElPTlMucGF0Y2ggICAgICAg
ICAgICB8ICAxMSArLQogLi4udHMuaC1pbi1CLWluc3RlYWQtb2YtUy1hbmQtdC1vZS1pbi1CLnBh
dGNoIHwgIDIwICstLQogLi4uLzAwMDgtZm9ydHJhbi1jcm9zcy1jb21waWxlLWhhY2sucGF0Y2gg
ICAgIHwgIDE1ICstCiAuLi4vMDAwOS1jcHAtaG9ub3Itc3lzcm9vdC5wYXRjaCAgICAgICAgICAg
ICAgfCAgMTMgKy0KIC4uLi8wMDEwLU1JUFM2NC1EZWZhdWx0LXRvLU42NC1BQkkucGF0Y2ggICAg
ICB8ICAxMSArLQogLi4uQU1JQ19MSU5LRVItYW5kLVVDTElCQ19EWU5BTUlDX0xJTktFLnBhdGNo
IHwgIDMzICsrLS0KIC4uLmdjYy1GaXgtYXJndW1lbnQtbGlzdC10b28tbG9uZy1lcnJvci5wYXRj
aCB8ICAxMSArLQogLi4uLzAwMTMtRGlzYWJsZS1zZHQucGF0Y2ggICAgICAgICAgICAgICAgICAg
IHwgIDIzICsrLQogLi4uL3tnY2MtOS4zID0mZ3Q7IGdjYy0xMC4xfS8wMDE0LWxpYnRvb2wucGF0
Y2ggIHwgICA5ICstCiAuLi5zLWZpeC12NGJ4LXRvLWxpbmtlci10by1zdXBwb3J0LUVBQkkucGF0
Y2ggfCAgMTEgKy0KIC4uLi1jb25maWctZmlsZXMtZnJvbS1CLWluc3RlYWQtb2YtdXNpbi5wYXRj
aCB8ICAyNSArKy0KIC4uLmlyLWZyb20tLmxhLXdoaWNoLXVzdWFsbHktcG9pbnRzLXRvLS5wYXRj
aCB8ICAxMSArLQogLi4uLzAwMTgtZXhwb3J0LUNQUC5wYXRjaCAgICAgICAgICAgICAgICAgICAg
IHwgICA5ICstCiAuLi5lLXRhcmdldC1nY2MtaGVhZGVycy1jYW4tYmUtaW5jbHVkZWQucGF0Y2gg
fCAgMTMgKy0KIC4uLi1kaXJlY3RvcnktZHVyaW5nLXJlbGluay1pZi1pbnN0X3ByLnBhdGNofSB8
ICAxMSArLQogLi4uUi1yZXBsYWNlbWVudC1pbnN0ZWFkLW9mLWhhcmRjb2RpbmcucGF0Y2h9IHwg
ICA5ICstCiAuLi4yLWFhcmNoNjQtQWRkLXN1cHBvcnQtZm9yLW11c2wtbGRzby5wYXRjaH0gfCAg
IDkgKy0KIC4uLmZpeC1saWJjYzEtcy1pbnN0YWxsLXBhdGgtYW5kLXJwYXRoLnBhdGNofSB8ICAg
OSArLQogLi4uZS1zeXNyb290LXN1cHBvcnQtZm9yLW5hdGl2ZXNkay1nY2MucGF0Y2h9IHwgMTEy
ICsrKysrKy0tLS0tLS0KIC4uLnJvb3QtZ2NjLXZlcnNpb24tc3BlY2lmaWMtZGlycy13aXRoLnBh
dGNofSB8ICAxMyArLQogLi4udXMtX0ZPUl9CVUlMRC1hbmQtcmVsYXRlZC12YXJpYWJsZXMucGF0
Y2h9IHwgIDI3ICsrLS0KIC4uLjI3LW5pb3MyLURlZmluZS1NVVNMX0RZTkFNSUNfTElOS0VSLnBh
dGNofSB8ICAgOSArLQogLi4uLXRvLWxpbmstY29tbWFuZGxpbmUtZm9yLW11c2wtdGFyZ2UucGF0
Y2h9IHwgIDE1ICstCiAuLi5zaW5nLUxERkxBR1Mtbm90LWp1c3QtU0hMSUJfTERGTEFHUy5wYXRj
aH0gfCAgIDkgKy0KIC4uLi8wMDMwLXN5bmMtZ2NjLXN0ZGRlZi5oLXdpdGgtbXVzbC5wYXRjaH0g
ICB8ICAgOSArLQogLi4uZmF1bHQtaW4tcHJlY29tcGlsZWQtaGVhZGVyLWdlbmVyYXQucGF0Y2h9
IHwgIDExICstCiAuLi4vMDAzMi1GaXgtZm9yLXRlc3RzdWl0ZS1mYWlsdXJlLnBhdGNofSAgICAg
fCAgIDkgKy0KIC4uLmUtaW50cm9kdWNlLXNwZS1jb21tYW5kbGluZS1vcHRpb25zLnBhdGNofSB8
ICAxMSArLQogLi4ucy1mb3ItX19jcHVfaW5kaWNhdG9yX2luaXQtaW5zdGVhZC0ucGF0Y2h9IHwg
IDI5ICsrLS0KIC4uLi1Eby1ub3QtdXNlLV9fTElORV9fLWZvci1tYWludGFpbmluLnBhdGNofSB8
ICA1NSArKystLS0tCiAuLi5sZS1DRVQtaW4tY3Jvc3MtY29tcGlsZXItaWYtcG9zc2libGUucGF0
Y2ggfCAxNTAgKysrKysrKysrKysrKysrKysrCiAuLi52My1JbmNsdWRlLXN5c3RlbV9lcnJvci1m
b3Itc3RkLWVycmMucGF0Y2ggfCAgMjMgKysrCiAuLi5pbGQtd2l0aC1kaXNhYmxlLWRlcGVuZGVu
Y3ktdHJhY2tpbmcucGF0Y2ggfCAgNTQgLS0tLS0tLQogLi4uL2djYy9nY2MtOS4zLzAwMzAtbGRi
bDEyOC1jb25maWcucGF0Y2ggICAgIHwgIDc5IC0tLS0tLS0tLQogLi4uaGVjay16ZXJvLXZhbHVl
LWluLXNpbXBsZV9vYmplY3RfZWxmLnBhdGNoIHwgIDQ4IC0tLS0tLQogLi4uYW5kcy1Eb24tdC1t
YXRjaC11c2VyLWRlZmluZWQtcmVncy1vLnBhdGNoIHwgMTAwIC0tLS0tLS0tLS0tLQogLi4uZGlh
bl85LjMuYmIgPSZndDsgZ2NjLWNyb3NzLWNhbmFkaWFuXzEwLjEuYmJ9IHwgICAwCiAuLi4ve2dj
Yy1jcm9zc185LjMuYmIgPSZndDsgZ2NjLWNyb3NzXzEwLjEuYmJ9ICAgfCAgIDAKIC4uLmMtY3Jv
c3NzZGtfOS4zLmJiID0mZ3Q7IGdjYy1jcm9zc3Nka18xMC4xLmJifSB8ICAgMAogbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2djYy9nY2MtcnVudGltZS5pbmMgICAgIHwgICAxICsKIC4uLmdjYy1ydW50
aW1lXzkuMy5iYiA9Jmd0OyBnY2MtcnVudGltZV8xMC4xLmJifSB8ICAgMAogLi4ubml0aXplcnNf
OS4zLmJiID0mZ3Q7IGdjYy1zYW5pdGl6ZXJzXzEwLjEuYmJ9IHwgICAwCiAuLi4ve2djYy1zb3Vy
Y2VfOS4zLmJiID0mZ3Q7IGdjYy1zb3VyY2VfMTAuMS5iYn0gfCAgIDAKIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9nY2MvZ2NjLXRhcmdldC5pbmMgICAgICB8ICAgMSArCiAuLi4vZ2NjL3tnY2NfOS4z
LmJiID0mZ3Q7IGdjY18xMC4xLmJifSAgICAgICAgICAgfCAgIDAKIC4uLi1pbml0aWFsXzkuMy5i
YiA9Jmd0OyBsaWJnY2MtaW5pdGlhbF8xMC4xLmJifSB8ICAgMAogLi4uL2djYy97bGliZ2NjXzku
My5iYiA9Jmd0OyBsaWJnY2NfMTAuMS5iYn0gICAgIHwgICAwCiAuLi5saWJnZm9ydHJhbl85LjMu
YmIgPSZndDsgbGliZ2ZvcnRyYW5fMTAuMS5iYn0gfCAgIDAKIG1ldGEvcmVjaXBlcy1zdXBwb3J0
L2ljdS9pY3UvZmlsdGVyLmpzb24gICAgICB8ICAgMiAtCiA1NyBmaWxlcyBjaGFuZ2VkLCA0OTEg
aW5zZXJ0aW9ucygrKSwgNzAzIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0
b29scy9nY2Mve2djYy05LjMuaW5jID0mZ3Q7IGdjYy0xMC4xLmluY30gKDY1JSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL3tnY2MtOS4zID0mZ3Q7IGdjYy0xMC4xfS8wMDAxLWdj
Yy00LjMuMS1BUkNIX0ZMQUdTX0ZPUl9UQVJHRVQucGF0Y2ggKDc5JSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvZ2NjL3tnY2MtOS4zID0mZ3Q7IGdjYy0xMC4xfS8wMDAyLWdjYy1wb2lz
b24tc3lzdGVtLWRpcmVjdG9yaWVzLnBhdGNoICg4NSUpCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2djYy97Z2NjLTkuMyA9Jmd0OyBnY2MtMTAuMX0vMDAwMy1nY2MtNC4zLjMtU1lTUk9P
VF9DRkxBR1NfRk9SX1RBUkdFVC5wYXRjaCAoOTIlKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0
b29scy9nY2Mve2djYy05LjMgPSZndDsgZ2NjLTEwLjF9LzAwMDQtNjQtYml0LW11bHRpbGliLWhh
Y2sucGF0Y2ggKDk1JSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL3tnY2MtOS4z
ID0mZ3Q7IGdjYy0xMC4xfS8wMDA1LW9wdGlvbmFsLWxpYnN0ZGMucGF0Y2ggKDg2JSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL3tnY2MtOS4zID0mZ3Q7IGdjYy0xMC4xfS8wMDA2
LUNPTExFQ1RfR0NDX09QVElPTlMucGF0Y2ggKDgwJSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvZ2NjL3tnY2MtOS4zID0mZ3Q7IGdjYy0xMC4xfS8wMDA3LVVzZS10aGUtZGVmYXVsdHMu
aC1pbi1CLWluc3RlYWQtb2YtUy1hbmQtdC1vZS1pbi1CLnBhdGNoICg4NyUpCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2djYy97Z2NjLTkuMyA9Jmd0OyBnY2MtMTAuMX0vMDAwOC1mb3J0
cmFuLWNyb3NzLWNvbXBpbGUtaGFjay5wYXRjaCAoODElKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9nY2Mve2djYy05LjMgPSZndDsgZ2NjLTEwLjF9LzAwMDktY3BwLWhvbm9yLXN5c3Jv
b3QucGF0Y2ggKDg3JSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL3tnY2MtOS4z
ID0mZ3Q7IGdjYy0xMC4xfS8wMDEwLU1JUFM2NC1EZWZhdWx0LXRvLU42NC1BQkkucGF0Y2ggKDg1
JSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL3tnY2MtOS4zID0mZ3Q7IGdjYy0x
MC4xfS8wMDExLURlZmluZS1HTElCQ19EWU5BTUlDX0xJTktFUi1hbmQtVUNMSUJDX0RZTkFNSUNf
TElOS0UucGF0Y2ggKDkzJSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL3tnY2Mt
OS4zID0mZ3Q7IGdjYy0xMC4xfS8wMDEyLWdjYy1GaXgtYXJndW1lbnQtbGlzdC10b28tbG9uZy1l
cnJvci5wYXRjaCAoODUlKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2Mve2djYy05
LjMgPSZndDsgZ2NjLTEwLjF9LzAwMTMtRGlzYWJsZS1zZHQucGF0Y2ggKDg4JSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL3tnY2MtOS4zID0mZ3Q7IGdjYy0xMC4xfS8wMDE0LWxp
YnRvb2wucGF0Y2ggKDg3JSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL3tnY2Mt
OS4zID0mZ3Q7IGdjYy0xMC4xfS8wMDE1LWdjYy1hcm12NC1wYXNzLWZpeC12NGJ4LXRvLWxpbmtl
ci10by1zdXBwb3J0LUVBQkkucGF0Y2ggKDg3JSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvZ2NjL3tnY2MtOS4zID0mZ3Q7IGdjYy0xMC4xfS8wMDE2LVVzZS10aGUtbXVsdGlsaWItY29u
ZmlnLWZpbGVzLWZyb20tQi1pbnN0ZWFkLW9mLXVzaW4ucGF0Y2ggKDgxJSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvZ2NjL3tnY2MtOS4zID0mZ3Q7IGdjYy0xMC4xfS8wMDE3LUF2b2lk
LXVzaW5nLWxpYmRpci1mcm9tLS5sYS13aGljaC11c3VhbGx5LXBvaW50cy10by0ucGF0Y2ggKDc2
JSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL3tnY2MtOS4zID0mZ3Q7IGdjYy0x
MC4xfS8wMDE4LWV4cG9ydC1DUFAucGF0Y2ggKDkzJSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvZ2NjL3tnY2MtOS4zID0mZ3Q7IGdjYy0xMC4xfS8wMDE5LUVuc3VyZS10YXJnZXQtZ2Nj
LWhlYWRlcnMtY2FuLWJlLWluY2x1ZGVkLnBhdGNoICg4OCUpCiByZW5hbWUgbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2djYy97Z2NjLTkuMy8wMDIxLURvbi10LXNlYXJjaC1ob3N0LWRpcmVjdG9yeS1k
dXJpbmctcmVsaW5rLWlmLWluc3RfcHIucGF0Y2ggPSZndDsgZ2NjLTEwLjEvMDAyMC1Eb24tdC1z
ZWFyY2gtaG9zdC1kaXJlY3RvcnktZHVyaW5nLXJlbGluay1pZi1pbnN0X3ByLnBhdGNofSAoODAl
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2Mve2djYy05LjMvMDAyMi1Vc2UtU1lT
VEVNTElCU19ESVItcmVwbGFjZW1lbnQtaW5zdGVhZC1vZi1oYXJkY29kaW5nLnBhdGNoID0mZ3Q7
IGdjYy0xMC4xLzAwMjEtVXNlLVNZU1RFTUxJQlNfRElSLXJlcGxhY2VtZW50LWluc3RlYWQtb2Yt
aGFyZGNvZGluZy5wYXRjaH0gKDgxJSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2Nj
L3tnY2MtOS4zLzAwMjMtYWFyY2g2NC1BZGQtc3VwcG9ydC1mb3ItbXVzbC1sZHNvLnBhdGNoID0m
Z3Q7IGdjYy0xMC4xLzAwMjItYWFyY2g2NC1BZGQtc3VwcG9ydC1mb3ItbXVzbC1sZHNvLnBhdGNo
fSAoODMlKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2Mve2djYy05LjMvMDAyNC1s
aWJjYzEtZml4LWxpYmNjMS1zLWluc3RhbGwtcGF0aC1hbmQtcnBhdGgucGF0Y2ggPSZndDsgZ2Nj
LTEwLjEvMDAyMy1saWJjYzEtZml4LWxpYmNjMS1zLWluc3RhbGwtcGF0aC1hbmQtcnBhdGgucGF0
Y2h9ICg5MSUpCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2djYy97Z2NjLTkuMy8wMDI1
LWhhbmRsZS1zeXNyb290LXN1cHBvcnQtZm9yLW5hdGl2ZXNkay1nY2MucGF0Y2ggPSZndDsgZ2Nj
LTEwLjEvMDAyNC1oYW5kbGUtc3lzcm9vdC1zdXBwb3J0LWZvci1uYXRpdmVzZGstZ2NjLnBhdGNo
fSAoODQlKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2Mve2djYy05LjMvMDAyNi1T
ZWFyY2gtdGFyZ2V0LXN5c3Jvb3QtZ2NjLXZlcnNpb24tc3BlY2lmaWMtZGlycy13aXRoLnBhdGNo
ID0mZ3Q7IGdjYy0xMC4xLzAwMjUtU2VhcmNoLXRhcmdldC1zeXNyb290LWdjYy12ZXJzaW9uLXNw
ZWNpZmljLWRpcnMtd2l0aC5wYXRjaH0gKDkwJSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvZ2NjL3tnY2MtOS4zLzAwMjctRml4LXZhcmlvdXMtX0ZPUl9CVUlMRC1hbmQtcmVsYXRlZC12
YXJpYWJsZXMucGF0Y2ggPSZndDsgZ2NjLTEwLjEvMDAyNi1GaXgtdmFyaW91cy1fRk9SX0JVSUxE
LWFuZC1yZWxhdGVkLXZhcmlhYmxlcy5wYXRjaH0gKDg5JSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvZ2NjL3tnY2MtOS4zLzAwMjgtbmlvczItRGVmaW5lLU1VU0xfRFlOQU1JQ19MSU5L
RVIucGF0Y2ggPSZndDsgZ2NjLTEwLjEvMDAyNy1uaW9zMi1EZWZpbmUtTVVTTF9EWU5BTUlDX0xJ
TktFUi5wYXRjaH0gKDc5JSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL3tnY2Mt
OS4zLzAwMjktQWRkLXNzcF9ub25zaGFyZWQtdG8tbGluay1jb21tYW5kbGluZS1mb3ItbXVzbC10
YXJnZS5wYXRjaCA9Jmd0OyBnY2MtMTAuMS8wMDI4LUFkZC1zc3Bfbm9uc2hhcmVkLXRvLWxpbmst
Y29tbWFuZGxpbmUtZm9yLW11c2wtdGFyZ2UucGF0Y2h9ICg4OSUpCiByZW5hbWUgbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2djYy97Z2NjLTkuMy8wMDMxLUxpbmstbGliZ2NjLXVzaW5nLUxERkxBR1Mt
bm90LWp1c3QtU0hMSUJfTERGTEFHUy5wYXRjaCA9Jmd0OyBnY2MtMTAuMS8wMDI5LUxpbmstbGli
Z2NjLXVzaW5nLUxERkxBR1Mtbm90LWp1c3QtU0hMSUJfTERGTEFHUy5wYXRjaH0gKDgwJSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL3tnY2MtOS4zLzAwMzMtc3luYy1nY2Mtc3Rk
ZGVmLmgtd2l0aC1tdXNsLnBhdGNoID0mZ3Q7IGdjYy0xMC4xLzAwMzAtc3luYy1nY2Mtc3RkZGVm
Lmgtd2l0aC1tdXNsLnBhdGNofSAoOTMlKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9n
Y2Mve2djYy05LjMvMDAzNC1maXgtc2VnbWVudGF0aW9uLWZhdWx0LWluLXByZWNvbXBpbGVkLWhl
YWRlci1nZW5lcmF0LnBhdGNoID0mZ3Q7IGdjYy0xMC4xLzAwMzEtZml4LXNlZ21lbnRhdGlvbi1m
YXVsdC1pbi1wcmVjb21waWxlZC1oZWFkZXItZ2VuZXJhdC5wYXRjaH0gKDg2JSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL3tnY2MtOS4zLzAwMzUtRml4LWZvci10ZXN0c3VpdGUt
ZmFpbHVyZS5wYXRjaCA9Jmd0OyBnY2MtMTAuMS8wMDMyLUZpeC1mb3ItdGVzdHN1aXRlLWZhaWx1
cmUucGF0Y2h9ICg5OCUpCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2djYy97Z2NjLTku
My8wMDM2LVJlLWludHJvZHVjZS1zcGUtY29tbWFuZGxpbmUtb3B0aW9ucy5wYXRjaCA9Jmd0OyBn
Y2MtMTAuMS8wMDMzLVJlLWludHJvZHVjZS1zcGUtY29tbWFuZGxpbmUtb3B0aW9ucy5wYXRjaH0g
KDgxJSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL3tnY2MtOS4zLzAwMzItbGli
Z2NjX3MtVXNlLWFsaWFzLWZvci1fX2NwdV9pbmRpY2F0b3JfaW5pdC1pbnN0ZWFkLS5wYXRjaCA9
Jmd0OyBnY2MtMTAuMS8wMDM0LWxpYmdjY19zLVVzZS1hbGlhcy1mb3ItX19jcHVfaW5kaWNhdG9y
X2luaXQtaW5zdGVhZC0ucGF0Y2h9ICg3NyUpCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2djYy97Z2NjLTkuMy8wMDM4LWdlbnR5cGVzLWdlbm1vZGVzLURvLW5vdC11c2UtX19MSU5FX18t
Zm9yLW1haW50YWluaW4ucGF0Y2ggPSZndDsgZ2NjLTEwLjEvMDAzNS1nZW50eXBlcy1nZW5tb2Rl
cy1Eby1ub3QtdXNlLV9fTElORV9fLWZvci1tYWludGFpbmluLnBhdGNofSAoODAlKQogY3JlYXRl
IG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2MvZ2NjLTEwLjEvMDAzNi1FbmFi
bGUtQ0VULWluLWNyb3NzLWNvbXBpbGVyLWlmLXBvc3NpYmxlLnBhdGNoCiBjcmVhdGUgbW9kZSAx
MDA2NDQgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2djYy9nY2MtMTAuMS8wMDM3LWxpYnN0ZGMtdjMt
SW5jbHVkZS1zeXN0ZW1fZXJyb3ItZm9yLXN0ZC1lcnJjLnBhdGNoCiBkZWxldGUgbW9kZSAxMDA2
NDQgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2djYy9nY2MtOS4zLzAwMjAtZ2NjLTQuOC13b24tdC1i
dWlsZC13aXRoLWRpc2FibGUtZGVwZW5kZW5jeS10cmFja2luZy5wYXRjaAogZGVsZXRlIG1vZGUg
MTAwNjQ0IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2MvZ2NjLTkuMy8wMDMwLWxkYmwxMjgtY29u
ZmlnLnBhdGNoCiBkZWxldGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2djYy9n
Y2MtOS4zLzAwMzctQ1ZFLTIwMTktMTQyNTAtQ2hlY2stemVyby12YWx1ZS1pbi1zaW1wbGVfb2Jq
ZWN0X2VsZi5wYXRjaAogZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9n
Y2MvZ2NjLTkuMy8wMDM5LXByb2Nlc3NfYWx0X29wZXJhbmRzLURvbi10LW1hdGNoLXVzZXItZGVm
aW5lZC1yZWdzLW8ucGF0Y2gKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL3tnY2Mt
Y3Jvc3MtY2FuYWRpYW5fOS4zLmJiID0mZ3Q7IGdjYy1jcm9zcy1jYW5hZGlhbl8xMC4xLmJifSAo
MTAwJSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL3tnY2MtY3Jvc3NfOS4zLmJi
ID0mZ3Q7IGdjYy1jcm9zc18xMC4xLmJifSAoMTAwJSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvZ2NjL3tnY2MtY3Jvc3NzZGtfOS4zLmJiID0mZ3Q7IGdjYy1jcm9zc3Nka18xMC4xLmJi
fSAoMTAwJSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL3tnY2MtcnVudGltZV85
LjMuYmIgPSZndDsgZ2NjLXJ1bnRpbWVfMTAuMS5iYn0gKDEwMCUpCiByZW5hbWUgbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2djYy97Z2NjLXNhbml0aXplcnNfOS4zLmJiID0mZ3Q7IGdjYy1zYW5pdGl6
ZXJzXzEwLjEuYmJ9ICgxMDAlKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2Mve2dj
Yy1zb3VyY2VfOS4zLmJiID0mZ3Q7IGdjYy1zb3VyY2VfMTAuMS5iYn0gKDEwMCUpCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2djYy97Z2NjXzkuMy5iYiA9Jmd0OyBnY2NfMTAuMS5iYn0g
KDEwMCUpCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2djYy97bGliZ2NjLWluaXRpYWxf
OS4zLmJiID0mZ3Q7IGxpYmdjYy1pbml0aWFsXzEwLjEuYmJ9ICgxMDAlKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9nY2Mve2xpYmdjY185LjMuYmIgPSZndDsgbGliZ2NjXzEwLjEuYmJ9
ICgxMDAlKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2Mve2xpYmdmb3J0cmFuXzku
My5iYiA9Jmd0OyBsaWJnZm9ydHJhbl8xMC4xLmJifSAoMTAwJSkKIGRlbGV0ZSBtb2RlIDEwMDY0
NCBtZXRhL3JlY2lwZXMtc3VwcG9ydC9pY3UvaWN1L2ZpbHRlci5qc29uCgpkaWZmIC0tZ2l0IGEv
bWV0YS9jb25mL2Rpc3Ryby9pbmNsdWRlL21haW50YWluZXJzLmluYyBiL21ldGEvY29uZi9kaXN0
cm8vaW5jbHVkZS9tYWludGFpbmVycy5pbmMKaW5kZXggNmRjNmJhZjlmMC4uZGMyZWMxMzFiMyAx
MDA2NDQKLS0tIGEvbWV0YS9jb25mL2Rpc3Ryby9pbmNsdWRlL21haW50YWluZXJzLmluYworKysg
Yi9tZXRhL2NvbmYvZGlzdHJvL2luY2x1ZGUvbWFpbnRhaW5lcnMuaW5jCkBAIC0xOTMsNyArMTkz
LDcgQEAgUkVDSVBFX01BSU5UQUlORVJfcG4tZ2NjLWNyb3NzLWNhbmFkaWFuLSR7VFJBTlNMQVRF
RF9UQVJHRVRfQVJDSH0gPSAiS2hlbSBSYWogJmx0O3IKIFJFQ0lQRV9NQUlOVEFJTkVSX3BuLWdj
Yy1jcm9zc3Nkay0ke1NES19TWVN9ID0gIktoZW0gUmFqIDxhIGNsYXNzPSJtb3otdHh0LWxpbmst
cmZjMjM5NkUiIGhyZWY9Im1haWx0bzpyYWoua2hlbUBnbWFpbC5jb20iPiZsdDtyYWoua2hlbUBn
bWFpbC5jb20mZ3Q7PC9hPiIKIFJFQ0lQRV9NQUlOVEFJTkVSX3BuLWdjYy1ydW50aW1lID0gIkto
ZW0gUmFqIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzpyYWou
a2hlbUBnbWFpbC5jb20iPiZsdDtyYWoua2hlbUBnbWFpbC5jb20mZ3Q7PC9hPiIKIFJFQ0lQRV9N
QUlOVEFJTkVSX3BuLWdjYy1zYW5pdGl6ZXJzID0gIktoZW0gUmFqIDxhIGNsYXNzPSJtb3otdHh0
LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzpyYWoua2hlbUBnbWFpbC5jb20iPiZsdDtyYWou
a2hlbUBnbWFpbC5jb20mZ3Q7PC9hPiIKLVJFQ0lQRV9NQUlOVEFJTkVSX3BuLWdjYy1zb3VyY2Ut
OS4zLjAgPSAiS2hlbSBSYWogPGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0i
bWFpbHRvOnJhai5raGVtQGdtYWlsLmNvbSI+Jmx0O3Jhai5raGVtQGdtYWlsLmNvbSZndDs8L2E+
IgorUkVDSVBFX01BSU5UQUlORVJfcG4tZ2NjLXNvdXJjZS0xMC4wLjEgPSAiS2hlbSBSYWogPGEg
Y2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOnJhai5raGVtQGdtYWls
LmNvbSI+Jmx0O3Jhai5raGVtQGdtYWlsLmNvbSZndDs8L2E+IgogUkVDSVBFX01BSU5UQUlORVJf
cG4tZ2NvbmYgPSAiUm9zcyBCdXJ0b24gPGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIg
aHJlZj0ibWFpbHRvOnJvc3MuYnVydG9uQGludGVsLmNvbSI+Jmx0O3Jvc3MuYnVydG9uQGludGVs
LmNvbSZndDs8L2E+IgogUkVDSVBFX01BSU5UQUlORVJfcG4tZ2NyID0gIkFsZXhhbmRlciBLYW5h
dmluIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzphbGV4Lmth
bmF2aW5AZ21haWwuY29tIj4mbHQ7YWxleC5rYW5hdmluQGdtYWlsLmNvbSZndDs8L2E+IgogUkVD
SVBFX01BSU5UQUlORVJfcG4tZ2RiID0gIktoZW0gUmFqIDxhIGNsYXNzPSJtb3otdHh0LWxpbmst
cmZjMjM5NkUiIGhyZWY9Im1haWx0bzpyYWoua2hlbUBnbWFpbC5jb20iPiZsdDtyYWoua2hlbUBn
bWFpbC5jb20mZ3Q7PC9hPiIKZGlmZiAtLWdpdCBhL21ldGEvY29uZi9kaXN0cm8vaW5jbHVkZS90
Y21vZGUtZGVmYXVsdC5pbmMgYi9tZXRhL2NvbmYvZGlzdHJvL2luY2x1ZGUvdGNtb2RlLWRlZmF1
bHQuaW5jCmluZGV4IDg0OWJjZjY5MDAuLmFiNDMzMzE0NGIgMTAwNjQ0Ci0tLSBhL21ldGEvY29u
Zi9kaXN0cm8vaW5jbHVkZS90Y21vZGUtZGVmYXVsdC5pbmMKKysrIGIvbWV0YS9jb25mL2Rpc3Ry
by9pbmNsdWRlL3RjbW9kZS1kZWZhdWx0LmluYwpAQCAtMTYsNyArMTYsNyBAQCBQUkVGRVJSRURf
UFJPVklERVJfdmlydHVhbC8ke1NES19QUkVGSVh9Y29tcGlsZXJsaWJzID0gIm5hdGl2ZXNkay1n
Y2MtcnVudGltZSIKICMgRGVmYXVsdCBsaWJjIGNvbmZpZwogUFJFRkVSUkVEX1BST1ZJREVSX3Zp
cnR1YWwvZ2V0dGV4dCA/Pz0gImdldHRleHQiCiAKLUdDQ1ZFUlNJT04gPz0gIjkuJSIKK0dDQ1ZF
UlNJT04gPz0gIjEwLiUiCiBTREtHQ0NWRVJTSU9OID89ICIke0dDQ1ZFUlNJT059IgogQklOVVZF
UlNJT04gPz0gIjIuMzQlIgogR0RCVkVSU0lPTiA/PSAiOS4lIgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2djYy9nY2MtOS4zLmluYyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9n
Y2MvZ2NjLTEwLjEuaW5jCnNpbWlsYXJpdHkgaW5kZXggNjUlCnJlbmFtZSBmcm9tIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9nY2MvZ2NjLTkuMy5pbmMKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0
b29scy9nY2MvZ2NjLTEwLjEuaW5jCmluZGV4IGIwNDExMDc4ZDMuLjRmMzgzOTAwY2YgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2MvZ2NjLTkuMy5pbmMKKysrIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2djYy9nY2MtMTAuMS5pbmMKQEAgLTIsMTMgKzIsMTMgQEAgcmVxdWly
ZSBnY2MtY29tbW9uLmluYwogCiAjIFRoaXJkIGRpZ2l0IGluIFBWIHNob3VsZCBiZSBpbmNyZW1l
bnRlZCBhZnRlciBhIG1pbm9yIHJlbGVhc2UKIAotUFYgPSAiOS4zLjAiCitQViA9ICIxMC4xLjAi
CiAKICMgQklOViBzaG91bGQgYmUgaW5jcmVtZW50ZWQgdG8gYSByZXZpc2lvbiBhZnRlciBhIG1p
bm9yIGdjYyByZWxlYXNlCiAKLUJJTlYgPSAiOS4zLjAiCitCSU5WID0gIjEwLjEuMCIKIAotRklM
RVNFWFRSQVBBVEhTID0uICIke0ZJTEVfRElSTkFNRX0vZ2NjLTkuMzoke0ZJTEVfRElSTkFNRX0v
Z2NjLTkuMy9iYWNrcG9ydDoiCitGSUxFU0VYVFJBUEFUSFMgPS4gIiR7RklMRV9ESVJOQU1FfS9n
Y2MtMTAuMToke0ZJTEVfRElSTkFNRX0vZ2NjLTEwLjEvYmFja3BvcnQ6IgogCiBERVBFTkRTID0r
ICJtcGZyIGdtcCBsaWJtcGMgemxpYiBmbGV4LW5hdGl2ZSIKIE5BVElWRURFUFMgPSAibXBmci1u
YXRpdmUgZ21wLW5hdGl2ZSBsaWJtcGMtbmF0aXZlIHpsaWItbmF0aXZlIGZsZXgtbmF0aXZlIgpA
QCAtMjQsOCArMjQsOCBAQCBMSUNfRklMRVNfQ0hLU1VNID0gIlwKICIKIAogQkFTRVVSSSA/PSAi
JHtHTlVfTUlSUk9SfS9nY2MvZ2NjLSR7UFZ9L2djYy0ke1BWfS50YXIueHoiCi0jUkVMRUFTRSA/
PSAiNWE1Y2EyZCIKLSNCQVNFVVJJID89IDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUi
IGhyZWY9Imh0dHBzOi8vcmVwby5vci5jei9vZmZpY2lhbC1nY2MuZ2l0L3NuYXBzaG90LyR7UkVM
RUFTRX0udGFyLmd6O2Rvd25sb2FkZmlsZW5hbWU9Z2NjLSR7UkVMRUFTRX0udGFyLmd6Ij4iaHR0
cHM6Ly9yZXBvLm9yLmN6L29mZmljaWFsLWdjYy5naXQvc25hcHNob3QvJHtSRUxFQVNFfS50YXIu
Z3o7ZG93bmxvYWRmaWxlbmFtZT1nY2MtJHtSRUxFQVNFfS50YXIuZ3oiPC9hPgorI1JFTEVBU0Ug
Pz0gIjkzYTQ5ZDJkMjI5Mjg5M2I5YjdmMzgxMzJkZjk0OWM3MDk0MjgzOGMiCisjQkFTRVVSSSA/
PSA8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJodHRwczovL2dpdGh1Yi5j
b20vZ2NjLW1pcnJvci9nY2MvYXJjaGl2ZS8ke1JFTEVBU0V9LnppcDtkb3dubG9hZGZpbGVuYW1l
PWdjYy0ke1BWfS0ke1JFTEVBU0V9LnppcCI+Imh0dHBzOi8vZ2l0aHViLmNvbS9nY2MtbWlycm9y
L2djYy9hcmNoaXZlLyR7UkVMRUFTRX0uemlwO2Rvd25sb2FkZmlsZW5hbWU9Z2NjLSR7UFZ9LSR7
UkVMRUFTRX0uemlwIjwvYT4KIFNSQ19VUkkgPSAiXAogICAgICAgICAgICAke0JBU0VVUkl9IFwK
ICAgICAgICAgICAgPGEgY2xhc3M9Im1vei10eHQtbGluay1mcmVldGV4dCIgaHJlZj0iZmlsZTov
LzAwMDEtZ2NjLTQuMy4xLUFSQ0hfRkxBR1NfRk9SX1RBUkdFVC5wYXRjaCI+ZmlsZTovLzAwMDEt
Z2NjLTQuMy4xLUFSQ0hfRkxBR1NfRk9SX1RBUkdFVC5wYXRjaDwvYT4gXApAQCAtNDcsMzEgKzQ3
LDMwIEBAIFNSQ19VUkkgPSAiXAogICAgICAgICAgICA8YSBjbGFzcz0ibW96LXR4dC1saW5rLWZy
ZWV0ZXh0IiBocmVmPSJmaWxlOi8vMDAxNy1Bdm9pZC11c2luZy1saWJkaXItZnJvbS0ubGEtd2hp
Y2gtdXN1YWxseS1wb2ludHMtdG8tLnBhdGNoIj5maWxlOi8vMDAxNy1Bdm9pZC11c2luZy1saWJk
aXItZnJvbS0ubGEtd2hpY2gtdXN1YWxseS1wb2ludHMtdG8tLnBhdGNoPC9hPiBcCiAgICAgICAg
ICAgIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstZnJlZXRleHQiIGhyZWY9ImZpbGU6Ly8wMDE4LWV4
cG9ydC1DUFAucGF0Y2giPmZpbGU6Ly8wMDE4LWV4cG9ydC1DUFAucGF0Y2g8L2E+IFwKICAgICAg
ICAgICAgPGEgY2xhc3M9Im1vei10eHQtbGluay1mcmVldGV4dCIgaHJlZj0iZmlsZTovLzAwMTkt
RW5zdXJlLXRhcmdldC1nY2MtaGVhZGVycy1jYW4tYmUtaW5jbHVkZWQucGF0Y2giPmZpbGU6Ly8w
MDE5LUVuc3VyZS10YXJnZXQtZ2NjLWhlYWRlcnMtY2FuLWJlLWluY2x1ZGVkLnBhdGNoPC9hPiBc
Ci0gICAgICAgICAgIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstZnJlZXRleHQiIGhyZWY9ImZpbGU6
Ly8wMDIwLWdjYy00Ljgtd29uLXQtYnVpbGQtd2l0aC1kaXNhYmxlLWRlcGVuZGVuY3ktdHJhY2tp
bmcucGF0Y2giPmZpbGU6Ly8wMDIwLWdjYy00Ljgtd29uLXQtYnVpbGQtd2l0aC1kaXNhYmxlLWRl
cGVuZGVuY3ktdHJhY2tpbmcucGF0Y2g8L2E+IFwKLSAgICAgICAgICAgPGEgY2xhc3M9Im1vei10
eHQtbGluay1mcmVldGV4dCIgaHJlZj0iZmlsZTovLzAwMjEtRG9uLXQtc2VhcmNoLWhvc3QtZGly
ZWN0b3J5LWR1cmluZy1yZWxpbmstaWYtaW5zdF9wci5wYXRjaCI+ZmlsZTovLzAwMjEtRG9uLXQt
c2VhcmNoLWhvc3QtZGlyZWN0b3J5LWR1cmluZy1yZWxpbmstaWYtaW5zdF9wci5wYXRjaDwvYT4g
XAotICAgICAgICAgICA8YSBjbGFzcz0ibW96LXR4dC1saW5rLWZyZWV0ZXh0IiBocmVmPSJmaWxl
Oi8vMDAyMi1Vc2UtU1lTVEVNTElCU19ESVItcmVwbGFjZW1lbnQtaW5zdGVhZC1vZi1oYXJkY29k
aW5nLnBhdGNoIj5maWxlOi8vMDAyMi1Vc2UtU1lTVEVNTElCU19ESVItcmVwbGFjZW1lbnQtaW5z
dGVhZC1vZi1oYXJkY29kaW5nLnBhdGNoPC9hPiBcCi0gICAgICAgICAgIDxhIGNsYXNzPSJtb3ot
dHh0LWxpbmstZnJlZXRleHQiIGhyZWY9ImZpbGU6Ly8wMDIzLWFhcmNoNjQtQWRkLXN1cHBvcnQt
Zm9yLW11c2wtbGRzby5wYXRjaCI+ZmlsZTovLzAwMjMtYWFyY2g2NC1BZGQtc3VwcG9ydC1mb3It
bXVzbC1sZHNvLnBhdGNoPC9hPiBcCi0gICAgICAgICAgIDxhIGNsYXNzPSJtb3otdHh0LWxpbmst
ZnJlZXRleHQiIGhyZWY9ImZpbGU6Ly8wMDI0LWxpYmNjMS1maXgtbGliY2MxLXMtaW5zdGFsbC1w
YXRoLWFuZC1ycGF0aC5wYXRjaCI+ZmlsZTovLzAwMjQtbGliY2MxLWZpeC1saWJjYzEtcy1pbnN0
YWxsLXBhdGgtYW5kLXJwYXRoLnBhdGNoPC9hPiBcCi0gICAgICAgICAgIDxhIGNsYXNzPSJtb3ot
dHh0LWxpbmstZnJlZXRleHQiIGhyZWY9ImZpbGU6Ly8wMDI1LWhhbmRsZS1zeXNyb290LXN1cHBv
cnQtZm9yLW5hdGl2ZXNkay1nY2MucGF0Y2giPmZpbGU6Ly8wMDI1LWhhbmRsZS1zeXNyb290LXN1
cHBvcnQtZm9yLW5hdGl2ZXNkay1nY2MucGF0Y2g8L2E+IFwKLSAgICAgICAgICAgPGEgY2xhc3M9
Im1vei10eHQtbGluay1mcmVldGV4dCIgaHJlZj0iZmlsZTovLzAwMjYtU2VhcmNoLXRhcmdldC1z
eXNyb290LWdjYy12ZXJzaW9uLXNwZWNpZmljLWRpcnMtd2l0aC5wYXRjaCI+ZmlsZTovLzAwMjYt
U2VhcmNoLXRhcmdldC1zeXNyb290LWdjYy12ZXJzaW9uLXNwZWNpZmljLWRpcnMtd2l0aC5wYXRj
aDwvYT4gXAotICAgICAgICAgICA8YSBjbGFzcz0ibW96LXR4dC1saW5rLWZyZWV0ZXh0IiBocmVm
PSJmaWxlOi8vMDAyNy1GaXgtdmFyaW91cy1fRk9SX0JVSUxELWFuZC1yZWxhdGVkLXZhcmlhYmxl
cy5wYXRjaCI+ZmlsZTovLzAwMjctRml4LXZhcmlvdXMtX0ZPUl9CVUlMRC1hbmQtcmVsYXRlZC12
YXJpYWJsZXMucGF0Y2g8L2E+IFwKLSAgICAgICAgICAgPGEgY2xhc3M9Im1vei10eHQtbGluay1m
cmVldGV4dCIgaHJlZj0iZmlsZTovLzAwMjgtbmlvczItRGVmaW5lLU1VU0xfRFlOQU1JQ19MSU5L
RVIucGF0Y2giPmZpbGU6Ly8wMDI4LW5pb3MyLURlZmluZS1NVVNMX0RZTkFNSUNfTElOS0VSLnBh
dGNoPC9hPiBcCi0gICAgICAgICAgIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstZnJlZXRleHQiIGhy
ZWY9ImZpbGU6Ly8wMDI5LUFkZC1zc3Bfbm9uc2hhcmVkLXRvLWxpbmstY29tbWFuZGxpbmUtZm9y
LW11c2wtdGFyZ2UucGF0Y2giPmZpbGU6Ly8wMDI5LUFkZC1zc3Bfbm9uc2hhcmVkLXRvLWxpbmst
Y29tbWFuZGxpbmUtZm9yLW11c2wtdGFyZ2UucGF0Y2g8L2E+IFwKLSAgICAgICAgICAgPGEgY2xh
c3M9Im1vei10eHQtbGluay1mcmVldGV4dCIgaHJlZj0iZmlsZTovLzAwMzAtbGRibDEyOC1jb25m
aWcucGF0Y2giPmZpbGU6Ly8wMDMwLWxkYmwxMjgtY29uZmlnLnBhdGNoPC9hPiBcCi0gICAgICAg
ICAgIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstZnJlZXRleHQiIGhyZWY9ImZpbGU6Ly8wMDMxLUxp
bmstbGliZ2NjLXVzaW5nLUxERkxBR1Mtbm90LWp1c3QtU0hMSUJfTERGTEFHUy5wYXRjaCI+Zmls
ZTovLzAwMzEtTGluay1saWJnY2MtdXNpbmctTERGTEFHUy1ub3QtanVzdC1TSExJQl9MREZMQUdT
LnBhdGNoPC9hPiBcCi0gICAgICAgICAgIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstZnJlZXRleHQi
IGhyZWY9ImZpbGU6Ly8wMDMyLWxpYmdjY19zLVVzZS1hbGlhcy1mb3ItX19jcHVfaW5kaWNhdG9y
X2luaXQtaW5zdGVhZC0ucGF0Y2giPmZpbGU6Ly8wMDMyLWxpYmdjY19zLVVzZS1hbGlhcy1mb3It
X19jcHVfaW5kaWNhdG9yX2luaXQtaW5zdGVhZC0ucGF0Y2g8L2E+IFwKLSAgICAgICAgICAgPGEg
Y2xhc3M9Im1vei10eHQtbGluay1mcmVldGV4dCIgaHJlZj0iZmlsZTovLzAwMzMtc3luYy1nY2Mt
c3RkZGVmLmgtd2l0aC1tdXNsLnBhdGNoIj5maWxlOi8vMDAzMy1zeW5jLWdjYy1zdGRkZWYuaC13
aXRoLW11c2wucGF0Y2g8L2E+IFwKLSAgICAgICAgICAgPGEgY2xhc3M9Im1vei10eHQtbGluay1m
cmVldGV4dCIgaHJlZj0iZmlsZTovLzAwMzQtZml4LXNlZ21lbnRhdGlvbi1mYXVsdC1pbi1wcmVj
b21waWxlZC1oZWFkZXItZ2VuZXJhdC5wYXRjaCI+ZmlsZTovLzAwMzQtZml4LXNlZ21lbnRhdGlv
bi1mYXVsdC1pbi1wcmVjb21waWxlZC1oZWFkZXItZ2VuZXJhdC5wYXRjaDwvYT4gXAotICAgICAg
ICAgICA8YSBjbGFzcz0ibW96LXR4dC1saW5rLWZyZWV0ZXh0IiBocmVmPSJmaWxlOi8vMDAzNS1G
aXgtZm9yLXRlc3RzdWl0ZS1mYWlsdXJlLnBhdGNoIj5maWxlOi8vMDAzNS1GaXgtZm9yLXRlc3Rz
dWl0ZS1mYWlsdXJlLnBhdGNoPC9hPiBcCi0gICAgICAgICAgIDxhIGNsYXNzPSJtb3otdHh0LWxp
bmstZnJlZXRleHQiIGhyZWY9ImZpbGU6Ly8wMDM2LVJlLWludHJvZHVjZS1zcGUtY29tbWFuZGxp
bmUtb3B0aW9ucy5wYXRjaCI+ZmlsZTovLzAwMzYtUmUtaW50cm9kdWNlLXNwZS1jb21tYW5kbGlu
ZS1vcHRpb25zLnBhdGNoPC9hPiBcCi0gICAgICAgICAgIDxhIGNsYXNzPSJtb3otdHh0LWxpbmst
ZnJlZXRleHQiIGhyZWY9ImZpbGU6Ly8wMDM3LUNWRS0yMDE5LTE0MjUwLUNoZWNrLXplcm8tdmFs
dWUtaW4tc2ltcGxlX29iamVjdF9lbGYucGF0Y2giPmZpbGU6Ly8wMDM3LUNWRS0yMDE5LTE0MjUw
LUNoZWNrLXplcm8tdmFsdWUtaW4tc2ltcGxlX29iamVjdF9lbGYucGF0Y2g8L2E+IFwKLSAgICAg
ICAgICAgPGEgY2xhc3M9Im1vei10eHQtbGluay1mcmVldGV4dCIgaHJlZj0iZmlsZTovLzAwMzgt
Z2VudHlwZXMtZ2VubW9kZXMtRG8tbm90LXVzZS1fX0xJTkVfXy1mb3ItbWFpbnRhaW5pbi5wYXRj
aCI+ZmlsZTovLzAwMzgtZ2VudHlwZXMtZ2VubW9kZXMtRG8tbm90LXVzZS1fX0xJTkVfXy1mb3It
bWFpbnRhaW5pbi5wYXRjaDwvYT4gXAotICAgICAgICAgICA8YSBjbGFzcz0ibW96LXR4dC1saW5r
LWZyZWV0ZXh0IiBocmVmPSJmaWxlOi8vMDAzOS1wcm9jZXNzX2FsdF9vcGVyYW5kcy1Eb24tdC1t
YXRjaC11c2VyLWRlZmluZWQtcmVncy1vLnBhdGNoIj5maWxlOi8vMDAzOS1wcm9jZXNzX2FsdF9v
cGVyYW5kcy1Eb24tdC1tYXRjaC11c2VyLWRlZmluZWQtcmVncy1vLnBhdGNoPC9hPiBcCisgICAg
ICAgICAgIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstZnJlZXRleHQiIGhyZWY9ImZpbGU6Ly8wMDIw
LURvbi10LXNlYXJjaC1ob3N0LWRpcmVjdG9yeS1kdXJpbmctcmVsaW5rLWlmLWluc3RfcHIucGF0
Y2giPmZpbGU6Ly8wMDIwLURvbi10LXNlYXJjaC1ob3N0LWRpcmVjdG9yeS1kdXJpbmctcmVsaW5r
LWlmLWluc3RfcHIucGF0Y2g8L2E+IFwKKyAgICAgICAgICAgPGEgY2xhc3M9Im1vei10eHQtbGlu
ay1mcmVldGV4dCIgaHJlZj0iZmlsZTovLzAwMjEtVXNlLVNZU1RFTUxJQlNfRElSLXJlcGxhY2Vt
ZW50LWluc3RlYWQtb2YtaGFyZGNvZGluZy5wYXRjaCI+ZmlsZTovLzAwMjEtVXNlLVNZU1RFTUxJ
QlNfRElSLXJlcGxhY2VtZW50LWluc3RlYWQtb2YtaGFyZGNvZGluZy5wYXRjaDwvYT4gXAorICAg
ICAgICAgICA8YSBjbGFzcz0ibW96LXR4dC1saW5rLWZyZWV0ZXh0IiBocmVmPSJmaWxlOi8vMDAy
Mi1hYXJjaDY0LUFkZC1zdXBwb3J0LWZvci1tdXNsLWxkc28ucGF0Y2giPmZpbGU6Ly8wMDIyLWFh
cmNoNjQtQWRkLXN1cHBvcnQtZm9yLW11c2wtbGRzby5wYXRjaDwvYT4gXAorICAgICAgICAgICA8
YSBjbGFzcz0ibW96LXR4dC1saW5rLWZyZWV0ZXh0IiBocmVmPSJmaWxlOi8vMDAyMy1saWJjYzEt
Zml4LWxpYmNjMS1zLWluc3RhbGwtcGF0aC1hbmQtcnBhdGgucGF0Y2giPmZpbGU6Ly8wMDIzLWxp
YmNjMS1maXgtbGliY2MxLXMtaW5zdGFsbC1wYXRoLWFuZC1ycGF0aC5wYXRjaDwvYT4gXAorICAg
ICAgICAgICA8YSBjbGFzcz0ibW96LXR4dC1saW5rLWZyZWV0ZXh0IiBocmVmPSJmaWxlOi8vMDAy
NC1oYW5kbGUtc3lzcm9vdC1zdXBwb3J0LWZvci1uYXRpdmVzZGstZ2NjLnBhdGNoIj5maWxlOi8v
MDAyNC1oYW5kbGUtc3lzcm9vdC1zdXBwb3J0LWZvci1uYXRpdmVzZGstZ2NjLnBhdGNoPC9hPiBc
CisgICAgICAgICAgIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstZnJlZXRleHQiIGhyZWY9ImZpbGU6
Ly8wMDI1LVNlYXJjaC10YXJnZXQtc3lzcm9vdC1nY2MtdmVyc2lvbi1zcGVjaWZpYy1kaXJzLXdp
dGgucGF0Y2giPmZpbGU6Ly8wMDI1LVNlYXJjaC10YXJnZXQtc3lzcm9vdC1nY2MtdmVyc2lvbi1z
cGVjaWZpYy1kaXJzLXdpdGgucGF0Y2g8L2E+IFwKKyAgICAgICAgICAgPGEgY2xhc3M9Im1vei10
eHQtbGluay1mcmVldGV4dCIgaHJlZj0iZmlsZTovLzAwMjYtRml4LXZhcmlvdXMtX0ZPUl9CVUlM
RC1hbmQtcmVsYXRlZC12YXJpYWJsZXMucGF0Y2giPmZpbGU6Ly8wMDI2LUZpeC12YXJpb3VzLV9G
T1JfQlVJTEQtYW5kLXJlbGF0ZWQtdmFyaWFibGVzLnBhdGNoPC9hPiBcCisgICAgICAgICAgIDxh
IGNsYXNzPSJtb3otdHh0LWxpbmstZnJlZXRleHQiIGhyZWY9ImZpbGU6Ly8wMDI3LW5pb3MyLURl
ZmluZS1NVVNMX0RZTkFNSUNfTElOS0VSLnBhdGNoIj5maWxlOi8vMDAyNy1uaW9zMi1EZWZpbmUt
TVVTTF9EWU5BTUlDX0xJTktFUi5wYXRjaDwvYT4gXAorICAgICAgICAgICA8YSBjbGFzcz0ibW96
LXR4dC1saW5rLWZyZWV0ZXh0IiBocmVmPSJmaWxlOi8vMDAyOC1BZGQtc3NwX25vbnNoYXJlZC10
by1saW5rLWNvbW1hbmRsaW5lLWZvci1tdXNsLXRhcmdlLnBhdGNoIj5maWxlOi8vMDAyOC1BZGQt
c3NwX25vbnNoYXJlZC10by1saW5rLWNvbW1hbmRsaW5lLWZvci1tdXNsLXRhcmdlLnBhdGNoPC9h
PiBcCisgICAgICAgICAgIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstZnJlZXRleHQiIGhyZWY9ImZp
bGU6Ly8wMDI5LUxpbmstbGliZ2NjLXVzaW5nLUxERkxBR1Mtbm90LWp1c3QtU0hMSUJfTERGTEFH
Uy5wYXRjaCI+ZmlsZTovLzAwMjktTGluay1saWJnY2MtdXNpbmctTERGTEFHUy1ub3QtanVzdC1T
SExJQl9MREZMQUdTLnBhdGNoPC9hPiBcCisgICAgICAgICAgIDxhIGNsYXNzPSJtb3otdHh0LWxp
bmstZnJlZXRleHQiIGhyZWY9ImZpbGU6Ly8wMDMwLXN5bmMtZ2NjLXN0ZGRlZi5oLXdpdGgtbXVz
bC5wYXRjaCI+ZmlsZTovLzAwMzAtc3luYy1nY2Mtc3RkZGVmLmgtd2l0aC1tdXNsLnBhdGNoPC9h
PiBcCisgICAgICAgICAgIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstZnJlZXRleHQiIGhyZWY9ImZp
bGU6Ly8wMDMxLWZpeC1zZWdtZW50YXRpb24tZmF1bHQtaW4tcHJlY29tcGlsZWQtaGVhZGVyLWdl
bmVyYXQucGF0Y2giPmZpbGU6Ly8wMDMxLWZpeC1zZWdtZW50YXRpb24tZmF1bHQtaW4tcHJlY29t
cGlsZWQtaGVhZGVyLWdlbmVyYXQucGF0Y2g8L2E+IFwKKyAgICAgICAgICAgPGEgY2xhc3M9Im1v
ei10eHQtbGluay1mcmVldGV4dCIgaHJlZj0iZmlsZTovLzAwMzItRml4LWZvci10ZXN0c3VpdGUt
ZmFpbHVyZS5wYXRjaCI+ZmlsZTovLzAwMzItRml4LWZvci10ZXN0c3VpdGUtZmFpbHVyZS5wYXRj
aDwvYT4gXAorICAgICAgICAgICA8YSBjbGFzcz0ibW96LXR4dC1saW5rLWZyZWV0ZXh0IiBocmVm
PSJmaWxlOi8vMDAzMy1SZS1pbnRyb2R1Y2Utc3BlLWNvbW1hbmRsaW5lLW9wdGlvbnMucGF0Y2gi
PmZpbGU6Ly8wMDMzLVJlLWludHJvZHVjZS1zcGUtY29tbWFuZGxpbmUtb3B0aW9ucy5wYXRjaDwv
YT4gXAorICAgICAgICAgICA8YSBjbGFzcz0ibW96LXR4dC1saW5rLWZyZWV0ZXh0IiBocmVmPSJm
aWxlOi8vMDAzNC1saWJnY2Nfcy1Vc2UtYWxpYXMtZm9yLV9fY3B1X2luZGljYXRvcl9pbml0LWlu
c3RlYWQtLnBhdGNoIj5maWxlOi8vMDAzNC1saWJnY2Nfcy1Vc2UtYWxpYXMtZm9yLV9fY3B1X2lu
ZGljYXRvcl9pbml0LWluc3RlYWQtLnBhdGNoPC9hPiBcCisgICAgICAgICAgIDxhIGNsYXNzPSJt
b3otdHh0LWxpbmstZnJlZXRleHQiIGhyZWY9ImZpbGU6Ly8wMDM1LWdlbnR5cGVzLWdlbm1vZGVz
LURvLW5vdC11c2UtX19MSU5FX18tZm9yLW1haW50YWluaW4ucGF0Y2giPmZpbGU6Ly8wMDM1LWdl
bnR5cGVzLWdlbm1vZGVzLURvLW5vdC11c2UtX19MSU5FX18tZm9yLW1haW50YWluaW4ucGF0Y2g8
L2E+IFwKKyAgICAgICAgICAgPGEgY2xhc3M9Im1vei10eHQtbGluay1mcmVldGV4dCIgaHJlZj0i
ZmlsZTovLzAwMzYtRW5hYmxlLUNFVC1pbi1jcm9zcy1jb21waWxlci1pZi1wb3NzaWJsZS5wYXRj
aCI+ZmlsZTovLzAwMzYtRW5hYmxlLUNFVC1pbi1jcm9zcy1jb21waWxlci1pZi1wb3NzaWJsZS5w
YXRjaDwvYT4gXAorICAgICAgICAgICA8YSBjbGFzcz0ibW96LXR4dC1saW5rLWZyZWV0ZXh0IiBo
cmVmPSJmaWxlOi8vMDAzNy1saWJzdGRjLXYzLUluY2x1ZGUtc3lzdGVtX2Vycm9yLWZvci1zdGQt
ZXJyYy5wYXRjaCI+ZmlsZTovLzAwMzctbGlic3RkYy12My1JbmNsdWRlLXN5c3RlbV9lcnJvci1m
b3Itc3RkLWVycmMucGF0Y2g8L2E+IFwKICIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJiNjg5OGEy
Mzg0NGI2NTZmMWI2ODY5MWM1YzAxMjAzNmMyZTY5NGFjNGI1M2E4OTE4ZDQ3MTJhZDg3NmU3ZWEy
IgorCiBTID0gIiR7VE1QRElSfS93b3JrLXNoYXJlZC9nY2MtJHtQVn0tJHtQUn0vZ2NjLSR7UFZ9
IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjcxZTE5Nzg2NzYxMWY2MDU0YWExMTE5YjEzYTBjMGFi
YWMxMjgzNDc2NWZlMmQ4MWYzNWFjNTdmODRmNzQyZDEiCiAjIEZvciBkZXYgcmVsZWFzZSBzbmFw
c2hvdHRpbmcKLSNTID0gIiR7VE1QRElSfS93b3JrLXNoYXJlZC9nY2MtJHtQVn0tJHtQUn0vb2Zm
aWNpYWwtZ2NjLSR7UkVMRUFTRX0iCisjUyA9ICIke1RNUERJUn0vd29yay1zaGFyZWQvZ2NjLSR7
UFZ9LSR7UFJ9L2djYy0ke1JFTEVBU0V9IgogI0IgPSAiJHtXT1JLRElSfS9nY2MtJHtQVn0vYnVp
bGQuJHtIT1NUX1NZU30uJHtUQVJHRVRfU1lTfSIKIAogIyBMYW5ndWFnZSBPdmVycmlkZXMKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2MvZ2NjLTkuMy8wMDAxLWdjYy00LjMu
MS1BUkNIX0ZMQUdTX0ZPUl9UQVJHRVQucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2Nj
L2djYy0xMC4xLzAwMDEtZ2NjLTQuMy4xLUFSQ0hfRkxBR1NfRk9SX1RBUkdFVC5wYXRjaApzaW1p
bGFyaXR5IGluZGV4IDc5JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2dj
Yy05LjMvMDAwMS1nY2MtNC4zLjEtQVJDSF9GTEFHU19GT1JfVEFSR0VULnBhdGNoCnJlbmFtZSB0
byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2djYy0xMC4xLzAwMDEtZ2NjLTQuMy4xLUFSQ0hf
RkxBR1NfRk9SX1RBUkdFVC5wYXRjaAppbmRleCAwZDkyMjJkZjE3Li5hOGUzNmY1N2E4IDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2djYy05LjMvMDAwMS1nY2MtNC4zLjEt
QVJDSF9GTEFHU19GT1JfVEFSR0VULnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9n
Y2MvZ2NjLTEwLjEvMDAwMS1nY2MtNC4zLjEtQVJDSF9GTEFHU19GT1JfVEFSR0VULnBhdGNoCkBA
IC0xLDcgKzEsNyBAQAotRnJvbSAwMmIxNzg5ZGJiYjE4NDcyNjc4MmI1MDM4YTRkZDk2NTE1ZWM3
OTBjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA4ZTc3NDAyM2Y0ZjQwZDZkZjU3NmY0
MzBiNGU0OWU1ZjhmNzg4OGExIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBS
YWogPGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOnJhai5raGVt
QGdtYWlsLmNvbSI+Jmx0O3Jhai5raGVtQGdtYWlsLmNvbSZndDs8L2E+CiBEYXRlOiBGcmksIDI5
IE1hciAyMDEzIDA4OjM3OjExICswNDAwCi1TdWJqZWN0OiBbUEFUQ0ggMDEvMzldIGdjYy00LjMu
MTogQVJDSF9GTEFHU19GT1JfVEFSR0VUCitTdWJqZWN0OiBbUEFUQ0hdIGdjYy00LjMuMTogQVJD
SF9GTEFHU19GT1JfVEFSR0VUCiAKIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxhIGNsYXNzPSJt
b3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzpyYWoua2hlbUBnbWFpbC5jb20iPiZs
dDtyYWoua2hlbUBnbWFpbC5jb20mZ3Q7PC9hPgogCkBAIC0xMiwxMCArMTIsMTAgQEAgVXBzdHJl
YW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRlIFtlbWJlZGRlZCBzcGVjaWZpY10KICAyIGZpbGVzIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL2Nv
bmZpZ3VyZSBiL2NvbmZpZ3VyZQotaW5kZXggYWJkOTNhOTkwYTkuLmIxMjEwODhkNzc4IDEwMDc1
NQoraW5kZXggNGNjOTM4ZWJiN2QuLjIyNmE2NDkzOWQxIDEwMDc1NQogLS0tIGEvY29uZmlndXJl
CiArKysgYi9jb25maWd1cmUKLUBAIC03NjAzLDcgKzc2MDMsNyBAQCBmaQorQEAgLTc3MjIsNyAr
NzcyMiw3IEBAIGZpCiAgIyBmb3IgdGFyZ2V0X2FsaWFzIGFuZCBnY2MgZG9lc24ndCBtYW5hZ2Ug
aXQgY29uc2lzdGVudGx5LgogIHRhcmdldF9jb25maWdhcmdzPSItLWNhY2hlLWZpbGU9Li9jb25m
aWcuY2FjaGUgJHt0YXJnZXRfY29uZmlnYXJnc30iCiAgCkBAIC0yNSwxMCArMjUsMTAgQEAgaW5k
ZXggYWJkOTNhOTkwYTkuLmIxMjEwODhkNzc4IDEwMDc1NQogICAqIiBuZXdsaWIgIiopCiAgICBj
YXNlICIgJHRhcmdldF9jb25maWdhcmdzICIgaW4KIGRpZmYgLS1naXQgYS9jb25maWd1cmUuYWMg
Yi9jb25maWd1cmUuYWMKLWluZGV4IDlkYjRmZDE0YWEyLi5hYWQ5M2M0ZDE4MyAxMDA2NDQKK2lu
ZGV4IGM3OGQ5Y2JlYTYyLi5mMDI0ZjRiYWM5YiAxMDA2NDQKIC0tLSBhL2NvbmZpZ3VyZS5hYwog
KysrIGIvY29uZmlndXJlLmFjCi1AQCAtMzExOSw3ICszMTE5LDcgQEAgZmkKK0BAIC0zMjI3LDcg
KzMyMjcsNyBAQCBmaQogICMgZm9yIHRhcmdldF9hbGlhcyBhbmQgZ2NjIGRvZXNuJ3QgbWFuYWdl
IGl0IGNvbnNpc3RlbnRseS4KICB0YXJnZXRfY29uZmlnYXJncz0iLS1jYWNoZS1maWxlPS4vY29u
ZmlnLmNhY2hlICR7dGFyZ2V0X2NvbmZpZ2FyZ3N9IgogIApAQCAtMzcsNiArMzcsMyBAQCBpbmRl
eCA5ZGI0ZmQxNGFhMi4uYWFkOTNjNGQxODMgMTAwNjQ0CiAgY2FzZSAiICR0YXJnZXRfY29uZmln
ZGlycyAiIGluCiAgICoiIG5ld2xpYiAiKikKICAgIGNhc2UgIiAkdGFyZ2V0X2NvbmZpZ2FyZ3Mg
IiBpbgotLS0gCi0yLjI1LjEKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dj
Yy9nY2MtOS4zLzAwMDItZ2NjLXBvaXNvbi1zeXN0ZW0tZGlyZWN0b3JpZXMucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2djYy0xMC4xLzAwMDItZ2NjLXBvaXNvbi1zeXN0ZW0tZGly
ZWN0b3JpZXMucGF0Y2gKc2ltaWxhcml0eSBpbmRleCA4NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2djYy9nY2MtOS4zLzAwMDItZ2NjLXBvaXNvbi1zeXN0ZW0tZGlyZWN0b3Jp
ZXMucGF0Y2gKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2MvZ2NjLTEwLjEvMDAw
Mi1nY2MtcG9pc29uLXN5c3RlbS1kaXJlY3Rvcmllcy5wYXRjaAppbmRleCBmNDI3ZWU2N2MxLi4x
ZWE3OWMwZTVjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2djYy05LjMv
MDAwMi1nY2MtcG9pc29uLXN5c3RlbS1kaXJlY3Rvcmllcy5wYXRjaAorKysgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvZ2NjL2djYy0xMC4xLzAwMDItZ2NjLXBvaXNvbi1zeXN0ZW0tZGlyZWN0b3Jp
ZXMucGF0Y2gKQEAgLTEsNyArMSw3IEBACi1Gcm9tIDUzNjhjZDAyOTNjZTUwYTY5Y2VkNmU0YjI1
YmE2YzhkOGUwMTQyNTYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDgyODcxMGY5Yjg1
Yzg1YjJjOGRiZjFhYzNhMzJiNjBjNjBjNDA1NGQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBG
cm9tOiBLaGVtIFJhaiA8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWls
dG86cmFqLmtoZW1AZ21haWwuY29tIj4mbHQ7cmFqLmtoZW1AZ21haWwuY29tJmd0OzwvYT4KIERh
dGU6IEZyaSwgMjkgTWFyIDIwMTMgMDg6NTk6MDAgKzA0MDAKLVN1YmplY3Q6IFtQQVRDSCAwMi8z
OV0gZ2NjOiBwb2lzb24tc3lzdGVtLWRpcmVjdG9yaWVzCitTdWJqZWN0OiBbUEFUQ0hdIGdjYzog
cG9pc29uLXN5c3RlbS1kaXJlY3RvcmllcwogCiBBZGQgL3N3L2luY2x1ZGUgYW5kIC9vcHQvaW5j
bHVkZSBiYXNlZCBvbiB0aGUgb3JpZ2luYWwKIHplY2tlLW5vLWhvc3QtaW5jbHVkZXMucGF0Y2gg
cGF0Y2guICBUaGUgb3JpZ2luYWwgcGF0Y2ggY2hlY2tlZCBmb3IKQEAgLTI2LDEwICsyNiwxMCBA
QCBVcHN0cmVhbS1TdGF0dXM6IFBlbmRpbmcKICA3IGZpbGVzIGNoYW5nZWQsIDY4IGluc2VydGlv
bnMoKykKIAogZGlmZiAtLWdpdCBhL2djYy9jb21tb24ub3B0IGIvZ2NjL2NvbW1vbi5vcHQKLWlu
ZGV4IGQzNDJjNGYzNzQ5Li5jNjRmZDRhNmM1MCAxMDA2NDQKK2luZGV4IDY1YTgyNDEwYWJjLi40
MTVmMzhmYTFmNCAxMDA2NDQKIC0tLSBhL2djYy9jb21tb24ub3B0CiArKysgYi9nY2MvY29tbW9u
Lm9wdAotQEAgLTY4NCw2ICs2ODQsMTAgQEAgV3JldHVybi1sb2NhbC1hZGRyCitAQCAtNjgyLDYg
KzY4MiwxMCBAQCBXcmV0dXJuLWxvY2FsLWFkZHIKICBDb21tb24gVmFyKHdhcm5fcmV0dXJuX2xv
Y2FsX2FkZHIpIEluaXQoMSkgV2FybmluZwogIFdhcm4gYWJvdXQgcmV0dXJuaW5nIGEgcG9pbnRl
ci9yZWZlcmVuY2UgdG8gYSBsb2NhbCBvciB0ZW1wb3JhcnkgdmFyaWFibGUuCiAgCkBAIC00MSwx
MCArNDEsMTAgQEAgaW5kZXggZDM0MmM0ZjM3NDkuLmM2NGZkNGE2YzUwIDEwMDY0NAogIENvbW1v
biBWYXIod2Fybl9zaGFkb3cpIFdhcm5pbmcKICBXYXJuIHdoZW4gb25lIHZhcmlhYmxlIHNoYWRv
d3MgYW5vdGhlci4gIFNhbWUgYXMgLVdzaGFkb3c9Z2xvYmFsLgogZGlmZiAtLWdpdCBhL2djYy9j
b25maWcuaW4gYi9nY2MvY29uZmlnLmluCi1pbmRleCBhNzE4Y2VhZjNkYS4uNTcxMzM0MmVmYjEg
MTAwNjQ0CitpbmRleCA4MDllN2IyNjgyMy4uNWFkZWFlZWQzNmIgMTAwNjQ0CiAtLS0gYS9nY2Mv
Y29uZmlnLmluCiArKysgYi9nY2MvY29uZmlnLmluCi1AQCAtMjAwLDYgKzIwMCwxMiBAQAorQEAg
LTIyNCw2ICsyMjQsMTIgQEAKICAjZW5kaWYKICAKICAKQEAgLTU4LDEwICs1OCwxMCBAQCBpbmRl
eCBhNzE4Y2VhZjNkYS4uNTcxMzM0MmVmYjEgMTAwNjQ0CiAgICAgb3B0aW1pemVyIGFuZCBiYWNr
IGVuZCkgdG8gYmUgY2hlY2tlZCBmb3IgZHluYW1pYyB0eXBlIHNhZmV0eSBhdCBydW50aW1lLgog
ICAgIFRoaXMgaXMgcXVpdGUgZXhwZW5zaXZlLiAqLwogZGlmZiAtLWdpdCBhL2djYy9jb25maWd1
cmUgYi9nY2MvY29uZmlndXJlCi1pbmRleCBhMDY1YmEyMzcyOC4uMmUyNmRkMzMzMTAgMTAwNzU1
CitpbmRleCBjZDNkOTUxNmZjZS4uOGRlNzY2YTk0MmMgMTAwNzU1CiAtLS0gYS9nY2MvY29uZmln
dXJlCiArKysgYi9nY2MvY29uZmlndXJlCi1AQCAtOTk2LDYgKzk5Niw3IEBAIHdpdGhfc3lzdGVt
X3psaWIKK0BAIC0xMDEwLDYgKzEwMTAsNyBAQCB3aXRoX3N5c3RlbV96bGliCiAgZW5hYmxlX21h
aW50YWluZXJfbW9kZQogIGVuYWJsZV9saW5rX211dGV4CiAgZW5hYmxlX3ZlcnNpb25fc3BlY2lm
aWNfcnVudGltZV9saWJzCkBAIC02OSw3ICs2OSw3IEBAIGluZGV4IGEwNjViYTIzNzI4Li4yZTI2
ZGQzMzMxMCAxMDA3NTUKICBlbmFibGVfcGx1Z2luCiAgZW5hYmxlX2hvc3Rfc2hhcmVkCiAgZW5h
YmxlX2xpYnF1YWRtYXRoX3N1cHBvcnQKLUBAIC0xNzQ5LDYgKzE3NTAsOCBAQCBPcHRpb25hbCBG
ZWF0dXJlczoKK0BAIC0xNzY2LDYgKzE3NjcsOCBAQCBPcHRpb25hbCBGZWF0dXJlczoKICAgIC0t
ZW5hYmxlLXZlcnNpb24tc3BlY2lmaWMtcnVudGltZS1saWJzCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBzcGVjaWZ5IHRoYXQgcnVudGltZSBsaWJyYXJpZXMgc2hvdWxkIGJlIGluc3RhbGxl
ZAogICAgICAgICAgICAgICAgICAgICAgICAgICAgaW4gYSBjb21waWxlci1zcGVjaWZpYyBkaXJl
Y3RvcnkKQEAgLTc4LDcgKzc4LDcgQEAgaW5kZXggYTA2NWJhMjM3MjguLjJlMjZkZDMzMzEwIDEw
MDc1NQogICAgLS1lbmFibGUtcGx1Z2luICAgICAgICAgZW5hYmxlIHBsdWdpbiBzdXBwb3J0CiAg
ICAtLWVuYWJsZS1ob3N0LXNoYXJlZCAgICBidWlsZCBob3N0IGNvZGUgYXMgc2hhcmVkIGxpYnJh
cmllcwogICAgLS1kaXNhYmxlLWxpYnF1YWRtYXRoLXN1cHBvcnQKLUBAIC0yOTc1Myw2ICsyOTc1
NiwxOSBAQCBpZiB0ZXN0ICIke2VuYWJsZV92ZXJzaW9uX3NwZWNpZmljX3J1bnRpbWVfbGlicytz
ZXR9IiA9IHNldDsgdGhlbiA6CitAQCAtMzAyMzUsNiArMzAyMzgsMTkgQEAgaWYgdGVzdCAiJHtl
bmFibGVfdmVyc2lvbl9zcGVjaWZpY19ydW50aW1lX2xpYnMrc2V0fTxhIGNsYXNzPSJtb3otdHh0
LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzo9c2V0O3RoZW46ZmlAQC05OSwxMCs5OSwxMEBA
aW5kZXhhMDY1YmEyMzcyOC4uMmUyNmRkMzMzMTAxMDA3NTVkaWZmLS1naXRhL2djYy9jb25maWd1
cmUuYWNiL2djYy9jb25maWd1cmUuYWMtaW5kZXgzYTcyNTExMDJlZi4uMTJkMWQwNGU2NDUxMDA2
NDQraW5kZXgwZGUzYjRiZjk3Yi4uOGJmZDZmZWI3ODAxMDA2NDQtLS1hL2djYy9jb25maWd1cmUu
YWMrKytiL2djYy9jb25maWd1cmUuYWMtQEAtNjM4MCw2KzYzODAsMTZAQEFDX0FSR19FTkFCTEUo
dmVyc2lvbi1zcGVjaWZpYy1ydW50aW1lLWxpYnMsK0BALTY1OTUsNis2NTk1LDE2QEBBQ19BUkdf
RU5BQkxFKHZlcnNpb24tc3BlY2lmaWMtcnVudGltZS1saWJzLFtzcGVjaWZ5dGhhdHJ1bnRpbWVs
aWJyYXJpZXNzaG91bGRiZWluc3RhbGxlZGluYWNvbXBpbGVyLXNwZWNpZmljZGlyZWN0b3J5XSld
KUBALTEyMCwxOCsxMjAsMThAQGluZGV4M2E3MjUxMTAyZWYuLjEyZDFkMDRlNjQ1MTAwNjQ0QUNf
U1VCU1Qoc3ViZGlycylBQ19TVUJTVChzcmNkaXIpZGlmZi0tZ2l0YS9nY2MvZG9jL2ludm9rZS50
ZXhpYi9nY2MvZG9jL2ludm9rZS50ZXhpLWluZGV4MGFiNmM5YzY0NDkuLmMzZDNkNTFhMjhmMTAw
NjQ0K2luZGV4Zjk4MTYxMzkxYTAuLmYxMmQ4ZDEyMTUwMTAwNjQ0LS0tYS9nY2MvZG9jL2ludm9r
ZS50ZXhpKysrYi9nY2MvZG9jL2ludm9rZS50ZXhpLUBALTMzMyw2KzMzMyw3QEBPYmplY3RpdmUt
Q2FuZE9iamVjdGl2ZS1DKytEaWFsZWN0c30uLS1XcGFja2VkLVdwYWNrZWQtYml0ZmllbGQtY29t
cGF0LVdwYWNrZWQtbm90LWFsaWduZWQtV3BhZGRlZEBnb2wrQEAtMzQ4LDYrMzQ4LDdAQE9iamVj
dGl2ZS1DYW5kT2JqZWN0aXZlLUMrK0RpYWxlY3RzfS4rLVdwYWNrZWQtV25vLXBhY2tlZC1iaXRm
aWVsZC1jb21wYXQtV3BhY2tlZC1ub3QtYWxpZ25lZC1XcGFkZGVkQGdvbC1XcGFyZW50aGVzZXMt
V25vLXBlZGFudGljLW1zLWZvcm1hdEBnb2wtLVdwbGFjZW1lbnQtbmV3LVdwbGFjZW1lbnQtbmV3
PUB2YXJ7bn1AZ29sKy1XcG9pbnRlci1hcml0aC1Xbm8tcG9pbnRlci1jb21wYXJlLVduby1wb2lu
dGVyLXRvLWludC1jYXN0QGdvbCstV25vLXBvaXNvbi1zeXN0ZW0tZGlyZWN0b3JpZXNAZ29sLS1X
cG9pbnRlci1hcml0aC1XcG9pbnRlci1jb21wYXJlLVduby1wb2ludGVyLXRvLWludC1jYXN0QGdv
bC1Xbm8tcHJhZ21hcy1Xbm8tcHJpby1jdG9yLWR0b3ItV3JlZHVuZGFudC1kZWNsc0Bnb2wtLVdy
ZXN0cmljdC1Xbm8tcmV0dXJuLWxvY2FsLWFkZHJAZ29sLUBALTYyOTAsNis2MjkxLDE0QEBtYWRl
dXBvZmRhdGFvbmx5YW5kdGh1c3JlcXVpcmVzbm9zcGVjaWFsdHJlYXRtZW50LkJ1dCxmb3IrLVdy
ZXN0cmljdC1Xbm8tcmV0dXJuLWxvY2FsLWFkZHItV3JldHVybi10eXBlQGdvbCstV25vLXNjYWxh
ci1zdG9yYWdlLW9yZGVyLVdzZXF1ZW5jZS1wb2ludEBnb2wrQEAtNjkyNCw2KzY5MjUsMTRAQG1h
ZGV1cG9mZGF0YW9ubHlhbmR0aHVzcmVxdWlyZXNub3NwZWNpYWx0cmVhdG1lbnQuQnV0LGZvcm1v
c3R0YXJnZXRzLGl0aXNtYWRldXBvZmNvZGVhbmR0aHVzcmVxdWlyZXN0aGVzdGFja3RvYmVtYWRl
ZXhlY3V0YWJsZWlub3JkZXJmb3J0aGVwcm9ncmFtdG93b3JrcHJvcGVybHkuQEAtMTQ3LDEwKzE0
NywxMEBAaW5kZXgwYWI2YzljNjQ0OS4uYzNkM2Q1MWEyOGYxMDA2NDRAb3BpbmRleFdmbG9hdC1l
cXVhbEBvcGluZGV4V25vLWZsb2F0LWVxdWFsZGlmZi0tZ2l0YS9nY2MvZ2NjLmNiL2djYy9nY2Mu
Yy1pbmRleDRmNTc3NjViMDEyLi5hMjYwMWE2YmIwNjEwMDY0NCtpbmRleDlmNzkwZGIwZGFmLi5i
MjIwMGM1MTg1YTEwMDY0NC0tLWEvZ2NjL2djYy5jKysrYi9nY2MvZ2NjLmMtQEAtMTA0Miw2KzEw
NDIsOEBAcHJvcGVycG9zaXRpb25hbW9uZ3RoZW90aGVyb3V0cHV0ZmlsZXMuKi8rQEAtMTA0MSw2
KzEwNDEsOEBAcHJvcGVycG9zaXRpb25hbW9uZ3RoZW90aGVyb3V0cHV0ZmlsZXMuKi8iPiIgPSBz
ZXQ7IHRoZW4gOgogIGZpCiAgCiAgCkBAIC05OSwxMCArOTksMTAgQEAgaW5kZXggYTA2NWJhMjM3
MjguLjJlMjZkZDMzMzEwIDEwMDc1NQogIAogIAogZGlmZiAtLWdpdCBhL2djYy9jb25maWd1cmUu
YWMgYi9nY2MvY29uZmlndXJlLmFjCi1pbmRleCAzYTcyNTExMDJlZi4uMTJkMWQwNGU2NDUgMTAw
NjQ0CitpbmRleCAwZGUzYjRiZjk3Yi4uOGJmZDZmZWI3ODAgMTAwNjQ0CiAtLS0gYS9nY2MvY29u
ZmlndXJlLmFjCiArKysgYi9nY2MvY29uZmlndXJlLmFjCi1AQCAtNjM4MCw2ICs2MzgwLDE2IEBA
IEFDX0FSR19FTkFCTEUodmVyc2lvbi1zcGVjaWZpYy1ydW50aW1lLWxpYnMsCitAQCAtNjU5NSw2
ICs2NTk1LDE2IEBAIEFDX0FSR19FTkFCTEUodmVyc2lvbi1zcGVjaWZpYy1ydW50aW1lLWxpYnMs
CiAgICAgICAgICAgICAgICAgIFtzcGVjaWZ5IHRoYXQgcnVudGltZSBsaWJyYXJpZXMgc2hvdWxk
IGJlCiAgICAgICAgICAgICAgICAgICBpbnN0YWxsZWQgaW4gYSBjb21waWxlci1zcGVjaWZpYyBk
aXJlY3RvcnldKV0pCiAgCkBAIC0xMjAsMTggKzEyMCwxOCBAQCBpbmRleCAzYTcyNTExMDJlZi4u
MTJkMWQwNGU2NDUgMTAwNjQ0CiAgQUNfU1VCU1Qoc3ViZGlycykKICBBQ19TVUJTVChzcmNkaXIp
CiBkaWZmIC0tZ2l0IGEvZ2NjL2RvYy9pbnZva2UudGV4aSBiL2djYy9kb2MvaW52b2tlLnRleGkK
LWluZGV4IDBhYjZjOWM2NDQ5Li5jM2QzZDUxYTI4ZiAxMDA2NDQKK2luZGV4IGY5ODE2MTM5MWEw
Li5mMTJkOGQxMjE1MCAxMDA2NDQKIC0tLSBhL2djYy9kb2MvaW52b2tlLnRleGkKICsrKyBiL2dj
Yy9kb2MvaW52b2tlLnRleGkKLUBAIC0zMzMsNiArMzMzLDcgQEAgT2JqZWN0aXZlLUMgYW5kIE9i
amVjdGl2ZS1DKysgRGlhbGVjdHN9LgotIC1XcGFja2VkICAtV3BhY2tlZC1iaXRmaWVsZC1jb21w
YXQgLVdwYWNrZWQtbm90LWFsaWduZWQgIC1XcGFkZGVkIEBnb2wKK0BAIC0zNDgsNiArMzQ4LDcg
QEAgT2JqZWN0aXZlLUMgYW5kIE9iamVjdGl2ZS1DKysgRGlhbGVjdHN9LgorIC1XcGFja2VkICAt
V25vLXBhY2tlZC1iaXRmaWVsZC1jb21wYXQgIC1XcGFja2VkLW5vdC1hbGlnbmVkICAtV3BhZGRl
ZCBAZ29sCiAgLVdwYXJlbnRoZXNlcyAgLVduby1wZWRhbnRpYy1tcy1mb3JtYXQgQGdvbAotIC1X
cGxhY2VtZW50LW5ldyAgLVdwbGFjZW1lbnQtbmV3PUB2YXJ7bn0gQGdvbAorIC1XcG9pbnRlci1h
cml0aCAgLVduby1wb2ludGVyLWNvbXBhcmUgIC1Xbm8tcG9pbnRlci10by1pbnQtY2FzdCBAZ29s
CiArLVduby1wb2lzb24tc3lzdGVtLWRpcmVjdG9yaWVzIEBnb2wKLSAtV3BvaW50ZXItYXJpdGgg
IC1XcG9pbnRlci1jb21wYXJlICAtV25vLXBvaW50ZXItdG8taW50LWNhc3QgQGdvbAogIC1Xbm8t
cHJhZ21hcyAgLVduby1wcmlvLWN0b3ItZHRvciAgLVdyZWR1bmRhbnQtZGVjbHMgQGdvbAotIC1X
cmVzdHJpY3QgIC1Xbm8tcmV0dXJuLWxvY2FsLWFkZHIgQGdvbAotQEAgLTYyOTAsNiArNjI5MSwx
NCBAQCBtYWRlIHVwIG9mIGRhdGEgb25seSBhbmQgdGh1cyByZXF1aXJlcyBubyBzcGVjaWFsIHRy
ZWF0bWVudC4gIEJ1dCwgZm9yCisgLVdyZXN0cmljdCAgLVduby1yZXR1cm4tbG9jYWwtYWRkciAg
LVdyZXR1cm4tdHlwZSBAZ29sCisgLVduby1zY2FsYXItc3RvcmFnZS1vcmRlciAgLVdzZXF1ZW5j
ZS1wb2ludCBAZ29sCitAQCAtNjkyNCw2ICs2OTI1LDE0IEBAIG1hZGUgdXAgb2YgZGF0YSBvbmx5
IGFuZCB0aHVzIHJlcXVpcmVzIG5vIHNwZWNpYWwgdHJlYXRtZW50LiAgQnV0LCBmb3IKICBtb3N0
IHRhcmdldHMsIGl0IGlzIG1hZGUgdXAgb2YgY29kZSBhbmQgdGh1cyByZXF1aXJlcyB0aGUgc3Rh
Y2sgdG8gYmUKICBtYWRlIGV4ZWN1dGFibGUgaW4gb3JkZXIgZm9yIHRoZSBwcm9ncmFtIHRvIHdv
cmsgcHJvcGVybHkuCiAgCkBAIC0xNDcsMTAgKzE0NywxMCBAQCBpbmRleCAwYWI2YzljNjQ0OS4u
YzNkM2Q1MWEyOGYgMTAwNjQ0CiAgQG9waW5kZXggV2Zsb2F0LWVxdWFsCiAgQG9waW5kZXggV25v
LWZsb2F0LWVxdWFsCiBkaWZmIC0tZ2l0IGEvZ2NjL2djYy5jIGIvZ2NjL2djYy5jCi1pbmRleCA0
ZjU3NzY1YjAxMi4uYTI2MDFhNmJiMDYgMTAwNjQ0CitpbmRleCA5Zjc5MGRiMGRhZi4uYjIyMDBj
NTE4NWEgMTAwNjQ0CiAtLS0gYS9nY2MvZ2NjLmMKICsrKyBiL2djYy9nY2MuYwotQEAgLTEwNDIs
NiArMTA0Miw4IEBAIHByb3BlciBwb3NpdGlvbiBhbW9uZyB0aGUgb3RoZXIgb3V0cHV0IGZpbGVz
LiAgKi8KK0BAIC0xMDQxLDYgKzEwNDEsOCBAQCBwcm9wZXIgcG9zaXRpb24gYW1vbmcgdGhlIG90
aGVyIG91dHB1dCBmaWxlcy4gICovCiAgICAgIjwvYT4le2Z1c2UtbGQ9KjotZnVzZS1sZD0lKn0g
IiBMSU5LX0NPTVBSRVNTX0RFQlVHX1NQRUMgXAogICAgICIlWCAle28qfSAle2UqfSAle059ICV7
bn0gJXtyfVwKICAgICAgJXtzfSAle3R9ICV7dSp9ICV7en0gJXtafSAleyFub3N0ZGxpYjoleyFy
OiV7IW5vc3RhcnRmaWxlczolU319fSBcCkBAIC0xNjAsNyArMTYwLDcgQEAgaW5kZXggNGY1Nzc2
NWIwMTIuLmEyNjAxYTZiYjA2IDEwMDY0NAogICAgICBWVEFCTEVfVkVSSUZJQ0FUSU9OX1NQRUMg
IiAiIFNBTklUSVpFUl9FQVJMWV9TUEVDICIgJW8gIiIgXAogICAgICAle2ZvcGVuYWNjfGZvcGVu
bXB8JTpndCgle2Z0cmVlLXBhcmFsbGVsaXplLWxvb3BzPSo6JSp9IDEpOlwKIGRpZmYgLS1naXQg
YS9nY2MvaW5jcGF0aC5jIGIvZ2NjL2luY3BhdGguYwotaW5kZXggYmNiZTIwODI5MDUuLjU3NTIy
OThiYmYyIDEwMDY0NAoraW5kZXggOGEyYmRhMDBmODAuLjkwOThhYjA0NGFiIDEwMDY0NAogLS0t
IGEvZ2NjL2luY3BhdGguYwogKysrIGIvZ2NjL2luY3BhdGguYwogQEAgLTI2LDYgKzI2LDcgQEAK
QEAgLTE5OCw2ICsxOTgsMyBAQCBpbmRleCBiY2JlMjA4MjkwNS4uNTc1MjI5OGJiZjIgMTAwNjQ0
CiAgfQogIAogIC8qIFVzZSBnaXZlbiAtSSBwYXRocyBmb3IgI2luY2x1ZGUgIi4uLiIgYnV0IG5v
dCAjaW5jbHVkZSAmbHQ7Li4uJmd0OywgYW5kCi0tLSAKLTIuMjUuMQotCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2djYy05LjMvMDAwMy1nY2MtNC4zLjMtU1lTUk9PVF9D
RkxBR1NfRk9SX1RBUkdFVC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2MvZ2NjLTEw
LjEvMDAwMy1nY2MtNC4zLjMtU1lTUk9PVF9DRkxBR1NfRk9SX1RBUkdFVC5wYXRjaApzaW1pbGFy
aXR5IGluZGV4IDkyJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2djYy05
LjMvMDAwMy1nY2MtNC4zLjMtU1lTUk9PVF9DRkxBR1NfRk9SX1RBUkdFVC5wYXRjaApyZW5hbWUg
dG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2djYy9nY2MtMTAuMS8wMDAzLWdjYy00LjMuMy1TWVNS
T09UX0NGTEFHU19GT1JfVEFSR0VULnBhdGNoCmluZGV4IDIzZWM1YmNlMDMuLmQyYTk2ZDkzOGIg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2MvZ2NjLTkuMy8wMDAzLWdjYy00
LjMuMy1TWVNST09UX0NGTEFHU19GT1JfVEFSR0VULnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9nY2MvZ2NjLTEwLjEvMDAwMy1nY2MtNC4zLjMtU1lTUk9PVF9DRkxBR1NfRk9SX1RB
UkdFVC5wYXRjaApAQCAtMSw3ICsxLDcgQEAKLUZyb20gZGY5MGRiZGJhN2E4NWMyMGJhZDk1ZGU3
MTUyNWYwZjQwMGE4NDlkMiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZDM2NTIyNjcy
MDBmZWJlYWNhNjE0ODU1NzczMTVmMzUzZTUyMzFmNSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
IEZyb206IEtoZW0gUmFqIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1h
aWx0bzpyYWoua2hlbUBnbWFpbC5jb20iPiZsdDtyYWoua2hlbUBnbWFpbC5jb20mZ3Q7PC9hPgog
RGF0ZTogRnJpLCAyOSBNYXIgMjAxMyAwOTowODozMSArMDQwMAotU3ViamVjdDogW1BBVENIIDAz
LzM5XSBnY2MtNC4zLjM6IFNZU1JPT1RfQ0ZMQUdTX0ZPUl9UQVJHRVQKK1N1YmplY3Q6IFtQQVRD
SF0gZ2NjLTQuMy4zOiBTWVNST09UX0NGTEFHU19GT1JfVEFSR0VUCiAKIEJlZm9yZSBjb21taXR0
aW5nLCBJIG5vdGljZWQgdGhhdCBQUi8zMjE2MSB3YXMgbWFya2VkIGFzIGEgZHVwIG9mIFBSLzMy
MDA5LCBidXQgbXkgcHJldmlvdXMgcGF0Y2ggZGlkIG5vdCBmaXggaXQuCiAKQEAgLTI2LDEwICsy
NiwxMCBAQCBVcHN0cmVhbS1TdGF0dXM6IFBlbmRpbmcKICAxIGZpbGUgY2hhbmdlZCwgMzIgaW5z
ZXJ0aW9ucygrKQogCiBkaWZmIC0tZ2l0IGEvY29uZmlndXJlIGIvY29uZmlndXJlCi1pbmRleCBi
MTIxMDg4ZDc3OC4uOTNhYWU1YmIyNmYgMTAwNzU1CitpbmRleCAyMjZhNjQ5MzlkMS4uYjMxZGMx
MzdmYzkgMTAwNzU1CiAtLS0gYS9jb25maWd1cmUKICsrKyBiL2NvbmZpZ3VyZQotQEAgLTY4NjQs
NiArNjg2NCwzOCBAQCBmaQorQEAgLTY5NzEsNiArNjk3MSwzOCBAQCBmaQogIAogIAogIApAQCAt
NjgsNiArNjgsMyBAQCBpbmRleCBiMTIxMDg4ZDc3OC4uOTNhYWU1YmIyNmYgMTAwNzU1CiAgIyBI
YW5kbGUgLS13aXRoLWhlYWRlcnM9WFhYLiAgSWYgdGhlIHZhbHVlIGlzIG5vdCAieWVzIiwgdGhl
IGNvbnRlbnRzIG9mCiAgIyB0aGUgbmFtZWQgZGlyZWN0b3J5IGFyZSBjb3BpZWQgdG8gJCh0b29s
ZGlyKS9zeXMtaW5jbHVkZS4KICBpZiB0ZXN0IHgiJHt3aXRoX2hlYWRlcnN9IiAhPSB4ICZhbXA7
JmFtcDsgdGVzdCB4IiR7d2l0aF9oZWFkZXJzfSIgIT0geG5vIDsgdGhlbgotLS0gCi0yLjI1LjEK
LQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2djYy9nY2MtOS4zLzAwMDQtNjQt
Yml0LW11bHRpbGliLWhhY2sucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2djYy0x
MC4xLzAwMDQtNjQtYml0LW11bHRpbGliLWhhY2sucGF0Y2gKc2ltaWxhcml0eSBpbmRleCA5NSUK
cmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2djYy9nY2MtOS4zLzAwMDQtNjQtYml0
LW11bHRpbGliLWhhY2sucGF0Y2gKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2Mv
Z2NjLTEwLjEvMDAwNC02NC1iaXQtbXVsdGlsaWItaGFjay5wYXRjaAppbmRleCAxN2VjODk4NmMx
Li4zYmMzOTAwODVmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2djYy05
LjMvMDAwNC02NC1iaXQtbXVsdGlsaWItaGFjay5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvZ2NjL2djYy0xMC4xLzAwMDQtNjQtYml0LW11bHRpbGliLWhhY2sucGF0Y2gKQEAgLTEs
NyArMSw3IEBACi1Gcm9tIDJlMDBkMGE5YTgwOTE1M2Y2OTM2NTllOTc3YzFlMDU1MDY2NWU2NWMg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDFlYWUyMDIwYTczM2Q5NGNhNzNkNDMzZjFk
ZWJkOTRjM2ViNzE2NWIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLaGVtIFJhaiA8
YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86cmFqLmtoZW1AZ21h
aWwuY29tIj4mbHQ7cmFqLmtoZW1AZ21haWwuY29tJmd0OzwvYT4KIERhdGU6IEZyaSwgMjkgTWFy
IDIwMTMgMDk6MTA6MDYgKzA0MDAKLVN1YmplY3Q6IFtQQVRDSCAwNC8zOV0gNjQtYml0IG11bHRp
bGliIGhhY2suCitTdWJqZWN0OiBbUEFUQ0hdIDY0LWJpdCBtdWx0aWxpYiBoYWNrLgogCiBHQ0Mg
aGFzIGludGVybmFsIG11bHRpbGliIGhhbmRsaW5nIGNvZGUgYnV0IGl0IGFzc3VtZXMgYSB2ZXJ5
IHNwZWNpZmljIHJpZ2lkIGRpcmVjdG9yeQogbGF5b3V0LiBUaGUgYnVpbGQgc3lzdGVtIGltcGxl
bWVudGF0aW9uIG9mIG11bHRpbGliIGxheW91dCBpcyB2ZXJ5IGdlbmVyaWMgYW5kIGFsbG93cwpA
QCAtMzcsNyArMzcsNyBAQCBTaWduZWQtb2ZmLWJ5OiBNYXJrIEhhdGxlIDxhIGNsYXNzPSJtb3ot
dHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzptYXJrLmhhdGxlQHdpbmRyaXZlci5jb20i
PiZsdDttYXJrLmhhdGxlQHdpbmRyaXZlci5jb20mZ3Q7PC9hPgogIDUgZmlsZXMgY2hhbmdlZCwg
MTUgaW5zZXJ0aW9ucygrKSwgMjAgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9nY2MvY29u
ZmlnL2FhcmNoNjQvdC1hYXJjaDY0LWxpbnV4IGIvZ2NjL2NvbmZpZy9hYXJjaDY0L3QtYWFyY2g2
NC1saW51eAotaW5kZXggNWFkNjcwYmEyY2UuLmUyNjAxOWU3MTU3IDEwMDY0NAoraW5kZXggODNl
NTllMzNiODUuLmIxMzU2YmUxZmI0IDEwMDY0NAogLS0tIGEvZ2NjL2NvbmZpZy9hYXJjaDY0L3Qt
YWFyY2g2NC1saW51eAogKysrIGIvZ2NjL2NvbmZpZy9hYXJjaDY0L3QtYWFyY2g2NC1saW51eAog
QEAgLTIxLDggKzIxLDggQEAKQEAgLTU0LDcgKzU0LDcgQEAgaW5kZXggNWFkNjcwYmEyY2UuLmUy
NjAxOWU3MTU3IDEwMDY0NAogLU1VTFRJTElCX09TRElSTkFNRVMgKz0gbWFiaS5pbHAzMj0uLi9s
aWJpbHAzMiQoY2FsbCBpZl9tdWx0aWFyY2gsOmFhcmNoNjQkKEFBUkNIX0JFKS1saW51eC1nbnVf
aWxwMzIpCiArI01VTFRJTElCX09TRElSTkFNRVMgKz0gbWFiaS5pbHAzMj0uLi9saWJpbHAzMiQo
Y2FsbCBpZl9tdWx0aWFyY2gsOmFhcmNoNjQkKEFBUkNIX0JFKS1saW51eC1nbnVfaWxwMzIpCiBk
aWZmIC0tZ2l0IGEvZ2NjL2NvbmZpZy9pMzg2L3QtbGludXg2NCBiL2djYy9jb25maWcvaTM4Ni90
LWxpbnV4NjQKLWluZGV4IGM2ODZhYjJmMGQyLi5jODJiNjBkYWRjZCAxMDA2NDQKK2luZGV4IDEx
NzFlMjE4NTc4Li41ZTA1N2I3ZTVkYiAxMDA2NDQKIC0tLSBhL2djYy9jb25maWcvaTM4Ni90LWxp
bnV4NjQKICsrKyBiL2djYy9jb25maWcvaTM4Ni90LWxpbnV4NjQKIEBAIC0zMiw3ICszMiw1IEBA
CkBAIC02OCw3ICs2OCw3IEBAIGluZGV4IGM2ODZhYjJmMGQyLi5jODJiNjBkYWRjZCAxMDA2NDQK
ICtNVUxUSUxJQl9ESVJOQU1FUyA9IC4gLgogK01VTFRJTElCX09TRElSTkFNRVMgPSAuLi8kKHNo
ZWxsIGJhc2VuYW1lICQoYmFzZV9saWJkaXIpKSAuLi8kKHNoZWxsIGJhc2VuYW1lICQoYmFzZV9s
aWJkaXIpKQogZGlmZiAtLWdpdCBhL2djYy9jb25maWcvbWlwcy90LWxpbnV4NjQgYi9nY2MvY29u
ZmlnL21pcHMvdC1saW51eDY0Ci1pbmRleCAzYTJmZjcwMGQ3ZC4uMTNlZjE5NTc2YjUgMTAwNjQ0
CitpbmRleCBjZWI1OGQzYjVmMy4uNDNmZTJiZjI4YWIgMTAwNjQ0CiAtLS0gYS9nY2MvY29uZmln
L21pcHMvdC1saW51eDY0CiArKysgYi9nY2MvY29uZmlnL21pcHMvdC1saW51eDY0CiBAQCAtMTcs
MTAgKzE3LDYgQEAKQEAgLTk4LDcgKzk4LDcgQEAgaW5kZXggMjE2ZDI3NzZhMTguLmU0ZDgxNzYy
MWZjIDEwMDY0NAogKyNNVUxUSUxJQl9PU0RJUk5BTUVTIDo9ICQocGF0c3Vic3QgbGliJSwuLi9s
aWIlLCQoTVVMVElMSUJfRElSTkFNRVMpKQogK01VTFRJTElCX09TRElSTkFNRVMgOj0gLi4vJChz
aGVsbCBiYXNlbmFtZSAkKGJhc2VfbGliZGlyKSkgLi4vJChzaGVsbCBiYXNlbmFtZSAkKGJhc2Vf
bGliZGlyKSkKIGRpZmYgLS1naXQgYS9nY2MvY29uZmlnL3JzNjAwMC90LWxpbnV4NjQgYi9nY2Mv
Y29uZmlnL3JzNjAwMC90LWxpbnV4NjQKLWluZGV4IGYzYzZlMmJlMWQ5Li5iZDAzOTMxNTVmYSAx
MDA2NDQKK2luZGV4IDI2NGE3ZTI3NTI0Li5kYzlkNDQwZjY2YiAxMDA2NDQKIC0tLSBhL2djYy9j
b25maWcvcnM2MDAwL3QtbGludXg2NAogKysrIGIvZ2NjL2NvbmZpZy9yczYwMDAvdC1saW51eDY0
CiBAQCAtMjYsMTAgKzI2LDkgQEAKQEAgLTExNCw2ICsxMTQsMyBAQCBpbmRleCBmM2M2ZTJiZTFk
OS4uYmQwMzkzMTU1ZmEgMTAwNjQ0CiAgCiAgcnM2MDAwLWxpbnV4Lm86ICQoc3JjZGlyKS9jb25m
aWcvcnM2MDAwL3JzNjAwMC1saW51eC5jCiAgCSQoQ09NUElMRSkgJCZsdDsKLS0tIAotMi4yNS4x
Ci0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2MvZ2NjLTkuMy8wMDA1LW9w
dGlvbmFsLWxpYnN0ZGMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2djYy0xMC4x
LzAwMDUtb3B0aW9uYWwtbGlic3RkYy5wYXRjaApzaW1pbGFyaXR5IGluZGV4IDg2JQpyZW5hbWUg
ZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2djYy05LjMvMDAwNS1vcHRpb25hbC1saWJz
dGRjLnBhdGNoCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2djYy0xMC4xLzAw
MDUtb3B0aW9uYWwtbGlic3RkYy5wYXRjaAppbmRleCAzYzI4YWVhYzYzLi4xMDE2MDQ0MGU1IDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2djYy05LjMvMDAwNS1vcHRpb25h
bC1saWJzdGRjLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2MvZ2NjLTEwLjEv
MDAwNS1vcHRpb25hbC1saWJzdGRjLnBhdGNoCkBAIC0xLDcgKzEsNyBAQAotRnJvbSA0MzVlNDU1
OTJlOTQ0MDE4ZjMzYmZmMzJmMTIwMmIwODcyYTIzMTQxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbSA2NDE2N2MyNzgzNTA4YmMxNGY3OGM2MDI2OTk5N2EwYTZmMTliMDhhIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPGEgY2xhc3M9Im1vei10eHQtbGluay1y
ZmMyMzk2RSIgaHJlZj0ibWFpbHRvOnJhai5raGVtQGdtYWlsLmNvbSI+Jmx0O3Jhai5raGVtQGdt
YWlsLmNvbSZndDs8L2E+CiBEYXRlOiBGcmksIDI5IE1hciAyMDEzIDA5OjEyOjU2ICswNDAwCi1T
dWJqZWN0OiBbUEFUQ0ggMDUvMzldIG9wdGlvbmFsIGxpYnN0ZGMKK1N1YmplY3Q6IFtQQVRDSF0g
b3B0aW9uYWwgbGlic3RkYwogCiBnY2MtcnVudGltZSBidWlsZHMgbGlic3RkYysrIHNlcGFyYXRl
bHkgZnJvbSBnY2MtY3Jvc3MtKi4gSXRzIGNvbmZpZ3VyZSB0ZXN0cyB1c2luZyBnKysKIHdpbGwg
bm90IHJ1biBjb3JyZWN0bHkgc2luY2UgYnkgZGVmYXVsdCB0aGUgbGlua2VyIHdpbGwgdHJ5IHRv
IGxpbmsgYWdhaW5zdCBsaWJzdGRjKysKQEAgLTI1LDEwICsyNSwxMCBAQCBVcHN0cmVhbS1TdGF0
dXM6IEluYXBwcm9wcmlhdGUgW2VtYmVkZGVkIHNwZWNpZmljXQogIDQgZmlsZXMgY2hhbmdlZCwg
MzcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvZ2NjL2MtZmFt
aWx5L2Mub3B0IGIvZ2NjL2MtZmFtaWx5L2Mub3B0Ci1pbmRleCA5MTZjYzY3YjQ1My4uNDE2MTlm
YTU5MWMgMTAwNjQ0CitpbmRleCBjNDlkYTk5ZDM5NS4uMzVmNzEyZTJjODQgMTAwNjQ0CiAtLS0g
YS9nY2MvYy1mYW1pbHkvYy5vcHQKICsrKyBiL2djYy9jLWZhbWlseS9jLm9wdAotQEAgLTE5NTIs
NiArMTk1MiwxMCBAQCBub3N0ZGluYysrCitAQCAtMjAyNSw2ICsyMDI1LDEwIEBAIG5vc3RkaW5j
KysKICBDKysgT2JqQysrCiAgRG8gbm90IHNlYXJjaCBzdGFuZGFyZCBzeXN0ZW0gaW5jbHVkZSBk
aXJlY3RvcmllcyBmb3IgQysrLgogIApAQCAtNDAsNyArNDAsNyBAQCBpbmRleCA5MTZjYzY3YjQ1
My4uNDE2MTlmYTU5MWMgMTAwNjQ0CiAgQyBPYmpDIEMrKyBPYmpDKysgSm9pbmVkIFNlcGFyYXRl
CiAgOyBEb2N1bWVudGVkIGluIGNvbW1vbi5vcHQKIGRpZmYgLS1naXQgYS9nY2MvY3AvZysrc3Bl
Yy5jIGIvZ2NjL2NwL2crK3NwZWMuYwotaW5kZXggNmM0NTc0YTgzN2QuLjBlMjY1N2YwMGVlIDEw
MDY0NAoraW5kZXggMGFiNjNiY2QyMTEuLjdiMDgxZTllNGYwIDEwMDY0NAogLS0tIGEvZ2NjL2Nw
L2crK3NwZWMuYwogKysrIGIvZ2NjL2NwL2crK3NwZWMuYwogQEAgLTEzNyw2ICsxMzcsNyBAQCBs
YW5nX3NwZWNpZmljX2RyaXZlciAoc3RydWN0IGNsX2RlY29kZWRfb3B0aW9uICoqaW5fZGVjb2Rl
ZF9vcHRpb25zLApAQCAtNTIsMTAgKzUyLDEwIEBAIGluZGV4IDZjNDU3NGE4MzdkLi4wZTI2NTdm
MDBlZSAxMDA2NDQKICAJICBsaWJyYXJ5ID0gLTE7CiAgCSAgYnJlYWs7CiBkaWZmIC0tZ2l0IGEv
Z2NjL2RvYy9pbnZva2UudGV4aSBiL2djYy9kb2MvaW52b2tlLnRleGkKLWluZGV4IGMzZDNkNTFh
MjhmLi4yZjdmZmU0NTZjMyAxMDA2NDQKK2luZGV4IGYxMmQ4ZDEyMTUwLi5jZjZjYjQyOGU3ZCAx
MDA2NDQKIC0tLSBhL2djYy9kb2MvaW52b2tlLnRleGkKICsrKyBiL2djYy9kb2MvaW52b2tlLnRl
eGkKLUBAIC0yMjgsNiArMjI4LDkgQEAgaW4gdGhlIGZvbGxvd2luZyBzZWN0aW9ucy4KK0BAIC0y
MzAsNiArMjMwLDkgQEAgaW4gdGhlIGZvbGxvd2luZyBzZWN0aW9ucy4KICAtZm5vLXdlYWsgIC1u
b3N0ZGluYysrIEBnb2wKICAtZnZpc2liaWxpdHktaW5saW5lcy1oaWRkZW4gQGdvbAogIC1mdmlz
aWJpbGl0eS1tcy1jb21wYXQgQGdvbApAQCAtNjMsOSArNjMsOSBAQCBpbmRleCBjM2QzZDUxYTI4
Zi4uMmY3ZmZlNDU2YzMgMTAwNjQ0CiArLWZ2dHYtY291bnRzIC1mdnR2LWRlYnVnIEBnb2wKICst
bm9zdGRsaWIrKyBAZ29sCiAgLWZleHQtbnVtZXJpYy1saXRlcmFscyBAZ29sCi0gLVdhYmk9QHZh
cntufSAgLVdhYmktdGFnICAtV2NvbnZlcnNpb24tbnVsbCAgLVdjdG9yLWR0b3ItcHJpdmFjeSBA
Z29sCi0gLVdkZWxldGUtbm9uLXZpcnR1YWwtZHRvciAgLVdkZXByZWNhdGVkLWNvcHkgIC1XZGVw
cmVjYXRlZC1jb3B5LWR0b3IgQGdvbAotQEAgLTUzOSw3ICs1NDIsNyBAQCBPYmplY3RpdmUtQyBh
bmQgT2JqZWN0aXZlLUMrKyBEaWFsZWN0c30uCisgLVdhYmktdGFnICAtV2NhdGNoLXZhbHVlICAt
V2NhdGNoLXZhbHVlPUB2YXJ7bn0gQGdvbAorIC1Xbm8tY2xhc3MtY29udmVyc2lvbiAgLVdjbGFz
cy1tZW1hY2Nlc3MgQGdvbAorQEAgLTU5OSw3ICs2MDIsNyBAQCBPYmplY3RpdmUtQyBhbmQgT2Jq
ZWN0aXZlLUMrKyBEaWFsZWN0c30uCiAgLXBpZSAgLXB0aHJlYWQgIC1yICAtcmR5bmFtaWMgQGdv
bAogIC1zICAtc3RhdGljICAtc3RhdGljLXBpZSAgLXN0YXRpYy1saWJnY2MgIC1zdGF0aWMtbGli
c3RkYysrIEBnb2wKICAtc3RhdGljLWxpYmFzYW4gIC1zdGF0aWMtbGlidHNhbiAgLXN0YXRpYy1s
aWJsc2FuICAtc3RhdGljLWxpYnVic2FuIEBnb2wKQEAgLTc0LDcgKzc0LDcgQEAgaW5kZXggYzNk
M2Q1MWEyOGYuLjJmN2ZmZTQ1NmMzIDEwMDY0NAogIC1UIEB2YXJ7c2NyaXB0fSAgLVdsLEB2YXJ7
b3B0aW9ufSAgLVhsaW5rZXIgQHZhcntvcHRpb259IEBnb2wKICAtdSBAdmFye3N5bWJvbH0gIC16
IEB2YXJ7a2V5d29yZH19CiAgCi1AQCAtMTMzMjEsNiArMTMzMjQsMzMgQEAgU3BlY2lmeSB0aGF0
IHRoZSBwcm9ncmFtIGVudHJ5IHBvaW50IGlzIEB2YXJ7ZW50cnl9LiAgVGhlIGFyZ3VtZW50IGlz
CitAQCAtMTQ0MDcsNiArMTQ0MTAsMzMgQEAgU3BlY2lmeSB0aGF0IHRoZSBwcm9ncmFtIGVudHJ5
IHBvaW50IGlzIEB2YXJ7ZW50cnl9LiAgVGhlIGFyZ3VtZW50IGlzCiAgaW50ZXJwcmV0ZWQgYnkg
dGhlIGxpbmtlcjsgdGhlIEdOVSBsaW5rZXIgYWNjZXB0cyBlaXRoZXIgYSBzeW1ib2wgbmFtZQog
IG9yIGFuIGFkZHJlc3MuCiAgCkBAIC0xMDksMTAgKzEwOSwxMCBAQCBpbmRleCBjM2QzZDUxYTI4
Zi4uMmY3ZmZlNDU2YzMgMTAwNjQ0CiAgQG9waW5kZXggcGllCiAgUHJvZHVjZSBhIGR5bmFtaWNh
bGx5IGxpbmtlZCBwb3NpdGlvbiBpbmRlcGVuZGVudCBleGVjdXRhYmxlIG9uIHRhcmdldHMKIGRp
ZmYgLS1naXQgYS9nY2MvZ2NjLmMgYi9nY2MvZ2NjLmMKLWluZGV4IGEyNjAxYTZiYjA2Li5jZDZj
NmZjOTVkYiAxMDA2NDQKK2luZGV4IGIyMjAwYzUxODVhLi5mOGJlNThjZTBhNiAxMDA2NDQKIC0t
LSBhL2djYy9nY2MuYwogKysrIGIvZ2NjL2djYy5jCi1AQCAtMTA1Miw2ICsxMDUyLDcgQEAgcHJv
cGVyIHBvc2l0aW9uIGFtb25nIHRoZSBvdGhlciBvdXRwdXQgZmlsZXMuICAqLworQEAgLTEwNTEs
NiArMTA1MSw3IEBAIHByb3BlciBwb3NpdGlvbiBhbW9uZyB0aGUgb3RoZXIgb3V0cHV0IGZpbGVz
LiAgKi8KICAgICAgJShtZmxpYikgIiBTVEFDS19TUExJVF9TUEVDICJcCiAgICAgICV7ZnByb2Zp
bGUtYXJjc3xmcHJvZmlsZS1nZW5lcmF0ZSp8Y292ZXJhZ2U6LWxnY292fSAiIFNBTklUSVpFUl9T
UEVDICIgXAogICAgICAleyFub3N0ZGxpYjoleyFyOiV7IW5vZGVmYXVsdGxpYnM6JShsaW5rX3Nz
cCkgJShsaW5rX2djY19jX3NlcXVlbmNlKX19fVwKQEAgLTEyMCw2ICsxMjAsMyBAQCBpbmRleCBh
MjYwMWE2YmIwNi4uY2Q2YzZmYzk1ZGIgMTAwNjQ0CiAgICAgICV7IW5vc3RkbGliOiV7IXI6JXsh
bm9zdGFydGZpbGVzOiVFfX19ICV7VCp9ICBcbiUocG9zdF9saW5rKSB9fX19fX0iCiAgI2VuZGlm
CiAgCi0tLSAKLTIuMjUuMQotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2Nj
L2djYy05LjMvMDAwNi1DT0xMRUNUX0dDQ19PUFRJT05TLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2djYy9nY2MtMTAuMS8wMDA2LUNPTExFQ1RfR0NDX09QVElPTlMucGF0Y2gKc2ltaWxh
cml0eSBpbmRleCA4MCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2djYy9nY2Mt
OS4zLzAwMDYtQ09MTEVDVF9HQ0NfT1BUSU9OUy5wYXRjaApyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2djYy9nY2MtMTAuMS8wMDA2LUNPTExFQ1RfR0NDX09QVElPTlMucGF0Y2gKaW5k
ZXggOTA2ZjNhNzMxNy4uOGU5ZmMxN2M5NyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2djYy9nY2MtOS4zLzAwMDYtQ09MTEVDVF9HQ0NfT1BUSU9OUy5wYXRjaAorKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2djYy0xMC4xLzAwMDYtQ09MTEVDVF9HQ0NfT1BUSU9OUy5w
YXRjaApAQCAtMSw3ICsxLDcgQEAKLUZyb20gYzk5Njg0NDc3ZWM2NmYyOTBlYzc0ZWZlNzMyYWNk
M2MyNGRiN2RjYyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMWU5YTBiYzYwYjE3OWQ5
YTE5OTAyOGFhYmJkYjcyYzRlY2RkM2I5YiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206
IEtoZW0gUmFqIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzpy
YWoua2hlbUBnbWFpbC5jb20iPiZsdDtyYWoua2hlbUBnbWFpbC5jb20mZ3Q7PC9hPgogRGF0ZTog
RnJpLCAyOSBNYXIgMjAxMyAwOToxNjoyOCArMDQwMAotU3ViamVjdDogW1BBVENIIDA2LzM5XSBD
T0xMRUNUX0dDQ19PUFRJT05TCitTdWJqZWN0OiBbUEFUQ0hdIENPTExFQ1RfR0NDX09QVElPTlMK
IAogVGhpcyBwYXRjaCBhZGRzIC0tc3lzcm9vdCBpbnRvIENPTExFQ1RfR0NDX09QVElPTlMgd2hp
Y2ggaXMgdXNlZCB0bwogaW52b2tlIGNvbGxlY3QyLgpAQCAtMTQsMTAgKzE0LDEwIEBAIFVwc3Ry
ZWFtLVN0YXR1czogUGVuZGluZwogIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykKIAog
ZGlmZiAtLWdpdCBhL2djYy9nY2MuYyBiL2djYy9nY2MuYwotaW5kZXggY2Q2YzZmYzk1ZGIuLjdk
YTljNWQ0NTdiIDEwMDY0NAoraW5kZXggZjhiZTU4Y2UwYTYuLjQ4YjBmOWRkZTgxIDEwMDY0NAog
LS0tIGEvZ2NjL2djYy5jCiArKysgYi9nY2MvZ2NjLmMKLUBAIC00ODA0LDYgKzQ4MDQsMTUgQEAg
c2V0X2NvbGxlY3RfZ2NjX29wdGlvbnMgKHZvaWQpCitAQCAtNDgwNiw2ICs0ODA2LDE1IEBAIHNl
dF9jb2xsZWN0X2djY19vcHRpb25zICh2b2lkKQogIAkJc2l6ZW9mICgiQ09MTEVDVF9HQ0NfT1BU
SU9OUz0iKSAtIDEpOwogIAogICAgZmlyc3RfdGltZSA9IFRSVUU7CkBAIC0zMyw2ICszMywzIEBA
IGluZGV4IGNkNmM2ZmM5NWRiLi43ZGE5YzVkNDU3YiAxMDA2NDQKICAgIGZvciAoaSA9IDA7IChp
bnQpIGkgJmx0OyBuX3N3aXRjaGVzOyBpKyspCiAgICAgIHsKICAgICAgICBjb25zdCBjaGFyICpj
b25zdCAqYXJnczsKLS0tIAotMi4yNS4xCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9nY2MvZ2NjLTkuMy8wMDA3LVVzZS10aGUtZGVmYXVsdHMuaC1pbi1CLWluc3RlYWQtb2Yt
Uy1hbmQtdC1vZS1pbi1CLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2djYy9nY2MtMTAu
MS8wMDA3LVVzZS10aGUtZGVmYXVsdHMuaC1pbi1CLWluc3RlYWQtb2YtUy1hbmQtdC1vZS1pbi1C
LnBhdGNoCnNpbWlsYXJpdHkgaW5kZXggODclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0
b29scy9nY2MvZ2NjLTkuMy8wMDA3LVVzZS10aGUtZGVmYXVsdHMuaC1pbi1CLWluc3RlYWQtb2Yt
Uy1hbmQtdC1vZS1pbi1CLnBhdGNoCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2Nj
L2djYy0xMC4xLzAwMDctVXNlLXRoZS1kZWZhdWx0cy5oLWluLUItaW5zdGVhZC1vZi1TLWFuZC10
LW9lLWluLUIucGF0Y2gKaW5kZXggNjhhODc2Y2I5NS4uMWYzYWJkMjliNiAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2djYy9nY2MtOS4zLzAwMDctVXNlLXRoZS1kZWZhdWx0cy5o
LWluLUItaW5zdGVhZC1vZi1TLWFuZC10LW9lLWluLUIucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2djYy9nY2MtMTAuMS8wMDA3LVVzZS10aGUtZGVmYXVsdHMuaC1pbi1CLWluc3Rl
YWQtb2YtUy1hbmQtdC1vZS1pbi1CLnBhdGNoCkBAIC0xLDggKzEsNyBAQAotRnJvbSBkNmY0ZWRh
YWIwYWQwZTc0MmZiMWUzYTZmNzY5MDhhMmFjOTkyN2Q1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbSA1MDIyZDcxNjk0ZmQ0MWRlZWIwNzg5ZjU5NzQ2OGUwNWFlYWZjMjJkIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPGEgY2xhc3M9Im1vei10eHQtbGluay1y
ZmMyMzk2RSIgaHJlZj0ibWFpbHRvOnJhai5raGVtQGdtYWlsLmNvbSI+Jmx0O3Jhai5raGVtQGdt
YWlsLmNvbSZndDs8L2E+CiBEYXRlOiBGcmksIDI5IE1hciAyMDEzIDA5OjE3OjI1ICswNDAwCi1T
dWJqZWN0OiBbUEFUQ0ggMDcvMzldIFVzZSB0aGUgZGVmYXVsdHMuaCBpbiAke0J9IGluc3RlYWQg
b2YgJHtTfSwgYW5kIHQtb2UgaW4KLSAke0J9CitTdWJqZWN0OiBbUEFUQ0hdIFVzZSB0aGUgZGVm
YXVsdHMuaCBpbiAke0J9IGluc3RlYWQgb2YgJHtTfSwgYW5kIHQtb2UgaW4gJHtCfQogCiBVc2Ug
dGhlIGRlZmF1bHRzLmggaW4gJHtCfSBpbnN0ZWFkIG9mICR7U30sIGFuZCB0LW9lIGluICR7Qn0s
IHNvIHRoYXQKIHRoZSBzb3VyY2UgY2FuIGJlIHNoYXJlZCBiZXR3ZWVuIGdjYy1jcm9zcy1pbml0
aWFsLApAQCAtMjcsNyArMjYsNyBAQCBTaWduZWQtb2ZmLWJ5OiBIb25neHUgSmlhIDxhIGNsYXNz
PSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzpob25neHUuamlhQHdpbmRyaXZl
ci5jb20iPiZsdDtob25neHUuamlhQHdpbmRyaXZlci5jb20mZ3Q7PC9hPgogIDQgZmlsZXMgY2hh
bmdlZCwgNyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvZ2Nj
L01ha2VmaWxlLmluIGIvZ2NjL01ha2VmaWxlLmluCi1pbmRleCBhYmFlODcyY2Q2My4uZmVmNmM0
YzYxZTMgMTAwNjQ0CitpbmRleCA1NDNiNDc3ZmYxOC4uYTY3ZDJjYzE4ZDYgMTAwNjQ0CiAtLS0g
YS9nY2MvTWFrZWZpbGUuaW4KICsrKyBiL2djYy9NYWtlZmlsZS5pbgogQEAgLTU0MCw3ICs1NDAs
NyBAQCBUQVJHRVRfU1lTVEVNX1JPT1QgPSBAVEFSR0VUX1NZU1RFTV9ST09UQApAQCAtNDAsMTAg
KzM5LDEwIEBAIGluZGV4IGFiYWU4NzJjZDYzLi5mZWY2YzRjNjFlMyAxMDA2NDQKICBUTV9NVUxU
SUxJQl9DT05GSUc9QFRNX01VTFRJTElCX0NPTkZJR0AKICBUTV9NVUxUSUxJQl9FWENFUFRJT05T
X0NPTkZJRz1AVE1fTVVMVElMSUJfRVhDRVBUSU9OU19DT05GSUdACiBkaWZmIC0tZ2l0IGEvZ2Nj
L2NvbmZpZ3VyZSBiL2djYy9jb25maWd1cmUKLWluZGV4IDJlMjZkZDMzMzEwLi5lZDc5MzFkYWVk
MyAxMDA3NTUKK2luZGV4IDhkZTc2NmE5NDJjLi5iMjZlOGZjN2ZlZSAxMDA3NTUKIC0tLSBhL2dj
Yy9jb25maWd1cmUKICsrKyBiL2djYy9jb25maWd1cmUKLUBAIC0xMjM0Miw4ICsxMjM0Miw4IEBA
IGZvciBmIGluICR0bV9maWxlOyBkbworQEAgLTEyNzA1LDggKzEyNzA1LDggQEAgZm9yIGYgaW4g
JHRtX2ZpbGU7IGRvCiAgICAgICAgIHRtX2luY2x1ZGVfbGlzdD0iJHt0bV9pbmNsdWRlX2xpc3R9
ICRmIgogICAgICAgICA7OwogICAgICBkZWZhdWx0cy5oICkKQEAgLTU1LDEwICs1NCwxMCBAQCBp
bmRleCAyZTI2ZGQzMzMxMC4uZWQ3OTMxZGFlZDMgMTAwNzU1CiAgICAgICogKQogICAgICAgICB0
bV9maWxlX2xpc3Q9IiR7dG1fZmlsZV9saXN0fSBcJChzcmNkaXIpL2NvbmZpZy8kZiIKIGRpZmYg
LS1naXQgYS9nY2MvY29uZmlndXJlLmFjIGIvZ2NjL2NvbmZpZ3VyZS5hYwotaW5kZXggMTJkMWQw
NGU2NDUuLmUwNTAwZTMwZDUwIDEwMDY0NAoraW5kZXggOGJmZDZmZWI3ODAuLjI2ZmE0NjgwMmM3
IDEwMDY0NAogLS0tIGEvZ2NjL2NvbmZpZ3VyZS5hYwogKysrIGIvZ2NjL2NvbmZpZ3VyZS5hYwot
QEAgLTE5NjgsOCArMTk2OCw4IEBAIGZvciBmIGluICR0bV9maWxlOyBkbworQEAgLTIxMzgsOCAr
MjEzOCw4IEBAIGZvciBmIGluICR0bV9maWxlOyBkbwogICAgICAgICB0bV9pbmNsdWRlX2xpc3Q9
IiR7dG1faW5jbHVkZV9saXN0fSAkZiIKICAgICAgICAgOzsKICAgICAgZGVmYXVsdHMuaCApCkBA
IC03MCw3ICs2OSw3IEBAIGluZGV4IDEyZDFkMDRlNjQ1Li5lMDUwMGUzMGQ1MCAxMDA2NDQKICAg
ICAgKiApCiAgICAgICAgIHRtX2ZpbGVfbGlzdD0iJHt0bV9maWxlX2xpc3R9IFwkKHNyY2Rpcikv
Y29uZmlnLyRmIgogZGlmZiAtLWdpdCBhL2djYy9ta2NvbmZpZy5zaCBiL2djYy9ta2NvbmZpZy5z
aAotaW5kZXggMzA4Yjg3ZDBjYzEuLjE5MDY4Y2JjMjRhIDEwMDY0NAoraW5kZXggZDJjNjc3YTRh
NDIuLmQwMzg1MjQ4MWNiIDEwMDY0NAogLS0tIGEvZ2NjL21rY29uZmlnLnNoCiArKysgYi9nY2Mv
bWtjb25maWcuc2gKIEBAIC03Nyw3ICs3Nyw3IEBAIGlmIFsgLW4gIiRIRUFERVJTIiBdOyB0aGVu
CkBAIC05MSw2ICs5MCwzIEBAIGluZGV4IDMwOGI4N2QwY2MxLi4xOTA2OGNiYzI0YSAxMDA2NDQK
ICBmaQogIAogICMgQWRkIG11bHRpcGxlIGluY2x1c2lvbiBwcm90ZWN0aW9uIGd1YXJkLCBwYXJ0
IHR3by4KLS0tIAotMi4yNS4xCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9n
Y2MvZ2NjLTkuMy8wMDA4LWZvcnRyYW4tY3Jvc3MtY29tcGlsZS1oYWNrLnBhdGNoIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2djYy9nY2MtMTAuMS8wMDA4LWZvcnRyYW4tY3Jvc3MtY29tcGlsZS1o
YWNrLnBhdGNoCnNpbWlsYXJpdHkgaW5kZXggODElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9nY2MvZ2NjLTkuMy8wMDA4LWZvcnRyYW4tY3Jvc3MtY29tcGlsZS1oYWNrLnBhdGNo
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2djYy0xMC4xLzAwMDgtZm9ydHJh
bi1jcm9zcy1jb21waWxlLWhhY2sucGF0Y2gKaW5kZXggNmFjZDJiMGNmOS4uMGQ5ZDAwN2UwYSAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2djYy9nY2MtOS4zLzAwMDgtZm9ydHJh
bi1jcm9zcy1jb21waWxlLWhhY2sucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dj
Yy9nY2MtMTAuMS8wMDA4LWZvcnRyYW4tY3Jvc3MtY29tcGlsZS1oYWNrLnBhdGNoCkBAIC0xLDcg
KzEsNyBAQAotRnJvbSAyYzUxNGFkYTM2ZmZiZjcwMTc3OTA5ZjYzM2U5ZjY4ODExZGU2MWUwIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBlOTE1NDczYzIxZTkzNTBkNDZmMmMwMzhmMDJi
YjNjMTNjZmVkZWI0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPGEg
Y2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOnJhai5raGVtQGdtYWls
LmNvbSI+Jmx0O3Jhai5raGVtQGdtYWlsLmNvbSZndDs8L2E+CiBEYXRlOiBGcmksIDI5IE1hciAy
MDEzIDA5OjIwOjAxICswNDAwCi1TdWJqZWN0OiBbUEFUQ0ggMDgvMzldIGZvcnRyYW4gY3Jvc3Mt
Y29tcGlsZSBoYWNrLgorU3ViamVjdDogW1BBVENIXSBmb3J0cmFuIGNyb3NzLWNvbXBpbGUgaGFj
ay4KIAogKiBGb3J0cmFuIHdvdWxkIGhhdmUgc2VhcmNoZWQgZm9yIGFybS1hbmdzdHJvbS1nbnVl
YWJpLWdmb3J0cmFuIGJ1dCB3b3VsZCBoYXZlIHVzZWQKIHVzZWQgZ2ZvcnRhbi4gRm9yIGdjY180
LjIuMi5iYiB3ZSB3YW50IHRvIHVzZSB0aGUgZ2ZvcnRyYW4gY29tcGlsZXIgZnJvbSBvdXIgY3Jv
c3MKQEAgLTE2LDEwICsxNiwxMCBAQCBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW2Vt
YmVkZGVkIHNwZWNpZmljXQogIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvbGliZ2ZvcnRyYW4vY29uZmlndXJlIGIvbGliZ2Zv
cnRyYW4vY29uZmlndXJlCi1pbmRleCA2MDg2N2I5M2QwZS4uM2ZjOWZjYTViN2IgMTAwNzU1Citp
bmRleCBiNGNmODU0ZGRiMy4uZThlMGFjM2IxY2YgMTAwNzU1CiAtLS0gYS9saWJnZm9ydHJhbi9j
b25maWd1cmUKICsrKyBiL2xpYmdmb3J0cmFuL2NvbmZpZ3VyZQotQEAgLTEzMDcxLDcgKzEzMDcx
LDcgQEAgZXNhYworQEAgLTEzMDkwLDcgKzEzMDkwLDcgQEAgZXNhYwogIAogICMgV2UgbmVlZCBn
Zm9ydHJhbiB0byBjb21waWxlIHBhcnRzIG9mIHRoZSBsaWJyYXJ5CiAgI0FDX1BST0dfRkMoZ2Zv
cnRyYW4pCkBAIC0yOSwxMCArMjksMTAgQEAgaW5kZXggNjA4NjdiOTNkMGUuLjNmYzlmY2E1Yjdi
IDEwMDc1NQogIGFjX2NvbXBpbGU9JyRGQyAtYyAkRkNGTEFHUyAkYWNfZmNmbGFnc19zcmNleHQg
Y29uZnRlc3QuJGFjX2V4dCAmZ3Q7JmFtcDs1JwogIGFjX2xpbms9JyRGQyAtbyBjb25mdGVzdCRh
Y19leGVleHQgJEZDRkxBR1MgJExERkxBR1MgJGFjX2ZjZmxhZ3Nfc3JjZXh0IGNvbmZ0ZXN0LiRh
Y19leHQgJExJQlMgJmd0OyZhbXA7NScKIGRpZmYgLS1naXQgYS9saWJnZm9ydHJhbi9jb25maWd1
cmUuYWMgYi9saWJnZm9ydHJhbi9jb25maWd1cmUuYWMKLWluZGV4IDdjZmNlMjhhYjY5Li42Y2Q1
MTVlZTFhNCAxMDA2NDQKK2luZGV4IDcxMWRjNjBmZjc4Li4zYzliYmZiZjQ3ZCAxMDA2NDQKIC0t
LSBhL2xpYmdmb3J0cmFuL2NvbmZpZ3VyZS5hYwogKysrIGIvbGliZ2ZvcnRyYW4vY29uZmlndXJl
LmFjCi1AQCAtMjUwLDcgKzI1MCw3IEBAIEFDX1NVQlNUKGVuYWJsZV9zdGF0aWMpCitAQCAtMjU4
LDcgKzI1OCw3IEBAIEFDX1NVQlNUKGVuYWJsZV9zdGF0aWMpCiAgCiAgIyBXZSBuZWVkIGdmb3J0
cmFuIHRvIGNvbXBpbGUgcGFydHMgb2YgdGhlIGxpYnJhcnkKICAjQUNfUFJPR19GQyhnZm9ydHJh
bikKQEAgLTQxLDYgKzQxLDMgQEAgaW5kZXggN2NmY2UyOGFiNjkuLjZjZDUxNWVlMWE0IDEwMDY0
NAogIEFDX1BST0dfRkMoZ2ZvcnRyYW4pCiAgCiAgIyBleHRyYSBMRCBGbGFncyB3aGljaCBhcmUg
cmVxdWlyZWQgZm9yIHRhcmdldHMKLS0tIAotMi4yNS4xCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9nY2MvZ2NjLTkuMy8wMDA5LWNwcC1ob25vci1zeXNyb290LnBhdGNoIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2djYy9nY2MtMTAuMS8wMDA5LWNwcC1ob25vci1zeXNyb290
LnBhdGNoCnNpbWlsYXJpdHkgaW5kZXggODclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0
b29scy9nY2MvZ2NjLTkuMy8wMDA5LWNwcC1ob25vci1zeXNyb290LnBhdGNoCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2djYy0xMC4xLzAwMDktY3BwLWhvbm9yLXN5c3Jvb3Qu
cGF0Y2gKaW5kZXggNWE5ZTUyNzYwNi4uNGM1ODE5NmEyZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2djYy9nY2MtOS4zLzAwMDktY3BwLWhvbm9yLXN5c3Jvb3QucGF0Y2gKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2djYy9nY2MtMTAuMS8wMDA5LWNwcC1ob25vci1zeXNy
b290LnBhdGNoCkBAIC0xLDcgKzEsNyBAQAotRnJvbSAwYTdjMDNhOWNmOTI1YmEwOWE1MTBhMzJl
Njg0ZjAxZWM1YTUwNjUwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA0YzA1ZDA5NzA5
MDQyODk3MmU3ZDkwNTMwODUxMTUzODA5Y2I3MzRkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQog
RnJvbTogS2hlbSBSYWogPGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0ibWFp
bHRvOnJhai5raGVtQGdtYWlsLmNvbSI+Jmx0O3Jhai5raGVtQGdtYWlsLmNvbSZndDs8L2E+CiBE
YXRlOiBGcmksIDI5IE1hciAyMDEzIDA5OjIyOjAwICswNDAwCi1TdWJqZWN0OiBbUEFUQ0ggMDkv
MzldIGNwcDogaG9ub3Igc3lzcm9vdC4KK1N1YmplY3Q6IFtQQVRDSF0gY3BwOiBob25vciBzeXNy
b290LgogCiBDdXJyZW50bHksIGlmIHRoZSBnY2MgdG9vbGNoYWluIGlzIHJlbG9jYXRlZCBhbmQg
aW5zdGFsbGVkIGZyb20gc3N0YXRlLCB0aGVuIHlvdSB0cnkgYW5kIGNvbXBpbGUKIHByZXByb2Nl
c3NlZCBzb3VyY2UgKC5pIG9yIC5paSBmaWxlcyksIHRoZSBjb21waWxlciB3aWxsIHRyeSBhbmQg
YWNjZXNzIHRoZSBidWlsdGluIHN5c3Jvb3QgbG9jYXRpb24KQEAgLTI2LDcgKzI2LDcgQEAgVXBz
dHJlYW0tU3RhdHVzOiBQZW5kaW5nCiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9nY2MvY3AvbGFuZy1zcGVjcy5oIGIvZ2Nj
L2NwL2xhbmctc3BlY3MuaAotaW5kZXggYzZlNDJlZGEyODMuLmUxZGRmMDY2NDY3IDEwMDY0NAor
aW5kZXggMGFkNGEzM2I5M2UuLjE2Yzc0NGY0ZjkwIDEwMDY0NAogLS0tIGEvZ2NjL2NwL2xhbmct
c3BlY3MuaAogKysrIGIvZ2NjL2NwL2xhbmctc3BlY3MuaAogQEAgLTY2LDUgKzY2LDUgQEAgYWxv
bmcgd2l0aCBHQ0M7IHNlZSB0aGUgZmlsZSBDT1BZSU5HMy4gIElmIG5vdCBzZWUKQEAgLTM3LDEw
ICszNywxMCBAQCBpbmRleCBjNmU0MmVkYTI4My4uZTFkZGYwNjY0NjcgMTAwNjQ0CiArICAgICAg
IiAgY2MxcGx1cyAtZnByZXByb2Nlc3NlZCAlaSAlSSAlKGNjMV9vcHRpb25zKSAlMiIKICAgICAg
ICAiICAleyFmc3ludGF4LW9ubHk6JShpbnZva2VfYXMpfX19fSIsIDAsIDAsIDB9LAogZGlmZiAt
LWdpdCBhL2djYy9nY2MuYyBiL2djYy9nY2MuYwotaW5kZXggN2RhOWM1ZDQ1N2IuLjRlN2M0NWIy
NjhjIDEwMDY0NAoraW5kZXggNDhiMGY5ZGRlODEuLmM4N2Y2MDM5NTVmIDEwMDY0NAogLS0tIGEv
Z2NjL2djYy5jCiArKysgYi9nY2MvZ2NjLmMKLUBAIC0xMzQ5LDcgKzEzNDksNyBAQCBzdGF0aWMg
Y29uc3Qgc3RydWN0IGNvbXBpbGVyIGRlZmF1bHRfY29tcGlsZXJzW10gPQorQEAgLTEzNDgsNyAr
MTM0OCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgY29tcGlsZXIgZGVmYXVsdF9jb21waWxlcnNb
XSA9CiAgCQkJCQkgICAlV3tvKjotLW91dHB1dC1wY2g9JSp9fSVWfX19fX19fSIsIDAsIDAsIDB9
LAogICAgeyIuaSIsICJAY3BwLW91dHB1dCIsIDAsIDAsIDB9LAogICAgeyJAY3BwLW91dHB1dDxh
IGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzosQEAtNDksNis0OSwz
QEBpbmRleDdkYTljNWQ0NTdiLi40ZTdjNDViMjY4YzEwMDY0NHsiPiIsCkBAIC00OSw2ICs0OSwz
IEBAIGluZGV4IDdkYTljNWQ0NTdiLi40ZTdjNDViMjY4YyAxMDA2NDQKICAgIHsiPC9hPi5zIiwg
IkBhc3NlbWJsZXIiLCAwLCAwLCAwfSwKICAgIHsiQGFzc2VtYmxlciIsCiAgICAgIiV7IU06JXsh
TU06JXshRToleyFTOmFzICUoYXNtX2RlYnVnKSAlKGFzbV9vcHRpb25zKSAlaSAlQSB9fX19Iiwg
MCwgMCwgMH0sCi0tLSAKLTIuMjUuMQotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvZ2NjL2djYy05LjMvMDAxMC1NSVBTNjQtRGVmYXVsdC10by1ONjQtQUJJLnBhdGNoIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2djYy9nY2MtMTAuMS8wMDEwLU1JUFM2NC1EZWZhdWx0LXRvLU42
NC1BQkkucGF0Y2gKc2ltaWxhcml0eSBpbmRleCA4NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2djYy9nY2MtOS4zLzAwMTAtTUlQUzY0LURlZmF1bHQtdG8tTjY0LUFCSS5wYXRj
aApyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2djYy9nY2MtMTAuMS8wMDEwLU1JUFM2
NC1EZWZhdWx0LXRvLU42NC1BQkkucGF0Y2gKaW5kZXggYTgxMDNiOTUxZS4uM2I3ZjRjNjMxYiAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2djYy9nY2MtOS4zLzAwMTAtTUlQUzY0
LURlZmF1bHQtdG8tTjY0LUFCSS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2Nj
L2djYy0xMC4xLzAwMTAtTUlQUzY0LURlZmF1bHQtdG8tTjY0LUFCSS5wYXRjaApAQCAtMSw3ICsx
LDcgQEAKLUZyb20gMzc0YWFiNmE4ODIwMGZiZDczNDM0NjdkOTdmN2VlNjQ1NWJiY2U2MSBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gY2U3MmQ4MTc1MDdhNTJjZDRmZTM2NWIzY2Q4ZjFl
MjA2ZGJhNTg0MyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxhIGNs
YXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzpyYWoua2hlbUBnbWFpbC5j
b20iPiZsdDtyYWoua2hlbUBnbWFpbC5jb20mZ3Q7PC9hPgogRGF0ZTogRnJpLCAyOSBNYXIgMjAx
MyAwOToyMzowOCArMDQwMAotU3ViamVjdDogW1BBVENIIDEwLzM5XSBNSVBTNjQ6IERlZmF1bHQg
dG8gTjY0IEFCSQorU3ViamVjdDogW1BBVENIXSBNSVBTNjQ6IERlZmF1bHQgdG8gTjY0IEFCSQog
CiBNSVBTNjQgZGVmYXVsdHMgdG8gbjMyIEFCSSwgdGhpcyBwYXRjaCBtYWtlcyBpdAogc28gdGhh
dCBpdCBkZWZhdWx0cyB0byBONjQgQUJJCkBAIC0xNCwxMCArMTQsMTAgQEAgVXBzdHJlYW0tU3Rh
dHVzOiBJbmFwcHJvcHJpYXRlIFtPRSBjb25maWcgc3BlY2lmaWNdCiAgMSBmaWxlIGNoYW5nZWQs
IDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL2djYy9jb25m
aWcuZ2NjIGIvZ2NjL2NvbmZpZy5nY2MKLWluZGV4IGIyMjgyZWNkZjBiLi42OWMwZTRhMDA1YiAx
MDA2NDQKK2luZGV4IGNmMWE4N2UyZWZkLi4zN2M0MjIxYTM5ZiAxMDA2NDQKIC0tLSBhL2djYy9j
b25maWcuZ2NjCiArKysgYi9nY2MvY29uZmlnLmdjYwotQEAgLTIyODIsMjkgKzIyODIsMjkgQEAg
bWlwcyotKi1saW51eCopCQkJCSMgTGludXggTUlQUywgZWl0aGVyIGVuZGlhbi4KK0BAIC0yNTEx
LDI5ICsyNTExLDI5IEBAIG1pcHMqLSotbGludXgqKQkJCQkjIExpbnV4IE1JUFMsIGVpdGhlciBl
bmRpYW4uCiAgCQkJZGVmYXVsdF9taXBzX2FyY2g9bWlwczMyCiAgCQkJOzsKICAJCW1pcHM2NGVs
LXN0LWxpbnV4LWdudSkKQEAgLTUyLDYgKzUyLDMgQEAgaW5kZXggYjIyODJlY2RmMGIuLjY5YzBl
NGEwMDViIDEwMDY0NAogIAkJCWVuYWJsZV9taXBzX211bHRpbGlicz0ieWVzIgogIAkJCTs7CiAg
CWVzYWMKLS0tIAotMi4yNS4xCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9n
Y2MvZ2NjLTkuMy8wMDExLURlZmluZS1HTElCQ19EWU5BTUlDX0xJTktFUi1hbmQtVUNMSUJDX0RZ
TkFNSUNfTElOS0UucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2djYy0xMC4xLzAw
MTEtRGVmaW5lLUdMSUJDX0RZTkFNSUNfTElOS0VSLWFuZC1VQ0xJQkNfRFlOQU1JQ19MSU5LRS5w
YXRjaApzaW1pbGFyaXR5IGluZGV4IDkzJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvZ2NjL2djYy05LjMvMDAxMS1EZWZpbmUtR0xJQkNfRFlOQU1JQ19MSU5LRVItYW5kLVVDTElC
Q19EWU5BTUlDX0xJTktFLnBhdGNoCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2Nj
L2djYy0xMC4xLzAwMTEtRGVmaW5lLUdMSUJDX0RZTkFNSUNfTElOS0VSLWFuZC1VQ0xJQkNfRFlO
QU1JQ19MSU5LRS5wYXRjaAppbmRleCBkOWQ1NjNkMGY3Li45OGQwYmIxMjg2IDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2djYy05LjMvMDAxMS1EZWZpbmUtR0xJQkNfRFlO
QU1JQ19MSU5LRVItYW5kLVVDTElCQ19EWU5BTUlDX0xJTktFLnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9nY2MvZ2NjLTEwLjEvMDAxMS1EZWZpbmUtR0xJQkNfRFlOQU1JQ19MSU5L
RVItYW5kLVVDTElCQ19EWU5BTUlDX0xJTktFLnBhdGNoCkBAIC0xLDcgKzEsNyBAQAotRnJvbSBk
Y2Q3ODkxZDZhZWE1MzI3OTY5MTMyZmVhNmNhNGMxOTlmMTRlOTg1IE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQorRnJvbSAyNWQ0YjYyN2YwMmY3NzFhY2FlYzM3MzYwOWE4MjI1OTExYjY3ZmM3IE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPGEgY2xhc3M9Im1vei10eHQt
bGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOnJhai5raGVtQGdtYWlsLmNvbSI+Jmx0O3Jhai5r
aGVtQGdtYWlsLmNvbSZndDs8L2E+CiBEYXRlOiBGcmksIDI5IE1hciAyMDEzIDA5OjI0OjUwICsw
NDAwCi1TdWJqZWN0OiBbUEFUQ0ggMTEvMzldIERlZmluZSBHTElCQ19EWU5BTUlDX0xJTktFUiBh
bmQgVUNMSUJDX0RZTkFNSUNfTElOS0VSCitTdWJqZWN0OiBbUEFUQ0hdIERlZmluZSBHTElCQ19E
WU5BTUlDX0xJTktFUiBhbmQgVUNMSUJDX0RZTkFNSUNfTElOS0VSCiAgcmVsYXRpdmUgdG8gU1lT
VEVNTElCU19ESVIKIAogVGhpcyBwYXRjaCBkZWZpbmVzIEdMSUJDX0RZTkFNSUNfTElOS0VSIGFu
ZCBVQ0xJQkNfRFlOQU1JQ19MSU5LRVIKQEAgLTMxLDcgKzMxLDcgQEAgVXBzdHJlYW0tU3RhdHVz
OiBJbmFwcHJvcHJpYXRlIFtPRSBjb25maWd1cmF0aW9uXQogIDEyIGZpbGVzIGNoYW5nZWQsIDI5
IGluc2VydGlvbnMoKyksIDM0IGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvZ2NjL2NvbmZp
Zy9hbHBoYS9saW51eC1lbGYuaCBiL2djYy9jb25maWcvYWxwaGEvbGludXgtZWxmLmgKLWluZGV4
IDgyNDg2MWJlZmVjLi42YWZhY2NlMzI5MiAxMDA2NDQKK2luZGV4IGUyNWZjYWMzYzU5Li4wMWFj
YTBjNjU0MiAxMDA2NDQKIC0tLSBhL2djYy9jb25maWcvYWxwaGEvbGludXgtZWxmLmgKICsrKyBi
L2djYy9jb25maWcvYWxwaGEvbGludXgtZWxmLmgKIEBAIC0yMyw4ICsyMyw4IEBAIGFsb25nIHdp
dGggR0NDOyBzZWUgdGhlIGZpbGUgQ09QWUlORzMuICBJZiBub3Qgc2VlCkBAIC00Niw3ICs0Niw3
IEBAIGluZGV4IDgyNDg2MWJlZmVjLi42YWZhY2NlMzI5MiAxMDA2NDQKICAjZGVmaW5lIENIT09T
RV9EWU5BTUlDX0xJTktFUihHLCBVKSAiJXttZ2xpYmM6IiBHICI7OiIgVSAifSIKICAjZWxpZiBE
RUZBVUxUX0xJQkMgPT0gTElCQ19HTElCQwogZGlmZiAtLWdpdCBhL2djYy9jb25maWcvYXJtL2xp
bnV4LWVhYmkuaCBiL2djYy9jb25maWcvYXJtL2xpbnV4LWVhYmkuaAotaW5kZXggNjZlYzBlYTM5
ODAuLmU0YWRlMmUyYWIwIDEwMDY0NAoraW5kZXggNWJkY2ZhMGM1ZDMuLjBjMDMzMmYzMTdmIDEw
MDY0NAogLS0tIGEvZ2NjL2NvbmZpZy9hcm0vbGludXgtZWFiaS5oCiArKysgYi9nY2MvY29uZmln
L2FybS9saW51eC1lYWJpLmgKIEBAIC02NSw4ICs2NSw4IEBACkBAIC02MSw3ICs2MSw3IEBAIGlu
ZGV4IDY2ZWMwZWEzOTgwLi5lNGFkZTJlMmFiMCAxMDA2NDQKICAKICAjZGVmaW5lIEdMSUJDX0RZ
TkFNSUNfTElOS0VSIFwKIGRpZmYgLS1naXQgYS9nY2MvY29uZmlnL2FybS9saW51eC1lbGYuaCBi
L2djYy9jb25maWcvYXJtL2xpbnV4LWVsZi5oCi1pbmRleCA5YTM2MGRlZmQyMS4uOThmNmU5NjBi
NjQgMTAwNjQ0CitpbmRleCAwZWMzYWE1MzE4OS4uYWJmYTk1NjZkNzQgMTAwNjQ0CiAtLS0gYS9n
Y2MvY29uZmlnL2FybS9saW51eC1lbGYuaAogKysrIGIvZ2NjL2NvbmZpZy9hcm0vbGludXgtZWxm
LmgKIEBAIC02MCw3ICs2MCw3IEBACkBAIC03NCw3ICs3NCw3IEBAIGluZGV4IDlhMzYwZGVmZDIx
Li45OGY2ZTk2MGI2NCAxMDA2NDQKICAjZGVmaW5lIExJTlVYX1RBUkdFVF9MSU5LX1NQRUMgICIl
e2gqfSBcCiAgICAgJXtzdGF0aWM6LUJzdGF0aWN9IFwKIGRpZmYgLS1naXQgYS9nY2MvY29uZmln
L2kzODYvbGludXguaCBiL2djYy9jb25maWcvaTM4Ni9saW51eC5oCi1pbmRleCA5YTZlMmQ5OTg5
Ni4uMzFlZmJiNzMwMTYgMTAwNjQ0CitpbmRleCA5ZjgyM2YxMjVlZC4uZTAzOTBiN2Q1ZTMgMTAw
NjQ0CiAtLS0gYS9nY2MvY29uZmlnL2kzODYvbGludXguaAogKysrIGIvZ2NjL2NvbmZpZy9pMzg2
L2xpbnV4LmgKIEBAIC0yMCw3ICsyMCw3IEBAIGFsb25nIHdpdGggR0NDOyBzZWUgdGhlIGZpbGUg
Q09QWUlORzMuICBJZiBub3Qgc2VlCkBAIC04Nyw3ICs4Nyw3IEBAIGluZGV4IDlhNmUyZDk5ODk2
Li4zMWVmYmI3MzAxNiAxMDA2NDQKICAjdW5kZWYgTVVTTF9EWU5BTUlDX0xJTktFUgogICNkZWZp
bmUgTVVTTF9EWU5BTUlDX0xJTktFUiAiL2xpYi9sZC1tdXNsLWkzODYuc28uMSIKIGRpZmYgLS1n
aXQgYS9nY2MvY29uZmlnL2kzODYvbGludXg2NC5oIGIvZ2NjL2NvbmZpZy9pMzg2L2xpbnV4NjQu
aAotaW5kZXggYzA4MjIxYzQyMTAuLmRiYjQ3NGQ3OTJiIDEwMDY0NAoraW5kZXggNmNiNjhkMWNj
ZmEuLjdkZTA5ZWM4NTdjIDEwMDY0NAogLS0tIGEvZ2NjL2NvbmZpZy9pMzg2L2xpbnV4NjQuaAog
KysrIGIvZ2NjL2NvbmZpZy9pMzg2L2xpbnV4NjQuaAogQEAgLTI3LDkgKzI3LDkgQEAgc2VlIHRo
ZSBmaWxlcyBDT1BZSU5HMyBhbmQgQ09QWUlORy5SVU5USU1FIHJlc3BlY3RpdmVseS4gIElmIG5v
dCwgc2VlCkBAIC0xMDQsNyArMTA0LDcgQEAgaW5kZXggYzA4MjIxYzQyMTAuLmRiYjQ3NGQ3OTJi
IDEwMDY0NAogICN1bmRlZiBNVVNMX0RZTkFNSUNfTElOS0VSMzIKICAjZGVmaW5lIE1VU0xfRFlO
QU1JQ19MSU5LRVIzMiAiL2xpYi9sZC1tdXNsLWkzODYuc28uMSIKIGRpZmYgLS1naXQgYS9nY2Mv
Y29uZmlnL2xpbnV4LmggYi9nY2MvY29uZmlnL2xpbnV4LmgKLWluZGV4IGMzYzRhMjE5ZTY3Li40
YjA1ZDhlOTNkMSAxMDA2NDQKK2luZGV4IDk1NjU0YmNkYjVhLi4wYzFhODExOGEyNiAxMDA2NDQK
IC0tLSBhL2djYy9jb25maWcvbGludXguaAogKysrIGIvZ2NjL2NvbmZpZy9saW51eC5oCiBAQCAt
OTQsMTAgKzk0LDEwIEBAIHNlZSB0aGUgZmlsZXMgQ09QWUlORzMgYW5kIENPUFlJTkcuUlVOVElN
RSByZXNwZWN0aXZlbHkuICBJZiBub3QsIHNlZQpAQCAtMTIzLDcgKzEyMyw3IEBAIGluZGV4IGMz
YzRhMjE5ZTY3Li40YjA1ZDhlOTNkMSAxMDA2NDQKICAjZGVmaW5lIEJJT05JQ19EWU5BTUlDX0xJ
TktFUjMyICIvc3lzdGVtL2Jpbi9saW5rZXIiCiAgI2RlZmluZSBCSU9OSUNfRFlOQU1JQ19MSU5L
RVI2NCAiL3N5c3RlbS9iaW4vbGlua2VyNjQiCiBkaWZmIC0tZ2l0IGEvZ2NjL2NvbmZpZy9taXBz
L2xpbnV4LmggYi9nY2MvY29uZmlnL21pcHMvbGludXguaAotaW5kZXggNmY3OWFjOWMwMWEuLjI1
ZGU5NmY5NTYxIDEwMDY0NAoraW5kZXggNTQ0NDZlNThlNWYuLjQ3ODZlZTMwNGMxIDEwMDY0NAog
LS0tIGEvZ2NjL2NvbmZpZy9taXBzL2xpbnV4LmgKICsrKyBiL2djYy9jb25maWcvbWlwcy9saW51
eC5oCiBAQCAtMjIsMjAgKzIyLDIwIEBAIGFsb25nIHdpdGggR0NDOyBzZWUgdGhlIGZpbGUgQ09Q
WUlORzMuICBJZiBub3Qgc2VlCkBAIC0xNTQsNyArMTU0LDcgQEAgaW5kZXggNmY3OWFjOWMwMWEu
LjI1ZGU5NmY5NTYxIDEwMDY0NAogICN1bmRlZiBNVVNMX0RZTkFNSUNfTElOS0VSMzIKICAjZGVm
aW5lIE1VU0xfRFlOQU1JQ19MSU5LRVIzMiBcCiBkaWZmIC0tZ2l0IGEvZ2NjL2NvbmZpZy9yaXNj
di9saW51eC5oIGIvZ2NjL2NvbmZpZy9yaXNjdi9saW51eC5oCi1pbmRleCA1OGRkMThiODlmMy4u
MTEyYmE5Y2Q3NjQgMTAwNjQ0CitpbmRleCA0YWZlZjdjMjI4Yy4uMDE5OTczMzA3NDEgMTAwNjQ0
CiAtLS0gYS9nY2MvY29uZmlnL3Jpc2N2L2xpbnV4LmgKICsrKyBiL2djYy9jb25maWcvcmlzY3Yv
bGludXguaAogQEAgLTIyLDcgKzIyLDcgQEAgYWxvbmcgd2l0aCBHQ0M7IHNlZSB0aGUgZmlsZSBD
T1BZSU5HMy4gIElmIG5vdCBzZWUKQEAgLTE2NywxMCArMTY3LDEwIEBAIGluZGV4IDU4ZGQxOGI4
OWYzLi4xMTJiYTljZDc2NCAxMDA2NDQKICAjZGVmaW5lIE1VU0xfQUJJX1NVRkZJWCBcCiAgICAi
JXttYWJpPWlscDMyOi1zZn0iIFwKIGRpZmYgLS1naXQgYS9nY2MvY29uZmlnL3JzNjAwMC9saW51
eDY0LmggYi9nY2MvY29uZmlnL3JzNjAwMC9saW51eDY0LmgKLWluZGV4IDk5NDZkM2ZlZDk0Li40
NWE5YTdjYWU1OSAxMDA2NDQKK2luZGV4IDM0Nzc2Yzg0MjFlLi45NjdjMWM0M2M2MyAxMDA2NDQK
IC0tLSBhL2djYy9jb25maWcvcnM2MDAwL2xpbnV4NjQuaAogKysrIGIvZ2NjL2NvbmZpZy9yczYw
MDAvbGludXg2NC5oCi1AQCAtNDIzLDI0ICs0MjMsMTkgQEAgZXh0ZXJuIGludCBkb3Rfc3ltYm9s
czsKK0BAIC00MTksMjQgKzQxOSwxOSBAQCBleHRlcm4gaW50IGRvdF9zeW1ib2xzOwogICN1bmRl
ZglMSU5LX09TX0RFRkFVTFRfU1BFQwogICNkZWZpbmUgTElOS19PU19ERUZBVUxUX1NQRUMgIiUo
bGlua19vc19saW51eCkiCiAgCkBAIC0yMDEsNyArMjAxLDcgQEAgaW5kZXggOTk0NmQzZmVkOTQu
LjQ1YTlhN2NhZTU5IDEwMDY0NAogICN1bmRlZiAgREVGQVVMVF9BU01fRU5ESUFOCiAgI2lmIChU
QVJHRVRfREVGQVVMVCAmYW1wOyBNQVNLX0xJVFRMRV9FTkRJQU4pCiBkaWZmIC0tZ2l0IGEvZ2Nj
L2NvbmZpZy9zaC9saW51eC5oIGIvZ2NjL2NvbmZpZy9zaC9saW51eC5oCi1pbmRleCBjOTg5N2I3
YWNhNS4uODJmMjc1MzE5Y2MgMTAwNjQ0CitpbmRleCBjMWQwNDQxZDQ4OC4uODEzNzNlYjgzMzYg
MTAwNjQ0CiAtLS0gYS9nY2MvY29uZmlnL3NoL2xpbnV4LmgKICsrKyBiL2djYy9jb25maWcvc2gv
bGludXguaAogQEAgLTY0LDcgKzY0LDcgQEAgYWxvbmcgd2l0aCBHQ0M7IHNlZSB0aGUgZmlsZSBD
T1BZSU5HMy4gIElmIG5vdCBzZWUKQEAgLTIxNCw3ICsyMTQsNyBAQCBpbmRleCBjOTg5N2I3YWNh
NS4uODJmMjc1MzE5Y2MgMTAwNjQ0CiAgI3VuZGVmIFNVQlRBUkdFVF9MSU5LX0VNVUxfU1VGRklY
CiAgI2RlZmluZSBTVUJUQVJHRVRfTElOS19FTVVMX1NVRkZJWCAiJXttZmRwaWM6X2ZkOzpfbGlu
dXh9IgogZGlmZiAtLWdpdCBhL2djYy9jb25maWcvc3BhcmMvbGludXguaCBiL2djYy9jb25maWcv
c3BhcmMvbGludXguaAotaW5kZXggMDg0NzZmMWQ5NGQuLjgwNDQwZTcxMmFkIDEwMDY0NAoraW5k
ZXggODEyMDFlNjdhMmYuLjhiNmZjNTc3NTk0IDEwMDY0NAogLS0tIGEvZ2NjL2NvbmZpZy9zcGFy
Yy9saW51eC5oCiArKysgYi9nY2MvY29uZmlnL3NwYXJjL2xpbnV4LmgKIEBAIC04NCw3ICs4NCw3
IEBAIGV4dGVybiBjb25zdCBjaGFyICpob3N0X2RldGVjdF9sb2NhbF9jcHUgKGludCBhcmdjLCBj
b25zdCBjaGFyICoqYXJndik7CkBAIC0yMjcsNyArMjI3LDcgQEAgaW5kZXggMDg0NzZmMWQ5NGQu
LjgwNDQwZTcxMmFkIDEwMDY0NAogICN1bmRlZiAgTElOS19TUEVDCiAgI2RlZmluZSBMSU5LX1NQ
RUMgIi1tIGVsZjMyX3NwYXJjICV7c2hhcmVkOi1zaGFyZWR9IFwKIGRpZmYgLS1naXQgYS9nY2Mv
Y29uZmlnL3NwYXJjL2xpbnV4NjQuaCBiL2djYy9jb25maWcvc3BhcmMvbGludXg2NC5oCi1pbmRl
eCA3ODlkMWRmNGJkNS4uYjkyMGM2ODBmYjEgMTAwNjQ0CitpbmRleCBhMWEwZWZkOGYyOC4uODVk
MTA4NGFmYzIgMTAwNjQ0CiAtLS0gYS9nY2MvY29uZmlnL3NwYXJjL2xpbnV4NjQuaAogKysrIGIv
Z2NjL2NvbmZpZy9zcGFyYy9saW51eDY0LmgKIEBAIC04NCw4ICs4NCw4IEBAIGFsb25nIHdpdGgg
R0NDOyBzZWUgdGhlIGZpbGUgQ09QWUlORzMuICBJZiBub3Qgc2VlCkBAIC0yNDEsNiArMjQxLDMg
QEAgaW5kZXggNzg5ZDFkZjRiZDUuLmI5MjBjNjgwZmIxIDEwMDY0NAogIAogICNpZmRlZiBTUEFS
Q19CSV9BUkNICiAgCi0tLSAKLTIuMjUuMQotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvZ2NjL2djYy05LjMvMDAxMi1nY2MtRml4LWFyZ3VtZW50LWxpc3QtdG9vLWxvbmctZXJy
b3IucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2djYy0xMC4xLzAwMTItZ2NjLUZp
eC1hcmd1bWVudC1saXN0LXRvby1sb25nLWVycm9yLnBhdGNoCnNpbWlsYXJpdHkgaW5kZXggODUl
CnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2MvZ2NjLTkuMy8wMDEyLWdjYy1G
aXgtYXJndW1lbnQtbGlzdC10b28tbG9uZy1lcnJvci5wYXRjaApyZW5hbWUgdG8gbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2djYy9nY2MtMTAuMS8wMDEyLWdjYy1GaXgtYXJndW1lbnQtbGlzdC10b28t
bG9uZy1lcnJvci5wYXRjaAppbmRleCA5ZDk4ODc4MDk2Li40MGZjOGRmMDMwIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2djYy05LjMvMDAxMi1nY2MtRml4LWFyZ3VtZW50
LWxpc3QtdG9vLWxvbmctZXJyb3IucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dj
Yy9nY2MtMTAuMS8wMDEyLWdjYy1GaXgtYXJndW1lbnQtbGlzdC10b28tbG9uZy1lcnJvci5wYXRj
aApAQCAtMSw3ICsxLDcgQEAKLUZyb20gZmFhMGY3MTJhNjcwMDVlZjAyNjBmOTVlZWJlN2M3YzU3
YTZmODM2MCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMWQ3YTM5MmIxY2E3YjAxZjI5
ZDg3ZjQ2OTExZmVhZDkxY2RhMjVkMyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEto
ZW0gUmFqIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzpyYWou
a2hlbUBnbWFpbC5jb20iPiZsdDtyYWoua2hlbUBnbWFpbC5jb20mZ3Q7PC9hPgogRGF0ZTogRnJp
LCAyOSBNYXIgMjAxMyAwOToyNjozNyArMDQwMAotU3ViamVjdDogW1BBVENIIDEyLzM5XSBnY2M6
IEZpeCBhcmd1bWVudCBsaXN0IHRvbyBsb25nIGVycm9yLgorU3ViamVjdDogW1BBVENIXSBnY2M6
IEZpeCBhcmd1bWVudCBsaXN0IHRvbyBsb25nIGVycm9yLgogCiBUaGVyZSB3b3VsZCBiZSBhbiAi
QXJndW1lbnQgbGlzdCB0b28gbG9uZzxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhy
ZWY9Im1haWx0bzplcnJvcndoZW50aGVidWlsZGRpcmVjdG9yeWlzbG9uZ2VydGhhbjIwMCx0aGlz
aXNjYXVzZWRieTpAQC0yMywxMCsyMywxMEBAVXBzdHJlYW0tU3RhdHVzOlBlbmRpbmcxZmlsZWNo
YW5nZWQsMWluc2VydGlvbigrKSwxZGVsZXRpb24oLSlkaWZmLS1naXRhL2djYy9NYWtlZmlsZS5p
bmIvZ2NjL01ha2VmaWxlLmluLWluZGV4ZmVmNmM0YzYxZTMuLjU3Y2Y3ODA0ZjBhMTAwNjQ0K2lu
ZGV4YTY3ZDJjYzE4ZDYuLjQ4MGM5MzY2NDE4MTAwNjQ0LS0tYS9nY2MvTWFrZWZpbGUuaW4rKyti
L2djYy9NYWtlZmlsZS5pbi1AQC0zNTM4LDcrMzUzOCw3QEBpbnN0YWxsLXBsdWdpbjppbnN0YWxs
ZGlyc2xhbmcuaW5zdGFsbC1wbHVnaW5zLWhlYWRlci12YXJzaW5zdGFsbC1nZW5ndHlwZStAQC0z
NjA2LDcrMzYwNiw3QEBpbnN0YWxsLXBsdWdpbjppbnN0YWxsZGlyc2xhbmcuaW5zdGFsbC1wbHVn
aW5zLWhlYWRlci12YXJzaW5zdGFsbC1nZW5ndHlwZSNXZWtlZXB0aGVkaXJlY3RvcnlzdHJ1Y3R1
cmVmb3JmaWxlc2luY29uZmlnb3JjLWZhbWlseWFuZC5kZWYjZmlsZXMuQWxsb3RoZXJmaWxlc2Fy
ZWZsYXR0ZW5lZHRvYXNpbmdsZWRpcmVjdG9yeS4kKG1raW5zdGFsbGRpcnMpJChERVNURElSKSQo
cGx1Z2luX2luY2x1ZGVkaXIpQEAtMzUsNiszNSwzQEBpbmRleGZlZjZjNGM2MWUzLi41N2NmNzgw
NGYwYTEwMDY0NHNyY2RpcnN0cmlwPWBlY2hvIj4iIGVycm9yIHdoZW4gdGhlCiBidWlsZCBkaXJl
Y3RvcnkgaXMgbG9uZ2VyIHRoYW4gMjAwLCB0aGlzIGlzIGNhdXNlZCBieToKQEAgLTIzLDEwICsy
MywxMCBAQCBVcHN0cmVhbS1TdGF0dXM6IFBlbmRpbmcKICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL2djYy9NYWtlZmlsZS5pbiBi
L2djYy9NYWtlZmlsZS5pbgotaW5kZXggZmVmNmM0YzYxZTMuLjU3Y2Y3ODA0ZjBhIDEwMDY0NAor
aW5kZXggYTY3ZDJjYzE4ZDYuLjQ4MGM5MzY2NDE4IDEwMDY0NAogLS0tIGEvZ2NjL01ha2VmaWxl
LmluCiArKysgYi9nY2MvTWFrZWZpbGUuaW4KLUBAIC0zNTM4LDcgKzM1MzgsNyBAQCBpbnN0YWxs
LXBsdWdpbjogaW5zdGFsbGRpcnMgbGFuZy5pbnN0YWxsLXBsdWdpbiBzLWhlYWRlci12YXJzIGlu
c3RhbGwtZ2VuZ3R5cGUKK0BAIC0zNjA2LDcgKzM2MDYsNyBAQCBpbnN0YWxsLXBsdWdpbjogaW5z
dGFsbGRpcnMgbGFuZy5pbnN0YWxsLXBsdWdpbiBzLWhlYWRlci12YXJzIGluc3RhbGwtZ2VuZ3R5
cGUKICAjIFdlIGtlZXAgdGhlIGRpcmVjdG9yeSBzdHJ1Y3R1cmUgZm9yIGZpbGVzIGluIGNvbmZp
ZyBvciBjLWZhbWlseSBhbmQgLmRlZgogICMgZmlsZXMuIEFsbCBvdGhlciBmaWxlcyBhcmUgZmxh
dHRlbmVkIHRvIGEgc2luZ2xlIGRpcmVjdG9yeS4KICAJJChta2luc3RhbGxkaXJzKSAkKERFU1RE
SVIpJChwbHVnaW5faW5jbHVkZWRpcikKQEAgLTM1LDYgKzM1LDMgQEAgaW5kZXggZmVmNmM0YzYx
ZTMuLjU3Y2Y3ODA0ZjBhIDEwMDY0NAogIAlzcmNkaXJzdHJpcD1gZWNobyAiPC9hPiQoc3JjZGly
KSIgfCBzZWQgJ3MvW10uW14kJFxcKnxdL1xcXFwmYW1wOy9nJ2A7IFwKICAJZm9yIGZpbGUgaW4g
JCRoZWFkZXJzOyBkbyBcCiAgCSAgaWYgWyAtZiAkJGZpbGUgXSA7IHRoZW4gXAotLS0gCi0yLjI1
LjEKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2djYy9nY2MtOS4zLzAwMTMt
RGlzYWJsZS1zZHQucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2djYy0xMC4xLzAw
MTMtRGlzYWJsZS1zZHQucGF0Y2gKc2ltaWxhcml0eSBpbmRleCA4OCUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2djYy9nY2MtOS4zLzAwMTMtRGlzYWJsZS1zZHQucGF0Y2gKcmVu
YW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2MvZ2NjLTEwLjEvMDAxMy1EaXNhYmxlLXNk
dC5wYXRjaAppbmRleCA0NTU4NTgzNTRmLi5jNmZhNDg2NTNjIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvZ2NjL2djYy05LjMvMDAxMy1EaXNhYmxlLXNkdC5wYXRjaAorKysgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2djYy0xMC4xLzAwMTMtRGlzYWJsZS1zZHQucGF0Y2gK
QEAgLTEsNyArMSw3IEBACi1Gcm9tIDRkZjVhNzQ3MjY1OTgzMDkyYWZkNmZiYzUzMjlkZDgwOGNj
MWRhM2MgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGVlNzFmNzY0NzY2YTZkNDdmYTA0
OTA1ZmEzMGZkY2Q3N2EyNWFmNzMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLaGVt
IFJhaiA8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86cmFqLmto
ZW1AZ21haWwuY29tIj4mbHQ7cmFqLmtoZW1AZ21haWwuY29tJmd0OzwvYT4KIERhdGU6IEZyaSwg
MjkgTWFyIDIwMTMgMDk6Mjg6MTAgKzA0MDAKLVN1YmplY3Q6IFtQQVRDSCAxMy8zOV0gRGlzYWJs
ZSBzZHQuCitTdWJqZWN0OiBbUEFUQ0hdIERpc2FibGUgc2R0LgogCiBXZSBkb24ndCBsaXN0IGR0
cmFjZSBpbiBERVBFTkRTIHNvIHdlIHNob3VsZG4ndCBiZSBkZXBlbmRpbmcgb24gdGhpcyBoZWFk
ZXIuCiBJdCBtYXkgb3IgbWF5IG5vdCBleGlzdCBmcm9tIHByZWl2b3VzIGJ1aWxkcyB0aG91Z2gu
IFRvIGJlIGRldGVybWluc3RpYywgZGlzYWJsZQpAQCAtMjUsMTAgKzI1LDEwIEBAIFVwc3RyZWFt
LVN0YXR1czogSW5hcHByb3ByaWF0ZSBbaGFja10KICA0IGZpbGVzIGNoYW5nZWQsIDE5IGluc2Vy
dGlvbnMoKyksIDE5IGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvZ2NjL2NvbmZpZ3VyZSBi
L2djYy9jb25maWd1cmUKLWluZGV4IGVkNzkzMWRhZWQzLi41MmY1MmIwZWM4NiAxMDA3NTUKK2lu
ZGV4IGIyNmU4ZmM3ZmVlLi42MDgwZjg2MTQ1ZSAxMDA3NTUKIC0tLSBhL2djYy9jb25maWd1cmUK
ICsrKyBiL2djYy9jb25maWd1cmUKLUBAIC0yOTMzMywxMiArMjkzMzMsMTIgQEAgZmkKK0BAIC0y
OTc4OSwxMiArMjk3ODksMTIgQEAgZmkKICB7ICRhc19lY2hvICIkYXNfbWU6JHthc19saW5lbm8t
JExJTkVOT306IGNoZWNraW5nIHN5cy9zZHQuaCBpbiB0aGUgdGFyZ2V0IEMgbGlicmFyeSIgJmd0
OyZhbXA7NQogICRhc19lY2hvX24gImNoZWNraW5nIHN5cy9zZHQuaCBpbiB0aGUgdGFyZ2V0IEMg
bGlicmFyeS4uLiAiICZndDsmYW1wOzY7IH0KICBoYXZlX3N5c19zZHRfaD1ubwpAQCAtNDgsMTAg
KzQ4LDEwIEBAIGluZGV4IGVkNzkzMWRhZWQzLi41MmY1MmIwZWM4NiAxMDA3NTUKICAkYXNfZWNo
byAiJGhhdmVfc3lzX3NkdF9oIiAmZ3Q7JmFtcDs2OyB9CiAgCiBkaWZmIC0tZ2l0IGEvZ2NjL2Nv
bmZpZ3VyZS5hYyBiL2djYy9jb25maWd1cmUuYWMKLWluZGV4IGUwNTAwZTMwZDUwLi4yNDJhZDI4
ZWM4MyAxMDA2NDQKK2luZGV4IDI2ZmE0NjgwMmM3Li40MmJlNTI1Mjc3OCAxMDA2NDQKIC0tLSBh
L2djYy9jb25maWd1cmUuYWMKICsrKyBiL2djYy9jb25maWd1cmUuYWMKLUBAIC01OTk1LDE1ICs1
OTk1LDE1IEBAIGZpCitAQCAtNjE5MCwxNSArNjE5MCwxNSBAQCBmaQogIEFDX1NVQlNUKFtlbmFi
bGVfZGVmYXVsdF9zc3BdKQogIAogICMgVGVzdCBmb3IgJmx0O3N5cy9zZHQuaCZndDsgb24gdGhl
IHRhcmdldC4KQEAgLTc3LDEwICs3NywxMCBAQCBpbmRleCBlMDUwMGUzMGQ1MC4uMjQyYWQyOGVj
ODMgMTAwNjQ0CiAgIyBDaGVjayBpZiBURm1vZGUgbG9uZyBkb3VibGUgc2hvdWxkIGJlIHVzZWQg
YnkgZGVmYXVsdCBvciBub3QuCiAgIyBTb21lIGdsaWJjIHRhcmdldHMgdXNlZCBERm1vZGUgbG9u
ZyBkb3VibGUsIGJ1dCB3aXRoIGdsaWJjIDIuNAogZGlmZiAtLWdpdCBhL2xpYnN0ZGMrKy12My9j
b25maWd1cmUgYi9saWJzdGRjKystdjMvY29uZmlndXJlCi1pbmRleCAxMjI1ZWRjNTk2Yi4uM2I4
OWI4ODBmYzggMTAwNzU1CitpbmRleCA5ZjljNWEyNDE5YS4uNzFlZDEzYjgxNWIgMTAwNzU1CiAt
LS0gYS9saWJzdGRjKystdjMvY29uZmlndXJlCiArKysgYi9saWJzdGRjKystdjMvY29uZmlndXJl
Ci1AQCAtMjIzMjUsMTEgKzIyMzI1LDExIEBAIGFjX2NvbXBpbGU9JyRDQyAtYyAkQ0ZMQUdTICRD
UFBGTEFHUyBjb25mdGVzdC4kYWNfZXh0ICZndDsmYW1wOzUnCitAQCAtMjI2MTUsMTEgKzIyNjE1
LDExIEBAIGFjX2NvbXBpbGU9JyRDQyAtYyAkQ0ZMQUdTICRDUFBGTEFHUyBjb25mdGVzdC4kYWNf
ZXh0ICZndDsmYW1wOzUnCiAgYWNfbGluaz0nJENDIC1vIGNvbmZ0ZXN0JGFjX2V4ZWV4dCAkQ0ZM
QUdTICRDUFBGTEFHUyAkTERGTEFHUyBjb25mdGVzdC4kYWNfZXh0ICRMSUJTICZndDsmYW1wOzUn
CiAgYWNfY29tcGlsZXJfZ251PSRhY19jdl9jX2NvbXBpbGVyX2dudQogIApAQCAtOTYsMTAgKzk2
LDEwIEBAIGluZGV4IDEyMjVlZGM1OTZiLi4zYjg5Yjg4MGZjOCAxMDA3NTUKICAkYXNfZWNobyAi
JGdsaWJjeHhfY3Zfc3lzX3NkdF9oIiAmZ3Q7JmFtcDs2OyB9CiAgCiBkaWZmIC0tZ2l0IGEvbGli
c3RkYysrLXYzL2NvbmZpZ3VyZS5hYyBiL2xpYnN0ZGMrKy12My9jb25maWd1cmUuYWMKLWluZGV4
IGQ4NDU1ZTQxNTc0Li44NDRjZjFhY2JjZSAxMDA2NDQKK2luZGV4IDY5OWU1NWZkODI5Li41Yzdh
N2JkYTQzOSAxMDA2NDQKIC0tLSBhL2xpYnN0ZGMrKy12My9jb25maWd1cmUuYWMKICsrKyBiL2xp
YnN0ZGMrKy12My9jb25maWd1cmUuYWMKLUBAIC0yMzIsNyArMjMyLDcgQEAgR0xJQkNYWF9DSEVD
S19TQ19OUFJPQ0VTU09SU19PTkxOCitAQCAtMjQxLDcgKzI0MSw3IEBAIEdMSUJDWFhfQ0hFQ0tf
U0NfTlBST0NFU1NPUlNfT05MTgogIEdMSUJDWFhfQ0hFQ0tfU0NfTlBST0NfT05MTgogIEdMSUJD
WFhfQ0hFQ0tfUFRIUkVBRFNfTlVNX1BST0NFU1NPUlNfTlAKICBHTElCQ1hYX0NIRUNLX1NZU0NU
TF9IV19OQ1BVCkBAIC0xMDgsNiArMTA4LDMgQEAgaW5kZXggZDg0NTVlNDE1NzQuLjg0NGNmMWFj
YmNlIDEwMDY0NAogIAogICMgQ2hlY2sgZm9yIGF2YWlsYWJsZSBoZWFkZXJzLgogIEFDX0NIRUNL
X0hFQURFUlMoW2VuZGlhbi5oIGV4ZWNpbmZvLmggZmxvYXQuaCBmcC5oIGllZWVmcC5oIGludHR5
cGVzLmggXAotLS0gCi0yLjI1LjEKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2djYy9nY2MtOS4zLzAwMTQtbGlidG9vbC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9n
Y2MvZ2NjLTEwLjEvMDAxNC1saWJ0b29sLnBhdGNoCnNpbWlsYXJpdHkgaW5kZXggODclCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2MvZ2NjLTkuMy8wMDE0LWxpYnRvb2wucGF0
Y2gKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2MvZ2NjLTEwLjEvMDAxNC1saWJ0
b29sLnBhdGNoCmluZGV4IDI5NTM4NTkyMzguLjY2MDJlZGNjMjIgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9nY2MvZ2NjLTkuMy8wMDE0LWxpYnRvb2wucGF0Y2gKKysrIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2djYy9nY2MtMTAuMS8wMDE0LWxpYnRvb2wucGF0Y2gKQEAgLTEs
NyArMSw3IEBACi1Gcm9tIDM0OTc3ZDk5NDY2NmE5MDk4M2M5NmE5MjQwZGZhMzU0MDU2MmRhMzUg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDYwYzU2ODE5MThkYjBjZmFkMDA3MmRiMTRh
NTBlYzk0Y2FmMDM0ZWQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLaGVtIFJhaiA8
YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86cmFqLmtoZW1AZ21h
aWwuY29tIj4mbHQ7cmFqLmtoZW1AZ21haWwuY29tJmd0OzwvYT4KIERhdGU6IEZyaSwgMjkgTWFy
IDIwMTMgMDk6Mjk6MTEgKzA0MDAKLVN1YmplY3Q6IFtQQVRDSCAxNC8zOV0gbGlidG9vbAorU3Vi
amVjdDogW1BBVENIXSBsaWJ0b29sCiAKIGxpYnN0ZGMrKyBmcm9tIGdjYy1ydW50aW1lIGdldHMg
Y3JlYXRlZCB3aXRoIC1ycGF0aD0vdXNyL2xpYi8uLi9saWIgZm9yIHFlbXV4ODYtNjQKIHdoZW4g
cnVubmluZyBvbiBhbSB4ODZfNjQgYnVpbGQgaG9zdC4KQEAgLTIzLDcgKzIzLDcgQEAgVXBzdHJl
YW0tU3RhdHVzOiBQZW5kaW5nCiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQogCiBk
aWZmIC0tZ2l0IGEvbHRtYWluLnNoIGIvbHRtYWluLnNoCi1pbmRleCA3OWY5YmE4OWFmNS4uOGUy
MjJmN2MxNmIgMTAwNjQ0CitpbmRleCA3MDk5MDc0MGI2Yy4uZWU5MzgwNTZiZWYgMTAwNjQ0CiAt
LS0gYS9sdG1haW4uc2gKICsrKyBiL2x0bWFpbi5zaAogQEAgLTYzNTksNiArNjM1OSwxMCBAQCBm
dW5jX21vZGVfbGluayAoKQpAQCAtMzcsNiArMzcsMyBAQCBpbmRleCA3OWY5YmE4OWFmNS4uOGUy
MjJmN2MxNmIgMTAwNjQ0CiAgCiAgICAgICAgb2xkbGlicz0KICAgICAgICBpZiB0ZXN0IC16ICIk
cnBhdGgiOyB0aGVuCi0tLSAKLTIuMjUuMQotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvZ2NjL2djYy05LjMvMDAxNS1nY2MtYXJtdjQtcGFzcy1maXgtdjRieC10by1saW5rZXIt
dG8tc3VwcG9ydC1FQUJJLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2djYy9nY2MtMTAu
MS8wMDE1LWdjYy1hcm12NC1wYXNzLWZpeC12NGJ4LXRvLWxpbmtlci10by1zdXBwb3J0LUVBQkku
cGF0Y2gKc2ltaWxhcml0eSBpbmRleCA4NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2djYy9nY2MtOS4zLzAwMTUtZ2NjLWFybXY0LXBhc3MtZml4LXY0YngtdG8tbGlua2VyLXRv
LXN1cHBvcnQtRUFCSS5wYXRjaApyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2djYy9n
Y2MtMTAuMS8wMDE1LWdjYy1hcm12NC1wYXNzLWZpeC12NGJ4LXRvLWxpbmtlci10by1zdXBwb3J0
LUVBQkkucGF0Y2gKaW5kZXggZDQ0NDUyNDRlMi4uMDJlMzQzNDZiMSAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2djYy9nY2MtOS4zLzAwMTUtZ2NjLWFybXY0LXBhc3MtZml4LXY0
YngtdG8tbGlua2VyLXRvLXN1cHBvcnQtRUFCSS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvZ2NjL2djYy0xMC4xLzAwMTUtZ2NjLWFybXY0LXBhc3MtZml4LXY0YngtdG8tbGlua2Vy
LXRvLXN1cHBvcnQtRUFCSS5wYXRjaApAQCAtMSw3ICsxLDcgQEAKLUZyb20gNDU1OGJhN2ZhMDIw
YzExMWY5YTIwNDAyMWE0MThjMGNlNTVkNzdmOSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zy
b20gZGYwMmM2NDBjYjUyNjE3OTgxN2VhYTdjOTBiODk5ODllNTRhYTVkNyBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5
NkUiIGhyZWY9Im1haWx0bzpyYWoua2hlbUBnbWFpbC5jb20iPiZsdDtyYWoua2hlbUBnbWFpbC5j
b20mZ3Q7PC9hPgogRGF0ZTogRnJpLCAyOSBNYXIgMjAxMyAwOTozMDozMiArMDQwMAotU3ViamVj
dDogW1BBVENIIDE1LzM5XSBnY2M6IGFybXY0OiBwYXNzIGZpeC12NGJ4IHRvIGxpbmtlciB0byBz
dXBwb3J0IEVBQkkuCitTdWJqZWN0OiBbUEFUQ0hdIGdjYzogYXJtdjQ6IHBhc3MgZml4LXY0Yngg
dG8gbGlua2VyIHRvIHN1cHBvcnQgRUFCSS4KIAogVGhlIExJTktfU1BFQyBmb3IgbGludXggZ2V0
cyBvdmVyd3JpdHRlbiBieSBsaW51eC1lYWJpLmggd2hpY2gKIG1lYW5zIHRoZSB2YWx1ZSBvZiBU
QVJHRVRfRklYX1Y0QlhfU1BFQyBnZXRzIGxvc3QgYW5kIGFzIGEgcmVzdWx0CkBAIC0xOSwxMiAr
MTksMTIgQEAgVXBzdHJlYW0tU3RhdHVzOiBQZW5kaW5nCiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvZ2NjL2NvbmZpZy9hcm0v
bGludXgtZWFiaS5oIGIvZ2NjL2NvbmZpZy9hcm0vbGludXgtZWFiaS5oCi1pbmRleCBlNGFkZTJl
MmFiMC4uMTA4ODYzZjY5ZDIgMTAwNjQ0CitpbmRleCAwYzAzMzJmMzE3Zi4uN2IzNzY5ZTg0NTkg
MTAwNjQ0CiAtLS0gYS9nY2MvY29uZmlnL2FybS9saW51eC1lYWJpLmgKICsrKyBiL2djYy9jb25m
aWcvYXJtL2xpbnV4LWVhYmkuaAogQEAgLTkxLDEwICs5MSwxNCBAQAogICNkZWZpbmUgTVVTTF9E
WU5BTUlDX0xJTktFUiBcCi0gICAiL2xpYi9sZC1tdXNsLWFybSIgTVVTTF9EWU5BTUlDX0xJTktF
Ul9FICIle21mbG9hdC1hYmk9aGFyZDpoZn0uc28uMSIKKyAgICIvbGliL2xkLW11c2wtYXJtIiBN
VVNMX0RZTkFNSUNfTElOS0VSX0UgIiV7bWZsb2F0LWFiaT1oYXJkOmhmfSV7bWZkcGljOi1mZHBp
Y30uc28uMSIKICAKICsvKiBGb3IgYXJtdjQgd2UgcGFzcyAtLWZpeC12NGJ4IHRvIGxpbmtlciB0
byBzdXBwb3J0IEVBQkkgKi8KICsjdW5kZWYgVEFSR0VUX0ZJWF9WNEJYX1NQRUMKQEAgLTM4LDYg
KzM4LDMgQEAgaW5kZXggZTRhZGUyZTJhYjAuLjEwODg2M2Y2OWQyIDEwMDY0NAogICAgTElOVVhf
T1JfQU5EUk9JRF9MRCAoTElOVVhfVEFSR0VUX0xJTktfU1BFQywJCQkJXAogIAkJICAgICAgIExJ
TlVYX1RBUkdFVF9MSU5LX1NQRUMgIiAiIEFORFJPSURfTElOS19TUEVDKQogIAotLS0gCi0yLjI1
LjEKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2djYy9nY2MtOS4zLzAwMTYt
VXNlLXRoZS1tdWx0aWxpYi1jb25maWctZmlsZXMtZnJvbS1CLWluc3RlYWQtb2YtdXNpbi5wYXRj
aCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2MvZ2NjLTEwLjEvMDAxNi1Vc2UtdGhlLW11bHRp
bGliLWNvbmZpZy1maWxlcy1mcm9tLUItaW5zdGVhZC1vZi11c2luLnBhdGNoCnNpbWlsYXJpdHkg
aW5kZXggODElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2MvZ2NjLTkuMy8w
MDE2LVVzZS10aGUtbXVsdGlsaWItY29uZmlnLWZpbGVzLWZyb20tQi1pbnN0ZWFkLW9mLXVzaW4u
cGF0Y2gKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2MvZ2NjLTEwLjEvMDAxNi1V
c2UtdGhlLW11bHRpbGliLWNvbmZpZy1maWxlcy1mcm9tLUItaW5zdGVhZC1vZi11c2luLnBhdGNo
CmluZGV4IDZmMDgzM2NjZGEuLjVkOGJiYmUyMDggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9nY2MvZ2NjLTkuMy8wMDE2LVVzZS10aGUtbXVsdGlsaWItY29uZmlnLWZpbGVzLWZy
b20tQi1pbnN0ZWFkLW9mLXVzaW4ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dj
Yy9nY2MtMTAuMS8wMDE2LVVzZS10aGUtbXVsdGlsaWItY29uZmlnLWZpbGVzLWZyb20tQi1pbnN0
ZWFkLW9mLXVzaW4ucGF0Y2gKQEAgLTEsOCArMSw4IEBACi1Gcm9tIDdlZmZjNjMyZDY1YzJkNzJi
ZjZmYTMyYTIxOWVjMmY4MmZlZjk0MDUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDNl
YjU5YzI5YmJiMzhlOGYwYWQ3ZDE5Y2YwYTU1YjlkMGE4OGZjYjcgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCiBGcm9tOiBLaGVtIFJhaiA8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBo
cmVmPSJtYWlsdG86cmFqLmtoZW1AZ21haWwuY29tIj4mbHQ7cmFqLmtoZW1AZ21haWwuY29tJmd0
OzwvYT4KIERhdGU6IEZyaSwgMjkgTWFyIDIwMTMgMDk6MzM6MDQgKzA0MDAKLVN1YmplY3Q6IFtQ
QVRDSCAxNi8zOV0gVXNlIHRoZSBtdWx0aWxpYiBjb25maWcgZmlsZXMgZnJvbSAke0J9IGluc3Rl
YWQgb2YKLSB1c2luZyB0aGUgb25lcyBmcm9tICR7U30KK1N1YmplY3Q6IFtQQVRDSF0gVXNlIHRo
ZSBtdWx0aWxpYiBjb25maWcgZmlsZXMgZnJvbSAke0J9IGluc3RlYWQgb2YgdXNpbmcgdGhlCisg
b25lcyBmcm9tICR7U30KIAogVXNlIHRoZSBtdWx0aWxpYiBjb25maWcgZmlsZXMgZnJvbSAke0J9
IGluc3RlYWQgb2YgdXNpbmcgdGhlIG9uZXMgZnJvbSAke1N9CiBzbyB0aGF0IHRoZSBzb3VyY2Ug
Y2FuIGJlIHNoYXJlZCBiZXR3ZWVuIGdjYy1jcm9zcy1pbml0aWFsLApAQCAtMTgsMTAgKzE4LDEw
IEBAIFVwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZSBbY29uZmlndXJhdGlvbl0KICAyIGZp
bGVzIGNoYW5nZWQsIDM2IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1n
aXQgYS9nY2MvY29uZmlndXJlIGIvZ2NjL2NvbmZpZ3VyZQotaW5kZXggNTJmNTJiMGVjODYuLmE1
ZjIwOGFmN2NmIDEwMDc1NQoraW5kZXggNjA4MGY4NjE0NWUuLjgyNWE5NjUyMzI5IDEwMDc1NQog
LS0tIGEvZ2NjL2NvbmZpZ3VyZQogKysrIGIvZ2NjL2NvbmZpZ3VyZQotQEAgLTEyMzIyLDEwICsx
MjMyMiwyMCBAQCBkb25lCitAQCAtMTI2ODUsMTAgKzEyNjg1LDIwIEBAIGRvbmUKICB0bWFrZV9m
aWxlXz0KICBmb3IgZiBpbiAke3RtYWtlX2ZpbGV9CiAgZG8KQEAgLTQ0LDkgKzQ0LDkgQEAgaW5k
ZXggNTJmNTJiMGVjODYuLmE1ZjIwOGFmN2NmIDEwMDc1NQogKyAgICAgICA7OwogKyAgZXNhYwog
IGRvbmUKLSB0bWFrZV9maWxlPSIke3RtYWtlX2ZpbGVffSIKKyB0bWFrZV9maWxlPSIke3RtYWtl
X2ZpbGVffSR7b21wX2RldmljZV9wcm9wZXJ0eV90bWFrZV9maWxlfSIKICAKLUBAIC0xMjMzNiw2
ICsxMjM0NiwxMCBAQCB0bV9maWxlX2xpc3Q9Im9wdGlvbnMuaCIKK0BAIC0xMjY5OSw2ICsxMjcw
OSwxMCBAQCB0bV9maWxlX2xpc3Q9Im9wdGlvbnMuaCIKICB0bV9pbmNsdWRlX2xpc3Q9Im9wdGlv
bnMuaCBpbnNuLWNvbnN0YW50cy5oPGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJl
Zj0ibWFpbHRvOmZvcmZpbiR0bV9maWxlO2RvY2FzZSRmaW5AQC01OCwxMCs1OCwxMEBAaW5kZXg1
MmY1MmIwZWM4Ni4uYTVmMjA4YWY3Y2YxMDA3NTVmPWBlY2hvJGZ8c2VkJ3MvXi4uLy8nYHRtX2Zp
bGVfbGlzdD0iPiIKICBmb3IgZiBpbiAkdG1fZmlsZTsgZG8KICAgIGNhc2UgJGYgaW4KQEAgLTU4
LDEwICs1OCwxMCBAQCBpbmRleCA1MmY1MmIwZWM4Ni4uYTVmMjA4YWY3Y2YgMTAwNzU1CiAgICAg
ICAgIGY9YGVjaG8gJGYgfCBzZWQgJ3MvXi4uLy8nYAogICAgICAgICB0bV9maWxlX2xpc3Q9Ijwv
YT4ke3RtX2ZpbGVfbGlzdH0gJGY8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVm
PSJtYWlsdG86ZGlmZi0tZ2l0YS9nY2MvY29uZmlndXJlLmFjYi9nY2MvY29uZmlndXJlLmFjLWlu
ZGV4MjQyYWQyOGVjODMuLmI3YTdlYWQxYzAyMTAwNjQ0K2luZGV4NDJiZTUyNTI3NzguLjYwOTll
YjMyNTFmMTAwNjQ0LS0tYS9nY2MvY29uZmlndXJlLmFjKysrYi9nY2MvY29uZmlndXJlLmFjLUBA
LTE5NDgsMTArMTk0OCwyMEBAZG9uZStAQC0yMTE4LDEwKzIxMTgsMjBAQGRvbmV0bWFrZV9maWxl
Xz1mb3JmaW4ke3RtYWtlX2ZpbGV9ZG9AQC04NCw5Kzg0LDlAQGluZGV4MjQyYWQyOGVjODMuLmI3
YTdlYWQxYzAyMTAwNjQ0Kzs7K2VzYWNkb25lLXRtYWtlX2ZpbGU9Ij4iCiBkaWZmIC0tZ2l0IGEv
Z2NjL2NvbmZpZ3VyZS5hYyBiL2djYy9jb25maWd1cmUuYWMKLWluZGV4IDI0MmFkMjhlYzgzLi5i
N2E3ZWFkMWMwMiAxMDA2NDQKK2luZGV4IDQyYmU1MjUyNzc4Li42MDk5ZWIzMjUxZiAxMDA2NDQK
IC0tLSBhL2djYy9jb25maWd1cmUuYWMKICsrKyBiL2djYy9jb25maWd1cmUuYWMKLUBAIC0xOTQ4
LDEwICsxOTQ4LDIwIEBAIGRvbmUKK0BAIC0yMTE4LDEwICsyMTE4LDIwIEBAIGRvbmUKICB0bWFr
ZV9maWxlXz0KICBmb3IgZiBpbiAke3RtYWtlX2ZpbGV9CiAgZG8KQEAgLTg0LDkgKzg0LDkgQEAg
aW5kZXggMjQyYWQyOGVjODMuLmI3YTdlYWQxYzAyIDEwMDY0NAogKyAgICAgICA7OwogKyAgZXNh
YwogIGRvbmUKLSB0bWFrZV9maWxlPSI8L2E+JHt0bWFrZV9maWxlX30iCisgdG1ha2VfZmlsZT0i
JHt0bWFrZV9maWxlX30ke29tcF9kZXZpY2VfcHJvcGVydHlfdG1ha2VfZmlsZX0iCiAgCi1AQCAt
MTk2Miw2ICsxOTcyLDEwIEBAIHRtX2ZpbGVfbGlzdD0ib3B0aW9ucy5oIgorQEAgLTIxMzIsNiAr
MjE0MiwxMCBAQCB0bV9maWxlX2xpc3Q9Im9wdGlvbnMuaCIKICB0bV9pbmNsdWRlX2xpc3Q9Im9w
dGlvbnMuaCBpbnNuLWNvbnN0YW50cy5oIgogIGZvciBmIGluICR0bV9maWxlOyBkbwogICAgY2Fz
ZSAkZiBpbgpAQCAtOTcsNiArOTcsMyBAQCBpbmRleCAyNDJhZDI4ZWM4My4uYjdhN2VhZDFjMDIg
MTAwNjQ0CiAgICAgIC4vKiApCiAgICAgICAgIGY9YGVjaG8gJGYgfCBzZWQgJ3MvXi4uLy8nYAog
ICAgICAgICB0bV9maWxlX2xpc3Q9IiR7dG1fZmlsZV9saXN0fSAkZiIKLS0tIAotMi4yNS4xCi0K
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2MvZ2NjLTkuMy8wMDE3LUF2b2lk
LXVzaW5nLWxpYmRpci1mcm9tLS5sYS13aGljaC11c3VhbGx5LXBvaW50cy10by0ucGF0Y2ggYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2djYy0xMC4xLzAwMTctQXZvaWQtdXNpbmctbGliZGly
LWZyb20tLmxhLXdoaWNoLXVzdWFsbHktcG9pbnRzLXRvLS5wYXRjaApzaW1pbGFyaXR5IGluZGV4
IDc2JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2djYy05LjMvMDAxNy1B
dm9pZC11c2luZy1saWJkaXItZnJvbS0ubGEtd2hpY2gtdXN1YWxseS1wb2ludHMtdG8tLnBhdGNo
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2djYy0xMC4xLzAwMTctQXZvaWQt
dXNpbmctbGliZGlyLWZyb20tLmxhLXdoaWNoLXVzdWFsbHktcG9pbnRzLXRvLS5wYXRjaAppbmRl
eCA5NmRhMDEzYmYyLi5mNjEyMTY3NDVkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvZ2NjL2djYy05LjMvMDAxNy1Bdm9pZC11c2luZy1saWJkaXItZnJvbS0ubGEtd2hpY2gtdXN1
YWxseS1wb2ludHMtdG8tLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2MvZ2Nj
LTEwLjEvMDAxNy1Bdm9pZC11c2luZy1saWJkaXItZnJvbS0ubGEtd2hpY2gtdXN1YWxseS1wb2lu
dHMtdG8tLnBhdGNoCkBAIC0xLDggKzEsOCBAQAotRnJvbSBhMmIyYmY3NzYyMWYzNDRhODQ5ZTU1
YWIxNzllY2U4NTg3ZDE5MjM0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBiZGJkMTA4
YTFlZTA1YmY4NjdiZDRmOGMwYzM0MWQwMjlmYzYwNDRhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQogRnJvbTogS2hlbSBSYWogPGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0i
bWFpbHRvOnJhai5raGVtQGdtYWlsLmNvbSI+Jmx0O3Jhai5raGVtQGdtYWlsLmNvbSZndDs8L2E+
CiBEYXRlOiBGcmksIDIwIEZlYiAyMDE1IDA5OjM5OjM4ICswMDAwCi1TdWJqZWN0OiBbUEFUQ0gg
MTcvMzldIEF2b2lkIHVzaW5nIGxpYmRpciBmcm9tIC5sYSB3aGljaCB1c3VhbGx5IHBvaW50cyB0
byBhCi0gaG9zdCBwYXRoCitTdWJqZWN0OiBbUEFUQ0hdIEF2b2lkIHVzaW5nIGxpYmRpciBmcm9t
IC5sYSB3aGljaCB1c3VhbGx5IHBvaW50cyB0byBhIGhvc3QKKyBwYXRoCiAKIFVwc3RyZWFtLVN0
YXR1czogSW5hcHByb3ByaWF0ZSBbZW1iZWRkZWQgc3BlY2lmaWNdCiAKQEAgLTEzLDcgKzEzLDcg
QEAgU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2
RSIgaHJlZj0ibWFpbHRvOnJhai5raGVtQGdtYWlsLmNvbSI+Jmx0O3Jhai5raGVtQGdtYWlsLmNv
bSZndDs8L2E+CiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQogCiBkaWZmIC0tZ2l0
IGEvbHRtYWluLnNoIGIvbHRtYWluLnNoCi1pbmRleCA4ZTIyMmY3YzE2Yi4uMGE5M2I0ZTVjM2Ig
MTAwNjQ0CitpbmRleCBlZTkzODA1NmJlZi4uOWViYzdlM2QxZTAgMTAwNjQ0CiAtLS0gYS9sdG1h
aW4uc2gKICsrKyBiL2x0bWFpbi5zaAogQEAgLTU2MjgsNiArNTYyOCw5IEBAIGZ1bmNfbW9kZV9s
aW5rICgpCkBAIC0yNiw2ICsyNiwzIEBAIGluZGV4IDhlMjIyZjdjMTZiLi4wYTkzYjRlNWMzYiAx
MDA2NDQKICAJICAgIGRpcj0iJGxpYmRpciIKICAJICAgIGFic2Rpcj0iJGxpYmRpciIKICAJICBm
aQotLS0gCi0yLjI1LjEKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2djYy9n
Y2MtOS4zLzAwMTgtZXhwb3J0LUNQUC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2Mv
Z2NjLTEwLjEvMDAxOC1leHBvcnQtQ1BQLnBhdGNoCnNpbWlsYXJpdHkgaW5kZXggOTMlCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2MvZ2NjLTkuMy8wMDE4LWV4cG9ydC1DUFAu
cGF0Y2gKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2MvZ2NjLTEwLjEvMDAxOC1l
eHBvcnQtQ1BQLnBhdGNoCmluZGV4IDIzODUwOTljMjUuLjFmYWFiOWNkMmUgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2MvZ2NjLTkuMy8wMDE4LWV4cG9ydC1DUFAucGF0Y2gK
KysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2djYy9nY2MtMTAuMS8wMDE4LWV4cG9ydC1DUFAu
cGF0Y2gKQEAgLTEsNyArMSw3IEBACi1Gcm9tIGNhZmI2YTYyMWMwNWMxZjIzODY3OWQ1MmZjMDI2
NDQ2ZjM4YzhhZjUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDE0NWZmYjAwMWNkZmZj
ZGExOThmMWM2YmE5OGNmOGIxOThmMmU1MmQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9t
OiBLaGVtIFJhaiA8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86
cmFqLmtoZW1AZ21haWwuY29tIj4mbHQ7cmFqLmtoZW1AZ21haWwuY29tJmd0OzwvYT4KIERhdGU6
IEZyaSwgMjAgRmViIDIwMTUgMDk6NDA6NTkgKzAwMDAKLVN1YmplY3Q6IFtQQVRDSCAxOC8zOV0g
ZXhwb3J0IENQUAorU3ViamVjdDogW1BBVENIXSBleHBvcnQgQ1BQCiAKIFRoZSBPRSBlbnZpcm9u
bWVudCBzZXRzIGFuZCBleHBvcnRzIENQUCBhcyBiZWluZyB0aGUgdGFyZ2V0IGdjYy4gV2hlbgog
YnVpbGRpbmcgZ2NjLWNyb3NzLWNhbmFkaWFuIGZvciBhIG1pbmd3IHRhcmdldHRlZCBzZGssIHRo
ZSBmb2xsb3dpbmcgY2FuIGJlIGZvdW5kCkBAIC0zNyw3ICszNyw3IEBAIFNpZ25lZC1vZmYtYnk6
IEtoZW0gUmFqIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzpy
YWoua2hlbUBnbWFpbC5jb20iPiZsdDtyYWoua2hlbUBnbWFpbC5jb20mZ3Q7PC9hPgogIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQogCiBkaWZmIC0tZ2l0IGEvTWFrZWZpbGUuaW4gYi9N
YWtlZmlsZS5pbgotaW5kZXggNjRlMDkxYmE3MWQuLjI1NTgyMmUzZjI3IDEwMDY0NAoraW5kZXgg
MzZlMzY5ZGY2ZTcuLmM3MTc5MDNiYjEzIDEwMDY0NAogLS0tIGEvTWFrZWZpbGUuaW4KICsrKyBi
L01ha2VmaWxlLmluCiBAQCAtMTQ5LDYgKzE0OSw3IEBAIEJVSUxEX0VYUE9SVFMgPSBcCkBAIC00
OCw2ICs0OCwzIEBAIGluZGV4IDY0ZTA5MWJhNzFkLi4yNTU4MjJlM2YyNyAxMDA2NDQKICAJQ0ZM
QUdTPSIkKENGTEFHU19GT1JfQlVJTEQpIjsgZXhwb3J0IENGTEFHUzsgXAogIAlDT05GSUdfU0hF
TEw9IiQoU0hFTEwpIjsgZXhwb3J0IENPTkZJR19TSEVMTDsgXAogIAlDWFg9IiQoQ1hYX0ZPUl9C
VUlMRCkiOyBleHBvcnQgQ1hYOyBcCi0tLSAKLTIuMjUuMQotCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvZ2NjL2djYy05LjMvMDAxOS1FbnN1cmUtdGFyZ2V0LWdjYy1oZWFkZXJz
LWNhbi1iZS1pbmNsdWRlZC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2MvZ2NjLTEw
LjEvMDAxOS1FbnN1cmUtdGFyZ2V0LWdjYy1oZWFkZXJzLWNhbi1iZS1pbmNsdWRlZC5wYXRjaApz
aW1pbGFyaXR5IGluZGV4IDg4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2Nj
L2djYy05LjMvMDAxOS1FbnN1cmUtdGFyZ2V0LWdjYy1oZWFkZXJzLWNhbi1iZS1pbmNsdWRlZC5w
YXRjaApyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2djYy9nY2MtMTAuMS8wMDE5LUVu
c3VyZS10YXJnZXQtZ2NjLWhlYWRlcnMtY2FuLWJlLWluY2x1ZGVkLnBhdGNoCmluZGV4IGUwMTI5
ZDFmOTYuLmVjODUxMDc1OGIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2Mv
Z2NjLTkuMy8wMDE5LUVuc3VyZS10YXJnZXQtZ2NjLWhlYWRlcnMtY2FuLWJlLWluY2x1ZGVkLnBh
dGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2MvZ2NjLTEwLjEvMDAxOS1FbnN1cmUt
dGFyZ2V0LWdjYy1oZWFkZXJzLWNhbi1iZS1pbmNsdWRlZC5wYXRjaApAQCAtMSw3ICsxLDcgQEAK
LUZyb20gMTgyMDU3YjgwODkxZWRjMGU4ZDQ2ODM1ZTJkOGJmZDI4MzMwYTU1YSBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKK0Zyb20gZjc3MGFjMmFkYmM5MGZlNTcwZDYwNzY1MDcwNDAzZTY4ODJl
MWE5NSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxhIGNsYXNzPSJt
b3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzpyYWoua2hlbUBnbWFpbC5jb20iPiZs
dDtyYWoua2hlbUBnbWFpbC5jb20mZ3Q7PC9hPgogRGF0ZTogRnJpLCAyMCBGZWIgMjAxNSAxMDoy
NToxMSArMDAwMAotU3ViamVjdDogW1BBVENIIDE5LzM5XSBFbnN1cmUgdGFyZ2V0IGdjYyBoZWFk
ZXJzIGNhbiBiZSBpbmNsdWRlZAorU3ViamVjdDogW1BBVENIXSBFbnN1cmUgdGFyZ2V0IGdjYyBo
ZWFkZXJzIGNhbiBiZSBpbmNsdWRlZAogCiBUaGVyZSBhcmUgYSBmZXcgaGVhZGVycyBpbnN0YWxs
ZWQgYXMgcGFydCBvZiB0aGUgT3BlbkVtYmVkZGVkCiBnY2MtcnVudGltZSB0YXJnZXQgKG9tcC5o
LCBzc3AvKi5oKS4gQmVpbmcgaW5zdGFsbGVkIGZyb20gYSByZWNpcGUKQEAgLTIxLDcgKzIxLDcg
QEAgU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2
RSIgaHJlZj0ibWFpbHRvOnJhai5raGVtQGdtYWlsLmNvbSI+Jmx0O3Jhai5raGVtQGdtYWlsLmNv
bSZndDs8L2E+CiAgMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKIAogZGlmZiAtLWdp
dCBhL2djYy9NYWtlZmlsZS5pbiBiL2djYy9NYWtlZmlsZS5pbgotaW5kZXggNTdjZjc4MDRmMGEu
Ljc3NzIzNDJhZDVlIDEwMDY0NAoraW5kZXggNDgwYzkzNjY0MTguLjAxMWM3YWMyZGI2IDEwMDY0
NAogLS0tIGEvZ2NjL01ha2VmaWxlLmluCiArKysgYi9nY2MvTWFrZWZpbGUuaW4KIEBAIC02MTgs
NiArNjE4LDcgQEAgbGliZXhlY2RpciA9IEBsaWJleGVjZGlyQApAQCAtMzIsNyArMzIsNyBAQCBp
bmRleCA1N2NmNzgwNGYwYS4uNzc3MjM0MmFkNWUgMTAwNjQ0CiAgIyBEaXJlY3RvcnkgaW4gd2hp
Y2ggdGhlIGNvbXBpbGVyIGZpbmRzIGV4ZWN1dGFibGVzCiAgbGliZXhlY3N1YmRpciA9ICQobGli
ZXhlY2RpcikvZ2NjLyQocmVhbF90YXJnZXRfbm9uY2Fub25pY2FsKS8kKHZlcnNpb24pJChhY2Nl
bF9kaXJfc3VmZml4KQogICMgRGlyZWN0b3J5IGluIHdoaWNoIGFsbCBwbHVnaW4gcmVzb3VyY2Vz
IGFyZSBpbnN0YWxsZWQKLUBAIC0yODY3LDYgKzI4NjgsNyBAQCBDRkxBR1MtaW50bC5vICs9IC1E
TE9DQUxFRElSPVwiJChsb2NhbGVkaXIpXDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUi
IGhyZWY9Im1haWx0bzorQEAtMjk0Niw2KzI5NDcsN0BAQ0ZMQUdTLWludGwubys9LURMT0NBTEVE
SVI9XCI+IgorQEAgLTI5NDYsNiArMjk0Nyw3IEBAIENGTEFHUy1pbnRsLm8gKz0gLURMT0NBTEVE
SVI9XCI8L2E+JChsb2NhbGVkaXIpXCIKICAKICBQUkVQUk9DRVNTT1JfREVGSU5FUyA9IFwKICAg
IC1ER0NDX0lOQ0xVREVfRElSPVwiJChsaWJzdWJkaXIpL2luY2x1ZGVcIiBcCkBAIC00MSw3ICs0
MSw3IEBAIGluZGV4IDU3Y2Y3ODA0ZjBhLi43NzcyMzQyYWQ1ZSAxMDA2NDQKICAgIC1ER1BMVVNQ
TFVTX0lOQ0xVREVfRElSPVwiJChnY2NfZ3h4X2luY2x1ZGVfZGlyKVwiIFwKICAgIC1ER1BMVVNQ
TFVTX0lOQ0xVREVfRElSX0FERF9TWVNST09UPSQoZ2NjX2d4eF9pbmNsdWRlX2Rpcl9hZGRfc3lz
cm9vdCkgXAogZGlmZiAtLWdpdCBhL2djYy9jcHBkZWZhdWx0LmMgYi9nY2MvY3BwZGVmYXVsdC5j
Ci1pbmRleCBjNDc5NjM4NTY0My4uOTgwZTJiZDQ3YTcgMTAwNjQ0CitpbmRleCBhZjM4Y2M0OTRl
YS4uMmY0M2I4OGEwYzMgMTAwNjQ0CiAtLS0gYS9nY2MvY3BwZGVmYXVsdC5jCiArKysgYi9nY2Mv
Y3BwZGVmYXVsdC5jCiBAQCAtNTksNiArNTksMTAgQEAgY29uc3Qgc3RydWN0IGRlZmF1bHRfaW5j
bHVkZSBjcHBfaW5jbHVkZV9kZWZhdWx0c1tdCkBAIC01NSw2ICs1NSwzIEBAIGluZGV4IGM0Nzk2
Mzg1NjQzLi45ODBlMmJkNDdhNyAxMDA2NDQKICAjaWZkZWYgTE9DQUxfSU5DTFVERV9ESVIKICAg
ICAgLyogL3Vzci9sb2NhbC9pbmNsdWRlIGNvbWVzIGJlZm9yZSB0aGUgZml4aW5jbHVkZWQgaGVh
ZGVyIGZpbGVzLiAgKi8KICAgICAgeyBMT0NBTF9JTkNMVURFX0RJUiwgMCwgMCwgMSwgMSwgMiB9
LAotLS0gCi0yLjI1LjEKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2djYy9n
Y2MtOS4zLzAwMjEtRG9uLXQtc2VhcmNoLWhvc3QtZGlyZWN0b3J5LWR1cmluZy1yZWxpbmstaWYt
aW5zdF9wci5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2MvZ2NjLTEwLjEvMDAyMC1E
b24tdC1zZWFyY2gtaG9zdC1kaXJlY3RvcnktZHVyaW5nLXJlbGluay1pZi1pbnN0X3ByLnBhdGNo
CnNpbWlsYXJpdHkgaW5kZXggODAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9n
Y2MvZ2NjLTkuMy8wMDIxLURvbi10LXNlYXJjaC1ob3N0LWRpcmVjdG9yeS1kdXJpbmctcmVsaW5r
LWlmLWluc3RfcHIucGF0Y2gKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2MvZ2Nj
LTEwLjEvMDAyMC1Eb24tdC1zZWFyY2gtaG9zdC1kaXJlY3RvcnktZHVyaW5nLXJlbGluay1pZi1p
bnN0X3ByLnBhdGNoCmluZGV4IGUzNjNjN2Q0NDUuLmU3M2VhNzYyYTIgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9nY2MvZ2NjLTkuMy8wMDIxLURvbi10LXNlYXJjaC1ob3N0LWRp
cmVjdG9yeS1kdXJpbmctcmVsaW5rLWlmLWluc3RfcHIucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2djYy9nY2MtMTAuMS8wMDIwLURvbi10LXNlYXJjaC1ob3N0LWRpcmVjdG9yeS1k
dXJpbmctcmVsaW5rLWlmLWluc3RfcHIucGF0Y2gKQEAgLTEsOCArMSw4IEBACi1Gcm9tIGYzZWRh
ZDgxZDgwZGRlNWQ2NGJmNzdlNmFiYWZkYTU0ZGIxMGI4MjQgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCitGcm9tIDliNzgwYmFjNjI0OTA1OTA0ZmJhOWZjNTIxMDg1M2QwNzVlODc0OTAgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLaGVtIFJhaiA8YSBjbGFzcz0ibW96LXR4dC1saW5r
LXJmYzIzOTZFIiBocmVmPSJtYWlsdG86cmFqLmtoZW1AZ21haWwuY29tIj4mbHQ7cmFqLmtoZW1A
Z21haWwuY29tJmd0OzwvYT4KIERhdGU6IFR1ZSwgMyBNYXIgMjAxNSAwODoyMToxOSArMDAwMAot
U3ViamVjdDogW1BBVENIIDIxLzM5XSBEb24ndCBzZWFyY2ggaG9zdCBkaXJlY3RvcnkgZHVyaW5n
ICJyZWxpbmsiIGlmCi0gJGluc3RfcHJlZml4IGlzIHByb3ZpZGVkCitTdWJqZWN0OiBbUEFUQ0hd
IERvbid0IHNlYXJjaCBob3N0IGRpcmVjdG9yeSBkdXJpbmcgInJlbGluayIgaWYgJGluc3RfcHJl
Zml4CisgaXMgcHJvdmlkZWQKIAogPGEgY2xhc3M9Im1vei10eHQtbGluay1mcmVldGV4dCIgaHJl
Zj0iaHR0cDovL2xpc3RzLmdudS5vcmcvYXJjaGl2ZS9odG1sL2xpYnRvb2wtcGF0Y2hlcy8yMDEx
LTAxL21zZzAwMDI2Lmh0bWwiPmh0dHA6Ly9saXN0cy5nbnUub3JnL2FyY2hpdmUvaHRtbC9saWJ0
b29sLXBhdGNoZXMvMjAxMS0wMS9tc2cwMDAyNi5odG1sPC9hPgogCkBAIC0xNCw3ICsxNCw3IEBA
IFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUi
IGhyZWY9Im1haWx0bzpyYWoua2hlbUBnbWFpbC5jb20iPiZsdDtyYWoua2hlbUBnbWFpbC5jb20m
Z3Q7PC9hPgogIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CiAKIGRpZmYgLS1naXQgYS9sdG1haW4uc2ggYi9sdG1haW4uc2gKLWluZGV4IDBhOTNiNGU1YzNi
Li42ZGU2ZWQyZjlhMCAxMDA2NDQKK2luZGV4IDllYmM3ZTNkMWUwLi43ZWE3OWZhOGJlNiAxMDA2
NDQKIC0tLSBhL2x0bWFpbi5zaAogKysrIGIvbHRtYWluLnNoCiBAQCAtNjAwNCwxMiArNjAwNCwx
MyBAQCBmdW5jX21vZGVfbGluayAoKQpAQCAtMzMsNiArMzMsMyBAQCBpbmRleCAwYTkzYjRlNWMz
Yi4uNmRlNmVkMmY5YTAgMTAwNjQ0CiAgCQkgICAgOzsKICAJCWVzYWMKICAJICAgICAgZmkKLS0t
IAotMi4yNS4xCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2MvZ2NjLTku
My8wMDIyLVVzZS1TWVNURU1MSUJTX0RJUi1yZXBsYWNlbWVudC1pbnN0ZWFkLW9mLWhhcmRjb2Rp
bmcucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2djYy0xMC4xLzAwMjEtVXNlLVNZ
U1RFTUxJQlNfRElSLXJlcGxhY2VtZW50LWluc3RlYWQtb2YtaGFyZGNvZGluZy5wYXRjaApzaW1p
bGFyaXR5IGluZGV4IDgxJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2dj
Yy05LjMvMDAyMi1Vc2UtU1lTVEVNTElCU19ESVItcmVwbGFjZW1lbnQtaW5zdGVhZC1vZi1oYXJk
Y29kaW5nLnBhdGNoCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2djYy0xMC4x
LzAwMjEtVXNlLVNZU1RFTUxJQlNfRElSLXJlcGxhY2VtZW50LWluc3RlYWQtb2YtaGFyZGNvZGlu
Zy5wYXRjaAppbmRleCA4NDZjMGRlNWU4Li5lMzgxNTc5OTI4IDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvZ2NjL2djYy05LjMvMDAyMi1Vc2UtU1lTVEVNTElCU19ESVItcmVwbGFj
ZW1lbnQtaW5zdGVhZC1vZi1oYXJkY29kaW5nLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9nY2MvZ2NjLTEwLjEvMDAyMS1Vc2UtU1lTVEVNTElCU19ESVItcmVwbGFjZW1lbnQtaW5z
dGVhZC1vZi1oYXJkY29kaW5nLnBhdGNoCkBAIC0xLDcgKzEsNyBAQAotRnJvbSBiOGVhMmMyYzdk
MzMzNzZmNWRkNjUxNjQ2YzdlODIyMDAwZTQ3NzQ5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQor
RnJvbSAwNWYzOTJmMmNiZmU1ZDQ5NDRjYTViYTBmNzM1MzhjNjYxZmJkZjJhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMy
Mzk2RSIgaHJlZj0ibWFpbHRvOnJhai5raGVtQGdtYWlsLmNvbSI+Jmx0O3Jhai5raGVtQGdtYWls
LmNvbSZndDs8L2E+CiBEYXRlOiBUdWUsIDI4IEFwciAyMDE1IDIzOjE1OjI3IC0wNzAwCi1TdWJq
ZWN0OiBbUEFUQ0ggMjIvMzldIFVzZSBTWVNURU1MSUJTX0RJUiByZXBsYWNlbWVudCBpbnN0ZWFk
IG9mIGhhcmRjb2RpbmcKK1N1YmplY3Q6IFtQQVRDSF0gVXNlIFNZU1RFTUxJQlNfRElSIHJlcGxh
Y2VtZW50IGluc3RlYWQgb2YgaGFyZGNvZGluZwogIGJhc2VfbGliZGlyCiAKIFVwc3RyZWFtLVN0
YXR1czogUGVuZGluZwpAQCAtMTIsNyArMTIsNyBAQCBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8
YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86cmFqLmtoZW1AZ21h
aWwuY29tIj4mbHQ7cmFqLmtoZW1AZ21haWwuY29tJmd0OzwvYT4KICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL2djYy9jb25maWcv
YWFyY2g2NC9hYXJjaDY0LWxpbnV4LmggYi9nY2MvY29uZmlnL2FhcmNoNjQvYWFyY2g2NC1saW51
eC5oCi1pbmRleCA1ZThiMzRkZWQwMy4uN2U2MjhiZjY2MWUgMTAwNjQ0CitpbmRleCBlNTg3ZTJl
OWFkNi4uZGRjNjI4OTU2OTMgMTAwNjQ0CiAtLS0gYS9nY2MvY29uZmlnL2FhcmNoNjQvYWFyY2g2
NC1saW51eC5oCiArKysgYi9nY2MvY29uZmlnL2FhcmNoNjQvYWFyY2g2NC1saW51eC5oCiBAQCAt
MjEsNyArMjEsNyBAQApAQCAtMjQsNiArMjQsMyBAQCBpbmRleCA1ZThiMzRkZWQwMy4uN2U2Mjhi
ZjY2MWUgMTAwNjQ0CiAgCiAgI3VuZGVmIE1VU0xfRFlOQU1JQ19MSU5LRVIKICAjZGVmaW5lIE1V
U0xfRFlOQU1JQ19MSU5LRVIgIi9saWIvbGQtbXVzbC1hYXJjaDY0JXttYmlnLWVuZGlhbjpfYmV9
JXttYWJpPWlscDMyOl9pbHAzMn0uc28uMSIKLS0tIAotMi4yNS4xCi0KZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9nY2MvZ2NjLTkuMy8wMDIzLWFhcmNoNjQtQWRkLXN1cHBvcnQt
Zm9yLW11c2wtbGRzby5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2MvZ2NjLTEwLjEv
MDAyMi1hYXJjaDY0LUFkZC1zdXBwb3J0LWZvci1tdXNsLWxkc28ucGF0Y2gKc2ltaWxhcml0eSBp
bmRleCA4MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2djYy9nY2MtOS4zLzAw
MjMtYWFyY2g2NC1BZGQtc3VwcG9ydC1mb3ItbXVzbC1sZHNvLnBhdGNoCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2djYy0xMC4xLzAwMjItYWFyY2g2NC1BZGQtc3VwcG9ydC1m
b3ItbXVzbC1sZHNvLnBhdGNoCmluZGV4IDEwMmQ2ZmM3NDIuLmQ5MmQ2YmMyYzUgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2MvZ2NjLTkuMy8wMDIzLWFhcmNoNjQtQWRkLXN1
cHBvcnQtZm9yLW11c2wtbGRzby5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2Nj
L2djYy0xMC4xLzAwMjItYWFyY2g2NC1BZGQtc3VwcG9ydC1mb3ItbXVzbC1sZHNvLnBhdGNoCkBA
IC0xLDcgKzEsNyBAQAotRnJvbSA4NjQ1YjU3ZTdjMGRmZDkzYWZlZTVjYWVhYTUzNGM3MTRmNDQ5
YmExIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBiZGY0MDhlM2UyZGU0NGI0MjAzNjVj
YjdlYWQyZTk5NWZmZjVkNzgyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBS
YWogPGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOnJhai5raGVt
QGdtYWlsLmNvbSI+Jmx0O3Jhai5raGVtQGdtYWlsLmNvbSZndDs8L2E+CiBEYXRlOiBUdWUsIDI4
IEFwciAyMDE1IDIzOjE4OjM5IC0wNzAwCi1TdWJqZWN0OiBbUEFUQ0ggMjMvMzldIGFhcmNoNjQ6
IEFkZCBzdXBwb3J0IGZvciBtdXNsIGxkc28KK1N1YmplY3Q6IFtQQVRDSF0gYWFyY2g2NDogQWRk
IHN1cHBvcnQgZm9yIG11c2wgbGRzbwogCiBVcHN0cmVhbS1TdGF0dXM6IFBlbmRpbmcKIApAQCAt
MTEsNyArMTEsNyBAQCBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8YSBjbGFzcz0ibW96LXR4dC1s
aW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86cmFqLmtoZW1AZ21haWwuY29tIj4mbHQ7cmFqLmto
ZW1AZ21haWwuY29tJmd0OzwvYT4KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL2djYy9jb25maWcvYWFyY2g2NC9hYXJjaDY0LWxp
bnV4LmggYi9nY2MvY29uZmlnL2FhcmNoNjQvYWFyY2g2NC1saW51eC5oCi1pbmRleCA3ZTYyOGJm
NjYxZS4uMTcxN2NiZTU0NzEgMTAwNjQ0CitpbmRleCBkZGM2Mjg5NTY5My4uYjMwMTgyNTMxM2Eg
MTAwNjQ0CiAtLS0gYS9nY2MvY29uZmlnL2FhcmNoNjQvYWFyY2g2NC1saW51eC5oCiArKysgYi9n
Y2MvY29uZmlnL2FhcmNoNjQvYWFyY2g2NC1saW51eC5oCiBAQCAtMjQsNyArMjQsNyBAQApAQCAt
MjMsNiArMjMsMyBAQCBpbmRleCA3ZTYyOGJmNjYxZS4uMTcxN2NiZTU0NzEgMTAwNjQ0CiAgCiAg
I3VuZGVmICBBU0FOX0NDMV9TUEVDCiAgI2RlZmluZSBBU0FOX0NDMV9TUEVDICIleyU6c2FuaXRp
emUoYWRkcmVzcyk6LWZ1bndpbmQtdGFibGVzfSIKLS0tIAotMi4yNS4xCi0KZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2MvZ2NjLTkuMy8wMDI0LWxpYmNjMS1maXgtbGliY2Mx
LXMtaW5zdGFsbC1wYXRoLWFuZC1ycGF0aC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9n
Y2MvZ2NjLTEwLjEvMDAyMy1saWJjYzEtZml4LWxpYmNjMS1zLWluc3RhbGwtcGF0aC1hbmQtcnBh
dGgucGF0Y2gKc2ltaWxhcml0eSBpbmRleCA5MSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2djYy9nY2MtOS4zLzAwMjQtbGliY2MxLWZpeC1saWJjYzEtcy1pbnN0YWxsLXBhdGgt
YW5kLXJwYXRoLnBhdGNoCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2djYy0x
MC4xLzAwMjMtbGliY2MxLWZpeC1saWJjYzEtcy1pbnN0YWxsLXBhdGgtYW5kLXJwYXRoLnBhdGNo
CmluZGV4IDQ0M2UwYTJjYTYuLmY4MmVhYjdhZjkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9nY2MvZ2NjLTkuMy8wMDI0LWxpYmNjMS1maXgtbGliY2MxLXMtaW5zdGFsbC1wYXRo
LWFuZC1ycGF0aC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2djYy0xMC4x
LzAwMjMtbGliY2MxLWZpeC1saWJjYzEtcy1pbnN0YWxsLXBhdGgtYW5kLXJwYXRoLnBhdGNoCkBA
IC0xLDcgKzEsNyBAQAotRnJvbSBiMTY2NjU2NWU0ZTEzM2VlNDFmMzJmYTgwMzIxNjViY2IwNmFm
ZTlhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA0NTJkZjc4YjYxNTUzY2Y4ODE2MDRi
OTk2ZjdiZWI2Y2NjMzQ0MTEwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUm9iZXJ0
IFlhbmcgPGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOmxpZXpo
aS55YW5nQHdpbmRyaXZlci5jb20iPiZsdDtsaWV6aGkueWFuZ0B3aW5kcml2ZXIuY29tJmd0Ozwv
YT4KIERhdGU6IFN1biwgNSBKdWwgMjAxNSAyMDoyNToxOCAtMDcwMAotU3ViamVjdDogW1BBVENI
IDI0LzM5XSBsaWJjYzE6IGZpeCBsaWJjYzEncyBpbnN0YWxsIHBhdGggYW5kIHJwYXRoCitTdWJq
ZWN0OiBbUEFUQ0hdIGxpYmNjMTogZml4IGxpYmNjMSdzIGluc3RhbGwgcGF0aCBhbmQgcnBhdGgK
IAogKiBJbnN0YWxsIGxpYmNjMS5zbyBhbmQgbGliY2MxcGx1Z2luLnNvIGludG8KICAgJChsaWJl
eGVjZGlyKS9nY2MvJCh0YXJnZXRfbm9uY2Fub25pY2FsKS8kKGdjY192ZXJzaW9uKSwgYXMgd2hh
dCB3ZQpAQCAtMjAsNyArMjAsNyBAQCBTaWduZWQtb2ZmLWJ5OiBSb2JlcnQgWWFuZyA8YSBjbGFz
cz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86bGllemhpLnlhbmdAd2luZHJp
dmVyLmNvbSI+Jmx0O2xpZXpoaS55YW5nQHdpbmRyaXZlci5jb20mZ3Q7PC9hPgogIDIgZmlsZXMg
Y2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEv
bGliY2MxL01ha2VmaWxlLmFtIGIvbGliY2MxL01ha2VmaWxlLmFtCi1pbmRleCA3MmM2YWVhZDQ3
NS4uNDJhODc3NDBiMzEgMTAwNjQ0CitpbmRleCBjMDA1YjBkYWQ0YS4uZWMzMWQzNWI3YjkgMTAw
NjQ0CiAtLS0gYS9saWJjYzEvTWFrZWZpbGUuYW0KICsrKyBiL2xpYmNjMS9NYWtlZmlsZS5hbQog
QEAgLTM3LDggKzM3LDggQEAgbGliaWJlcnR5ID0gJChpZiAkKHdpbGRjYXJkICQobGliaWJlcnR5
X25vYXNhbikpLCQoV2MpJChsaWJpYmVydHlfbm9hc2FuKSwgXApAQCAtNDksNiArNDksMyBAQCBp
bmRleCA3MTA0YjY0OTAyNi4uMjEwM2M0Nzc0NjggMTAwNjQ0CiAgQEVOQUJMRV9QTFVHSU5fVFJV
RUBwbHVnaW5fTFRMSUJSQVJJRVMgPSBsaWJjYzFwbHVnaW4ubGEgbGliY3AxcGx1Z2luLmxhCiAg
QEVOQUJMRV9QTFVHSU5fVFJVRUBjYzFsaWJfTFRMSUJSQVJJRVMgPSBsaWJjYzEubGEKICBzaGFy
ZWRfc291cmNlID0gY2FsbGJhY2tzLmNjIGNhbGxiYWNrcy5oaCBjb25uZWN0aW9uLmNjIGNvbm5l
Y3Rpb24uaGggXAotLS0gCi0yLjI1LjEKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2djYy9nY2MtOS4zLzAwMjUtaGFuZGxlLXN5c3Jvb3Qtc3VwcG9ydC1mb3ItbmF0aXZlc2Rr
LWdjYy5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2MvZ2NjLTEwLjEvMDAyNC1oYW5k
bGUtc3lzcm9vdC1zdXBwb3J0LWZvci1uYXRpdmVzZGstZ2NjLnBhdGNoCnNpbWlsYXJpdHkgaW5k
ZXggODQlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2MvZ2NjLTkuMy8wMDI1
LWhhbmRsZS1zeXNyb290LXN1cHBvcnQtZm9yLW5hdGl2ZXNkay1nY2MucGF0Y2gKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2MvZ2NjLTEwLjEvMDAyNC1oYW5kbGUtc3lzcm9vdC1z
dXBwb3J0LWZvci1uYXRpdmVzZGstZ2NjLnBhdGNoCmluZGV4IDU5YWM5N2VhZWQuLjNmZDE0ZmY3
ZGEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2MvZ2NjLTkuMy8wMDI1LWhh
bmRsZS1zeXNyb290LXN1cHBvcnQtZm9yLW5hdGl2ZXNkay1nY2MucGF0Y2gKKysrIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2djYy9nY2MtMTAuMS8wMDI0LWhhbmRsZS1zeXNyb290LXN1cHBvcnQt
Zm9yLW5hdGl2ZXNkay1nY2MucGF0Y2gKQEAgLTEsNyArMSw3IEBACi1Gcm9tIDdkNjE0YTg0NzA5
ZDdkYzRhMjUyOWMzZDUyOWUyZGE4NTQxZjlmZDQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitG
cm9tIDFjMTA2OWZjODZhYmQzOWU4MzE4MzE1ODU2MWNmOWFmOGZhOGI1NDEgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCiBGcm9tOiBLaGVtIFJhaiA8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIz
OTZFIiBocmVmPSJtYWlsdG86cmFqLmtoZW1AZ21haWwuY29tIj4mbHQ7cmFqLmtoZW1AZ21haWwu
Y29tJmd0OzwvYT4KIERhdGU6IE1vbiwgNyBEZWMgMjAxNSAyMzozOTo1NCArMDAwMAotU3ViamVj
dDogW1BBVENIIDI1LzM5XSBoYW5kbGUgc3lzcm9vdCBzdXBwb3J0IGZvciBuYXRpdmVzZGstZ2Nj
CitTdWJqZWN0OiBbUEFUQ0hdIGhhbmRsZSBzeXNyb290IHN1cHBvcnQgZm9yIG5hdGl2ZXNkay1n
Y2MKIAogQmVpbmcgYWJsZSB0byBidWlsZCBhIG5hdGl2ZXNkayBnY2MgaXMgdXNlZnVsLCBwYXJ0
aWN1bGFybHkgaW4gY2FzZXMKIHdoZXJlIHRoZSBob3N0IGNvbXBpbGVyIG1heSBiZSBvZiBhbiBp
bmNvbXBhdGlibGUgdmVyc2lvbiAob3IgYSAzMgpAQCAtMzIsMTggKzMyLDMzIEBAIGltcGxlbWVu
dGF0aW9uLikKIAogU2lnbmVkLW9mZi1ieTogTWFyayBIYXRsZSA8YSBjbGFzcz0ibW96LXR4dC1s
aW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86bWFyay5oYXRsZUBrZXJuZWwuY3Jhc2hpbmcub3Jn
Ij4mbHQ7bWFyay5oYXRsZUBrZXJuZWwuY3Jhc2hpbmcub3JnJmd0OzwvYT4KIC0tLQotIGMtZmFt
aWx5L2Mtb3B0cy5jIHwgICAgNCArLS0KLSBjcHBkZWZhdWx0LmMgICAgICB8ICAgNjMgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tCi0gY3BwZGVm
YXVsdC5oICAgICAgfCAgIDEzICsrKystLS0tLS0tCi0gZ2NjLmMgICAgICAgICAgICAgfCAgIDIw
ICsrKysrKysrKysrKy0tLS0tCi0gaW5jcGF0aC5jICAgICAgICAgfCAgIDEyICsrKysrLS0tLS0K
LSBwcmVmaXguYyAgICAgICAgICB8ICAgIDQgKy0tCi0gNiBmaWxlcyBjaGFuZ2VkLCA2OCBpbnNl
cnRpb25zKCspLCA0OCBkZWxldGlvbnMoLSkKKyBnY2MvYy1mYW1pbHkvYy1vcHRzLmMgfCAgNCAr
LS0KKyBnY2MvY3BwZGVmYXVsdC5jICAgICAgfCA2MyArKysrKysrKysrKysrKysrKysrKysrKysr
Ky0tLS0tLS0tLS0tLS0tLS0tCisgZ2NjL2NwcGRlZmF1bHQuaCAgICAgIHwgMTMgKysrKy0tLS0t
CisgZ2NjL2djYy5jICAgICAgICAgICAgIHwgMjAgKysrKysrKysrLS0tLS0KKyBnY2MvaW5jcGF0
aC5jICAgICAgICAgfCAxMiArKysrLS0tLS0KKyBnY2MvcHJlZml4LmMgICAgICAgICAgfCAgNiAr
KystLQorIDYgZmlsZXMgY2hhbmdlZCwgNzAgaW5zZXJ0aW9ucygrKSwgNDggZGVsZXRpb25zKC0p
CiAKLUluZGV4OiBnY2MtOS4zLjAvZ2NjL2NwcGRlZmF1bHQuYwotPT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQotLS0tIGdj
Yy05LjMuMC5vcmlnL2djYy9jcHBkZWZhdWx0LmMKLSsrKyBnY2MtOS4zLjAvZ2NjL2NwcGRlZmF1
bHQuYworZGlmZiAtLWdpdCBhL2djYy9jLWZhbWlseS9jLW9wdHMuYyBiL2djYy9jLWZhbWlseS9j
LW9wdHMuYworaW5kZXggNThiYTA5NDhlNzkuLjgwNmJiY2ZiN2E1IDEwMDY0NAorLS0tIGEvZ2Nj
L2MtZmFtaWx5L2Mtb3B0cy5jCisrKysgYi9nY2MvYy1mYW1pbHkvYy1vcHRzLmMKK0BAIC0xNDA5
LDggKzE0MDksOCBAQCBhZGRfcHJlZml4ZWRfcGF0aCAoY29uc3QgY2hhciAqc3VmZml4LCBpbmNw
YXRoX2tpbmQgY2hhaW4pCisgICBzaXplX3QgcHJlZml4X2xlbiwgc3VmZml4X2xlbjsKKyAKKyAg
IHN1ZmZpeF9sZW4gPSBzdHJsZW4gKHN1ZmZpeCk7CistICBwcmVmaXggICAgID0gaXByZWZpeCA/
IGlwcmVmaXggOiBjcHBfR0NDX0lOQ0xVREVfRElSOworLSAgcHJlZml4X2xlbiA9IGlwcmVmaXgg
PyBzdHJsZW4gKGlwcmVmaXgpIDogY3BwX0dDQ19JTkNMVURFX0RJUl9sZW47CisrICBwcmVmaXgg
ICAgID0gaXByZWZpeCA/IGlwcmVmaXggOiBHQ0NfSU5DTFVERV9ESVJWQVI7CisrICBwcmVmaXhf
bGVuID0gaXByZWZpeCA/IHN0cmxlbiAoaXByZWZpeCkgOiBzdHJsZW4oR0NDX0lOQ0xVREVfRElS
VkFSKSAtIDc7CisgCisgICBwYXRoID0gKGNoYXIgKikgeG1hbGxvYyAocHJlZml4X2xlbiArIHN1
ZmZpeF9sZW4gKyAxKTsKKyAgIG1lbWNweSAocGF0aCwgcHJlZml4LCBwcmVmaXhfbGVuKTsKK2Rp
ZmYgLS1naXQgYS9nY2MvY3BwZGVmYXVsdC5jIGIvZ2NjL2NwcGRlZmF1bHQuYworaW5kZXggMmY0
M2I4OGEwYzMuLjZiNmJlMDQ2ODZjIDEwMDY0NAorLS0tIGEvZ2NjL2NwcGRlZmF1bHQuYworKysr
IGIvZ2NjL2NwcGRlZmF1bHQuYwogQEAgLTM1LDYgKzM1LDMwIEBACiAgIyB1bmRlZiBDUk9TU19J
TkNMVURFX0RJUgogICNlbmRpZgpAQCAtNzUsNyArOTAsNyBAQCBJbmRleDogZ2NjLTkuMy4wL2dj
Yy9jcHBkZWZhdWx0LmMKICBjb25zdCBzdHJ1Y3QgZGVmYXVsdF9pbmNsdWRlIGNwcF9pbmNsdWRl
X2RlZmF1bHRzW10KICAjaWZkZWYgSU5DTFVERV9ERUZBVUxUUwogID0gSU5DTFVERV9ERUZBVUxU
UzsKLUBAIC00MiwzOCArNjYsMzggQEAgY29uc3Qgc3RydWN0IGRlZmF1bHRfaW5jbHVkZSBjcHBf
aW5jbHVkZQorQEAgLTQyLDM4ICs2NiwzOCBAQCBjb25zdCBzdHJ1Y3QgZGVmYXVsdF9pbmNsdWRl
IGNwcF9pbmNsdWRlX2RlZmF1bHRzW10KICA9IHsKICAjaWZkZWYgR1BMVVNQTFVTX0lOQ0xVREVf
RElSCiAgICAgIC8qIFBpY2sgdXAgR05VIEMrKyBnZW5lcmljIGluY2x1ZGUgZmlsZXMuICAqLwpA
QCAtMTIzLDcgKzEzOCw3IEBAIEluZGV4OiBnY2MtOS4zLjAvZ2NjL2NwcGRlZmF1bHQuYwogICAg
ICAgIC8qIEEgbXVsdGlsaWIgc3VmZml4IG5lZWRzIGFkZGluZyBpZiBkaWZmZXJlbnQgbXVsdGls
aWJzIHVzZQogIAkgZGlmZmVyZW50IGhlYWRlcnMuICAqLwogICNpZmRlZiBTWVNST09UX0hFQURF
UlNfU1VGRklYX1NQRUMKLUBAIC04NSwzMyArMTA5LDI0IEBAIGNvbnN0IHN0cnVjdCBkZWZhdWx0
X2luY2x1ZGUgY3BwX2luY2x1ZGUKK0BAIC04NSwzMyArMTA5LDI0IEBAIGNvbnN0IHN0cnVjdCBk
ZWZhdWx0X2luY2x1ZGUgY3BwX2luY2x1ZGVfZGVmYXVsdHNbXQogICNlbmRpZgogICNpZmRlZiBD
Uk9TU19JTkNMVURFX0RJUgogICAgICAvKiBPbmUgcGxhY2UgdGhlIHRhcmdldCBzeXN0ZW0ncyBo
ZWFkZXJzIG1pZ2h0IGJlLiAgKi8KQEAgLTE2MywxMCArMTc4LDEwIEBAIEluZGV4OiBnY2MtOS4z
LjAvZ2NjL2NwcGRlZmF1bHQuYwogIAogIC8qIFRoaXMgdmFsdWUgaXMgc2V0IGJ5IGNwcF9yZWxv
Y2F0ZWQgYXQgcnVudGltZSAqLwogIGNvbnN0IGNoYXIgKmdjY19leGVjX3ByZWZpeDsKLUluZGV4
OiBnY2MtOS4zLjAvZ2NjL2NwcGRlZmF1bHQuaAotPT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQotLS0tIGdjYy05LjMuMC5v
cmlnL2djYy9jcHBkZWZhdWx0LmgKLSsrKyBnY2MtOS4zLjAvZ2NjL2NwcGRlZmF1bHQuaAorZGlm
ZiAtLWdpdCBhL2djYy9jcHBkZWZhdWx0LmggYi9nY2MvY3BwZGVmYXVsdC5oCitpbmRleCBhNjgx
MjY0Zjc1ZS4uNWUxMGEyZmExNDAgMTAwNjQ0CistLS0gYS9nY2MvY3BwZGVmYXVsdC5oCisrKysg
Yi9nY2MvY3BwZGVmYXVsdC5oCiBAQCAtMzMsNyArMzMsOCBAQAogIAogIHN0cnVjdCBkZWZhdWx0
X2luY2x1ZGUKQEAgLTE5OCwxMSArMjEzLDExIEBAIEluZGV4OiBnY2MtOS4zLjAvZ2NjL2NwcGRl
ZmF1bHQuaAogIC8qIFRoZSBydW4tdGltZSBleGVjdXRpb24gcHJlZml4LiAgVGhpcyBpcyB0eXBp
Y2FsbHkgdGhlIGxpYi9nY2MKICAgICBzdWJkaXJlY3Rvcnkgb2YgdGhlIGFjdHVhbCBpbnN0YWxs
YXRpb24uICAqLwogIGV4dGVybiBjb25zdCBjaGFyICpnY2NfZXhlY19wcmVmaXg7Ci1JbmRleDog
Z2NjLTkuMy4wL2djYy9nY2MuYwotPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQotLS0tIGdjYy05LjMuMC5vcmlnL2djYy9n
Y2MuYwotKysrIGdjYy05LjMuMC9nY2MvZ2NjLmMKLUBAIC0yNTMsNiArMjUzLDggQEAgRklMRSAq
cmVwb3J0X3RpbWVzX3RvX2ZpbGUgPSBOVUxMOworZGlmZiAtLWdpdCBhL2djYy9nY2MuYyBiL2dj
Yy9nY2MuYworaW5kZXggYzg3ZjYwMzk1NWYuLjUzNWQ1YzNiYjY1IDEwMDY0NAorLS0tIGEvZ2Nj
L2djYy5jCisrKysgYi9nY2MvZ2NjLmMKK0BAIC0yNTIsNiArMjUyLDggQEAgRklMRSAqcmVwb3J0
X3RpbWVzX3RvX2ZpbGUgPSBOVUxMOwogICNlbmRpZgogIHN0YXRpYyBjb25zdCBjaGFyICp0YXJn
ZXRfc3lzdGVtX3Jvb3QgPSBERUZBVUxUX1RBUkdFVF9TWVNURU1fUk9PVDsKICAKQEAgLTIxMSw3
ICsyMjYsNyBAQCBJbmRleDogZ2NjLTkuMy4wL2djYy9nY2MuYwogIC8qIE5vbnplcm8gbWVhbnMg
cGFzcyB0aGUgdXBkYXRlZCB0YXJnZXRfc3lzdGVtX3Jvb3QgdG8gdGhlIGNvbXBpbGVyLiAgKi8K
ICAKICBzdGF0aWMgaW50IHRhcmdldF9zeXN0ZW1fcm9vdF9jaGFuZ2VkOwotQEAgLTUyNyw2ICs1
MjksNyBAQCBvciB3aXRoIGNvbnN0YW50IHRleHQgaW4gYSBzaW5nbGUgYXJndW1lCitAQCAtNTI2
LDYgKzUyOCw3IEBAIG9yIHdpdGggY29uc3RhbnQgdGV4dCBpbiBhIHNpbmdsZSBhcmd1bWVudC4K
ICAgJUcgICAgIHByb2Nlc3MgTElCR0NDX1NQRUMgYXMgYSBzcGVjLgogICAlUiAgICAgT3V0cHV0
IHRoZSBjb25jYXRlbmF0aW9uIG9mIHRhcmdldF9zeXN0ZW1fcm9vdCBhbmQKICAgICAgICAgIHRh
cmdldF9zeXNyb290X3N1ZmZpeC4KQEAgLTIxOSw3ICsyMzQsNyBAQCBJbmRleDogZ2NjLTkuMy4w
L2djYy9nY2MuYwogICAlUyAgICAgcHJvY2VzcyBTVEFSVEZJTEVfU1BFQyBhcyBhIHNwZWMuICBB
IGNhcGl0YWwgUyBpcyBhY3R1YWxseSB1c2VkIGhlcmUuCiAgICVFICAgICBwcm9jZXNzIEVOREZJ
TEVfU1BFQyBhcyBhIHNwZWMuICBBIGNhcGl0YWwgRSBpcyBhY3R1YWxseSB1c2VkIGhlcmUuCiAg
ICVDICAgICBwcm9jZXNzIENQUF9TUEVDIGFzIGEgc3BlYy4KLUBAIC0xNTAwLDEwICsxNTAzLDEw
IEBAIHN0YXRpYyBjb25zdCBjaGFyICpnY2NfbGliZXhlY19wcmVmaXg7CitAQCAtMTQ5OSwxMCAr
MTUwMiwxMCBAQCBzdGF0aWMgY29uc3QgY2hhciAqZ2NjX2xpYmV4ZWNfcHJlZml4OwogICAgIGdj
Y19leGVjX3ByZWZpeCBpcyBzZXQgYmVjYXVzZSwgaW4gdGhhdCBjYXNlLCB3ZSBrbm93IHdoZXJl
IHRoZQogICAgIGNvbXBpbGVyIGhhcyBiZWVuIGluc3RhbGxlZCwgYW5kIHVzZSBwYXRocyByZWxh
dGl2ZSB0byB0aGF0CiAgICAgbG9jYXRpb24gaW5zdGVhZC4gICovCkBAIC0yMzQsNyArMjQ5LDcg
QEAgSW5kZXg6IGdjYy05LjMuMC9nY2MvZ2NjLmMKICAKICAvKiBGb3IgbmF0aXZlIGNvbXBpbGVy
cywgdGhlc2UgYXJlIHdlbGwta25vd24gcGF0aHMgY29udGFpbmluZwogICAgIGNvbXBvbmVudHMg
dGhhdCBtYXkgYmUgcHJvdmlkZWQgYnkgdGhlIHN5c3RlbS4gIEZvciBjcm9zcwotQEAgLTE1MTEs
OSArMTUxNCw5IEBAIHN0YXRpYyBjb25zdCBjaGFyICpjb25zdCBzdGFuZGFyZF9zdGFydGYKK0BA
IC0xNTEwLDkgKzE1MTMsOSBAQCBzdGF0aWMgY29uc3QgY2hhciAqY29uc3Qgc3RhbmRhcmRfc3Rh
cnRmaWxlX3ByZWZpeCA9IFNUQU5EQVJEX1NUQVJURklMRV9QUkVGSVg7CiAgc3RhdGljIGNvbnN0
IGNoYXIgKm1kX2V4ZWNfcHJlZml4ID0gTURfRVhFQ19QUkVGSVg7CiAgc3RhdGljIGNvbnN0IGNo
YXIgKm1kX3N0YXJ0ZmlsZV9wcmVmaXggPSBNRF9TVEFSVEZJTEVfUFJFRklYOwogIHN0YXRpYyBj
b25zdCBjaGFyICptZF9zdGFydGZpbGVfcHJlZml4XzEgPSBNRF9TVEFSVEZJTEVfUFJFRklYXzE7
CkBAIC0yNDYsNyArMjYxLDcgQEAgSW5kZXg6IGdjYy05LjMuMC9nY2MvZ2NjLmMKICAgID0gU1RB
TkRBUkRfU1RBUlRGSUxFX1BSRUZJWF8yOwogIAogIC8qIEEgcmVsYXRpdmUgcGF0aCB0byBiZSB1
c2VkIGluIGZpbmRpbmcgdGhlIGxvY2F0aW9uIG9mIHRvb2xzCi1AQCAtNTkyMiw2ICs1OTI1LDEx
IEBAIGRvX3NwZWNfMSAoY29uc3QgY2hhciAqc3BlYywgaW50IGluc3dpdGMKK0BAIC01OTUyLDYg
KzU5NTUsMTEgQEAgZG9fc3BlY18xIChjb25zdCBjaGFyICpzcGVjLCBpbnQgaW5zd2l0Y2gsIGNv
bnN0IGNoYXIgKnNvZnRfbWF0Y2hlZF9wYXJ0KQogIAkgICAgICB9CiAgCSAgICBicmVhazsKICAK
QEAgLTI1OCwyNiArMjczLDExIEBAIEluZGV4OiBnY2MtOS4zLjAvZ2NjL2djYy5jCiAgCSAgY2Fz
ZSAnUyc6CiAgCSAgICB2YWx1ZSA9IGRvX3NwZWNfMSAoc3RhcnRmaWxlX3NwZWMsIDAsIE5VTEwp
OwogIAkgICAgaWYgKHZhbHVlICE9IDApCi1JbmRleDogZ2NjLTkuMy4wL2djYy9jLWZhbWlseS9j
LW9wdHMuYwotPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PQotLS0tIGdjYy05LjMuMC5vcmlnL2djYy9jLWZhbWlseS9jLW9w
dHMuYwotKysrIGdjYy05LjMuMC9nY2MvYy1mYW1pbHkvYy1vcHRzLmMKLUBAIC0xMzgyLDggKzEz
ODIsOCBAQCBhZGRfcHJlZml4ZWRfcGF0aCAoY29uc3QgY2hhciAqc3VmZml4LCBpCi0gICBzaXpl
X3QgcHJlZml4X2xlbiwgc3VmZml4X2xlbjsKLSAKLSAgIHN1ZmZpeF9sZW4gPSBzdHJsZW4gKHN1
ZmZpeCk7Ci0tICBwcmVmaXggICAgID0gaXByZWZpeCA/IGlwcmVmaXggOiBjcHBfR0NDX0lOQ0xV
REVfRElSOwotLSAgcHJlZml4X2xlbiA9IGlwcmVmaXggPyBzdHJsZW4gKGlwcmVmaXgpIDogY3Bw
X0dDQ19JTkNMVURFX0RJUl9sZW47Ci0rICBwcmVmaXggICAgID0gaXByZWZpeCA/IGlwcmVmaXgg
OiBHQ0NfSU5DTFVERV9ESVJWQVI7Ci0rICBwcmVmaXhfbGVuID0gaXByZWZpeCA/IHN0cmxlbiAo
aXByZWZpeCkgOiBzdHJsZW4oR0NDX0lOQ0xVREVfRElSVkFSKSAtIDc7Ci0gCi0gICBwYXRoID0g
KGNoYXIgKikgeG1hbGxvYyAocHJlZml4X2xlbiArIHN1ZmZpeF9sZW4gKyAxKTsKLSAgIG1lbWNw
eSAocGF0aCwgcHJlZml4LCBwcmVmaXhfbGVuKTsKLUluZGV4OiBnY2MtOS4zLjAvZ2NjL2luY3Bh
dGguYwotPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PQotLS0tIGdjYy05LjMuMC5vcmlnL2djYy9pbmNwYXRoLmMKLSsrKyBn
Y2MtOS4zLjAvZ2NjL2luY3BhdGguYwotQEAgLTEzMSw3ICsxMzEsNyBAQCBhZGRfc3RhbmRhcmRf
cGF0aHMgKGNvbnN0IGNoYXIgKnN5c3Jvb3QsCitkaWZmIC0tZ2l0IGEvZ2NjL2luY3BhdGguYyBi
L2djYy9pbmNwYXRoLmMKK2luZGV4IDkwOThhYjA0NGFiLi5iZmFkNGViZTM4MiAxMDA2NDQKKy0t
LSBhL2djYy9pbmNwYXRoLmMKKysrKyBiL2djYy9pbmNwYXRoLmMKK0BAIC0xMzEsNyArMTMxLDcg
QEAgYWRkX3N0YW5kYXJkX3BhdGhzIChjb25zdCBjaGFyICpzeXNyb290LCBjb25zdCBjaGFyICpp
cHJlZml4LAogICAgaW50IHJlbG9jYXRlZCA9IGNwcF9yZWxvY2F0ZWQgKCk7CiAgICBzaXplX3Qg
bGVuOwogIApAQCAtMjg2LDcgKzI4Niw3IEBAIEluZGV4OiBnY2MtOS4zLjAvZ2NjL2luY3BhdGgu
YwogICAgICB7CiAgICAgICAgLyogTG9vayBmb3IgZGlyZWN0b3JpZXMgdGhhdCBzdGFydCB3aXRo
IHRoZSBzdGFuZGFyZCBwcmVmaXguCiAgCSAiVHJhbnNsYXRlIiB0aGVtLCBpLmUuIHJlcGxhY2Ug
L3Vzci9sb2NhbC9saWIvZ2NjLi4uIHdpdGgKLUBAIC0xNDUsNyArMTQ1LDcgQEAgYWRkX3N0YW5k
YXJkX3BhdGhzIChjb25zdCBjaGFyICpzeXNyb290LAorQEAgLTE0NSw3ICsxNDUsNyBAQCBhZGRf
c3RhbmRhcmRfcGF0aHMgKGNvbnN0IGNoYXIgKnN5c3Jvb3QsIGNvbnN0IGNoYXIgKmlwcmVmaXgs
CiAgCQkgbm93LiAgKi8KICAJICAgICAgaWYgKHN5c3Jvb3QgJmFtcDsmYW1wOyBwLSZndDthZGRf
c3lzcm9vdCkKICAJCWNvbnRpbnVlOwpAQCAtMjk1LDcgKzI5NSw3IEBAIEluZGV4OiBnY2MtOS4z
LjAvZ2NjL2luY3BhdGguYwogIAkJewogIAkJICBjaGFyICpzdHIgPSBjb25jYXQgKGlwcmVmaXgs
IHAtJmd0O2ZuYW1lICsgbGVuLCBOVUxMKTsKICAJCSAgaWYgKHAtJmd0O211bHRpbGliID09IDEg
JmFtcDsmYW1wOyBpbXVsdGlsaWIpCi1AQCAtMTg1LDcgKzE4NSw3IEBAIGFkZF9zdGFuZGFyZF9w
YXRocyAoY29uc3QgY2hhciAqc3lzcm9vdCwKK0BAIC0xODUsNyArMTg1LDcgQEAgYWRkX3N0YW5k
YXJkX3BhdGhzIChjb25zdCBjaGFyICpzeXNyb290LCBjb25zdCBjaGFyICppcHJlZml4LAogIAkg
ICAgICBmcmVlIChzeXNyb290X25vX3RyYWlsaW5nX2Rpcl9zZXBhcmF0b3IpOwogIAkgICAgfQog
IAkgIGVsc2UgaWYgKCFwLSZndDthZGRfc3lzcm9vdCAmYW1wOyZhbXA7IHJlbG9jYXRlZApAQCAt
MzA0LDcgKzMwNCw3IEBAIEluZGV4OiBnY2MtOS4zLjAvZ2NjL2luY3BhdGguYwogIAkgICAgewog
ICAJICAgICAgc3RhdGljIGNvbnN0IGNoYXIgKnJlbG9jYXRlZF9wcmVmaXg7CiAgCSAgICAgIGNo
YXIgKm9zdHI7Ci1AQCAtMjAyLDEyICsyMDIsMTIgQEAgYWRkX3N0YW5kYXJkX3BhdGhzIChjb25z
dCBjaGFyICpzeXNyb290LAorQEAgLTIwMiwxMiArMjAyLDEyIEBAIGFkZF9zdGFuZGFyZF9wYXRo
cyAoY29uc3QgY2hhciAqc3lzcm9vdCwgY29uc3QgY2hhciAqaXByZWZpeCwKICAJCSAgZHVtbXkg
PSBjb25jYXQgKGdjY19leGVjX3ByZWZpeCwgImR1bW15IiwgTlVMTCk7CiAgCQkgIHJlbG9jYXRl
ZF9wcmVmaXgKICAJCSAgICA9IG1ha2VfcmVsYXRpdmVfcHJlZml4IChkdW1teSwKQEAgLTMyMCwx
MSArMzIwLDExIEBAIEluZGV4OiBnY2MtOS4zLjAvZ2NjL2luY3BhdGguYwogIAkJCSAgICAgTlVM
TCk7CiAgCSAgICAgIHN0ciA9IHVwZGF0ZV9wYXRoIChvc3RyLCBwLSZndDtjb21wb25lbnQpOwog
IAkgICAgICBmcmVlIChvc3RyKTsKLUluZGV4OiBnY2MtOS4zLjAvZ2NjL3ByZWZpeC5jCi09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09Ci0tLS0gZ2NjLTkuMy4wLm9yaWcvZ2NjL3ByZWZpeC5jCi0rKysgZ2NjLTkuMy4wL2dj
Yy9wcmVmaXguYwotQEAgLTcyLDcgKzcyLDkgQEAgTGljZW5zZSBhbG9uZyB3aXRoIEdDQzsgc2Vl
IHRoZSBmaWxlIENPUAorZGlmZiAtLWdpdCBhL2djYy9wcmVmaXguYyBiL2djYy9wcmVmaXguYwor
aW5kZXggMWE0MDNlNTM1YmQuLjMyNTdlZDNjZDNlIDEwMDY0NAorLS0tIGEvZ2NjL3ByZWZpeC5j
CisrKysgYi9nY2MvcHJlZml4LmMKK0BAIC03Miw3ICs3Miw5IEBAIExpY2Vuc2UgYWxvbmcgd2l0
aCBHQ0M7IHNlZSB0aGUgZmlsZSBDT1BZSU5HMy4gIElmIG5vdCBzZWUKICAjaW5jbHVkZSAicHJl
Zml4LmgiCiAgI2luY2x1ZGUgImNvbW1vbi9jb21tb24tdGFyZ2V0LmgiCiAgCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2djYy05LjMvMDAyNi1TZWFyY2gtdGFyZ2V0LXN5
c3Jvb3QtZ2NjLXZlcnNpb24tc3BlY2lmaWMtZGlycy13aXRoLnBhdGNoIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2djYy9nY2MtMTAuMS8wMDI1LVNlYXJjaC10YXJnZXQtc3lzcm9vdC1nY2MtdmVy
c2lvbi1zcGVjaWZpYy1kaXJzLXdpdGgucGF0Y2gKc2ltaWxhcml0eSBpbmRleCA5MCUKcmVuYW1l
IGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2djYy9nY2MtOS4zLzAwMjYtU2VhcmNoLXRhcmdl
dC1zeXNyb290LWdjYy12ZXJzaW9uLXNwZWNpZmljLWRpcnMtd2l0aC5wYXRjaApyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2djYy9nY2MtMTAuMS8wMDI1LVNlYXJjaC10YXJnZXQtc3lz
cm9vdC1nY2MtdmVyc2lvbi1zcGVjaWZpYy1kaXJzLXdpdGgucGF0Y2gKaW5kZXggYWJmYTc1MTZk
YS4uZDllZDljMTM0YyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2djYy9nY2Mt
OS4zLzAwMjYtU2VhcmNoLXRhcmdldC1zeXNyb290LWdjYy12ZXJzaW9uLXNwZWNpZmljLWRpcnMt
d2l0aC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2djYy0xMC4xLzAwMjUt
U2VhcmNoLXRhcmdldC1zeXNyb290LWdjYy12ZXJzaW9uLXNwZWNpZmljLWRpcnMtd2l0aC5wYXRj
aApAQCAtMSw3ICsxLDcgQEAKLUZyb20gNmMzOWEyMmMzZTg1ZDIwZGVlOWUyZmMyMjc0ZTk1ZGE5
ODBkZTRkMCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZDg0ZWMzYjQ2NjFiNDY4OTll
N2NlYWVkZjA0MzZmNWI5ZjE0NTI4ZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEto
ZW0gUmFqIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzpyYWou
a2hlbUBnbWFpbC5jb20iPiZsdDtyYWoua2hlbUBnbWFpbC5jb20mZ3Q7PC9hPgogRGF0ZTogTW9u
LCA3IERlYyAyMDE1IDIzOjQxOjQ1ICswMDAwCi1TdWJqZWN0OiBbUEFUQ0ggMjYvMzldIFNlYXJj
aCB0YXJnZXQgc3lzcm9vdCBnY2MgdmVyc2lvbiBzcGVjaWZpYyBkaXJzIHdpdGgKK1N1YmplY3Q6
IFtQQVRDSF0gU2VhcmNoIHRhcmdldCBzeXNyb290IGdjYyB2ZXJzaW9uIHNwZWNpZmljIGRpcnMg
d2l0aAogIG11bHRpbGliLgogCiBXZSBpbnN0YWxsIHRoZSBnY2MgbGlicmFyaWVzIChzdWNoIGFz
IGNydGJlZ2luLnApIGludG8KQEAgLTUxLDEwICs1MSwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBLaGVt
IFJhaiA8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86cmFqLmto
ZW1AZ21haWwuY29tIj4mbHQ7cmFqLmtoZW1AZ21haWwuY29tJmd0OzwvYT4KICAxIGZpbGUgY2hh
bmdlZCwgMjggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvZ2Nj
L2djYy5jIGIvZ2NjL2djYy5jCi1pbmRleCA1OWZiNjRmNWZkNS4uM2U3OWRhNDIzOGMgMTAwNjQ0
CitpbmRleCA1MzVkNWMzYmI2NS4uMDQ2NDdhZTgxMmQgMTAwNjQ0CiAtLS0gYS9nY2MvZ2NjLmMK
ICsrKyBiL2djYy9nY2MuYwotQEAgLTI2MTcsNyArMjYxNyw3IEBAIGZvcl9lYWNoX3BhdGggKGNv
bnN0IHN0cnVjdCBwYXRoX3ByZWZpeCAqcGF0aHMsCitAQCAtMjYxNiw3ICsyNjE2LDcgQEAgZm9y
X2VhY2hfcGF0aCAoY29uc3Qgc3RydWN0IHBhdGhfcHJlZml4ICpwYXRocywKICAgICAgICBpZiAo
cGF0aCA9PSBOVUxMKQogIAl7CiAgCSAgbGVuID0gcGF0aHMtJmd0O21heF9sZW4gKyBleHRyYV9z
cGFjZSArIDE7CkBAIC02Myw3ICs2Myw3IEBAIGluZGV4IDU5ZmI2NGY1ZmQ1Li4zZTc5ZGE0MjM4
YyAxMDA2NDQKICAJICBwYXRoID0gWE5FV1ZFQyAoY2hhciwgbGVuKTsKICAJfQogIAotQEAgLTI2
MjksNiArMjYyOSwzMyBAQCBmb3JfZWFjaF9wYXRoIChjb25zdCBzdHJ1Y3QgcGF0aF9wcmVmaXgg
KnBhdGhzLAorQEAgLTI2MjgsNiArMjYyOCwzMyBAQCBmb3JfZWFjaF9wYXRoIChjb25zdCBzdHJ1
Y3QgcGF0aF9wcmVmaXggKnBhdGhzLAogIAkgIC8qIExvb2sgZmlyc3QgaW4gTUFDSElORS9WRVJT
SU9OIHN1YmRpcmVjdG9yeS4gICovCiAgCSAgaWYgKCFza2lwX211bHRpX2RpcikKICAJICAgIHsK
QEAgLTk3LDYgKzk3LDMgQEAgaW5kZXggNTlmYjY0ZjVmZDUuLjNlNzlkYTQyMzhjIDEwMDY0NAog
IAkgICAgICBtZW1jcHkgKHBhdGggKyBsZW4sIG11bHRpX3N1ZmZpeCwgc3VmZml4X2xlbiArIDEp
OwogIAkgICAgICByZXQgPSBjYWxsYmFjayAocGF0aCwgY2FsbGJhY2tfaW5mbyk7CiAgCSAgICAg
IGlmIChyZXQpCi0tLSAKLTIuMjUuMQotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvZ2NjL2djYy05LjMvMDAyNy1GaXgtdmFyaW91cy1fRk9SX0JVSUxELWFuZC1yZWxhdGVkLXZh
cmlhYmxlcy5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2MvZ2NjLTEwLjEvMDAyNi1G
aXgtdmFyaW91cy1fRk9SX0JVSUxELWFuZC1yZWxhdGVkLXZhcmlhYmxlcy5wYXRjaApzaW1pbGFy
aXR5IGluZGV4IDg5JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2djYy05
LjMvMDAyNy1GaXgtdmFyaW91cy1fRk9SX0JVSUxELWFuZC1yZWxhdGVkLXZhcmlhYmxlcy5wYXRj
aApyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2djYy9nY2MtMTAuMS8wMDI2LUZpeC12
YXJpb3VzLV9GT1JfQlVJTEQtYW5kLXJlbGF0ZWQtdmFyaWFibGVzLnBhdGNoCmluZGV4IGFlOGFj
YzdmMTMuLmRlOWI5MTUxZDMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2Mv
Z2NjLTkuMy8wMDI3LUZpeC12YXJpb3VzLV9GT1JfQlVJTEQtYW5kLXJlbGF0ZWQtdmFyaWFibGVz
LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2MvZ2NjLTEwLjEvMDAyNi1GaXgt
dmFyaW91cy1fRk9SX0JVSUxELWFuZC1yZWxhdGVkLXZhcmlhYmxlcy5wYXRjaApAQCAtMSw3ICsx
LDcgQEAKLUZyb20gMDdkYjM0YjE2YjZjOGUzZDk0OGI0MTdmMmZjMDUyNTAwZmZiNzdkMyBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYmNjZjJiMjJjNWNjNzA1ZTM1NDA2MDA4Njg2Yzli
ODVhZGY0MjE3NiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxhIGNs
YXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzpyYWoua2hlbUBnbWFpbC5j
b20iPiZsdDtyYWoua2hlbUBnbWFpbC5jb20mZ3Q7PC9hPgogRGF0ZTogTW9uLCA3IERlYyAyMDE1
IDIzOjQyOjQ1ICswMDAwCi1TdWJqZWN0OiBbUEFUQ0ggMjcvMzldIEZpeCB2YXJpb3VzIF9GT1Jf
QlVJTEQgYW5kIHJlbGF0ZWQgdmFyaWFibGVzCitTdWJqZWN0OiBbUEFUQ0hdIEZpeCB2YXJpb3Vz
IF9GT1JfQlVJTEQgYW5kIHJlbGF0ZWQgdmFyaWFibGVzCiAKIFdoZW4gZG9pbmcgYSBGT1JfQlVJ
TEQgdGhpbmcsIHlvdSBoYXZlIHRvIG92ZXJyaWRlIENGTEFHUyB3aXRoCiBDRkxBR1NfRk9SX0JV
SUxELiBBbmQgaWYgeW91IHVzZSBDKyssIHlvdSBhbHNvIGhhdmUgdG8gb3ZlcnJpZGUKQEAgLTI2
LDcgKzI2LDcgQEAgU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPGEgY2xhc3M9Im1vei10eHQtbGlu
ay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOnJhai5raGVtQGdtYWlsLmNvbSI+Jmx0O3Jhai5raGVt
QGdtYWlsLmNvbSZndDs8L2E+CiAgNSBmaWxlcyBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAz
IGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvTWFrZWZpbGUuaW4gYi9NYWtlZmlsZS5pbgot
aW5kZXggMjU1ODIyZTNmMjcuLjlkYzBkZmYwNDc0IDEwMDY0NAoraW5kZXggYzcxNzkwM2JiMTMu
LjVhYmM2NDk4NjhkIDEwMDY0NAogLS0tIGEvTWFrZWZpbGUuaW4KICsrKyBiL01ha2VmaWxlLmlu
CiBAQCAtMTUyLDYgKzE1Miw3IEBAIEJVSUxEX0VYUE9SVFMgPSBcCkBAIC01NSw3ICs1NSw3IEBA
IGluZGV4IDI1NTgyMmUzZjI3Li45ZGMwZGZmMDQ3NCAxMDA2NDQKICAJQURBX0NGTEFHUz0iJChB
REFfQ0ZMQUdTKSI7IGV4cG9ydCBBREFfQ0ZMQUdTOyBcCiAgCUNGTEFHUz0iJChDRkxBR1MpIjsg
ZXhwb3J0IENGTEFHUzsgXAogIAlDT05GSUdfU0hFTEw9IiQoU0hFTEwpIjsgZXhwb3J0IENPTkZJ
R19TSEVMTDsgXAotQEAgLTc3NSw2ICs3ODAsNyBAQCBCQVNFX0ZMQUdTX1RPX1BBU1MgPSBcCitA
QCAtNzc2LDYgKzc4MSw3IEBAIEJBU0VfRkxBR1NfVE9fUEFTUyA9IFwKICAJIkNDX0ZPUl9CVUlM
RD0kKENDX0ZPUl9CVUlMRCkiIFwKICAJIkNGTEFHU19GT1JfQlVJTEQ9JChDRkxBR1NfRk9SX0JV
SUxEKSIgXAogIAkiQ1hYX0ZPUl9CVUlMRD0kKENYWF9GT1JfQlVJTEQpIiBcCkBAIC02NCw3ICs2
NCw3IEBAIGluZGV4IDI1NTgyMmUzZjI3Li45ZGMwZGZmMDQ3NCAxMDA2NDQKICAJIkZMRVg9JChG
TEVYKSIgXAogIAkiSU5TVEFMTD0kKElOU1RBTEwpIiBcCiBkaWZmIC0tZ2l0IGEvTWFrZWZpbGUu
dHBsIGIvTWFrZWZpbGUudHBsCi1pbmRleCA0MWNhZTU4YTI2Ny4uZDNmNmI3OWFjZGMgMTAwNjQ0
CitpbmRleCBlZmVkMTUxMTc1MC4uNzc4YmViNzA1YjQgMTAwNjQ0CiAtLS0gYS9NYWtlZmlsZS50
cGwKICsrKyBiL01ha2VmaWxlLnRwbAogQEAgLTE1NCw2ICsxNTQsNyBAQCBCVUlMRF9FWFBPUlRT
ID0gXApAQCAtOTQsNyArOTQsNyBAQCBpbmRleCA0MWNhZTU4YTI2Ny4uZDNmNmI3OWFjZGMgMTAw
NjQ0CiAgCUNGTEFHUz0iJChDRkxBR1MpIjsgZXhwb3J0IENGTEFHUzsgXAogIAlDT05GSUdfU0hF
TEw9IiQoU0hFTEwpIjsgZXhwb3J0IENPTkZJR19TSEVMTDsgXAogZGlmZiAtLWdpdCBhL2djYy9N
YWtlZmlsZS5pbiBiL2djYy9NYWtlZmlsZS5pbgotaW5kZXggNzc3MjM0MmFkNWUuLjAyZmVjODgx
YjZkIDEwMDY0NAoraW5kZXggMDExYzdhYzJkYjYuLjJmMTE2NWY3YjVlIDEwMDY0NAogLS0tIGEv
Z2NjL01ha2VmaWxlLmluCiArKysgYi9nY2MvTWFrZWZpbGUuaW4KIEBAIC04MDUsNyArODA1LDcg
QEAgQlVJTERfTERGTEFHUz1AQlVJTERfTERGTEFHU0AKQEAgLTEwNywxMCArMTA3LDEwIEBAIGlu
ZGV4IDc3NzIzNDJhZDVlLi4wMmZlYzg4MWI2ZCAxMDA2NDQKICAjIEFjdHVhbCBuYW1lIHRvIHVz
ZSB3aGVuIGluc3RhbGxpbmcgYSBuYXRpdmUgY29tcGlsZXIuCiAgR0NDX0lOU1RBTExfTkFNRSA6
PSAkKHNoZWxsIGVjaG8gZ2NjfHNlZCAnJChwcm9ncmFtX3RyYW5zZm9ybV9uYW1lKScpCiBkaWZm
IC0tZ2l0IGEvZ2NjL2NvbmZpZ3VyZSBiL2djYy9jb25maWd1cmUKLWluZGV4IGE1ZjIwOGFmN2Nm
Li4wNzg4YjdiZjBiNSAxMDA3NTUKK2luZGV4IDgyNWE5NjUyMzI5Li5mZjQ2Y2Y1ODk2MCAxMDA3
NTUKIC0tLSBhL2djYy9jb25maWd1cmUKICsrKyBiL2djYy9jb25maWd1cmUKLUBAIC0xMTk2Niw3
ICsxMTk2Niw3IEBAIGVsc2UKK0BAIC0xMjMxNCw3ICsxMjMxNCw3IEBAIGVsc2UKICAJQ0M9IiR7
Q0NfRk9SX0JVSUxEfSIgQ0ZMQUdTPSIke0NGTEFHU19GT1JfQlVJTER9IiBcCiAgCUNYWD0iJHtD
WFhfRk9SX0JVSUxEfSIgQ1hYRkxBR1M9IiR7Q1hYRkxBR1NfRk9SX0JVSUxEfSIgXAogIAlMRD0i
JHtMRF9GT1JfQlVJTER9IiBMREZMQUdTPSIke0xERkxBR1NfRk9SX0JVSUxEfSIgXApAQCAtMTE4
LDEyICsxMTgsMTIgQEAgaW5kZXggYTVmMjA4YWY3Y2YuLjA3ODhiN2JmMGI1IDEwMDc1NQogKwlH
TVBJTkM9IiIgQ1BQRkxBR1M9IiR7Q1BQRkxBR1NfRk9SX0JVSUxEfSAtREdFTkVSQVRPUl9GSUxF
IiBcCiAgCSR7cmVhbHNyY2Rpcn0vY29uZmlndXJlIFwKICAJCS0tZW5hYmxlLWxhbmd1YWdlcz0k
e2VuYWJsZV9sYW5ndWFnZXMtYWxsfSBcCi0gCQktLXRhcmdldD0kdGFyZ2V0X2FsaWFzIC0taG9z
dD0kYnVpbGRfYWxpYXMgLS1idWlsZD0kYnVpbGRfYWxpYXMKKyAJCSR7ZW5hYmxlX29ic29sZXRl
Ky0tZW5hYmxlLW9ic29sZXRlPSIkZW5hYmxlX29ic29sZXRlIn0gXAogZGlmZiAtLWdpdCBhL2dj
Yy9jb25maWd1cmUuYWMgYi9nY2MvY29uZmlndXJlLmFjCi1pbmRleCBiN2E3ZWFkMWMwMi4uNWFi
NTBmYWUwZjMgMTAwNjQ0CitpbmRleCA2MDk5ZWIzMjUxZi4uYjNjMzQ1YjYxZGMgMTAwNjQ0CiAt
LS0gYS9nY2MvY29uZmlndXJlLmFjCiArKysgYi9nY2MvY29uZmlndXJlLmFjCi1AQCAtMTc0Myw3
ICsxNzQzLDcgQEAgZWxzZQorQEAgLTE4OTgsNyArMTg5OCw3IEBAIGVsc2UKICAJQ0M9IiR7Q0Nf
Rk9SX0JVSUxEfSIgQ0ZMQUdTPSIke0NGTEFHU19GT1JfQlVJTER9IiBcCiAgCUNYWD0iJHtDWFhf
Rk9SX0JVSUxEfSIgQ1hYRkxBR1M9IiR7Q1hYRkxBR1NfRk9SX0JVSUxEfSIgXAogIAlMRD0iJHtM
RF9GT1JfQlVJTER9IiBMREZMQUdTPSIke0xERkxBR1NfRk9SX0JVSUxEfSIgXApAQCAtMTMxLDcg
KzEzMSw0IEBAIGluZGV4IGI3YTdlYWQxYzAyLi41YWI1MGZhZTBmMyAxMDA2NDQKICsJR01QSU5D
PSIiIENQUEZMQUdTPSIke0NQUEZMQUdTX0ZPUl9CVUlMRH0gLURHRU5FUkFUT1JfRklMRSIgXAog
IAkke3JlYWxzcmNkaXJ9L2NvbmZpZ3VyZSBcCiAgCQktLWVuYWJsZS1sYW5ndWFnZXM9JHtlbmFi
bGVfbGFuZ3VhZ2VzLWFsbH0gXAotIAkJLS10YXJnZXQ9JHRhcmdldF9hbGlhcyAtLWhvc3Q9JGJ1
aWxkX2FsaWFzIC0tYnVpbGQ9JGJ1aWxkX2FsaWFzCi0tLSAKLTIuMjUuMQotCisgCQkke2VuYWJs
ZV9vYnNvbGV0ZSstLWVuYWJsZS1vYnNvbGV0ZT0iJGVuYWJsZV9vYnNvbGV0ZSJ9IFwKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2MvZ2NjLTkuMy8wMDI4LW5pb3MyLURlZmlu
ZS1NVVNMX0RZTkFNSUNfTElOS0VSLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2djYy9n
Y2MtMTAuMS8wMDI3LW5pb3MyLURlZmluZS1NVVNMX0RZTkFNSUNfTElOS0VSLnBhdGNoCnNpbWls
YXJpdHkgaW5kZXggNzklCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2MvZ2Nj
LTkuMy8wMDI4LW5pb3MyLURlZmluZS1NVVNMX0RZTkFNSUNfTElOS0VSLnBhdGNoCnJlbmFtZSB0
byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2djYy0xMC4xLzAwMjctbmlvczItRGVmaW5lLU1V
U0xfRFlOQU1JQ19MSU5LRVIucGF0Y2gKaW5kZXggNTJhNWQ5N2FlZi4uMzYwOTRiMGY0YSAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2djYy9nY2MtOS4zLzAwMjgtbmlvczItRGVm
aW5lLU1VU0xfRFlOQU1JQ19MSU5LRVIucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2djYy9nY2MtMTAuMS8wMDI3LW5pb3MyLURlZmluZS1NVVNMX0RZTkFNSUNfTElOS0VSLnBhdGNo
CkBAIC0xLDcgKzEsNyBAQAotRnJvbSA1OTU0M2U4OTdlYjM1MTk0ZmI0NzI4OGY3NzYyZTQwYTE4
ZmZmNjExIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAwZDA0M2E4YTIzYjZhMzZiZGRl
NjEyNDhiNmJmYmJlNzUxYjBlMWU3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hl
bSBSYWogPGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOnJhai5r
aGVtQGdtYWlsLmNvbSI+Jmx0O3Jhai5raGVtQGdtYWlsLmNvbSZndDs8L2E+CiBEYXRlOiBUdWUs
IDIgRmViIDIwMTYgMTA6MjY6MTAgLTA4MDAKLVN1YmplY3Q6IFtQQVRDSCAyOC8zOV0gbmlvczI6
IERlZmluZSBNVVNMX0RZTkFNSUNfTElOS0VSCitTdWJqZWN0OiBbUEFUQ0hdIG5pb3MyOiBEZWZp
bmUgTVVTTF9EWU5BTUlDX0xJTktFUgogCiBVcHN0cmVhbS1TdGF0dXM6IFBlbmRpbmcKIApAQCAt
MTIsNyArMTIsNyBAQCBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8YSBjbGFzcz0ibW96LXR4dC1s
aW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86cmFqLmtoZW1AZ21haWwuY29tIj4mbHQ7cmFqLmto
ZW1AZ21haWwuY29tJmd0OzwvYT4KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKIAog
ZGlmZiAtLWdpdCBhL2djYy9jb25maWcvbmlvczIvbGludXguaCBiL2djYy9jb25maWcvbmlvczIv
bGludXguaAotaW5kZXggNjk4NzM0YWRkMzUuLmVlZWU2MGVjZmVhIDEwMDY0NAoraW5kZXggNGJk
Y2RjY2ExZjAuLmU3OTQzYTlkNjQwIDEwMDY0NAogLS0tIGEvZ2NjL2NvbmZpZy9uaW9zMi9saW51
eC5oCiArKysgYi9nY2MvY29uZmlnL25pb3MyL2xpbnV4LmgKIEBAIC0zMCw2ICszMCw3IEBACkBA
IC0yMyw2ICsyMywzIEBAIGluZGV4IDY5ODczNGFkZDM1Li5lZWVlNjBlY2ZlYSAxMDA2NDQKICAK
ICAjdW5kZWYgTElOS19TUEVDCiAgI2RlZmluZSBMSU5LX1NQRUMgTElOS19TUEVDX0VORElBTiBc
Ci0tLSAKLTIuMjUuMQotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2dj
Yy05LjMvMDAyOS1BZGQtc3NwX25vbnNoYXJlZC10by1saW5rLWNvbW1hbmRsaW5lLWZvci1tdXNs
LXRhcmdlLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2djYy9nY2MtMTAuMS8wMDI4LUFk
ZC1zc3Bfbm9uc2hhcmVkLXRvLWxpbmstY29tbWFuZGxpbmUtZm9yLW11c2wtdGFyZ2UucGF0Y2gK
c2ltaWxhcml0eSBpbmRleCA4OSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dj
Yy9nY2MtOS4zLzAwMjktQWRkLXNzcF9ub25zaGFyZWQtdG8tbGluay1jb21tYW5kbGluZS1mb3It
bXVzbC10YXJnZS5wYXRjaApyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2djYy9nY2Mt
MTAuMS8wMDI4LUFkZC1zc3Bfbm9uc2hhcmVkLXRvLWxpbmstY29tbWFuZGxpbmUtZm9yLW11c2wt
dGFyZ2UucGF0Y2gKaW5kZXggYmZhN2UxOWRkMC4uZmJmYmFlMjM0NSAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2djYy9nY2MtOS4zLzAwMjktQWRkLXNzcF9ub25zaGFyZWQtdG8t
bGluay1jb21tYW5kbGluZS1mb3ItbXVzbC10YXJnZS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvZ2NjL2djYy0xMC4xLzAwMjgtQWRkLXNzcF9ub25zaGFyZWQtdG8tbGluay1jb21t
YW5kbGluZS1mb3ItbXVzbC10YXJnZS5wYXRjaApAQCAtMSw3ICsxLDcgQEAKLUZyb20gOGRmOTlh
ZjBhNjVlZjc0MGJjZjJiN2RjOWExMDljYzU3ZjE1YzNhYSBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gOWE4YWQ3ZDA5OWEwNzdlMWRjODZiOTJmMzkxOTQ1ZDNkMzg1ZWY4NSBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxhIGNsYXNzPSJtb3otdHh0LWxpbmst
cmZjMjM5NkUiIGhyZWY9Im1haWx0bzpyYWoua2hlbUBnbWFpbC5jb20iPiZsdDtyYWoua2hlbUBn
bWFpbC5jb20mZ3Q7PC9hPgogRGF0ZTogVHVlLCAyNyBKdW4gMjAxNyAxODoxMDo1NCAtMDcwMAot
U3ViamVjdDogW1BBVENIIDI5LzM5XSBBZGQgc3NwX25vbnNoYXJlZCB0byBsaW5rIGNvbW1hbmRs
aW5lIGZvciBtdXNsIHRhcmdldHMKK1N1YmplY3Q6IFtQQVRDSF0gQWRkIHNzcF9ub25zaGFyZWQg
dG8gbGluayBjb21tYW5kbGluZSBmb3IgbXVzbCB0YXJnZXRzCiAKIHdoZW4gLWZzdGFjay1wcm90
ZWN0b3Igb3B0aW9ucyBhcmUgZW5hYmxlZCB3ZSBuZWVkIHRvCiBsaW5rIHdpdGggc3NwX3NoYXJl
ZCBvbiBtdXNsIHNpbmNlIGl0IGRvZXMgbm90IHByb3ZpZGUKQEAgLTIzLDcgKzIzLDcgQEAgU2ln
bmVkLW9mZi1ieTogS2hlbSBSYWogPGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJl
Zj0ibWFpbHRvOnJhai5raGVtQGdtYWlsLmNvbSI+Jmx0O3Jhai5raGVtQGdtYWlsLmNvbSZndDs8
L2E+CiAgMyBmaWxlcyBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspCiAKIGRpZmYgLS1naXQgYS9n
Y2MvY29uZmlnL2xpbnV4LmggYi9nY2MvY29uZmlnL2xpbnV4LmgKLWluZGV4IDRiMDVkOGU5M2Qx
Li4wY2ExMTdlMmVkNCAxMDA2NDQKK2luZGV4IDBjMWE4MTE4YTI2Li5iZGMyYTJkMDY1OSAxMDA2
NDQKIC0tLSBhL2djYy9jb25maWcvbGludXguaAogKysrIGIvZ2NjL2NvbmZpZy9saW51eC5oCiBA
QCAtMTk1LDYgKzE5NSwxMyBAQCBzZWUgdGhlIGZpbGVzIENPUFlJTkczIGFuZCBDT1BZSU5HLlJV
TlRJTUUgcmVzcGVjdGl2ZWx5LiAgSWYgbm90LCBzZWUKQEAgLTQxLDcgKzQxLDcgQEAgaW5kZXgg
NGIwNWQ4ZTkzZDEuLjBjYTExN2UyZWQ0IDEwMDY0NAogIAogICNpZiAoREVGQVVMVF9MSUJDID09
IExJQkNfVUNMSUJDKSAmYW1wOyZhbXA7IGRlZmluZWQgKFNJTkdMRV9MSUJDKSAvKiB1Q2xpbnV4
ICovCiBkaWZmIC0tZ2l0IGEvZ2NjL2NvbmZpZy9yczYwMDAvbGludXguaCBiL2djYy9jb25maWcv
cnM2MDAwL2xpbnV4LmgKLWluZGV4IGZmY2ViMzJiZjY1Li5jODJjYjJhZDA1YiAxMDA2NDQKK2lu
ZGV4IGI3MDI2ZmNiZWU3Li5kZDU0ZDZjMzkzZSAxMDA2NDQKIC0tLSBhL2djYy9jb25maWcvcnM2
MDAwL2xpbnV4LmgKICsrKyBiL2djYy9jb25maWcvcnM2MDAwL2xpbnV4LmgKIEBAIC05NCw2ICs5
NCwxNiBAQApAQCAtNjIsMTAgKzYyLDEwIEBAIGluZGV4IGZmY2ViMzJiZjY1Li5jODJjYjJhZDA1
YiAxMDA2NDQKICAjZGVmaW5lIExJTktfT1NfTElOVVhfU1BFQyBMSU5LX09TX0xJTlVYX0VNVUwg
IiAleyFzaGFyZWQ6ICV7IXN0YXRpYzogXAogICAgJXshc3RhdGljLXBpZTogXAogZGlmZiAtLWdp
dCBhL2djYy9jb25maWcvcnM2MDAwL2xpbnV4NjQuaCBiL2djYy9jb25maWcvcnM2MDAwL2xpbnV4
NjQuaAotaW5kZXggNDVhOWE3Y2FlNTkuLmQxZTg4YTQwZTgyIDEwMDY0NAoraW5kZXggOTY3YzFj
NDNjNjMuLmRjNWU0ZDk3OTc1IDEwMDY0NAogLS0tIGEvZ2NjL2NvbmZpZy9yczYwMDAvbGludXg2
NC5oCiArKysgYi9nY2MvY29uZmlnL3JzNjAwMC9saW51eDY0LmgKLUBAIC00NTYsNiArNDU2LDE2
IEBAIGV4dGVybiBpbnQgZG90X3N5bWJvbHM7CitAQCAtNDUyLDYgKzQ1MiwxNiBAQCBleHRlcm4g
aW50IGRvdF9zeW1ib2xzOwogIAkJCQkJICAgIiAtbSBlbGY2NHBwYyIpCiAgI2VuZGlmCiAgCkBA
IC04Miw2ICs4MiwzIEBAIGluZGV4IDQ1YTlhN2NhZTU5Li5kMWU4OGE0MGU4MiAxMDA2NDQKICAj
ZGVmaW5lIExJTktfT1NfTElOVVhfU1BFQzMyIExJTktfT1NfTElOVVhfRU1VTDMyICIgJXshc2hh
cmVkOiAleyFzdGF0aWM6IFwKICAgICV7IXN0YXRpYy1waWU6IFwKICAgICAgJXtyZHluYW1pYzot
ZXhwb3J0LWR5bmFtaWN9IFwKLS0tIAotMi4yNS4xCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9nY2MvZ2NjLTkuMy8wMDMxLUxpbmstbGliZ2NjLXVzaW5nLUxERkxBR1Mtbm90
LWp1c3QtU0hMSUJfTERGTEFHUy5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2MvZ2Nj
LTEwLjEvMDAyOS1MaW5rLWxpYmdjYy11c2luZy1MREZMQUdTLW5vdC1qdXN0LVNITElCX0xERkxB
R1MucGF0Y2gKc2ltaWxhcml0eSBpbmRleCA4MCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2djYy9nY2MtOS4zLzAwMzEtTGluay1saWJnY2MtdXNpbmctTERGTEFHUy1ub3QtanVz
dC1TSExJQl9MREZMQUdTLnBhdGNoCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2Nj
L2djYy0xMC4xLzAwMjktTGluay1saWJnY2MtdXNpbmctTERGTEFHUy1ub3QtanVzdC1TSExJQl9M
REZMQUdTLnBhdGNoCmluZGV4IDYwYTI5ZmM5NGQuLjkyNjJhNDBjY2MgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9nY2MvZ2NjLTkuMy8wMDMxLUxpbmstbGliZ2NjLXVzaW5nLUxE
RkxBR1Mtbm90LWp1c3QtU0hMSUJfTERGTEFHUy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvZ2NjL2djYy0xMC4xLzAwMjktTGluay1saWJnY2MtdXNpbmctTERGTEFHUy1ub3QtanVz
dC1TSExJQl9MREZMQUdTLnBhdGNoCkBAIC0xLDcgKzEsNyBAQAotRnJvbSAzMWQwMDhmNTU3MzYy
N2M2MTkyY2U5ZmNmNzI5ZjBiZTQ2NGE3Y2Y1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bSAwZjIwYzI5YTIyNWU1YzVlZWZmOWFjNjQ2MjY5ZWU2YjhmMmE0YzNkIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2
RSIgaHJlZj0ibWFpbHRvOnJhai5raGVtQGdtYWlsLmNvbSI+Jmx0O3Jhai5raGVtQGdtYWlsLmNv
bSZndDs8L2E+CiBEYXRlOiBXZWQsIDQgTWF5IDIwMTYgMjE6MTE6MzQgLTA3MDAKLVN1YmplY3Q6
IFtQQVRDSCAzMS8zOV0gTGluayBsaWJnY2MgdXNpbmcgTERGTEFHUywgbm90IGp1c3QgU0hMSUJf
TERGTEFHUworU3ViamVjdDogW1BBVENIXSBMaW5rIGxpYmdjYyB1c2luZyBMREZMQUdTLCBub3Qg
anVzdCBTSExJQl9MREZMQUdTCiAKIFVwc3RyZWFtLVN0YXR1czogUGVuZGluZwogCkBAIC0xMiw3
ICsxMiw3IEBAIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxhIGNsYXNzPSJtb3otdHh0LWxpbmst
cmZjMjM5NkUiIGhyZWY9Im1haWx0bzpyYWoua2hlbUBnbWFpbC5jb20iPiZsdDtyYWoua2hlbUBn
bWFpbC5jb20mZ3Q7PC9hPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvbGliZ2NjL2NvbmZpZy90LXNsaWJnY2MgYi9saWJnY2Mv
Y29uZmlnL3Qtc2xpYmdjYwotaW5kZXggMDk5YmYyM2U2MmYuLjQzNmIyNzdhNzlmIDEwMDY0NAor
aW5kZXggYzk5NzU1MzQ0N2MuLjMzMDM1MmMyYzgxIDEwMDY0NAogLS0tIGEvbGliZ2NjL2NvbmZp
Zy90LXNsaWJnY2MKICsrKyBiL2xpYmdjYy9jb25maWcvdC1zbGliZ2NjCiBAQCAtMzIsNyArMzIs
NyBAQCBTSExJQl9JTlNUQUxMX1NPTElOSyA9ICQoTE5fUykgJChTSExJQl9TT05BTUUpIFwKQEAg
LTI0LDYgKzI0LDMgQEAgaW5kZXggMDk5YmYyM2U2MmYuLjQzNmIyNzdhNzlmIDEwMDY0NAogIAkt
byAkKFNITElCX0RJUikvJChTSExJQl9TT05BTUUpLnRtcCBAbXVsdGlsaWJfZmxhZ3NAIFwKICAJ
JChTSExJQl9PQkpTKSAkKFNITElCX0xDKSAmYW1wOyZhbXA7IFwKICAJcm0gLWYgJChTSExJQl9E
SVIpLyQoU0hMSUJfU09MSU5LKSAmYW1wOyZhbXA7IFwKLS0tIAotMi4yNS4xCi0KZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2MvZ2NjLTkuMy8wMDMzLXN5bmMtZ2NjLXN0ZGRl
Zi5oLXdpdGgtbXVzbC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2MvZ2NjLTEwLjEv
MDAzMC1zeW5jLWdjYy1zdGRkZWYuaC13aXRoLW11c2wucGF0Y2gKc2ltaWxhcml0eSBpbmRleCA5
MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2djYy9nY2MtOS4zLzAwMzMtc3lu
Yy1nY2Mtc3RkZGVmLmgtd2l0aC1tdXNsLnBhdGNoCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvZ2NjL2djYy0xMC4xLzAwMzAtc3luYy1nY2Mtc3RkZGVmLmgtd2l0aC1tdXNsLnBhdGNo
CmluZGV4IGYwODBiMDU5NmYuLjdkMmEzNTljMzAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9nY2MvZ2NjLTkuMy8wMDMzLXN5bmMtZ2NjLXN0ZGRlZi5oLXdpdGgtbXVzbC5wYXRj
aAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2djYy0xMC4xLzAwMzAtc3luYy1nY2Mt
c3RkZGVmLmgtd2l0aC1tdXNsLnBhdGNoCkBAIC0xLDcgKzEsNyBAQAotRnJvbSAxMjZlMzQyZmIz
OWQ3YWY3MGMxZTVhNmRmOGZmYWZjOGRmYzNiZjA4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQor
RnJvbSA4YmU2OThmZjE1NTJhODcyNDE1Y2ZlNGU4OWNhZWEyNGZjNzAxMjFmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMy
Mzk2RSIgaHJlZj0ibWFpbHRvOnJhai5raGVtQGdtYWlsLmNvbSI+Jmx0O3Jhai5raGVtQGdtYWls
LmNvbSZndDs8L2E+CiBEYXRlOiBGcmksIDMgRmViIDIwMTcgMTI6NTY6MDAgLTA4MDAKLVN1Ympl
Y3Q6IFtQQVRDSCAzMy8zOV0gc3luYyBnY2Mgc3RkZGVmLmggd2l0aCBtdXNsCitTdWJqZWN0OiBb
UEFUQ0hdIHN5bmMgZ2NjIHN0ZGRlZi5oIHdpdGggbXVzbAogCiBtdXNsIGRlZmluZXMgcHRyZGlm
Zl90IHNpemVfdCBhbmQgd2NoYXJfdAogc28gZG9udCBkZWZpbmUgdGhlbSBoZXJlIGlmIG11c2wg
aXMgZGVmaW5pbmluZyB0aGVtCkBAIC0xNCw3ICsxNCw3IEBAIFNpZ25lZC1vZmYtYnk6IEtoZW0g
UmFqIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzpyYWoua2hl
bUBnbWFpbC5jb20iPiZsdDtyYWoua2hlbUBnbWFpbC5jb20mZ3Q7PC9hPgogIDEgZmlsZSBjaGFu
Z2VkLCA5IGluc2VydGlvbnMoKykKIAogZGlmZiAtLWdpdCBhL2djYy9naW5jbHVkZS9zdGRkZWYu
aCBiL2djYy9naW5jbHVkZS9zdGRkZWYuaAotaW5kZXggZGE2OTJlMWMwMWEuLjlhMDBjMjYxYWRi
IDEwMDY0NAoraW5kZXggOWQ2N2VhYzQ5NDcuLjZjYjVlZGJlZGI0IDEwMDY0NAogLS0tIGEvZ2Nj
L2dpbmNsdWRlL3N0ZGRlZi5oCiArKysgYi9nY2MvZ2luY2x1ZGUvc3RkZGVmLmgKIEBAIC0xMjgs
NiArMTI4LDcgQEAgX1RZUEVfd2NoYXJfdDsKQEAgLTg2LDYgKzg2LDMgQEAgaW5kZXggZGE2OTJl
MWMwMWEuLjlhMDBjMjYxYWRiIDEwMDY0NAogICN1bmRlZglfX25lZWRfd2NoYXJfdAogICNlbmRp
ZiAvKiBfU1REREVGX0ggb3IgX19uZWVkX3djaGFyX3QuICAqLwogIAotLS0gCi0yLjI1LjEKLQpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2djYy9nY2MtOS4zLzAwMzQtZml4LXNl
Z21lbnRhdGlvbi1mYXVsdC1pbi1wcmVjb21waWxlZC1oZWFkZXItZ2VuZXJhdC5wYXRjaCBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9nY2MvZ2NjLTEwLjEvMDAzMS1maXgtc2VnbWVudGF0aW9uLWZh
dWx0LWluLXByZWNvbXBpbGVkLWhlYWRlci1nZW5lcmF0LnBhdGNoCnNpbWlsYXJpdHkgaW5kZXgg
ODYlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2MvZ2NjLTkuMy8wMDM0LWZp
eC1zZWdtZW50YXRpb24tZmF1bHQtaW4tcHJlY29tcGlsZWQtaGVhZGVyLWdlbmVyYXQucGF0Y2gK
cmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2MvZ2NjLTEwLjEvMDAzMS1maXgtc2Vn
bWVudGF0aW9uLWZhdWx0LWluLXByZWNvbXBpbGVkLWhlYWRlci1nZW5lcmF0LnBhdGNoCmluZGV4
IDNiN2NjYjNlM2QuLjQ4N2JiNTUzYjIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9nY2MvZ2NjLTkuMy8wMDM0LWZpeC1zZWdtZW50YXRpb24tZmF1bHQtaW4tcHJlY29tcGlsZWQt
aGVhZGVyLWdlbmVyYXQucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2djYy9nY2Mt
MTAuMS8wMDMxLWZpeC1zZWdtZW50YXRpb24tZmF1bHQtaW4tcHJlY29tcGlsZWQtaGVhZGVyLWdl
bmVyYXQucGF0Y2gKQEAgLTEsNyArMSw3IEBACi1Gcm9tIGQyNmZhOWVkZWRjY2M3ZTFlYzQ3ZWFk
N2YxOGFmYzgwOTcxNDgzYTMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDNjNmI2YzVm
ZDc2OGY3ZTI0MjIyNzlhYjE2NGM2MWZiZjc4YzE2MWEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CiBGcm9tOiBKdXJvIEJ5c3RyaWNreSA8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBo
cmVmPSJtYWlsdG86anVyby5ieXN0cmlja3lAaW50ZWwuY29tIj4mbHQ7anVyby5ieXN0cmlja3lA
aW50ZWwuY29tJmd0OzwvYT4KIERhdGU6IE1vbiwgMTkgTWFyIDIwMTggMjI6MzE6MjAgLTA3MDAK
LVN1YmplY3Q6IFtQQVRDSCAzNC8zOV0gZml4IHNlZ21lbnRhdGlvbiBmYXVsdCBpbiBwcmVjb21w
aWxlZCBoZWFkZXIgZ2VuZXJhdGlvbgorU3ViamVjdDogW1BBVENIXSBmaXggc2VnbWVudGF0aW9u
IGZhdWx0IGluIHByZWNvbXBpbGVkIGhlYWRlciBnZW5lcmF0aW9uCiAKIFByZXZlbnQgYSBzZWdt
ZW50YXRpb24gZmF1bHQgd2hpY2ggb2NjdXJzIHdoZW4gdXNpbmcgaW5jb3JyZWN0CiBzdHJ1Y3R1
cmUgdHJ5aW5nIHRvIGFjY2VzcyBuYW1lIG9mIHNvbWUgbmFtZWQgb3BlcmF0b3JzLCBzdWNoIGFz
CkBAIC0xOSwxMCArMTksMTAgQEAgU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPGEgY2xhc3M9Im1v
ei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOnJhai5raGVtQGdtYWlsLmNvbSI+Jmx0
O3Jhai5raGVtQGdtYWlsLmNvbSZndDs8L2E+CiAgMSBmaWxlIGNoYW5nZWQsIDIxIGluc2VydGlv
bnMoKyksIDUgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9saWJjcHAvbGV4LmMgYi9saWJj
cHAvbGV4LmMKLWluZGV4IGVlZGZjYmIzMTQ2Li4xNTA0MGExYjFmMCAxMDA2NDQKK2luZGV4IDU2
YWMzYTFkZDczLi43M2E5NTExNDhiMyAxMDA2NDQKIC0tLSBhL2xpYmNwcC9sZXguYwogKysrIGIv
bGliY3BwL2xleC5jCi1AQCAtMzI4MCwxMSArMzI4MCwyNyBAQCBjcHBfc3BlbGxfdG9rZW4gKGNw
cF9yZWFkZXIgKnBmaWxlLCBjb25zdCBjcHBfdG9rZW4gKnRva2VuLAorQEAgLTMzMTEsMTEgKzMz
MTEsMjcgQEAgY3BwX3NwZWxsX3Rva2VuIChjcHBfcmVhZGVyICpwZmlsZSwgY29uc3QgY3BwX3Rv
a2VuICp0b2tlbiwKICAgICAgc3BlbGxfaWRlbnQ6CiAgICAgIGNhc2UgU1BFTExfSURFTlQ6CiAg
ICAgICAgaWYgKGZvcnN0cmluZykKQEAgLTU1LDYgKzU1LDMgQEAgaW5kZXggZWVkZmNiYjMxNDYu
LjE1MDQwYTFiMWYwIDEwMDY0NAogICAgICAgIGVsc2UKICAJYnVmZmVyID0gX2NwcF9zcGVsbF9p
ZGVudF91Y25zIChidWZmZXIsIHRva2VuLSZndDt2YWwubm9kZS5ub2RlKTsKICAgICAgICBicmVh
azsKLS0tIAotMi4yNS4xCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2Mv
Z2NjLTkuMy8wMDM1LUZpeC1mb3ItdGVzdHN1aXRlLWZhaWx1cmUucGF0Y2ggYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvZ2NjL2djYy0xMC4xLzAwMzItRml4LWZvci10ZXN0c3VpdGUtZmFpbHVyZS5w
YXRjaApzaW1pbGFyaXR5IGluZGV4IDk4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvZ2NjL2djYy05LjMvMDAzNS1GaXgtZm9yLXRlc3RzdWl0ZS1mYWlsdXJlLnBhdGNoCnJlbmFt
ZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2djYy0xMC4xLzAwMzItRml4LWZvci10ZXN0
c3VpdGUtZmFpbHVyZS5wYXRjaAppbmRleCA1ZTE5OWZiY2ZkLi5kYTRhNTRjOTI5IDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2djYy05LjMvMDAzNS1GaXgtZm9yLXRlc3Rz
dWl0ZS1mYWlsdXJlLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2MvZ2NjLTEw
LjEvMDAzMi1GaXgtZm9yLXRlc3RzdWl0ZS1mYWlsdXJlLnBhdGNoCkBAIC0xLDcgKzEsNyBAQAot
RnJvbSBmYjViZGY4Zjg1MjcyMjhkNTg3ZThhZjlmYzcwMGU1MTY0YjNjMThjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQorRnJvbSA3ZmZhMTcwYzk1N2ExOTA4MTYzOGQ1ZDJjMDEyMTFhYjBjNzk2
ZmZlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUkFHSFVOQVRIIExPTFVSIDxhIGNs
YXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzpyYWdodW5hdGgubG9sdXJA
a3BpdC5jb20iPiZsdDtyYWdodW5hdGgubG9sdXJAa3BpdC5jb20mZ3Q7PC9hPgogRGF0ZTogV2Vk
LCA2IERlYyAyMDE3IDIyOjUyOjI2IC0wODAwCi1TdWJqZWN0OiBbUEFUQ0ggMzUvMzldIEZpeCBm
b3IgdGVzdHN1aXRlIGZhaWx1cmUKK1N1YmplY3Q6IFtQQVRDSF0gRml4IGZvciB0ZXN0c3VpdGUg
ZmFpbHVyZQogCiAyMDE3LTExLTE2ICBSYWdodW5hdGggTG9sdXIgIDxhIGNsYXNzPSJtb3otdHh0
LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzpyYWdodW5hdGgubG9sdXJAa3BpdC5jb20iPiZs
dDtyYWdodW5hdGgubG9sdXJAa3BpdC5jb20mZ3Q7PC9hPgogCkBAIC0yMjAsNyArMjIwLDcgQEAg
aW5kZXggOTYwMDZiM2UzMzguLjQyODdlNDUzOGJmIDEwMDY0NAogIC8qIFRoaXMgdGVzdCB1c2Vz
IF9fYnVpbHRpbl90cmFwICgpIGluc3RlYWQgb2YgZS5nLiBhYm9ydCwKICAgICBiZWNhdXNlIGR1
ZSB0byAtbXByZWZlcnJlZC1zdGFjay1ib3VuZGFyeT0zIGl0IHNob3VsZCBub3QgY2FsbAogZGlm
ZiAtLWdpdCBhL2djYy90ZXN0c3VpdGUvZ2NjLnRhcmdldC9pMzg2L3ByNjIxMjAuYyBiL2djYy90
ZXN0c3VpdGUvZ2NjLnRhcmdldC9pMzg2L3ByNjIxMjAuYwotaW5kZXggYmZiOGM0NzAzZWIuLmVk
MDRjZjE4MWYzIDEwMDY0NAoraW5kZXggMjhkODVkMzc3MTIuLmM5MzI2NmJkNGJjIDEwMDY0NAog
LS0tIGEvZ2NjL3Rlc3RzdWl0ZS9nY2MudGFyZ2V0L2kzODYvcHI2MjEyMC5jCiArKysgYi9nY2Mv
dGVzdHN1aXRlL2djYy50YXJnZXQvaTM4Ni9wcjYyMTIwLmMKIEBAIC0xLDUgKzEsNSBAQApAQCAt
MjUzLDYgKzI1MywzIEBAIGluZGV4IDZjZGExNTM0MzExLi4yNmUzN2Y1YjhiYSAxMDA2NDQKICAj
ZGVmaW5lIHZlY3RvcihlbGNvdW50LCB0eXBlKSAgXAogIF9fYXR0cmlidXRlX18oKHZlY3Rvcl9z
aXplKChlbGNvdW50KSpzaXplb2YodHlwZSkpKSkgdHlwZQogIAotLS0gCi0yLjI1LjEKLQpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2djYy9nY2MtOS4zLzAwMzYtUmUtaW50cm9k
dWNlLXNwZS1jb21tYW5kbGluZS1vcHRpb25zLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2djYy9nY2MtMTAuMS8wMDMzLVJlLWludHJvZHVjZS1zcGUtY29tbWFuZGxpbmUtb3B0aW9ucy5w
YXRjaApzaW1pbGFyaXR5IGluZGV4IDgxJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvZ2NjL2djYy05LjMvMDAzNi1SZS1pbnRyb2R1Y2Utc3BlLWNvbW1hbmRsaW5lLW9wdGlvbnMu
cGF0Y2gKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2MvZ2NjLTEwLjEvMDAzMy1S
ZS1pbnRyb2R1Y2Utc3BlLWNvbW1hbmRsaW5lLW9wdGlvbnMucGF0Y2gKaW5kZXggODI1ZTA3MGFh
My4uZmY0NDEwY2IzYyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2djYy9nY2Mt
OS4zLzAwMzYtUmUtaW50cm9kdWNlLXNwZS1jb21tYW5kbGluZS1vcHRpb25zLnBhdGNoCisrKyBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2MvZ2NjLTEwLjEvMDAzMy1SZS1pbnRyb2R1Y2Utc3Bl
LWNvbW1hbmRsaW5lLW9wdGlvbnMucGF0Y2gKQEAgLTEsNyArMSw3IEBACi1Gcm9tIGRjMjNjYWJh
YzZhN2IyY2E4NWIwMmQyYTU4YTg5MTZjOThmMzgyZTAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CitGcm9tIDE3NzQxNDVjMzc4YmYxZjFlNDAyYmM5ODRjOGYyOGJjOTE0MWM1NTIgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCiBGcm9tOiBLaGVtIFJhaiA8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJm
YzIzOTZFIiBocmVmPSJtYWlsdG86cmFqLmtoZW1AZ21haWwuY29tIj4mbHQ7cmFqLmtoZW1AZ21h
aWwuY29tJmd0OzwvYT4KIERhdGU6IFdlZCwgNiBKdW4gMjAxOCAxMjoxMDoyMiAtMDcwMAotU3Vi
amVjdDogW1BBVENIIDM2LzM5XSBSZS1pbnRyb2R1Y2Ugc3BlIGNvbW1hbmRsaW5lIG9wdGlvbnMK
K1N1YmplY3Q6IFtQQVRDSF0gUmUtaW50cm9kdWNlIHNwZSBjb21tYW5kbGluZSBvcHRpb25zCiAK
IFRoaXMgc2hvdWxkIGVuc3VyZSB0aGF0IHdlIGtlZXAgYWNjZXB0aW5nCiBzcGUgb3B0aW9ucwpA
QCAtMTQsMTAgKzE0LDEwIEBAIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxhIGNsYXNzPSJtb3ot
dHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzpyYWoua2hlbUBnbWFpbC5jb20iPiZsdDty
YWoua2hlbUBnbWFpbC5jb20mZ3Q7PC9hPgogIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25z
KCspCiAKIGRpZmYgLS1naXQgYS9nY2MvY29uZmlnL3JzNjAwMC9yczYwMDAub3B0IGIvZ2NjL2Nv
bmZpZy9yczYwMDAvcnM2MDAwLm9wdAotaW5kZXggZjRiNWM5MWUxMWYuLjY5ODY5MzUwZmNlIDEw
MDY0NAoraW5kZXggZjk1YjgyNzkyNzAuLjBlNTJkNTE0MDlkIDEwMDY0NAogLS0tIGEvZ2NjL2Nv
bmZpZy9yczYwMDAvcnM2MDAwLm9wdAogKysrIGIvZ2NjL2NvbmZpZy9yczYwMDAvcnM2MDAwLm9w
dAotQEAgLTM0NSw2ICszNDUsMTggQEAgbWRlYnVnPQorQEAgLTM0NCw2ICszNDQsMTggQEAgbWRl
YnVnPQogIFRhcmdldCBSZWplY3ROZWdhdGl2ZSBKb2luZWQKICAtbWRlYnVnPQlFbmFibGUgZGVi
dWcgb3V0cHV0LgogIApAQCAtMzYsNiArMzYsMyBAQCBpbmRleCBmNGI1YzkxZTExZi4uNjk4Njkz
NTBmY2UgMTAwNjQ0CiAgbWFiaT1hbHRpdmVjCiAgVGFyZ2V0IFJlamVjdE5lZ2F0aXZlIFZhcihy
czYwMDBfYWx0aXZlY19hYmkpIFNhdmUKICBVc2UgdGhlIEFsdGlWZWMgQUJJIGV4dGVuc2lvbnMu
Ci0tLSAKLTIuMjUuMQotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2dj
Yy05LjMvMDAzMi1saWJnY2Nfcy1Vc2UtYWxpYXMtZm9yLV9fY3B1X2luZGljYXRvcl9pbml0LWlu
c3RlYWQtLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2djYy9nY2MtMTAuMS8wMDM0LWxp
YmdjY19zLVVzZS1hbGlhcy1mb3ItX19jcHVfaW5kaWNhdG9yX2luaXQtaW5zdGVhZC0ucGF0Y2gK
c2ltaWxhcml0eSBpbmRleCA3NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dj
Yy9nY2MtOS4zLzAwMzItbGliZ2NjX3MtVXNlLWFsaWFzLWZvci1fX2NwdV9pbmRpY2F0b3JfaW5p
dC1pbnN0ZWFkLS5wYXRjaApyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2djYy9nY2Mt
MTAuMS8wMDM0LWxpYmdjY19zLVVzZS1hbGlhcy1mb3ItX19jcHVfaW5kaWNhdG9yX2luaXQtaW5z
dGVhZC0ucGF0Y2gKaW5kZXggNmYwNDhkYWI4Mi4uYmE3NWNlMzU2MCAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2djYy9nY2MtOS4zLzAwMzItbGliZ2NjX3MtVXNlLWFsaWFzLWZv
ci1fX2NwdV9pbmRpY2F0b3JfaW5pdC1pbnN0ZWFkLS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvZ2NjL2djYy0xMC4xLzAwMzQtbGliZ2NjX3MtVXNlLWFsaWFzLWZvci1fX2NwdV9p
bmRpY2F0b3JfaW5pdC1pbnN0ZWFkLS5wYXRjaApAQCAtMSw3ICsxLDcgQEAKLUZyb20gNzYxZmE2
ZTNlMzc2MDhjZmQxYjI4OGU3MjFhMmZmODkyODhjZDZhYSBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gZmIxMDI1MTk1NjkzZGEwYmJiODU1OTYzMmJhMjJmNDU4YWJlY2RmYiBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFN6YWJvbGNzIE5hZ3kgPGEgY2xhc3M9Im1vei10eHQt
bGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOm5zekBwb3J0NzAubmV0Ij4mbHQ7bnN6QHBvcnQ3
MC5uZXQmZ3Q7PC9hPgogRGF0ZTogU2F0LCAyNCBPY3QgMjAxNSAyMDowOTo1MyArMDAwMAotU3Vi
amVjdDogW1BBVENIIDMyLzM5XSBsaWJnY2NfczogVXNlIGFsaWFzIGZvciBfX2NwdV9pbmRpY2F0
b3JfaW5pdCBpbnN0ZWFkIG9mCitTdWJqZWN0OiBbUEFUQ0hdIGxpYmdjY19zOiBVc2UgYWxpYXMg
Zm9yIF9fY3B1X2luZGljYXRvcl9pbml0IGluc3RlYWQgb2YKICBzeW12ZXIKIAogQWRhcHRlciBm
cm9tCkBAIC0yNiwyMyArMjYsMjMgQEAgZ2NjL0NoYW5nZWxvZzoKIAogMjAxNS0wNS0xMSAgU3ph
Ym9sY3MgTmFneSAgPGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRv
OnN6YWJvbGNzLm5hZ3lAYXJtLmNvbSI+Jmx0O3N6YWJvbGNzLm5hZ3lAYXJtLmNvbSZndDs8L2E+
CiAKLQkqIGNvbmZpZy9pMzg2L2kzODYuYyAoaXg4Nl9leHBhbmRfYnVpbHRpbik6IE1ha2UgX19i
dWlsdGluX2NwdV9pbml0CisJKiBjb25maWcvaTM4Ni9pMzg2LWV4cGFuZC5jIChpeDg2X2V4cGFu
ZF9idWlsdGluKTogTWFrZSBfX2J1aWx0aW5fY3B1X2luaXQKIAljYWxsIF9fY3B1X2luZGljYXRv
cl9pbml0X2xvY2FsIGluc3RlYWQgb2YgX19jcHVfaW5kaWNhdG9yX2luaXQuCiAKIFVwc3RyZWFt
LVN0YXR1czogUGVuZGluZwogCiBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8YSBjbGFzcz0ibW96
LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86cmFqLmtoZW1AZ21haWwuY29tIj4mbHQ7
cmFqLmtoZW1AZ21haWwuY29tJmd0OzwvYT4KIC0tLQotIGdjYy9jb25maWcvaTM4Ni9pMzg2LmMg
ICAgICAgfCA0ICsrLS0KLSBsaWJnY2MvY29uZmlnL2kzODYvY3B1aW5mby5jIHwgNiArKystLS0K
LSBsaWJnY2MvY29uZmlnL2kzODYvdC1saW51eCAgIHwgMiArLQorIGdjYy9jb25maWcvaTM4Ni9p
Mzg2LWV4cGFuZC5jIHwgNCArKy0tCisgbGliZ2NjL2NvbmZpZy9pMzg2L2NwdWluZm8uYyAgfCA2
ICsrKy0tLQorIGxpYmdjYy9jb25maWcvaTM4Ni90LWxpbnV4ICAgIHwgMiArLQogIDMgZmlsZXMg
Y2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQogCi1kaWZmIC0tZ2l0IGEv
Z2NjL2NvbmZpZy9pMzg2L2kzODYuYyBiL2djYy9jb25maWcvaTM4Ni9pMzg2LmMKLWluZGV4IDFi
Y2E1YTdlZWE2Li4wOTZjNGJjOGUyNSAxMDA2NDQKLS0tLSBhL2djYy9jb25maWcvaTM4Ni9pMzg2
LmMKLSsrKyBiL2djYy9jb25maWcvaTM4Ni9pMzg2LmMKLUBAIC0zNjY4NSwxMCArMzY2ODUsMTAg
QEAgaXg4Nl9leHBhbmRfYnVpbHRpbiAodHJlZSBleHAsIHJ0eCB0YXJnZXQsIHJ0eCBzdWJ0YXJn
ZXQsCitkaWZmIC0tZ2l0IGEvZ2NjL2NvbmZpZy9pMzg2L2kzODYtZXhwYW5kLmMgYi9nY2MvY29u
ZmlnL2kzODYvaTM4Ni1leHBhbmQuYworaW5kZXggNDhmMDBjNWZjZmMuLjQ2OGY1ZjcxZmFjIDEw
MDY0NAorLS0tIGEvZ2NjL2NvbmZpZy9pMzg2L2kzODYtZXhwYW5kLmMKKysrKyBiL2djYy9jb25m
aWcvaTM4Ni9pMzg2LWV4cGFuZC5jCitAQCAtMTA5NDEsMTAgKzEwOTQxLDEwIEBAIGl4ODZfZXhw
YW5kX2J1aWx0aW4gKHRyZWUgZXhwLCBydHggdGFyZ2V0LCBydHggc3VidGFyZ2V0LAogICAgICB7
CiAgICAgIGNhc2UgSVg4Nl9CVUlMVElOX0NQVV9JTklUOgogICAgICAgIHsKQEAgLTU2LDEwICs1
NiwxMCBAQCBpbmRleCAxYmNhNWE3ZWVhNi4uMDk2YzRiYzhlMjUgMTAwNjQ0CiAgCXJldHVybiBl
eHBhbmRfZXhwciAoY2FsbF9leHByLCB0YXJnZXQsIG1vZGUsIEVYUEFORF9OT1JNQUwpOwogICAg
ICAgIH0KIGRpZmYgLS1naXQgYS9saWJnY2MvY29uZmlnL2kzODYvY3B1aW5mby5jIGIvbGliZ2Nj
L2NvbmZpZy9pMzg2L2NwdWluZm8uYwotaW5kZXggZDZjYjJkZTYyNjUuLmNlMDRlZjc4MjA1IDEw
MDY0NAoraW5kZXggMDAzMjJjNTg2MjIuLmY0MmJiYjhhZjk4IDEwMDY0NAogLS0tIGEvbGliZ2Nj
L2NvbmZpZy9pMzg2L2NwdWluZm8uYwogKysrIGIvbGliZ2NjL2NvbmZpZy9pMzg2L2NwdWluZm8u
YwotQEAgLTUwNCw3ICs1MDQsNyBAQCBfX2NwdV9pbmRpY2F0b3JfaW5pdCAodm9pZCkKK0BAIC01
MDgsNyArNTA4LDcgQEAgX19jcHVfaW5kaWNhdG9yX2luaXQgKHZvaWQpCiAgICByZXR1cm4gMDsK
ICB9CiAgCkBAIC04MSw2ICs4MSwzIEBAIGluZGV4IDg1MDZhNjM1NzkwLi41NjQyOTZmNzg4ZSAx
MDA2NDQKIC1IT1NUX0xJQkdDQzJfQ0ZMQUdTICs9IC1tbG9uZy1kb3VibGUtODAgLURVU0VfRUxG
X1NZTVZFUiAkKENFVF9GTEFHUykKICtIT1NUX0xJQkdDQzJfQ0ZMQUdTICs9IC1tbG9uZy1kb3Vi
bGUtODAgJChDRVRfRkxBR1MpCiAgQ1JUU1RVRkZfVF9DRkxBR1MgKz0gJChDRVRfRkxBR1MpCi0t
LSAKLTIuMjUuMQotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2djYy05
LjMvMDAzOC1nZW50eXBlcy1nZW5tb2Rlcy1Eby1ub3QtdXNlLV9fTElORV9fLWZvci1tYWludGFp
bmluLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2djYy9nY2MtMTAuMS8wMDM1LWdlbnR5
cGVzLWdlbm1vZGVzLURvLW5vdC11c2UtX19MSU5FX18tZm9yLW1haW50YWluaW4ucGF0Y2gKc2lt
aWxhcml0eSBpbmRleCA4MCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2djYy9n
Y2MtOS4zLzAwMzgtZ2VudHlwZXMtZ2VubW9kZXMtRG8tbm90LXVzZS1fX0xJTkVfXy1mb3ItbWFp
bnRhaW5pbi5wYXRjaApyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2djYy9nY2MtMTAu
MS8wMDM1LWdlbnR5cGVzLWdlbm1vZGVzLURvLW5vdC11c2UtX19MSU5FX18tZm9yLW1haW50YWlu
aW4ucGF0Y2gKaW5kZXggYTc5ZmMwM2QxNS4uNjViNDY5Yzk0YSAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2djYy9nY2MtOS4zLzAwMzgtZ2VudHlwZXMtZ2VubW9kZXMtRG8tbm90
LXVzZS1fX0xJTkVfXy1mb3ItbWFpbnRhaW5pbi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvZ2NjL2djYy0xMC4xLzAwMzUtZ2VudHlwZXMtZ2VubW9kZXMtRG8tbm90LXVzZS1fX0xJ
TkVfXy1mb3ItbWFpbnRhaW5pbi5wYXRjaApAQCAtMSw3ICsxLDcgQEAKLUZyb20gMDc1ZTA5Mjll
MDQ5MTM1MzgzOTEwNTJjMzIxNzhiNmExNGVmMGFlMyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
LUZyb206IEtoZW0gUmFqIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1h
aWx0bzpyYWoua2hlbUBnbWFpbC5jb20iPiZsdDtyYWoua2hlbUBnbWFpbC5jb20mZ3Q7PC9hPgot
RGF0ZTogVGh1LCAxMiBNYXIgMjAyMCAxNDo0MTo0MCAtMDcwMAotU3ViamVjdDogW1BBVENIIDM4
LzM5XSBnZW50eXBlcy9nZW5tb2RlczogRG8gbm90IHVzZSBfX0xJTkVfXyBmb3IgbWFpbnRhaW5p
bmcKK0Zyb20gOGE5ZDc5YjEwNTQ4NGVjOWM3MTk3MWUxOTRjZDlhOGI2YjBmMDk5ZSBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IFJpY2hhcmQgUHVyZGllIDxhIGNsYXNzPSJtb3otdHh0
LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzpyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRp
b24ub3JnIj4mbHQ7cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZyZndDs8L2E+CitE
YXRlOiBUdWUsIDEwIE1hciAyMDIwIDA4OjI2OjUzIC0wNzAwCitTdWJqZWN0OiBbUEFUQ0hdIGdl
bnR5cGVzL2dlbm1vZGVzOiBEbyBub3QgdXNlIF9fTElORV9fIGZvciBtYWludGFpbmluZwogIHJl
cHJvZHVjaWJpbGl0eQogCiBJbnNlcnRpbmcgbGluZSBudW1iZXJzIGludG8gZ2VuZXJhdGVkIGNv
ZGUgbWVhbnMgaXRzIG5vdCBhbHdheXMgcmVwcm9kdWNpYmxlIHd0aApAQCAtMTcsNyArMTcsNyBA
QCBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZF
IiBocmVmPSJtYWlsdG86cmFqLmtoZW1AZ21haWwuY29tIj4mbHQ7cmFqLmtoZW1AZ21haWwuY29t
Jmd0OzwvYT4KICAyIGZpbGVzIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDE5IGRlbGV0aW9u
cygtKQogCiBkaWZmIC0tZ2l0IGEvZ2NjL2dlbmd0eXBlLmMgYi9nY2MvZ2VuZ3R5cGUuYwotaW5k
ZXggNTMzMTczMzdjZjguLmJiYjI2MTUxNjcxIDEwMDY0NAoraW5kZXggOTgxNTc3NDgxYWYuLmQ1
NzAwZmZmNDAxIDEwMDY0NAogLS0tIGEvZ2NjL2dlbmd0eXBlLmMKICsrKyBiL2djYy9nZW5ndHlw
ZS5jCiBAQCAtOTkxLDcgKzk5MSw3IEBAIGNyZWF0ZV9maWVsZF9hdCAocGFpcl9wIG5leHQsIHR5
cGVfcCB0eXBlLCBjb25zdCBjaGFyICpuYW1lLCBvcHRpb25zX3Agb3B0LApAQCAtMzgsNyArMzgs
NyBAQCBpbmRleCA1MzMxNzMzN2NmOC4uYmJiMjYxNTE2NzEgMTAwNjQ0CiAgCiAgLyogUmV2ZXJz
ZSBhIGxpbmtlZCBsaXN0IG9mICdzdHJ1Y3QgcGFpcidzIGluIHBsYWNlLiAgKi8KICBwYWlyX3AK
LUBAIC01MTg2LDcgKzUxODYsNyBAQCBtYWluIChpbnQgYXJnYywgY2hhciAqKmFyZ3YpCitAQCAt
NTE4Nyw3ICs1MTg3LDcgQEAgbWFpbiAoaW50IGFyZ2MsIGNoYXIgKiphcmd2KQogICAgICAgIC8q
IFRoZXNlIHR5cGVzIGFyZSBzZXQgdXAgd2l0aCAjZGVmaW5lIG9yIGVsc2Ugb3V0c2lkZSBvZiB3
aGVyZQogICAgICAgICAgIHdlIGNhbiBzZWUgdGhlbS4gIFdlIHNob3VsZCBpbml0aWFsaXplIHRo
ZW0gYmVmb3JlIGNhbGxpbmcKICAgICAgICAgICByZWFkX2lucHV0X2xpc3QuICAqLwpAQCAtNDgs
MTAgKzQ4LDEwIEBAIGluZGV4IDUzMzE3MzM3Y2Y4Li5iYmIyNjE1MTY3MSAxMDA2NDQKICAgICAg
ICBQT1NfSEVSRSAoZG9fc2NhbGFyX3R5cGVkZWYgKCJDVU1VTEFUSVZFX0FSR1MiLCAmYW1wO3Bv
cykpOwogICAgICAgIFBPU19IRVJFIChkb19zY2FsYXJfdHlwZWRlZiAoIlJFQUxfVkFMVUVfVFlQ
RTxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzosJmFtcDtwb3Mp
KTtkaWZmLS1naXRhL2djYy9nZW5tb2Rlcy5jYi9nY2MvZ2VubW9kZXMuYy1pbmRleGYzM2VlZmEy
NDk0Li4wN2JlZjllZWJlMjEwMDY0NCtpbmRleGJkNzgzMTBlYTI0Li5kYmQwMmM1MWE0YzEwMDY0
NC0tLWEvZ2NjL2dlbm1vZGVzLmMrKytiL2djYy9nZW5tb2Rlcy5jLUBALTQyOSw3KzQyOSw3QEBj
b21wbGV0ZV9hbGxfbW9kZXModm9pZCkrQEAtNDMwLDcrNDMwLDdAQGNvbXBsZXRlX2FsbF9tb2Rl
cyh2b2lkKX0vKkZvcmVhY2htb2RlaW5jbGFzc0NMQVNTLGNvbnN0cnVjdGFjb3JyZXNwb25kaW5n
Y29tcGxleG1vZGUuKi9AQC02MCwxNis2MCwxNkBAaW5kZXhmMzNlZWZhMjQ5NC4uMDdiZWY5ZWVi
ZTIxMDA2NDRzdGF0aWN2b2lkbWFrZV9jb21wbGV4X21vZGVzKGVudW1tb2RlX2NsYXNzY2wsY29u
c3RjaGFyKmZpbGUsdW5zaWduZWRpbnRsaW5lKS1AQC00ODcsNys0ODcsN0BAbWFrZV9jb21wbGV4
X21vZGVzKGVudW1tb2RlX2NsYXNzY2wsLS8qRm9yYWxsbW9kZXNpbmNsYXNzQ0wsY29uc3RydWN0
dmVjdG9ybW9kZXNvZndpZHRoLVdJRFRILGhhdmluZ2FzbWFueWNvbXBvbmVudHNhc25lY2Vzc2Fy
eS4qLy0jZGVmaW5lVkVDVE9SX01PREVTX1dJVEhfUFJFRklYKFBSRUZJWCxDLFcpXC0tbWFrZV92
ZWN0b3JfbW9kZXMoTU9ERV8jI0MsI1BSRUZJWCxXLF9fRklMRV9fLF9fTElORV9fKS0rbWFrZV92
ZWN0b3JfbW9kZXMoTU9ERV8jI0MsI1BSRUZJWCxXLF9fRklMRV9fLDApLSNkZWZpbmVWRUNUT1Jf
TU9ERVMoQyxXKVZFQ1RPUl9NT0RFU19XSVRIX1BSRUZJWChWLEMsVykrQEAtNDg5LDcrNDg5LDdA
QG1ha2VfY29tcGxleF9tb2RlcyhlbnVtbW9kZV9jbGFzc2NsLCtoYXZpbmdhc21hbnljb21wb25l
bnRzYXNuZWNlc3NhcnkuT1JERVJpc3RoZXNvcnRpbmdvcmRlcitvZnRoZW1vZGUsd2l0aHNtYWxs
ZXJudW1iZXJzaW5kaWNhdGluZ2FoaWdoZXJwcmlvcml0eS4qLysjZGVmaW5lVkVDVE9SX01PREVT
X1dJVEhfUFJFRklYKFBSRUZJWCxDLFcsT1JERVIpXCstbWFrZV92ZWN0b3JfbW9kZXMoTU9ERV8j
I0MsI1BSRUZJWCxXLE9SREVSLF9fRklMRV9fLF9fTElORV9fKSsrbWFrZV92ZWN0b3JfbW9kZXMo
TU9ERV8jI0MsI1BSRUZJWCxXLE9SREVSLF9fRklMRV9fLDApKyNkZWZpbmVWRUNUT1JfTU9ERVMo
QyxXKVZFQ1RPUl9NT0RFU19XSVRIX1BSRUZJWChWLEMsVywwKXN0YXRpY3ZvaWRBVFRSSUJVVEVf
VU5VU0VEbWFrZV92ZWN0b3JfbW9kZXMoZW51bW1vZGVfY2xhc3NjbCxjb25zdGNoYXIqcHJlZml4
LHVuc2lnbmVkaW50d2lkdGgsLUBALTUzOCw3KzUzOCw3QEBtYWtlX3ZlY3Rvcl9tb2RlcyhlbnVt
bW9kZV9jbGFzc2NsLGNvbnN0Y2hhcipwcmVmaXgsdW5zaWduZWRpbnR3aWR0aCwrQEAtNTQxLDcr
NTQxLDdAQG1ha2VfdmVjdG9yX21vZGVzKGVudW1tb2RlX2NsYXNzY2wsY29uc3RjaGFyKnByZWZp
eCx1bnNpZ25lZGludHdpZHRoLC8qQ3JlYXRlYXZlY3Rvcm9mYm9vbGVhbnNjYWxsZWROQU1Fd2l0
aENPVU5UZWxlbWVudHNhbmRCWVRFU0laRWJ5dGVzaW50b3RhbC4qLyNkZWZpbmVWRUNUT1JfQk9P
TF9NT0RFKE5BTUUsQ09VTlQsQllURVNJWkUpXEBALTc4LDcrNzgsN0BAaW5kZXhmMzNlZWZhMjQ5
NC4uMDdiZWY5ZWViZTIxMDA2NDRzdGF0aWN2b2lkQVRUUklCVVRFX1VOVVNFRG1ha2VfdmVjdG9y
X2Jvb2xfbW9kZShjb25zdGNoYXIqbmFtZSx1bnNpZ25lZGludGNvdW50LHVuc2lnbmVkaW50Ynl0
ZXNpemUsY29uc3RjaGFyKmZpbGUsLUBALTU2MCw3KzU2MCw3QEBtYWtlX3ZlY3Rvcl9ib29sX21v
ZGUoY29uc3RjaGFyKm5hbWUsdW5zaWduZWRpbnRjb3VudCwrQEAtNTYzLDcrNTYzLDdAQG1ha2Vf
dmVjdG9yX2Jvb2xfbW9kZShjb25zdGNoYXIqbmFtZSx1bnNpZ25lZGludGNvdW50LC8qSW5wdXQu
Ki8jZGVmaW5lX1NQRUNJQUxfTU9ERShDLE4pXEBALTg3LDcrODcsN0BAaW5kZXhmMzNlZWZhMjQ5
NC4uMDdiZWY5ZWViZTIxMDA2NDQjZGVmaW5lUkFORE9NX01PREUoTilfU1BFQ0lBTF9NT0RFKFJB
TkRPTSxOKSNkZWZpbmVDQ19NT0RFKE4pX1NQRUNJQUxfTU9ERShDQyxOKS1AQC01NzMsNys1NzMs
N0BAbWFrZV9zcGVjaWFsX21vZGUoZW51bW1vZGVfY2xhc3NjbCxjb25zdGNoYXIqbmFtZSwrQEAt
NTc2LDcrNTc2LDdAQG1ha2Vfc3BlY2lhbF9tb2RlKGVudW1tb2RlX2NsYXNzY2wsY29uc3RjaGFy
Km5hbWUsI2RlZmluZUlOVF9NT0RFKE4sWSlGUkFDVElPTkFMX0lOVF9NT0RFKE4sLTFVLFkpI2Rl
ZmluZUZSQUNUSU9OQUxfSU5UX01PREUoTixCLFkpXEBALTk2LDcrOTYsN0BAaW5kZXhmMzNlZWZh
MjQ5NC4uMDdiZWY5ZWViZTIxMDA2NDRzdGF0aWN2b2lkbWFrZV9pbnRfbW9kZShjb25zdGNoYXIq
bmFtZSwtQEAtNTg2LDE2KzU4NiwxNkBAbWFrZV9pbnRfbW9kZShjb25zdGNoYXIqbmFtZSwrQEAt
NTg5LDE2KzU4OSwxNkBAbWFrZV9pbnRfbW9kZShjb25zdGNoYXIqbmFtZSx9I2RlZmluZUZSQUNU
X01PREUoTixZLEYpXEBALTExNyw3KzExNyw3QEBpbmRleGYzM2VlZmEyNDk0Li4wN2JlZjllZWJl
MjEwMDY0NC8qQ3JlYXRlYWZpeGVkLXBvaW50bW9kZWJ5c2V0dGluZ0NMLE5BTUUsQllURVNJWkUs
SUJJVCxGQklULEZJTEUsYW5kTElORS4qLy1AQC02MTYsNys2MTYsN0BAbWFrZV9maXhlZF9wb2lu
dF9tb2RlKGVudW1tb2RlX2NsYXNzY2wsK0BALTYxOSw3KzYxOSw3QEBtYWtlX2ZpeGVkX3BvaW50
X21vZGUoZW51bW1vZGVfY2xhc3NjbCwjZGVmaW5lRkxPQVRfTU9ERShOLFksRilGUkFDVElPTkFM
X0ZMT0FUX01PREUoTiwtMVUsWSxGKSNkZWZpbmVGUkFDVElPTkFMX0ZMT0FUX01PREUoTixCLFks
RilcQEAtMTI2LDcrMTI2LDdAQGluZGV4ZjMzZWVmYTI0OTQuLjA3YmVmOWVlYmUyMTAwNjQ0c3Rh
dGljdm9pZG1ha2VfZmxvYXRfbW9kZShjb25zdGNoYXIqbmFtZSwtQEAtNjMzLDcrNjMzLDdAQG1h
a2VfZmxvYXRfbW9kZShjb25zdGNoYXIqbmFtZSwrQEAtNjM2LDcrNjM2LDdAQG1ha2VfZmxvYXRf
bW9kZShjb25zdGNoYXIqbmFtZSwjZGVmaW5lREVDSU1BTF9GTE9BVF9NT0RFKE4sWSxGKVxGUkFD
VElPTkFMX0RFQ0lNQUxfRkxPQVRfTU9ERShOLC0xVSxZLEYpI2RlZmluZUZSQUNUSU9OQUxfREVD
SU1BTF9GTE9BVF9NT0RFKE4sQixZLEYpXEBALTEzNSw3KzEzNSw3QEBpbmRleGYzM2VlZmEyNDk0
Li4wN2JlZjllZWJlMjEwMDY0NHN0YXRpY3ZvaWRtYWtlX2RlY2ltYWxfZmxvYXRfbW9kZShjb25z
dGNoYXIqbmFtZSwtQEAtNjQ4LDcrNjQ4LDdAQG1ha2VfZGVjaW1hbF9mbG9hdF9tb2RlKGNvbnN0
Y2hhcipuYW1lLCtAQC02NTEsNys2NTEsN0BAbWFrZV9kZWNpbWFsX2Zsb2F0X21vZGUoY29uc3Rj
aGFyKm5hbWUsfSNkZWZpbmVSRVNFVF9GTE9BVF9GT1JNQVQoTixGKVxAQC0xNDQsNysxNDQsN0BA
aW5kZXhmMzNlZWZhMjQ5NC4uMDdiZWY5ZWViZTIxMDA2NDRzdGF0aWN2b2lkQVRUUklCVVRFX1VO
VVNFRHJlc2V0X2Zsb2F0X2Zvcm1hdChjb25zdGNoYXIqbmFtZSxjb25zdGNoYXIqZm9ybWF0LGNv
bnN0Y2hhcipmaWxlLHVuc2lnbmVkaW50bGluZSktQEAtNjY5LDcrNjY5LDdAQHJlc2V0X2Zsb2F0
X2Zvcm1hdChjb25zdGNoYXIqbmFtZSxjb25zdGNoYXIqZm9ybWF0LCtAQC02NzIsNys2NzIsN0BA
cmVzZXRfZmxvYXRfZm9ybWF0KGNvbnN0Y2hhcipuYW1lLGNvbnN0Y2hhcipmb3JtYXQsLypfX2lu
dE5zdXBwb3J0LiovI2RlZmluZUlOVF9OKE0sUFJFQylcQEAtMTUzLDcrMTUzLDdAQGluZGV4ZjMz
ZWVmYTI0OTQuLjA3YmVmOWVlYmUyMTAwNjQ0c3RhdGljdm9pZEFUVFJJQlVURV9VTlVTRURtYWtl
X2ludF9uKGNvbnN0Y2hhciptLGludGJpdHNpemUsY29uc3RjaGFyKmZpbGUsdW5zaWduZWRpbnRs
aW5lKS1AQC02OTgsNys2OTgsN0BAbWFrZV9pbnRfbihjb25zdGNoYXIqbSxpbnRiaXRzaXplLCtA
QC03MDEsNys3MDEsN0BAbWFrZV9pbnRfbihjb25zdGNoYXIqbSxpbnRiaXRzaXplLC8qUGFydGlh
bGludGVnZXJtb2Rlc2FyZXNwZWNpZmllZGJ5cmVsYXRpb250b2FmdWxsaW50ZWdlcm1vZGUuKi8j
ZGVmaW5lUEFSVElBTF9JTlRfTU9ERShNLFBSRUMsTkFNRSlcQEAtMTYyLDcrMTYyLDdAQGluZGV4
ZjMzZWVmYTI0OTQuLjA3YmVmOWVlYmUyMTAwNjQ0c3RhdGljdm9pZEFUVFJJQlVURV9VTlVTRURt
YWtlX3BhcnRpYWxfaW50ZWdlcl9tb2RlKGNvbnN0Y2hhcipiYXNlLGNvbnN0Y2hhcipuYW1lLHVu
c2lnbmVkaW50cHJlY2lzaW9uLC1AQC03MjUsNys3MjUsN0BAbWFrZV9wYXJ0aWFsX2ludGVnZXJf
bW9kZShjb25zdGNoYXIqYmFzZSxjb25zdGNoYXIqbmFtZSwrQEAtNzI4LDcrNzI4LDdAQG1ha2Vf
cGFydGlhbF9pbnRlZ2VyX21vZGUoY29uc3RjaGFyKmJhc2UsY29uc3RjaGFyKm5hbWUsLypBc2lu
Z2xldmVjdG9ybW9kZWNhbmJlc3BlY2lmaWVkYnluYW1pbmdpdHNjb21wb25lbnRtb2RlYW5kdGhl
bnVtYmVyb2Zjb21wb25lbnRzLiovI2RlZmluZVZFQ1RPUl9NT0RFKEMsTSxOKVxAQC0xNzEsNysx
NzEsN0BAaW5kZXhmMzNlZWZhMjQ5NC4uMDdiZWY5ZWViZTIxMDA2NDRzdGF0aWN2b2lkQVRUUklC
VVRFX1VOVVNFRG1ha2VfdmVjdG9yX21vZGUoZW51bW1vZGVfY2xhc3NiY2xhc3MsY29uc3RjaGFy
KmJhc2UsLUBALTc2OCw3Kzc2OCw3QEBtYWtlX3ZlY3Rvcl9tb2RlKGVudW1tb2RlX2NsYXNzYmNs
YXNzLCtAQC03NzEsNys3NzEsN0BAbWFrZV92ZWN0b3JfbW9kZShlbnVtbW9kZV9jbGFzc2JjbGFz
cywvKkFkanVzdGFiaWxpdHkuKi8jZGVmaW5lX0FERF9BREpVU1QoQSxNLFgsQzEsQzIpXEBALTE4
MCw2KzE4MCwzQEBpbmRleGYzM2VlZmEyNDk0Li4wN2JlZjllZWJlMjEwMDY0NCNkZWZpbmVBREpV
U1RfTlVOSVRTKE0sWClfQUREX0FESlVTVChudW5pdHMsTSxYLFJBTkRPTSxSQU5ET00pI2RlZmlu
ZUFESlVTVF9CWVRFU0laRShNLFgpX0FERF9BREpVU1QoYnl0ZXNpemUsTSxYLFJBTkRPTSxSQU5E
T00pLS0tLTIuMjUuMS1kaWZmLS1naXRhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2MvZ2NjLTEw
LjEvMDAzNi1FbmFibGUtQ0VULWluLWNyb3NzLWNvbXBpbGVyLWlmLXBvc3NpYmxlLnBhdGNoYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2djYy0xMC4xLzAwMzYtRW5hYmxlLUNFVC1pbi1jcm9z
cy1jb21waWxlci1pZi1wb3NzaWJsZS5wYXRjaG5ld2ZpbGVtb2RlMTAwNjQ0aW5kZXgwMDAwMDAw
MDAwLi44MTgzZmU3MzNlLS0tL2Rldi9udWxsKysrYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2Nj
L2djYy0xMC4xLzAwMzYtRW5hYmxlLUNFVC1pbi1jcm9zcy1jb21waWxlci1pZi1wb3NzaWJsZS5w
YXRjaEBALTAsMCsxLDE1MEBAK0Zyb21mOWEzOTVkYTVjZjM3YzAwMjQ2ZDZlY2MyOGFhMDdkYTUy
NDNhZDU0TW9uU2VwMTcwMDowMDowMDIwMDErRnJvbToiPiIsICZhbXA7cG9zKSk7CiBkaWZmIC0t
Z2l0IGEvZ2NjL2dlbm1vZGVzLmMgYi9nY2MvZ2VubW9kZXMuYwotaW5kZXggZjMzZWVmYTI0OTQu
LjA3YmVmOWVlYmUyIDEwMDY0NAoraW5kZXggYmQ3ODMxMGVhMjQuLmRiZDAyYzUxYTRjIDEwMDY0
NAogLS0tIGEvZ2NjL2dlbm1vZGVzLmMKICsrKyBiL2djYy9nZW5tb2Rlcy5jCi1AQCAtNDI5LDcg
KzQyOSw3IEBAIGNvbXBsZXRlX2FsbF9tb2RlcyAodm9pZCkKK0BAIC00MzAsNyArNDMwLDcgQEAg
Y29tcGxldGVfYWxsX21vZGVzICh2b2lkKQogIH0KICAKICAvKiBGb3IgZWFjaCBtb2RlIGluIGNs
YXNzIENMQVNTLCBjb25zdHJ1Y3QgYSBjb3JyZXNwb25kaW5nIGNvbXBsZXggbW9kZS4gICovCkBA
IC02MCwxNiArNjAsMTYgQEAgaW5kZXggZjMzZWVmYTI0OTQuLjA3YmVmOWVlYmUyIDEwMDY0NAog
IHN0YXRpYyB2b2lkCiAgbWFrZV9jb21wbGV4X21vZGVzIChlbnVtIG1vZGVfY2xhc3MgY2wsCiAg
CQkgICAgY29uc3QgY2hhciAqZmlsZSwgdW5zaWduZWQgaW50IGxpbmUpCi1AQCAtNDg3LDcgKzQ4
Nyw3IEBAIG1ha2VfY29tcGxleF9tb2RlcyAoZW51bSBtb2RlX2NsYXNzIGNsLAotIC8qIEZvciBh
bGwgbW9kZXMgaW4gY2xhc3MgQ0wsIGNvbnN0cnVjdCB2ZWN0b3IgbW9kZXMgb2Ygd2lkdGgKLSAg
ICBXSURUSCwgaGF2aW5nIGFzIG1hbnkgY29tcG9uZW50cyBhcyBuZWNlc3NhcnkuICAqLwotICNk
ZWZpbmUgVkVDVE9SX01PREVTX1dJVEhfUFJFRklYKFBSRUZJWCwgQywgVykgXAotLSAgbWFrZV92
ZWN0b3JfbW9kZXMgKE1PREVfIyNDLCAjUFJFRklYLCBXLCBfX0ZJTEVfXywgX19MSU5FX18pCi0r
ICBtYWtlX3ZlY3Rvcl9tb2RlcyAoTU9ERV8jI0MsICNQUkVGSVgsIFcsIF9fRklMRV9fLCAwKQot
ICNkZWZpbmUgVkVDVE9SX01PREVTKEMsIFcpIFZFQ1RPUl9NT0RFU19XSVRIX1BSRUZJWCAoViwg
QywgVykKK0BAIC00ODksNyArNDg5LDcgQEAgbWFrZV9jb21wbGV4X21vZGVzIChlbnVtIG1vZGVf
Y2xhc3MgY2wsCisgICAgaGF2aW5nIGFzIG1hbnkgY29tcG9uZW50cyBhcyBuZWNlc3NhcnkuICBP
UkRFUiBpcyB0aGUgc29ydGluZyBvcmRlcgorICAgIG9mIHRoZSBtb2RlLCB3aXRoIHNtYWxsZXIg
bnVtYmVycyBpbmRpY2F0aW5nIGEgaGlnaGVyIHByaW9yaXR5LiAgKi8KKyAjZGVmaW5lIFZFQ1RP
Ul9NT0RFU19XSVRIX1BSRUZJWChQUkVGSVgsIEMsIFcsIE9SREVSKSBcCistICBtYWtlX3ZlY3Rv
cl9tb2RlcyAoTU9ERV8jI0MsICNQUkVGSVgsIFcsIE9SREVSLCBfX0ZJTEVfXywgX19MSU5FX18p
CisrICBtYWtlX3ZlY3Rvcl9tb2RlcyAoTU9ERV8jI0MsICNQUkVGSVgsIFcsIE9SREVSLCBfX0ZJ
TEVfXywgMCkKKyAjZGVmaW5lIFZFQ1RPUl9NT0RFUyhDLCBXKSBWRUNUT1JfTU9ERVNfV0lUSF9Q
UkVGSVggKFYsIEMsIFcsIDApCiAgc3RhdGljIHZvaWQgQVRUUklCVVRFX1VOVVNFRAogIG1ha2Vf
dmVjdG9yX21vZGVzIChlbnVtIG1vZGVfY2xhc3MgY2wsIGNvbnN0IGNoYXIgKnByZWZpeCwgdW5z
aWduZWQgaW50IHdpZHRoLAotQEAgLTUzOCw3ICs1MzgsNyBAQCBtYWtlX3ZlY3Rvcl9tb2RlcyAo
ZW51bSBtb2RlX2NsYXNzIGNsLCBjb25zdCBjaGFyICpwcmVmaXgsIHVuc2lnbmVkIGludCB3aWR0
aCwKK0BAIC01NDEsNyArNTQxLDcgQEAgbWFrZV92ZWN0b3JfbW9kZXMgKGVudW0gbW9kZV9jbGFz
cyBjbCwgY29uc3QgY2hhciAqcHJlZml4LCB1bnNpZ25lZCBpbnQgd2lkdGgsCiAgLyogQ3JlYXRl
IGEgdmVjdG9yIG9mIGJvb2xlYW5zIGNhbGxlZCBOQU1FIHdpdGggQ09VTlQgZWxlbWVudHMgYW5k
CiAgICAgQllURVNJWkUgYnl0ZXMgaW4gdG90YWwuICAqLwogICNkZWZpbmUgVkVDVE9SX0JPT0xf
TU9ERShOQU1FLCBDT1VOVCwgQllURVNJWkUpIFwKQEAgLTc4LDcgKzc4LDcgQEAgaW5kZXggZjMz
ZWVmYTI0OTQuLjA3YmVmOWVlYmUyIDEwMDY0NAogIHN0YXRpYyB2b2lkIEFUVFJJQlVURV9VTlVT
RUQKICBtYWtlX3ZlY3Rvcl9ib29sX21vZGUgKGNvbnN0IGNoYXIgKm5hbWUsIHVuc2lnbmVkIGlu
dCBjb3VudCwKICAJCSAgICAgICB1bnNpZ25lZCBpbnQgYnl0ZXNpemUsIGNvbnN0IGNoYXIgKmZp
bGUsCi1AQCAtNTYwLDcgKzU2MCw3IEBAIG1ha2VfdmVjdG9yX2Jvb2xfbW9kZSAoY29uc3QgY2hh
ciAqbmFtZSwgdW5zaWduZWQgaW50IGNvdW50LAorQEAgLTU2Myw3ICs1NjMsNyBAQCBtYWtlX3Zl
Y3Rvcl9ib29sX21vZGUgKGNvbnN0IGNoYXIgKm5hbWUsIHVuc2lnbmVkIGludCBjb3VudCwKICAv
KiBJbnB1dC4gICovCiAgCiAgI2RlZmluZSBfU1BFQ0lBTF9NT0RFKEMsIE4pIFwKQEAgLTg3LDcg
Kzg3LDcgQEAgaW5kZXggZjMzZWVmYTI0OTQuLjA3YmVmOWVlYmUyIDEwMDY0NAogICNkZWZpbmUg
UkFORE9NX01PREUoTikgX1NQRUNJQUxfTU9ERSAoUkFORE9NLCBOKQogICNkZWZpbmUgQ0NfTU9E
RShOKSBfU1BFQ0lBTF9NT0RFIChDQywgTikKICAKLUBAIC01NzMsNyArNTczLDcgQEAgbWFrZV9z
cGVjaWFsX21vZGUgKGVudW0gbW9kZV9jbGFzcyBjbCwgY29uc3QgY2hhciAqbmFtZSwKK0BAIC01
NzYsNyArNTc2LDcgQEAgbWFrZV9zcGVjaWFsX21vZGUgKGVudW0gbW9kZV9jbGFzcyBjbCwgY29u
c3QgY2hhciAqbmFtZSwKICAKICAjZGVmaW5lIElOVF9NT0RFKE4sIFkpIEZSQUNUSU9OQUxfSU5U
X01PREUgKE4sIC0xVSwgWSkKICAjZGVmaW5lIEZSQUNUSU9OQUxfSU5UX01PREUoTiwgQiwgWSkg
XApAQCAtOTYsNyArOTYsNyBAQCBpbmRleCBmMzNlZWZhMjQ5NC4uMDdiZWY5ZWViZTIgMTAwNjQ0
CiAgCiAgc3RhdGljIHZvaWQKICBtYWtlX2ludF9tb2RlIChjb25zdCBjaGFyICpuYW1lLAotQEAg
LTU4NiwxNiArNTg2LDE2IEBAIG1ha2VfaW50X21vZGUgKGNvbnN0IGNoYXIgKm5hbWUsCitAQCAt
NTg5LDE2ICs1ODksMTYgQEAgbWFrZV9pbnRfbW9kZSAoY29uc3QgY2hhciAqbmFtZSwKICB9CiAg
CiAgI2RlZmluZSBGUkFDVF9NT0RFKE4sIFksIEYpIFwKQEAgLTExNyw3ICsxMTcsNyBAQCBpbmRl
eCBmMzNlZWZhMjQ5NC4uMDdiZWY5ZWViZTIgMTAwNjQ0CiAgCiAgLyogQ3JlYXRlIGEgZml4ZWQt
cG9pbnQgbW9kZSBieSBzZXR0aW5nIENMLCBOQU1FLCBCWVRFU0laRSwgSUJJVCwgRkJJVCwKICAg
ICBGSUxFLCBhbmQgTElORS4gICovCi1AQCAtNjE2LDcgKzYxNiw3IEBAIG1ha2VfZml4ZWRfcG9p
bnRfbW9kZSAoZW51bSBtb2RlX2NsYXNzIGNsLAorQEAgLTYxOSw3ICs2MTksNyBAQCBtYWtlX2Zp
eGVkX3BvaW50X21vZGUgKGVudW0gbW9kZV9jbGFzcyBjbCwKICAKICAjZGVmaW5lIEZMT0FUX01P
REUoTiwgWSwgRikgICAgICAgICAgICAgRlJBQ1RJT05BTF9GTE9BVF9NT0RFIChOLCAtMVUsIFks
IEYpCiAgI2RlZmluZSBGUkFDVElPTkFMX0ZMT0FUX01PREUoTiwgQiwgWSwgRikgXApAQCAtMTI2
LDcgKzEyNiw3IEBAIGluZGV4IGYzM2VlZmEyNDk0Li4wN2JlZjllZWJlMiAxMDA2NDQKICAKICBz
dGF0aWMgdm9pZAogIG1ha2VfZmxvYXRfbW9kZSAoY29uc3QgY2hhciAqbmFtZSwKLUBAIC02MzMs
NyArNjMzLDcgQEAgbWFrZV9mbG9hdF9tb2RlIChjb25zdCBjaGFyICpuYW1lLAorQEAgLTYzNiw3
ICs2MzYsNyBAQCBtYWtlX2Zsb2F0X21vZGUgKGNvbnN0IGNoYXIgKm5hbWUsCiAgI2RlZmluZSBE
RUNJTUFMX0ZMT0FUX01PREUoTiwgWSwgRikJXAogIAlGUkFDVElPTkFMX0RFQ0lNQUxfRkxPQVRf
TU9ERSAoTiwgLTFVLCBZLCBGKQogICNkZWZpbmUgRlJBQ1RJT05BTF9ERUNJTUFMX0ZMT0FUX01P
REUoTiwgQiwgWSwgRikJXApAQCAtMTM1LDcgKzEzNSw3IEBAIGluZGV4IGYzM2VlZmEyNDk0Li4w
N2JlZjllZWJlMiAxMDA2NDQKICAKICBzdGF0aWMgdm9pZAogIG1ha2VfZGVjaW1hbF9mbG9hdF9t
b2RlIChjb25zdCBjaGFyICpuYW1lLAotQEAgLTY0OCw3ICs2NDgsNyBAQCBtYWtlX2RlY2ltYWxf
ZmxvYXRfbW9kZSAoY29uc3QgY2hhciAqbmFtZSwKK0BAIC02NTEsNyArNjUxLDcgQEAgbWFrZV9k
ZWNpbWFsX2Zsb2F0X21vZGUgKGNvbnN0IGNoYXIgKm5hbWUsCiAgfQogIAogICNkZWZpbmUgUkVT
RVRfRkxPQVRfRk9STUFUKE4sIEYpIFwKQEAgLTE0NCw3ICsxNDQsNyBAQCBpbmRleCBmMzNlZWZh
MjQ5NC4uMDdiZWY5ZWViZTIgMTAwNjQ0CiAgc3RhdGljIHZvaWQgQVRUUklCVVRFX1VOVVNFRAog
IHJlc2V0X2Zsb2F0X2Zvcm1hdCAoY29uc3QgY2hhciAqbmFtZSwgY29uc3QgY2hhciAqZm9ybWF0
LAogIAkJICAgIGNvbnN0IGNoYXIgKmZpbGUsIHVuc2lnbmVkIGludCBsaW5lKQotQEAgLTY2OSw3
ICs2NjksNyBAQCByZXNldF9mbG9hdF9mb3JtYXQgKGNvbnN0IGNoYXIgKm5hbWUsIGNvbnN0IGNo
YXIgKmZvcm1hdCwKK0BAIC02NzIsNyArNjcyLDcgQEAgcmVzZXRfZmxvYXRfZm9ybWF0IChjb25z
dCBjaGFyICpuYW1lLCBjb25zdCBjaGFyICpmb3JtYXQsCiAgCiAgLyogX19pbnROIHN1cHBvcnQu
ICAqLwogICNkZWZpbmUgSU5UX04oTSxQUkVDKQkJCQlcCkBAIC0xNTMsNyArMTUzLDcgQEAgaW5k
ZXggZjMzZWVmYTI0OTQuLjA3YmVmOWVlYmUyIDEwMDY0NAogIHN0YXRpYyB2b2lkIEFUVFJJQlVU
RV9VTlVTRUQKICBtYWtlX2ludF9uIChjb25zdCBjaGFyICptLCBpbnQgYml0c2l6ZSwKICAgICAg
ICAgICAgICBjb25zdCBjaGFyICpmaWxlLCB1bnNpZ25lZCBpbnQgbGluZSkKLUBAIC02OTgsNyAr
Njk4LDcgQEAgbWFrZV9pbnRfbiAoY29uc3QgY2hhciAqbSwgaW50IGJpdHNpemUsCitAQCAtNzAx
LDcgKzcwMSw3IEBAIG1ha2VfaW50X24gKGNvbnN0IGNoYXIgKm0sIGludCBiaXRzaXplLAogIC8q
IFBhcnRpYWwgaW50ZWdlciBtb2RlcyBhcmUgc3BlY2lmaWVkIGJ5IHJlbGF0aW9uIHRvIGEgZnVs
bCBpbnRlZ2VyCiAgICAgbW9kZS4gICovCiAgI2RlZmluZSBQQVJUSUFMX0lOVF9NT0RFKE0sUFJF
QyxOQU1FKQkJCQlcCkBAIC0xNjIsNyArMTYyLDcgQEAgaW5kZXggZjMzZWVmYTI0OTQuLjA3YmVm
OWVlYmUyIDEwMDY0NAogIHN0YXRpYyB2b2lkIEFUVFJJQlVURV9VTlVTRUQKICBtYWtlX3BhcnRp
YWxfaW50ZWdlcl9tb2RlIChjb25zdCBjaGFyICpiYXNlLCBjb25zdCBjaGFyICpuYW1lLAogIAkJ
CSAgIHVuc2lnbmVkIGludCBwcmVjaXNpb24sCi1AQCAtNzI1LDcgKzcyNSw3IEBAIG1ha2VfcGFy
dGlhbF9pbnRlZ2VyX21vZGUgKGNvbnN0IGNoYXIgKmJhc2UsIGNvbnN0IGNoYXIgKm5hbWUsCitA
QCAtNzI4LDcgKzcyOCw3IEBAIG1ha2VfcGFydGlhbF9pbnRlZ2VyX21vZGUgKGNvbnN0IGNoYXIg
KmJhc2UsIGNvbnN0IGNoYXIgKm5hbWUsCiAgLyogQSBzaW5nbGUgdmVjdG9yIG1vZGUgY2FuIGJl
IHNwZWNpZmllZCBieSBuYW1pbmcgaXRzIGNvbXBvbmVudAogICAgIG1vZGUgYW5kIHRoZSBudW1i
ZXIgb2YgY29tcG9uZW50cy4gICovCiAgI2RlZmluZSBWRUNUT1JfTU9ERShDLCBNLCBOKSBcCkBA
IC0xNzEsNyArMTcxLDcgQEAgaW5kZXggZjMzZWVmYTI0OTQuLjA3YmVmOWVlYmUyIDEwMDY0NAog
IHN0YXRpYyB2b2lkIEFUVFJJQlVURV9VTlVTRUQKICBtYWtlX3ZlY3Rvcl9tb2RlIChlbnVtIG1v
ZGVfY2xhc3MgYmNsYXNzLAogIAkJICBjb25zdCBjaGFyICpiYXNlLAotQEAgLTc2OCw3ICs3Njgs
NyBAQCBtYWtlX3ZlY3Rvcl9tb2RlIChlbnVtIG1vZGVfY2xhc3MgYmNsYXNzLAorQEAgLTc3MSw3
ICs3NzEsNyBAQCBtYWtlX3ZlY3Rvcl9tb2RlIChlbnVtIG1vZGVfY2xhc3MgYmNsYXNzLAogIAog
IC8qIEFkanVzdGFiaWxpdHkuICAqLwogICNkZWZpbmUgX0FERF9BREpVU1QoQSwgTSwgWCwgQzEs
IEMyKSBcCkBAIC0xODAsNiArMTgwLDMgQEAgaW5kZXggZjMzZWVmYTI0OTQuLjA3YmVmOWVlYmUy
IDEwMDY0NAogIAogICNkZWZpbmUgQURKVVNUX05VTklUUyhNLCBYKSAgICBfQUREX0FESlVTVCAo
bnVuaXRzLCBNLCBYLCBSQU5ET00sIFJBTkRPTSkKICAjZGVmaW5lIEFESlVTVF9CWVRFU0laRShN
LCBYKSAgX0FERF9BREpVU1QgKGJ5dGVzaXplLCBNLCBYLCBSQU5ET00sIFJBTkRPTSkKLS0tIAot
Mi4yNS4xCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2MvZ2NjLTEwLjEv
MDAzNi1FbmFibGUtQ0VULWluLWNyb3NzLWNvbXBpbGVyLWlmLXBvc3NpYmxlLnBhdGNoIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2djYy9nY2MtMTAuMS8wMDM2LUVuYWJsZS1DRVQtaW4tY3Jvc3Mt
Y29tcGlsZXItaWYtcG9zc2libGUucGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAw
MDAwMDAwMC4uODE4M2ZlNzMzZQotLS0gL2Rldi9udWxsCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9nY2MvZ2NjLTEwLjEvMDAzNi1FbmFibGUtQ0VULWluLWNyb3NzLWNvbXBpbGVyLWlmLXBv
c3NpYmxlLnBhdGNoCkBAIC0wLDAgKzEsMTUwIEBACitGcm9tIGY5YTM5NWRhNWNmMzdjMDAyNDZk
NmVjYzI4YWEwN2RhNTI0M2FkNTQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiAiPC9h
PkguSi4gTHUiIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzpo
amwudG9vbHNAZ21haWwuY29tIj4mbHQ7aGpsLnRvb2xzQGdtYWlsLmNvbSZndDs8L2E+CitEYXRl
OiBGcmksIDggTWF5IDIwMjAgMDY6MTE6MDUgLTA3MDAKK1N1YmplY3Q6IFtQQVRDSF0gRW5hYmxl
IENFVCBpbiBjcm9zcyBjb21waWxlciBpZiBwb3NzaWJsZQorCitEb24ndCBwZXJmb3JtIENFVCBy
dW4tdGltZSBjaGVjayBmb3IgaG9zdCB3aGVuIGNyb3NzIGNvbXBpbGluZy4gIEluc3RlYWQsCitl
bmFibGUgQ0VUIGluIGNyb3NzIGNvbXBpbGVyIGlmIHBvc3NpYmxlIHNvIHRoYXQgaXQgd2lsbCBy
dW4gb24gYm90aCBDRVQKK2FuZCBub24tQ0VUIGhvc3RzLgorCitjb25maWcvCisKKwlQUiBib290
c3RyYXAvOTQ5OTgKKwkqIGNldC5tNCAoR0NDX0NFVF9IT1NUX0ZMQUdTKTogRW5hYmxlIENFVCBp
biBjcm9zcyBjb21waWxlciBpZgorCXBvc3NpYmxlLgorCitsaWJpYmVydHkvCisKKwlQUiBib290
c3RyYXAvOTQ5OTgKKwkqIGNvbmZpZ3VyZTogUmVnZW5lcmF0ZWQuCisKK2x0by1wbHVnaW4vCisK
KwlQUiBib290c3RyYXAvOTQ5OTgKKwkqIGNvbmZpZ3VyZTogUmVnZW5lcmF0ZWQuCisKK1Vwc3Ry
ZWFtLVN0YXR1czogU3VibWl0dGVkIFs8YSBjbGFzcz0ibW96LXR4dC1saW5rLWZyZWV0ZXh0IiBo
cmVmPSJodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvZ2NjL3BhdGNoLzIwMjAw
NTA4MTMxMTA1LjE3MDA3Ny0xLWhqbC50b29sc0BnbWFpbC5jb20vIj5odHRwczovL3BhdGNod29y
ay5vemxhYnMub3JnL3Byb2plY3QvZ2NjL3BhdGNoLzIwMjAwNTA4MTMxMTA1LjE3MDA3Ny0xLWhq
bC50b29sc0BnbWFpbC5jb20vPC9hPl0KK1NpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxhIGNsYXNz
PSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzpyYWoua2hlbUBnbWFpbC5jb20i
PiZsdDtyYWoua2hlbUBnbWFpbC5jb20mZ3Q7PC9hPgorLS0tCisgY29uZmlnL2NldC5tNCAgICAg
ICAgfCAxOCArKysrKysrKysrKystLS0tLS0KKyBsaWJpYmVydHkvY29uZmlndXJlICB8IDEyICsr
KysrKysrKy0tLQorIGx0by1wbHVnaW4vY29uZmlndXJlIHwgMTYgKysrKysrKysrKystLS0tLQor
IDMgZmlsZXMgY2hhbmdlZCwgMzIgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pCisKK2Rp
ZmYgLS1naXQgYS9jb25maWcvY2V0Lm00IGIvY29uZmlnL2NldC5tNAoraW5kZXggZWE2MTZiNzI4
YTkuLmQ5NjA4Njk5Y2Q1IDEwMDY0NAorLS0tIGEvY29uZmlnL2NldC5tNAorKysrIGIvY29uZmln
L2NldC5tNAorQEAgLTExMSw3ICsxMTEsOCBAQCBpZiB0ZXN0IHgkbWF5X2hhdmVfY2V0ID0geHll
czsgdGhlbgorIGZpCisgCisgaWYgdGVzdCB4JG1heV9oYXZlX2NldCA9IHh5ZXM7IHRoZW4KKy0g
IEFDX1RSWV9SVU4oWworKyAgaWYgdGVzdCB4JGNyb3NzX2NvbXBpbGluZyA9IHhubzsgdGhlbgor
KyAgICBBQ19UUllfUlVOKFsKKyBzdGF0aWMgdm9pZAorIGZvbyAodm9pZCkKKyB7CitAQCAtMTM3
LDEyICsxMzgsMTcgQEAgbWFpbiAoKQorICAgYmFyICgpOworICAgcmV0dXJuIDA7CisgfQorLSAg
XSwKKy0gIFtoYXZlX2NldD1ub10sCistICBbaGF2ZV9jZXQ9eWVzXSkKKy0gIGlmIHRlc3QgeCRl
bmFibGVfY2V0ID0geG5vIC1hIHgkaGF2ZV9jZXQgPSB4eWVzOyB0aGVuCistICAgIEFDX01TR19F
UlJPUihbSW50ZWwgQ0VUIG11c3QgYmUgZW5hYmxlZCBvbiBJbnRlbCBDRVQgZW5hYmxlZCBob3N0
XSkKKysgICAgXSwKKysgICAgW2hhdmVfY2V0PW5vXSwKKysgICAgW2hhdmVfY2V0PXllc10pCisr
ICAgIGlmIHRlc3QgeCRlbmFibGVfY2V0ID0geG5vIC1hIHgkaGF2ZV9jZXQgPSB4eWVzOyB0aGVu
CisrICAgICAgQUNfTVNHX0VSUk9SKFtJbnRlbCBDRVQgbXVzdCBiZSBlbmFibGVkIG9uIEludGVs
IENFVCBlbmFibGVkIGhvc3RdKQorKyAgICBmaQorICAgZmkKKytlbHNlCisrICAjIEVuYWJsZSBD
RVQgaW4gY3Jvc3MgY29tcGlsZXIgaWYgcG9zc2libGUgc28gdGhhdCBpdCB3aWxsIHJ1biBvbiBi
b3RoCisrICAjIENFVCBhbmQgbm9uLUNFVCBob3N0cy4KKysgIGhhdmVfY2V0PXllcworIGZpCisg
aWYgdGVzdCB4JGVuYWJsZV9jZXQgPSB4eWVzOyB0aGVuCisgICAkMT0iLWZjZi1wcm90ZWN0aW9u
IgorZGlmZiAtLWdpdCBhL2xpYmliZXJ0eS9jb25maWd1cmUgYi9saWJpYmVydHkvY29uZmlndXJl
CitpbmRleCBiYjc2Y2YxYjgyMy4uM2Y4MmM1YmI4NjUgMTAwNzU1CistLS0gYS9saWJpYmVydHkv
Y29uZmlndXJlCisrKysgYi9saWJpYmVydHkvY29uZmlndXJlCitAQCAtNTM3NSw3ICs1Mzc1LDgg
QEAgcm0gLWYgY29yZSBjb25mdGVzdC5lcnIgY29uZnRlc3QuJGFjX29iamV4dCBcCisgZmkKKyAK
KyBpZiB0ZXN0IHgkbWF5X2hhdmVfY2V0ID0geHllczsgdGhlbgorLSAgaWYgdGVzdCAiJGNyb3Nz
X2NvbXBpbGluZyIgPSB5ZXM7IHRoZW4gOgorKyAgaWYgdGVzdCB4JGNyb3NzX2NvbXBpbGluZyA9
IHhubzsgdGhlbgorKyAgICBpZiB0ZXN0ICIkY3Jvc3NfY29tcGlsaW5nIiA9IHllczsgdGhlbiA6
CisgICB7IHsgJGFzX2VjaG8gIiRhc19tZToke2FzX2xpbmVuby0kTElORU5PfTogZXJyb3I6IGlu
IFxgJGFjX3B3ZCc6IiAmZ3Q7JmFtcDs1CisgJGFzX2VjaG8gIiRhc19tZTogZXJyb3I6IGluIFxg
JGFjX3B3ZCc6IiAmZ3Q7JmFtcDsyO30KKyBhc19mbl9lcnJvciAkPyAiY2Fubm90IHJ1biB0ZXN0
IHByb2dyYW0gd2hpbGUgY3Jvc3MgY29tcGlsaW5nCitAQCAtNTQyMCw5ICs1NDIxLDE0IEBAIHJt
IC1mIGNvcmUgKi5jb3JlIGNvcmUuY29uZnRlc3QuKiBnbW9uLm91dCBiYi5vdXQgY29uZnRlc3Qk
YWNfZXhlZXh0IFwKKyAgIGNvbmZ0ZXN0LiRhY19vYmpleHQgY29uZnRlc3QuYmVhbSBjb25mdGVz
dC4kYWNfZXh0CisgZmkKKyAKKy0gIGlmIHRlc3QgeCRlbmFibGVfY2V0ID0geG5vIC1hIHgkaGF2
ZV9jZXQgPSB4eWVzOyB0aGVuCistICAgIGFzX2ZuX2Vycm9yICQ/ICJJbnRlbCBDRVQgbXVzdCBi
ZSBlbmFibGVkIG9uIEludGVsIENFVCBlbmFibGVkIGhvc3QiICIkTElORU5PIiA1CisrICAgIGlm
IHRlc3QgeCRlbmFibGVfY2V0ID0geG5vIC1hIHgkaGF2ZV9jZXQgPSB4eWVzOyB0aGVuCisrICAg
ICAgYXNfZm5fZXJyb3IgJD8gIkludGVsIENFVCBtdXN0IGJlIGVuYWJsZWQgb24gSW50ZWwgQ0VU
IGVuYWJsZWQgaG9zdCIgIiRMSU5FTk8iIDUKKysgICAgZmkKKyAgIGZpCisrZWxzZQorKyAgIyBF
bmFibGUgQ0VUIGluIGNyb3NzIGNvbXBpbGVyIGlmIHBvc3NpYmxlIHNvIHRoYXQgaXQgd2lsbCBy
dW4gb24gYm90aAorKyAgIyBDRVQgYW5kIG5vbi1DRVQgaG9zdHMuCisrICBoYXZlX2NldD15ZXMK
KyBmaQorIGlmIHRlc3QgeCRlbmFibGVfY2V0ID0geHllczsgdGhlbgorICAgQ0VUX0hPU1RfRkxB
R1M9Ii1mY2YtcHJvdGVjdGlvbiIKK2RpZmYgLS1naXQgYS9sdG8tcGx1Z2luL2NvbmZpZ3VyZSBi
L2x0by1wbHVnaW4vY29uZmlndXJlCitpbmRleCAxYmFmNmNjNzBiOC4uMzZjNmVjYzU4NzUgMTAw
NzU1CistLS0gYS9sdG8tcGx1Z2luL2NvbmZpZ3VyZQorKysrIGIvbHRvLXBsdWdpbi9jb25maWd1
cmUKK0BAIC01NzY4LDcgKzU3NjgsOCBAQCBybSAtZiBjb3JlIGNvbmZ0ZXN0LmVyciBjb25mdGVz
dC4kYWNfb2JqZXh0IFwKKyBmaQorIAorIGlmIHRlc3QgeCRtYXlfaGF2ZV9jZXQgPSB4eWVzOyB0
aGVuCistICBpZiB0ZXN0ICIkY3Jvc3NfY29tcGlsaW5nIiA9IHllczsgdGhlbiA6CisrICBpZiB0
ZXN0IHgkY3Jvc3NfY29tcGlsaW5nID0geG5vOyB0aGVuCisrICAgIGlmIHRlc3QgIiRjcm9zc19j
b21waWxpbmciID0geWVzOyB0aGVuIDoKKyAgIHsgeyAkYXNfZWNobyAiJGFzX21lOiR7YXNfbGlu
ZW5vLSRMSU5FTk99OiBlcnJvcjogaW4gXGAkYWNfcHdkJzoiICZndDsmYW1wOzUKKyAkYXNfZWNo
byAiJGFzX21lOiBlcnJvcjogaW4gXGAkYWNfcHdkJzoiICZndDsmYW1wOzI7fQorIGFzX2ZuX2Vy
cm9yICQ/ICJjYW5ub3QgcnVuIHRlc3QgcHJvZ3JhbSB3aGlsZSBjcm9zcyBjb21waWxpbmcKK0BA
IC01ODEzLDkgKzU4MTQsMTQgQEAgcm0gLWYgY29yZSAqLmNvcmUgY29yZS5jb25mdGVzdC4qIGdt
b24ub3V0IGJiLm91dCBjb25mdGVzdCRhY19leGVleHQgXAorICAgY29uZnRlc3QuJGFjX29iamV4
dCBjb25mdGVzdC5iZWFtIGNvbmZ0ZXN0LiRhY19leHQKKyBmaQorIAorLSAgaWYgdGVzdCB4JGVu
YWJsZV9jZXQgPSB4bm8gLWEgeCRoYXZlX2NldCA9IHh5ZXM7IHRoZW4KKy0gICAgYXNfZm5fZXJy
b3IgJD8gIkludGVsIENFVCBtdXN0IGJlIGVuYWJsZWQgb24gSW50ZWwgQ0VUIGVuYWJsZWQgaG9z
dCIgIiRMSU5FTk8iIDUKKysgICAgaWYgdGVzdCB4JGVuYWJsZV9jZXQgPSB4bm8gLWEgeCRoYXZl
X2NldCA9IHh5ZXM7IHRoZW4KKysgICAgICBhc19mbl9lcnJvciAkPyAiSW50ZWwgQ0VUIG11c3Qg
YmUgZW5hYmxlZCBvbiBJbnRlbCBDRVQgZW5hYmxlZCBob3N0IiAiJExJTkVOTyIgNQorKyAgICBm
aQorICAgZmkKKytlbHNlCisrICAjIEVuYWJsZSBDRVQgaW4gY3Jvc3MgY29tcGlsZXIgaWYgcG9z
c2libGUgc28gdGhhdCBpdCB3aWxsIHJ1biBvbiBib3RoCisrICAjIENFVCBhbmQgbm9uLUNFVCBo
b3N0cy4KKysgIGhhdmVfY2V0PXllcworIGZpCisgaWYgdGVzdCB4JGVuYWJsZV9jZXQgPSB4eWVz
OyB0aGVuCisgICBDRVRfSE9TVF9GTEFHUz0iLWZjZi1wcm90ZWN0aW9uIgorQEAgLTExOTQxLDcg
KzExOTQ3LDcgQEAgZWxzZQorICAgbHRfZGx1bmtub3duPTA7IGx0X2Rsbm9fdXNjb3JlPTE7IGx0
X2RsbmVlZF91c2NvcmU9MgorICAgbHRfc3RhdHVzPSRsdF9kbHVua25vd24KKyAgIGNhdCAmZ3Q7
IGNvbmZ0ZXN0LiRhY19leHQgJmx0OyZsdDtfTFRfRU9GCistI2xpbmUgMTE5NDQgImNvbmZpZ3Vy
ZSIKKysjbGluZSAxMTk1MCAiY29uZmlndXJlIgorICNpbmNsdWRlICJjb25mZGVmcy5oIgorIAor
ICNpZiBIQVZFX0RMRkNOX0gKK0BAIC0xMjA0Nyw3ICsxMjA1Myw3IEBAIGVsc2UKKyAgIGx0X2Rs
dW5rbm93bj0wOyBsdF9kbG5vX3VzY29yZT0xOyBsdF9kbG5lZWRfdXNjb3JlPTIKKyAgIGx0X3N0
YXR1cz0kbHRfZGx1bmtub3duCisgICBjYXQgJmd0OyBjb25mdGVzdC4kYWNfZXh0ICZsdDsmbHQ7
X0xUX0VPRgorLSNsaW5lIDEyMDUwICJjb25maWd1cmUiCisrI2xpbmUgMTIwNTYgImNvbmZpZ3Vy
ZSIKKyAjaW5jbHVkZSAiY29uZmRlZnMuaCIKKyAKKyAjaWYgSEFWRV9ETEZDTl9ICmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2djYy0xMC4xLzAwMzctbGlic3RkYy12My1J
bmNsdWRlLXN5c3RlbV9lcnJvci1mb3Itc3RkLWVycmMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvZ2NjL2djYy0xMC4xLzAwMzctbGlic3RkYy12My1JbmNsdWRlLXN5c3RlbV9lcnJvci1m
b3Itc3RkLWVycmMucGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4u
NTRmMzcwMDZiYQotLS0gL2Rldi9udWxsCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2Mv
Z2NjLTEwLjEvMDAzNy1saWJzdGRjLXYzLUluY2x1ZGUtc3lzdGVtX2Vycm9yLWZvci1zdGQtZXJy
Yy5wYXRjaApAQCAtMCwwICsxLDIzIEBACitGcm9tIGQyMDc2NGVhY2ExMDI5YzYxYzc5ZjBmM2Vk
MmMzODIzYjBjYjJlOTIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBLaGVtIFJhaiA8
YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86cmFqLmtoZW1AZ21h
aWwuY29tIj4mbHQ7cmFqLmtoZW1AZ21haWwuY29tJmd0OzwvYT4KK0RhdGU6IE1vbiwgMTEgTWF5
IDIwMjAgMDc6NTk6MDEgLTA3MDAKK1N1YmplY3Q6IFtQQVRDSF0gbGlic3RkYysrLXYzOiBJbmNs
dWRlIHN5c3RlbV9lcnJvciBmb3Igc3RkOjplcnJjCisKK1Vwc3RyZWFtLVN0YXR1czogUGVuZGlu
ZworU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2
RSIgaHJlZj0ibWFpbHRvOnJhai5raGVtQGdtYWlsLmNvbSI+Jmx0O3Jhai5raGVtQGdtYWlsLmNv
bSZndDs8L2E+CistLS0KKyBsaWJzdGRjKystdjMvc3JjL2ZpbGVzeXN0ZW0vb3BzLmNjIHwgMSAr
CisgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCisKK2RpZmYgLS1naXQgYS9saWJzdGRj
KystdjMvc3JjL2ZpbGVzeXN0ZW0vb3BzLmNjIGIvbGlic3RkYysrLXYzL3NyYy9maWxlc3lzdGVt
L29wcy5jYworaW5kZXggMjllYTljMGNlODcuLmY3MjkxMjcxZjFlIDEwMDY0NAorLS0tIGEvbGli
c3RkYysrLXYzL3NyYy9maWxlc3lzdGVtL29wcy5jYworKysrIGIvbGlic3RkYysrLXYzL3NyYy9m
aWxlc3lzdGVtL29wcy5jYworQEAgLTMzLDYgKzMzLDcgQEAKKyAjaW5jbHVkZSAmbHQ7ZnVuY3Rp
b25hbCZndDsKKyAjaW5jbHVkZSAmbHQ7b3N0cmVhbSZndDsKKyAjaW5jbHVkZSAmbHQ7c3RhY2sm
Z3Q7CisrI2luY2x1ZGUgJmx0O3N5c3RlbV9lcnJvciZndDsKKyAjaW5jbHVkZSAmbHQ7ZXh0L3N0
ZGlvX2ZpbGVidWYuaCZndDsKKyAjaW5jbHVkZSAmbHQ7c3RkbGliLmgmZ3Q7CisgI2luY2x1ZGUg
Jmx0O3N0ZGlvLmgmZ3Q7CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2dj
Yy05LjMvMDAyMC1nY2MtNC44LXdvbi10LWJ1aWxkLXdpdGgtZGlzYWJsZS1kZXBlbmRlbmN5LXRy
YWNraW5nLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2djYy9nY2MtOS4zLzAwMjAtZ2Nj
LTQuOC13b24tdC1idWlsZC13aXRoLWRpc2FibGUtZGVwZW5kZW5jeS10cmFja2luZy5wYXRjaApk
ZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMWQyMTgyMTQwZi4uMDAwMDAwMDAwMAotLS0g
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2djYy05LjMvMDAyMC1nY2MtNC44LXdvbi10LWJ1
aWxkLXdpdGgtZGlzYWJsZS1kZXBlbmRlbmN5LXRyYWNraW5nLnBhdGNoCisrKyAvZGV2L251bGwK
QEAgLTEsNTQgKzAsMCBAQAotRnJvbSBhNDc0MGYxMjkwZTZhNjAyZmJiZmEyN2I4NjNiZTJlM2Iy
Njc1Njg1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTogS2hlbSBSYWogPGEgY2xhc3M9
Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOnJhai5raGVtQGdtYWlsLmNvbSI+
Jmx0O3Jhai5raGVtQGdtYWlsLmNvbSZndDs8L2E+Ci1EYXRlOiBGcmksIDIwIEZlYiAyMDE1IDEx
OjE3OjE5ICswMDAwCi1TdWJqZWN0OiBbUEFUQ0ggMjAvMzldIGdjYyA0LjgrIHdvbid0IGJ1aWxk
IHdpdGggLS1kaXNhYmxlLWRlcGVuZGVuY3ktdHJhY2tpbmcKLQotc2luY2UgdGhlICouUHBvIGZp
bGVzIGRvbid0IGdldCBjcmVhdGVkIHVubGVzcyAtLWVuYWJsZS1kZXBlbmRlbmN5LXRyYWNraW5n
IGlzIHRydWUuCi0KLVRoaXMgcGF0Y2ggZW5zdXJlcyB3ZSBvbmx5IHVzZSB0aG9zZSBjb21waWxl
ciBvcHRpb25zIHdoZW4gaXRzIGVuYWJsZWQuCi0KLVVwc3RyZWFtLVN0YXR1czogU3VibWl0dGVk
Ci0KLShQcm9ibGVtIHdhcyBhbHJlYWR5IHJlcG9ydGVkIHVwc3RyZWFtLCBhdHRhY2hlZCB0aGlz
IHBhdGNoIHRoZXJlCi1odHRwOi8vZ2NjLmdudS5vcmcvYnVnemlsbGEvc2hvd19idWcuY2dpP2lk
PTU1OTMwKQotCi1SUAotMjAxMi8wOS8yMgotCi1TaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8YSBj
bGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86cmFqLmtoZW1AZ21haWwu
Y29tIj4mbHQ7cmFqLmtoZW1AZ21haWwuY29tJmd0OzwvYT4KLS0tLQotIGxpYmF0b21pYy9NYWtl
ZmlsZS5hbSB8IDMgKystCi0gbGliYXRvbWljL01ha2VmaWxlLmluIHwgMyArKy0KLSAyIGZpbGVz
IGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKLQotZGlmZiAtLWdpdCBh
L2xpYmF0b21pYy9NYWtlZmlsZS5hbSBiL2xpYmF0b21pYy9NYWtlZmlsZS5hbQotaW5kZXggYzFi
N2M3MzkzNGEuLmVmNDNkNjJjMDdhIDEwMDY0NAotLS0tIGEvbGliYXRvbWljL01ha2VmaWxlLmFt
Ci0rKysgYi9saWJhdG9taWMvTWFrZWZpbGUuYW0KLUBAIC0xMDEsNyArMTAxLDggQEAgUEFUX1MJ
CT0gJCh3b3JkIDMsJChQQVRfU1BMSVQpKQotIElGVU5DX0RFRgk9IC1ESUZVTkNfQUxUPSQoUEFU
X1MpCi0gSUZVTkNfT1BUCT0gJCh3b3JkICQoUEFUX1MpLCQoSUZVTkNfT1BUSU9OUykpCi0gCi0t
TV9ERVBTCQk9IC1NVCAkQCAtTUQgLU1QIC1NRiAkKERFUERJUikvJChARikuUHBvCi0rQEFNREVQ
X1RSVUVATV9ERVBTCQk9IC1NVCAkQCAtTUQgLU1QIC1NRiAkKERFUERJUikvJChARikuUHBvCi0r
QEFNREVQX0ZBTFNFQE1fREVQUwkJPQotIE1fU0laRQkJPSAtRE49JChQQVRfTikKLSBNX0lGVU5D
CQk9ICQoaWYgJChQQVRfUyksJChJRlVOQ19ERUYpICQoSUZVTkNfT1BUKSkKLSBNX0ZJTEUJCT0g
JChQQVRfQkFTRSlfbi5jCi1kaWZmIC0tZ2l0IGEvbGliYXRvbWljL01ha2VmaWxlLmluIGIvbGli
YXRvbWljL01ha2VmaWxlLmluCi1pbmRleCAyOTMyNGUzZTBhYy4uZDVjZGI0MjU5ZWYgMTAwNjQ0
Ci0tLS0gYS9saWJhdG9taWMvTWFrZWZpbGUuaW4KLSsrKyBiL2xpYmF0b21pYy9NYWtlZmlsZS5p
bgotQEAgLTQxNCw3ICs0MTQsOCBAQCBQQVRfTiA9ICQod29yZCAyLCQoUEFUX1NQTElUKSkKLSBQ
QVRfUyA9ICQod29yZCAzLCQoUEFUX1NQTElUKSkKLSBJRlVOQ19ERUYgPSAtRElGVU5DX0FMVD0k
KFBBVF9TKQotIElGVU5DX09QVCA9ICQod29yZCAkKFBBVF9TKSwkKElGVU5DX09QVElPTlMpKQot
LU1fREVQUyA9IC1NVCAkQCAtTUQgLU1QIC1NRiAkKERFUERJUikvJChARikuUHBvCi0rQEFNREVQ
X1RSVUVATV9ERVBTID0gLU1UICRAIC1NRCAtTVAgLU1GICQoREVQRElSKS8kKEBGKS5QcG8KLStA
QU1ERVBfRkFMU0VATV9ERVBTID0KLSBNX1NJWkUgPSAtRE49JChQQVRfTikKLSBNX0lGVU5DID0g
JChpZiAkKFBBVF9TKSwkKElGVU5DX0RFRikgJChJRlVOQ19PUFQpKQotIE1fRklMRSA9ICQoUEFU
X0JBU0UpX24uYwotLS0gCi0yLjI1LjEKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2djYy9nY2MtOS4zLzAwMzAtbGRibDEyOC1jb25maWcucGF0Y2ggYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvZ2NjL2djYy05LjMvMDAzMC1sZGJsMTI4LWNvbmZpZy5wYXRjaApkZWxldGVkIGZp
bGUgbW9kZSAxMDA2NDQKaW5kZXggZjhlOGMwN2Y2Mi4uMDAwMDAwMDAwMAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvZ2NjL2djYy05LjMvMDAzMC1sZGJsMTI4LWNvbmZpZy5wYXRjaAorKysg
L2Rldi9udWxsCkBAIC0xLDc5ICswLDAgQEAKLUZyb20gMWJmYWU2MjRiMjdlYTRhMWY1YzVhOTIw
NTBkNzQxYjUxMWU3YjNkNSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IFN6YWJvbGNz
IE5hZ3kgPGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOm5zekBw
b3J0NzAubmV0Ij4mbHQ7bnN6QHBvcnQ3MC5uZXQmZ3Q7PC9hPgotRGF0ZTogV2VkLCAyOCBGZWIg
MjAxOCAwMDo1NDowNSArMDAwMAotU3ViamVjdDogW1BBVENIIDMwLzM5XSBsZGJsMTI4IGNvbmZp
ZwotCi1VcHN0cmVhbS1TdGF0dXM6IFBlbmRpbmcKLQotU2lnbmVkLW9mZi1ieTogS2hlbSBSYWog
PGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOnJhai5raGVtQGdt
YWlsLmNvbSI+Jmx0O3Jhai5raGVtQGdtYWlsLmNvbSZndDs8L2E+Ci0tLS0KLSBnY2MvY29uZmln
dXJlICAgIHwgMTMgKysrKysrKysrKysrKwotIGdjYy9jb25maWd1cmUuYWMgfCAxNiArKysrKysr
KysrKysrKy0tCi0gMiBmaWxlcyBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQotCi1kaWZmIC0tZ2l0IGEvZ2NjL2NvbmZpZ3VyZSBiL2djYy9jb25maWd1cmUKLWluZGV4
IDA3ODhiN2JmMGI1Li5lYjFhNDViYjI2MyAxMDA3NTUKLS0tLSBhL2djYy9jb25maWd1cmUKLSsr
KyBiL2djYy9jb25maWd1cmUKLUBAIC0yOTM3MCw2ICsyOTM3MCwxNSBAQCBpZiB0ZXN0ICIke3dp
dGhfbG9uZ19kb3VibGVfMTI4K3NldH0iID0gc2V0OyB0aGVuIDoKLSAgIHdpdGh2YWw9JHdpdGhf
bG9uZ19kb3VibGVfMTI4OyBnY2NfY3ZfdGFyZ2V0X2xkYmwxMjg9IiR3aXRoX2xvbmdfZG91Ymxl
XzEyOCIKLSBlbHNlCi0gCi0rICAgICAgY2FzZSAiJHRhcmdldCIgaW4KLSsJczM5MCotKi1saW51
eC1tdXNsKikKLSsJICBnY2NfY3ZfdGFyZ2V0X2xkYmwxMjg9eWVzCi0rCSAgOzsKLSsJcG93ZXJw
YyotKi1saW51eC1tdXNsKikKLSsJICBnY2NfY3ZfdGFyZ2V0X2xkYmwxMjg9bm8KLSsJICA7Owot
KwkqKQotKwotIGlmIHRlc3QgJGdsaWJjX3ZlcnNpb25fbWFqb3IgLWd0IDIgXAotICAgfHwgKCB0
ZXN0ICRnbGliY192ZXJzaW9uX21ham9yIC1lcSAyICZhbXA7JmFtcDsgdGVzdCAkZ2xpYmNfdmVy
c2lvbl9taW5vciAtZ2UgNCApOyB0aGVuIDoKLSAgIGdjY19jdl90YXJnZXRfbGRibDEyOD15ZXMK
LUBAIC0yOTM4MSw2ICsyOTM5MCwxMCBAQCBlbHNlCi0gICAgICAgJmFtcDsmYW1wOyBnY2NfY3Zf
dGFyZ2V0X2xkYmwxMjg9eWVzCi0gCi0gZmkKLSsKLSsJICA7OwotKyAgICAgIGVzYWMKLSsKLSBm
aQotIAotICAgICA7OwotZGlmZiAtLWdpdCBhL2djYy9jb25maWd1cmUuYWMgYi9nY2MvY29uZmln
dXJlLmFjCi1pbmRleCA1YWI1MGZhZTBmMy4uN2ZmZTM1ZWUxYzMgMTAwNjQ0Ci0tLS0gYS9nY2Mv
Y29uZmlndXJlLmFjCi0rKysgYi9nY2MvY29uZmlndXJlLmFjCi1AQCAtNjAzMCwxMyArNjAzMCwy
NSBAQCBjYXNlICIkdGFyZ2V0IiBpbgotICAgICBBQ19BUkdfV0lUSChsb25nLWRvdWJsZS0xMjgs
Ci0gICAgICAgW0FTX0hFTFBfU1RSSU5HKFstLXdpdGgtbG9uZy1kb3VibGUtMTI4XSwKLSAJCSAg
ICAgIFt1c2UgMTI4LWJpdCBsb25nIGRvdWJsZSBieSBkZWZhdWx0XSldLAotLSAgICAgIGdjY19j
dl90YXJnZXRfbGRibDEyOD0iJHdpdGhfbG9uZ19kb3VibGVfMTI4IiwKLSsgICAgICBnY2NfY3Zf
dGFyZ2V0X2xkYmwxMjg9IiR3aXRoX2xvbmdfZG91YmxlXzEyOCIsIFsKLSsgICAgICBjYXNlICIk
dGFyZ2V0IiBpbgotKwlzMzkwKi0qLWxpbnV4LW11c2wqKQotKwkgIGdjY19jdl90YXJnZXRfbGRi
bDEyOD15ZXMKLSsJICA7OwotKwlwb3dlcnBjKi0qLWxpbnV4LW11c2wqKQotKwkgIGdjY19jdl90
YXJnZXRfbGRibDEyOD1ubwotKwkgIDs7Ci0rCSopXQotICAgICAgIFtHQ0NfR0xJQkNfVkVSU0lP
Tl9HVEVfSUZFTFNFKFsyXSwgWzRdLCBbZ2NjX2N2X3RhcmdldF9sZGJsMTI4PXllc10sIFsKLSAg
ICAgICBbZ2NjX2N2X3RhcmdldF9sZGJsMTI4PW5vCi0gICAgICAgZ3JlcCAnXlsgCV0qI1sgCV0q
ZGVmaW5lWyAJXVsgCV0qX19MT05HX0RPVUJMRV9NQVRIX09QVElPTkFMJyBcCi0gICAgICAgICAk
dGFyZ2V0X2hlYWRlcl9kaXIvYml0cy93b3Jkc2l6ZS5oICZndDsgL2Rldi9udWxsIDImZ3Q7JmFt
cDsxIFwKLSAgICAgICAmYW1wOyZhbXA7IGdjY19jdl90YXJnZXRfbGRibDEyOD15ZXMKLS0gICAg
ICBdXSldKQotKyAgICAgIF1dKV0KLSsgICAgICBbCi0rCSAgOzsKLSsgICAgICBlc2FjCi0rICAg
ICAgXSkKLSAgICAgOzsKLSBlc2FjCi0gaWYgdGVzdCB4JGdjY19jdl90YXJnZXRfbGRibDEyOCA9
IHh5ZXM7IHRoZW4KLS0tIAotMi4yNS4xCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9nY2MvZ2NjLTkuMy8wMDM3LUNWRS0yMDE5LTE0MjUwLUNoZWNrLXplcm8tdmFsdWUtaW4t
c2ltcGxlX29iamVjdF9lbGYucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2djYy05
LjMvMDAzNy1DVkUtMjAxOS0xNDI1MC1DaGVjay16ZXJvLXZhbHVlLWluLXNpbXBsZV9vYmplY3Rf
ZWxmLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCBmMjY4YTRlYjU4Li4wMDAw
MDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2MvZ2NjLTkuMy8wMDM3LUNWRS0y
MDE5LTE0MjUwLUNoZWNrLXplcm8tdmFsdWUtaW4tc2ltcGxlX29iamVjdF9lbGYucGF0Y2gKKysr
IC9kZXYvbnVsbApAQCAtMSw0OCArMCwwIEBACi1Gcm9tIGFjNGFmNTgzYmQ1OWY2NjMxNjcxYWQ0
YWJmOTg1Nzk5Y2U0YTUzZDkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiByZ3VlbnRo
ICZsdDtyZ3VlbnRoQDEzOGJjNzVkLTBkMDQtMDQxMC05NjFmLTgyZWU3MmIwNTRhNCZndDsKLURh
dGU6IFRodSwgMjUgSnVsIDIwMTkgMTA6NDY6NTQgKzAwMDAKLVN1YmplY3Q6IFtQQVRDSCAzNy8z
OV0gQ1ZFLTIwMTktMTQyNTA6IENoZWNrIHplcm8gdmFsdWUgaW4KLSBzaW1wbGVfb2JqZWN0X2Vs
Zl9tYXRjaAotCi0yMDE5LTA3LTI1IFJpY2hhcmQgQmllbmVyIDxhIGNsYXNzPSJtb3otdHh0LWxp
bmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzpyZ3VlbnRoZXJAc3VzZS5kZSI+Jmx0O3JndWVudGhl
ckBzdXNlLmRlJmd0OzwvYT4KLQotCVBSIGx0by85MDkyNAotCUJhY2twb3J0IGZyb20gbWFpbmxp
bmUKLQkyMDE5LTA3LTEyICBSZW4gS2ltdXJhICA8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIz
OTZFIiBocmVmPSJtYWlsdG86cmt4MTIwOWRldkBnbWFpbC5jb20iPiZsdDtya3gxMjA5ZGV2QGdt
YWlsLmNvbSZndDs8L2E+Ci0KLQkqIHNpbXBsZS1vYmplY3QtZWxmLmMgKHNpbXBsZV9vYmplY3Rf
ZWxmX21hdGNoKTogQ2hlY2sgemVybyB2YWx1ZQotCXNoc3RybmR4LgotCi1naXQtc3ZuLWlkOiBz
dm4rc3NoOi8vZ2NjLmdudS5vcmcvc3ZuL2djYy9icmFuY2hlcy9nY2MtOS1icmFuY2hAMjczNzkz
IDEzOGJjNzVkLTBkMDQtMDQxMC05NjFmLTgyZWU3MmIwNTRhNAotCi1VcHN0cmVhbS1TdGF0dXM6
IEJhY2twb3J0Ci1BZmZlY3RlczogJmx0OyAgOS4yCi1DVkU6IENWRS0yMDE5LTE0MjUwCi1Ecm9w
cGVkIGNoYW5nZWxvZwotU2lnbmVkLW9mZi1ieTogQXJtaW4gS3VzdGVyIDxhIGNsYXNzPSJtb3ot
dHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzpBa3VzdHJlQG12aXN0YS5jb20iPiZsdDtB
a3VzdHJlQG12aXN0YS5jb20mZ3Q7PC9hPgotLS0tCi0gbGliaWJlcnR5L3NpbXBsZS1vYmplY3Qt
ZWxmLmMgfCA4ICsrKysrKysrCi0gMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQotCi1k
aWZmIC0tZ2l0IGEvbGliaWJlcnR5L3NpbXBsZS1vYmplY3QtZWxmLmMgYi9saWJpYmVydHkvc2lt
cGxlLW9iamVjdC1lbGYuYwotaW5kZXggM2Q0OWYzMzk2MzEuLmMwMGNlYmRiNmM3IDEwMDY0NAot
LS0tIGEvbGliaWJlcnR5L3NpbXBsZS1vYmplY3QtZWxmLmMKLSsrKyBiL2xpYmliZXJ0eS9zaW1w
bGUtb2JqZWN0LWVsZi5jCi1AQCAtNTU3LDYgKzU1NywxNCBAQCBzaW1wbGVfb2JqZWN0X2VsZl9t
YXRjaCAodW5zaWduZWQgY2hhciBoZWFkZXJbU0lNUExFX09CSkVDVF9NQVRDSF9IRUFERVJfTEVO
XSwKLSAgICAgICByZXR1cm4gTlVMTDsKLSAgICAgfQotIAotKyAgaWYgKGVvci0mZ3Q7c2hzdHJu
ZHggPT0gMCkKLSsgICAgewotKyAgICAgICplcnJtc2cgPSAiaW52YWxpZCBFTEYgc2hzdHJuZHgg
PT0gMCI7Ci0rICAgICAgKmVyciA9IDA7Ci0rICAgICAgWERFTEVURSAoZW9yKTsKLSsgICAgICBy
ZXR1cm4gTlVMTDsKLSsgICAgfQotKwotICAgcmV0dXJuICh2b2lkICopIGVvcjsKLSB9Ci0gCi0t
LSAKLTIuMjUuMQotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2djYy05
LjMvMDAzOS1wcm9jZXNzX2FsdF9vcGVyYW5kcy1Eb24tdC1tYXRjaC11c2VyLWRlZmluZWQtcmVn
cy1vLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2djYy9nY2MtOS4zLzAwMzktcHJvY2Vz
c19hbHRfb3BlcmFuZHMtRG9uLXQtbWF0Y2gtdXNlci1kZWZpbmVkLXJlZ3Mtby5wYXRjaApkZWxl
dGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggYjY5MTE0ZDFlNS4uMDAwMDAwMDAwMAotLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2djYy05LjMvMDAzOS1wcm9jZXNzX2FsdF9vcGVyYW5k
cy1Eb24tdC1tYXRjaC11c2VyLWRlZmluZWQtcmVncy1vLnBhdGNoCisrKyAvZGV2L251bGwKQEAg
LTEsMTAwICswLDAgQEAKLUZyb20gZTc1YmNjMmVjNGYxZTdlMDgxY2UxODcxM2YwYTI1OTEzYmEx
NTM0MCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IFZsYWRpbWlyIE1ha2Fyb3YgPGEg
Y2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOnZtYWthcm92QHJlZGhh
dC5jb20iPiZsdDt2bWFrYXJvdkByZWRoYXQuY29tJmd0OzwvYT4KLURhdGU6IFdlZCwgMTAgSnVs
IDIwMTkgMTY6MDc6MTAgKzAwMDAKLVN1YmplY3Q6IFtQQVRDSCAzOS8zOV0gcHJvY2Vzc19hbHRf
b3BlcmFuZHM6IERvbid0IG1hdGNoIHVzZXIgZGVmaW5lZCByZWdzCi0gb25seSBpZiB0aGV5IGFy
ZSBlYXJseSBjbG9iYmVycwotCi1QUiB0YXJnZXQvOTExMDIgKGFhcmNoNjQgSUNFIG9uIExpbnV4
IGtlcm5lbCB3aXRoIC1PcyBzdGFydGluZyB3aXRoIHIyNzAyNjYpCi0KLTIwMTktMDctMTAgIFZs
YWRpbWlyIE1ha2Fyb3YgIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1h
aWx0bzp2bWFrYXJvdkByZWRoYXQuY29tIj4mbHQ7dm1ha2Fyb3ZAcmVkaGF0LmNvbSZndDs8L2E+
Ci0KLQlQUiB0YXJnZXQvOTExMDIKLQkqIGxyYS1jb25zdHJhaW50cy5jIChwcm9jZXNzX2FsdF9v
cGVyYW5kcyk6IERvbid0IG1hdGNoIHVzZXIKLQlkZWZpbmVkIHJlZ3Mgb25seSBpZiB0aGV5IGFy
ZSBlYXJseSBjbG9iYmVycy4KLQotMjAxOS0wNy0xMCAgVmxhZGltaXIgTWFrYXJvdiAgPGEgY2xh
c3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOnZtYWthcm92QHJlZGhhdC5j
b20iPiZsdDt2bWFrYXJvdkByZWRoYXQuY29tJmd0OzwvYT4KLQotCVBSIHRhcmdldC85MTEwMgot
CSogZ2NjLnRhcmdldC9hYXJjaDY0L3ByOTExMDIuYzogTmV3IHRlc3QuCi0KLUZyb20tU1ZOOiBy
MjczMzU3Ci1VcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0IFs8YSBjbGFzcz0ibW96LXR4dC1saW5r
LWZyZWV0ZXh0IiBocmVmPSJodHRwczovL2dpdGh1Yi5jb20vZ2NjLW1pcnJvci9nY2MvY29tbWl0
LzYxM2NhZWQyZmViOWNmYzgxNTgzMDg2NzBiNTlkZjNkMDMxZWM2MjkiPmh0dHBzOi8vZ2l0aHVi
LmNvbS9nY2MtbWlycm9yL2djYy9jb21taXQvNjEzY2FlZDJmZWI5Y2ZjODE1ODMwODY3MGI1OWRm
M2QwMzFlYzYyOTwvYT5dCi1bdGFrb25kcmE6IGRyb3BwZWQgY29uZmxpY3RpbmcgQ2hhbmdlTG9n
IGNoYW5nZXNdCi1TaWduZWQtb2ZmLWJ5OiBUYXJhcyBLb25kcmF0aXVrIDxhIGNsYXNzPSJtb3ot
dHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzp0YWtvbmRyYUBjaXNjby5jb20iPiZsdDt0
YWtvbmRyYUBjaXNjby5jb20mZ3Q7PC9hPgotLS0tCi0gZ2NjL2xyYS1jb25zdHJhaW50cy5jICAg
ICAgICAgICAgICAgICAgICAgIHwgMTcgKysrKysrKysrKy0tLS0KLSBnY2MvdGVzdHN1aXRlL2dj
Yy50YXJnZXQvYWFyY2g2NC9wcjkxMTAyLmMgfCAyNiArKysrKysrKysrKysrKysrKysrKysrCi0g
MiBmaWxlcyBjaGFuZ2VkLCAzOSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQotIGNyZWF0
ZSBtb2RlIDEwMDY0NCBnY2MvdGVzdHN1aXRlL2djYy50YXJnZXQvYWFyY2g2NC9wcjkxMTAyLmMK
LQotZGlmZiAtLWdpdCBhL2djYy9scmEtY29uc3RyYWludHMuYyBiL2djYy9scmEtY29uc3RyYWlu
dHMuYwotaW5kZXggY2YzM2RhODAxM2UuLjYzODJkYmY4NTJiIDEwMDY0NAotLS0tIGEvZ2NjL2xy
YS1jb25zdHJhaW50cy5jCi0rKysgYi9nY2MvbHJhLWNvbnN0cmFpbnRzLmMKLUBAIC0yMTcyLDgg
KzIxNzIsOSBAQCBwcm9jZXNzX2FsdF9vcGVyYW5kcyAoaW50IG9ubHlfYWx0ZXJuYXRpdmUpCi0g
CQkgICAgZWxzZQotIAkJICAgICAgewotIAkJCS8qIE9wZXJhbmRzIGRvbid0IG1hdGNoLiAgSWYg
dGhlIG9wZXJhbmRzIGFyZQotLQkJCSAgIGRpZmZlcmVudCB1c2VyIGRlZmluZWQgZXhwbGljaXQg
aGFyZCByZWdpc3RlcnMsCi0tCQkJICAgdGhlbiB3ZSBjYW5ub3QgbWFrZSB0aGVtIG1hdGNoLiAg
Ki8KLSsJCQkgICBkaWZmZXJlbnQgdXNlciBkZWZpbmVkIGV4cGxpY2l0IGhhcmQKLSsJCQkgICBy
ZWdpc3RlcnMsIHRoZW4gd2UgY2Fubm90IG1ha2UgdGhlbSBtYXRjaAotKwkJCSAgIHdoZW4gb25l
IGlzIGVhcmx5IGNsb2JiZXIgb3BlcmFuZC4gICovCi0gCQkJaWYgKChSRUdfUCAoKmN1cnJfaWQt
Jmd0O29wZXJhbmRfbG9jW25vcF0pCi0gCQkJICAgICB8fCBTVUJSRUdfUCAoKmN1cnJfaWQtJmd0
O29wZXJhbmRfbG9jW25vcF0pKQotIAkJCSAgICAmYW1wOyZhbXA7IChSRUdfUCAoKmN1cnJfaWQt
Jmd0O29wZXJhbmRfbG9jW21dKQotQEAgLTIxOTIsOSArMjE5MywxNyBAQCBwcm9jZXNzX2FsdF9v
cGVyYW5kcyAoaW50IG9ubHlfYWx0ZXJuYXRpdmUpCi0gCQkJCSZhbXA7JmFtcDsgUkVHX1AgKG1f
cmVnKQotIAkJCQkmYW1wOyZhbXA7IEhBUkRfUkVHSVNURVJfUCAobV9yZWcpCi0gCQkJCSZhbXA7
JmFtcDsgUkVHX1VTRVJWQVJfUCAobV9yZWcpKQotLQkJCSAgICAgIGJyZWFrOwotKwkJCSAgICAg
IHsKLSsJCQkJaW50IGk7Ci0rCQkJCQotKwkJCQlmb3IgKGkgPSAwOyBpICZsdDsgZWFybHlfY2xv
YmJlcmVkX3JlZ3NfbnVtOyBpKyspCi0rCQkJCSAgaWYgKG0gPT0gZWFybHlfY2xvYmJlcmVkX25v
cHNbaV0pCi0rCQkJCSAgICBicmVhazsKLSsJCQkJaWYgKGkgJmx0OyBlYXJseV9jbG9iYmVyZWRf
cmVnc19udW0KLSsJCQkJICAgIHx8IGVhcmx5X2Nsb2JiZXJfcCkKLSsJCQkJICBicmVhazsKLSsJ
CQkgICAgICB9Ci0gCQkJICB9Ci0tCi0gCQkJLyogQm90aCBvcGVyYW5kcyBtdXN0IGFsbG93IGEg
cmVsb2FkIHJlZ2lzdGVyLAotIAkJCSAgIG90aGVyd2lzZSB3ZSBjYW5ub3QgbWFrZSB0aGVtIG1h
dGNoLiAgKi8KLSAJCQlpZiAoY3Vycl9hbHRbbV0gPT0gTk9fUkVHUykKLWRpZmYgLS1naXQgYS9n
Y2MvdGVzdHN1aXRlL2djYy50YXJnZXQvYWFyY2g2NC9wcjkxMTAyLmMgYi9nY2MvdGVzdHN1aXRl
L2djYy50YXJnZXQvYWFyY2g2NC9wcjkxMTAyLmMKLW5ldyBmaWxlIG1vZGUgMTAwNjQ0Ci1pbmRl
eCAwMDAwMDAwMDAwMC4uNzBiOTkwNDVhNDgKLS0tLSAvZGV2L251bGwKLSsrKyBiL2djYy90ZXN0
c3VpdGUvZ2NjLnRhcmdldC9hYXJjaDY0L3ByOTExMDIuYwotQEAgLTAsMCArMSwyNiBAQAotKy8q
IFBSIHRhcmdldC85MTEwMiAqLwotKy8qIHsgZGctZG8gY29tcGlsZSB9ICovCi0rLyogeyBkZy1v
cHRpb25zICItTzIiIH0gKi8KLSsKLStpbnQKLStmb28gKGxvbmcgZCwgbG9uZyBsKQotK3sKLSsg
IHJlZ2lzdGVyIGxvbmcgZSBhc20gKCJ4MSIpID0gZDsKLSsgIHJlZ2lzdGVyIGxvbmcgZiBhc20o
IngyIikgPSBsOwotKyAgYXNtICgiIiA6IDogInIiIChlKSwgInIiIChmKSk7Ci0rICByZXR1cm4g
MzsKLSt9Ci0rCi0rc3RydWN0IFQgeyBpbnQgaTsgaW50IGo7IH07Ci0rdW5pb24gUyB7IGxvbmcg
aDsgc3RydWN0IFQgdDsgfTsKLSsKLSt2b2lkCi0rYmFyICh1bmlvbiBTIGIpCi0rewotKyAgd2hp
bGUgKDEpCi0rICAgIHsKLSsgICAgICB1bmlvbiBTIGMgPSBiOwotKyAgICAgIGMudC5qKys7Ci0r
ICAgICAgYi5oID0gZm9vIChiLmgsIGMuaCk7Ci0rICAgIH0KLSt9Ci0tLSAKLTIuMjUuMQotCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2djYy1jcm9zcy1jYW5hZGlhbl85
LjMuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2djYy1jcm9zcy1jYW5hZGlhbl8xMC4x
LmJiCnNpbWlsYXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvZ2NjL2djYy1jcm9zcy1jYW5hZGlhbl85LjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9nY2MvZ2NjLWNyb3NzLWNhbmFkaWFuXzEwLjEuYmIKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9nY2MvZ2NjLWNyb3NzXzkuMy5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9nY2MvZ2NjLWNyb3NzXzEwLjEuYmIKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJlbmFtZSBm
cm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2MvZ2NjLWNyb3NzXzkuMy5iYgpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2djYy9nY2MtY3Jvc3NfMTAuMS5iYgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2djYy9nY2MtY3Jvc3NzZGtfOS4zLmJiIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2djYy9nY2MtY3Jvc3NzZGtfMTAuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDEw
MCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2djYy9nY2MtY3Jvc3NzZGtfOS4z
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2djYy1jcm9zc3Nka18xMC4x
LmJiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2djYy1ydW50aW1lLmlu
YyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2MvZ2NjLXJ1bnRpbWUuaW5jCmluZGV4IGQ5YTRl
NDgzY2MuLjM4YzE2NzI4NzYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2Mv
Z2NjLXJ1bnRpbWUuaW5jCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2MvZ2NjLXJ1bnRp
bWUuaW5jCkBAIC0yNjMsNiArMjYzLDcgQEAgRklMRVNfbGliZ29tcC1kZXYgPSAiXAogICAgICR7
bGliZGlyfS9saWJnb21wKiR7U09MSUJTREVWfSBcCiAgICAgJHtsaWJkaXJ9L2xpYmdvbXAqLmxh
IFwKICAgICAke2xpYmRpcn0vbGliZ29tcC5zcGVjIFwKKyAgICAke2xpYmRpcn0vJHtUQVJHRVRf
U1lTfS8ke0JJTlZ9L2luY2x1ZGUvYWNjX3Byb2YuaCBcCiAgICAgJHtsaWJkaXJ9LyR7VEFSR0VU
X1NZU30vJHtCSU5WfS9pbmNsdWRlL29tcC5oIFwKICAgICAke2xpYmRpcn0vJHtUQVJHRVRfU1lT
fS8ke0JJTlZ9L2luY2x1ZGUvb3BlbmFjYy5oIFwKICIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9nY2MvZ2NjLXJ1bnRpbWVfOS4zLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2djYy9nY2MtcnVudGltZV8xMC4xLmJiCnNpbWlsYXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2djYy1ydW50aW1lXzkuMy5iYgpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2djYy9nY2MtcnVudGltZV8xMC4xLmJiCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2djYy1zYW5pdGl6ZXJzXzkuMy5iYiBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9nY2MvZ2NjLXNhbml0aXplcnNfMTAuMS5iYgpzaW1pbGFyaXR5IGlu
ZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2djYy9nY2Mtc2FuaXRp
emVyc185LjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2MvZ2NjLXNhbml0
aXplcnNfMTAuMS5iYgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2djYy9nY2Mt
c291cmNlXzkuMy5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2MvZ2NjLXNvdXJjZV8xMC4x
LmJiCnNpbWlsYXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvZ2NjL2djYy1zb3VyY2VfOS4zLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
Z2NjL2djYy1zb3VyY2VfMTAuMS5iYgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2djYy9nY2MtdGFyZ2V0LmluYyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2MvZ2NjLXRhcmdl
dC5pbmMKaW5kZXggNjI2M2U4MTQ5Ny4uMWUyNWRhZDg2YiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2djYy9nY2MtdGFyZ2V0LmluYworKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvZ2NjL2djYy10YXJnZXQuaW5jCkBAIC00Miw2ICs0Miw3IEBAIFBBQ0tBR0VTID0gIlwKIAog
RklMRVNfJHtQTn0gPSAiXAogICAgICR7YmluZGlyfS8ke1RBUkdFVF9QUkVGSVh9Z2NjKiBcCisg
ICAgJHtiaW5kaXJ9LyR7VEFSR0VUX1BSRUZJWH1sdG8qIFwKICAgICAke2xpYmV4ZWNkaXJ9L2dj
Yy8ke1RBUkdFVF9TWVN9LyR7QklOVn0vY29sbGVjdDIqIFwKICAgICAke2xpYmV4ZWNkaXJ9L2dj
Yy8ke1RBUkdFVF9TWVN9LyR7QklOVn0vY2MxcGx1cyBcCiAgICAgJHtsaWJleGVjZGlyfS9nY2Mv
JHtUQVJHRVRfU1lTfS8ke0JJTlZ9L2x0byogXApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2djYy9nY2NfOS4zLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2djYy9nY2NfMTAu
MS5iYgpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2djYy9nY2NfOS4zLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2dj
Y18xMC4xLmJiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2xpYmdjYy1p
bml0aWFsXzkuMy5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2MvbGliZ2NjLWluaXRpYWxf
MTAuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2djYy9saWJnY2MtaW5pdGlhbF85LjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9nY2MvbGliZ2NjLWluaXRpYWxfMTAuMS5iYgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2djYy9saWJnY2NfOS4zLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dj
Yy9saWJnY2NfMTAuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2djYy9saWJnY2NfOS4zLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvZ2NjL2xpYmdjY18xMC4xLmJiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvZ2NjL2xpYmdmb3J0cmFuXzkuMy5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2Mv
bGliZ2ZvcnRyYW5fMTAuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2djYy9saWJnZm9ydHJhbl85LjMuYmIKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9nY2MvbGliZ2ZvcnRyYW5fMTAuMS5iYgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLXN1cHBvcnQvaWN1L2ljdS9maWx0ZXIuanNvbiBiL21ldGEvcmVjaXBlcy1zdXBw
b3J0L2ljdS9pY3UvZmlsdGVyLmpzb24KZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDJj
NjNjMDg1MTAuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvaWN1L2ljdS9m
aWx0ZXIuanNvbgorKysgL2Rldi9udWxsCkBAIC0xLDIgKzAsMCBAQAotewotfQo8L3ByZT4KICAg
ICAgPGJyPgogICAgICA8ZmllbGRzZXQgY2xhc3M9Im1pbWVBdHRhY2htZW50SGVhZGVyIj48L2Zp
ZWxkc2V0PgogICAgICA8cHJlIGNsYXNzPSJtb3otcXVvdGUtcHJlIiB3cmFwPSIiPgo8L3ByZT4K
ICAgIDwvYmxvY2txdW90ZT4KICAgIDxwPjxicj4KICAgIDwvcD4KICAgIDxwcmUgY2xhc3M9Im1v
ei1zaWduYXR1cmUiIGNvbHM9IjcyIj4tLSAKS2FpIEthbmcKV2luZCBSaXZlciBMaW51eDwvcHJl
PgogIDwvYm9keT4KPC9odG1sPgo=

--------------45B96BB3D28EAB9EA02D9BAD--
