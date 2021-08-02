Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web11.46.1627935472180939857
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Aug 2021 13:17:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TmClufFE;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id 129so17857632qkg.4
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Aug 2021 13:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=TCpsxI9dulxVmjuy9XicuTbepb0b3NwhUQfdTtVL/RA=;
        b=TmClufFELjm+8eQdexjSIA5zfBSJV0fe9efJniBkxJsweEu5WB66hOtCxhr8IcpP0c
         /ED0bqnFlXbYv8zgwHRSt9rePtGi7GiKpERX+16v1+v07kScel8rcGJxEc0Nizvshr/l
         2X3aRySRQKgv2K0CZa3je0NHUsrsLE+w+bnI51EcpbqJR5tNVJUzGkYWBj9dhsrQM4H5
         hd1wDqyongR0YQR3dM78MgwQ8BJTqbh90WQQ4GqMQ8251O6ZigfijJ4q6mZM1Dm/1bRS
         K6htcMShjMpha12fhEvutJzdogM7DYZliql8TO/KmkG1EzbWZKPcQ3zQBaXTZ/vFOWU2
         yL5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=TCpsxI9dulxVmjuy9XicuTbepb0b3NwhUQfdTtVL/RA=;
        b=NmfqCWNS23kaUUDIt5BG9MUYRzEhI5ZGKU6LZhM1GDbdTYS/FNjj30O6SZAvmqCM/E
         aouDs8anKAAm79bYVR+ItguEhfwfJbdBRxxxUz14iHKUuXpXYlIIKdI8koeVsJIkvZs8
         5o7nT0StY6z0HGV96+E20qFdPOJGfp9FLPPZDRD4lxXFIeMldg7hZpPuhaPY5bp/HhGA
         f2J0mpbjCRK2cyd4MLg2IKhG696whj+8SWjZ+kjpWdq4pOOhDg2yz0Wii2etmuRt7YuK
         W5NRAapS/CKMUEkwb51mIHdSE43gJE/0Mch15mcbCEgvojANnp4uRXVTnWJfWmUgF69p
         kbXg==
X-Gm-Message-State: AOAM533IY5DMQ4XYliiWq7qHbF2zAkuuSyLreCjZF6930WXp4F4iIKRJ
	FjFjpUVV6JEu26p7l3DfCt75t5QVbSFPlSu+hz6B32HAlIE=
X-Google-Smtp-Source: ABdhPJyJSsYgoGdW+ZVo7jtJHzDWwX//EI4E79PePx9xhrCFCGm1lUL1uT7H+ggKVUe64Qyj6y59I6y8DguLxFbkM2M=
X-Received: by 2002:a05:620a:31a1:: with SMTP id bi33mr17339577qkb.146.1627935470726;
 Mon, 02 Aug 2021 13:17:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210802154639.4181923-1-raj.khem@gmail.com>
In-Reply-To: <20210802154639.4181923-1-raj.khem@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 2 Aug 2021 13:17:24 -0700
Message-ID: <CAMKF1soO6HGJ_8gJsgtrmz_iSp1JsD1kgk0P2TAt0qxp6ahefQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] glibc: Upgrade to 2.34 release
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

please note that v3 is rebased on top of master-next, if you are using
master then v2 is good.

On Mon, Aug 2, 2021 at 8:46 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> bump localedef to get __attr_access_none and __attr_access definitions
> replace /bin/bash instead of @BASH@ in ldd as @BASH@ has been substituted with /bin/bash now
>
> package libc_malloc_debug.so.0
>
> Detailed changelog [1]
>
> [1] https://sourceware.org/pipermail/libc-alpha/2021-August/129718.html
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/conf/distro/include/tcmode-default.inc   |    2 +-
>  ...2.33.bb => cross-localedef-native_2.34.bb} |   16 +-
>  meta/recipes-core/glibc/glibc-common.inc      |    2 +-
>  ...bc-locale_2.33.bb => glibc-locale_2.34.bb} |    0
>  ...bc-mtrace_2.33.bb => glibc-mtrace_2.34.bb} |    0
>  meta/recipes-core/glibc/glibc-package.inc     |    3 +-
>  ...-scripts_2.33.bb => glibc-scripts_2.34.bb} |    0
>  ...tsuite_2.33.bb => glibc-testsuite_2.34.bb} |    0
>  meta/recipes-core/glibc/glibc-version.inc     |    8 +-
>  meta/recipes-core/glibc/glibc.inc             |    2 +-
>  ...dd-hardlink-resolver-from-util-linux.patch |    2 +-
>  ...-fix-ups-hardlink-to-make-it-compile.patch |    2 +-
>  ...Look-for-host-system-ld.so.cache-as-.patch |    8 +-
>  ...Fix-buffer-overrun-with-a-relocated-.patch |    6 +-
>  ...Raise-the-size-of-arrays-containing-.patch |   22 +-
>  ...k-glibc-Allow-64-bit-atomics-for-x86.patch |    2 +-
>  ...Make-relocatable-install-for-locales.patch |    6 +-
>  ...Fall-back-to-faccessat-on-faccess2-r.patch |   32 +
>  ...500-e6500-603e-fsqrt-implementation.patch} |    2 +-
>  ...ndefined-reference-to-__sqrt_finite.patch} |    2 +-
>  ...are-now-inline-functions-and-call-o.patch} |    2 +-
>  ...43-which-explains-what-the-patch-do.patch} |    2 +-
>  ...-err-tab.pl-with-specific-dirs-in-S.patch} |    2 +-
>  ...are-now-inline-functions-and-call-o.patch} |    2 +-
>  ...gure.ac-handle-correctly-libc_cv_ro.patch} |    2 +-
>  ...he-path-sets-wrong-config-variables.patch} |    6 +-
>  ...one-re-written-tzselect-as-posix-sh.patch} |   28 +-
>  ...ash-dependency-for-nscd-init-script.patch} |    2 +-
>  ...s-building-and-testing-instructions.patch} |    2 +-
>  ...libc-Help-bootstrap-cross-toolchain.patch} |    8 +-
>  ...glibc-Resolve-__fpscr_values-on-SH4.patch} |    6 +-
>  ...ort-cross-locale-generation-support.patch} |   10 +-
>  ...efine-DUMMY_LOCALE_T-if-not-defined.patch} |    2 +-
>  ...archive-uses-a-hard-coded-locale-pa.patch} |    4 +-
>  ...e-_dl_build_local_scope-breadth-fir.patch} |    2 +-
>  ...t-no-lines-in-bison-generated-files.patch} |    2 +-
>  ...aybe-uninitialized-errors-with-Os-BZ.patch |    2 +-
>  ...RE_KNOWN_INTERPRETER_NAMES-to-known-.patch |    2 +-
>  ...y-the-header-between-arm-and-aarch64.patch |    4 +-
>  ...Do-not-ask-compiler-for-finding-arch.patch |    2 +-
>  .../glibc/glibc/CVE-2021-33574.patch          |   61 -
>  .../glibc/glibc/faccessat2-perm.patch         |   31 -
>  .../glibc/glibc/mte-backports.patch           | 1238 -----------------
>  .../glibc/{glibc_2.33.bb => glibc_2.34.bb}    |   40 +-
>  44 files changed, 136 insertions(+), 1443 deletions(-)
>  rename meta/recipes-core/glibc/{cross-localedef-native_2.33.bb => cross-localedef-native_2.34.bb} (74%)
>  rename meta/recipes-core/glibc/{glibc-locale_2.33.bb => glibc-locale_2.34.bb} (100%)
>  rename meta/recipes-core/glibc/{glibc-mtrace_2.33.bb => glibc-mtrace_2.34.bb} (100%)
>  rename meta/recipes-core/glibc/{glibc-scripts_2.33.bb => glibc-scripts_2.34.bb} (100%)
>  rename meta/recipes-core/glibc/{glibc-testsuite_2.33.bb => glibc-testsuite_2.34.bb} (100%)
>  create mode 100644 meta/recipes-core/glibc/glibc/0008-nativesdk-glibc-Fall-back-to-faccessat-on-faccess2-r.patch
>  rename meta/recipes-core/glibc/glibc/{0008-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch => 0009-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch} (99%)
>  rename meta/recipes-core/glibc/glibc/{0009-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch => 0010-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch} (99%)
>  rename meta/recipes-core/glibc/glibc/{0010-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch => 0011-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch} (99%)
>  rename meta/recipes-core/glibc/glibc/{0011-Quote-from-bug-1443-which-explains-what-the-patch-do.patch => 0012-Quote-from-bug-1443-which-explains-what-the-patch-do.patch} (97%)
>  rename meta/recipes-core/glibc/glibc/{0012-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch => 0013-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch} (94%)
>  rename meta/recipes-core/glibc/glibc/{0013-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch => 0014-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch} (96%)
>  rename meta/recipes-core/glibc/glibc/{0014-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch => 0015-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch} (94%)
>  rename meta/recipes-core/glibc/glibc/{0015-yes-within-the-path-sets-wrong-config-variables.patch => 0016-yes-within-the-path-sets-wrong-config-variables.patch} (98%)
>  rename meta/recipes-core/glibc/glibc/{0016-timezone-re-written-tzselect-as-posix-sh.patch => 0017-timezone-re-written-tzselect-as-posix-sh.patch} (50%)
>  rename meta/recipes-core/glibc/glibc/{0017-Remove-bash-dependency-for-nscd-init-script.patch => 0018-Remove-bash-dependency-for-nscd-init-script.patch} (96%)
>  rename meta/recipes-core/glibc/glibc/{0018-eglibc-Cross-building-and-testing-instructions.patch => 0019-eglibc-Cross-building-and-testing-instructions.patch} (99%)
>  rename meta/recipes-core/glibc/glibc/{0019-eglibc-Help-bootstrap-cross-toolchain.patch => 0020-eglibc-Help-bootstrap-cross-toolchain.patch} (93%)
>  rename meta/recipes-core/glibc/glibc/{0020-eglibc-Resolve-__fpscr_values-on-SH4.patch => 0021-eglibc-Resolve-__fpscr_values-on-SH4.patch} (92%)
>  rename meta/recipes-core/glibc/glibc/{0021-eglibc-Forward-port-cross-locale-generation-support.patch => 0022-eglibc-Forward-port-cross-locale-generation-support.patch} (98%)
>  rename meta/recipes-core/glibc/glibc/{0022-Define-DUMMY_LOCALE_T-if-not-defined.patch => 0023-Define-DUMMY_LOCALE_T-if-not-defined.patch} (92%)
>  rename meta/recipes-core/glibc/glibc/{0023-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch => 0024-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch} (96%)
>  rename meta/recipes-core/glibc/glibc/{0024-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch => 0025-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch} (95%)
>  rename meta/recipes-core/glibc/glibc/{0025-intl-Emit-no-lines-in-bison-generated-files.patch => 0026-intl-Emit-no-lines-in-bison-generated-files.patch} (93%)
>  delete mode 100644 meta/recipes-core/glibc/glibc/CVE-2021-33574.patch
>  delete mode 100644 meta/recipes-core/glibc/glibc/faccessat2-perm.patch
>  delete mode 100644 meta/recipes-core/glibc/glibc/mte-backports.patch
>  rename meta/recipes-core/glibc/{glibc_2.33.bb => glibc_2.34.bb} (78%)
>
> diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
> index 7afe28a160..47f23f5c39 100644
> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -20,7 +20,7 @@ GCCVERSION ?= "11.%"
>  SDKGCCVERSION ?= "${GCCVERSION}"
>  BINUVERSION ?= "2.37%"
>  GDBVERSION ?= "10.%"
> -GLIBCVERSION ?= "2.33"
> +GLIBCVERSION ?= "2.34"
>  LINUXLIBCVERSION ?= "5.13%"
>  QEMUVERSION ?= "6.0%"
>  GOVERSION ?= "1.16%"
> diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.33.bb b/meta/recipes-core/glibc/cross-localedef-native_2.34.bb
> similarity index 74%
> rename from meta/recipes-core/glibc/cross-localedef-native_2.33.bb
> rename to meta/recipes-core/glibc/cross-localedef-native_2.34.bb
> index ec59c6ba10..1543b92a7e 100644
> --- a/meta/recipes-core/glibc/cross-localedef-native_2.33.bb
> +++ b/meta/recipes-core/glibc/cross-localedef-native_2.34.bb
> @@ -25,14 +25,14 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
>             file://0001-localedef-Add-hardlink-resolver-from-util-linux.patch \
>             file://0002-localedef-fix-ups-hardlink-to-make-it-compile.patch \
>             \
> -           file://0016-timezone-re-written-tzselect-as-posix-sh.patch \
> -           file://0017-Remove-bash-dependency-for-nscd-init-script.patch \
> -           file://0018-eglibc-Cross-building-and-testing-instructions.patch \
> -           file://0019-eglibc-Help-bootstrap-cross-toolchain.patch \
> -           file://0020-eglibc-Resolve-__fpscr_values-on-SH4.patch \
> -           file://0021-eglibc-Forward-port-cross-locale-generation-support.patch \
> -           file://0022-Define-DUMMY_LOCALE_T-if-not-defined.patch \
> -           file://0023-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch \
> +           file://0017-timezone-re-written-tzselect-as-posix-sh.patch \
> +           file://0018-Remove-bash-dependency-for-nscd-init-script.patch \
> +           file://0019-eglibc-Cross-building-and-testing-instructions.patch \
> +           file://0020-eglibc-Help-bootstrap-cross-toolchain.patch \
> +           file://0021-eglibc-Resolve-__fpscr_values-on-SH4.patch \
> +           file://0022-eglibc-Forward-port-cross-locale-generation-support.patch \
> +           file://0023-Define-DUMMY_LOCALE_T-if-not-defined.patch \
> +           file://0024-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch \
>  "
>  # Makes for a rather long rev (22 characters), but...
>  #
> diff --git a/meta/recipes-core/glibc/glibc-common.inc b/meta/recipes-core/glibc/glibc-common.inc
> index 782b2605cc..f695cd6a4a 100644
> --- a/meta/recipes-core/glibc/glibc-common.inc
> +++ b/meta/recipes-core/glibc/glibc-common.inc
> @@ -22,4 +22,4 @@ ARM_INSTRUCTION_SET:armv6 = "arm"
>  #
>  COMPATIBLE_HOST:libc-musl:class-target = "null"
>
> -PV = "2.33"
> +PV = "2.34"
> diff --git a/meta/recipes-core/glibc/glibc-locale_2.33.bb b/meta/recipes-core/glibc/glibc-locale_2.34.bb
> similarity index 100%
> rename from meta/recipes-core/glibc/glibc-locale_2.33.bb
> rename to meta/recipes-core/glibc/glibc-locale_2.34.bb
> diff --git a/meta/recipes-core/glibc/glibc-mtrace_2.33.bb b/meta/recipes-core/glibc/glibc-mtrace_2.34.bb
> similarity index 100%
> rename from meta/recipes-core/glibc/glibc-mtrace_2.33.bb
> rename to meta/recipes-core/glibc/glibc-mtrace_2.34.bb
> diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
> index 4bf5038fc0..53c615ff06 100644
> --- a/meta/recipes-core/glibc/glibc-package.inc
> +++ b/meta/recipes-core/glibc/glibc-package.inc
> @@ -1,6 +1,6 @@
>  INHIBIT_SYSROOT_STRIP = "1"
>
> -PACKAGES = "${PN}-dbg catchsegv sln nscd ldconfig ldd tzcode glibc-thread-db ${PN}-pic libcidn libmemusage libnss-db libsegfault ${PN}-pcprofile libsotruss ${PN} ${PN}-utils glibc-extra-nss ${PN}-dev ${PN}-staticdev ${PN}-doc ${PN}-src"
> +PACKAGES = "${PN}-dbg catchsegv sln nscd ldconfig ldd tzcode glibc-thread-db ${PN}-pic libcidn libmemusage malloc-debug libnss-db libsegfault ${PN}-pcprofile libsotruss ${PN} ${PN}-utils glibc-extra-nss ${PN}-dev ${PN}-staticdev ${PN}-doc ${PN}-src"
>
>  # The ld.so in this glibc supports the GNU_HASH
>  RPROVIDES:${PN} = "eglibc rtld(GNU_HASH)"
> @@ -30,6 +30,7 @@ FILES:ldd = "${bindir}/ldd"
>  FILES:libsegfault = "${base_libdir}/libSegFault*"
>  FILES:libcidn = "${base_libdir}/libcidn-*.so ${base_libdir}/libcidn.so.*"
>  FILES:libmemusage = "${base_libdir}/libmemusage.so"
> +FILES:malloc-debug = "${base_libdir}/libc_malloc_debug.so.0"
>  FILES:libnss-db = "${base_libdir}/libnss_db.so.* ${base_libdir}/libnss_db-*.so ${localstatedir}/db/Makefile ${localstatedir}/db/makedbs.sh"
>  RDEPENDS:libnss-db = "${PN}-utils"
>  FILES:glibc-extra-nss = "${base_libdir}/libnss_*-*.so ${base_libdir}/libnss_*.so.*"
> diff --git a/meta/recipes-core/glibc/glibc-scripts_2.33.bb b/meta/recipes-core/glibc/glibc-scripts_2.34.bb
> similarity index 100%
> rename from meta/recipes-core/glibc/glibc-scripts_2.33.bb
> rename to meta/recipes-core/glibc/glibc-scripts_2.34.bb
> diff --git a/meta/recipes-core/glibc/glibc-testsuite_2.33.bb b/meta/recipes-core/glibc/glibc-testsuite_2.34.bb
> similarity index 100%
> rename from meta/recipes-core/glibc/glibc-testsuite_2.33.bb
> rename to meta/recipes-core/glibc/glibc-testsuite_2.34.bb
> diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
> index 376ead66ac..281df7ecda 100644
> --- a/meta/recipes-core/glibc/glibc-version.inc
> +++ b/meta/recipes-core/glibc/glibc-version.inc
> @@ -1,7 +1,7 @@
> -SRCBRANCH ?= "release/2.33/master"
> -PV = "2.33"
> -SRCREV_glibc ?= "3f5080aedd164c1f92a53552dd3e0b82ac6d2bd3"
> -SRCREV_localedef ?= "bd644c9e6f3e20c5504da1488448173c69c56c28"
> +SRCBRANCH ?= "release/2.34/master"
> +PV = "2.34"
> +SRCREV_glibc ?= "ae37d06c7d127817ba43850f0f898b793d42aea7"
> +SRCREV_localedef ?= "95c0221703ad970a52445e9eaf91c4aff35eebef"
>
>  GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
>
> diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
> index 04e6db99b9..80a3e0b493 100644
> --- a/meta/recipes-core/glibc/glibc.inc
> +++ b/meta/recipes-core/glibc/glibc.inc
> @@ -42,7 +42,7 @@ PARALLEL_MAKE = ""
>  EXTRA_OEMAKE += "SHELL=/bin/bash"
>
>  do_configure:prepend() {
> -       sed -e "s#@BASH@#/bin/sh#" -i ${S}/elf/ldd.bash.in
> +       sed -e "s#/bin/bash#/bin/sh#" -i ${S}/elf/ldd.bash.in
>  }
>
>  # Enable backtrace from abort()
> diff --git a/meta/recipes-core/glibc/glibc/0001-localedef-Add-hardlink-resolver-from-util-linux.patch b/meta/recipes-core/glibc/glibc/0001-localedef-Add-hardlink-resolver-from-util-linux.patch
> index f96da83a9b..3ff485b1e3 100644
> --- a/meta/recipes-core/glibc/glibc/0001-localedef-Add-hardlink-resolver-from-util-linux.patch
> +++ b/meta/recipes-core/glibc/glibc/0001-localedef-Add-hardlink-resolver-from-util-linux.patch
> @@ -1,4 +1,4 @@
> -From d1f1671034a222417f9a829dcaa4f0c3d4f8954d Mon Sep 17 00:00:00 2001
> +From d34ba0833cd811f8869a6262044af55f9e7b59d8 Mon Sep 17 00:00:00 2001
>  From: Jason Wessel <jason.wessel@windriver.com>
>  Date: Sat, 7 Dec 2019 09:59:22 -0800
>  Subject: [PATCH] localedef: Add hardlink resolver from util-linux
> diff --git a/meta/recipes-core/glibc/glibc/0002-localedef-fix-ups-hardlink-to-make-it-compile.patch b/meta/recipes-core/glibc/glibc/0002-localedef-fix-ups-hardlink-to-make-it-compile.patch
> index 3dc4582f47..2445aa56b3 100644
> --- a/meta/recipes-core/glibc/glibc/0002-localedef-fix-ups-hardlink-to-make-it-compile.patch
> +++ b/meta/recipes-core/glibc/glibc/0002-localedef-fix-ups-hardlink-to-make-it-compile.patch
> @@ -1,4 +1,4 @@
> -From 14d256e2db009f8bac9a265e8393d7ed25050df9 Mon Sep 17 00:00:00 2001
> +From d7bb36a9a27e5e4c3be6378493b41286513750e9 Mon Sep 17 00:00:00 2001
>  From: Jason Wessel <jason.wessel@windriver.com>
>  Date: Sat, 7 Dec 2019 10:01:37 -0800
>  Subject: [PATCH] localedef: fix-ups hardlink to make it compile
> diff --git a/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch b/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch
> index c4718a106f..210cc1076c 100644
> --- a/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch
> +++ b/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch
> @@ -1,4 +1,4 @@
> -From 32a4b8ae046fe4bb1b19f61378d079d44deaede7 Mon Sep 17 00:00:00 2001
> +From 776a53db6afba8a7ff4412aba88b0679227877f9 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Wed, 18 Mar 2015 01:48:24 +0000
>  Subject: [PATCH] nativesdk-glibc: Look for host system ld.so.cache as well
> @@ -30,10 +30,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 8 insertions(+), 8 deletions(-)
>
>  diff --git a/elf/dl-load.c b/elf/dl-load.c
> -index 9e2089cfaa..ad01674027 100644
> +index a08df001af..d09daf9e41 100644
>  --- a/elf/dl-load.c
>  +++ b/elf/dl-load.c
> -@@ -2175,6 +2175,14 @@ _dl_map_object (struct link_map *loader, const char *name,
> +@@ -2196,6 +2196,14 @@ _dl_map_object (struct link_map *loader, const char *name,
>               }
>           }
>
> @@ -48,7 +48,7 @@ index 9e2089cfaa..ad01674027 100644
>   #ifdef USE_LDCONFIG
>         if (fd == -1
>           && (__glibc_likely ((mode & __RTLD_SECURE) == 0)
> -@@ -2233,14 +2241,6 @@ _dl_map_object (struct link_map *loader, const char *name,
> +@@ -2254,14 +2262,6 @@ _dl_map_object (struct link_map *loader, const char *name,
>         }
>   #endif
>
> diff --git a/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch b/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch
> index a8e625d24c..010b816e11 100644
> --- a/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch
> +++ b/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch
> @@ -1,4 +1,4 @@
> -From aa8393bff257e4badfd208b88473ead175c69362 Mon Sep 17 00:00:00 2001
> +From df18bae1eeee55ecb9db36d13fe67c58355682eb Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Wed, 18 Mar 2015 01:50:00 +0000
>  Subject: [PATCH] nativesdk-glibc: Fix buffer overrun with a relocated SDK
> @@ -21,10 +21,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 12 insertions(+)
>
>  diff --git a/elf/dl-load.c b/elf/dl-load.c
> -index ad01674027..f455207e79 100644
> +index d09daf9e41..2c6270e2a7 100644
>  --- a/elf/dl-load.c
>  +++ b/elf/dl-load.c
> -@@ -1871,7 +1871,19 @@ open_path (const char *name, size_t namelen, int mode,
> +@@ -1892,7 +1892,19 @@ open_path (const char *name, size_t namelen, int mode,
>          given on the command line when rtld is run directly.  */
>       return -1;
>
> diff --git a/meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch b/meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch
> index 197caae921..bf9f3e36ca 100644
> --- a/meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch
> +++ b/meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch
> @@ -1,4 +1,4 @@
> -From 3ea08e491a8494ff03e598b5e0fc2d8131e75da9 Mon Sep 17 00:00:00 2001
> +From 6af8ce8eceed86addbc188f773a2d36d83ee4042 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Wed, 18 Mar 2015 01:51:38 +0000
>  Subject: [PATCH] nativesdk-glibc: Raise the size of arrays containing dl paths
> @@ -26,10 +26,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   8 files changed, 16 insertions(+), 10 deletions(-)
>
>  diff --git a/elf/dl-cache.c b/elf/dl-cache.c
> -index 32f3bef5ea..71f3a82dc0 100644
> +index 2b8da8650d..3d9787bda4 100644
>  --- a/elf/dl-cache.c
>  +++ b/elf/dl-cache.c
> -@@ -359,6 +359,10 @@ search_cache (const char *string_table, uint32_t string_table_size,
> +@@ -355,6 +355,10 @@ search_cache (const char *string_table, uint32_t string_table_size,
>     return best;
>   }
>
> @@ -41,7 +41,7 @@ index 32f3bef5ea..71f3a82dc0 100644
>   _dl_cache_libcmp (const char *p1, const char *p2)
>   {
>  diff --git a/elf/dl-load.c b/elf/dl-load.c
> -index f455207e79..a144e24fcf 100644
> +index 2c6270e2a7..23018d2f7e 100644
>  --- a/elf/dl-load.c
>  +++ b/elf/dl-load.c
>  @@ -115,8 +115,8 @@ enum { ncapstr = 1, max_capstrlen = 0 };
> @@ -56,7 +56,7 @@ index f455207e79..a144e24fcf 100644
>     SYSTEM_DIRS_LEN
>   };
>  diff --git a/elf/dl-usage.c b/elf/dl-usage.c
> -index 6e26818bd7..f09e8b93e5 100644
> +index 5ad3a72559..88f26d3692 100644
>  --- a/elf/dl-usage.c
>  +++ b/elf/dl-usage.c
>  @@ -25,6 +25,8 @@
> @@ -77,7 +77,7 @@ index 6e26818bd7..f09e8b93e5 100644
>     --library-path PATH   use given PATH instead of content of the environment\n\
>                           variable LD_LIBRARY_PATH\n\
>     --glibc-hwcaps-prepend LIST\n\
> -@@ -266,7 +268,7 @@ setting environment variables (which would be inherited by subprocesses).\n\
> +@@ -267,7 +269,7 @@ setting environment variables (which would be inherited by subprocesses).\n\
>   \n\
>   This program interpreter self-identifies as: " RTLD "\n\
>   ",
> @@ -98,10 +98,10 @@ index 91966702ca..dc86c20e83 100644
>  +const char __invoke_dynamic_linker__[4096] __attribute__ ((section (".interp")))
>     = RUNTIME_LINKER;
>  diff --git a/elf/ldconfig.c b/elf/ldconfig.c
> -index 28ed637a29..5d38a60c5d 100644
> +index 1037e8d0cf..ffdac84952 100644
>  --- a/elf/ldconfig.c
>  +++ b/elf/ldconfig.c
> -@@ -176,6 +176,9 @@ static struct argp argp =
> +@@ -177,6 +177,9 @@ static struct argp argp =
>     options, parse_opt, NULL, doc, NULL, more_help, NULL
>   };
>
> @@ -112,7 +112,7 @@ index 28ed637a29..5d38a60c5d 100644
>      a platform.  */
>   static int
>  diff --git a/elf/rtld.c b/elf/rtld.c
> -index 596b6ac3d9..1ccd33f668 100644
> +index fbbd60b446..fce9940f80 100644
>  --- a/elf/rtld.c
>  +++ b/elf/rtld.c
>  @@ -185,6 +185,7 @@ dso_name_valid_for_suid (const char *p)
> @@ -124,11 +124,11 @@ index 596b6ac3d9..1ccd33f668 100644
>   static void
>   audit_list_init (struct audit_list *list)
>  diff --git a/iconv/gconv_conf.c b/iconv/gconv_conf.c
> -index 682f949834..7eed87bc9d 100644
> +index 62bee28769..67b60dc88c 100644
>  --- a/iconv/gconv_conf.c
>  +++ b/iconv/gconv_conf.c
>  @@ -36,7 +36,7 @@
> -
> + #include <gconv_parseconfdir.h>
>
>   /* This is the default path where we look for module lists.  */
>  -static const char default_gconv_path[] = GCONV_PATH;
> diff --git a/meta/recipes-core/glibc/glibc/0006-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch b/meta/recipes-core/glibc/glibc/0006-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch
> index 172ade8d97..3a37f7af72 100644
> --- a/meta/recipes-core/glibc/glibc/0006-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch
> +++ b/meta/recipes-core/glibc/glibc/0006-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch
> @@ -1,4 +1,4 @@
> -From 19e3e45eb1838ee80af13c3d27fcff446773211e Mon Sep 17 00:00:00 2001
> +From b30f380cd88ae181a4a6a3a4784206ffe3ccd19b Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Thu, 31 Dec 2015 14:35:35 -0800
>  Subject: [PATCH] nativesdk-glibc: Allow 64 bit atomics for x86
> diff --git a/meta/recipes-core/glibc/glibc/0007-nativesdk-glibc-Make-relocatable-install-for-locales.patch b/meta/recipes-core/glibc/glibc/0007-nativesdk-glibc-Make-relocatable-install-for-locales.patch
> index 14697567c2..d763178f21 100644
> --- a/meta/recipes-core/glibc/glibc/0007-nativesdk-glibc-Make-relocatable-install-for-locales.patch
> +++ b/meta/recipes-core/glibc/glibc/0007-nativesdk-glibc-Make-relocatable-install-for-locales.patch
> @@ -1,4 +1,4 @@
> -From 732d4f4954fe60718870048d0583a20a7a8a8540 Mon Sep 17 00:00:00 2001
> +From 24bffe9c2645cd6542e29cb57786dc703cced07b Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Fri, 3 Aug 2018 09:55:12 -0700
>  Subject: [PATCH] nativesdk-glibc: Make relocatable install for locales
> @@ -41,7 +41,7 @@ index ab09122b0c..f42cc75780 100644
>     else
>       /* We really have to load some data.  First see whether the name is
>  diff --git a/locale/loadarchive.c b/locale/loadarchive.c
> -index 4177fc8972..40247b1e68 100644
> +index 512769eaec..436619091b 100644
>  --- a/locale/loadarchive.c
>  +++ b/locale/loadarchive.c
>  @@ -42,7 +42,7 @@
> @@ -67,7 +67,7 @@ index b3d4da0185..22f9dc1140 100644
>   /* Load the locale data for CATEGORY from the file specified by *NAME.
>      If *NAME is "", use environment variables as specified by POSIX, and
>  diff --git a/locale/programs/locale.c b/locale/programs/locale.c
> -index 575b208e82..5ec630c3a4 100644
> +index ca0a95be99..6b98895203 100644
>  --- a/locale/programs/locale.c
>  +++ b/locale/programs/locale.c
>  @@ -632,6 +632,7 @@ nameentcmp (const void *a, const void *b)
> diff --git a/meta/recipes-core/glibc/glibc/0008-nativesdk-glibc-Fall-back-to-faccessat-on-faccess2-r.patch b/meta/recipes-core/glibc/glibc/0008-nativesdk-glibc-Fall-back-to-faccessat-on-faccess2-r.patch
> new file mode 100644
> index 0000000000..f4fc1d68c4
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/0008-nativesdk-glibc-Fall-back-to-faccessat-on-faccess2-r.patch
> @@ -0,0 +1,32 @@
> +From 2761400989bcbf11e10bc85f90c3a2ba1305c4ae Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Sat, 6 Mar 2021 14:48:56 -0800
> +Subject: [PATCH] nativesdk-glibc: Fall back to faccessat on faccess2 returns
> + EPERM
> +
> +Fedora-specific workaround for systemd-nspawn
> +
> +Upstream-Status: Inappropriate [Distro Specific]
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + sysdeps/unix/sysv/linux/faccessat.c | 6 +++++-
> + 1 file changed, 5 insertions(+), 1 deletion(-)
> +
> +diff --git a/sysdeps/unix/sysv/linux/faccessat.c b/sysdeps/unix/sysv/linux/faccessat.c
> +index 13160d3249..ee3ddc9b79 100644
> +--- a/sysdeps/unix/sysv/linux/faccessat.c
> ++++ b/sysdeps/unix/sysv/linux/faccessat.c
> +@@ -30,7 +30,11 @@ __faccessat (int fd, const char *file, int mode, int flag)
> + #if __ASSUME_FACCESSAT2
> +   return ret;
> + #else
> +-  if (ret == 0 || errno != ENOSYS)
> ++  /* Fedora-specific workaround:
> ++     As a workround for a broken systemd-nspawn that returns
> ++     EPERM when a syscall is not allowed instead of ENOSYS
> ++     we must check for EPERM here and fall back to faccessat.  */
> ++  if (ret == 0 || !(errno == ENOSYS || errno == EPERM))
> +     return ret;
> +
> +   if (flag & ~(AT_SYMLINK_NOFOLLOW | AT_EACCESS))
> diff --git a/meta/recipes-core/glibc/glibc/0008-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch b/meta/recipes-core/glibc/glibc/0009-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch
> similarity index 99%
> rename from meta/recipes-core/glibc/glibc/0008-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch
> rename to meta/recipes-core/glibc/glibc/0009-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch
> index 2162bf38c2..01de227a02 100644
> --- a/meta/recipes-core/glibc/glibc/0008-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch
> +++ b/meta/recipes-core/glibc/glibc/0009-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch
> @@ -1,4 +1,4 @@
> -From 3d58330390a7d4f4ed32f4a9c25628af3e0dd5c1 Mon Sep 17 00:00:00 2001
> +From 74923ca4b1ae0ed5a2478e7d265b37534f6815d7 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Wed, 18 Mar 2015 00:01:50 +0000
>  Subject: [PATCH] fsl e500/e5500/e6500/603e fsqrt implementation
> diff --git a/meta/recipes-core/glibc/glibc/0009-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch b/meta/recipes-core/glibc/glibc/0010-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch
> similarity index 99%
> rename from meta/recipes-core/glibc/glibc/0009-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch
> rename to meta/recipes-core/glibc/glibc/0010-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch
> index 0c8bf94a75..5c1130cf10 100644
> --- a/meta/recipes-core/glibc/glibc/0009-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch
> +++ b/meta/recipes-core/glibc/glibc/0010-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch
> @@ -1,4 +1,4 @@
> -From 3b5fe5b1a7390cde0f07351415e3891f62d1f7e0 Mon Sep 17 00:00:00 2001
> +From 5da3da7f2d276c2a6ae1b04419b28e96953803ec Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Wed, 18 Mar 2015 00:15:07 +0000
>  Subject: [PATCH] ppc/sqrt: Fix undefined reference to `__sqrt_finite'
> diff --git a/meta/recipes-core/glibc/glibc/0010-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch b/meta/recipes-core/glibc/glibc/0011-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
> similarity index 99%
> rename from meta/recipes-core/glibc/glibc/0010-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
> rename to meta/recipes-core/glibc/glibc/0011-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
> index cadaa0b2e2..b72e79057b 100644
> --- a/meta/recipes-core/glibc/glibc/0010-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
> +++ b/meta/recipes-core/glibc/glibc/0011-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
> @@ -1,4 +1,4 @@
> -From 6b6e1dcd707017598ea3bdc2d91a761943b62218 Mon Sep 17 00:00:00 2001
> +From 77f1c90d67a2f8852184fb8fd95cb0ed63065dc7 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Wed, 18 Mar 2015 00:16:38 +0000
>  Subject: [PATCH] __ieee754_sqrt{,f} are now inline functions and call out
> diff --git a/meta/recipes-core/glibc/glibc/0011-Quote-from-bug-1443-which-explains-what-the-patch-do.patch b/meta/recipes-core/glibc/glibc/0012-Quote-from-bug-1443-which-explains-what-the-patch-do.patch
> similarity index 97%
> rename from meta/recipes-core/glibc/glibc/0011-Quote-from-bug-1443-which-explains-what-the-patch-do.patch
> rename to meta/recipes-core/glibc/glibc/0012-Quote-from-bug-1443-which-explains-what-the-patch-do.patch
> index e4c78b5c79..07d4411c61 100644
> --- a/meta/recipes-core/glibc/glibc/0011-Quote-from-bug-1443-which-explains-what-the-patch-do.patch
> +++ b/meta/recipes-core/glibc/glibc/0012-Quote-from-bug-1443-which-explains-what-the-patch-do.patch
> @@ -1,4 +1,4 @@
> -From 297bac9429260f8df495b81d3fae8ae4c6913f5f Mon Sep 17 00:00:00 2001
> +From add514edf4299d1bf540d85d0aa0bd5fe0d46b78 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Wed, 18 Mar 2015 00:20:09 +0000
>  Subject: [PATCH] Quote from bug 1443 which explains what the patch does :
> diff --git a/meta/recipes-core/glibc/glibc/0012-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch b/meta/recipes-core/glibc/glibc/0013-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch
> similarity index 94%
> rename from meta/recipes-core/glibc/glibc/0012-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch
> rename to meta/recipes-core/glibc/glibc/0013-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch
> index c5e8e6473a..c2766ef4c3 100644
> --- a/meta/recipes-core/glibc/glibc/0012-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch
> +++ b/meta/recipes-core/glibc/glibc/0013-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch
> @@ -1,4 +1,4 @@
> -From f389babf3c920e68b7d7391556a78ebf62a21ebe Mon Sep 17 00:00:00 2001
> +From c5047b8f7d1a17324cfa02b99f07a70ebcec2cf2 Mon Sep 17 00:00:00 2001
>  From: Ting Liu <b28495@freescale.com>
>  Date: Wed, 19 Dec 2012 04:39:57 -0600
>  Subject: [PATCH] eglibc: run libm-err-tab.pl with specific dirs in ${S}
> diff --git a/meta/recipes-core/glibc/glibc/0013-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch b/meta/recipes-core/glibc/glibc/0014-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
> similarity index 96%
> rename from meta/recipes-core/glibc/glibc/0013-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
> rename to meta/recipes-core/glibc/glibc/0014-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
> index 7f362cace0..088b810530 100644
> --- a/meta/recipes-core/glibc/glibc/0013-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
> +++ b/meta/recipes-core/glibc/glibc/0014-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
> @@ -1,4 +1,4 @@
> -From 4b0d41a315e66f688fef7b0c2e2b6ce9fa16ec93 Mon Sep 17 00:00:00 2001
> +From 133870f12ba36686dd8df1311fac32a4c5b28579 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Wed, 18 Mar 2015 00:24:46 +0000
>  Subject: [PATCH] __ieee754_sqrt{,f} are now inline functions and call out
> diff --git a/meta/recipes-core/glibc/glibc/0014-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch b/meta/recipes-core/glibc/glibc/0015-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch
> similarity index 94%
> rename from meta/recipes-core/glibc/glibc/0014-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch
> rename to meta/recipes-core/glibc/glibc/0015-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch
> index 4da0e003c0..e8332a53c2 100644
> --- a/meta/recipes-core/glibc/glibc/0014-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch
> +++ b/meta/recipes-core/glibc/glibc/0015-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch
> @@ -1,4 +1,4 @@
> -From c062a462fee53a30a85d693c8288b5bd8fe4ec6e Mon Sep 17 00:00:00 2001
> +From b4613f814ba7ba5db95d18116172f81a83ac8f5b Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Wed, 18 Mar 2015 00:27:10 +0000
>  Subject: [PATCH] sysdeps/gnu/configure.ac: handle correctly
> diff --git a/meta/recipes-core/glibc/glibc/0015-yes-within-the-path-sets-wrong-config-variables.patch b/meta/recipes-core/glibc/glibc/0016-yes-within-the-path-sets-wrong-config-variables.patch
> similarity index 98%
> rename from meta/recipes-core/glibc/glibc/0015-yes-within-the-path-sets-wrong-config-variables.patch
> rename to meta/recipes-core/glibc/glibc/0016-yes-within-the-path-sets-wrong-config-variables.patch
> index 15e83f8917..f7e7f1cd10 100644
> --- a/meta/recipes-core/glibc/glibc/0015-yes-within-the-path-sets-wrong-config-variables.patch
> +++ b/meta/recipes-core/glibc/glibc/0016-yes-within-the-path-sets-wrong-config-variables.patch
> @@ -1,4 +1,4 @@
> -From 0bd39d8907953f18e01742f42b24647ac7689d0a Mon Sep 17 00:00:00 2001
> +From 7be3e82b66394a7b242e56c6fc609e858b8e2436 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Wed, 18 Mar 2015 00:31:06 +0000
>  Subject: [PATCH] 'yes' within the path sets wrong config variables
> @@ -29,7 +29,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   12 files changed, 28 insertions(+), 28 deletions(-)
>
>  diff --git a/sysdeps/aarch64/configure b/sysdeps/aarch64/configure
> -index 83c3a23e44..a68c946277 100644
> +index 4c1fac49f3..597314f476 100644
>  --- a/sysdeps/aarch64/configure
>  +++ b/sysdeps/aarch64/configure
>  @@ -157,12 +157,12 @@ else
> @@ -48,7 +48,7 @@ index 83c3a23e44..a68c946277 100644
>   else
>     libc_cv_aarch64_be=no
>  diff --git a/sysdeps/aarch64/configure.ac b/sysdeps/aarch64/configure.ac
> -index 66f755078a..a32b265bbe 100644
> +index 3347c13fa1..4af163c0b6 100644
>  --- a/sysdeps/aarch64/configure.ac
>  +++ b/sysdeps/aarch64/configure.ac
>  @@ -17,8 +17,8 @@ AC_DEFINE(SUPPORT_STATIC_PIE)
> diff --git a/meta/recipes-core/glibc/glibc/0016-timezone-re-written-tzselect-as-posix-sh.patch b/meta/recipes-core/glibc/glibc/0017-timezone-re-written-tzselect-as-posix-sh.patch
> similarity index 50%
> rename from meta/recipes-core/glibc/glibc/0016-timezone-re-written-tzselect-as-posix-sh.patch
> rename to meta/recipes-core/glibc/glibc/0017-timezone-re-written-tzselect-as-posix-sh.patch
> index 79bd704153..100d08599c 100644
> --- a/meta/recipes-core/glibc/glibc/0016-timezone-re-written-tzselect-as-posix-sh.patch
> +++ b/meta/recipes-core/glibc/glibc/0017-timezone-re-written-tzselect-as-posix-sh.patch
> @@ -1,4 +1,4 @@
> -From 3feb4213628f1485000ffe1d3fd26e37a7b14336 Mon Sep 17 00:00:00 2001
> +From 2731fa0c7463cd160361a8ac92f3bd7f984d953d Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Wed, 18 Mar 2015 00:33:03 +0000
>  Subject: [PATCH] timezone: re-written tzselect as posix sh
> @@ -10,27 +10,19 @@ Upstream-Status: Pending
>  Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  ---
> - timezone/Makefile     | 2 +-
> - timezone/tzselect.ksh | 2 +-
> - 2 files changed, 2 insertions(+), 2 deletions(-)
> + timezone/tzselect.ksh | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
>
> -diff --git a/timezone/Makefile b/timezone/Makefile
> -index 395abfeebd..2d939edf75 100644
> ---- a/timezone/Makefile
> -+++ b/timezone/Makefile
> -@@ -123,7 +123,7 @@ $(testdata)/XT%: testdata/XT%
> -       cp $< $@
> -
> - $(objpfx)tzselect: tzselect.ksh $(common-objpfx)config.make
> --      sed -e 's|/bin/bash|$(BASH)|' \
> -+      sed -e 's|/bin/bash|/bin/sh|' \
> -           -e 's|TZDIR=[^}]*|TZDIR=$(zonedir)|' \
> -           -e '/TZVERSION=/s|see_Makefile|"$(version)"|' \
> -           -e '/PKGVERSION=/s|=.*|="$(PKGVERSION)"|' \
>  diff --git a/timezone/tzselect.ksh b/timezone/tzselect.ksh
> -index 18fce27e24..70745f9d36 100755
> +index 18fce27e24..7705df83d7 100755
>  --- a/timezone/tzselect.ksh
>  +++ b/timezone/tzselect.ksh
> +@@ -1,4 +1,4 @@
> +-#!/bin/bash
> ++#!/bin/sh
> + # Ask the user about the time zone, and output the resulting TZ value to stdout.
> + # Interact with the user via stderr and stdin.
> +
>  @@ -34,7 +34,7 @@ REPORT_BUGS_TO=tz@iana.org
>
>   # Specify default values for environment variables if they are unset.
> diff --git a/meta/recipes-core/glibc/glibc/0017-Remove-bash-dependency-for-nscd-init-script.patch b/meta/recipes-core/glibc/glibc/0018-Remove-bash-dependency-for-nscd-init-script.patch
> similarity index 96%
> rename from meta/recipes-core/glibc/glibc/0017-Remove-bash-dependency-for-nscd-init-script.patch
> rename to meta/recipes-core/glibc/glibc/0018-Remove-bash-dependency-for-nscd-init-script.patch
> index c32d70b593..23296da61d 100644
> --- a/meta/recipes-core/glibc/glibc/0017-Remove-bash-dependency-for-nscd-init-script.patch
> +++ b/meta/recipes-core/glibc/glibc/0018-Remove-bash-dependency-for-nscd-init-script.patch
> @@ -1,4 +1,4 @@
> -From f6119b98a9caa80642d69a97edc98f57ecef5c3c Mon Sep 17 00:00:00 2001
> +From 412d33bbfe42a10a9b1f62afcc73fe121a0363b0 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Thu, 31 Dec 2015 14:33:02 -0800
>  Subject: [PATCH] Remove bash dependency for nscd init script
> diff --git a/meta/recipes-core/glibc/glibc/0018-eglibc-Cross-building-and-testing-instructions.patch b/meta/recipes-core/glibc/glibc/0019-eglibc-Cross-building-and-testing-instructions.patch
> similarity index 99%
> rename from meta/recipes-core/glibc/glibc/0018-eglibc-Cross-building-and-testing-instructions.patch
> rename to meta/recipes-core/glibc/glibc/0019-eglibc-Cross-building-and-testing-instructions.patch
> index 826e5af465..8fb9182d98 100644
> --- a/meta/recipes-core/glibc/glibc/0018-eglibc-Cross-building-and-testing-instructions.patch
> +++ b/meta/recipes-core/glibc/glibc/0019-eglibc-Cross-building-and-testing-instructions.patch
> @@ -1,4 +1,4 @@
> -From 060ba13b5ac5e90517d540f009ebdcdcf62f9685 Mon Sep 17 00:00:00 2001
> +From db9674ffc6583a508da1a3cb044c3ccf3febaea1 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Wed, 18 Mar 2015 00:42:58 +0000
>  Subject: [PATCH] eglibc: Cross building and testing instructions
> diff --git a/meta/recipes-core/glibc/glibc/0019-eglibc-Help-bootstrap-cross-toolchain.patch b/meta/recipes-core/glibc/glibc/0020-eglibc-Help-bootstrap-cross-toolchain.patch
> similarity index 93%
> rename from meta/recipes-core/glibc/glibc/0019-eglibc-Help-bootstrap-cross-toolchain.patch
> rename to meta/recipes-core/glibc/glibc/0020-eglibc-Help-bootstrap-cross-toolchain.patch
> index afac2e04f6..9b76cfd3b8 100644
> --- a/meta/recipes-core/glibc/glibc/0019-eglibc-Help-bootstrap-cross-toolchain.patch
> +++ b/meta/recipes-core/glibc/glibc/0020-eglibc-Help-bootstrap-cross-toolchain.patch
> @@ -1,4 +1,4 @@
> -From f13c2f525e9bc82ce13e4cf486f7fe0831fc3fac Mon Sep 17 00:00:00 2001
> +From 7856684f76c100155cad11b5b236fb31234b6e28 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Wed, 18 Mar 2015 00:49:28 +0000
>  Subject: [PATCH] eglibc: Help bootstrap cross toolchain
> @@ -29,7 +29,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   create mode 100644 include/stubs-bootstrap.h
>
>  diff --git a/Makefile b/Makefile
> -index 50f99ca611..31eed15f02 100644
> +index f98d5a9e67..c36d04da0f 100644
>  --- a/Makefile
>  +++ b/Makefile
>  @@ -79,9 +79,18 @@ subdir-dirs = include
> @@ -52,7 +52,7 @@ index 50f99ca611..31eed15f02 100644
>   ifeq (yes,$(build-shared))
>   headers += gnu/lib-names.h
>   endif
> -@@ -416,6 +425,16 @@ others: $(common-objpfx)testrun.sh $(common-objpfx)debugglibc.sh
> +@@ -415,6 +424,16 @@ others: $(common-objpfx)testrun.sh $(common-objpfx)debugglibc.sh
>
>   subdir-stubs := $(foreach dir,$(subdirs),$(common-objpfx)$(dir)/stubs)
>
> @@ -69,7 +69,7 @@ index 50f99ca611..31eed15f02 100644
>   ifndef abi-variants
>   installed-stubs = $(inst_includedir)/gnu/stubs.h
>   else
> -@@ -442,6 +461,7 @@ $(inst_includedir)/gnu/stubs.h: $(+force)
> +@@ -441,6 +460,7 @@ $(inst_includedir)/gnu/stubs.h: $(+force)
>
>   install-others-nosubdir: $(installed-stubs)
>   endif
> diff --git a/meta/recipes-core/glibc/glibc/0020-eglibc-Resolve-__fpscr_values-on-SH4.patch b/meta/recipes-core/glibc/glibc/0021-eglibc-Resolve-__fpscr_values-on-SH4.patch
> similarity index 92%
> rename from meta/recipes-core/glibc/glibc/0020-eglibc-Resolve-__fpscr_values-on-SH4.patch
> rename to meta/recipes-core/glibc/glibc/0021-eglibc-Resolve-__fpscr_values-on-SH4.patch
> index 9a610c6703..74c8c10661 100644
> --- a/meta/recipes-core/glibc/glibc/0020-eglibc-Resolve-__fpscr_values-on-SH4.patch
> +++ b/meta/recipes-core/glibc/glibc/0021-eglibc-Resolve-__fpscr_values-on-SH4.patch
> @@ -1,4 +1,4 @@
> -From 330c4e50e28e29c31fb8d6ab39cdbb2af4d3def7 Mon Sep 17 00:00:00 2001
> +From 111ab95a85314d1e70fb159a14250354cc69d899 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Wed, 18 Mar 2015 00:55:53 +0000
>  Subject: [PATCH] eglibc: Resolve __fpscr_values on SH4
> @@ -21,10 +21,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   2 files changed, 12 insertions(+)
>
>  diff --git a/sysdeps/unix/sysv/linux/sh/Versions b/sysdeps/unix/sysv/linux/sh/Versions
> -index e0938c4165..ca1d7da339 100644
> +index 9c734ff755..974e33b4b1 100644
>  --- a/sysdeps/unix/sysv/linux/sh/Versions
>  +++ b/sysdeps/unix/sysv/linux/sh/Versions
> -@@ -2,6 +2,7 @@ libc {
> +@@ -3,6 +3,7 @@ libc {
>     GLIBC_2.2 {
>       # functions used in other libraries
>       __xstat64; __fxstat64; __lxstat64;
> diff --git a/meta/recipes-core/glibc/glibc/0021-eglibc-Forward-port-cross-locale-generation-support.patch b/meta/recipes-core/glibc/glibc/0022-eglibc-Forward-port-cross-locale-generation-support.patch
> similarity index 98%
> rename from meta/recipes-core/glibc/glibc/0021-eglibc-Forward-port-cross-locale-generation-support.patch
> rename to meta/recipes-core/glibc/glibc/0022-eglibc-Forward-port-cross-locale-generation-support.patch
> index 0b2f020fdd..a9ff8e92ea 100644
> --- a/meta/recipes-core/glibc/glibc/0021-eglibc-Forward-port-cross-locale-generation-support.patch
> +++ b/meta/recipes-core/glibc/glibc/0022-eglibc-Forward-port-cross-locale-generation-support.patch
> @@ -1,4 +1,4 @@
> -From 557ed640b26bd208ce8d4a6fd725b124893668d7 Mon Sep 17 00:00:00 2001
> +From 4e5de801a39d66b8bd93d09f5912dcbe5db4ef04 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Wed, 18 Mar 2015 01:33:49 +0000
>  Subject: [PATCH] eglibc: Forward port cross locale generation support
> @@ -148,7 +148,7 @@ index 4841bfd05d..ffcba1fd79 100644
>     return NULL;
>   }
>  diff --git a/locale/programs/ld-collate.c b/locale/programs/ld-collate.c
> -index 0af21e05e2..4980b0c52f 100644
> +index b6406b775d..bfa4adba9c 100644
>  --- a/locale/programs/ld-collate.c
>  +++ b/locale/programs/ld-collate.c
>  @@ -349,7 +349,7 @@ new_element (struct locale_collate_t *collate, const char *mbs, size_t mbslen,
> @@ -160,7 +160,7 @@ index 0af21e05e2..4980b0c52f 100644
>         uint32_t zero = 0;
>         /* Handle <U0000> as a single character.  */
>         if (nwcs == 0)
> -@@ -1772,8 +1772,7 @@ symbol `%s' has the same encoding as"), (*eptr)->name);
> +@@ -1775,8 +1775,7 @@ symbol `%s' has the same encoding as"), (*eptr)->name);
>
>               if ((*eptr)->nwcs == runp->nwcs)
>                 {
> @@ -170,7 +170,7 @@ index 0af21e05e2..4980b0c52f 100644
>
>                   if (c == 0)
>                     {
> -@@ -2000,9 +1999,9 @@ add_to_tablewc (uint32_t ch, struct element_t *runp)
> +@@ -2003,9 +2002,9 @@ add_to_tablewc (uint32_t ch, struct element_t *runp)
>              one consecutive entry.  */
>           if (runp->wcnext != NULL
>               && runp->nwcs == runp->wcnext->nwcs
> @@ -183,7 +183,7 @@ index 0af21e05e2..4980b0c52f 100644
>               && (runp->wcs[runp->nwcs - 1]
>                   == runp->wcnext->wcs[runp->nwcs - 1] + 1))
>             {
> -@@ -2026,9 +2025,9 @@ add_to_tablewc (uint32_t ch, struct element_t *runp)
> +@@ -2029,9 +2028,9 @@ add_to_tablewc (uint32_t ch, struct element_t *runp)
>                 runp = runp->wcnext;
>               while (runp->wcnext != NULL
>                      && runp->nwcs == runp->wcnext->nwcs
> diff --git a/meta/recipes-core/glibc/glibc/0022-Define-DUMMY_LOCALE_T-if-not-defined.patch b/meta/recipes-core/glibc/glibc/0023-Define-DUMMY_LOCALE_T-if-not-defined.patch
> similarity index 92%
> rename from meta/recipes-core/glibc/glibc/0022-Define-DUMMY_LOCALE_T-if-not-defined.patch
> rename to meta/recipes-core/glibc/glibc/0023-Define-DUMMY_LOCALE_T-if-not-defined.patch
> index 33d912d356..f195e07891 100644
> --- a/meta/recipes-core/glibc/glibc/0022-Define-DUMMY_LOCALE_T-if-not-defined.patch
> +++ b/meta/recipes-core/glibc/glibc/0023-Define-DUMMY_LOCALE_T-if-not-defined.patch
> @@ -1,4 +1,4 @@
> -From c8df3cf4556d8d78a98675865395ce42f3b67109 Mon Sep 17 00:00:00 2001
> +From 9e07bc25e344152d7bf0712152d9c5fe4abcbf46 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Wed, 20 Apr 2016 21:11:00 -0700
>  Subject: [PATCH] Define DUMMY_LOCALE_T if not defined
> diff --git a/meta/recipes-core/glibc/glibc/0023-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch b/meta/recipes-core/glibc/glibc/0024-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch
> similarity index 96%
> rename from meta/recipes-core/glibc/glibc/0023-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch
> rename to meta/recipes-core/glibc/glibc/0024-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch
> index a5a7a0cad7..50c2e14735 100644
> --- a/meta/recipes-core/glibc/glibc/0023-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch
> +++ b/meta/recipes-core/glibc/glibc/0024-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch
> @@ -1,4 +1,4 @@
> -From 2ec233ce078b74030de9195096058cd502fdc395 Mon Sep 17 00:00:00 2001
> +From 13bc0e53cc91e102472d532f28b3d44c30d291fc Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Fri, 3 Aug 2018 09:42:06 -0700
>  Subject: [PATCH] localedef --add-to-archive uses a hard-coded locale path
> @@ -18,7 +18,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 25 insertions(+), 10 deletions(-)
>
>  diff --git a/locale/programs/locarchive.c b/locale/programs/locarchive.c
> -index 6bb189ae37..0711c5c44e 100644
> +index f38e835c52..8d8f8699b2 100644
>  --- a/locale/programs/locarchive.c
>  +++ b/locale/programs/locarchive.c
>  @@ -340,12 +340,24 @@ enlarge_archive (struct locarhandle *ah, const struct locarhead *head)
> diff --git a/meta/recipes-core/glibc/glibc/0024-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch b/meta/recipes-core/glibc/glibc/0025-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch
> similarity index 95%
> rename from meta/recipes-core/glibc/glibc/0024-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch
> rename to meta/recipes-core/glibc/glibc/0025-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch
> index d2691e1ee7..fb0a609dbb 100644
> --- a/meta/recipes-core/glibc/glibc/0024-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch
> +++ b/meta/recipes-core/glibc/glibc/0025-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch
> @@ -1,4 +1,4 @@
> -From f8289aa320b00f6db43213979cceab2325a7a611 Mon Sep 17 00:00:00 2001
> +From 50b605dece16606dd9d1c737e579c13725eab11d Mon Sep 17 00:00:00 2001
>  From: Mark Hatle <mark.hatle@windriver.com>
>  Date: Thu, 18 Aug 2016 14:07:58 -0500
>  Subject: [PATCH] elf/dl-deps.c: Make _dl_build_local_scope breadth first
> diff --git a/meta/recipes-core/glibc/glibc/0025-intl-Emit-no-lines-in-bison-generated-files.patch b/meta/recipes-core/glibc/glibc/0026-intl-Emit-no-lines-in-bison-generated-files.patch
> similarity index 93%
> rename from meta/recipes-core/glibc/glibc/0025-intl-Emit-no-lines-in-bison-generated-files.patch
> rename to meta/recipes-core/glibc/glibc/0026-intl-Emit-no-lines-in-bison-generated-files.patch
> index 32f8fd22b8..998db39b47 100644
> --- a/meta/recipes-core/glibc/glibc/0025-intl-Emit-no-lines-in-bison-generated-files.patch
> +++ b/meta/recipes-core/glibc/glibc/0026-intl-Emit-no-lines-in-bison-generated-files.patch
> @@ -1,4 +1,4 @@
> -From 3156464f9a95bf1dafd2e22d19d7bf89c520acc1 Mon Sep 17 00:00:00 2001
> +From 99ab34278a6ebec134267412b4f619f43e278dea Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Fri, 3 Aug 2018 09:44:00 -0700
>  Subject: [PATCH] intl: Emit no lines in bison generated files
> diff --git a/meta/recipes-core/glibc/glibc/0027-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch b/meta/recipes-core/glibc/glibc/0027-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch
> index 782d931f22..2bfa2aaa06 100644
> --- a/meta/recipes-core/glibc/glibc/0027-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch
> +++ b/meta/recipes-core/glibc/glibc/0027-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch
> @@ -1,4 +1,4 @@
> -From 881f5b8134afd9a30049b93fc79dda7a44947a5f Mon Sep 17 00:00:00 2001
> +From 3190ada9ecaec915794886a608221655c120f90c Mon Sep 17 00:00:00 2001
>  From: Martin Jansa <martin.jansa@gmail.com>
>  Date: Mon, 17 Dec 2018 21:36:18 +0000
>  Subject: [PATCH] locale: prevent maybe-uninitialized errors with -Os [BZ
> diff --git a/meta/recipes-core/glibc/glibc/0028-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch b/meta/recipes-core/glibc/glibc/0028-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch
> index d273cab4a3..8042caaeae 100644
> --- a/meta/recipes-core/glibc/glibc/0028-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch
> +++ b/meta/recipes-core/glibc/glibc/0028-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch
> @@ -1,4 +1,4 @@
> -From b4e0a034b12b313dcb82d22341bef6a66b3e9ef9 Mon Sep 17 00:00:00 2001
> +From 5d201a75918a0e181ee6206f701901fdb91baf81 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Wed, 18 Mar 2015 00:11:22 +0000
>  Subject: [PATCH] readlib: Add OECORE_KNOWN_INTERPRETER_NAMES to known names
> diff --git a/meta/recipes-core/glibc/glibc/0029-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch b/meta/recipes-core/glibc/glibc/0029-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch
> index 11a77cdf93..8e011699ef 100644
> --- a/meta/recipes-core/glibc/glibc/0029-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch
> +++ b/meta/recipes-core/glibc/glibc/0029-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch
> @@ -1,4 +1,4 @@
> -From 2ae3ff3ae28abb1d0d100b4722da7ff188de9a30 Mon Sep 17 00:00:00 2001
> +From baba3c6021340a9070b734f931a15cea4cfe6c31 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Fri, 15 May 2020 17:05:45 -0700
>  Subject: [PATCH] wordsize.h: Unify the header between arm and aarch64
> @@ -50,7 +50,7 @@ index 91da566b74..34fcdef1f1 100644
>   /* Determine the wordsize from the preprocessor defines.
>
>  -   Copyright (C) 2016-2021 Free Software Foundation, Inc.
> -+   Copyright (C) 2016-2021 Free Software Foundation, Inc.
> ++   Copyright (C) 2016-2020 Free Software Foundation, Inc.
>      This file is part of the GNU C Library.
>
>      The GNU C Library is free software; you can redistribute it and/or
> diff --git a/meta/recipes-core/glibc/glibc/0030-powerpc-Do-not-ask-compiler-for-finding-arch.patch b/meta/recipes-core/glibc/glibc/0030-powerpc-Do-not-ask-compiler-for-finding-arch.patch
> index 5ef1ac2ed7..22df820aed 100644
> --- a/meta/recipes-core/glibc/glibc/0030-powerpc-Do-not-ask-compiler-for-finding-arch.patch
> +++ b/meta/recipes-core/glibc/glibc/0030-powerpc-Do-not-ask-compiler-for-finding-arch.patch
> @@ -1,4 +1,4 @@
> -From 5cc14938f05ae1354c8062f017a21f39d5fc9729 Mon Sep 17 00:00:00 2001
> +From 60aa53f547911163b42a1c436d695a15c87f34ee Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Fri, 7 Aug 2020 14:31:16 -0700
>  Subject: [PATCH] powerpc: Do not ask compiler for finding arch
> diff --git a/meta/recipes-core/glibc/glibc/CVE-2021-33574.patch b/meta/recipes-core/glibc/glibc/CVE-2021-33574.patch
> deleted file mode 100644
> index fd73b23c88..0000000000
> --- a/meta/recipes-core/glibc/glibc/CVE-2021-33574.patch
> +++ /dev/null
> @@ -1,61 +0,0 @@
> -From 42d359350510506b87101cf77202fefcbfc790cb Mon Sep 17 00:00:00 2001
> -From: Andreas Schwab <schwab@linux-m68k.org>
> -Date: Thu, 27 May 2021 12:49:47 +0200
> -Subject: [PATCH] Use __pthread_attr_copy in mq_notify (bug 27896)
> -
> -Make a deep copy of the pthread attribute object to remove a potential
> -use-after-free issue.
> -
> -Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=42d359350510506b87101cf77202fefcbfc790cb]
> -CVE: CVE-2021-33574
> -Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
> ----
> -diff --git a/sysdeps/unix/sysv/linux/mq_notify.c b/sysdeps/unix/sysv/linux/mq_notify.c
> -index cc575a0cdd8..6f46d29d1dc 100644
> ---- a/sysdeps/unix/sysv/linux/mq_notify.c
> -+++ b/sysdeps/unix/sysv/linux/mq_notify.c
> -@@ -133,8 +133,11 @@ helper_thread (void *arg)
> -           (void) __pthread_barrier_wait (&notify_barrier);
> -       }
> -       else if (data.raw[NOTIFY_COOKIE_LEN - 1] == NOTIFY_REMOVED)
> --      /* The only state we keep is the copy of the thread attributes.  */
> --      free (data.attr);
> -+      {
> -+        /* The only state we keep is the copy of the thread attributes.  */
> -+        pthread_attr_destroy (data.attr);
> -+        free (data.attr);
> -+      }
> -     }
> -   return NULL;
> - }
> -@@ -255,8 +258,14 @@ mq_notify (mqd_t mqdes, const struct sigevent *notification)
> -       if (data.attr == NULL)
> -       return -1;
> -
> --      memcpy (data.attr, notification->sigev_notify_attributes,
> --            sizeof (pthread_attr_t));
> -+      int ret = __pthread_attr_copy (data.attr,
> -+                                   notification->sigev_notify_attributes);
> -+      if (ret != 0)
> -+      {
> -+        free (data.attr);
> -+        __set_errno (ret);
> -+        return -1;
> -+      }
> -     }
> -
> -   /* Construct the new request.  */
> -@@ -269,8 +278,11 @@ mq_notify (mqd_t mqdes, const struct sigevent *notification)
> -   int retval = INLINE_SYSCALL (mq_notify, 2, mqdes, &se);
> -
> -   /* If it failed, free the allocated memory.  */
> --  if (__glibc_unlikely (retval != 0))
> --    free (data.attr);
> -+  if (retval != 0 && data.attr != NULL)
> -+    {
> -+      pthread_attr_destroy (data.attr);
> -+      free (data.attr);
> -+    }
> -
> -   return retval;
> - }
> diff --git a/meta/recipes-core/glibc/glibc/faccessat2-perm.patch b/meta/recipes-core/glibc/glibc/faccessat2-perm.patch
> deleted file mode 100644
> index 2ee7110ca1..0000000000
> --- a/meta/recipes-core/glibc/glibc/faccessat2-perm.patch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -Older seccomp-based filters used in container frameworks will block faccessat2
> -calls as it's a relatively new syscall.  This isn't a big problem with
> -glibc <2.33 but 2.33 will call faccessat2 itself, get EPERM, and thenn be confused
> -about what to do as EPERM isn't an expected error code.
> -
> -This manifests itself as mysterious errors, for example a kernel failing to link.
> -
> -The root cause of bad seccomp filters is mostly fixed (systemd 247, Docker 20.10.0)
> -but we can't expect everyone to upgrade, so add a workaound (originally from
> -Red Hat) to handle EPERM like ENOSYS and fallback to faccessat().
> -
> -Upstream-Status: Inappropriate
> -Signed-off-by: Ross Burton <ross.burton@arm.com>
> -
> -diff --git a/sysdeps/unix/sysv/linux/faccessat.c b/sysdeps/unix/sysv/linux/faccessat.c
> -index 56cb6dcc8b4d58d3..5de75032bbc93a2c 100644
> ---- a/sysdeps/unix/sysv/linux/faccessat.c
> -+++ b/sysdeps/unix/sysv/linux/faccessat.c
> -@@ -34,7 +34,11 @@ faccessat (int fd, const char *file, int mode, int flag)
> - #if __ASSUME_FACCESSAT2
> -   return ret;
> - #else
> --  if (ret == 0 || errno != ENOSYS)
> -+  /* Fedora-specific workaround:
> -+     As a workround for a broken systemd-nspawn that returns
> -+     EPERM when a syscall is not allowed instead of ENOSYS
> -+     we must check for EPERM here and fall back to faccessat.  */
> -+  if (ret == 0 || !(errno == ENOSYS || errno == EPERM))
> -     return ret;
> -
> -   if (flag & ~(AT_SYMLINK_NOFOLLOW | AT_EACCESS))
> diff --git a/meta/recipes-core/glibc/glibc/mte-backports.patch b/meta/recipes-core/glibc/glibc/mte-backports.patch
> deleted file mode 100644
> index d9604fdf45..0000000000
> --- a/meta/recipes-core/glibc/glibc/mte-backports.patch
> +++ /dev/null
> @@ -1,1238 +0,0 @@
> -Backport a number of patches from master to improve Arm MTE support.
> -
> -Upstream-Status: Backport [will be in 2.34]
> -Signed-off-by: Ross Burton <ross.burton@arm.com>
> -
> -From 2643466c2928a93de7b80a61f6a8f61a653862e1 Mon Sep 17 00:00:00 2001
> -From: Szabolcs Nagy <szabolcs.nagy@arm.com>
> -Date: Thu, 11 Mar 2021 14:09:56 +0000
> -Subject: [PATCH 01/11] malloc: Fix a potential realloc issue with memory
> - tagging
> -
> -At an _int_free call site in realloc the wrong size was used for tag
> -clearing: the chunk header of the next chunk was also cleared which
> -in practice may work, but logically wrong.
> -
> -The tag clearing is moved before the memcpy to save a tag computation,
> -this avoids a chunk2mem.  Another chunk2mem is removed because newmem
> -does not have to be recomputed. Whitespaces got fixed too.
> -
> -Reviewed-by: DJ Delorie <dj@redhat.com>
> ----
> - malloc/malloc.c | 14 +++++++-------
> - 1 file changed, 7 insertions(+), 7 deletions(-)
> -
> -diff --git a/malloc/malloc.c b/malloc/malloc.c
> -index 8f8f12c276..51cec67e55 100644
> ---- a/malloc/malloc.c
> -+++ b/malloc/malloc.c
> -@@ -4851,14 +4851,14 @@ _int_realloc(mstate av, mchunkptr oldp, INTERNAL_SIZE_T oldsize,
> -             }
> -           else
> -             {
> --            void *oldmem = chunk2mem (oldp);
> -+            void *oldmem = chunk2rawmem (oldp);
> -+            size_t sz = CHUNK_AVAILABLE_SIZE (oldp) - CHUNK_HDR_SZ;
> -+            (void) TAG_REGION (oldmem, sz);
> -             newmem = TAG_NEW_USABLE (newmem);
> --            memcpy (newmem, oldmem,
> --                    CHUNK_AVAILABLE_SIZE (oldp) - CHUNK_HDR_SZ);
> --            (void) TAG_REGION (chunk2rawmem (oldp), oldsize);
> --              _int_free (av, oldp, 1);
> --              check_inuse_chunk (av, newp);
> --              return chunk2mem (newp);
> -+            memcpy (newmem, oldmem, sz);
> -+            _int_free (av, oldp, 1);
> -+            check_inuse_chunk (av, newp);
> -+            return newmem;
> -             }
> -         }
> -     }
> ---
> -2.25.1
> -
> -
> -From 32f3132be063e4b16a5cdb058980af354126e2f4 Mon Sep 17 00:00:00 2001
> -From: Szabolcs Nagy <szabolcs.nagy@arm.com>
> -Date: Thu, 28 Jan 2021 17:34:36 +0000
> -Subject: [PATCH 02/11] malloc: Move MTAG_MMAP_FLAGS definition
> -
> -This is only used internally in malloc.c, the extern declaration
> -was wrong, __mtag_mmap_flags has internal linkage.
> -
> -Reviewed-by: DJ Delorie <dj@redhat.com>
> ----
> - include/malloc.h | 7 -------
> - malloc/malloc.c  | 2 ++
> - 2 files changed, 2 insertions(+), 7 deletions(-)
> -
> -diff --git a/include/malloc.h b/include/malloc.h
> -index 7ae08d53d3..b77761f74d 100644
> ---- a/include/malloc.h
> -+++ b/include/malloc.h
> -@@ -16,11 +16,4 @@ typedef struct malloc_state *mstate;
> -
> - # endif /* !_ISOMAC */
> -
> --#ifdef USE_MTAG
> --extern int __mtag_mmap_flags;
> --#define MTAG_MMAP_FLAGS __mtag_mmap_flags
> --#else
> --#define MTAG_MMAP_FLAGS 0
> --#endif
> --
> - #endif
> -diff --git a/malloc/malloc.c b/malloc/malloc.c
> -index 51cec67e55..61c25d0f93 100644
> ---- a/malloc/malloc.c
> -+++ b/malloc/malloc.c
> -@@ -463,11 +463,13 @@ static void *(*__tag_region)(void *, size_t) = __default_tag_region;
> - static void *(*__tag_new_usable)(void *) = __default_tag_nop;
> - static void *(*__tag_at)(void *) = __default_tag_nop;
> -
> -+# define MTAG_MMAP_FLAGS __mtag_mmap_flags
> - # define TAG_NEW_MEMSET(ptr, val, size) __tag_new_memset (ptr, val, size)
> - # define TAG_REGION(ptr, size) __tag_region (ptr, size)
> - # define TAG_NEW_USABLE(ptr) __tag_new_usable (ptr)
> - # define TAG_AT(ptr) __tag_at (ptr)
> - #else
> -+# define MTAG_MMAP_FLAGS 0
> - # define TAG_NEW_MEMSET(ptr, val, size) memset (ptr, val, size)
> - # define TAG_REGION(ptr, size) (ptr)
> - # define TAG_NEW_USABLE(ptr) (ptr)
> ---
> -2.25.1
> -
> -
> -From 4b13f77fb97f9618a7868ab767d05e0c2d7c6f6f Mon Sep 17 00:00:00 2001
> -From: Szabolcs Nagy <szabolcs.nagy@arm.com>
> -Date: Thu, 4 Feb 2021 11:38:23 +0000
> -Subject: [PATCH 03/11] malloc: Simplify __mtag_tag_new_usable
> -
> -The chunk cannot be a dumped one here.  The only non-obvious cases
> -are free and realloc which may be called on a dumped area chunk,
> -but in both cases it can be verified that tagging is already
> -avoided for dumped area chunks.
> -
> -Reviewed-by: DJ Delorie <dj@redhat.com>
> ----
> - malloc/arena.c | 5 -----
> - 1 file changed, 5 deletions(-)
> -
> -diff --git a/malloc/arena.c b/malloc/arena.c
> -index bf17be27d4..0777dc70c6 100644
> ---- a/malloc/arena.c
> -+++ b/malloc/arena.c
> -@@ -298,11 +298,6 @@ __mtag_tag_new_usable (void *ptr)
> -   if (ptr)
> -     {
> -       mchunkptr cp = mem2chunk(ptr);
> --      /* This likely will never happen, but we can't handle retagging
> --       chunks from the dumped main arena.  So just return the
> --       existing pointer.  */
> --      if (DUMPED_MAIN_ARENA_CHUNK (cp))
> --      return ptr;
> -       ptr = __libc_mtag_tag_region (__libc_mtag_new_tag (ptr),
> -                                   CHUNK_AVAILABLE_SIZE (cp) - CHUNK_HDR_SZ);
> -     }
> ---
> -2.25.1
> -
> -
> -From 4f05837ba6934c5b8bbc6738f8883890493f50b6 Mon Sep 17 00:00:00 2001
> -From: Szabolcs Nagy <szabolcs.nagy@arm.com>
> -Date: Thu, 4 Feb 2021 11:52:14 +0000
> -Subject: [PATCH 04/11] malloc: Avoid taggig mmaped memory on free
> -
> -Either the memory belongs to the dumped area, in which case we don't
> -want to tag (the dumped area has the same tag as malloc internal data
> -so tagging is unnecessary, but chunks there may not have the right
> -alignment for the tag granule), or the memory will be unmapped
> -immediately (and thus tagging is not useful).
> -
> -Reviewed-by: DJ Delorie <dj@redhat.com>
> ----
> - malloc/malloc.c | 7 ++++---
> - 1 file changed, 4 insertions(+), 3 deletions(-)
> -
> -diff --git a/malloc/malloc.c b/malloc/malloc.c
> -index 61c25d0f93..ecb87350b0 100644
> ---- a/malloc/malloc.c
> -+++ b/malloc/malloc.c
> -@@ -3284,9 +3284,6 @@ __libc_free (void *mem)
> -
> -   p = mem2chunk (mem);
> -
> --  /* Mark the chunk as belonging to the library again.  */
> --  (void)TAG_REGION (chunk2rawmem (p), CHUNK_AVAILABLE_SIZE (p) - CHUNK_HDR_SZ);
> --
> -   if (chunk_is_mmapped (p))                       /* release mmapped memory. */
> -     {
> -       /* See if the dynamic brk/mmap threshold needs adjusting.
> -@@ -3307,6 +3304,10 @@ __libc_free (void *mem)
> -     {
> -       MAYBE_INIT_TCACHE ();
> -
> -+      /* Mark the chunk as belonging to the library again.  */
> -+      (void)TAG_REGION (chunk2rawmem (p),
> -+                      CHUNK_AVAILABLE_SIZE (p) - CHUNK_HDR_SZ);
> -+
> -       ar_ptr = arena_for_chunk (p);
> -       _int_free (ar_ptr, p, 0);
> -     }
> ---
> -2.25.1
> -
> -
> -From 673fad3798846101b77a89595cfa17f334a1c898 Mon Sep 17 00:00:00 2001
> -From: Szabolcs Nagy <szabolcs.nagy@arm.com>
> -Date: Tue, 16 Feb 2021 14:12:25 +0000
> -Subject: [PATCH 05/11] malloc: Refactor TAG_ macros to avoid indirection
> -
> -This does not change behaviour, just removes one layer of indirection
> -in the internal memory tagging logic.
> -
> -Use tag_ and mtag_ prefixes instead of __tag_ and __mtag_ since these
> -are all symbols with internal linkage, private to malloc.c, so there
> -is no user namespace pollution issue.
> -
> -Reviewed-by: DJ Delorie <dj@redhat.com>
> ----
> - malloc/arena.c  | 16 +++++-----
> - malloc/hooks.c  | 10 +++---
> - malloc/malloc.c | 81 +++++++++++++++++++++++--------------------------
> - 3 files changed, 51 insertions(+), 56 deletions(-)
> -
> -diff --git a/malloc/arena.c b/malloc/arena.c
> -index 0777dc70c6..d0778fea92 100644
> ---- a/malloc/arena.c
> -+++ b/malloc/arena.c
> -@@ -332,12 +332,12 @@ ptmalloc_init (void)
> -       if (__MTAG_SBRK_UNTAGGED)
> -       __morecore = __failing_morecore;
> -
> --      __mtag_mmap_flags = __MTAG_MMAP_FLAGS;
> --      __tag_new_memset = __mtag_tag_new_memset;
> --      __tag_region = __libc_mtag_tag_region;
> --      __tag_new_usable = __mtag_tag_new_usable;
> --      __tag_at = __libc_mtag_address_get_tag;
> --      __mtag_granule_mask = ~(size_t)(__MTAG_GRANULE_SIZE - 1);
> -+      mtag_mmap_flags = __MTAG_MMAP_FLAGS;
> -+      tag_new_memset = __mtag_tag_new_memset;
> -+      tag_region = __libc_mtag_tag_region;
> -+      tag_new_usable = __mtag_tag_new_usable;
> -+      tag_at = __libc_mtag_address_get_tag;
> -+      mtag_granule_mask = ~(size_t)(__MTAG_GRANULE_SIZE - 1);
> -     }
> - #endif
> -
> -@@ -557,7 +557,7 @@ new_heap (size_t size, size_t top_pad)
> -             }
> -         }
> -     }
> --  if (__mprotect (p2, size, MTAG_MMAP_FLAGS | PROT_READ | PROT_WRITE) != 0)
> -+  if (__mprotect (p2, size, mtag_mmap_flags | PROT_READ | PROT_WRITE) != 0)
> -     {
> -       __munmap (p2, HEAP_MAX_SIZE);
> -       return 0;
> -@@ -587,7 +587,7 @@ grow_heap (heap_info *h, long diff)
> -     {
> -       if (__mprotect ((char *) h + h->mprotect_size,
> -                       (unsigned long) new_size - h->mprotect_size,
> --                      MTAG_MMAP_FLAGS | PROT_READ | PROT_WRITE) != 0)
> -+                      mtag_mmap_flags | PROT_READ | PROT_WRITE) != 0)
> -         return -2;
> -
> -       h->mprotect_size = new_size;
> -diff --git a/malloc/hooks.c b/malloc/hooks.c
> -index efec05f0a8..d8e304c31c 100644
> ---- a/malloc/hooks.c
> -+++ b/malloc/hooks.c
> -@@ -68,7 +68,7 @@ __malloc_check_init (void)
> -    tags, so fetch the tag at each location before dereferencing
> -    it.  */
> - #define SAFE_CHAR_OFFSET(p,offset) \
> --  ((unsigned char *) TAG_AT (((unsigned char *) p) + offset))
> -+  ((unsigned char *) tag_at (((unsigned char *) p) + offset))
> -
> - /* A simple, standard set of debugging hooks.  Overhead is `only' one
> -    byte per chunk; still this will catch most cases of double frees or
> -@@ -249,7 +249,7 @@ malloc_check (size_t sz, const void *caller)
> -   top_check ();
> -   victim = _int_malloc (&main_arena, nb);
> -   __libc_lock_unlock (main_arena.mutex);
> --  return mem2mem_check (TAG_NEW_USABLE (victim), sz);
> -+  return mem2mem_check (tag_new_usable (victim), sz);
> - }
> -
> - static void
> -@@ -280,7 +280,7 @@ free_check (void *mem, const void *caller)
> -   else
> -     {
> -       /* Mark the chunk as belonging to the library again.  */
> --      (void)TAG_REGION (chunk2rawmem (p), CHUNK_AVAILABLE_SIZE (p)
> -+      (void)tag_region (chunk2rawmem (p), CHUNK_AVAILABLE_SIZE (p)
> -                                          - CHUNK_HDR_SZ);
> -       _int_free (&main_arena, p, 1);
> -       __libc_lock_unlock (main_arena.mutex);
> -@@ -375,7 +375,7 @@ invert:
> -
> -   __libc_lock_unlock (main_arena.mutex);
> -
> --  return mem2mem_check (TAG_NEW_USABLE (newmem), bytes);
> -+  return mem2mem_check (tag_new_usable (newmem), bytes);
> - }
> -
> - static void *
> -@@ -417,7 +417,7 @@ memalign_check (size_t alignment, size_t bytes, const void *caller)
> -   top_check ();
> -   mem = _int_memalign (&main_arena, alignment, bytes + 1);
> -   __libc_lock_unlock (main_arena.mutex);
> --  return mem2mem_check (TAG_NEW_USABLE (mem), bytes);
> -+  return mem2mem_check (tag_new_usable (mem), bytes);
> - }
> -
> - #if SHLIB_COMPAT (libc, GLIBC_2_0, GLIBC_2_25)
> -diff --git a/malloc/malloc.c b/malloc/malloc.c
> -index ecb87350b0..62d00f54cc 100644
> ---- a/malloc/malloc.c
> -+++ b/malloc/malloc.c
> -@@ -413,26 +413,26 @@ void *(*__morecore)(ptrdiff_t) = __default_morecore;
> -    operations can continue to be used.  Support macros are used to do
> -    this:
> -
> --   void *TAG_NEW_MEMSET (void *ptr, int, val, size_t size)
> -+   void *tag_new_memset (void *ptr, int, val, size_t size)
> -
> -    Has the same interface as memset(), but additionally allocates a
> -    new tag, colors the memory with that tag and returns a pointer that
> -    is correctly colored for that location.  The non-tagging version
> -    will simply call memset.
> -
> --   void *TAG_REGION (void *ptr, size_t size)
> -+   void *tag_region (void *ptr, size_t size)
> -
> -    Color the region of memory pointed to by PTR and size SIZE with
> -    the color of PTR.  Returns the original pointer.
> -
> --   void *TAG_NEW_USABLE (void *ptr)
> -+   void *tag_new_usable (void *ptr)
> -
> -    Allocate a new random color and use it to color the user region of
> -    a chunk; this may include data from the subsequent chunk's header
> -    if tagging is sufficiently fine grained.  Returns PTR suitably
> -    recolored for accessing the memory there.
> -
> --   void *TAG_AT (void *ptr)
> -+   void *tag_at (void *ptr)
> -
> -    Read the current color of the memory at the address pointed to by
> -    PTR (ignoring it's current color) and return PTR recolored to that
> -@@ -455,25 +455,20 @@ __default_tag_nop (void *ptr)
> -   return ptr;
> - }
> -
> --static int __mtag_mmap_flags = 0;
> --static size_t __mtag_granule_mask = ~(size_t)0;
> -+static int mtag_mmap_flags = 0;
> -+static size_t mtag_granule_mask = ~(size_t)0;
> -
> --static void *(*__tag_new_memset)(void *, int, size_t) = memset;
> --static void *(*__tag_region)(void *, size_t) = __default_tag_region;
> --static void *(*__tag_new_usable)(void *) = __default_tag_nop;
> --static void *(*__tag_at)(void *) = __default_tag_nop;
> -+static void *(*tag_new_memset)(void *, int, size_t) = memset;
> -+static void *(*tag_region)(void *, size_t) = __default_tag_region;
> -+static void *(*tag_new_usable)(void *) = __default_tag_nop;
> -+static void *(*tag_at)(void *) = __default_tag_nop;
> -
> --# define MTAG_MMAP_FLAGS __mtag_mmap_flags
> --# define TAG_NEW_MEMSET(ptr, val, size) __tag_new_memset (ptr, val, size)
> --# define TAG_REGION(ptr, size) __tag_region (ptr, size)
> --# define TAG_NEW_USABLE(ptr) __tag_new_usable (ptr)
> --# define TAG_AT(ptr) __tag_at (ptr)
> - #else
> --# define MTAG_MMAP_FLAGS 0
> --# define TAG_NEW_MEMSET(ptr, val, size) memset (ptr, val, size)
> --# define TAG_REGION(ptr, size) (ptr)
> --# define TAG_NEW_USABLE(ptr) (ptr)
> --# define TAG_AT(ptr) (ptr)
> -+# define mtag_mmap_flags 0
> -+# define tag_new_memset(ptr, val, size) memset (ptr, val, size)
> -+# define tag_region(ptr, size) (ptr)
> -+# define tag_new_usable(ptr) (ptr)
> -+# define tag_at(ptr) (ptr)
> - #endif
> -
> - #include <string.h>
> -@@ -1305,8 +1300,8 @@ nextchunk-> +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
> - /* Convert between user mem pointers and chunk pointers, updating any
> -    memory tags on the pointer to respect the tag value at that
> -    location.  */
> --#define chunk2mem(p) ((void*)TAG_AT (((char*)(p) + CHUNK_HDR_SZ)))
> --#define mem2chunk(mem) ((mchunkptr)TAG_AT (((char*)(mem) - CHUNK_HDR_SZ)))
> -+#define chunk2mem(p) ((void *)tag_at (((char*)(p) + CHUNK_HDR_SZ)))
> -+#define mem2chunk(mem) ((mchunkptr)tag_at (((char*)(mem) - CHUNK_HDR_SZ)))
> -
> - /* The smallest possible chunk */
> - #define MIN_CHUNK_SIZE        (offsetof(struct malloc_chunk, fd_nextsize))
> -@@ -1337,7 +1332,7 @@ nextchunk-> +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
> - #ifdef USE_MTAG
> - #define CHUNK_AVAILABLE_SIZE(p) \
> -   ((chunksize (p) + (chunk_is_mmapped (p) ? 0 : SIZE_SZ))     \
> --   & __mtag_granule_mask)
> -+   & mtag_granule_mask)
> - #else
> - #define CHUNK_AVAILABLE_SIZE(p) \
> -   (chunksize (p) + (chunk_is_mmapped (p) ? 0 : SIZE_SZ))
> -@@ -1361,7 +1356,7 @@ checked_request2size (size_t req, size_t *sz) __nonnull (1)
> -      number.  Ideally, this would be part of request2size(), but that
> -      must be a macro that produces a compile time constant if passed
> -      a constant literal.  */
> --  req = (req + ~__mtag_granule_mask) & __mtag_granule_mask;
> -+  req = (req + ~mtag_granule_mask) & mtag_granule_mask;
> - #endif
> -
> -   *sz = request2size (req);
> -@@ -2467,7 +2462,7 @@ sysmalloc (INTERNAL_SIZE_T nb, mstate av)
> -       if ((unsigned long) (size) > (unsigned long) (nb))
> -         {
> -           mm = (char *) (MMAP (0, size,
> --                             MTAG_MMAP_FLAGS | PROT_READ | PROT_WRITE, 0));
> -+                             mtag_mmap_flags | PROT_READ | PROT_WRITE, 0));
> -
> -           if (mm != MAP_FAILED)
> -             {
> -@@ -2665,7 +2660,7 @@ sysmalloc (INTERNAL_SIZE_T nb, mstate av)
> -           if ((unsigned long) (size) > (unsigned long) (nb))
> -             {
> -               char *mbrk = (char *) (MMAP (0, size,
> --                                         MTAG_MMAP_FLAGS | PROT_READ | PROT_WRITE,
> -+                                         mtag_mmap_flags | PROT_READ | PROT_WRITE,
> -                                          0));
> -
> -               if (mbrk != MAP_FAILED)
> -@@ -3221,14 +3216,14 @@ __libc_malloc (size_t bytes)
> -       && tcache->counts[tc_idx] > 0)
> -     {
> -       victim = tcache_get (tc_idx);
> --      return TAG_NEW_USABLE (victim);
> -+      return tag_new_usable (victim);
> -     }
> -   DIAG_POP_NEEDS_COMMENT;
> - #endif
> -
> -   if (SINGLE_THREAD_P)
> -     {
> --      victim = TAG_NEW_USABLE (_int_malloc (&main_arena, bytes));
> -+      victim = tag_new_usable (_int_malloc (&main_arena, bytes));
> -       assert (!victim || chunk_is_mmapped (mem2chunk (victim)) ||
> -             &main_arena == arena_for_chunk (mem2chunk (victim)));
> -       return victim;
> -@@ -3249,7 +3244,7 @@ __libc_malloc (size_t bytes)
> -   if (ar_ptr != NULL)
> -     __libc_lock_unlock (ar_ptr->mutex);
> -
> --  victim = TAG_NEW_USABLE (victim);
> -+  victim = tag_new_usable (victim);
> -
> -   assert (!victim || chunk_is_mmapped (mem2chunk (victim)) ||
> -           ar_ptr == arena_for_chunk (mem2chunk (victim)));
> -@@ -3305,7 +3300,7 @@ __libc_free (void *mem)
> -       MAYBE_INIT_TCACHE ();
> -
> -       /* Mark the chunk as belonging to the library again.  */
> --      (void)TAG_REGION (chunk2rawmem (p),
> -+      (void)tag_region (chunk2rawmem (p),
> -                       CHUNK_AVAILABLE_SIZE (p) - CHUNK_HDR_SZ);
> -
> -       ar_ptr = arena_for_chunk (p);
> -@@ -3408,7 +3403,7 @@ __libc_realloc (void *oldmem, size_t bytes)
> -            reused.  There's a performance hit for both us and the
> -            caller for doing this, so we might want to
> -            reconsider.  */
> --        return TAG_NEW_USABLE (newmem);
> -+        return tag_new_usable (newmem);
> -       }
> - #endif
> -       /* Note the extra SIZE_SZ overhead. */
> -@@ -3451,7 +3446,7 @@ __libc_realloc (void *oldmem, size_t bytes)
> -         {
> -         size_t sz = CHUNK_AVAILABLE_SIZE (oldp) - CHUNK_HDR_SZ;
> -         memcpy (newp, oldmem, sz);
> --        (void) TAG_REGION (chunk2rawmem (oldp), sz);
> -+        (void) tag_region (chunk2rawmem (oldp), sz);
> -           _int_free (ar_ptr, oldp, 0);
> -         }
> -     }
> -@@ -3509,7 +3504,7 @@ _mid_memalign (size_t alignment, size_t bytes, void *address)
> -       p = _int_memalign (&main_arena, alignment, bytes);
> -       assert (!p || chunk_is_mmapped (mem2chunk (p)) ||
> -             &main_arena == arena_for_chunk (mem2chunk (p)));
> --      return TAG_NEW_USABLE (p);
> -+      return tag_new_usable (p);
> -     }
> -
> -   arena_get (ar_ptr, bytes + alignment + MINSIZE);
> -@@ -3527,7 +3522,7 @@ _mid_memalign (size_t alignment, size_t bytes, void *address)
> -
> -   assert (!p || chunk_is_mmapped (mem2chunk (p)) ||
> -           ar_ptr == arena_for_chunk (mem2chunk (p)));
> --  return TAG_NEW_USABLE (p);
> -+  return tag_new_usable (p);
> - }
> - /* For ISO C11.  */
> - weak_alias (__libc_memalign, aligned_alloc)
> -@@ -3544,7 +3539,7 @@ __libc_valloc (size_t bytes)
> -   void *address = RETURN_ADDRESS (0);
> -   size_t pagesize = GLRO (dl_pagesize);
> -   p = _mid_memalign (pagesize, bytes, address);
> --  return TAG_NEW_USABLE (p);
> -+  return tag_new_usable (p);
> - }
> -
> - void *
> -@@ -3569,7 +3564,7 @@ __libc_pvalloc (size_t bytes)
> -   rounded_bytes = rounded_bytes & -(pagesize - 1);
> -
> -   p = _mid_memalign (pagesize, rounded_bytes, address);
> --  return TAG_NEW_USABLE (p);
> -+  return tag_new_usable (p);
> - }
> -
> - void *
> -@@ -3666,7 +3661,7 @@ __libc_calloc (size_t n, size_t elem_size)
> -      regardless of MORECORE_CLEARS, so we zero the whole block while
> -      doing so.  */
> - #ifdef USE_MTAG
> --  return TAG_NEW_MEMSET (mem, 0, CHUNK_AVAILABLE_SIZE (p) - CHUNK_HDR_SZ);
> -+  return tag_new_memset (mem, 0, CHUNK_AVAILABLE_SIZE (p) - CHUNK_HDR_SZ);
> - #else
> -   INTERNAL_SIZE_T csz = chunksize (p);
> -
> -@@ -4821,7 +4816,7 @@ _int_realloc(mstate av, mchunkptr oldp, INTERNAL_SIZE_T oldsize,
> -           av->top = chunk_at_offset (oldp, nb);
> -           set_head (av->top, (newsize - nb) | PREV_INUSE);
> -           check_inuse_chunk (av, oldp);
> --          return TAG_NEW_USABLE (chunk2rawmem (oldp));
> -+          return tag_new_usable (chunk2rawmem (oldp));
> -         }
> -
> -       /* Try to expand forward into next chunk;  split off remainder below */
> -@@ -4856,8 +4851,8 @@ _int_realloc(mstate av, mchunkptr oldp, INTERNAL_SIZE_T oldsize,
> -             {
> -             void *oldmem = chunk2rawmem (oldp);
> -             size_t sz = CHUNK_AVAILABLE_SIZE (oldp) - CHUNK_HDR_SZ;
> --            (void) TAG_REGION (oldmem, sz);
> --            newmem = TAG_NEW_USABLE (newmem);
> -+            (void) tag_region (oldmem, sz);
> -+            newmem = tag_new_usable (newmem);
> -             memcpy (newmem, oldmem, sz);
> -             _int_free (av, oldp, 1);
> -             check_inuse_chunk (av, newp);
> -@@ -4881,7 +4876,7 @@ _int_realloc(mstate av, mchunkptr oldp, INTERNAL_SIZE_T oldsize,
> -     {
> -       remainder = chunk_at_offset (newp, nb);
> -       /* Clear any user-space tags before writing the header.  */
> --      remainder = TAG_REGION (remainder, remainder_size);
> -+      remainder = tag_region (remainder, remainder_size);
> -       set_head_size (newp, nb | (av != &main_arena ? NON_MAIN_ARENA : 0));
> -       set_head (remainder, remainder_size | PREV_INUSE |
> -                 (av != &main_arena ? NON_MAIN_ARENA : 0));
> -@@ -4891,7 +4886,7 @@ _int_realloc(mstate av, mchunkptr oldp, INTERNAL_SIZE_T oldsize,
> -     }
> -
> -   check_inuse_chunk (av, newp);
> --  return TAG_NEW_USABLE (chunk2rawmem (newp));
> -+  return tag_new_usable (chunk2rawmem (newp));
> - }
> -
> - /*
> -@@ -5108,7 +5103,7 @@ musable (void *mem)
> -       /* The usable space may be reduced if memory tagging is needed,
> -        since we cannot share the user-space data with malloc's internal
> -        data structure.  */
> --      result &= __mtag_granule_mask;
> -+      result &= mtag_granule_mask;
> - #endif
> -       return result;
> -     }
> ---
> -2.25.1
> -
> -
> -From f0ea41e819f40aacedf25431bedd95da9c5db534 Mon Sep 17 00:00:00 2001
> -From: Szabolcs Nagy <szabolcs.nagy@arm.com>
> -Date: Wed, 27 Jan 2021 15:45:43 +0000
> -Subject: [PATCH 06/11] malloc: Use global flag instead of function pointer
> - dispatch for mtag
> -
> -A flag check can be faster than function pointers because of how
> -branch prediction and speculation works and it can also remove a layer
> -of indirection when there is a mismatch between the malloc internal
> -tag_* api and __libc_mtag_* target hooks.
> -
> -Memory tagging wrapper functions are moved to malloc.c from arena.c and
> -the logic now checks mmap_enabled.  The definition of tag_new_usable is
> -moved after chunk related definitions.
> -
> -This refactoring also allows using mtag_enabled checks instead of
> -USE_MTAG ifdefs when memory tagging support only changes code logic
> -when memory tagging is enabled at runtime. Note: an "if (false)" code
> -block is optimized away even at -O0 by gcc.
> -
> -Reviewed-by: DJ Delorie <dj@redhat.com>
> ----
> - malloc/arena.c  | 33 +---------------------------
> - malloc/malloc.c | 58 ++++++++++++++++++++++++++++++++-----------------
> - 2 files changed, 39 insertions(+), 52 deletions(-)
> -
> -diff --git a/malloc/arena.c b/malloc/arena.c
> -index d0778fea92..1e83bb66bd 100644
> ---- a/malloc/arena.c
> -+++ b/malloc/arena.c
> -@@ -287,34 +287,6 @@ extern struct dl_open_hook *_dl_open_hook;
> - libc_hidden_proto (_dl_open_hook);
> - #endif
> -
> --#ifdef USE_MTAG
> --
> --/* Generate a new (random) tag value for PTR and tag the memory it
> --   points to upto the end of the usable size for the chunk containing
> --   it.  Return the newly tagged pointer.  */
> --static void *
> --__mtag_tag_new_usable (void *ptr)
> --{
> --  if (ptr)
> --    {
> --      mchunkptr cp = mem2chunk(ptr);
> --      ptr = __libc_mtag_tag_region (__libc_mtag_new_tag (ptr),
> --                                  CHUNK_AVAILABLE_SIZE (cp) - CHUNK_HDR_SZ);
> --    }
> --  return ptr;
> --}
> --
> --/* Generate a new (random) tag value for PTR, set the tags for the
> --   memory to the new tag and initialize the memory contents to VAL.
> --   In practice this function will only be called with VAL=0, but we
> --   keep this parameter to maintain the same prototype as memset.  */
> --static void *
> --__mtag_tag_new_memset (void *ptr, int val, size_t size)
> --{
> --  return __libc_mtag_memset_with_tag (__libc_mtag_new_tag (ptr), val, size);
> --}
> --#endif
> --
> - static void
> - ptmalloc_init (void)
> - {
> -@@ -332,11 +304,8 @@ ptmalloc_init (void)
> -       if (__MTAG_SBRK_UNTAGGED)
> -       __morecore = __failing_morecore;
> -
> -+      mtag_enabled = true;
> -       mtag_mmap_flags = __MTAG_MMAP_FLAGS;
> --      tag_new_memset = __mtag_tag_new_memset;
> --      tag_region = __libc_mtag_tag_region;
> --      tag_new_usable = __mtag_tag_new_usable;
> --      tag_at = __libc_mtag_address_get_tag;
> -       mtag_granule_mask = ~(size_t)(__MTAG_GRANULE_SIZE - 1);
> -     }
> - #endif
> -diff --git a/malloc/malloc.c b/malloc/malloc.c
> -index 62d00f54cc..253a919ec5 100644
> ---- a/malloc/malloc.c
> -+++ b/malloc/malloc.c
> -@@ -441,35 +441,41 @@ void *(*__morecore)(ptrdiff_t) = __default_morecore;
> - */
> -
> - #ifdef USE_MTAG
> -+static bool mtag_enabled = false;
> -+static int mtag_mmap_flags = 0;
> -+static size_t mtag_granule_mask = ~(size_t)0;
> -+#else
> -+# define mtag_enabled false
> -+# define mtag_mmap_flags 0
> -+#endif
> -
> --/* Default implementaions when memory tagging is supported, but disabled.  */
> --static void *
> --__default_tag_region (void *ptr, size_t size)
> -+static __always_inline void *
> -+tag_region (void *ptr, size_t size)
> - {
> -+  if (__glibc_unlikely (mtag_enabled))
> -+    return __libc_mtag_tag_region (ptr, size);
> -   return ptr;
> - }
> -
> --static void *
> --__default_tag_nop (void *ptr)
> -+static __always_inline void *
> -+tag_new_memset (void *ptr, int val, size_t size)
> - {
> --  return ptr;
> -+  if (__glibc_unlikely (mtag_enabled))
> -+    return __libc_mtag_memset_with_tag (__libc_mtag_new_tag (ptr), val, size);
> -+  return memset (ptr, val, size);
> - }
> -
> --static int mtag_mmap_flags = 0;
> --static size_t mtag_granule_mask = ~(size_t)0;
> --
> --static void *(*tag_new_memset)(void *, int, size_t) = memset;
> --static void *(*tag_region)(void *, size_t) = __default_tag_region;
> --static void *(*tag_new_usable)(void *) = __default_tag_nop;
> --static void *(*tag_at)(void *) = __default_tag_nop;
> -+/* Defined later.  */
> -+static void *
> -+tag_new_usable (void *ptr);
> -
> --#else
> --# define mtag_mmap_flags 0
> --# define tag_new_memset(ptr, val, size) memset (ptr, val, size)
> --# define tag_region(ptr, size) (ptr)
> --# define tag_new_usable(ptr) (ptr)
> --# define tag_at(ptr) (ptr)
> --#endif
> -+static __always_inline void *
> -+tag_at (void *ptr)
> -+{
> -+  if (__glibc_unlikely (mtag_enabled))
> -+    return __libc_mtag_address_get_tag (ptr);
> -+  return ptr;
> -+}
> -
> - #include <string.h>
> -
> -@@ -1460,6 +1466,18 @@ checked_request2size (size_t req, size_t *sz) __nonnull (1)
> - #pragma GCC poison mchunk_size
> - #pragma GCC poison mchunk_prev_size
> -
> -+static __always_inline void *
> -+tag_new_usable (void *ptr)
> -+{
> -+  if (__glibc_unlikely (mtag_enabled) && ptr)
> -+    {
> -+      mchunkptr cp = mem2chunk(ptr);
> -+      ptr = __libc_mtag_tag_region (__libc_mtag_new_tag (ptr),
> -+                                  CHUNK_AVAILABLE_SIZE (cp) - CHUNK_HDR_SZ);
> -+    }
> -+  return ptr;
> -+}
> -+
> - /*
> -    -------------------- Internal data structures --------------------
> -
> ---
> -2.25.1
> -
> -
> -From 8597244d5c3edbd672b285eea5f6dea833256f9d Mon Sep 17 00:00:00 2001
> -From: Szabolcs Nagy <szabolcs.nagy@arm.com>
> -Date: Wed, 17 Feb 2021 10:39:37 +0000
> -Subject: [PATCH 07/11] malloc: Ensure the generic mtag hooks are not used
> -
> -Use inline functions instead of macros, because macros can cause unused
> -variable warnings and type conversion issues.  We assume these functions
> -may appear in the code but only in dead code paths (hidden by a runtime
> -check), so it's important that they can compile with correct types, but
> -if they are actually used that should be an error.
> -
> -Currently the hooks are only used when USE_MTAG is true which only
> -happens on aarch64 and then the aarch64 specific code is used not this
> -generic header.  However followup refactoring will allow the hooks to
> -be used with !USE_MTAG.
> -
> -Note: the const qualifier in the comment was wrong: changing tags is a
> -write operation.
> -
> -Reviewed-by: DJ Delorie <dj@redhat.com>
> ----
> - sysdeps/generic/libc-mtag.h | 41 ++++++++++++++++++++++++++++---------
> - 1 file changed, 31 insertions(+), 10 deletions(-)
> -
> -diff --git a/sysdeps/generic/libc-mtag.h b/sysdeps/generic/libc-mtag.h
> -index 1a866cdc0c..e8fc236b6c 100644
> ---- a/sysdeps/generic/libc-mtag.h
> -+++ b/sysdeps/generic/libc-mtag.h
> -@@ -31,22 +31,43 @@
> - /* Extra flags to pass to mmap() to request a tagged region of memory.  */
> - #define __MTAG_MMAP_FLAGS 0
> -
> -+/* Memory tagging target hooks are only called when memory tagging is
> -+   enabled at runtime.  The generic definitions here must not be used.  */
> -+void __libc_mtag_link_error (void);
> -+
> - /* Set the tags for a region of memory, which must have size and alignment
> --   that are multiples of __MTAG_GRANULE_SIZE.  Size cannot be zero.
> --   void *__libc_mtag_tag_region (const void *, size_t)  */
> --#define __libc_mtag_tag_region(p, s) (p)
> -+   that are multiples of __MTAG_GRANULE_SIZE.  Size cannot be zero.  */
> -+static inline void *
> -+__libc_mtag_tag_region (void *p, size_t n)
> -+{
> -+  __libc_mtag_link_error ();
> -+  return p;
> -+}
> -
> - /* Optimized equivalent to __libc_mtag_tag_region followed by memset.  */
> --#define __libc_mtag_memset_with_tag memset
> -+static inline void *
> -+__libc_mtag_memset_with_tag (void *p, int c, size_t n)
> -+{
> -+  __libc_mtag_link_error ();
> -+  return memset (p, c, n);
> -+}
> -
> - /* Convert address P to a pointer that is tagged correctly for that
> --   location.
> --   void *__libc_mtag_address_get_tag (void*)  */
> --#define __libc_mtag_address_get_tag(p) (p)
> -+   location.  */
> -+static inline void *
> -+__libc_mtag_address_get_tag (void *p)
> -+{
> -+  __libc_mtag_link_error ();
> -+  return p;
> -+}
> -
> - /* Assign a new (random) tag to a pointer P (does not adjust the tag on
> --   the memory addressed).
> --   void *__libc_mtag_new_tag (void*)  */
> --#define __libc_mtag_new_tag(p) (p)
> -+   the memory addressed).  */
> -+static inline void *
> -+__libc_mtag_new_tag (void *p)
> -+{
> -+  __libc_mtag_link_error ();
> -+  return p;
> -+}
> -
> - #endif /* _GENERIC_LIBC_MTAG_H */
> ---
> -2.25.1
> -
> -
> -From 3d9e16280ad881d038aedba0b6fcbd9e78b29072 Mon Sep 17 00:00:00 2001
> -From: Szabolcs Nagy <szabolcs.nagy@arm.com>
> -Date: Fri, 29 Jan 2021 17:07:28 +0000
> -Subject: [PATCH 08/11] malloc: Only support zeroing and not arbitrary memset
> - with mtag
> -
> -The memset api is suboptimal and does not provide much benefit. Memory
> -tagging only needs a zeroing memset (and only for memory that's sized
> -and aligned to multiples of the tag granule), so change the internal
> -api and the target hooks accordingly.  This is to simplify the
> -implementation of the target hook.
> -
> -Reviewed-by: DJ Delorie <dj@redhat.com>
> ----
> - malloc/malloc.c                                | 17 ++++++++---------
> - sysdeps/aarch64/Makefile                       |  2 +-
> - ...g_memset_tag.S => __mtag_tag_zero_region.S} | 18 +++++++-----------
> - sysdeps/aarch64/libc-mtag.h                    |  4 ++--
> - sysdeps/generic/libc-mtag.h                    |  6 +++---
> - 5 files changed, 21 insertions(+), 26 deletions(-)
> - rename sysdeps/aarch64/{__mtag_memset_tag.S => __mtag_tag_zero_region.S} (82%)
> -
> -diff --git a/malloc/malloc.c b/malloc/malloc.c
> -index 253a919ec5..01cf6e9325 100644
> ---- a/malloc/malloc.c
> -+++ b/malloc/malloc.c
> -@@ -413,12 +413,11 @@ void *(*__morecore)(ptrdiff_t) = __default_morecore;
> -    operations can continue to be used.  Support macros are used to do
> -    this:
> -
> --   void *tag_new_memset (void *ptr, int, val, size_t size)
> -+   void *tag_new_zero_region (void *ptr, size_t size)
> -
> --   Has the same interface as memset(), but additionally allocates a
> --   new tag, colors the memory with that tag and returns a pointer that
> --   is correctly colored for that location.  The non-tagging version
> --   will simply call memset.
> -+   Allocates a new tag, colors the memory with that tag, zeros the
> -+   memory and returns a pointer that is correctly colored for that
> -+   location.  The non-tagging version will simply call memset with 0.
> -
> -    void *tag_region (void *ptr, size_t size)
> -
> -@@ -458,11 +457,11 @@ tag_region (void *ptr, size_t size)
> - }
> -
> - static __always_inline void *
> --tag_new_memset (void *ptr, int val, size_t size)
> -+tag_new_zero_region (void *ptr, size_t size)
> - {
> -   if (__glibc_unlikely (mtag_enabled))
> --    return __libc_mtag_memset_with_tag (__libc_mtag_new_tag (ptr), val, size);
> --  return memset (ptr, val, size);
> -+    return __libc_mtag_tag_zero_region (__libc_mtag_new_tag (ptr), size);
> -+  return memset (ptr, 0, size);
> - }
> -
> - /* Defined later.  */
> -@@ -3679,7 +3678,7 @@ __libc_calloc (size_t n, size_t elem_size)
> -      regardless of MORECORE_CLEARS, so we zero the whole block while
> -      doing so.  */
> - #ifdef USE_MTAG
> --  return tag_new_memset (mem, 0, CHUNK_AVAILABLE_SIZE (p) - CHUNK_HDR_SZ);
> -+  return tag_new_zero_region (mem, CHUNK_AVAILABLE_SIZE (p) - CHUNK_HDR_SZ);
> - #else
> -   INTERNAL_SIZE_T csz = chunksize (p);
> -
> -diff --git a/sysdeps/aarch64/Makefile b/sysdeps/aarch64/Makefile
> -index d3ab37a40a..259070cfad 100644
> ---- a/sysdeps/aarch64/Makefile
> -+++ b/sysdeps/aarch64/Makefile
> -@@ -41,7 +41,7 @@ endif
> - ifeq ($(subdir),misc)
> - sysdep_headers += sys/ifunc.h
> - sysdep_routines += __mtag_address_get_tag \
> --                 __mtag_memset_tag \
> -+                 __mtag_tag_zero_region \
> -                  __mtag_new_tag \
> -                  __mtag_tag_region
> -
> -diff --git a/sysdeps/aarch64/__mtag_memset_tag.S b/sysdeps/aarch64/__mtag_tag_zero_region.S
> -similarity index 82%
> -rename from sysdeps/aarch64/__mtag_memset_tag.S
> -rename to sysdeps/aarch64/__mtag_tag_zero_region.S
> -index 3c202888a4..74d398bba5 100644
> ---- a/sysdeps/aarch64/__mtag_memset_tag.S
> -+++ b/sysdeps/aarch64/__mtag_tag_zero_region.S
> -@@ -20,9 +20,6 @@
> -
> - #ifdef USE_MTAG
> -
> --/* Use the same register names and assignments as memset.  */
> --#include "memset-reg.h"
> --
> -       .arch armv8.5-a
> -       .arch_extension memtag
> -
> -@@ -31,16 +28,15 @@
> - /* FIXME: This is a minimal implementation.  We could do much better than
> -    this for large values of COUNT.  */
> -
> --ENTRY(__libc_mtag_memset_with_tag)
> -+#define dstin x0
> -+#define count x1
> -+#define dst   x2
> -
> --      and     valw, valw, 255
> --      orr     valw, valw, valw, lsl 8
> --      orr     valw, valw, valw, lsl 16
> --      orr     val, val, val, lsl 32
> --      mov     dst, dstin
> -+ENTRY(__libc_mtag_tag_zero_region)
> -
> -+      mov     dst, dstin
> - L(loop):
> --      stgp    val, val, [dst], #16
> -+      stzg    dst, [dst], #16
> -       subs    count, count, 16
> -       bne     L(loop)
> - #if 0
> -@@ -49,5 +45,5 @@ L(loop):
> -       ldg     dstin, [dstin] // Recover the tag created (might be untagged).
> - #endif
> -       ret
> --END (__libc_mtag_memset_with_tag)
> -+END (__libc_mtag_tag_zero_region)
> - #endif /* USE_MTAG */
> -diff --git a/sysdeps/aarch64/libc-mtag.h b/sysdeps/aarch64/libc-mtag.h
> -index 979cbb743e..f58402ccf9 100644
> ---- a/sysdeps/aarch64/libc-mtag.h
> -+++ b/sysdeps/aarch64/libc-mtag.h
> -@@ -39,8 +39,8 @@
> -    void *__libc_mtag_tag_region (const void *, size_t)  */
> - void *__libc_mtag_tag_region (void *, size_t);
> -
> --/* Optimized equivalent to __libc_mtag_tag_region followed by memset.  */
> --void *__libc_mtag_memset_with_tag (void *, int, size_t);
> -+/* Optimized equivalent to __libc_mtag_tag_region followed by memset to 0.  */
> -+void *__libc_mtag_tag_zero_region (void *, size_t);
> -
> - /* Convert address P to a pointer that is tagged correctly for that
> -    location.
> -diff --git a/sysdeps/generic/libc-mtag.h b/sysdeps/generic/libc-mtag.h
> -index e8fc236b6c..4743e873f1 100644
> ---- a/sysdeps/generic/libc-mtag.h
> -+++ b/sysdeps/generic/libc-mtag.h
> -@@ -44,12 +44,12 @@ __libc_mtag_tag_region (void *p, size_t n)
> -   return p;
> - }
> -
> --/* Optimized equivalent to __libc_mtag_tag_region followed by memset.  */
> -+/* Optimized equivalent to __libc_mtag_tag_region followed by memset to 0.  */
> - static inline void *
> --__libc_mtag_memset_with_tag (void *p, int c, size_t n)
> -+__libc_mtag_tag_zero_region (void *p, size_t n)
> - {
> -   __libc_mtag_link_error ();
> --  return memset (p, c, n);
> -+  return memset (p, 0, n);
> - }
> -
> - /* Convert address P to a pointer that is tagged correctly for that
> ---
> -2.25.1
> -
> -
> -From 4d596cb72342ba0734dc847653431e078a70edfc Mon Sep 17 00:00:00 2001
> -From: Szabolcs Nagy <szabolcs.nagy@arm.com>
> -Date: Tue, 16 Feb 2021 17:02:44 +0000
> -Subject: [PATCH 09/11] malloc: Change calloc when tagging is disabled
> -
> -When glibc is built with memory tagging support (USE_MTAG) but it is not
> -enabled at runtime (mtag_enabled) then unconditional memset was used
> -even though that can be often avoided.
> -
> -This is for performance when tagging is supported but not enabled.
> -The extra check should have no overhead: tag_new_zero_region already
> -had a runtime check which the compiler can now optimize away.
> -
> -Reviewed-by: DJ Delorie <dj@redhat.com>
> ----
> - malloc/malloc.c | 10 ++++------
> - 1 file changed, 4 insertions(+), 6 deletions(-)
> -
> -diff --git a/malloc/malloc.c b/malloc/malloc.c
> -index 01cf6e9325..0b2aff3768 100644
> ---- a/malloc/malloc.c
> -+++ b/malloc/malloc.c
> -@@ -3591,11 +3591,9 @@ __libc_calloc (size_t n, size_t elem_size)
> -   mchunkptr oldtop;
> -   INTERNAL_SIZE_T sz, oldtopsize;
> -   void *mem;
> --#ifndef USE_MTAG
> -   unsigned long clearsize;
> -   unsigned long nclears;
> -   INTERNAL_SIZE_T *d;
> --#endif
> -   ptrdiff_t bytes;
> -
> -   if (__glibc_unlikely (__builtin_mul_overflow (n, elem_size, &bytes)))
> -@@ -3674,12 +3672,13 @@ __libc_calloc (size_t n, size_t elem_size)
> -     return 0;
> -
> -   mchunkptr p = mem2chunk (mem);
> -+
> -   /* If we are using memory tagging, then we need to set the tags
> -      regardless of MORECORE_CLEARS, so we zero the whole block while
> -      doing so.  */
> --#ifdef USE_MTAG
> --  return tag_new_zero_region (mem, CHUNK_AVAILABLE_SIZE (p) - CHUNK_HDR_SZ);
> --#else
> -+  if (__glibc_unlikely (mtag_enabled))
> -+    return tag_new_zero_region (mem, CHUNK_AVAILABLE_SIZE (p) - CHUNK_HDR_SZ);
> -+
> -   INTERNAL_SIZE_T csz = chunksize (p);
> -
> -   /* Two optional cases in which clearing not necessary */
> -@@ -3733,7 +3732,6 @@ __libc_calloc (size_t n, size_t elem_size)
> -     }
> -
> -   return mem;
> --#endif
> - }
> -
> - /*
> ---
> -2.25.1
> -
> -
> -From 287a35fba55a0a817db7af71ee966a37b7642bf0 Mon Sep 17 00:00:00 2001
> -From: Szabolcs Nagy <szabolcs.nagy@arm.com>
> -Date: Mon, 8 Feb 2021 12:39:01 +0000
> -Subject: [PATCH 10/11] malloc: Use branches instead of mtag_granule_mask
> -
> -The branches may be better optimized since mtag_enabled is widely used.
> -
> -Granule size larger than a chunk header is not supported since then we
> -cannot have both the chunk header and user area granule aligned.  To
> -fix that for targets with large granule, the chunk layout has to change.
> -
> -So code that attempted to handle the granule mask generally was changed.
> -This simplified CHUNK_AVAILABLE_SIZE and the logic in malloc_usable_size.
> -
> -Reviewed-by: DJ Delorie <dj@redhat.com>
> ----
> - malloc/arena.c  |  1 -
> - malloc/malloc.c | 34 ++++++++++++++--------------------
> - 2 files changed, 14 insertions(+), 21 deletions(-)
> -
> -diff --git a/malloc/arena.c b/malloc/arena.c
> -index 1e83bb66bd..9fbbb38a15 100644
> ---- a/malloc/arena.c
> -+++ b/malloc/arena.c
> -@@ -306,7 +306,6 @@ ptmalloc_init (void)
> -
> -       mtag_enabled = true;
> -       mtag_mmap_flags = __MTAG_MMAP_FLAGS;
> --      mtag_granule_mask = ~(size_t)(__MTAG_GRANULE_SIZE - 1);
> -     }
> - #endif
> -
> -diff --git a/malloc/malloc.c b/malloc/malloc.c
> -index 0b2aff3768..849bd8e2c9 100644
> ---- a/malloc/malloc.c
> -+++ b/malloc/malloc.c
> -@@ -442,7 +442,6 @@ void *(*__morecore)(ptrdiff_t) = __default_morecore;
> - #ifdef USE_MTAG
> - static bool mtag_enabled = false;
> - static int mtag_mmap_flags = 0;
> --static size_t mtag_granule_mask = ~(size_t)0;
> - #else
> - # define mtag_enabled false
> - # define mtag_mmap_flags 0
> -@@ -1333,15 +1332,16 @@ nextchunk-> +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
> -    ((req) + SIZE_SZ + MALLOC_ALIGN_MASK) & ~MALLOC_ALIGN_MASK)
> -
> - /* Available size of chunk.  This is the size of the real usable data
> --   in the chunk, plus the chunk header.  */
> --#ifdef USE_MTAG
> --#define CHUNK_AVAILABLE_SIZE(p) \
> --  ((chunksize (p) + (chunk_is_mmapped (p) ? 0 : SIZE_SZ))     \
> --   & mtag_granule_mask)
> --#else
> --#define CHUNK_AVAILABLE_SIZE(p) \
> --  (chunksize (p) + (chunk_is_mmapped (p) ? 0 : SIZE_SZ))
> --#endif
> -+   in the chunk, plus the chunk header.  Note: If memory tagging is
> -+   enabled the layout changes to accomodate the granule size, this is
> -+   wasteful for small allocations so not done by default.  The logic
> -+   does not work if chunk headers are not granule aligned.  */
> -+_Static_assert (__MTAG_GRANULE_SIZE <= CHUNK_HDR_SZ,
> -+              "memory tagging is not supported with large granule.");
> -+#define CHUNK_AVAILABLE_SIZE(p)                                       \
> -+  (__MTAG_GRANULE_SIZE > SIZE_SZ && __glibc_unlikely (mtag_enabled) ? \
> -+    chunksize (p) :                                                   \
> -+    chunksize (p) + (chunk_is_mmapped (p) ? 0 : SIZE_SZ))
> -
> - /* Check if REQ overflows when padded and aligned and if the resulting value
> -    is less than PTRDIFF_T.  Returns TRUE and the requested size or MINSIZE in
> -@@ -1353,7 +1353,6 @@ checked_request2size (size_t req, size_t *sz) __nonnull (1)
> -   if (__glibc_unlikely (req > PTRDIFF_MAX))
> -     return false;
> -
> --#ifdef USE_MTAG
> -   /* When using tagged memory, we cannot share the end of the user
> -      block with the header for the next chunk, so ensure that we
> -      allocate blocks that are rounded up to the granule size.  Take
> -@@ -1361,8 +1360,9 @@ checked_request2size (size_t req, size_t *sz) __nonnull (1)
> -      number.  Ideally, this would be part of request2size(), but that
> -      must be a macro that produces a compile time constant if passed
> -      a constant literal.  */
> --  req = (req + ~mtag_granule_mask) & mtag_granule_mask;
> --#endif
> -+  if (__glibc_unlikely (mtag_enabled))
> -+    req = (req + (__MTAG_GRANULE_SIZE - 1)) &
> -+        ~(size_t)(__MTAG_GRANULE_SIZE - 1);
> -
> -   *sz = request2size (req);
> -   return true;
> -@@ -5112,14 +5112,8 @@ musable (void *mem)
> -           result = chunksize (p) - CHUNK_HDR_SZ;
> -       }
> -       else if (inuse (p))
> --      result = chunksize (p) - SIZE_SZ;
> -+      result = CHUNK_AVAILABLE_SIZE (p) - CHUNK_HDR_SZ;
> -
> --#ifdef USE_MTAG
> --      /* The usable space may be reduced if memory tagging is needed,
> --       since we cannot share the user-space data with malloc's internal
> --       data structure.  */
> --      result &= mtag_granule_mask;
> --#endif
> -       return result;
> -     }
> -   return 0;
> ---
> -2.25.1
> -
> -
> -From 66de173bf919e601e408dc78772c6841ad6388ab Mon Sep 17 00:00:00 2001
> -From: Szabolcs Nagy <szabolcs.nagy@arm.com>
> -Date: Wed, 17 Feb 2021 10:15:18 +0000
> -Subject: [PATCH 11/11] malloc: Use mtag_enabled instead of USE_MTAG
> -
> -Use the runtime check where possible: it should not cause slow down in
> -the !USE_MTAG case since then mtag_enabled is constant false, but it
> -allows compiling the tagging logic so it's less likely to break or
> -diverge when developers only test the !USE_MTAG case.
> -
> -Reviewed-by: DJ Delorie <dj@redhat.com>
> ----
> - malloc/hooks.c  | 10 ++++------
> - malloc/malloc.c | 10 ++++------
> - 2 files changed, 8 insertions(+), 12 deletions(-)
> -
> -diff --git a/malloc/hooks.c b/malloc/hooks.c
> -index d8e304c31c..9474e199c3 100644
> ---- a/malloc/hooks.c
> -+++ b/malloc/hooks.c
> -@@ -262,11 +262,10 @@ free_check (void *mem, const void *caller)
> -
> -   int err = errno;
> -
> --#ifdef USE_MTAG
> -   /* Quickly check that the freed pointer matches the tag for the memory.
> -      This gives a useful double-free detection.  */
> --  *(volatile char *)mem;
> --#endif
> -+  if (__glibc_unlikely (mtag_enabled))
> -+    *(volatile char *)mem;
> -
> -   __libc_lock_lock (main_arena.mutex);
> -   p = mem2chunk_check (mem, NULL);
> -@@ -310,11 +309,10 @@ realloc_check (void *oldmem, size_t bytes, const void *caller)
> -       return NULL;
> -     }
> -
> --#ifdef USE_MTAG
> -   /* Quickly check that the freed pointer matches the tag for the memory.
> -      This gives a useful double-free detection.  */
> --  *(volatile char *)oldmem;
> --#endif
> -+  if (__glibc_unlikely (mtag_enabled))
> -+    *(volatile char *)oldmem;
> -
> -   __libc_lock_lock (main_arena.mutex);
> -   const mchunkptr oldp = mem2chunk_check (oldmem, &magic_p);
> -diff --git a/malloc/malloc.c b/malloc/malloc.c
> -index 849bd8e2c9..36583120ce 100644
> ---- a/malloc/malloc.c
> -+++ b/malloc/malloc.c
> -@@ -3286,11 +3286,10 @@ __libc_free (void *mem)
> -   if (mem == 0)                              /* free(0) has no effect */
> -     return;
> -
> --#ifdef USE_MTAG
> -   /* Quickly check that the freed pointer matches the tag for the memory.
> -      This gives a useful double-free detection.  */
> --  *(volatile char *)mem;
> --#endif
> -+  if (__glibc_unlikely (mtag_enabled))
> -+    *(volatile char *)mem;
> -
> -   int err = errno;
> -
> -@@ -3352,11 +3351,10 @@ __libc_realloc (void *oldmem, size_t bytes)
> -   if (oldmem == 0)
> -     return __libc_malloc (bytes);
> -
> --#ifdef USE_MTAG
> -   /* Perform a quick check to ensure that the pointer's tag matches the
> -      memory's tag.  */
> --  *(volatile char*) oldmem;
> --#endif
> -+  if (__glibc_unlikely (mtag_enabled))
> -+    *(volatile char*) oldmem;
> -
> -   /* chunk corresponding to oldmem */
> -   const mchunkptr oldp = mem2chunk (oldmem);
> ---
> -2.25.1
> -
> diff --git a/meta/recipes-core/glibc/glibc_2.33.bb b/meta/recipes-core/glibc/glibc_2.34.bb
> similarity index 78%
> rename from meta/recipes-core/glibc/glibc_2.33.bb
> rename to meta/recipes-core/glibc/glibc_2.34.bb
> index 67eb3f04bb..7ad59115b7 100644
> --- a/meta/recipes-core/glibc/glibc_2.33.bb
> +++ b/meta/recipes-core/glibc/glibc_2.34.bb
> @@ -25,7 +25,7 @@ NATIVESDKFIXES:class-nativesdk = "\
>             file://0005-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch \
>             file://0006-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch \
>             file://0007-nativesdk-glibc-Make-relocatable-install-for-locales.patch \
> -           file://faccessat2-perm.patch \
> +           file://0008-nativesdk-glibc-Fall-back-to-faccessat-on-faccess2-r.patch \
>  "
>
>  SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
> @@ -34,30 +34,28 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
>             file://makedbs.sh \
>             \
>             ${NATIVESDKFIXES} \
> -           file://0008-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch \
> -           file://0009-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch \
> -           file://0010-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch \
> -           file://0011-Quote-from-bug-1443-which-explains-what-the-patch-do.patch \
> -           file://0012-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch \
> -           file://0013-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch \
> -           file://0014-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch \
> -           file://0015-yes-within-the-path-sets-wrong-config-variables.patch \
> -           file://0016-timezone-re-written-tzselect-as-posix-sh.patch \
> -           file://0017-Remove-bash-dependency-for-nscd-init-script.patch \
> -           file://0018-eglibc-Cross-building-and-testing-instructions.patch \
> -           file://0019-eglibc-Help-bootstrap-cross-toolchain.patch \
> -           file://0020-eglibc-Resolve-__fpscr_values-on-SH4.patch \
> -           file://0021-eglibc-Forward-port-cross-locale-generation-support.patch \
> -           file://0022-Define-DUMMY_LOCALE_T-if-not-defined.patch \
> -           file://0023-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch \
> -           file://0024-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch \
> -           file://0025-intl-Emit-no-lines-in-bison-generated-files.patch \
> +           file://0009-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch \
> +           file://0010-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch \
> +           file://0011-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch \
> +           file://0012-Quote-from-bug-1443-which-explains-what-the-patch-do.patch \
> +           file://0013-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch \
> +           file://0014-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch \
> +           file://0015-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch \
> +           file://0016-yes-within-the-path-sets-wrong-config-variables.patch \
> +           file://0017-timezone-re-written-tzselect-as-posix-sh.patch \
> +           file://0018-Remove-bash-dependency-for-nscd-init-script.patch \
> +           file://0019-eglibc-Cross-building-and-testing-instructions.patch \
> +           file://0020-eglibc-Help-bootstrap-cross-toolchain.patch \
> +           file://0021-eglibc-Resolve-__fpscr_values-on-SH4.patch \
> +           file://0022-eglibc-Forward-port-cross-locale-generation-support.patch \
> +           file://0023-Define-DUMMY_LOCALE_T-if-not-defined.patch \
> +           file://0024-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch \
> +           file://0025-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch \
> +           file://0026-intl-Emit-no-lines-in-bison-generated-files.patch \
>             file://0027-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch \
>             file://0028-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch \
>             file://0029-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch \
>             file://0030-powerpc-Do-not-ask-compiler-for-finding-arch.patch \
> -           file://mte-backports.patch \
> -           file://CVE-2021-33574.patch \
>             "
>  S = "${WORKDIR}/git"
>  B = "${WORKDIR}/build-${TARGET_SYS}"
> --
> 2.32.0
