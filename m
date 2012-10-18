Received: from vms173001pub.verizon.net ([206.46.173.1])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1TP06G-0004eq-GS
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Oct 2012 02:06:04 +0200
Received: from gandalf.denix.org ([unknown] [72.66.25.115])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MC400BT326QTS90@vms173001.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Thu, 18 Oct 2012 17:52:18 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 7528D200BF; Thu,
	18 Oct 2012 18:52:02 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Oct 2012 18:51:57 -0400
Message-id: <1350600718-3052-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.7.12.3
In-reply-to: <1350600718-3052-1-git-send-email-denis@denix.org>
References: <1350600718-3052-1-git-send-email-denis@denix.org>
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH 1/2] tune-cortexa15: add tunes for ARM Cortex-A15
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
X-List-Received-Date: Fri, 19 Oct 2012 00:06:04 -0000

From: Denys Dmytriyenko <denys@ti.com>

http://www.arm.com/products/processors/cortex-a/cortex-a15.php

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta/conf/machine/include/tune-cortexa15.inc | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta/conf/machine/include/tune-cortexa15.inc

diff --git a/meta/conf/machine/include/tune-cortexa15.inc b/meta/conf/machine/include/tune-cortexa15.inc
new file mode 100644
index 0000000..690e934
--- /dev/null
+++ b/meta/conf/machine/include/tune-cortexa15.inc
@@ -0,0 +1,24 @@
+DEFAULTTUNE ?= "cortexa15-neon"
+
+require conf/machine/include/arm/arch-armv7a.inc
+
+TUNEVALID[cortexa15] = "Enable Cortex-A15 specific processor optimizations"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "cortexa15", "-mtune=cortex-a15", "", d)}"
+
+# Little Endian base configs
+AVAILTUNES += "cortexa15 cortexa15t cortexa15-neon"
+TUNE_FEATURES_tune-cortexa15 = "${TUNE_FEATURES_tune-armv7a} cortexa15"
+TUNE_FEATURES_tune-cortexa15t = "${TUNE_FEATURES_tune-armv7at} cortexa15"
+TUNE_FEATURES_tune-cortexa15-neon = "${TUNE_FEATURES_tune-armv7a-neon} cortexa15"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15 = "${PACKAGE_EXTRA_ARCHS_tune-armv7a}"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15t = "${PACKAGE_EXTRA_ARCHS_tune-armv7at}"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon}"
+
+# VFP Tunes
+AVAILTUNES += "cortexa15hf cortexa15thf cortexa15hf-neon"
+TUNE_FEATURES_tune-cortexa15hf ?= "${TUNE_FEATURES_tune-armv7ahf} cortexa15"
+TUNE_FEATURES_tune-cortexa15thf ?= "${TUNE_FEATURES_tune-armv7athf} cortexa15"
+TUNE_FEATURES_tune-cortexa15hf-neon ?= "${TUNE_FEATURES_tune-armv7ahf-neon} cortexa15"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15hf = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf}"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15thf = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf}"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15hf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon}"
-- 
1.7.12.3



