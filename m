Return-Path: <oleksandr.s.popovych@globallogic.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id E984060213
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Feb 2020 14:51:42 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id z8so7887746ioh.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Feb 2020 06:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=globallogic.com; s=google;
	h=mime-version:from:date:message-id:subject:to;
	bh=URz6ATdlT2K566TQRbjcq8+oUcME/3Ji6xas8ICmvOY=;
	b=MiBXbhZMilCR7CluQhDd4docjYZHIeRWT6NwOfGxww7v3k1Zi6Ewf7ti0mbVAkXXIS
	R6YCP1dyXqYSNRm87pIzYZe7ntyGNrRXw4EjfMl1E8rX9xnuCtdvVLpnnZyHUv/+eMcZ
	ybP8jW++SvIvjkKY+NiB557FhmdjUItFoHjdkKWhTvtWrPfLp0GPbmZ+TKxGKRf8xAO5
	eMe571P5tl5sHR4bPl3UBvIWz51D6fKExuPfmSAhLw6PPT5m6qrcIboBLfwRSkRr0nVi
	azk1CQlCdiYcrTqHQK9+k8GBcqzuYxLn4oxKORF8m+9myGWoctpcd5MzjNu7caoquslf
	+j/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=URz6ATdlT2K566TQRbjcq8+oUcME/3Ji6xas8ICmvOY=;
	b=S8SKe1qqgJ+musiq76RXJKp6E+48c5+WZjvHyaj7JX1bK7T7mUshj6NdoQpeGcypJk
	A+7HcC9/6fawrqX9XsibKnu1nEkfm2UPUBDYw4DyXehTX2a3S63zGiayHSHP83vDiOUo
	IAQcb/cN63NW+4BZl53Lowm1Cx+C+Z9jv+roL8fANjF1ZpFTvpSxMHY+Vrx9rfjPX8Bx
	RNWWo8h6dmIxcOSmA5zHJbajlfPZGvBoBZDw5s1rTuNTxb9Ax/uEhfCZPKawzp+NbPLI
	GvpReVOXgAxmXPBICIbSWyh84VISBISQkiqgCVSim5uvcnXtMKvI9GWEAhKkR7fz8zk3
	9mxQ==
X-Gm-Message-State: APjAAAXESQAPd8wkwQEO4YO+JTAMwzOIIsuGYRXbajdFeVE8W4lDryof
	hNBEHmuBYHmn5JCtxAg00RZkscAnPkOlu+WY+F6me8SebSQ=
X-Google-Smtp-Source: APXvYqxpNQk5FPfGoNxBxNIyqDu7clau0i+hCdTMlNPNvIdSCX132nloMGI1YiKWGBuGwsLpskfpNlkqhw7+8OnX8CI=
X-Received: by 2002:a5d:9d11:: with SMTP id j17mr9791076ioj.83.1581346303437; 
	Mon, 10 Feb 2020 06:51:43 -0800 (PST)
MIME-Version: 1.0
From: Oleksandr Popovych <oleksandr.s.popovych@globallogic.com>
Date: Mon, 10 Feb 2020 16:51:32 +0200
Message-ID: <CAKqUGW_Fj10L5X3GfRzK8Gm45gkQYKL5UJR815dp3NgE2TRvNQ@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] expat: Add ptest
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
X-List-Received-Date: Mon, 10 Feb 2020 14:51:43 -0000
Content-Type: text/plain; charset="UTF-8"

From f7b0599dcd3e12f0042bb06ea8b80645da997982 Mon Sep 17 00:00:00 2001
From: Oleksandr Popovych <oleksandr.s.popovych@globallogic.com>
Date: Mon, 10 Feb 2020 15:57:25 +0200
Subject: [OE-core][PATCH] expat: Add ptest

For ptest support for this package several additional patches and
run-ptest script
were added and recipe was changed.

Signed-off-by: Oleksandr Popovych <oleksandr.s.popovych@globallogic.com>
---
 ...d-Makefile-targets-for-ptest-support.patch | 38 ++++++++++++++
 ...ort-for-ptests-in-form-of-new-target.patch | 31 ++++++++++++
 ...ed-suitable-format-of-tests-in-ptest.patch | 50 +++++++++++++++++++
 meta/recipes-core/expat/expat/run-ptest       |  3 ++
 meta/recipes-core/expat/expat_2.2.9.bb        | 12 ++++-
 5 files changed, 133 insertions(+), 1 deletion(-)
 create mode 100644
meta/recipes-core/expat/expat/0001-expat-Added-Makefile-targets-for-ptest-support.patch
 create mode 100644
meta/recipes-core/expat/expat/0002-expat-Added-support-for-ptests-in-form-of-new-target.patch
 create mode 100644
meta/recipes-core/expat/expat/0003-expat-Added-suitable-format-of-tests-in-ptest.patch
 create mode 100644 meta/recipes-core/expat/expat/run-ptest

diff --git a/meta/recipes-core/expat/expat/0001-expat-Added-Makefile-targets-for-ptest-support.patch
b/meta/recipes-core/expat/expat/0001-expat-Added-Makefile-targets-for-ptest-support.patch
new file mode 100644
index 0000000000..32488060ee
--- /dev/null
+++ b/meta/recipes-core/expat/expat/0001-expat-Added-Makefile-targets-for-ptest-support.patch
@@ -0,0 +1,38 @@
+From ce803ec3d7b095cb55686f9cd5d3f01d34a31a5e Mon Sep 17 00:00:00 2001
+From: Oleksandr Popovych <oleksandr.s.popovych@globallogic.com>
+Date: Thu, 6 Feb 2020 13:41:45 +0200
+Subject: [PATCH 1/3] expat: Added Makefile targets for ptest support
+
+install-ptest, runtests and check tagrets are added.
+
+Signed-off-by: Oleksandr Popovych <oleksandr.s.popovych@globallogic.com>
+---
+ Makefile.am | 15 +++++++++++++++
+ 1 file changed, 15 insertions(+)
+
+diff --git a/Makefile.am b/Makefile.am
+index 5e1d37d..c63b44a 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -152,3 +152,18 @@ qa:
+     QA_COMPILER=clang QA_SANITIZER=memory    ./qa.sh
+     QA_COMPILER=clang QA_SANITIZER=undefined ./qa.sh
+     QA_COMPILER=gcc   QA_PROCESSOR=gcov      ./qa.sh
++
++.PHONY: install-ptest
++install-ptest:
++    echo $(S)
++    (if [ -d tests/.libs ] ; then cd tests/.libs; fi; \
++        install runtests runtestspp $(DESTDIR))
++    cp Makefile $(DESTDIR)
++    sed -i -e 's|^Makefile:|_Makefile:|' $(DESTDIR)/Makefile
++
++.PHONY: runtests
++runtests:
++    @echo "C variant of tests:"
++    @$(CHECKER) ./runtests$(EXEEXT) -q
++    @echo "C++ variant of tests:"
++    @$(CHECKER) ./runtestspp$(EXEEXT) -q
+--
+2.17.1
+
diff --git a/meta/recipes-core/expat/expat/0002-expat-Added-support-for-ptests-in-form-of-new-target.patch
b/meta/recipes-core/expat/expat/0002-expat-Added-support-for-ptests-in-form-of-new-target.patch
new file mode 100644
index 0000000000..cf8a2495e9
--- /dev/null
+++ b/meta/recipes-core/expat/expat/0002-expat-Added-support-for-ptests-in-form-of-new-target.patch
@@ -0,0 +1,31 @@
+From 2b209a025f62fb1be7b32599aa80703ce8ecd76a Mon Sep 17 00:00:00 2001
+From: Oleksandr Popovych <oleksandr.s.popovych@globallogic.com>
+Date: Thu, 6 Feb 2020 13:43:57 +0200
+Subject: [PATCH 2/3] expat: Added support for ptests in form of new target
+
+configure.am file changed, according to this advice:
+https://wiki.yoctoproject.org/wiki/Ptest#Building_the_test_suite
+
+Signed-off-by: Oleksandr Popovych <oleksandr.s.popovych@globallogic.com>
+---
+ configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index d58ac03..8e6b41e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -34,8 +34,8 @@ AC_CONFIG_SRCDIR([Makefile.in])
+ AC_CONFIG_AUX_DIR([conftools])
+ AC_CONFIG_MACRO_DIR([m4])
+ AC_CANONICAL_HOST
+-AM_INIT_AUTOMAKE
+-
++AM_INIT_AUTOMAKE([serial-tests])
++AM_EXTRA_RECURSIVE_TARGETS([buildtest-TESTS])
+
+ dnl
+ dnl Increment LIBREVISION if source code has changed at all
+--
+2.17.1
+
diff --git a/meta/recipes-core/expat/expat/0003-expat-Added-suitable-format-of-tests-in-ptest.patch
b/meta/recipes-core/expat/expat/0003-expat-Added-suitable-format-of-tests-in-ptest.patch
new file mode 100644
index 0000000000..5d1daefc92
--- /dev/null
+++ b/meta/recipes-core/expat/expat/0003-expat-Added-suitable-format-of-tests-in-ptest.patch
@@ -0,0 +1,50 @@
+From b2e236e238f8bab42651313ea198b27355945d97 Mon Sep 17 00:00:00 2001
+From: Oleksandr Popovych <oleksandr.s.popovych@globallogic.com>
+Date: Thu, 6 Feb 2020 13:44:56 +0200
+Subject: [PATCH 3/3] expat: Added suitable format of tests in ptest
+
+Some changes in testcases code were applied for testcase engine.
+This was just adding of message outputs in "RESULT: TESTNAME" form...
+
+Signed-off-by: Oleksandr Popovych <oleksandr.s.popovych@globallogic.com>
+---
+ tests/minicheck.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/tests/minicheck.c b/tests/minicheck.c
+index a5a1efb..b39cda9 100644
+--- a/tests/minicheck.c
++++ b/tests/minicheck.c
+@@ -164,6 +164,7 @@ srunner_run_all(SRunner *runner, int verbosity) {
+       if (tc->setup != NULL) {
+         /* setup */
+         if (setjmp(env)) {
++          printf("SKIP: %s\n", _check_current_function);
+           add_failure(runner, verbosity);
+           continue;
+         }
+@@ -171,6 +172,7 @@ srunner_run_all(SRunner *runner, int verbosity) {
+       }
+       /* test */
+       if (setjmp(env)) {
++        printf("FAIL: %s\n", _check_current_function);
+         add_failure(runner, verbosity);
+         continue;
+       }
+@@ -179,11 +181,13 @@ srunner_run_all(SRunner *runner, int verbosity) {
+       /* teardown */
+       if (tc->teardown != NULL) {
+         if (setjmp(env)) {
++          printf("PASS: %s\n", _check_current_function);
+           add_failure(runner, verbosity);
+           continue;
+         }
+         tc->teardown();
+       }
++      printf("PASS: %s\n", _check_current_function);
+     }
+     tc = tc->next_tcase;
+   }
+--
+2.17.1
+
diff --git a/meta/recipes-core/expat/expat/run-ptest
b/meta/recipes-core/expat/expat/run-ptest
new file mode 100644
index 0000000000..df994c0838
--- /dev/null
+++ b/meta/recipes-core/expat/expat/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/bash
+
+make -k runtests
diff --git a/meta/recipes-core/expat/expat_2.2.9.bb
b/meta/recipes-core/expat/expat_2.2.9.bb
index 8f3db41352..420ffddc80 100644
--- a/meta/recipes-core/expat/expat_2.2.9.bb
+++ b/meta/recipes-core/expat/expat_2.2.9.bb
@@ -8,15 +8,25 @@ LIC_FILES_CHKSUM =
"file://COPYING;md5=5b8620d98e49772d95fc1d291c26aa79"

 SRC_URI = "${SOURCEFORGE_MIRROR}/expat/expat-${PV}.tar.bz2 \
            file://libtool-tag.patch \
+       file://0001-expat-Added-Makefile-targets-for-ptest-support.patch \
+       file://0002-expat-Added-support-for-ptests-in-form-of-new-target.patch \
+       file://0003-expat-Added-suitable-format-of-tests-in-ptest.patch \
+       file://run-ptest \
       "

 SRC_URI[md5sum] = "875a2c2ff3e8eb9e5a5cd62db2033ab5"
 SRC_URI[sha256sum] =
"f1063084dc4302a427dabcca499c8312b3a32a29b7d2506653ecc8f950a9a237"

-inherit autotools lib_package
+inherit autotools ptest lib_package
+
+RDEPENDS_${PN}-ptest += "make bash"

 do_configure_prepend () {
     rm -f ${S}/conftools/libtool.m4
 }

+do_compile_ptest() {
+    oe_runmake buildtest-TESTS
+}
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

