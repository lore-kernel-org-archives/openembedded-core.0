Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1Tm4eV-0004oN-Ad
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Dec 2012 16:36:47 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 21 Dec 2012 07:21:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,329,1355126400"; d="scan'208";a="260759370"
Received: from bogdanm (HELO localhost.localdomain) ([10.237.105.166])
	by orsmga002.jf.intel.com with ESMTP; 21 Dec 2012 07:21:58 -0800
From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Dec 2012 17:25:08 +0200
Message-Id: <1356103508-26539-1-git-send-email-bogdan.a.marinescu@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH v2] subversion: updated to 1.7.8
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
X-List-Received-Date: Fri, 21 Dec 2012 15:36:47 -0000

Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>

---
 .../fix-install-depends.patch                                      |    0
 .../{subversion-1.7.7 => subversion-1.7.8}/libtool2.patch          |    0
 .../subversion/{subversion_1.7.7.bb => subversion_1.7.8.bb}        |    4 ++--
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/subversion/{subversion-1.7.7 => subversion-1.7.8}/fix-install-depends.patch (100%)
 rename meta/recipes-devtools/subversion/{subversion-1.7.7 => subversion-1.7.8}/libtool2.patch (100%)
 rename meta/recipes-devtools/subversion/{subversion_1.7.7.bb => subversion_1.7.8.bb} (88%)

diff --git a/meta/recipes-devtools/subversion/subversion-1.7.7/fix-install-depends.patch b/meta/recipes-devtools/subversion/subversion-1.7.8/fix-install-depends.patch
similarity index 100%
rename from meta/recipes-devtools/subversion/subversion-1.7.7/fix-install-depends.patch
rename to meta/recipes-devtools/subversion/subversion-1.7.8/fix-install-depends.patch
diff --git a/meta/recipes-devtools/subversion/subversion-1.7.7/libtool2.patch b/meta/recipes-devtools/subversion/subversion-1.7.8/libtool2.patch
similarity index 100%
rename from meta/recipes-devtools/subversion/subversion-1.7.7/libtool2.patch
rename to meta/recipes-devtools/subversion/subversion-1.7.8/libtool2.patch
diff --git a/meta/recipes-devtools/subversion/subversion_1.7.7.bb b/meta/recipes-devtools/subversion/subversion_1.7.8.bb
similarity index 88%
rename from meta/recipes-devtools/subversion/subversion_1.7.7.bb
rename to meta/recipes-devtools/subversion/subversion_1.7.8.bb
index f006217..1b1ca93 100644
--- a/meta/recipes-devtools/subversion/subversion_1.7.7.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.7.8.bb
@@ -13,8 +13,8 @@ SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://libtool2.patch \
            file://fix-install-depends.patch \
 "
-SRC_URI[md5sum] = "5a42b7d0f1366a8d60f9ad7d5890295d"
-SRC_URI[sha256sum] = "fc85a9341d1dc275b279e470776014b02328a028e48a7ac7868ac07d4a40a321"
+SRC_URI[md5sum] = "454b9f398415c3504435bf8c3f6ed127"
+SRC_URI[sha256sum] = "fc83d4d98ccea8b7bfa8f5c20fff545c8baa7d035db930977550c51c6ca23686"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4a14fd2da3134e40a087eb4326a4ecd4"
 
-- 
1.7.10.4



