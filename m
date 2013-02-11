Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1U4tDr-0007fZ-FU
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Feb 2013 14:15:44 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 11 Feb 2013 04:59:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,643,1355126400"; d="scan'208";a="201061840"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by AZSMGA002.ch.intel.com with ESMTP; 11 Feb 2013 04:59:02 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Feb 2013 14:59:55 +0200
Message-Id: <1360587595-4104-1-git-send-email-constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
Subject: [PATCH] mesa: upgrade to 9.0.2
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
X-List-Received-Date: Mon, 11 Feb 2013 13:15:48 -0000

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 meta/recipes-graphics/mesa/{mesa-9.0.1.inc => mesa-9.0.2.inc}       | 4 ++--
 meta/recipes-graphics/mesa/{mesa-dri_9.0.1.bb => mesa-dri_9.0.2.bb} | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-9.0.1.inc => mesa-9.0.2.inc} (66%)
 rename meta/recipes-graphics/mesa/{mesa-dri_9.0.1.bb => mesa-dri_9.0.2.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/mesa-9.0.1.inc b/meta/recipes-graphics/mesa/mesa-9.0.2.inc
similarity index 66%
rename from meta/recipes-graphics/mesa/mesa-9.0.1.inc
rename to meta/recipes-graphics/mesa/mesa-9.0.2.inc
index 9b639da..bed432c 100644
--- a/meta/recipes-graphics/mesa/mesa-9.0.1.inc
+++ b/meta/recipes-graphics/mesa/mesa-9.0.2.inc
@@ -3,8 +3,8 @@ SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2 \
            file://cross-glsl.patch \
            "
 
-SRC_URI[md5sum] = "97d6554c05ea7449398afe3a0ede7018"
-SRC_URI[sha256sum] = "57a7ba83bace3f3a7dc0929fe026ef5f0ad454234ec4ad8a3e0d31650a75db6f"
+SRC_URI[md5sum] = "dc45d1192203e418163e0017640e1cfc"
+SRC_URI[sha256sum] = "75bf31f26c6e7b5515e610c1005fd1be1f7eeb2c9e6859848dab879c355ad64e"
 
 LIC_FILES_CHKSUM = "file://docs/license.html;md5=012f69938d81b766472fd0d240df38a4"
 
diff --git a/meta/recipes-graphics/mesa/mesa-dri_9.0.1.bb b/meta/recipes-graphics/mesa/mesa-dri_9.0.2.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-dri_9.0.1.bb
rename to meta/recipes-graphics/mesa/mesa-dri_9.0.2.bb
-- 
1.7.11.7



