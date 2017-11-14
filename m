Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 77D47784D9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 14:58:01 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Nov 2017 06:57:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,395,1505804400"; d="scan'208";a="173402204"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 14 Nov 2017 06:57:56 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Nov 2017 16:57:38 +0200
Message-Id: <20171114145754.9643-11-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20171114145754.9643-1-alexander.kanavin@linux.intel.com>
References: <20171114145754.9643-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 11/27] libdnf: update to 0.11.1
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
X-List-Received-Date: Tue, 14 Nov 2017 14:58:02 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch | 11 ++++++-----
 ...Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch | 11 ++++++-----
 .../libdnf/{libdnf_0.9.3.bb => libdnf_0.11.1.bb}              |  2 +-
 3 files changed, 13 insertions(+), 11 deletions(-)
 rename meta/recipes-devtools/libdnf/{libdnf_0.9.3.bb => libdnf_0.11.1.bb} (95%)

diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch b/meta/recipes-devtools/libdnf/libdnf/0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch
index 280edb7a651..cbd0362c8b0 100644
--- a/meta/recipes-devtools/libdnf/libdnf/0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch
+++ b/meta/recipes-devtools/libdnf/libdnf/0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch
@@ -1,7 +1,8 @@
-From 3012a93745223751cc979e3770207a09a075bec6 Mon Sep 17 00:00:00 2001
+From 2bf0666544293dcfac2f67b678e24353acdcd4e7 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 7 Feb 2017 12:16:03 +0200
-Subject: [PATCH 5/5] Get parameters for both libsolv and libsolvext (libdnf is
+Subject: [PATCH 2/2] Get parameters for both libsolv and libsolvext (libdnf is
+
  using both)
 
 Upstream-Status: Submitted [https://github.com/rpm-software-management/libdnf/pull/312]
@@ -12,12 +13,12 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 8b2ab9a..e2d33d7 100644
+index ca280f3..6ab9827 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -29,7 +29,7 @@ find_package (PkgConfig REQUIRED)
  SET (CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake/modules)
- PKG_CHECK_MODULES(GLIB gio-unix-2.0>=2.44.0 REQUIRED)
+ PKG_CHECK_MODULES(GLIB gio-unix-2.0>=2.46.0 REQUIRED)
  FIND_LIBRARY (RPMDB_LIBRARY NAMES rpmdb)
 -PKG_CHECK_MODULES (LIBSOLV REQUIRED libsolv)
 +PKG_CHECK_MODULES (LIBSOLV REQUIRED libsolv libsolvext)
@@ -25,5 +26,5 @@ index 8b2ab9a..e2d33d7 100644
  if (ENABLE_RHSM_SUPPORT)
      pkg_check_modules (RHSM REQUIRED librhsm)
 -- 
-2.11.0
+2.14.2
 
diff --git a/meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch b/meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch
index 1ea93108933..6cf48a49f36 100644
--- a/meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch
+++ b/meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch
@@ -1,7 +1,8 @@
-From 55cbe6f40fe0836385e1a7241ec811cbe99e5840 Mon Sep 17 00:00:00 2001
+From bcea5c5063a2d5f07dbe6f40aee30370fc4ba656 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:24:50 +0200
-Subject: [PATCH 4/5] Set libsolv variables with pkg-config (cmake's own module
+Subject: [PATCH 1/2] Set libsolv variables with pkg-config (cmake's own module
+
  doesn't work properly).
 
 Upstream-Status: Submitted [https://github.com/rpm-software-management/libdnf/pull/312]
@@ -12,12 +13,12 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index a75df04..8b2ab9a 100644
+index 8875bbf..ca280f3 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -29,7 +29,8 @@ find_package (PkgConfig REQUIRED)
  SET (CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake/modules)
- PKG_CHECK_MODULES(GLIB gio-unix-2.0>=2.44.0 REQUIRED)
+ PKG_CHECK_MODULES(GLIB gio-unix-2.0>=2.46.0 REQUIRED)
  FIND_LIBRARY (RPMDB_LIBRARY NAMES rpmdb)
 -find_package (LibSolv 0.6.21 REQUIRED COMPONENTS ext)
 +PKG_CHECK_MODULES (LIBSOLV REQUIRED libsolv)
@@ -26,5 +27,5 @@ index a75df04..8b2ab9a 100644
      pkg_check_modules (RHSM REQUIRED librhsm)
      include_directories (${RHSM_INCLUDE_DIRS})
 -- 
-2.11.0
+2.14.2
 
diff --git a/meta/recipes-devtools/libdnf/libdnf_0.9.3.bb b/meta/recipes-devtools/libdnf/libdnf_0.11.1.bb
similarity index 95%
rename from meta/recipes-devtools/libdnf/libdnf_0.9.3.bb
rename to meta/recipes-devtools/libdnf/libdnf_0.11.1.bb
index 01d9346d9ad..4fc1d6defef 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.9.3.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.11.1.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://github.com/rpm-software-management/libdnf \
            file://0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch \
            "
 
-SRCREV = "1b19950e82d88eec28d01b4e7c1da712c941201d"
+SRCREV = "60f979bd8db651229c559c1412f1eb880257127d"
 
 S = "${WORKDIR}/git"
 
-- 
2.15.0


