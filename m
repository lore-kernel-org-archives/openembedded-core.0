Return-Path: <bogdan.a.marinescu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 497326A406
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 May 2013 12:20:10 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 27 May 2013 05:18:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,750,1363158000"; d="scan'208";a="320184276"
Received: from bogdanm.rb.intel.com ([10.237.105.166])
	by orsmga001.jf.intel.com with ESMTP; 27 May 2013 05:20:10 -0700
From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 May 2013 15:19:54 +0300
Message-Id: <3865b9143f8f95518029f7aced1baf1c0cf1a8d6.1369657070.git.bogdan.a.marinescu@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1369657070.git.bogdan.a.marinescu@intel.com>
References: <cover.1369657070.git.bogdan.a.marinescu@intel.com>
In-Reply-To: <cover.1369657070.git.bogdan.a.marinescu@intel.com>
References: <cover.1369657070.git.bogdan.a.marinescu@intel.com>
Subject: [PATCH 2/3] python-dbus: upgraded to 1.2.0
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
X-List-Received-Date: Mon, 27 May 2013 12:20:10 -0000

The license itself didn't modify, just some comments regarding the license.

Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
---
 .../python-dbus-1.1.1/obsolete_automake_macros.patch     |   14 --------------
 .../{python-dbus_1.1.1.bb => python-dbus_1.2.0.bb}       |    8 +++-----
 2 files changed, 3 insertions(+), 19 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python-dbus-1.1.1/obsolete_automake_macros.patch
 rename meta/recipes-devtools/python/{python-dbus_1.1.1.bb => python-dbus_1.2.0.bb} (70%)

diff --git a/meta/recipes-devtools/python/python-dbus-1.1.1/obsolete_automake_macros.patch b/meta/recipes-devtools/python/python-dbus-1.1.1/obsolete_automake_macros.patch
deleted file mode 100644
index 9da9c45..0000000
--- a/meta/recipes-devtools/python/python-dbus-1.1.1/obsolete_automake_macros.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-Upstream-Status: Submitted [https://bugs.freedesktop.org/show_bug.cgi?id=59006]
-
-Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
-diff -Nurd dbus-python-1.1.1/configure.ac dbus-python-1.1.1/configure.ac
---- dbus-python-1.1.1/configure.ac	2012-06-25 19:02:12.000000000 +0300
-+++ dbus-python-1.1.1/configure.ac	2013-01-03 05:42:00.498912733 +0200
-@@ -29,7 +29,7 @@
- AC_SUBST(DBUS_PYTHON_MICRO_VERSION, dbus_python_micro_version)
-
- AC_CONFIG_SRCDIR([_dbus_bindings/module.c])
--AM_CONFIG_HEADER(config.h)
-+AC_CONFIG_HEADERS(config.h)
-
- AM_INIT_AUTOMAKE([1.9 -Wno-portability])
diff --git a/meta/recipes-devtools/python/python-dbus_1.1.1.bb b/meta/recipes-devtools/python/python-dbus_1.2.0.bb
similarity index 70%
rename from meta/recipes-devtools/python/python-dbus_1.1.1.bb
rename to meta/recipes-devtools/python/python-dbus_1.2.0.bb
index 465a7f4..a185d84 100644
--- a/meta/recipes-devtools/python/python-dbus_1.1.1.bb
+++ b/meta/recipes-devtools/python/python-dbus_1.2.0.bb
@@ -2,16 +2,14 @@ DESCRIPTION = "Python bindings for DBus, a socket-based message bus system for i
 SECTION = "devel/python"
 HOMEPAGE = "http://www.freedesktop.org/Software/dbus"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=f5612614133e9a2f2dad527d97554670"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0b83047ce9e948b67c0facc5f233476a"
 DEPENDS = "expat dbus dbus-glib virtual/libintl python-pyrex-native"
-PR = "r2"
 
 SRC_URI = "http://dbus.freedesktop.org/releases/dbus-python/dbus-python-${PV}.tar.gz \
-           file://obsolete_automake_macros.patch \
 "
 
-SRC_URI[md5sum] = "742c7432ad0f7c3f98291d58fa2e35dc"
-SRC_URI[sha256sum] = "8917ca4fb8f4d693aee18d200cbad166b2c938dfb88c03bb4ab3d90a7c915e88"
+SRC_URI[md5sum] = "b09cd2d1a057cc432ce944de3fc06bf7"
+SRC_URI[sha256sum] = "e12c6c8b2bf3a9302f75166952cbe41d6b38c3441bbc6767dbd498942316c6df"
 S = "${WORKDIR}/dbus-python-${PV}"
 
 inherit distutils-base autotools pkgconfig
-- 
1.7.10.4


