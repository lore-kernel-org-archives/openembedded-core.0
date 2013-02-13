Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1U5feH-0004E4-F2
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Feb 2013 17:57:39 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 13 Feb 2013 08:41:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,658,1355126400"; d="scan'208";a="290652910"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by fmsmga002.fm.intel.com with ESMTP; 13 Feb 2013 08:40:41 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Feb 2013 18:40:30 +0200
Message-Id: <75cebf51a3a16cc78c7fa564c196115c790acd2b.1360773347.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1360773347.git.laurentiu.palcu@intel.com>
References: <cover.1360773347.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1360773347.git.laurentiu.palcu@intel.com>
References: <cover.1360773347.git.laurentiu.palcu@intel.com>
Subject: [PATCH 3/7] libdrm: upgrade to 2.4.42
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
X-List-Received-Date: Wed, 13 Feb 2013 16:57:46 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../drm/{libdrm_2.4.40.bb => libdrm_2.4.42.bb}     |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.40.bb => libdrm_2.4.42.bb} (50%)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.40.bb b/meta/recipes-graphics/drm/libdrm_2.4.42.bb
similarity index 50%
rename from meta/recipes-graphics/drm/libdrm_2.4.40.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.42.bb
index 42f860a..67ae2e6 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.40.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.42.bb
@@ -6,5 +6,5 @@ SRC_URI += "file://installtests.patch \
             file://GNU_SOURCE_definition.patch \
            "
 
-SRC_URI[md5sum] = "626a3dc44a40ef37565b61732b688567"
-SRC_URI[sha256sum] = "48c14e4600ea0fde522292893eb4055d2f6d86a69d093d379c827deaccffaa1f"
+SRC_URI[md5sum] = "a6e2e26951bcc920b2049b65e86a659f"
+SRC_URI[sha256sum] = "e0671082a77871c8474d3c0f09dbf5ff82d2429cd248088a691f7b484cbc76e1"
-- 
1.7.9.5



