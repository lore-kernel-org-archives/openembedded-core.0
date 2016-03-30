Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 354FA7017D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 12:25:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u2UCPIOB006952
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 05:25:18 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 30 Mar 2016 05:25:17 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Mar 2016 08:25:07 -0400
Message-ID: <f9cdaa7bc1d216da336d6417cf73c956300fac53.1459340441.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1459340441.git.bruce.ashfield@windriver.com>
References: <cover.1459340441.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 9/9] linux-yocto: add overlayfs feature
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
X-List-Received-Date: Wed, 30 Mar 2016 12:25:17 -0000
Content-Type: text/plain

To let overlayfs be used like aufs, we create a feature
fragment. Configurations that want this union FS type, can
enable it via KERNEL_FEATURES.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index 5c66c199ae44..48025c48af02 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -3,7 +3,7 @@ KBRANCH ?= "standard/preempt-rt"
 require recipes-kernel/linux/linux-yocto.inc
 
 SRCREV_machine ?= "5ff13cb449701bfeb30ea4a0c4c0b86dc680e219"
-SRCREV_meta ?= "28bff6d39803ad83f83e353f158fc1aa14d5492d"
+SRCREV_meta ?= "770996a263e22562c81f48fde0f0dc647156abce"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index 8c8cd9842bf3..7583f8019f07 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "c43425f73287757a166d74464fddf1f5389c9f59"
-SRCREV_meta ?= "28bff6d39803ad83f83e353f158fc1aa14d5492d"
+SRCREV_meta ?= "770996a263e22562c81f48fde0f0dc647156abce"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index af7daba41512..3d6991e8998a 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "c43425f73287757a166d74464fddf1f5389c9f59"
 SRCREV_machine_qemux86-64 ?= "c43425f73287757a166d74464fddf1f5389c9f59"
 SRCREV_machine_qemumips64 ?= "b09e103786fc1a0622e89bac9df4254e6cb96baa"
 SRCREV_machine ?= "c43425f73287757a166d74464fddf1f5389c9f59"
-SRCREV_meta ?= "28bff6d39803ad83f83e353f158fc1aa14d5492d"
+SRCREV_meta ?= "770996a263e22562c81f48fde0f0dc647156abce"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
-- 
2.5.0


