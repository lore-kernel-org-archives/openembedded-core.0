Return-Path: <marius.avram@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id EAB0065D34
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Aug 2014 11:09:13 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 27 Aug 2014 04:01:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,409,1406617200"; d="scan'208";a="582315425"
Received: from mavram-vostro.rb.intel.com ([10.237.105.71])
	by fmsmga001.fm.intel.com with ESMTP; 27 Aug 2014 04:09:12 -0700
From: Marius Avram <marius.avram@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Aug 2014 14:12:21 +0300
Message-Id: <1409137941-25527-1-git-send-email-marius.avram@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 2/2] pcmanfm: Upgrade to 1.2.1
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
X-List-Received-Date: Wed, 27 Aug 2014 11:09:14 -0000

Signed-off-by: Marius Avram <marius.avram@intel.com>
---
 .../pcmanfm/{pcmanfm_1.1.2.bb => pcmanfm_1.2.1.bb} |    8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta/recipes-sato/pcmanfm/{pcmanfm_1.1.2.bb => pcmanfm_1.2.1.bb} (79%)

diff --git a/meta/recipes-sato/pcmanfm/pcmanfm_1.1.2.bb b/meta/recipes-sato/pcmanfm/pcmanfm_1.2.1.bb
similarity index 79%
rename from meta/recipes-sato/pcmanfm/pcmanfm_1.1.2.bb
rename to meta/recipes-sato/pcmanfm/pcmanfm_1.2.1.bb
index 14c5cd5..fb57269 100644
--- a/meta/recipes-sato/pcmanfm/pcmanfm_1.1.2.bb
+++ b/meta/recipes-sato/pcmanfm/pcmanfm_1.2.1.bb
@@ -13,15 +13,15 @@ DEPENDS_append_poky = " libowl"
 
 COMPATIBLE_HOST = '(x86_64.*|i.86.*|aarch64.*|arm.*|mips.*|powerpc.*|sh.*)-(linux|freebsd.*)'
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/pcmanfm/pcmanfm-${PV}.tar.gz \
+SRC_URI = "${SOURCEFORGE_MIRROR}/pcmanfm/pcmanfm-${PV}.tar.xz \
 	   file://gnome-fs-directory.png \
 	   file://gnome-fs-regular.png \
 	   file://gnome-mime-text-plain.png \
 	   file://emblem-symbolic-link.png \
 	   file://no-desktop.patch"
 
-SRC_URI[md5sum] = "41104699e653ff2b0a9a9e80a257d6a2"
-SRC_URI[sha256sum] = "23ee33b34066ac83ce9a98bc9930049e69839438fb60489bd453bec8c2068950"
+SRC_URI[md5sum] = "66e634aff37dbc6d7204570df041152f"
+SRC_URI[sha256sum] = "e375eca3149e50980c9e89699f8cdbbc921c85f4795abc9fa281d3994d451bef"
 
 inherit autotools pkgconfig
 
@@ -31,3 +31,5 @@ do_install_append () {
 
 	install -m 0644 ${WORKDIR}/*.png ${D}/${datadir}/pixmaps
 }
+
+FILES_${PN} += "${libdir}/pcmanfm"
-- 
1.7.9.5


