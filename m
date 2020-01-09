Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4841D7F99E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2020 01:27:47 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id x1so4516786qkl.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jan 2020 17:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=HepVRAw65W3JUAuEfVQrRzYDglmGGQmX0HNTcAo8DDM=;
	b=Hiw/Z29PJXUIMaDY7wXOOy6i4ecBwKcqQZPM8wmClZQS1G7RTteS6N0X4vjqh3rrgz
	yALuymW+NxWhhCAYvkgXo9NcikqzhyRb1vOl7aSHwdl3qIyp9xkoLhGEWKnNrumLJRvM
	2M9uhi6KZn+7X6mxUaq4HswzbwG/BvFp8O12k+FxraUd9JRFGT4qpVahW98YiyGMkNcy
	oNLJfUqiuPyyq0VxqiMCwu160B4KMgUloKLaf63LLwklT3xYvkY9vktoJHntK6EHI06d
	kBD5UmNpa1t6tXe5xgMy3NoLD5PUbRHImk1ULgLXBctKQinI1hRDYRi+ntSmzOoYKEMx
	95Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=HepVRAw65W3JUAuEfVQrRzYDglmGGQmX0HNTcAo8DDM=;
	b=Uo/OJD29ZZYgYEwMUIh9Zkm3wM/10sfW1jdPc5lB8t5mJCDXO2HpPIUm3PKG9hLKMm
	AO2UfJRVmEdZiZNk1BB9LdBNTocQCNsnkGtetqTl57aD3UU7FEPilkQePEfCEjFxOsSF
	yugOaIZ25eUh5cJNjbIwkF7VcQXEQwNxEqywym7/YgW33IwVmwshKGfv5w0wxWMo4Lbg
	JUm2piNdmFYrwwIEvo0IJfs4Xozuebfll5QPyA7C9GOK5FT0p3VHpBPQrB3T0DnOu0sO
	+xvBc2XafbLJkKxyiMcGM3l7W0lyPHv/cZ36Sp8gfe/8S4QXDB8ov7HLBGwVyhSskQXu
	6vzA==
X-Gm-Message-State: APjAAAXCxeCJg6eMrhbxKV0/SsvAY8DaCdiyo9ZeV7NwFGUiZv+XbD1Y
	Zvhd3ZRPYNm3ErmEv8apU+aaWq2CasVrBvTaCLU=
X-Google-Smtp-Source: APXvYqwmYWSBfudScFwHBNuMjLxRYeOa5jr0IEeUs4T2ztvbIhOhOtlOskgFLzJ+S4HM5PX+7ZSxcD53sRkBFq9TqzY=
X-Received: by 2002:ae9:ef50:: with SMTP id d77mr7036931qkg.71.1578533267748; 
	Wed, 08 Jan 2020 17:27:47 -0800 (PST)
MIME-Version: 1.0
References: <20200108132759.95603-1-alex.kanavin@gmail.com>
	<20200108132759.95603-13-alex.kanavin@gmail.com>
In-Reply-To: <20200108132759.95603-13-alex.kanavin@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 8 Jan 2020 17:27:21 -0800
Message-ID: <CAMKF1spRSyDFRQKMYcJpbnLKscuX=Epcif+iExAiYE3hoJutcA@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 13/28] elfutils: upgrade 0.177 -> 0.178
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
X-List-Received-Date: Thu, 09 Jan 2020 01:27:47 -0000
Content-Type: text/plain; charset="UTF-8"

regressing following package

http://errors.yoctoproject.org/Errors/Details/305730/

On Wed, Jan 8, 2020 at 5:30 AM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> Remove 0007-Fix-control-path-where-we-have-str-as-uninitialized-.patch
> as issue fixed upstream.
>
> Rebase other patches.
>
> Adjust ptests, pass rate is now 100% again:
>
> ======================
> All 206 tests passed
> (6 tests were not run)
> ======================
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  .../{elfutils_0.177.bb => elfutils_0.178.bb}  | 27 +++---
>  .../elfutils/files/0001-dso-link-change.patch | 12 +--
>  ...libasm-may-link-with-libbz2-if-found.patch |  8 +-
>  ...-fts.patch => 0001-musl-obstack-fts.patch} | 55 ++++++------
>  .../{musl-libs.patch => 0002-musl-libs.patch} |  7 +-
>  ...musl-utils.patch => 0003-musl-utils.patch} | 19 +++--
>  ...sts.patch => 0004-Fix-error-on-musl.patch} | 20 +++--
>  ...-where-we-have-str-as-uninitialized-.patch | 42 ---------
>  .../elfutils/files/debian/hppa_backend.diff   | 51 ++++++-----
>  .../elfutils/files/debian/mips_backend.diff   | 85 ++++++++++---------
>  .../elfutils/files/debian/mips_cfi.patch      | 22 +++--
>  11 files changed, 162 insertions(+), 186 deletions(-)
>  rename meta/recipes-devtools/elfutils/{elfutils_0.177.bb => elfutils_0.178.bb} (87%)
>  rename meta/recipes-devtools/elfutils/files/{musl-obstack-fts.patch => 0001-musl-obstack-fts.patch} (78%)
>  rename meta/recipes-devtools/elfutils/files/{musl-libs.patch => 0002-musl-libs.patch} (97%)
>  rename meta/recipes-devtools/elfutils/files/{musl-utils.patch => 0003-musl-utils.patch} (91%)
>  rename meta/recipes-devtools/elfutils/files/{musl-tests.patch => 0004-Fix-error-on-musl.patch} (69%)
>  delete mode 100644 meta/recipes-devtools/elfutils/files/0007-Fix-control-path-where-we-have-str-as-uninitialized-.patch
>
> diff --git a/meta/recipes-devtools/elfutils/elfutils_0.177.bb b/meta/recipes-devtools/elfutils/elfutils_0.178.bb
> similarity index 87%
> rename from meta/recipes-devtools/elfutils/elfutils_0.177.bb
> rename to meta/recipes-devtools/elfutils/elfutils_0.178.bb
> index e7740c7fb46..9393628dd13 100644
> --- a/meta/recipes-devtools/elfutils/elfutils_0.177.bb
> +++ b/meta/recipes-devtools/elfutils/elfutils_0.178.bb
> @@ -13,7 +13,6 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
>             file://0003-fixheadercheck.patch \
>             file://0004-Disable-the-test-to-convert-euc-jp.patch \
>             file://0006-Fix-build-on-aarch64-musl.patch \
> -           file://0007-Fix-control-path-where-we-have-str-as-uninitialized-.patch \
>             file://0001-libasm-may-link-with-libbz2-if-found.patch \
>             file://0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch \
>             file://debian/hppa_backend.diff \
> @@ -36,17 +35,17 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
>             file://ptest.patch \
>             "
>  SRC_URI_append_libc-musl = " \
> -           file://musl-obstack-fts.patch \
> -           file://musl-libs.patch \
> -           file://musl-utils.patch \
> -           file://musl-tests.patch \
> +           file://0001-musl-obstack-fts.patch \
> +           file://0002-musl-libs.patch \
> +           file://0003-musl-utils.patch \
> +           file://0004-Fix-error-on-musl.patch \
>             "
> -SRC_URI[md5sum] = "0b583722f911e1632544718d502aab87"
> -SRC_URI[sha256sum] = "fa489deccbcae7d8c920f60d85906124c1989c591196d90e0fd668e3dc05042e"
> +SRC_URI[md5sum] = "5480d0b7174446aba13a6adde107287f"
> +SRC_URI[sha256sum] = "31e7a00e96d4e9c4bda452e1f2cdac4daf8abd24f5e154dee232131899f3a0f2"
>
> -inherit autotools gettext ptest
> +inherit autotools gettext ptest pkgconfig
>
> -EXTRA_OECONF = "--program-prefix=eu-"
> +EXTRA_OECONF = "--program-prefix=eu- --disable-debuginfod"
>
>  DEPENDS_BZIP2 = "bzip2-replacement-native"
>  DEPENDS_BZIP2_class-target = "bzip2"
> @@ -73,10 +72,11 @@ do_compile_ptest() {
>  do_install_ptest() {
>         if [ ${PTEST_ENABLED} = "1" ]; then
>                 # copy the files which needed by the cases
> -               TEST_FILES="strip strip.o addr2line elfcmp objdump readelf size.o nm.o nm elflint"
> +               TEST_FILES="strip strip.o addr2line elfcmp objdump readelf size.o nm.o nm elflint elfcompress elfclassify stack unstrip"
>                 install -d -m 755                       ${D}${PTEST_PATH}/src
>                 install -d -m 755                       ${D}${PTEST_PATH}/libelf
>                 install -d -m 755                       ${D}${PTEST_PATH}/libdw
> +               install -d -m 755                       ${D}${PTEST_PATH}/libasm
>                 for test_file in ${TEST_FILES}; do
>                         if [ -f ${B}/src/${test_file} ]; then
>                                 cp -r ${B}/src/${test_file} ${D}${PTEST_PATH}/src
> @@ -84,6 +84,7 @@ do_install_ptest() {
>                 done
>                 cp ${D}${libdir}/libelf-${PV}.so ${D}${PTEST_PATH}/libelf/libelf.so
>                 cp ${D}${libdir}/libdw-${PV}.so ${D}${PTEST_PATH}/libdw/libdw.so
> +               cp ${D}${libdir}/libasm-${PV}.so ${D}${PTEST_PATH}/libasm/libasm.so
>                 cp -r ${S}/tests/                       ${D}${PTEST_PATH}
>                 cp -r ${B}/tests/*                      ${D}${PTEST_PATH}/tests
>                 cp -r ${B}/config.h                     ${D}${PTEST_PATH}
> @@ -146,10 +147,14 @@ INHIBIT_PACKAGE_STRIP_FILES = "\
>      ${PKGD}${PTEST_PATH}/src/readelf \
>      ${PKGD}${PTEST_PATH}/src/nm \
>      ${PKGD}${PTEST_PATH}/src/elflint \
> +    ${PKGD}${PTEST_PATH}/src/elfclassify \
> +    ${PKGD}${PTEST_PATH}/src/stack \
> +    ${PKGD}${PTEST_PATH}/src/unstrip \
>      ${PKGD}${PTEST_PATH}/libelf/libelf.so \
>      ${PKGD}${PTEST_PATH}/libdw/libdw.so \
> +    ${PKGD}${PTEST_PATH}/libasm/libasm.so \
>      ${PKGD}${PTEST_PATH}/backends/libebl_i386.so \
>      ${PKGD}${PTEST_PATH}/backends/libebl_x86_64.so \
>  "
>
> -PRIVATE_LIBS_${PN}-ptest = "libdw.so.1 libelf.so.1"
> +PRIVATE_LIBS_${PN}-ptest = "libdw.so.1 libelf.so.1 libasm.so.1"
> diff --git a/meta/recipes-devtools/elfutils/files/0001-dso-link-change.patch b/meta/recipes-devtools/elfutils/files/0001-dso-link-change.patch
> index af79ef496dd..62031073e31 100644
> --- a/meta/recipes-devtools/elfutils/files/0001-dso-link-change.patch
> +++ b/meta/recipes-devtools/elfutils/files/0001-dso-link-change.patch
> @@ -1,4 +1,4 @@
> -From b99aa12cf879ce200e03d75e543c7ab2dfa5503b Mon Sep 17 00:00:00 2001
> +From ec9a7742734aae5417c0ebbffce66ac353e6cae7 Mon Sep 17 00:00:00 2001
>  From: Hongxu Jia <hongxu.jia@windriver.com>
>  Date: Tue, 15 Aug 2017 17:10:57 +0800
>  Subject: [PATCH] dso link change
> @@ -23,10 +23,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
>  diff --git a/src/Makefile.am b/src/Makefile.am
> -index 2b1c0dc..9305b84 100644
> +index e462e7d..ea1215b 100644
>  --- a/src/Makefile.am
>  +++ b/src/Makefile.am
> -@@ -44,7 +44,7 @@ libdw = ../libdw/libdw.a -lz $(zip_LIBS) $(libelf) $(libebl) -ldl
> +@@ -45,7 +45,7 @@ libdw = ../libdw/libdw.a -lz $(zip_LIBS) $(libelf) -ldl -lpthread
>   libelf = ../libelf/libelf.a -lz
>   else
>   libasm = ../libasm/libasm.so
> @@ -34,12 +34,12 @@ index 2b1c0dc..9305b84 100644
>  +libdw = ../libdw/libdw.so $(zip_LIBS) $(libelf) $(libebl) -ldl
>   libelf = ../libelf/libelf.so
>   endif
> - libebl = ../libebl/libebl.a
> + libebl = ../libebl/libebl.a ../backends/libebl_backends.a ../libcpu/libcpu.a
>  diff --git a/tests/Makefile.am b/tests/Makefile.am
> -index 1b0c7d3..bced19b 100644
> +index eab4ae6..f59a01f 100644
>  --- a/tests/Makefile.am
>  +++ b/tests/Makefile.am
> -@@ -476,7 +476,7 @@ libdw = ../libdw/libdw.a -lz $(zip_LIBS) $(libelf) $(libebl) -ldl
> +@@ -516,7 +516,7 @@ libdw = ../libdw/libdw.a -lz $(zip_LIBS) $(libelf) $(libebl) -ldl -lpthread
>   libelf = ../libelf/libelf.a -lz
>   libasm = ../libasm/libasm.a
>   else
> diff --git a/meta/recipes-devtools/elfutils/files/0001-libasm-may-link-with-libbz2-if-found.patch b/meta/recipes-devtools/elfutils/files/0001-libasm-may-link-with-libbz2-if-found.patch
> index 0d533c8f10a..73ead6d412f 100644
> --- a/meta/recipes-devtools/elfutils/files/0001-libasm-may-link-with-libbz2-if-found.patch
> +++ b/meta/recipes-devtools/elfutils/files/0001-libasm-may-link-with-libbz2-if-found.patch
> @@ -1,4 +1,4 @@
> -From d7be687c35fa42954874034c82ca9059d28196fe Mon Sep 17 00:00:00 2001
> +From 8e5fff8b1d819e0870fb22b27950bb5f10c7a272 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Wed, 4 Oct 2017 22:30:46 -0700
>  Subject: [PATCH] libasm may link with libbz2 if found
> @@ -17,16 +17,16 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
>  diff --git a/src/Makefile.am b/src/Makefile.am
> -index 9305b84..9b7e853 100644
> +index ea1215b..13d9bda 100644
>  --- a/src/Makefile.am
>  +++ b/src/Makefile.am
> -@@ -39,11 +39,11 @@ EXTRA_DIST += make-debug-archive.in
> +@@ -40,11 +40,11 @@ EXTRA_DIST += make-debug-archive.in
>   CLEANFILES += make-debug-archive
>
>   if BUILD_STATIC
>  -libasm = ../libasm/libasm.a
>  +libasm = ../libasm/libasm.a $(zip_LIBS)
> - libdw = ../libdw/libdw.a -lz $(zip_LIBS) $(libelf) $(libebl) -ldl
> + libdw = ../libdw/libdw.a -lz $(zip_LIBS) $(libelf) -ldl -lpthread
>   libelf = ../libelf/libelf.a -lz
>   else
>  -libasm = ../libasm/libasm.so
> diff --git a/meta/recipes-devtools/elfutils/files/musl-obstack-fts.patch b/meta/recipes-devtools/elfutils/files/0001-musl-obstack-fts.patch
> similarity index 78%
> rename from meta/recipes-devtools/elfutils/files/musl-obstack-fts.patch
> rename to meta/recipes-devtools/elfutils/files/0001-musl-obstack-fts.patch
> index 40f2b69cf4c..f751a2ecdbe 100644
> --- a/meta/recipes-devtools/elfutils/files/musl-obstack-fts.patch
> +++ b/meta/recipes-devtools/elfutils/files/0001-musl-obstack-fts.patch
> @@ -1,7 +1,7 @@
> -From 77b89dbc9f9f965ad0ef2e341d7d46bce5f07549 Mon Sep 17 00:00:00 2001
> +From 8ccf3d92b8766b53f203df7e01b489604ef851f3 Mon Sep 17 00:00:00 2001
>  From: Hongxu Jia <hongxu.jia@windriver.com>
>  Date: Fri, 23 Aug 2019 10:17:25 +0800
> -Subject: [PATCH 1/3] musl-obstack-fts
> +Subject: [PATCH 1/4] musl-obstack-fts
>
>  Look for libfts and libobstack during configure, these
>  libraries are external to libc when using musl, whereas
> @@ -12,17 +12,18 @@ Upstream-Status: Inappropriate [workaround for musl]
>
>  Rebase to 0.177
>  Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +
>  ---
> - configure.ac      | 54 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
> + configure.ac      | 54 +++++++++++++++++++++++++++++++++++++++++++++++
>   libdw/Makefile.am |  2 +-
> - src/Makefile.am   |  8 ++++----
> - 3 files changed, 59 insertions(+), 5 deletions(-)
> + src/Makefile.am   |  6 +++---
> + 3 files changed, 58 insertions(+), 4 deletions(-)
>
>  diff --git a/configure.ac b/configure.ac
> -index f93964c..b87b762 100644
> +index cad7b2b..6d4229b 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -494,6 +494,60 @@ else
> +@@ -529,6 +529,60 @@ else
>   fi
>   AC_SUBST([argp_LDADD])
>
> @@ -84,45 +85,43 @@ index f93964c..b87b762 100644
>
>   dnl Documentation.
>  diff --git a/libdw/Makefile.am b/libdw/Makefile.am
> -index 7a3d532..a541fa3 100644
> +index 33b5838..ff92e02 100644
>  --- a/libdw/Makefile.am
>  +++ b/libdw/Makefile.am
> -@@ -108,7 +108,7 @@ am_libdw_pic_a_OBJECTS = $(libdw_a_SOURCES:.c=.os)
> - libdw_so_LIBS = libdw_pic.a ../libdwelf/libdwelf_pic.a \
> -         ../libdwfl/libdwfl_pic.a ../libebl/libebl.a
> +@@ -109,7 +109,7 @@ libdw_so_LIBS = ../libebl/libebl_pic.a ../backends/libebl_backends_pic.a \
> +               ../libcpu/libcpu_pic.a libdw_pic.a ../libdwelf/libdwelf_pic.a \
> +               ../libdwfl/libdwfl_pic.a
>   libdw_so_DEPS = ../lib/libeu.a ../libelf/libelf.so
> --libdw_so_LDLIBS = $(libdw_so_DEPS) -ldl -lz $(argp_LDADD) $(zip_LIBS)
> -+libdw_so_LDLIBS = $(libdw_so_DEPS) -ldl -lz $(argp_LDADD) $(fts_LDADD) $(zip_LIBS)
> +-libdw_so_LDLIBS = $(libdw_so_DEPS) -ldl -lz $(argp_LDADD) $(zip_LIBS) -pthread
> ++libdw_so_LDLIBS = $(libdw_so_DEPS) -ldl -lz $(argp_LDADD) $(fts_LDADD) $(zip_LIBS) -pthread
>   libdw_so_SOURCES =
>   libdw.so$(EXEEXT): $(srcdir)/libdw.map $(libdw_so_LIBS) $(libdw_so_DEPS)
> - # The rpath is necessary for libebl because its $ORIGIN use will
> +       $(AM_V_CCLD)$(LINK) $(dso_LDFLAGS) -o $@ \
>  diff --git a/src/Makefile.am b/src/Makefile.am
> -index b72f853..2f3dfce 100644
> +index 13d9bda..d5a4f7d 100644
>  --- a/src/Makefile.am
>  +++ b/src/Makefile.am
> -@@ -69,8 +69,8 @@ ar_no_Wstack_usage = yes
> +@@ -69,7 +69,7 @@ ar_no_Wstack_usage = yes
>   unstrip_no_Wstack_usage = yes
>
> - readelf_LDADD = $(libdw) $(libebl) $(libelf) $(libeu) $(argp_LDADD) -ldl
> --nm_LDADD = $(libdw) $(libebl) $(libelf) $(libeu) $(argp_LDADD) -ldl \
> --         $(demanglelib)
> -+nm_LDADD = $(libdw) $(libebl) $(libelf) $(libeu) $(argp_LDADD) \
> -+         $(obstack_LDADD) -ldl $(demanglelib)
> + readelf_LDADD = $(libdw) $(libebl) $(libelf) $(libeu) $(argp_LDADD)
> +-nm_LDADD = $(libdw) $(libebl) $(libelf) $(libeu) $(argp_LDADD) \
> ++nm_LDADD = $(libdw) $(libebl) $(libelf) $(libeu) $(argp_LDADD) $(obstack_LDADD) \
> +          $(demanglelib)
>   size_LDADD = $(libelf) $(libeu) $(argp_LDADD)
> - strip_LDADD = $(libebl) $(libelf) $(libdw) $(libeu) $(argp_LDADD) -ldl
> - elflint_LDADD  = $(libebl) $(libelf) $(libeu) $(argp_LDADD) -ldl
> + strip_LDADD = $(libebl) $(libelf) $(libdw) $(libeu) $(argp_LDADD)
>  @@ -78,9 +78,9 @@ findtextrel_LDADD = $(libdw) $(libelf) $(libeu) $(argp_LDADD)
>   addr2line_LDADD = $(libdw) $(libelf) $(libeu) $(argp_LDADD) $(demanglelib)
> - elfcmp_LDADD = $(libebl) $(libelf) $(libeu) $(argp_LDADD) -ldl
> - objdump_LDADD  = $(libasm) $(libebl) $(libelf) $(libeu) $(argp_LDADD) -ldl
> + elfcmp_LDADD = $(libebl) $(libdw) $(libelf) $(libeu) $(argp_LDADD)
> + objdump_LDADD  = $(libasm) $(libebl) $(libdw) $(libelf) $(libeu) $(argp_LDADD)
>  -ranlib_LDADD = libar.a $(libelf) $(libeu) $(argp_LDADD)
>  +ranlib_LDADD = libar.a $(libelf) $(libeu) $(argp_LDADD) $(obstack_LDADD)
>   strings_LDADD = $(libelf) $(libeu) $(argp_LDADD)
>  -ar_LDADD = libar.a $(libelf) $(libeu) $(argp_LDADD)
>  +ar_LDADD = libar.a $(libelf) $(libeu) $(argp_LDADD) $(obstack_LDADD)
> - unstrip_LDADD = $(libebl) $(libelf) $(libdw) $(libeu) $(argp_LDADD) -ldl
> - stack_LDADD = $(libebl) $(libelf) $(libdw) $(libeu) $(argp_LDADD) -ldl $(demanglelib)
> + unstrip_LDADD = $(libebl) $(libelf) $(libdw) $(libeu) $(argp_LDADD)
> + stack_LDADD = $(libebl) $(libelf) $(libdw) $(libeu) $(argp_LDADD) $(demanglelib)
>   elfcompress_LDADD = $(libebl) $(libelf) $(libdw) $(libeu) $(argp_LDADD)
>  --
> -2.7.4
> +2.17.1
>
> diff --git a/meta/recipes-devtools/elfutils/files/musl-libs.patch b/meta/recipes-devtools/elfutils/files/0002-musl-libs.patch
> similarity index 97%
> rename from meta/recipes-devtools/elfutils/files/musl-libs.patch
> rename to meta/recipes-devtools/elfutils/files/0002-musl-libs.patch
> index b9b9f120dfa..cf146838645 100644
> --- a/meta/recipes-devtools/elfutils/files/musl-libs.patch
> +++ b/meta/recipes-devtools/elfutils/files/0002-musl-libs.patch
> @@ -1,7 +1,7 @@
> -From d5a1651df9884fcf57ed320bc2f866538af2f420 Mon Sep 17 00:00:00 2001
> +From ea908c7009de5a208383abf4bec4c6b3d9519ca3 Mon Sep 17 00:00:00 2001
>  From: Hongxu Jia <hongxu.jia@windriver.com>
>  Date: Fri, 23 Aug 2019 10:18:47 +0800
> -Subject: [PATCH 2/3] musl-libs
> +Subject: [PATCH 2/4] musl-libs
>
>  Collection of fixes needed to compile libelf and other libraries
>  provided by elfutils for musl targets
> @@ -14,6 +14,7 @@ Upstream-Status: Inappropriate [workaround for musl]
>
>  Rebase to 0.177
>  Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +
>  ---
>   lib/error.h                    | 27 +++++++++++++++++++++++++++
>   lib/fixedsizehash.h            |  1 -
> @@ -140,5 +141,5 @@ index bed273d..be228e6 100644
>  +#endif
>   #endif        /* elf.h */
>  --
> -2.7.4
> +2.17.1
>
> diff --git a/meta/recipes-devtools/elfutils/files/musl-utils.patch b/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch
> similarity index 91%
> rename from meta/recipes-devtools/elfutils/files/musl-utils.patch
> rename to meta/recipes-devtools/elfutils/files/0003-musl-utils.patch
> index a8ad9312364..79c9d9ad578 100644
> --- a/meta/recipes-devtools/elfutils/files/musl-utils.patch
> +++ b/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch
> @@ -1,7 +1,7 @@
> -From 7f5e2fd86d54e0a4d195ec65afb9b411829dff9f Mon Sep 17 00:00:00 2001
> +From 94028b16e56c8eef1aa02dcc4da268a0e471b4ea Mon Sep 17 00:00:00 2001
>  From: Hongxu Jia <hongxu.jia@windriver.com>
>  Date: Fri, 23 Aug 2019 10:19:48 +0800
> -Subject: [PATCH 3/3] musl-utils
> +Subject: [PATCH 3/4] musl-utils
>
>  Provide missing defines which otherwise are available on glibc system headers
>
> @@ -13,6 +13,7 @@ Upstream-Status: Inappropriate [workaround for musl]
>
>  Rebase to 0.177
>  Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +
>  ---
>   src/arlib.h       |  6 ++++++
>   src/elfcompress.c |  7 +++++++
> @@ -57,10 +58,10 @@ index 6ba6af4..0c7674b 100644
>   ARGP_PROGRAM_VERSION_HOOK_DEF = print_version;
>
>  diff --git a/src/readelf.c b/src/readelf.c
> -index 5c02a9b..817562d 100644
> +index 5994615..f3cc071 100644
>  --- a/src/readelf.c
>  +++ b/src/readelf.c
> -@@ -4813,10 +4813,11 @@ listptr_base (struct listptr *p)
> +@@ -4829,10 +4829,11 @@ listptr_base (struct listptr *p)
>     return cudie_base (&cu);
>   }
>
> @@ -74,7 +75,7 @@ index 5c02a9b..817562d 100644
>     struct listptr *p1 = (void *) a;
>     struct listptr *p2 = (void *) b;
>
> -@@ -4832,21 +4833,21 @@ compare_listptr (const void *a, const void *b, void *arg)
> +@@ -4848,21 +4849,21 @@ compare_listptr (const void *a, const void *b, void *arg)
>           p1->warned = p2->warned = true;
>           error (0, 0,
>                  gettext ("%s %#" PRIx64 " used with different address sizes"),
> @@ -99,7 +100,7 @@ index 5c02a9b..817562d 100644
>         }
>         if (p1->attr != p2 ->attr)
>         {
> -@@ -4854,7 +4855,7 @@ compare_listptr (const void *a, const void *b, void *arg)
> +@@ -4870,7 +4871,7 @@ compare_listptr (const void *a, const void *b, void *arg)
>           error (0, 0,
>                  gettext ("%s %#" PRIx64
>                           " used with different attribute %s and %s"),
> @@ -108,7 +109,7 @@ index 5c02a9b..817562d 100644
>                  dwarf_attr_name (p2->attr));
>         }
>       }
> -@@ -4926,8 +4927,11 @@ static void
> +@@ -4942,8 +4943,11 @@ static void
>   sort_listptr (struct listptr_table *table, const char *name)
>   {
>     if (table->n > 0)
> @@ -141,7 +142,7 @@ index 4054c2a..d2d2176 100644
>
>   /* Name and version of program.  */
>  diff --git a/src/unstrip.c b/src/unstrip.c
> -index fc87832..21ea6b3 100644
> +index 9b8c09a..1fb5063 100644
>  --- a/src/unstrip.c
>  +++ b/src/unstrip.c
>  @@ -56,6 +56,15 @@
> @@ -161,5 +162,5 @@ index fc87832..21ea6b3 100644
>   ARGP_PROGRAM_VERSION_HOOK_DEF = print_version;
>
>  --
> -2.7.4
> +2.17.1
>
> diff --git a/meta/recipes-devtools/elfutils/files/musl-tests.patch b/meta/recipes-devtools/elfutils/files/0004-Fix-error-on-musl.patch
> similarity index 69%
> rename from meta/recipes-devtools/elfutils/files/musl-tests.patch
> rename to meta/recipes-devtools/elfutils/files/0004-Fix-error-on-musl.patch
> index be35791b1af..1b2f9ed98b2 100644
> --- a/meta/recipes-devtools/elfutils/files/musl-tests.patch
> +++ b/meta/recipes-devtools/elfutils/files/0004-Fix-error-on-musl.patch
> @@ -1,4 +1,7 @@
> -Fix error on musl:
> +From 7ff8cbecde7455b530fa7894a78d2326799f2556 Mon Sep 17 00:00:00 2001
> +From: Richard Purdie <richard.purdie@linuxfoundation.org>
> +Date: Wed, 1 May 2019 22:15:03 +0100
> +Subject: [PATCH 4/4] Fix error on musl:
>
>  | ../../elfutils-0.176/tests/elfstrmerge.c: In function 'main':
>  | ../../elfutils-0.176/tests/elfstrmerge.c:370:60: error: 'ALLPERMS' undeclared (first use in this function); did you mean 'EPERM'?
> @@ -11,10 +14,14 @@ Upstream-Status: Inappropriate [workaround in musl]
>
>  Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> -Index: elfutils-0.176/tests/elfstrmerge.c
> -===================================================================
> ---- elfutils-0.176.orig/tests/elfstrmerge.c
> -+++ elfutils-0.176/tests/elfstrmerge.c
> +---
> + tests/elfstrmerge.c | 5 +++++
> + 1 file changed, 5 insertions(+)
> +
> +diff --git a/tests/elfstrmerge.c b/tests/elfstrmerge.c
> +index ba0d68d..1d2447f 100644
> +--- a/tests/elfstrmerge.c
> ++++ b/tests/elfstrmerge.c
>  @@ -33,6 +33,11 @@
>   #include ELFUTILS_HEADER(dwelf)
>   #include "elf-knowledge.h"
> @@ -27,3 +34,6 @@ Index: elfutils-0.176/tests/elfstrmerge.c
>   /* The original ELF file.  */
>   static int fd = -1;
>   static Elf *elf = NULL;
> +--
> +2.17.1
> +
> diff --git a/meta/recipes-devtools/elfutils/files/0007-Fix-control-path-where-we-have-str-as-uninitialized-.patch b/meta/recipes-devtools/elfutils/files/0007-Fix-control-path-where-we-have-str-as-uninitialized-.patch
> deleted file mode 100644
> index 611a24c0f54..00000000000
> --- a/meta/recipes-devtools/elfutils/files/0007-Fix-control-path-where-we-have-str-as-uninitialized-.patch
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -From 112d1645bab7922c7796fe32ddea8fa6e1bbded1 Mon Sep 17 00:00:00 2001
> -From: Hongxu Jia <hongxu.jia@windriver.com>
> -Date: Fri, 29 Jun 2018 15:14:28 +0800
> -Subject: [PATCH] Fix control path where we have str as uninitialized string
> -
> -|
> -/home/ubuntu/work/oe/openembedded-core/build/tmp-musl/work/i586-oe-linux-musl/elfutils/0.164-r0/elfutils-0.164/libcpu/i386_disasm.c:
> -In function 'i386_disasm':
> -|
> -/home/ubuntu/work/oe/openembedded-core/build/tmp-musl/work/i586-oe-linux-musl/elfutils/0.164-r0/elfutils-0.164/libcpu/i386_disasm.c:310:5:
> -error: 'str' may be used uninitialized in this function
> -[-Werror=maybe-uninitialized]
> -|      memcpy (buf + bufcnt, _str, _len);           \
> -|      ^
> -|
> -/home/ubuntu/work/oe/openembedded-core/build/tmp-musl/work/i586-oe-linux-musl/elfutils/0.164-r0/elfutils-0.164/libcpu/i386_disasm.c:709:17:
> -note: 'str' was declared here
> -|      const char *str;
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -Upstream-Status: Pending
> -
> -Rebase to 0.172
> -
> -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> -
> ----
> - libcpu/i386_disasm.c | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/libcpu/i386_disasm.c b/libcpu/i386_disasm.c
> -index a7e03f9..837a3a8 100644
> ---- a/libcpu/i386_disasm.c
> -+++ b/libcpu/i386_disasm.c
> -@@ -821,6 +821,7 @@ i386_disasm (Ebl *ebl __attribute__((unused)),
> -                           }
> -                         FALLTHROUGH;
> -                       default:
> -+                        str = "";
> -                         assert (! "INVALID not handled");
> -                       }
> -                   }
> diff --git a/meta/recipes-devtools/elfutils/files/debian/hppa_backend.diff b/meta/recipes-devtools/elfutils/files/debian/hppa_backend.diff
> index 4460d582c73..53fa2f435b4 100644
> --- a/meta/recipes-devtools/elfutils/files/debian/hppa_backend.diff
> +++ b/meta/recipes-devtools/elfutils/files/debian/hppa_backend.diff
> @@ -1,4 +1,4 @@
> -From 8efad9105b38985bea373416ae8fcacf21d1d129 Mon Sep 17 00:00:00 2001
> +From ffb811e18d7046d5bbe54ede5b1b7e14eaac0146 Mon Sep 17 00:00:00 2001
>  From: Hongxu Jia <hongxu.jia@windriver.com>
>  Date: Wed, 21 Aug 2019 15:44:18 +0800
>  Subject: [PATCH] hppa backend
> @@ -6,15 +6,16 @@ Subject: [PATCH] hppa backend
>  Rebase to 0.177
>  Upstream-Status: Pending [from debian]
>  Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +
>  ---
>   backends/Makefile.am      |   7 +-
>   backends/libebl_parisc.h  |   9 ++
> - backends/parisc_init.c    |  73 ++++++++++++++++
> - backends/parisc_regs.c    | 159 ++++++++++++++++++++++++++++++++++
> - backends/parisc_reloc.def | 128 ++++++++++++++++++++++++++++
> - backends/parisc_retval.c  | 213 ++++++++++++++++++++++++++++++++++++++++++++++
> - backends/parisc_symbol.c  | 113 ++++++++++++++++++++++++
> - libelf/elf.h              |  11 +++
> + backends/parisc_init.c    |  73 +++++++++++++
> + backends/parisc_regs.c    | 159 ++++++++++++++++++++++++++++
> + backends/parisc_reloc.def | 128 +++++++++++++++++++++++
> + backends/parisc_retval.c  | 213 ++++++++++++++++++++++++++++++++++++++
> + backends/parisc_symbol.c  | 113 ++++++++++++++++++++
> + libelf/elf.h              |  11 ++
>   8 files changed, 711 insertions(+), 2 deletions(-)
>   create mode 100644 backends/libebl_parisc.h
>   create mode 100644 backends/parisc_init.c
> @@ -24,31 +25,30 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>   create mode 100644 backends/parisc_symbol.c
>
>  diff --git a/backends/Makefile.am b/backends/Makefile.am
> -index 175468f..91a38e2 100644
> +index f405212..4755f61 100644
>  --- a/backends/Makefile.am
>  +++ b/backends/Makefile.am
> -@@ -33,16 +33,19 @@ AM_CPPFLAGS += -I$(top_srcdir)/libebl -I$(top_srcdir)/libasm \
> -
> +@@ -37,7 +37,9 @@ AM_CPPFLAGS += -I$(top_srcdir)/libebl -I$(top_srcdir)/libasm \
> + noinst_LIBRARIES = libebl_backends.a libebl_backends_pic.a
>
>   modules = i386 sh x86_64 ia64 alpha arm aarch64 sparc ppc ppc64 s390 \
>  -        tilegx m68k bpf riscv csky
>  +        tilegx m68k bpf riscv csky parisc
> - libebl_pic = libebl_i386_pic.a libebl_sh_pic.a libebl_x86_64_pic.a    \
> -            libebl_ia64_pic.a libebl_alpha_pic.a libebl_arm_pic.a    \
> -            libebl_aarch64_pic.a libebl_sparc_pic.a libebl_ppc_pic.a \
> -            libebl_ppc64_pic.a libebl_s390_pic.a libebl_tilegx_pic.a \
> -            libebl_m68k_pic.a libebl_bpf_pic.a libebl_riscv_pic.a    \
> --           libebl_csky_pic.a
> -+           libebl_csky_pic.a libebl_parisc_pic.a
> - noinst_LIBRARIES = $(libebl_pic)
> - noinst_DATA = $(libebl_pic:_pic.a=.so)
> -
> ++
>  +parisc_SRCS = parisc_init.c parisc_symbol.c parisc_regs.c parisc_retval.c
> -+libebl_parisc_pic_a_SOURCES = $(parisc_SRCS)
> -+am_libebl_parisc_pic_a_OBJECTS = $(parisc_SRCS:.c=.os)
>
> - libelf = ../libelf/libelf.so
> - libdw = ../libdw/libdw.so
> + i386_SRCS = i386_init.c i386_symbol.c i386_corenote.c i386_cfi.c \
> +           i386_retval.c i386_regs.c i386_auxv.c i386_syscall.c \
> +@@ -102,7 +104,8 @@ libebl_backends_a_SOURCES = $(i386_SRCS) $(sh_SRCS) $(x86_64_SRCS) \
> +                           $(ia64_SRCS) $(alpha_SRCS) $(arm_SRCS) \
> +                           $(aarch64_SRCS) $(sparc_SRCS) $(ppc_SRCS) \
> +                           $(ppc64_SRCS) $(s390_SRCS) $(tilegx_SRCS) \
> +-                          $(m68k_SRCS) $(bpf_SRCS) $(riscv_SRCS) $(csky_SRCS)
> ++                          $(m68k_SRCS) $(bpf_SRCS) $(riscv_SRCS) $(csky_SRCS) \
> ++                            $(parisc_SRCS)
> +
> + libebl_backends_pic_a_SOURCES =
> + am_libebl_backends_pic_a_OBJECTS = $(libebl_backends_a_SOURCES:.c=.os)
>  diff --git a/backends/libebl_parisc.h b/backends/libebl_parisc.h
>  new file mode 100644
>  index 0000000..f473b79
> @@ -826,6 +826,3 @@ index 01648bd..218ceb2 100644
>   #define R_PARISC_SEGREL64     112     /* 64 bits segment rel. address.  */
>   #define R_PARISC_PLTOFF14WR   115     /* PLT-rel. address, right 14 bits.  */
>   #define R_PARISC_PLTOFF14DR   116     /* PLT-rel. address, right 14 bits.  */
> ---
> -2.7.4
> -
> diff --git a/meta/recipes-devtools/elfutils/files/debian/mips_backend.diff b/meta/recipes-devtools/elfutils/files/debian/mips_backend.diff
> index 1097b0ec6f2..749faa403f5 100644
> --- a/meta/recipes-devtools/elfutils/files/debian/mips_backend.diff
> +++ b/meta/recipes-devtools/elfutils/files/debian/mips_backend.diff
> @@ -1,4 +1,4 @@
> -From 68b497668cde5171880d073a7ea50d11c3bddbfc Mon Sep 17 00:00:00 2001
> +From 7e0b036d087dfff7f5e306f52fc78745f99454c3 Mon Sep 17 00:00:00 2001
>  From: Hongxu Jia <hongxu.jia@windriver.com>
>  Date: Wed, 21 Aug 2019 15:49:52 +0800
>  Subject: [PATCH] mips backend
> @@ -7,15 +7,16 @@ Rebase to 0.177
>  Upstream-Status: Pending [from debian]
>
>  Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +
>  ---
> - backends/Makefile.am    |   8 +-
> - backends/mips_init.c    |  59 +++++++++
> - backends/mips_regs.c    | 104 ++++++++++++++++
> - backends/mips_reloc.def |  79 ++++++++++++
> - backends/mips_retval.c  | 321 ++++++++++++++++++++++++++++++++++++++++++++++++
> - backends/mips_symbol.c  |  53 ++++++++
> - libebl/eblopenbackend.c |   2 +
> - 7 files changed, 624 insertions(+), 2 deletions(-)
> + backends/Makefile.am    |   6 +-
> + backends/mips_init.c    |  59 ++++++++
> + backends/mips_regs.c    | 104 +++++++++++++
> + backends/mips_reloc.def |  79 ++++++++++
> + backends/mips_retval.c  | 321 ++++++++++++++++++++++++++++++++++++++++
> + backends/mips_symbol.c  |  53 +++++++
> + libebl/eblopenbackend.c |   3 +
> + 7 files changed, 623 insertions(+), 2 deletions(-)
>   create mode 100644 backends/mips_init.c
>   create mode 100644 backends/mips_regs.c
>   create mode 100644 backends/mips_reloc.def
> @@ -23,36 +24,34 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>   create mode 100644 backends/mips_symbol.c
>
>  diff --git a/backends/Makefile.am b/backends/Makefile.am
> -index 91a38e2..aba8a4a 100644
> +index 4755f61..07d45d7 100644
>  --- a/backends/Makefile.am
>  +++ b/backends/Makefile.am
> -@@ -33,13 +33,13 @@ AM_CPPFLAGS += -I$(top_srcdir)/libebl -I$(top_srcdir)/libasm \
> -
> +@@ -37,7 +37,7 @@ AM_CPPFLAGS += -I$(top_srcdir)/libebl -I$(top_srcdir)/libasm \
> + noinst_LIBRARIES = libebl_backends.a libebl_backends_pic.a
>
>   modules = i386 sh x86_64 ia64 alpha arm aarch64 sparc ppc ppc64 s390 \
>  -        tilegx m68k bpf riscv csky parisc
>  +        tilegx m68k bpf riscv csky parisc mips
> - libebl_pic = libebl_i386_pic.a libebl_sh_pic.a libebl_x86_64_pic.a    \
> -            libebl_ia64_pic.a libebl_alpha_pic.a libebl_arm_pic.a    \
> -            libebl_aarch64_pic.a libebl_sparc_pic.a libebl_ppc_pic.a \
> -            libebl_ppc64_pic.a libebl_s390_pic.a libebl_tilegx_pic.a \
> -            libebl_m68k_pic.a libebl_bpf_pic.a libebl_riscv_pic.a    \
> --           libebl_csky_pic.a libebl_parisc_pic.a
> -+           libebl_csky_pic.a libebl_parisc_pic.a libebl_mips_pic.a
> - noinst_LIBRARIES = $(libebl_pic)
> - noinst_DATA = $(libebl_pic:_pic.a=.so)
>
> -@@ -145,6 +145,10 @@ csky_SRCS = csky_attrs.c csky_init.c csky_symbol.c csky_cfi.c \
> - libebl_csky_pic_a_SOURCES = $(csky_SRCS)
> - am_libebl_csky_pic_a_OBJECTS = $(csky_SRCS:.c=.os)
> + parisc_SRCS = parisc_init.c parisc_symbol.c parisc_regs.c parisc_retval.c
> +
> +@@ -100,12 +100,14 @@ riscv_SRCS = riscv_init.c riscv_symbol.c riscv_cfi.c riscv_regs.c \
> + csky_SRCS = csky_attrs.c csky_init.c csky_symbol.c csky_cfi.c \
> +           csky_regs.c csky_initreg.c csky_corenote.c
>
>  +mips_SRCS = mips_init.c mips_symbol.c mips_regs.c mips_retval.c
> -+libebl_mips_pic_a_SOURCES = $(mips_SRCS)
> -+am_libebl_mips_pic_a_OBJECTS = $(mips_SRCS:.c=.os)
>  +
> - libebl_%.so libebl_%.map: libebl_%_pic.a $(libelf) $(libdw) $(libeu)
> -       @rm -f $(@:.so=.map)
> -       $(AM_V_at)echo 'ELFUTILS_$(PACKAGE_VERSION) { global: $*_init; local: *; };' \
> + libebl_backends_a_SOURCES = $(i386_SRCS) $(sh_SRCS) $(x86_64_SRCS) \
> +                           $(ia64_SRCS) $(alpha_SRCS) $(arm_SRCS) \
> +                           $(aarch64_SRCS) $(sparc_SRCS) $(ppc_SRCS) \
> +                           $(ppc64_SRCS) $(s390_SRCS) $(tilegx_SRCS) \
> +                           $(m68k_SRCS) $(bpf_SRCS) $(riscv_SRCS) $(csky_SRCS) \
> +-                            $(parisc_SRCS)
> ++                            $(parisc_SRCS) $(mips_SRCS)
> +
> + libebl_backends_pic_a_SOURCES =
> + am_libebl_backends_pic_a_OBJECTS = $(libebl_backends_a_SOURCES:.c=.os)
>  diff --git a/backends/mips_init.c b/backends/mips_init.c
>  new file mode 100644
>  index 0000000..975c04e
> @@ -700,18 +699,26 @@ index 0000000..261b05d
>  +    }
>  +}
>  diff --git a/libebl/eblopenbackend.c b/libebl/eblopenbackend.c
> -index 01711f5..d0c3589 100644
> +index 210b47e..1feac13 100644
>  --- a/libebl/eblopenbackend.c
>  +++ b/libebl/eblopenbackend.c
> -@@ -71,6 +71,8 @@ static const struct
> -   { "sparc", "elf_sparc", "sparc", 5, EM_SPARC, 0, 0 },
> -   { "sparc", "elf_sparcv8plus", "sparc", 5, EM_SPARC32PLUS, 0, 0 },
> -   { "s390", "ebl_s390", "s390", 4, EM_S390, 0, 0 },
> -+  { "mips", "elf_mips", "mips", 4, EM_MIPS, 0, 0 },
> -+  { "mips", "elf_mipsel", "mipsel", 4, EM_MIPS_RS3_LE, 0, 0 },
> +@@ -57,6 +57,7 @@ const char *m68k_init (Elf *, GElf_Half, Ebl *, size_t);
> + const char *bpf_init (Elf *, GElf_Half, Ebl *, size_t);
> + const char *riscv_init (Elf *, GElf_Half, Ebl *, size_t);
> + const char *csky_init (Elf *, GElf_Half, Ebl *, size_t);
> ++const char *mips_init (Elf *, GElf_Half, Ebl *, size_t);
> +
> + /* This table should contain the complete list of architectures as far
> +    as the ELF specification is concerned.  */
> +@@ -87,6 +88,8 @@ static const struct
> +   { sparc_init, "elf_sparc", "sparc", 5, EM_SPARC, 0, 0 },
> +   { sparc_init, "elf_sparcv8plus", "sparc", 5, EM_SPARC32PLUS, 0, 0 },
> +   { s390_init, "ebl_s390", "s390", 4, EM_S390, 0, 0 },
> ++  { mips_init, "elf_mips", "mips", 4, EM_MIPS, 0, 0 },
> ++  { mips_init, "elf_mipsel", "mipsel", 4, EM_MIPS_RS3_LE, 0, 0 },
>
> -   { "m32", "elf_m32", "m32", 3, EM_M32, 0, 0 },
> -   { "m68k", "elf_m68k", "m68k", 4, EM_68K, ELFCLASS32, ELFDATA2MSB },
> +   { NULL, "elf_m32", "m32", 3, EM_M32, 0, 0 },
> +   { m68k_init, "elf_m68k", "m68k", 4, EM_68K, ELFCLASS32, ELFDATA2MSB },
>  --
> -2.7.4
> +2.17.1
>
> diff --git a/meta/recipes-devtools/elfutils/files/debian/mips_cfi.patch b/meta/recipes-devtools/elfutils/files/debian/mips_cfi.patch
> index fda4f68059e..dd8f88a4542 100644
> --- a/meta/recipes-devtools/elfutils/files/debian/mips_cfi.patch
> +++ b/meta/recipes-devtools/elfutils/files/debian/mips_cfi.patch
> @@ -1,33 +1,34 @@
> -From 96e38289f2887ddb8e6d2fb91ea04bdbdf034ab5 Mon Sep 17 00:00:00 2001
> +From 5bf6117a6eaf9007ce80adbb8b66a95ca98047a4 Mon Sep 17 00:00:00 2001
>  From: Hongxu Jia <hongxu.jia@windriver.com>
>  Date: Wed, 21 Aug 2019 17:00:30 +0800
> -Subject: [PATCH 2/2] mips_cfi
> +Subject: [PATCH] mips_cfi
>
>  Upstream-Status: Pending [from debian]
>
>  Rebase to 0.177
>
>  Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +
>  ---
>   backends/Makefile.am |  2 +-
> - backends/mips_cfi.c  | 80 ++++++++++++++++++++++++++++++++++++++++++++++++++++
> + backends/mips_cfi.c  | 80 ++++++++++++++++++++++++++++++++++++++++++++
>   backends/mips_init.c |  1 +
>   3 files changed, 82 insertions(+), 1 deletion(-)
>   create mode 100644 backends/mips_cfi.c
>
>  diff --git a/backends/Makefile.am b/backends/Makefile.am
> -index aba8a4a..6ac0eec 100644
> +index 07d45d7..dec3080 100644
>  --- a/backends/Makefile.am
>  +++ b/backends/Makefile.am
> -@@ -145,7 +145,7 @@ csky_SRCS = csky_attrs.c csky_init.c csky_symbol.c csky_cfi.c \
> - libebl_csky_pic_a_SOURCES = $(csky_SRCS)
> - am_libebl_csky_pic_a_OBJECTS = $(csky_SRCS:.c=.os)
> +@@ -100,7 +100,7 @@ riscv_SRCS = riscv_init.c riscv_symbol.c riscv_cfi.c riscv_regs.c \
> + csky_SRCS = csky_attrs.c csky_init.c csky_symbol.c csky_cfi.c \
> +           csky_regs.c csky_initreg.c csky_corenote.c
>
>  -mips_SRCS = mips_init.c mips_symbol.c mips_regs.c mips_retval.c
>  +mips_SRCS = mips_init.c mips_symbol.c mips_regs.c mips_retval.c mips_cfi.c
> - libebl_mips_pic_a_SOURCES = $(mips_SRCS)
> - am_libebl_mips_pic_a_OBJECTS = $(mips_SRCS:.c=.os)
>
> + libebl_backends_a_SOURCES = $(i386_SRCS) $(sh_SRCS) $(x86_64_SRCS) \
> +                           $(ia64_SRCS) $(alpha_SRCS) $(arm_SRCS) \
>  diff --git a/backends/mips_cfi.c b/backends/mips_cfi.c
>  new file mode 100644
>  index 0000000..9ffdab5
> @@ -126,6 +127,3 @@ index 8482e7f..bce5abe 100644
>
>     return MODVERSION;
>   }
> ---
> -2.7.4
> -
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

