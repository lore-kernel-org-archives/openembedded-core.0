Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4AA9B7836F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 23:19:51 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v6KNJqn9028105
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 16:19:52 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Thu, 20 Jul 2017 16:19:51 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 20 Jul 2017 16:19:51 -0700
Message-ID: <1500592791-5479-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [PATCH 1/1] linux-yocto: only suggest default kernel type
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
X-List-Received-Date: Thu, 20 Jul 2017 23:19:51 -0000
Content-Type: text/plain

The distro should set a default kernel type (?=) which could be
overriden by local.conf (=) or extensions (templates).  The kernel itself
should only use "??=" to provide a value which allows builds to succeed.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 637506a..aec06c2 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -33,7 +33,8 @@ KERNEL_FEATURES_append_qemuall=" features/debug/printk.scc"
 # and it can be specific to the machine or shared
 # KMACHINE = "UNDEFINED"
 
-LINUX_KERNEL_TYPE ?= "standard"
+# The distro or local.conf should set this, but if nobody cares...
+LINUX_KERNEL_TYPE ??= "standard"
 
 # KMETA ?= ""
 KBRANCH ?= "master"
-- 
2.7.4


