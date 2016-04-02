Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0A91B7706A
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Apr 2016 00:09:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u3209TKx002589
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 1 Apr 2016 17:09:29 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Fri, 1 Apr 2016 17:09:28 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 1 Apr 2016 20:09:19 -0400
Message-ID: <b653c55040aa4b726ecf237a7058c1d017f2ee2c.1459555221.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1459555221.git.bruce.ashfield@windriver.com>
References: <cover.1459555221.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/8] linux-yocto/4.1: telemetry and dmaengine backports
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
X-List-Received-Date: Sat, 02 Apr 2016 00:09:30 -0000
Content-Type: text/plain

Backports to support Broxton and Apollo lake:

96c0e80f4007 dmaengine: idma64: clear LLP_[SD]_EN bits in last descriptor
3b2dbd1cadbf dmaengine: idma64: use local variable to index descriptor
d61599f94946 dmaengine: idma64: convert idma64_hw_desc_fill() to return void
9c9f37533789 dmaengine: idma64: set maximum allowed segment size for DMA
9d55c9523aa5 dmaengine: idma64: drop IRQ enable / disable in handler
f80e3f3f87c5 dmaengine: idma64: use lo_hi_readq() / lo_hi_writeq()
216429c319aa dmaengine: idma64: make better performance on pause / resume
2f982603b358 dmaengine: idma64: this is not DesignWare
a7f7ee3a6a91 dmaengine: idma64: useless use of min_t()
3c8f2fcd2dfd dmaengine: idma64: convert to __ffs()
b452447dce9f dmaengine: idma64: improve residue estimation
849fdbe687a8 dmaengine: add a driver for Intel integrated DMA 64-bit
0038e6a4798e intel_punit_ipc: add NULL check for input parameters
4bd7fc987da6 platform:x86: Add Intel telemetry platform device
472c405dd66d intel_pmc_ipc: update acpi resource structure for Punit
e1754195568b MAINTAINERS: Combine multiple telemetry entries
14d8e14aca6d intel_telemetry_debugfs: Fix unused warnings in telemetry debugfs
8724677a6b60 platform:x86: Add Intel Telemetry Debugfs interfaces
d503a325c0ee platform:x86: Add Intel telemetry platform driver
255a8ac345e7 platform/x86: Add Intel Telemetry Core Driver
c475943802b5 platform:x86: add Intel P-Unit mailbox IPC driver
c2f1b2c7282c MAINTAINERS: Add maintainership for MIC drivers
7d389b483d32 surface pro 3: Add support driver for Surface Pro 3 buttons

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 16 ++++++++--------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index 48f9f08957bc..468358b08a4b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -2,7 +2,7 @@ KBRANCH ?= "standard/preempt-rt/base"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "23325988c373852d75515cfa9582681a036d1bfd"
+SRCREV_machine ?= "7ffcde760a73f672bccb1c43130667d30ba7195c"
 SRCREV_meta ?= "b9023d4c8fbbb854c26f158a079a5f54dd61964d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index 13c30c70cbf0..12f572cc405e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "4.1.18"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "afaf425e796c6b72c10e869ea6ad20295033f956"
+SRCREV_machine ?= "96c0e80f4007cce8d4f559a23f7a22da156ccbe2"
 SRCREV_meta ?= "b9023d4c8fbbb854c26f158a079a5f54dd61964d"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index 2841aa211cc8..5f0559f0683d 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "4f8fe4c56eb352573a19b797d2c4d1b1f4e38831"
-SRCREV_machine_qemuarm64 ?= "afaf425e796c6b72c10e869ea6ad20295033f956"
-SRCREV_machine_qemumips ?= "85f5c8b85364ea8e7f8d47a492c7047bfd9aa963"
-SRCREV_machine_qemuppc ?= "afaf425e796c6b72c10e869ea6ad20295033f956"
-SRCREV_machine_qemux86 ?= "afaf425e796c6b72c10e869ea6ad20295033f956"
-SRCREV_machine_qemux86-64 ?= "afaf425e796c6b72c10e869ea6ad20295033f956"
-SRCREV_machine_qemumips64 ?= "8ac723e2fb023bd3b168d3fb914c09797bc20ed4"
-SRCREV_machine ?= "afaf425e796c6b72c10e869ea6ad20295033f956"
+SRCREV_machine_qemuarm ?= "ecabd4f1cf9b1e6279943c8e93eff58095296fb6"
+SRCREV_machine_qemuarm64 ?= "96c0e80f4007cce8d4f559a23f7a22da156ccbe2"
+SRCREV_machine_qemumips ?= "8fd9efe95598ddf89ec432a967a38f02b2906a8b"
+SRCREV_machine_qemuppc ?= "96c0e80f4007cce8d4f559a23f7a22da156ccbe2"
+SRCREV_machine_qemux86 ?= "96c0e80f4007cce8d4f559a23f7a22da156ccbe2"
+SRCREV_machine_qemux86-64 ?= "96c0e80f4007cce8d4f559a23f7a22da156ccbe2"
+SRCREV_machine_qemumips64 ?= "cb16b5365e26e106d56a6f8ed23eb8b57905ecf8"
+SRCREV_machine ?= "96c0e80f4007cce8d4f559a23f7a22da156ccbe2"
 SRCREV_meta ?= "b9023d4c8fbbb854c26f158a079a5f54dd61964d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
-- 
2.5.0


