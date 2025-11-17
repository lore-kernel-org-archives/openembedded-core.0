Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ADFDCEACEF
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 00:42:49 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6011.1763340158559682587
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Nov 2025 16:42:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=CM90RAKA;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1763340159; x=1794876159;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ylsxFpd40rUtD8d63b3R/bXffuj+dkmDSvn10KA3u60=;
  b=CM90RAKAkhRMFkxcfTcz86k18YhcNwTxNO+jU7QNf54pbFqe8Xaqz2eQ
   oe+hXyFw1guKZbzNzEao4t+GOWor4+qU/l15G0ipN9xQK/FRYV3bvB6ps
   PcbGyZWRcd53dUyT3tYN1QLu9P1g07aYvOYLjmyZ3WG8xP7RiVtnZOQDB
   Yzr+s+wttBqr+NJ3Du1JZoTV9QqxdNs7YMKITS75rgrnmPX0FV2hNaube
   8vEo+RJrcLWLHyCbM0jErAwIQKz7ipjLjyAsRepcKl4pUWzKwfevNSxUZ
   szTZp9eV9RCCnHY/SJshWKqgeCqudy7A5c7bouO+04JDbU4T9BIOjalu6
   g==;
X-CSE-ConnectionGUID: GN6IlJGQSHCwLveJ4Sbf3g==
X-CSE-MsgGUID: mk1JDV7WTUKf8KieTkj39A==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="219434782"
X-IronPort-AV: E=Sophos;i="6.19,310,1754924400"; 
   d="scan'208";a="219434782"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([51.138.80.169])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 09:42:35 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 7D0BA42A318
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Nov 2025 00:42:34 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 3320B1800BFC
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Nov 2025 00:42:34 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id C61E8405E22;
	Mon, 17 Nov 2025 00:42:31 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH v2] libdnf: upgrade 0.74.0 -> 0.75.0
Date: Mon, 17 Nov 2025 08:42:28 +0800
Message-ID: <20251117004228.1402-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Nov 2025 00:42:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226478

From: Wang Mingyu <wangmy@fujitsu.com>

optional-check.patch
removed since it's included in 0.75.0

Add patches to fix compilation error with musl:
0001-dnf-repo-Define-FNM_EXTMATCH-if-not-already-like-und.patch
0001-utils-utils.cpp-fix-compilation-with-musl.patch

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...FNM_EXTMATCH-if-not-already-like-und.patch | 39 ++++++++++++++
 ...-utils.cpp-fix-compilation-with-musl.patch | 51 ++++++++++++++++++
 .../libdnf/libdnf/optional-check.patch        | 52 -------------------
 .../{libdnf_0.74.0.bb => libdnf_0.75.0.bb}    |  7 ++-
 4 files changed, 95 insertions(+), 54 deletions(-)
 create mode 100644 meta/recipes-devtools/libdnf/libdnf/0001-dnf-repo-Define-FNM_EXTMATCH-if-not-already-like-und.patch
 create mode 100644 meta/recipes-devtools/libdnf/libdnf/0001-utils-utils.cpp-fix-compilation-with-musl.patch
 delete mode 100644 meta/recipes-devtools/libdnf/libdnf/optional-check.patch
 rename meta/recipes-devtools/libdnf/{libdnf_0.74.0.bb => libdnf_0.75.0.bb} (85%)

diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-dnf-repo-Define-FNM_EXTMATCH-if-not-already-like-und.patch b/meta/recipes-devtools/libdnf/libdnf/0001-dnf-repo-Define-FNM_EXTMATCH-if-not-already-like-und.patch
new file mode 100644
index 0000000000..3067668d82
--- /dev/null
+++ b/meta/recipes-devtools/libdnf/libdnf/0001-dnf-repo-Define-FNM_EXTMATCH-if-not-already-like-und.patch
@@ -0,0 +1,39 @@
+From 486d1c7826efb9e42bbb18b6537fd23a0a33b324 Mon Sep 17 00:00:00 2001
+From: Wang Mingyu <wangmy@fujitsu.com>
+Date: Sun, 16 Nov 2025 23:29:18 +0000
+Subject: [PATCH] dnf-repo: Define FNM_EXTMATCH if not already (like under
+ musl).
+
+With musl, FNM_EXTMATCH is not defined:
+dnf-repo.cpp
+| dnf-repo.cpp: In function 'void dnf_repo_conf_load_overrides(DnfRepo*, const char*)':
+| dnf-repo.cpp:971:50: error: 'FNM_EXTMATCH' was not declared in this scope; did you mean 'FNM_NOMATCH'?
+|   971 |             if (fnmatch(repo_id_pattern, repoId, FNM_EXTMATCH) != 0) {
+|       |                                                  ^~~~~~~~~~~~
+|       |                                                  FNM_NOMATCH
+
+Upstream-Status: Submitted[https://github.com/rpm-software-management/libdnf/pull/1737/commits/47ed831c1fdb32519f2d66fee91bc47f9521d1d4]
+
+Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
+---
+ libdnf/dnf-repo.cpp | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/libdnf/dnf-repo.cpp b/libdnf/dnf-repo.cpp
+index 44c0f8758..d53959414 100644
+--- a/libdnf/dnf-repo.cpp
++++ b/libdnf/dnf-repo.cpp
+@@ -69,6 +69,10 @@
+ #include <string>
+ #include <vector>
+ 
++#if !defined(FNM_EXTMATCH)
++#define FNM_EXTMATCH 0
++#endif
++
+ typedef struct
+ {
+     DnfRepoEnabled   enabled;
+-- 
+2.43.0
+
diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-utils-utils.cpp-fix-compilation-with-musl.patch b/meta/recipes-devtools/libdnf/libdnf/0001-utils-utils.cpp-fix-compilation-with-musl.patch
new file mode 100644
index 0000000000..450f3224b5
--- /dev/null
+++ b/meta/recipes-devtools/libdnf/libdnf/0001-utils-utils.cpp-fix-compilation-with-musl.patch
@@ -0,0 +1,51 @@
+From 699608a4c03ebbf64c1d7b6f56d9811492175daa Mon Sep 17 00:00:00 2001
+From: Wang Mingyu <wangmy@fujitsu.com>
+Date: Mon, 17 Nov 2025 00:05:14 +0000
+Subject: [PATCH] utils/utils.cpp: fix compilation with musl
+
+The basename() function requires the libgen.h header when
+compiling with musl-libc, otherwise it complains:
+error: 'basename' was not declared in this scope; did you mean 'g_basename'?
+Also, musl's basename requires char* instead of const char* argument:
+error: invalid conversion from 'const char*' to 'char*' [-fpermissive]
+
+Upstream-Status: Submitted[https://github.com/rpm-software-management/libdnf/pull/1737/commits/8720d5eeb0d348686d4c5f2ccb5a6c73d66eeff5]
+
+Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
+---
+ libdnf/utils/utils.cpp | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/libdnf/utils/utils.cpp b/libdnf/utils/utils.cpp
+index f5d200b8a..501bc0ed2 100644
+--- a/libdnf/utils/utils.cpp
++++ b/libdnf/utils/utils.cpp
+@@ -9,6 +9,7 @@
+ #include <sys/stat.h>
+ #include <dirent.h>
+ #include <cstring>
++#include <libgen.h>
+ #include <glob.h>
+ #include <stdexcept>
+ 
+@@ -311,7 +312,7 @@ std::vector<std::string> createSortedFileList(
+             auto * path_fname = basename(path);
+             bool found{false};
+             for (const auto & path_in_list : paths) {
+-                if (strcmp(path_fname, basename(path_in_list.c_str())) == 0) {
++                if (strcmp(path_fname, basename((char*)path_in_list.c_str())) == 0) {
+                     found = true;
+                     break;
+                 }
+@@ -325,7 +326,7 @@ std::vector<std::string> createSortedFileList(
+ 
+     // sort all drop-in configuration files alphabetically by their names
+     std::sort(paths.begin(), paths.end(), [](const std::string & p1, const std::string & p2) {
+-        return strcmp(basename(p1.c_str()), basename(p2.c_str())) < 0;
++        return strcmp(basename((char*)p1.c_str()), basename((char*)p2.c_str())) < 0;
+     });
+ 
+     return paths;
+-- 
+2.43.0
+
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
similarity index 85%
rename from meta/recipes-devtools/libdnf/libdnf_0.74.0.bb
rename to meta/recipes-devtools/libdnf/libdnf_0.75.0.bb
index 720e7d6e6f..ddcbc7d9ff 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.74.0.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.75.0.bb
@@ -9,16 +9,19 @@ SRC_URI = "git://github.com/rpm-software-management/libdnf;branch=dnf-4-master;p
            file://0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch \
            file://0001-drop-FindPythonInstDir.cmake.patch \
            file://armarch.patch \
-           file://optional-check.patch \
+           file://0001-dnf-repo-Define-FNM_EXTMATCH-if-not-already-like-und.patch \
+           file://0001-utils-utils.cpp-fix-compilation-with-musl.patch \
            "
 
-SRCREV = "91a0bf9aada36a722855051526f012e0b5ab1af9"
+SRCREV = "d39573195e24b43687587a8d83b9f6ac274e2412"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(?!4\.90)\d+(\.\d+)+)"
 
 DEPENDS = "glib-2.0 libsolv librepo rpm libmodulemd json-c swig-native util-linux"
 
 inherit cmake pkgconfig setuptools3-base gettext
 
+COMPATIBLE_HOST_libc-musl = 'null'
+
 EXTRA_OECMAKE = " -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR} -DPYTHON_DESIRED=3 \
                   -DWITH_GTKDOC=OFF -DWITH_MAN=OFF -DWITH_HTML=OFF \
                   -DWITH_TESTS=OFF \
-- 
2.43.0


