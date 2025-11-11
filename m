Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2370CCFA18
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 07:57:36 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12636.1762847847202522588
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Nov 2025 23:57:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hDnlr7cL;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1762847848; x=1794383848;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=tmLWQ4/H5aT4AhFnJtnQDwN49qBEYcD71b58+fpP29M=;
  b=hDnlr7cLvmH5Ha7aAj1VlaqiSOh7Ymg6zMfZtC+z+gNA5YQeNYcL1kkk
   365dvSAKoUQ8vRoRAbU/bPfYf+305qjONQBNEFV010ZSHZmHKq73v/aTy
   9uiw9C1KBQlYpvkW1UmBVVXl8Ty8xAG7K8qqa1XG+QwhaqADBazMRqUyj
   lGLEpsyzXUnKRFZLovT7QUcqJ8WonpLHaDk7Zi0vwzDv6v8rcf6W9dWoH
   eC8w0nkn9yNrEYnsxIG4CFTvmc9Pw/2nih1KHgcbzimKxo9sZpk/T+LXh
   EtqDPxdsH5/3rXPt3iVvEftiSCbUadBOTbQfaCKPqJlulIzKxBEdm94F0
   A==;
X-CSE-ConnectionGUID: 4DP2/g/kTmmgk92lKYi0jA==
X-CSE-MsgGUID: FWvWPm9JRXuzORb7T2thCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="218807072"
X-IronPort-AV: E=Sophos;i="6.19,296,1754924400"; 
   d="scan'208";a="218807072"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.128])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 16:57:26 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id A81251002BB8
	for <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 07:57:25 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 63DCBC02F08
	for <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 07:57:25 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id DE46E1800D75;
	Tue, 11 Nov 2025 07:57:22 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libdnf: upgrade 0.74.0 -> 0.75.0
Date: Tue, 11 Nov 2025 15:57:19 +0800
Message-ID: <20251111075719.1676-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 07:57:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226149

From: Wang Mingyu <wangmy@fujitsu.com>

optional-check.patch
removed since it's included in 0.75.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libdnf/libdnf/optional-check.patch        | 52 -------------------
 .../{libdnf_0.74.0.bb => libdnf_0.75.0.bb}    |  3 +-
 2 files changed, 1 insertion(+), 54 deletions(-)
 delete mode 100644 meta/recipes-devtools/libdnf/libdnf/optional-check.patch
 rename meta/recipes-devtools/libdnf/{libdnf_0.74.0.bb => libdnf_0.75.0.bb} (94%)

diff --git a/meta/recipes-devtools/libdnf/libdnf/optional-check.patch b/meta/recipes-devtools/libdnf/libdnf/optional-check.patch
deleted file mode 100644
index 9228b0560f..0000000000
--- a/meta/recipes-devtools/libdnf/libdnf/optional-check.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From a4abd42a6b92f6aa16490c0f482bf08c4a6c2864 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Thu, 18 Sep 2025 11:23:33 +0100
-Subject: [PATCH] Move libcheck dependency to tests/
-
-If we're not building the tests then there's no point in depending on
-libcheck, so move the pkg_check_modules() call to tests/CMakeLists.
-
-Upstream-Status: Backport [https://github.com/rpm-software-management/libdnf/commit/6a127aec78d2ef837776e0e5a8e3636101a54ab0]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- CMakeLists.txt       | 1 -
- tests/CMakeLists.txt | 7 +++----
- 2 files changed, 3 insertions(+), 5 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index a489ea73..d1969899 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -59,7 +59,6 @@ find_package(LibSolv 0.7.21 REQUIRED COMPONENTS ext)
- 
- 
- # build dependencies via pkg-config
--pkg_check_modules(CHECK REQUIRED check)
- pkg_check_modules(GLIB REQUIRED gio-unix-2.0>=2.46.0)
- include_directories(${GLIB_INCLUDE_DIRS})
- pkg_check_modules(JSONC REQUIRED json-c)
-diff --git a/tests/CMakeLists.txt b/tests/CMakeLists.txt
-index e4909682..78743f4e 100644
---- a/tests/CMakeLists.txt
-+++ b/tests/CMakeLists.txt
-@@ -1,3 +1,6 @@
-+pkg_check_modules(CHECK REQUIRED check)
-+pkg_check_modules(CPPUNIT REQUIRED cppunit)
-+
- add_subdirectory(libdnf/conf)
- add_subdirectory(libdnf/module/modulemd)
- add_subdirectory(libdnf/module)
-@@ -7,10 +10,6 @@ add_subdirectory(libdnf/sack)
- add_subdirectory(hawkey)
- add_subdirectory(libdnf)
- 
--
--
--pkg_check_modules(CPPUNIT REQUIRED cppunit)
--
- set(LIBDNF_TEST_SOURCES
-     ${LIBDNF_TEST_SOURCES}
-     ${CMAKE_CURRENT_SOURCE_DIR}/run_tests.cpp
--- 
-2.43.0
-
diff --git a/meta/recipes-devtools/libdnf/libdnf_0.74.0.bb b/meta/recipes-devtools/libdnf/libdnf_0.75.0.bb
similarity index 94%
rename from meta/recipes-devtools/libdnf/libdnf_0.74.0.bb
rename to meta/recipes-devtools/libdnf/libdnf_0.75.0.bb
index 720e7d6e6f..570fccd9c3 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.74.0.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.75.0.bb
@@ -9,10 +9,9 @@ SRC_URI = "git://github.com/rpm-software-management/libdnf;branch=dnf-4-master;p
            file://0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch \
            file://0001-drop-FindPythonInstDir.cmake.patch \
            file://armarch.patch \
-           file://optional-check.patch \
            "
 
-SRCREV = "91a0bf9aada36a722855051526f012e0b5ab1af9"
+SRCREV = "d39573195e24b43687587a8d83b9f6ac274e2412"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(?!4\.90)\d+(\.\d+)+)"
 
 DEPENDS = "glib-2.0 libsolv librepo rpm libmodulemd json-c swig-native util-linux"
-- 
2.43.0


