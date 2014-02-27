Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9B3596F2FF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2014 21:12:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s1RLCnqA029686
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 27 Feb 2014 13:12:49 -0800 (PST)
Received: from yow-bashfiel-d3.wrs.com (128.224.147.67) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Thu, 27 Feb 2014 13:12:48 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 27 Feb 2014 16:12:36 -0500
Message-ID: <09826afecebcb83b99b5dac82b4ebe95da4a717f.1393535348.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1393535348.git.bruce.ashfield@windriver.com>
References: <cover.1393535348.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] linux-yocto/3.10: update to v3.10.32
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
X-List-Received-Date: Thu, 27 Feb 2014 21:12:51 -0000
Content-Type: text/plain

Integrating the latest korg -stable update for the 3.10 series of
kernels.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   |  8 ++++----
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      | 18 +++++++++---------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
index 5e56b4c16121..31ff0361c3c4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
@@ -3,13 +3,13 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH = "standard/preempt-rt/base"
 KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
 
-SRCREV_machine ?= "f17f18f928d3af8b18b69fdf224b3e4ed86dbfbf"
-SRCREV_machine_qemuppc ?= "82c9f3bfe1c97ba8b653bff8d4e030cf54bc1de7"
-SRCREV_meta ?= "8f8af5a3b1cd4ea4ec76e0db763efeb3807ad76c"
+SRCREV_machine ?= "a2475c1d9dc32b7171de28d196ace4a9df06edbd"
+SRCREV_machine_qemuppc ?= "84ab418469d7da9b710ce9e3cbc49e6fb9bd4e05"
+SRCREV_meta ?= "7b3b87d4d5e4c41c235da13aaa9f45d5d338e2c6"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
 
-LINUX_VERSION ?= "3.10.28"
+LINUX_VERSION ?= "3.10.32"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
index a987022ddce0..34bb276527f1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
@@ -5,12 +5,12 @@ KBRANCH = "${KBRANCH_DEFAULT}"
 LINUX_KERNEL_TYPE = "tiny"
 KCONFIG_MODE = "--allnoconfig"
 
-LINUX_VERSION ?= "3.10.28"
+LINUX_VERSION ?= "3.10.32"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "3e0a296fae952d8d93eb0f96566bf6d4a978c8ee"
-SRCREV_meta ?= "8f8af5a3b1cd4ea4ec76e0db763efeb3807ad76c"
+SRCREV_machine ?= "a86e2b1eadd1f607d0d6ac5c4ab20a902714ddb1"
+SRCREV_meta ?= "7b3b87d4d5e4c41c235da13aaa9f45d5d338e2c6"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.10.bb b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
index efbf24d3b3aa..55d46fa993d9 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
@@ -11,18 +11,18 @@ KBRANCH_qemux86  = "standard/common-pc/base"
 KBRANCH_qemux86-64  = "standard/common-pc-64/base"
 KBRANCH_qemumips64 = "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "51f493f9716a76fbfe911bfdefca7e9a42a5ca13"
-SRCREV_machine_qemumips ?= "633b2257f21082fd3a784a4417b421e9cd008045"
-SRCREV_machine_qemuppc ?= "37465d34ea1aba381082d22a880774b3b3b31af3"
-SRCREV_machine_qemux86 ?= "3e0a296fae952d8d93eb0f96566bf6d4a978c8ee"
-SRCREV_machine_qemux86-64 ?= "3e0a296fae952d8d93eb0f96566bf6d4a978c8ee"
-SRCREV_machine_qemumips64 ?= "fe1fab7061b8369deca03b2ec59f186bdbe2b8d9"
-SRCREV_machine ?= "3e0a296fae952d8d93eb0f96566bf6d4a978c8ee"
-SRCREV_meta ?= "8f8af5a3b1cd4ea4ec76e0db763efeb3807ad76c"
+SRCREV_machine_qemuarm ?= "df5844fa448e31927884d1850cfcc9bea981165c"
+SRCREV_machine_qemumips ?= "4ffaa6116722ced25c4f775990f445c353d5b8e9"
+SRCREV_machine_qemuppc ?= "db7c6be000d0a07d8b31561753c83ccbb4ae41ab"
+SRCREV_machine_qemux86 ?= "a86e2b1eadd1f607d0d6ac5c4ab20a902714ddb1"
+SRCREV_machine_qemux86-64 ?= "a86e2b1eadd1f607d0d6ac5c4ab20a902714ddb1"
+SRCREV_machine_qemumips64 ?= "fe0da5cbc516f7686af316cdeafaf7b7e8d34d7d"
+SRCREV_machine ?= "a86e2b1eadd1f607d0d6ac5c4ab20a902714ddb1"
+SRCREV_meta ?= "7b3b87d4d5e4c41c235da13aaa9f45d5d338e2c6"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-LINUX_VERSION ?= "3.10.28"
+LINUX_VERSION ?= "3.10.32"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
1.8.1.2


