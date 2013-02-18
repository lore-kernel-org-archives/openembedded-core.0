Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1U7Slj-0003NX-GF
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Feb 2013 16:36:43 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 18 Feb 2013 07:20:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,688,1355126400"; d="scan'208";a="203607695"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by AZSMGA002.ch.intel.com with ESMTP; 18 Feb 2013 07:20:25 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Feb 2013 17:20:17 +0200
Message-Id: <1361200817-22531-3-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1361200817-22531-1-git-send-email-laurentiu.palcu@intel.com>
References: <1361200817-22531-1-git-send-email-laurentiu.palcu@intel.com>
Subject: [PATCH 2/2] xvinfo: upgrade to 1.1.2
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
X-List-Received-Date: Mon, 18 Feb 2013 15:36:58 -0000
X-List-Received-Date: Mon, 18 Feb 2013 15:36:58 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/recipes-graphics/xorg-app/xvinfo_1.1.1.bb |   15 ---------------
 meta/recipes-graphics/xorg-app/xvinfo_1.1.2.bb |   15 +++++++++++++++
 2 files changed, 15 insertions(+), 15 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-app/xvinfo_1.1.1.bb
 create mode 100644 meta/recipes-graphics/xorg-app/xvinfo_1.1.2.bb

diff --git a/meta/recipes-graphics/xorg-app/xvinfo_1.1.1.bb b/meta/recipes-graphics/xorg-app/xvinfo_1.1.1.bb
deleted file mode 100644
index 66d2561..0000000
--- a/meta/recipes-graphics/xorg-app/xvinfo_1.1.1.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-require xorg-app-common.inc
-
-SUMMARY = "Print out X-Video extension adaptor information"
-
-DESCRIPTION = "xvinfo prints out the capabilities of any video adaptors \
-associated with the display that are accessible through the X-Video \
-extension."
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=b664101ad7a1dc758a4c4109bf978e68"
-DEPENDS += " libxv"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[md5sum] = "c88feb501083951a8f47a21aaeb1529d"
-SRC_URI[sha256sum] = "60c74aa190bcf1e244f6f1576dc43869018a8ed5ba319703a5c198d3466a3985"
diff --git a/meta/recipes-graphics/xorg-app/xvinfo_1.1.2.bb b/meta/recipes-graphics/xorg-app/xvinfo_1.1.2.bb
new file mode 100644
index 0000000..8ea1ca0
--- /dev/null
+++ b/meta/recipes-graphics/xorg-app/xvinfo_1.1.2.bb
@@ -0,0 +1,15 @@
+require xorg-app-common.inc
+
+SUMMARY = "Print out X-Video extension adaptor information"
+
+DESCRIPTION = "xvinfo prints out the capabilities of any video adaptors \
+associated with the display that are accessible through the X-Video \
+extension."
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=b664101ad7a1dc758a4c4109bf978e68"
+DEPENDS += " libxv"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[md5sum] = "1fbd65e81323a8c0a4b5e24db0058405"
+SRC_URI[sha256sum] = "eed3d90ffd788ef728c4a5e7aa4bd86dc6bbcebac929caf7a0479cf8b53b50e3"
-- 
1.7.9.5



