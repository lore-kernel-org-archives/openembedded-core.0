Return-Path: <california.l.sullivan@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 8B5D5607A5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Sep 2016 23:31:19 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga101.jf.intel.com with ESMTP; 19 Sep 2016 16:31:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,364,1470726000"; d="scan'208";a="11165805"
Received: from clsulliv.jf.intel.com ([10.7.201.156])
	by orsmga005.jf.intel.com with ESMTP; 19 Sep 2016 16:31:20 -0700
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Sep 2016 16:31:07 -0700
Message-Id: <1474327867-13961-1-git-send-email-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH 1/1] linux-yocto*: Set MACHINE-specific LINUX_VERSION variables
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
X-List-Received-Date: Mon, 19 Sep 2016 23:31:21 -0000

Some machines move to new kernel versions slower, making the catch-all
LINUX_VERSION variable inaccurate. This mismatch is a security concern
and with 5df5974d53f88a85b2bb789708b86049b091e3aa becomes a build time
error.

Fix this by setting each MACHINE's LINUX_VERSION to the kernel version
each MACHINE builds.

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
---
 meta-yocto-bsp/recipes-kernel/linux/linux-yocto_4.1.bbappend | 3 +++
 meta-yocto-bsp/recipes-kernel/linux/linux-yocto_4.4.bbappend | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_4.1.bbappend b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_4.1.bbappend
index 6dd173b..10a9ce0 100644
--- a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_4.1.bbappend
+++ b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_4.1.bbappend
@@ -21,3 +21,6 @@ COMPATIBLE_MACHINE_mpc8315e-rdb = "mpc8315e-rdb"
 
 LINUX_VERSION_genericx86 = "4.1.30"
 LINUX_VERSION_genericx86-64 = "4.1.30"
+LINUX_VERSION_edgerouter = "4.1.24"
+LINUX_VERSION_beaglebone = "4.1.24"
+LINUX_VERSION_mcp8315e-rdb = "4.1.24"
diff --git a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_4.4.bbappend b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_4.4.bbappend
index 4a7f7e2..6d9cd8d 100644
--- a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_4.4.bbappend
+++ b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_4.4.bbappend
@@ -21,3 +21,6 @@ COMPATIBLE_MACHINE_mpc8315e-rdb = "mpc8315e-rdb"
 
 LINUX_VERSION_genericx86 = "4.4.18"
 LINUX_VERSION_genericx86-64 = "4.4.18"
+LINUX_VERSION_edgerouter = "4.4.11"
+LINUX_VERSION_beaglebone = "4.4.11"
+LINUX_VERSION_mpc8315e-rdb = "4.4.11"
-- 
2.5.5


