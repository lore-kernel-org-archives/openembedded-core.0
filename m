Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1Slx77-000376-Un
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 09:01:34 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 02 Jul 2012 23:50:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="118373935"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by AZSMGA002.ch.intel.com with ESMTP; 02 Jul 2012 23:50:30 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jul 2012 09:50:18 +0300
Message-Id: <1341298228-4412-2-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1341298228-4412-1-git-send-email-laurentiu.palcu@intel.com>
References: <1341298228-4412-1-git-send-email-laurentiu.palcu@intel.com>
Subject: [PATCH 01/10] xf86-input-vmmouse: upgrade to 12.9.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Jul 2012 07:01:34 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 ...ouse_12.8.0.bb => xf86-input-vmmouse_12.9.0.bb} |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-vmmouse_12.8.0.bb => xf86-input-vmmouse_12.9.0.bb} (75%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-vmmouse_12.8.0.bb b/meta/recipes-graphics/xorg-driver/xf86-input-vmmouse_12.9.0.bb
similarity index 75%
rename from meta/recipes-graphics/xorg-driver/xf86-input-vmmouse_12.8.0.bb
rename to meta/recipes-graphics/xorg-driver/xf86-input-vmmouse_12.9.0.bb
index 150a9ed..24bfd92 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-vmmouse_12.8.0.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-vmmouse_12.9.0.bb
@@ -3,8 +3,8 @@ require xorg-driver-input.inc
 DESCRIPTION = "X.Org X server -- VMWare mouse input driver"
 PR = "${INC_PR}.0"
 
-SRC_URI[md5sum] = "15fce165117706cd5e774a8aa58122ce"
-SRC_URI[sha256sum] = "a8a6ec0b567c48c130ccb830e15dfc2b201831841de0c2cc56bd87256d2d869a"
+SRC_URI[md5sum] = "2b3bfea9ba1f73d9d68bddd0d6b20112"
+SRC_URI[sha256sum] = "fbcf00f6bfee38bc65e0f0b812a4d076f7e203e81ed908e57de4026792b299bf"
 
 RDEPENDS_${PN} += "xf86-input-mouse"
 
-- 
1.7.9.5



