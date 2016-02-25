Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 7DA986E268
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 16:03:03 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 25 Feb 2016 08:02:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,498,1449561600"; d="scan'208";a="659220004"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 25 Feb 2016 08:02:23 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Feb 2016 17:59:19 +0200
Message-Id: <d1b71c5e23a62b880456fc4ac3d9d21e083a0f4f.1456415870.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1456415870.git.alexander.kanavin@linux.intel.com>
References: <cover.1456415870.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1456415870.git.alexander.kanavin@linux.intel.com>
References: <cover.1456415870.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 02/19] libfm: update to 1.2.4
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
X-List-Received-Date: Thu, 25 Feb 2016 16:03:03 -0000

LICENSE checksum change due to formatting changes, and 'how to apply those
terms' section dropped from the GPL text.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../libfm/{libfm-extra_1.2.3.bb => libfm-extra_1.2.4.bb}          | 6 ++----
 meta/recipes-support/libfm/{libfm_1.2.3.bb => libfm_1.2.4.bb}     | 8 +++-----
 2 files changed, 5 insertions(+), 9 deletions(-)
 rename meta/recipes-support/libfm/{libfm-extra_1.2.3.bb => libfm-extra_1.2.4.bb} (79%)
 rename meta/recipes-support/libfm/{libfm_1.2.3.bb => libfm_1.2.4.bb} (84%)

diff --git a/meta/recipes-support/libfm/libfm-extra_1.2.3.bb b/meta/recipes-support/libfm/libfm-extra_1.2.4.bb
similarity index 79%
rename from meta/recipes-support/libfm/libfm-extra_1.2.3.bb
rename to meta/recipes-support/libfm/libfm-extra_1.2.4.bb
index 3675269..f204968 100644
--- a/meta/recipes-support/libfm/libfm-extra_1.2.3.bb
+++ b/meta/recipes-support/libfm/libfm-extra_1.2.4.bb
@@ -11,15 +11,13 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/pcmanfm/libfm-${PV}.tar.xz \
            file://0001-nls.m4-Take-it-from-gettext-0.15.patch \
           "
 
-SRC_URI[md5sum] = "3ff38200701658f7e80e25ed395d92dd"
-SRC_URI[sha256sum] = "c692f1624a4cbc8d1dd55f3b3f3369fbf5d26f63a916e2c295230b2344e1fbf9"
+SRC_URI[md5sum] = "74997d75e7e87dc73398746fd373bf52"
+SRC_URI[sha256sum] = "7804f6f28cb3d1bc8ffb3151ab7ff0c063b27c5f9b06c682eb903e01cf25502f"
 
 S = "${WORKDIR}/libfm-${PV}"
 
 EXTRA_OECONF = "--with-extra-only --with-gtk=no"
 
-PR = "r1"
-
 inherit autotools pkgconfig gtk-doc
 
 do_configure[dirs] =+ "${S}/m4"
diff --git a/meta/recipes-support/libfm/libfm_1.2.3.bb b/meta/recipes-support/libfm/libfm_1.2.4.bb
similarity index 84%
rename from meta/recipes-support/libfm/libfm_1.2.3.bb
rename to meta/recipes-support/libfm/libfm_1.2.4.bb
index cf2f0f9..866b11a 100644
--- a/meta/recipes-support/libfm/libfm_1.2.3.bb
+++ b/meta/recipes-support/libfm/libfm_1.2.4.bb
@@ -2,7 +2,7 @@ SUMMARY = "Library for file management"
 HOMEPAGE = "http://pcmanfm.sourceforge.net/"
 
 LICENSE = "GPLv2+ & LGPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
+LIC_FILES_CHKSUM = "file://COPYING;md5=4641e94ec96f98fabc56ff9cc48be14b \
                     file://src/fm.h;beginline=8;endline=21;md5=ef1f84da64b3c01cca447212f7ef6007 \
                     file://src/base/fm-config.h;beginline=10;endline=23;md5=ef1f84da64b3c01cca447212f7ef6007 \
                     file://src/fm-gtk.h;beginline=6;endline=19;md5=646baa4955c04fe768f2ca27b92ac8dd"
@@ -13,10 +13,8 @@ DEPENDS = "glib-2.0 pango gtk+ menu-cache intltool-native libexif libfm-extra ge
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/pcmanfm/libfm-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "3ff38200701658f7e80e25ed395d92dd"
-SRC_URI[sha256sum] = "c692f1624a4cbc8d1dd55f3b3f3369fbf5d26f63a916e2c295230b2344e1fbf9"
-
-PR = "r1"
+SRC_URI[md5sum] = "74997d75e7e87dc73398746fd373bf52"
+SRC_URI[sha256sum] = "7804f6f28cb3d1bc8ffb3151ab7ff0c063b27c5f9b06c682eb903e01cf25502f"
 
 inherit autotools pkgconfig gtk-doc distro_features_check
 ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
-- 
2.7.0


