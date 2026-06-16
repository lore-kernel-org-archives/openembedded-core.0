Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 812ABCD98E4
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 19:50:15 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6729.1781639412563516453
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 12:50:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=U6uu2EXt;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20260616195014e345b9b871000207c7-a2xaic@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20260616195014e345b9b871000207c7
        for <openembedded-core@lists.openembedded.org>;
        Tue, 16 Jun 2026 21:50:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=TiWFV6DA+JEptf1vQo0L28jkXSpXCfwiz/NYgq6y8vI=;
 b=U6uu2EXtLwJnyeUjD75Cdi9vf809VWy8haupMZBbLganC7eeni7YKhPufIxsqkNqqB/fJc
 beBDkdatFGDhEj05wRuarxmGOGHxho/ObtZLH/GMlYFQGcEqlboiC2XTvb161Yyh84xtaMCD
 ACmp/2+y/0J4pqciyTqak312joEw8dpUm8XLOvMIzCBZ97drx3oaCzSqVFfaflNjPD3Xiplr
 7is4m+NCLiXbCv3mtNnKmaevQqq1bOqfOkiYxoQsQv5hdjuJPM5BIS6yUo3o7BV8DzghjQGY
 A16hbS6nT3G3rAN+PKaYnMWW0rNgKVkOrJ34BwQTEbFcpz0xdTKis4eA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 2/3] libpcre: remove recipe
Date: Tue, 16 Jun 2026 21:49:58 +0200
Message-ID: <20260616194959.3748347-2-peter.marko@siemens.com>
In-Reply-To: <20260616194959.3748347-1-peter.marko@siemens.com>
References: <20260616194959.3748347-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 19:50:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238959

From: Peter Marko <peter.marko@siemens.com>

libpcre is obsolete project replaced by libpcre2.
It was not updated for last 5 years.
There is no consumer of this recipe in oe-core anymore.

It will be moved to meta-openembedded until all consumers migrate to
libpcre2 there, too.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/conf/distro/include/maintainers.inc      |   1 -
 .../distro/include/ptest-packagelists.inc     |   1 -
 meta/recipes-support/libpcre/libpcre/Makefile | 183 ------------------
 .../recipes-support/libpcre/libpcre/run-ptest |   3 -
 meta/recipes-support/libpcre/libpcre_8.45.bb  |  74 -------
 5 files changed, 262 deletions(-)
 delete mode 100644 meta/recipes-support/libpcre/libpcre/Makefile
 delete mode 100644 meta/recipes-support/libpcre/libpcre/run-ptest
 delete mode 100644 meta/recipes-support/libpcre/libpcre_8.45.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 86048e791c..aea2b9f1bc 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -379,7 +379,6 @@ RECIPE_MAINTAINER:pn-libogg = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libpam = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libpcap = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libpciaccess = "Wang Mingyu <wangmy@fujitsu.com>"
-RECIPE_MAINTAINER:pn-libpcre = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-libpcre2 = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libpipeline = "Wang Mingyu <wangmy@fujitsu.com>"
 RECIPE_MAINTAINER:pn-libpng = "Unassigned <unassigned@yoctoproject.org>"
diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index f3f42f908a..f0950bcc99 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -39,7 +39,6 @@ PTESTS_FAST = "\
     libksba \
     libmd \
     libnl \
-    libpcre \
     libpcre2 \
     librsvg \
     libsolv \
diff --git a/meta/recipes-support/libpcre/libpcre/Makefile b/meta/recipes-support/libpcre/libpcre/Makefile
deleted file mode 100644
index 708d807d08..0000000000
--- a/meta/recipes-support/libpcre/libpcre/Makefile
+++ /dev/null
@@ -1,183 +0,0 @@
-TESTS = pcre_stringpiece_unittest RunTest RunGrepTest
-subdir = .
-am__vpath_adj_setup = srcdirstrip=`echo "$(srcdir)" | sed 's|.|.|g'`;
-am__vpath_adj = case $$p in \
-    $(srcdir)/*) f=`echo "$$p" | sed "s|^$$srcdirstrip/||"`;; \
-    *) f=$$p;; \
-  esac;
-am__tty_colors_dummy = \
-  mgn= red= grn= lgn= blu= brg= std=; \
-  am__color_tests=no
-am__tty_colors = { \
-  $(am__tty_colors_dummy); \
-  if test "X$(AM_COLOR_TESTS)" = Xno; then \
-    am__color_tests=no; \
-  elif test "X$(AM_COLOR_TESTS)" = Xalways; then \
-    am__color_tests=yes; \
-  elif test "X$$TERM" != Xdumb && { test -t 1; } 2>/dev/null; then \
-    am__color_tests=yes; \
-  fi; \
-  if test $$am__color_tests = yes; then \
-    red='[0;31m'; \
-    grn='[0;32m'; \
-    lgn='[1;32m'; \
-    blu='[1;34m'; \
-    mgn='[0;35m'; \
-    brg='[1m'; \
-    std='[m'; \
-  fi; \
-}
-am__rst_title = { sed 's/.*/   &   /;h;s/./=/g;p;x;s/ *$$//;p;g' && echo; }
-am__sh_e_setup = case $$- in *e*) set +e;; esac
-am__common_driver_flags = \
-  --color-tests "$$am__color_tests" \
-  --enable-hard-errors "$$am__enable_hard_errors" \
-  --expect-failure "$$am__expect_failure"
-am__check_pre = \
-$(am__sh_e_setup); \
-$(am__vpath_adj_setup) $(am__vpath_adj) \
-$(am__tty_colors); \
-srcdir=$(srcdir); export srcdir; \
-case "$@" in \
-  */*) am__odir=`echo "./$@" | sed 's|/[^/]*$$||'`;; \
-    *) am__odir=.;; \
-esac; \
-test "x$$am__odir" = x"." || test -d "$$am__odir" \
-  || $(MKDIR_P) "$$am__odir" || exit $$?; \
-if test -f "./$$f"; then dir=./; \
-elif test -f "$$f"; then dir=; \
-else dir="$(srcdir)/"; fi; \
-tst=$$dir$$f; log='$@'; \
-if test -n '$(DISABLE_HARD_ERRORS)'; then \
-  am__enable_hard_errors=no; \
-else \
-  am__enable_hard_errors=yes; \
-fi;
-am__set_TESTS_bases = \
-  bases='$(TEST_LOGS)'; \
-  bases=`for i in $$bases; do echo $$i; done | sed 's/\.log$$//'`; \
-  bases=`echo $$bases`
-RECHECK_LOGS = $(TEST_LOGS)
-TEST_SUITE_LOG = test-suite.log
-TEST_EXTENSIONS =  .test
-LOG_DRIVER = $(SHELL) $(top_srcdir)/test-driver
-am__test_logs1 = $(TESTS:=.log)
-am__test_logs2 = $(am__test_logs1:.log=.log)
-TEST_LOGS = $(am__test_logs2:.test.log=.log)
-MKDIR_P = /bin/mkdir -p
-PACKAGE_STRING = PCRE 8.36
-SHELL = /bin/sh
-srcdir = .
-top_srcdir = .
-$(TEST_SUITE_LOG): $(TEST_LOGS)
-	@$(am__set_TESTS_bases); \
-	am__f_ok () { test -f "$$1" && test -r "$$1"; }; \
-	redo_bases=`for i in $$bases; do \
-	              am__f_ok $$i.trs && am__f_ok $$i.log || echo $$i; \
-	            done`; \
-	st=0;  \
-	errmsg="fatal: making $(TEST_SUITE_LOG): failed to create"; \
-	for i in $$redo_bases; do \
-	  test -f $$i.trs && test -r $$i.trs \
-	    || { echo "$$errmsg $$i.trs" >&2; st=1; }; \
-	  test -f $$i.log && test -r $$i.log \
-	    || { echo "$$errmsg $$i.log" >&2; st=1; }; \
-	done; \
-	test $$st -eq 0 || exit 1;
-	@$(am__sh_e_setup); $(am__tty_colors); $(am__set_TESTS_bases); \
-	ws='[ 	]'; \
-	results=`for b in $$bases; do echo $$b.trs; done`; \
-	test -n "$$results" || results=/dev/null; \
-	all=`  grep "^$$ws*:test-result:"           $$results | wc -l`; \
-	pass=` grep "^$$ws*:test-result:$$ws*PASS"  $$results | wc -l`; \
-	fail=` grep "^$$ws*:test-result:$$ws*FAIL"  $$results | wc -l`; \
-	skip=` grep "^$$ws*:test-result:$$ws*SKIP"  $$results | wc -l`; \
-	xfail=`grep "^$$ws*:test-result:$$ws*XFAIL" $$results | wc -l`; \
-	xpass=`grep "^$$ws*:test-result:$$ws*XPASS" $$results | wc -l`; \
-	error=`grep "^$$ws*:test-result:$$ws*ERROR" $$results | wc -l`; \
-	if test `expr $$fail + $$xpass + $$error` -eq 0; then \
-	  success=true; \
-	else \
-	  success=false; \
-	fi; \
-	br='==================='; br=$$br$$br$$br$$br; \
-	result_count () \
-	{ \
-	    if test x"$$1" = x"--maybe-color"; then \
-	      maybe_colorize=yes; \
-	    elif test x"$$1" = x"--no-color"; then \
-	      maybe_colorize=no; \
-	    else \
-	      echo "$@: invalid 'result_count' usage" >&2; exit 4; \
-	    fi; \
-	    shift; \
-	    desc=$$1 count=$$2; \
-	    if test $$maybe_colorize = yes && test $$count -gt 0; then \
-	      color_start=$$3 color_end=$$std; \
-	    else \
-	      color_start= color_end=; \
-	    fi; \
-	    echo "$${color_start}# $$desc $$count$${color_end}"; \
-	}; \
-	create_testsuite_report () \
-	{ \
-	  result_count $$1 "TOTAL:" $$all   "$$brg"; \
-	  result_count $$1 "PASS: " $$pass  "$$grn"; \
-	  result_count $$1 "SKIP: " $$skip  "$$blu"; \
-	  result_count $$1 "XFAIL:" $$xfail "$$lgn"; \
-	  result_count $$1 "FAIL: " $$fail  "$$red"; \
-	  result_count $$1 "XPASS:" $$xpass "$$red"; \
-	  result_count $$1 "ERROR:" $$error "$$mgn"; \
-	}; \
-	{								\
-	  echo "$(PACKAGE_STRING): $(subdir)/$(TEST_SUITE_LOG)" |	\
-	    $(am__rst_title);						\
-	  create_testsuite_report --no-color;				\
-	  echo;								\
-	  echo ".. contents:: :depth: 2";				\
-	  echo;								\
-	  for b in $$bases; do echo $$b; done;				\
-	} >$(TEST_SUITE_LOG).tmp || exit 1;				\
-	mv $(TEST_SUITE_LOG).tmp $(TEST_SUITE_LOG);			\
-	if $$success; then						\
-	  col="$$grn";							\
-	 else								\
-	  col="$$red";							\
-	  test x"$$VERBOSE" = x || cat $(TEST_SUITE_LOG);		\
-	fi;								\
-	echo "$${col}$$br$${std}"; 					\
-	echo "$${col}Testsuite summary for $(PACKAGE_STRING)$${std}";	\
-	echo "$${col}$$br$${std}"; 					\
-	create_testsuite_report --maybe-color;				\
-	echo "$$col$$br$$std";						\
-	if $$success; then :; else					\
-	  echo "$${col}See $(subdir)/$(TEST_SUITE_LOG)$${std}";		\
-	  echo "$$col$$br$$std";					\
-	fi;								\
-	$$success || exit 1
-check-TESTS:
-	@list='$(RECHECK_LOGS)';           test -z "$$list" || rm -f $$list
-	@test -z "$(TEST_SUITE_LOG)" || rm -f $(TEST_SUITE_LOG)
-	@set +e; $(am__set_TESTS_bases); \
-	log_list=`for i in $$bases; do echo $$i.log; done`; \
-	log_list=`echo $$log_list`; \
-	$(MAKE) $(AM_MAKEFLAGS) $(TEST_SUITE_LOG) TEST_LOGS="$$log_list"; \
-	exit $$?;
-pcre_stringpiece_unittest.log: pcre_stringpiece_unittest$(EXEEXT)
-	@p='pcre_stringpiece_unittest$(EXEEXT)'; \
-	b='pcre_stringpiece_unittest'; \
-	$(am__check_pre) $(LOG_DRIVER) --test-name "$$f" \
-	--log-file $$b.log --trs-file $$b.trs \
-	$(am__common_driver_flags) -- "$$tst"
-RunTest.log: RunTest
-	@p='RunTest'; \
-	b='RunTest'; \
-	$(am__check_pre) $(LOG_DRIVER) --test-name "$$f" \
-	--log-file $$b.log --trs-file $$b.trs \
-	$(am__common_driver_flags) -- "$$tst"
-RunGrepTest.log: RunGrepTest
-	@p='RunGrepTest'; \
-	b='RunGrepTest'; \
-	$(am__check_pre) $(LOG_DRIVER) --test-name "$$f" \
-	--log-file $$b.log --trs-file $$b.trs \
-	$(am__common_driver_flags) -- "$$tst"
diff --git a/meta/recipes-support/libpcre/libpcre/run-ptest b/meta/recipes-support/libpcre/libpcre/run-ptest
deleted file mode 100644
index 990d4a12ad..0000000000
--- a/meta/recipes-support/libpcre/libpcre/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-make check-TESTS
diff --git a/meta/recipes-support/libpcre/libpcre_8.45.bb b/meta/recipes-support/libpcre/libpcre_8.45.bb
deleted file mode 100644
index c5ecbd8cf2..0000000000
--- a/meta/recipes-support/libpcre/libpcre_8.45.bb
+++ /dev/null
@@ -1,74 +0,0 @@
-DESCRIPTION = "The PCRE library is a set of functions that implement regular \
-expression pattern matching using the same syntax and semantics as Perl 5. PCRE \
-has its own native API, as well as a set of wrapper functions that correspond \
-to the POSIX regular expression API."
-SUMMARY = "Perl Compatible Regular Expressions"
-HOMEPAGE = "http://www.pcre.org"
-SECTION = "devel"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=b5d5d1a69a24ea2718263f1ff85a1c58"
-SOURCEFORGE_PROJECT = "pcre"
-SRC_URI = "${SOURCEFORGE_MIRROR}/${SOURCEFORGE_PROJECT}/pcre-${PV}.tar.bz2 \
-           file://run-ptest \
-           file://Makefile \
-           "
-
-SRC_URI[sha256sum] = "4dae6fdcd2bb0bb6c37b5f97c33c2be954da743985369cddac3546e3218bffb8"
-
-CVE_PRODUCT = "pcre"
-
-S = "${UNPACKDIR}/pcre-${PV}"
-
-PROVIDES += "pcre"
-DEPENDS += "bzip2 zlib"
-
-PACKAGECONFIG ??= "pcre8 unicode-properties jit"
-
-PACKAGECONFIG[pcre8] = "--enable-pcre8,--disable-pcre8"
-PACKAGECONFIG[pcre16] = "--enable-pcre16,--disable-pcre16"
-PACKAGECONFIG[pcre32] = "--enable-pcre32,--disable-pcre32"
-PACKAGECONFIG[pcretest-readline] = "--enable-pcretest-libreadline,--disable-pcretest-libreadline,readline,"
-PACKAGECONFIG[unicode-properties] = "--enable-unicode-properties,--disable-unicode-properties"
-PACKAGECONFIG[jit] = "--enable-jit=auto,--disable-jit"
-
-BINCONFIG = "${bindir}/pcre-config"
-
-inherit autotools binconfig-disabled ptest sourceforge-releases
-
-EXTRA_OECONF = "--enable-utf"
-
-PACKAGES =+ "libpcrecpp libpcreposix pcregrep pcregrep-doc pcretest pcretest-doc"
-
-SUMMARY:libpcrecpp = "${SUMMARY} - C++ wrapper functions"
-SUMMARY:libpcreposix = "${SUMMARY} - C wrapper functions based on the POSIX regex API"
-SUMMARY:pcregrep = "grep utility that uses perl 5 compatible regexes"
-SUMMARY:pcregrep-doc = "grep utility that uses perl 5 compatible regexes - docs"
-SUMMARY:pcretest = "program for testing Perl-comatible regular expressions"
-SUMMARY:pcretest-doc = "program for testing Perl-comatible regular expressions - docs"
-
-FILES:libpcrecpp = "${libdir}/libpcrecpp.so.*"
-FILES:libpcreposix = "${libdir}/libpcreposix.so.*"
-FILES:pcregrep = "${bindir}/pcregrep"
-FILES:pcregrep-doc = "${mandir}/man1/pcregrep.1"
-FILES:pcretest = "${bindir}/pcretest"
-FILES:pcretest-doc = "${mandir}/man1/pcretest.1"
-
-BBCLASSEXTEND = "native nativesdk"
-
-do_install_ptest() {
-	t=${D}${PTEST_PATH}
-	cp ${UNPACKDIR}/Makefile $t
-	cp -r ${S}/testdata $t
-	for i in pcre_stringpiece_unittest pcregrep pcretest; do
-		${B}/libtool --mode=install install ${B}/$i $t/
-	done
-	for i in RunTest RunGrepTest test-driver; do
-		install ${S}/$i $t
-	done
-	# Skip the fr_FR locale test. If the locale fr_FR is found, it is tested.
-	# If not found, the test is skipped. The test program assumes fr_FR is non-UTF-8
-	# locale so the test fails if fr_FR is UTF-8 locale.
-	sed -i -e 's:do3=yes:do3=no:g' ${D}${PTEST_PATH}/RunTest 
-}
-
-RDEPENDS:${PN}-ptest += "make"

