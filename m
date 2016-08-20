Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D60EB77117
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Aug 2016 04:30:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u7K4Ub6t006046
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 19 Aug 2016 21:30:37 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Fri, 19 Aug 2016 21:30:36 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Sat, 20 Aug 2016 00:30:34 -0400
Message-ID: <538614c256cdcee0cd3237f02060736bb693b701.1471667296.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1471667296.git.bruce.ashfield@windriver.com>
References: <cover.1471667296.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] linux-yocto/4.1/4.4: -stable updates and configuration changes
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
X-List-Received-Date: Sat, 20 Aug 2016 04:30:49 -0000
Content-Type: text/plain

Updating the 4.4 kernel to v4.4.18 and the 4.1 kernel to v4.1.30.

We also tweak the configuration with the following commits to remove
warnings being generated from the 4.4 kernel (due to options being
dropped from the final .config):

  features: Create mfd-intel-lpss feature and use where appropriate
  features/iio: Set IIO_BUFFER_CB to =m instead of =y
  features: Add 6lowpan feature and add it where necessary

Tested on qemux86, qemuppc, qemumips and qemuarm.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 20 ++++++++++----------
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 20 ++++++++++----------
 6 files changed, 32 insertions(+), 32 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index 0fd78ff42e50..c31692614d01 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "b1e722634976e1bcf9dc73bcbcfe3487c3fd7e4d"
-SRCREV_meta ?= "497e2eb5c259c4ac434d09555b33da9ed4a8667e"
+SRCREV_machine ?= "b88e2b5805213daeb0136fdd8c840dc0254a3d21"
+SRCREV_meta ?= "3e7c4fbbbc0ca217ddb3d3ee5235d5ad582e0c56"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.1.29"
+LINUX_VERSION ?= "4.1.30"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index 2b10d90c2d3e..dc6bb9af9f3e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "2b65eaade74b9ec3b3009a6939461ea55d646801"
-SRCREV_meta ?= "b030d96c7b8c391a9e155719d649eb0f87358117"
+SRCREV_machine ?= "9135adcfb01432abe4a95a50fca5d0395239f798"
+SRCREV_meta ?= "dab902b4cfa932810bb1dc6de003ed668f935729"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.4.15"
+LINUX_VERSION ?= "4.4.18"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index 485843de62ec..72aac116905e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.1.29"
+LINUX_VERSION ?= "4.1.30"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "053af7be9159a0b5a016a3e399de1484e51f26cd"
-SRCREV_meta ?= "497e2eb5c259c4ac434d09555b33da9ed4a8667e"
+SRCREV_machine ?= "0847ed67f89b5a8bbaaa0a7b6cfa2a99ef34834f"
+SRCREV_meta ?= "3e7c4fbbbc0ca217ddb3d3ee5235d5ad582e0c56"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index 78b148c37253..eb35d299df9f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.4.15"
+LINUX_VERSION ?= "4.4.18"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "ddab242999407fadae68e7ee5381b0ec6679d443"
-SRCREV_meta ?= "b030d96c7b8c391a9e155719d649eb0f87358117"
+SRCREV_machine ?= "0a0c93f29c0d65c00abdd2f6d1eb89134fae9525"
+SRCREV_meta ?= "dab902b4cfa932810bb1dc6de003ed668f935729"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index d3963f95a82f..6b75a8a6892b 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "09b5eed6e905503646514803787d82f504013144"
-SRCREV_machine_qemuarm64 ?= "053af7be9159a0b5a016a3e399de1484e51f26cd"
-SRCREV_machine_qemumips ?= "582073e7a49b0847052be78254805f33635dc837"
-SRCREV_machine_qemuppc ?= "0914d10f46f22582e955b06590768ec51e8a91c3"
-SRCREV_machine_qemux86 ?= "053af7be9159a0b5a016a3e399de1484e51f26cd"
-SRCREV_machine_qemux86-64 ?= "053af7be9159a0b5a016a3e399de1484e51f26cd"
-SRCREV_machine_qemumips64 ?= "ca25d7656f7eaeb8454a182cfa38fb704ec85276"
-SRCREV_machine ?= "053af7be9159a0b5a016a3e399de1484e51f26cd"
-SRCREV_meta ?= "497e2eb5c259c4ac434d09555b33da9ed4a8667e"
+SRCREV_machine_qemuarm ?= "9c5e96205316d167379d101d808a6cda93adc335"
+SRCREV_machine_qemuarm64 ?= "0847ed67f89b5a8bbaaa0a7b6cfa2a99ef34834f"
+SRCREV_machine_qemumips ?= "9e531cb59dd7dfa2026637cc456a7bdcbdb50275"
+SRCREV_machine_qemuppc ?= "32968ddd9357f72dfd427f5b3eda62c4a49833c7"
+SRCREV_machine_qemux86 ?= "0847ed67f89b5a8bbaaa0a7b6cfa2a99ef34834f"
+SRCREV_machine_qemux86-64 ?= "0847ed67f89b5a8bbaaa0a7b6cfa2a99ef34834f"
+SRCREV_machine_qemumips64 ?= "106ed721d21c595dfb993a8990c3a29830dfc166"
+SRCREV_machine ?= "0847ed67f89b5a8bbaaa0a7b6cfa2a99ef34834f"
+SRCREV_meta ?= "3e7c4fbbbc0ca217ddb3d3ee5235d5ad582e0c56"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.1.29"
+LINUX_VERSION ?= "4.1.30"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index 170f34cb1966..2ec62e7fd635 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "c2507bd62854f90030433307a3d783474332f821"
-SRCREV_machine_qemuarm64 ?= "ddab242999407fadae68e7ee5381b0ec6679d443"
-SRCREV_machine_qemumips ?= "e42198f28a2c3e57ef64a0f5ccfdeed906d1c257"
-SRCREV_machine_qemuppc ?= "ddab242999407fadae68e7ee5381b0ec6679d443"
-SRCREV_machine_qemux86 ?= "ddab242999407fadae68e7ee5381b0ec6679d443"
-SRCREV_machine_qemux86-64 ?= "ddab242999407fadae68e7ee5381b0ec6679d443"
-SRCREV_machine_qemumips64 ?= "2d0080f2350e088bdc6129c376eb9e2654a0448a"
-SRCREV_machine ?= "ddab242999407fadae68e7ee5381b0ec6679d443"
-SRCREV_meta ?= "b030d96c7b8c391a9e155719d649eb0f87358117"
+SRCREV_machine_qemuarm ?= "81cae0bb962c278b7fd616ce94b0a1ea21b9a938"
+SRCREV_machine_qemuarm64 ?= "0a0c93f29c0d65c00abdd2f6d1eb89134fae9525"
+SRCREV_machine_qemumips ?= "92bae966ed0bdf4bd8c8343978f83b80b8fa9981"
+SRCREV_machine_qemuppc ?= "0a0c93f29c0d65c00abdd2f6d1eb89134fae9525"
+SRCREV_machine_qemux86 ?= "0a0c93f29c0d65c00abdd2f6d1eb89134fae9525"
+SRCREV_machine_qemux86-64 ?= "0a0c93f29c0d65c00abdd2f6d1eb89134fae9525"
+SRCREV_machine_qemumips64 ?= "aa125473aef74e7731b14f6b56c1b50589fcd668"
+SRCREV_machine ?= "0a0c93f29c0d65c00abdd2f6d1eb89134fae9525"
+SRCREV_meta ?= "dab902b4cfa932810bb1dc6de003ed668f935729"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.4.15"
+LINUX_VERSION ?= "4.4.18"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


