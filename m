Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1BC5470030
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 04:27:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u0R4RqMe027774
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 26 Jan 2016 20:27:52 -0800
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 26 Jan 2016 20:27:51 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Jan 2016 23:27:48 -0500
Message-ID: <d45862dcb48f20d9b9e92b904e8cf2175bb3e3d6.1453868682.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1453868682.git.bruce.ashfield@windriver.com>
References: <cover.1453868682.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 1/2] linux-yocto/4.1: update to 4.1.16
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
X-List-Received-Date: Wed, 27 Jan 2016 04:27:55 -0000
Content-Type: text/plain

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index b441bf681154..2bc891c7c9fe 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -2,13 +2,13 @@ KBRANCH ?= "standard/preempt-rt/base"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "3188436876d5eaff8d48f82064367d4a65c3aa97"
-SRCREV_meta ?= "46bb64d605fd336d99fa05bab566b9553b40b4b4"
+SRCREV_machine ?= "368da9a4a63880c315aabff5834c8d3a807bbbbb"
+SRCREV_meta ?= "fde1381efc83859fcd873521bd1243646b22ef46"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.1.15"
+LINUX_VERSION ?= "4.1.16"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index 4caa2523b30e..81f339d2b2d3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.1.15"
+LINUX_VERSION ?= "4.1.16"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "788dfc9859321c09f1c58696bf8998f90ccb4f51"
-SRCREV_meta ?= "46bb64d605fd336d99fa05bab566b9553b40b4b4"
+SRCREV_machine ?= "9acf3d237d07758701d56c75cc2058f05a974899"
+SRCREV_meta ?= "fde1381efc83859fcd873521bd1243646b22ef46"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index b81458b3c057..cbc5f1a745d8 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "cf760f381c5e1e58d0c3372d66f4dfdc33f0984c"
-SRCREV_machine_qemuarm64 ?= "788dfc9859321c09f1c58696bf8998f90ccb4f51"
-SRCREV_machine_qemumips ?= "aa46295ab927bd5c960930c377855dbc4e57b195"
-SRCREV_machine_qemuppc ?= "788dfc9859321c09f1c58696bf8998f90ccb4f51"
-SRCREV_machine_qemux86 ?= "788dfc9859321c09f1c58696bf8998f90ccb4f51"
-SRCREV_machine_qemux86-64 ?= "788dfc9859321c09f1c58696bf8998f90ccb4f51"
-SRCREV_machine_qemumips64 ?= "949c0f2cbb4cf902478d009a7d38b6e4fb29e7c4"
-SRCREV_machine ?= "788dfc9859321c09f1c58696bf8998f90ccb4f51"
-SRCREV_meta ?= "46bb64d605fd336d99fa05bab566b9553b40b4b4"
+SRCREV_machine_qemuarm ?= "b635f136b1c5ffd0f570b1799c9265ba832efc3a"
+SRCREV_machine_qemuarm64 ?= "9acf3d237d07758701d56c75cc2058f05a974899"
+SRCREV_machine_qemumips ?= "fd7be86f6cafbf3947fdffdee23b0e9ca9e4abb0"
+SRCREV_machine_qemuppc ?= "9acf3d237d07758701d56c75cc2058f05a974899"
+SRCREV_machine_qemux86 ?= "9acf3d237d07758701d56c75cc2058f05a974899"
+SRCREV_machine_qemux86-64 ?= "9acf3d237d07758701d56c75cc2058f05a974899"
+SRCREV_machine_qemumips64 ?= "45cc8f9f06eb83d7804d03690e7fa0d76b060e16"
+SRCREV_machine ?= "9acf3d237d07758701d56c75cc2058f05a974899"
+SRCREV_meta ?= "fde1381efc83859fcd873521bd1243646b22ef46"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.1.15"
+LINUX_VERSION ?= "4.1.16"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.1.0


