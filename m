Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 165C075794
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Aug 2015 08:40:36 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 06 Aug 2015 01:40:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,622,1432623600"; d="scan'208";a="536995290"
Received: from theory.fi.intel.com ([10.237.72.51])
	by FMSMGA003.fm.intel.com with ESMTP; 06 Aug 2015 01:40:36 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Aug 2015 11:41:57 +0300
Message-Id: <2c93029d78af982ced18f114b4ed6e09ef350b00.1438849692.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1438849692.git.jussi.kukkonen@intel.com>
References: <cover.1438849692.git.jussi.kukkonen@intel.com>
Subject: [PATCH 1/6] gtk+3: Upgrade 3.16.4 -> 3.16.6
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
X-List-Received-Date: Thu, 06 Aug 2015 08:40:37 -0000

Remove a backported patch.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-gnome/gtk+/gtk+3/wayland-pango.patch  | 28 ----------------------
 .../gtk+/{gtk+3_3.16.4.bb => gtk+3_3.16.6.bb}      |  5 ++--
 2 files changed, 2 insertions(+), 31 deletions(-)
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+3/wayland-pango.patch
 rename meta/recipes-gnome/gtk+/{gtk+3_3.16.4.bb => gtk+3_3.16.6.bb} (77%)

diff --git a/meta/recipes-gnome/gtk+/gtk+3/wayland-pango.patch b/meta/recipes-gnome/gtk+/gtk+3/wayland-pango.patch
deleted file mode 100644
index 1d6f12b..0000000
--- a/meta/recipes-gnome/gtk+/gtk+3/wayland-pango.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 802b006b3768ddc8c8cdf0af27428e7042c36509 Mon Sep 17 00:00:00 2001
-From: nick <oavc-fujie@yandex.com>
-Date: Mon, 29 Jun 2015 20:37:26 +0100
-Subject: settings: Include pangofc-fontmap.h header on Wayland
-
-In case the X11 backend is not enabled, we still need to include the
-pangofc-fontmap.h header file, as we use the Pango/FontConfig API in
-both the X11 and Wayland case.
-
-https://bugzilla.gnome.org/show_bug.cgi?id=751625
-
-diff --git a/gtk/gtksettings.c b/gtk/gtksettings.c
-index 327faf5..a40cb84 100644
---- a/gtk/gtksettings.c
-+++ b/gtk/gtksettings.c
-@@ -41,6 +41,7 @@
- 
- #ifdef GDK_WINDOWING_WAYLAND
- #include "wayland/gdkwayland.h"
-+#include <pango/pangofc-fontmap.h>
- #endif
- 
- #ifdef GDK_WINDOWING_BROADWAY
--- 
-cgit v0.10.2
diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.16.4.bb b/meta/recipes-gnome/gtk+/gtk+3_3.16.6.bb
similarity index 77%
rename from meta/recipes-gnome/gtk+/gtk+3_3.16.4.bb
rename to meta/recipes-gnome/gtk+/gtk+3_3.16.6.bb
index 4bb6b0c..1d736a4 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.16.4.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.16.6.bb
@@ -5,11 +5,10 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar.xz \
            file://hardcoded_libtool.patch \
            file://Dont-force-csd.patch \
-           file://wayland-pango.patch \
           "
 
-SRC_URI[md5sum] = "c7497aaf6730524a127597b768a73bd7"
-SRC_URI[sha256sum] = "1ee5dbd7a4cb81a91eaa1b7ae64ba5a3eab6a3c0a764155583ab96524590fc8e"
+SRC_URI[md5sum] = "fc59e5c8b5a4585b60623dd708df400b"
+SRC_URI[sha256sum] = "4d12726d0856a968b41802ae5c5971d7e9bac532717e309d3f81b9989da5ffbe"
 
 S = "${WORKDIR}/gtk+-${PV}"
 
-- 
2.1.4


