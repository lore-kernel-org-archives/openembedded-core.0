Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4E2E36FFE5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Feb 2016 22:40:48 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 11 Feb 2016 14:40:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,433,1449561600"; d="scan'208";a="910343048"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.jf.intel.com)
	([10.54.69.56])
	by orsmga002.jf.intel.com with ESMTP; 11 Feb 2016 14:40:49 -0800
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Feb 2016 22:41:34 +0000
Message-Id: <c70942c34a59fd46ec5dac17dddbf04a05575ace.1455230140.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1455230140.git.alejandro.hernandez@linux.intel.com>
References: <cover.1455230140.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 1/2] linux-yocto: Update SRCREV for genericx86* for 4.1
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
X-List-Received-Date: Thu, 11 Feb 2016 22:40:51 -0000

Upgrades to stable LINUX_VERSION 4.1.17

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta-yocto-bsp/recipes-kernel/linux/linux-yocto_4.1.bbappend | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_4.1.bbappend b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_4.1.bbappend
index 0473b08..fb347a4 100644
--- a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_4.1.bbappend
+++ b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_4.1.bbappend
@@ -7,8 +7,8 @@ KBRANCH_mpc8315e-rdb = "standard/fsl-mpc8315e-rdb"
 KMACHINE_genericx86 ?= "common-pc"
 KMACHINE_genericx86-64 ?= "common-pc-64"
 
-SRCREV_machine_genericx86    ?= "788dfc9859321c09f1c58696bf8998f90ccb4f51"
-SRCREV_machine_genericx86-64 ?= "788dfc9859321c09f1c58696bf8998f90ccb4f51"
+SRCREV_machine_genericx86    ?= "2e0ac7b6c4e3ada23a84756287e9b7051ace939a"
+SRCREV_machine_genericx86-64 ?= "2e0ac7b6c4e3ada23a84756287e9b7051ace939a"
 SRCREV_machine_edgerouter ?= "79a31b9d23db126f8a6be3eb88fd683056a213f1"
 SRCREV_machine_beaglebone ?= "efb6ffb2ca96a364f916c9890ad023fc595e0e6e"
 SRCREV_machine_mpc8315e-rdb ?= "79a31b9d23db126f8a6be3eb88fd683056a213f1"
@@ -18,3 +18,6 @@ COMPATIBLE_MACHINE_genericx86-64 = "genericx86-64"
 COMPATIBLE_MACHINE_edgerouter = "edgerouter"
 COMPATIBLE_MACHINE_beaglebone = "beaglebone"
 COMPATIBLE_MACHINE_mpc8315e-rdb = "mpc8315e-rdb"
+
+LINUX_VERSION_genericx86 = "4.1.17"
+LINUX_VERSION_genericx86-64 = "4.1.17"
-- 
2.6.2


