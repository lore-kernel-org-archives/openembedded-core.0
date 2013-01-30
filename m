Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei.adrianx.dinu@intel.com>) id 1U0aFs-0008JS-Iy
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Jan 2013 17:11:22 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 30 Jan 2013 07:55:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,569,1355126400"; d="scan'208";a="278621010"
Received: from adinu-vostro-460 (HELO localhost.localdomain) ([10.237.105.33])
	by orsmga002.jf.intel.com with ESMTP; 30 Jan 2013 07:55:37 -0800
From: Andrei Dinu <andrei.adrianx.dinu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Jan 2013 17:56:34 +0200
Message-Id: <1359561394-20661-1-git-send-email-andrei.adrianx.dinu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] icu : upgrade to 50.1.2
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
X-List-Received-Date: Wed, 30 Jan 2013 16:11:22 -0000

Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
---
 .../icu/{icu_50.1.1.bb => icu_50.1.2.bb}           |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/icu/{icu_50.1.1.bb => icu_50.1.2.bb} (55%)

diff --git a/meta/recipes-support/icu/icu_50.1.1.bb b/meta/recipes-support/icu/icu_50.1.2.bb
similarity index 55%
rename from meta/recipes-support/icu/icu_50.1.1.bb
rename to meta/recipes-support/icu/icu_50.1.2.bb
index 26b086f..225ea13 100644
--- a/meta/recipes-support/icu/icu_50.1.1.bb
+++ b/meta/recipes-support/icu/icu_50.1.2.bb
@@ -4,8 +4,8 @@ LIC_FILES_CHKSUM = "file://../license.html;md5=4ee45701e87d34303281978e3b78ecda"
 
 PR = "r0"
 
-BASE_SRC_URI = "http://download.icu-project.org/files/icu4c/${PV}/icu4c-50_1_1-src.tgz"
+BASE_SRC_URI = "http://download.icu-project.org/files/icu4c/${PV}/icu4c-50_1_2-src.tgz"
 SRC_URI = "${BASE_SRC_URI}"
 
-SRC_URI[md5sum] = "c721c2e0c8f86975ccea620d09aedc81"
-SRC_URI[sha256sum] = "a6f426e3c04749c74bcb9d2ce229f905de88deda2353db2249f2e96fe604df8f"
+SRC_URI[md5sum] = "beb98aa972219c9fcd9c8a71314943c9"
+SRC_URI[sha256sum] = "cb68067dcc60d682f8e037bf0961bdd5169cb4652ef8aa136e893780047dafd3"
-- 
1.7.9.5



