Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1CA5778865
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Dec 2017 15:49:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vBLFnRH1007289
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 21 Dec 2017 07:49:28 -0800
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Thu, 21 Dec 2017 07:49:27 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 21 Dec 2017 10:49:16 -0500
Message-ID: <5848a7ccbb6ca7c0079af5ecc463299d2d29d3c2.1513871125.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1513871125.git.bruce.ashfield@windriver.com>
References: <cover.1513871125.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/9] linux-yocto/4.12: bug fixes and feature backports
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
X-List-Received-Date: Thu, 21 Dec 2017 15:49:27 -0000
Content-Type: text/plain

Integrating the following changes to the 4.12 tree:

 1b85adfc0b81 mtd: intel-spi: Add Intel Lewisburg PCH SPI super SKU PCI ID
 b373e336eb84 mtd: spi-nor: intel-spi: Add support for Intel Cedar Fork SPI serial flash
 c37662f04d7c mtd: spi-nor: intel-spi: Add support for Intel Lewisburg SPI serial flash
 a8a4ae37e8b7 mtd: spi-nor: intel-spi: Add support for Intel Denverton SPI serial flash controller
 aa830ab86985 net/bluetooth: make bluetooth socket can be created in net namespace
 2e98dc285831 x86/debug: Handle warnings before the notifier chain, to fix KGDB crash

These are all bug fixes, or mainline backports.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.12.bb      | 16 ++++++++--------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
index efa4f05bb0b6..27675903bc59 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "51c45f6489df4cdbce78e9c90b8a26fa7e7c875c"
+SRCREV_machine ?= "5683569846208da7b42c8c89e93f3259530ce92d"
 SRCREV_meta ?= "3574bb061c1bfbdcf4df8308870c03f88ef0788f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
index 78056ee83183..e0c43b5cc420 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "4.12.16"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "4226b065fca4f630901d99b99d18c395ae3866fb"
+SRCREV_machine ?= "1b85adfc0b817bc39efc48dcb3405808daf2b505"
 SRCREV_meta ?= "3574bb061c1bfbdcf4df8308870c03f88ef0788f"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.12.bb b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
index 90a00a513dd6..aec38ecc35d7 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "6227bf7bc958840e020930ac250634129919571b"
-SRCREV_machine_qemuarm64 ?= "4226b065fca4f630901d99b99d18c395ae3866fb"
-SRCREV_machine_qemumips ?= "16b69ee760d800e7f16a01476a24a87b66702dc6"
-SRCREV_machine_qemuppc ?= "4226b065fca4f630901d99b99d18c395ae3866fb"
-SRCREV_machine_qemux86 ?= "4226b065fca4f630901d99b99d18c395ae3866fb"
-SRCREV_machine_qemux86-64 ?= "4226b065fca4f630901d99b99d18c395ae3866fb"
-SRCREV_machine_qemumips64 ?= "4eb2f843b67a8e97619689991b566808212a3677"
-SRCREV_machine ?= "4226b065fca4f630901d99b99d18c395ae3866fb"
+SRCREV_machine_qemuarm ?= "355d43fde266ab8062616a8226f63f0fe9ba8693"
+SRCREV_machine_qemuarm64 ?= "1b85adfc0b817bc39efc48dcb3405808daf2b505"
+SRCREV_machine_qemumips ?= "db46814f088b53d656be50c1ff8a6ac0e120a312"
+SRCREV_machine_qemuppc ?= "1b85adfc0b817bc39efc48dcb3405808daf2b505"
+SRCREV_machine_qemux86 ?= "1b85adfc0b817bc39efc48dcb3405808daf2b505"
+SRCREV_machine_qemux86-64 ?= "1b85adfc0b817bc39efc48dcb3405808daf2b505"
+SRCREV_machine_qemumips64 ?= "74b3f662fcc5672389b05ae572858e34a123e570"
+SRCREV_machine ?= "1b85adfc0b817bc39efc48dcb3405808daf2b505"
 SRCREV_meta ?= "3574bb061c1bfbdcf4df8308870c03f88ef0788f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;name=machine;branch=${KBRANCH}; \
-- 
2.5.0


