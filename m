Return-Path: <jussi.kukkonen@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id ED83E76970
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 19:12:31 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 11 Aug 2015 12:12:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,655,1432623600"; d="scan'208";a="782158024"
Received: from theory.fi.intel.com ([10.237.72.51])
	by orsmga002.jf.intel.com with ESMTP; 11 Aug 2015 12:12:31 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Aug 2015 22:13:59 +0300
Message-Id: <0bd78f81f4a6d28f092716be13b49131f0cdb4e6.1439318387.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <65f10f6264c7a8d751c5d0a56a38c920e02236b2.1439318387.git.jussi.kukkonen@intel.com>
References: <65f10f6264c7a8d751c5d0a56a38c920e02236b2.1439318387.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1439318387.git.jussi.kukkonen@intel.com>
References: <cover.1439318387.git.jussi.kukkonen@intel.com>
Subject: [PATCH 4/4] librsvg: Upgrade 2.40.9 -> 2.40.10
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
X-List-Received-Date: Tue, 11 Aug 2015 19:12:32 -0000

Rebase gtk-option.patch

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-gnome/librsvg/librsvg/gtk-option.patch         | 13 ++++++-------
 .../librsvg/{librsvg_2.40.9.bb => librsvg_2.40.10.bb}       |  4 ++--
 2 files changed, 8 insertions(+), 9 deletions(-)
 rename meta/recipes-gnome/librsvg/{librsvg_2.40.9.bb => librsvg_2.40.10.bb} (91%)

diff --git a/meta/recipes-gnome/librsvg/librsvg/gtk-option.patch b/meta/recipes-gnome/librsvg/librsvg/gtk-option.patch
index 3835015..e6af481 100644
--- a/meta/recipes-gnome/librsvg/librsvg/gtk-option.patch
+++ b/meta/recipes-gnome/librsvg/librsvg/gtk-option.patch
@@ -1,6 +1,6 @@
-From 85d4af4451283f388e1e101ee4710bb19854154d Mon Sep 17 00:00:00 2001
+From 1c38d570b33f2b036d4fa47e929bb2b3264e38bd Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Fri, 10 Apr 2015 16:49:43 +0300
+Date: Tue, 11 Aug 2015 16:25:38 +0300
 Subject: [PATCH] configure: add option to enable/disable use of GTK+
 
 Distro packagers like predictability and automatically detected optional
@@ -11,8 +11,7 @@ Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=712693]
 
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 
-
-Forward-ported to 2.40.9
+Forward-ported to 2.40.10
 
 Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
 ---
@@ -20,7 +19,7 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
  1 file changed, 11 insertions(+), 6 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index e86c052..16b0e34 100644
+index bf77f3a..ca77de8 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -128,17 +128,22 @@ AC_CHECK_FUNCS(strtok_r)
@@ -55,8 +54,8 @@ index e86c052..16b0e34 100644
  	Build introspectable bindings:  ${found_introspection}
  	Build Vala bindings:            ${enable_vala}
  	Build GdkPixbuf loader:         ${enable_pixbuf_loader}
--        GTK 3.0:                        ${have_gtk_3}
-+        GTK 3.0:                        ${with_gtk3}
+-        GTK+ $GTK3_REQUIRED or later:           ${have_gtk_3}
++        GTK+ $GTK3_REQUIRED or later:           ${with_gtk_3}
  	Build miscellaenous tools:      ${build_misc_tools}
  "
 -- 
diff --git a/meta/recipes-gnome/librsvg/librsvg_2.40.9.bb b/meta/recipes-gnome/librsvg/librsvg_2.40.10.bb
similarity index 91%
rename from meta/recipes-gnome/librsvg/librsvg_2.40.9.bb
rename to meta/recipes-gnome/librsvg/librsvg_2.40.10.bb
index 9a14f29..0ac323e 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.40.9.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.40.10.bb
@@ -16,8 +16,8 @@ GNOME_COMPRESS_TYPE = "xz"
 
 SRC_URI += "file://gtk-option.patch"
 
-SRC_URI[archive.md5sum] = "31df15e3beaa8fbbf538ca3c52b400d2"
-SRC_URI[archive.sha256sum] = "13964c5d35357552b47d365c34215eee0a63bf0e6059b689f048648c6bf5f43a"
+SRC_URI[archive.md5sum] = "fadebe2e799ab159169ee3198415ff85"
+SRC_URI[archive.sha256sum] = "965c807438ce90b204e930ff80c92eba1606a2f6fd5ccfd09335c99896dd3479"
 
 EXTRA_OECONF = "--disable-introspection --disable-vala"
 
-- 
2.1.4


