Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SlxPv-0006tU-N1
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 09:21:00 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 03 Jul 2012 00:09:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="166158078"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.182])
	by orsmga002.jf.intel.com with ESMTP; 03 Jul 2012 00:09:51 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jul 2012 00:09:39 -0700
Message-Id: <5e3f777f9fcc986ae66203651830b5765bca49fd.1341299168.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1341299168.git.sgw@linux.intel.com>
References: <cover.1341299168.git.sgw@linux.intel.com>
In-Reply-To: <cover.1341299168.git.sgw@linux.intel.com>
References: <cover.1341299168.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 10/17] u-boot: Don't make the -Os removal part of global settings.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Jul 2012 07:21:01 -0000

From: Paul Gortmaker <paul.gortmaker@windriver.com>

We don't want to force everyone to be stripping the -Os
flags from their u-boot builds.  Remove it, since it pertains
to an old toolchain issue that is no longer relevant, and it
breaks the powerpc mpc8315.

Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 meta/recipes-bsp/u-boot/u-boot.inc |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index a13eddc..5de3583 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -7,8 +7,7 @@ inherit deploy
 
 PARALLEL_MAKE=""
 
-# GCC 4.5.1 builds unusable binaries using -Os, remove it from OPTFLAGS
-EXTRA_OEMAKE = "CROSS_COMPILE=${TARGET_PREFIX} OPTFLAGS='-O2'"
+EXTRA_OEMAKE = "CROSS_COMPILE=${TARGET_PREFIX}"
 
 python () {
 	if not d.getVar("UBOOT_MACHINE", True):
-- 
1.7.7.6



