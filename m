Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f169.google.com (mail-qt0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id 7910660111
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jul 2016 14:37:13 +0000 (UTC)
Received: by mail-qt0-f169.google.com with SMTP id m2so58656003qtd.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jul 2016 07:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=rIKcQrkwPRehJiFTKU9aqmf2RMUCEjOwRTCZ5VsYZ/Y=;
	b=UamPzrtb066cBaBRx7DJIcjv97bLsRhFwZ1AJ1uGe8yn5+coHi6QWRXN0ZqFWLS2uN
	GMB727G/k3t6O7sSJHiCaxCl7BPkHto7634xL2E4OD7PLO6Wqb7lf1VcXcG33vZHyuLa
	0ojw03gdmcCLQTLCzmTXkkGTsLHGLH6ozb13VgLMQo0+JigURu1XcH7ZCsOZAmh0kco8
	+zI60Vzhmd3V/Z680xHqRcb9dtc6BBtUBAVRflwUlwu2d8DGPj8kSS9bQy9um8tazGef
	hHtD2t3wCbscK9xbf8fESInGrAzzLWu80cO6N/e1ZdvPhcuI2+hIeCG8kDL9pl/OImBU
	Hgrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=rIKcQrkwPRehJiFTKU9aqmf2RMUCEjOwRTCZ5VsYZ/Y=;
	b=WbozPypQi3UO5aSMaOc/3LYl7Vek41L90t1jZvEeSRxwLoOceWh8k03RR0ElJI2dvq
	ip2eIoAm+FVVzA02sSgtJUn0ktRhGQ3gmmPIx8omkCY0pN2f7houmVYw4Urrhvhq8fvK
	E8WoLnKRzttFKdqYORrijXvdhgCcPdio3b8VnGUwvLxaOKqco7f6lC7sQVrpzAyo4d0N
	EJtGzGXou3UiPgj2UKmrcyQYiQhoiOif8W7fwxB23wBrTSCixxpQL9PNK46vIMHOJeGn
	jqA0IvEzd+flXS4c5Tw00rOAlxrwngBxI9vyRRf2BQW571UlR8py532ZIsBnr5VdPOtS
	vcBw==
X-Gm-Message-State: ALyK8tLVfusf0WIiFHt7URqcaKFdIgGYXcJQmypal31BKTpR319T/fssErTBoyZw3WPRty5vCaru99/qQZetVQ==
X-Received: by 10.200.52.197 with SMTP id x5mr6521102qtb.41.1467383831782;
	Fri, 01 Jul 2016 07:37:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.214.83 with HTTP; Fri, 1 Jul 2016 07:36:42 -0700 (PDT)
In-Reply-To: <1467376136-19506-2-git-send-email-ross.burton@intel.com>
References: <1467376136-19506-1-git-send-email-ross.burton@intel.com>
	<1467376136-19506-2-git-send-email-ross.burton@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 1 Jul 2016 07:36:42 -0700
Message-ID: <CAMKF1spyK+oAN03A6FNM-nqjoU53wDDYnQiVr6J4+956xUmsBQ@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] gcc: remove GCC 4.9
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Jul 2016 14:37:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

I am ok with this patch. If someone intends to keep using gcc 4.9 with
2.2, please speak up.

On Fri, Jul 1, 2016 at 5:28 AM, Ross Burton <ross.burton@intel.com> wrote:
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-devtools/gcc/gcc-4.9.inc              |  141 -
>  .../0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch     |   42 -
>  .../gcc/gcc-4.9/0002-uclibc-conf.patch             |   53 -
>  .../0003-gcc-uclibc-locale-ctype_touplow_t.patch   |   87 -
>  .../gcc/gcc-4.9/0004-uclibc-locale.patch           | 2862 --------------=
------
>  .../gcc/gcc-4.9/0005-uclibc-locale-no__x.patch     |  257 --
>  .../gcc/gcc-4.9/0006-uclibc-locale-wchar_fix.patch |   68 -
>  .../gcc/gcc-4.9/0007-uclibc-locale-update.patch    |  542 ----
>  .../gcc/gcc-4.9/0008-missing-execinfo_h.patch      |   28 -
>  .../gcc/gcc-4.9/0009-c99-snprintf.patch            |   28 -
>  .../gcc/gcc-4.9/0010-c99-complex-ugly-hack.patch   |   29 -
>  .../gcc/gcc-4.9/0011-index_macro.patch             |   44 -
>  .../gcc/gcc-4.9/0013-libstdc-namespace.patch       |   54 -
>  .../gcc/gcc-4.9/0014-sh-pr24836.patch              |   45 -
>  ...GET_ENDIAN_OPTION-for-determining-MULTILI.patch |   47 -
>  .../0016-gcc-poison-system-directories.patch       |  190 --
>  .../gcc/gcc-4.9/0017-gcc-poison-dir-extend.patch   |   39 -
>  .../0018-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch |   73 -
>  .../gcc/gcc-4.9/0019-64-bit-multilib-hack.patch    |   82 -
>  .../gcc/gcc-4.9/0020-optional-libstdc.patch        |   98 -
>  ...0021-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch |   59 -
>  .../gcc/gcc-4.9/0022-COLLECT_GCC_OPTIONS.patch     |   38 -
>  ...efaults.h-in-B-instead-of-S-and-t-oe-in-B.patch |   96 -
>  .../gcc-4.9/0025-fortran-cross-compile-hack.patch  |   46 -
>  .../gcc/gcc-4.9/0026-libgcc-sjlj-check.patch       |   74 -
>  .../gcc/gcc-4.9/0027-cpp-honor-sysroot.patch       |   54 -
>  .../gcc-4.9/0028-MIPS64-Default-to-N64-ABI.patch   |   31 -
>  ...C_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch |  228 --
>  ...0030-gcc-Fix-argument-list-too-long-error.patch |   40 -
>  .../gcc/gcc-4.9/0031-Disable-sdt.patch             |  113 -
>  .../gcc/gcc-4.9/0032-libtool.patch                 |   42 -
>  ...4-pass-fix-v4bx-to-linker-to-support-EABI.patch |   40 -
>  ...tilib-config-files-from-B-instead-of-usin.patch |  102 -
>  .../gcc/gcc-4.9/0040-fix-g++-sysroot.patch         |   40 -
>  .../gcc/gcc-4.9/0041-libtool-avoid-libdir.patch    |   19 -
>  meta/recipes-devtools/gcc/gcc-4.9/0043-cpp.patch   |   40 -
>  .../gcc/gcc-4.9/0044-gengtypes.patch               |   97 -
>  .../gcc/gcc-4.9/0046-libatomic-deptracking.patch   |   41 -
>  .../gcc/gcc-4.9/0047-repomembug.patch              |   53 -
>  ...AltiVec-generation-on-powepc-linux-target.patch |   42 -
>  ...Use-dbx_reg_number-for-spanning-registers.patch |   80 -
>  .../gcc/gcc-4.9/0051-eabispe.patch                 |   23 -
>  ...hook-to-override-DWARF2-frame-register-si.patch |  138 -
>  ...fault-from-calling-free-on-non-malloc-d-a.patch |   66 -
>  ...Makefile.in-fix-parallel-building-failure.patch |   61 -
>  .../gcc-4.9/0055-dwarf-reg-processing-helper.patch |  148 -
>  .../0056-define-default-cfa-register-mapping.patch |   75 -
>  .../gcc/gcc-4.9/0057-aarch64-config.patch          |   32 -
>  .../gcc/gcc-4.9/0058-gcc-r212171.patch             |  113 -
>  .../0059-gcc-PR-rtl-optimization-63348.patch       |   59 -
>  ...e500-double-in-SPE_SIMD_REGNO_P-registers.patch |   55 -
>  .../gcc/gcc-4.9/0061-target-gcc-includedir.patch   |   81 -
>  ...IBS_DIR-replacement-instead-of-hardcoding.patch |   24 -
>  .../gcc/gcc-4.9/0063-nativesdk-gcc-support.patch   |  198 --
>  .../0064-handle-target-sysroot-multilib.patch      |   88 -
>  ...-gcc-483-universal-initializer-no-warning.patch |  107 -
>  .../gcc/gcc-4.9/0066-cxxflags-for-build.patch      |  123 -
>  .../gcc/gcc-4.9/0067-fix-arm-thumb.patch           |   39 -
>  .../gcc/gcc-4.9/0067-gcc-musl-support.patch        |  267 --
>  .../gcc/gcc-4.9/0068-musl-dynamic-linker.patch     |  205 --
>  .../gcc/gcc-4.9/0069-musl-no-fixincludes.patch     |   21 -
>  .../gcc/gcc-4.9/0070-libstdc-musl.patch            |   32 -
>  ...ug-prefix-map-in-producer-string-by-Danie.patch |   31 -
>  .../gcc-4.9/0072-support-ffile-prefix-map.patch    |  284 --
>  ...ug-prefix-map-to-replace-ffile-prefix-map.patch |   43 -
>  ...prefix-map-support-to-remap-relative-path.patch |   51 -
>  .../gcc/gcc-4.9/0075-libgcc-use-ldflags.patch      |   16 -
>  .../gcc/gcc-4.9/0076-remove-prototypes-cfns.patch  |  153 --
>  .../recipes-devtools/gcc/gcc-cross-canadian_4.9.bb |    5 -
>  meta/recipes-devtools/gcc/gcc-cross-initial_4.9.bb |    2 -
>  meta/recipes-devtools/gcc/gcc-cross_4.9.bb         |    3 -
>  .../gcc/gcc-crosssdk-initial_4.9.bb                |    3 -
>  meta/recipes-devtools/gcc/gcc-crosssdk_4.9.bb      |    2 -
>  meta/recipes-devtools/gcc/gcc-runtime_4.9.bb       |    3 -
>  meta/recipes-devtools/gcc/gcc-sanitizers_4.9.bb    |    2 -
>  meta/recipes-devtools/gcc/gcc-source_4.9.bb        |    4 -
>  meta/recipes-devtools/gcc/gcc_4.9.bb               |   13 -
>  meta/recipes-devtools/gcc/libgcc-initial_4.9.bb    |    2 -
>  meta/recipes-devtools/gcc/libgcc_4.9.bb            |    2 -
>  meta/recipes-devtools/gcc/libgfortran_4.9.bb       |    3 -
>  80 files changed, 8761 deletions(-)
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-4.9.inc
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0001-gcc-4.3.1-ARCH=
_FLAGS_FOR_TARGET.patch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0002-uclibc-conf.pa=
tch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0003-gcc-uclibc-loc=
ale-ctype_touplow_t.patch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0004-uclibc-locale.=
patch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0005-uclibc-locale-=
no__x.patch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0006-uclibc-locale-=
wchar_fix.patch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0007-uclibc-locale-=
update.patch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0008-missing-execin=
fo_h.patch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0009-c99-snprintf.p=
atch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0010-c99-complex-ug=
ly-hack.patch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0011-index_macro.pa=
tch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0013-libstdc-namesp=
ace.patch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0014-sh-pr24836.pat=
ch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0015-arm-Use-TARGET=
_ENDIAN_OPTION-for-determining-MULTILI.patch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0016-gcc-poison-sys=
tem-directories.patch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0017-gcc-poison-dir=
-extend.patch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0018-gcc-4.3.3-SYSR=
OOT_CFLAGS_FOR_TARGET.patch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0019-64-bit-multili=
b-hack.patch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0020-optional-libst=
dc.patch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0021-gcc-disable-MA=
SK_RELAX_PIC_CALLS-bit.patch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0022-COLLECT_GCC_OP=
TIONS.patch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0023-Use-the-defaul=
ts.h-in-B-instead-of-S-and-t-oe-in-B.patch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0025-fortran-cross-=
compile-hack.patch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0026-libgcc-sjlj-ch=
eck.patch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0027-cpp-honor-sysr=
oot.patch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0028-MIPS64-Default=
-to-N64-ABI.patch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0029-Define-GLIBC_D=
YNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0030-gcc-Fix-argume=
nt-list-too-long-error.patch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0031-Disable-sdt.pa=
tch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0032-libtool.patch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0033-gcc-armv4-pass=
-fix-v4bx-to-linker-to-support-EABI.patch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0034-Use-the-multil=
ib-config-files-from-B-instead-of-usin.patch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0040-fix-g++-sysroo=
t.patch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0041-libtool-avoid-=
libdir.patch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0043-cpp.patch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0044-gengtypes.patc=
h
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0046-libatomic-dept=
racking.patch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0047-repomembug.pat=
ch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0049-Enable-SPE-Alt=
iVec-generation-on-powepc-linux-target.patch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0050-Revert-Use-dbx=
_reg_number-for-spanning-registers.patch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0051-eabispe.patch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0052-Add-target-hoo=
k-to-override-DWARF2-frame-register-si.patch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0053-gcc-fix-segfau=
lt-from-calling-free-on-non-malloc-d-a.patch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0054-gcc-Makefile.i=
n-fix-parallel-building-failure.patch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0055-dwarf-reg-proc=
essing-helper.patch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0056-define-default=
-cfa-register-mapping.patch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0057-aarch64-config=
.patch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0058-gcc-r212171.pa=
tch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0059-gcc-PR-rtl-opt=
imization-63348.patch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0060-Only-allow-e50=
0-double-in-SPE_SIMD_REGNO_P-registers.patch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0061-target-gcc-inc=
ludedir.patch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0062-Use-SYSTEMLIBS=
_DIR-replacement-instead-of-hardcoding.patch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0063-nativesdk-gcc-=
support.patch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0064-handle-target-=
sysroot-multilib.patch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0065-gcc-483-univer=
sal-initializer-no-warning.patch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0066-cxxflags-for-b=
uild.patch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0067-fix-arm-thumb.=
patch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0067-gcc-musl-suppo=
rt.patch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0068-musl-dynamic-l=
inker.patch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0069-musl-no-fixinc=
ludes.patch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0070-libstdc-musl.p=
atch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0071-Ignore-fdebug-=
prefix-map-in-producer-string-by-Danie.patch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0072-support-ffile-=
prefix-map.patch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0073-Reuse-fdebug-p=
refix-map-to-replace-ffile-prefix-map.patch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0074-fdebug-prefix-=
map-support-to-remap-relative-path.patch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0075-libgcc-use-ldf=
lags.patch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0076-remove-prototy=
pes-cfns.patch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-cross-canadian_4.9.bb
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-cross-initial_4.9.bb
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-cross_4.9.bb
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-crosssdk-initial_4.9.bb
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-crosssdk_4.9.bb
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-runtime_4.9.bb
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-sanitizers_4.9.bb
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-source_4.9.bb
>  delete mode 100644 meta/recipes-devtools/gcc/gcc_4.9.bb
>  delete mode 100644 meta/recipes-devtools/gcc/libgcc-initial_4.9.bb
>  delete mode 100644 meta/recipes-devtools/gcc/libgcc_4.9.bb
>  delete mode 100644 meta/recipes-devtools/gcc/libgfortran_4.9.bb
>
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9.inc b/meta/recipes-devtool=
s/gcc/gcc-4.9.inc
> deleted file mode 100644
> index 64701c8..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.9.inc
> +++ /dev/null
> @@ -1,141 +0,0 @@
> -require gcc-common.inc
> -
> -# Third digit in PV should be incremented after a minor release
> -
> -PV =3D "4.9.3"
> -
> -# BINV should be incremented to a revision after a minor gcc release
> -
> -BINV =3D "4.9.3"
> -
> -FILESEXTRAPATHS =3D. "${FILE_DIRNAME}/gcc-4.9:"
> -
> -DEPENDS =3D+ "mpfr gmp libmpc zlib"
> -NATIVEDEPS =3D "mpfr-native gmp-native libmpc-native zlib-native"
> -
> -LICENSE =3D "GPL-3.0-with-GCC-exception & GPLv3"
> -
> -LIC_FILES_CHKSUM =3D "\
> -    file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6552 \
> -    file://COPYING3;md5=3Dd32239bcb673463ab874e80d47fae504 \
> -    file://COPYING3.LIB;md5=3D6a6a8e020838b23406c81b19c1d46df6 \
> -    file://COPYING.LIB;md5=3D2d5025d4aa3495befef8f17206a5b0a1 \
> -    file://COPYING.RUNTIME;md5=3Dfe60d87048567d4fe8c8a0ed2448bcc8 \
> -"
> -
> -SRC_URI =3D "\
> -    ${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
> -    file://0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
> -    file://0002-uclibc-conf.patch \
> -    file://0003-gcc-uclibc-locale-ctype_touplow_t.patch \
> -    file://0004-uclibc-locale.patch \
> -    file://0005-uclibc-locale-no__x.patch \
> -    file://0006-uclibc-locale-wchar_fix.patch \
> -    file://0007-uclibc-locale-update.patch \
> -    file://0008-missing-execinfo_h.patch \
> -    file://0009-c99-snprintf.patch \
> -    file://0010-c99-complex-ugly-hack.patch \
> -    file://0011-index_macro.patch \
> -    file://0013-libstdc-namespace.patch \
> -    file://0014-sh-pr24836.patch \
> -    file://0015-arm-Use-TARGET_ENDIAN_OPTION-for-determining-MULTILI.pat=
ch \
> -    file://0016-gcc-poison-system-directories.patch \
> -    file://0017-gcc-poison-dir-extend.patch \
> -    file://0018-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch \
> -    file://0019-64-bit-multilib-hack.patch \
> -    file://0020-optional-libstdc.patch \
> -    file://0021-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch \
> -    file://0022-COLLECT_GCC_OPTIONS.patch \
> -    file://0023-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch=
 \
> -    file://0025-fortran-cross-compile-hack.patch \
> -    file://0026-libgcc-sjlj-check.patch \
> -    file://0027-cpp-honor-sysroot.patch \
> -    file://0028-MIPS64-Default-to-N64-ABI.patch \
> -    file://0029-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.pat=
ch \
> -    file://0030-gcc-Fix-argument-list-too-long-error.patch \
> -    file://0031-Disable-sdt.patch \
> -    file://0032-libtool.patch \
> -    file://0033-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch =
\
> -    file://0034-Use-the-multilib-config-files-from-B-instead-of-usin.pat=
ch \
> -    file://0040-fix-g++-sysroot.patch \
> -    file://0041-libtool-avoid-libdir.patch \
> -    file://0043-cpp.patch \
> -    file://0044-gengtypes.patch \
> -    file://0046-libatomic-deptracking.patch \
> -    file://0047-repomembug.patch \
> -    file://0049-Enable-SPE-AltiVec-generation-on-powepc-linux-target.pat=
ch \
> -    file://0050-Revert-Use-dbx_reg_number-for-spanning-registers.patch \
> -    file://0051-eabispe.patch \
> -    file://0052-Add-target-hook-to-override-DWARF2-frame-register-si.pat=
ch \
> -    file://0053-gcc-fix-segfault-from-calling-free-on-non-malloc-d-a.pat=
ch \
> -    file://0054-gcc-Makefile.in-fix-parallel-building-failure.patch \
> -    file://0055-dwarf-reg-processing-helper.patch \
> -    file://0056-define-default-cfa-register-mapping.patch \
> -    file://0057-aarch64-config.patch \
> -    file://0058-gcc-r212171.patch \
> -    file://0059-gcc-PR-rtl-optimization-63348.patch \
> -    file://0060-Only-allow-e500-double-in-SPE_SIMD_REGNO_P-registers.pat=
ch \
> -    file://0061-target-gcc-includedir.patch \
> -    file://0062-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.pat=
ch \
> -    file://0063-nativesdk-gcc-support.patch \
> -    file://0064-handle-target-sysroot-multilib.patch \
> -    file://0065-gcc-483-universal-initializer-no-warning.patch \
> -    file://0066-cxxflags-for-build.patch \
> -    file://0067-fix-arm-thumb.patch \
> -    file://0067-gcc-musl-support.patch \
> -    file://0068-musl-dynamic-linker.patch \
> -    file://0069-musl-no-fixincludes.patch \
> -    file://0070-libstdc-musl.patch \
> -    file://0071-Ignore-fdebug-prefix-map-in-producer-string-by-Danie.pat=
ch \
> -    file://0072-support-ffile-prefix-map.patch \
> -    file://0073-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patc=
h \
> -    file://0074-fdebug-prefix-map-support-to-remap-relative-path.patch \
> -    file://0075-libgcc-use-ldflags.patch \
> -    file://0076-remove-prototypes-cfns.patch \
> -"
> -SRC_URI[md5sum] =3D "6f831b4d251872736e8e9cc09746f327"
> -SRC_URI[sha256sum] =3D "2332b2a5a321b57508b9031354a8503af6fdfb868b8c1748=
d33028d100a8b67e"
> -
> -UPSTREAM_CHECK_REGEX =3D "gcc-(?P<pver>4\.9\.\d+).tar"
> -
> -S =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
> -B =3D "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
> -
> -# Language Overrides
> -FORTRAN =3D ""
> -JAVA =3D ""
> -
> -LTO =3D "--enable-lto"
> -
> -EXTRA_OECONF_BASE =3D "\
> -    ${LTO} \
> -    --enable-libssp \
> -    --disable-bootstrap \
> -    --disable-libmudflap \
> -    --with-system-zlib \
> -    --with-linker-hash-style=3D${LINKER_HASH_STYLE} \
> -    --enable-linker-build-id \
> -    --with-ppl=3Dno \
> -    --with-cloog=3Dno \
> -    --enable-checking=3Drelease \
> -    --enable-cheaders=3Dc_global \
> -"
> -
> -EXTRA_OECONF_INITIAL =3D "\
> -    --disable-libmudflap \
> -    --disable-libgomp \
> -    --disable-libssp \
> -    --disable-libquadmath \
> -    --with-system-zlib \
> -    --disable-lto \
> -    --disable-plugin \
> -    --enable-decimal-float=3Dno \
> -"
> -
> -EXTRA_OECONF_append_libc-uclibc =3D " --disable-decimal-float "
> -
> -EXTRA_OECONF_PATHS =3D "\
> -    --with-gxx-include-dir=3D/not/exist{target_includedir}/c++/${BINV} \
> -    --with-sysroot=3D/not/exist \
> -    --with-build-sysroot=3D${STAGING_DIR_TARGET} \
> -"
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0001-gcc-4.3.1-ARCH_FLAGS_=
FOR_TARGET.patch b/meta/recipes-devtools/gcc/gcc-4.9/0001-gcc-4.3.1-ARCH_FL=
AGS_FOR_TARGET.patch
> deleted file mode 100644
> index e588011..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.9/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TAR=
GET.patch
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -From bf3d96ae58fa180b8b468d25dc2e0209daca2751 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 29 Mar 2013 08:37:11 +0400
> -Subject: [PATCH 01/35] gcc-4.3.1: ARCH_FLAGS_FOR_TARGET
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Upstream-Status: Inappropriate [embedded specific]
> ----
> - configure    |    2 +-
> - configure.ac |    2 +-
> - 2 files changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/configure b/configure
> -index d809535..1b76c90 100755
> ---- a/configure
> -+++ b/configure
> -@@ -7439,7 +7439,7 @@ fi
> - # for target_alias and gcc doesn't manage it consistently.
> - target_configargs=3D"--cache-file=3D./config.cache ${target_configargs}=
"
> -
> --FLAGS_FOR_TARGET=3D
> -+FLAGS_FOR_TARGET=3D"$ARCH_FLAGS_FOR_TARGET"
> - case " $target_configdirs " in
> -  *" newlib "*)
> -   case " $target_configargs " in
> -diff --git a/configure.ac b/configure.ac
> -index 48ec1aa..89d1d3f 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -2873,7 +2873,7 @@ fi
> - # for target_alias and gcc doesn't manage it consistently.
> - target_configargs=3D"--cache-file=3D./config.cache ${target_configargs}=
"
> -
> --FLAGS_FOR_TARGET=3D
> -+FLAGS_FOR_TARGET=3D"$ARCH_FLAGS_FOR_TARGET"
> - case " $target_configdirs " in
> -  *" newlib "*)
> -   case " $target_configargs " in
> ---
> -1.7.10.4
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0002-uclibc-conf.patch b/m=
eta/recipes-devtools/gcc/gcc-4.9/0002-uclibc-conf.patch
> deleted file mode 100644
> index dda3b10..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.9/0002-uclibc-conf.patch
> +++ /dev/null
> @@ -1,53 +0,0 @@
> -From d030973c872c00d916921d84deee0af2c0d38081 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 29 Mar 2013 08:38:25 +0400
> -Subject: [PATCH 02/35] uclibc-conf
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Upstream-Status: Pending
> ----
> - contrib/regression/objs-gcc.sh |    4 ++++
> - libjava/classpath/ltconfig     |    4 ++--
> - 2 files changed, 6 insertions(+), 2 deletions(-)
> -
> -diff --git a/contrib/regression/objs-gcc.sh b/contrib/regression/objs-gc=
c.sh
> -index 60b0497..6dc7ead 100755
> ---- a/contrib/regression/objs-gcc.sh
> -+++ b/contrib/regression/objs-gcc.sh
> -@@ -106,6 +106,10 @@ if [ $H_REAL_TARGET =3D $H_REAL_HOST -a $H_REAL_TAR=
GET =3D i686-pc-linux-gnu ]
> -  then
> -   make all-gdb all-dejagnu all-ld || exit 1
> -   make install-gdb install-dejagnu install-ld || exit 1
> -+elif [ $H_REAL_TARGET =3D $H_REAL_HOST -a $H_REAL_TARGET =3D i686-pc-li=
nux-uclibc ]
> -+ then
> -+  make all-gdb all-dejagnu all-ld || exit 1
> -+  make install-gdb install-dejagnu install-ld || exit 1
> - elif [ $H_REAL_TARGET =3D $H_REAL_HOST ] ; then
> -   make bootstrap || exit 1
> -   make install || exit 1
> -diff --git a/libjava/classpath/ltconfig b/libjava/classpath/ltconfig
> -index 743d951..ae4ea60 100755
> ---- a/libjava/classpath/ltconfig
> -+++ b/libjava/classpath/ltconfig
> -@@ -603,7 +603,7 @@ host_os=3D`echo $host | sed 's/^\([^-]*\)-\([^-]*\)-=
\(.*\)$/\3/'`
> -
> - # Transform linux* to *-*-linux-gnu*, to support old configure scripts.
> - case $host_os in
> --linux-gnu*) ;;
> -+linux-gnu*|linux-uclibc*) ;;
> - linux*) host=3D`echo $host | sed 's/^\(.*-.*-linux\)\(.*\)$/\1-gnu\2/'`
> - esac
> -
> -@@ -1247,7 +1247,7 @@ linux-gnuoldld* | linux-gnuaout* | linux-gnucoff*)
> -   ;;
> -
> - # This must be Linux ELF.
> --linux-gnu*)
> -+linux*)
> -   version_type=3Dlinux
> -   need_lib_prefix=3Dno
> -   need_version=3Dno
> ---
> -1.7.10.4
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0003-gcc-uclibc-locale-cty=
pe_touplow_t.patch b/meta/recipes-devtools/gcc/gcc-4.9/0003-gcc-uclibc-loca=
le-ctype_touplow_t.patch
> deleted file mode 100644
> index 7098e99..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.9/0003-gcc-uclibc-locale-ctype_toup=
low_t.patch
> +++ /dev/null
> @@ -1,87 +0,0 @@
> -From d2d9dd756c4356d14dd7ae003856344cb4f37985 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 29 Mar 2013 08:40:12 +0400
> -Subject: [PATCH 03/35] gcc-uclibc-locale-ctype_touplow_t
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Upstream-Status: Pending
> ----
> - libstdc++-v3/config/locale/generic/c_locale.cc |    5 +++++
> - libstdc++-v3/config/locale/generic/c_locale.h  |    9 +++++++++
> - libstdc++-v3/config/os/gnu-linux/ctype_base.h  |    9 +++++++++
> - 3 files changed, 23 insertions(+)
> -
> -diff --git a/libstdc++-v3/config/locale/generic/c_locale.cc b/libstdc++-=
v3/config/locale/generic/c_locale.cc
> -index 0d309a5..f2f1e1f 100644
> ---- a/libstdc++-v3/config/locale/generic/c_locale.cc
> -+++ b/libstdc++-v3/config/locale/generic/c_locale.cc
> -@@ -263,5 +263,10 @@ _GLIBCXX_END_NAMESPACE_VERSION
> - #ifdef _GLIBCXX_LONG_DOUBLE_COMPAT
> - #define _GLIBCXX_LDBL_COMPAT(dbl, ldbl) \
> -   extern "C" void ldbl (void) __attribute__ ((alias (#dbl)))
> -+#ifdef __UCLIBC__
> -+// This is because __c_locale is of type __ctype_touplow_t* which is sh=
ort on uclibc. for glibc its int*
> -+_GLIBCXX_LDBL_COMPAT(_ZSt14__convert_to_vIdEvPKcRT_RSt12_Ios_IostateRKP=
s, _ZSt14__convert_to_vIeEvPKcRT_RSt12_Ios_IostateRKPs);
> -+#else
> - _GLIBCXX_LDBL_COMPAT(_ZSt14__convert_to_vIdEvPKcRT_RSt12_Ios_IostateRKP=
i, _ZSt14__convert_to_vIeEvPKcRT_RSt12_Ios_IostateRKPi);
> -+#endif
> - #endif // _GLIBCXX_LONG_DOUBLE_COMPAT
> -diff --git a/libstdc++-v3/config/locale/generic/c_locale.h b/libstdc++-v=
3/config/locale/generic/c_locale.h
> -index b5fd989..3da9a5d 100644
> ---- a/libstdc++-v3/config/locale/generic/c_locale.h
> -+++ b/libstdc++-v3/config/locale/generic/c_locale.h
> -@@ -40,13 +40,22 @@
> -
> - #include <clocale>
> -
> -+#ifdef __UCLIBC__
> -+#include <features.h>
> -+#include <ctype.h>
> -+#endif
> -+
> - #define _GLIBCXX_NUM_CATEGORIES 0
> -
> - namespace std _GLIBCXX_VISIBILITY(default)
> - {
> - _GLIBCXX_BEGIN_NAMESPACE_VERSION
> -
> -+#ifdef __UCLIBC__
> -+  typedef __ctype_touplow_t*  __c_locale;
> -+#else
> -   typedef int*                        __c_locale;
> -+#endif
> -
> -   // Convert numeric value of type double and long double to string and
> -   // return length of string.  If vsnprintf is available use it, otherw=
ise
> -diff --git a/libstdc++-v3/config/os/gnu-linux/ctype_base.h b/libstdc++-v=
3/config/os/gnu-linux/ctype_base.h
> -index 2d8e978..14eb08f 100644
> ---- a/libstdc++-v3/config/os/gnu-linux/ctype_base.h
> -+++ b/libstdc++-v3/config/os/gnu-linux/ctype_base.h
> -@@ -33,6 +33,11 @@
> -
> - // Information as gleaned from /usr/include/ctype.h
> -
> -+#ifdef __UCLIBC__
> -+#include <features.h>
> -+#include <ctype.h>
> -+#endif
> -+
> - namespace std _GLIBCXX_VISIBILITY(default)
> - {
> - _GLIBCXX_BEGIN_NAMESPACE_VERSION
> -@@ -41,7 +46,11 @@ _GLIBCXX_BEGIN_NAMESPACE_VERSION
> -   struct ctype_base
> -   {
> -     // Non-standard typedefs.
> -+#ifdef __UCLIBC__
> -+    typedef const __ctype_touplow_t*  __to_type;
> -+#else
> -     typedef const int*                __to_type;
> -+#endif
> -
> -     // NB: Offsets into ctype<char>::_M_table force a particular size
> -     // on the mask type. Because of this, we don't use an enum.
> ---
> -1.7.10.4
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0004-uclibc-locale.patch b=
/meta/recipes-devtools/gcc/gcc-4.9/0004-uclibc-locale.patch
> deleted file mode 100644
> index 49f5f33..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.9/0004-uclibc-locale.patch
> +++ /dev/null
> @@ -1,2862 +0,0 @@
> -From a55c751a449c2cbf0b3fcc07aab1b86bf9661510 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 29 Mar 2013 08:41:39 +0400
> -Subject: [PATCH 04/35] uclibc-locale
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Upstream-Status: Pending
> ----
> - libstdc++-v3/acinclude.m4                          |   37 ++
> - .../config/locale/uclibc/c++locale_internal.h      |   63 ++
> - libstdc++-v3/config/locale/uclibc/c_locale.cc      |  160 +++++
> - libstdc++-v3/config/locale/uclibc/c_locale.h       |  117 ++++
> - .../config/locale/uclibc/codecvt_members.cc        |  308 +++++++++
> - .../config/locale/uclibc/collate_members.cc        |   80 +++
> - libstdc++-v3/config/locale/uclibc/ctype_members.cc |  300 +++++++++
> - .../config/locale/uclibc/messages_members.cc       |  100 +++
> - .../config/locale/uclibc/messages_members.h        |  118 ++++
> - .../config/locale/uclibc/monetary_members.cc       |  692 +++++++++++++=
+++++++
> - .../config/locale/uclibc/numeric_members.cc        |  160 +++++
> - libstdc++-v3/config/locale/uclibc/time_members.cc  |  406 ++++++++++++
> - libstdc++-v3/config/locale/uclibc/time_members.h   |   68 ++
> - libstdc++-v3/configure                             |   75 +++
> - libstdc++-v3/include/c_compatibility/wchar.h       |    2 +
> - libstdc++-v3/include/c_std/cwchar                  |    2 +
> - 16 files changed, 2688 insertions(+)
> - create mode 100644 libstdc++-v3/config/locale/uclibc/c++locale_internal=
.h
> - create mode 100644 libstdc++-v3/config/locale/uclibc/c_locale.cc
> - create mode 100644 libstdc++-v3/config/locale/uclibc/c_locale.h
> - create mode 100644 libstdc++-v3/config/locale/uclibc/codecvt_members.cc
> - create mode 100644 libstdc++-v3/config/locale/uclibc/collate_members.cc
> - create mode 100644 libstdc++-v3/config/locale/uclibc/ctype_members.cc
> - create mode 100644 libstdc++-v3/config/locale/uclibc/messages_members.c=
c
> - create mode 100644 libstdc++-v3/config/locale/uclibc/messages_members.h
> - create mode 100644 libstdc++-v3/config/locale/uclibc/monetary_members.c=
c
> - create mode 100644 libstdc++-v3/config/locale/uclibc/numeric_members.cc
> - create mode 100644 libstdc++-v3/config/locale/uclibc/time_members.cc
> - create mode 100644 libstdc++-v3/config/locale/uclibc/time_members.h
> -
> -diff --git a/libstdc++-v3/acinclude.m4 b/libstdc++-v3/acinclude.m4
> -index 0871a6a..326d7ef 100644
> ---- a/libstdc++-v3/acinclude.m4
> -+++ b/libstdc++-v3/acinclude.m4
> -@@ -1905,6 +1905,9 @@ AC_DEFUN([GLIBCXX_ENABLE_CLOCALE], [
> -   # Default to "generic".
> -   if test $enable_clocale_flag =3D auto; then
> -     case ${target_os} in
> -+      *-uclibc*)
> -+        enable_clocale_flag=3Duclibc
> -+        ;;
> -       linux* | gnu* | kfreebsd*-gnu | knetbsd*-gnu)
> -       enable_clocale_flag=3Dgnu
> -       ;;
> -@@ -2069,6 +2072,40 @@ AC_DEFUN([GLIBCXX_ENABLE_CLOCALE], [
> -       CTIME_CC=3Dconfig/locale/generic/time_members.cc
> -       CLOCALE_INTERNAL_H=3Dconfig/locale/generic/c++locale_internal.h
> -       ;;
> -+    uclibc)
> -+      AC_MSG_RESULT(uclibc)
> -+
> -+      # Declare intention to use gettext, and add support for specific
> -+      # languages.
> -+      # For some reason, ALL_LINGUAS has to be before AM-GNU-GETTEXT
> -+      ALL_LINGUAS=3D"de fr"
> -+
> -+      # Don't call AM-GNU-GETTEXT here. Instead, assume glibc.
> -+      AC_CHECK_PROG(check_msgfmt, msgfmt, yes, no)
> -+      if test x"$check_msgfmt" =3D x"yes" && test x"$enable_nls" =3D x"=
yes"; then
> -+        USE_NLS=3Dyes
> -+      fi
> -+      # Export the build objects.
> -+      for ling in $ALL_LINGUAS; do \
> -+        glibcxx_MOFILES=3D"$glibcxx_MOFILES $ling.mo"; \
> -+        glibcxx_POFILES=3D"$glibcxx_POFILES $ling.po"; \
> -+      done
> -+      AC_SUBST(glibcxx_MOFILES)
> -+      AC_SUBST(glibcxx_POFILES)
> -+
> -+      CLOCALE_H=3Dconfig/locale/uclibc/c_locale.h
> -+      CLOCALE_CC=3Dconfig/locale/uclibc/c_locale.cc
> -+      CCODECVT_CC=3Dconfig/locale/uclibc/codecvt_members.cc
> -+      CCOLLATE_CC=3Dconfig/locale/uclibc/collate_members.cc
> -+      CCTYPE_CC=3Dconfig/locale/uclibc/ctype_members.cc
> -+      CMESSAGES_H=3Dconfig/locale/uclibc/messages_members.h
> -+      CMESSAGES_CC=3Dconfig/locale/uclibc/messages_members.cc
> -+      CMONEY_CC=3Dconfig/locale/uclibc/monetary_members.cc
> -+      CNUMERIC_CC=3Dconfig/locale/uclibc/numeric_members.cc
> -+      CTIME_H=3Dconfig/locale/uclibc/time_members.h
> -+      CTIME_CC=3Dconfig/locale/uclibc/time_members.cc
> -+      CLOCALE_INTERNAL_H=3Dconfig/locale/uclibc/c++locale_internal.h
> -+      ;;
> -   esac
> -
> -   # This is where the testsuite looks for locale catalogs, using the
> -diff --git a/libstdc++-v3/config/locale/uclibc/c++locale_internal.h b/li=
bstdc++-v3/config/locale/uclibc/c++locale_internal.h
> -new file mode 100644
> -index 0000000..2ae3e4a
> ---- /dev/null
> -+++ b/libstdc++-v3/config/locale/uclibc/c++locale_internal.h
> -@@ -0,0 +1,63 @@
> -+// Prototypes for GLIBC thread locale __-prefixed functions -*- C++ -*-
> -+
> -+// Copyright (C) 2002, 2004, 2005 Free Software Foundation, Inc.
> -+//
> -+// This file is part of the GNU ISO C++ Library.  This library is free
> -+// software; you can redistribute it and/or modify it under the
> -+// terms of the GNU General Public License as published by the
> -+// Free Software Foundation; either version 2, or (at your option)
> -+// any later version.
> -+
> -+// This library is distributed in the hope that it will be useful,
> -+// but WITHOUT ANY WARRANTY; without even the implied warranty of
> -+// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> -+// GNU General Public License for more details.
> -+
> -+// You should have received a copy of the GNU General Public License al=
ong
> -+// with this library; see the file COPYING.  If not, write to the Free
> -+// Software Foundation, 59 Temple Place - Suite 330, Boston, MA 02111-1=
307,
> -+// USA.
> -+
> -+// As a special exception, you may use this file as part of a free soft=
ware
> -+// library without restriction.  Specifically, if other files instantia=
te
> -+// templates or use macros or inline functions from this file, or you c=
ompile
> -+// this file and link it with other files to produce an executable, thi=
s
> -+// file does not by itself cause the resulting executable to be covered=
 by
> -+// the GNU General Public License.  This exception does not however
> -+// invalidate any other reasons why the executable file might be covere=
d by
> -+// the GNU General Public License.
> -+
> -+// Written by Jakub Jelinek <jakub@redhat.com>
> -+
> -+#include <bits/c++config.h>
> -+#include <clocale>
> -+
> -+#ifdef __UCLIBC_MJN3_ONLY__
> -+#warning clean this up
> -+#endif
> -+
> -+#ifdef __UCLIBC_HAS_XLOCALE__
> -+
> -+extern "C" __typeof(nl_langinfo_l) __nl_langinfo_l;
> -+extern "C" __typeof(strcoll_l) __strcoll_l;
> -+extern "C" __typeof(strftime_l) __strftime_l;
> -+extern "C" __typeof(strtod_l) __strtod_l;
> -+extern "C" __typeof(strtof_l) __strtof_l;
> -+extern "C" __typeof(strtold_l) __strtold_l;
> -+extern "C" __typeof(strxfrm_l) __strxfrm_l;
> -+extern "C" __typeof(newlocale) __newlocale;
> -+extern "C" __typeof(freelocale) __freelocale;
> -+extern "C" __typeof(duplocale) __duplocale;
> -+extern "C" __typeof(uselocale) __uselocale;
> -+
> -+#ifdef _GLIBCXX_USE_WCHAR_T
> -+extern "C" __typeof(iswctype_l) __iswctype_l;
> -+extern "C" __typeof(towlower_l) __towlower_l;
> -+extern "C" __typeof(towupper_l) __towupper_l;
> -+extern "C" __typeof(wcscoll_l) __wcscoll_l;
> -+extern "C" __typeof(wcsftime_l) __wcsftime_l;
> -+extern "C" __typeof(wcsxfrm_l) __wcsxfrm_l;
> -+extern "C" __typeof(wctype_l) __wctype_l;
> -+#endif
> -+
> -+#endif // GLIBC 2.3 and later
> -diff --git a/libstdc++-v3/config/locale/uclibc/c_locale.cc b/libstdc++-v=
3/config/locale/uclibc/c_locale.cc
> -new file mode 100644
> -index 0000000..5081dc1
> ---- /dev/null
> -+++ b/libstdc++-v3/config/locale/uclibc/c_locale.cc
> -@@ -0,0 +1,160 @@
> -+// Wrapper for underlying C-language localization -*- C++ -*-
> -+
> -+// Copyright (C) 2001, 2002, 2003 Free Software Foundation, Inc.
> -+//
> -+// This file is part of the GNU ISO C++ Library.  This library is free
> -+// software; you can redistribute it and/or modify it under the
> -+// terms of the GNU General Public License as published by the
> -+// Free Software Foundation; either version 2, or (at your option)
> -+// any later version.
> -+
> -+// This library is distributed in the hope that it will be useful,
> -+// but WITHOUT ANY WARRANTY; without even the implied warranty of
> -+// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> -+// GNU General Public License for more details.
> -+
> -+// You should have received a copy of the GNU General Public License al=
ong
> -+// with this library; see the file COPYING.  If not, write to the Free
> -+// Software Foundation, 59 Temple Place - Suite 330, Boston, MA 02111-1=
307,
> -+// USA.
> -+
> -+// As a special exception, you may use this file as part of a free soft=
ware
> -+// library without restriction.  Specifically, if other files instantia=
te
> -+// templates or use macros or inline functions from this file, or you c=
ompile
> -+// this file and link it with other files to produce an executable, thi=
s
> -+// file does not by itself cause the resulting executable to be covered=
 by
> -+// the GNU General Public License.  This exception does not however
> -+// invalidate any other reasons why the executable file might be covere=
d by
> -+// the GNU General Public License.
> -+
> -+//
> -+// ISO C++ 14882: 22.8  Standard locale categories.
> -+//
> -+
> -+// Written by Benjamin Kosnik <bkoz@redhat.com>
> -+
> -+#include <cerrno>  // For errno
> -+#include <locale>
> -+#include <stdexcept>
> -+#include <langinfo.h>
> -+#include <bits/c++locale_internal.h>
> -+
> -+#ifndef __UCLIBC_HAS_XLOCALE__
> -+#define __strtol_l(S, E, B, L)      strtol((S), (E), (B))
> -+#define __strtoul_l(S, E, B, L)     strtoul((S), (E), (B))
> -+#define __strtoll_l(S, E, B, L)     strtoll((S), (E), (B))
> -+#define __strtoull_l(S, E, B, L)    strtoull((S), (E), (B))
> -+#define __strtof_l(S, E, L)         strtof((S), (E))
> -+#define __strtod_l(S, E, L)         strtod((S), (E))
> -+#define __strtold_l(S, E, L)        strtold((S), (E))
> -+#warning should dummy __newlocale check for C|POSIX ?
> -+#define __newlocale(a, b, c)        NULL
> -+#define __freelocale(a)             ((void)0)
> -+#define __duplocale(a)              __c_locale()
> -+#endif
> -+
> -+namespace std
> -+{
> -+  template<>
> -+    void
> -+    __convert_to_v(const char* __s, float& __v, ios_base::iostate& __er=
r,
> -+                 const __c_locale& __cloc)
> -+    {
> -+      if (!(__err & ios_base::failbit))
> -+      {
> -+        char* __sanity;
> -+        errno =3D 0;
> -+        float __f =3D __strtof_l(__s, &__sanity, __cloc);
> -+          if (__sanity !=3D __s && errno !=3D ERANGE)
> -+          __v =3D __f;
> -+        else
> -+          __err |=3D ios_base::failbit;
> -+      }
> -+    }
> -+
> -+  template<>
> -+    void
> -+    __convert_to_v(const char* __s, double& __v, ios_base::iostate& __e=
rr,
> -+                 const __c_locale& __cloc)
> -+    {
> -+      if (!(__err & ios_base::failbit))
> -+      {
> -+        char* __sanity;
> -+        errno =3D 0;
> -+        double __d =3D __strtod_l(__s, &__sanity, __cloc);
> -+          if (__sanity !=3D __s && errno !=3D ERANGE)
> -+          __v =3D __d;
> -+        else
> -+          __err |=3D ios_base::failbit;
> -+      }
> -+    }
> -+
> -+  template<>
> -+    void
> -+    __convert_to_v(const char* __s, long double& __v, ios_base::iostate=
& __err,
> -+                 const __c_locale& __cloc)
> -+    {
> -+      if (!(__err & ios_base::failbit))
> -+      {
> -+        char* __sanity;
> -+        errno =3D 0;
> -+        long double __ld =3D __strtold_l(__s, &__sanity, __cloc);
> -+          if (__sanity !=3D __s && errno !=3D ERANGE)
> -+          __v =3D __ld;
> -+        else
> -+          __err |=3D ios_base::failbit;
> -+      }
> -+    }
> -+
> -+  void
> -+  locale::facet::_S_create_c_locale(__c_locale& __cloc, const char* __s=
,
> -+                                  __c_locale __old)
> -+  {
> -+    __cloc =3D __newlocale(1 << LC_ALL, __s, __old);
> -+#ifdef __UCLIBC_HAS_XLOCALE__
> -+    if (!__cloc)
> -+      {
> -+      // This named locale is not supported by the underlying OS.
> -+      __throw_runtime_error(__N("locale::facet::_S_create_c_locale "
> -+                            "name not valid"));
> -+      }
> -+#endif
> -+  }
> -+
> -+  void
> -+  locale::facet::_S_destroy_c_locale(__c_locale& __cloc)
> -+  {
> -+    if (_S_get_c_locale() !=3D __cloc)
> -+      __freelocale(__cloc);
> -+  }
> -+
> -+  __c_locale
> -+  locale::facet::_S_clone_c_locale(__c_locale& __cloc)
> -+  { return __duplocale(__cloc); }
> -+} // namespace std
> -+
> -+namespace __gnu_cxx
> -+{
> -+  const char* const category_names[6 + _GLIBCXX_NUM_CATEGORIES] =3D
> -+    {
> -+      "LC_CTYPE",
> -+      "LC_NUMERIC",
> -+      "LC_TIME",
> -+      "LC_COLLATE",
> -+      "LC_MONETARY",
> -+      "LC_MESSAGES",
> -+#if _GLIBCXX_NUM_CATEGORIES !=3D 0
> -+      "LC_PAPER",
> -+      "LC_NAME",
> -+      "LC_ADDRESS",
> -+      "LC_TELEPHONE",
> -+      "LC_MEASUREMENT",
> -+      "LC_IDENTIFICATION"
> -+#endif
> -+    };
> -+}
> -+
> -+namespace std
> -+{
> -+  const char* const* const locale::_S_categories =3D __gnu_cxx::categor=
y_names;
> -+}  // namespace std
> -diff --git a/libstdc++-v3/config/locale/uclibc/c_locale.h b/libstdc++-v3=
/config/locale/uclibc/c_locale.h
> -new file mode 100644
> -index 0000000..da07c1f
> ---- /dev/null
> -+++ b/libstdc++-v3/config/locale/uclibc/c_locale.h
> -@@ -0,0 +1,117 @@
> -+// Wrapper for underlying C-language localization -*- C++ -*-
> -+
> -+// Copyright (C) 2001, 2002, 2003, 2004, 2005 Free Software Foundation,=
 Inc.
> -+//
> -+// This file is part of the GNU ISO C++ Library.  This library is free
> -+// software; you can redistribute it and/or modify it under the
> -+// terms of the GNU General Public License as published by the
> -+// Free Software Foundation; either version 2, or (at your option)
> -+// any later version.
> -+
> -+// This library is distributed in the hope that it will be useful,
> -+// but WITHOUT ANY WARRANTY; without even the implied warranty of
> -+// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> -+// GNU General Public License for more details.
> -+
> -+// You should have received a copy of the GNU General Public License al=
ong
> -+// with this library; see the file COPYING.  If not, write to the Free
> -+// Software Foundation, 59 Temple Place - Suite 330, Boston, MA 02111-1=
307,
> -+// USA.
> -+
> -+// As a special exception, you may use this file as part of a free soft=
ware
> -+// library without restriction.  Specifically, if other files instantia=
te
> -+// templates or use macros or inline functions from this file, or you c=
ompile
> -+// this file and link it with other files to produce an executable, thi=
s
> -+// file does not by itself cause the resulting executable to be covered=
 by
> -+// the GNU General Public License.  This exception does not however
> -+// invalidate any other reasons why the executable file might be covere=
d by
> -+// the GNU General Public License.
> -+
> -+//
> -+// ISO C++ 14882: 22.8  Standard locale categories.
> -+//
> -+
> -+// Written by Benjamin Kosnik <bkoz@redhat.com>
> -+
> -+#ifndef _C_LOCALE_H
> -+#define _C_LOCALE_H 1
> -+
> -+#pragma GCC system_header
> -+
> -+#include <cstring>              // get std::strlen
> -+#include <cstdio>               // get std::snprintf or std::sprintf
> -+#include <clocale>
> -+#include <langinfo.h>         // For codecvt
> -+#ifdef __UCLIBC_MJN3_ONLY__
> -+#warning fix this
> -+#endif
> -+#ifdef __UCLIBC_HAS_LOCALE__
> -+#include <iconv.h>            // For codecvt using iconv, iconv_t
> -+#endif
> -+#ifdef __UCLIBC_HAS_GETTEXT_AWARENESS__
> -+#include <libintl.h>          // For messages
> -+#endif
> -+
> -+#ifdef __UCLIBC_MJN3_ONLY__
> -+#warning what is _GLIBCXX_C_LOCALE_GNU for
> -+#endif
> -+#define _GLIBCXX_C_LOCALE_GNU 1
> -+
> -+#ifdef __UCLIBC_MJN3_ONLY__
> -+#warning fix categories
> -+#endif
> -+// #define _GLIBCXX_NUM_CATEGORIES 6
> -+#define _GLIBCXX_NUM_CATEGORIES 0
> -+
> -+#ifdef __UCLIBC_HAS_XLOCALE__
> -+namespace __gnu_cxx
> -+{
> -+  extern "C" __typeof(uselocale) __uselocale;
> -+}
> -+#endif
> -+
> -+namespace std
> -+{
> -+#ifdef __UCLIBC_HAS_XLOCALE__
> -+  typedef __locale_t          __c_locale;
> -+#else
> -+  typedef int*                        __c_locale;
> -+#endif
> -+
> -+  // Convert numeric value of type _Tv to string and return length of
> -+  // string.  If snprintf is available use it, otherwise fall back to
> -+  // the unsafe sprintf which, in general, can be dangerous and should
> -+  // be avoided.
> -+  template<typename _Tv>
> -+    int
> -+    __convert_from_v(char* __out,
> -+                   const int __size __attribute__ ((__unused__)),
> -+                   const char* __fmt,
> -+#ifdef __UCLIBC_HAS_XCLOCALE__
> -+                   _Tv __v, const __c_locale& __cloc, int __prec)
> -+    {
> -+      __c_locale __old =3D __gnu_cxx::__uselocale(__cloc);
> -+#else
> -+                   _Tv __v, const __c_locale&, int __prec)
> -+    {
> -+# ifdef __UCLIBC_HAS_LOCALE__
> -+      char* __old =3D std::setlocale(LC_ALL, NULL);
> -+      char* __sav =3D new char[std::strlen(__old) + 1];
> -+      std::strcpy(__sav, __old);
> -+      std::setlocale(LC_ALL, "C");
> -+# endif
> -+#endif
> -+
> -+      const int __ret =3D std::snprintf(__out, __size, __fmt, __prec, _=
_v);
> -+
> -+#ifdef __UCLIBC_HAS_XCLOCALE__
> -+      __gnu_cxx::__uselocale(__old);
> -+#elif defined __UCLIBC_HAS_LOCALE__
> -+      std::setlocale(LC_ALL, __sav);
> -+      delete [] __sav;
> -+#endif
> -+      return __ret;
> -+    }
> -+}
> -+
> -+#endif
> -diff --git a/libstdc++-v3/config/locale/uclibc/codecvt_members.cc b/libs=
tdc++-v3/config/locale/uclibc/codecvt_members.cc
> -new file mode 100644
> -index 0000000..64aa962
> ---- /dev/null
> -+++ b/libstdc++-v3/config/locale/uclibc/codecvt_members.cc
> -@@ -0,0 +1,308 @@
> -+// std::codecvt implementation details, GNU version -*- C++ -*-
> -+
> -+// Copyright (C) 2002, 2003 Free Software Foundation, Inc.
> -+//
> -+// This file is part of the GNU ISO C++ Library.  This library is free
> -+// software; you can redistribute it and/or modify it under the
> -+// terms of the GNU General Public License as published by the
> -+// Free Software Foundation; either version 2, or (at your option)
> -+// any later version.
> -+
> -+// This library is distributed in the hope that it will be useful,
> -+// but WITHOUT ANY WARRANTY; without even the implied warranty of
> -+// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> -+// GNU General Public License for more details.
> -+
> -+// You should have received a copy of the GNU General Public License al=
ong
> -+// with this library; see the file COPYING.  If not, write to the Free
> -+// Software Foundation, 59 Temple Place - Suite 330, Boston, MA 02111-1=
307,
> -+// USA.
> -+
> -+// As a special exception, you may use this file as part of a free soft=
ware
> -+// library without restriction.  Specifically, if other files instantia=
te
> -+// templates or use macros or inline functions from this file, or you c=
ompile
> -+// this file and link it with other files to produce an executable, thi=
s
> -+// file does not by itself cause the resulting executable to be covered=
 by
> -+// the GNU General Public License.  This exception does not however
> -+// invalidate any other reasons why the executable file might be covere=
d by
> -+// the GNU General Public License.
> -+
> -+//
> -+// ISO C++ 14882: 22.2.1.5 - Template class codecvt
> -+//
> -+
> -+// Written by Benjamin Kosnik <bkoz@redhat.com>
> -+
> -+#include <locale>
> -+#include <cstdlib>  // For MB_CUR_MAX
> -+#include <climits>  // For MB_LEN_MAX
> -+#include <bits/c++locale_internal.h>
> -+
> -+namespace std
> -+{
> -+  // Specializations.
> -+#ifdef _GLIBCXX_USE_WCHAR_T
> -+  codecvt_base::result
> -+  codecvt<wchar_t, char, mbstate_t>::
> -+  do_out(state_type& __state, const intern_type* __from,
> -+       const intern_type* __from_end, const intern_type*& __from_next,
> -+       extern_type* __to, extern_type* __to_end,
> -+       extern_type*& __to_next) const
> -+  {
> -+    result __ret =3D ok;
> -+    state_type __tmp_state(__state);
> -+
> -+#ifdef __UCLIBC_HAS_XLOCALE__
> -+    __c_locale __old =3D __uselocale(_M_c_locale_codecvt);
> -+#endif
> -+
> -+    // wcsnrtombs is *very* fast but stops if encounters NUL characters=
:
> -+    // in case we fall back to wcrtomb and then continue, in a loop.
> -+    // NB: wcsnrtombs is a GNU extension
> -+    for (__from_next =3D __from, __to_next =3D __to;
> -+       __from_next < __from_end && __to_next < __to_end
> -+       && __ret =3D=3D ok;)
> -+      {
> -+      const intern_type* __from_chunk_end =3D wmemchr(__from_next, L'\0=
',
> -+                                                    __from_end - __from=
_next);
> -+      if (!__from_chunk_end)
> -+        __from_chunk_end =3D __from_end;
> -+
> -+      __from =3D __from_next;
> -+      const size_t __conv =3D wcsnrtombs(__to_next, &__from_next,
> -+                                       __from_chunk_end - __from_next,
> -+                                       __to_end - __to_next, &__state);
> -+      if (__conv =3D=3D static_cast<size_t>(-1))
> -+        {
> -+          // In case of error, in order to stop at the exact place we
> -+          // have to start again from the beginning with a series of
> -+          // wcrtomb.
> -+          for (; __from < __from_next; ++__from)
> -+            __to_next +=3D wcrtomb(__to_next, *__from, &__tmp_state);
> -+          __state =3D __tmp_state;
> -+          __ret =3D error;
> -+        }
> -+      else if (__from_next && __from_next < __from_chunk_end)
> -+        {
> -+          __to_next +=3D __conv;
> -+          __ret =3D partial;
> -+        }
> -+      else
> -+        {
> -+          __from_next =3D __from_chunk_end;
> -+          __to_next +=3D __conv;
> -+        }
> -+
> -+      if (__from_next < __from_end && __ret =3D=3D ok)
> -+        {
> -+          extern_type __buf[MB_LEN_MAX];
> -+          __tmp_state =3D __state;
> -+          const size_t __conv =3D wcrtomb(__buf, *__from_next, &__tmp_s=
tate);
> -+          if (__conv > static_cast<size_t>(__to_end - __to_next))
> -+            __ret =3D partial;
> -+          else
> -+            {
> -+              memcpy(__to_next, __buf, __conv);
> -+              __state =3D __tmp_state;
> -+              __to_next +=3D __conv;
> -+              ++__from_next;
> -+            }
> -+        }
> -+      }
> -+
> -+#ifdef __UCLIBC_HAS_XLOCALE__
> -+    __uselocale(__old);
> -+#endif
> -+
> -+    return __ret;
> -+  }
> -+
> -+  codecvt_base::result
> -+  codecvt<wchar_t, char, mbstate_t>::
> -+  do_in(state_type& __state, const extern_type* __from,
> -+      const extern_type* __from_end, const extern_type*& __from_next,
> -+      intern_type* __to, intern_type* __to_end,
> -+      intern_type*& __to_next) const
> -+  {
> -+    result __ret =3D ok;
> -+    state_type __tmp_state(__state);
> -+
> -+#ifdef __UCLIBC_HAS_XLOCALE__
> -+    __c_locale __old =3D __uselocale(_M_c_locale_codecvt);
> -+#endif
> -+
> -+    // mbsnrtowcs is *very* fast but stops if encounters NUL characters=
:
> -+    // in case we store a L'\0' and then continue, in a loop.
> -+    // NB: mbsnrtowcs is a GNU extension
> -+    for (__from_next =3D __from, __to_next =3D __to;
> -+       __from_next < __from_end && __to_next < __to_end
> -+       && __ret =3D=3D ok;)
> -+      {
> -+      const extern_type* __from_chunk_end;
> -+      __from_chunk_end =3D static_cast<const extern_type*>(memchr(__fro=
m_next, '\0',
> -+                                                                __from_=
end
> -+                                                                - __fro=
m_next));
> -+      if (!__from_chunk_end)
> -+        __from_chunk_end =3D __from_end;
> -+
> -+      __from =3D __from_next;
> -+      size_t __conv =3D mbsnrtowcs(__to_next, &__from_next,
> -+                                 __from_chunk_end - __from_next,
> -+                                 __to_end - __to_next, &__state);
> -+      if (__conv =3D=3D static_cast<size_t>(-1))
> -+        {
> -+          // In case of error, in order to stop at the exact place we
> -+          // have to start again from the beginning with a series of
> -+          // mbrtowc.
> -+          for (;; ++__to_next, __from +=3D __conv)
> -+            {
> -+              __conv =3D mbrtowc(__to_next, __from, __from_end - __from=
,
> -+                               &__tmp_state);
> -+              if (__conv =3D=3D static_cast<size_t>(-1)
> -+                  || __conv =3D=3D static_cast<size_t>(-2))
> -+                break;
> -+            }
> -+          __from_next =3D __from;
> -+          __state =3D __tmp_state;
> -+          __ret =3D error;
> -+        }
> -+      else if (__from_next && __from_next < __from_chunk_end)
> -+        {
> -+          // It is unclear what to return in this case (see DR 382).
> -+          __to_next +=3D __conv;
> -+          __ret =3D partial;
> -+        }
> -+      else
> -+        {
> -+          __from_next =3D __from_chunk_end;
> -+          __to_next +=3D __conv;
> -+        }
> -+
> -+      if (__from_next < __from_end && __ret =3D=3D ok)
> -+        {
> -+          if (__to_next < __to_end)
> -+            {
> -+              // XXX Probably wrong for stateful encodings
> -+              __tmp_state =3D __state;
> -+              ++__from_next;
> -+              *__to_next++ =3D L'\0';
> -+            }
> -+          else
> -+            __ret =3D partial;
> -+        }
> -+      }
> -+
> -+#ifdef __UCLIBC_HAS_XLOCALE__
> -+    __uselocale(__old);
> -+#endif
> -+
> -+    return __ret;
> -+  }
> -+
> -+  int
> -+  codecvt<wchar_t, char, mbstate_t>::
> -+  do_encoding() const throw()
> -+  {
> -+    // XXX This implementation assumes that the encoding is
> -+    // stateless and is either single-byte or variable-width.
> -+    int __ret =3D 0;
> -+#ifdef __UCLIBC_HAS_XLOCALE__
> -+    __c_locale __old =3D __uselocale(_M_c_locale_codecvt);
> -+#endif
> -+    if (MB_CUR_MAX =3D=3D 1)
> -+      __ret =3D 1;
> -+#ifdef __UCLIBC_HAS_XLOCALE__
> -+    __uselocale(__old);
> -+#endif
> -+    return __ret;
> -+  }
> -+
> -+  int
> -+  codecvt<wchar_t, char, mbstate_t>::
> -+  do_max_length() const throw()
> -+  {
> -+#ifdef __UCLIBC_HAS_XLOCALE__
> -+    __c_locale __old =3D __uselocale(_M_c_locale_codecvt);
> -+#endif
> -+    // XXX Probably wrong for stateful encodings.
> -+    int __ret =3D MB_CUR_MAX;
> -+#ifdef __UCLIBC_HAS_XLOCALE__
> -+    __uselocale(__old);
> -+#endif
> -+    return __ret;
> -+  }
> -+
> -+  int
> -+  codecvt<wchar_t, char, mbstate_t>::
> -+  do_length(state_type& __state, const extern_type* __from,
> -+          const extern_type* __end, size_t __max) const
> -+  {
> -+    int __ret =3D 0;
> -+    state_type __tmp_state(__state);
> -+
> -+#ifdef __UCLIBC_HAS_XLOCALE__
> -+    __c_locale __old =3D __uselocale(_M_c_locale_codecvt);
> -+#endif
> -+
> -+    // mbsnrtowcs is *very* fast but stops if encounters NUL characters=
:
> -+    // in case we advance past it and then continue, in a loop.
> -+    // NB: mbsnrtowcs is a GNU extension
> -+
> -+    // A dummy internal buffer is needed in order for mbsnrtocws to con=
sider
> -+    // its fourth parameter (it wouldn't with NULL as first parameter).
> -+    wchar_t* __to =3D static_cast<wchar_t*>(__builtin_alloca(sizeof(wch=
ar_t)
> -+                                                         * __max));
> -+    while (__from < __end && __max)
> -+      {
> -+      const extern_type* __from_chunk_end;
> -+      __from_chunk_end =3D static_cast<const extern_type*>(memchr(__fro=
m, '\0',
> -+                                                                __end
> -+                                                                - __fro=
m));
> -+      if (!__from_chunk_end)
> -+        __from_chunk_end =3D __end;
> -+
> -+      const extern_type* __tmp_from =3D __from;
> -+      size_t __conv =3D mbsnrtowcs(__to, &__from,
> -+                                 __from_chunk_end - __from,
> -+                                 __max, &__state);
> -+      if (__conv =3D=3D static_cast<size_t>(-1))
> -+        {
> -+          // In case of error, in order to stop at the exact place we
> -+          // have to start again from the beginning with a series of
> -+          // mbrtowc.
> -+          for (__from =3D __tmp_from;; __from +=3D __conv)
> -+            {
> -+              __conv =3D mbrtowc(NULL, __from, __end - __from,
> -+                               &__tmp_state);
> -+              if (__conv =3D=3D static_cast<size_t>(-1)
> -+                  || __conv =3D=3D static_cast<size_t>(-2))
> -+                break;
> -+            }
> -+          __state =3D __tmp_state;
> -+          __ret +=3D __from - __tmp_from;
> -+          break;
> -+        }
> -+      if (!__from)
> -+        __from =3D __from_chunk_end;
> -+
> -+      __ret +=3D __from - __tmp_from;
> -+      __max -=3D __conv;
> -+
> -+      if (__from < __end && __max)
> -+        {
> -+          // XXX Probably wrong for stateful encodings
> -+          __tmp_state =3D __state;
> -+          ++__from;
> -+          ++__ret;
> -+          --__max;
> -+        }
> -+      }
> -+
> -+#ifdef __UCLIBC_HAS_XLOCALE__
> -+    __uselocale(__old);
> -+#endif
> -+
> -+    return __ret;
> -+  }
> -+#endif
> -+}
> -diff --git a/libstdc++-v3/config/locale/uclibc/collate_members.cc b/libs=
tdc++-v3/config/locale/uclibc/collate_members.cc
> -new file mode 100644
> -index 0000000..c2664a7
> ---- /dev/null
> -+++ b/libstdc++-v3/config/locale/uclibc/collate_members.cc
> -@@ -0,0 +1,80 @@
> -+// std::collate implementation details, GNU version -*- C++ -*-
> -+
> -+// Copyright (C) 2001, 2002 Free Software Foundation, Inc.
> -+//
> -+// This file is part of the GNU ISO C++ Library.  This library is free
> -+// software; you can redistribute it and/or modify it under the
> -+// terms of the GNU General Public License as published by the
> -+// Free Software Foundation; either version 2, or (at your option)
> -+// any later version.
> -+
> -+// This library is distributed in the hope that it will be useful,
> -+// but WITHOUT ANY WARRANTY; without even the implied warranty of
> -+// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> -+// GNU General Public License for more details.
> -+
> -+// You should have received a copy of the GNU General Public License al=
ong
> -+// with this library; see the file COPYING.  If not, write to the Free
> -+// Software Foundation, 59 Temple Place - Suite 330, Boston, MA 02111-1=
307,
> -+// USA.
> -+
> -+// As a special exception, you may use this file as part of a free soft=
ware
> -+// library without restriction.  Specifically, if other files instantia=
te
> -+// templates or use macros or inline functions from this file, or you c=
ompile
> -+// this file and link it with other files to produce an executable, thi=
s
> -+// file does not by itself cause the resulting executable to be covered=
 by
> -+// the GNU General Public License.  This exception does not however
> -+// invalidate any other reasons why the executable file might be covere=
d by
> -+// the GNU General Public License.
> -+
> -+//
> -+// ISO C++ 14882: 22.2.4.1.2  collate virtual functions
> -+//
> -+
> -+// Written by Benjamin Kosnik <bkoz@redhat.com>
> -+
> -+#include <locale>
> -+#include <bits/c++locale_internal.h>
> -+
> -+#ifndef __UCLIBC_HAS_XLOCALE__
> -+#define __strcoll_l(S1, S2, L)      strcoll((S1), (S2))
> -+#define __strxfrm_l(S1, S2, N, L)   strxfrm((S1), (S2), (N))
> -+#define __wcscoll_l(S1, S2, L)      wcscoll((S1), (S2))
> -+#define __wcsxfrm_l(S1, S2, N, L)   wcsxfrm((S1), (S2), (N))
> -+#endif
> -+
> -+namespace std
> -+{
> -+  // These are basically extensions to char_traits, and perhaps should
> -+  // be put there instead of here.
> -+  template<>
> -+    int
> -+    collate<char>::_M_compare(const char* __one, const char* __two) con=
st
> -+    {
> -+      int __cmp =3D __strcoll_l(__one, __two, _M_c_locale_collate);
> -+      return (__cmp >> (8 * sizeof (int) - 2)) | (__cmp !=3D 0);
> -+    }
> -+
> -+  template<>
> -+    size_t
> -+    collate<char>::_M_transform(char* __to, const char* __from,
> -+                              size_t __n) const
> -+    { return __strxfrm_l(__to, __from, __n, _M_c_locale_collate); }
> -+
> -+#ifdef _GLIBCXX_USE_WCHAR_T
> -+  template<>
> -+    int
> -+    collate<wchar_t>::_M_compare(const wchar_t* __one,
> -+                               const wchar_t* __two) const
> -+    {
> -+      int __cmp =3D __wcscoll_l(__one, __two, _M_c_locale_collate);
> -+      return (__cmp >> (8 * sizeof (int) - 2)) | (__cmp !=3D 0);
> -+    }
> -+
> -+  template<>
> -+    size_t
> -+    collate<wchar_t>::_M_transform(wchar_t* __to, const wchar_t* __from=
,
> -+                                 size_t __n) const
> -+    { return __wcsxfrm_l(__to, __from, __n, _M_c_locale_collate); }
> -+#endif
> -+}
> -diff --git a/libstdc++-v3/config/locale/uclibc/ctype_members.cc b/libstd=
c++-v3/config/locale/uclibc/ctype_members.cc
> -new file mode 100644
> -index 0000000..7294e3a
> ---- /dev/null
> -+++ b/libstdc++-v3/config/locale/uclibc/ctype_members.cc
> -@@ -0,0 +1,300 @@
> -+// std::ctype implementation details, GNU version -*- C++ -*-
> -+
> -+// Copyright (C) 2001, 2002, 2003, 2004 Free Software Foundation, Inc.
> -+//
> -+// This file is part of the GNU ISO C++ Library.  This library is free
> -+// software; you can redistribute it and/or modify it under the
> -+// terms of the GNU General Public License as published by the
> -+// Free Software Foundation; either version 2, or (at your option)
> -+// any later version.
> -+
> -+// This library is distributed in the hope that it will be useful,
> -+// but WITHOUT ANY WARRANTY; without even the implied warranty of
> -+// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> -+// GNU General Public License for more details.
> -+
> -+// You should have received a copy of the GNU General Public License al=
ong
> -+// with this library; see the file COPYING.  If not, write to the Free
> -+// Software Foundation, 59 Temple Place - Suite 330, Boston, MA 02111-1=
307,
> -+// USA.
> -+
> -+// As a special exception, you may use this file as part of a free soft=
ware
> -+// library without restriction.  Specifically, if other files instantia=
te
> -+// templates or use macros or inline functions from this file, or you c=
ompile
> -+// this file and link it with other files to produce an executable, thi=
s
> -+// file does not by itself cause the resulting executable to be covered=
 by
> -+// the GNU General Public License.  This exception does not however
> -+// invalidate any other reasons why the executable file might be covere=
d by
> -+// the GNU General Public License.
> -+
> -+//
> -+// ISO C++ 14882: 22.2.1.1.2  ctype virtual functions.
> -+//
> -+
> -+// Written by Benjamin Kosnik <bkoz@redhat.com>
> -+
> -+#define _LIBC
> -+#include <locale>
> -+#undef _LIBC
> -+#include <bits/c++locale_internal.h>
> -+
> -+#ifndef __UCLIBC_HAS_XLOCALE__
> -+#define __wctype_l(S, L)           wctype((S))
> -+#define __towupper_l(C, L)         towupper((C))
> -+#define __towlower_l(C, L)         towlower((C))
> -+#define __iswctype_l(C, M, L)      iswctype((C), (M))
> -+#endif
> -+
> -+namespace std
> -+{
> -+  // NB: The other ctype<char> specializations are in src/locale.cc and
> -+  // various /config/os/* files.
> -+  template<>
> -+    ctype_byname<char>::ctype_byname(const char* __s, size_t __refs)
> -+    : ctype<char>(0, false, __refs)
> -+    {
> -+      if (std::strcmp(__s, "C") !=3D 0 && std::strcmp(__s, "POSIX") !=
=3D 0)
> -+      {
> -+        this->_S_destroy_c_locale(this->_M_c_locale_ctype);
> -+        this->_S_create_c_locale(this->_M_c_locale_ctype, __s);
> -+#ifdef __UCLIBC_HAS_XLOCALE__
> -+        this->_M_toupper =3D this->_M_c_locale_ctype->__ctype_toupper;
> -+        this->_M_tolower =3D this->_M_c_locale_ctype->__ctype_tolower;
> -+        this->_M_table =3D this->_M_c_locale_ctype->__ctype_b;
> -+#endif
> -+      }
> -+    }
> -+
> -+#ifdef _GLIBCXX_USE_WCHAR_T
> -+  ctype<wchar_t>::__wmask_type
> -+  ctype<wchar_t>::_M_convert_to_wmask(const mask __m) const
> -+  {
> -+    __wmask_type __ret;
> -+    switch (__m)
> -+      {
> -+      case space:
> -+      __ret =3D __wctype_l("space", _M_c_locale_ctype);
> -+      break;
> -+      case print:
> -+      __ret =3D __wctype_l("print", _M_c_locale_ctype);
> -+      break;
> -+      case cntrl:
> -+      __ret =3D __wctype_l("cntrl", _M_c_locale_ctype);
> -+      break;
> -+      case upper:
> -+      __ret =3D __wctype_l("upper", _M_c_locale_ctype);
> -+      break;
> -+      case lower:
> -+      __ret =3D __wctype_l("lower", _M_c_locale_ctype);
> -+      break;
> -+      case alpha:
> -+      __ret =3D __wctype_l("alpha", _M_c_locale_ctype);
> -+      break;
> -+      case digit:
> -+      __ret =3D __wctype_l("digit", _M_c_locale_ctype);
> -+      break;
> -+      case punct:
> -+      __ret =3D __wctype_l("punct", _M_c_locale_ctype);
> -+      break;
> -+      case xdigit:
> -+      __ret =3D __wctype_l("xdigit", _M_c_locale_ctype);
> -+      break;
> -+      case alnum:
> -+      __ret =3D __wctype_l("alnum", _M_c_locale_ctype);
> -+      break;
> -+      case graph:
> -+      __ret =3D __wctype_l("graph", _M_c_locale_ctype);
> -+      break;
> -+      default:
> -+      __ret =3D __wmask_type();
> -+      }
> -+    return __ret;
> -+  }
> -+
> -+  wchar_t
> -+  ctype<wchar_t>::do_toupper(wchar_t __c) const
> -+  { return __towupper_l(__c, _M_c_locale_ctype); }
> -+
> -+  const wchar_t*
> -+  ctype<wchar_t>::do_toupper(wchar_t* __lo, const wchar_t* __hi) const
> -+  {
> -+    while (__lo < __hi)
> -+      {
> -+        *__lo =3D __towupper_l(*__lo, _M_c_locale_ctype);
> -+        ++__lo;
> -+      }
> -+    return __hi;
> -+  }
> -+
> -+  wchar_t
> -+  ctype<wchar_t>::do_tolower(wchar_t __c) const
> -+  { return __towlower_l(__c, _M_c_locale_ctype); }
> -+
> -+  const wchar_t*
> -+  ctype<wchar_t>::do_tolower(wchar_t* __lo, const wchar_t* __hi) const
> -+  {
> -+    while (__lo < __hi)
> -+      {
> -+        *__lo =3D __towlower_l(*__lo, _M_c_locale_ctype);
> -+        ++__lo;
> -+      }
> -+    return __hi;
> -+  }
> -+
> -+  bool
> -+  ctype<wchar_t>::
> -+  do_is(mask __m, wchar_t __c) const
> -+  {
> -+    // Highest bitmask in ctype_base =3D=3D 10, but extra in "C"
> -+    // library for blank.
> -+    bool __ret =3D false;
> -+    const size_t __bitmasksize =3D 11;
> -+    for (size_t __bitcur =3D 0; __bitcur <=3D __bitmasksize; ++__bitcur=
)
> -+      if (__m & _M_bit[__bitcur]
> -+        && __iswctype_l(__c, _M_wmask[__bitcur], _M_c_locale_ctype))
> -+      {
> -+        __ret =3D true;
> -+        break;
> -+      }
> -+    return __ret;
> -+  }
> -+
> -+  const wchar_t*
> -+  ctype<wchar_t>::
> -+  do_is(const wchar_t* __lo, const wchar_t* __hi, mask* __vec) const
> -+  {
> -+    for (; __lo < __hi; ++__vec, ++__lo)
> -+      {
> -+      // Highest bitmask in ctype_base =3D=3D 10, but extra in "C"
> -+      // library for blank.
> -+      const size_t __bitmasksize =3D 11;
> -+      mask __m =3D 0;
> -+      for (size_t __bitcur =3D 0; __bitcur <=3D __bitmasksize; ++__bitc=
ur)
> -+        if (__iswctype_l(*__lo, _M_wmask[__bitcur], _M_c_locale_ctype))
> -+          __m |=3D _M_bit[__bitcur];
> -+      *__vec =3D __m;
> -+      }
> -+    return __hi;
> -+  }
> -+
> -+  const wchar_t*
> -+  ctype<wchar_t>::
> -+  do_scan_is(mask __m, const wchar_t* __lo, const wchar_t* __hi) const
> -+  {
> -+    while (__lo < __hi && !this->do_is(__m, *__lo))
> -+      ++__lo;
> -+    return __lo;
> -+  }
> -+
> -+  const wchar_t*
> -+  ctype<wchar_t>::
> -+  do_scan_not(mask __m, const char_type* __lo, const char_type* __hi) c=
onst
> -+  {
> -+    while (__lo < __hi && this->do_is(__m, *__lo) !=3D 0)
> -+      ++__lo;
> -+    return __lo;
> -+  }
> -+
> -+  wchar_t
> -+  ctype<wchar_t>::
> -+  do_widen(char __c) const
> -+  { return _M_widen[static_cast<unsigned char>(__c)]; }
> -+
> -+  const char*
> -+  ctype<wchar_t>::
> -+  do_widen(const char* __lo, const char* __hi, wchar_t* __dest) const
> -+  {
> -+    while (__lo < __hi)
> -+      {
> -+      *__dest =3D _M_widen[static_cast<unsigned char>(*__lo)];
> -+      ++__lo;
> -+      ++__dest;
> -+      }
> -+    return __hi;
> -+  }
> -+
> -+  char
> -+  ctype<wchar_t>::
> -+  do_narrow(wchar_t __wc, char __dfault) const
> -+  {
> -+    if (__wc >=3D 0 && __wc < 128 && _M_narrow_ok)
> -+      return _M_narrow[__wc];
> -+#ifdef __UCLIBC_HAS_XLOCALE__
> -+    __c_locale __old =3D __uselocale(_M_c_locale_ctype);
> -+#endif
> -+    const int __c =3D wctob(__wc);
> -+#ifdef __UCLIBC_HAS_XLOCALE__
> -+    __uselocale(__old);
> -+#endif
> -+    return (__c =3D=3D EOF ? __dfault : static_cast<char>(__c));
> -+  }
> -+
> -+  const wchar_t*
> -+  ctype<wchar_t>::
> -+  do_narrow(const wchar_t* __lo, const wchar_t* __hi, char __dfault,
> -+          char* __dest) const
> -+  {
> -+#ifdef __UCLIBC_HAS_XLOCALE__
> -+    __c_locale __old =3D __uselocale(_M_c_locale_ctype);
> -+#endif
> -+    if (_M_narrow_ok)
> -+      while (__lo < __hi)
> -+      {
> -+        if (*__lo >=3D 0 && *__lo < 128)
> -+          *__dest =3D _M_narrow[*__lo];
> -+        else
> -+          {
> -+            const int __c =3D wctob(*__lo);
> -+            *__dest =3D (__c =3D=3D EOF ? __dfault : static_cast<char>(=
__c));
> -+          }
> -+        ++__lo;
> -+        ++__dest;
> -+      }
> -+    else
> -+      while (__lo < __hi)
> -+      {
> -+        const int __c =3D wctob(*__lo);
> -+        *__dest =3D (__c =3D=3D EOF ? __dfault : static_cast<char>(__c)=
);
> -+        ++__lo;
> -+        ++__dest;
> -+      }
> -+#ifdef __UCLIBC_HAS_XLOCALE__
> -+    __uselocale(__old);
> -+#endif
> -+    return __hi;
> -+  }
> -+
> -+  void
> -+  ctype<wchar_t>::_M_initialize_ctype()
> -+  {
> -+#ifdef __UCLIBC_HAS_XLOCALE__
> -+    __c_locale __old =3D __uselocale(_M_c_locale_ctype);
> -+#endif
> -+    wint_t __i;
> -+    for (__i =3D 0; __i < 128; ++__i)
> -+      {
> -+      const int __c =3D wctob(__i);
> -+      if (__c =3D=3D EOF)
> -+        break;
> -+      else
> -+        _M_narrow[__i] =3D static_cast<char>(__c);
> -+      }
> -+    if (__i =3D=3D 128)
> -+      _M_narrow_ok =3D true;
> -+    else
> -+      _M_narrow_ok =3D false;
> -+    for (size_t __j =3D 0;
> -+       __j < sizeof(_M_widen) / sizeof(wint_t); ++__j)
> -+      _M_widen[__j] =3D btowc(__j);
> -+
> -+    for (size_t __k =3D 0; __k <=3D 11; ++__k)
> -+      {
> -+      _M_bit[__k] =3D static_cast<mask>(_ISbit(__k));
> -+      _M_wmask[__k] =3D _M_convert_to_wmask(_M_bit[__k]);
> -+      }
> -+#ifdef __UCLIBC_HAS_XLOCALE__
> -+    __uselocale(__old);
> -+#endif
> -+  }
> -+#endif //  _GLIBCXX_USE_WCHAR_T
> -+}
> -diff --git a/libstdc++-v3/config/locale/uclibc/messages_members.cc b/lib=
stdc++-v3/config/locale/uclibc/messages_members.cc
> -new file mode 100644
> -index 0000000..13594d9
> ---- /dev/null
> -+++ b/libstdc++-v3/config/locale/uclibc/messages_members.cc
> -@@ -0,0 +1,100 @@
> -+// std::messages implementation details, GNU version -*- C++ -*-
> -+
> -+// Copyright (C) 2001, 2002 Free Software Foundation, Inc.
> -+//
> -+// This file is part of the GNU ISO C++ Library.  This library is free
> -+// software; you can redistribute it and/or modify it under the
> -+// terms of the GNU General Public License as published by the
> -+// Free Software Foundation; either version 2, or (at your option)
> -+// any later version.
> -+
> -+// This library is distributed in the hope that it will be useful,
> -+// but WITHOUT ANY WARRANTY; without even the implied warranty of
> -+// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> -+// GNU General Public License for more details.
> -+
> -+// You should have received a copy of the GNU General Public License al=
ong
> -+// with this library; see the file COPYING.  If not, write to the Free
> -+// Software Foundation, 59 Temple Place - Suite 330, Boston, MA 02111-1=
307,
> -+// USA.
> -+
> -+// As a special exception, you may use this file as part of a free soft=
ware
> -+// library without restriction.  Specifically, if other files instantia=
te
> -+// templates or use macros or inline functions from this file, or you c=
ompile
> -+// this file and link it with other files to produce an executable, thi=
s
> -+// file does not by itself cause the resulting executable to be covered=
 by
> -+// the GNU General Public License.  This exception does not however
> -+// invalidate any other reasons why the executable file might be covere=
d by
> -+// the GNU General Public License.
> -+
> -+//
> -+// ISO C++ 14882: 22.2.7.1.2  messages virtual functions
> -+//
> -+
> -+// Written by Benjamin Kosnik <bkoz@redhat.com>
> -+
> -+#include <locale>
> -+#include <bits/c++locale_internal.h>
> -+
> -+#ifdef __UCLIBC_MJN3_ONLY__
> -+#warning fix gettext stuff
> -+#endif
> -+#ifdef __UCLIBC_HAS_GETTEXT_AWARENESS__
> -+extern "C" char *__dcgettext(const char *domainname,
> -+                           const char *msgid, int category);
> -+#undef gettext
> -+#define gettext(msgid) __dcgettext(NULL, msgid, LC_MESSAGES)
> -+#else
> -+#undef gettext
> -+#define gettext(msgid) (msgid)
> -+#endif
> -+
> -+namespace std
> -+{
> -+  // Specializations.
> -+  template<>
> -+    string
> -+    messages<char>::do_get(catalog, int, int, const string& __dfault) c=
onst
> -+    {
> -+#ifdef __UCLIBC_HAS_XLOCALE__
> -+      __c_locale __old =3D __uselocale(_M_c_locale_messages);
> -+      const char* __msg =3D const_cast<const char*>(gettext(__dfault.c_=
str()));
> -+      __uselocale(__old);
> -+      return string(__msg);
> -+#elif defined __UCLIBC_HAS_LOCALE__
> -+      char* __old =3D strdup(setlocale(LC_ALL, NULL));
> -+      setlocale(LC_ALL, _M_name_messages);
> -+      const char* __msg =3D gettext(__dfault.c_str());
> -+      setlocale(LC_ALL, __old);
> -+      free(__old);
> -+      return string(__msg);
> -+#else
> -+      const char* __msg =3D gettext(__dfault.c_str());
> -+      return string(__msg);
> -+#endif
> -+    }
> -+
> -+#ifdef _GLIBCXX_USE_WCHAR_T
> -+  template<>
> -+    wstring
> -+    messages<wchar_t>::do_get(catalog, int, int, const wstring& __dfaul=
t) const
> -+    {
> -+# ifdef __UCLIBC_HAS_XLOCALE__
> -+      __c_locale __old =3D __uselocale(_M_c_locale_messages);
> -+      char* __msg =3D gettext(_M_convert_to_char(__dfault));
> -+      __uselocale(__old);
> -+      return _M_convert_from_char(__msg);
> -+# elif defined __UCLIBC_HAS_LOCALE__
> -+      char* __old =3D strdup(setlocale(LC_ALL, NULL));
> -+      setlocale(LC_ALL, _M_name_messages);
> -+      char* __msg =3D gettext(_M_convert_to_char(__dfault));
> -+      setlocale(LC_ALL, __old);
> -+      free(__old);
> -+      return _M_convert_from_char(__msg);
> -+# else
> -+      char* __msg =3D gettext(_M_convert_to_char(__dfault));
> -+      return _M_convert_from_char(__msg);
> -+# endif
> -+    }
> -+#endif
> -+}
> -diff --git a/libstdc++-v3/config/locale/uclibc/messages_members.h b/libs=
tdc++-v3/config/locale/uclibc/messages_members.h
> -new file mode 100644
> -index 0000000..1424078
> ---- /dev/null
> -+++ b/libstdc++-v3/config/locale/uclibc/messages_members.h
> -@@ -0,0 +1,118 @@
> -+// std::messages implementation details, GNU version -*- C++ -*-
> -+
> -+// Copyright (C) 2001, 2002, 2003, 2004 Free Software Foundation, Inc.
> -+//
> -+// This file is part of the GNU ISO C++ Library.  This library is free
> -+// software; you can redistribute it and/or modify it under the
> -+// terms of the GNU General Public License as published by the
> -+// Free Software Foundation; either version 2, or (at your option)
> -+// any later version.
> -+
> -+// This library is distributed in the hope that it will be useful,
> -+// but WITHOUT ANY WARRANTY; without even the implied warranty of
> -+// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> -+// GNU General Public License for more details.
> -+
> -+// You should have received a copy of the GNU General Public License al=
ong
> -+// with this library; see the file COPYING.  If not, write to the Free
> -+// Software Foundation, 59 Temple Place - Suite 330, Boston, MA 02111-1=
307,
> -+// USA.
> -+
> -+// As a special exception, you may use this file as part of a free soft=
ware
> -+// library without restriction.  Specifically, if other files instantia=
te
> -+// templates or use macros or inline functions from this file, or you c=
ompile
> -+// this file and link it with other files to produce an executable, thi=
s
> -+// file does not by itself cause the resulting executable to be covered=
 by
> -+// the GNU General Public License.  This exception does not however
> -+// invalidate any other reasons why the executable file might be covere=
d by
> -+// the GNU General Public License.
> -+
> -+//
> -+// ISO C++ 14882: 22.2.7.1.2  messages functions
> -+//
> -+
> -+// Written by Benjamin Kosnik <bkoz@redhat.com>
> -+
> -+#ifdef __UCLIBC_MJN3_ONLY__
> -+#warning fix prototypes for *textdomain funcs
> -+#endif
> -+#ifdef __UCLIBC_HAS_GETTEXT_AWARENESS__
> -+extern "C" char *__textdomain(const char *domainname);
> -+extern "C" char *__bindtextdomain(const char *domainname,
> -+                                const char *dirname);
> -+#else
> -+#undef __textdomain
> -+#undef __bindtextdomain
> -+#define __textdomain(D)           ((void)0)
> -+#define __bindtextdomain(D,P)     ((void)0)
> -+#endif
> -+
> -+  // Non-virtual member functions.
> -+  template<typename _CharT>
> -+     messages<_CharT>::messages(size_t __refs)
> -+     : facet(__refs), _M_c_locale_messages(_S_get_c_locale()),
> -+     _M_name_messages(_S_get_c_name())
> -+     { }
> -+
> -+  template<typename _CharT>
> -+     messages<_CharT>::messages(__c_locale __cloc, const char* __s,
> -+                              size_t __refs)
> -+     : facet(__refs), _M_c_locale_messages(_S_clone_c_locale(__cloc)),
> -+     _M_name_messages(__s)
> -+     {
> -+       char* __tmp =3D new char[std::strlen(__s) + 1];
> -+       std::strcpy(__tmp, __s);
> -+       _M_name_messages =3D __tmp;
> -+     }
> -+
> -+  template<typename _CharT>
> -+    typename messages<_CharT>::catalog
> -+    messages<_CharT>::open(const basic_string<char>& __s, const locale&=
 __loc,
> -+                         const char* __dir) const
> -+    {
> -+      __bindtextdomain(__s.c_str(), __dir);
> -+      return this->do_open(__s, __loc);
> -+    }
> -+
> -+  // Virtual member functions.
> -+  template<typename _CharT>
> -+    messages<_CharT>::~messages()
> -+    {
> -+      if (_M_name_messages !=3D _S_get_c_name())
> -+      delete [] _M_name_messages;
> -+      _S_destroy_c_locale(_M_c_locale_messages);
> -+    }
> -+
> -+  template<typename _CharT>
> -+    typename messages<_CharT>::catalog
> -+    messages<_CharT>::do_open(const basic_string<char>& __s,
> -+                            const locale&) const
> -+    {
> -+      // No error checking is done, assume the catalog exists and can
> -+      // be used.
> -+      __textdomain(__s.c_str());
> -+      return 0;
> -+    }
> -+
> -+  template<typename _CharT>
> -+    void
> -+    messages<_CharT>::do_close(catalog) const
> -+    { }
> -+
> -+   // messages_byname
> -+   template<typename _CharT>
> -+     messages_byname<_CharT>::messages_byname(const char* __s, size_t _=
_refs)
> -+     : messages<_CharT>(__refs)
> -+     {
> -+       if (this->_M_name_messages !=3D locale::facet::_S_get_c_name())
> -+       delete [] this->_M_name_messages;
> -+       char* __tmp =3D new char[std::strlen(__s) + 1];
> -+       std::strcpy(__tmp, __s);
> -+       this->_M_name_messages =3D __tmp;
> -+
> -+       if (std::strcmp(__s, "C") !=3D 0 && std::strcmp(__s, "POSIX") !=
=3D 0)
> -+       {
> -+         this->_S_destroy_c_locale(this->_M_c_locale_messages);
> -+         this->_S_create_c_locale(this->_M_c_locale_messages, __s);
> -+       }
> -+     }
> -diff --git a/libstdc++-v3/config/locale/uclibc/monetary_members.cc b/lib=
stdc++-v3/config/locale/uclibc/monetary_members.cc
> -new file mode 100644
> -index 0000000..aa52731
> ---- /dev/null
> -+++ b/libstdc++-v3/config/locale/uclibc/monetary_members.cc
> -@@ -0,0 +1,692 @@
> -+// std::moneypunct implementation details, GNU version -*- C++ -*-
> -+
> -+// Copyright (C) 2001, 2002, 2003, 2004 Free Software Foundation, Inc.
> -+//
> -+// This file is part of the GNU ISO C++ Library.  This library is free
> -+// software; you can redistribute it and/or modify it under the
> -+// terms of the GNU General Public License as published by the
> -+// Free Software Foundation; either version 2, or (at your option)
> -+// any later version.
> -+
> -+// This library is distributed in the hope that it will be useful,
> -+// but WITHOUT ANY WARRANTY; without even the implied warranty of
> -+// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> -+// GNU General Public License for more details.
> -+
> -+// You should have received a copy of the GNU General Public License al=
ong
> -+// with this library; see the file COPYING.  If not, write to the Free
> -+// Software Foundation, 59 Temple Place - Suite 330, Boston, MA 02111-1=
307,
> -+// USA.
> -+
> -+// As a special exception, you may use this file as part of a free soft=
ware
> -+// library without restriction.  Specifically, if other files instantia=
te
> -+// templates or use macros or inline functions from this file, or you c=
ompile
> -+// this file and link it with other files to produce an executable, thi=
s
> -+// file does not by itself cause the resulting executable to be covered=
 by
> -+// the GNU General Public License.  This exception does not however
> -+// invalidate any other reasons why the executable file might be covere=
d by
> -+// the GNU General Public License.
> -+
> -+//
> -+// ISO C++ 14882: 22.2.6.3.2  moneypunct virtual functions
> -+//
> -+
> -+// Written by Benjamin Kosnik <bkoz@redhat.com>
> -+
> -+#define _LIBC
> -+#include <locale>
> -+#undef _LIBC
> -+#include <bits/c++locale_internal.h>
> -+
> -+#ifdef __UCLIBC_MJN3_ONLY__
> -+#warning optimize this for uclibc
> -+#warning tailor for stub locale support
> -+#endif
> -+
> -+#ifndef __UCLIBC_HAS_XLOCALE__
> -+#define __nl_langinfo_l(N, L)         nl_langinfo((N))
> -+#endif
> -+
> -+namespace std
> -+{
> -+  // Construct and return valid pattern consisting of some combination =
of:
> -+  // space none symbol sign value
> -+  money_base::pattern
> -+  money_base::_S_construct_pattern(char __precedes, char __space, char =
__posn)
> -+  {
> -+    pattern __ret;
> -+
> -+    // This insanely complicated routine attempts to construct a valid
> -+    // pattern for use with monyepunct. A couple of invariants:
> -+
> -+    // if (__precedes) symbol -> value
> -+    // else value -> symbol
> -+
> -+    // if (__space) space
> -+    // else none
> -+
> -+    // none =3D=3D never first
> -+    // space never first or last
> -+
> -+    // Any elegant implementations of this are welcome.
> -+    switch (__posn)
> -+      {
> -+      case 0:
> -+      case 1:
> -+      // 1 The sign precedes the value and symbol.
> -+      __ret.field[0] =3D sign;
> -+      if (__space)
> -+        {
> -+          // Pattern starts with sign.
> -+          if (__precedes)
> -+            {
> -+              __ret.field[1] =3D symbol;
> -+              __ret.field[3] =3D value;
> -+            }
> -+          else
> -+            {
> -+              __ret.field[1] =3D value;
> -+              __ret.field[3] =3D symbol;
> -+            }
> -+          __ret.field[2] =3D space;
> -+        }
> -+      else
> -+        {
> -+          // Pattern starts with sign and ends with none.
> -+          if (__precedes)
> -+            {
> -+              __ret.field[1] =3D symbol;
> -+              __ret.field[2] =3D value;
> -+            }
> -+          else
> -+            {
> -+              __ret.field[1] =3D value;
> -+              __ret.field[2] =3D symbol;
> -+            }
> -+          __ret.field[3] =3D none;
> -+        }
> -+      break;
> -+      case 2:
> -+      // 2 The sign follows the value and symbol.
> -+      if (__space)
> -+        {
> -+          // Pattern either ends with sign.
> -+          if (__precedes)
> -+            {
> -+              __ret.field[0] =3D symbol;
> -+              __ret.field[2] =3D value;
> -+            }
> -+          else
> -+            {
> -+              __ret.field[0] =3D value;
> -+              __ret.field[2] =3D symbol;
> -+            }
> -+          __ret.field[1] =3D space;
> -+          __ret.field[3] =3D sign;
> -+        }
> -+      else
> -+        {
> -+          // Pattern ends with sign then none.
> -+          if (__precedes)
> -+            {
> -+              __ret.field[0] =3D symbol;
> -+              __ret.field[1] =3D value;
> -+            }
> -+          else
> -+            {
> -+              __ret.field[0] =3D value;
> -+              __ret.field[1] =3D symbol;
> -+            }
> -+          __ret.field[2] =3D sign;
> -+          __ret.field[3] =3D none;
> -+        }
> -+      break;
> -+      case 3:
> -+      // 3 The sign immediately precedes the symbol.
> -+      if (__precedes)
> -+        {
> -+          __ret.field[0] =3D sign;
> -+          __ret.field[1] =3D symbol;
> -+          if (__space)
> -+            {
> -+              __ret.field[2] =3D space;
> -+              __ret.field[3] =3D value;
> -+            }
> -+          else
> -+            {
> -+              __ret.field[2] =3D value;
> -+              __ret.field[3] =3D none;
> -+            }
> -+        }
> -+      else
> -+        {
> -+          __ret.field[0] =3D value;
> -+          if (__space)
> -+            {
> -+              __ret.field[1] =3D space;
> -+              __ret.field[2] =3D sign;
> -+              __ret.field[3] =3D symbol;
> -+            }
> -+          else
> -+            {
> -+              __ret.field[1] =3D sign;
> -+              __ret.field[2] =3D symbol;
> -+              __ret.field[3] =3D none;
> -+            }
> -+        }
> -+      break;
> -+      case 4:
> -+      // 4 The sign immediately follows the symbol.
> -+      if (__precedes)
> -+        {
> -+          __ret.field[0] =3D symbol;
> -+          __ret.field[1] =3D sign;
> -+          if (__space)
> -+            {
> -+              __ret.field[2] =3D space;
> -+              __ret.field[3] =3D value;
> -+            }
> -+          else
> -+            {
> -+              __ret.field[2] =3D value;
> -+              __ret.field[3] =3D none;
> -+            }
> -+        }
> -+      else
> -+        {
> -+          __ret.field[0] =3D value;
> -+          if (__space)
> -+            {
> -+              __ret.field[1] =3D space;
> -+              __ret.field[2] =3D symbol;
> -+              __ret.field[3] =3D sign;
> -+            }
> -+          else
> -+            {
> -+              __ret.field[1] =3D symbol;
> -+              __ret.field[2] =3D sign;
> -+              __ret.field[3] =3D none;
> -+            }
> -+        }
> -+      break;
> -+      default:
> -+      ;
> -+      }
> -+    return __ret;
> -+  }
> -+
> -+  template<>
> -+    void
> -+    moneypunct<char, true>::_M_initialize_moneypunct(__c_locale __cloc,
> -+                                                   const char*)
> -+    {
> -+      if (!_M_data)
> -+      _M_data =3D new __moneypunct_cache<char, true>;
> -+
> -+      if (!__cloc)
> -+      {
> -+        // "C" locale
> -+        _M_data->_M_decimal_point =3D '.';
> -+        _M_data->_M_thousands_sep =3D ',';
> -+        _M_data->_M_grouping =3D "";
> -+        _M_data->_M_grouping_size =3D 0;
> -+        _M_data->_M_curr_symbol =3D "";
> -+        _M_data->_M_curr_symbol_size =3D 0;
> -+        _M_data->_M_positive_sign =3D "";
> -+        _M_data->_M_positive_sign_size =3D 0;
> -+        _M_data->_M_negative_sign =3D "";
> -+        _M_data->_M_negative_sign_size =3D 0;
> -+        _M_data->_M_frac_digits =3D 0;
> -+        _M_data->_M_pos_format =3D money_base::_S_default_pattern;
> -+        _M_data->_M_neg_format =3D money_base::_S_default_pattern;
> -+
> -+        for (size_t __i =3D 0; __i < money_base::_S_end; ++__i)
> -+          _M_data->_M_atoms[__i] =3D money_base::_S_atoms[__i];
> -+      }
> -+      else
> -+      {
> -+        // Named locale.
> -+        _M_data->_M_decimal_point =3D *(__nl_langinfo_l(__MON_DECIMAL_P=
OINT,
> -+                                                      __cloc));
> -+        _M_data->_M_thousands_sep =3D *(__nl_langinfo_l(__MON_THOUSANDS=
_SEP,
> -+                                                      __cloc));
> -+        _M_data->_M_grouping =3D __nl_langinfo_l(__MON_GROUPING, __cloc=
);
> -+        _M_data->_M_grouping_size =3D strlen(_M_data->_M_grouping);
> -+        _M_data->_M_positive_sign =3D __nl_langinfo_l(__POSITIVE_SIGN, =
__cloc);
> -+        _M_data->_M_positive_sign_size =3D strlen(_M_data->_M_positive_=
sign);
> -+
> -+        char __nposn =3D *(__nl_langinfo_l(__INT_N_SIGN_POSN, __cloc));
> -+        if (!__nposn)
> -+          _M_data->_M_negative_sign =3D "()";
> -+        else
> -+          _M_data->_M_negative_sign =3D __nl_langinfo_l(__NEGATIVE_SIGN=
,
> -+                                                      __cloc);
> -+        _M_data->_M_negative_sign_size =3D strlen(_M_data->_M_negative_=
sign);
> -+
> -+        // _Intl =3D=3D true
> -+        _M_data->_M_curr_symbol =3D __nl_langinfo_l(__INT_CURR_SYMBOL, =
__cloc);
> -+        _M_data->_M_curr_symbol_size =3D strlen(_M_data->_M_curr_symbol=
);
> -+        _M_data->_M_frac_digits =3D *(__nl_langinfo_l(__INT_FRAC_DIGITS=
,
> -+                                                    __cloc));
> -+        char __pprecedes =3D *(__nl_langinfo_l(__INT_P_CS_PRECEDES, __c=
loc));
> -+        char __pspace =3D *(__nl_langinfo_l(__INT_P_SEP_BY_SPACE, __clo=
c));
> -+        char __pposn =3D *(__nl_langinfo_l(__INT_P_SIGN_POSN, __cloc));
> -+        _M_data->_M_pos_format =3D _S_construct_pattern(__pprecedes, __=
pspace,
> -+                                                      __pposn);
> -+        char __nprecedes =3D *(__nl_langinfo_l(__INT_N_CS_PRECEDES, __c=
loc));
> -+        char __nspace =3D *(__nl_langinfo_l(__INT_N_SEP_BY_SPACE, __clo=
c));
> -+        _M_data->_M_neg_format =3D _S_construct_pattern(__nprecedes, __=
nspace,
> -+                                                      __nposn);
> -+      }
> -+    }
> -+
> -+  template<>
> -+    void
> -+    moneypunct<char, false>::_M_initialize_moneypunct(__c_locale __cloc=
,
> -+                                                    const char*)
> -+    {
> -+      if (!_M_data)
> -+      _M_data =3D new __moneypunct_cache<char, false>;
> -+
> -+      if (!__cloc)
> -+      {
> -+        // "C" locale
> -+        _M_data->_M_decimal_point =3D '.';
> -+        _M_data->_M_thousands_sep =3D ',';
> -+        _M_data->_M_grouping =3D "";
> -+        _M_data->_M_grouping_size =3D 0;
> -+        _M_data->_M_curr_symbol =3D "";
> -+        _M_data->_M_curr_symbol_size =3D 0;
> -+        _M_data->_M_positive_sign =3D "";
> -+        _M_data->_M_positive_sign_size =3D 0;
> -+        _M_data->_M_negative_sign =3D "";
> -+        _M_data->_M_negative_sign_size =3D 0;
> -+        _M_data->_M_frac_digits =3D 0;
> -+        _M_data->_M_pos_format =3D money_base::_S_default_pattern;
> -+        _M_data->_M_neg_format =3D money_base::_S_default_pattern;
> -+
> -+        for (size_t __i =3D 0; __i < money_base::_S_end; ++__i)
> -+          _M_data->_M_atoms[__i] =3D money_base::_S_atoms[__i];
> -+      }
> -+      else
> -+      {
> -+        // Named locale.
> -+        _M_data->_M_decimal_point =3D *(__nl_langinfo_l(__MON_DECIMAL_P=
OINT,
> -+                                                      __cloc));
> -+        _M_data->_M_thousands_sep =3D *(__nl_langinfo_l(__MON_THOUSANDS=
_SEP,
> -+                                                      __cloc));
> -+        _M_data->_M_grouping =3D __nl_langinfo_l(__MON_GROUPING, __cloc=
);
> -+        _M_data->_M_grouping_size =3D strlen(_M_data->_M_grouping);
> -+        _M_data->_M_positive_sign =3D __nl_langinfo_l(__POSITIVE_SIGN, =
__cloc);
> -+        _M_data->_M_positive_sign_size =3D strlen(_M_data->_M_positive_=
sign);
> -+
> -+        char __nposn =3D *(__nl_langinfo_l(__N_SIGN_POSN, __cloc));
> -+        if (!__nposn)
> -+          _M_data->_M_negative_sign =3D "()";
> -+        else
> -+          _M_data->_M_negative_sign =3D __nl_langinfo_l(__NEGATIVE_SIGN=
,
> -+                                                      __cloc);
> -+        _M_data->_M_negative_sign_size =3D strlen(_M_data->_M_negative_=
sign);
> -+
> -+        // _Intl =3D=3D false
> -+        _M_data->_M_curr_symbol =3D __nl_langinfo_l(__CURRENCY_SYMBOL, =
__cloc);
> -+        _M_data->_M_curr_symbol_size =3D strlen(_M_data->_M_curr_symbol=
);
> -+        _M_data->_M_frac_digits =3D *(__nl_langinfo_l(__FRAC_DIGITS, __=
cloc));
> -+        char __pprecedes =3D *(__nl_langinfo_l(__P_CS_PRECEDES, __cloc)=
);
> -+        char __pspace =3D *(__nl_langinfo_l(__P_SEP_BY_SPACE, __cloc));
> -+        char __pposn =3D *(__nl_langinfo_l(__P_SIGN_POSN, __cloc));
> -+        _M_data->_M_pos_format =3D _S_construct_pattern(__pprecedes, __=
pspace,
> -+                                                      __pposn);
> -+        char __nprecedes =3D *(__nl_langinfo_l(__N_CS_PRECEDES, __cloc)=
);
> -+        char __nspace =3D *(__nl_langinfo_l(__N_SEP_BY_SPACE, __cloc));
> -+        _M_data->_M_neg_format =3D _S_construct_pattern(__nprecedes, __=
nspace,
> -+                                                      __nposn);
> -+      }
> -+    }
> -+
> -+  template<>
> -+    moneypunct<char, true>::~moneypunct()
> -+    { delete _M_data; }
> -+
> -+  template<>
> -+    moneypunct<char, false>::~moneypunct()
> -+    { delete _M_data; }
> -+
> -+#ifdef _GLIBCXX_USE_WCHAR_T
> -+  template<>
> -+    void
> -+    moneypunct<wchar_t, true>::_M_initialize_moneypunct(__c_locale __cl=
oc,
> -+#ifdef __UCLIBC_HAS_XLOCALE__
> -+                                                      const char*)
> -+#else
> -+                                                      const char* __nam=
e)
> -+#endif
> -+    {
> -+      if (!_M_data)
> -+      _M_data =3D new __moneypunct_cache<wchar_t, true>;
> -+
> -+      if (!__cloc)
> -+      {
> -+        // "C" locale
> -+        _M_data->_M_decimal_point =3D L'.';
> -+        _M_data->_M_thousands_sep =3D L',';
> -+        _M_data->_M_grouping =3D "";
> -+        _M_data->_M_grouping_size =3D 0;
> -+        _M_data->_M_curr_symbol =3D L"";
> -+        _M_data->_M_curr_symbol_size =3D 0;
> -+        _M_data->_M_positive_sign =3D L"";
> -+        _M_data->_M_positive_sign_size =3D 0;
> -+        _M_data->_M_negative_sign =3D L"";
> -+        _M_data->_M_negative_sign_size =3D 0;
> -+        _M_data->_M_frac_digits =3D 0;
> -+        _M_data->_M_pos_format =3D money_base::_S_default_pattern;
> -+        _M_data->_M_neg_format =3D money_base::_S_default_pattern;
> -+
> -+        // Use ctype::widen code without the facet...
> -+        for (size_t __i =3D 0; __i < money_base::_S_end; ++__i)
> -+          _M_data->_M_atoms[__i] =3D
> -+            static_cast<wchar_t>(money_base::_S_atoms[__i]);
> -+      }
> -+      else
> -+      {
> -+        // Named locale.
> -+#ifdef __UCLIBC_HAS_XLOCALE__
> -+        __c_locale __old =3D __uselocale(__cloc);
> -+#else
> -+        // Switch to named locale so that mbsrtowcs will work.
> -+        char* __old =3D strdup(setlocale(LC_ALL, NULL));
> -+        setlocale(LC_ALL, __name);
> -+#endif
> -+
> -+#ifdef __UCLIBC_MJN3_ONLY__
> -+#warning fix this... should be monetary
> -+#endif
> -+#ifdef __UCLIBC__
> -+# ifdef __UCLIBC_HAS_XLOCALE__
> -+        _M_data->_M_decimal_point =3D __cloc->decimal_point_wc;
> -+        _M_data->_M_thousands_sep =3D __cloc->thousands_sep_wc;
> -+# else
> -+        _M_data->_M_decimal_point =3D __global_locale->decimal_point_wc=
;
> -+        _M_data->_M_thousands_sep =3D __global_locale->thousands_sep_wc=
;
> -+# endif
> -+#else
> -+        union { char *__s; wchar_t __w; } __u;
> -+        __u.__s =3D __nl_langinfo_l(_NL_MONETARY_DECIMAL_POINT_WC, __cl=
oc);
> -+        _M_data->_M_decimal_point =3D __u.__w;
> -+
> -+        __u.__s =3D __nl_langinfo_l(_NL_MONETARY_THOUSANDS_SEP_WC, __cl=
oc);
> -+        _M_data->_M_thousands_sep =3D __u.__w;
> -+#endif
> -+        _M_data->_M_grouping =3D __nl_langinfo_l(__MON_GROUPING, __cloc=
);
> -+        _M_data->_M_grouping_size =3D strlen(_M_data->_M_grouping);
> -+
> -+        const char* __cpossign =3D __nl_langinfo_l(__POSITIVE_SIGN, __c=
loc);
> -+        const char* __cnegsign =3D __nl_langinfo_l(__NEGATIVE_SIGN, __c=
loc);
> -+        const char* __ccurr =3D __nl_langinfo_l(__INT_CURR_SYMBOL, __cl=
oc);
> -+
> -+        wchar_t* __wcs_ps =3D 0;
> -+        wchar_t* __wcs_ns =3D 0;
> -+        const char __nposn =3D *(__nl_langinfo_l(__INT_N_SIGN_POSN, __c=
loc));
> -+        try
> -+          {
> -+            mbstate_t __state;
> -+            size_t __len =3D strlen(__cpossign);
> -+            if (__len)
> -+              {
> -+                ++__len;
> -+                memset(&__state, 0, sizeof(mbstate_t));
> -+                __wcs_ps =3D new wchar_t[__len];
> -+                mbsrtowcs(__wcs_ps, &__cpossign, __len, &__state);
> -+                _M_data->_M_positive_sign =3D __wcs_ps;
> -+              }
> -+            else
> -+              _M_data->_M_positive_sign =3D L"";
> -+            _M_data->_M_positive_sign_size =3D wcslen(_M_data->_M_posit=
ive_sign);
> -+
> -+            __len =3D strlen(__cnegsign);
> -+            if (!__nposn)
> -+              _M_data->_M_negative_sign =3D L"()";
> -+            else if (__len)
> -+              {
> -+                ++__len;
> -+                memset(&__state, 0, sizeof(mbstate_t));
> -+                __wcs_ns =3D new wchar_t[__len];
> -+                mbsrtowcs(__wcs_ns, &__cnegsign, __len, &__state);
> -+                _M_data->_M_negative_sign =3D __wcs_ns;
> -+              }
> -+            else
> -+              _M_data->_M_negative_sign =3D L"";
> -+            _M_data->_M_negative_sign_size =3D wcslen(_M_data->_M_negat=
ive_sign);
> -+
> -+            // _Intl =3D=3D true.
> -+            __len =3D strlen(__ccurr);
> -+            if (__len)
> -+              {
> -+                ++__len;
> -+                memset(&__state, 0, sizeof(mbstate_t));
> -+                wchar_t* __wcs =3D new wchar_t[__len];
> -+                mbsrtowcs(__wcs, &__ccurr, __len, &__state);
> -+                _M_data->_M_curr_symbol =3D __wcs;
> -+              }
> -+            else
> -+              _M_data->_M_curr_symbol =3D L"";
> -+            _M_data->_M_curr_symbol_size =3D wcslen(_M_data->_M_curr_sy=
mbol);
> -+          }
> -+        catch (...)
> -+          {
> -+            delete _M_data;
> -+            _M_data =3D 0;
> -+            delete __wcs_ps;
> -+            delete __wcs_ns;
> -+#ifdef __UCLIBC_HAS_XLOCALE__
> -+            __uselocale(__old);
> -+#else
> -+            setlocale(LC_ALL, __old);
> -+            free(__old);
> -+#endif
> -+            __throw_exception_again;
> -+          }
> -+
> -+        _M_data->_M_frac_digits =3D *(__nl_langinfo_l(__INT_FRAC_DIGITS=
,
> -+                                                    __cloc));
> -+        char __pprecedes =3D *(__nl_langinfo_l(__INT_P_CS_PRECEDES, __c=
loc));
> -+        char __pspace =3D *(__nl_langinfo_l(__INT_P_SEP_BY_SPACE, __clo=
c));
> -+        char __pposn =3D *(__nl_langinfo_l(__INT_P_SIGN_POSN, __cloc));
> -+        _M_data->_M_pos_format =3D _S_construct_pattern(__pprecedes, __=
pspace,
> -+                                                      __pposn);
> -+        char __nprecedes =3D *(__nl_langinfo_l(__INT_N_CS_PRECEDES, __c=
loc));
> -+        char __nspace =3D *(__nl_langinfo_l(__INT_N_SEP_BY_SPACE, __clo=
c));
> -+        _M_data->_M_neg_format =3D _S_construct_pattern(__nprecedes, __=
nspace,
> -+                                                      __nposn);
> -+
> -+#ifdef __UCLIBC_HAS_XLOCALE__
> -+        __uselocale(__old);
> -+#else
> -+        setlocale(LC_ALL, __old);
> -+        free(__old);
> -+#endif
> -+      }
> -+    }
> -+
> -+  template<>
> -+  void
> -+  moneypunct<wchar_t, false>::_M_initialize_moneypunct(__c_locale __clo=
c,
> -+#ifdef __UCLIBC_HAS_XLOCALE__
> -+                                                     const char*)
> -+#else
> -+                                                       const char* __na=
me)
> -+#endif
> -+  {
> -+    if (!_M_data)
> -+      _M_data =3D new __moneypunct_cache<wchar_t, false>;
> -+
> -+    if (!__cloc)
> -+      {
> -+        // "C" locale
> -+        _M_data->_M_decimal_point =3D L'.';
> -+        _M_data->_M_thousands_sep =3D L',';
> -+        _M_data->_M_grouping =3D "";
> -+          _M_data->_M_grouping_size =3D 0;
> -+        _M_data->_M_curr_symbol =3D L"";
> -+        _M_data->_M_curr_symbol_size =3D 0;
> -+        _M_data->_M_positive_sign =3D L"";
> -+        _M_data->_M_positive_sign_size =3D 0;
> -+        _M_data->_M_negative_sign =3D L"";
> -+        _M_data->_M_negative_sign_size =3D 0;
> -+        _M_data->_M_frac_digits =3D 0;
> -+        _M_data->_M_pos_format =3D money_base::_S_default_pattern;
> -+        _M_data->_M_neg_format =3D money_base::_S_default_pattern;
> -+
> -+        // Use ctype::widen code without the facet...
> -+        for (size_t __i =3D 0; __i < money_base::_S_end; ++__i)
> -+          _M_data->_M_atoms[__i] =3D
> -+            static_cast<wchar_t>(money_base::_S_atoms[__i]);
> -+      }
> -+      else
> -+      {
> -+        // Named locale.
> -+#ifdef __UCLIBC_HAS_XLOCALE__
> -+        __c_locale __old =3D __uselocale(__cloc);
> -+#else
> -+        // Switch to named locale so that mbsrtowcs will work.
> -+        char* __old =3D strdup(setlocale(LC_ALL, NULL));
> -+        setlocale(LC_ALL, __name);
> -+#endif
> -+
> -+#ifdef __UCLIBC_MJN3_ONLY__
> -+#warning fix this... should be monetary
> -+#endif
> -+#ifdef __UCLIBC__
> -+# ifdef __UCLIBC_HAS_XLOCALE__
> -+        _M_data->_M_decimal_point =3D __cloc->decimal_point_wc;
> -+        _M_data->_M_thousands_sep =3D __cloc->thousands_sep_wc;
> -+# else
> -+        _M_data->_M_decimal_point =3D __global_locale->decimal_point_wc=
;
> -+        _M_data->_M_thousands_sep =3D __global_locale->thousands_sep_wc=
;
> -+# endif
> -+#else
> -+          union { char *__s; wchar_t __w; } __u;
> -+        __u.__s =3D __nl_langinfo_l(_NL_MONETARY_DECIMAL_POINT_WC, __cl=
oc);
> -+        _M_data->_M_decimal_point =3D __u.__w;
> -+
> -+        __u.__s =3D __nl_langinfo_l(_NL_MONETARY_THOUSANDS_SEP_WC, __cl=
oc);
> -+        _M_data->_M_thousands_sep =3D __u.__w;
> -+#endif
> -+        _M_data->_M_grouping =3D __nl_langinfo_l(__MON_GROUPING, __cloc=
);
> -+          _M_data->_M_grouping_size =3D strlen(_M_data->_M_grouping);
> -+
> -+        const char* __cpossign =3D __nl_langinfo_l(__POSITIVE_SIGN, __c=
loc);
> -+        const char* __cnegsign =3D __nl_langinfo_l(__NEGATIVE_SIGN, __c=
loc);
> -+        const char* __ccurr =3D __nl_langinfo_l(__CURRENCY_SYMBOL, __cl=
oc);
> -+
> -+        wchar_t* __wcs_ps =3D 0;
> -+        wchar_t* __wcs_ns =3D 0;
> -+        const char __nposn =3D *(__nl_langinfo_l(__N_SIGN_POSN, __cloc)=
);
> -+        try
> -+            {
> -+              mbstate_t __state;
> -+              size_t __len;
> -+              __len =3D strlen(__cpossign);
> -+              if (__len)
> -+                {
> -+                ++__len;
> -+                memset(&__state, 0, sizeof(mbstate_t));
> -+                __wcs_ps =3D new wchar_t[__len];
> -+                mbsrtowcs(__wcs_ps, &__cpossign, __len, &__state);
> -+                _M_data->_M_positive_sign =3D __wcs_ps;
> -+              }
> -+            else
> -+              _M_data->_M_positive_sign =3D L"";
> -+              _M_data->_M_positive_sign_size =3D wcslen(_M_data->_M_pos=
itive_sign);
> -+
> -+            __len =3D strlen(__cnegsign);
> -+            if (!__nposn)
> -+              _M_data->_M_negative_sign =3D L"()";
> -+            else if (__len)
> -+              {
> -+                ++__len;
> -+                memset(&__state, 0, sizeof(mbstate_t));
> -+                __wcs_ns =3D new wchar_t[__len];
> -+                mbsrtowcs(__wcs_ns, &__cnegsign, __len, &__state);
> -+                _M_data->_M_negative_sign =3D __wcs_ns;
> -+              }
> -+            else
> -+              _M_data->_M_negative_sign =3D L"";
> -+              _M_data->_M_negative_sign_size =3D wcslen(_M_data->_M_neg=
ative_sign);
> -+
> -+            // _Intl =3D=3D true.
> -+            __len =3D strlen(__ccurr);
> -+            if (__len)
> -+              {
> -+                ++__len;
> -+                memset(&__state, 0, sizeof(mbstate_t));
> -+                wchar_t* __wcs =3D new wchar_t[__len];
> -+                mbsrtowcs(__wcs, &__ccurr, __len, &__state);
> -+                _M_data->_M_curr_symbol =3D __wcs;
> -+              }
> -+            else
> -+              _M_data->_M_curr_symbol =3D L"";
> -+              _M_data->_M_curr_symbol_size =3D wcslen(_M_data->_M_curr_=
symbol);
> -+          }
> -+          catch (...)
> -+          {
> -+            delete _M_data;
> -+              _M_data =3D 0;
> -+            delete __wcs_ps;
> -+            delete __wcs_ns;
> -+#ifdef __UCLIBC_HAS_XLOCALE__
> -+            __uselocale(__old);
> -+#else
> -+            setlocale(LC_ALL, __old);
> -+            free(__old);
> -+#endif
> -+              __throw_exception_again;
> -+          }
> -+
> -+        _M_data->_M_frac_digits =3D *(__nl_langinfo_l(__FRAC_DIGITS, __=
cloc));
> -+        char __pprecedes =3D *(__nl_langinfo_l(__P_CS_PRECEDES, __cloc)=
);
> -+        char __pspace =3D *(__nl_langinfo_l(__P_SEP_BY_SPACE, __cloc));
> -+        char __pposn =3D *(__nl_langinfo_l(__P_SIGN_POSN, __cloc));
> -+        _M_data->_M_pos_format =3D _S_construct_pattern(__pprecedes, __=
pspace,
> -+                                                      __pposn);
> -+        char __nprecedes =3D *(__nl_langinfo_l(__N_CS_PRECEDES, __cloc)=
);
> -+        char __nspace =3D *(__nl_langinfo_l(__N_SEP_BY_SPACE, __cloc));
> -+        _M_data->_M_neg_format =3D _S_construct_pattern(__nprecedes, __=
nspace,
> -+                                                      __nposn);
> -+
> -+#ifdef __UCLIBC_HAS_XLOCALE__
> -+        __uselocale(__old);
> -+#else
> -+        setlocale(LC_ALL, __old);
> -+        free(__old);
> -+#endif
> -+      }
> -+    }
> -+
> -+  template<>
> -+    moneypunct<wchar_t, true>::~moneypunct()
> -+    {
> -+      if (_M_data->_M_positive_sign_size)
> -+      delete [] _M_data->_M_positive_sign;
> -+      if (_M_data->_M_negative_sign_size
> -+          && wcscmp(_M_data->_M_negative_sign, L"()") !=3D 0)
> -+      delete [] _M_data->_M_negative_sign;
> -+      if (_M_data->_M_curr_symbol_size)
> -+      delete [] _M_data->_M_curr_symbol;
> -+      delete _M_data;
> -+    }
> -+
> -+  template<>
> -+    moneypunct<wchar_t, false>::~moneypunct()
> -+    {
> -+      if (_M_data->_M_positive_sign_size)
> -+      delete [] _M_data->_M_positive_sign;
> -+      if (_M_data->_M_negative_sign_size
> -+          && wcscmp(_M_data->_M_negative_sign, L"()") !=3D 0)
> -+      delete [] _M_data->_M_negative_sign;
> -+      if (_M_data->_M_curr_symbol_size)
> -+      delete [] _M_data->_M_curr_symbol;
> -+      delete _M_data;
> -+    }
> -+#endif
> -+}
> -diff --git a/libstdc++-v3/config/locale/uclibc/numeric_members.cc b/libs=
tdc++-v3/config/locale/uclibc/numeric_members.cc
> -new file mode 100644
> -index 0000000..883ec1a
> ---- /dev/null
> -+++ b/libstdc++-v3/config/locale/uclibc/numeric_members.cc
> -@@ -0,0 +1,160 @@
> -+// std::numpunct implementation details, GNU version -*- C++ -*-
> -+
> -+// Copyright (C) 2001, 2002, 2003, 2004 Free Software Foundation, Inc.
> -+//
> -+// This file is part of the GNU ISO C++ Library.  This library is free
> -+// software; you can redistribute it and/or modify it under the
> -+// terms of the GNU General Public License as published by the
> -+// Free Software Foundation; either version 2, or (at your option)
> -+// any later version.
> -+
> -+// This library is distributed in the hope that it will be useful,
> -+// but WITHOUT ANY WARRANTY; without even the implied warranty of
> -+// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> -+// GNU General Public License for more details.
> -+
> -+// You should have received a copy of the GNU General Public License al=
ong
> -+// with this library; see the file COPYING.  If not, write to the Free
> -+// Software Foundation, 59 Temple Place - Suite 330, Boston, MA 02111-1=
307,
> -+// USA.
> -+
> -+// As a special exception, you may use this file as part of a free soft=
ware
> -+// library without restriction.  Specifically, if other files instantia=
te
> -+// templates or use macros or inline functions from this file, or you c=
ompile
> -+// this file and link it with other files to produce an executable, thi=
s
> -+// file does not by itself cause the resulting executable to be covered=
 by
> -+// the GNU General Public License.  This exception does not however
> -+// invalidate any other reasons why the executable file might be covere=
d by
> -+// the GNU General Public License.
> -+
> -+//
> -+// ISO C++ 14882: 22.2.3.1.2  numpunct virtual functions
> -+//
> -+
> -+// Written by Benjamin Kosnik <bkoz@redhat.com>
> -+
> -+#define _LIBC
> -+#include <locale>
> -+#undef _LIBC
> -+#include <bits/c++locale_internal.h>
> -+
> -+#ifdef __UCLIBC_MJN3_ONLY__
> -+#warning tailor for stub locale support
> -+#endif
> -+#ifndef __UCLIBC_HAS_XLOCALE__
> -+#define __nl_langinfo_l(N, L)         nl_langinfo((N))
> -+#endif
> -+
> -+namespace std
> -+{
> -+  template<>
> -+    void
> -+    numpunct<char>::_M_initialize_numpunct(__c_locale __cloc)
> -+    {
> -+      if (!_M_data)
> -+      _M_data =3D new __numpunct_cache<char>;
> -+
> -+      if (!__cloc)
> -+      {
> -+        // "C" locale
> -+        _M_data->_M_grouping =3D "";
> -+        _M_data->_M_grouping_size =3D 0;
> -+        _M_data->_M_use_grouping =3D false;
> -+
> -+        _M_data->_M_decimal_point =3D '.';
> -+        _M_data->_M_thousands_sep =3D ',';
> -+
> -+        for (size_t __i =3D 0; __i < __num_base::_S_oend; ++__i)
> -+          _M_data->_M_atoms_out[__i] =3D __num_base::_S_atoms_out[__i];
> -+
> -+        for (size_t __j =3D 0; __j < __num_base::_S_iend; ++__j)
> -+          _M_data->_M_atoms_in[__j] =3D __num_base::_S_atoms_in[__j];
> -+      }
> -+      else
> -+      {
> -+        // Named locale.
> -+        _M_data->_M_decimal_point =3D *(__nl_langinfo_l(DECIMAL_POINT,
> -+                                                      __cloc));
> -+        _M_data->_M_thousands_sep =3D *(__nl_langinfo_l(THOUSANDS_SEP,
> -+                                                      __cloc));
> -+
> -+        // Check for NULL, which implies no grouping.
> -+        if (_M_data->_M_thousands_sep =3D=3D '\0')
> -+          _M_data->_M_grouping =3D "";
> -+        else
> -+          _M_data->_M_grouping =3D __nl_langinfo_l(GROUPING, __cloc);
> -+        _M_data->_M_grouping_size =3D strlen(_M_data->_M_grouping);
> -+      }
> -+
> -+      // NB: There is no way to extact this info from posix locales.
> -+      // _M_truename =3D __nl_langinfo_l(YESSTR, __cloc);
> -+      _M_data->_M_truename =3D "true";
> -+      _M_data->_M_truename_size =3D 4;
> -+      // _M_falsename =3D __nl_langinfo_l(NOSTR, __cloc);
> -+      _M_data->_M_falsename =3D "false";
> -+      _M_data->_M_falsename_size =3D 5;
> -+    }
> -+
> -+  template<>
> -+    numpunct<char>::~numpunct()
> -+    { delete _M_data; }
> -+
> -+#ifdef _GLIBCXX_USE_WCHAR_T
> -+  template<>
> -+    void
> -+    numpunct<wchar_t>::_M_initialize_numpunct(__c_locale __cloc)
> -+    {
> -+      if (!_M_data)
> -+      _M_data =3D new __numpunct_cache<wchar_t>;
> -+
> -+      if (!__cloc)
> -+      {
> -+        // "C" locale
> -+        _M_data->_M_grouping =3D "";
> -+        _M_data->_M_grouping_size =3D 0;
> -+        _M_data->_M_use_grouping =3D false;
> -+
> -+        _M_data->_M_decimal_point =3D L'.';
> -+        _M_data->_M_thousands_sep =3D L',';
> -+
> -+        // Use ctype::widen code without the facet...
> -+        for (size_t __i =3D 0; __i < __num_base::_S_oend; ++__i)
> -+          _M_data->_M_atoms_out[__i] =3D
> -+            static_cast<wchar_t>(__num_base::_S_atoms_out[__i]);
> -+
> -+        for (size_t __j =3D 0; __j < __num_base::_S_iend; ++__j)
> -+          _M_data->_M_atoms_in[__j] =3D
> -+            static_cast<wchar_t>(__num_base::_S_atoms_in[__j]);
> -+      }
> -+      else
> -+      {
> -+        // Named locale.
> -+        // NB: In the GNU model wchar_t is always 32 bit wide.
> -+        union { char *__s; wchar_t __w; } __u;
> -+        __u.__s =3D __nl_langinfo_l(_NL_NUMERIC_DECIMAL_POINT_WC, __clo=
c);
> -+        _M_data->_M_decimal_point =3D __u.__w;
> -+
> -+        __u.__s =3D __nl_langinfo_l(_NL_NUMERIC_THOUSANDS_SEP_WC, __clo=
c);
> -+        _M_data->_M_thousands_sep =3D __u.__w;
> -+
> -+        if (_M_data->_M_thousands_sep =3D=3D L'\0')
> -+          _M_data->_M_grouping =3D "";
> -+        else
> -+          _M_data->_M_grouping =3D __nl_langinfo_l(GROUPING, __cloc);
> -+        _M_data->_M_grouping_size =3D strlen(_M_data->_M_grouping);
> -+      }
> -+
> -+      // NB: There is no way to extact this info from posix locales.
> -+      // _M_truename =3D __nl_langinfo_l(YESSTR, __cloc);
> -+      _M_data->_M_truename =3D L"true";
> -+      _M_data->_M_truename_size =3D 4;
> -+      // _M_falsename =3D __nl_langinfo_l(NOSTR, __cloc);
> -+      _M_data->_M_falsename =3D L"false";
> -+      _M_data->_M_falsename_size =3D 5;
> -+    }
> -+
> -+  template<>
> -+    numpunct<wchar_t>::~numpunct()
> -+    { delete _M_data; }
> -+ #endif
> -+}
> -diff --git a/libstdc++-v3/config/locale/uclibc/time_members.cc b/libstdc=
++-v3/config/locale/uclibc/time_members.cc
> -new file mode 100644
> -index 0000000..e0707d7
> ---- /dev/null
> -+++ b/libstdc++-v3/config/locale/uclibc/time_members.cc
> -@@ -0,0 +1,406 @@
> -+// std::time_get, std::time_put implementation, GNU version -*- C++ -*-
> -+
> -+// Copyright (C) 2001, 2002, 2003, 2004 Free Software Foundation, Inc.
> -+//
> -+// This file is part of the GNU ISO C++ Library.  This library is free
> -+// software; you can redistribute it and/or modify it under the
> -+// terms of the GNU General Public License as published by the
> -+// Free Software Foundation; either version 2, or (at your option)
> -+// any later version.
> -+
> -+// This library is distributed in the hope that it will be useful,
> -+// but WITHOUT ANY WARRANTY; without even the implied warranty of
> -+// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> -+// GNU General Public License for more details.
> -+
> -+// You should have received a copy of the GNU General Public License al=
ong
> -+// with this library; see the file COPYING.  If not, write to the Free
> -+// Software Foundation, 59 Temple Place - Suite 330, Boston, MA 02111-1=
307,
> -+// USA.
> -+
> -+// As a special exception, you may use this file as part of a free soft=
ware
> -+// library without restriction.  Specifically, if other files instantia=
te
> -+// templates or use macros or inline functions from this file, or you c=
ompile
> -+// this file and link it with other files to produce an executable, thi=
s
> -+// file does not by itself cause the resulting executable to be covered=
 by
> -+// the GNU General Public License.  This exception does not however
> -+// invalidate any other reasons why the executable file might be covere=
d by
> -+// the GNU General Public License.
> -+
> -+//
> -+// ISO C++ 14882: 22.2.5.1.2 - time_get virtual functions
> -+// ISO C++ 14882: 22.2.5.3.2 - time_put virtual functions
> -+//
> -+
> -+// Written by Benjamin Kosnik <bkoz@redhat.com>
> -+
> -+#include <locale>
> -+#include <bits/c++locale_internal.h>
> -+
> -+#ifdef __UCLIBC_MJN3_ONLY__
> -+#warning tailor for stub locale support
> -+#endif
> -+#ifndef __UCLIBC_HAS_XLOCALE__
> -+#define __nl_langinfo_l(N, L)         nl_langinfo((N))
> -+#endif
> -+
> -+namespace std
> -+{
> -+  template<>
> -+    void
> -+    __timepunct<char>::
> -+    _M_put(char* __s, size_t __maxlen, const char* __format,
> -+         const tm* __tm) const
> -+    {
> -+#ifdef __UCLIBC_HAS_XLOCALE__
> -+      const size_t __len =3D __strftime_l(__s, __maxlen, __format, __tm=
,
> -+                                      _M_c_locale_timepunct);
> -+#else
> -+      char* __old =3D strdup(setlocale(LC_ALL, NULL));
> -+      setlocale(LC_ALL, _M_name_timepunct);
> -+      const size_t __len =3D strftime(__s, __maxlen, __format, __tm);
> -+      setlocale(LC_ALL, __old);
> -+      free(__old);
> -+#endif
> -+      // Make sure __s is null terminated.
> -+      if (__len =3D=3D 0)
> -+      __s[0] =3D '\0';
> -+    }
> -+
> -+  template<>
> -+    void
> -+    __timepunct<char>::_M_initialize_timepunct(__c_locale __cloc)
> -+    {
> -+      if (!_M_data)
> -+      _M_data =3D new __timepunct_cache<char>;
> -+
> -+      if (!__cloc)
> -+      {
> -+        // "C" locale
> -+        _M_c_locale_timepunct =3D _S_get_c_locale();
> -+
> -+        _M_data->_M_date_format =3D "%m/%d/%y";
> -+        _M_data->_M_date_era_format =3D "%m/%d/%y";
> -+        _M_data->_M_time_format =3D "%H:%M:%S";
> -+        _M_data->_M_time_era_format =3D "%H:%M:%S";
> -+        _M_data->_M_date_time_format =3D "";
> -+        _M_data->_M_date_time_era_format =3D "";
> -+        _M_data->_M_am =3D "AM";
> -+        _M_data->_M_pm =3D "PM";
> -+        _M_data->_M_am_pm_format =3D "";
> -+
> -+        // Day names, starting with "C"'s Sunday.
> -+        _M_data->_M_day1 =3D "Sunday";
> -+        _M_data->_M_day2 =3D "Monday";
> -+        _M_data->_M_day3 =3D "Tuesday";
> -+        _M_data->_M_day4 =3D "Wednesday";
> -+        _M_data->_M_day5 =3D "Thursday";
> -+        _M_data->_M_day6 =3D "Friday";
> -+        _M_data->_M_day7 =3D "Saturday";
> -+
> -+        // Abbreviated day names, starting with "C"'s Sun.
> -+        _M_data->_M_aday1 =3D "Sun";
> -+        _M_data->_M_aday2 =3D "Mon";
> -+        _M_data->_M_aday3 =3D "Tue";
> -+        _M_data->_M_aday4 =3D "Wed";
> -+        _M_data->_M_aday5 =3D "Thu";
> -+        _M_data->_M_aday6 =3D "Fri";
> -+        _M_data->_M_aday7 =3D "Sat";
> -+
> -+        // Month names, starting with "C"'s January.
> -+        _M_data->_M_month01 =3D "January";
> -+        _M_data->_M_month02 =3D "February";
> -+        _M_data->_M_month03 =3D "March";
> -+        _M_data->_M_month04 =3D "April";
> -+        _M_data->_M_month05 =3D "May";
> -+        _M_data->_M_month06 =3D "June";
> -+        _M_data->_M_month07 =3D "July";
> -+        _M_data->_M_month08 =3D "August";
> -+        _M_data->_M_month09 =3D "September";
> -+        _M_data->_M_month10 =3D "October";
> -+        _M_data->_M_month11 =3D "November";
> -+        _M_data->_M_month12 =3D "December";
> -+
> -+        // Abbreviated month names, starting with "C"'s Jan.
> -+        _M_data->_M_amonth01 =3D "Jan";
> -+        _M_data->_M_amonth02 =3D "Feb";
> -+        _M_data->_M_amonth03 =3D "Mar";
> -+        _M_data->_M_amonth04 =3D "Apr";
> -+        _M_data->_M_amonth05 =3D "May";
> -+        _M_data->_M_amonth06 =3D "Jun";
> -+        _M_data->_M_amonth07 =3D "Jul";
> -+        _M_data->_M_amonth08 =3D "Aug";
> -+        _M_data->_M_amonth09 =3D "Sep";
> -+        _M_data->_M_amonth10 =3D "Oct";
> -+        _M_data->_M_amonth11 =3D "Nov";
> -+        _M_data->_M_amonth12 =3D "Dec";
> -+      }
> -+      else
> -+      {
> -+        _M_c_locale_timepunct =3D _S_clone_c_locale(__cloc);
> -+
> -+        _M_data->_M_date_format =3D __nl_langinfo_l(D_FMT, __cloc);
> -+        _M_data->_M_date_era_format =3D __nl_langinfo_l(ERA_D_FMT, __cl=
oc);
> -+        _M_data->_M_time_format =3D __nl_langinfo_l(T_FMT, __cloc);
> -+        _M_data->_M_time_era_format =3D __nl_langinfo_l(ERA_T_FMT, __cl=
oc);
> -+        _M_data->_M_date_time_format =3D __nl_langinfo_l(D_T_FMT, __clo=
c);
> -+        _M_data->_M_date_time_era_format =3D __nl_langinfo_l(ERA_D_T_FM=
T,
> -+                                                           __cloc);
> -+        _M_data->_M_am =3D __nl_langinfo_l(AM_STR, __cloc);
> -+        _M_data->_M_pm =3D __nl_langinfo_l(PM_STR, __cloc);
> -+        _M_data->_M_am_pm_format =3D __nl_langinfo_l(T_FMT_AMPM, __cloc=
);
> -+
> -+        // Day names, starting with "C"'s Sunday.
> -+        _M_data->_M_day1 =3D __nl_langinfo_l(DAY_1, __cloc);
> -+        _M_data->_M_day2 =3D __nl_langinfo_l(DAY_2, __cloc);
> -+        _M_data->_M_day3 =3D __nl_langinfo_l(DAY_3, __cloc);
> -+        _M_data->_M_day4 =3D __nl_langinfo_l(DAY_4, __cloc);
> -+        _M_data->_M_day5 =3D __nl_langinfo_l(DAY_5, __cloc);
> -+        _M_data->_M_day6 =3D __nl_langinfo_l(DAY_6, __cloc);
> -+        _M_data->_M_day7 =3D __nl_langinfo_l(DAY_7, __cloc);
> -+
> -+        // Abbreviated day names, starting with "C"'s Sun.
> -+        _M_data->_M_aday1 =3D __nl_langinfo_l(ABDAY_1, __cloc);
> -+        _M_data->_M_aday2 =3D __nl_langinfo_l(ABDAY_2, __cloc);
> -+        _M_data->_M_aday3 =3D __nl_langinfo_l(ABDAY_3, __cloc);
> -+        _M_data->_M_aday4 =3D __nl_langinfo_l(ABDAY_4, __cloc);
> -+        _M_data->_M_aday5 =3D __nl_langinfo_l(ABDAY_5, __cloc);
> -+        _M_data->_M_aday6 =3D __nl_langinfo_l(ABDAY_6, __cloc);
> -+        _M_data->_M_aday7 =3D __nl_langinfo_l(ABDAY_7, __cloc);
> -+
> -+        // Month names, starting with "C"'s January.
> -+        _M_data->_M_month01 =3D __nl_langinfo_l(MON_1, __cloc);
> -+        _M_data->_M_month02 =3D __nl_langinfo_l(MON_2, __cloc);
> -+        _M_data->_M_month03 =3D __nl_langinfo_l(MON_3, __cloc);
> -+        _M_data->_M_month04 =3D __nl_langinfo_l(MON_4, __cloc);
> -+        _M_data->_M_month05 =3D __nl_langinfo_l(MON_5, __cloc);
> -+        _M_data->_M_month06 =3D __nl_langinfo_l(MON_6, __cloc);
> -+        _M_data->_M_month07 =3D __nl_langinfo_l(MON_7, __cloc);
> -+        _M_data->_M_month08 =3D __nl_langinfo_l(MON_8, __cloc);
> -+        _M_data->_M_month09 =3D __nl_langinfo_l(MON_9, __cloc);
> -+        _M_data->_M_month10 =3D __nl_langinfo_l(MON_10, __cloc);
> -+        _M_data->_M_month11 =3D __nl_langinfo_l(MON_11, __cloc);
> -+        _M_data->_M_month12 =3D __nl_langinfo_l(MON_12, __cloc);
> -+
> -+        // Abbreviated month names, starting with "C"'s Jan.
> -+        _M_data->_M_amonth01 =3D __nl_langinfo_l(ABMON_1, __cloc);
> -+        _M_data->_M_amonth02 =3D __nl_langinfo_l(ABMON_2, __cloc);
> -+        _M_data->_M_amonth03 =3D __nl_langinfo_l(ABMON_3, __cloc);
> -+        _M_data->_M_amonth04 =3D __nl_langinfo_l(ABMON_4, __cloc);
> -+        _M_data->_M_amonth05 =3D __nl_langinfo_l(ABMON_5, __cloc);
> -+        _M_data->_M_amonth06 =3D __nl_langinfo_l(ABMON_6, __cloc);
> -+        _M_data->_M_amonth07 =3D __nl_langinfo_l(ABMON_7, __cloc);
> -+        _M_data->_M_amonth08 =3D __nl_langinfo_l(ABMON_8, __cloc);
> -+        _M_data->_M_amonth09 =3D __nl_langinfo_l(ABMON_9, __cloc);
> -+        _M_data->_M_amonth10 =3D __nl_langinfo_l(ABMON_10, __cloc);
> -+        _M_data->_M_amonth11 =3D __nl_langinfo_l(ABMON_11, __cloc);
> -+        _M_data->_M_amonth12 =3D __nl_langinfo_l(ABMON_12, __cloc);
> -+      }
> -+    }
> -+
> -+#ifdef _GLIBCXX_USE_WCHAR_T
> -+  template<>
> -+    void
> -+    __timepunct<wchar_t>::
> -+    _M_put(wchar_t* __s, size_t __maxlen, const wchar_t* __format,
> -+         const tm* __tm) const
> -+    {
> -+#ifdef __UCLIBC_HAS_XLOCALE__
> -+      __wcsftime_l(__s, __maxlen, __format, __tm, _M_c_locale_timepunct=
);
> -+      const size_t __len =3D __wcsftime_l(__s, __maxlen, __format, __tm=
,
> -+                                      _M_c_locale_timepunct);
> -+#else
> -+      char* __old =3D strdup(setlocale(LC_ALL, NULL));
> -+      setlocale(LC_ALL, _M_name_timepunct);
> -+      const size_t __len =3D wcsftime(__s, __maxlen, __format, __tm);
> -+      setlocale(LC_ALL, __old);
> -+      free(__old);
> -+#endif
> -+      // Make sure __s is null terminated.
> -+      if (__len =3D=3D 0)
> -+      __s[0] =3D L'\0';
> -+    }
> -+
> -+  template<>
> -+    void
> -+    __timepunct<wchar_t>::_M_initialize_timepunct(__c_locale __cloc)
> -+    {
> -+      if (!_M_data)
> -+      _M_data =3D new __timepunct_cache<wchar_t>;
> -+
> -+#warning wide time stuff
> -+//       if (!__cloc)
> -+      {
> -+        // "C" locale
> -+        _M_c_locale_timepunct =3D _S_get_c_locale();
> -+
> -+        _M_data->_M_date_format =3D L"%m/%d/%y";
> -+        _M_data->_M_date_era_format =3D L"%m/%d/%y";
> -+        _M_data->_M_time_format =3D L"%H:%M:%S";
> -+        _M_data->_M_time_era_format =3D L"%H:%M:%S";
> -+        _M_data->_M_date_time_format =3D L"";
> -+        _M_data->_M_date_time_era_format =3D L"";
> -+        _M_data->_M_am =3D L"AM";
> -+        _M_data->_M_pm =3D L"PM";
> -+        _M_data->_M_am_pm_format =3D L"";
> -+
> -+        // Day names, starting with "C"'s Sunday.
> -+        _M_data->_M_day1 =3D L"Sunday";
> -+        _M_data->_M_day2 =3D L"Monday";
> -+        _M_data->_M_day3 =3D L"Tuesday";
> -+        _M_data->_M_day4 =3D L"Wednesday";
> -+        _M_data->_M_day5 =3D L"Thursday";
> -+        _M_data->_M_day6 =3D L"Friday";
> -+        _M_data->_M_day7 =3D L"Saturday";
> -+
> -+        // Abbreviated day names, starting with "C"'s Sun.
> -+        _M_data->_M_aday1 =3D L"Sun";
> -+        _M_data->_M_aday2 =3D L"Mon";
> -+        _M_data->_M_aday3 =3D L"Tue";
> -+        _M_data->_M_aday4 =3D L"Wed";
> -+        _M_data->_M_aday5 =3D L"Thu";
> -+        _M_data->_M_aday6 =3D L"Fri";
> -+        _M_data->_M_aday7 =3D L"Sat";
> -+
> -+        // Month names, starting with "C"'s January.
> -+        _M_data->_M_month01 =3D L"January";
> -+        _M_data->_M_month02 =3D L"February";
> -+        _M_data->_M_month03 =3D L"March";
> -+        _M_data->_M_month04 =3D L"April";
> -+        _M_data->_M_month05 =3D L"May";
> -+        _M_data->_M_month06 =3D L"June";
> -+        _M_data->_M_month07 =3D L"July";
> -+        _M_data->_M_month08 =3D L"August";
> -+        _M_data->_M_month09 =3D L"September";
> -+        _M_data->_M_month10 =3D L"October";
> -+        _M_data->_M_month11 =3D L"November";
> -+        _M_data->_M_month12 =3D L"December";
> -+
> -+        // Abbreviated month names, starting with "C"'s Jan.
> -+        _M_data->_M_amonth01 =3D L"Jan";
> -+        _M_data->_M_amonth02 =3D L"Feb";
> -+        _M_data->_M_amonth03 =3D L"Mar";
> -+        _M_data->_M_amonth04 =3D L"Apr";
> -+        _M_data->_M_amonth05 =3D L"May";
> -+        _M_data->_M_amonth06 =3D L"Jun";
> -+        _M_data->_M_amonth07 =3D L"Jul";
> -+        _M_data->_M_amonth08 =3D L"Aug";
> -+        _M_data->_M_amonth09 =3D L"Sep";
> -+        _M_data->_M_amonth10 =3D L"Oct";
> -+        _M_data->_M_amonth11 =3D L"Nov";
> -+        _M_data->_M_amonth12 =3D L"Dec";
> -+      }
> -+#if 0
> -+      else
> -+      {
> -+        _M_c_locale_timepunct =3D _S_clone_c_locale(__cloc);
> -+
> -+        union { char *__s; wchar_t *__w; } __u;
> -+
> -+        __u.__s =3D __nl_langinfo_l(_NL_WD_FMT, __cloc);
> -+        _M_data->_M_date_format =3D __u.__w;
> -+        __u.__s =3D __nl_langinfo_l(_NL_WERA_D_FMT, __cloc);
> -+        _M_data->_M_date_era_format =3D __u.__w;
> -+        __u.__s =3D __nl_langinfo_l(_NL_WT_FMT, __cloc);
> -+        _M_data->_M_time_format =3D __u.__w;
> -+        __u.__s =3D __nl_langinfo_l(_NL_WERA_T_FMT, __cloc);
> -+        _M_data->_M_time_era_format =3D __u.__w;
> -+        __u.__s =3D __nl_langinfo_l(_NL_WD_T_FMT, __cloc);
> -+        _M_data->_M_date_time_format =3D __u.__w;
> -+        __u.__s =3D __nl_langinfo_l(_NL_WERA_D_T_FMT, __cloc);
> -+        _M_data->_M_date_time_era_format =3D __u.__w;
> -+        __u.__s =3D __nl_langinfo_l(_NL_WAM_STR, __cloc);
> -+        _M_data->_M_am =3D __u.__w;
> -+        __u.__s =3D __nl_langinfo_l(_NL_WPM_STR, __cloc);
> -+        _M_data->_M_pm =3D __u.__w;
> -+        __u.__s =3D __nl_langinfo_l(_NL_WT_FMT_AMPM, __cloc);
> -+        _M_data->_M_am_pm_format =3D __u.__w;
> -+
> -+        // Day names, starting with "C"'s Sunday.
> -+        __u.__s =3D __nl_langinfo_l(_NL_WDAY_1, __cloc);
> -+        _M_data->_M_day1 =3D __u.__w;
> -+        __u.__s =3D __nl_langinfo_l(_NL_WDAY_2, __cloc);
> -+        _M_data->_M_day2 =3D __u.__w;
> -+        __u.__s =3D __nl_langinfo_l(_NL_WDAY_3, __cloc);
> -+        _M_data->_M_day3 =3D __u.__w;
> -+        __u.__s =3D __nl_langinfo_l(_NL_WDAY_4, __cloc);
> -+        _M_data->_M_day4 =3D __u.__w;
> -+        __u.__s =3D __nl_langinfo_l(_NL_WDAY_5, __cloc);
> -+        _M_data->_M_day5 =3D __u.__w;
> -+        __u.__s =3D __nl_langinfo_l(_NL_WDAY_6, __cloc);
> -+        _M_data->_M_day6 =3D __u.__w;
> -+        __u.__s =3D __nl_langinfo_l(_NL_WDAY_7, __cloc);
> -+        _M_data->_M_day7 =3D __u.__w;
> -+
> -+        // Abbreviated day names, starting with "C"'s Sun.
> -+        __u.__s =3D __nl_langinfo_l(_NL_WABDAY_1, __cloc);
> -+        _M_data->_M_aday1 =3D __u.__w;
> -+        __u.__s =3D __nl_langinfo_l(_NL_WABDAY_2, __cloc);
> -+        _M_data->_M_aday2 =3D __u.__w;
> -+        __u.__s =3D __nl_langinfo_l(_NL_WABDAY_3, __cloc);
> -+        _M_data->_M_aday3 =3D __u.__w;
> -+        __u.__s =3D __nl_langinfo_l(_NL_WABDAY_4, __cloc);
> -+        _M_data->_M_aday4 =3D __u.__w;
> -+        __u.__s =3D __nl_langinfo_l(_NL_WABDAY_5, __cloc);
> -+        _M_data->_M_aday5 =3D __u.__w;
> -+        __u.__s =3D __nl_langinfo_l(_NL_WABDAY_6, __cloc);
> -+        _M_data->_M_aday6 =3D __u.__w;
> -+        __u.__s =3D __nl_langinfo_l(_NL_WABDAY_7, __cloc);
> -+        _M_data->_M_aday7 =3D __u.__w;
> -+
> -+        // Month names, starting with "C"'s January.
> -+        __u.__s =3D __nl_langinfo_l(_NL_WMON_1, __cloc);
> -+        _M_data->_M_month01 =3D __u.__w;
> -+        __u.__s =3D __nl_langinfo_l(_NL_WMON_2, __cloc);
> -+        _M_data->_M_month02 =3D __u.__w;
> -+        __u.__s =3D __nl_langinfo_l(_NL_WMON_3, __cloc);
> -+        _M_data->_M_month03 =3D __u.__w;
> -+        __u.__s =3D __nl_langinfo_l(_NL_WMON_4, __cloc);
> -+        _M_data->_M_month04 =3D __u.__w;
> -+        __u.__s =3D __nl_langinfo_l(_NL_WMON_5, __cloc);
> -+        _M_data->_M_month05 =3D __u.__w;
> -+        __u.__s =3D __nl_langinfo_l(_NL_WMON_6, __cloc);
> -+        _M_data->_M_month06 =3D __u.__w;
> -+        __u.__s =3D __nl_langinfo_l(_NL_WMON_7, __cloc);
> -+        _M_data->_M_month07 =3D __u.__w;
> -+        __u.__s =3D __nl_langinfo_l(_NL_WMON_8, __cloc);
> -+        _M_data->_M_month08 =3D __u.__w;
> -+        __u.__s =3D __nl_langinfo_l(_NL_WMON_9, __cloc);
> -+        _M_data->_M_month09 =3D __u.__w;
> -+        __u.__s =3D __nl_langinfo_l(_NL_WMON_10, __cloc);
> -+        _M_data->_M_month10 =3D __u.__w;
> -+        __u.__s =3D __nl_langinfo_l(_NL_WMON_11, __cloc);
> -+        _M_data->_M_month11 =3D __u.__w;
> -+        __u.__s =3D __nl_langinfo_l(_NL_WMON_12, __cloc);
> -+        _M_data->_M_month12 =3D __u.__w;
> -+
> -+        // Abbreviated month names, starting with "C"'s Jan.
> -+        __u.__s =3D __nl_langinfo_l(_NL_WABMON_1, __cloc);
> -+        _M_data->_M_amonth01 =3D __u.__w;
> -+        __u.__s =3D __nl_langinfo_l(_NL_WABMON_2, __cloc);
> -+        _M_data->_M_amonth02 =3D __u.__w;
> -+        __u.__s =3D __nl_langinfo_l(_NL_WABMON_3, __cloc);
> -+        _M_data->_M_amonth03 =3D __u.__w;
> -+        __u.__s =3D __nl_langinfo_l(_NL_WABMON_4, __cloc);
> -+        _M_data->_M_amonth04 =3D __u.__w;
> -+        __u.__s =3D __nl_langinfo_l(_NL_WABMON_5, __cloc);
> -+        _M_data->_M_amonth05 =3D __u.__w;
> -+        __u.__s =3D __nl_langinfo_l(_NL_WABMON_6, __cloc);
> -+        _M_data->_M_amonth06 =3D __u.__w;
> -+        __u.__s =3D __nl_langinfo_l(_NL_WABMON_7, __cloc);
> -+        _M_data->_M_amonth07 =3D __u.__w;
> -+        __u.__s =3D __nl_langinfo_l(_NL_WABMON_8, __cloc);
> -+        _M_data->_M_amonth08 =3D __u.__w;
> -+        __u.__s =3D __nl_langinfo_l(_NL_WABMON_9, __cloc);
> -+        _M_data->_M_amonth09 =3D __u.__w;
> -+        __u.__s =3D __nl_langinfo_l(_NL_WABMON_10, __cloc);
> -+        _M_data->_M_amonth10 =3D __u.__w;
> -+        __u.__s =3D __nl_langinfo_l(_NL_WABMON_11, __cloc);
> -+        _M_data->_M_amonth11 =3D __u.__w;
> -+        __u.__s =3D __nl_langinfo_l(_NL_WABMON_12, __cloc);
> -+        _M_data->_M_amonth12 =3D __u.__w;
> -+      }
> -+#endif // 0
> -+    }
> -+#endif
> -+}
> -diff --git a/libstdc++-v3/config/locale/uclibc/time_members.h b/libstdc+=
+-v3/config/locale/uclibc/time_members.h
> -new file mode 100644
> -index 0000000..ba8e858
> ---- /dev/null
> -+++ b/libstdc++-v3/config/locale/uclibc/time_members.h
> -@@ -0,0 +1,68 @@
> -+// std::time_get, std::time_put implementation, GNU version -*- C++ -*-
> -+
> -+// Copyright (C) 2001, 2002, 2003, 2004 Free Software Foundation, Inc.
> -+//
> -+// This file is part of the GNU ISO C++ Library.  This library is free
> -+// software; you can redistribute it and/or modify it under the
> -+// terms of the GNU General Public License as published by the
> -+// Free Software Foundation; either version 2, or (at your option)
> -+// any later version.
> -+
> -+// This library is distributed in the hope that it will be useful,
> -+// but WITHOUT ANY WARRANTY; without even the implied warranty of
> -+// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> -+// GNU General Public License for more details.
> -+
> -+// You should have received a copy of the GNU General Public License al=
ong
> -+// with this library; see the file COPYING.  If not, write to the Free
> -+// Software Foundation, 59 Temple Place - Suite 330, Boston, MA 02111-1=
307,
> -+// USA.
> -+
> -+// As a special exception, you may use this file as part of a free soft=
ware
> -+// library without restriction.  Specifically, if other files instantia=
te
> -+// templates or use macros or inline functions from this file, or you c=
ompile
> -+// this file and link it with other files to produce an executable, thi=
s
> -+// file does not by itself cause the resulting executable to be covered=
 by
> -+// the GNU General Public License.  This exception does not however
> -+// invalidate any other reasons why the executable file might be covere=
d by
> -+// the GNU General Public License.
> -+
> -+//
> -+// ISO C++ 14882: 22.2.5.1.2 - time_get functions
> -+// ISO C++ 14882: 22.2.5.3.2 - time_put functions
> -+//
> -+
> -+// Written by Benjamin Kosnik <bkoz@redhat.com>
> -+
> -+  template<typename _CharT>
> -+    __timepunct<_CharT>::__timepunct(size_t __refs)
> -+    : facet(__refs), _M_data(NULL), _M_c_locale_timepunct(NULL),
> -+    _M_name_timepunct(_S_get_c_name())
> -+    { _M_initialize_timepunct(); }
> -+
> -+  template<typename _CharT>
> -+    __timepunct<_CharT>::__timepunct(__cache_type* __cache, size_t __re=
fs)
> -+    : facet(__refs), _M_data(__cache), _M_c_locale_timepunct(NULL),
> -+    _M_name_timepunct(_S_get_c_name())
> -+    { _M_initialize_timepunct(); }
> -+
> -+  template<typename _CharT>
> -+    __timepunct<_CharT>::__timepunct(__c_locale __cloc, const char* __s=
,
> -+                                   size_t __refs)
> -+    : facet(__refs), _M_data(NULL), _M_c_locale_timepunct(NULL),
> -+    _M_name_timepunct(__s)
> -+    {
> -+      char* __tmp =3D new char[std::strlen(__s) + 1];
> -+      std::strcpy(__tmp, __s);
> -+      _M_name_timepunct =3D __tmp;
> -+      _M_initialize_timepunct(__cloc);
> -+    }
> -+
> -+  template<typename _CharT>
> -+    __timepunct<_CharT>::~__timepunct()
> -+    {
> -+      if (_M_name_timepunct !=3D _S_get_c_name())
> -+      delete [] _M_name_timepunct;
> -+      delete _M_data;
> -+      _S_destroy_c_locale(_M_c_locale_timepunct);
> -+    }
> -diff --git a/libstdc++-v3/configure b/libstdc++-v3/configure
> -index f40ddcf..c57a751 100755
> ---- a/libstdc++-v3/configure
> -+++ b/libstdc++-v3/configure
> -@@ -15822,6 +15822,9 @@ fi
> -   # Default to "generic".
> -   if test $enable_clocale_flag =3D auto; then
> -     case ${target_os} in
> -+      *-uclibc*)
> -+        enable_clocale_flag=3Duclibc
> -+        ;;
> -       linux* | gnu* | kfreebsd*-gnu | knetbsd*-gnu)
> -       enable_clocale_flag=3Dgnu
> -       ;;
> -@@ -16079,6 +16082,78 @@ $as_echo "newlib" >&6; }
> -       CTIME_CC=3Dconfig/locale/generic/time_members.cc
> -       CLOCALE_INTERNAL_H=3Dconfig/locale/generic/c++locale_internal.h
> -       ;;
> -+    uclibc)
> -+      { $as_echo "$as_me:${as_lineno-$LINENO}: result: uclibc" >&5
> -+$as_echo "uclibc" >&6; }
> -+
> -+      # Declare intention to use gettext, and add support for specific
> -+      # languages.
> -+      # For some reason, ALL_LINGUAS has to be before AM-GNU-GETTEXT
> -+      ALL_LINGUAS=3D"de fr"
> -+
> -+      # Don't call AM-GNU-GETTEXT here. Instead, assume glibc.
> -+      # Extract the first word of "msgfmt", so it can be a program name=
 with args.
> -+set dummy msgfmt; ac_word=3D$2
> -+{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
> -+$as_echo_n "checking for $ac_word... " >&6; }
> -+if test "${ac_cv_prog_check_msgfmt+set}" =3D set; then :
> -+  $as_echo_n "(cached) " >&6
> -+else
> -+  if test -n "$check_msgfmt"; then
> -+  ac_cv_prog_check_msgfmt=3D"$check_msgfmt" # Let the user override the=
 test.
> -+else
> -+as_save_IFS=3D$IFS; IFS=3D$PATH_SEPARATOR
> -+for as_dir in $PATH
> -+do
> -+  IFS=3D$as_save_IFS
> -+  test -z "$as_dir" && as_dir=3D.
> -+    for ac_exec_ext in '' $ac_executable_extensions; do
> -+  if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$a=
c_word$ac_exec_ext"; }; then
> -+    ac_cv_prog_check_msgfmt=3D"yes"
> -+    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_ex=
ec_ext" >&5
> -+    break 2
> -+  fi
> -+done
> -+  done
> -+IFS=3D$as_save_IFS
> -+
> -+  test -z "$ac_cv_prog_check_msgfmt" && ac_cv_prog_check_msgfmt=3D"no"
> -+fi
> -+fi
> -+check_msgfmt=3D$ac_cv_prog_check_msgfmt
> -+if test -n "$check_msgfmt"; then
> -+  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $check_msgfmt" >&5
> -+$as_echo "$check_msgfmt" >&6; }
> -+else
> -+  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
> -+$as_echo "no" >&6; }
> -+fi
> -+
> -+
> -+      if test x"$check_msgfmt" =3D x"yes" && test x"$enable_nls" =3D x"=
yes"; then
> -+        USE_NLS=3Dyes
> -+      fi
> -+      # Export the build objects.
> -+      for ling in $ALL_LINGUAS; do \
> -+        glibcxx_MOFILES=3D"$glibcxx_MOFILES $ling.mo"; \
> -+        glibcxx_POFILES=3D"$glibcxx_POFILES $ling.po"; \
> -+      done
> -+
> -+
> -+
> -+      CLOCALE_H=3Dconfig/locale/uclibc/c_locale.h
> -+      CLOCALE_CC=3Dconfig/locale/uclibc/c_locale.cc
> -+      CCODECVT_CC=3Dconfig/locale/uclibc/codecvt_members.cc
> -+      CCOLLATE_CC=3Dconfig/locale/uclibc/collate_members.cc
> -+      CCTYPE_CC=3Dconfig/locale/uclibc/ctype_members.cc
> -+      CMESSAGES_H=3Dconfig/locale/uclibc/messages_members.h
> -+      CMESSAGES_CC=3Dconfig/locale/uclibc/messages_members.cc
> -+      CMONEY_CC=3Dconfig/locale/uclibc/monetary_members.cc
> -+      CNUMERIC_CC=3Dconfig/locale/uclibc/numeric_members.cc
> -+      CTIME_H=3Dconfig/locale/uclibc/time_members.h
> -+      CTIME_CC=3Dconfig/locale/uclibc/time_members.cc
> -+      CLOCALE_INTERNAL_H=3Dconfig/locale/uclibc/c++locale_internal.h
> -+      ;;
> -   esac
> -
> -   # This is where the testsuite looks for locale catalogs, using the
> -diff --git a/libstdc++-v3/include/c_compatibility/wchar.h b/libstdc++-v3=
/include/c_compatibility/wchar.h
> -index 580d725..3fe61b8 100644
> ---- a/libstdc++-v3/include/c_compatibility/wchar.h
> -+++ b/libstdc++-v3/include/c_compatibility/wchar.h
> -@@ -101,7 +101,9 @@ using std::wmemcmp;
> - using std::wmemcpy;
> - using std::wmemmove;
> - using std::wmemset;
> -+#if _GLIBCXX_HAVE_WCSFTIME
> - using std::wcsftime;
> -+#endif
> -
> - #if _GLIBCXX_USE_C99
> - using std::wcstold;
> -diff --git a/libstdc++-v3/include/c_std/cwchar b/libstdc++-v3/include/c_=
std/cwchar
> -index 0e6b1fc..405aee2 100644
> ---- a/libstdc++-v3/include/c_std/cwchar
> -+++ b/libstdc++-v3/include/c_std/cwchar
> -@@ -175,7 +175,9 @@ _GLIBCXX_BEGIN_NAMESPACE_VERSION
> -   using ::wcscoll;
> -   using ::wcscpy;
> -   using ::wcscspn;
> -+#if _GLIBCXX_HAVE_WCSFTIME
> -   using ::wcsftime;
> -+#endif
> -   using ::wcslen;
> -   using ::wcsncat;
> -   using ::wcsncmp;
> ---
> -1.7.10.4
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0005-uclibc-locale-no__x.p=
atch b/meta/recipes-devtools/gcc/gcc-4.9/0005-uclibc-locale-no__x.patch
> deleted file mode 100644
> index dcbbfe4..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.9/0005-uclibc-locale-no__x.patch
> +++ /dev/null
> @@ -1,257 +0,0 @@
> -From 6a3e8506a12c12728d8b29901defd738be43757f Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 29 Mar 2013 08:42:36 +0400
> -Subject: [PATCH 05/35] uclibc-locale-no__x
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Upstream-Status: Pending
> ----
> - .../config/locale/uclibc/c++locale_internal.h      |   45 +++++++++++++=
+++++++
> - libstdc++-v3/config/locale/uclibc/c_locale.cc      |   14 ------
> - libstdc++-v3/config/locale/uclibc/c_locale.h       |    1 +
> - .../config/locale/uclibc/collate_members.cc        |    7 ---
> - libstdc++-v3/config/locale/uclibc/ctype_members.cc |    7 ---
> - .../config/locale/uclibc/messages_members.cc       |    7 +--
> - .../config/locale/uclibc/messages_members.h        |   18 +++-----
> - .../config/locale/uclibc/monetary_members.cc       |    4 --
> - .../config/locale/uclibc/numeric_members.cc        |    3 --
> - libstdc++-v3/config/locale/uclibc/time_members.cc  |    3 --
> - 10 files changed, 55 insertions(+), 54 deletions(-)
> -
> -diff --git a/libstdc++-v3/config/locale/uclibc/c++locale_internal.h b/li=
bstdc++-v3/config/locale/uclibc/c++locale_internal.h
> -index 2ae3e4a..e74fddf 100644
> ---- a/libstdc++-v3/config/locale/uclibc/c++locale_internal.h
> -+++ b/libstdc++-v3/config/locale/uclibc/c++locale_internal.h
> -@@ -60,4 +60,49 @@ extern "C" __typeof(wcsxfrm_l) __wcsxfrm_l;
> - extern "C" __typeof(wctype_l) __wctype_l;
> - #endif
> -
> -+# define __nl_langinfo_l nl_langinfo_l
> -+# define __strcoll_l strcoll_l
> -+# define __strftime_l strftime_l
> -+# define __strtod_l strtod_l
> -+# define __strtof_l strtof_l
> -+# define __strtold_l strtold_l
> -+# define __strxfrm_l strxfrm_l
> -+# define __newlocale newlocale
> -+# define __freelocale freelocale
> -+# define __duplocale duplocale
> -+# define __uselocale uselocale
> -+
> -+# ifdef _GLIBCXX_USE_WCHAR_T
> -+#  define __iswctype_l iswctype_l
> -+#  define __towlower_l towlower_l
> -+#  define __towupper_l towupper_l
> -+#  define __wcscoll_l wcscoll_l
> -+#  define __wcsftime_l wcsftime_l
> -+#  define __wcsxfrm_l wcsxfrm_l
> -+#  define __wctype_l wctype_l
> -+# endif
> -+
> -+#else
> -+# define __nl_langinfo_l(N, L)       nl_langinfo((N))
> -+# define __strcoll_l(S1, S2, L)      strcoll((S1), (S2))
> -+# define __strtod_l(S, E, L)         strtod((S), (E))
> -+# define __strtof_l(S, E, L)         strtof((S), (E))
> -+# define __strtold_l(S, E, L)        strtold((S), (E))
> -+# define __strxfrm_l(S1, S2, N, L)   strxfrm((S1), (S2), (N))
> -+# warning should dummy __newlocale check for C|POSIX ?
> -+# define __newlocale(a, b, c)        NULL
> -+# define __freelocale(a)             ((void)0)
> -+# define __duplocale(a)              __c_locale()
> -+//# define __uselocale ?
> -+//
> -+# ifdef _GLIBCXX_USE_WCHAR_T
> -+#  define __iswctype_l(C, M, L)       iswctype((C), (M))
> -+#  define __towlower_l(C, L)          towlower((C))
> -+#  define __towupper_l(C, L)          towupper((C))
> -+#  define __wcscoll_l(S1, S2, L)      wcscoll((S1), (S2))
> -+//#  define __wcsftime_l(S, M, F, T, L)  wcsftime((S), (M), (F), (T))
> -+#  define __wcsxfrm_l(S1, S2, N, L)   wcsxfrm((S1), (S2), (N))
> -+#  define __wctype_l(S, L)            wctype((S))
> -+# endif
> -+
> - #endif // GLIBC 2.3 and later
> -diff --git a/libstdc++-v3/config/locale/uclibc/c_locale.cc b/libstdc++-v=
3/config/locale/uclibc/c_locale.cc
> -index 5081dc1..21430d0 100644
> ---- a/libstdc++-v3/config/locale/uclibc/c_locale.cc
> -+++ b/libstdc++-v3/config/locale/uclibc/c_locale.cc
> -@@ -39,20 +39,6 @@
> - #include <langinfo.h>
> - #include <bits/c++locale_internal.h>
> -
> --#ifndef __UCLIBC_HAS_XLOCALE__
> --#define __strtol_l(S, E, B, L)      strtol((S), (E), (B))
> --#define __strtoul_l(S, E, B, L)     strtoul((S), (E), (B))
> --#define __strtoll_l(S, E, B, L)     strtoll((S), (E), (B))
> --#define __strtoull_l(S, E, B, L)    strtoull((S), (E), (B))
> --#define __strtof_l(S, E, L)         strtof((S), (E))
> --#define __strtod_l(S, E, L)         strtod((S), (E))
> --#define __strtold_l(S, E, L)        strtold((S), (E))
> --#warning should dummy __newlocale check for C|POSIX ?
> --#define __newlocale(a, b, c)        NULL
> --#define __freelocale(a)             ((void)0)
> --#define __duplocale(a)              __c_locale()
> --#endif
> --
> - namespace std
> - {
> -   template<>
> -diff --git a/libstdc++-v3/config/locale/uclibc/c_locale.h b/libstdc++-v3=
/config/locale/uclibc/c_locale.h
> -index da07c1f..4bca5f1 100644
> ---- a/libstdc++-v3/config/locale/uclibc/c_locale.h
> -+++ b/libstdc++-v3/config/locale/uclibc/c_locale.h
> -@@ -68,6 +68,7 @@ namespace __gnu_cxx
> - {
> -   extern "C" __typeof(uselocale) __uselocale;
> - }
> -+#define __uselocale uselocale
> - #endif
> -
> - namespace std
> -diff --git a/libstdc++-v3/config/locale/uclibc/collate_members.cc b/libs=
tdc++-v3/config/locale/uclibc/collate_members.cc
> -index c2664a7..ec5c329 100644
> ---- a/libstdc++-v3/config/locale/uclibc/collate_members.cc
> -+++ b/libstdc++-v3/config/locale/uclibc/collate_members.cc
> -@@ -36,13 +36,6 @@
> - #include <locale>
> - #include <bits/c++locale_internal.h>
> -
> --#ifndef __UCLIBC_HAS_XLOCALE__
> --#define __strcoll_l(S1, S2, L)      strcoll((S1), (S2))
> --#define __strxfrm_l(S1, S2, N, L)   strxfrm((S1), (S2), (N))
> --#define __wcscoll_l(S1, S2, L)      wcscoll((S1), (S2))
> --#define __wcsxfrm_l(S1, S2, N, L)   wcsxfrm((S1), (S2), (N))
> --#endif
> --
> - namespace std
> - {
> -   // These are basically extensions to char_traits, and perhaps should
> -diff --git a/libstdc++-v3/config/locale/uclibc/ctype_members.cc b/libstd=
c++-v3/config/locale/uclibc/ctype_members.cc
> -index 7294e3a..7b12861 100644
> ---- a/libstdc++-v3/config/locale/uclibc/ctype_members.cc
> -+++ b/libstdc++-v3/config/locale/uclibc/ctype_members.cc
> -@@ -38,13 +38,6 @@
> - #undef _LIBC
> - #include <bits/c++locale_internal.h>
> -
> --#ifndef __UCLIBC_HAS_XLOCALE__
> --#define __wctype_l(S, L)           wctype((S))
> --#define __towupper_l(C, L)         towupper((C))
> --#define __towlower_l(C, L)         towlower((C))
> --#define __iswctype_l(C, M, L)      iswctype((C), (M))
> --#endif
> --
> - namespace std
> - {
> -   // NB: The other ctype<char> specializations are in src/locale.cc and
> -diff --git a/libstdc++-v3/config/locale/uclibc/messages_members.cc b/lib=
stdc++-v3/config/locale/uclibc/messages_members.cc
> -index 13594d9..d7693b4 100644
> ---- a/libstdc++-v3/config/locale/uclibc/messages_members.cc
> -+++ b/libstdc++-v3/config/locale/uclibc/messages_members.cc
> -@@ -39,13 +39,10 @@
> - #ifdef __UCLIBC_MJN3_ONLY__
> - #warning fix gettext stuff
> - #endif
> --#ifdef __UCLIBC_HAS_GETTEXT_AWARENESS__
> --extern "C" char *__dcgettext(const char *domainname,
> --                           const char *msgid, int category);
> - #undef gettext
> --#define gettext(msgid) __dcgettext(NULL, msgid, LC_MESSAGES)
> -+#ifdef __UCLIBC_HAS_GETTEXT_AWARENESS__
> -+#define gettext(msgid) dcgettext(NULL, msgid, LC_MESSAGES)
> - #else
> --#undef gettext
> - #define gettext(msgid) (msgid)
> - #endif
> -
> -diff --git a/libstdc++-v3/config/locale/uclibc/messages_members.h b/libs=
tdc++-v3/config/locale/uclibc/messages_members.h
> -index 1424078..d89da33 100644
> ---- a/libstdc++-v3/config/locale/uclibc/messages_members.h
> -+++ b/libstdc++-v3/config/locale/uclibc/messages_members.h
> -@@ -36,15 +36,11 @@
> - #ifdef __UCLIBC_MJN3_ONLY__
> - #warning fix prototypes for *textdomain funcs
> - #endif
> --#ifdef __UCLIBC_HAS_GETTEXT_AWARENESS__
> --extern "C" char *__textdomain(const char *domainname);
> --extern "C" char *__bindtextdomain(const char *domainname,
> --                                const char *dirname);
> --#else
> --#undef __textdomain
> --#undef __bindtextdomain
> --#define __textdomain(D)           ((void)0)
> --#define __bindtextdomain(D,P)     ((void)0)
> -+#ifndef __UCLIBC_HAS_GETTEXT_AWARENESS__
> -+#undef textdomain
> -+#undef bindtextdomain
> -+#define textdomain(D)           ((void)0)
> -+#define bindtextdomain(D,P)     ((void)0)
> - #endif
> -
> -   // Non-virtual member functions.
> -@@ -70,7 +66,7 @@ extern "C" char *__bindtextdomain(const char *domainna=
me,
> -     messages<_CharT>::open(const basic_string<char>& __s, const locale&=
 __loc,
> -                          const char* __dir) const
> -     {
> --      __bindtextdomain(__s.c_str(), __dir);
> -+      bindtextdomain(__s.c_str(), __dir);
> -       return this->do_open(__s, __loc);
> -     }
> -
> -@@ -90,7 +86,7 @@ extern "C" char *__bindtextdomain(const char *domainna=
me,
> -     {
> -       // No error checking is done, assume the catalog exists and can
> -       // be used.
> --      __textdomain(__s.c_str());
> -+      textdomain(__s.c_str());
> -       return 0;
> -     }
> -
> -diff --git a/libstdc++-v3/config/locale/uclibc/monetary_members.cc b/lib=
stdc++-v3/config/locale/uclibc/monetary_members.cc
> -index aa52731..2e6f80a 100644
> ---- a/libstdc++-v3/config/locale/uclibc/monetary_members.cc
> -+++ b/libstdc++-v3/config/locale/uclibc/monetary_members.cc
> -@@ -43,10 +43,6 @@
> - #warning tailor for stub locale support
> - #endif
> -
> --#ifndef __UCLIBC_HAS_XLOCALE__
> --#define __nl_langinfo_l(N, L)         nl_langinfo((N))
> --#endif
> --
> - namespace std
> - {
> -   // Construct and return valid pattern consisting of some combination =
of:
> -diff --git a/libstdc++-v3/config/locale/uclibc/numeric_members.cc b/libs=
tdc++-v3/config/locale/uclibc/numeric_members.cc
> -index 883ec1a..2c70642 100644
> ---- a/libstdc++-v3/config/locale/uclibc/numeric_members.cc
> -+++ b/libstdc++-v3/config/locale/uclibc/numeric_members.cc
> -@@ -41,9 +41,6 @@
> - #ifdef __UCLIBC_MJN3_ONLY__
> - #warning tailor for stub locale support
> - #endif
> --#ifndef __UCLIBC_HAS_XLOCALE__
> --#define __nl_langinfo_l(N, L)         nl_langinfo((N))
> --#endif
> -
> - namespace std
> - {
> -diff --git a/libstdc++-v3/config/locale/uclibc/time_members.cc b/libstdc=
++-v3/config/locale/uclibc/time_members.cc
> -index e0707d7..d848ed5 100644
> ---- a/libstdc++-v3/config/locale/uclibc/time_members.cc
> -+++ b/libstdc++-v3/config/locale/uclibc/time_members.cc
> -@@ -40,9 +40,6 @@
> - #ifdef __UCLIBC_MJN3_ONLY__
> - #warning tailor for stub locale support
> - #endif
> --#ifndef __UCLIBC_HAS_XLOCALE__
> --#define __nl_langinfo_l(N, L)         nl_langinfo((N))
> --#endif
> -
> - namespace std
> - {
> ---
> -1.7.10.4
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0006-uclibc-locale-wchar_f=
ix.patch b/meta/recipes-devtools/gcc/gcc-4.9/0006-uclibc-locale-wchar_fix.p=
atch
> deleted file mode 100644
> index 3406859..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.9/0006-uclibc-locale-wchar_fix.patc=
h
> +++ /dev/null
> @@ -1,68 +0,0 @@
> -From 225511a3aeb193a916b3999f0b640a392caa67cd Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 29 Mar 2013 08:45:57 +0400
> -Subject: [PATCH 06/35] uclibc-locale-wchar_fix
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Upstream-Status: Pending
> ----
> - libstdc++-v3/config/locale/uclibc/monetary_members.cc |    4 ++--
> - libstdc++-v3/config/locale/uclibc/numeric_members.cc  |   13 ++++++++++=
+++
> - 2 files changed, 15 insertions(+), 2 deletions(-)
> -
> -diff --git a/libstdc++-v3/config/locale/uclibc/monetary_members.cc b/lib=
stdc++-v3/config/locale/uclibc/monetary_members.cc
> -index 2e6f80a..31ebb9f 100644
> ---- a/libstdc++-v3/config/locale/uclibc/monetary_members.cc
> -+++ b/libstdc++-v3/config/locale/uclibc/monetary_members.cc
> -@@ -401,7 +401,7 @@ namespace std
> - # ifdef __UCLIBC_HAS_XLOCALE__
> -         _M_data->_M_decimal_point =3D __cloc->decimal_point_wc;
> -         _M_data->_M_thousands_sep =3D __cloc->thousands_sep_wc;
> --# else
> -+# elif defined __UCLIBC_HAS_LOCALE__
> -         _M_data->_M_decimal_point =3D __global_locale->decimal_point_wc=
;
> -         _M_data->_M_thousands_sep =3D __global_locale->thousands_sep_wc=
;
> - # endif
> -@@ -556,7 +556,7 @@ namespace std
> - # ifdef __UCLIBC_HAS_XLOCALE__
> -         _M_data->_M_decimal_point =3D __cloc->decimal_point_wc;
> -         _M_data->_M_thousands_sep =3D __cloc->thousands_sep_wc;
> --# else
> -+# elif defined __UCLIBC_HAS_LOCALE__
> -         _M_data->_M_decimal_point =3D __global_locale->decimal_point_wc=
;
> -         _M_data->_M_thousands_sep =3D __global_locale->thousands_sep_wc=
;
> - # endif
> -diff --git a/libstdc++-v3/config/locale/uclibc/numeric_members.cc b/libs=
tdc++-v3/config/locale/uclibc/numeric_members.cc
> -index 2c70642..d5c8961 100644
> ---- a/libstdc++-v3/config/locale/uclibc/numeric_members.cc
> -+++ b/libstdc++-v3/config/locale/uclibc/numeric_members.cc
> -@@ -127,12 +127,25 @@ namespace std
> -       {
> -         // Named locale.
> -         // NB: In the GNU model wchar_t is always 32 bit wide.
> -+#ifdef __UCLIBC_MJN3_ONLY__
> -+#warning fix this... should be numeric
> -+#endif
> -+#ifdef __UCLIBC__
> -+# ifdef __UCLIBC_HAS_XLOCALE__
> -+        _M_data->_M_decimal_point =3D __cloc->decimal_point_wc;
> -+        _M_data->_M_thousands_sep =3D __cloc->thousands_sep_wc;
> -+# elif defined __UCLIBC_HAS_LOCALE__
> -+        _M_data->_M_decimal_point =3D __global_locale->decimal_point_wc=
;
> -+        _M_data->_M_thousands_sep =3D __global_locale->thousands_sep_wc=
;
> -+# endif
> -+#else
> -         union { char *__s; wchar_t __w; } __u;
> -         __u.__s =3D __nl_langinfo_l(_NL_NUMERIC_DECIMAL_POINT_WC, __clo=
c);
> -         _M_data->_M_decimal_point =3D __u.__w;
> -
> -         __u.__s =3D __nl_langinfo_l(_NL_NUMERIC_THOUSANDS_SEP_WC, __clo=
c);
> -         _M_data->_M_thousands_sep =3D __u.__w;
> -+#endif
> -
> -         if (_M_data->_M_thousands_sep =3D=3D L'\0')
> -           _M_data->_M_grouping =3D "";
> ---
> -1.7.10.4
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0007-uclibc-locale-update.=
patch b/meta/recipes-devtools/gcc/gcc-4.9/0007-uclibc-locale-update.patch
> deleted file mode 100644
> index 5851123..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.9/0007-uclibc-locale-update.patch
> +++ /dev/null
> @@ -1,542 +0,0 @@
> -From 6ffe7c46f52d27864c3df3663e16ec9ddee71e8f Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 29 Mar 2013 08:46:58 +0400
> -Subject: [PATCH 07/35] uclibc-locale-update
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Upstream-Status: Pending
> ----
> - .../config/locale/uclibc/c++locale_internal.h      |    3 +
> - libstdc++-v3/config/locale/uclibc/c_locale.cc      |   74 +++++++++----=
-------
> - libstdc++-v3/config/locale/uclibc/c_locale.h       |   42 ++++++-----
> - libstdc++-v3/config/locale/uclibc/ctype_members.cc |   51 ++++++++++---=
-
> - .../config/locale/uclibc/messages_members.h        |   12 ++--
> - .../config/locale/uclibc/monetary_members.cc       |   34 +++++----
> - .../config/locale/uclibc/numeric_members.cc        |    5 ++
> - libstdc++-v3/config/locale/uclibc/time_members.cc  |   18 +++--
> - libstdc++-v3/config/locale/uclibc/time_members.h   |   17 +++--
> - 9 files changed, 158 insertions(+), 98 deletions(-)
> -
> -diff --git a/libstdc++-v3/config/locale/uclibc/c++locale_internal.h b/li=
bstdc++-v3/config/locale/uclibc/c++locale_internal.h
> -index e74fddf..971a6b4 100644
> ---- a/libstdc++-v3/config/locale/uclibc/c++locale_internal.h
> -+++ b/libstdc++-v3/config/locale/uclibc/c++locale_internal.h
> -@@ -31,6 +31,9 @@
> -
> - #include <bits/c++config.h>
> - #include <clocale>
> -+#include <cstdlib>
> -+#include <cstring>
> -+#include <cstddef>
> -
> - #ifdef __UCLIBC_MJN3_ONLY__
> - #warning clean this up
> -diff --git a/libstdc++-v3/config/locale/uclibc/c_locale.cc b/libstdc++-v=
3/config/locale/uclibc/c_locale.cc
> -index 21430d0..1b9d8e1 100644
> ---- a/libstdc++-v3/config/locale/uclibc/c_locale.cc
> -+++ b/libstdc++-v3/config/locale/uclibc/c_locale.cc
> -@@ -39,23 +39,20 @@
> - #include <langinfo.h>
> - #include <bits/c++locale_internal.h>
> -
> --namespace std
> --{
> -+_GLIBCXX_BEGIN_NAMESPACE(std)
> -+
> -   template<>
> -     void
> -     __convert_to_v(const char* __s, float& __v, ios_base::iostate& __er=
r,
> -                  const __c_locale& __cloc)
> -     {
> --      if (!(__err & ios_base::failbit))
> --      {
> --        char* __sanity;
> --        errno =3D 0;
> --        float __f =3D __strtof_l(__s, &__sanity, __cloc);
> --          if (__sanity !=3D __s && errno !=3D ERANGE)
> --          __v =3D __f;
> --        else
> --          __err |=3D ios_base::failbit;
> --      }
> -+      char* __sanity;
> -+      errno =3D 0;
> -+      float __f =3D __strtof_l(__s, &__sanity, __cloc);
> -+      if (__sanity !=3D __s && errno !=3D ERANGE)
> -+      __v =3D __f;
> -+      else
> -+      __err |=3D ios_base::failbit;
> -     }
> -
> -   template<>
> -@@ -63,16 +60,13 @@ namespace std
> -     __convert_to_v(const char* __s, double& __v, ios_base::iostate& __e=
rr,
> -                  const __c_locale& __cloc)
> -     {
> --      if (!(__err & ios_base::failbit))
> --      {
> --        char* __sanity;
> --        errno =3D 0;
> --        double __d =3D __strtod_l(__s, &__sanity, __cloc);
> --          if (__sanity !=3D __s && errno !=3D ERANGE)
> --          __v =3D __d;
> --        else
> --          __err |=3D ios_base::failbit;
> --      }
> -+      char* __sanity;
> -+      errno =3D 0;
> -+      double __d =3D __strtod_l(__s, &__sanity, __cloc);
> -+      if (__sanity !=3D __s && errno !=3D ERANGE)
> -+      __v =3D __d;
> -+      else
> -+      __err |=3D ios_base::failbit;
> -     }
> -
> -   template<>
> -@@ -80,16 +74,13 @@ namespace std
> -     __convert_to_v(const char* __s, long double& __v, ios_base::iostate=
& __err,
> -                  const __c_locale& __cloc)
> -     {
> --      if (!(__err & ios_base::failbit))
> --      {
> --        char* __sanity;
> --        errno =3D 0;
> --        long double __ld =3D __strtold_l(__s, &__sanity, __cloc);
> --          if (__sanity !=3D __s && errno !=3D ERANGE)
> --          __v =3D __ld;
> --        else
> --          __err |=3D ios_base::failbit;
> --      }
> -+      char* __sanity;
> -+      errno =3D 0;
> -+      long double __ld =3D __strtold_l(__s, &__sanity, __cloc);
> -+      if (__sanity !=3D __s && errno !=3D ERANGE)
> -+      __v =3D __ld;
> -+      else
> -+      __err |=3D ios_base::failbit;
> -     }
> -
> -   void
> -@@ -110,17 +101,18 @@ namespace std
> -   void
> -   locale::facet::_S_destroy_c_locale(__c_locale& __cloc)
> -   {
> --    if (_S_get_c_locale() !=3D __cloc)
> -+    if (__cloc && _S_get_c_locale() !=3D __cloc)
> -       __freelocale(__cloc);
> -   }
> -
> -   __c_locale
> -   locale::facet::_S_clone_c_locale(__c_locale& __cloc)
> -   { return __duplocale(__cloc); }
> --} // namespace std
> -
> --namespace __gnu_cxx
> --{
> -+_GLIBCXX_END_NAMESPACE
> -+
> -+_GLIBCXX_BEGIN_NAMESPACE(__gnu_cxx)
> -+
> -   const char* const category_names[6 + _GLIBCXX_NUM_CATEGORIES] =3D
> -     {
> -       "LC_CTYPE",
> -@@ -138,9 +130,11 @@ namespace __gnu_cxx
> -       "LC_IDENTIFICATION"
> - #endif
> -     };
> --}
> -
> --namespace std
> --{
> -+_GLIBCXX_END_NAMESPACE
> -+
> -+_GLIBCXX_BEGIN_NAMESPACE(std)
> -+
> -   const char* const* const locale::_S_categories =3D __gnu_cxx::categor=
y_names;
> --}  // namespace std
> -+
> -+_GLIBCXX_END_NAMESPACE
> -diff --git a/libstdc++-v3/config/locale/uclibc/c_locale.h b/libstdc++-v3=
/config/locale/uclibc/c_locale.h
> -index 4bca5f1..64a6d46 100644
> ---- a/libstdc++-v3/config/locale/uclibc/c_locale.h
> -+++ b/libstdc++-v3/config/locale/uclibc/c_locale.h
> -@@ -39,21 +39,23 @@
> - #pragma GCC system_header
> -
> - #include <cstring>              // get std::strlen
> --#include <cstdio>               // get std::snprintf or std::sprintf
> -+#include <cstdio>               // get std::vsnprintf or std::vsprintf
> - #include <clocale>
> - #include <langinfo.h>         // For codecvt
> - #ifdef __UCLIBC_MJN3_ONLY__
> - #warning fix this
> - #endif
> --#ifdef __UCLIBC_HAS_LOCALE__
> -+#ifdef _GLIBCXX_USE_ICONV
> - #include <iconv.h>            // For codecvt using iconv, iconv_t
> - #endif
> --#ifdef __UCLIBC_HAS_GETTEXT_AWARENESS__
> --#include <libintl.h>          // For messages
> -+#ifdef HAVE_LIBINTL_H
> -+#include <libintl.h>          // For messages
> - #endif
> -+#include <cstdarg>
> -
> - #ifdef __UCLIBC_MJN3_ONLY__
> - #warning what is _GLIBCXX_C_LOCALE_GNU for
> -+// psm: used in os/gnu-linux/ctype_noninline.h
> - #endif
> - #define _GLIBCXX_C_LOCALE_GNU 1
> -
> -@@ -78,23 +80,25 @@ namespace std
> - #else
> -   typedef int*                        __c_locale;
> - #endif
> --
> --  // Convert numeric value of type _Tv to string and return length of
> --  // string.  If snprintf is available use it, otherwise fall back to
> --  // the unsafe sprintf which, in general, can be dangerous and should
> -+  // Convert numeric value of type double to string and return length o=
f
> -+  // string.  If vsnprintf is available use it, otherwise fall back to
> -+  // the unsafe vsprintf which, in general, can be dangerous and should
> -   // be avoided.
> --  template<typename _Tv>
> --    int
> --    __convert_from_v(char* __out,
> --                   const int __size __attribute__ ((__unused__)),
> --                   const char* __fmt,
> --#ifdef __UCLIBC_HAS_XCLOCALE__
> --                   _Tv __v, const __c_locale& __cloc, int __prec)
> -+    inline int
> -+    __convert_from_v(const __c_locale&
> -+#ifndef __UCLIBC_HAS_XCLOCALE__
> -+      __cloc __attribute__ ((__unused__))
> -+#endif
> -+                   ,
> -+                   char* __out,
> -+                   const int __size,
> -+                   const char* __fmt, ...)
> -     {
> -+      va_list __args;
> -+#ifdef __UCLIBC_HAS_XCLOCALE__
> -+
> -       __c_locale __old =3D __gnu_cxx::__uselocale(__cloc);
> - #else
> --                   _Tv __v, const __c_locale&, int __prec)
> --    {
> - # ifdef __UCLIBC_HAS_LOCALE__
> -       char* __old =3D std::setlocale(LC_ALL, NULL);
> -       char* __sav =3D new char[std::strlen(__old) + 1];
> -@@ -103,7 +107,9 @@ namespace std
> - # endif
> - #endif
> -
> --      const int __ret =3D std::snprintf(__out, __size, __fmt, __prec, _=
_v);
> -+      va_start(__args, __fmt);
> -+      const int __ret =3D std::vsnprintf(__out, __size, __fmt, __args);
> -+      va_end(__args);
> -
> - #ifdef __UCLIBC_HAS_XCLOCALE__
> -       __gnu_cxx::__uselocale(__old);
> -diff --git a/libstdc++-v3/config/locale/uclibc/ctype_members.cc b/libstd=
c++-v3/config/locale/uclibc/ctype_members.cc
> -index 7b12861..13e011d 100644
> ---- a/libstdc++-v3/config/locale/uclibc/ctype_members.cc
> -+++ b/libstdc++-v3/config/locale/uclibc/ctype_members.cc
> -@@ -33,16 +33,20 @@
> -
> - // Written by Benjamin Kosnik <bkoz@redhat.com>
> -
> -+#include <features.h>
> -+#ifdef __UCLIBC_HAS_LOCALE__
> - #define _LIBC
> - #include <locale>
> - #undef _LIBC
> -+#else
> -+#include <locale>
> -+#endif
> - #include <bits/c++locale_internal.h>
> -
> --namespace std
> --{
> -+_GLIBCXX_BEGIN_NAMESPACE(std)
> -+
> -   // NB: The other ctype<char> specializations are in src/locale.cc and
> -   // various /config/os/* files.
> --  template<>
> -     ctype_byname<char>::ctype_byname(const char* __s, size_t __refs)
> -     : ctype<char>(0, false, __refs)
> -     {
> -@@ -57,6 +61,8 @@ namespace std
> - #endif
> -       }
> -     }
> -+    ctype_byname<char>::~ctype_byname()
> -+    { }
> -
> - #ifdef _GLIBCXX_USE_WCHAR_T
> -   ctype<wchar_t>::__wmask_type
> -@@ -138,17 +144,33 @@ namespace std
> -   ctype<wchar_t>::
> -   do_is(mask __m, wchar_t __c) const
> -   {
> --    // Highest bitmask in ctype_base =3D=3D 10, but extra in "C"
> --    // library for blank.
> -+    // The case of __m =3D=3D ctype_base::space is particularly importa=
nt,
> -+    // due to its use in many istream functions.  Therefore we deal wit=
h
> -+    // it first, exploiting the knowledge that on GNU systems _M_bit[5]
> -+    // is the mask corresponding to ctype_base::space.  NB: an encoding
> -+    // change would not affect correctness!
> -+
> -     bool __ret =3D false;
> --    const size_t __bitmasksize =3D 11;
> --    for (size_t __bitcur =3D 0; __bitcur <=3D __bitmasksize; ++__bitcur=
)
> --      if (__m & _M_bit[__bitcur]
> --        && __iswctype_l(__c, _M_wmask[__bitcur], _M_c_locale_ctype))
> --      {
> --        __ret =3D true;
> --        break;
> --      }
> -+    if (__m =3D=3D _M_bit[5])
> -+      __ret =3D __iswctype_l(__c, _M_wmask[5], _M_c_locale_ctype);
> -+    else
> -+      {
> -+      // Highest bitmask in ctype_base =3D=3D 10, but extra in "C"
> -+      // library for blank.
> -+      const size_t __bitmasksize =3D 11;
> -+      for (size_t __bitcur =3D 0; __bitcur <=3D __bitmasksize; ++__bitc=
ur)
> -+        if (__m & _M_bit[__bitcur])
> -+          {
> -+            if (__iswctype_l(__c, _M_wmask[__bitcur], _M_c_locale_ctype=
))
> -+              {
> -+                __ret =3D true;
> -+                break;
> -+              }
> -+            else if (__m =3D=3D _M_bit[__bitcur])
> -+              break;
> -+          }
> -+      }
> -+
> -     return __ret;
> -   }
> -
> -@@ -290,4 +312,5 @@ namespace std
> - #endif
> -   }
> - #endif //  _GLIBCXX_USE_WCHAR_T
> --}
> -+
> -+_GLIBCXX_END_NAMESPACE
> -diff --git a/libstdc++-v3/config/locale/uclibc/messages_members.h b/libs=
tdc++-v3/config/locale/uclibc/messages_members.h
> -index d89da33..067657a 100644
> ---- a/libstdc++-v3/config/locale/uclibc/messages_members.h
> -+++ b/libstdc++-v3/config/locale/uclibc/messages_members.h
> -@@ -53,12 +53,16 @@
> -   template<typename _CharT>
> -      messages<_CharT>::messages(__c_locale __cloc, const char* __s,
> -                               size_t __refs)
> --     : facet(__refs), _M_c_locale_messages(_S_clone_c_locale(__cloc)),
> --     _M_name_messages(__s)
> -+     : facet(__refs), _M_c_locale_messages(NULL),
> -+     _M_name_messages(NULL)
> -      {
> --       char* __tmp =3D new char[std::strlen(__s) + 1];
> --       std::strcpy(__tmp, __s);
> -+       const size_t __len =3D std::strlen(__s) + 1;
> -+       char* __tmp =3D new char[__len];
> -+       std::memcpy(__tmp, __s, __len);
> -        _M_name_messages =3D __tmp;
> -+
> -+       // Last to avoid leaking memory if new throws.
> -+       _M_c_locale_messages =3D _S_clone_c_locale(__cloc);
> -      }
> -
> -   template<typename _CharT>
> -diff --git a/libstdc++-v3/config/locale/uclibc/monetary_members.cc b/lib=
stdc++-v3/config/locale/uclibc/monetary_members.cc
> -index 31ebb9f..7679b9c 100644
> ---- a/libstdc++-v3/config/locale/uclibc/monetary_members.cc
> -+++ b/libstdc++-v3/config/locale/uclibc/monetary_members.cc
> -@@ -33,9 +33,14 @@
> -
> - // Written by Benjamin Kosnik <bkoz@redhat.com>
> -
> -+#include <features.h>
> -+#ifdef __UCLIBC_HAS_LOCALE__
> - #define _LIBC
> - #include <locale>
> - #undef _LIBC
> -+#else
> -+#include <locale>
> -+#endif
> - #include <bits/c++locale_internal.h>
> -
> - #ifdef __UCLIBC_MJN3_ONLY__
> -@@ -206,7 +211,7 @@ namespace std
> -         }
> -       break;
> -       default:
> --      ;
> -+      __ret =3D pattern();
> -       }
> -     return __ret;
> -   }
> -@@ -390,7 +395,9 @@ namespace std
> -         __c_locale __old =3D __uselocale(__cloc);
> - #else
> -         // Switch to named locale so that mbsrtowcs will work.
> --        char* __old =3D strdup(setlocale(LC_ALL, NULL));
> -+        char* __old =3D setlocale(LC_ALL, NULL);
> -+          const size_t __llen =3D strlen(__old) + 1;
> -+          char* __sav =3D new char[__llen];
> -         setlocale(LC_ALL, __name);
> - #endif
> -
> -@@ -477,8 +484,8 @@ namespace std
> - #ifdef __UCLIBC_HAS_XLOCALE__
> -             __uselocale(__old);
> - #else
> --            setlocale(LC_ALL, __old);
> --            free(__old);
> -+            setlocale(LC_ALL, __sav);
> -+            delete [] __sav;
> - #endif
> -             __throw_exception_again;
> -           }
> -@@ -498,8 +505,8 @@ namespace std
> - #ifdef __UCLIBC_HAS_XLOCALE__
> -         __uselocale(__old);
> - #else
> --        setlocale(LC_ALL, __old);
> --        free(__old);
> -+        setlocale(LC_ALL, __sav);
> -+        delete [] __sav;
> - #endif
> -       }
> -     }
> -@@ -545,8 +552,11 @@ namespace std
> -         __c_locale __old =3D __uselocale(__cloc);
> - #else
> -         // Switch to named locale so that mbsrtowcs will work.
> --        char* __old =3D strdup(setlocale(LC_ALL, NULL));
> --        setlocale(LC_ALL, __name);
> -+          char* __old =3D setlocale(LC_ALL, NULL);
> -+          const size_t __llen =3D strlen(__old) + 1;
> -+          char* __sav =3D new char[__llen];
> -+          memcpy(__sav, __old, __llen);
> -+          setlocale(LC_ALL, __name);
> - #endif
> -
> - #ifdef __UCLIBC_MJN3_ONLY__
> -@@ -633,8 +643,8 @@ namespace std
> - #ifdef __UCLIBC_HAS_XLOCALE__
> -             __uselocale(__old);
> - #else
> --            setlocale(LC_ALL, __old);
> --            free(__old);
> -+            setlocale(LC_ALL, __sav);
> -+            delete [] __sav;
> - #endif
> -               __throw_exception_again;
> -           }
> -@@ -653,8 +663,8 @@ namespace std
> - #ifdef __UCLIBC_HAS_XLOCALE__
> -         __uselocale(__old);
> - #else
> --        setlocale(LC_ALL, __old);
> --        free(__old);
> -+        setlocale(LC_ALL, __sav);
> -+        delete [] __sav;
> - #endif
> -       }
> -     }
> -diff --git a/libstdc++-v3/config/locale/uclibc/numeric_members.cc b/libs=
tdc++-v3/config/locale/uclibc/numeric_members.cc
> -index d5c8961..8ae8969 100644
> ---- a/libstdc++-v3/config/locale/uclibc/numeric_members.cc
> -+++ b/libstdc++-v3/config/locale/uclibc/numeric_members.cc
> -@@ -33,9 +33,14 @@
> -
> - // Written by Benjamin Kosnik <bkoz@redhat.com>
> -
> -+#include <features.h>
> -+#ifdef __UCLIBC_HAS_LOCALE__
> - #define _LIBC
> - #include <locale>
> - #undef _LIBC
> -+#else
> -+#include <locale>
> -+#endif
> - #include <bits/c++locale_internal.h>
> -
> - #ifdef __UCLIBC_MJN3_ONLY__
> -diff --git a/libstdc++-v3/config/locale/uclibc/time_members.cc b/libstdc=
++-v3/config/locale/uclibc/time_members.cc
> -index d848ed5..f24d53e 100644
> ---- a/libstdc++-v3/config/locale/uclibc/time_members.cc
> -+++ b/libstdc++-v3/config/locale/uclibc/time_members.cc
> -@@ -53,11 +53,14 @@ namespace std
> -       const size_t __len =3D __strftime_l(__s, __maxlen, __format, __tm=
,
> -                                       _M_c_locale_timepunct);
> - #else
> --      char* __old =3D strdup(setlocale(LC_ALL, NULL));
> -+      char* __old =3D setlocale(LC_ALL, NULL);
> -+      const size_t __llen =3D strlen(__old) + 1;
> -+      char* __sav =3D new char[__llen];
> -+      memcpy(__sav, __old, __llen);
> -       setlocale(LC_ALL, _M_name_timepunct);
> -       const size_t __len =3D strftime(__s, __maxlen, __format, __tm);
> --      setlocale(LC_ALL, __old);
> --      free(__old);
> -+      setlocale(LC_ALL, __sav);
> -+      delete [] __sav;
> - #endif
> -       // Make sure __s is null terminated.
> -       if (__len =3D=3D 0)
> -@@ -207,11 +210,14 @@ namespace std
> -       const size_t __len =3D __wcsftime_l(__s, __maxlen, __format, __tm=
,
> -                                       _M_c_locale_timepunct);
> - #else
> --      char* __old =3D strdup(setlocale(LC_ALL, NULL));
> -+      char* __old =3D setlocale(LC_ALL, NULL);
> -+      const size_t __llen =3D strlen(__old) + 1;
> -+      char* __sav =3D new char[__llen];
> -+      memcpy(__sav, __old, __llen);
> -       setlocale(LC_ALL, _M_name_timepunct);
> -       const size_t __len =3D wcsftime(__s, __maxlen, __format, __tm);
> --      setlocale(LC_ALL, __old);
> --      free(__old);
> -+      setlocale(LC_ALL, __sav);
> -+      delete [] __sav;
> - #endif
> -       // Make sure __s is null terminated.
> -       if (__len =3D=3D 0)
> -diff --git a/libstdc++-v3/config/locale/uclibc/time_members.h b/libstdc+=
+-v3/config/locale/uclibc/time_members.h
> -index ba8e858..1665dde 100644
> ---- a/libstdc++-v3/config/locale/uclibc/time_members.h
> -+++ b/libstdc++-v3/config/locale/uclibc/time_members.h
> -@@ -50,12 +50,21 @@
> -     __timepunct<_CharT>::__timepunct(__c_locale __cloc, const char* __s=
,
> -                                    size_t __refs)
> -     : facet(__refs), _M_data(NULL), _M_c_locale_timepunct(NULL),
> --    _M_name_timepunct(__s)
> -+    _M_name_timepunct(NULL)
> -     {
> --      char* __tmp =3D new char[std::strlen(__s) + 1];
> --      std::strcpy(__tmp, __s);
> -+      const size_t __len =3D std::strlen(__s) + 1;
> -+      char* __tmp =3D new char[__len];
> -+      std::memcpy(__tmp, __s, __len);
> -       _M_name_timepunct =3D __tmp;
> --      _M_initialize_timepunct(__cloc);
> -+
> -+      try
> -+      { _M_initialize_timepunct(__cloc); }
> -+      catch(...)
> -+      {
> -+        delete [] _M_name_timepunct;
> -+        __throw_exception_again;
> -+      }
> -+
> -     }
> -
> -   template<typename _CharT>
> ---
> -1.7.10.4
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0008-missing-execinfo_h.pa=
tch b/meta/recipes-devtools/gcc/gcc-4.9/0008-missing-execinfo_h.patch
> deleted file mode 100644
> index 2823809..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.9/0008-missing-execinfo_h.patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -From 9f2158451981cf0a80cfabdc79ae31bb6976a801 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 29 Mar 2013 08:48:10 +0400
> -Subject: [PATCH 08/35] missing-execinfo_h
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Upstream-Status: Pending
> ----
> - boehm-gc/include/gc.h |    2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/boehm-gc/include/gc.h b/boehm-gc/include/gc.h
> -index c51e017..a7ba8dc 100644
> ---- a/boehm-gc/include/gc.h
> -+++ b/boehm-gc/include/gc.h
> -@@ -503,7 +503,7 @@ GC_API GC_PTR GC_malloc_atomic_ignore_off_page GC_PR=
OTO((size_t lb));
> - #if defined(__linux__) || defined(__GLIBC__)
> - # include <features.h>
> - # if (__GLIBC__ =3D=3D 2 && __GLIBC_MINOR__ >=3D 1 || __GLIBC__ > 2) \
> --     && !defined(__ia64__)
> -+     && !defined(__ia64__) && !defined(__UCLIBC__)
> - #   ifndef GC_HAVE_BUILTIN_BACKTRACE
> - #     define GC_HAVE_BUILTIN_BACKTRACE
> - #   endif
> ---
> -1.7.10.4
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0009-c99-snprintf.patch b/=
meta/recipes-devtools/gcc/gcc-4.9/0009-c99-snprintf.patch
> deleted file mode 100644
> index 7168778..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.9/0009-c99-snprintf.patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -From e393e076f1ab82d25e1aa04d6edea27b41d3eb06 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 29 Mar 2013 08:49:03 +0400
> -Subject: [PATCH 09/35] c99-snprintf
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Upstream-Status: Pending
> ----
> - libstdc++-v3/include/c_std/cstdio |    2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/libstdc++-v3/include/c_std/cstdio b/libstdc++-v3/include/c_=
std/cstdio
> -index e85bd83..6af839a 100644
> ---- a/libstdc++-v3/include/c_std/cstdio
> -+++ b/libstdc++-v3/include/c_std/cstdio
> -@@ -139,7 +139,7 @@ namespace std
> -   using ::vsprintf;
> - } // namespace std
> -
> --#if _GLIBCXX_USE_C99
> -+#if _GLIBCXX_USE_C99 || defined(__UCLIBC__)
> -
> - #undef snprintf
> - #undef vfscanf
> ---
> -1.7.10.4
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0010-c99-complex-ugly-hack=
.patch b/meta/recipes-devtools/gcc/gcc-4.9/0010-c99-complex-ugly-hack.patch
> deleted file mode 100644
> index b628571..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.9/0010-c99-complex-ugly-hack.patch
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -From 73f69d806e2c9561a54995223431a1076cfd6164 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 29 Mar 2013 08:49:57 +0400
> -Subject: [PATCH 10/35] c99-complex-ugly-hack
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Upstream-Status: Inappropriate [embedded specific]
> ----
> - libstdc++-v3/configure |    3 +++
> - 1 file changed, 3 insertions(+)
> -
> -diff --git a/libstdc++-v3/configure b/libstdc++-v3/configure
> -index c57a751..a1333e2 100755
> ---- a/libstdc++-v3/configure
> -+++ b/libstdc++-v3/configure
> -@@ -18734,6 +18734,9 @@ $as_echo_n "checking for ISO C99 support to TR1 =
in <complex.h>... " >&6; }
> -     cat confdefs.h - <<_ACEOF >conftest.$ac_ext
> - /* end confdefs.h.  */
> - #include <complex.h>
> -+#ifdef __UCLIBC__
> -+#error ugly hack to make sure configure test fails here for cross until=
 uClibc supports the complex funcs
> -+#endif
> - int
> - main ()
> - {
> ---
> -1.7.10.4
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0011-index_macro.patch b/m=
eta/recipes-devtools/gcc/gcc-4.9/0011-index_macro.patch
> deleted file mode 100644
> index 8ee79b0..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.9/0011-index_macro.patch
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -From b037953e40312b45ab84ed0a3ad882bb5e413101 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 29 Mar 2013 08:51:02 +0400
> -Subject: [PATCH 11/35] index_macro
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Upstream-Status: Pending
> ----
> - libstdc++-v3/include/ext/rope       |    3 +++
> - libstdc++-v3/include/ext/ropeimpl.h |    3 +++
> - 2 files changed, 6 insertions(+)
> -
> -diff --git a/libstdc++-v3/include/ext/rope b/libstdc++-v3/include/ext/ro=
pe
> -index 38eb1e8..158d21a 100644
> ---- a/libstdc++-v3/include/ext/rope
> -+++ b/libstdc++-v3/include/ext/rope
> -@@ -55,6 +55,9 @@
> - #include <bits/gthr.h>
> - #include <tr1/functional>
> -
> -+/* cope w/ index defined as macro, SuSv3 proposal */
> -+#undef index
> -+
> - # ifdef __GC
> - #   define __GC_CONST const
> - # else
> -diff --git a/libstdc++-v3/include/ext/ropeimpl.h b/libstdc++-v3/include/=
ext/ropeimpl.h
> -index d7b5cbd..b9b3acb 100644
> ---- a/libstdc++-v3/include/ext/ropeimpl.h
> -+++ b/libstdc++-v3/include/ext/ropeimpl.h
> -@@ -48,6 +48,9 @@
> - #include <ext/memory> // For uninitialized_copy_n
> - #include <ext/numeric> // For power
> -
> -+/* cope w/ index defined as macro, SuSv3 proposal */
> -+#undef index
> -+
> - namespace __gnu_cxx _GLIBCXX_VISIBILITY(default)
> - {
> - _GLIBCXX_BEGIN_NAMESPACE_VERSION
> ---
> -1.7.10.4
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0013-libstdc-namespace.pat=
ch b/meta/recipes-devtools/gcc/gcc-4.9/0013-libstdc-namespace.patch
> deleted file mode 100644
> index 4a3efde..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.9/0013-libstdc-namespace.patch
> +++ /dev/null
> @@ -1,54 +0,0 @@
> -From 104e4d66208f2726b14d2f5eebce90700cbc83c8 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 29 Mar 2013 08:54:02 +0400
> -Subject: [PATCH 13/35] libstdc++-namespace
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Upstream-Status: Pending
> ----
> - libstdc++-v3/config/locale/uclibc/messages_members.h |    4 +++-
> - libstdc++-v3/config/locale/uclibc/time_members.h     |    4 +++-
> - 2 files changed, 6 insertions(+), 2 deletions(-)
> -
> -diff --git a/libstdc++-v3/config/locale/uclibc/messages_members.h b/libs=
tdc++-v3/config/locale/uclibc/messages_members.h
> -index 067657a..dd76a6c 100644
> ---- a/libstdc++-v3/config/locale/uclibc/messages_members.h
> -+++ b/libstdc++-v3/config/locale/uclibc/messages_members.h
> -@@ -32,7 +32,8 @@
> - //
> -
> - // Written by Benjamin Kosnik <bkoz@redhat.com>
> --
> -+namespace std
> -+{
> - #ifdef __UCLIBC_MJN3_ONLY__
> - #warning fix prototypes for *textdomain funcs
> - #endif
> -@@ -116,3 +117,4 @@
> -          this->_S_create_c_locale(this->_M_c_locale_messages, __s);
> -        }
> -      }
> -+}
> -diff --git a/libstdc++-v3/config/locale/uclibc/time_members.h b/libstdc+=
+-v3/config/locale/uclibc/time_members.h
> -index 1665dde..905c433 100644
> ---- a/libstdc++-v3/config/locale/uclibc/time_members.h
> -+++ b/libstdc++-v3/config/locale/uclibc/time_members.h
> -@@ -33,7 +33,8 @@
> - //
> -
> - // Written by Benjamin Kosnik <bkoz@redhat.com>
> --
> -+namespace std
> -+{
> -   template<typename _CharT>
> -     __timepunct<_CharT>::__timepunct(size_t __refs)
> -     : facet(__refs), _M_data(NULL), _M_c_locale_timepunct(NULL),
> -@@ -75,3 +76,4 @@
> -       delete _M_data;
> -       _S_destroy_c_locale(_M_c_locale_timepunct);
> -     }
> -+}
> ---
> -1.7.10.4
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0014-sh-pr24836.patch b/me=
ta/recipes-devtools/gcc/gcc-4.9/0014-sh-pr24836.patch
> deleted file mode 100644
> index cb8fd52..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.9/0014-sh-pr24836.patch
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -From edc9acb181810f234b6b9f7d2820b0e4f6a1eeaf Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 29 Mar 2013 08:54:48 +0400
> -Subject: [PATCH 14/35] sh-pr24836
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Upstream-Status: Pending
> -
> -http://sourceforge.net/mailarchive/forum.php?thread_id=3D8959304&forum_i=
d=3D5348
> -http://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D24836
> ----
> - gcc/configure    |    2 +-
> - gcc/configure.ac |    2 +-
> - 2 files changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/gcc/configure b/gcc/configure
> -index e12a180..135bbf5 100755
> ---- a/gcc/configure
> -+++ b/gcc/configure
> -@@ -23378,7 +23378,7 @@ foo:   .long   25
> -       tls_first_minor=3D14
> -       tls_as_opt=3D"-m64 -Aesame --fatal-warnings"
> -       ;;
> --  sh-*-* | sh[34]-*-*)
> -+  sh-*-* | sh[34]*-*-*)
> -     conftest_s=3D'
> -       .section ".tdata","awT",@progbits
> - foo:  .long   25
> -diff --git a/gcc/configure.ac b/gcc/configure.ac
> -index eba3577..6363a21 100644
> ---- a/gcc/configure.ac
> -+++ b/gcc/configure.ac
> -@@ -3141,7 +3141,7 @@ foo:     .long   25
> -       tls_first_minor=3D14
> -       tls_as_opt=3D"-m64 -Aesame --fatal-warnings"
> -       ;;
> --  sh-*-* | sh[34]-*-*)
> -+  sh-*-* | sh[34]*-*-*)
> -     conftest_s=3D'
> -       .section ".tdata","awT",@progbits
> - foo:  .long   25
> ---
> -1.7.10.4
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0015-arm-Use-TARGET_ENDIAN=
_OPTION-for-determining-MULTILI.patch b/meta/recipes-devtools/gcc/gcc-4.9/0=
015-arm-Use-TARGET_ENDIAN_OPTION-for-determining-MULTILI.patch
> deleted file mode 100644
> index 37c46fc..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.9/0015-arm-Use-TARGET_ENDIAN_OPTION=
-for-determining-MULTILI.patch
> +++ /dev/null
> @@ -1,47 +0,0 @@
> -From 50e5366005b0f6af27378e2a5c3cb9f9936a7e62 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 29 Mar 2013 08:58:36 +0400
> -Subject: [PATCH 15/35] arm: Use TARGET_ENDIAN_OPTION for determining
> - MULTILIB_DEFAULTS
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Upstream-Status: Pending
> ----
> - gcc/config/arm/linux-elf.h |    2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -Index: gcc-4.9.2/gcc/config/arm/coff.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.9.2.orig/gcc/config/arm/coff.h
> -+++ gcc-4.9.2/gcc/config/arm/coff.h
> -@@ -32,8 +32,11 @@
> - #define TARGET_DEFAULT (MASK_APCS_FRAME)
> -
> - #ifndef MULTILIB_DEFAULTS
> -+#ifndef TARGET_ENDIAN_OPTION
> -+#define TARGET_ENDIAN_OPTION "mlittle-endian"
> -+#endif
> - #define MULTILIB_DEFAULTS \
> --  { "marm", "mlittle-endian", "mfloat-abi=3Dsoft", "mno-thumb-interwork=
" }
> -+  { "marm", TARGET_ENDIAN_OPTION, "mfloat-abi=3Dsoft", "mno-thumb-inter=
work" }
> - #endif
> -
> - /* This is COFF, but prefer stabs.  */
> -Index: gcc-4.9.2/gcc/config/arm/elf.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.9.2.orig/gcc/config/arm/elf.h
> -+++ gcc-4.9.2/gcc/config/arm/elf.h
> -@@ -116,8 +116,11 @@
> - #endif
> -
> - #ifndef MULTILIB_DEFAULTS
> -+#ifndef TARGET_ENDIAN_OPTION
> -+#define TARGET_ENDIAN_OPTION "mlittle-endian"
> -+#endif
> - #define MULTILIB_DEFAULTS \
> --  { "marm", "mlittle-endian", "mfloat-abi=3Dsoft", "mno-thumb-interwork=
", "fno-leading-underscore" }
> -+  { "marm", TARGET_ENDIAN_OPTION, "mfloat-abi=3Dsoft", "mno-thumb-inter=
work", "fno-leading-underscore" }
> - #endif
> -
> - #define TARGET_ASM_FILE_START_APP_OFF true
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0016-gcc-poison-system-dir=
ectories.patch b/meta/recipes-devtools/gcc/gcc-4.9/0016-gcc-poison-system-d=
irectories.patch
> deleted file mode 100644
> index 475ef96..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.9/0016-gcc-poison-system-directorie=
s.patch
> +++ /dev/null
> @@ -1,190 +0,0 @@
> -From 160397ef3c3331099af028f1b8d3e085b07d88ad Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 29 Mar 2013 08:59:00 +0400
> -Subject: [PATCH 16/35] gcc: poison-system-directories
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Upstream-Status: Inappropriate [distribution: codesourcery]
> ----
> - gcc/Makefile.in     |    2 +-
> - gcc/common.opt      |    4 ++++
> - gcc/config.in       |    6 ++++++
> - gcc/configure       |   20 ++++++++++++++++++--
> - gcc/configure.ac    |   10 ++++++++++
> - gcc/doc/invoke.texi |    9 +++++++++
> - gcc/gcc.c           |    2 ++
> - gcc/incpath.c       |   19 +++++++++++++++++++
> - 8 files changed, 69 insertions(+), 3 deletions(-)
> -
> -Index: gcc-4.9-20140316/gcc/common.opt
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.9-20140316.orig/gcc/common.opt
> -+++ gcc-4.9-20140316/gcc/common.opt
> -@@ -603,6 +603,10 @@ Wpedantic
> - Common Var(pedantic) Warning
> - Issue warnings needed for strict compliance to the standard
> -
> -+Wpoison-system-directories
> -+Common Var(flag_poison_system_directories) Init(1) Warning
> -+Warn for -I and -L options using system directories if cross compiling
> -+
> - Wshadow
> - Common Var(warn_shadow) Warning
> - Warn when one local variable shadows another
> -Index: gcc-4.9-20140316/gcc/config.in
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.9-20140316.orig/gcc/config.in
> -+++ gcc-4.9-20140316/gcc/config.in
> -@@ -138,6 +138,12 @@
> - #endif
> -
> -
> -+/* Define to warn for use of native system header directories */
> -+#ifndef USED_FOR_TARGET
> -+#undef ENABLE_POISON_SYSTEM_DIRECTORIES
> -+#endif
> -+
> -+
> - /* Define if you want all operations on RTL (the basic data structure o=
f the
> -    optimizer and back end) to be checked for dynamic type safety at run=
time.
> -    This is quite expensive. */
> -Index: gcc-4.9-20140316/gcc/configure
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.9-20140316.orig/gcc/configure
> -+++ gcc-4.9-20140316/gcc/configure
> -@@ -928,6 +928,7 @@ with_system_zlib
> - enable_maintainer_mode
> - enable_link_mutex
> - enable_version_specific_runtime_libs
> -+enable_poison_system_directories
> - enable_plugin
> - enable_host_shared
> - enable_libquadmath_support
> -@@ -1648,6 +1649,8 @@ Optional Features:
> -   --enable-version-specific-runtime-libs
> -                           specify that runtime libraries should be inst=
alled
> -                           in a compiler-specific directory
> -+  --enable-poison-system-directories
> -+                          warn for use of native system header director=
ies
> -   --enable-plugin         enable plugin support
> -   --enable-host-shared    build host code as shared libraries
> -   --disable-libquadmath-support
> -@@ -27702,6 +27705,19 @@ if test "${enable_version_specific_runti
> - fi
> -
> -
> -+# Check whether --enable-poison-system-directories was given.
> -+if test "${enable_poison_system_directories+set}" =3D set; then :
> -+  enableval=3D$enable_poison_system_directories;
> -+else
> -+  enable_poison_system_directories=3Dno
> -+fi
> -+
> -+if test "x${enable_poison_system_directories}" =3D "xyes"; then
> -+
> -+$as_echo "#define ENABLE_POISON_SYSTEM_DIRECTORIES 1" >>confdefs.h
> -+
> -+fi
> -+
> - # Substitute configuration variables
> -
> -
> -Index: gcc-4.9-20140316/gcc/configure.ac
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.9-20140316.orig/gcc/configure.ac
> -+++ gcc-4.9-20140316/gcc/configure.ac
> -@@ -5366,6 +5366,16 @@ AC_ARG_ENABLE(version-specific-runtime-l
> -                 [specify that runtime libraries should be
> -                  installed in a compiler-specific directory])])
> -
> -+AC_ARG_ENABLE([poison-system-directories],
> -+             AS_HELP_STRING([--enable-poison-system-directories],
> -+                            [warn for use of native system header direc=
tories]),,
> -+             [enable_poison_system_directories=3Dno])
> -+if test "x${enable_poison_system_directories}" =3D "xyes"; then
> -+  AC_DEFINE([ENABLE_POISON_SYSTEM_DIRECTORIES],
> -+           [1],
> -+           [Define to warn for use of native system header directories]=
)
> -+fi
> -+
> - # Substitute configuration variables
> - AC_SUBST(subdirs)
> - AC_SUBST(srcdir)
> -Index: gcc-4.9-20140316/gcc/doc/invoke.texi
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.9-20140316.orig/gcc/doc/invoke.texi
> -+++ gcc-4.9-20140316/gcc/doc/invoke.texi
> -@@ -260,6 +260,7 @@ Objective-C and Objective-C++ Dialects}.
> - -Woverlength-strings  -Wpacked  -Wpacked-bitfield-compat  -Wpadded @gol
> - -Wparentheses  -Wpedantic-ms-format -Wno-pedantic-ms-format @gol
> - -Wpointer-arith  -Wno-pointer-to-int-cast @gol
> -+-Wno-poison-system-directories @gol
> - -Wredundant-decls  -Wno-return-local-addr @gol
> - -Wreturn-type  -Wsequence-point  -Wshadow @gol
> - -Wsign-compare  -Wsign-conversion -Wfloat-conversion @gol
> -@@ -4230,6 +4231,14 @@ headers---for that, @option{-Wunknown-pr
> -  for most targets, it is made up of code and thus requires the stack
> -  to be made executable in order for the program to work properly.
> -
> -+@item -Wno-poison-system-directories
> -+@opindex Wno-poison-system-directories
> -+Do not warn for @option{-I} or @option{-L} options using system
> -+directories such as @file{/usr/include} when cross compiling.  This
> -+option is intended for use in chroot environments when such
> -+directories contain the correct headers and libraries for the target
> -+system rather than the host.
> -+
> - @item -Wfloat-equal
> - @opindex Wfloat-equal
> - @opindex Wno-float-equal
> -Index: gcc-4.9-20140316/gcc/gcc.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.9-20140316.orig/gcc/gcc.c
> -+++ gcc-4.9-20140316/gcc/gcc.c
> -@@ -764,6 +764,8 @@ proper position among the other output f
> -    "%{fuse-ld=3D*:-fuse-ld=3D%*}\
> -     %X %{o*} %{e*} %{N} %{n} %{r}\
> -     %{s} %{t} %{u*} %{z} %{Z} %{!nostdlib:%{!nostartfiles:%S}} " VTABLE=
_VERIFICATION_SPEC " \
> -+    %{Wno-poison-system-directories:--no-poison-system-directories}\
> -+    %{Werror=3Dpoison-system-directories:--error-poison-system-director=
ies}\
> -     %{static:} %{L*} %(mfwrap) %(link_libgcc) " SANITIZER_EARLY_SPEC " =
%o\
> -     %{fopenmp|ftree-parallelize-loops=3D*:%:include(libgomp.spec)%(link=
_gomp)}\
> -     %{fgnu-tm:%:include(libitm.spec)%(link_itm)}\
> -Index: gcc-4.9-20140316/gcc/incpath.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.9-20140316.orig/gcc/incpath.c
> -+++ gcc-4.9-20140316/gcc/incpath.c
> -@@ -28,6 +28,7 @@
> - #include "intl.h"
> - #include "incpath.h"
> - #include "cppdefault.h"
> -+#include "diagnostic-core.h"
> -
> - /* Microsoft Windows does not natively support inodes.
> -    VMS has non-numeric inodes.  */
> -@@ -382,6 +383,24 @@ merge_include_chains (const char *sysroo
> -       }
> -       fprintf (stderr, _("End of search list.\n"));
> -     }
> -+
> -+#ifdef ENABLE_POISON_SYSTEM_DIRECTORIES
> -+  if (flag_poison_system_directories)
> -+    {
> -+       struct cpp_dir *p;
> -+
> -+       for (p =3D heads[QUOTE]; p; p =3D p->next)
> -+         {
> -+          if ((!strncmp (p->name, "/usr/include", 12))
> -+              || (!strncmp (p->name, "/usr/local/include", 18))
> -+              || (!strncmp (p->name, "/usr/X11R6/include", 18)))
> -+            warning (OPT_Wpoison_system_directories,
> -+                     "include location \"%s\" is unsafe for "
> -+                     "cross-compilation",
> -+                     p->name);
> -+         }
> -+    }
> -+#endif
> - }
> -
> - /* Use given -I paths for #include "..." but not #include <...>, and
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0017-gcc-poison-dir-extend=
.patch b/meta/recipes-devtools/gcc/gcc-4.9/0017-gcc-poison-dir-extend.patch
> deleted file mode 100644
> index 9e81efd..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.9/0017-gcc-poison-dir-extend.patch
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -From e99c9c97266d6d3e8cac798aa91408250c4d60cf Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 29 Mar 2013 09:00:34 +0400
> -Subject: [PATCH 17/35] gcc-poison-dir-extend
> -
> -Add /sw/include and /opt/include based on the original
> -zecke-no-host-includes.patch patch.  The original patch checked for
> -/usr/include, /sw/include and /opt/include and then triggered a failure =
and
> -aborted.
> -
> -Instead, we add the two missing items to the current scan.  If the user
> -wants this to be a failure, they can add "-Werror=3Dpoison-system-direct=
ories".
> -
> -Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Upstream-Status: Pending
> ----
> - gcc/incpath.c |    4 +++-
> - 1 file changed, 3 insertions(+), 1 deletion(-)
> -
> -diff --git a/gcc/incpath.c b/gcc/incpath.c
> -index cd41c78..eac4a92 100644
> ---- a/gcc/incpath.c
> -+++ b/gcc/incpath.c
> -@@ -393,7 +393,9 @@ merge_include_chains (const char *sysroot, cpp_reade=
r *pfile, int verbose)
> -          {
> -           if ((!strncmp (p->name, "/usr/include", 12))
> -               || (!strncmp (p->name, "/usr/local/include", 18))
> --              || (!strncmp (p->name, "/usr/X11R6/include", 18)))
> -+              || (!strncmp (p->name, "/usr/X11R6/include", 18))
> -+              || (!strncmp (p->name, "/sw/include", 11))
> -+              || (!strncmp (p->name, "/opt/include", 12)))
> -             warning (OPT_Wpoison_system_directories,
> -                      "include location \"%s\" is unsafe for "
> -                      "cross-compilation",
> ---
> -1.7.10.4
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0018-gcc-4.3.3-SYSROOT_CFL=
AGS_FOR_TARGET.patch b/meta/recipes-devtools/gcc/gcc-4.9/0018-gcc-4.3.3-SYS=
ROOT_CFLAGS_FOR_TARGET.patch
> deleted file mode 100644
> index a28cafd..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.9/0018-gcc-4.3.3-SYSROOT_CFLAGS_FOR=
_TARGET.patch
> +++ /dev/null
> @@ -1,73 +0,0 @@
> -From 56207fa2923e8edf774e98ffac82666091076be3 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 29 Mar 2013 09:08:31 +0400
> -Subject: [PATCH 18/35] gcc-4.3.3: SYSROOT_CFLAGS_FOR_TARGET
> -
> -Before committing, I noticed that PR/32161 was marked as a dup of PR/320=
09, but my previous patch did not fix it.
> -
> -This alternative patch is better because it lets you just use CFLAGS_FOR=
_TARGET to set the compilation flags for libgcc. Since bootstrapped target =
libraries are never compiled with the native compiler, it makes little sens=
e to use different flags for stage1 and later stages. And it also makes lit=
tle sense to use a different variable than CFLAGS_FOR_TARGET.
> -
> -Other changes I had to do include:
> -
> -- moving the creation of default CFLAGS_FOR_TARGET from Makefile.am to c=
onfigure.ac, because otherwise the BOOT_CFLAGS are substituted into CFLAGS_=
FOR_TARGET (which is "-O2 -g $(CFLAGS)") via $(CFLAGS). It is also cleaner =
this way though.
> -
> -- passing the right CFLAGS to configure scripts as exported environment =
variables
> -
> -I also stopped passing LIBCFLAGS to configure scripts since they are unu=
sed in the whole src tree. And I updated the documentation as H-P reminded =
me to do.
> -
> -Bootstrapped/regtested i686-pc-linux-gnu, will commit to 4.4 shortly. Ok=
 for 4.3?
> -
> -Signed-off-by: Paolo Bonzini  <bonzini@gnu.org>
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Upstream-Status: Pending
> ----
> - configure |   32 ++++++++++++++++++++++++++++++++
> - 1 file changed, 32 insertions(+)
> -
> -diff --git a/configure b/configure
> -index 1b76c90..e4dce7c 100755
> ---- a/configure
> -+++ b/configure
> -@@ -6772,6 +6772,38 @@ fi
> -
> -
> -
> -+# During gcc bootstrap, if we use some random cc for stage1 then CFLAGS
> -+# might be empty or "-g".  We don't require a C++ compiler, so CXXFLAGS
> -+# might also be empty (or "-g", if a non-GCC C++ compiler is in the pat=
h).
> -+# We want to ensure that TARGET libraries (which we know are built with
> -+# gcc) are built with "-O2 -g", so include those options when setting
> -+# CFLAGS_FOR_TARGET and CXXFLAGS_FOR_TARGET.
> -+if test "x$CFLAGS_FOR_TARGET" =3D x; then
> -+  CFLAGS_FOR_TARGET=3D$CFLAGS
> -+  case " $CFLAGS " in
> -+    *" -O2 "*) ;;
> -+    *) CFLAGS_FOR_TARGET=3D"-O2 $CFLAGS" ;;
> -+  esac
> -+  case " $CFLAGS " in
> -+    *" -g "* | *" -g3 "*) ;;
> -+    *) CFLAGS_FOR_TARGET=3D"-g $CFLAGS" ;;
> -+  esac
> -+fi
> -+
> -+
> -+if test "x$CXXFLAGS_FOR_TARGET" =3D x; then
> -+  CXXFLAGS_FOR_TARGET=3D$CXXFLAGS
> -+  case " $CXXFLAGS " in
> -+    *" -O2 "*) ;;
> -+    *) CXXFLAGS_FOR_TARGET=3D"-O2 $CXXFLAGS" ;;
> -+  esac
> -+  case " $CXXFLAGS " in
> -+    *" -g "* | *" -g3 "*) ;;
> -+    *) CXXFLAGS_FOR_TARGET=3D"-g $CXXFLAGS" ;;
> -+  esac
> -+fi
> -+
> -+
> - # Handle --with-headers=3DXXX.  If the value is not "yes", the contents=
 of
> - # the named directory are copied to $(tooldir)/sys-include.
> - if test x"${with_headers}" !=3D x && test x"${with_headers}" !=3D xno ;=
 then
> ---
> -1.7.10.4
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0019-64-bit-multilib-hack.=
patch b/meta/recipes-devtools/gcc/gcc-4.9/0019-64-bit-multilib-hack.patch
> deleted file mode 100644
> index 058be0c..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.9/0019-64-bit-multilib-hack.patch
> +++ /dev/null
> @@ -1,82 +0,0 @@
> -From 18fde5740b09324dfb9cf41e9849672573ff5fa0 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 29 Mar 2013 09:10:06 +0400
> -Subject: [PATCH 19/35] 64-bit multilib hack.
> -
> -GCC has internal multilib handling code but it assumes a very specific r=
igid directory
> -layout. The build system implementation of multilib layout is very gener=
ic and allows
> -complete customisation of the library directories.
> -
> -This patch is a partial solution to allow any custom directories to be p=
assed into gcc
> -and handled correctly. It forces gcc to use the base_libdir (which is th=
e current
> -directory, "."). We need to do this for each multilib that is configured=
 as we don't
> -know which compiler options may be being passed into the compiler. Since=
 we have a compiler
> -per mulitlib at this point that isn't an issue.
> -
> -The one problem is the target compiler is only going to work for the def=
ault multlilib at
> -this point. Ideally we'd figure out which multilibs were being enabled w=
ith which paths
> -and be able to patch these entries with a complete set of correct paths =
but this we
> -don't have such code at this point. This is something the target gcc rec=
ipe should do
> -and override these platform defaults in its build config.
> -
> -RP 15/8/11
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
> -
> -Upstream-Status: Pending
> ----
> - gcc/config/i386/t-linux64   |    6 ++----
> - gcc/config/mips/t-linux64   |   10 +++-------
> - gcc/config/rs6000/t-linux64 |    5 ++---
> - 3 files changed, 7 insertions(+), 14 deletions(-)
> -
> -Index: gcc-4.9-20140316/gcc/config/i386/t-linux64
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.9-20140316.orig/gcc/config/i386/t-linux64
> -+++ gcc-4.9-20140316/gcc/config/i386/t-linux64
> -@@ -32,7 +32,5 @@
> - #
> - comma=3D,
> - MULTILIB_OPTIONS    =3D $(subst $(comma),/,$(TM_MULTILIB_CONFIG))
> --MULTILIB_DIRNAMES   =3D $(patsubst m%, %, $(subst /, ,$(MULTILIB_OPTION=
S)))
> --MULTILIB_OSDIRNAMES =3D m64=3D../lib64$(call if_multiarch,:x86_64-linux=
-gnu)
> --MULTILIB_OSDIRNAMES+=3D m32=3D$(if $(wildcard $(shell echo $(SYSTEM_HEA=
DER_DIR))/../../usr/lib32),../lib32,../lib)$(call if_multiarch,:i386-linux-=
gnu)
> --MULTILIB_OSDIRNAMES+=3D mx32=3D../libx32$(call if_multiarch,:x86_64-lin=
ux-gnux32)
> -+MULTILIB_DIRNAMES =3D . .
> -+MULTILIB_OSDIRNAMES =3D ../$(shell basename $(base_libdir)) ../$(shell =
basename $(base_libdir))
> -Index: gcc-4.9-20140316/gcc/config/mips/t-linux64
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.9-20140316.orig/gcc/config/mips/t-linux64
> -+++ gcc-4.9-20140316/gcc/config/mips/t-linux64
> -@@ -17,10 +17,6 @@
> - # <http://www.gnu.org/licenses/>.
> -
> - MULTILIB_OPTIONS =3D mabi=3Dn32/mabi=3D32/mabi=3D64
> --MULTILIB_DIRNAMES =3D n32 32 64
> --MIPS_EL =3D $(if $(filter %el, $(firstword $(subst -, ,$(target)))),el)
> --MIPS_SOFT =3D $(if $(strip $(filter MASK_SOFT_FLOAT_ABI, $(target_cpu_d=
efault)) $(filter soft, $(with_float))),soft)
> --MULTILIB_OSDIRNAMES =3D \
> --      ../lib32$(call if_multiarch,:mips64$(MIPS_EL)-linux-gnuabin32$(MI=
PS_SOFT)) \
> --      ../lib$(call if_multiarch,:mips$(MIPS_EL)-linux-gnu$(MIPS_SOFT)) =
\
> --      ../lib64$(call if_multiarch,:mips64$(MIPS_EL)-linux-gnuabi64$(MIP=
S_SOFT))
> -+MULTILIB_DIRNAMES =3D . . .
> -+MULTILIB_OSDIRNAMES =3D ../$(shell basename $(base_libdir)) ../$(shell =
basename $(base_libdir)) ../$(shell basename $(base_libdir))
> -+
> -Index: gcc-4.9-20140316/gcc/config/rs6000/t-linux64
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.9-20140316.orig/gcc/config/rs6000/t-linux64
> -+++ gcc-4.9-20140316/gcc/config/rs6000/t-linux64
> -@@ -26,10 +26,9 @@
> - # MULTILIB_OSDIRNAMES according to what is found on the target.
> -
> - MULTILIB_OPTIONS    :=3D m64/m32
> --MULTILIB_DIRNAMES   :=3D 64 32
> -+MULTILIB_DIRNAMES   :=3D . .
> - MULTILIB_EXTRA_OPTS :=3D
> --MULTILIB_OSDIRNAMES :=3D m64=3D../lib64$(call if_multiarch,:powerpc64-l=
inux-gnu)
> --MULTILIB_OSDIRNAMES +=3D m32=3D$(if $(wildcard $(shell echo $(SYSTEM_HE=
ADER_DIR))/../../usr/lib32),../lib32,../lib)$(call if_multiarch,:powerpc-li=
nux-gnu)
> -+MULTILIB_OSDIRNAMES :=3D ../$(shell basename $(base_libdir)) ../$(shell=
 basename $(base_libdir))
> -
> - rs6000-linux.o: $(srcdir)/config/rs6000/rs6000-linux.c
> -       $(COMPILE) $<
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0020-optional-libstdc.patc=
h b/meta/recipes-devtools/gcc/gcc-4.9/0020-optional-libstdc.patch
> deleted file mode 100644
> index 5b46614..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.9/0020-optional-libstdc.patch
> +++ /dev/null
> @@ -1,98 +0,0 @@
> -From 307c8ff3ef666b7bd5ac733863f2fbb27a9d521e Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 29 Mar 2013 09:12:56 +0400
> -Subject: [PATCH 20/35] optional libstdc
> -
> -gcc-runtime builds libstdc++ separately from gcc-cross-*. Its configure =
tests using g++
> -will not run correctly since by default the linker will try to link agai=
nst libstdc++
> -which shouldn't exist yet. We need an option to disable -lstdc++
> -option whilst leaving -lc, -lgcc and other automatic library dependencie=
s added by gcc
> -driver. This patch adds such an option which only disables the -lstdc++.
> -
> -A "standard" gcc build uses xgcc and hence avoids this. We should ask up=
stream how to
> -do this officially, the likely answer is don't build libstdc++ separatel=
y.
> -
> -RP 29/6/10
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Upstream-Status: Inappropriate [embedded specific]
> ----
> - gcc/c-family/c.opt  |    4 ++++
> - gcc/cp/g++spec.c    |    1 +
> - gcc/doc/invoke.texi |    9 +++++++--
> - gcc/gcc.c           |    1 +
> - 4 files changed, 13 insertions(+), 2 deletions(-)
> -
> -Index: gcc-4.9-20140316/gcc/c-family/c.opt
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.9-20140316.orig/gcc/c-family/c.opt
> -+++ gcc-4.9-20140316/gcc/c-family/c.opt
> -@@ -1323,6 +1323,10 @@ nostdinc++
> - C++ ObjC++
> - Do not search standard system include directories for C++
> -
> -+nostdlib++
> -+Driver
> -+Do not link standard C++ runtime library
> -+
> - o
> - C ObjC C++ ObjC++ Joined Separate
> - ; Documented in common.opt
> -Index: gcc-4.9-20140316/gcc/cp/g++spec.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.9-20140316.orig/gcc/cp/g++spec.c
> -+++ gcc-4.9-20140316/gcc/cp/g++spec.c
> -@@ -138,6 +138,7 @@ lang_specific_driver (struct cl_decoded_
> -       switch (decoded_options[i].opt_index)
> -       {
> -       case OPT_nostdlib:
> -+      case OPT_nostdlib__:
> -       case OPT_nodefaultlibs:
> -         library =3D -1;
> -         break;
> -Index: gcc-4.9-20140316/gcc/doc/invoke.texi
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.9-20140316.orig/gcc/doc/invoke.texi
> -+++ gcc-4.9-20140316/gcc/doc/invoke.texi
> -@@ -193,6 +193,7 @@ in the following sections.
> - -fvisibility-inlines-hidden @gol
> - -fvtable-verify=3D@var{std|preinit|none} @gol
> - -fvtv-counts -fvtv-debug @gol
> -+-nostdlib++ @gol
> - -fvisibility-ms-compat @gol
> - -fext-numeric-literals @gol
> - -Wabi  -Wconversion-null  -Wctor-dtor-privacy @gol
> -@@ -457,7 +458,7 @@ Objective-C and Objective-C++ Dialects}.
> - -nostartfiles  -nodefaultlibs  -nostdlib -pie -rdynamic @gol
> - -s  -static -static-libgcc -static-libstdc++ @gol
> - -static-libasan -static-libtsan -static-liblsan -static-libubsan @gol
> ---shared -shared-libgcc  -symbolic @gol
> -+-shared -shared-libgcc  -symbolic -nostdlib++ @gol
> - -T @var{script}  -Wl,@var{option}  -Xlinker @var{option} @gol
> - -u @var{symbol}}
> -
> -@@ -10285,6 +10286,11 @@ These entries are usually resolved by en
> - libc.  These entry points should be supplied through some other
> - mechanism when this option is specified.
> -
> -+@item -nostdlib++
> -+@opindex nostdlib++
> -+Do not use the standard system C++ runtime libraries when linking.
> -+Only the libraries you specify will be passed to the linker.
> -+
> - @cindex @option{-lgcc}, use with @option{-nostdlib}
> - @cindex @option{-nostdlib} and unresolved references
> - @cindex unresolved references and @option{-nostdlib}
> -Index: gcc-4.9-20140316/gcc/gcc.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.9-20140316.orig/gcc/gcc.c
> -+++ gcc-4.9-20140316/gcc/gcc.c
> -@@ -772,6 +772,7 @@ proper position among the other output f
> -     %(mflib) " STACK_SPLIT_SPEC "\
> -     %{fprofile-arcs|fprofile-generate*|coverage:-lgcov} " SANITIZER_SPE=
C " \
> -     %{!nostdlib:%{!nodefaultlibs:%(link_ssp) %(link_gcc_c_sequence)}}\
> -+    %{!nostdlib++:}\
> -     %{!nostdlib:%{!nostartfiles:%E}} %{T*} }}}}}}"
> - #endif
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0021-gcc-disable-MASK_RELA=
X_PIC_CALLS-bit.patch b/meta/recipes-devtools/gcc/gcc-4.9/0021-gcc-disable-=
MASK_RELAX_PIC_CALLS-bit.patch
> deleted file mode 100644
> index eb3c61f..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.9/0021-gcc-disable-MASK_RELAX_PIC_C=
ALLS-bit.patch
> +++ /dev/null
> @@ -1,59 +0,0 @@
> -From 004696e054ae9dc71d512cc755ccc4074fc62b2d Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 29 Mar 2013 09:14:20 +0400
> -Subject: [PATCH 21/35] gcc: disable MASK_RELAX_PIC_CALLS bit
> -
> -The new feature added after 4.3.3
> -"http://www.pubbs.net/200909/gcc/94048-patch-add-support-for-rmipsjalr.h=
tml"
> -will cause cc1plus eat up all the system memory when build webkit-gtk.
> -The function mips_get_pic_call_symbol keeps on recursively calling itsel=
f.
> -Disable this feature to walk aside the bug.
> -
> -Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Upstream-Status: Inappropriate [configuration]
> ----
> - gcc/configure    |    7 -------
> - gcc/configure.ac |    7 -------
> - 2 files changed, 14 deletions(-)
> -
> -diff --git a/gcc/configure b/gcc/configure
> -index b65d21d..bdab45a 100755
> ---- a/gcc/configure
> -+++ b/gcc/configure
> -@@ -25829,13 +25829,6 @@ $as_echo_n "checking assembler and linker for e=
xplicit JALR relocation... " >&6;
> -         rm -f conftest.*
> -       fi
> -     fi
> --    if test $gcc_cv_as_ld_jalr_reloc =3D yes; then
> --      if test x$target_cpu_default =3D x; then
> --        target_cpu_default=3DMASK_RELAX_PIC_CALLS
> --      else
> --        target_cpu_default=3D"($target_cpu_default)|MASK_RELAX_PIC_CALL=
S"
> --      fi
> --    fi
> -     { $as_echo "$as_me:${as_lineno-$LINENO}: result: $gcc_cv_as_ld_jalr=
_reloc" >&5
> - $as_echo "$gcc_cv_as_ld_jalr_reloc" >&6; }
> -
> -diff --git a/gcc/configure.ac b/gcc/configure.ac
> -index e226b85..5f5c909 100644
> ---- a/gcc/configure.ac
> -+++ b/gcc/configure.ac
> -@@ -4099,13 +4099,6 @@ x:
> -         rm -f conftest.*
> -       fi
> -     fi
> --    if test $gcc_cv_as_ld_jalr_reloc =3D yes; then
> --      if test x$target_cpu_default =3D x; then
> --        target_cpu_default=3DMASK_RELAX_PIC_CALLS
> --      else
> --        target_cpu_default=3D"($target_cpu_default)|MASK_RELAX_PIC_CALL=
S"
> --      fi
> --    fi
> -     AC_MSG_RESULT($gcc_cv_as_ld_jalr_reloc)
> -
> -     AC_CACHE_CHECK([linker for .eh_frame personality relaxation],
> ---
> -1.7.10.4
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0022-COLLECT_GCC_OPTIONS.p=
atch b/meta/recipes-devtools/gcc/gcc-4.9/0022-COLLECT_GCC_OPTIONS.patch
> deleted file mode 100644
> index 40c8abf..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.9/0022-COLLECT_GCC_OPTIONS.patch
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -From 7f5c9dcc71c8b83a0b5596266cc4bdf0936e8e00 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 29 Mar 2013 09:16:28 +0400
> -Subject: [PATCH 22/35] COLLECT_GCC_OPTIONS
> -
> -This patch adds --sysroot into COLLECT_GCC_OPTIONS which is used to
> -invoke collect2.
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Upstream-Status: Pending
> ----
> - gcc/gcc.c |    9 +++++++++
> - 1 file changed, 9 insertions(+)
> -
> -diff --git a/gcc/gcc.c b/gcc/gcc.c
> -index 477752f..51062aa 100644
> ---- a/gcc/gcc.c
> -+++ b/gcc/gcc.c
> -@@ -4098,6 +4098,15 @@ set_collect_gcc_options (void)
> -               sizeof ("COLLECT_GCC_OPTIONS=3D") - 1);
> -
> -   first_time =3D TRUE;
> -+#ifdef HAVE_LD_SYSROOT
> -+  if (target_system_root_changed && target_system_root)
> -+    {
> -+      obstack_grow (&collect_obstack, "'--sysroot=3D", sizeof("'--sysro=
ot=3D")-1);
> -+      obstack_grow (&collect_obstack, target_system_root,strlen(target_=
system_root));
> -+      obstack_grow (&collect_obstack, "'", 1);
> -+      first_time =3D FALSE;
> -+    }
> -+#endif
> -   for (i =3D 0; (int) i < n_switches; i++)
> -     {
> -       const char *const *args;
> ---
> -1.7.10.4
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0023-Use-the-defaults.h-in=
-B-instead-of-S-and-t-oe-in-B.patch b/meta/recipes-devtools/gcc/gcc-4.9/002=
3-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
> deleted file mode 100644
> index fddfe9e..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.9/0023-Use-the-defaults.h-in-B-inst=
ead-of-S-and-t-oe-in-B.patch
> +++ /dev/null
> @@ -1,96 +0,0 @@
> -From f7d49ca445e60faa1b5256c6b4f96c1ee5c0e353 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 29 Mar 2013 09:17:25 +0400
> -Subject: [PATCH 23/35] Use the defaults.h in ${B} instead of ${S}, and t=
-oe
> - in ${B}
> -
> -Use the defaults.h in ${B} instead of ${S}, and t-oe in ${B}, so that
> -the source can be shared between gcc-cross-initial,
> -gcc-cross-intermediate, gcc-cross, gcc-runtime, and also the sdk build.
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Upstream-Status: Pending
> -
> -While compiling gcc-crosssdk-initial-x86_64 on some host, there is
> -occasionally failure that test the existance of default.h doesn't
> -work, the reason is tm_include_list=3D'** defaults.h' rather than
> -tm_include_list=3D'** ./defaults.h'
> -
> -So we add the test condition for this situation.
> -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ----
> - gcc/Makefile.in  |    2 +-
> - gcc/configure    |    4 ++--
> - gcc/configure.ac |    4 ++--
> - gcc/mkconfig.sh  |    4 ++--
> - 4 files changed, 7 insertions(+), 7 deletions(-)
> -
> -diff --git a/gcc/Makefile.in b/gcc/Makefile.in
> -index d1ab22f..15fe4b6 100644
> ---- a/gcc/Makefile.in
> -+++ b/gcc/Makefile.in
> -@@ -483,7 +483,7 @@ TARGET_SYSTEM_ROOT =3D @TARGET_SYSTEM_ROOT@
> - TARGET_SYSTEM_ROOT_DEFINE =3D @TARGET_SYSTEM_ROOT_DEFINE@
> -
> - xmake_file=3D@xmake_file@
> --tmake_file=3D@tmake_file@
> -+tmake_file=3D@tmake_file@ ./t-oe
> - TM_ENDIAN_CONFIG=3D@TM_ENDIAN_CONFIG@
> - TM_MULTILIB_CONFIG=3D@TM_MULTILIB_CONFIG@
> - TM_MULTILIB_EXCEPTIONS_CONFIG=3D@TM_MULTILIB_EXCEPTIONS_CONFIG@
> -diff --git a/gcc/configure b/gcc/configure
> -index 5399b2b..60a04bd 100755
> ---- a/gcc/configure
> -+++ b/gcc/configure
> -@@ -11631,8 +11631,8 @@ for f in $tm_file; do
> -        tm_include_list=3D"${tm_include_list} $f"
> -        ;;
> -     defaults.h )
> --       tm_file_list=3D"${tm_file_list} \$(srcdir)/$f"
> --       tm_include_list=3D"${tm_include_list} $f"
> -+       tm_file_list=3D"${tm_file_list} ./$f"
> -+       tm_include_list=3D"${tm_include_list} ./$f"
> -        ;;
> -     * )
> -        tm_file_list=3D"${tm_file_list} \$(srcdir)/config/$f"
> -diff --git a/gcc/configure.ac b/gcc/configure.ac
> -index f87c3b6..460e0d9 100644
> ---- a/gcc/configure.ac
> -+++ b/gcc/configure.ac
> -@@ -1740,8 +1740,8 @@ for f in $tm_file; do
> -        tm_include_list=3D"${tm_include_list} $f"
> -        ;;
> -     defaults.h )
> --       tm_file_list=3D"${tm_file_list} \$(srcdir)/$f"
> --       tm_include_list=3D"${tm_include_list} $f"
> -+       tm_file_list=3D"${tm_file_list} ./$f"
> -+       tm_include_list=3D"${tm_include_list} ./$f"
> -        ;;
> -     * )
> -        tm_file_list=3D"${tm_file_list} \$(srcdir)/config/$f"
> -diff --git a/gcc/mkconfig.sh b/gcc/mkconfig.sh
> -index c7146ed..b153f45 100644
> ---- a/gcc/mkconfig.sh
> -+++ b/gcc/mkconfig.sh
> -@@ -77,7 +77,7 @@ if [ -n "$HEADERS" ]; then
> -     if [ $# -ge 1 ]; then
> -       echo '#ifdef IN_GCC' >> ${output}T
> -       for file in "$@"; do
> --          if test x"$file" =3D x"defaults.h"; then
> -+          if test x"$file" =3D x"./defaults.h" -o x"$file" =3D x"defaul=
ts.h"; then
> -               postpone_defaults_h=3D"yes"
> -           else
> -               echo "# include \"$file\"" >> ${output}T
> -@@ -106,7 +106,7 @@ esac
> -
> - # If we postponed including defaults.h, add the #include now.
> - if test x"$postpone_defaults_h" =3D x"yes"; then
> --    echo "# include \"defaults.h\"" >> ${output}T
> -+    echo "# include \"./defaults.h\"" >> ${output}T
> - fi
> -
> - # Add multiple inclusion protection guard, part two.
> ---
> -1.9.1
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0025-fortran-cross-compile=
-hack.patch b/meta/recipes-devtools/gcc/gcc-4.9/0025-fortran-cross-compile-=
hack.patch
> deleted file mode 100644
> index 0e7914d..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.9/0025-fortran-cross-compile-hack.p=
atch
> +++ /dev/null
> @@ -1,46 +0,0 @@
> -From af8a56ea4e17b2909eff2c57704ab43ef24f28d3 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 29 Mar 2013 09:20:01 +0400
> -Subject: [PATCH 25/35] fortran cross-compile hack.
> -
> -* Fortran would have searched for arm-angstrom-gnueabi-gfortran but woul=
d have used
> -used gfortan. For gcc_4.2.2.bb we want to use the gfortran compiler from=
 our cross
> -directory.
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Upstream-Status: Inappropriate [embedded specific]
> ----
> - libgfortran/configure    |    2 +-
> - libgfortran/configure.ac |    2 +-
> - 2 files changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/libgfortran/configure b/libgfortran/configure
> -index 8385e96..b8f7a92 100755
> ---- a/libgfortran/configure
> -+++ b/libgfortran/configure
> -@@ -12704,7 +12704,7 @@ esac
> -
> - # We need gfortran to compile parts of the library
> - #AC_PROG_FC(gfortran)
> --FC=3D"$GFORTRAN"
> -+#FC=3D"$GFORTRAN"
> - ac_ext=3D${ac_fc_srcext-f}
> - ac_compile=3D'$FC -c $FCFLAGS $ac_fcflags_srcext conftest.$ac_ext >&5'
> - ac_link=3D'$FC -o conftest$ac_exeext $FCFLAGS $LDFLAGS $ac_fcflags_srce=
xt conftest.$ac_ext $LIBS >&5'
> -diff --git a/libgfortran/configure.ac b/libgfortran/configure.ac
> -index 7d97fed..3f9f484 100644
> ---- a/libgfortran/configure.ac
> -+++ b/libgfortran/configure.ac
> -@@ -227,7 +227,7 @@ AC_SUBST(enable_static)
> -
> - # We need gfortran to compile parts of the library
> - #AC_PROG_FC(gfortran)
> --FC=3D"$GFORTRAN"
> -+#FC=3D"$GFORTRAN"
> - AC_PROG_FC(gfortran)
> -
> - # extra LD Flags which are required for targets
> ---
> -1.7.10.4
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0026-libgcc-sjlj-check.pat=
ch b/meta/recipes-devtools/gcc/gcc-4.9/0026-libgcc-sjlj-check.patch
> deleted file mode 100644
> index d4efab9..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.9/0026-libgcc-sjlj-check.patch
> +++ /dev/null
> @@ -1,74 +0,0 @@
> -From 08c2398445e6cac282488f64ae6bf29cbcd8db23 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 29 Mar 2013 09:20:50 +0400
> -Subject: [PATCH 26/35] libgcc-sjlj-check
> -
> -ac_fn_c_try_compile doesnt seem to keep the intermediate files
> -which are needed for sjlj test to pass since it greps into the
> -generated file. So we run the compiler command using AC_TRY_COMMAND
> -which then generates the needed .s file
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Upstream-Status: Pending
> ----
> - libgcc/configure    |   10 ++++++----
> - libgcc/configure.ac |   10 ++++------
> - 2 files changed, 10 insertions(+), 10 deletions(-)
> -
> -diff --git a/libgcc/configure b/libgcc/configure
> -index 1425df6..d18e3cb 100644
> ---- a/libgcc/configure
> -+++ b/libgcc/configure
> -@@ -4208,17 +4208,19 @@ void foo ()
> - }
> -
> - _ACEOF
> --CFLAGS_hold=3D$CFLAGS
> --CFLAGS=3D"--save-temps -fexceptions"
> - libgcc_cv_lib_sjlj_exceptions=3Dunknown
> --if ac_fn_c_try_compile; then :
> -+if { ac_try=3D'${CC-cc} -fexceptions -S conftest.c -o conftest.s 1>&5'
> -+  { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_try\""; } >&5
> -+  (eval $ac_try) 2>&5
> -+  ac_status=3D$?
> -+  $as_echo "$as_me:${as_lineno-$LINENO}: \$? =3D $ac_status" >&5
> -+  test $ac_status =3D 0; }; }; then
> -   if grep _Unwind_SjLj_Resume conftest.s >/dev/null 2>&1; then
> -     libgcc_cv_lib_sjlj_exceptions=3Dyes
> -   elif grep _Unwind_Resume conftest.s >/dev/null 2>&1; then
> -     libgcc_cv_lib_sjlj_exceptions=3Dno
> -   fi
> - fi
> --CFLAGS=3D$CFLAGS_hold
> - rm -f conftest*
> -
> - fi
> -diff --git a/libgcc/configure.ac b/libgcc/configure.ac
> -index 8b7aba5..c7c9644 100644
> ---- a/libgcc/configure.ac
> -+++ b/libgcc/configure.ac
> -@@ -216,16 +216,14 @@ void foo ()
> -   bar();
> - }
> - ])])
> --CFLAGS_hold=3D$CFLAGS
> --CFLAGS=3D"--save-temps -fexceptions"
> - libgcc_cv_lib_sjlj_exceptions=3Dunknown
> --AS_IF([ac_fn_c_try_compile],
> --  [if grep _Unwind_SjLj_Resume conftest.s >/dev/null 2>&1; then
> -+if AC_TRY_COMMAND(${CC-cc} -fexceptions -S conftest.c -o conftest.s 1>&=
AS_MESSAGE_LOG_FD); then
> -+  if grep _Unwind_SjLj_Resume conftest.s >/dev/null 2>&1; then
> -     libgcc_cv_lib_sjlj_exceptions=3Dyes
> -   elif grep _Unwind_Resume conftest.s >/dev/null 2>&1; then
> -     libgcc_cv_lib_sjlj_exceptions=3Dno
> --  fi])
> --CFLAGS=3D$CFLAGS_hold
> -+  fi
> -+fi
> - rm -f conftest*
> - ])
> -
> ---
> -1.7.10.4
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0027-cpp-honor-sysroot.pat=
ch b/meta/recipes-devtools/gcc/gcc-4.9/0027-cpp-honor-sysroot.patch
> deleted file mode 100644
> index 05e9521..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.9/0027-cpp-honor-sysroot.patch
> +++ /dev/null
> @@ -1,54 +0,0 @@
> -From a0f9bd09c816ad29ecf7c29d6c27f7df97710364 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 29 Mar 2013 09:22:00 +0400
> -Subject: [PATCH 27/35] cpp: honor sysroot.
> -
> -Currently, if the gcc toolchain is relocated and installed from sstate, =
then you try and compile
> -preprocessed source (.i or .ii files), the compiler will try and access =
the builtin sysroot location
> -rather than the --sysroot option specified on the commandline. If access=
 to that directory is
> -permission denied (unreadable), gcc will error.
> -
> -This happens when ccache is in use due to the fact it uses preprocessed =
source files.
> -
> -The fix below adds %I to the cpp-output spec macro so the default substi=
tutions for -iprefix,
> --isystem, -isysroot happen and the correct sysroot is used.
> -
> -[YOCTO #2074]
> -
> -RP 2012/04/13
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Upstream-Status: Pending
> ----
> - gcc/cp/lang-specs.h |    2 +-
> - gcc/gcc.c           |    2 +-
> - 2 files changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/gcc/cp/lang-specs.h b/gcc/cp/lang-specs.h
> -index a001c3e..1aae1e4 100644
> ---- a/gcc/cp/lang-specs.h
> -+++ b/gcc/cp/lang-specs.h
> -@@ -63,5 +63,5 @@ along with GCC; see the file COPYING3.  If not see
> -   {".ii", "@c++-cpp-output", 0, 0, 0},
> -   {"@c++-cpp-output",
> -    "%{!M:%{!MM:%{!E:\
> --    cc1plus -fpreprocessed %i %(cc1_options) %2\
> -+    cc1plus -fpreprocessed %i %I %(cc1_options) %2\
> -     %{!fsyntax-only:%(invoke_as)}}}}", 0, 0, 0},
> -diff --git a/gcc/gcc.c b/gcc/gcc.c
> -index 51062aa..cf6b99e 100644
> ---- a/gcc/gcc.c
> -+++ b/gcc/gcc.c
> -@@ -1042,7 +1042,7 @@ static const struct compiler default_compilers[] =
=3D
> -                     %W{o*:--output-pch=3D%*}}%V}}}}}}", 0, 0, 0},
> -   {".i", "@cpp-output", 0, 0, 0},
> -   {"@cpp-output",
> --   "%{!M:%{!MM:%{!E:cc1 -fpreprocessed %i %(cc1_options) %{!fsyntax-onl=
y:%(invoke_as)}}}}", 0, 0, 0},
> -+   "%{!M:%{!MM:%{!E:cc1 -fpreprocessed %i %I %(cc1_options) %{!fsyntax-=
only:%(invoke_as)}}}}", 0, 0, 0},
> -   {".s", "@assembler", 0, 0, 0},
> -   {"@assembler",
> -    "%{!M:%{!MM:%{!E:%{!S:as %(asm_debug) %(asm_options) %i %A }}}}", 0,=
 0, 0},
> ---
> -1.7.10.4
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0028-MIPS64-Default-to-N64=
-ABI.patch b/meta/recipes-devtools/gcc/gcc-4.9/0028-MIPS64-Default-to-N64-A=
BI.patch
> deleted file mode 100644
> index 2638720..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.9/0028-MIPS64-Default-to-N64-ABI.pa=
tch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -From 301e18d4711db5925e767fad08dffa9cfe0a2f1f Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 29 Mar 2013 09:23:08 +0400
> -Subject: [PATCH 28/35] MIPS64: Default to N64 ABI
> -
> -MIPS64 defaults to n32 ABI, this patch makes it
> -so that it defaults to N64 ABI
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Upstream-Status: Inappropriate [OE config specific]
> ----
> - gcc/config.gcc |    2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/gcc/config.gcc b/gcc/config.gcc
> -index 1a0be50..989c2fb 100644
> ---- a/gcc/config.gcc
> -+++ b/gcc/config.gcc
> -@@ -1797,7 +1797,7 @@ mips*-mti-linux*)
> - mips64*-*-linux* | mipsisa64*-*-linux*)
> -       tm_file=3D"dbxelf.h elfos.h gnu-user.h linux.h glibc-stdint.h ${t=
m_file} mips/gnu-user.h mips/gnu-user64.h mips/linux64.h mips/linux-common.=
h"
> -       tmake_file=3D"${tmake_file} mips/t-linux64"
> --      tm_defines=3D"${tm_defines} MIPS_ABI_DEFAULT=3DABI_N32"
> -+      tm_defines=3D"${tm_defines} MIPS_ABI_DEFAULT=3DABI_64"
> -       case ${target} in
> -               mips64el-st-linux-gnu)
> -                       tm_file=3D"${tm_file} mips/st.h"
> ---
> -1.7.10.4
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0029-Define-GLIBC_DYNAMIC_=
LINKER-and-UCLIBC_DYNAMIC_LINKE.patch b/meta/recipes-devtools/gcc/gcc-4.9/0=
029-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
> deleted file mode 100644
> index 969d290..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.9/0029-Define-GLIBC_DYNAMIC_LINKER-=
and-UCLIBC_DYNAMIC_LINKE.patch
> +++ /dev/null
> @@ -1,228 +0,0 @@
> -From 29d12344fb682a053de53eb08b95704cf3b67af2 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 29 Mar 2013 09:24:50 +0400
> -Subject: [PATCH 29/35] Define GLIBC_DYNAMIC_LINKER and UCLIBC_DYNAMIC_LI=
NKER
> - relative to SYSTEMLIBS_DIR
> -
> -This patch defines GLIBC_DYNAMIC_LINKER and UCLIBC_DYNAMIC_LINKER
> -relative to SYSTEMLIBS_DIR which can be set in generated headers
> -This breaks the assumption of hardcoded multilib in gcc
> -Change is only for the supported architectures in OE including
> -SH, sparc, alpha for possible future support (if any)
> -
> -Removes the do_headerfix task in metadata
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Upstream-Status: Inappropriate [OE configuration]
> ----
> - gcc/config/alpha/linux-elf.h |    4 ++--
> - gcc/config/arm/linux-eabi.h  |    4 ++--
> - gcc/config/arm/linux-elf.h   |    2 +-
> - gcc/config/i386/linux.h      |    2 +-
> - gcc/config/i386/linux64.h    |    6 +++---
> - gcc/config/mips/linux.h      |    2 +-
> - gcc/config/mips/linux64.h    |    8 ++++----
> - gcc/config/rs6000/linux64.h  |    8 ++++----
> - gcc/config/sh/linux.h        |    2 +-
> - gcc/config/sparc/linux.h     |    2 +-
> - gcc/config/sparc/linux64.h   |    4 ++--
> - 11 files changed, 22 insertions(+), 22 deletions(-)
> -
> -Index: gcc-4.9.0/gcc/config/alpha/linux-elf.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.9.0.orig/gcc/config/alpha/linux-elf.h        2014-05-07 16:43:=
50.609106535 +0000
> -+++ gcc-4.9.0/gcc/config/alpha/linux-elf.h     2014-05-07 16:43:50.60510=
6535 +0000
> -@@ -23,8 +23,8 @@
> - #define EXTRA_SPECS \
> - { "elf_dynamic_linker", ELF_DYNAMIC_LINKER },
> -
> --#define GLIBC_DYNAMIC_LINKER  "/lib/ld-linux.so.2"
> --#define UCLIBC_DYNAMIC_LINKER "/lib/ld-uClibc.so.0"
> -+#define GLIBC_DYNAMIC_LINKER  SYSTEMLIBS_DIR "ld-linux.so.2"
> -+#define UCLIBC_DYNAMIC_LINKER  SYSTEMLIBS_DIR "ld-uClibc.so.0"
> - #if DEFAULT_LIBC =3D=3D LIBC_UCLIBC
> - #define CHOOSE_DYNAMIC_LINKER(G, U) "%{mglibc:" G ";:" U "}"
> - #elif DEFAULT_LIBC =3D=3D LIBC_GLIBC
> -Index: gcc-4.9.0/gcc/config/arm/linux-eabi.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.9.0.orig/gcc/config/arm/linux-eabi.h 2014-05-07 16:43:50.60910=
6535 +0000
> -+++ gcc-4.9.0/gcc/config/arm/linux-eabi.h      2014-05-07 16:43:50.60510=
6535 +0000
> -@@ -68,8 +68,8 @@
> -    GLIBC_DYNAMIC_LINKER_DEFAULT and TARGET_DEFAULT_FLOAT_ABI.  */
> -
> - #undef  GLIBC_DYNAMIC_LINKER
> --#define GLIBC_DYNAMIC_LINKER_SOFT_FLOAT "/lib/ld-linux.so.3"
> --#define GLIBC_DYNAMIC_LINKER_HARD_FLOAT "/lib/ld-linux-armhf.so.3"
> -+#define GLIBC_DYNAMIC_LINKER_SOFT_FLOAT SYSTEMLIBS_DIR "ld-linux.so.3"
> -+#define GLIBC_DYNAMIC_LINKER_HARD_FLOAT SYSTEMLIBS_DIR "ld-linux-armhf.=
so.3"
> - #define GLIBC_DYNAMIC_LINKER_DEFAULT GLIBC_DYNAMIC_LINKER_SOFT_FLOAT
> -
> - #define GLIBC_DYNAMIC_LINKER \
> -Index: gcc-4.9.0/gcc/config/arm/linux-elf.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.9.0.orig/gcc/config/arm/linux-elf.h  2014-05-07 16:43:50.60910=
6535 +0000
> -+++ gcc-4.9.0/gcc/config/arm/linux-elf.h       2014-05-07 16:43:50.60510=
6535 +0000
> -@@ -57,7 +57,7 @@
> -
> - #define LIBGCC_SPEC "%{mfloat-abi=3Dsoft*:-lfloat} -lgcc"
> -
> --#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
> -+#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux.so.2"
> -
> - #define LINUX_TARGET_LINK_SPEC  "%{h*} \
> -    %{static:-Bstatic} \
> -Index: gcc-4.9.0/gcc/config/i386/linux.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.9.0.orig/gcc/config/i386/linux.h     2014-05-07 16:43:50.60910=
6535 +0000
> -+++ gcc-4.9.0/gcc/config/i386/linux.h  2014-05-07 16:43:50.605106535 +00=
00
> -@@ -20,4 +20,4 @@
> - <http://www.gnu.org/licenses/>.  */
> -
> - #define GNU_USER_LINK_EMULATION "elf_i386"
> --#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
> -+#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux.so.2"
> -Index: gcc-4.9.0/gcc/config/i386/linux64.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.9.0.orig/gcc/config/i386/linux64.h   2014-05-07 16:43:50.60910=
6535 +0000
> -+++ gcc-4.9.0/gcc/config/i386/linux64.h        2014-05-07 16:43:50.60510=
6535 +0000
> -@@ -27,6 +27,6 @@
> - #define GNU_USER_LINK_EMULATION64 "elf_x86_64"
> - #define GNU_USER_LINK_EMULATIONX32 "elf32_x86_64"
> -
> --#define GLIBC_DYNAMIC_LINKER32 "/lib/ld-linux.so.2"
> --#define GLIBC_DYNAMIC_LINKER64 "/lib64/ld-linux-x86-64.so.2"
> --#define GLIBC_DYNAMIC_LINKERX32 "/libx32/ld-linux-x32.so.2"
> -+#define GLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-linux.so.2"
> -+#define GLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld-linux-x86-64.so.2"
> -+#define GLIBC_DYNAMIC_LINKERX32 SYSTEMLIBS_DIR "ld-linux-x32.so.2"
> -Index: gcc-4.9.0/gcc/config/mips/linux.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.9.0.orig/gcc/config/mips/linux.h     2014-05-07 16:43:50.60910=
6535 +0000
> -+++ gcc-4.9.0/gcc/config/mips/linux.h  2014-05-07 16:43:50.605106535 +00=
00
> -@@ -18,8 +18,8 @@
> - <http://www.gnu.org/licenses/>.  */
> -
> - #define GLIBC_DYNAMIC_LINKER \
> --  "%{mnan=3D2008:/lib/ld-linux-mipsn8.so.1;:/lib/ld.so.1}"
> -+  "%{mnan=3D2008:" SYSTEMLIBS_DIR "ld-linux-mipsn8.so.1;:" SYSTEMLIBS_D=
IR "ld.so.1}"
> -
> - #undef UCLIBC_DYNAMIC_LINKER
> - #define UCLIBC_DYNAMIC_LINKER \
> --  "%{mnan=3D2008:/lib/ld-uClibc-mipsn8.so.0;:/lib/ld-uClibc.so.0}"
> -+  "%{mnan=3D2008:" SYSTEMLIBS_DIR "ld-uClibc-mipsn8.so.0;:" SYSTEMLIBS_=
DIR "ld-uClibc.so.0}"
> -Index: gcc-4.9.0/gcc/config/mips/linux64.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.9.0.orig/gcc/config/mips/linux64.h   2014-05-07 16:43:50.60910=
6535 +0000
> -+++ gcc-4.9.0/gcc/config/mips/linux64.h        2014-05-07 16:43:50.60510=
6535 +0000
> -@@ -23,20 +23,20 @@
> - #define GNU_USER_LINK_EMULATIONN32 "elf32%{EB:b}%{EL:l}tsmipn32"
> -
> - #define GLIBC_DYNAMIC_LINKER32 \
> --  "%{mnan=3D2008:/lib/ld-linux-mipsn8.so.1;:/lib/ld.so.1}"
> -+  "%{mnan=3D2008:" SYSTEMLIBS_DIR "ld-linux-mipsn8.so.1;:" SYSTEMLIBS_D=
IR "ld.so.1}"
> - #define GLIBC_DYNAMIC_LINKER64 \
> --  "%{mnan=3D2008:/lib64/ld-linux-mipsn8.so.1;:/lib64/ld.so.1}"
> -+  "%{mnan=3D2008:" SYSTEMLIBS_DIR "ld-linux-mipsn8.so.1;:" SYSTEMLIBS_D=
IR "ld.so.1}"
> - #define GLIBC_DYNAMIC_LINKERN32 \
> --  "%{mnan=3D2008:/lib32/ld-linux-mipsn8.so.1;:/lib32/ld.so.1}"
> -+  "%{mnan=3D2008:" SYSTEMLIBS_DIR "ld-linux-mipsn8.so.1;:" SYSTEMLIBS_D=
IR "ld.so.1}"
> -
> - #undef UCLIBC_DYNAMIC_LINKER32
> - #define UCLIBC_DYNAMIC_LINKER32 \
> --  "%{mnan=3D2008:/lib/ld-uClibc-mipsn8.so.0;:/lib/ld-uClibc.so.0}"
> -+  "%{mnan=3D2008:" SYSTEMLIBS_DIR "ld-uClibc-mipsn8.so.0;:" SYSTEMLIBS_=
DIR "ld-uClibc.so.0}"
> - #undef UCLIBC_DYNAMIC_LINKER64
> - #define UCLIBC_DYNAMIC_LINKER64 \
> --  "%{mnan=3D2008:/lib/ld64-uClibc-mipsn8.so.0;:/lib/ld64-uClibc.so.0}"
> -+  "%{mnan=3D2008:" SYSTEMLIBS_DIR "ld64-uClibc-mipsn8.so.0;:" SYSTEMLIB=
S_DIR "ld64-uClibc.so.0}"
> - #define UCLIBC_DYNAMIC_LINKERN32 \
> --  "%{mnan=3D2008:/lib32/ld-uClibc-mipsn8.so.0;:/lib32/ld-uClibc.so.0}"
> -+  "%{mnan=3D2008:" SYSTEMLIBS_DIR "ld-uClibc-mipsn8.so.0;:" SYSTEMLIBS_=
DIR "ld-uClibc.so.0}"
> -
> - #define BIONIC_DYNAMIC_LINKERN32 "/system/bin/linker32"
> - #define GNU_USER_DYNAMIC_LINKERN32 \
> -Index: gcc-4.9.0/gcc/config/rs6000/linux64.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.9.0.orig/gcc/config/rs6000/linux64.h 2014-05-07 16:43:50.60910=
6535 +0000
> -+++ gcc-4.9.0/gcc/config/rs6000/linux64.h      2014-05-07 16:43:50.60510=
6535 +0000
> -@@ -367,14 +367,14 @@
> - #undef        LINK_OS_DEFAULT_SPEC
> - #define LINK_OS_DEFAULT_SPEC "%(link_os_linux)"
> -
> --#define GLIBC_DYNAMIC_LINKER32 "/lib/ld.so.1"
> -+#define GLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld.so.1"
> - #ifdef LINUX64_DEFAULT_ABI_ELFv2
> --#define GLIBC_DYNAMIC_LINKER64 "%{mabi=3Delfv1:/lib64/ld64.so.1;:/lib64=
/ld64.so.2}"
> -+#define GLIBC_DYNAMIC_LINKER64 "%{mabi=3Delfv1:" SYSTEMLIBS_DIR "ld64.s=
o.1;:" SYSTEMLIBS_DIR "ld64.so.2}"
> - #else
> --#define GLIBC_DYNAMIC_LINKER64 "%{mabi=3Delfv2:/lib64/ld64.so.2;:/lib64=
/ld64.so.1}"
> -+#define GLIBC_DYNAMIC_LINKER64 "%{mabi=3Delfv2:" SYSTEMLIBS_DIR "ld64.s=
o.2;:" SYSTEMLIBS_DIR "ld64.so.1}"
> - #endif
> --#define UCLIBC_DYNAMIC_LINKER32 "/lib/ld-uClibc.so.0"
> --#define UCLIBC_DYNAMIC_LINKER64 "/lib/ld64-uClibc.so.0"
> -+#define UCLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-uClibc.so.0"
> -+#define UCLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld64-uClibc.so.0"
> - #if DEFAULT_LIBC =3D=3D LIBC_UCLIBC
> - #define CHOOSE_DYNAMIC_LINKER(G, U) "%{mglibc:" G ";:" U "}"
> - #elif DEFAULT_LIBC =3D=3D LIBC_GLIBC
> -Index: gcc-4.9.0/gcc/config/sh/linux.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.9.0.orig/gcc/config/sh/linux.h       2014-05-07 16:43:50.60910=
6535 +0000
> -+++ gcc-4.9.0/gcc/config/sh/linux.h    2014-05-07 16:43:50.605106535 +00=
00
> -@@ -43,7 +43,7 @@
> -
> - #define TARGET_ASM_FILE_END file_end_indicate_exec_stack
> -
> --#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
> -+#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux.so.2"
> -
> - #undef SUBTARGET_LINK_EMUL_SUFFIX
> - #define SUBTARGET_LINK_EMUL_SUFFIX "_linux"
> -Index: gcc-4.9.0/gcc/config/sparc/linux.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.9.0.orig/gcc/config/sparc/linux.h    2014-05-07 16:43:50.60910=
6535 +0000
> -+++ gcc-4.9.0/gcc/config/sparc/linux.h 2014-05-07 16:43:50.605106535 +00=
00
> -@@ -83,7 +83,7 @@
> -    When the -shared link option is used a final link is not being
> -    done.  */
> -
> --#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
> -+#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux.so.2"
> -
> - #undef  LINK_SPEC
> - #define LINK_SPEC "-m elf32_sparc %{shared:-shared} \
> -Index: gcc-4.9.0/gcc/config/sparc/linux64.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.9.0.orig/gcc/config/sparc/linux64.h  2014-05-07 16:43:50.60910=
6535 +0000
> -+++ gcc-4.9.0/gcc/config/sparc/linux64.h       2014-05-07 16:43:50.60510=
6535 +0000
> -@@ -92,8 +92,8 @@
> -    When the -shared link option is used a final link is not being
> -    done.  */
> -
> --#define GLIBC_DYNAMIC_LINKER32 "/lib/ld-linux.so.2"
> --#define GLIBC_DYNAMIC_LINKER64 "/lib64/ld-linux.so.2"
> -+#define GLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-linux.so.2"
> -+#define GLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld-linux.so.2"
> -
> - #ifdef SPARC_BI_ARCH
> -
> -Index: gcc-4.9.0/gcc/config/linux.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.9.0.orig/gcc/config/linux.h  2014-05-07 16:43:50.609106535 +00=
00
> -+++ gcc-4.9.0/gcc/config/linux.h       2014-05-07 16:43:50.605106535 +00=
00
> -@@ -73,10 +73,10 @@
> -    GLIBC_DYNAMIC_LINKER must be defined for each target using them, or
> -    GLIBC_DYNAMIC_LINKER32 and GLIBC_DYNAMIC_LINKER64 for targets
> -    supporting both 32-bit and 64-bit compilation.  */
> --#define UCLIBC_DYNAMIC_LINKER "/lib/ld-uClibc.so.0"
> --#define UCLIBC_DYNAMIC_LINKER32 "/lib/ld-uClibc.so.0"
> --#define UCLIBC_DYNAMIC_LINKER64 "/lib/ld64-uClibc.so.0"
> --#define UCLIBC_DYNAMIC_LINKERX32 "/lib/ldx32-uClibc.so.0"
> -+#define UCLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-uClibc.so.0"
> -+#define UCLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-uClibc.so.0"
> -+#define UCLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld64-uClibc.so.0"
> -+#define UCLIBC_DYNAMIC_LINKERX32 SYSTEMLIBS_DIR "ldx32-uClibc.so.0"
> - #define BIONIC_DYNAMIC_LINKER "/system/bin/linker"
> - #define BIONIC_DYNAMIC_LINKER32 "/system/bin/linker"
> - #define BIONIC_DYNAMIC_LINKER64 "/system/bin/linker64"
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0030-gcc-Fix-argument-list=
-too-long-error.patch b/meta/recipes-devtools/gcc/gcc-4.9/0030-gcc-Fix-argu=
ment-list-too-long-error.patch
> deleted file mode 100644
> index 2ceaff6..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.9/0030-gcc-Fix-argument-list-too-lo=
ng-error.patch
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -From c1816c160156f99c34e6a0a0311bb0219326804e Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 29 Mar 2013 09:26:37 +0400
> -Subject: [PATCH 30/35] gcc: Fix argument list too long error.
> -
> -There would be an "Argument list too long" error when the
> -build directory is longer than 200, this is caused by:
> -
> -headers=3D`echo $(PLUGIN_HEADERS) | tr ' ' '\012' | sort -u`
> -
> -The PLUGIN_HEADERS is too long before sort, so the "echo" can't handle
> -it, use the $(sort list) of GNU make which can handle the too long list
> -would fix the problem, the header would be short enough after sorted.
> -The "tr ' ' '\012'" was used for translating the space to "\n", the
> -$(sort list) doesn't need this.
> -
> -Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Upstream-Status: Pending
> ----
> - gcc/Makefile.in |    2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/gcc/Makefile.in b/gcc/Makefile.in
> -index 2320497..8562a62 100644
> ---- a/gcc/Makefile.in
> -+++ b/gcc/Makefile.in
> -@@ -4627,7 +4627,7 @@ install-plugin: installdirs lang.install-plugin s-=
header-vars install-gengtype
> - # We keep the directory structure for files in config or c-family and .=
def
> - # files. All other files are flattened to a single directory.
> -       $(mkinstalldirs) $(DESTDIR)$(plugin_includedir)
> --      headers=3D`echo $(PLUGIN_HEADERS) | tr ' ' '\012' | sort -u`; \
> -+      headers=3D"$(sort $(PLUGIN_HEADERS))"; \
> -       srcdirstrip=3D`echo "$(srcdir)" | sed 's/[].[^$$\\*|]/\\\\&/g'`; =
\
> -       for file in $$headers; do \
> -         if [ -f $$file ] ; then \
> ---
> -1.7.10.4
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0031-Disable-sdt.patch b/m=
eta/recipes-devtools/gcc/gcc-4.9/0031-Disable-sdt.patch
> deleted file mode 100644
> index 2c1d5e0..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.9/0031-Disable-sdt.patch
> +++ /dev/null
> @@ -1,113 +0,0 @@
> -From b85265bc94ec1beaf1d3b697c03db62991553467 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 29 Mar 2013 09:28:10 +0400
> -Subject: [PATCH 31/35] Disable sdt.
> -
> -We don't list dtrace in DEPENDS so we shouldn't be depending on this hea=
der.
> -It may or may not exist from preivous builds though. To be determinstic,=
 disable
> -sdt.h usage always. This avoids build failures if the header is removed =
after configure
> -but before libgcc is compiled for example.
> -
> -RP 2012/8/7
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Disable sdt for libstdc++-v3.
> -
> -Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> -
> -Upstream-Status: Inappropriate [hack]
> ----
> - gcc/configure             | 12 ++++++------
> - gcc/configure.ac          | 18 +++++++++---------
> - libstdc++-v3/configure    |  6 +++---
> - libstdc++-v3/configure.ac |  2 +-
> - 4 files changed, 19 insertions(+), 19 deletions(-)
> -
> -diff --git a/gcc/configure b/gcc/configure
> -index 3c550a6..01c7626 100755
> ---- a/gcc/configure
> -+++ b/gcc/configure
> -@@ -26812,12 +26812,12 @@ fi
> - { $as_echo "$as_me:${as_lineno-$LINENO}: checking sys/sdt.h in the targ=
et C library" >&5
> - $as_echo_n "checking sys/sdt.h in the target C library... " >&6; }
> - have_sys_sdt_h=3Dno
> --if test -f $target_header_dir/sys/sdt.h; then
> --  have_sys_sdt_h=3Dyes
> --
> --$as_echo "#define HAVE_SYS_SDT_H 1" >>confdefs.h
> --
> --fi
> -+#if test -f $target_header_dir/sys/sdt.h; then
> -+#  have_sys_sdt_h=3Dyes
> -+#
> -+#$as_echo "#define HAVE_SYS_SDT_H 1" >>confdefs.h
> -+#
> -+#fi
> - { $as_echo "$as_me:${as_lineno-$LINENO}: result: $have_sys_sdt_h" >&5
> - $as_echo "$have_sys_sdt_h" >&6; }
> -
> -diff --git a/gcc/configure.ac b/gcc/configure.ac
> -index 3601ab6..06e501f 100644
> ---- a/gcc/configure.ac
> -+++ b/gcc/configure.ac
> -@@ -4779,15 +4779,15 @@ if test x$gcc_cv_libc_provides_ssp =3D xyes; the=
n
> - fi
> -
> - # Test for <sys/sdt.h> on the target.
> --GCC_TARGET_TEMPLATE([HAVE_SYS_SDT_H])
> --AC_MSG_CHECKING(sys/sdt.h in the target C library)
> --have_sys_sdt_h=3Dno
> --if test -f $target_header_dir/sys/sdt.h; then
> --  have_sys_sdt_h=3Dyes
> --  AC_DEFINE(HAVE_SYS_SDT_H, 1,
> --            [Define if your target C library provides sys/sdt.h])
> --fi
> --AC_MSG_RESULT($have_sys_sdt_h)
> -+#GCC_TARGET_TEMPLATE([HAVE_SYS_SDT_H])
> -+#AC_MSG_CHECKING(sys/sdt.h in the target C library)
> -+#have_sys_sdt_h=3Dno
> -+#if test -f $target_header_dir/sys/sdt.h; then
> -+#  have_sys_sdt_h=3Dyes
> -+#  AC_DEFINE(HAVE_SYS_SDT_H, 1,
> -+#            [Define if your target C library provides sys/sdt.h])
> -+#fi
> -+#AC_MSG_RESULT($have_sys_sdt_h)
> -
> - # Check if TFmode long double should be used by default or not.
> - # Some glibc targets used DFmode long double, but with glibc 2.4
> -diff --git a/libstdc++-v3/configure b/libstdc++-v3/configure
> -index 4953c9f..53a1145 100755
> ---- a/libstdc++-v3/configure
> -+++ b/libstdc++-v3/configure
> -@@ -20578,11 +20578,11 @@ ac_compile=3D'$CC -c $CFLAGS $CPPFLAGS conftes=
t.$ac_ext >&5'
> - ac_link=3D'$CC -o conftest$ac_exeext $CFLAGS $CPPFLAGS $LDFLAGS conftes=
t.$ac_ext $LIBS >&5'
> - ac_compiler_gnu=3D$ac_cv_c_compiler_gnu
> -
> --  if test $glibcxx_cv_sys_sdt_h =3D yes; then
> -+#  if test $glibcxx_cv_sys_sdt_h =3D yes; then
> -
> --$as_echo "#define HAVE_SYS_SDT_H 1" >>confdefs.h
> -+#$as_echo "#define HAVE_SYS_SDT_H 1" >>confdefs.h
> -
> --  fi
> -+#  fi
> -   { $as_echo "$as_me:${as_lineno-$LINENO}: result: $glibcxx_cv_sys_sdt_=
h" >&5
> - $as_echo "$glibcxx_cv_sys_sdt_h" >&6; }
> -
> -diff --git a/libstdc++-v3/configure.ac b/libstdc++-v3/configure.ac
> -index 73d430a..f2135e2 100644
> ---- a/libstdc++-v3/configure.ac
> -+++ b/libstdc++-v3/configure.ac
> -@@ -211,7 +211,7 @@ GLIBCXX_CHECK_SC_NPROCESSORS_ONLN
> - GLIBCXX_CHECK_SC_NPROC_ONLN
> - GLIBCXX_CHECK_PTHREADS_NUM_PROCESSORS_NP
> - GLIBCXX_CHECK_SYSCTL_HW_NCPU
> --GLIBCXX_CHECK_SDT_H
> -+#GLIBCXX_CHECK_SDT_H
> -
> - # Check for available headers.
> - AC_CHECK_HEADERS([endian.h execinfo.h float.h fp.h ieeefp.h inttypes.h =
\
> ---
> -1.8.3.1
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0032-libtool.patch b/meta/=
recipes-devtools/gcc/gcc-4.9/0032-libtool.patch
> deleted file mode 100644
> index 3b3d1b6..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.9/0032-libtool.patch
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -From 6c715fcfa262adadca81c68a1f3f69aa3187a501 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 29 Mar 2013 09:29:11 +0400
> -Subject: [PATCH 32/35] libtool
> -
> -libstdc++ from gcc-runtime gets created with -rpath=3D/usr/lib/../lib fo=
r qemux86-64
> -when running on am x86_64 build host.
> -
> -This patch stops this speading to libdir in the libstdc++.la file within=
 libtool.
> -Arguably, it shouldn't be passing this into libtool in the first place b=
ut
> -for now this resolves the nastiest problems this causes.
> -
> -func_normal_abspath would resolve an empty path to `pwd` so we need
> -to filter the zero case.
> -
> -RP 2012/8/24
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Upstream-Status: Pending
> ----
> - ltmain.sh |    4 ++++
> - 1 file changed, 4 insertions(+)
> -
> -diff --git a/ltmain.sh b/ltmain.sh
> -index a03433f..46f47c2 100644
> ---- a/ltmain.sh
> -+++ b/ltmain.sh
> -@@ -6359,6 +6359,10 @@ func_mode_link ()
> -       func_warning "ignoring multiple \`-rpath's for a libtool library"
> -
> -       install_libdir=3D"$1"
> -+      if test -n "$install_libdir"; then
> -+      func_normal_abspath "$install_libdir"
> -+      install_libdir=3D$func_normal_abspath_result
> -+      fi
> -
> -       oldlibs=3D
> -       if test -z "$rpath"; then
> ---
> -1.7.10.4
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0033-gcc-armv4-pass-fix-v4=
bx-to-linker-to-support-EABI.patch b/meta/recipes-devtools/gcc/gcc-4.9/0033=
-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
> deleted file mode 100644
> index b236c37..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.9/0033-gcc-armv4-pass-fix-v4bx-to-l=
inker-to-support-EABI.patch
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -From 97e4591c20310425e7aca0e6712a8d9480e7744c Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 29 Mar 2013 09:30:32 +0400
> -Subject: [PATCH 33/35] gcc: armv4: pass fix-v4bx to linker to support EA=
BI.
> -
> -The LINK_SPEC for linux gets overwritten by linux-eabi.h which
> -means the value of TARGET_FIX_V4BX_SPEC gets lost and as a result
> -the option is not passed to linker when chosing march=3Darmv4
> -This patch redefines this in linux-eabi.h and reinserts it
> -for eabi defaulting toolchains.
> -
> -We might want to send it upstream.
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Upstream-Status: Pending
> ----
> - gcc/config/arm/linux-eabi.h |    6 +++++-
> - 1 file changed, 5 insertions(+), 1 deletion(-)
> -
> -Index: gcc-4.9-20140316/gcc/config/arm/linux-eabi.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.9-20140316.orig/gcc/config/arm/linux-eabi.h
> -+++ gcc-4.9-20140316/gcc/config/arm/linux-eabi.h
> -@@ -77,10 +77,14 @@
> -     %{mfloat-abi=3Dsoft*:" GLIBC_DYNAMIC_LINKER_SOFT_FLOAT "} \
> -     %{!mfloat-abi=3D*:" GLIBC_DYNAMIC_LINKER_DEFAULT "}"
> -
> -+/* For armv4 we pass --fix-v4bx to linker to support EABI */
> -+#undef TARGET_FIX_V4BX_SPEC
> -+#define TARGET_FIX_V4BX_SPEC "%{mcpu=3Darm8|mcpu=3Darm810|mcpu=3Dstrong=
arm*|march=3Darmv4: --fix-v4bx}"
> -+
> - /* At this point, bpabi.h will have clobbered LINK_SPEC.  We want to
> -    use the GNU/Linux version, not the generic BPABI version.  */
> - #undef  LINK_SPEC
> --#define LINK_SPEC EABI_LINK_SPEC                                      \
> -+#define LINK_SPEC TARGET_FIX_V4BX_SPEC EABI_LINK_SPEC                 \
> -   LINUX_OR_ANDROID_LD (LINUX_TARGET_LINK_SPEC,                         =
       \
> -                      LINUX_TARGET_LINK_SPEC " " ANDROID_LINK_SPEC)
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0034-Use-the-multilib-conf=
ig-files-from-B-instead-of-usin.patch b/meta/recipes-devtools/gcc/gcc-4.9/0=
034-Use-the-multilib-config-files-from-B-instead-of-usin.patch
> deleted file mode 100644
> index 66b9f89..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.9/0034-Use-the-multilib-config-file=
s-from-B-instead-of-usin.patch
> +++ /dev/null
> @@ -1,102 +0,0 @@
> -From fc5e4beaea856a2b486c770ad3addc0f5bb3100e Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 29 Mar 2013 09:33:04 +0400
> -Subject: [PATCH 34/35] Use the multilib config files from ${B} instead o=
f
> - using the ones from ${S}
> -
> -Use the multilib config files from ${B} instead of using the ones from $=
{S}
> -so that the source can be shared between gcc-cross-initial,
> -gcc-cross-intermediate, gcc-cross, gcc-runtime, and also the sdk build.
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
> -
> -Upstream-Status: Inappropriate [configuration]
> ----
> - gcc/configure    |   22 ++++++++++++++++++----
> - gcc/configure.ac |   22 ++++++++++++++++++----
> - 2 files changed, 36 insertions(+), 8 deletions(-)
> -
> -diff --git a/gcc/configure b/gcc/configure
> -index 8bc0c98..3cd0817 100755
> ---- a/gcc/configure
> -+++ b/gcc/configure
> -@@ -11519,10 +11519,20 @@ done
> - tmake_file_=3D
> - for f in ${tmake_file}
> - do
> --      if test -f ${srcdir}/config/$f
> --      then
> --              tmake_file_=3D"${tmake_file_} \$(srcdir)/config/$f"
> --      fi
> -+  case $f in
> -+    */t-linux64 )
> -+       if test -f ./config/$f
> -+       then
> -+         tmake_file_=3D"${tmake_file_} ./config/$f"
> -+       fi
> -+       ;;
> -+    * )
> -+       if test -f ${srcdir}/config/$f
> -+       then
> -+         tmake_file_=3D"${tmake_file_} \$(srcdir)/config/$f"
> -+       fi
> -+       ;;
> -+  esac
> - done
> - tmake_file=3D"${tmake_file_}"
> -
> -@@ -11533,6 +11543,10 @@ tm_file_list=3D"options.h"
> - tm_include_list=3D"options.h insn-constants.h"
> - for f in $tm_file; do
> -   case $f in
> -+    */linux64.h )
> -+       tm_file_list=3D"${tm_file_list} ./config/$f"
> -+       tm_include_list=3D"${tm_include_list} ./config/$f"
> -+       ;;
> -     ./* )
> -        f=3D`echo $f | sed 's/^..//'`
> -        tm_file_list=3D"${tm_file_list} $f"
> -diff --git a/gcc/configure.ac b/gcc/configure.ac
> -index 5e5e84f..415a6df 100644
> ---- a/gcc/configure.ac
> -+++ b/gcc/configure.ac
> -@@ -1700,10 +1700,20 @@ done
> - tmake_file_=3D
> - for f in ${tmake_file}
> - do
> --      if test -f ${srcdir}/config/$f
> --      then
> --              tmake_file_=3D"${tmake_file_} \$(srcdir)/config/$f"
> --      fi
> -+  case $f in
> -+    */t-linux64 )
> -+       if test -f ./config/$f
> -+       then
> -+         tmake_file_=3D"${tmake_file_} ./config/$f"
> -+       fi
> -+       ;;
> -+    * )
> -+       if test -f ${srcdir}/config/$f
> -+       then
> -+         tmake_file_=3D"${tmake_file_} \$(srcdir)/config/$f"
> -+       fi
> -+       ;;
> -+  esac
> - done
> - tmake_file=3D"${tmake_file_}"
> -
> -@@ -1714,6 +1724,10 @@ tm_file_list=3D"options.h"
> - tm_include_list=3D"options.h insn-constants.h"
> - for f in $tm_file; do
> -   case $f in
> -+    */linux64.h )
> -+       tm_file_list=3D"${tm_file_list} ./config/$f"
> -+       tm_include_list=3D"${tm_include_list} ./config/$f"
> -+       ;;
> -     ./* )
> -        f=3D`echo $f | sed 's/^..//'`
> -        tm_file_list=3D"${tm_file_list} $f"
> ---
> -1.7.10.4
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0040-fix-g++-sysroot.patch=
 b/meta/recipes-devtools/gcc/gcc-4.9/0040-fix-g++-sysroot.patch
> deleted file mode 100644
> index d50aa5c..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.9/0040-fix-g++-sysroot.patch
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -Portions of
> -
> -http://www.mail-archive.com/gcc-patches@gcc.gnu.org/msg26013.html
> -
> -are not upstreamed yet. So lets keep missing pieces.
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Index: gcc-4.8.1/gcc/configure.ac
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.8.1.orig/gcc/configure.ac    2013-07-15 15:55:49.488399132 -07=
00
> -+++ gcc-4.8.1/gcc/configure.ac 2013-07-15 16:02:31.772406679 -0700
> -@@ -148,7 +148,9 @@
> - if test "${with_sysroot+set}" =3D set; then
> -   gcc_gxx_without_sysroot=3D`expr "${gcc_gxx_include_dir}" : "${with_sy=
sroot}"'\(.*\)'`
> -   if test "${gcc_gxx_without_sysroot}"; then
> --    gcc_gxx_include_dir=3D"${gcc_gxx_without_sysroot}"
> -+    if test x${with_sysroot} !=3D x/; then
> -+      gcc_gxx_include_dir=3D"${gcc_gxx_without_sysroot}"
> -+    fi
> -     gcc_gxx_include_dir_add_sysroot=3D1
> -   fi
> - fi
> -Index: gcc-4.8.1/gcc/configure
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.8.1.orig/gcc/configure       2013-07-15 15:55:49.472399132 -07=
00
> -+++ gcc-4.8.1/gcc/configure    2013-07-15 16:02:31.780406680 -0700
> -@@ -3325,7 +3325,9 @@
> - if test "${with_sysroot+set}" =3D set; then
> -   gcc_gxx_without_sysroot=3D`expr "${gcc_gxx_include_dir}" : "${with_sy=
sroot}"'\(.*\)'`
> -   if test "${gcc_gxx_without_sysroot}"; then
> --    gcc_gxx_include_dir=3D"${gcc_gxx_without_sysroot}"
> -+    if test x${with_sysroot} !=3D x/; then
> -+      gcc_gxx_include_dir=3D"${gcc_gxx_without_sysroot}"
> -+    fi
> -     gcc_gxx_include_dir_add_sysroot=3D1
> -   fi
> - fi
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0041-libtool-avoid-libdir.=
patch b/meta/recipes-devtools/gcc/gcc-4.9/0041-libtool-avoid-libdir.patch
> deleted file mode 100644
> index 2dd9610..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.9/0041-libtool-avoid-libdir.patch
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -Avoid using libdir from .la which usually points to a host path
> -
> -Upstream-Status: Inappropriate [embedded specific]
> -Signed-off-by: Jonathan Liu <net147@gmail.com>
> -
> -diff --git a/ltmain.sh b/ltmain.sh
> -index a03433f..1902a90 100644
> ---- a/ltmain.sh
> -+++ b/ltmain.sh
> -@@ -5628,6 +5628,9 @@ func_mode_link ()
> -           absdir=3D"$abs_ladir"
> -           libdir=3D"$abs_ladir"
> -         else
> -+          # Instead of using libdir from .la which usually points to a =
host path,
> -+          # use the path the .la is contained in.
> -+          libdir=3D"$abs_ladir"
> -           dir=3D"$libdir"
> -           absdir=3D"$libdir"
> -         fi
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0043-cpp.patch b/meta/reci=
pes-devtools/gcc/gcc-4.9/0043-cpp.patch
> deleted file mode 100644
> index eaf8646..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.9/0043-cpp.patch
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -The OE environment sets and exports CPP as being the target gcc. When bu=
ilding
> -gcc-cross-canadian for a mingw targetted sdk, the following can be found=
 in
> -build.x86_64-pokysdk-mingw32.i586-poky-linux/build-x86_64-linux/libibert=
y/config.log:
> -
> -configure:3641: checking for _FILE_OFFSET_BITS value needed for large fi=
les
> -configure:3666: gcc  -c -isystem/media/build1/poky/build/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  conftest.c >&5
> -configure:3666: $? =3D 0
> -configure:3698: result: no
> -configure:3786: checking how to run the C preprocessor
> -configure:3856: result: x86_64-pokysdk-mingw32-gcc -E --sysroot=3D/media=
/build1/poky/build/tmp/sysroots/x86_64-nativesdk-mingw32-pokysdk-mingw32
> -configure:3876: x86_64-pokysdk-mingw32-gcc -E --sysroot=3D/media/build1/=
poky/build/tmp/sysroots/x86_64-nativesdk-mingw32-pokysdk-mingw32  conftest.=
c
> -configure:3876: $? =3D 0
> -
> -Note this is a *build* target (in build-x86_64-linux) so it should be us=
ing
> -the host "gcc", not x86_64-pokysdk-mingw32-gcc. Since the mingw32 header=
s are
> -very different, using the wrong cpp is a real problem. It is leaking int=
o
> -configure through the CPP variable. Ultimately this leads to build failu=
res
> -related to not being able to include a process.h file for pem-unix.c.
> -
> -The fix is to ensure we export a sane CPP value into the build environme=
nt when
> -using build targets. We could define a CPP_FOR_BUILD value which may be =
the version
> -which needs to be upstreamed but for now, this fix is good enough to avo=
id the
> -problem.
> -
> -RP 22/08/2013
> -
> -Upstream-Status: Pending
> -
> -Index: gcc-4.8.1/Makefile.in
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.8.1.orig/Makefile.in 2013-03-30 11:25:03.000000000 +0000
> -+++ gcc-4.8.1/Makefile.in      2013-08-13 12:03:17.151988882 +0000
> -@@ -149,6 +149,7 @@
> -       AR=3D"$(AR_FOR_BUILD)"; export AR; \
> -       AS=3D"$(AS_FOR_BUILD)"; export AS; \
> -       CC=3D"$(CC_FOR_BUILD)"; export CC; \
> -+      CPP=3D"$(CC_FOR_BUILD) -E"; export CPP; \
> -       CFLAGS=3D"$(CFLAGS_FOR_BUILD)"; export CFLAGS; \
> -       CONFIG_SHELL=3D"$(SHELL)"; export CONFIG_SHELL; \
> -       CXX=3D"$(CXX_FOR_BUILD)"; export CXX; \
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0044-gengtypes.patch b/met=
a/recipes-devtools/gcc/gcc-4.9/0044-gengtypes.patch
> deleted file mode 100644
> index e38761d..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.9/0044-gengtypes.patch
> +++ /dev/null
> @@ -1,97 +0,0 @@
> -gengtype is generated for both the build system and the target. -DGENERA=
TOR_FILE
> -was added in the patch http://gcc.gnu.org/ml/gcc-patches/2012-07/msg0027=
3.html
> -and was applied to both versions of gengtype.
> -
> -Unfortunately the presence of this flag triggers the build configuration=
 (bconfig.h)
> -to be included for the target build of gengtype. Compiling gengtype with=
 the target
> -compiler and bconfig.h can result in errors if the build and target syst=
ems are
> -dissimilar. An example case this fails is cross compiling gcc on linux f=
or a darwin
> -target system:
> -
> -In file included from /media/build1/poky/build/tmp/work-shared/gcc-4.8.1=
-r0/gcc-4.8.1/gcc/gengtype-parse.c:25:0:
> -| /media/build1/poky/build/tmp/work-shared/gcc-4.8.1-r0/gcc-4.8.1/gcc/ge=
ngtype-parse.c: In function 'void parse_error(const char*, ...)':
> -| /media/build1/poky/build/tmp/work-shared/gcc-4.8.1-r0/gcc-4.8.1/gcc/sy=
stem.h:93:53: error: 'fputc_unlocked' was not declared in this scope
> -|  #  define fputc(C, Stream) fputc_unlocked (C, Stream)
> -
> -which occurs since auto-build.h and auto-host.h have differnet values of
> -HAVE_FPUTC_UNLOCKED:
> -
> -#define HAVE_FPUTC_UNLOCKED 1
> -/* #undef HAVE_FPUTS_UNLOCKED */
> -
> -The obvious fix is to only include the flag on build/ targets which this=
 patch does, however
> -this also leads to compile errors due to const_tree being undefined but =
used in double_int.h
> -
> -I added a GENERATOR_FILE2 flag to workaround those in the
> -target case and allow the build to succeed.
> -
> -Only the build/gengtypes should have the -DGENERATOR_FILE
> -
> -RP 22/8/2013
> -
> -Upstream-Status: Pending
> -
> -Index: gcc-4.8.1/gcc/Makefile.in
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.8.1.orig/gcc/Makefile.in     2013-08-19 11:40:36.844014424 +00=
00
> -+++ gcc-4.8.1/gcc/Makefile.in  2013-08-19 11:40:37.784014402 +0000
> -@@ -3903,27 +3903,29 @@
> -
> - gengtype-lex.o build/gengtype-lex.o : gengtype-lex.c gengtype.h $(SYSTE=
M_H)
> - gengtype-lex.o: $(CONFIG_H) $(BCONFIG_H)
> --CFLAGS-gengtype-lex.o +=3D -DGENERATOR_FILE
> -+CFLAGS-build/gengtype-lex.o +=3D -DGENERATOR_FILE
> - build/gengtype-lex.o: $(BCONFIG_H)
> -
> - gengtype-parse.o build/gengtype-parse.o : gengtype-parse.c gengtype.h \
> -   $(SYSTEM_H)
> - gengtype-parse.o: $(CONFIG_H)
> --CFLAGS-gengtype-parse.o +=3D -DGENERATOR_FILE
> -+CFLAGS-build/gengtype-parse.o +=3D -DGENERATOR_FILE
> - build/gengtype-parse.o: $(BCONFIG_H)
> -
> - gengtype-state.o build/gengtype-state.o: gengtype-state.c $(SYSTEM_H) \
> -   gengtype.h errors.h double-int.h version.h $(HASHTAB_H) $(OBSTACK_H) =
\
> -   $(XREGEX_H)
> - gengtype-state.o: $(CONFIG_H)
> --CFLAGS-gengtype-state.o +=3D -DGENERATOR_FILE
> -+CFLAGS-gengtype-state.o +=3D -DGENERATOR_FILE2
> -+CFLAGS-build/gengtype-state.o +=3D -DGENERATOR_FILE
> - build/gengtype-state.o: $(BCONFIG_H)
> -
> - gengtype.o build/gengtype.o : gengtype.c $(SYSTEM_H) gengtype.h       \
> -   rtl.def insn-notes.def errors.h double-int.h version.h $(HASHTAB_H) \
> -   $(OBSTACK_H) $(XREGEX_H)
> - gengtype.o: $(CONFIG_H)
> --CFLAGS-gengtype.o +=3D -DGENERATOR_FILE
> -+CFLAGS-gengtype.o +=3D -DGENERATOR_FILE2
> -+CFLAGS-build/gengtype.o +=3D -DGENERATOR_FILE
> - build/gengtype.o: $(BCONFIG_H)
> -
> - build/genmddeps.o: genmddeps.c $(BCONFIG_H) $(SYSTEM_H) coretypes.h   \
> -@@ -3988,7 +3990,7 @@
> - # any system header is included.
> - gengtype-lex.c : gengtype-lex.l
> -       -$(FLEX) $(FLEXFLAGS) -o$@ $< && { \
> --        echo '#include "bconfig.h"' > $@.tmp; \
> -+        echo '' > $@.tmp; \
> -         cat $@ >> $@.tmp; \
> -         mv $@.tmp $@; \
> -       }
> -Index: gcc-4.8.1/gcc/double-int.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.8.1.orig/gcc/double-int.h    2013-01-30 11:04:30.000000000 +00=
00
> -+++ gcc-4.8.1/gcc/double-int.h 2013-08-19 11:41:51.564012719 +0000
> -@@ -448,10 +448,12 @@
> -
> -
> - #ifndef GENERATOR_FILE
> -+#ifndef GENERATOR_FILE2
> - /* Conversion to and from GMP integer representations.  */
> -
> - void mpz_set_double_int (mpz_t, double_int, bool);
> - double_int mpz_get_double_int (const_tree, mpz_t, bool);
> - #endif
> -+#endif
> -
> - #endif /* DOUBLE_INT_H */
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0046-libatomic-deptracking=
.patch b/meta/recipes-devtools/gcc/gcc-4.9/0046-libatomic-deptracking.patch
> deleted file mode 100644
> index 6ea4f42..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.9/0046-libatomic-deptracking.patch
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -gcc 4.8 won't build with --disable-dependency-tracking since the *.Ppo f=
iles
> -don't get created unless --enable-dependency-tracking is true.
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
> -Index: gcc-4.8.1/libatomic/Makefile.am
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.8.1.orig/libatomic/Makefile.am       2013-01-14 18:16:23.00000=
0000 +0000
> -+++ gcc-4.8.1/libatomic/Makefile.am    2013-09-22 10:38:18.904064750 +00=
00
> -@@ -100,7 +100,8 @@
> - IFUNC_DEF     =3D -DIFUNC_ALT=3D$(PAT_S)
> - IFUNC_OPT     =3D $(word $(PAT_S),$(IFUNC_OPTIONS))
> -
> --M_DEPS                =3D -MT $@ -MD -MP -MF $(DEPDIR)/$(@F).Ppo
> -+@AMDEP_TRUE@M_DEPS            =3D -MT $@ -MD -MP -MF $(DEPDIR)/$(@F).Pp=
o
> -+@AMDEP_FALSE@M_DEPS           =3D
> - M_SIZE                =3D -DN=3D$(PAT_N)
> - M_IFUNC               =3D $(if $(PAT_S),$(IFUNC_DEF) $(IFUNC_OPT))
> - M_FILE                =3D $(PAT_BASE)_n.c
> -Index: gcc-4.8.1/libatomic/Makefile.in
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.8.1.orig/libatomic/Makefile.in       2013-05-31 09:09:26.00000=
0000 +0000
> -+++ gcc-4.8.1/libatomic/Makefile.in    2013-09-22 10:40:42.520059917 +00=
00
> -@@ -298,7 +298,8 @@
> - PAT_S =3D $(word 3,$(PAT_SPLIT))
> - IFUNC_DEF =3D -DIFUNC_ALT=3D$(PAT_S)
> - IFUNC_OPT =3D $(word $(PAT_S),$(IFUNC_OPTIONS))
> --M_DEPS =3D -MT $@ -MD -MP -MF $(DEPDIR)/$(@F).Ppo
> -+@AMDEP_TRUE@M_DEPS =3D -MT $@ -MD -MP -MF $(DEPDIR)/$(@F).Ppo
> -+@AMDEP_FALSE@M_DEPS =3D
> - M_SIZE =3D -DN=3D$(PAT_N)
> - M_IFUNC =3D $(if $(PAT_S),$(IFUNC_DEF) $(IFUNC_OPT))
> - M_FILE =3D $(PAT_BASE)_n.c
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0047-repomembug.patch b/me=
ta/recipes-devtools/gcc/gcc-4.9/0047-repomembug.patch
> deleted file mode 100644
> index 9afd55c..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.9/0047-repomembug.patch
> +++ /dev/null
> @@ -1,53 +0,0 @@
> -When compiling a project using -frepo, .rpo files are written alongside
> -the .o file, the symbols either have O or C against them. During final l=
inking,
> -the objects can be recompiled with some of the entries tweaked/chosen by=
 the
> -tlink.c code (visible with TLINK_VERBOSE=3D3), it does this by changing =
O -> C
> -in the .rpo files.
> -
> -My tests showed that init_repo (cp/repo.c) was correctly calling
> -IDENTIFIER_REPO_CHOSEN against the right identifers and setting the
> -chosen bit.
> -
> -By the time finish_repo() or emit_repo_p() were called, the pointer retu=
rned
> -by get_identifier() for the symbol marked during init_repo had changed a=
nd
> -the chosen bit was no longer set. This lead to linking bugs like:
> -
> -collect: relinking
> -collect2: error: '_ZNK6sudoku5ClearINS_8SequenceEEclERS1_' was assigned =
to 'board.rpo', but was not defined during recompilation, or vice versa
> -
> -The problem is that the garbage collection is getting called before
> -finish_repo() is called and ggc_protect_identifiers is set to false
> -so the identifiers are not preserved. They are recreated but the
> -chosen bits get wiped out which is why the pointer changes and the
> -chosen bit is not set.
> -
> -The fix is to change ggc_protect_identifiers *after* the finish_repo
> -calls are made.
> -
> -Reproduction is tricky since you need to trigger the garbage collector a=
t
> -just the right moment.
> -
> -RP 2013/10/9
> -
> -[YOCTO #5133]
> -
> -Upstream-Status: Pending
> -
> -Index: gcc-4.8.1/gcc/toplev.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.8.1.orig/gcc/toplev.c        2013-03-28 08:29:51.000000000 +00=
00
> -+++ gcc-4.8.1/gcc/toplev.c     2013-10-09 20:27:17.089228023 +0000
> -@@ -551,11 +551,11 @@
> -   if (flag_syntax_only || flag_wpa)
> -     return;
> -
> --  ggc_protect_identifiers =3D false;
> --
> -   /* This must also call finalize_compilation_unit.  */
> -   lang_hooks.decls.final_write_globals ();
> -
> -+  ggc_protect_identifiers =3D false;
> -+
> -   if (seen_error ())
> -     return;
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0049-Enable-SPE-AltiVec-ge=
neration-on-powepc-linux-target.patch b/meta/recipes-devtools/gcc/gcc-4.9/0=
049-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch
> deleted file mode 100644
> index b98f8ff..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.9/0049-Enable-SPE-AltiVec-generatio=
n-on-powepc-linux-target.patch
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -From 9e0e19eac2562f73858602fe26e2044eb8b20c47 Mon Sep 17 00:00:00 2001
> -From: Alexandru-Cezar Sardan <alexandru.sardan@freescale.com>
> -Date: Wed, 5 Feb 2014 16:52:31 +0200
> -Subject: [PATCH] Enable SPE & AltiVec generation on powepc*linux target
> -
> -When is configured with --target=3Dpowerpc-linux, the resulting GCC will
> -not be able to generate code for SPE targets (e500v1/v2).
> -GCC configured with --target=3Dpowerpc-linuxspe will not be able to
> -generate AltiVec instructions (for e6500).
> -This patch modifies the configured file such that SPE or AltiVec code
> -can be generated when gcc is configured with --target=3Dpowerpc-linux.
> -The ABI and speciffic instructions can be selected through the
> -"-mabi=3Dspe or -mabi=3Daltivec" and the "-mspe or -maltivec" parameters=
.
> -
> -Upstream-Status: Inappropriate [configuration]
> -
> -Signed-off-by: Alexandru-Cezar Sardan <alexandru.sardan@freescale.com>
> ----
> - gcc/config.gcc |    7 ++++++-
> - 1 file changed, 6 insertions(+), 1 deletion(-)
> -
> -diff --git a/gcc/config.gcc b/gcc/config.gcc
> -index cb7a94e..d392c2b 100644
> ---- a/gcc/config.gcc
> -+++ b/gcc/config.gcc
> -@@ -2068,7 +2068,12 @@ powerpc-*-rtems*)
> -       tmake_file=3D"rs6000/t-fprules rs6000/t-rtems t-rtems rs6000/t-pp=
ccomm"
> -       ;;
> - powerpc*-*-linux*)
> --      tm_file=3D"${tm_file} dbxelf.h elfos.h freebsd-spec.h rs6000/sysv=
4.h"
> -+      case ${target} in
> -+          powerpc*-*-linux*spe* | powerpc*-*-linux*altivec*)
> -+              tm_file=3D"${tm_file} dbxelf.h elfos.h freebsd-spec.h rs6=
000/sysv4.h" ;;
> -+          *)
> -+              tm_file=3D"${tm_file} dbxelf.h elfos.h freebsd-spec.h rs6=
000/sysv4.h rs6000/linuxaltivec.h rs6000/linuxspe.h rs6000/e500.h" ;;
> -+      esac
> -       extra_options=3D"${extra_options} rs6000/sysv4.opt"
> -       tmake_file=3D"rs6000/t-fprules rs6000/t-ppcos ${tmake_file} rs600=
0/t-ppccomm"
> -       case ${target} in
> ---
> -1.7.9.5
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0050-Revert-Use-dbx_reg_nu=
mber-for-spanning-registers.patch b/meta/recipes-devtools/gcc/gcc-4.9/0050-=
Revert-Use-dbx_reg_number-for-spanning-registers.patch
> deleted file mode 100644
> index aead6f6..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.9/0050-Revert-Use-dbx_reg_number-fo=
r-spanning-registers.patch
> +++ /dev/null
> @@ -1,80 +0,0 @@
> -Upstream-Status: Pending
> -
> -From cb9b1c041b634a4c128896e3d3eed4082608c797 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Sat, 3 May 2014 19:25:17 -0700
> -Subject: [PATCH] Revert "2013-05-21  Christian Bruel
> - <christian.bruel@st.com>"
> -
> -This reverts commit 3983036a8b6b2710c57777194f21507819a73553.
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Conflicts:
> -       gcc/ChangeLog
> ----
> - gcc/ChangeLog   | 219 +++++++++++++++++++++++++++++++++++++++++++++++++=
++++++-
> - gcc/dwarf2out.c |  33 +++++----
> - 2 files changed, 234 insertions(+), 18 deletions(-)
> -
> -diff --git a/gcc/dwarf2out.c b/gcc/dwarf2out.c
> -index 1272326..6ac2b28 100644
> ---- a/gcc/dwarf2out.c
> -+++ b/gcc/dwarf2out.c
> -@@ -10870,27 +10870,25 @@ static dw_loc_descr_ref
> - multiple_reg_loc_descriptor (rtx rtl, rtx regs,
> -                            enum var_init_status initialized)
> - {
> --  int size, i;
> -+  int nregs, size, i;
> -+  unsigned reg;
> -   dw_loc_descr_ref loc_result =3D NULL;
> -
> --  /* Simple, contiguous registers.  */
> --  if (regs =3D=3D NULL_RTX)
> --    {
> --      unsigned reg =3D REGNO (rtl);
> --      int nregs;
> --
> -+  reg =3D REGNO (rtl);
> - #ifdef LEAF_REG_REMAP
> --      if (crtl->uses_only_leaf_regs)
> --      {
> --        int leaf_reg =3D LEAF_REG_REMAP (reg);
> --        if (leaf_reg !=3D -1)
> --          reg =3D (unsigned) leaf_reg;
> --      }
> -+  if (crtl->uses_only_leaf_regs)
> -+    {
> -+      int leaf_reg =3D LEAF_REG_REMAP (reg);
> -+      if (leaf_reg !=3D -1)
> -+      reg =3D (unsigned) leaf_reg;
> -+    }
> - #endif
> -+  gcc_assert ((unsigned) DBX_REGISTER_NUMBER (reg) =3D=3D dbx_reg_numbe=
r (rtl));
> -+  nregs =3D hard_regno_nregs[REGNO (rtl)][GET_MODE (rtl)];
> -
> --      gcc_assert ((unsigned) DBX_REGISTER_NUMBER (reg) =3D=3D dbx_reg_n=
umber (rtl));
> --      nregs =3D hard_regno_nregs[REGNO (rtl)][GET_MODE (rtl)];
> --
> -+  /* Simple, contiguous registers.  */
> -+  if (regs =3D=3D NULL_RTX)
> -+    {
> -       size =3D GET_MODE_SIZE (GET_MODE (rtl)) / nregs;
> -
> -       loc_result =3D NULL;
> -@@ -10918,9 +10916,10 @@ multiple_reg_loc_descriptor (rtx rtl, rtx regs,
> -     {
> -       dw_loc_descr_ref t;
> -
> --      t =3D one_reg_loc_descriptor (dbx_reg_number (XVECEXP (regs, 0, i=
)),
> -+      t =3D one_reg_loc_descriptor (REGNO (XVECEXP (regs, 0, i)),
> -                                 VAR_INIT_STATUS_INITIALIZED);
> -       add_loc_descr (&loc_result, t);
> -+      size =3D GET_MODE_SIZE (GET_MODE (XVECEXP (regs, 0, 0)));
> -       add_loc_descr_op_piece (&loc_result, size);
> -     }
> -
> ---
> -1.9.2
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0051-eabispe.patch b/meta/=
recipes-devtools/gcc/gcc-4.9/0051-eabispe.patch
> deleted file mode 100644
> index 55e3890..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.9/0051-eabispe.patch
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -Upstream-Status: Pending
> -
> -Taken from http://gcc.gnu.org/ml/gcc-patches/2014-04/msg02064.html
> -
> -2014-04-30  Cesar Philippidis  <cesar@codesourcery.com>
> -
> -       gcc/
> -       * dwarf2cfi.c (dwf_regno): Don't assert reg is a pseudo
> -       register.
> -
> -
> -diff --git a/gcc/dwarf2cfi.c b/gcc/dwarf2cfi.c
> -index 4180890..40ef0e2 100644
> ---- a/gcc/dwarf2cfi.c
> -+++ b/gcc/dwarf2cfi.c
> -@@ -906,7 +906,6 @@ notice_eh_throw (rtx insn)
> - static inline unsigned
> - dwf_regno (const_rtx reg)
> - {
> --  gcc_assert (REGNO (reg) < FIRST_PSEUDO_REGISTER);
> -   return DWARF_FRAME_REGNUM (REGNO (reg));
> - }
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0052-Add-target-hook-to-ov=
erride-DWARF2-frame-register-si.patch b/meta/recipes-devtools/gcc/gcc-4.9/0=
052-Add-target-hook-to-override-DWARF2-frame-register-si.patch
> deleted file mode 100644
> index f6958b3..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.9/0052-Add-target-hook-to-override-=
DWARF2-frame-register-si.patch
> +++ /dev/null
> @@ -1,138 +0,0 @@
> -From d626297e87e19251a284ea1e9360e831b48999ca Mon Sep 17 00:00:00 2001
> -From: mpf <mpf@138bc75d-0d04-0410-961f-82ee72b054a4>
> -Date: Thu, 4 Sep 2014 08:32:05 +0000
> -Subject: [PATCH] Add target hook to override DWARF2 frame register size
> -
> -gcc/
> -
> -       * target.def (TARGET_DWARF_FRAME_REG_MODE): New target hook.
> -       * targhooks.c (default_dwarf_frame_reg_mode): New function.
> -       * targhooks.h (default_dwarf_frame_reg_mode): New prototype.
> -       * doc/tm.texi.in (TARGET_DWARF_FRAME_REG_MODE): Document.
> -       * doc/tm.texi: Regenerate.
> -       * dwarf2cfi.c (expand_builtin_init_dwarf_reg_sizes): Abstract mod=
e
> -       selection logic to default_dwarf_frame_reg_mode.
> -
> -
> -
> -git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@214898 138bc75d-0d04-041=
0-961f-82ee72b054a4
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -Upstream-Status: Backport [gcc 5.0]
> -
> ----
> - gcc/ChangeLog      | 10 ++++++++++
> - gcc/doc/tm.texi    |  7 +++++++
> - gcc/doc/tm.texi.in |  2 ++
> - gcc/dwarf2cfi.c    |  4 +---
> - gcc/target.def     | 11 +++++++++++
> - gcc/targhooks.c    | 13 +++++++++++++
> - gcc/targhooks.h    |  1 +
> - 7 files changed, 45 insertions(+), 3 deletions(-)
> -
> -Index: gcc-4.9.2/gcc/doc/tm.texi
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.9.2.orig/gcc/doc/tm.texi
> -+++ gcc-4.9.2/gcc/doc/tm.texi
> -@@ -9017,6 +9017,13 @@ register in Dwarf.  Otherwise, this hook
> - If not defined, the default is to return @code{NULL_RTX}.
> - @end deftypefn
> -
> -+@deftypefn {Target Hook} {enum machine_mode} TARGET_DWARF_FRAME_REG_MOD=
E (int @var{regno})
> -+Given a register, this hook should return the mode which the
> -+corresponding Dwarf frame register should have.  This is normally
> -+used to return a smaller mode than the raw mode to prevent call
> -+clobbered parts of a register altering the frame register size
> -+@end deftypefn
> -+
> - @deftypefn {Target Hook} void TARGET_INIT_DWARF_REG_SIZES_EXTRA (tree @=
var{address})
> - If some registers are represented in Dwarf-2 unwind information in
> - multiple pieces, define this hook to fill in information about the
> -Index: gcc-4.9.2/gcc/doc/tm.texi.in
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.9.2.orig/gcc/doc/tm.texi.in
> -+++ gcc-4.9.2/gcc/doc/tm.texi.in
> -@@ -6745,6 +6745,8 @@ the target supports DWARF 2 frame unwind
> -
> - @hook TARGET_DWARF_REGISTER_SPAN
> -
> -+@hook TARGET_DWARF_FRAME_REG_MODE
> -+
> - @hook TARGET_INIT_DWARF_REG_SIZES_EXTRA
> -
> - @hook TARGET_ASM_TTYPE
> -Index: gcc-4.9.2/gcc/dwarf2cfi.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.9.2.orig/gcc/dwarf2cfi.c
> -+++ gcc-4.9.2/gcc/dwarf2cfi.c
> -@@ -271,11 +271,9 @@ expand_builtin_init_dwarf_reg_sizes (tre
> -       if (rnum < DWARF_FRAME_REGISTERS)
> -       {
> -         HOST_WIDE_INT offset =3D rnum * GET_MODE_SIZE (mode);
> --        enum machine_mode save_mode =3D reg_raw_mode[i];
> -         HOST_WIDE_INT size;
> -+        enum machine_mode save_mode =3D targetm.dwarf_frame_reg_mode (i=
);
> -
> --        if (HARD_REGNO_CALL_PART_CLOBBERED (i, save_mode))
> --          save_mode =3D choose_hard_reg_mode (i, 1, true);
> -         if (dnum =3D=3D DWARF_FRAME_RETURN_COLUMN)
> -           {
> -             if (save_mode =3D=3D VOIDmode)
> -Index: gcc-4.9.2/gcc/target.def
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.9.2.orig/gcc/target.def
> -+++ gcc-4.9.2/gcc/target.def
> -@@ -3218,6 +3218,17 @@ If not defined, the default is to return
> -  rtx, (rtx reg),
> -  hook_rtx_rtx_null)
> -
> -+/* Given a register return the mode of the corresponding DWARF frame
> -+   register.  */
> -+DEFHOOK
> -+(dwarf_frame_reg_mode,
> -+ "Given a register, this hook should return the mode which the\n\
> -+corresponding Dwarf frame register should have.  This is normally\n\
> -+used to return a smaller mode than the raw mode to prevent call\n\
> -+clobbered parts of a register altering the frame register size",
> -+ enum machine_mode, (int regno),
> -+ default_dwarf_frame_reg_mode)
> -+
> - /* If expand_builtin_init_dwarf_reg_sizes needs to fill in table
> -    entries not corresponding directly to registers below
> -    FIRST_PSEUDO_REGISTER, this hook should generate the necessary
> -Index: gcc-4.9.2/gcc/targhooks.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.9.2.orig/gcc/targhooks.c
> -+++ gcc-4.9.2/gcc/targhooks.c
> -@@ -1438,6 +1438,19 @@ default_debug_unwind_info (void)
> -   return UI_NONE;
> - }
> -
> -+/* Determine the correct mode for a Dwarf frame register that represent=
s
> -+   register REGNO.  */
> -+
> -+enum machine_mode
> -+default_dwarf_frame_reg_mode (int regno)
> -+{
> -+  enum machine_mode save_mode =3D reg_raw_mode[regno];
> -+
> -+  if (HARD_REGNO_CALL_PART_CLOBBERED (regno, save_mode))
> -+    save_mode =3D choose_hard_reg_mode (regno, 1, true);
> -+  return save_mode;
> -+}
> -+
> - /* To be used by targets where reg_raw_mode doesn't return the right
> -    mode for registers used in apply_builtin_return and apply_builtin_ar=
g.  */
> -
> -Index: gcc-4.9.2/gcc/targhooks.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.9.2.orig/gcc/targhooks.h
> -+++ gcc-4.9.2/gcc/targhooks.h
> -@@ -194,6 +194,7 @@ extern int default_label_align_max_skip
> - extern int default_jump_align_max_skip (rtx);
> - extern section * default_function_section(tree decl, enum node_frequenc=
y freq,
> -                                         bool startup, bool exit);
> -+extern enum machine_mode default_dwarf_frame_reg_mode (int);
> - extern enum machine_mode default_get_reg_raw_mode (int);
> -
> - extern void *default_get_pch_validity (size_t *);
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0053-gcc-fix-segfault-from=
-calling-free-on-non-malloc-d-a.patch b/meta/recipes-devtools/gcc/gcc-4.9/0=
053-gcc-fix-segfault-from-calling-free-on-non-malloc-d-a.patch
> deleted file mode 100644
> index 23b445c..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.9/0053-gcc-fix-segfault-from-callin=
g-free-on-non-malloc-d-a.patch
> +++ /dev/null
> @@ -1,66 +0,0 @@
> -From a22a222c8f9299f6c07a0274388ade7d4ab8c28d Mon Sep 17 00:00:00 2001
> -From: Paul Gortmaker <paul.gortmaker@windriver.com>
> -Date: Fri, 20 Jun 2014 16:41:08 -0400
> -Subject: [PATCH] gcc: fix segfault from calling free on non-malloc'd are=
a
> -
> -We see the following on a 32bit gcc installed on 64 bit host:
> -
> -  Reading symbols from ./i586-pokymllib32-linux-gcc...done.
> -  (gdb) run
> -  Starting program: x86-pokymllib32-linux/lib32-gcc/4.9.0-r0/image/usr/b=
in/i586-pokymllib32-linux-gcc
> -
> -  Program received signal SIGSEGV, Segmentation fault.
> -  0xf7e957e0 in free () from /lib/i386-linux-gnu/libc.so.6
> -  (gdb) bt
> -  #0  0xf7e957e0 in free () from /lib/i386-linux-gnu/libc.so.6
> -  #1  0x0804b73c in set_multilib_dir () at gcc-4.9.0/gcc/gcc.c:7827
> -  #2  main (argc=3D1, argv=3D0xffffd504) at gcc-4.9.0/gcc/gcc.c:6688
> -  (gdb)
> -
> -The problem arises because we conditionally assign the pointer we
> -eventually free, and the conditional may assign the pointer to the
> -non-malloc'd internal string "." which fails when we free it here:
> -
> -   if (multilib_dir =3D=3D NULL && multilib_os_dir !=3D NULL
> -       && strcmp (multilib_os_dir, ".") =3D=3D 0)
> -     {
> -       free (CONST_CAST (char *, multilib_os_dir));
> -       ...
> -
> -As suggested by Jakub, ensure the "." case is also malloc'd via
> -xstrdup() and hence the pointer for the "." case can be freed.
> -
> -Cc: Jakub Jelinek <jakub@redhat.com>
> -Cc: Jeff Law <law@redhat.com>
> -Cc: Matthias Klose <doko@ubuntu.com>
> -CC: Tobias Burnus <burnus@net-b.de>
> -Upstream-Status: Accepted [ https://gcc.gnu.org/ml/gcc-patches/2014-06/m=
sg02069.html ]
> -Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> -
> -diff --git a/gcc/gcc.c b/gcc/gcc.c
> -index 9ac18e60d801..168acf7eb0c9 100644
> ---- a/gcc/gcc.c
> -+++ b/gcc/gcc.c
> -@@ -7790,10 +7790,15 @@ set_multilib_dir (void)
> -               q2++;
> -             if (*q2 =3D=3D ':')
> -               ml_end =3D q2;
> --            new_multilib_os_dir =3D XNEWVEC (char, ml_end - q);
> --            memcpy (new_multilib_os_dir, q + 1, ml_end - q - 1);
> --            new_multilib_os_dir[ml_end - q - 1] =3D '\0';
> --            multilib_os_dir =3D *new_multilib_os_dir ? new_multilib_os_=
dir : ".";
> -+            if (ml_end - q =3D=3D 1)
> -+              multilib_os_dir =3D xstrdup (".");
> -+            else
> -+              {
> -+                new_multilib_os_dir =3D XNEWVEC (char, ml_end - q);
> -+                memcpy (new_multilib_os_dir, q + 1, ml_end - q - 1);
> -+                new_multilib_os_dir[ml_end - q - 1] =3D '\0';
> -+                multilib_os_dir =3D new_multilib_os_dir;
> -+              }
> -
> -             if (q2 < end && *q2 =3D=3D ':')
> -               {
> ---
> -1.9.2
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0054-gcc-Makefile.in-fix-p=
arallel-building-failure.patch b/meta/recipes-devtools/gcc/gcc-4.9/0054-gcc=
-Makefile.in-fix-parallel-building-failure.patch
> deleted file mode 100644
> index 7e8efa1..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.9/0054-gcc-Makefile.in-fix-parallel=
-building-failure.patch
> +++ /dev/null
> @@ -1,61 +0,0 @@
> -gcc/Makefile.in: fix parallel building failure
> -
> -The gcc-ar.o, gcc-nm.o, gcc-ranlib.o and errors.o included
> -config.h which was a generated file. But no explicity rule
> -to clarify the dependency. There was potential building
> -failure while parallel make.
> -
> -For gcc-ar.o, gcc-nm.o and gcc-ranlib.o, they were compiled from one C
> -source file gcc-ar.c, we add them to ALL_HOST_BACKEND_OBJS, so the
> -'$(ALL_HOST_OBJS) : | $(generated_files)' rule could work for these
> -objects.
> -
> -For errors.o, it is part of gengtype, and the gengtype generator program
> -is special: Two versions are built. One is for the build machine, and on=
e
> -is for the host. We refered what gengtype-parse.o did (which also is par=
t
> -of gengtype).
> -
> -[GCC #61899]
> -https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D61899
> -
> -Upstream-Status: Submitted [gcc-patches@gcc.gnu.org]
> -
> -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ----
> - gcc/Makefile.in | 7 ++++++-
> - 1 file changed, 6 insertions(+), 1 deletion(-)
> -
> -diff --git a/gcc/Makefile.in b/gcc/Makefile.in
> -index 6475cba..56e50bb 100644
> ---- a/gcc/Makefile.in
> -+++ b/gcc/Makefile.in
> -@@ -1481,13 +1481,16 @@ OBJS-libcommon-target =3D $(common_out_object_fi=
le) prefix.o params.o \
> -       opts.o opts-common.o options.o vec.o hooks.o common/common-targho=
oks.o \
> -       hash-table.o file-find.o
> -
> -+# Objects compiled from one C source file gcc-ar.c
> -+OBJS-gcc-ar =3D gcc-ar.o gcc-nm.o gcc-ranlib.o
> -+
> - # This lists all host objects for the front ends.
> - ALL_HOST_FRONTEND_OBJS =3D $(foreach v,$(CONFIG_LANGUAGES),$($(v)_OBJS)=
)
> -
> - ALL_HOST_BACKEND_OBJS =3D $(GCC_OBJS) $(OBJS) $(OBJS-libcommon) \
> -   $(OBJS-libcommon-target) @TREEBROWSER@ main.o c-family/cppspec.o \
> -   $(COLLECT2_OBJS) $(EXTRA_GCC_OBJS) $(GCOV_OBJS) $(GCOV_DUMP_OBJS) \
> --  lto-wrapper.o
> -+  lto-wrapper.o $(OBJS-gcc-ar)
> -
> - # This lists all host object files, whether they are included in this
> - # compilation or not.
> -@@ -2437,6 +2440,8 @@ gengtype-parse.o: $(CONFIG_H)
> - CFLAGS-build/gengtype-parse.o +=3D -DGENERATOR_FILE
> - build/gengtype-parse.o: $(BCONFIG_H)
> -
> -+errors.o : $(CONFIG_H)
> -+
> - gengtype-state.o build/gengtype-state.o: gengtype-state.c $(SYSTEM_H) \
> -   gengtype.h errors.h double-int.h version.h $(HASHTAB_H) $(OBSTACK_H) =
\
> -   $(XREGEX_H)
> ---
> -1.8.1.2
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0055-dwarf-reg-processing-=
helper.patch b/meta/recipes-devtools/gcc/gcc-4.9/0055-dwarf-reg-processing-=
helper.patch
> deleted file mode 100644
> index 557dab0..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.9/0055-dwarf-reg-processing-helper.=
patch
> +++ /dev/null
> @@ -1,148 +0,0 @@
> -From 4fd39f1329379e00f958394adde6be96f0caf21f Mon Sep 17 00:00:00 2001
> -From: hainque <hainque@138bc75d-0d04-0410-961f-82ee72b054a4>
> -Date: Fri, 5 Dec 2014 16:53:22 +0000
> -Subject: [PATCH] 2014-12-05  Olivier Hainque  <hainque@adacore.com>
> -
> -        * dwarf2cfi.c (init_one_dwarf_reg_size): New helper, processing
> -        one particular reg for expand_builtin_init_dwarf_reg_sizes.
> -        (expand_builtin_init_dwarf_reg_sizes): Rework to use helper and
> -        account for dwarf register spans.
> -
> -
> -
> -git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@218428 138bc75d-0d04-041=
0-961f-82ee72b054a4
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -Upstream-Status: Backport [gcc 5.0]
> -
> ----
> - gcc/ChangeLog   |  7 +++++
> - gcc/dwarf2cfi.c | 98 +++++++++++++++++++++++++++++++++++++++++++++-----=
-------
> - 2 files changed, 85 insertions(+), 20 deletions(-)
> -
> -Index: gcc-4.9.2/gcc/dwarf2cfi.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.9.2.orig/gcc/dwarf2cfi.c
> -+++ gcc-4.9.2/gcc/dwarf2cfi.c
> -@@ -252,7 +252,59 @@ init_return_column_size (enum machine_mo
> -                 gen_int_mode (size, mode));
> - }
> -
> --/* Generate code to initialize the register size table.  */
> -+/* Datastructure used by expand_builtin_init_dwarf_reg_sizes and
> -+   init_one_dwarf_reg_size to communicate on what has been done by the
> -+   latter.  */
> -+
> -+typedef struct
> -+{
> -+  /* Whether the dwarf return column was initialized.  */
> -+  bool wrote_return_column;
> -+
> -+  /* For each hard register REGNO, whether init_one_dwarf_reg_size
> -+     was given REGNO to process already.  */
> -+  bool processed_regno [FIRST_PSEUDO_REGISTER];
> -+
> -+} init_one_dwarf_reg_state;
> -+
> -+/* Helper for expand_builtin_init_dwarf_reg_sizes.  Generate code to
> -+   initialize the dwarf register size table entry corresponding to regi=
ster
> -+   REGNO in REGMODE.  TABLE is the table base address, SLOTMODE is the =
mode to
> -+   use for the size entry to initialize, and INIT_STATE is the communic=
ation
> -+   datastructure conveying what we're doing to our caller.  */
> -+
> -+static
> -+void init_one_dwarf_reg_size (int regno, machine_mode regmode,
> -+                            rtx table, machine_mode slotmode,
> -+                            init_one_dwarf_reg_state *init_state)
> -+{
> -+  const unsigned int dnum =3D DWARF_FRAME_REGNUM (regno);
> -+  const unsigned int rnum =3D DWARF2_FRAME_REG_OUT (dnum, 1);
> -+
> -+  const HOST_WIDE_INT slotoffset =3D rnum * GET_MODE_SIZE (slotmode);
> -+  const HOST_WIDE_INT regsize =3D GET_MODE_SIZE (regmode);
> -+
> -+  init_state->processed_regno[regno] =3D true;
> -+
> -+  if (rnum >=3D DWARF_FRAME_REGISTERS)
> -+    return;
> -+
> -+  if (dnum =3D=3D DWARF_FRAME_RETURN_COLUMN)
> -+    {
> -+      if (regmode =3D=3D VOIDmode)
> -+      return;
> -+      init_state->wrote_return_column =3D true;
> -+    }
> -+
> -+  if (slotoffset < 0)
> -+    return;
> -+
> -+  emit_move_insn (adjust_address (table, slotmode, slotoffset),
> -+                gen_int_mode (regsize, slotmode));
> -+}
> -+
> -+/* Generate code to initialize the dwarf register size table located
> -+   at the provided ADDRESS.  */
> -
> - void
> - expand_builtin_init_dwarf_reg_sizes (tree address)
> -@@ -261,35 +313,40 @@ expand_builtin_init_dwarf_reg_sizes (tre
> -   enum machine_mode mode =3D TYPE_MODE (char_type_node);
> -   rtx addr =3D expand_normal (address);
> -   rtx mem =3D gen_rtx_MEM (BLKmode, addr);
> --  bool wrote_return_column =3D false;
> -+
> -+  init_one_dwarf_reg_state init_state;
> -+
> -+  memset ((char *)&init_state, 0, sizeof (init_state));
> -
> -   for (i =3D 0; i < FIRST_PSEUDO_REGISTER; i++)
> -     {
> --      unsigned int dnum =3D DWARF_FRAME_REGNUM (i);
> --      unsigned int rnum =3D DWARF2_FRAME_REG_OUT (dnum, 1);
> --
> --      if (rnum < DWARF_FRAME_REGISTERS)
> --      {
> --        HOST_WIDE_INT offset =3D rnum * GET_MODE_SIZE (mode);
> --        HOST_WIDE_INT size;
> --        enum machine_mode save_mode =3D targetm.dwarf_frame_reg_mode (i=
);
> -+      machine_mode save_mode;
> -+      rtx span;
> -
> --        if (dnum =3D=3D DWARF_FRAME_RETURN_COLUMN)
> -+      /* No point in processing a register multiple times.  This could =
happen
> -+        with register spans, e.g. when a reg is first processed as a pi=
ece of
> -+        a span, then as a register on its own later on.  */
> -+
> -+      if (init_state.processed_regno[i])
> -+       continue;
> -+
> -+      save_mode =3D targetm.dwarf_frame_reg_mode (i);
> -+      span =3D targetm.dwarf_register_span (gen_rtx_REG (save_mode, i))=
;
> -+      if (!span)
> -+       init_one_dwarf_reg_size (i, save_mode, mem, mode, &init_state);
> -+      else
> -+       {
> -+         for (int si =3D 0; si < XVECLEN (span, 0); si++)
> -           {
> --            if (save_mode =3D=3D VOIDmode)
> --              continue;
> --            wrote_return_column =3D true;
> --          }
> --        size =3D GET_MODE_SIZE (save_mode);
> --        if (offset < 0)
> --          continue;
> -+             rtx reg =3D XVECEXP (span, 0, si);
> -+             init_one_dwarf_reg_size
> -+               (REGNO (reg), GET_MODE (reg), mem, mode, &init_state);
> -+           }
> -
> --        emit_move_insn (adjust_address (mem, mode, offset),
> --                        gen_int_mode (size, mode));
> -       }
> -     }
> -
> --  if (!wrote_return_column)
> -+  if (!init_state.wrote_return_column)
> -     init_return_column_size (mode, mem, DWARF_FRAME_RETURN_COLUMN);
> -
> - #ifdef DWARF_ALT_FRAME_RETURN_COLUMN
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0056-define-default-cfa-re=
gister-mapping.patch b/meta/recipes-devtools/gcc/gcc-4.9/0056-define-defaul=
t-cfa-register-mapping.patch
> deleted file mode 100644
> index 3b6c94c..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.9/0056-define-default-cfa-register-=
mapping.patch
> +++ /dev/null
> @@ -1,75 +0,0 @@
> -From c0235a33de8c4f78cce35b2a8c2035c83fe1bd14 Mon Sep 17 00:00:00 2001
> -From: hainque <hainque@138bc75d-0d04-0410-961f-82ee72b054a4>
> -Date: Fri, 5 Dec 2014 17:01:42 +0000
> -Subject: [PATCH] 2014-12-05  Olivier Hainque  <hainque@adacore.com>
> -
> -        gcc/
> -        * defaults.h: (DWARF_REG_TO_UNWIND_COLUMN): Define default.
> -        * dwarf2cfi.c (init_one_dwarf_reg_size): Honor
> -        DWARF_REG_TO_UNWIND_COLUMN.
> -
> -        libgcc/
> -        * unwind-dw2.c (DWARF_REG_TO_UNWIND_COLUMN): Remove default def,
> -        now provided by defaults.h.
> -
> -
> -
> -git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@218429 138bc75d-0d04-041=
0-961f-82ee72b054a4
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -Upstream-Status: Backport [gcc 5.0]
> -
> ----
> - gcc/ChangeLog       | 6 ++++++
> - gcc/defaults.h      | 5 +++++
> - gcc/dwarf2cfi.c     | 3 ++-
> - libgcc/ChangeLog    | 5 +++++
> - libgcc/unwind-dw2.c | 4 ----
> - 5 files changed, 18 insertions(+), 5 deletions(-)
> -
> -Index: gcc-4.9.2/gcc/defaults.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.9.2.orig/gcc/defaults.h
> -+++ gcc-4.9.2/gcc/defaults.h
> -@@ -438,6 +438,11 @@ see the files COPYING3 and COPYING.RUNTI
> - #define DWARF_FRAME_REGNUM(REG) DBX_REGISTER_NUMBER (REG)
> - #endif
> -
> -+/* The mapping from dwarf CFA reg number to internal dwarf reg numbers.=
  */
> -+#ifndef DWARF_REG_TO_UNWIND_COLUMN
> -+#define DWARF_REG_TO_UNWIND_COLUMN(REGNO) (REGNO)
> -+#endif
> -+
> - /* Map register numbers held in the call frame info that gcc has
> -    collected using DWARF_FRAME_REGNUM to those that should be output in
> -    .debug_frame and .eh_frame.  */
> -Index: gcc-4.9.2/gcc/dwarf2cfi.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.9.2.orig/gcc/dwarf2cfi.c
> -+++ gcc-4.9.2/gcc/dwarf2cfi.c
> -@@ -280,8 +280,9 @@ void init_one_dwarf_reg_size (int regno,
> - {
> -   const unsigned int dnum =3D DWARF_FRAME_REGNUM (regno);
> -   const unsigned int rnum =3D DWARF2_FRAME_REG_OUT (dnum, 1);
> -+  const unsigned int dcol =3D DWARF_REG_TO_UNWIND_COLUMN (rnum);
> -
> --  const HOST_WIDE_INT slotoffset =3D rnum * GET_MODE_SIZE (slotmode);
> -+  const HOST_WIDE_INT slotoffset =3D dcol * GET_MODE_SIZE (slotmode);
> -   const HOST_WIDE_INT regsize =3D GET_MODE_SIZE (regmode);
> -
> -   init_state->processed_regno[regno] =3D true;
> -Index: gcc-4.9.2/libgcc/unwind-dw2.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.9.2.orig/libgcc/unwind-dw2.c
> -+++ gcc-4.9.2/libgcc/unwind-dw2.c
> -@@ -55,10 +55,6 @@
> - #define PRE_GCC3_DWARF_FRAME_REGISTERS DWARF_FRAME_REGISTERS
> - #endif
> -
> --#ifndef DWARF_REG_TO_UNWIND_COLUMN
> --#define DWARF_REG_TO_UNWIND_COLUMN(REGNO) (REGNO)
> --#endif
> --
> - /* ??? For the public function interfaces, we tend to gcc_assert that t=
he
> -    column numbers are in range.  For the dwarf2 unwind info this does h=
appen,
> -    although so far in a case that doesn't actually matter.
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0057-aarch64-config.patch =
b/meta/recipes-devtools/gcc/gcc-4.9/0057-aarch64-config.patch
> deleted file mode 100644
> index f295596..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.9/0057-aarch64-config.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -Disable the MULTILIB_OSDIRNAMES and other multilib options.
> -
> -Hard coding the MULTILIB_OSDIRNAMES with ../lib64 is causing problems on
> -systems where the libdir is NOT set to /lib64.  This is allowed by the A=
BI, as
> -long as the dynamic loader is present in /lib.
> -
> -We simply want to use the default rules in gcc to find and configure the
> -normal libdir.
> -
> -Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> -
> -Index: gcc-4.9.1/gcc/config/aarch64/t-aarch64-linux
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.9.1.orig/gcc/config/aarch64/t-aarch64-linux
> -+++ gcc-4.9.1/gcc/config/aarch64/t-aarch64-linux
> -@@ -21,11 +21,11 @@
> - LIB1ASMSRC   =3D aarch64/lib1funcs.asm
> - LIB1ASMFUNCS =3D _aarch64_sync_cache_range
> -
> --AARCH_BE =3D $(if $(findstring TARGET_BIG_ENDIAN_DEFAULT=3D1, $(tm_defi=
nes)),_be)
> --MULTILIB_OSDIRNAMES =3D .=3D../lib64$(call if_multiarch,:aarch64$(AARCH=
_BE)-linux-gnu)
> --MULTIARCH_DIRNAME =3D $(call if_multiarch,aarch64$(AARCH_BE)-linux-gnu)
> -+#AARCH_BE =3D $(if $(findstring TARGET_BIG_ENDIAN_DEFAULT=3D1, $(tm_def=
ines)),_be)
> -+#MULTILIB_OSDIRNAMES =3D .=3D../lib64$(call if_multiarch,:aarch64$(AARC=
H_BE)-linux-gnu)
> -+#MULTIARCH_DIRNAME =3D $(call if_multiarch,aarch64$(AARCH_BE)-linux-gnu=
)
> -
> - # Disable the multilib for linux-gnu targets for the time being; focus
> - # on the baremetal targets.
> --MULTILIB_OPTIONS    =3D
> --MULTILIB_DIRNAMES   =3D
> -+#MULTILIB_OPTIONS    =3D
> -+#MULTILIB_DIRNAMES   =3D
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0058-gcc-r212171.patch b/m=
eta/recipes-devtools/gcc/gcc-4.9/0058-gcc-r212171.patch
> deleted file mode 100644
> index d442ba8..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.9/0058-gcc-r212171.patch
> +++ /dev/null
> @@ -1,113 +0,0 @@
> -From ca03cf1b133d66eb978c68f6dbc345e9aabcba88 Mon Sep 17 00:00:00 2001
> -From: uros <uros@138bc75d-0d04-0410-961f-82ee72b054a4>
> -Date: Mon, 30 Jun 2014 19:30:52 +0000
> -Subject: [PATCH] r212171
> -
> -* except.c (emit_note_eh_region_end): New helper
> - function.     (convert_to_eh_region_ranges): Use
> - emit_note_eh_region_end to    emit EH_REGION_END note.
> - * jump.c (cleanup_barriers): Do not split a call and its
> - corresponding CALL_ARG_LOCATION note.
> -
> -git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@212171 138bc75d-0d04-041=
0-961f-82ee72b054a4
> -
> -Upstream-Status: Backport [https://gcc.gnu.org/viewcvs/gcc?view=3Drevisi=
on&revision=3D212171]
> -Signed-off-by: Baoshan Pang <baoshan.pang@windriver.com>
> ----
> - gcc/except.c |   23 ++++++++++++++++++-----
> - gcc/jump.c   |   19 +++++++++++++++----
> - 2 files changed, 33 insertions(+), 9 deletions(-)
> -
> -diff --git a/gcc/except.c b/gcc/except.c
> -index dc5c1d2..7ac114f 100644
> ---- a/gcc/except.c
> -+++ b/gcc/except.c
> -@@ -2466,6 +2466,20 @@ add_call_site (rtx landing_pad, int action, int s=
ection)
> -   return call_site_base + crtl->eh.call_site_record_v[section]->length =
() - 1;
> - }
> -
> -+static rtx
> -+emit_note_eh_region_end (rtx insn)
> -+{
> -+  rtx next =3D NEXT_INSN (insn);
> -+
> -+  /* Make sure we do not split a call and its corresponding
> -+     CALL_ARG_LOCATION note.  */
> -+  if (next && NOTE_P (next)
> -+      && NOTE_KIND (next) =3D=3D NOTE_INSN_CALL_ARG_LOCATION)
> -+    insn =3D next;
> -+
> -+  return emit_note_after (NOTE_INSN_EH_REGION_END, insn);
> -+}
> -+
> - /* Turn REG_EH_REGION notes back into NOTE_INSN_EH_REGION notes.
> -    The new note numbers will not refer to region numbers, but
> -    instead to call site entries.  */
> -@@ -2544,8 +2558,8 @@ convert_to_eh_region_ranges (void)
> -               note =3D emit_note_before (NOTE_INSN_EH_REGION_BEG,
> -                                        first_no_action_insn_before_swit=
ch);
> -               NOTE_EH_HANDLER (note) =3D call_site;
> --              note =3D emit_note_after (NOTE_INSN_EH_REGION_END,
> --                                      last_no_action_insn_before_switch=
);
> -+              note
> -+                =3D emit_note_eh_region_end (last_no_action_insn_before=
_switch);
> -               NOTE_EH_HANDLER (note) =3D call_site;
> -               gcc_assert (last_action !=3D -3
> -                           || (last_action_insn
> -@@ -2569,8 +2583,7 @@ convert_to_eh_region_ranges (void)
> -                   first_no_action_insn =3D NULL_RTX;
> -                 }
> -
> --              note =3D emit_note_after (NOTE_INSN_EH_REGION_END,
> --                                      last_action_insn);
> -+              note =3D emit_note_eh_region_end (last_action_insn);
> -               NOTE_EH_HANDLER (note) =3D call_site;
> -             }
> -
> -@@ -2617,7 +2630,7 @@ convert_to_eh_region_ranges (void)
> -
> -   if (last_action >=3D -1 && ! first_no_action_insn)
> -     {
> --      note =3D emit_note_after (NOTE_INSN_EH_REGION_END, last_action_in=
sn);
> -+      note =3D emit_note_eh_region_end (last_action_insn);
> -       NOTE_EH_HANDLER (note) =3D call_site;
> -     }
> -
> -diff --git a/gcc/jump.c b/gcc/jump.c
> -index 9418f65..a5e5f52 100644
> ---- a/gcc/jump.c
> -+++ b/gcc/jump.c
> -@@ -121,15 +121,26 @@ rebuild_jump_labels_chain (rtx chain)
> - static unsigned int
> - cleanup_barriers (void)
> - {
> --  rtx insn, next, prev;
> --  for (insn =3D get_insns (); insn; insn =3D next)
> -+  rtx insn;
> -+  for (insn =3D get_insns (); insn; insn =3D NEXT_INSN (insn))
> -     {
> --      next =3D NEXT_INSN (insn);
> -       if (BARRIER_P (insn))
> -       {
> --        prev =3D prev_nonnote_insn (insn);
> -+        rtx prev =3D prev_nonnote_insn (insn);
> -         if (!prev)
> -           continue;
> -+
> -+        if (CALL_P (prev))
> -+          {
> -+            /* Make sure we do not split a call and its corresponding
> -+               CALL_ARG_LOCATION note.  */
> -+            rtx next =3D NEXT_INSN (prev);
> -+
> -+            if (NOTE_P (next)
> -+                && NOTE_KIND (next) =3D=3D NOTE_INSN_CALL_ARG_LOCATION)
> -+              prev =3D next;
> -+          }
> -+
> -         if (BARRIER_P (prev))
> -           delete_insn (insn);
> -         else if (prev !=3D PREV_INSN (insn))
> ---
> -1.7.9.5
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0059-gcc-PR-rtl-optimizati=
on-63348.patch b/meta/recipes-devtools/gcc/gcc-4.9/0059-gcc-PR-rtl-optimiza=
tion-63348.patch
> deleted file mode 100644
> index de827cb..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.9/0059-gcc-PR-rtl-optimization-6334=
8.patch
> +++ /dev/null
> @@ -1,59 +0,0 @@
> -From 6eae3e637fcc22d21b51d44d61e3a9cb4825e776 Mon Sep 17 00:00:00 2001
> -From: Jackie Huang <jackie.huang@windriver.com>
> -Date: Thu, 30 Oct 2014 20:37:14 -0700
> -Subject: [PATCH]PR rtl-optimization/63348
> -
> -PR rtl-optimization/63348
> -* emit-rtl.c (try_split): Do not emit extra barrier.
> -
> -Note: this patch is to fix the side effect introduced by r212171 which w=
as reported at:
> -https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D63348
> -
> -git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@215613 138bc75d-0d04-041=
0-961f-82ee72b054a4
> -
> -Upstream-Status: Backport [https://gcc.gnu.org/viewcvs/gcc?view=3Drevisi=
on&revision=3D215613]
> -Signed-off-by: Baoshan Pang <baoshan.pang@windriver.com>
> -Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ----
> - gcc/emit-rtl.c |   11 -----------
> - 1 files changed, 0 insertions(+), 11 deletions(-)
> -
> -diff --git a/gcc/emit-rtl.c b/gcc/emit-rtl.c
> -index 4736f8d..ae69dbd 100644
> ---- a/gcc/emit-rtl.c
> -+++ b/gcc/emit-rtl.c
> -@@ -3422,7 +3422,6 @@ try_split (rtx pat, rtx trial, int last)
> - {
> -   rtx before =3D PREV_INSN (trial);
> -   rtx after =3D NEXT_INSN (trial);
> --  int has_barrier =3D 0;
> -   rtx note, seq, tem;
> -   int probability;
> -   rtx insn_last, insn;
> -@@ -3441,14 +3440,6 @@ try_split (rtx pat, rtx trial, int last)
> -
> -   split_branch_probability =3D -1;
> -
> --  /* If we are splitting a JUMP_INSN, it might be followed by a BARRIER=
.
> --     We may need to handle this specially.  */
> --  if (after && BARRIER_P (after))
> --    {
> --      has_barrier =3D 1;
> --      after =3D NEXT_INSN (after);
> --    }
> --
> -   if (!seq)
> -     return trial;
> -
> -@@ -3594,8 +3585,6 @@ try_split (rtx pat, rtx trial, int last)
> -   tem =3D emit_insn_after_setloc (seq, trial, INSN_LOCATION (trial));
> -
> -   delete_insn (trial);
> --  if (has_barrier)
> --    emit_barrier_after (tem);
> -
> -   /* Recursively call try_split for each new insn created; by the
> -      time control returns here that insn will be fully split, so
> ---
> -1.7.1
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0060-Only-allow-e500-doubl=
e-in-SPE_SIMD_REGNO_P-registers.patch b/meta/recipes-devtools/gcc/gcc-4.9/0=
060-Only-allow-e500-double-in-SPE_SIMD_REGNO_P-registers.patch
> deleted file mode 100644
> index 75a9fdd..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.9/0060-Only-allow-e500-double-in-SP=
E_SIMD_REGNO_P-registers.patch
> +++ /dev/null
> @@ -1,55 +0,0 @@
> -From 5c0092070253113cf0d9c45eacc884b3ecc34d81 Mon Sep 17 00:00:00 2001
> -From: jsm28 <jsm28@138bc75d-0d04-0410-961f-82ee72b054a4>
> -Date: Sat, 25 Oct 2014 00:23:17 +0000
> -Subject: [PATCH] Only allow e500 double in SPE_SIMD_REGNO_P registers.
> -
> -rs6000_hard_regno_nregs_internal allows SPE vectors in single
> -registers satisfying SPE_SIMD_REGNO_P (i.e. register numbers 0 to
> -31).  However, the corresponding test for e500 double treats all
> -registers as being able to store a 64-bit value, rather than just
> -those GPRs.
> -
> -Logically this inconsistency is wrong; in addition, it causes problems
> -unwinding from signal handlers.  linux-unwind.h uses
> -ARG_POINTER_REGNUM as a place to store the return address from a
> -signal handler, but this logic in rs6000_hard_regno_nregs_internal
> -results in that being considered an 8-byte register, resulting in
> -assertion failures.
> -(<https://gcc.gnu.org/ml/gcc-patches/2014-09/msg02625.html> first
> -needs to be applied for unwinding to work in general on e500.)  This
> -patch makes rs6000_hard_regno_nregs_internal handle the e500 double
> -case consistently with SPE vectors.
> -
> -Tested with no regressions with cross to powerpc-linux-gnuspe (given
> -the aforementioned patch applied).  Failures of signal handling
> -unwinding tests such as gcc.dg/cleanup-{8,9,10,11}.c are fixed by this
> -patch.
> -
> -       * config/rs6000/rs6000.c (rs6000_hard_regno_nregs_internal): Do
> -       not allow e500 double in registers not satisyfing
> -       SPE_SIMD_REGNO_P.
> -
> -
> -git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@216688 138bc75d-0d04-041=
0-961f-82ee72b054a4
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -Upstream-Status: Backport [gcc 5.0]
> -
> ----
> - gcc/ChangeLog              | 6 ++++++
> - gcc/config/rs6000/rs6000.c | 2 +-
> - 2 files changed, 7 insertions(+), 1 deletion(-)
> -
> -Index: gcc-4.9.2/gcc/config/rs6000/rs6000.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.9.2.orig/gcc/config/rs6000/rs6000.c
> -+++ gcc-4.9.2/gcc/config/rs6000/rs6000.c
> -@@ -1703,7 +1703,7 @@ rs6000_hard_regno_nregs_internal (int re
> -      SCmode so as to pass the value correctly in a pair of
> -      registers.  */
> -   else if (TARGET_E500_DOUBLE && FLOAT_MODE_P (mode) && mode !=3D SCmod=
e
> --         && !DECIMAL_FLOAT_MODE_P (mode))
> -+         && !DECIMAL_FLOAT_MODE_P (mode) && SPE_SIMD_REGNO_P (regno))
> -     reg_size =3D UNITS_PER_FP_WORD;
> -
> -   else
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0061-target-gcc-includedir=
.patch b/meta/recipes-devtools/gcc/gcc-4.9/0061-target-gcc-includedir.patch
> deleted file mode 100644
> index f48c66d..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.9/0061-target-gcc-includedir.patch
> +++ /dev/null
> @@ -1,81 +0,0 @@
> -Ensure target gcc headers can be included
> -
> -There are a few headers installed as part of the OpenEmbedded
> -gcc-runtime target (omp.h, ssp/*.h). Being installed from a recipe
> -built for the target architecture, these are within the target
> -sysroot and not cross/nativesdk; thus they weren't able to be
> -found by gcc with the existing search paths. Add support for
> -picking up these headers under the sysroot supplied on the gcc
> -command line in order to resolve this.
> -
> -Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> -
> -Upstream-Status: Pending
> -
> ---- a/gcc/Makefile.in  2014-12-23 11:57:33.327873331 +0000
> -+++ b/gcc/Makefile.in  2015-01-21 11:32:35.447305394 +0000
> -@@ -587,6 +587,7 @@
> -
> - # Directory in which the compiler finds libraries etc.
> - libsubdir =3D $(libdir)/gcc/$(target_noncanonical)/$(version)
> -+libsubdir_target =3D gcc/$(target_noncanonical)/$(version)
> - # Directory in which the compiler finds executables
> - libexecsubdir =3D $(libexecdir)/gcc/$(target_noncanonical)/$(version)
> - # Directory in which all plugin resources are installed
> -@@ -2534,6 +2535,7 @@
> -
> - PREPROCESSOR_DEFINES =3D \
> -   -DGCC_INCLUDE_DIR=3D\"$(libsubdir)/include\" \
> -+  -DGCC_INCLUDE_SUBDIR_TARGET=3D\"$(libsubdir_target)/include\" \
> -   -DFIXED_INCLUDE_DIR=3D\"$(libsubdir)/include-fixed\" \
> -   -DGPLUSPLUS_INCLUDE_DIR=3D\"$(gcc_gxx_include_dir)\" \
> -   -DGPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT=3D$(gcc_gxx_include_dir_add_sysro=
ot) \
> ---- a/gcc/cppdefault.c 2015-01-13 17:40:26.131012725 +0000
> -+++ b/gcc/cppdefault.c 2015-01-21 11:30:08.928426492 +0000
> -@@ -59,6 +59,10 @@
> -     /* This is the dir for gcc's private headers.  */
> -     { GCC_INCLUDE_DIR, "GCC", 0, 0, 0, 0 },
> - #endif
> -+#ifdef GCC_INCLUDE_SUBDIR_TARGET
> -+    /* This is the dir for gcc's private headers under the specified sy=
sroot.  */
> -+    { STANDARD_STARTFILE_PREFIX_2 GCC_INCLUDE_SUBDIR_TARGET, "GCC", 0, =
0, 1, 0 },
> -+#endif
> - #ifdef LOCAL_INCLUDE_DIR
> -     /* /usr/local/include comes before the fixincluded header files.  *=
/
> -     { LOCAL_INCLUDE_DIR, 0, 0, 1, 1, 2 },
> -diff --git a/gcc/defaults.h b/gcc/defaults.h
> -index f94ae17..d98b40b 100644
> ---- a/gcc/defaults.h
> -+++ b/gcc/defaults.h
> -@@ -1390,4 +1390,13 @@ see the files COPYING3 and COPYING.RUNTIME respec=
tively.  If not, see
> -
> - #endif /* GCC_INSN_FLAGS_H  */
> -
> -+/* Default prefixes to attach to command names.  */
> -+
> -+#ifndef STANDARD_STARTFILE_PREFIX_1
> -+#define STANDARD_STARTFILE_PREFIX_1 "/lib/"
> -+#endif
> -+#ifndef STANDARD_STARTFILE_PREFIX_2
> -+#define STANDARD_STARTFILE_PREFIX_2 "/usr/lib/"
> -+#endif
> -+
> - #endif  /* ! GCC_DEFAULTS_H */
> -diff --git a/gcc/gcc.c b/gcc/gcc.c
> -index 9f0b781..174fca8 100644
> ---- a/gcc/gcc.c
> -+++ b/gcc/gcc.c
> -@@ -1189,13 +1189,6 @@ static const char *gcc_libexec_prefix;
> -
> - /* Default prefixes to attach to command names.  */
> -
> --#ifndef STANDARD_STARTFILE_PREFIX_1
> --#define STANDARD_STARTFILE_PREFIX_1 "/lib/"
> --#endif
> --#ifndef STANDARD_STARTFILE_PREFIX_2
> --#define STANDARD_STARTFILE_PREFIX_2 "/usr/lib/"
> --#endif
> --
> - #ifdef CROSS_DIRECTORY_STRUCTURE  /* Don't use these prefixes for a cro=
ss compiler.  */
> - #undef MD_EXEC_PREFIX
> - #undef MD_STARTFILE_PREFIX
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0062-Use-SYSTEMLIBS_DIR-re=
placement-instead-of-hardcoding.patch b/meta/recipes-devtools/gcc/gcc-4.9/0=
062-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
> deleted file mode 100644
> index c48bd48..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.9/0062-Use-SYSTEMLIBS_DIR-replaceme=
nt-instead-of-hardcoding.patch
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -From 861bcfd4ae814f351e0c668ee26d01d1331e0422 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Tue, 28 Apr 2015 23:15:27 -0700
> -Subject: [PATCH 36/37] Use SYSTEMLIBS_DIR replacement instead of hardcod=
ing
> - base_libdir
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - gcc/config/aarch64/aarch64-linux.h | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -Index: gcc-4.9.2/gcc/config/aarch64/aarch64-linux.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.9.2.orig/gcc/config/aarch64/aarch64-linux.h
> -+++ gcc-4.9.2/gcc/config/aarch64/aarch64-linux.h
> -@@ -21,7 +21,7 @@
> - #ifndef GCC_AARCH64_LINUX_H
> - #define GCC_AARCH64_LINUX_H
> -
> --#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux-aarch64%{mbig-endian:_be}.s=
o.1"
> -+#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux-aarch64%{mbig-end=
ian:_be}.so.1"
> -
> - #define CPP_SPEC "%{pthread:-D_REENTRANT}"
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0063-nativesdk-gcc-support=
.patch b/meta/recipes-devtools/gcc/gcc-4.9/0063-nativesdk-gcc-support.patch
> deleted file mode 100644
> index f9efa45..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.9/0063-nativesdk-gcc-support.patch
> +++ /dev/null
> @@ -1,198 +0,0 @@
> -Being able to build a nativesdk gcc is useful, particularly in cases
> -where the host compiler may be of an incompatible version (or a 32
> -bit compiler is needed).
> -
> -Sadly, building nativesdk-gcc is not straight forward. We install
> -nativesdk-gcc into a relocatable location and this means that its
> -library locations can change. "Normal" sysroot support doesn't help
> -in this case since the values of paths like "libdir" change, not just
> -base root directory of the system.
> -
> -In order to handle this we do two things:
> -
> -a) Add %r into spec file markup which can be used for injected paths
> -   such as SYSTEMLIBS_DIR (see gcc_multilib_setup()).
> -b) Add other paths which need relocation into a .gccrelocprefix section
> -   which the relocation code will notice and adjust automatically.
> -
> -Upstream-Status: Inappropriate
> -RP 2015/7/28
> -diff --git a/gcc/gcc.c b/gcc/gcc.c
> -index 5fd3d0a..2de29aa 100644
> ---- a/gcc/gcc.c
> -+++ b/gcc/gcc.c
> -@@ -120,6 +120,8 @@ static const char *target_system_root =3D TARGET_SYS=
TEM_ROOT;
> - #else
> - static const char *target_system_root =3D 0;
> - #endif
> -+
> -+static char target_relocatable_prefix[4096] __attribute__ ((section (".=
gccrelocprefix"))) =3D SYSTEMLIBS_DIR;
> -
> - /* Nonzero means pass the updated target_system_root to the compiler.  =
*/
> -
> -@@ -384,6 +386,7 @@ or with constant text in a single argument.
> -  %G     process LIBGCC_SPEC as a spec.
> -  %R     Output the concatenation of target_system_root and
> -         target_sysroot_suffix.
> -+ %r     Output the base path target_relocatable_prefix
> -  %S     process STARTFILE_SPEC as a spec.  A capital S is actually used=
 here.
> -  %E     process ENDFILE_SPEC as a spec.  A capital E is actually used h=
ere.
> -  %C     process CPP_SPEC as a spec.
> -@@ -1218,10 +1221,10 @@ static const char *gcc_libexec_prefix;
> -    gcc_exec_prefix is set because, in that case, we know where the
> -    compiler has been installed, and use paths relative to that
> -    location instead.  */
> --static const char *const standard_exec_prefix =3D STANDARD_EXEC_PREFIX;
> --static const char *const standard_libexec_prefix =3D STANDARD_LIBEXEC_P=
REFIX;
> --static const char *const standard_bindir_prefix =3D STANDARD_BINDIR_PRE=
FIX;
> --static const char *const standard_startfile_prefix =3D STANDARD_STARTFI=
LE_PREFIX;
> -+static char standard_exec_prefix[4096] __attribute__ ((section (".gccre=
locprefix"))) =3D STANDARD_EXEC_PREFIX;
> -+static char standard_libexec_prefix[4096] __attribute__ ((section (".gc=
crelocprefix"))) =3D STANDARD_LIBEXEC_PREFIX;
> -+static char standard_bindir_prefix[4096] __attribute__ ((section (".gcc=
relocprefix"))) =3D STANDARD_BINDIR_PREFIX;
> -+static char *const standard_startfile_prefix =3D STANDARD_STARTFILE_PRE=
FIX;
> -
> - /* For native compilers, these are well-known paths containing
> -    components that may be provided by the system.  For cross
> -@@ -1229,9 +1232,9 @@ static const char *const standard_startfile_prefix=
 =3D STANDARD_STARTFILE_PREFIX;
> - static const char *md_exec_prefix =3D MD_EXEC_PREFIX;
> - static const char *md_startfile_prefix =3D MD_STARTFILE_PREFIX;
> - static const char *md_startfile_prefix_1 =3D MD_STARTFILE_PREFIX_1;
> --static const char *const standard_startfile_prefix_1
> -+static char standard_startfile_prefix_1[4096] __attribute__ ((section (=
".gccrelocprefix")))
> -   =3D STANDARD_STARTFILE_PREFIX_1;
> --static const char *const standard_startfile_prefix_2
> -+static char standard_startfile_prefix_2[4096] __attribute__ ((section (=
".gccrelocprefix")))
> -   =3D STANDARD_STARTFILE_PREFIX_2;
> -
> - /* A relative path to be used in finding the location of tools
> -@@ -5305,6 +5308,11 @@ do_spec_1 (const char *spec, int inswitch, const =
char *soft_matched_part)
> -             }
> -           break;
> -
> -+          case 'r':
> -+              obstack_grow (&obstack, target_relocatable_prefix,
> -+                    strlen (target_relocatable_prefix));
> -+            break;
> -+
> -         case 'S':
> -           value =3D do_spec_1 (startfile_spec, 0, NULL);
> -           if (value !=3D 0)
> -
> -diff --git a/gcc/cppdefault.c b/gcc/cppdefault.c
> -index dad69e6..cf43f28 100644
> ---- a/gcc/cppdefault.c
> -+++ b/gcc/cppdefault.c
> -@@ -35,6 +35,30 @@
> - # undef CROSS_INCLUDE_DIR
> - #endif
> -
> -+static char GPLUSPLUS_INCLUDE_DIRVAR[4096] __attribute__ ((section (".g=
ccrelocprefix"))) =3D GPLUSPLUS_INCLUDE_DIR;
> -+static char GCC_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gccrelo=
cprefix"))) =3D GCC_INCLUDE_DIR;
> -+static char GPLUSPLUS_TOOL_INCLUDE_DIRVAR[4096] __attribute__ ((section=
 (".gccrelocprefix"))) =3D GPLUSPLUS_TOOL_INCLUDE_DIR;
> -+static char GPLUSPLUS_BACKWARD_INCLUDE_DIRVAR[4096] __attribute__ ((sec=
tion (".gccrelocprefix"))) =3D GPLUSPLUS_BACKWARD_INCLUDE_DIR;
> -+static char STANDARD_STARTFILE_PREFIX_2VAR[4096] __attribute__ ((sectio=
n (".gccrelocprefix"))) =3D STANDARD_STARTFILE_PREFIX_2 GCC_INCLUDE_SUBDIR_=
TARGET;
> -+#ifdef LOCAL_INCLUDE_DIR
> -+static char LOCAL_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gccre=
locprefix"))) =3D LOCAL_INCLUDE_DIR;
> -+#endif
> -+#ifdef PREFIX_INCLUDE_DIR
> -+static char PREFIX_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gccr=
elocprefix"))) =3D PREFIX_INCLUDE_DIR;
> -+#endif
> -+#ifdef FIXED_INCLUDE_DIR
> -+static char FIXED_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gccre=
locprefix"))) =3D FIXED_INCLUDE_DIR;
> -+#endif
> -+#ifdef CROSS_INCLUDE_DIR
> -+static char CROSS_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gccre=
locprefix"))) =3D CROSS_INCLUDE_DIR;
> -+#endif
> -+#ifdef TOOL_INCLUDE_DIR
> -+static char TOOL_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gccrel=
ocprefix"))) =3D TOOL_INCLUDE_DIR;
> -+#endif
> -+#ifdef NATIVE_SYSTEM_HEADER_DIR
> -+static char NATIVE_SYSTEM_HEADER_DIRVAR[4096] __attribute__ ((section (=
".gccrelocprefix"))) =3D NATIVE_SYSTEM_HEADER_DIR;
> -+#endif
> -+
> - const struct default_include cpp_include_defaults[]
> - #ifdef INCLUDE_DEFAULTS
> - =3D INCLUDE_DEFAULTS;
> -@@ -42,38 +66,38 @@ const struct default_include cpp_include_defaults[]
> - =3D {
> - #ifdef GPLUSPLUS_INCLUDE_DIR
> -     /* Pick up GNU C++ generic include files.  */
> --    { GPLUSPLUS_INCLUDE_DIR, "G++", 1, 1,
> -+    { GPLUSPLUS_INCLUDE_DIRVAR, "G++", 1, 1,
> -       GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 0 },
> - #endif
> - #ifdef GPLUSPLUS_TOOL_INCLUDE_DIR
> -     /* Pick up GNU C++ target-dependent include files.  */
> --    { GPLUSPLUS_TOOL_INCLUDE_DIR, "G++", 1, 1,
> -+    { GPLUSPLUS_TOOL_INCLUDE_DIRVAR, "G++", 1, 1,
> -       GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 1 },
> - #endif
> - #ifdef GPLUSPLUS_BACKWARD_INCLUDE_DIR
> -     /* Pick up GNU C++ backward and deprecated include files.  */
> --    { GPLUSPLUS_BACKWARD_INCLUDE_DIR, "G++", 1, 1,
> -+    { GPLUSPLUS_BACKWARD_INCLUDE_DIRVAR, "G++", 1, 1,
> -       GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 0 },
> - #endif
> - #ifdef GCC_INCLUDE_DIR
> -     /* This is the dir for gcc's private headers.  */
> --    { GCC_INCLUDE_DIR, "GCC", 0, 0, 0, 0 },
> -+    { GCC_INCLUDE_DIRVAR, "GCC", 0, 0, 0, 0 },
> - #endif
> - #ifdef GCC_INCLUDE_SUBDIR_TARGET
> -     /* This is the dir for gcc's private headers under the specified sy=
sroot.  */
> --    { STANDARD_STARTFILE_PREFIX_2 GCC_INCLUDE_SUBDIR_TARGET, "GCC", 0, =
0, 1, 0 },
> -+    { STANDARD_STARTFILE_PREFIX_2VAR, "GCC", 0, 0, 1, 0 },
> - #endif
> - #ifdef LOCAL_INCLUDE_DIR
> -     /* /usr/local/include comes before the fixincluded header files.  *=
/
> --    { LOCAL_INCLUDE_DIR, 0, 0, 1, 1, 2 },
> --    { LOCAL_INCLUDE_DIR, 0, 0, 1, 1, 0 },
> -+    { LOCAL_INCLUDE_DIRVAR, 0, 0, 1, 1, 2 },
> -+    { LOCAL_INCLUDE_DIRVAR, 0, 0, 1, 1, 0 },
> - #endif
> - #ifdef PREFIX_INCLUDE_DIR
> --    { PREFIX_INCLUDE_DIR, 0, 0, 1, 0, 0 },
> -+    { PREFIX_INCLUDE_DIRVAR, 0, 0, 1, 0, 0 },
> - #endif
> - #ifdef FIXED_INCLUDE_DIR
> -     /* This is the dir for fixincludes.  */
> --    { FIXED_INCLUDE_DIR, "GCC", 0, 0, 0,
> -+    { FIXED_INCLUDE_DIRVAR, "GCC", 0, 0, 0,
> -       /* A multilib suffix needs adding if different multilibs use
> -        different headers.  */
> - #ifdef SYSROOT_HEADERS_SUFFIX_SPEC
> -@@ -85,16 +109,16 @@ const struct default_include cpp_include_defaults[]
> - #endif
> - #ifdef CROSS_INCLUDE_DIR
> -     /* One place the target system's headers might be.  */
> --    { CROSS_INCLUDE_DIR, "GCC", 0, 0, 0, 0 },
> -+    { CROSS_INCLUDE_DIRVAR, "GCC", 0, 0, 0, 0 },
> - #endif
> - #ifdef TOOL_INCLUDE_DIR
> -     /* Another place the target system's headers might be.  */
> --    { TOOL_INCLUDE_DIR, "BINUTILS", 0, 1, 0, 0 },
> -+    { TOOL_INCLUDE_DIRVAR, "BINUTILS", 0, 1, 0, 0 },
> - #endif
> - #ifdef NATIVE_SYSTEM_HEADER_DIR
> -     /* /usr/include comes dead last.  */
> --    { NATIVE_SYSTEM_HEADER_DIR, NATIVE_SYSTEM_HEADER_COMPONENT, 0, 0, 1=
, 2 },
> --    { NATIVE_SYSTEM_HEADER_DIR, NATIVE_SYSTEM_HEADER_COMPONENT, 0, 0, 1=
, 0 },
> -+    { NATIVE_SYSTEM_HEADER_DIRVAR, NATIVE_SYSTEM_HEADER_COMPONENT, 0, 0=
, 1, 2 },
> -+    { NATIVE_SYSTEM_HEADER_DIRVAR, NATIVE_SYSTEM_HEADER_COMPONENT, 0, 0=
, 1, 0 },
> - #endif
> -     { 0, 0, 0, 0, 0, 0 }
> -   };
> -diff --git a/gcc/cppdefault.h b/gcc/cppdefault.h
> -index 30b6fed..2ef96b7 100644
> ---- a/gcc/cppdefault.h
> -+++ b/gcc/cppdefault.h
> -@@ -33,7 +33,8 @@
> -
> - struct default_include
> - {
> --  const char *const fname;    /* The name of the directory.  */
> -+  const char *fname;     /* The name of the directory.  */
> -+
> -   const char *const component;        /* The component containing the d=
irectory
> -                                  (see update_path in prefix.c) */
> -   const char cplusplus;               /* Only look here if we're compil=
ing C++.  */
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0064-handle-target-sysroot=
-multilib.patch b/meta/recipes-devtools/gcc/gcc-4.9/0064-handle-target-sysr=
oot-multilib.patch
> deleted file mode 100644
> index 5356984..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.9/0064-handle-target-sysroot-multil=
ib.patch
> +++ /dev/null
> @@ -1,88 +0,0 @@
> -Search target sysroot gcc version specific dirs with multilib.
> -
> -We install the gcc libraries (such as crtbegin.p) into
> -<sysroot><libdir>/<target-sys>/5.2.0/
> -which is a default search path for GCC (aka multi_suffix in the
> -code below). <target-sys> is 'machine' in gcc's terminology. We use
> -these directories so that multiple gcc versions could in theory
> -co-exist on target.
> -
> -We only want to build one gcc-cross-canadian per arch and have this work
> -for all multilibs. <target-sys> can be handled by mapping the multilib
> -<target-sys> to the one used by gcc-cross-canadian, e.g. mips64-polkmlli=
b32-linux
> -is symlinked to by mips64-poky-linux.
> -
> -The default gcc search path in the target sysroot for a "lib64" mutlilib=
 is:
> -
> -<sysroot>/lib32/mips64-poky-linux/5.2.0/
> -<sysroot>/lib32/../lib64/
> -<sysroot>/usr/lib32/mips64-poky-linux/5.2.0/
> -<sysroot>/usr/lib32/../lib64/
> -<sysroot>/lib32/
> -<sysroot>/usr/lib32/
> -
> -which means that the lib32 crtbegin.o will be found and the lib64 ones
> -will not which leads to compiler failures.
> -
> -This patch injects a multilib version of that path first so the lib64
> -binaries can be found first. With this change the search path becomes:
> -
> -<sysroot>/lib32/../lib64/mips64-poky-linux/5.2.0/
> -<sysroot>/lib32/mips64-poky-linux/5.2.0/
> -<sysroot>/lib32/../lib64/
> -<sysroot>/usr/lib32/../lib64/mips64-poky-linux/5.2.0/
> -<sysroot>/usr/lib32/mips64-poky-linux/5.2.0/
> -<sysroot>/usr/lib32/../lib64/
> -<sysroot>/lib32/
> -<sysroot>/usr/lib32/
> -
> -Upstream-Status: Pending
> -RP 2015/7/31
> -
> -Index: gcc-5.2.0/gcc/gcc.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-5.2.0.orig/gcc/gcc.c
> -+++ gcc-5.2.0/gcc/gcc.c
> -@@ -2305,7 +2305,7 @@ for_each_path (const struct path_prefix
> -       if (path =3D=3D NULL)
> -       {
> -         len =3D paths->max_len + extra_space + 1;
> --        len +=3D MAX (MAX (suffix_len, multi_os_dir_len), multiarch_len=
);
> -+        len +=3D MAX ((suffix_len + multi_os_dir_len), multiarch_len);
> -         path =3D XNEWVEC (char, len);
> -       }
> -
> -@@ -2317,6 +2317,33 @@ for_each_path (const struct path_prefix
> -         /* Look first in MACHINE/VERSION subdirectory.  */
> -         if (!skip_multi_dir)
> -           {
> -+            if (!(pl->os_multilib ? skip_multi_os_dir : skip_multi_dir)=
)
> -+              {
> -+                const char *this_multi;
> -+                size_t this_multi_len;
> -+
> -+                if (pl->os_multilib)
> -+                  {
> -+                    this_multi =3D multi_os_dir;
> -+                    this_multi_len =3D multi_os_dir_len;
> -+                  }
> -+                else
> -+                  {
> -+                    this_multi =3D multi_dir;
> -+                    this_multi_len =3D multi_dir_len;
> -+                  }
> -+
> -+                /* Look in multilib MACHINE/VERSION subdirectory first =
*/
> -+                if (this_multi_len)
> -+                  {
> -+                    memcpy (path + len, this_multi, this_multi_len + 1)=
;
> -+                    memcpy (path + len + this_multi_len, multi_suffix, =
suffix_len + 1);
> -+                    ret =3D callback (path, callback_info);
> -+                      if (ret)
> -+                        break;
> -+                  }
> -+              }
> -+
> -             memcpy (path + len, multi_suffix, suffix_len + 1);
> -             ret =3D callback (path, callback_info);
> -             if (ret)
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0065-gcc-483-universal-ini=
tializer-no-warning.patch b/meta/recipes-devtools/gcc/gcc-4.9/0065-gcc-483-=
universal-initializer-no-warning.patch
> deleted file mode 100644
> index fde227b..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.9/0065-gcc-483-universal-initialize=
r-no-warning.patch
> +++ /dev/null
> @@ -1,107 +0,0 @@
> -Upstream-Status: Backport
> -
> -Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ----
> -Fix for https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D53119
> -wrong warning when using the universal zero initializer {0}
> -
> -Backported to GCC 4.8.3
> -
> -Subject: 2014-06-05  S. Gilles  <sgilles@terpmail.umd.edu>
> -X-Git-Url: http://repo.or.cz/w/official-gcc.git/commitdiff_plain/95cdf3f=
df2d440eb7775def8e35ab970651c33d9?hp=3D14a3093e9943937cbc63dfbf4d51ca60f832=
5b29
> -git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@211289 138bc75d-0d04-041=
0-961f-82ee72b054a4
> -
> ---- gcc-4.8.3.org/gcc/c/c-typeck.c     2014-08-03 20:52:09.257042137 +02=
00
> -+++ gcc-4.8.3/gcc/c/c-typeck.c 2014-08-03 20:57:10.645042614 +0200
> -@@ -62,9 +62,9 @@
> -    if expr.original_code =3D=3D SIZEOF_EXPR.  */
> - tree c_last_sizeof_arg;
> -
> --/* Nonzero if we've already printed a "missing braces around initialize=
r"
> --   message within this initializer.  */
> --static int missing_braces_mentioned;
> -+/* Nonzero if we might need to print a "missing braces around
> -+   initializer" message within this initializer.  */
> -+static int found_missing_braces;
> -
> - static int require_constant_value;
> - static int require_constant_elements;
> -@@ -6379,6 +6379,9 @@
> - /* 1 if this constructor is erroneous so far.  */
> - static int constructor_erroneous;
> -
> -+/* 1 if this constructor is the universal zero initializer { 0 }.  */
> -+static int constructor_zeroinit;
> -+
> - /* Structure for managing pending initializer elements, organized as an
> -    AVL tree.  */
> -
> -@@ -6540,7 +6543,7 @@
> -   constructor_stack =3D 0;
> -   constructor_range_stack =3D 0;
> -
> --  missing_braces_mentioned =3D 0;
> -+  found_missing_braces =3D 0;
> -
> -   spelling_base =3D 0;
> -   spelling_size =3D 0;
> -@@ -6635,6 +6638,7 @@
> -   constructor_type =3D type;
> -   constructor_incremental =3D 1;
> -   constructor_designated =3D 0;
> -+  constructor_zeroinit =3D 1;
> -   designator_depth =3D 0;
> -   designator_erroneous =3D 0;
> -
> -@@ -6832,11 +6836,8 @@
> -       set_nonincremental_init (braced_init_obstack);
> -     }
> -
> --  if (implicit =3D=3D 1 && warn_missing_braces && !missing_braces_menti=
oned)
> --    {
> --      missing_braces_mentioned =3D 1;
> --      warning_init (OPT_Wmissing_braces, "missing braces around initial=
izer");
> --    }
> -+  if (implicit =3D=3D 1)
> -+    found_missing_braces =3D 1;
> -
> -   if (TREE_CODE (constructor_type) =3D=3D RECORD_TYPE
> -          || TREE_CODE (constructor_type) =3D=3D UNION_TYPE)
> -@@ -6969,16 +6970,23 @@
> -       }
> -     }
> -
> -+  if (vec_safe_length (constructor_elements) !=3D 1)
> -+    constructor_zeroinit =3D 0;
> -+
> -+  /* Warn when some structs are initialized with direct aggregation.  *=
/
> -+  if (!implicit && found_missing_braces && warn_missing_braces
> -+      && !constructor_zeroinit)
> -+    {
> -+      warning_init (OPT_Wmissing_braces,
> -+                  "missing braces around initializer");
> -+    }
> -+
> -   /* Warn when some struct elements are implicitly initialized to zero.=
  */
> -   if (warn_missing_field_initializers
> -       && constructor_type
> -       && TREE_CODE (constructor_type) =3D=3D RECORD_TYPE
> -       && constructor_unfilled_fields)
> -     {
> --      bool constructor_zeroinit =3D
> --       (vec_safe_length (constructor_elements) =3D=3D 1
> --        && integer_zerop ((*constructor_elements)[0].value));
> --
> -       /* Do not warn for flexible array members or zero-length arrays. =
 */
> -       while (constructor_unfilled_fields
> -              && (!DECL_SIZE (constructor_unfilled_fields)
> -@@ -8093,6 +8101,9 @@
> -   designator_depth =3D 0;
> -   designator_erroneous =3D 0;
> -
> -+  if (!implicit && value.value && !integer_zerop (value.value))
> -+    constructor_zeroinit =3D 0;
> -+
> -   /* Handle superfluous braces around string cst as in
> -      char x[] =3D {"foo"}; */
> -   if (string_flag
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0066-cxxflags-for-build.pa=
tch b/meta/recipes-devtools/gcc/gcc-4.9/0066-cxxflags-for-build.patch
> deleted file mode 100644
> index 1105e29..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.9/0066-cxxflags-for-build.patch
> +++ /dev/null
> @@ -1,123 +0,0 @@
> -Fix various _FOR_BUILD and related variables
> -
> -When doing a FOR_BUILD thing, you have to override CFLAGS with
> -CFLAGS_FOR_BUILD. And if you use C++, you also have to override
> -CXXFLAGS with CXXFLAGS_FOR_BUILD.
> -Without this, when building for mingw, you end up trying to use
> -the mingw headers for a host build.
> -
> -The same goes for other variables as well, such as CPPFLAGS,
> -CPP, and GMPINC.
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
> -Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> -
> -diff --git a/Makefile.in b/Makefile.in
> -index 9370174..011c29a 100644
> ---- a/Makefile.in
> -+++ b/Makefile.in
> -@@ -152,6 +152,7 @@ BUILD_EXPORTS =3D \
> -       CPP=3D"$(CC_FOR_BUILD) -E"; export CPP; \
> -       CFLAGS=3D"$(CFLAGS_FOR_BUILD)"; export CFLAGS; \
> -       CONFIG_SHELL=3D"$(SHELL)"; export CONFIG_SHELL; \
> -+      CPPFLAGS=3D"$(CPPFLAGS_FOR_BUILD)"; export CPPFLAGS; \
> -       CXX=3D"$(CXX_FOR_BUILD)"; export CXX; \
> -       CXXFLAGS=3D"$(CXXFLAGS_FOR_BUILD)"; export CXXFLAGS; \
> -       GCJ=3D"$(GCJ_FOR_BUILD)"; export GCJ; \
> -@@ -170,6 +171,9 @@ BUILD_EXPORTS =3D \
> - # built for the build system to override those in BASE_FLAGS_TO_PASS.
> - EXTRA_BUILD_FLAGS =3D \
> -       CFLAGS=3D"$(CFLAGS_FOR_BUILD)" \
> -+      CXXFLAGS=3D"$(CXXFLAGS_FOR_BUILD)" \
> -+      CPP=3D"$(CC_FOR_BUILD) -E" \
> -+      CPPFLAGS=3D"$(CPPFLAGS_FOR_BUILD)" \
> -       LDFLAGS=3D"$(LDFLAGS_FOR_BUILD)"
> -
> - # This is the list of directories to built for the host system.
> -@@ -187,6 +191,7 @@ HOST_SUBDIR =3D @host_subdir@
> - HOST_EXPORTS =3D \
> -       $(BASE_EXPORTS) \
> -       CC=3D"$(CC)"; export CC; \
> -+      CPP=3D"$(CC) -E"; export CPP; \
> -       ADA_CFLAGS=3D"$(ADA_CFLAGS)"; export ADA_CFLAGS; \
> -       CFLAGS=3D"$(CFLAGS)"; export CFLAGS; \
> -       CONFIG_SHELL=3D"$(SHELL)"; export CONFIG_SHELL; \
> -@@ -711,6 +715,7 @@ BASE_FLAGS_TO_PASS =3D \
> -       "CC_FOR_BUILD=3D$(CC_FOR_BUILD)" \
> -       "CFLAGS_FOR_BUILD=3D$(CFLAGS_FOR_BUILD)" \
> -       "CXX_FOR_BUILD=3D$(CXX_FOR_BUILD)" \
> -+      "CXXFLAGS_FOR_BUILD=3D$(CXXFLAGS_FOR_BUILD)" \
> -       "EXPECT=3D$(EXPECT)" \
> -       "FLEX=3D$(FLEX)" \
> -       "INSTALL=3D$(INSTALL)" \
> -diff --git a/Makefile.tpl b/Makefile.tpl
> -index 1ea1954..78a59c3 100644
> ---- a/Makefile.tpl
> -+++ b/Makefile.tpl
> -@@ -154,6 +154,7 @@ BUILD_EXPORTS =3D \
> -       CC=3D"$(CC_FOR_BUILD)"; export CC; \
> -       CFLAGS=3D"$(CFLAGS_FOR_BUILD)"; export CFLAGS; \
> -       CONFIG_SHELL=3D"$(SHELL)"; export CONFIG_SHELL; \
> -+      CPPFLAGS=3D"$(CPPFLAGS_FOR_BUILD)"; export CPPFLAGS; \
> -       CXX=3D"$(CXX_FOR_BUILD)"; export CXX; \
> -       CXXFLAGS=3D"$(CXXFLAGS_FOR_BUILD)"; export CXXFLAGS; \
> -       GCJ=3D"$(GCJ_FOR_BUILD)"; export GCJ; \
> -@@ -172,6 +173,9 @@ BUILD_EXPORTS =3D \
> - # built for the build system to override those in BASE_FLAGS_TO_PASS.
> - EXTRA_BUILD_FLAGS =3D \
> -       CFLAGS=3D"$(CFLAGS_FOR_BUILD)" \
> -+      CXXFLAGS=3D"$(CXXFLAGS_FOR_BUILD)" \
> -+      CPP=3D"$(CC_FOR_BUILD) -E" \
> -+      CPPFLAGS=3D"$(CPPFLAGS_FOR_BUILD)" \
> -       LDFLAGS=3D"$(LDFLAGS_FOR_BUILD)"
> -
> - # This is the list of directories to built for the host system.
> -@@ -189,6 +193,7 @@ HOST_SUBDIR =3D @host_subdir@
> - HOST_EXPORTS =3D \
> -       $(BASE_EXPORTS) \
> -       CC=3D"$(CC)"; export CC; \
> -+      CPP=3D"$(CC) -E"; export CPP; \
> -       ADA_CFLAGS=3D"$(ADA_CFLAGS)"; export ADA_CFLAGS; \
> -       CFLAGS=3D"$(CFLAGS)"; export CFLAGS; \
> -       CONFIG_SHELL=3D"$(SHELL)"; export CONFIG_SHELL; \
> -diff --git a/gcc/Makefile.in b/gcc/Makefile.in
> -index cd5bc4a..98ae4f4 100644
> ---- a/gcc/Makefile.in
> -+++ b/gcc/Makefile.in
> -@@ -762,7 +762,7 @@ BUILD_LINKERFLAGS =3D $(BUILD_CXXFLAGS)
> - # Native linker and preprocessor flags.  For x-fragment overrides.
> - BUILD_LDFLAGS=3D@BUILD_LDFLAGS@
> - BUILD_CPPFLAGS=3D -I. -I$(@D) -I$(srcdir) -I$(srcdir)/$(@D) \
> --              -I$(srcdir)/../include @INCINTL@ $(CPPINC) $(CPPFLAGS)
> -+              -I$(srcdir)/../include @INCINTL@ $(CPPINC) $(CPPFLAGS_FOR=
_BUILD)
> -
> - # Actual name to use when installing a native compiler.
> - GCC_INSTALL_NAME :=3D $(shell echo gcc|sed '$(program_transform_name)')
> -diff --git a/gcc/configure b/gcc/configure
> -index c7ac14b..5ac63e4 100755
> ---- a/gcc/configure
> -+++ b/gcc/configure
> -@@ -11521,7 +11521,7 @@ else
> -       CC=3D"${CC_FOR_BUILD}" CFLAGS=3D"${CFLAGS_FOR_BUILD}" \
> -       CXX=3D"${CXX_FOR_BUILD}" CXXFLAGS=3D"${CXXFLAGS_FOR_BUILD}" \
> -       LD=3D"${LD_FOR_BUILD}" LDFLAGS=3D"${LDFLAGS_FOR_BUILD}" \
> --      GMPINC=3D"" CPPFLAGS=3D"${CPPFLAGS} -DGENERATOR_FILE" \
> -+      GMPINC=3D"" CPPFLAGS=3D"${CPPFLAGS_FOR_BUILD} -DGENERATOR_FILE" \
> -       ${realsrcdir}/configure \
> -               --enable-languages=3D${enable_languages-all} \
> -               --target=3D$target_alias --host=3D$build_alias --build=3D=
$build_alias
> -diff --git a/gcc/configure.ac b/gcc/configure.ac
> -index 50856e6..17a4dfd 100644
> ---- a/gcc/configure.ac
> -+++ b/gcc/configure.ac
> -@@ -1633,7 +1633,7 @@ else
> -       CC=3D"${CC_FOR_BUILD}" CFLAGS=3D"${CFLAGS_FOR_BUILD}" \
> -       CXX=3D"${CXX_FOR_BUILD}" CXXFLAGS=3D"${CXXFLAGS_FOR_BUILD}" \
> -       LD=3D"${LD_FOR_BUILD}" LDFLAGS=3D"${LDFLAGS_FOR_BUILD}" \
> --      GMPINC=3D"" CPPFLAGS=3D"${CPPFLAGS} -DGENERATOR_FILE" \
> -+      GMPINC=3D"" CPPFLAGS=3D"${CPPFLAGS_FOR_BUILD} -DGENERATOR_FILE" \
> -       ${realsrcdir}/configure \
> -               --enable-languages=3D${enable_languages-all} \
> -               --target=3D$target_alias --host=3D$build_alias --build=3D=
$build_alias
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0067-fix-arm-thumb.patch b=
/meta/recipes-devtools/gcc/gcc-4.9/0067-fix-arm-thumb.patch
> deleted file mode 100644
> index 2f262e3..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.9/0067-fix-arm-thumb.patch
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -Upstream-Status: Accepted
> -
> -Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> ----
> -
> -2015-11-25  Vladimir Makarov  <vmakarov@redhat.com>
> -
> -       PR rtl-optimization/67954
> -       * lra-constraints.c (curr_insn_transform): Add check on scratch
> -       pseudo when change class to NO_REGS.  Add an assert.
> -
> -
> -
> -git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@230894 138bc75d-0d04-041=
0-961f-82ee72b054a4
> ----
> -
> -diff --git a/gcc/lra-constraints.c b/gcc/lra-constraints.c
> -index 4670e81..c62bf6a 100644
> ---- a/gcc/lra-constraints.c
> -+++ b/gcc/lra-constraints.c
> -@@ -3725,7 +3725,8 @@ curr_insn_transform (bool check_only_p)
> -                assigment pass and the scratch pseudo will be
> -                spilled.  Spilled scratch pseudos are transformed
> -                back to scratches at the LRA end.  */
> --            && lra_former_scratch_operand_p (curr_insn, i))
> -+            && lra_former_scratch_operand_p (curr_insn, i)
> -+            && lra_former_scratch_p (REGNO (op)))
> -           {
> -             int regno =3D REGNO (op);
> -             lra_change_class (regno, NO_REGS, "      Change to", true);
> -@@ -3734,6 +3735,8 @@ curr_insn_transform (bool check_only_p)
> -                  spilled pseudo as there is only one such insn, the
> -                  current one.  */
> -               reg_renumber[regno] =3D -1;
> -+            lra_assert (bitmap_single_bit_set_p
> -+                        (&lra_reg_info[REGNO (op)].insn_bitmap));
> -           }
> -         /* We can do an optional reload.  If the pseudo got a hard
> -            reg, we might improve the code through inheritance.  If
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0067-gcc-musl-support.patc=
h b/meta/recipes-devtools/gcc/gcc-4.9/0067-gcc-musl-support.patch
> deleted file mode 100644
> index 9a0b5ad..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.9/0067-gcc-musl-support.patch
> +++ /dev/null
> @@ -1,267 +0,0 @@
> -# HG changeset patch
> -# Parent e5b4564f249f8634194bdabef4b3057d0e54ee97
> -Adding -mmusl as a musl libc specifier, and the necessary hacks for it t=
o know how to find musl's dynamic linker.
> -Upstream-Status: backport [partial]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -
> -Index: gcc-4.9.0/gcc/config.gcc
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.9.0.orig/gcc/config.gcc      2014-04-22 22:44:17.153567150 -07=
00
> -+++ gcc-4.9.0/gcc/config.gcc   2014-04-23 23:54:31.427357051 -0700
> -@@ -594,7 +594,7 @@
> - esac
> -
> - # Common C libraries.
> --tm_defines=3D"$tm_defines LIBC_GLIBC=3D1 LIBC_UCLIBC=3D2 LIBC_BIONIC=3D=
3"
> -+tm_defines=3D"$tm_defines LIBC_GLIBC=3D1 LIBC_UCLIBC=3D2 LIBC_BIONIC=3D=
3 LIBC_MUSL=3D4"
> -
> - # 32-bit x86 processors supported by --with-arch=3D.  Each processor
> - # MUST be separated by exactly one space.
> -@@ -719,6 +719,9 @@
> -     *-*-*uclibc*)
> -       tm_defines=3D"$tm_defines DEFAULT_LIBC=3DLIBC_UCLIBC"
> -       ;;
> -+    *-*-*musl*)
> -+      tm_defines=3D"$tm_defines DEFAULT_LIBC=3DLIBC_MUSL"
> -+      ;;
> -     *)
> -       tm_defines=3D"$tm_defines DEFAULT_LIBC=3DLIBC_GLIBC"
> -       ;;
> -@@ -2328,6 +2331,11 @@
> -           powerpc*-*-linux*paired*)
> -               tm_file=3D"${tm_file} rs6000/750cl.h" ;;
> -       esac
> -+        case ${target} in
> -+          *-linux*-musl*)
> -+              enable_secureplt=3Dyes ;;
> -+      esac
> -+
> -       if test x${enable_secureplt} =3D xyes; then
> -               tm_file=3D"rs6000/secureplt.h ${tm_file}"
> -       fi
> -Index: gcc-4.9.0/gcc/config/linux.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.9.0.orig/gcc/config/linux.h  2014-01-02 14:23:26.000000000 -08=
00
> -+++ gcc-4.9.0/gcc/config/linux.h       2014-04-24 00:11:29.034028895 -07=
00
> -@@ -32,10 +32,12 @@
> - #define OPTION_GLIBC  (DEFAULT_LIBC =3D=3D LIBC_GLIBC)
> - #define OPTION_UCLIBC (DEFAULT_LIBC =3D=3D LIBC_UCLIBC)
> - #define OPTION_BIONIC (DEFAULT_LIBC =3D=3D LIBC_BIONIC)
> -+#define OPTION_MUSL   (DEFAULT_LIBC =3D=3D LIBC_MUSL)
> - #else
> - #define OPTION_GLIBC  (linux_libc =3D=3D LIBC_GLIBC)
> - #define OPTION_UCLIBC (linux_libc =3D=3D LIBC_UCLIBC)
> - #define OPTION_BIONIC (linux_libc =3D=3D LIBC_BIONIC)
> -+#define OPTION_MUSL   (linux_libc =3D=3D LIBC_MUSL)
> - #endif
> -
> - #define GNU_USER_TARGET_OS_CPP_BUILTINS()                     \
> -@@ -53,18 +55,21 @@
> -    uClibc or Bionic is the default C library and whether
> -    -muclibc or -mglibc or -mbionic has been passed to change the defaul=
t.  */
> -
> --#define CHOOSE_DYNAMIC_LINKER1(LIBC1, LIBC2, LIBC3, LD1, LD2, LD3)    \
> --  "%{" LIBC2 ":" LD2 ";:%{" LIBC3 ":" LD3 ";:" LD1 "}}"
> -+#define CHOOSE_DYNAMIC_LINKER1(LIBC1, LIBC2, LIBC3, LIBC4, LD1, LD2, LD=
3, LD4)        \
> -+  "%{" LIBC2 ":" LD2 ";:%{" LIBC3 ":" LD3 ";:%{" LIBC4 ":" LD4 ";:" LD1=
 "}}}"
> -
> - #if DEFAULT_LIBC =3D=3D LIBC_GLIBC
> --#define CHOOSE_DYNAMIC_LINKER(G, U, B) \
> --  CHOOSE_DYNAMIC_LINKER1 ("mglibc", "muclibc", "mbionic", G, U, B)
> -+#define CHOOSE_DYNAMIC_LINKER(G, U, B, M) \
> -+  CHOOSE_DYNAMIC_LINKER1 ("mglibc", "muclibc", "mbionic", "mmusl", G, U=
, B, M)
> - #elif DEFAULT_LIBC =3D=3D LIBC_UCLIBC
> --#define CHOOSE_DYNAMIC_LINKER(G, U, B) \
> --  CHOOSE_DYNAMIC_LINKER1 ("muclibc", "mglibc", "mbionic", U, G, B)
> -+#define CHOOSE_DYNAMIC_LINKER(G, U, B, M) \
> -+  CHOOSE_DYNAMIC_LINKER1 ("muclibc", "mglibc", "mbionic", "mmusl", U, G=
, B, M)
> - #elif DEFAULT_LIBC =3D=3D LIBC_BIONIC
> --#define CHOOSE_DYNAMIC_LINKER(G, U, B) \
> --  CHOOSE_DYNAMIC_LINKER1 ("mbionic", "mglibc", "muclibc", B, G, U)
> -+#define CHOOSE_DYNAMIC_LINKER(G, U, B, M) \
> -+  CHOOSE_DYNAMIC_LINKER1 ("mbionic", "mglibc", "muclibc", "mmusl", B, G=
, U, M)
> -+#elif DEFAULT_LIBC =3D=3D LIBC_MUSL
> -+#define CHOOSE_DYNAMIC_LINKER(G, U, B, M) \
> -+  CHOOSE_DYNAMIC_LINKER1 ("mmusl", "mglibc", "muclibc", "mbionic", M, G=
, U, B)
> - #else
> - #error "Unsupported DEFAULT_LIBC"
> - #endif /* DEFAULT_LIBC */
> -@@ -84,16 +89,16 @@
> -
> - #define GNU_USER_DYNAMIC_LINKER                                        =
       \
> -   CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKER, UCLIBC_DYNAMIC_LINKER, \
> --                       BIONIC_DYNAMIC_LINKER)
> -+                       BIONIC_DYNAMIC_LINKER, MUSL_DYNAMIC_LINKER)
> - #define GNU_USER_DYNAMIC_LINKER32                                     \
> -   CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKER32, UCLIBC_DYNAMIC_LINKER3=
2, \
> --                       BIONIC_DYNAMIC_LINKER32)
> -+                       BIONIC_DYNAMIC_LINKER32, MUSL_DYNAMIC_LINKER32)
> - #define GNU_USER_DYNAMIC_LINKER64                                     \
> -   CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKER64, UCLIBC_DYNAMIC_LINKER6=
4, \
> --                       BIONIC_DYNAMIC_LINKER64)
> -+                       BIONIC_DYNAMIC_LINKER64, MUSL_DYNAMIC_LINKER64)
> - #define GNU_USER_DYNAMIC_LINKERX32                                    \
> -   CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKERX32, UCLIBC_DYNAMIC_LINKER=
X32, \
> --                       BIONIC_DYNAMIC_LINKERX32)
> -+                       BIONIC_DYNAMIC_LINKERX32, MUSL_DYNAMIC_LINKERX32=
)
> -
> - /* Whether we have Bionic libc runtime */
> - #undef TARGET_HAS_BIONIC
> -@@ -127,3 +132,74 @@
> - # define TARGET_LIBC_HAS_FUNCTION linux_libc_has_function
> -
> - #endif
> -+
> -+/* musl avoids problematic includes by rearranging the include director=
ies.
> -+ * Unfortunately, this is mostly duplicated from cppdefault.c */
> -+#if DEFAULT_LIBC =3D=3D LIBC_MUSL
> -+#define INCLUDE_DEFAULTS_MUSL_GPP                     \
> -+    { GPLUSPLUS_INCLUDE_DIR, "G++", 1, 1,             \
> -+      GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 0 },         \
> -+    { GPLUSPLUS_TOOL_INCLUDE_DIR, "G++", 1, 1,                \
> -+      GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 1 },         \
> -+    { GPLUSPLUS_BACKWARD_INCLUDE_DIR, "G++", 1, 1,    \
> -+      GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 0 },
> -+
> -+#ifdef LOCAL_INCLUDE_DIR
> -+#define INCLUDE_DEFAULTS_MUSL_LOCAL                   \
> -+    { LOCAL_INCLUDE_DIR, 0, 0, 1, 1, 2 },             \
> -+    { LOCAL_INCLUDE_DIR, 0, 0, 1, 1, 0 },
> -+#else
> -+#define INCLUDE_DEFAULTS_MUSL_LOCAL
> -+#endif
> -+
> -+#ifdef PREFIX_INCLUDE_DIR
> -+#define INCLUDE_DEFAULTS_MUSL_PREFIX                  \
> -+    { PREFIX_INCLUDE_DIR, 0, 0, 1, 0, 0},
> -+#else
> -+#define INCLUDE_DEFAULTS_MUSL_PREFIX
> -+#endif
> -+
> -+#ifdef CROSS_INCLUDE_DIR
> -+#define INCLUDE_DEFAULTS_MUSL_CROSS                   \
> -+    { CROSS_INCLUDE_DIR, "GCC", 0, 0, 0, 0},
> -+#else
> -+#define INCLUDE_DEFAULTS_MUSL_CROSS
> -+#endif
> -+
> -+#ifdef TOOL_INCLUDE_DIR
> -+#define INCLUDE_DEFAULTS_MUSL_TOOL                    \
> -+    { TOOL_INCLUDE_DIR, "BINUTILS", 0, 1, 0, 0},
> -+#else
> -+#define INCLUDE_DEFAULTS_MUSL_TOOL
> -+#endif
> -+
> -+#ifdef NATIVE_SYSTEM_HEADER_DIR
> -+#define INCLUDE_DEFAULTS_MUSL_NATIVE                  \
> -+    { NATIVE_SYSTEM_HEADER_DIR, 0, 0, 0, 1, 2 },      \
> -+    { NATIVE_SYSTEM_HEADER_DIR, 0, 0, 0, 1, 0 },
> -+#else
> -+#define INCLUDE_DEFAULTS_MUSL_NATIVE
> -+#endif
> -+
> -+#if defined (CROSS_DIRECTORY_STRUCTURE) && !defined (TARGET_SYSTEM_ROOT=
)
> -+# undef INCLUDE_DEFAULTS_MUSL_LOCAL
> -+# define INCLUDE_DEFAULTS_MUSL_LOCAL
> -+# undef INCLUDE_DEFAULTS_MUSL_NATIVE
> -+# define INCLUDE_DEFAULTS_MUSL_NATIVE
> -+#else
> -+# undef INCLUDE_DEFAULTS_MUSL_CROSS
> -+# define INCLUDE_DEFAULTS_MUSL_CROSS
> -+#endif
> -+
> -+#undef INCLUDE_DEFAULTS
> -+#define INCLUDE_DEFAULTS                              \
> -+  {                                                   \
> -+    INCLUDE_DEFAULTS_MUSL_GPP                         \
> -+    INCLUDE_DEFAULTS_MUSL_PREFIX                      \
> -+    INCLUDE_DEFAULTS_MUSL_CROSS                               \
> -+    INCLUDE_DEFAULTS_MUSL_TOOL                                \
> -+    INCLUDE_DEFAULTS_MUSL_NATIVE                      \
> -+    { GCC_INCLUDE_DIR, "GCC", 0, 1, 0, 0 },           \
> -+    { 0, 0, 0, 0, 0, 0 }                              \
> -+  }
> -+#endif
> -Index: gcc-4.9.0/gcc/config/linux.opt
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.9.0.orig/gcc/config/linux.opt        2014-01-02 14:23:26.00000=
0000 -0800
> -+++ gcc-4.9.0/gcc/config/linux.opt     2014-04-22 22:44:17.280233817 -07=
00
> -@@ -30,3 +30,7 @@
> - muclibc
> - Target Report RejectNegative Var(linux_libc,LIBC_UCLIBC) Negative(mbion=
ic)
> - Use uClibc C library
> -+
> -+mmusl
> -+Target Report RejectNegative Var(linux_libc,LIBC_MUSL) Negative(mglibc)
> -+Use musl C library
> -Index: gcc-4.9.0/gcc/ginclude/stddef.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.9.0.orig/gcc/ginclude/stddef.h       2014-01-02 14:23:26.00000=
0000 -0800
> -+++ gcc-4.9.0/gcc/ginclude/stddef.h    2014-04-22 22:44:17.280233817 -07=
00
> -@@ -181,6 +181,7 @@
> - #ifndef _GCC_SIZE_T
> - #ifndef _SIZET_
> - #ifndef __size_t
> -+#ifndef __DEFINED_size_t /* musl */
> - #define __size_t__    /* BeOS */
> - #define __SIZE_T__    /* Cray Unicos/Mk */
> - #define _SIZE_T
> -@@ -197,6 +198,7 @@
> - #define ___int_size_t_h
> - #define _GCC_SIZE_T
> - #define _SIZET_
> -+#define __DEFINED_size_t /* musl */
> - #if (defined (__FreeBSD__) && (__FreeBSD__ >=3D 5)) \
> -   || defined(__FreeBSD_kernel__)
> - /* __size_t is a typedef on FreeBSD 5, must not trash it. */
> -@@ -214,6 +216,7 @@
> - typedef long ssize_t;
> - #endif /* __BEOS__ */
> - #endif /* !(defined (__GNUG__) && defined (size_t)) */
> -+#endif /* __DEFINED_size_t */
> - #endif /* __size_t */
> - #endif /* _SIZET_ */
> - #endif /* _GCC_SIZE_T */
> -Index: gcc-4.9.0/gcc/config/rs6000/secureplt.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.9.0.orig/gcc/config/rs6000/secureplt.h       2014-01-02 14:23:=
26.000000000 -0800
> -+++ gcc-4.9.0/gcc/config/rs6000/secureplt.h    2014-04-23 23:55:15.11402=
4175 -0700
> -@@ -18,3 +18,4 @@
> - <http://www.gnu.org/licenses/>.  */
> -
> - #define CC1_SECURE_PLT_DEFAULT_SPEC "-msecure-plt"
> -+#define LINK_SECURE_PLT_DEFAULT_SPEC "--secure-plt"
> -Index: gcc-4.9.0/gcc/config/rs6000/sysv4.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.9.0.orig/gcc/config/rs6000/sysv4.h   2014-04-23 23:52:13.85402=
3015 -0700
> -+++ gcc-4.9.0/gcc/config/rs6000/sysv4.h        2014-04-24 00:10:55.55069=
5334 -0700
> -@@ -538,6 +538,10 @@
> - #define CC1_SECURE_PLT_DEFAULT_SPEC ""
> - #endif
> -
> -+#ifndef LINK_SECURE_PLT_DEFAULT_SPEC
> -+#define LINK_SECURE_PLT_DEFAULT_SPEC ""
> -+#endif
> -+
> - /* Pass -G xxx to the compiler.  */
> - #define       CC1_SPEC "%{G*} %(cc1_cpu)" \
> - "%{meabi: %{!mcall-*: -mcall-sysv }} \
> -@@ -585,7 +589,8 @@
> -
> - /* Override the default target of the linker.  */
> - #define       LINK_TARGET_SPEC \
> --  ENDIAN_SELECT("", " --oformat elf32-powerpcle", "")
> -+  ENDIAN_SELECT("", " --oformat elf32-powerpcle", "") \
> -+  "%{!mbss-plt: %{!msecure-plt: %(link_secure_plt_default)}}"
> -
> - /* Any specific OS flags.  */
> - #define LINK_OS_SPEC "\
> -@@ -894,6 +899,7 @@
> -   { "link_os_openbsd",                LINK_OS_OPENBSD_SPEC },          =
       \
> -   { "link_os_default",                LINK_OS_DEFAULT_SPEC },          =
       \
> -   { "cc1_secure_plt_default", CC1_SECURE_PLT_DEFAULT_SPEC },          \
> -+  { "link_secure_plt_default",        LINK_SECURE_PLT_DEFAULT_SPEC },  =
       \
> -   { "cpp_os_ads",             CPP_OS_ADS_SPEC },                      \
> -   { "cpp_os_yellowknife",     CPP_OS_YELLOWKNIFE_SPEC },              \
> -   { "cpp_os_mvme",            CPP_OS_MVME_SPEC },                     \
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0068-musl-dynamic-linker.p=
atch b/meta/recipes-devtools/gcc/gcc-4.9/0068-musl-dynamic-linker.patch
> deleted file mode 100644
> index 605ac66..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.9/0068-musl-dynamic-linker.patch
> +++ /dev/null
> @@ -1,205 +0,0 @@
> -# HG changeset patch
> -# Parent 6738fd6f6fcc2a72f2ba527bda3325642af26885
> -Support for arm-linux-musl.
> -Upstream-Status: Backport [partial]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -
> -Index: gcc-4.9.2/gcc/config/arm/linux-eabi.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.9.2.orig/gcc/config/arm/linux-eabi.h
> -+++ gcc-4.9.2/gcc/config/arm/linux-eabi.h
> -@@ -81,6 +81,23 @@
> - #undef TARGET_FIX_V4BX_SPEC
> - #define TARGET_FIX_V4BX_SPEC "%{mcpu=3Darm8|mcpu=3Darm810|mcpu=3Dstrong=
arm*|march=3Darmv4: --fix-v4bx}"
> -
> -+/* For ARM musl currently supports four dynamic linkers:
> -+   - ld-musl-arm.so.1 - for the EABI-derived soft-float ABI
> -+   - ld-musl-armhf.so.1 - for the EABI-derived hard-float ABI
> -+   - ld-musl-armeb.so.1 - for the EABI-derived soft-float ABI, EB
> -+   - ld-musl-armebhf.so.1 - for the EABI-derived hard-float ABI, EB
> -+   musl does not support the legacy OABI mode.
> -+   All the dynamic linkers live in /lib.
> -+   We default to soft-float, EL. */
> -+#undef  MUSL_DYNAMIC_LINKER
> -+#if TARGET_BIG_ENDIAN_DEFAULT
> -+#define MUSL_DYNAMIC_LINKER_E "%{mlittle-endian:;:eb}"
> -+#else
> -+#define MUSL_DYNAMIC_LINKER_E "%{mbig-endian:eb}"
> -+#endif
> -+#define MUSL_DYNAMIC_LINKER \
> -+  SYSTEMLIBS_DIR "ld-musl-arm" MUSL_DYNAMIC_LINKER_E "%{mfloat-abi=3Dha=
rd:hf}.so.1"
> -+
> - /* At this point, bpabi.h will have clobbered LINK_SPEC.  We want to
> -    use the GNU/Linux version, not the generic BPABI version.  */
> - #undef  LINK_SPEC
> -Index: gcc-4.9.2/libitm/config/arm/hwcap.cc
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.9.2.orig/libitm/config/arm/hwcap.cc
> -+++ gcc-4.9.2/libitm/config/arm/hwcap.cc
> -@@ -40,7 +40,11 @@ int GTM_hwcap HIDDEN =3D 0
> -
> - #ifdef __linux__
> - #include <unistd.h>
> -+#ifdef __GLIBC__
> - #include <sys/fcntl.h>
> -+#else
> -+#include <fcntl.h>
> -+#endif
> - #include <elf.h>
> -
> - static void __attribute__((constructor))
> -Index: gcc-4.9.2/gcc/config/i386/linux.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.9.2.orig/gcc/config/i386/linux.h
> -+++ gcc-4.9.2/gcc/config/i386/linux.h
> -@@ -21,3 +21,4 @@ along with GCC; see the file COPYING3.
> -
> - #define GNU_USER_LINK_EMULATION "elf_i386"
> - #define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux.so.2"
> -+#define MUSL_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-musl-i386.so.1"
> -Index: gcc-4.9.2/gcc/config/i386/linux64.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.9.2.orig/gcc/config/i386/linux64.h
> -+++ gcc-4.9.2/gcc/config/i386/linux64.h
> -@@ -30,3 +30,8 @@ see the files COPYING3 and COPYING.RUNTI
> - #define GLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-linux.so.2"
> - #define GLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld-linux-x86-64.so.2"
> - #define GLIBC_DYNAMIC_LINKERX32 SYSTEMLIBS_DIR "ld-linux-x32.so.2"
> -+
> -+#define MUSL_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-musl-i386.so.1"
> -+#define MUSL_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld-musl-x86_64.so.1"
> -+#define MUSL_DYNAMIC_LINKERX32 SYSTEMLIBS_DIR "ld-musl-x32.so.1"
> -+
> -Index: gcc-4.9.2/gcc/config/mips/linux.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.9.2.orig/gcc/config/mips/linux.h
> -+++ gcc-4.9.2/gcc/config/mips/linux.h
> -@@ -23,3 +23,6 @@ along with GCC; see the file COPYING3.
> - #undef UCLIBC_DYNAMIC_LINKER
> - #define UCLIBC_DYNAMIC_LINKER \
> -   "%{mnan=3D2008:" SYSTEMLIBS_DIR "ld-uClibc-mipsn8.so.0;:" SYSTEMLIBS_=
DIR "ld-uClibc.so.0}"
> -+
> -+#define MUSL_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-musl-mips.so.1"
> -+
> -Index: gcc-4.9.2/gcc/config/mips/linux64.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.9.2.orig/gcc/config/mips/linux64.h
> -+++ gcc-4.9.2/gcc/config/mips/linux64.h
> -@@ -39,6 +39,11 @@ along with GCC; see the file COPYING3.
> -   "%{mnan=3D2008:" SYSTEMLIBS_DIR "ld-uClibc-mipsn8.so.0;:" SYSTEMLIBS_=
DIR "ld-uClibc.so.0}"
> -
> - #define BIONIC_DYNAMIC_LINKERN32 "/system/bin/linker32"
> -+
> -+#define MUSL_DYNAMIC_LINKERN32 SYSTEMLIBS_DIR "ld-musl-mips.so.1"
> -+#define MUSL_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-musl-mips.so.1"
> -+#define MUSL_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld-musl-mips.so.1"
> -+
> - #define GNU_USER_DYNAMIC_LINKERN32 \
> -   CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKERN32, UCLIBC_DYNAMIC_LINKER=
N32, \
> --                       BIONIC_DYNAMIC_LINKERN32)
> -+                       BIONIC_DYNAMIC_LINKERN32, MUSL_DYNAMIC_LINKERN32=
)
> -Index: gcc-4.9.2/gcc/config/rs6000/linux64.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.9.2.orig/gcc/config/rs6000/linux64.h
> -+++ gcc-4.9.2/gcc/config/rs6000/linux64.h
> -@@ -375,17 +375,22 @@ extern int dot_symbols;
> - #endif
> - #define UCLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-uClibc.so.0"
> - #define UCLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld64-uClibc.so.0"
> -+#define MUSL_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-musl-powerpc.so.1"
> -+#define MUSL_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld-musl-powerpc64.so.1"
> -+
> - #if DEFAULT_LIBC =3D=3D LIBC_UCLIBC
> --#define CHOOSE_DYNAMIC_LINKER(G, U) "%{mglibc:" G ";:" U "}"
> -+#define CHOOSE_DYNAMIC_LINKER(G, U, M) "%{mglibc:" G ";:%{mmusl:" M ";:=
" U "}}"
> - #elif DEFAULT_LIBC =3D=3D LIBC_GLIBC
> --#define CHOOSE_DYNAMIC_LINKER(G, U) "%{muclibc:" U ";:" G "}"
> -+#define CHOOSE_DYNAMIC_LINKER(G, U, M) "%{muclibc:" U ";:%{mmusl:" M ";=
:" G "}}"
> -+#elif DEFAULT_LIBC =3D=3D LIBC_MUSL
> -+#define CHOOSE_DYNAMIC_LINKER(G, U, M) "%{mglibc:" G ";:%{muclibc:" U "=
;:" M "}}"
> - #else
> - #error "Unsupported DEFAULT_LIBC"
> - #endif
> - #define GNU_USER_DYNAMIC_LINKER32 \
> --  CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKER32, UCLIBC_DYNAMIC_LINKER3=
2)
> -+  CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKER32, UCLIBC_DYNAMIC_LINKER3=
2, MUSL_DYNAMIC_LINKER32)
> - #define GNU_USER_DYNAMIC_LINKER64 \
> --  CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKER64, UCLIBC_DYNAMIC_LINKER6=
4)
> -+  CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKER64, UCLIBC_DYNAMIC_LINKER6=
4, MUSL_DYNAMIC_LINKER64)
> -
> - #undef  DEFAULT_ASM_ENDIAN
> - #if (TARGET_DEFAULT & MASK_LITTLE_ENDIAN)
> -Index: gcc-4.9.2/gcc/config/rs6000/sysv4.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.9.2.orig/gcc/config/rs6000/sysv4.h
> -+++ gcc-4.9.2/gcc/config/rs6000/sysv4.h
> -@@ -768,15 +768,19 @@ ENDIAN_SELECT(" -mbig", " -mlittle", DEF
> -
> - #define GLIBC_DYNAMIC_LINKER "/lib/ld.so.1"
> - #define UCLIBC_DYNAMIC_LINKER "/lib/ld-uClibc.so.0"
> -+#define MUSL_DYNAMIC_LINKER "/lib/ld-musl-powerpc.so.1"
> -+
> - #if DEFAULT_LIBC =3D=3D LIBC_UCLIBC
> --#define CHOOSE_DYNAMIC_LINKER(G, U) "%{mglibc:" G ";:" U "}"
> -+#define CHOOSE_DYNAMIC_LINKER(G, U, M) "%{mglibc:" G ";:%{mmusl:" M ";:=
" U "}}"
> -+#elif DEFAULT_LIBC =3D=3D LIBC_MUSL
> -+#define CHOOSE_DYNAMIC_LINKER(G, U, M) "%{mglibc:" G ";:%{muclibc:" U "=
;:" M "}}"
> - #elif !defined (DEFAULT_LIBC) || DEFAULT_LIBC =3D=3D LIBC_GLIBC
> --#define CHOOSE_DYNAMIC_LINKER(G, U) "%{muclibc:" U ";:" G "}"
> -+#define CHOOSE_DYNAMIC_LINKER(G, U, M) "%{muclibc:" U ";:%{mmusl:" M ";=
:" G "}}"
> - #else
> - #error "Unsupported DEFAULT_LIBC"
> - #endif
> - #define GNU_USER_DYNAMIC_LINKER \
> --  CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKER, UCLIBC_DYNAMIC_LINKER)
> -+  CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKER, UCLIBC_DYNAMIC_LINKER, M=
USL_DYNAMIC_LINKER)
> -
> - #define LINK_OS_LINUX_SPEC "-m elf32ppclinux %{!shared: %{!static: \
> -   %{rdynamic:-export-dynamic} \
> -Index: gcc-4.9.2/libitm/config/linux/x86/tls.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.9.2.orig/libitm/config/linux/x86/tls.h
> -+++ gcc-4.9.2/libitm/config/linux/x86/tls.h
> -@@ -25,16 +25,19 @@
> - #ifndef LIBITM_X86_TLS_H
> - #define LIBITM_X86_TLS_H 1
> -
> --#if defined(__GLIBC_PREREQ) && __GLIBC_PREREQ(2, 10)
> -+#if defined(__GLIBC_PREREQ)
> -+#if __GLIBC_PREREQ(2, 10)
> - /* Use slots in the TCB head rather than __thread lookups.
> -    GLIBC has reserved words 10 through 13 for TM.  */
> - #define HAVE_ARCH_GTM_THREAD 1
> - #define HAVE_ARCH_GTM_THREAD_DISP 1
> - #endif
> -+#endif
> -
> - #include "config/generic/tls.h"
> -
> --#if defined(__GLIBC_PREREQ) && __GLIBC_PREREQ(2, 10)
> -+#if defined(__GLIBC_PREREQ)
> -+#if __GLIBC_PREREQ(2, 10)
> - namespace GTM HIDDEN {
> -
> - #ifdef __x86_64__
> -@@ -101,5 +104,6 @@ static inline void set_abi_disp(struct a
> -
> - } // namespace GTM
> - #endif /* >=3D GLIBC 2.10 */
> -+#endif
> -
> - #endif // LIBITM_X86_TLS_H
> -Index: gcc-4.9.2/gcc/config/aarch64/aarch64-linux.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.9.2.orig/gcc/config/aarch64/aarch64-linux.h
> -+++ gcc-4.9.2/gcc/config/aarch64/aarch64-linux.h
> -@@ -25,6 +25,8 @@
> -
> - #define CPP_SPEC "%{pthread:-D_REENTRANT}"
> -
> -+#define MUSL_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-musl-aarch64.so.1"
> -+
> - #define LINUX_TARGET_LINK_SPEC  "%{h*}                \
> -    %{static:-Bstatic}                         \
> -    %{shared:-shared}                          \
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0069-musl-no-fixincludes.p=
atch b/meta/recipes-devtools/gcc/gcc-4.9/0069-musl-no-fixincludes.patch
> deleted file mode 100644
> index e2b18a4..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.9/0069-musl-no-fixincludes.patch
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -# HG changeset patch
> -# Parent 600a8a422ccaf5627ad1f5a138e7398df2b9e9d8
> -Get rid of ever-broken fixincludes on musl.
> -Upstream-Status: Pending
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -
> -Index: gcc-4.9-20140316/fixincludes/mkfixinc.sh
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.9-20140316.orig/fixincludes/mkfixinc.sh
> -+++ gcc-4.9-20140316/fixincludes/mkfixinc.sh
> -@@ -19,7 +19,8 @@ case $machine in
> -     powerpc-*-eabi*    | \
> -     powerpc-*-rtems*   | \
> -     powerpcle-*-eabisim* | \
> --    powerpcle-*-eabi* )
> -+    powerpcle-*-eabi* | \
> -+    *-musl* )
> -       #  IF there is no include fixing,
> -       #  THEN create a no-op fixer and exit
> -       (echo "#! /bin/sh" ; echo "exit 0" ) > ${target}
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0070-libstdc-musl.patch b/=
meta/recipes-devtools/gcc/gcc-4.9/0070-libstdc-musl.patch
> deleted file mode 100644
> index 048e481..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.9/0070-libstdc-musl.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -Upstream-Status: Pending
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Index: gcc-4.9-20140316/libstdc++-v3/configure.host
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.9-20140316.orig/libstdc++-v3/configure.host  2014-03-26 01:12:=
19.466008193 -0700
> -+++ gcc-4.9-20140316/libstdc++-v3/configure.host       2014-03-26 01:43:=
48.222684357 -0700
> -@@ -264,14 +264,24 @@
> -     os_include_dir=3D"os/bsd/freebsd"
> -     ;;
> -   gnu* | linux* | kfreebsd*-gnu | knetbsd*-gnu)
> -+    # check for musl by target
> -+    case "${host_os}" in
> -+      *-musl*)
> -+        os_include_dir=3D"os/generic"
> -+        ;;
> -+      *)
> -     if [ "$uclibc" =3D "yes" ]; then
> -       os_include_dir=3D"os/uclibc"
> -     elif [ "$bionic" =3D "yes" ]; then
> -       os_include_dir=3D"os/bionic"
> -+    elif [ "$musl" =3D "yes" ]; then
> -+      os_include_dir=3D"os/generic"
> -     else
> -       os_include_dir=3D"os/gnu-linux"
> -     fi
> -     ;;
> -+    esac
> -+    ;;
> -   hpux*)
> -     os_include_dir=3D"os/hpux"
> -     ;;
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0071-Ignore-fdebug-prefix-=
map-in-producer-string-by-Danie.patch b/meta/recipes-devtools/gcc/gcc-4.9/0=
071-Ignore-fdebug-prefix-map-in-producer-string-by-Danie.patch
> deleted file mode 100644
> index e8f79b5..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.9/0071-Ignore-fdebug-prefix-map-in-=
producer-string-by-Danie.patch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -From 32593b38082ea65f4c82159254adf1e0dc2423be Mon Sep 17 00:00:00 2001
> -From: bernds <bernds@138bc75d-0d04-0410-961f-82ee72b054a4>
> -Date: Tue, 16 Feb 2016 03:15:15 -0500
> -Subject: [PATCH] Ignore -fdebug-prefix-map in producer string (by Daniel=
 Kahn
> - Gillmor)
> -
> -* dwarf2out.c (gen_producer_string): Ignore -fdebug-prefix-map.
> -
> -git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@231835 138bc75d-0d04-041=
0-961f-82ee72b054a4
> -
> -Upstream-Status: Backport
> -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ----
> - gcc/dwarf2out.c | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/gcc/dwarf2out.c b/gcc/dwarf2out.c
> -index 3614c10..526f114 100644
> ---- a/gcc/dwarf2out.c
> -+++ b/gcc/dwarf2out.c
> -@@ -19670,6 +19670,7 @@ gen_producer_string (void)
> -       case OPT_fpreprocessed:
> -       case OPT_fltrans_output_list_:
> -       case OPT_fresolution_:
> -+      case OPT_fdebug_prefix_map_:
> -       /* Ignore these.  */
> -       continue;
> -       default:
> ---
> -1.9.1
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0072-support-ffile-prefix-=
map.patch b/meta/recipes-devtools/gcc/gcc-4.9/0072-support-ffile-prefix-map=
.patch
> deleted file mode 100644
> index 9809a6a..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.9/0072-support-ffile-prefix-map.pat=
ch
> +++ /dev/null
> @@ -1,284 +0,0 @@
> -From e863be798ed13312a0faf0b961275f211a8123ab Mon Sep 17 00:00:00 2001
> -From: Hongxu Jia <hongxu.jia@windriver.com>
> -Date: Thu, 17 Mar 2016 00:32:17 -0400
> -Subject: [PATCH] gcc/libcpp: support -ffile-prefix-map=3D<old>=3D<new>
> -
> -Similar -fdebug-prefix-map, add option -ffile-prefix-map to map one
> -directory name (old) to another (new) in __FILE__, __BASE_FILE__ and
> -__builtin_FILE ().
> -
> -https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D70268
> -
> -Upstream-Status: Submitted [gcc-patches@gcc.gnu.org]
> -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ----
> - gcc/c-family/c-opts.c     |  6 ++++
> - gcc/c-family/c.opt        |  4 +++
> - gcc/dwarf2out.c           |  1 +
> - gcc/gimplify.c            |  2 ++
> - libcpp/Makefile.in        | 10 +++---
> - libcpp/file-map.c         | 92 ++++++++++++++++++++++++++++++++++++++++=
+++++++
> - libcpp/include/file-map.h | 30 ++++++++++++++++
> - libcpp/macro.c            |  2 ++
> - 8 files changed, 142 insertions(+), 5 deletions(-)
> - create mode 100644 libcpp/file-map.c
> - create mode 100644 libcpp/include/file-map.h
> -
> -diff --git a/gcc/c-family/c-opts.c b/gcc/c-family/c-opts.c
> -index dd5fd23..9c004a1 100644
> ---- a/gcc/c-family/c-opts.c
> -+++ b/gcc/c-family/c-opts.c
> -@@ -36,6 +36,7 @@ along with GCC; see the file COPYING3.  If not see
> - #include "options.h"
> - #include "plugin.h"           /* For PLUGIN_INCLUDE_FILE event.  */
> - #include "mkdeps.h"
> -+#include "file-map.h"
> - #include "c-target.h"
> - #include "tm.h"                       /* For BYTES_BIG_ENDIAN,
> -                                  DOLLARS_IN_IDENTIFIERS,
> -@@ -553,6 +554,11 @@ c_common_handle_option (size_t scode, const char *a=
rg, int value,
> -       cpp_opts->narrow_charset =3D arg;
> -       break;
> -
> -+    case OPT_ffile_prefix_map_:
> -+      if (add_file_prefix_map (arg) < 0)
> -+        error ("invalid argument %qs to -ffile-prefix-map", arg);
> -+      break;
> -+
> -     case OPT_fwide_exec_charset_:
> -       cpp_opts->wide_charset =3D arg;
> -       break;
> -diff --git a/gcc/c-family/c.opt b/gcc/c-family/c.opt
> -index f295805..3a99662 100644
> ---- a/gcc/c-family/c.opt
> -+++ b/gcc/c-family/c.opt
> -@@ -928,6 +928,10 @@ fexec-charset=3D
> - C ObjC C++ ObjC++ Joined RejectNegative
> - -fexec-charset=3D<cset> Convert all strings and character constants to =
character set <cset>
> -
> -+ffile-prefix-map=3D
> -+C ObjC C++ ObjC++ Joined RejectNegative
> -+-ffile-prefix-map=3D<old=3Dnew>   Map one directory name to another in =
__FILE__, __BASE_FILE__ and __builtin_FILE ()
> -+
> - fextended-identifiers
> - C ObjC C++ ObjC++
> - Permit universal character names (\\u and \\U) in identifiers
> -diff --git a/gcc/dwarf2out.c b/gcc/dwarf2out.c
> -index 99bf6e2..3e58cfd 100644
> ---- a/gcc/dwarf2out.c
> -+++ b/gcc/dwarf2out.c
> -@@ -19199,6 +19199,7 @@ gen_producer_string (void)
> -       case OPT_fltrans_output_list_:
> -       case OPT_fresolution_:
> -       case OPT_fdebug_prefix_map_:
> -+      case OPT_ffile_prefix_map_:
> -       /* Ignore these.  */
> -       continue;
> -       default:
> -diff --git a/gcc/gimplify.c b/gcc/gimplify.c
> -index 89e7334..a7a97c0 100644
> ---- a/gcc/gimplify.c
> -+++ b/gcc/gimplify.c
> -@@ -59,6 +59,7 @@ along with GCC; see the file COPYING3.  If not see
> - #include "omp-low.h"
> - #include "gimple-low.h"
> - #include "cilk.h"
> -+#include "file-map.h"
> -
> - #include "langhooks-def.h"    /* FIXME: for lhd_set_decl_assembler_name=
 */
> - #include "tree-pass.h"                /* FIXME: only for PROP_gimple_an=
y */
> -@@ -2288,6 +2289,7 @@ gimplify_call_expr (tree *expr_p, gimple_seq *pre_=
p, bool want_value)
> -       case BUILT_IN_FILE:
> -       {
> -         expanded_location loc =3D expand_location (EXPR_LOCATION (*expr=
_p));
> -+        loc.file =3D remap_file_filename (loc.file);
> -         *expr_p =3D build_string_literal (strlen (loc.file) + 1, loc.fi=
le);
> -         return GS_OK;
> -       }
> -diff --git a/libcpp/Makefile.in b/libcpp/Makefile.in
> -index 5561c97..5017256 100644
> ---- a/libcpp/Makefile.in
> -+++ b/libcpp/Makefile.in
> -@@ -84,12 +84,12 @@ DEPMODE =3D $(CXXDEPMODE)
> -
> -
> - libcpp_a_OBJS =3D charset.o directives.o directives-only.o errors.o \
> --      expr.o files.o identifiers.o init.o lex.o line-map.o macro.o \
> --      mkdeps.o pch.o symtab.o traditional.o
> -+      expr.o file-map.o files.o identifiers.o init.o lex.o line-map.o \
> -+      macro.o mkdeps.o pch.o symtab.o traditional.o
> -
> - libcpp_a_SOURCES =3D charset.c directives.c directives-only.c errors.c =
\
> --      expr.c files.c identifiers.c init.c lex.c line-map.c macro.c \
> --      mkdeps.c pch.c symtab.c traditional.c
> -+      expr.c file-map.c files.c identifiers.c init.c lex.c line-map.c \
> -+      macro.c mkdeps.c pch.c symtab.c traditional.c
> -
> - all: libcpp.a $(USED_CATALOGS)
> -
> -@@ -263,7 +263,7 @@ po/$(PACKAGE).pot: $(libcpp_a_SOURCES)
> -
> - TAGS_SOURCES =3D $(libcpp_a_SOURCES) internal.h ucnid.h \
> -     include/line-map.h include/symtab.h include/cpp-id-data.h \
> --    include/cpplib.h include/mkdeps.h system.h
> -+    include/cpplib.h include/mkdeps.h system.h include/file-map.h
> -
> - TAGS: $(TAGS_SOURCES)
> -       cd $(srcdir) && etags $(TAGS_SOURCES)
> -diff --git a/libcpp/file-map.c b/libcpp/file-map.c
> -new file mode 100644
> -index 0000000..04e851b
> ---- /dev/null
> -+++ b/libcpp/file-map.c
> -@@ -0,0 +1,92 @@
> -+/* Map one directory name to another in __FILE__, __BASE_FILE__
> -+   and __builtin_FILE ().
> -+   Copyright (C) 2001-2016 Free Software Foundation, Inc.
> -+
> -+This program is free software; you can redistribute it and/or modify it
> -+under the terms of the GNU General Public License as published by the
> -+Free Software Foundation; either version 3, or (at your option) any
> -+later version.
> -+
> -+This program is distributed in the hope that it will be useful,
> -+but WITHOUT ANY WARRANTY; without even the implied warranty of
> -+MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> -+GNU General Public License for more details.
> -+
> -+You should have received a copy of the GNU General Public License
> -+along with this program; see the file COPYING3.  If not see
> -+<http://www.gnu.org/licenses/>.
> -+
> -+ In other words, you are welcome to use, share and improve this program=
.
> -+ You are forbidden to forbid anyone else to use, share and improve
> -+ what you give them.   Help stamp out software-hoarding!  */
> -+
> -+#include "config.h"
> -+#include "system.h"
> -+#include "file-map.h"
> -+
> -+/* Structure recording the mapping from source file and directory
> -+   names at compile time to __FILE__ */
> -+typedef struct file_prefix_map
> -+{
> -+  const char *old_prefix;
> -+  const char *new_prefix;
> -+  size_t old_len;
> -+  size_t new_len;
> -+  struct file_prefix_map *next;
> -+} file_prefix_map;
> -+
> -+/* Linked list of such structures.  */
> -+static file_prefix_map *file_prefix_maps;
> -+
> -+/* Record prefix mapping of __FILE__.  ARG is the argument to
> -+   -ffile-prefix-map and must be of the form OLD=3DNEW.  */
> -+int
> -+add_file_prefix_map (const char *arg)
> -+{
> -+  file_prefix_map *map;
> -+  const char *p;
> -+
> -+  p =3D strchr (arg, '=3D');
> -+  if (!p)
> -+  {
> -+      fprintf(stderr, "invalid argument %qs to -ffile-prefix-map", arg)=
;
> -+      return -1;
> -+  }
> -+  map =3D XNEW (file_prefix_map);
> -+  map->old_prefix =3D xstrndup (arg, p - arg);
> -+  map->old_len =3D p - arg;
> -+  p++;
> -+  map->new_prefix =3D xstrdup (p);
> -+  map->new_len =3D strlen (p);
> -+  map->next =3D file_prefix_maps;
> -+  file_prefix_maps =3D map;
> -+
> -+  return 0;
> -+}
> -+
> -+/* Perform user-specified mapping of __FILE__ prefixes.  Return
> -+   the new name corresponding to filename.  */
> -+
> -+const char *
> -+remap_file_filename (const char *filename)
> -+{
> -+  file_prefix_map *map;
> -+  char *s;
> -+  const char *name;
> -+  size_t name_len;
> -+
> -+  for (map =3D file_prefix_maps; map; map =3D map->next)
> -+    if (filename_ncmp (filename, map->old_prefix, map->old_len) =3D=3D =
0)
> -+      break;
> -+  if (!map)
> -+    return filename;
> -+  name =3D filename + map->old_len;
> -+  name_len =3D strlen (name) + 1;
> -+  s =3D (char *) alloca (name_len + map->new_len);
> -+  memcpy (s, map->new_prefix, map->new_len);
> -+  memcpy (s + map->new_len, name, name_len);
> -+
> -+  return xstrdup (s);
> -+}
> -+
> -+
> -diff --git a/libcpp/include/file-map.h b/libcpp/include/file-map.h
> -new file mode 100644
> -index 0000000..e6f8cbf
> ---- /dev/null
> -+++ b/libcpp/include/file-map.h
> -@@ -0,0 +1,30 @@
> -+/* Map one directory name to another in __FILE__, __BASE_FILE__
> -+   and __builtin_FILE ().
> -+   Copyright (C) 2001-2016 Free Software Foundation, Inc.
> -+
> -+This program is free software; you can redistribute it and/or modify it
> -+under the terms of the GNU General Public License as published by the
> -+Free Software Foundation; either version 3, or (at your option) any
> -+later version.
> -+
> -+This program is distributed in the hope that it will be useful,
> -+but WITHOUT ANY WARRANTY; without even the implied warranty of
> -+MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> -+GNU General Public License for more details.
> -+
> -+You should have received a copy of the GNU General Public License
> -+along with this program; see the file COPYING3.  If not see
> -+<http://www.gnu.org/licenses/>.
> -+
> -+ In other words, you are welcome to use, share and improve this program=
.
> -+ You are forbidden to forbid anyone else to use, share and improve
> -+ what you give them.   Help stamp out software-hoarding!  */
> -+
> -+#ifndef LIBCPP_FILE_MAP_H
> -+#define LIBCPP_FILE_MAP_H
> -+
> -+const char * remap_file_filename (const char *filename);
> -+
> -+int add_file_prefix_map (const char *arg);
> -+
> -+#endif /* !LIBCPP_FILE_MAP_H  */
> -diff --git a/libcpp/macro.c b/libcpp/macro.c
> -index 11e50f4..5c6f90e 100644
> ---- a/libcpp/macro.c
> -+++ b/libcpp/macro.c
> -@@ -26,6 +26,7 @@ along with this program; see the file COPYING3.  If no=
t see
> - #include "system.h"
> - #include "cpplib.h"
> - #include "internal.h"
> -+#include "file-map.h"
> -
> - typedef struct macro_arg macro_arg;
> - /* This structure represents the tokens of a macro argument.  These
> -@@ -288,6 +289,7 @@ _cpp_builtin_macro_text (cpp_reader *pfile, cpp_hash=
node *node)
> -           if (!name)
> -             abort ();
> -         }
> -+      name =3D remap_file_filename (name);
> -       len =3D strlen (name);
> -       buf =3D _cpp_unaligned_alloc (pfile, len * 2 + 3);
> -       result =3D buf;
> ---
> -1.9.1
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0073-Reuse-fdebug-prefix-m=
ap-to-replace-ffile-prefix-map.patch b/meta/recipes-devtools/gcc/gcc-4.9/00=
73-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch
> deleted file mode 100644
> index 94e45ed..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.9/0073-Reuse-fdebug-prefix-map-to-r=
eplace-ffile-prefix-map.patch
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -From 5e10baff84038d26dc3d59b2412ba1db92cb8274 Mon Sep 17 00:00:00 2001
> -From: Hongxu Jia <hongxu.jia@windriver.com>
> -Date: Thu, 17 Mar 2016 00:34:01 -0400
> -Subject: [PATCH 2/2] Reuse -fdebug-prefix-map to replace -ffile-prefix-m=
ap
> -
> -The oe-core may use external toolchain to compile,
> -which may not support -ffile-prefix-map.
> -
> -Since we use -fdebug-prefix-map to do the same thing,
> -so we could reuse it to replace -ffile-prefix-map.
> -
> -Upstream-Status: Inappropriate[oe-core specific]
> -
> -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ----
> - gcc/opts-global.c | 4 ++++
> - 1 file changed, 4 insertions(+)
> -
> -diff --git a/gcc/opts-global.c b/gcc/opts-global.c
> -index 111884b..037f6c8 100644
> ---- a/gcc/opts-global.c
> -+++ b/gcc/opts-global.c
> -@@ -42,6 +42,7 @@ along with GCC; see the file COPYING3.  If not see
> - #include "toplev.h"
> - #include "tree-pass.h"
> - #include "context.h"
> -+#include "file-map.h"
> -
> - typedef const char *const_char_p; /* For DEF_VEC_P.  */
> -
> -@@ -354,6 +355,9 @@ handle_common_deferred_options (void)
> -
> -       case OPT_fdebug_prefix_map_:
> -         add_debug_prefix_map (opt->arg);
> -+
> -+        /* Reuse -fdebug-prefix-map to replace -ffile-prefix-map */
> -+        add_file_prefix_map (opt->arg);
> -         break;
> -
> -       case OPT_fdump_:
> ---
> -1.9.1
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0074-fdebug-prefix-map-sup=
port-to-remap-relative-path.patch b/meta/recipes-devtools/gcc/gcc-4.9/0074-=
fdebug-prefix-map-support-to-remap-relative-path.patch
> deleted file mode 100644
> index 0b91fdb..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.9/0074-fdebug-prefix-map-support-to=
-remap-relative-path.patch
> +++ /dev/null
> @@ -1,51 +0,0 @@
> -From 289ad2969a5966c603bf6928ce442db74c4cbb25 Mon Sep 17 00:00:00 2001
> -From: Hongxu Jia <hongxu.jia@windriver.com>
> -Date: Thu, 24 Mar 2016 11:23:14 -0400
> -Subject: [PATCH] gcc/final.c: -fdebug-prefix-map support to remap source=
s with
> - relative path
> -
> -PR other/70428
> -* final.c (remap_debug_filename): Use lrealpath to translate
> -relative path before remapping
> -
> -https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D70428
> -Upstream-Status: Submitted [gcc-patches@gcc.gnu.org]
> -
> -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ----
> -diff --git a/gcc/final.c b/gcc/final.c
> -index 55cf509..c3594c2 100644
> ---- a/gcc/final.c
> -+++ b/gcc/final.c
> -@@ -1554,16 +1554,25 @@ remap_debug_filename (const char *filename)
> -   const char *name;
> -   size_t name_len;
> -
> -+  /* Support to remap filename with relative path  */
> -+  char *realpath =3D lrealpath (filename);
> -+  if (realpath =3D=3D NULL)
> -+    return filename;
> -+
> -   for (map =3D debug_prefix_maps; map; map =3D map->next)
> --    if (filename_ncmp (filename, map->old_prefix, map->old_len) =3D=3D =
0)
> -+    if (filename_ncmp (realpath, map->old_prefix, map->old_len) =3D=3D =
0)
> -       break;
> -   if (!map)
> --    return filename;
> --  name =3D filename + map->old_len;
> -+    {
> -+      free (realpath);
> -+      return filename;
> -+    }
> -+  name =3D realpath + map->old_len;
> -   name_len =3D strlen (name) + 1;
> -   s =3D (char *) alloca (name_len + map->new_len);
> -   memcpy (s, map->new_prefix, map->new_len);
> -   memcpy (s + map->new_len, name, name_len);
> -+  free (realpath);
> -   return ggc_strdup (s);
> - }
> -
> ---
> -2.7.4
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0075-libgcc-use-ldflags.pa=
tch b/meta/recipes-devtools/gcc/gcc-4.9/0075-libgcc-use-ldflags.patch
> deleted file mode 100644
> index 325b72a..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.9/0075-libgcc-use-ldflags.patch
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -Link libgcc using LDFLAGS, not just SHLIB_LDFLAGS
> -
> -Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> -Upstream-Status: Pending
> -
> ---- gcc-5.3.0.orig/libgcc/config/t-slibgcc
> -+++ gcc-5.3.0/libgcc/config/t-slibgcc
> -@@ -32,7 +32,7 @@ SHLIB_INSTALL_SOLINK =3D $(LN_S) $(SHLIB_S
> -       $(DESTDIR)$(slibdir)$(SHLIB_SLIBDIR_QUAL)/$(SHLIB_SOLINK)
> -
> - SHLIB_LINK =3D $(CC) $(LIBGCC2_CFLAGS) -shared -nodefaultlibs \
> --      $(SHLIB_LDFLAGS) \
> -+      $(LDFLAGS) $(SHLIB_LDFLAGS) \
> -       -o $(SHLIB_DIR)/$(SHLIB_SONAME).tmp @multilib_flags@ \
> -       $(SHLIB_OBJS) $(SHLIB_LC) && \
> -       rm -f $(SHLIB_DIR)/$(SHLIB_SOLINK) && \
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0076-remove-prototypes-cfn=
s.patch b/meta/recipes-devtools/gcc/gcc-4.9/0076-remove-prototypes-cfns.pat=
ch
> deleted file mode 100644
> index 2954f2e..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.9/0076-remove-prototypes-cfns.patch
> +++ /dev/null
> @@ -1,153 +0,0 @@
> -Upstream-Status: backport
> -
> -From 8c3fa311caa86f61b4e28d1563d1110b44340fb2 Mon Sep 17 00:00:00 2001
> -From: edlinger <edlinger@138bc75d-0d04-0410-961f-82ee72b054a4>
> -Date: Thu, 25 Feb 2016 15:36:41 +0000
> -Subject: [PATCH] 2016-02-25  Bernd Edlinger  <bernd.edlinger@hotmail.de>
> -
> -        Backported from mainline
> -        2016-02-19  Jakub Jelinek  <jakub@redhat.com>
> -                    Bernd Edlinger  <bernd.edlinger@hotmail.de>
> -
> -        * Make-lang.in: Invoke gperf with -L C++.
> -        * cfns.gperf: Remove prototypes for hash and libc_name_p
> -        inlines.
> -        * cfns.h: Regenerated.
> -        * except.c (nothrow_libfn_p): Adjust.
> -
> -
> ----
> - gcc/cp/Make-lang.in |  2 +-
> - gcc/cp/cfns.gperf   | 10 ++--------
> - gcc/cp/cfns.h       | 41 ++++++++++++++---------------------------
> - gcc/cp/except.c     |  3 ++-
> - 5 files changed, 31 insertions(+), 37 deletions(-)
> -
> -diff --git a/gcc/cp/Make-lang.in b/gcc/cp/Make-lang.in
> -index bd1c1d7..a0ea0d4 100644
> ---- a/gcc/cp/Make-lang.in
> -+++ b/gcc/cp/Make-lang.in
> -@@ -111,7 +111,7 @@ else
> - # deleting the $(srcdir)/cp/cfns.h file.
> - $(srcdir)/cp/cfns.h:
> - endif
> --      gperf -o -C -E -k '1-6,$$' -j1 -D -N 'libc_name_p' -L ANSI-C \
> -+      gperf -o -C -E -k '1-6,$$' -j1 -D -N 'libc_name_p' -L C++ \
> -               $(srcdir)/cp/cfns.gperf --output-file $(srcdir)/cp/cfns.h
> -
> - #
> -diff --git a/gcc/cp/cfns.gperf b/gcc/cp/cfns.gperf
> -index 05ca753..d9b16b8 100644
> ---- a/gcc/cp/cfns.gperf
> -+++ b/gcc/cp/cfns.gperf
> -@@ -1,3 +1,5 @@
> -+%language=3DC++
> -+%define class-name libc_name
> - %{
> - /* Copyright (C) 2000-2014 Free Software Foundation, Inc.
> -
> -@@ -16,14 +18,6 @@ for more details.
> - You should have received a copy of the GNU General Public License
> - along with GCC; see the file COPYING3.  If not see
> - <http://www.gnu.org/licenses/>.  */
> --#ifdef __GNUC__
> --__inline
> --#endif
> --static unsigned int hash (const char *, unsigned int);
> --#ifdef __GNUC__
> --__inline
> --#endif
> --const char * libc_name_p (const char *, unsigned int);
> - %}
> - %%
> - # The standard C library functions, for feeding to gperf; the result is=
 used
> -diff --git a/gcc/cp/cfns.h b/gcc/cp/cfns.h
> -index c845ddf..65801d1 100644
> ---- a/gcc/cp/cfns.h
> -+++ b/gcc/cp/cfns.h
> -@@ -1,5 +1,5 @@
> --/* ANSI-C code produced by gperf version 3.0.3 */
> --/* Command-line: gperf -o -C -E -k '1-6,$' -j1 -D -N libc_name_p -L ANS=
I-C cfns.gperf  */
> -+/* C++ code produced by gperf version 3.0.4 */
> -+/* Command-line: gperf -o -C -E -k '1-6,$' -j1 -D -N libc_name_p -L C++=
 --output-file cfns.h cfns.gperf  */
> -
> - #if !((' ' =3D=3D 32) && ('!' =3D=3D 33) && ('"' =3D=3D 34) && ('#' =3D=
=3D 35) \
> -       && ('%' =3D=3D 37) && ('&' =3D=3D 38) && ('\'' =3D=3D 39) && ('('=
 =3D=3D 40) \
> -@@ -28,7 +28,7 @@
> - #error "gperf generated tables don't work with this execution character=
 set. Please report a bug to <bug-gnu-gperf@gnu.org>."
> - #endif
> -
> --#line 1 "cfns.gperf"
> -+#line 3 "cfns.gperf"
> -
> - /* Copyright (C) 2000-2014 Free Software Foundation, Inc.
> -
> -@@ -47,25 +47,18 @@ for more details.
> - You should have received a copy of the GNU General Public License
> - along with GCC; see the file COPYING3.  If not see
> - <http://www.gnu.org/licenses/>.  */
> --#ifdef __GNUC__
> --__inline
> --#endif
> --static unsigned int hash (const char *, unsigned int);
> --#ifdef __GNUC__
> --__inline
> --#endif
> --const char * libc_name_p (const char *, unsigned int);
> - /* maximum key range =3D 391, duplicates =3D 0 */
> -
> --#ifdef __GNUC__
> --__inline
> --#else
> --#ifdef __cplusplus
> --inline
> --#endif
> --#endif
> --static unsigned int
> --hash (register const char *str, register unsigned int len)
> -+class libc_name
> -+{
> -+private:
> -+  static inline unsigned int hash (const char *str, unsigned int len);
> -+public:
> -+  static const char *libc_name_p (const char *str, unsigned int len);
> -+};
> -+
> -+inline unsigned int
> -+libc_name::hash (register const char *str, register unsigned int len)
> - {
> -   static const unsigned short asso_values[] =3D
> -     {
> -@@ -122,14 +115,8 @@ hash (register const char *str, register unsigned i=
nt len)
> -   return hval + asso_values[(unsigned char)str[len - 1]];
> - }
> -
> --#ifdef __GNUC__
> --__inline
> --#ifdef __GNUC_STDC_INLINE__
> --__attribute__ ((__gnu_inline__))
> --#endif
> --#endif
> - const char *
> --libc_name_p (register const char *str, register unsigned int len)
> -+libc_name::libc_name_p (register const char *str, register unsigned int=
 len)
> - {
> -   enum
> -     {
> -diff --git a/gcc/cp/except.c b/gcc/cp/except.c
> -index 221971a..32340f5 100644
> ---- a/gcc/cp/except.c
> -+++ b/gcc/cp/except.c
> -@@ -1030,7 +1030,8 @@ nothrow_libfn_p (const_tree fn)
> -      unless the system headers are playing rename tricks, and if
> -      they are, we don't want to be confused by them.  */
> -   id =3D DECL_NAME (fn);
> --  return !!libc_name_p (IDENTIFIER_POINTER (id), IDENTIFIER_LENGTH (id)=
);
> -+  return !!libc_name::libc_name_p (IDENTIFIER_POINTER (id),
> -+                                 IDENTIFIER_LENGTH (id));
> - }
> -
> - /* Returns nonzero if an exception of type FROM will be caught by a
> ---
> -2.8.2
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_4.9.bb b/meta/r=
ecipes-devtools/gcc/gcc-cross-canadian_4.9.bb
> deleted file mode 100644
> index bf53c5c..0000000
> --- a/meta/recipes-devtools/gcc/gcc-cross-canadian_4.9.bb
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -require recipes-devtools/gcc/gcc-${PV}.inc
> -require gcc-cross-canadian.inc
> -
> -
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-cross-initial_4.9.bb b/meta/re=
cipes-devtools/gcc/gcc-cross-initial_4.9.bb
> deleted file mode 100644
> index 4c73e5c..0000000
> --- a/meta/recipes-devtools/gcc/gcc-cross-initial_4.9.bb
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -require recipes-devtools/gcc/gcc-cross_${PV}.bb
> -require gcc-cross-initial.inc
> diff --git a/meta/recipes-devtools/gcc/gcc-cross_4.9.bb b/meta/recipes-de=
vtools/gcc/gcc-cross_4.9.bb
> deleted file mode 100644
> index b43cca0..0000000
> --- a/meta/recipes-devtools/gcc/gcc-cross_4.9.bb
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -require recipes-devtools/gcc/gcc-${PV}.inc
> -require gcc-cross.inc
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk-initial_4.9.bb b/meta=
/recipes-devtools/gcc/gcc-crosssdk-initial_4.9.bb
> deleted file mode 100644
> index fd90e11..0000000
> --- a/meta/recipes-devtools/gcc/gcc-crosssdk-initial_4.9.bb
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -require recipes-devtools/gcc/gcc-cross-initial_${PV}.bb
> -require gcc-crosssdk-initial.inc
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk_4.9.bb b/meta/recipes=
-devtools/gcc/gcc-crosssdk_4.9.bb
> deleted file mode 100644
> index 40a6c4f..0000000
> --- a/meta/recipes-devtools/gcc/gcc-crosssdk_4.9.bb
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -require recipes-devtools/gcc/gcc-cross_${PV}.bb
> -require gcc-crosssdk.inc
> diff --git a/meta/recipes-devtools/gcc/gcc-runtime_4.9.bb b/meta/recipes-=
devtools/gcc/gcc-runtime_4.9.bb
> deleted file mode 100644
> index 497d691..0000000
> --- a/meta/recipes-devtools/gcc/gcc-runtime_4.9.bb
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -require recipes-devtools/gcc/gcc-${PV}.inc
> -require gcc-runtime.inc
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_4.9.bb b/meta/recip=
es-devtools/gcc/gcc-sanitizers_4.9.bb
> deleted file mode 100644
> index 601f666..0000000
> --- a/meta/recipes-devtools/gcc/gcc-sanitizers_4.9.bb
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -require recipes-devtools/gcc/gcc-${PV}.inc
> -require gcc-sanitizers.inc
> diff --git a/meta/recipes-devtools/gcc/gcc-source_4.9.bb b/meta/recipes-d=
evtools/gcc/gcc-source_4.9.bb
> deleted file mode 100644
> index b890fa3..0000000
> --- a/meta/recipes-devtools/gcc/gcc-source_4.9.bb
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -require recipes-devtools/gcc/gcc-${PV}.inc
> -require recipes-devtools/gcc/gcc-source.inc
> -
> -EXCLUDE_FROM_WORLD =3D "1"
> diff --git a/meta/recipes-devtools/gcc/gcc_4.9.bb b/meta/recipes-devtools=
/gcc/gcc_4.9.bb
> deleted file mode 100644
> index a9dc612..0000000
> --- a/meta/recipes-devtools/gcc/gcc_4.9.bb
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -require recipes-devtools/gcc/gcc-${PV}.inc
> -require gcc-target.inc
> -
> -# http://errors.yoctoproject.org/Errors/Details/20497/
> -ARM_INSTRUCTION_SET_armv4 =3D "arm"
> -ARM_INSTRUCTION_SET_armv5 =3D "arm"
> -
> -BBCLASSEXTEND =3D "nativesdk"
> -
> -#SYSTEMHEADERS_class-nativesdk =3D "${@'${target_includedir}'.replace(d.=
getVar('SDKPATH', True),'%r')}"
> -#SYSTEMLIBS_class-nativesdk =3D "${@'${target_base_libdir}'.replace(d.ge=
tVar('SDKPATH', True),'%r')}/"
> -#SYSTEMLIBS1_class-nativesdk =3D "${@'${target_libdir}'.replace(d.getVar=
('SDKPATH', True),'%r')}/"
> -
> diff --git a/meta/recipes-devtools/gcc/libgcc-initial_4.9.bb b/meta/recip=
es-devtools/gcc/libgcc-initial_4.9.bb
> deleted file mode 100644
> index 19f253f..0000000
> --- a/meta/recipes-devtools/gcc/libgcc-initial_4.9.bb
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -require recipes-devtools/gcc/gcc-${PV}.inc
> -require libgcc-initial.inc
> diff --git a/meta/recipes-devtools/gcc/libgcc_4.9.bb b/meta/recipes-devto=
ols/gcc/libgcc_4.9.bb
> deleted file mode 100644
> index a5152f2..0000000
> --- a/meta/recipes-devtools/gcc/libgcc_4.9.bb
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -require recipes-devtools/gcc/gcc-${PV}.inc
> -require libgcc.inc
> diff --git a/meta/recipes-devtools/gcc/libgfortran_4.9.bb b/meta/recipes-=
devtools/gcc/libgfortran_4.9.bb
> deleted file mode 100644
> index 71dd8b4..0000000
> --- a/meta/recipes-devtools/gcc/libgfortran_4.9.bb
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -require recipes-devtools/gcc/gcc-${PV}.inc
> -require libgfortran.inc
> -
> --
> 2.8.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

