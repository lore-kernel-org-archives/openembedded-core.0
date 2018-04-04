Return-Path: <maxin.john@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C31F074B5A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 15:33:38 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Apr 2018 08:33:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,406,1517904000"; d="scan'208";a="44853740"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 04 Apr 2018 08:33:39 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 052FC5801FC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 08:33:38 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Apr 2018 18:32:17 +0300
Message-Id: <1522855946-8702-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 01/10] adwaita-icon-theme: upgrade to version 3.28.0
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
X-List-Received-Date: Wed, 04 Apr 2018 15:33:38 -0000

Refresh the following patch:
        0001-Don-t-use-AC_CANONICAL_HOST.patch

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../0001-Don-t-use-AC_CANONICAL_HOST.patch                 | 14 +++++++-------
 ...a-icon-theme_3.26.1.bb => adwaita-icon-theme_3.28.0.bb} |  4 ++--
 2 files changed, 9 insertions(+), 9 deletions(-)
 rename meta/recipes-gnome/gnome/{adwaita-icon-theme_3.26.1.bb => adwaita-icon-theme_3.28.0.bb} (93%)

diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch b/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch
index 96ec96b..b5992eb 100644
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch
+++ b/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch
@@ -1,7 +1,7 @@
-From 88ed996cc9e2b296cacfdbeece4be28a90bab511 Mon Sep 17 00:00:00 2001
+From 9661951838773251d0a914e897e8a0d95ce027f6 Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Tue, 30 May 2017 14:55:49 +0300
-Subject: [PATCH 1/2] Don't use AC_CANONICAL_HOST
+Subject: [PATCH] Don't use AC_CANONICAL_HOST
 
 This won't work when building allarch (and is only used to find out if
 target is windows).
@@ -13,13 +13,13 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
  configure.ac | 1 -
  1 file changed, 1 deletion(-)
 
-Index: adwaita-icon-theme-3.26.1/configure.ac
-===================================================================
---- adwaita-icon-theme-3.26.1.orig/configure.ac
-+++ adwaita-icon-theme-3.26.1/configure.ac
+diff --git a/configure.ac b/configure.ac
+index fb787dc..5caef0c 100644
+--- a/configure.ac
++++ b/configure.ac
 @@ -3,7 +3,6 @@ AC_PREREQ(2.53)
  
- AC_INIT([adwaita-icon-theme], [3.26.1],
+ AC_INIT([adwaita-icon-theme], [3.28.0],
          [http://bugzilla.gnome.org/enter_bug.cgi?product=adwaita-icon-theme])
 -AC_CANONICAL_HOST
  AC_CONFIG_MACRO_DIR([m4])
diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme_3.26.1.bb b/meta/recipes-gnome/gnome/adwaita-icon-theme_3.28.0.bb
similarity index 93%
rename from meta/recipes-gnome/gnome/adwaita-icon-theme_3.26.1.bb
rename to meta/recipes-gnome/gnome/adwaita-icon-theme_3.28.0.bb
index 6437d5e..40dd35b 100644
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme_3.26.1.bb
+++ b/meta/recipes-gnome/gnome/adwaita-icon-theme_3.28.0.bb
@@ -15,8 +15,8 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://0001-Run-installation-commands-as-shell-jobs.patch \
            "
 
-SRC_URI[md5sum] = "3ef87e789711e5130792d4b5366c005d"
-SRC_URI[sha256sum] = "28ba7392c7761996efd780779167ea6c940eedfb1bf37cfe9bccb7021f54d79d"
+SRC_URI[md5sum] = "b25b2d82cbebf2cc9cd469457b604f2c"
+SRC_URI[sha256sum] = "7aae8c1dffd6772fd1a21a3d365a0ea28b7c3988bdbbeafbf8742cda68242150"
 
 do_install_append() {
 	# Build uses gtk-encode-symbolic-svg to create png versions:
-- 
2.4.0


