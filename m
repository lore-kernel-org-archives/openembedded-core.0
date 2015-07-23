Return-Path: <cristian.iorga@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 24AAF761D1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 08:45:54 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 23 Jul 2015 01:45:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,529,1432623600"; d="scan'208";a="752937160"
Received: from sentry.rb.intel.com ([10.237.105.63])
	by fmsmga001.fm.intel.com with ESMTP; 23 Jul 2015 01:45:54 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Jul 2015 11:46:03 +0300
Message-Id: <1437641163-12195-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] qemu: upgrade to 2.4.0-rc2
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
X-List-Received-Date: Thu, 23 Jul 2015 08:45:57 -0000

Various bugfixes.
Ongoing upgrade en route to final 2.4.0.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-devtools/qemu/{qemu_2.4.0-rc1.bb => qemu_2.4.0-rc2.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/qemu/{qemu_2.4.0-rc1.bb => qemu_2.4.0-rc2.bb} (82%)

diff --git a/meta/recipes-devtools/qemu/qemu_2.4.0-rc1.bb b/meta/recipes-devtools/qemu/qemu_2.4.0-rc2.bb
similarity index 82%
rename from meta/recipes-devtools/qemu/qemu_2.4.0-rc1.bb
rename to meta/recipes-devtools/qemu/qemu_2.4.0-rc2.bb
index 7c2d782..2aea37f 100644
--- a/meta/recipes-devtools/qemu/qemu_2.4.0-rc1.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.4.0-rc2.bb
@@ -8,11 +8,11 @@ SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
             file://Qemu-Arm-versatilepb-Add-memory-size-checking.patch \
            "
 SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BPN}-${REALPV}.tar.bz2"
-SRC_URI[md5sum] = "3c8d29abea2b61516bb7ef5b5ff62d03"
-SRC_URI[sha256sum] = "c0c6072ed9196ee17b4120f03fa9cdf9f63e893f7cb8008aa12ea1678450a481"
+SRC_URI[md5sum] = "f634f461acc43774025ec1876fa27ce5"
+SRC_URI[sha256sum] = "ad86df38f10ad8b5fc03a7ec32b0080c0a5ab9e01fdaa7d5ba26f8591dd9b2fe"
 
 S="${WORKDIR}/${BPN}-${REALPV}"
-REALPV = "2.4.0-rc1"
+REALPV = "2.4.0-rc2"
 PV = "2.3.99+${REALPV}"
 
 COMPATIBLE_HOST_class-target_mips64 = "null"
-- 
2.1.4


