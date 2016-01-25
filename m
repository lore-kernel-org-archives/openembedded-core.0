Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 800FC770EE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 16:11:45 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 25 Jan 2016 08:10:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,345,1449561600"; d="scan'208";a="641143929"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 25 Jan 2016 08:10:55 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Jan 2016 18:07:18 +0200
Message-Id: <0ec4c2d880d17ee3af12dea85f21d041db7017b4.1453737141.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0.rc3
In-Reply-To: <cover.1453737141.git.alexander.kanavin@linux.intel.com>
References: <cover.1453737141.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1453737141.git.alexander.kanavin@linux.intel.com>
References: <cover.1453737141.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 08/16] glib-2.0: update to 2.46.2
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
X-List-Received-Date: Mon, 25 Jan 2016 16:11:46 -0000

Drop backported 0001-gio-tests-Don-t-depend-on-a-data-file-that-s-not-bui.patch

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...on-t-depend-on-a-data-file-that-s-not-bui.patch | 38 ----------------------
 .../{glib-2.0_2.46.1.bb => glib-2.0_2.46.2.bb}     |  5 ++-
 2 files changed, 2 insertions(+), 41 deletions(-)
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-Don-t-depend-on-a-data-file-that-s-not-bui.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.46.1.bb => glib-2.0_2.46.2.bb} (79%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-Don-t-depend-on-a-data-file-that-s-not-bui.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-Don-t-depend-on-a-data-file-that-s-not-bui.patch
deleted file mode 100644
index 5f3fef0..0000000
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-Don-t-depend-on-a-data-file-that-s-not-bui.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 99dabcb02e2b3f90a12d17a9995752fcae57b522 Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Thu, 5 Nov 2015 11:08:32 +0200
-Subject: [PATCH] gio/tests: Don't depend on a data file that's not built
-
-data.gresource is not built when cross-compiling: Don't
-add it to test_data in that case.
-
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Upstream-Status: Backport [https://bugzilla.gnome.org/show_bug.cgi?id=757628]
----
- gio/tests/Makefile.am | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/gio/tests/Makefile.am b/gio/tests/Makefile.am
-index 894cf43..cc7deb3 100644
---- a/gio/tests/Makefile.am
-+++ b/gio/tests/Makefile.am
-@@ -76,7 +76,6 @@ dist_test_data = \
- 	$(NULL)
- 
- test_data = \
--	test.gresource				\
- 	$(NULL)
- 
- uninstalled_test_extra_programs = \
-@@ -520,6 +519,8 @@ libresourceplugin_la_SOURCES = resourceplugin.c plugin_resources.c
- libresourceplugin_la_LDFLAGS = -avoid-version -module -export-dynamic $(no_undefined)
- libresourceplugin_la_LIBADD = $(LDADD)
- 
-+test_data += test.gresource
-+
- # libtool contains a bug whereby the created .la file doesn't contain the correct dlname='' in the case that
- # you're building a library but not installing it.  This is apparently because the only considered use for an
- # uninstalled library is as a convenience library for linking (despite the fact that we give -module).  The lack
--- 
-2.6.2
-
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.46.1.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.46.2.bb
similarity index 79%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.46.1.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.46.2.bb
index 937ae65..79643c7 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.46.1.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.46.2.bb
@@ -15,11 +15,10 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://0001-configure.ac-Do-not-use-readlink-when-cross-compilin.patch \
            file://allow-run-media-sdX-drive-mount-if-username-root.patch \
 	   file://0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch \
-	   file://0001-gio-tests-Don-t-depend-on-a-data-file-that-s-not-bui.patch \
            file://Enable-more-tests-while-cross-compiling.patch \
           "
 
 SRC_URI_append_class-native = " file://glib-gettextize-dir.patch"
 
-SRC_URI[md5sum] = "c90e93ceb45100ffc1d40ec5d2ca3248"
-SRC_URI[sha256sum] = "5a1f03b952ebc3a7e9f612b8724f70898183e31503db329b4f15d07163c8fdfb"
+SRC_URI[md5sum] = "7f815d6e46df68e070cb421ed7f1139e"
+SRC_URI[sha256sum] = "5031722e37036719c1a09163cc6cf7c326e4c4f1f1e074b433c156862bd733db"
-- 
2.7.0.rc3


