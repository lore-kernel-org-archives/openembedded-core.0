Return-Path: <jussi.kukkonen@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 13F8477122
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jun 2016 08:48:26 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP; 07 Jun 2016 01:48:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,432,1459839600"; d="scan'208";a="823174574"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga003.jf.intel.com with ESMTP; 07 Jun 2016 01:48:26 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Jun 2016 11:47:41 +0300
Message-Id: <0217a29f08e46591ecdd95c15b246fd36c9c9ea8.1465288175.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <7e2909e70b87ffcf2c752bd6ac326ef256bdc1b2.1465288175.git.jussi.kukkonen@intel.com>
References: <7e2909e70b87ffcf2c752bd6ac326ef256bdc1b2.1465288175.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1465288174.git.jussi.kukkonen@intel.com>
References: <cover.1465288174.git.jussi.kukkonen@intel.com>
Subject: [PATCH 23/37] libfm: switch to GTK3 version
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
X-List-Received-Date: Tue, 07 Jun 2016 08:48:27 -0000

From: "Maxin B. John" <maxin.john@intel.com>

Build GTK3 version of libfm.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-support/libfm/libfm_1.2.4.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/libfm/libfm_1.2.4.bb b/meta/recipes-support/libfm/libfm_1.2.4.bb
index 866b11a..2218f9c 100644
--- a/meta/recipes-support/libfm/libfm_1.2.4.bb
+++ b/meta/recipes-support/libfm/libfm_1.2.4.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4641e94ec96f98fabc56ff9cc48be14b \
 
 
 SECTION = "x11/libs"
-DEPENDS = "glib-2.0 pango gtk+ menu-cache intltool-native libexif libfm-extra gettext-native"
+DEPENDS = "glib-2.0 pango gtk+3 menu-cache intltool-native libexif libfm-extra gettext-native"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/pcmanfm/libfm-${PV}.tar.xz"
 
@@ -17,7 +17,9 @@ SRC_URI[md5sum] = "74997d75e7e87dc73398746fd373bf52"
 SRC_URI[sha256sum] = "7804f6f28cb3d1bc8ffb3151ab7ff0c063b27c5f9b06c682eb903e01cf25502f"
 
 inherit autotools pkgconfig gtk-doc distro_features_check
-ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
+ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
+
+EXTRA_OECONF = "--with-gtk=3"
 
 do_configure[dirs] =+ "${S}/m4"
 
-- 
2.1.4


