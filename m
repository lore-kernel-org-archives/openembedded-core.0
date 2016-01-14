Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 7F00A731DE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 13:23:33 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 14 Jan 2016 05:23:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,294,1449561600"; d="scan'208";a="893103228"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga002.fm.intel.com with ESMTP; 14 Jan 2016 05:23:33 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jan 2016 15:27:54 +0200
Message-Id: <a211ee30ad7ce37062665b351313c4c36dd92a73.1452777133.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <b5b7c6947b4c54966087ad6c21b9fab79da1fa1e.1452777133.git.jussi.kukkonen@intel.com>
References: <b5b7c6947b4c54966087ad6c21b9fab79da1fa1e.1452777133.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1452777133.git.jussi.kukkonen@intel.com>
References: <cover.1452777133.git.jussi.kukkonen@intel.com>
Subject: [PATCH 6/9] librsvg: upgrade to 2.40.13
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
X-List-Received-Date: Thu, 14 Jan 2016 13:23:33 -0000

Updated gtk-option.patch.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-gnome/librsvg/librsvg/gtk-option.patch         | 13 +++++--------
 .../librsvg/{librsvg_2.40.11.bb => librsvg_2.40.13.bb}      |  4 ++--
 2 files changed, 7 insertions(+), 10 deletions(-)
 rename meta/recipes-gnome/librsvg/{librsvg_2.40.11.bb => librsvg_2.40.13.bb} (91%)

diff --git a/meta/recipes-gnome/librsvg/librsvg/gtk-option.patch b/meta/recipes-gnome/librsvg/librsvg/gtk-option.patch
index e6af481..6c23071 100644
--- a/meta/recipes-gnome/librsvg/librsvg/gtk-option.patch
+++ b/meta/recipes-gnome/librsvg/librsvg/gtk-option.patch
@@ -1,4 +1,4 @@
-From 1c38d570b33f2b036d4fa47e929bb2b3264e38bd Mon Sep 17 00:00:00 2001
+From 4e0ce3f22d45033a108cbacca3e5ec6728bd44f3 Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Tue, 11 Aug 2015 16:25:38 +0300
 Subject: [PATCH] configure: add option to enable/disable use of GTK+
@@ -10,19 +10,16 @@ for forcibly controlling whether GTK+ will be used or not.
 Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=712693]
 
 Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-Forward-ported to 2.40.10
-
 Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
 ---
  configure.ac | 17 +++++++++++------
  1 file changed, 11 insertions(+), 6 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index bf77f3a..ca77de8 100644
+index e61a952..c3aae84 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -128,17 +128,22 @@ AC_CHECK_FUNCS(strtok_r)
+@@ -130,17 +130,22 @@ AC_CHECK_FUNCS(strtok_r)
  # GTK
  # ===========================================================================
  
@@ -50,13 +47,13 @@ index bf77f3a..ca77de8 100644
  
  dnl ===========================================================================
  dnl GDK-Pixbuf SVG loader
-@@ -289,6 +294,6 @@ librsvg-$VERSION
+@@ -298,6 +303,6 @@ librsvg-$VERSION
  	Build introspectable bindings:  ${found_introspection}
  	Build Vala bindings:            ${enable_vala}
  	Build GdkPixbuf loader:         ${enable_pixbuf_loader}
 -        GTK+ $GTK3_REQUIRED or later:           ${have_gtk_3}
 +        GTK+ $GTK3_REQUIRED or later:           ${with_gtk_3}
- 	Build miscellaenous tools:      ${build_misc_tools}
+ 	Build miscellaneous tools:      ${build_misc_tools}
  "
 -- 
 2.1.4
diff --git a/meta/recipes-gnome/librsvg/librsvg_2.40.11.bb b/meta/recipes-gnome/librsvg/librsvg_2.40.13.bb
similarity index 91%
rename from meta/recipes-gnome/librsvg/librsvg_2.40.11.bb
rename to meta/recipes-gnome/librsvg/librsvg_2.40.13.bb
index d57c69d..ed71243 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.40.11.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.40.13.bb
@@ -14,8 +14,8 @@ inherit autotools pkgconfig gnomebase gtk-doc pixbufcache upstream-version-is-ev
 
 SRC_URI += "file://gtk-option.patch"
 
-SRC_URI[archive.md5sum] = "6b9cd1a048210a8e95bdc04c85fe997f"
-SRC_URI[archive.sha256sum] = "611ac0f544debd0c9bf1ef5509c990d218e83dd1d8c83297075c4b29796a2e02"
+SRC_URI[archive.md5sum] = "ad03780e12c56e52474d8edf86976c73"
+SRC_URI[archive.sha256sum] = "4d6ea93ec05f5dabe7262d711d246a0a99b2311e215360dd3dcabd6afe3b9804"
 
 CACHED_CONFIGUREVARS = "ac_cv_path_GDK_PIXBUF_QUERYLOADERS=${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders"
 
-- 
2.1.4


