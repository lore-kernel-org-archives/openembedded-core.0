Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 96326731A5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Mar 2016 17:06:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u2AH6ZMF011935
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 10 Mar 2016 09:06:35 -0800
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Thu, 10 Mar 2016 09:06:34 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 10 Mar 2016 12:06:33 -0500
Message-ID: <1457629593-23213-1-git-send-email-bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: saul.wold@intel.com, openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto/4.4: Galileo updates
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
X-List-Received-Date: Thu, 10 Mar 2016 17:06:37 -0000
Content-Type: text/plain

Integrating the following patches for improved galileo support:

  66009f8977a6 adc1x8s102: support ACPI-based enumeration.
  903003b78c13 staging:iio: add support for ADC1x8s102.
  cd83f4095b23 spi-pxa2xx: fixed ACPI-based enumeration of SPI devices.
  c4efe23b7f93 pca9685: PCA9685 PWM and GPIO multi-function device.
  81e166ec0a35 gpio: pca953x: provide GPIO base based on _UID
  4086f8c34956 acpi: added a custom DSDT file.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 18 +++++++++---------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index eeca178f616f..268e21501d72 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -2,8 +2,8 @@ KBRANCH ?= "standard/preempt-rt"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "19e3ed348aefd0802dc8747cc143bea1155edc12"
-SRCREV_meta ?= "89419d8b902aa81cb4c52f9dd12a6c9e083ce198"
+SRCREV_machine ?= "e9c6f8ed73f9200b0a134ed473b4246d8cba0c3f"
+SRCREV_meta ?= "0ae928f7664c97fcce9411a6323ee9b376a59996"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index b14eeaf1980b..dc439e954f4b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -9,8 +9,8 @@ LINUX_VERSION ?= "4.4.3"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "dadb4369046246d7788db1f3cdf0a34298e35b4b"
-SRCREV_meta ?= "89419d8b902aa81cb4c52f9dd12a6c9e083ce198"
+SRCREV_machine ?= "66009f8977a62d3bd29d4b89a8e29d1095524aea"
+SRCREV_meta ?= "0ae928f7664c97fcce9411a6323ee9b376a59996"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index 9d87b09efe4a..caa3ba2bdfad 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "d3ce63d0c83f579605b308f83c62a49e5dbf73e6"
-SRCREV_machine_qemuarm64 ?= "dadb4369046246d7788db1f3cdf0a34298e35b4b"
-SRCREV_machine_qemumips ?= "06c34af69f436c8dca8ff23a30a7d1f834e1d07c"
-SRCREV_machine_qemuppc ?= "dadb4369046246d7788db1f3cdf0a34298e35b4b"
-SRCREV_machine_qemux86 ?= "dadb4369046246d7788db1f3cdf0a34298e35b4b"
-SRCREV_machine_qemux86-64 ?= "dadb4369046246d7788db1f3cdf0a34298e35b4b"
-SRCREV_machine_qemumips64 ?= "79b496614c5d0b4862796928ef9890f2eb375a3b"
-SRCREV_machine ?= "dadb4369046246d7788db1f3cdf0a34298e35b4b"
-SRCREV_meta ?= "89419d8b902aa81cb4c52f9dd12a6c9e083ce198"
+SRCREV_machine_qemuarm ?= "9ae4dd8747fc85511ebc4b460dd5cc5049abd9c9"
+SRCREV_machine_qemuarm64 ?= "66009f8977a62d3bd29d4b89a8e29d1095524aea"
+SRCREV_machine_qemumips ?= "9f0cb8fa7b1b3e167bb8d70a3433246830ada786"
+SRCREV_machine_qemuppc ?= "66009f8977a62d3bd29d4b89a8e29d1095524aea"
+SRCREV_machine_qemux86 ?= "66009f8977a62d3bd29d4b89a8e29d1095524aea"
+SRCREV_machine_qemux86-64 ?= "66009f8977a62d3bd29d4b89a8e29d1095524aea"
+SRCREV_machine_qemumips64 ?= "d941e61b3aadae55344addb8bbb778a0c72087bc"
+SRCREV_machine ?= "66009f8977a62d3bd29d4b89a8e29d1095524aea"
+SRCREV_meta ?= "0ae928f7664c97fcce9411a6323ee9b376a59996"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
-- 
2.5.0


