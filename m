Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1SXBWt-0003Gz-DW
	for openembedded-core@lists.openembedded.org;
	Wed, 23 May 2012 15:23:07 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 23 May 2012 06:11:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="147416744"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by orsmga002.jf.intel.com with ESMTP; 23 May 2012 06:11:27 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 May 2012 16:11:03 +0300
Message-Id: <030335073a669e1def83b722e0966b9aba748b80.1337777033.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1337777033.git.laurentiu.palcu@intel.com>
References: <cover.1337777033.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1337777033.git.laurentiu.palcu@intel.com>
References: <cover.1337777033.git.laurentiu.palcu@intel.com>
Subject: [PATCH 11/19] libxt: upgrade to 1.1.3
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
X-List-Received-Date: Wed, 23 May 2012 13:23:07 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../xorg-lib/{libxt_1.1.2.bb => libxt_1.1.3.bb}    |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxt_1.1.2.bb => libxt_1.1.3.bb} (91%)

diff --git a/meta/recipes-graphics/xorg-lib/libxt_1.1.2.bb b/meta/recipes-graphics/xorg-lib/libxt_1.1.3.bb
similarity index 91%
rename from meta/recipes-graphics/xorg-lib/libxt_1.1.2.bb
rename to meta/recipes-graphics/xorg-lib/libxt_1.1.3.bb
index 04fd59d..8249e78 100644
--- a/meta/recipes-graphics/xorg-lib/libxt_1.1.2.bb
+++ b/meta/recipes-graphics/xorg-lib/libxt_1.1.3.bb
@@ -41,5 +41,5 @@ do_compile() {
 	oe_runmake
 }
 
-SRC_URI[md5sum] = "c4f7f149559320f378d93b835d38ad6f"
-SRC_URI[sha256sum] = "f041a7802b13630348072f5a609e0cc0e3df2382c0ddaae41d2769422eacc347"
+SRC_URI[md5sum] = "a6f137ae100e74ebe3b71eb4a38c40b3"
+SRC_URI[sha256sum] = "8db593c3fc5ffc4e9cd854ba50af1eac9b90d66521ba17802b8f1e0d2d7f05bd"
-- 
1.7.9.5



