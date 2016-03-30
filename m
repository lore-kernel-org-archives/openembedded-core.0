Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 53AD970100
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 12:25:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u2UCPHpH002474
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 05:25:17 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 30 Mar 2016 05:25:16 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Mar 2016 08:25:06 -0400
Message-ID: <aa02155c69e0f17a5f7a320f0c81f5fd8d7b73f2.1459340441.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1459340441.git.bruce.ashfield@windriver.com>
References: <cover.1459340441.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 8/9] linux-yocto/4.4: broxton and usb type-c backports
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
X-List-Received-Date: Wed, 30 Mar 2016 12:25:16 -0000
Content-Type: text/plain

c43425f73287 mfd: lpss: Add PCI IDs for Intel Broxton B-Step platform
2d6cc1d3e71f spi: pxa2xx: Add support for Intel Broxton B-Step
1df3674b7626 usb: dwc3: gadget: don't send extra ZLP
222ab0043e48 usb: dwc3: gadget: handle request->zero
3f01b2c0295a usb: dwc3: gadget: simplify dwc3_gadget_ep_queue()
729b5a1f8f65 usb: dwc3: gadget: set the OTG flag in dwc3 gadget driver.
65740f5d1a0d usb: dwc3: gadget: simplify next_request() return check
a82442f90ea7 usb: dwc3: Fix assignment of EP transfer resources
d99293bbaa50 usb: dwc3: ep0: fix setup_packet_pending initialization

Signed-off-by: Matt Ranostay <matt.ranostay@intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 16 ++++++++--------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index ca8a3bc70094..5c66c199ae44 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -2,7 +2,7 @@ KBRANCH ?= "standard/preempt-rt"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "8d68782597a31dd55c018c0be7d6799f89aadbf7"
+SRCREV_machine ?= "5ff13cb449701bfeb30ea4a0c4c0b86dc680e219"
 SRCREV_meta ?= "28bff6d39803ad83f83e353f158fc1aa14d5492d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index 8276dd2805ac..8c8cd9842bf3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "4.4.3"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "10527a38c88d3e2c314c9e49d1eecb9da56c2d85"
+SRCREV_machine ?= "c43425f73287757a166d74464fddf1f5389c9f59"
 SRCREV_meta ?= "28bff6d39803ad83f83e353f158fc1aa14d5492d"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index 050d2ebeb8a4..af7daba41512 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "435a6d77355ee83be321d9ee69d448eb530fb8e1"
-SRCREV_machine_qemuarm64 ?= "10527a38c88d3e2c314c9e49d1eecb9da56c2d85"
-SRCREV_machine_qemumips ?= "fb72c22307829d134fc6584fe4735377110a2fc2"
-SRCREV_machine_qemuppc ?= "10527a38c88d3e2c314c9e49d1eecb9da56c2d85"
-SRCREV_machine_qemux86 ?= "10527a38c88d3e2c314c9e49d1eecb9da56c2d85"
-SRCREV_machine_qemux86-64 ?= "10527a38c88d3e2c314c9e49d1eecb9da56c2d85"
-SRCREV_machine_qemumips64 ?= "2fd1a928c13bd7eac5e1086859355314e210b909"
-SRCREV_machine ?= "10527a38c88d3e2c314c9e49d1eecb9da56c2d85"
+SRCREV_machine_qemuarm ?= "19185ca77bc28b0198868f65d6c6c2a92a7ee24c"
+SRCREV_machine_qemuarm64 ?= "c43425f73287757a166d74464fddf1f5389c9f59"
+SRCREV_machine_qemumips ?= "0921347362bc9a4f63a62774a68a1b013cdfc5c4"
+SRCREV_machine_qemuppc ?= "c43425f73287757a166d74464fddf1f5389c9f59"
+SRCREV_machine_qemux86 ?= "c43425f73287757a166d74464fddf1f5389c9f59"
+SRCREV_machine_qemux86-64 ?= "c43425f73287757a166d74464fddf1f5389c9f59"
+SRCREV_machine_qemumips64 ?= "b09e103786fc1a0622e89bac9df4254e6cb96baa"
+SRCREV_machine ?= "c43425f73287757a166d74464fddf1f5389c9f59"
 SRCREV_meta ?= "28bff6d39803ad83f83e353f158fc1aa14d5492d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
-- 
2.5.0


