Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E6570731C7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 22:10:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u1TMAYQT025657
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 29 Feb 2016 14:10:34 -0800
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Mon, 29 Feb 2016 14:10:33 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 29 Feb 2016 17:10:23 -0500
Message-ID: <77a79b25cee7488a84e0d2d40e008fa118fb9867.1456782981.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1456782981.git.bruce.ashfield@windriver.com>
References: <cover.1456782981.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org, california.l.sullivan@intel.com,
	saul.wold@intel.com
Subject: [PATCH 3/8] linux-yocto/4.1: update to 4.1.18
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
X-List-Received-Date: Mon, 29 Feb 2016 22:10:36 -0000
Content-Type: text/plain

Integrating the korg -stable update to 4.1

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 18 +++++++++---------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index cff0cf2c8967..8135d3ba24ca 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -2,13 +2,13 @@ KBRANCH ?= "standard/preempt-rt/base"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "fd72b890926d65a0684403ba4ea55ec42edc130f"
+SRCREV_machine ?= "73c76150065091f6cc1751a3c8ec2d8a8cf8b6af"
 SRCREV_meta ?= "79dbb64d9e179718369a7a5c7b364fda9936571f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.1.17"
+LINUX_VERSION ?= "4.1.18"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index 4a8ec0e0460b..e27c9dbfccea 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -4,12 +4,12 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.1.17"
+LINUX_VERSION ?= "4.1.18"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "c1b6f28fb457306331d3173364b509fa39971f84"
+SRCREV_machine ?= "dd6492b44151164242718855d6c9eebbf0018eac"
 SRCREV_meta ?= "79dbb64d9e179718369a7a5c7b364fda9936571f"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index 466852b18650..9ac098afd1a7 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "1b3f801b8fe01297d07ad54b46801924b2db5e1e"
-SRCREV_machine_qemuarm64 ?= "c1b6f28fb457306331d3173364b509fa39971f84"
-SRCREV_machine_qemumips ?= "0ba29c3151bc688aa550ec4a530b96ec8ca6ca53"
-SRCREV_machine_qemuppc ?= "c1b6f28fb457306331d3173364b509fa39971f84"
-SRCREV_machine_qemux86 ?= "c1b6f28fb457306331d3173364b509fa39971f84"
-SRCREV_machine_qemux86-64 ?= "c1b6f28fb457306331d3173364b509fa39971f84"
-SRCREV_machine_qemumips64 ?= "2ec153606e0d665d85f8e28219166fde6fd80c8c"
-SRCREV_machine ?= "c1b6f28fb457306331d3173364b509fa39971f84"
+SRCREV_machine_qemuarm ?= "2af5b3dff27887af8ffbc700a6a09a9d75c2b05f"
+SRCREV_machine_qemuarm64 ?= "dd6492b44151164242718855d6c9eebbf0018eac"
+SRCREV_machine_qemumips ?= "deab449b07a79b9a108f1c94e3dabef34135517a"
+SRCREV_machine_qemuppc ?= "dd6492b44151164242718855d6c9eebbf0018eac"
+SRCREV_machine_qemux86 ?= "dd6492b44151164242718855d6c9eebbf0018eac"
+SRCREV_machine_qemux86-64 ?= "dd6492b44151164242718855d6c9eebbf0018eac"
+SRCREV_machine_qemumips64 ?= "4984422b4cd3deb6d68f46d010fb8eb007468677"
+SRCREV_machine ?= "dd6492b44151164242718855d6c9eebbf0018eac"
 SRCREV_meta ?= "79dbb64d9e179718369a7a5c7b364fda9936571f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.1.17"
+LINUX_VERSION ?= "4.1.18"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


