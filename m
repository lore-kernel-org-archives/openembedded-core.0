Return-Path: <jussi.kukkonen@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 893D47726D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 13:35:52 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 19 Dec 2016 05:35:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,373,1477983600"; d="scan'208";a="1073989362"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 19 Dec 2016 05:35:53 -0800
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 4B1BE6A4082;
	Mon, 19 Dec 2016 05:35:04 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Dec 2016 15:35:39 +0200
Message-Id: <7ac9aab551a501fab0e4190a059250c6bddfa5a6.1482154012.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1482154012.git.jussi.kukkonen@intel.com>
References: <cover.1482154012.git.jussi.kukkonen@intel.com>
Subject: [PATCH 1/8] gtk+3: Upgrade 3.22.1 -> 3.22.5
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
X-List-Received-Date: Mon, 19 Dec 2016 13:35:52 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-gnome/gtk+/{gtk+3_3.22.1.bb => gtk+3_3.22.5.bb}          | 4 ++--
 ...tk-icon-utils-native_3.22.1.bb => gtk-icon-utils-native_3.22.5.bb} | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-gnome/gtk+/{gtk+3_3.22.1.bb => gtk+3_3.22.5.bb} (84%)
 rename meta/recipes-gnome/gtk+/{gtk-icon-utils-native_3.22.1.bb => gtk-icon-utils-native_3.22.5.bb} (93%)

diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.22.1.bb b/meta/recipes-gnome/gtk+/gtk+3_3.22.5.bb
similarity index 84%
rename from meta/recipes-gnome/gtk+/gtk+3_3.22.1.bb
rename to meta/recipes-gnome/gtk+/gtk+3_3.22.5.bb
index 5fb0edd..b772fe0 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.22.1.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.22.5.bb
@@ -8,8 +8,8 @@ SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar
            file://0003-Add-disable-opengl-configure-option.patch \
            file://0004-configure.ac-Fix-wayland-protocols-path.patch \
           "
-SRC_URI[md5sum] = "ebfa5e52167f2b8a4ec6024d51d86f1f"
-SRC_URI[sha256sum] = "127c8c5cfc32681f9ab3cb542eb0d5c16c1c02faba68bf8fcac9a3cf278ef471"
+SRC_URI[md5sum] = "55e0198f100db98f31d1b0f9dc403794"
+SRC_URI[sha256sum] = "693fa0ac643c59ccd51db99cabe476b4e0a41fd4f0c3c8b3e3ef38f94b2e7334"
 
 S = "${WORKDIR}/gtk+-${PV}"
 
diff --git a/meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.22.1.bb b/meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.22.5.bb
similarity index 93%
rename from meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.22.1.bb
rename to meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.22.5.bb
index e6ffc55..878b484 100644
--- a/meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.22.1.bb
+++ b/meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.22.5.bb
@@ -10,8 +10,8 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
 SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar.xz \
           file://Remove-Gdk-dependency-from-gtk-encode-symbolic-svg.patch"
-SRC_URI[md5sum] = "ebfa5e52167f2b8a4ec6024d51d86f1f"
-SRC_URI[sha256sum] = "127c8c5cfc32681f9ab3cb542eb0d5c16c1c02faba68bf8fcac9a3cf278ef471"
+SRC_URI[md5sum] = "55e0198f100db98f31d1b0f9dc403794"
+SRC_URI[sha256sum] = "693fa0ac643c59ccd51db99cabe476b4e0a41fd4f0c3c8b3e3ef38f94b2e7334"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2 \
                     file://gtk/gtk.h;endline=25;md5=1d8dc0fccdbfa26287a271dce88af737 \
-- 
2.1.4


