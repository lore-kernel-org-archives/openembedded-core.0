Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 35481731CE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 20:44:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tBIKigV1026052
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 18 Dec 2015 12:44:42 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Fri, 18 Dec 2015 12:44:42 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <ross.burton@intel.com>
Date: Fri, 18 Dec 2015 15:44:35 -0500
Message-ID: <807e5f45ba18ced073c5dc86c9331af88ea8bc06.1450471022.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1450471022.git.bruce.ashfield@windriver.com>
References: <cover.1450471022.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/6] linux-yocto/4.1: update to v4.1.15
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
X-List-Received-Date: Fri, 18 Dec 2015 20:44:42 -0000
Content-Type: text/plain

Updating the 4.1 kernel repo to the latest 4.1.x stable.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 18 +++++++++---------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index 1eb032bfe6ac..b441bf681154 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -2,13 +2,13 @@ KBRANCH ?= "standard/preempt-rt/base"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "ed3fa3e6d62c1fb3411099478c69cef4e3d4f415"
+SRCREV_machine ?= "3188436876d5eaff8d48f82064367d4a65c3aa97"
 SRCREV_meta ?= "46bb64d605fd336d99fa05bab566b9553b40b4b4"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.1.13"
+LINUX_VERSION ?= "4.1.15"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index 66c8a6575e5e..4caa2523b30e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -4,12 +4,12 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.1.13"
+LINUX_VERSION ?= "4.1.15"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "4e659b86ffcf20ece27f42a671853d5f42d52a6c"
+SRCREV_machine ?= "788dfc9859321c09f1c58696bf8998f90ccb4f51"
 SRCREV_meta ?= "46bb64d605fd336d99fa05bab566b9553b40b4b4"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index 12245295a3f3..b81458b3c057 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "c19d15710a9e0a01a83a1ac03356390bc26a01f7"
-SRCREV_machine_qemuarm64 ?= "4e659b86ffcf20ece27f42a671853d5f42d52a6c"
-SRCREV_machine_qemumips ?= "ca7ddd2ce6e7c3fb599512bcc31a1de23ecb589d"
-SRCREV_machine_qemuppc ?= "4e659b86ffcf20ece27f42a671853d5f42d52a6c"
-SRCREV_machine_qemux86 ?= "4e659b86ffcf20ece27f42a671853d5f42d52a6c"
-SRCREV_machine_qemux86-64 ?= "4e659b86ffcf20ece27f42a671853d5f42d52a6c"
-SRCREV_machine_qemumips64 ?= "5945b7d7abce3ede46ae133a24420751d99ea55b"
-SRCREV_machine ?= "4e659b86ffcf20ece27f42a671853d5f42d52a6c"
+SRCREV_machine_qemuarm ?= "cf760f381c5e1e58d0c3372d66f4dfdc33f0984c"
+SRCREV_machine_qemuarm64 ?= "788dfc9859321c09f1c58696bf8998f90ccb4f51"
+SRCREV_machine_qemumips ?= "aa46295ab927bd5c960930c377855dbc4e57b195"
+SRCREV_machine_qemuppc ?= "788dfc9859321c09f1c58696bf8998f90ccb4f51"
+SRCREV_machine_qemux86 ?= "788dfc9859321c09f1c58696bf8998f90ccb4f51"
+SRCREV_machine_qemux86-64 ?= "788dfc9859321c09f1c58696bf8998f90ccb4f51"
+SRCREV_machine_qemumips64 ?= "949c0f2cbb4cf902478d009a7d38b6e4fb29e7c4"
+SRCREV_machine ?= "788dfc9859321c09f1c58696bf8998f90ccb4f51"
 SRCREV_meta ?= "46bb64d605fd336d99fa05bab566b9553b40b4b4"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.1.13"
+LINUX_VERSION ?= "4.1.15"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.1.0


