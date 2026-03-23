Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17DEED58CBE
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 03:43:01 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9698.1774237371560936443
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Mar 2026 20:42:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=eOUHsBDv;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1774237371; x=1805773371;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=tuOr353QastHWtOObVSkiTL3bIlYwnX+psYjqyHyiD4=;
  b=eOUHsBDv5ka83cVLyPsZ1X9RDsoi9yLK1G2c8zyyN66yzJlmA47tNdUS
   QBF4yLGIMACOWus4RqLgbyhDA2bW0xujkNd38rZJzakRP+vyN0eqQg+se
   ZD0JJZeIIvGMiWAeUXrh67FYYhMFkWOZE9hrX3u7N4BJyTWfeeMHbpzL0
   V5tmGBn5y5DZzOajdsvbNxA2dycLJqAZNrozyzr/wWWjMNBS21W0hJeMx
   fc61GrJvBCqQCFjY2prftlGi30MMP2xFyi8dq8Qv52YyiTfu4Ny7e2Ew8
   Sdul5VVKjct/d45CTCcGKfXEcHvYze+t4/m/JWDDznKCnDQd/mw9ZQNYC
   A==;
X-CSE-ConnectionGUID: NCEPs4cBRiKPoPRWYdoidw==
X-CSE-MsgGUID: KNLWBGVORsmyHUC0ipoH8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="233641383"
X-IronPort-AV: E=Sophos;i="6.23,136,1770562800"; 
   d="scan'208";a="233641383"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 12:42:50 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id C383E1C1C71D
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 03:42:49 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 74B9F18000D6
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 03:42:49 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id D9EED18002FF;
	Mon, 23 Mar 2026 03:42:46 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] lttng-tools: upgrade 2.14.1 -> 2.15.0
Date: Mon, 23 Mar 2026 11:42:43 +0800
Message-ID: <20260323034243.2150-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 03:43:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233694

From: Wang Mingyu <wangmy@fujitsu.com>

disable-tests2.patch
refresshed for 2.15.0

0001-tests-do-not-strip-a-helper-library.patch
removed since it's not available in 2.15.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-tests-do-not-strip-a-helper-library.patch | 24 -------------------
 .../lttng/lttng-tools/disable-tests2.patch    | 22 ++++++++++-------
 ...-tools_2.14.1.bb => lttng-tools_2.15.0.bb} | 10 ++++----
 3 files changed, 19 insertions(+), 37 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-tools/0001-tests-do-not-strip-a-helper-library.patch
 rename meta/recipes-kernel/lttng/{lttng-tools_2.14.1.bb => lttng-tools_2.15.0.bb} (96%)

diff --git a/meta/recipes-kernel/lttng/lttng-tools/0001-tests-do-not-strip-a-helper-library.patch b/meta/recipes-kernel/lttng/lttng-tools/0001-tests-do-not-strip-a-helper-library.patch
deleted file mode 100644
index 0547f30c02..0000000000
--- a/meta/recipes-kernel/lttng/lttng-tools/0001-tests-do-not-strip-a-helper-library.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From a45157a50e14d4bd244a3dd05d79c5703c819550 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Thu, 12 Dec 2019 16:52:07 +0100
-Subject: [PATCH] tests: do not strip a helper library
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- tests/utils/testapp/userspace-probe-elf-binary/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tests/utils/testapp/userspace-probe-elf-binary/Makefile.am b/tests/utils/testapp/userspace-probe-elf-binary/Makefile.am
-index 836f13e..e19a554 100644
---- a/tests/utils/testapp/userspace-probe-elf-binary/Makefile.am
-+++ b/tests/utils/testapp/userspace-probe-elf-binary/Makefile.am
-@@ -14,7 +14,7 @@ userspace_probe_elf_binary_LDADD = libfoo.la
- libfoo.strip: libfoo.la
- 	$(OBJCOPY) --strip-all .libs/libfoo.so
- 
--all-local: libfoo.strip
-+all-local:
- 	@if [ x"$(srcdir)" != x"$(builddir)" ]; then \
- 		for script in $(EXTRA_DIST); do \
- 			cp -f $(srcdir)/$$script $(builddir); \
diff --git a/meta/recipes-kernel/lttng/lttng-tools/disable-tests2.patch b/meta/recipes-kernel/lttng/lttng-tools/disable-tests2.patch
index 5b9a07fcb8..f93d6cdc4f 100644
--- a/meta/recipes-kernel/lttng/lttng-tools/disable-tests2.patch
+++ b/meta/recipes-kernel/lttng/lttng-tools/disable-tests2.patch
@@ -5,24 +5,30 @@ now. Ideally tests.serial would have occasional output when running to show acti
 Upstream-Status: Inappropriate [workaround for slow tests]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 
-Index: lttng-tools-2.14.0/tests/regression/Makefile.am
-===================================================================
---- lttng-tools-2.14.0.orig/tests/regression/Makefile.am
-+++ lttng-tools-2.14.0/tests/regression/Makefile.am
-@@ -26,7 +26,6 @@ SERIAL_TESTS = tools/base-path/test_ust
+---
+ tests/regression/Makefile.am | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/tests/regression/Makefile.am b/tests/regression/Makefile.am
+index a7cd133..bd82e94 100644
+--- a/tests/regression/Makefile.am
++++ b/tests/regression/Makefile.am
+@@ -30,7 +30,6 @@ SERIAL_TESTS = tools/base-path/test_ust \
  	tools/tracefile-limits/test_tracefile_count \
  	tools/tracefile-limits/test_tracefile_size \
  	tools/exclusion/test_exclusion \
 -	tools/snapshots/test_kernel \
  	tools/snapshots/test_ust_fast \
+ 	tools/snapshots/test_ust_long \
  	tools/snapshots/test_ust_streaming \
- 	tools/snapshots/test_kernel_streaming \
-@@ -47,8 +46,6 @@ SERIAL_TESTS = tools/base-path/test_ust
+@@ -53,7 +52,6 @@ SERIAL_TESTS = tools/base-path/test_ust \
  	tools/rotation/test_schedule_api \
  	tools/metadata/test_kernel \
  	tools/working-directory/test_relayd_working_directory \
--	tools/clear/test_ust \
 -	tools/clear/test_kernel \
  	tools/clear/test_live_hang.py \
  	tools/tracker/test_event_tracker \
  	tools/trigger/start-stop/test_start_stop \
+-- 
+2.43.0
+
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.14.1.bb b/meta/recipes-kernel/lttng/lttng-tools_2.15.0.bb
similarity index 96%
rename from meta/recipes-kernel/lttng/lttng-tools_2.14.1.bb
rename to meta/recipes-kernel/lttng/lttng-tools_2.15.0.bb
index 3a3f2cff2c..e22c5c0492 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.14.1.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.15.0.bb
@@ -44,7 +44,6 @@ PACKAGECONFIG[kmod] = "--with-kmod, --without-kmod, kmod"
 PACKAGECONFIG[manpages] = "--enable-man-pages, --disable-man-pages, asciidoc-native xmlto-native libxslt-native"
 
 SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
-           file://0001-tests-do-not-strip-a-helper-library.patch \
            file://run-ptest \
            file://lttng-sessiond.service \
            file://disable-tests.patch \
@@ -52,7 +51,7 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
            file://libc++.patch \
            "
 
-SRC_URI[sha256sum] = "0e68eb27923621c4bc127cfce40422d28cf7e473fedf6229ae6c32ba5c5b7c6d"
+SRC_URI[sha256sum] = "4d739116556da71d58275bc7f0a6c0a967c6774b7d90f02c2731a7875debf28a"
 
 inherit autotools ptest pkgconfig useradd python3-dir manpages systemd
 
@@ -76,6 +75,7 @@ FILES:${PN}-dev += "${PYTHON_SITEPACKAGES_DIR}/*.la"
 # Python module needs to keep _lttng.so
 INSANE_SKIP:${PN} = "libexec dev-so"
 INSANE_SKIP:${PN}-dbg = "libexec"
+INSANE_SKIP:${PN} = "already-stripped"
 
 PRIVATE_LIBS:${PN}-ptest = "libfoo.so"
 
@@ -95,7 +95,7 @@ do_install_ptest () {
         install -D "${B}/$f" "${D}${PTEST_PATH}/$f"
     done
 
-    for f in tests/utils/tap-driver.sh config/test-driver src/common/session.xsd src/common/mi-lttng-4.1.xsd \
+    for f in tests/utils/tap-driver.sh config/test-driver src/common/session.xsd src/common/mi-lttng-4.2.xsd \
              tests/regression/tests.serial; do
         install -D "${S}/$f" "${D}${PTEST_PATH}/$f"
     done
@@ -140,8 +140,8 @@ do_install_ptest () {
         done
     done
 
-    chrpath --delete ${D}${PTEST_PATH}/tests/utils/testapp/userspace-probe-elf-binary/userspace-probe-elf-binary
-    chrpath --delete ${D}${PTEST_PATH}/tests/utils/testapp/userspace-probe-elf-cxx-binary/userspace-probe-elf-cxx-binary
+    chrpath --delete ${D}${PTEST_PATH}/tests/utils/testapp/userspace-probe-elf-binary
+    chrpath --delete ${D}${PTEST_PATH}/tests/utils/testapp/userspace-probe-elf-cxx-binary
     chrpath --delete ${D}${PTEST_PATH}/tests/regression/ust/ust-dl/libbar.so
     chrpath --delete ${D}${PTEST_PATH}/tests/regression/ust/ust-dl/libfoo.so
 
-- 
2.43.0


