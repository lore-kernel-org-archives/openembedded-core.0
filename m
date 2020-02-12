Return-Path: <oleksandr.s.popovych@globallogic.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 42FAF61049
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2020 12:19:16 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id o15so2061760ljg.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2020 04:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=globallogic.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=GgFb1ByA2LCK+1HYQZQ+1JrsW6WzUepbwGj4aEs1SwA=;
	b=YZi69BNKibDiFW0McqIl37ubPAZAnYBiGAi3dlyBJCCAuvUE+eWifVb7NzVDprFPZR
	3Un52u/LuTJbdJiEZGH2IvpYAUgiyHgUyEnj3umJmhLupquMkLBnn5nwJQO0AlJefrHY
	v8vNat7mQ72xagIuL0MRqjL3nYyqezhc8zo6pMWSyos02/9UQrTn09Ro0ZZinv9vOJXF
	H1mCK1Mqh3/eJSsaenbeWC5aL9lynp3vlHkVUYYa84nTDGVlZ0zPdxbnmI2ls1x4gKMp
	uQscRVoE/zDdBoJkXeX1MkADgJhVnbmUXY5Rz+F9ghpELJUtCk8VtvPuwirosbMyxcRO
	xwrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=GgFb1ByA2LCK+1HYQZQ+1JrsW6WzUepbwGj4aEs1SwA=;
	b=WdQ/eV02Kl1gvUOYuDDYJwekbq6Ep1UWtuOuxZaUBO8Aona+/OVEr4fTLR4j2U5+Br
	0e2hC9GPVSc4S55Ff5r9/i9WiHPvxQsgUWWyetBdSFJwiuBpZeKLm2ZmlgeSbzxCq0Qd
	LMvR+Ow0WyVWlz6AB58il8beAqWmY8h8vVkh/7qldNLPieZsiJVIa763tE3+MEwlbcIs
	7gDxOtVsaUxVSUt8tyS1zn3qVgWcX6BHhXnBkVKhNNC4vAxphdfWVDDdP4p7v/pf/lc0
	XijvZF/Le4JVQTzztv0pFy+rrdZPH9PTO05K3BE+Ak8rp9UOf4HKxawq0w3MIa0tDwRZ
	n+4w==
X-Gm-Message-State: APjAAAXCGKdbwJifaV8WGCBsJzrHLexRfVuSRD2KusmCY40JsLWf7puo
	QsbiBglQmKqQ2pYAa/MqM9xLJOV7I48=
X-Google-Smtp-Source: APXvYqwCaWyY2bxlpRuKBI0KCrRcQ93U3WhJ14YybCfHBqKKXmiOz71lA7rpbOTQFXyAp9Bga2tA4A==
X-Received: by 2002:a2e:88c5:: with SMTP id a5mr7696203ljk.201.1581509955796; 
	Wed, 12 Feb 2020 04:19:15 -0800 (PST)
Received: from kbp1-ldl-F65306.synapse.com ([195.238.92.77])
	by smtp.gmail.com with ESMTPSA id h24sm178395ljc.84.2020.02.12.04.19.14
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 12 Feb 2020 04:19:15 -0800 (PST)
From: Oleksandr Popovych <oleksandr.s.popovych@globallogic.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Feb 2020 14:19:11 +0200
Message-Id: <20200212121911.4752-1-oleksandr.s.popovych@globallogic.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH v6] expat: Added ptest
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
X-List-Received-Date: Wed, 12 Feb 2020 12:19:16 -0000

For ptest support for this package several additional patches and
run-ptest script were added and recipe was changed.

Signed-off-by: Oleksandr Popovych <oleksandr.s.popovych@globallogic.com>
---
 ...d-Makefile-targets-for-ptest-support.patch | 40 ++++++++++++++
 ...ort-for-ptests-in-form-of-new-target.patch | 33 ++++++++++++
 ...ed-suitable-format-of-tests-in-ptest.patch | 52 +++++++++++++++++++
 meta/recipes-core/expat/expat/run-ptest       |  3 ++
 meta/recipes-core/expat/expat_2.2.9.bb        | 12 ++++-
 5 files changed, 139 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/expat/expat/0001-expat-Added-Makefile-targets-for-ptest-support.patch
 create mode 100644 meta/recipes-core/expat/expat/0002-expat-Added-support-for-ptests-in-form-of-new-target.patch
 create mode 100644 meta/recipes-core/expat/expat/0003-expat-Added-suitable-format-of-tests-in-ptest.patch
 create mode 100644 meta/recipes-core/expat/expat/run-ptest

diff --git a/meta/recipes-core/expat/expat/0001-expat-Added-Makefile-targets-for-ptest-support.patch b/meta/recipes-core/expat/expat/0001-expat-Added-Makefile-targets-for-ptest-support.patch
new file mode 100644
index 0000000000..de213b4bc5
--- /dev/null
+++ b/meta/recipes-core/expat/expat/0001-expat-Added-Makefile-targets-for-ptest-support.patch
@@ -0,0 +1,40 @@
+From e306bd4849f61f50dad1f5d29fb650c347d78ad6 Mon Sep 17 00:00:00 2001
+From: Oleksandr Popovych <oleksandr.s.popovych@globallogic.com>
+Date: Thu, 6 Feb 2020 13:41:45 +0200
+Subject: [PATCH 1/3] expat: Added Makefile targets for ptest support
+
+install-ptest, runtests and check tagrets are added.
+
+Upstream-Status: Inappropriate [oe-core specific]
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
index 0000000000..26ae144a37
--- /dev/null
+++ b/meta/recipes-core/expat/expat/0002-expat-Added-support-for-ptests-in-form-of-new-target.patch
@@ -0,0 +1,33 @@
+From 9a5085243b632a777f55269f7f6d2e40dd73a7bc Mon Sep 17 00:00:00 2001
+From: Oleksandr Popovych <oleksandr.s.popovych@globallogic.com>
+Date: Thu, 6 Feb 2020 13:43:57 +0200
+Subject: [PATCH 2/3] expat: Added support for ptests in form of new target
+
+configure.am file changed, according to this advice:
+https://wiki.yoctoproject.org/wiki/Ptest#Building_the_test_suite
+
+Upstream-Status: Inappropriate [oe-core specific]
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
index 0000000000..9a85a26117
--- /dev/null
+++ b/meta/recipes-core/expat/expat/0003-expat-Added-suitable-format-of-tests-in-ptest.patch
@@ -0,0 +1,52 @@
+From 825f344543676fc3314f4e074163fd638db8e8f9 Mon Sep 17 00:00:00 2001
+From: Oleksandr Popovych <oleksandr.s.popovych@globallogic.com>
+Date: Thu, 6 Feb 2020 13:44:56 +0200
+Subject: [PATCH 3/3] expat: Added suitable format of tests in ptest
+
+Some changes in testcases code were applied for testcase engine.
+This was just adding of message outputs in "RESULT: TESTNAME" form...
+
+Upstream-Status: Inappropriate [oe-core specific]
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


