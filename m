Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id B223177195
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jun 2016 08:48:46 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 07 Jun 2016 01:48:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,432,1459839600"; d="scan'208";a="823174670"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga003.jf.intel.com with ESMTP; 07 Jun 2016 01:48:36 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Jun 2016 11:47:46 +0300
Message-Id: <4b0a190b49dd86983736bdf6f9f32aa579bc8785.1465288175.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <7e2909e70b87ffcf2c752bd6ac326ef256bdc1b2.1465288175.git.jussi.kukkonen@intel.com>
References: <7e2909e70b87ffcf2c752bd6ac326ef256bdc1b2.1465288175.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1465288174.git.jussi.kukkonen@intel.com>
References: <cover.1465288174.git.jussi.kukkonen@intel.com>
Subject: [PATCH 28/37] avahi-ui: Build with Gtk+3
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
X-List-Received-Date: Tue, 07 Jun 2016 08:48:47 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-connectivity/avahi/avahi-ui_0.6.32.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/avahi/avahi-ui_0.6.32.bb b/meta/recipes-connectivity/avahi/avahi-ui_0.6.32.bb
index 1b3e918..62b3f31 100644
--- a/meta/recipes-connectivity/avahi/avahi-ui_0.6.32.bb
+++ b/meta/recipes-connectivity/avahi/avahi-ui_0.6.32.bb
@@ -7,14 +7,14 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1 \
 require avahi.inc
 
 inherit distro_features_check
-ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
+ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
 SRC_URI[md5sum] = "22b5e705d3eabb31d26f2e1e7b074013"
 SRC_URI[sha256sum] = "d54991185d514a0aba54ebeb408d7575b60f5818a772e28fa0e18b98bc1db454"
 
-DEPENDS += "avahi gtk+ libglade"
+DEPENDS += "avahi gtk+3"
 
-AVAHI_GTK = "--enable-gtk --disable-gtk3 --disable-pygtk"
+AVAHI_GTK = "--disable-gtk --enable-gtk3 --disable-pygtk"
 
 S = "${WORKDIR}/avahi-${PV}"
 
-- 
2.1.4


