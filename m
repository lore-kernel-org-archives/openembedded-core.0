Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3078B78335
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Nov 2017 02:45:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vA32jalG027358
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 2 Nov 2017 19:45:36 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Thu, 2 Nov 2017 19:45:36 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 2 Nov 2017 22:45:26 -0400
Message-ID: <7632b5c3a8ded0596963825cc5f488d01e944ffa.1509676901.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1509676901.git.bruce.ashfield@windriver.com>
References: <cover.1509676901.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/9] linux-yocto/4.12: configuration and feature updates
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
X-List-Received-Date: Fri, 03 Nov 2017 02:45:36 -0000
Content-Type: text/plain

Integrating features and new configurations for the 4.12 kernel.
With this update, a CGL-ready kernel can be configured out of
the box.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_4.12.bb      | 18 +++++++++---------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
index c49a9340f8e2..d5b97148246f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "16de0149674ed12d983b77a453852ac2e64584b4"
-SRCREV_meta ?= "eda4d18ce4b259c84ccd5c249c3dc5958c16928c"
+SRCREV_machine ?= "abc6bf6010cae7127b5849ce83b60f244024408f"
+SRCREV_meta ?= "73365069d89a8423a6f9f4b5560ee6bfdfc0b3d1"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
index ba67af357e95..5dddc49d7c4f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
@@ -9,8 +9,8 @@ LINUX_VERSION ?= "4.12.12"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "16de0149674ed12d983b77a453852ac2e64584b4"
-SRCREV_meta ?= "eda4d18ce4b259c84ccd5c249c3dc5958c16928c"
+SRCREV_machine ?= "abc6bf6010cae7127b5849ce83b60f244024408f"
+SRCREV_meta ?= "73365069d89a8423a6f9f4b5560ee6bfdfc0b3d1"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.12.bb b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
index a2624090d3f8..10b0e803a9b1 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
@@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "67b62d8d7bd9f19f0f4fad044787d947ebc4ec25"
-SRCREV_machine_qemuarm64 ?= "16de0149674ed12d983b77a453852ac2e64584b4"
-SRCREV_machine_qemumips ?= "371926551d44c140a0fb869cec34762b40bdf1a6"
-SRCREV_machine_qemuppc ?= "16de0149674ed12d983b77a453852ac2e64584b4"
-SRCREV_machine_qemux86 ?= "16de0149674ed12d983b77a453852ac2e64584b4"
-SRCREV_machine_qemux86-64 ?= "16de0149674ed12d983b77a453852ac2e64584b4"
-SRCREV_machine_qemumips64 ?= "9d63d9c11c44ceabd452d7ee49cf55a88c39383f"
-SRCREV_machine ?= "16de0149674ed12d983b77a453852ac2e64584b4"
-SRCREV_meta ?= "eda4d18ce4b259c84ccd5c249c3dc5958c16928c"
+SRCREV_machine_qemuarm ?= "1e1376104bff5a42b4cb02d5086f98f69cb5b835"
+SRCREV_machine_qemuarm64 ?= "abc6bf6010cae7127b5849ce83b60f244024408f"
+SRCREV_machine_qemumips ?= "0b4d515ecab39edc197039450e8386525cdb616e"
+SRCREV_machine_qemuppc ?= "abc6bf6010cae7127b5849ce83b60f244024408f"
+SRCREV_machine_qemux86 ?= "abc6bf6010cae7127b5849ce83b60f244024408f"
+SRCREV_machine_qemux86-64 ?= "abc6bf6010cae7127b5849ce83b60f244024408f"
+SRCREV_machine_qemumips64 ?= "8e7c9bd1fe585e22952b6772cb61f2aed6a09e83"
+SRCREV_machine ?= "abc6bf6010cae7127b5849ce83b60f244024408f"
+SRCREV_meta ?= "73365069d89a8423a6f9f4b5560ee6bfdfc0b3d1"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
-- 
2.5.0


