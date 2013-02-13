Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1U5fdt-0004EY-F2
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Feb 2013 17:57:26 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 13 Feb 2013 08:41:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,658,1355126400"; d="scan'208";a="290652905"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by fmsmga002.fm.intel.com with ESMTP; 13 Feb 2013 08:40:40 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Feb 2013 18:40:29 +0200
Message-Id: <88d78d42142681b2271b7ec7b5166eeee7059a74.1360773347.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1360773347.git.laurentiu.palcu@intel.com>
References: <cover.1360773347.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1360773347.git.laurentiu.palcu@intel.com>
References: <cover.1360773347.git.laurentiu.palcu@intel.com>
Subject: [PATCH 2/7] xf86-input-vmmouse: upgrade to 13.0.0
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
X-List-Received-Date: Wed, 13 Feb 2013 16:57:39 -0000
X-List-Received-Date: Wed, 13 Feb 2013 16:57:39 -0000
X-List-Received-Date: Wed, 13 Feb 2013 16:57:39 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 ...ouse_12.9.0.bb => xf86-input-vmmouse_13.0.0.bb} |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-vmmouse_12.9.0.bb => xf86-input-vmmouse_13.0.0.bb} (75%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-vmmouse_12.9.0.bb b/meta/recipes-graphics/xorg-driver/xf86-input-vmmouse_13.0.0.bb
similarity index 75%
rename from meta/recipes-graphics/xorg-driver/xf86-input-vmmouse_12.9.0.bb
rename to meta/recipes-graphics/xorg-driver/xf86-input-vmmouse_13.0.0.bb
index 24bfd92..3290ed5 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-vmmouse_12.9.0.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-vmmouse_13.0.0.bb
@@ -3,8 +3,8 @@ require xorg-driver-input.inc
 DESCRIPTION = "X.Org X server -- VMWare mouse input driver"
 PR = "${INC_PR}.0"
 
-SRC_URI[md5sum] = "2b3bfea9ba1f73d9d68bddd0d6b20112"
-SRC_URI[sha256sum] = "fbcf00f6bfee38bc65e0f0b812a4d076f7e203e81ed908e57de4026792b299bf"
+SRC_URI[md5sum] = "34f9f64ee6a1a51fc8266a9af24e1e07"
+SRC_URI[sha256sum] = "04cfb60366008d4db815c550d8fb8d0a4270c75fa7a20fa3bddc9ecbd355612c"
 
 RDEPENDS_${PN} += "xf86-input-mouse"
 
-- 
1.7.9.5



