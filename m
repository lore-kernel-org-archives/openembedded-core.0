Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id ABD6778062
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 May 2017 11:23:33 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	31 May 2017 04:23:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,423,1491289200"; d="scan'208";a="975064610"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 31 May 2017 04:23:33 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id EDFA9580244;
	Wed, 31 May 2017 04:23:31 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 May 2017 14:23:18 +0300
Message-Id: <4b1b0689dd1c6d026aaa51527c7e3714f7e9fa99.1496229576.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1496229576.git.jussi.kukkonen@intel.com>
References: <cover.1496229576.git.jussi.kukkonen@intel.com>
Subject: [PATCH 09/10] gtk+3: Upgrade 3.22.8 -> 3.22.15
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
X-List-Received-Date: Wed, 31 May 2017 11:23:33 -0000

A fairly large amount of fixes in these point upgrades.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-gnome/gtk+/{gtk+3_3.22.8.bb => gtk+3_3.22.15.bb}         | 4 ++--
 ...k-icon-utils-native_3.22.8.bb => gtk-icon-utils-native_3.22.15.bb} | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-gnome/gtk+/{gtk+3_3.22.8.bb => gtk+3_3.22.15.bb} (84%)
 rename meta/recipes-gnome/gtk+/{gtk-icon-utils-native_3.22.8.bb => gtk-icon-utils-native_3.22.15.bb} (93%)

diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.22.8.bb b/meta/recipes-gnome/gtk+/gtk+3_3.22.15.bb
similarity index 84%
rename from meta/recipes-gnome/gtk+/gtk+3_3.22.8.bb
rename to meta/recipes-gnome/gtk+/gtk+3_3.22.15.bb
index 1cc57f9..35c617c 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.22.8.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.22.15.bb
@@ -8,8 +8,8 @@ SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar
            file://0003-Add-disable-opengl-configure-option.patch \
            file://0004-configure.ac-Fix-wayland-protocols-path.patch \
           "
-SRC_URI[md5sum] = "b4fb39a829e4425b3fa05adbe7f52fef"
-SRC_URI[sha256sum] = "c7254a88df5c17e9609cee9e848c3d0104512707edad4c3b4f256b131f8d3af1"
+SRC_URI[md5sum] = "9a1177854c4c5609293e017c53bc8950"
+SRC_URI[sha256sum] = "c8a012c2a99132629ab043f764a2b7cb6388483a015cd15c7a4288bec3590fdb"
 
 S = "${WORKDIR}/gtk+-${PV}"
 
diff --git a/meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.22.8.bb b/meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.22.15.bb
similarity index 93%
rename from meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.22.8.bb
rename to meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.22.15.bb
index 7283418..d8a0bd0 100644
--- a/meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.22.8.bb
+++ b/meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.22.15.bb
@@ -10,8 +10,8 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
 SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar.xz \
           file://Remove-Gdk-dependency-from-gtk-encode-symbolic-svg.patch"
-SRC_URI[md5sum] = "b4fb39a829e4425b3fa05adbe7f52fef"
-SRC_URI[sha256sum] = "c7254a88df5c17e9609cee9e848c3d0104512707edad4c3b4f256b131f8d3af1"
+SRC_URI[md5sum] = "9a1177854c4c5609293e017c53bc8950"
+SRC_URI[sha256sum] = "c8a012c2a99132629ab043f764a2b7cb6388483a015cd15c7a4288bec3590fdb"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2 \
                     file://gtk/gtk.h;endline=25;md5=1d8dc0fccdbfa26287a271dce88af737 \
-- 
2.1.4


