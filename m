Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8B6E771B65
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 03:15:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u9Q3Fq5a015020
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 25 Oct 2016 20:15:52 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 25 Oct 2016 20:15:51 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 25 Oct 2016 23:15:51 -0400
Message-ID: <1477451751-5663-1-git-send-email-bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto/4.8: sync preempt-rt with upstream project
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
X-List-Received-Date: Wed, 26 Oct 2016 03:15:52 -0000
Content-Type: text/plain

The initial 4.8 -rt feature was directly from Paul Gortmaker, and
now the 'upstream' -rt has done a release on the same kernel
version.

Paul has sync'd the initial effort with the upstream work, and we
now have a consolidated standard/preempt-rt/*

Along with the rsync'd content, Paul has fixed -rt boot on 32 bit
x86.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb   | 4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.8.bb      | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
index 00c3d2c7bc1f..e51c9cdcca0e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "320bceb35315d118c1e209effd441eb8a8dbad57"
-SRCREV_meta ?= "6d028d2818603cd82cfb707b3231b8a9038f13bb"
+SRCREV_machine ?= "4057556c041f6aac0d29aa3425587d414c9a0090"
+SRCREV_meta ?= "83110d94edeb856a3667b62903ed4ae91c24117d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.8.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.8;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
index 799c3f37577d..c8ddbd93dc7f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "1adf9d36338dc3c63cdbf6f98bcbdc7bba42a794"
-SRCREV_meta ?= "6d028d2818603cd82cfb707b3231b8a9038f13bb"
+SRCREV_meta ?= "83110d94edeb856a3667b62903ed4ae91c24117d"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.8.bb b/meta/recipes-kernel/linux/linux-yocto_4.8.bb
index 56fbfc7001bf..13778b9c4db6 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.8.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "1adf9d36338dc3c63cdbf6f98bcbdc7bba42a794"
 SRCREV_machine_qemux86-64 ?= "1adf9d36338dc3c63cdbf6f98bcbdc7bba42a794"
 SRCREV_machine_qemumips64 ?= "64f96ba530e58456070f26b0f3fcce3f64988b72"
 SRCREV_machine ?= "1adf9d36338dc3c63cdbf6f98bcbdc7bba42a794"
-SRCREV_meta ?= "6d028d2818603cd82cfb707b3231b8a9038f13bb"
+SRCREV_meta ?= "83110d94edeb856a3667b62903ed4ae91c24117d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.8.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.8;destsuffix=${KMETA}"
-- 
2.5.0


