Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A28EE759B4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 22:10:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u1TMAXJq027303
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 29 Feb 2016 14:10:33 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Mon, 29 Feb 2016 14:10:32 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 29 Feb 2016 17:10:22 -0500
Message-ID: <85bf4e9bbf3e8e008fac2e0e90775444ec8ea87e.1456782981.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1456782981.git.bruce.ashfield@windriver.com>
References: <cover.1456782981.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org, california.l.sullivan@intel.com,
	saul.wold@intel.com
Subject: [PATCH 2/8] linux-yocto/4.1: clkdev updates
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
X-List-Received-Date: Mon, 29 Feb 2016 22:10:35 -0000
Content-Type: text/plain

Backporting the following clkdev updates to the 4.1 kernel:

   c1b6f28fb457 clkdev: get rid of redundant clk_add_alias() prototype in linux/clk.h
   f9a70df2d491 clk: update clk API documentation to clarify clk_round_rate()
   db2d98fa3908 clkdev: fix clk_add_alias() with a NULL alias device name
   1b2c3a175637 clkdev: add clkdev_create() helper
   9b3d61ea0c57 clkdev: const-ify connection id to clk_add_alias()
   76b7b02f10dc clkdev: drop __init from clkdev_add_table()
   22f16b822d18 clkdev: use clk_hw internally

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 16 ++++++++--------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index 4ec9cc4c2cfb..cff0cf2c8967 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -2,7 +2,7 @@ KBRANCH ?= "standard/preempt-rt/base"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "4892b47c7f92a8a332e75596ec7c8d8204bd1709"
+SRCREV_machine ?= "fd72b890926d65a0684403ba4ea55ec42edc130f"
 SRCREV_meta ?= "79dbb64d9e179718369a7a5c7b364fda9936571f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index c84fb2dc6324..4a8ec0e0460b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "4.1.17"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "e02ac252f68dca39c8fa06c8517dd805e75aed87"
+SRCREV_machine ?= "c1b6f28fb457306331d3173364b509fa39971f84"
 SRCREV_meta ?= "79dbb64d9e179718369a7a5c7b364fda9936571f"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index 1a3842c9c113..466852b18650 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "de3a57fd015b3eca12d65530efc6a2cb59226d25"
-SRCREV_machine_qemuarm64 ?= "e02ac252f68dca39c8fa06c8517dd805e75aed87"
-SRCREV_machine_qemumips ?= "d00db934de0fa0ddb5811bb91d62c1c26e2bed95"
-SRCREV_machine_qemuppc ?= "e02ac252f68dca39c8fa06c8517dd805e75aed87"
-SRCREV_machine_qemux86 ?= "e02ac252f68dca39c8fa06c8517dd805e75aed87"
-SRCREV_machine_qemux86-64 ?= "e02ac252f68dca39c8fa06c8517dd805e75aed87"
-SRCREV_machine_qemumips64 ?= "aa673476922c02c6caef5c1d65e59f03259a596d"
-SRCREV_machine ?= "e02ac252f68dca39c8fa06c8517dd805e75aed87"
+SRCREV_machine_qemuarm ?= "1b3f801b8fe01297d07ad54b46801924b2db5e1e"
+SRCREV_machine_qemuarm64 ?= "c1b6f28fb457306331d3173364b509fa39971f84"
+SRCREV_machine_qemumips ?= "0ba29c3151bc688aa550ec4a530b96ec8ca6ca53"
+SRCREV_machine_qemuppc ?= "c1b6f28fb457306331d3173364b509fa39971f84"
+SRCREV_machine_qemux86 ?= "c1b6f28fb457306331d3173364b509fa39971f84"
+SRCREV_machine_qemux86-64 ?= "c1b6f28fb457306331d3173364b509fa39971f84"
+SRCREV_machine_qemumips64 ?= "2ec153606e0d665d85f8e28219166fde6fd80c8c"
+SRCREV_machine ?= "c1b6f28fb457306331d3173364b509fa39971f84"
 SRCREV_meta ?= "79dbb64d9e179718369a7a5c7b364fda9936571f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
-- 
2.5.0


