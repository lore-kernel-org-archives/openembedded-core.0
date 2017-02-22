Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 1CEE2730DB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 13:02:40 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Feb 2017 05:02:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,194,1484035200"; d="scan'208";a="51260276"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 22 Feb 2017 05:02:41 -0800
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id B19C36A4080;
	Wed, 22 Feb 2017 05:02:40 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Feb 2017 15:02:32 +0200
Message-Id: <2d1b4e6362de5db951c70390511d873a123bbaf0.1487764904.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1487764904.git.jussi.kukkonen@intel.com>
References: <cover.1487764904.git.jussi.kukkonen@intel.com>
Subject: [PATCH 2/6] gtk+3: Upgrade 3.22.7 -> 3.22.8
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
X-List-Received-Date: Wed, 22 Feb 2017 13:02:41 -0000

Bug fix release.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-gnome/gtk+/{gtk+3_3.22.7.bb => gtk+3_3.22.8.bb}          | 4 ++--
 ...tk-icon-utils-native_3.22.7.bb => gtk-icon-utils-native_3.22.8.bb} | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-gnome/gtk+/{gtk+3_3.22.7.bb => gtk+3_3.22.8.bb} (84%)
 rename meta/recipes-gnome/gtk+/{gtk-icon-utils-native_3.22.7.bb => gtk-icon-utils-native_3.22.8.bb} (93%)

diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.22.7.bb b/meta/recipes-gnome/gtk+/gtk+3_3.22.8.bb
similarity index 84%
rename from meta/recipes-gnome/gtk+/gtk+3_3.22.7.bb
rename to meta/recipes-gnome/gtk+/gtk+3_3.22.8.bb
index 6b74525..1cc57f9 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.22.7.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.22.8.bb
@@ -8,8 +8,8 @@ SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar
            file://0003-Add-disable-opengl-configure-option.patch \
            file://0004-configure.ac-Fix-wayland-protocols-path.patch \
           "
-SRC_URI[md5sum] = "e05a7e8e9b89a71fd016883b5431e429"
-SRC_URI[sha256sum] = "a3a27564bfb1679ebbc75c37cd2bcd6e727c8bdfbcd3984d29305bf9ee60d432"
+SRC_URI[md5sum] = "b4fb39a829e4425b3fa05adbe7f52fef"
+SRC_URI[sha256sum] = "c7254a88df5c17e9609cee9e848c3d0104512707edad4c3b4f256b131f8d3af1"
 
 S = "${WORKDIR}/gtk+-${PV}"
 
diff --git a/meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.22.7.bb b/meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.22.8.bb
similarity index 93%
rename from meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.22.7.bb
rename to meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.22.8.bb
index 77bb6e7..7283418 100644
--- a/meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.22.7.bb
+++ b/meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.22.8.bb
@@ -10,8 +10,8 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
 SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar.xz \
           file://Remove-Gdk-dependency-from-gtk-encode-symbolic-svg.patch"
-SRC_URI[md5sum] = "e05a7e8e9b89a71fd016883b5431e429"
-SRC_URI[sha256sum] = "a3a27564bfb1679ebbc75c37cd2bcd6e727c8bdfbcd3984d29305bf9ee60d432"
+SRC_URI[md5sum] = "b4fb39a829e4425b3fa05adbe7f52fef"
+SRC_URI[sha256sum] = "c7254a88df5c17e9609cee9e848c3d0104512707edad4c3b4f256b131f8d3af1"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2 \
                     file://gtk/gtk.h;endline=25;md5=1d8dc0fccdbfa26287a271dce88af737 \
-- 
2.1.4


