Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B63CF78202
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Oct 2017 15:39:04 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Oct 2017 08:38:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,361,1503385200"; d="scan'208";a="1180945835"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 11 Oct 2017 08:38:55 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Oct 2017 18:34:25 +0300
Message-Id: <11653ba417638cabca8a3faedb49a57a683ad2ed.1507735448.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1507735448.git.alexander.kanavin@linux.intel.com>
References: <cover.1507735448.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 33/50] adwaita-icon-theme: update to 3.26.0
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
X-List-Received-Date: Wed, 11 Oct 2017 15:39:05 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch | 11 ++++++-----
 ...aita-icon-theme_3.24.0.bb => adwaita-icon-theme_3.26.0.bb} |  4 ++--
 2 files changed, 8 insertions(+), 7 deletions(-)
 rename meta/recipes-gnome/gnome/{adwaita-icon-theme_3.24.0.bb => adwaita-icon-theme_3.26.0.bb} (93%)

diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch b/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch
index e7ac97b732c..c0f2758da03 100644
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch
+++ b/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch
@@ -1,29 +1,30 @@
-From d2b9ad8a80bf9320fe35c9aee8f52e55ebd40e06 Mon Sep 17 00:00:00 2001
+From 88ed996cc9e2b296cacfdbeece4be28a90bab511 Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Tue, 30 May 2017 14:55:49 +0300
-Subject: [PATCH] Don't use AC_CANONICAL_HOST
+Subject: [PATCH 1/2] Don't use AC_CANONICAL_HOST
 
 This won't work when building allarch (and is only used to find out if
 target is windows).
 
 Upstream-Status: Inappropriate [embedded specific]
 Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+
 ---
  configure.ac | 1 -
  1 file changed, 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index d855b7a..6908f59 100644
+index b20eb1a..50c5fd6 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -3,7 +3,6 @@ AC_PREREQ(2.53)
  
- AC_INIT([adwaita-icon-theme], [3.24.0],
+ AC_INIT([adwaita-icon-theme], [3.26.0],
          [http://bugzilla.gnome.org/enter_bug.cgi?product=adwaita-icon-theme])
 -AC_CANONICAL_HOST
  AC_CONFIG_MACRO_DIR([m4])
  AC_CONFIG_SRCDIR([index.theme.in])
  
 -- 
-2.1.4
+2.14.1
 
diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme_3.24.0.bb b/meta/recipes-gnome/gnome/adwaita-icon-theme_3.26.0.bb
similarity index 93%
rename from meta/recipes-gnome/gnome/adwaita-icon-theme_3.24.0.bb
rename to meta/recipes-gnome/gnome/adwaita-icon-theme_3.26.0.bb
index d340536f0f3..bfb56d57e44 100644
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme_3.24.0.bb
+++ b/meta/recipes-gnome/gnome/adwaita-icon-theme_3.26.0.bb
@@ -15,8 +15,8 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://0001-Run-installation-commands-as-shell-jobs.patch \
            "
 
-SRC_URI[md5sum] = "3ccac0d600ffc936d2adfb80e9245bc5"
-SRC_URI[sha256sum] = "ccf79ff3bd340254737ce4d28b87f0ccee4b3358cd3cd5cd11dc7b42f41b272a"
+SRC_URI[md5sum] = "3218540331a26c3d7a904ffe3d00bed8"
+SRC_URI[sha256sum] = "9cad85de19313f5885497aceab0acbb3f08c60fcd5fa5610aeafff37a1d12212"
 
 do_install_append() {
 	# Build uses gtk-encode-symbolic-svg to create png versions:
-- 
2.14.1


