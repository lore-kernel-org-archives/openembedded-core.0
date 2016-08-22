Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id CA93C736B6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 12:23:21 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 22 Aug 2016 05:23:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,559,1464678000"; d="scan'208";a="751984554"
Received: from theory.fi.intel.com ([10.237.72.196])
	by FMSMGA003.fm.intel.com with ESMTP; 22 Aug 2016 05:23:22 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Aug 2016 15:23:10 +0300
Message-Id: <3b443cc416aae70f021408095381f22f04dfbbb3.1471868237.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <7b711df547a725dd97f54a6c3524b7e505a2330d.1471868237.git.jussi.kukkonen@intel.com>
References: <7b711df547a725dd97f54a6c3524b7e505a2330d.1471868237.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1471868237.git.jussi.kukkonen@intel.com>
References: <cover.1471868237.git.jussi.kukkonen@intel.com>
Subject: [PATCH 4/9] gtk+3: Upgrade 3.20.6 -> 3.20.9
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
X-List-Received-Date: Mon, 22 Aug 2016 12:23:22 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-gnome/gtk+/{gtk+3_3.20.6.bb => gtk+3_3.20.9.bb}          | 4 ++--
 ...tk-icon-utils-native_3.20.6.bb => gtk-icon-utils-native_3.20.9.bb} | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-gnome/gtk+/{gtk+3_3.20.6.bb => gtk+3_3.20.9.bb} (84%)
 rename meta/recipes-gnome/gtk+/{gtk-icon-utils-native_3.20.6.bb => gtk-icon-utils-native_3.20.9.bb} (93%)

diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.20.6.bb b/meta/recipes-gnome/gtk+/gtk+3_3.20.9.bb
similarity index 84%
rename from meta/recipes-gnome/gtk+/gtk+3_3.20.6.bb
rename to meta/recipes-gnome/gtk+/gtk+3_3.20.9.bb
index 453a4e2..9a0bfc4 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.20.6.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.20.9.bb
@@ -8,8 +8,8 @@ SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar
            file://0003-Add-disable-opengl-configure-option.patch \
            file://0004-configure.ac-Fix-wayland-protocols-path.patch \
           "
-SRC_URI[md5sum] = "914e55ea053161f4a575c1c8dade7954"
-SRC_URI[sha256sum] = "3f8016563a96b1cfef4ac9e795647f6316deb2978ff939b19e4e4f8f936fa4b2"
+SRC_URI[md5sum] = "cc76cac5e18c772c6784bf19a3dff08b"
+SRC_URI[sha256sum] = "83a609ba2f3424b5509e73967c49c67833af466d6f91081b24ee5c64fce6ac17"
 
 S = "${WORKDIR}/gtk+-${PV}"
 
diff --git a/meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.20.6.bb b/meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.20.9.bb
similarity index 93%
rename from meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.20.6.bb
rename to meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.20.9.bb
index e870ba3..71c1d62 100644
--- a/meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.20.6.bb
+++ b/meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.20.9.bb
@@ -10,8 +10,8 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
 SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar.xz \
           file://Remove-Gdk-dependency-from-gtk-encode-symbolic-svg.patch"
-SRC_URI[md5sum] = "914e55ea053161f4a575c1c8dade7954"
-SRC_URI[sha256sum] = "3f8016563a96b1cfef4ac9e795647f6316deb2978ff939b19e4e4f8f936fa4b2"
+SRC_URI[md5sum] = "cc76cac5e18c772c6784bf19a3dff08b"
+SRC_URI[sha256sum] = "83a609ba2f3424b5509e73967c49c67833af466d6f91081b24ee5c64fce6ac17"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2 \
                     file://gtk/gtk.h;endline=25;md5=1d8dc0fccdbfa26287a271dce88af737 \
-- 
2.1.4


