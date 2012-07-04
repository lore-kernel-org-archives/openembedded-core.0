Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1SmUJx-00056y-PB
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jul 2012 20:29:01 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 04 Jul 2012 11:18:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="164055199"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by azsmga001.ch.intel.com with ESMTP; 04 Jul 2012 11:17:59 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Jul 2012 21:17:37 +0300
Message-Id: <31f8a34775b8849ce91165784f39b0e95369e5ed.1341425229.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1341425229.git.laurentiu.palcu@intel.com>
References: <cover.1341425229.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1341425229.git.laurentiu.palcu@intel.com>
References: <cover.1341425229.git.laurentiu.palcu@intel.com>
Subject: [PATCH 6/8] libxi: upgrade to 1.6.1
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
X-List-Received-Date: Wed, 04 Jul 2012 18:29:02 -0000

---
 .../xorg-lib/{libxi_1.4.5.bb => libxi_1.6.1.bb}    |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxi_1.4.5.bb => libxi_1.6.1.bb} (82%)

diff --git a/meta/recipes-graphics/xorg-lib/libxi_1.4.5.bb b/meta/recipes-graphics/xorg-lib/libxi_1.6.1.bb
similarity index 82%
rename from meta/recipes-graphics/xorg-lib/libxi_1.4.5.bb
rename to meta/recipes-graphics/xorg-lib/libxi_1.6.1.bb
index 214d1ca..575d130 100644
--- a/meta/recipes-graphics/xorg-lib/libxi_1.4.5.bb
+++ b/meta/recipes-graphics/xorg-lib/libxi_1.6.1.bb
@@ -20,5 +20,5 @@ XORG_PN = "libXi"
 
 EXTRA_OECONF_append = " --enable-specs=no"
 
-SRC_URI[md5sum] = "82dcdc76388116800a2c3ad969f510a4"
-SRC_URI[sha256sum] = "22a99123229d22e6e1567c4cda0224a744475f427625d61b23d965157a86f1b5"
+SRC_URI[md5sum] = "78ee882e1ff3b192cf54070bdb19938e"
+SRC_URI[sha256sum] = "f2e3627d7292ec5eff488ab58867fba14a62f06e72a8d3337ab6222c09873109"
-- 
1.7.9.5



