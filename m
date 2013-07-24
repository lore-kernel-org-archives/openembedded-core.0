Return-Path: <ionutx.radu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C22406B31A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 12:40:50 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 24 Jul 2013 05:40:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,735,1367996400"; d="scan'208";a="350750374"
Received: from work.rb.intel.com ([10.237.105.51])
	by orsmga001.jf.intel.com with ESMTP; 24 Jul 2013 05:40:32 -0700
From: Ionut Radu <ionutx.radu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Jul 2013 15:42:53 +0300
Message-Id: <24c718931320fa98d6f54eadfc74ff1576422e33.1374669164.git.ionutx.radu@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <0e420cbfa5d9ab32d32657fbbbac8d3ce13e778f.1374669164.git.ionutx.radu@intel.com>
References: <0e420cbfa5d9ab32d32657fbbbac8d3ce13e778f.1374669164.git.ionutx.radu@intel.com>
In-Reply-To: <cover.1374669164.git.ionutx.radu@intel.com>
References: <cover.1374669164.git.ionutx.radu@intel.com>
Subject: [PATCH 4/4] qemu: Updated from 1.5.0 to 1.5.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Jul 2013 12:40:51 -0000

Patch target-i386-Fix-aflag-logic-for-CODE64-and-the-0x67-.patch was backported

Signed-off-by: Ionut Radu <ionutx.radu@intel.com>
---
 meta/recipes-devtools/qemu/{qemu_1.5.0.bb => qemu_1.5.1.bb} |    7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/qemu/{qemu_1.5.0.bb => qemu_1.5.1.bb} (49%)

diff --git a/meta/recipes-devtools/qemu/qemu_1.5.0.bb b/meta/recipes-devtools/qemu/qemu_1.5.1.bb
similarity index 49%
rename from meta/recipes-devtools/qemu/qemu_1.5.0.bb
rename to meta/recipes-devtools/qemu/qemu_1.5.1.bb
index 9b9d0d7..fe0437f 100644
--- a/meta/recipes-devtools/qemu/qemu_1.5.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_1.5.1.bb
@@ -3,9 +3,8 @@ require qemu.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
                     file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
 
-SRC_URI += "file://fdt_header.patch \
-            file://target-i386-Fix-aflag-logic-for-CODE64-and-the-0x67-.patch"
+SRC_URI += "file://fdt_header.patch"
 
 SRC_URI_prepend = "http://wiki.qemu.org/download/qemu-${PV}.tar.bz2"
-SRC_URI[md5sum] = "b6f3265b8ed39d77e8f354f35cc26e16"
-SRC_URI[sha256sum] = "b22b30ee9712568dfb4eedf76783f4a76546e1cbc41659b909646bcf0b4867bb"
+SRC_URI[md5sum] = "b56e73bdcfdb214d5c68e13111aca96f"
+SRC_URI[sha256sum] = "4c15a1ee2f387983eb5c1497f66bf567c34d14ba48517148f6eafef8ae09e3e8"
-- 
1.7.10.4


