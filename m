Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 85D45784D2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 12:29:28 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Jun 2017 05:29:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,347,1493708400"; d="scan'208";a="1161279583"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 16 Jun 2017 05:29:09 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Jun 2017 15:28:44 +0300
Message-Id: <ee4472c02baf0402a080d3cb3dbc0f16b130a0fc.1497615866.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1497615866.git.alexander.kanavin@linux.intel.com>
References: <cover.1497615866.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 21/32] epiphany: update to 3.24.2
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
X-List-Received-Date: Fri, 16 Jun 2017 12:29:29 -0000

epiphany has been relicensed to GPLv3+:
https://git.gnome.org/browse/epiphany/commit/?id=e54cb1c7e97ddca58977a8ee01a138ff57ba6f2c

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../epiphany/{epiphany_3.22.6.bb => epiphany_3.24.2.bb}        | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-gnome/epiphany/{epiphany_3.22.6.bb => epiphany_3.24.2.bb} (67%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_3.22.6.bb b/meta/recipes-gnome/epiphany/epiphany_3.24.2.bb
similarity index 67%
rename from meta/recipes-gnome/epiphany/epiphany_3.22.6.bb
rename to meta/recipes-gnome/epiphany/epiphany_3.24.2.bb
index 651fef1bf08..75deca800e2 100644
--- a/meta/recipes-gnome/epiphany/epiphany_3.22.6.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_3.24.2.bb
@@ -1,17 +1,17 @@
 SUMMARY = "WebKit based web browser for GNOME"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+LICENSE = "GPLv3+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 DEPENDS = "libsoup-2.4 webkitgtk gtk+3 iso-codes avahi libnotify gcr \
 	   gsettings-desktop-schemas gnome-desktop3 libxml2-native \
-	   intltool-native glib-2.0 glib-2.0-native"
+	   intltool-native glib-2.0 glib-2.0-native json-glib"
 
 inherit gnomebase gsettings distro_features_check upstream-version-is-even gettext
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI += "file://0001-yelp.m4-drop-the-check-for-itstool.patch"
-SRC_URI[archive.md5sum] = "e08762c6bb01c4d291b3d22c7adb1a65"
-SRC_URI[archive.sha256sum] = "de7ea87dc450702bde620033f9e2ce807859727d007396d86b09f2b82397fcc2"
+SRC_URI[archive.md5sum] = "e035dc6f64f0c1909de823e03f16b2f3"
+SRC_URI[archive.sha256sum] = "5abc0d0c60591df5236ac9b8979dc9f7d9acbb8ad0902b4772d2b7beea81c58d"
 
 EXTRA_OECONF += " --with-distributor-name=${DISTRO}"
 
-- 
2.11.0


