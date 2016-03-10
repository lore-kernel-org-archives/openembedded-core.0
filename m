Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 89BBF7317D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Mar 2016 22:01:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u2AM1Ogv024513
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 10 Mar 2016 14:01:24 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Thu, 10 Mar 2016 14:01:23 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 10 Mar 2016 17:01:23 -0500
Message-ID: <1457647283-25104-1-git-send-email-bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH] linux-yocto/4.4: gpio-pca953x: add "drive" property
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
X-List-Received-Date: Thu, 10 Mar 2016 22:01:28 -0000
Content-Type: text/plain

Integrating the following commit for the 4.4 kernel:

[
    gpio-pca953x: add "drive" property

    Galileo gen 2 has support for setting GPIO modes. Expose these
    properties through the GPIO sysfs interface. This approach is
    bit hacky, since it changes the interface semantics.

    The original patch was by Josef Ahmad <josef.ahmad@linux.intel.com>
    and  made on top of kernel 3.8.
]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 18 +++++++++---------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index 268e21501d72..2faad1d5749e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -2,8 +2,8 @@ KBRANCH ?= "standard/preempt-rt"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "e9c6f8ed73f9200b0a134ed473b4246d8cba0c3f"
-SRCREV_meta ?= "0ae928f7664c97fcce9411a6323ee9b376a59996"
+SRCREV_machine ?= "dfa88200087a7ef73741383c05c14ff2f3978947"
+SRCREV_meta ?= "ce5b35bc76bb65d93d0897535c088f51dae4048b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index dc439e954f4b..8a6e921647f5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -9,8 +9,8 @@ LINUX_VERSION ?= "4.4.3"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "66009f8977a62d3bd29d4b89a8e29d1095524aea"
-SRCREV_meta ?= "0ae928f7664c97fcce9411a6323ee9b376a59996"
+SRCREV_machine ?= "3d2455f9da30f923c6bd69014fad4cc4ea738be6"
+SRCREV_meta ?= "ce5b35bc76bb65d93d0897535c088f51dae4048b"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index caa3ba2bdfad..35a9f124776c 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "9ae4dd8747fc85511ebc4b460dd5cc5049abd9c9"
-SRCREV_machine_qemuarm64 ?= "66009f8977a62d3bd29d4b89a8e29d1095524aea"
-SRCREV_machine_qemumips ?= "9f0cb8fa7b1b3e167bb8d70a3433246830ada786"
-SRCREV_machine_qemuppc ?= "66009f8977a62d3bd29d4b89a8e29d1095524aea"
-SRCREV_machine_qemux86 ?= "66009f8977a62d3bd29d4b89a8e29d1095524aea"
-SRCREV_machine_qemux86-64 ?= "66009f8977a62d3bd29d4b89a8e29d1095524aea"
-SRCREV_machine_qemumips64 ?= "d941e61b3aadae55344addb8bbb778a0c72087bc"
-SRCREV_machine ?= "66009f8977a62d3bd29d4b89a8e29d1095524aea"
-SRCREV_meta ?= "0ae928f7664c97fcce9411a6323ee9b376a59996"
+SRCREV_machine_qemuarm ?= "861adc8d32fbb0c1f14fb9b7b67222ab711473a1"
+SRCREV_machine_qemuarm64 ?= "3d2455f9da30f923c6bd69014fad4cc4ea738be6"
+SRCREV_machine_qemumips ?= "0b21ee5897cc49c94f42fca9cea4665f76ae7e0e"
+SRCREV_machine_qemuppc ?= "3d2455f9da30f923c6bd69014fad4cc4ea738be6"
+SRCREV_machine_qemux86 ?= "3d2455f9da30f923c6bd69014fad4cc4ea738be6"
+SRCREV_machine_qemux86-64 ?= "3d2455f9da30f923c6bd69014fad4cc4ea738be6"
+SRCREV_machine_qemumips64 ?= "8b25338045fdb88a9cdff808003102643f03083e"
+SRCREV_machine ?= "3d2455f9da30f923c6bd69014fad4cc4ea738be6"
+SRCREV_meta ?= "ce5b35bc76bb65d93d0897535c088f51dae4048b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
-- 
2.5.0


