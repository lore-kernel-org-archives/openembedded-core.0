Return-Path: <yamane07ynct@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CB9BC83F09
	for <webhook@archiver.kernel.org>; Fri,  4 Jul 2025 05:40:15 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.6262.1751607613692140752
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Jul 2025 22:40:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GKw8E2mw;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: yamane07ynct@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3121aed2435so685122a91.2
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Jul 2025 22:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751607613; x=1752212413; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+IjUtYv2+0Izb2IuJu/VgUhsZwYtU0jtByb9rROB15Q=;
        b=GKw8E2mwSK+OHcS45LZRguGUqfch0k3mBWI05TI2d6+0Fd1dAArSrOVW80IZu0FOa9
         f8yuLFmtsTKjQLgZG0tJAC+liHur8sz2x09hG085xHhmyXZuYYVuLoDvJCy4BnkfpDg6
         vnfkLFvrSfdZj7oc5ykbJuMiQ8CUiJ/jEX9dAGFWIfhmthy8Wb0S6DxjmuMSiYoWC4CH
         rI8rhnGZMcabKEohfzORCgQZRE8qVMjKGU5a8keV7di/LT3bxvzRtRRngpmTOwcfAp7n
         sdCj67IGzScz4asu9qcCbmBsAt0DS4oaaboPKPrHgAW+BPCgUi6c2urSFktQ0168k8j3
         O3UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751607613; x=1752212413;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+IjUtYv2+0Izb2IuJu/VgUhsZwYtU0jtByb9rROB15Q=;
        b=Oioh2wJ9PQ1Q3kmtimjpZFewUQNjo6BfVKAIrRKdjgKxax3MOqGDxb3yNLsmdR1nAg
         zaBmr9OKjd/laqX+i5GNoKYKk7jh9k39JRuYvyEiGKMjVkT7KYy5b8xPpEJiUvbvrlaH
         9CJp2Q24U160WX3FpdYvU2tnfdvQfrT+PeEWPH9uCefLQrTlHd3CzKD8TApx3XO2Q1SD
         Qgs9thClrUxzcria4t2TawnIYf9YiT8Q/UtvU9+BC0Ef04B4fhyaUgZ7F79acci2kEpt
         kS6Y4oz/KrXC28ih82dJmWsk7z61h8mPBh5C0OjY4/fgcpuoGmdQmbSv11Ycs8LEF800
         iMXA==
X-Gm-Message-State: AOJu0YwEsc9pgAGTrFAn9P6I5xno+f1FSFO2y94VYbuG+FIJecuK3RJH
	dA2sAR1ZZbnTSyAj4GWbkfMTRmFM+lAggSoyp2QVOkpq3CrMXy5kwEzeqP1UNQ==
X-Gm-Gg: ASbGncvww776tx1Qhoh0FNmCjAgNac97B9PIeDirK7qgtb9bRNmUzGSEQLURsE8deXi
	Z7ZpO87ILUEJHfBVhPgPiNJ8UywywBsChFBEr8B9ke5j9jW0ZuUx4IAGh8ZuJ7PQFQOAC/AaH21
	J8CaDV1qDPkr9JGbsKwCDDI8yM/uwT+cMyBhh+BpcGEbUZIHSpoOFWaqy2Mig2Nrqde9FzeH9O8
	Vti1eyHvCiNbHitR8D6HQ5MDRZ3crzmAmXfCS97qjxr19i3xy2P2ICmfzQub6iyLyU7H37EYF8w
	AlmwByDXyGX84xkcLAeKGxtpjGNmhUppAy7hvaxlmaM5rmUBW1igbokXK71V/XnCwPIQQYgT39E
	imQWFYilBq/dpDtVZmYL/6C3e
X-Google-Smtp-Source: AGHT+IGBPzFKN/pBnuTJwPV9/a7nKiEs9M7uy8VMmATq73e8zaQfsjTVvWtUo9+dpw7pXeIYAZ6x3w==
X-Received: by 2002:a17:90b:350b:b0:313:23ed:701 with SMTP id 98e67ed59e1d1-31aac436a63mr2130118a91.4.1751607612700;
        Thu, 03 Jul 2025 22:40:12 -0700 (PDT)
Received: from yocto.. (softbank060117076056.bbtec.net. [60.117.76.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31a9cc4e102sm4148726a91.3.2025.07.03.22.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 22:40:12 -0700 (PDT)
From: Daisuke Yamane <yamane07ynct@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Daisuke Yamane <yamane07ynct@gmail.com>
Subject: [PATCH] icu: Add ptest support
Date: Fri,  4 Jul 2025 14:38:56 +0900
Message-ID: <20250704053856.2446627-1-yamane07ynct@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 05:40:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219899

Add following patches.
  - 0001-test-Add-support-ptest.patch
    - Some default paths in test code are invalid at runtime and cause
    - test failures. So add a patch to adjust path to test data for ptest
    - environment.
  - 0001-ICU-23120-Mask-UnicodeStringTest-TestLargeMemory-on-.patch
    - Since ICU-77.1, a test case (TestLargeMemory) that fails to build
    - in a 32-bit environment. So add a patch to skip this test case.
    - This bug has been reported to upstream. See https://unicode-org.atlassian.net/browse/ICU-23120.
Install icu test-suite to run it as a ptest.
Add icu-ptest to PTERSTS_SLOW because it takes more than 30s to complete
on qemuarm64.

root@qemuarm64:~# ptest-runner icu
START: ptest-runner
2025-07-02T17:48
BEGIN: /usr/lib/icu/ptest
___(snip)___
[All tests passed successfully...]
Elapsed Time: 00:01:10.345
PASS: cintltst
----------------------------------------
ALL TESTS SUMMARY:
All tests OK:  intltest iotest cintltst
DURATION: 371
END: /usr/lib/icu/ptest
2025-07-03T18:44
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Daisuke Yamane <yamane07ynct@gmail.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 ...nicodeStringTest-TestLargeMemory-on-.patch | 28 +++++++
 .../icu/icu/0001-test-Add-support-ptest.patch | 84 +++++++++++++++++++
 meta/recipes-support/icu/icu/run-ptest        | 40 +++++++++
 meta/recipes-support/icu/icu_77-1.bb          | 26 ++++++
 5 files changed, 179 insertions(+)
 create mode 100644 meta/recipes-support/icu/icu/0001-ICU-23120-Mask-UnicodeStringTest-TestLargeMemory-on-.patch
 create mode 100644 meta/recipes-support/icu/icu/0001-test-Add-support-ptest.patch
 create mode 100755 meta/recipes-support/icu/icu/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 4253c7b062..ac767b5cd3 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -105,6 +105,7 @@ PTESTS_SLOW = "\
     glib-2.0 \
     gnutls \
     gstreamer1.0 \
+    icu \
     less \
     libevent \
     libgcrypt \
diff --git a/meta/recipes-support/icu/icu/0001-ICU-23120-Mask-UnicodeStringTest-TestLargeMemory-on-.patch b/meta/recipes-support/icu/icu/0001-ICU-23120-Mask-UnicodeStringTest-TestLargeMemory-on-.patch
new file mode 100644
index 0000000000..e2e9546679
--- /dev/null
+++ b/meta/recipes-support/icu/icu/0001-ICU-23120-Mask-UnicodeStringTest-TestLargeMemory-on-.patch
@@ -0,0 +1,28 @@
+From 4b3e6888c2aaba6465f1bc96f61b17a2513050f3 Mon Sep 17 00:00:00 2001
+From: David Seifert <soap@gentoo.org>
+Date: Sat, 21 Jun 2025 12:28:15 +0200
+Subject: [PATCH] ICU-23120 Mask UnicodeStringTest::TestLargeMemory on 32-bit
+ platforms
+
+Upstream-Status: Submitted [https://github.com/unicode-org/icu/pull/3496]
+Signed-off-by: Daisuke Yamane <yamane07ynct@gmail.com>
+---
+ test/intltest/ustrtest.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/test/intltest/ustrtest.cpp b/test/intltest/ustrtest.cpp
+index 56976b3e3d2..26225f5b5b5 100644
+--- a/test/intltest/ustrtest.cpp
++++ b/test/intltest/ustrtest.cpp
+@@ -2353,7 +2353,7 @@ void UnicodeStringTest::TestUnicodeStringInsertAppendToSelf() {
+ }
+ 
+ void UnicodeStringTest::TestLargeMemory() {
+-#if U_PLATFORM_IS_LINUX_BASED || U_PLATFORM_IS_DARWIN_BASED
++#if (U_PLATFORM_IS_LINUX_BASED || U_PLATFORM_IS_DARWIN_BASED) && (UINTPTR_MAX == 0xFFFFFFFFFFFFFFFF)
+     if(quick) { return; }
+     IcuTestErrorCode status(*this, "TestLargeMemory");
+     constexpr uint32_t len = 2147483643;
+-- 
+2.43.0
+
diff --git a/meta/recipes-support/icu/icu/0001-test-Add-support-ptest.patch b/meta/recipes-support/icu/icu/0001-test-Add-support-ptest.patch
new file mode 100644
index 0000000000..9f7520c9d3
--- /dev/null
+++ b/meta/recipes-support/icu/icu/0001-test-Add-support-ptest.patch
@@ -0,0 +1,84 @@
+From 783d9e0d3d7824fbca53c2c3a80e8e5e23eacc82 Mon Sep 17 00:00:00 2001
+From: Daisuke Yamane <yamane07ynct@gmail.com>
+Date: Tue, 1 Jul 2025 18:35:25 +0900
+Subject: [PATCH] test: Add support ptest
+
+Upstream-Status: Inappropriate [oe-core specific]
+
+Signed-off-by: Daisuke Yamane <yamane07ynct@gmail.com>
+---
+ test/cintltst/Makefile.in  | 2 +-
+ test/intltest/Makefile.in  | 2 +-
+ test/intltest/intltest.cpp | 2 +-
+ test/iotest/Makefile.in    | 2 +-
+ test/letest/Makefile.in    | 2 +-
+ 5 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/test/cintltst/Makefile.in b/test/cintltst/Makefile.in
+index 552a105..9cf3071 100644
+--- a/test/cintltst/Makefile.in
++++ b/test/cintltst/Makefile.in
+@@ -39,7 +39,7 @@ CPPFLAGS += -I$(top_srcdir)/common -I$(top_srcdir)/i18n -I$(top_srcdir)/tools/ct
+ ifdef QNX_TARGET
+ DEFS += -D'ICU_UNICODE_VERSION="$(UNICODE_VERSION)"' -D'ICU_VERSION="@VERSION@"' -D'ICUDATA_NAME="$(ICUDATA_PLATFORM_NAME)"' -D'U_TOPSRCDIR="/var/icu_tests"' -D'U_TOPBUILDDIR="/var/icu_tests/"'
+ else
+-DEFS += -D'ICU_UNICODE_VERSION="$(UNICODE_VERSION)"' -D'ICU_VERSION="@VERSION@"' -D'ICUDATA_NAME="$(ICUDATA_PLATFORM_NAME)"' -D'U_TOPSRCDIR="$(top_srcdir)/"' -D'U_TOPBUILDDIR="$(BUILDDIR)"'
++DEFS += -D'ICU_UNICODE_VERSION="$(UNICODE_VERSION)"' -D'ICU_VERSION="@VERSION@"' -D'ICUDATA_NAME="$(ICUDATA_PLATFORM_NAME)"' -D'U_TOPSRCDIR="$(PTEST_PATH)/"' -D'U_TOPBUILDDIR="$(PTEST_PATH)/"'
+ endif
+ LIBS = $(LIBCTESTFW) $(LIBICUI18N) $(LIBICUTOOLUTIL) $(LIBICUUC) $(DEFAULT_LIBS) $(LIB_M)
+ 
+diff --git a/test/intltest/Makefile.in b/test/intltest/Makefile.in
+index 5d4a03b..ca4e4cd 100644
+--- a/test/intltest/Makefile.in
++++ b/test/intltest/Makefile.in
+@@ -39,7 +39,7 @@ CPPFLAGS += -DUNISTR_FROM_CHAR_EXPLICIT= -DUNISTR_FROM_STRING_EXPLICIT=
+ ifdef QNX_TARGET
+ DEFS += -D'U_TOPSRCDIR="/var/icu_tests"' -D'U_TOPBUILDDIR="/var/icu_tests/"'
+ else
+-DEFS += -D'U_TOPSRCDIR="$(top_srcdir)/"' -D'U_TOPBUILDDIR="$(BUILDDIR)"'
++DEFS += -D'U_TOPSRCDIR="$(PTEST_PATH)/"' -D'U_TOPBUILDDIR="$(PTEST_PATH)/"'
+ endif
+ LIBS = $(LIBCTESTFW) $(LIBICUI18N) $(LIBICUUC) $(LIBICUTOOLUTIL) $(DEFAULT_LIBS) $(LIB_M) $(LIB_THREAD)
+ 
+diff --git a/test/intltest/intltest.cpp b/test/intltest/intltest.cpp
+index 3806d0f..33829b0 100644
+--- a/test/intltest/intltest.cpp
++++ b/test/intltest/intltest.cpp
+@@ -1713,7 +1713,7 @@ static bool fileExists(const char* fileName) {
+  * Returns the path to icu/testdata/
+  */
+ const char *IntlTest::getSharedTestData(UErrorCode& err) {
+-#define SOURCE_TARBALL_TOP U_TOPSRCDIR U_FILE_SEP_STRING ".." U_FILE_SEP_STRING
++#define SOURCE_TARBALL_TOP U_TOPSRCDIR U_FILE_SEP_STRING
+ #define REPO_TOP SOURCE_TARBALL_TOP ".." U_FILE_SEP_STRING
+ #define FILE_NAME U_FILE_SEP_STRING "message2" U_FILE_SEP_STRING "valid-tests.json"
+     const char *srcDataDir = nullptr;
+diff --git a/test/iotest/Makefile.in b/test/iotest/Makefile.in
+index 16c510f..9eeff4b 100644
+--- a/test/iotest/Makefile.in
++++ b/test/iotest/Makefile.in
+@@ -39,7 +39,7 @@ CPPFLAGS += -DUNISTR_FROM_CHAR_EXPLICIT= -DUNISTR_FROM_STRING_EXPLICIT=
+ ifdef QNX_TARGET
+ DEFS += -D'U_TOPSRCDIR="/var/icu_tests"' -D'U_TOPBUILDDIR="/var/icu_tests/"'
+ else
+-DEFS += -D'U_TOPSRCDIR="$(top_srcdir)/"' -D'U_TOPBUILDDIR="$(BUILDDIR)"'
++DEFS += -D'U_TOPSRCDIR="$(PTEST_PATH)/"' -D'U_TOPBUILDDIR="$(PTEST_PATH)/"'
+ endif
+ LIBS = $(LIBCTESTFW) $(LIBICUTOOLUTIL) $(LIBICUIO) $(LIBICUI18N) $(LIBICUUC) $(DEFAULT_LIBS) $(LIB_M)
+ 
+diff --git a/test/letest/Makefile.in b/test/letest/Makefile.in
+index 156c86f..555a820 100644
+--- a/test/letest/Makefile.in
++++ b/test/letest/Makefile.in
+@@ -30,7 +30,7 @@ BUILDDIR := $(BUILDDIR:test\\cintltst/../../=)
+ BUILDDIR := $(BUILDDIR:TEST\\CINTLTST/../../=)
+ 
+ CPPFLAGS += -I$(top_srcdir)/common -I$(top_srcdir)/i18n -I$(top_srcdir)/tools/ctestfw -I$(top_srcdir)/tools/toolutil -I$(top_srcdir)/layoutex $(ICULE_CFLAGS) $(ICULEHB_CFLAGS)
+-DEFS += -D'U_TOPSRCDIR="$(top_srcdir)/"' -D'U_TOPBUILDDIR="$(BUILDDIR)"'
++DEFS += -D'U_TOPSRCDIR="$(PTEST_PATH)/"' -D'U_TOPBUILDDIR="$(PTEST_PATH)/"'
+ LIBS = $(LIBICULX) $(LIBICUUC) $(LIBICUI18N) $(LIBCTESTFW) $(LIBICUTOOLUTIL) $(DEFAULT_LIBS) $(LIB_M) $(ICULEHB_LIBS)
+ 
+ COMMONOBJECTS = SimpleFontInstance.o
+-- 
+2.43.0
+
diff --git a/meta/recipes-support/icu/icu/run-ptest b/meta/recipes-support/icu/icu/run-ptest
new file mode 100755
index 0000000000..9a428cf205
--- /dev/null
+++ b/meta/recipes-support/icu/icu/run-ptest
@@ -0,0 +1,40 @@
+#!/bin/sh
+
+TESTS="intltest iotest cintltst"
+TMP="$(mktemp -d)"
+STATUS_R="${TMP}/status.$$"
+TOPDIR=$(dirname "$(realpath $0)")
+for t in ${TESTS}; do
+	cd ${TOPDIR}/test/$t
+	./$t -E${STATUS_R}.$t || (echo "FAIL: $t"; touch ${STATUS_R}.$t; cp ${STATUS_R}.$t ${STATUS_R}.$t.FAIL)
+	[ ! -f ${STATUS_R}.$t.FAIL ] && touch ${STATUS_R}.$t.PASS && echo "PASS: $t"
+	echo "----------------------------------------"
+	if [ -s "${STATUS_R}.$t.FAIL" ];then
+		echo "-------------"
+		echo "| ***     FAILING TEST SUMMARY FOR:              $t"
+		cat ${STATUS_R}.$t.FAIL
+		echo "| *** END FAILING TEST SUMMARY FOR:              $t"
+	fi
+done
+
+goods=""
+bads=""
+for t in ${TESTS}; do
+	if [ -f "${STATUS_R}.$t.FAIL" ];then
+		bads="${bads} $t"
+	elif [ -f "${STATUS_R}.$t.PASS" ];then
+		goods="${goods} $t"
+	else
+		echo "*** subtest did not complete - $t"
+		bads="${bads} $t"
+	fi
+done
+echo "ALL TESTS SUMMARY:"
+if [ ! "x${bads}" = "x" ];then
+	echo "ok: ${goods}"
+	echo "===== ERRS: ${bads}"
+	exit 1
+else
+	echo "All tests OK: ${goods}"
+fi
+rm -rf ${TMP}
diff --git a/meta/recipes-support/icu/icu_77-1.bb b/meta/recipes-support/icu/icu_77-1.bb
index e655b18ad2..6bd3c5d89b 100644
--- a/meta/recipes-support/icu/icu_77-1.bb
+++ b/meta/recipes-support/icu/icu_77-1.bb
@@ -119,6 +119,9 @@ SRC_URI = "${BASE_SRC_URI};name=code \
            ${DATA_SRC_URI};name=data \
            file://filter.json \
            file://0001-icu-Added-armeb-support.patch \
+           file://0001-ICU-23120-Mask-UnicodeStringTest-TestLargeMemory-on-.patch \
+           file://0001-test-Add-support-ptest.patch \
+           file://run-ptest \
            "
 
 SRC_URI:append:class-target = "\
@@ -160,3 +163,26 @@ do_make_icudata() {
 }
 
 addtask make_icudata before do_configure after do_patch do_prepare_recipe_sysroot
+
+inherit ptest
+RDEPENDS:${PN}-ptest += "bash"
+
+do_compile_ptest() {
+    oe_runmake -C test everything PTEST_PATH=${PTEST_PATH}
+}
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/test
+    install -d ${D}${PTEST_PATH}/data
+    cp -r ${S}/test/testdata ${D}/${PTEST_PATH}/test
+    cp -r ${S}/data/unidata ${D}/${PTEST_PATH}/data/
+    cp -r ${S}/data/sprep ${D}/${PTEST_PATH}/data/
+    cp -r ${S}/../testdata ${D}/${PTEST_PATH}/
+    cp -r ${B}/test/testdata/out ${D}/${PTEST_PATH}/test/testdata
+
+    list="intltest iotest cintltst"
+    for i in $list; do
+        install -d ${D}${PTEST_PATH}/test/${i}/
+        install -m 755 ${B}/test/${i}/${i} ${D}/${PTEST_PATH}/test/${i}/
+    done
+}
-- 
2.43.0


