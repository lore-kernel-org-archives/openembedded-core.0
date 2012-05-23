Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1SXBWt-0003H0-U5
	for openembedded-core@lists.openembedded.org;
	Wed, 23 May 2012 15:23:08 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 23 May 2012 06:11:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="147416748"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by orsmga002.jf.intel.com with ESMTP; 23 May 2012 06:11:28 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 May 2012 16:11:04 +0300
Message-Id: <d405e4708cf396cf1fe408c73ae93b8736a0ac6a.1337777033.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1337777033.git.laurentiu.palcu@intel.com>
References: <cover.1337777033.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1337777033.git.laurentiu.palcu@intel.com>
References: <cover.1337777033.git.laurentiu.palcu@intel.com>
Subject: [PATCH 12/19] xtrans: upgrade to 1.2.7
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
X-List-Received-Date: Wed, 23 May 2012 13:23:08 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../xorg-lib/{xtrans_1.2.6.bb => xtrans_1.2.7.bb}  |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{xtrans_1.2.6.bb => xtrans_1.2.7.bb} (82%)

diff --git a/meta/recipes-graphics/xorg-lib/xtrans_1.2.6.bb b/meta/recipes-graphics/xorg-lib/xtrans_1.2.7.bb
similarity index 82%
rename from meta/recipes-graphics/xorg-lib/xtrans_1.2.6.bb
rename to meta/recipes-graphics/xorg-lib/xtrans_1.2.7.bb
index 19abe5a..5aaf501 100644
--- a/meta/recipes-graphics/xorg-lib/xtrans_1.2.6.bb
+++ b/meta/recipes-graphics/xorg-lib/xtrans_1.2.7.bb
@@ -21,5 +21,5 @@ inherit gettext
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "c66f9ffd2da4fb012220c6c40ebc7609"
-SRC_URI[sha256sum] = "c5f9a73705ddbb8c9b8f16c4fac33b4b9ba7661b8305474b4c1549e48d9ca5c6"
+SRC_URI[md5sum] = "84c66908cf003ad8c272b0eecbdbaee3"
+SRC_URI[sha256sum] = "7f811191ba70a34a9994d165ea11a239e52c527f039b6e7f5011588f075fe1a6"
-- 
1.7.9.5



