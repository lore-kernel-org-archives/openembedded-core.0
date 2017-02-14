Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0F0D160745
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Feb 2017 21:14:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v1ELEVp0018991
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 14 Feb 2017 13:14:32 -0800
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 14 Feb 2017 13:14:31 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 14 Feb 2017 16:14:18 -0500
Message-ID: <2ac29c1210e7afad30659bb6d574394507eceb91.1487106757.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1487106757.git.bruce.ashfield@windriver.com>
References: <cover.1487106757.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/11] linux-yocto-rt/4.9: integrate 4.9-rt4
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
X-List-Received-Date: Tue, 14 Feb 2017 21:14:32 -0000
Content-Type: text/plain

Integrating the 4.9-rt4 new changes:

  56a3dd6fb4e9 x86/mm/cpa: avoid wbinvd() for PREEMPT
  221db3244e71 pinctrl: qcom: Use raw spinlock variants
  43158f23e188 radix-tree: use local locks
  109a8fea2c4a cpuset: Convert callback_lock to raw_spinlock_t
  3741fb19d20f softirq: wake the timer softirq if needed

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb   | 4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.9.bb      | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
index 771adaa80145..94697ee98694 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "ff62b282b523e48abb8f8304ff46ebcc88913757"
-SRCREV_meta ?= "2c9c93fb141832b1416824387491dd95a9d627c6"
+SRCREV_machine ?= "01a64b0469256a432af0b8a0f27d32694e908e8b"
+SRCREV_meta ?= "8d1042fc4b23d184688b0e6931dd4e7ff4807273"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
index 8910bee524e5..34354f02722c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "c85c54f5bf53b98afe8105e91bffcdb6c60afe8f"
-SRCREV_meta ?= "2c9c93fb141832b1416824387491dd95a9d627c6"
+SRCREV_meta ?= "8d1042fc4b23d184688b0e6931dd4e7ff4807273"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.9.bb b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
index f91cab32450d..6795d2cb1fa3 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "c85c54f5bf53b98afe8105e91bffcdb6c60afe8f"
 SRCREV_machine_qemux86-64 ?= "c85c54f5bf53b98afe8105e91bffcdb6c60afe8f"
 SRCREV_machine_qemumips64 ?= "13818cbe0b9f0e2e7542b7c088b5719c7a463da9"
 SRCREV_machine ?= "c85c54f5bf53b98afe8105e91bffcdb6c60afe8f"
-SRCREV_meta ?= "2c9c93fb141832b1416824387491dd95a9d627c6"
+SRCREV_meta ?= "8d1042fc4b23d184688b0e6931dd4e7ff4807273"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
-- 
2.5.0


