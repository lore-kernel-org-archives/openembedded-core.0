Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E277F605BF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2016 18:56:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u8UIu2cW021613
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 30 Sep 2016 11:56:03 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Fri, 30 Sep 2016 11:56:01 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 30 Sep 2016 14:56:01 -0400
Message-ID: <1475261761-10621-1-git-send-email-bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto/4.8: mmc configuration for x86*
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
X-List-Received-Date: Fri, 30 Sep 2016 18:56:03 -0000
Content-Type: text/plain

Updating the common-pc* configuration to have the following mmc
configs available by default:

  meta/common-pc-64: use mmc-sdhci feature
  meta/common-pc: use mmc-sdhci feature
  meta: add mmc/mmc-sdhci feature
  meta: add mmc/mmc-block feature
  meta: add mmc/base feature

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.8.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
index 8548af71c4b3..d667860ad0c3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "5e21764783494fe8cafa9a107775040d54a4d4d1"
-SRCREV_meta ?= "d0937e67c3c11fd0e6429bd050a86f6c295560e1"
+SRCREV_meta ?= "ab82ea0e92a1726d5135e2d7541acb958a74b6e5"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.8.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.8;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
index 18214e3925d6..7c175d60b14f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "8edbf10bb6e0759bfb6f18035d1b4773f573d33c"
-SRCREV_meta ?= "d0937e67c3c11fd0e6429bd050a86f6c295560e1"
+SRCREV_meta ?= "ab82ea0e92a1726d5135e2d7541acb958a74b6e5"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.8.bb b/meta/recipes-kernel/linux/linux-yocto_4.8.bb
index cf4b9b729ea1..d4366c1cf4ac 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.8.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "8edbf10bb6e0759bfb6f18035d1b4773f573d33c"
 SRCREV_machine_qemux86-64 ?= "8edbf10bb6e0759bfb6f18035d1b4773f573d33c"
 SRCREV_machine_qemumips64 ?= "dd0e6bc1cb1973d72ff9d3b4ee44a0edc04fea3c"
 SRCREV_machine ?= "8edbf10bb6e0759bfb6f18035d1b4773f573d33c"
-SRCREV_meta ?= "d0937e67c3c11fd0e6429bd050a86f6c295560e1"
+SRCREV_meta ?= "ab82ea0e92a1726d5135e2d7541acb958a74b6e5"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.8.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.8;destsuffix=${KMETA}"
-- 
2.5.0


