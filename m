Return-Path: <jussi.kukkonen@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id CC8E5772BB
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 10:42:26 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga101.jf.intel.com with ESMTP; 24 Jan 2017 02:42:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,278,1477983600"; d="scan'208";a="56847440"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 24 Jan 2017 02:42:26 -0800
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 4A67C6A4006;
	Tue, 24 Jan 2017 02:41:29 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: Openembedded-core@lists.openembedded.org
Date: Tue, 24 Jan 2017 12:42:15 +0200
Message-Id: <ab3ceed87dd90f7743d59d8b4f12fadbc4290012.1485249527.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1485249527.git.jussi.kukkonen@intel.com>
References: <cover.1485249527.git.jussi.kukkonen@intel.com>
Subject: [PATCH 2/9] gtk+3: Upgrade 3.22.5 -> 3.22.7
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
X-List-Received-Date: Tue, 24 Jan 2017 10:42:27 -0000

Point releases with mostly just bug fixes.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-gnome/gtk+/{gtk+3_3.22.5.bb => gtk+3_3.22.7.bb}          | 4 ++--
 ...tk-icon-utils-native_3.22.5.bb => gtk-icon-utils-native_3.22.7.bb} | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-gnome/gtk+/{gtk+3_3.22.5.bb => gtk+3_3.22.7.bb} (84%)
 rename meta/recipes-gnome/gtk+/{gtk-icon-utils-native_3.22.5.bb => gtk-icon-utils-native_3.22.7.bb} (93%)

diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.22.5.bb b/meta/recipes-gnome/gtk+/gtk+3_3.22.7.bb
similarity index 84%
rename from meta/recipes-gnome/gtk+/gtk+3_3.22.5.bb
rename to meta/recipes-gnome/gtk+/gtk+3_3.22.7.bb
index b772fe0..6b74525 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.22.5.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.22.7.bb
@@ -8,8 +8,8 @@ SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar
            file://0003-Add-disable-opengl-configure-option.patch \
            file://0004-configure.ac-Fix-wayland-protocols-path.patch \
           "
-SRC_URI[md5sum] = "55e0198f100db98f31d1b0f9dc403794"
-SRC_URI[sha256sum] = "693fa0ac643c59ccd51db99cabe476b4e0a41fd4f0c3c8b3e3ef38f94b2e7334"
+SRC_URI[md5sum] = "e05a7e8e9b89a71fd016883b5431e429"
+SRC_URI[sha256sum] = "a3a27564bfb1679ebbc75c37cd2bcd6e727c8bdfbcd3984d29305bf9ee60d432"
 
 S = "${WORKDIR}/gtk+-${PV}"
 
diff --git a/meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.22.5.bb b/meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.22.7.bb
similarity index 93%
rename from meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.22.5.bb
rename to meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.22.7.bb
index 878b484..77bb6e7 100644
--- a/meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.22.5.bb
+++ b/meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.22.7.bb
@@ -10,8 +10,8 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
 SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar.xz \
           file://Remove-Gdk-dependency-from-gtk-encode-symbolic-svg.patch"
-SRC_URI[md5sum] = "55e0198f100db98f31d1b0f9dc403794"
-SRC_URI[sha256sum] = "693fa0ac643c59ccd51db99cabe476b4e0a41fd4f0c3c8b3e3ef38f94b2e7334"
+SRC_URI[md5sum] = "e05a7e8e9b89a71fd016883b5431e429"
+SRC_URI[sha256sum] = "a3a27564bfb1679ebbc75c37cd2bcd6e727c8bdfbcd3984d29305bf9ee60d432"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2 \
                     file://gtk/gtk.h;endline=25;md5=1d8dc0fccdbfa26287a271dce88af737 \
-- 
2.1.4


