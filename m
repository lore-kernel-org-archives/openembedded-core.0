Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BCB867199D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Oct 2016 05:54:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u935sfsp014700
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Sun, 2 Oct 2016 22:54:42 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Sun, 2 Oct 2016 22:54:41 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 3 Oct 2016 01:54:31 -0400
Message-ID: <1fc110f3e037d973cebd35ca0c716a6786bdc7c1.1475473494.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1475473494.git.bruce.ashfield@windriver.com>
References: <cover.1475473494.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/7] linux-yocto/4.1: update to 4.1.33
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
X-List-Received-Date: Mon, 03 Oct 2016 05:54:44 -0000
Content-Type: text/plain

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index 1f38a54bf551..77f1f1bcfef4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "91821a6c3a54fabf964037dd478944a8f3597f88"
-SRCREV_meta ?= "19cafe114e7d35e6202afa1079b32ce600646660"
+SRCREV_machine ?= "3389720cf9809d517de7188308132ef1ec066e55"
+SRCREV_meta ?= "322fa5b2796bfcff7bfbbde1d76c73636ecf5857"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.1.32"
+LINUX_VERSION ?= "4.1.33"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index 5058954a814a..c57949b2aeb6 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.1.32"
+LINUX_VERSION ?= "4.1.33"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "a6b3a8cc120640bf5e528c8558ce060675757fc1"
-SRCREV_meta ?= "19cafe114e7d35e6202afa1079b32ce600646660"
+SRCREV_machine ?= "0c7be943fb59eb9a8d1e57e1fb1aa20aed5fa9cb"
+SRCREV_meta ?= "322fa5b2796bfcff7bfbbde1d76c73636ecf5857"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index 249209d6495f..b2ebe8b26baa 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "a2fde8c9a8b709574b36931f728fb78617892d98"
-SRCREV_machine_qemuarm64 ?= "a6b3a8cc120640bf5e528c8558ce060675757fc1"
-SRCREV_machine_qemumips ?= "33efda07565f45c576671358e75b39dc6a069cbf"
-SRCREV_machine_qemuppc ?= "96b9a39490bc348b36d0de13397a086e66a4b1cb"
-SRCREV_machine_qemux86 ?= "a6b3a8cc120640bf5e528c8558ce060675757fc1"
-SRCREV_machine_qemux86-64 ?= "a6b3a8cc120640bf5e528c8558ce060675757fc1"
-SRCREV_machine_qemumips64 ?= "a46e08c52a6764b0e54f4dbbdfaa3050a379ac4a"
-SRCREV_machine ?= "a6b3a8cc120640bf5e528c8558ce060675757fc1"
-SRCREV_meta ?= "19cafe114e7d35e6202afa1079b32ce600646660"
+SRCREV_machine_qemuarm ?= "a8169bc7216752813a0a8be7d77ec8fcf0d8850e"
+SRCREV_machine_qemuarm64 ?= "0c7be943fb59eb9a8d1e57e1fb1aa20aed5fa9cb"
+SRCREV_machine_qemumips ?= "d12861e340503a14614b655e77d8dcabadb18f8e"
+SRCREV_machine_qemuppc ?= "0e7c356e7c972e0f6f596d7d5f2621a3f68df8e4"
+SRCREV_machine_qemux86 ?= "0c7be943fb59eb9a8d1e57e1fb1aa20aed5fa9cb"
+SRCREV_machine_qemux86-64 ?= "0c7be943fb59eb9a8d1e57e1fb1aa20aed5fa9cb"
+SRCREV_machine_qemumips64 ?= "c14be1d25b733ff6ff47e8f255e8196cf9b3e8c9"
+SRCREV_machine ?= "0c7be943fb59eb9a8d1e57e1fb1aa20aed5fa9cb"
+SRCREV_meta ?= "322fa5b2796bfcff7bfbbde1d76c73636ecf5857"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.1.32"
+LINUX_VERSION ?= "4.1.33"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


