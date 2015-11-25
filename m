Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AB87F6057B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 13:42:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tAPDfwhC025889
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 25 Nov 2015 05:41:59 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 25 Nov 2015 05:41:58 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 25 Nov 2015 08:41:53 -0500
Message-ID: <486710938b08dd8e5c04bfd6fd6bcea5d07fd5b8.1448458595.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1448458595.git.bruce.ashfield@windriver.com>
References: <cover.1448458595.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] linux-yocto/4.1: update to v4.1.13
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
X-List-Received-Date: Wed, 25 Nov 2015 13:42:07 -0000
Content-Type: text/plain

Updating the 4.1 kernel to the latest stable (and resolving minor
conflicts with -rt).

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index 4209a9640a67..412691501bc5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -2,13 +2,13 @@ KBRANCH ?= "standard/preempt-rt/base"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "f7e4bbfef684e29b1257eaf2d7f534b38e2e1b1e"
-SRCREV_meta ?= "aed902160251d69cc28d1e69a4f692e8ea8fa13b"
+SRCREV_machine ?= "a4b5d54fc4fc0e2b3035642559279a27c57a3391"
+SRCREV_meta ?= "1fb60461e4522bba62b4b34e9520128c959d2437"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.1.8"
+LINUX_VERSION ?= "4.1.13"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index 9862006bb8b8..69bfbad0da31 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.1.8"
+LINUX_VERSION ?= "4.1.13"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "dbe692d91c8e55d1430f2c45fd578c8e4e71e482"
-SRCREV_meta ?= "aed902160251d69cc28d1e69a4f692e8ea8fa13b"
+SRCREV_machine ?= "49e2f2d48ac2bb3f0fc379ee87651a2eaeab2cc7"
+SRCREV_meta ?= "1fb60461e4522bba62b4b34e9520128c959d2437"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index a04c93097e7a..4f4e6ad14847 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "bc11ecf659e30c8687604e086450ae1ff90c0169"
-SRCREV_machine_qemuarm64 ?= "dbe692d91c8e55d1430f2c45fd578c8e4e71e482"
-SRCREV_machine_qemumips ?= "181e2c553ffaae19d08a6730e98d288c7e337d39"
-SRCREV_machine_qemuppc ?= "dbe692d91c8e55d1430f2c45fd578c8e4e71e482"
-SRCREV_machine_qemux86 ?= "dbe692d91c8e55d1430f2c45fd578c8e4e71e482"
-SRCREV_machine_qemux86-64 ?= "dbe692d91c8e55d1430f2c45fd578c8e4e71e482"
-SRCREV_machine_qemumips64 ?= "2684711a16ed21f114d834742f860cee532f7438"
-SRCREV_machine ?= "dbe692d91c8e55d1430f2c45fd578c8e4e71e482"
-SRCREV_meta ?= "aed902160251d69cc28d1e69a4f692e8ea8fa13b"
+SRCREV_machine_qemuarm ?= "52340eea58baf03f41f0b0a9410d8e6038e3124a"
+SRCREV_machine_qemuarm64 ?= "49e2f2d48ac2bb3f0fc379ee87651a2eaeab2cc7"
+SRCREV_machine_qemumips ?= "f821004dd2dae30004c54b2d2ec2563aee11be8a"
+SRCREV_machine_qemuppc ?= "49e2f2d48ac2bb3f0fc379ee87651a2eaeab2cc7"
+SRCREV_machine_qemux86 ?= "49e2f2d48ac2bb3f0fc379ee87651a2eaeab2cc7"
+SRCREV_machine_qemux86-64 ?= "49e2f2d48ac2bb3f0fc379ee87651a2eaeab2cc7"
+SRCREV_machine_qemumips64 ?= "0cf340000b9c2b91d1086d4c34f88eecfc257562"
+SRCREV_machine ?= "49e2f2d48ac2bb3f0fc379ee87651a2eaeab2cc7"
+SRCREV_meta ?= "1fb60461e4522bba62b4b34e9520128c959d2437"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.1.8"
+LINUX_VERSION ?= "4.1.13"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.1.0


