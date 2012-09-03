Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T8U8I-0004vG-Ja
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Sep 2012 12:43:54 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 03 Sep 2012 03:31:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,359,1344236400"; d="scan'208";a="217497208"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.155])
	by fmsmga001.fm.intel.com with ESMTP; 03 Sep 2012 03:31:16 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Sep 2012 11:30:34 +0100
Message-Id: <40fa6dfec76455b594e09def346c0af79d8f89d7.1346668109.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1346668109.git.paul.eggleton@linux.intel.com>
References: <cover.1346668109.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1346668109.git.paul.eggleton@linux.intel.com>
References: <cover.1346668109.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 14/28] packagegroup-core-gtk-directfb: remove superfluous -base package
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Sep 2012 10:43:55 -0000

There's only one package, just make it the main one; also update
core-image-gtk-directfb to match and tidy it up a bit.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../images/core-image-gtk-directfb.bb              |    8 +-------
 .../packagegroup-core-gtk-directfb.bb              |    4 +---
 2 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-graphics/images/core-image-gtk-directfb.bb b/meta/recipes-graphics/images/core-image-gtk-directfb.bb
index 868b309..05f03cd 100644
--- a/meta/recipes-graphics/images/core-image-gtk-directfb.bb
+++ b/meta/recipes-graphics/images/core-image-gtk-directfb.bb
@@ -6,18 +6,12 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 
-DEPENDS += "packagegroup-core-gtk-directfb"
-
-RDEPENDS_${PN} += " \
-	packagegroup-core-gtk-directfb-base \
-	"
-
 inherit core-image
 
 IMAGE_INSTALL += "\
 	${CORE_IMAGE_BASE_INSTALL} \
 	packagegroup-core-basic \
-	packagegroup-core-gtk-directfb-base \
+	packagegroup-core-gtk-directfb \
 "
 
 python __anonymous () {
diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-gtk-directfb.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-gtk-directfb.bb
index 0c47b6f..2f35b34 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-gtk-directfb.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-gtk-directfb.bb
@@ -7,11 +7,9 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
 
 inherit packagegroup
 
-PACKAGES = "${PN}-base"
-
 TOUCH = ' ${@base_contains("MACHINE_FEATURES", "touchscreen", "tslib tslib-calibrate tslib-tests", "",d)}'
 
-RDEPENDS_${PN}-base = " \
+RDEPENDS_${PN} = " \
 		directfb \
 		directfb-examples \
 		pango \
-- 
1.7.9.5



