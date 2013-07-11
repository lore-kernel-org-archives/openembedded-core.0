Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 447F660289
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 20:04:07 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 11 Jul 2013 13:04:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,647,1367996400"; d="scan'208";a="368668496"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.73])
	by orsmga002.jf.intel.com with ESMTP; 11 Jul 2013 13:04:07 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Jul 2013 13:04:07 -0700
Message-Id: <1373573047-3073-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH v2] pciutils: Add kmod dependency
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
X-List-Received-Date: Thu, 11 Jul 2013 20:04:07 -0000

pciutils now uses libkmod to look up kernel module info.

[YOCTO #4821]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-bsp/pciutils/pciutils_3.2.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/pciutils/pciutils_3.2.0.bb b/meta/recipes-bsp/pciutils/pciutils_3.2.0.bb
index 6022695..51099d1 100644
--- a/meta/recipes-bsp/pciutils/pciutils_3.2.0.bb
+++ b/meta/recipes-bsp/pciutils/pciutils_3.2.0.bb
@@ -7,7 +7,7 @@ SECTION = "console/utils"
 
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-DEPENDS = "zlib"
+DEPENDS = "zlib kmod"
 RDEPENDS_${PN} = "${PN}-ids"
 PR = "r0"
 
-- 
1.8.1.4


