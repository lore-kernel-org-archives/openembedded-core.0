Return-Path: <oleksandr.s.popovych@globallogic.com>
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
	[209.85.208.180])
	by mail.openembedded.org (Postfix) with ESMTP id 63C6A60B1F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2020 16:37:07 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id w1so12349134ljh.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2020 08:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=globallogic.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=RBSVBYNWweQEvVbw9LWEWU9rNqpiVXDG+AmMt8KrkOU=;
	b=EhABro/iTxUVJDYa8O0+etcuCMBbVcU6rykdaRNogFVP9cwC04TlVnLA6z+cSwJM0J
	fK4DYiEJbfGJxaZGNbTazH+9IxXjZl9B6aW6UE83x92f/+VR1JuI7VfsvcNt1XTXN4sm
	Wxs15Cxjdj0AaZ4sewJ4mUQKd8WZ+U6puRy6owl4mUbZ2ISMBMpRovRitmOFgNKI+Kxy
	ThJaBSCHLGI9O5JC1ssRScIIuBfaETlwcS/DR6WdTFacakis1fmHgiqDr34nE6HwnujS
	4qHQg4IRoFq7Qh8ystXwY9u2tx0yYxwFdRQl/OKjkmj9UOi76IiZrxt1kEDzlnlT0bk1
	TjKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=RBSVBYNWweQEvVbw9LWEWU9rNqpiVXDG+AmMt8KrkOU=;
	b=gUiWvLUxh4OCN5q3neBM/SwGaR296x0w/GJMgJzWu/sF3cNnONiCgfKuAn+erp/byB
	fgG3Rpg9Az6+mQup//3JrDN2yU2+8v4rR+Ix2RBm7SlipwL2OqrCfFy+bE5C8oXE4vvO
	ZudfCECeMLRN3tG2DVZ0SrkTt2CjqTNFf7x+bcX7NEBC/p41UDohyVOXcFUBwq0UfFCY
	EfjgXObU4nQusY583lw/iPpZ1bJtiipFyxQCpHMaQCp4E7ptF7mU+pEKm4QCfuLONfjt
	1IdJItorflWXfFehCKIYLDBZMSkEwGuLbIVjhLQa602dmgW6E0/5kqDAUxAJR9K2B0nq
	u7Rw==
X-Gm-Message-State: APjAAAUnNSMyhozj2Nt2yTTtq8ukn2U3S/ihGjW4bvq61tmhxj0cTScv
	sXDr6G3YOzW/2FCS1CnoSRdkDY6bJTU=
X-Google-Smtp-Source: APXvYqxGp0Go1XjVJ+kwoM1ZvemQFQVUkfEx6y2hHIJhbq1mlSO3jf4mkzVVD1E+GkTn9nuhUXL6tQ==
X-Received: by 2002:a2e:9e4c:: with SMTP id g12mr4642486ljk.15.1581439027288; 
	Tue, 11 Feb 2020 08:37:07 -0800 (PST)
Received: from kbp1-ldl-F65306.synapse.com ([195.238.92.77])
	by smtp.gmail.com with ESMTPSA id 4sm2115219lfj.75.2020.02.11.08.37.06
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 11 Feb 2020 08:37:06 -0800 (PST)
From: Oleksandr Popovych <oleksandr.s.popovych@globallogic.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Feb 2020 18:37:02 +0200
Message-Id: <20200211163702.11877-1-oleksandr.s.popovych@globallogic.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH v5] expat: Added ptest
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
X-List-Received-Date: Tue, 11 Feb 2020 16:37:07 -0000

For ptest support for this package several additional patches and
run-ptest script were added and recipe was changed.

Upstream-Status: Submitted [openembedded-core@lists.openembedded.org]

Signed-off-by: Oleksandr Popovych <oleksandr.s.popovych@globallogic.com>
---
 ...d-Makefile-targets-for-ptest-support.patch | 38 ++++++++++++++
 ...ort-for-ptests-in-form-of-new-target.patch | 31 ++++++++++++
 ...ed-suitable-format-of-tests-in-ptest.patch | 50 +++++++++++++++++++
 meta/recipes-core/expat/expat/run-ptest       |  3 ++
 meta/recipes-core/expat/expat_2.2.9.bb        | 12 ++++-
 5 files changed, 133 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/expat/expat/0001-expat-Added-Makefile-targets-for-ptest-support.patch
 create mode 100644 meta/recipes-core/expat/expat/0002-expat-Added-support-for-ptests-in-form-of-new-target.patch
 create mode 100644 meta/recipes-core/expat/expat/0003-expat-Added-suitable-format-of-tests-in-ptest.patch
 create mode 100644 meta/recipes-core/expat/expat/run-ptest

diff --git a/meta/recipes-core/expat/expat/0001-expat-Added-Makefile-targets-for-ptest-support.patch b/meta/recipes-core/expat/expat/0001-expat-Added-Makefile-targets-for-ptest-support.patch
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
+ 	QA_COMPILER=clang QA_SANITIZER=memory    ./qa.sh
+ 	QA_COMPILER=clang QA_SANITIZER=undefined ./qa.sh
+ 	QA_COMPILER=gcc   QA_PROCESSOR=gcov      ./qa.sh
++
++.PHONY: install-ptest
++install-ptest:
++	echo $(S)
++	(if [ -d tests/.libs ] ; then cd tests/.libs; fi; \
++		install runtests runtestspp $(DESTDIR))
++	cp Makefile $(DESTDIR)
++	sed -i -e 's|^Makefile:|_Makefile:|' $(DESTDIR)/Makefile
++
++.PHONY: runtests
++runtests:
++	@echo "C variant of tests:"
++	@$(CHECKER) ./runtests$(EXEEXT) -q 
++	@echo "C++ variant of tests:"
++	@$(CHECKER) ./runtestspp$(EXEEXT) -q
+-- 
+2.17.1
+
diff --git a/meta/recipes-core/expat/expat/0002-expat-Added-support-for-ptests-in-form-of-new-target.patch b/meta/recipes-core/expat/expat/0002-expat-Added-support-for-ptests-in-form-of-new-target.patch
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
diff --git a/meta/recipes-core/expat/expat/0003-expat-Added-suitable-format-of-tests-in-ptest.patch b/meta/recipes-core/expat/expat/0003-expat-Added-suitable-format-of-tests-in-ptest.patch
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
diff --git a/meta/recipes-core/expat/expat/run-ptest b/meta/recipes-core/expat/expat/run-ptest
new file mode 100644
index 0000000000..df994c0838
--- /dev/null
+++ b/meta/recipes-core/expat/expat/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/bash
+
+make -k runtests
diff --git a/meta/recipes-core/expat/expat_2.2.9.bb b/meta/recipes-core/expat/expat_2.2.9.bb
index 8f3db41352..420ffddc80 100644
--- a/meta/recipes-core/expat/expat_2.2.9.bb
+++ b/meta/recipes-core/expat/expat_2.2.9.bb
@@ -8,15 +8,25 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5b8620d98e49772d95fc1d291c26aa79"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/expat/expat-${PV}.tar.bz2 \
            file://libtool-tag.patch \
+	   file://0001-expat-Added-Makefile-targets-for-ptest-support.patch \
+	   file://0002-expat-Added-support-for-ptests-in-form-of-new-target.patch \
+	   file://0003-expat-Added-suitable-format-of-tests-in-ptest.patch \
+	   file://run-ptest \
 	  "
 
 SRC_URI[md5sum] = "875a2c2ff3e8eb9e5a5cd62db2033ab5"
 SRC_URI[sha256sum] = "f1063084dc4302a427dabcca499c8312b3a32a29b7d2506653ecc8f950a9a237"
 
-inherit autotools lib_package
+inherit autotools ptest lib_package
+
+RDEPENDS_${PN}-ptest += "make bash"
 
 do_configure_prepend () {
 	rm -f ${S}/conftools/libtool.m4
 }
 
+do_compile_ptest() {
+	oe_runmake buildtest-TESTS
+}
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


