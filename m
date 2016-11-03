Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 81D2671BB1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Nov 2016 13:25:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uA3DPLXB003950
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 3 Nov 2016 06:25:21 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Thu, 3 Nov 2016 06:25:21 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 3 Nov 2016 09:25:16 -0400
Message-ID: <10f6bb10612c3c881f9939f2ef1306220e45b490.1478179369.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1478179369.git.bruce.ashfield@windriver.com>
References: <cover.1478179369.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] linux-yocto/4.1: update to v4.1.35
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
X-List-Received-Date: Thu, 03 Nov 2016 13:25:21 -0000
Content-Type: text/plain

Updating to the korg -stable release.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index b95fb5857725..d15a4dcb195d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "966ddde490030166010c5770f8f86cdd0e961c76"
-SRCREV_meta ?= "3c3197e65b6f2f5514853c1fe78ae8ffc131b02c"
+SRCREV_machine ?= "5395c3b5960ec1b769c0716f2889ef1101b66588"
+SRCREV_meta ?= "89785d2b18fa49233046125fddee8e161c8bec4d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.1.33"
+LINUX_VERSION ?= "4.1.35"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index ba01702cb63e..5d5e1fa945b9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.1.33"
+LINUX_VERSION ?= "4.1.35"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "f4d0900b2851e829e990e0f64b09ed3b8e355fae"
-SRCREV_meta ?= "3c3197e65b6f2f5514853c1fe78ae8ffc131b02c"
+SRCREV_machine ?= "f358ce2569953d18cf6bd91d0269076938e5b091"
+SRCREV_meta ?= "89785d2b18fa49233046125fddee8e161c8bec4d"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index 788a8eaaa8be..529c20737238 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "d67ef485ce1420df11bda2d9f6fb78ef50c1adff"
-SRCREV_machine_qemuarm64 ?= "f4d0900b2851e829e990e0f64b09ed3b8e355fae"
-SRCREV_machine_qemumips ?= "65116339cfd210990c9c4710cdfec3ebd59abb0e"
-SRCREV_machine_qemuppc ?= "30816907653b57f1f3d5f9a7a2f6339bab14a680"
-SRCREV_machine_qemux86 ?= "f4d0900b2851e829e990e0f64b09ed3b8e355fae"
-SRCREV_machine_qemux86-64 ?= "f4d0900b2851e829e990e0f64b09ed3b8e355fae"
-SRCREV_machine_qemumips64 ?= "f7a0b532b6ac81757d85b0c9a928f45a87c9e364"
-SRCREV_machine ?= "f4d0900b2851e829e990e0f64b09ed3b8e355fae"
-SRCREV_meta ?= "3c3197e65b6f2f5514853c1fe78ae8ffc131b02c"
+SRCREV_machine_qemuarm ?= "bb6c714397ab4c48f4fcc76c0a609afbb42dfa2a"
+SRCREV_machine_qemuarm64 ?= "f358ce2569953d18cf6bd91d0269076938e5b091"
+SRCREV_machine_qemumips ?= "4a42cbc6464c592a8ce81cf9aefb780df02e10ac"
+SRCREV_machine_qemuppc ?= "f0ecbfc7c5c24f0ecdd05e3304f0bea302ed116c"
+SRCREV_machine_qemux86 ?= "f358ce2569953d18cf6bd91d0269076938e5b091"
+SRCREV_machine_qemux86-64 ?= "f358ce2569953d18cf6bd91d0269076938e5b091"
+SRCREV_machine_qemumips64 ?= "9162b0e9523407b638a3f7e2ed26450334e24969"
+SRCREV_machine ?= "f358ce2569953d18cf6bd91d0269076938e5b091"
+SRCREV_meta ?= "89785d2b18fa49233046125fddee8e161c8bec4d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.1.33"
+LINUX_VERSION ?= "4.1.35"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


