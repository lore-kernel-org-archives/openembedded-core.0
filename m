Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1839273218
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 22:10:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u1TMAVH1025892
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 29 Feb 2016 14:10:31 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Mon, 29 Feb 2016 14:10:30 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 29 Feb 2016 17:10:21 -0500
Message-ID: <43ae4c09de54d725cd9b54d7664c40473d7d21a9.1456782981.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1456782981.git.bruce.ashfield@windriver.com>
References: <cover.1456782981.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org, california.l.sullivan@intel.com,
	saul.wold@intel.com
Subject: [PATCH 1/8] linux-yocto/4.1: Galileo updates
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
X-List-Received-Date: Mon, 29 Feb 2016 22:10:33 -0000
Content-Type: text/plain

Integrating the following patches for improved galileo support:

  e02ac252f68d gpio-pca953x: add "drive" property.
  68d3fd5134f7 adc1x8s102: support ACPI-based enumeration.
  89f6aea44d01 staging:iio: add support for ADC1x8s102.
  2fb3159a70c0 spi-pxa2xx: fixed ACPI-based enumeration of SPI devices.
  510501941fd3 pca9685: PCA9685 PWM and GPIO multi-function device.
  94bfb66b8887 gpio: pca953x: provide GPIO base based on _UID
  c39f26cd9092 acpi: added a custom DSDT file.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 16 ++++++++--------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index 3dd8959895df..4ec9cc4c2cfb 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -2,7 +2,7 @@ KBRANCH ?= "standard/preempt-rt/base"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "132d72a980837eccc082d5dfb9c5eb5596611b0b"
+SRCREV_machine ?= "4892b47c7f92a8a332e75596ec7c8d8204bd1709"
 SRCREV_meta ?= "79dbb64d9e179718369a7a5c7b364fda9936571f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index 4fde066eebbc..c84fb2dc6324 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "4.1.17"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "bdf4565e5dcc1ad65e26cebdff7bf427289f1d61"
+SRCREV_machine ?= "e02ac252f68dca39c8fa06c8517dd805e75aed87"
 SRCREV_meta ?= "79dbb64d9e179718369a7a5c7b364fda9936571f"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index 9f3ad5c66381..1a3842c9c113 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "fc38bc54e15ab2943507b63e740c576f5537fbc0"
-SRCREV_machine_qemuarm64 ?= "bdf4565e5dcc1ad65e26cebdff7bf427289f1d61"
-SRCREV_machine_qemumips ?= "d7d76bf246979d635990a05961886292ddcb5600"
-SRCREV_machine_qemuppc ?= "bdf4565e5dcc1ad65e26cebdff7bf427289f1d61"
-SRCREV_machine_qemux86 ?= "bdf4565e5dcc1ad65e26cebdff7bf427289f1d61"
-SRCREV_machine_qemux86-64 ?= "bdf4565e5dcc1ad65e26cebdff7bf427289f1d61"
-SRCREV_machine_qemumips64 ?= "84dd3ffed15ebb59e6d396343ced2450f0f10379"
-SRCREV_machine ?= "bdf4565e5dcc1ad65e26cebdff7bf427289f1d61"
+SRCREV_machine_qemuarm ?= "de3a57fd015b3eca12d65530efc6a2cb59226d25"
+SRCREV_machine_qemuarm64 ?= "e02ac252f68dca39c8fa06c8517dd805e75aed87"
+SRCREV_machine_qemumips ?= "d00db934de0fa0ddb5811bb91d62c1c26e2bed95"
+SRCREV_machine_qemuppc ?= "e02ac252f68dca39c8fa06c8517dd805e75aed87"
+SRCREV_machine_qemux86 ?= "e02ac252f68dca39c8fa06c8517dd805e75aed87"
+SRCREV_machine_qemux86-64 ?= "e02ac252f68dca39c8fa06c8517dd805e75aed87"
+SRCREV_machine_qemumips64 ?= "aa673476922c02c6caef5c1d65e59f03259a596d"
+SRCREV_machine ?= "e02ac252f68dca39c8fa06c8517dd805e75aed87"
 SRCREV_meta ?= "79dbb64d9e179718369a7a5c7b364fda9936571f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
-- 
2.5.0


