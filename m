Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 61293731C6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Feb 2016 15:08:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u1BF8IIt010748
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 11 Feb 2016 07:08:18 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Thu, 11 Feb 2016 07:08:18 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 11 Feb 2016 10:08:14 -0500
Message-ID: <ca26e85a294940ef7d7a02b6292ccca669dae4b6.1455203165.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1455203165.git.bruce.ashfield@windriver.com>
References: <cover.1455203165.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 1/3] linux-yocto/4.4: update to v4.4.1
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
X-List-Received-Date: Thu, 11 Feb 2016 15:08:19 -0000
Content-Type: text/plain

Integrating the 4.4.1 stable korg update.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index 3c3c0c5523a0..35c4e2fa05f4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -2,13 +2,13 @@ KBRANCH ?= "standard/preempt-rt"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "49a18bd230aafabe793de56d3c96d62f891e77dc"
-SRCREV_meta ?= "dc760c3189ed868dc59050206b7899c35a4ad8e8"
+SRCREV_machine ?= "b90e0f8ee29395bbeb1d4b1dc06d4a78063f2c36"
+SRCREV_meta ?= "4940c6e551c1eea41a5dbc69a90b23d5f835fa5b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.4"
+LINUX_VERSION ?= "4.4.1"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index 6ecd0b97e943..beeab9d14389 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.4"
+LINUX_VERSION ?= "4.4.1"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "57af322eecf5750f8f09cb8b093d613caede5c48"
-SRCREV_meta ?= "dc760c3189ed868dc59050206b7899c35a4ad8e8"
+SRCREV_machine ?= "0194c765861157b95de80fa7c27ebb6b51c16dd6"
+SRCREV_meta ?= "4940c6e551c1eea41a5dbc69a90b23d5f835fa5b"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index be43a212f81b..1beeea669850 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "f7bc1fb5f438f019bcd3d5fd8362e0960ed0fffc"
-SRCREV_machine_qemuarm64 ?= "57af322eecf5750f8f09cb8b093d613caede5c48"
-SRCREV_machine_qemumips ?= "5b05677721ce8b0625a7e155dcdf93325fc460fe"
-SRCREV_machine_qemuppc ?= "57af322eecf5750f8f09cb8b093d613caede5c48"
-SRCREV_machine_qemux86 ?= "57af322eecf5750f8f09cb8b093d613caede5c48"
-SRCREV_machine_qemux86-64 ?= "57af322eecf5750f8f09cb8b093d613caede5c48"
-SRCREV_machine_qemumips64 ?= "ac3f6e9508fb6963e9db844fe28b7a50589decc4"
-SRCREV_machine ?= "57af322eecf5750f8f09cb8b093d613caede5c48"
-SRCREV_meta ?= "dc760c3189ed868dc59050206b7899c35a4ad8e8"
+SRCREV_machine_qemuarm ?= "fae04a40c8bcdf27b237d7d288ddcad71976a7b3"
+SRCREV_machine_qemuarm64 ?= "0194c765861157b95de80fa7c27ebb6b51c16dd6"
+SRCREV_machine_qemumips ?= "beedcf740b175cdd0ecc7a8c473c0b518f329c33"
+SRCREV_machine_qemuppc ?= "0194c765861157b95de80fa7c27ebb6b51c16dd6"
+SRCREV_machine_qemux86 ?= "0194c765861157b95de80fa7c27ebb6b51c16dd6"
+SRCREV_machine_qemux86-64 ?= "0194c765861157b95de80fa7c27ebb6b51c16dd6"
+SRCREV_machine_qemumips64 ?= "25c3d2617df1947b3d69e480e88ba75881c7ca71"
+SRCREV_machine ?= "0194c765861157b95de80fa7c27ebb6b51c16dd6"
+SRCREV_meta ?= "4940c6e551c1eea41a5dbc69a90b23d5f835fa5b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.4"
+LINUX_VERSION ?= "4.4.1"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.1.0


