Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 6DE6271C80
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2016 12:48:29 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga104.jf.intel.com with ESMTP; 15 Dec 2016 04:48:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,351,1477983600"; d="scan'208";a="18480790"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 15 Dec 2016 04:48:30 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Dec 2016 14:47:55 +0200
Message-Id: <3425eda07a37cc193ee4edf9a29aec046db9ff23.1481805889.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1481805889.git.alexander.kanavin@linux.intel.com>
References: <cover.1481805889.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 02/16] libfm: update to 1.2.5
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
X-List-Received-Date: Thu, 15 Dec 2016 12:48:29 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../libfm/{libfm-extra_1.2.4.bb => libfm-extra_1.2.5.bb}              | 4 ++--
 meta/recipes-support/libfm/{libfm_1.2.4.bb => libfm_1.2.5.bb}         | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-support/libfm/{libfm-extra_1.2.4.bb => libfm-extra_1.2.5.bb} (80%)
 rename meta/recipes-support/libfm/{libfm_1.2.4.bb => libfm_1.2.5.bb} (90%)

diff --git a/meta/recipes-support/libfm/libfm-extra_1.2.4.bb b/meta/recipes-support/libfm/libfm-extra_1.2.5.bb
similarity index 80%
rename from meta/recipes-support/libfm/libfm-extra_1.2.4.bb
rename to meta/recipes-support/libfm/libfm-extra_1.2.5.bb
index f204968..0134572 100644
--- a/meta/recipes-support/libfm/libfm-extra_1.2.4.bb
+++ b/meta/recipes-support/libfm/libfm-extra_1.2.5.bb
@@ -11,8 +11,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/pcmanfm/libfm-${PV}.tar.xz \
            file://0001-nls.m4-Take-it-from-gettext-0.15.patch \
           "
 
-SRC_URI[md5sum] = "74997d75e7e87dc73398746fd373bf52"
-SRC_URI[sha256sum] = "7804f6f28cb3d1bc8ffb3151ab7ff0c063b27c5f9b06c682eb903e01cf25502f"
+SRC_URI[md5sum] = "a1ba9ae5e920f38b647dd511edd6c807"
+SRC_URI[sha256sum] = "c706bb1020cf5f2d6f5a9226f692ce1985947134dcf2bde64278bd0420779b5a"
 
 S = "${WORKDIR}/libfm-${PV}"
 
diff --git a/meta/recipes-support/libfm/libfm_1.2.4.bb b/meta/recipes-support/libfm/libfm_1.2.5.bb
similarity index 90%
rename from meta/recipes-support/libfm/libfm_1.2.4.bb
rename to meta/recipes-support/libfm/libfm_1.2.5.bb
index 2218f9c..638c364 100644
--- a/meta/recipes-support/libfm/libfm_1.2.4.bb
+++ b/meta/recipes-support/libfm/libfm_1.2.5.bb
@@ -13,8 +13,8 @@ DEPENDS = "glib-2.0 pango gtk+3 menu-cache intltool-native libexif libfm-extra g
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/pcmanfm/libfm-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "74997d75e7e87dc73398746fd373bf52"
-SRC_URI[sha256sum] = "7804f6f28cb3d1bc8ffb3151ab7ff0c063b27c5f9b06c682eb903e01cf25502f"
+SRC_URI[md5sum] = "a1ba9ae5e920f38b647dd511edd6c807"
+SRC_URI[sha256sum] = "c706bb1020cf5f2d6f5a9226f692ce1985947134dcf2bde64278bd0420779b5a"
 
 inherit autotools pkgconfig gtk-doc distro_features_check
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
-- 
2.10.2


