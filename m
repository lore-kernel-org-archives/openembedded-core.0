Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1UF3bf-0005px-Mb
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Mar 2013 15:21:48 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 11 Mar 2013 07:05:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,822,1355126400"; d="scan'208";a="276420437"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by orsmga001.jf.intel.com with ESMTP; 11 Mar 2013 07:04:59 -0700
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Mar 2013 16:06:03 +0200
Message-Id: <1363010763-25356-1-git-send-email-constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
Subject: [PATCH] libxi: upgrade to 1.7
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
X-List-Received-Date: Mon, 11 Mar 2013 14:21:55 -0000

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 meta/recipes-graphics/xorg-lib/{libxi_1.6.1.bb => libxi_1.7.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxi_1.6.1.bb => libxi_1.7.bb} (79%)

diff --git a/meta/recipes-graphics/xorg-lib/libxi_1.6.1.bb b/meta/recipes-graphics/xorg-lib/libxi_1.7.bb
similarity index 79%
rename from meta/recipes-graphics/xorg-lib/libxi_1.6.1.bb
rename to meta/recipes-graphics/xorg-lib/libxi_1.7.bb
index c327f25..ad5a33d 100644
--- a/meta/recipes-graphics/xorg-lib/libxi_1.6.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libxi_1.7.bb
@@ -14,9 +14,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=17b064789fab936a1c58c4e13d965b0f \
 DEPENDS += "libxext inputproto"
 
 PE = "1"
-PR = "r1"
+PR = "r0"
 
 XORG_PN = "libXi"
 
-SRC_URI[md5sum] = "78ee882e1ff3b192cf54070bdb19938e"
-SRC_URI[sha256sum] = "f2e3627d7292ec5eff488ab58867fba14a62f06e72a8d3337ab6222c09873109"
+SRC_URI[md5sum] = "d77922d822cb3abdbdfb92cd66440576"
+SRC_URI[sha256sum] = "4ebcf2b02c16ff51e41e9d045de01416d6430b6a4af6a82b17b6bfa4d6f9cbfc"
-- 
1.7.11.7



