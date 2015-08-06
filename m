Return-Path: <cristian.iorga@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6C4FA75FB5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Aug 2015 15:44:53 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 06 Aug 2015 08:44:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,623,1432623600"; d="scan'208";a="778208747"
Received: from sentry.rb.intel.com ([10.237.105.63])
	by fmsmga002.fm.intel.com with ESMTP; 06 Aug 2015 08:44:52 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Aug 2015 18:45:00 +0300
Message-Id: <1438875900-16136-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] qemu: upgrade to 2.4.0-rc4
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
X-List-Received-Date: Thu, 06 Aug 2015 15:44:54 -0000

Bugfixes, bring it closer to 2.4.0 final release.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-devtools/qemu/{qemu_2.4.0-rc3.bb => qemu_2.4.0-rc4.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/qemu/{qemu_2.4.0-rc3.bb => qemu_2.4.0-rc4.bb} (82%)

diff --git a/meta/recipes-devtools/qemu/qemu_2.4.0-rc3.bb b/meta/recipes-devtools/qemu/qemu_2.4.0-rc4.bb
similarity index 82%
rename from meta/recipes-devtools/qemu/qemu_2.4.0-rc3.bb
rename to meta/recipes-devtools/qemu/qemu_2.4.0-rc4.bb
index 9b17bcc..1964a50 100644
--- a/meta/recipes-devtools/qemu/qemu_2.4.0-rc3.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.4.0-rc4.bb
@@ -8,11 +8,11 @@ SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
             file://Qemu-Arm-versatilepb-Add-memory-size-checking.patch \
            "
 SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BPN}-${REALPV}.tar.bz2"
-SRC_URI[md5sum] = "ba43213c94ef4463afc8bd01ee221860"
-SRC_URI[sha256sum] = "aacd5834ce275300f1ba3617c32d4d149db93705ecb7955d7436c0fc9b96aa4c"
+SRC_URI[md5sum] = "0e9c00b15d383043ce888f7bf17308c9"
+SRC_URI[sha256sum] = "724bc17d29babe2b55107c76af7cd67e162857958a3bfe2f34bb9776f1f5f4b3"
 
 S="${WORKDIR}/${BPN}-${REALPV}"
-REALPV = "2.4.0-rc3"
+REALPV = "2.4.0-rc4"
 PV = "2.3.99+${REALPV}"
 
 COMPATIBLE_HOST_class-target_mips64 = "null"
-- 
2.1.4


