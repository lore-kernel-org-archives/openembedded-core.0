Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 92E5D731C8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Feb 2016 22:41:04 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 11 Feb 2016 14:41:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,433,1449561600"; d="scan'208";a="901131474"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.jf.intel.com)
	([10.54.69.56])
	by fmsmga001.fm.intel.com with ESMTP; 11 Feb 2016 14:41:04 -0800
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Feb 2016 22:41:49 +0000
Message-Id: <65983e69faa25c4c76a7c22d3a30496060907164.1455230140.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1455230140.git.alejandro.hernandez@linux.intel.com>
References: <cover.1455230140.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 2/2] linux-yocto: Update SRCREV for genericx86* for 4.4
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
X-List-Received-Date: Thu, 11 Feb 2016 22:41:04 -0000

Upgrades to stable LINUX_VERSION 4.4.1

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta-yocto-bsp/recipes-kernel/linux/linux-yocto_4.4.bbappend | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_4.4.bbappend b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_4.4.bbappend
index b667892..0f7e16a 100644
--- a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_4.4.bbappend
+++ b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_4.4.bbappend
@@ -4,8 +4,11 @@ KBRANCH_genericx86-64  = "standard/base"
 KMACHINE_genericx86 ?= "common-pc"
 KMACHINE_genericx86-64 ?= "common-pc-64"
 
-SRCREV_machine_genericx86    ?= "57af322eecf5750f8f09cb8b093d613caede5c48"
-SRCREV_machine_genericx86-64 ?= "57af322eecf5750f8f09cb8b093d613caede5c48"
+SRCREV_machine_genericx86    ?= "0194c765861157b95de80fa7c27ebb6b51c16dd6"
+SRCREV_machine_genericx86-64 ?= "0194c765861157b95de80fa7c27ebb6b51c16dd6"
 
 COMPATIBLE_MACHINE_genericx86 = "genericx86"
 COMPATIBLE_MACHINE_genericx86-64 = "genericx86-64"
+
+LINUX_VERSION_genericx86 = "4.4.1"
+LINUX_VERSION_genericx86-64 = "4.4.1"
-- 
2.6.2


