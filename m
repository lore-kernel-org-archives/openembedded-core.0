Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3FC077826D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 02:58:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7L2wOch001416
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Sun, 20 Aug 2017 19:58:25 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Sun, 20 Aug 2017 19:58:24 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Sun, 20 Aug 2017 22:58:14 -0400
Message-ID: <f67c882a8b3f2d43c4173c1cf1c747e02e00bbf3.1503283308.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1503283308.git.bruce.ashfield@windriver.com>
References: <cover.1503283308.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/9] kernel-yocto: configuration updates: x86 features
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
X-List-Received-Date: Mon, 21 Aug 2017 02:58:25 -0000
Content-Type: text/plain

Integrating the following kernel configuration changes:

 f7fbd4185e5 features/qat: additional configurations, CONFIG_CRYPTO_RSA and CONFIG_CRYPTO_DH
 50c62581d283 features/netfilter: additional configurations
 d67e4ed89556 features/x2apic: add X2APIC feature
 7889b28c5300 features/vfio: add VFIO feature
 dc4ec998757e features/numa: Add NUMA feature
 c88c18de4ca8 features/mtd: add MTD feature
 9035571d32ee features/iommu: add IOMMU feature
 6f3b16136f55 features/intel-txt: add intel-txt feature
 4936a5f508f0 common-pc-wifi: Enable SDIO for BroadCom BRCMFMAC

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb    | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb  | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.10.bb      | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.9.bb       | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
index e804d8953397..132c898d6d4b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "6648a34e00c55a0634b39e661dd6ba14dd106473"
-SRCREV_meta ?= "e92bd55409a6ded89642f5ac22391487364ac798"
+SRCREV_meta ?= "ba079c7ed914d6502351da16c6b4ccf1e285ebdc"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.10.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.10;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
index 6e18bd9628a2..c1444cb03990 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "1fb4e1d1e3f727fc20963fc631a259665bd4665b"
-SRCREV_meta ?= "0db0b4a408f05cfed359983d7ff63b1a6e29be2c"
+SRCREV_meta ?= "5ea1dcf54080af3b06678f2eab8beb8194a3b1ae"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb
index f58799be9139..30cf86336675 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "6648a34e00c55a0634b39e661dd6ba14dd106473"
-SRCREV_meta ?= "e92bd55409a6ded89642f5ac22391487364ac798"
+SRCREV_meta ?= "ba079c7ed914d6502351da16c6b4ccf1e285ebdc"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
index da5b2ea970aa..21ba5c4c71b0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "24572abb2cad341dd79e6aafcb9cdd1a7f8a0c1e"
-SRCREV_meta ?= "0db0b4a408f05cfed359983d7ff63b1a6e29be2c"
+SRCREV_meta ?= "5ea1dcf54080af3b06678f2eab8beb8194a3b1ae"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.10.bb b/meta/recipes-kernel/linux/linux-yocto_4.10.bb
index f3966d4fa588..a73ae14e4c9a 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.10.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "6648a34e00c55a0634b39e661dd6ba14dd106473"
 SRCREV_machine_qemux86-64 ?= "6648a34e00c55a0634b39e661dd6ba14dd106473"
 SRCREV_machine_qemumips64 ?= "b442c964432938cbe10c4cc578260353045af980"
 SRCREV_machine ?= "6648a34e00c55a0634b39e661dd6ba14dd106473"
-SRCREV_meta ?= "e92bd55409a6ded89642f5ac22391487364ac798"
+SRCREV_meta ?= "ba079c7ed914d6502351da16c6b4ccf1e285ebdc"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.10.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.10;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.9.bb b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
index 563c33d1ca16..32d5549e7582 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "24572abb2cad341dd79e6aafcb9cdd1a7f8a0c1e"
 SRCREV_machine_qemux86-64 ?= "24572abb2cad341dd79e6aafcb9cdd1a7f8a0c1e"
 SRCREV_machine_qemumips64 ?= "7c9ce18e05e1d84df17e677b26133671ec0430f5"
 SRCREV_machine ?= "24572abb2cad341dd79e6aafcb9cdd1a7f8a0c1e"
-SRCREV_meta ?= "0db0b4a408f05cfed359983d7ff63b1a6e29be2c"
+SRCREV_meta ?= "5ea1dcf54080af3b06678f2eab8beb8194a3b1ae"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
-- 
2.5.0


