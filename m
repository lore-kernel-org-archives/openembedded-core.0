Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 4BA1C60135
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2013 20:30:00 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 09 Jul 2013 13:29:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1030,1363158000"; d="scan'208";a="328927619"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.85])
	by azsmga001.ch.intel.com with ESMTP; 09 Jul 2013 13:29:56 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Jul 2013 13:29:55 -0700
Message-Id: <1373401795-11886-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH] pciutils: Add kmod dependency
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
X-List-Received-Date: Tue, 09 Jul 2013 20:30:01 -0000

pciutils now uses libkmod to look up kernel module info.

[YOCTO #4821]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-bsp/pciutils/pciutils_3.2.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/pciutils/pciutils_3.2.0.bb b/meta/recipes-bsp/pciutils/pciutils_3.2.0.bb
index 6022695..c24a5cc 100644
--- a/meta/recipes-bsp/pciutils/pciutils_3.2.0.bb
+++ b/meta/recipes-bsp/pciutils/pciutils_3.2.0.bb
@@ -8,7 +8,7 @@ SECTION = "console/utils"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 DEPENDS = "zlib"
-RDEPENDS_${PN} = "${PN}-ids"
+RDEPENDS_${PN} = "${PN}-ids kmod"
 PR = "r0"
 
 SRC_URI = "${KERNELORG_MIRROR}/software/utils/pciutils/pciutils-${PV}.tar.bz2 \
-- 
1.8.1.4


