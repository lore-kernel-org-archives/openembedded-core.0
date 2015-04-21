Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 8E6A46ABF7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Apr 2015 13:50:05 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 21 Apr 2015 06:49:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,616,1422950400"; d="scan'208";a="483689909"
Received: from heimdall.fi.intel.com ([10.237.72.110])
	by FMSMGA003.fm.intel.com with ESMTP; 21 Apr 2015 06:49:52 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Apr 2015 16:49:43 +0300
Message-Id: <8707327ed9f83af241aa6fc3a8afc640854c9ced.1429623703.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <08a1499aec1bd4c246bd5dbb91b683b83d61b394.1429623703.git.jussi.kukkonen@intel.com>
References: <08a1499aec1bd4c246bd5dbb91b683b83d61b394.1429623703.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1429623703.git.jussi.kukkonen@intel.com>
References: <cover.1429623703.git.jussi.kukkonen@intel.com>
Subject: [PATCH 3/4] librsvg: Upgrade 0.40.6 -> 0.40.9
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
X-List-Received-Date: Tue, 21 Apr 2015 13:50:06 -0000

* modify gtk-option patch so it's for configure.ac and not
  configure.in

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../recipes-gnome/librsvg/librsvg/gtk-option.patch | 30 +++++++++++-----------
 .../{librsvg_2.40.6.bb => librsvg_2.40.9.bb}       |  4 +--
 2 files changed, 17 insertions(+), 17 deletions(-)
 rename meta/recipes-gnome/librsvg/{librsvg_2.40.6.bb => librsvg_2.40.9.bb} (91%)

diff --git a/meta/recipes-gnome/librsvg/librsvg/gtk-option.patch b/meta/recipes-gnome/librsvg/librsvg/gtk-option.patch
index d44bdd3..584d87d 100644
--- a/meta/recipes-gnome/librsvg/librsvg/gtk-option.patch
+++ b/meta/recipes-gnome/librsvg/librsvg/gtk-option.patch
@@ -1,27 +1,27 @@
-Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=712693]
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 18917f7fd3160afe06019f4b6234aeb78a3fdb4e Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Tue, 19 Nov 2013 16:00:29 +0000
+From 85d4af4451283f388e1e101ee4710bb19854154d Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jku@goto.fi>
+Date: Fri, 10 Apr 2015 16:49:43 +0300
 Subject: [PATCH] configure: add option to enable/disable use of GTK+
 
 Distro packagers like predictability and automatically detected optional
 dependencies are not predicable.  Add a --with-gtk3 option (default to "auto")
 for forcibly controlling whether GTK+ will be used or not.
 
+https://bugzilla.gnome.org/show_bug.cgi?id=712693
+
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 
-https://bugzilla.gnome.org/show_bug.cgi?id=712693
+Forward-ported to 2.40.9
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
 ---
- configure.in |   17 +++++++++++------
+ configure.ac | 17 +++++++++++------
  1 file changed, 11 insertions(+), 6 deletions(-)
 
-diff --git a/configure.in b/configure.in
-index f7a89dc..1498f72 100644
---- a/configure.in
-+++ b/configure.in
-@@ -119,17 +119,22 @@ AC_CHECK_FUNCS(strtok_r)
+diff --git a/configure.ac b/configure.ac
+index e86c052..16b0e34 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -128,17 +128,22 @@ AC_CHECK_FUNCS(strtok_r)
  # GTK
  # ===========================================================================
  
@@ -49,7 +49,7 @@ index f7a89dc..1498f72 100644
  
  dnl ===========================================================================
  dnl GDK-Pixbuf SVG loader
-@@ -305,6 +310,6 @@ librsvg-$VERSION
+@@ -289,6 +294,6 @@ librsvg-$VERSION
  	Build introspectable bindings:  ${found_introspection}
  	Build Vala bindings:            ${enable_vala}
  	Build GdkPixbuf loader:         ${enable_pixbuf_loader}
@@ -58,5 +58,5 @@ index f7a89dc..1498f72 100644
  	Build miscellaenous tools:      ${build_misc_tools}
  "
 -- 
-1.7.10.4
+2.1.4
 
diff --git a/meta/recipes-gnome/librsvg/librsvg_2.40.6.bb b/meta/recipes-gnome/librsvg/librsvg_2.40.9.bb
similarity index 91%
rename from meta/recipes-gnome/librsvg/librsvg_2.40.6.bb
rename to meta/recipes-gnome/librsvg/librsvg_2.40.9.bb
index 483d309..9a14f29 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.40.6.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.40.9.bb
@@ -16,8 +16,8 @@ GNOME_COMPRESS_TYPE = "xz"
 
 SRC_URI += "file://gtk-option.patch"
 
-SRC_URI[archive.md5sum] = "259fd160b47ec11f3c27d7e18e507c99"
-SRC_URI[archive.sha256sum] = "8af349f241677b04b7a1ea6b9b33a6343e781bcccc8a09d00208a47342584f06"
+SRC_URI[archive.md5sum] = "31df15e3beaa8fbbf538ca3c52b400d2"
+SRC_URI[archive.sha256sum] = "13964c5d35357552b47d365c34215eee0a63bf0e6059b689f048648c6bf5f43a"
 
 EXTRA_OECONF = "--disable-introspection --disable-vala"
 
-- 
2.1.4


