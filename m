Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T8U8G-0004vP-Ov
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Sep 2012 12:43:52 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 03 Sep 2012 03:31:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,359,1344236400"; d="scan'208";a="217497203"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.155])
	by fmsmga001.fm.intel.com with ESMTP; 03 Sep 2012 03:31:16 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Sep 2012 11:30:33 +0100
Message-Id: <84458f63019ceb115fc8d5f68d78a5f7f763b40c.1346668109.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1346668109.git.paul.eggleton@linux.intel.com>
References: <cover.1346668109.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1346668109.git.paul.eggleton@linux.intel.com>
References: <cover.1346668109.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 13/28] packagegroup-qt4e: tidy up and rename
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
X-List-Received-Date: Mon, 03 Sep 2012 10:43:53 -0000

* Eliminate the -base package, there's only one package and it might as
  well be the main one.
* Rename to packagegroup-core-qt4e to match other package group recipes
* Fix and tidy up qt4e-demo-image at the same time

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-qt/images/qt4e-demo-image.bb          |   10 ++--------
 ...kagegroup-qt4e.bb => packagegroup-core-qt4e.bb} |    6 ++----
 2 files changed, 4 insertions(+), 12 deletions(-)
 rename meta/recipes-qt/packagegroups/{packagegroup-qt4e.bb => packagegroup-core-qt4e.bb} (94%)

diff --git a/meta/recipes-qt/images/qt4e-demo-image.bb b/meta/recipes-qt/images/qt4e-demo-image.bb
index 205c912..9e8b337 100644
--- a/meta/recipes-qt/images/qt4e-demo-image.bb
+++ b/meta/recipes-qt/images/qt4e-demo-image.bb
@@ -1,19 +1,13 @@
 DESCRIPTION = "An image that will launch into the demo application for the embedded (not based on X11) version of Qt."
 LICENSE = "MIT"
-PR="r2"
+PR = "r3"
 
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
-DEPENDS += "packagegroup-qt4e"
-
-RDEPENDS_${PN} += " \
-	packagegroup-qt4e-base \
-	"
-
 IMAGE_INSTALL += "\
 	${CORE_IMAGE_BASE_INSTALL} \
-	packagegroup-qt4e-base \
+	packagegroup-core-qt4e \
 "
 
 inherit core-image
diff --git a/meta/recipes-qt/packagegroups/packagegroup-qt4e.bb b/meta/recipes-qt/packagegroups/packagegroup-core-qt4e.bb
similarity index 94%
rename from meta/recipes-qt/packagegroups/packagegroup-qt4e.bb
rename to meta/recipes-qt/packagegroups/packagegroup-core-qt4e.bb
index 2ee7959..2ea9c2e 100644
--- a/meta/recipes-qt/packagegroups/packagegroup-qt4e.bb
+++ b/meta/recipes-qt/packagegroups/packagegroup-core-qt4e.bb
@@ -7,11 +7,9 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
 
 inherit packagegroup
 
-PACKAGES = "${PN}-base"
-
 TOUCH = ' ${@base_contains("MACHINE_FEATURES", "touchscreen", "tslib tslib-calibrate tslib-tests", "",d)}'
 
-RDEPENDS_${PN}-base = " \
+RDEPENDS_${PN} = " \
 	qt4-embedded \
 	libqt-embedded3support4 \
 	libqt-embeddedclucene4 \
@@ -48,7 +46,7 @@ RDEPENDS_${PN}-base = " \
         qt4-embedded-assistant \
 "
 
-RRECOMMENDS_${PN}-base = " \
+RRECOMMENDS_${PN} = " \
 	libqt-embeddedxmlpatterns4 \
 "
 
-- 
1.7.9.5



