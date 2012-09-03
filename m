Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T8U8G-0004vH-00
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Sep 2012 12:43:52 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 03 Sep 2012 03:31:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,359,1344236400"; d="scan'208";a="217497232"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.155])
	by fmsmga001.fm.intel.com with ESMTP; 03 Sep 2012 03:31:21 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Sep 2012 11:30:40 +0100
Message-Id: <7fdc63a598ba66a194cf60258c306de5fc6a094b.1346668109.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1346668109.git.paul.eggleton@linux.intel.com>
References: <cover.1346668109.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1346668109.git.paul.eggleton@linux.intel.com>
References: <cover.1346668109.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 20/28] packagegroup-core-qt: rename -demos to -demoapps
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
X-List-Received-Date: Mon, 03 Sep 2012 10:43:52 -0000

Try to avoid confusion with the Qt demos distributed with Qt itself.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/core-image.bbclass                    |    2 +-
 .../packagegroups/packagegroup-core-qt.bb          |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.bbclass
index a23d3c8..6a391d5 100644
--- a/meta/classes/core-image.bbclass
+++ b/meta/classes/core-image.bbclass
@@ -37,7 +37,7 @@ PACKAGE_GROUP_nfs-server = "packagegroup-core-nfs-server"
 PACKAGE_GROUP_ssh-server-dropbear = "packagegroup-core-ssh-dropbear"
 PACKAGE_GROUP_ssh-server-openssh = "packagegroup-core-ssh-openssh"
 PACKAGE_GROUP_package-management = "${ROOTFS_PKGMANAGE}"
-PACKAGE_GROUP_qt4-pkgs = "packagegroup-core-qt-demos"
+PACKAGE_GROUP_qt4-pkgs = "packagegroup-core-qt-demoapps"
 
 
 # IMAGE_FEATURES_REPLACES_foo = 'bar1 bar2'
diff --git a/meta/recipes-qt/packagegroups/packagegroup-core-qt.bb b/meta/recipes-qt/packagegroups/packagegroup-core-qt.bb
index 579ca15..d59cb4b 100644
--- a/meta/recipes-qt/packagegroups/packagegroup-core-qt.bb
+++ b/meta/recipes-qt/packagegroups/packagegroup-core-qt.bb
@@ -8,8 +8,8 @@ PR = "r3"
 
 inherit packagegroup
 
-PACKAGES = "${PN}-demos"
+PACKAGES = "${PN}-demoapps"
 
 QTDEMOS ?= "quicky ${COMMERCIAL_QT} fotowall"
 
-RDEPENDS_${PN}-demos = "${QTDEMOS}"
+RDEPENDS_${PN}-demoapps = "${QTDEMOS}"
-- 
1.7.9.5



