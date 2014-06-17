Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A22826FFD6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jun 2014 15:26:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s5HFQR4f020947
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 17 Jun 2014 08:26:27 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Tue, 17 Jun 2014 08:26:27 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 17 Jun 2014 11:26:13 -0400
Message-ID: <7dad8b68c90de38d3929ce4fad8bf83710893f91.1403016995.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1403016995.git.bruce.ashfield@windriver.com>
References: <cover.1403016995.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] linux-yocto/3.4: update to v3.4.91
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
X-List-Received-Date: Tue, 17 Jun 2014 15:26:34 -0000
Content-Type: text/plain

Updating to the latest korg -stable release.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb   |  8 ++++----
 meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.4.bb      | 16 ++++++++--------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
index 493317c38275..e01ffeec7ab0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
@@ -3,14 +3,14 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH = "standard/preempt-rt/base"
 KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
 
-LINUX_VERSION ?= "3.4.88"
+LINUX_VERSION ?= "3.4.91"
 LINUX_KERNEL_TYPE = "preempt-rt"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "990282c0af215b2d4261c5c6dacbb27d7248f4f4"
-SRCREV_machine_qemuppc ?= "c1d13a32b44fab908fe821f67ac7947195385652"
-SRCREV_meta ?= "03cd6f841fd2566b033db19eb6665228ea406adf"
+SRCREV_machine ?= "5993b0a650d24f810edb22bab577287d0c6d4f4b"
+SRCREV_machine_qemuppc ?= "765d61e4883bb6db3be516722465f2e8d1fc73cd"
+SRCREV_meta ?= "a8742041c8b9f447d4ad4c3f478e022f1e4bfcfd"
 
 PR = "${INC_PR}.1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
index 4639a90dd53c..fd5c9f76967e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
@@ -8,12 +8,12 @@ KBRANCH = "${KBRANCH_DEFAULT}"
 LINUX_KERNEL_TYPE = "tiny"
 KCONFIG_MODE = "--allnoconfig"
 
-LINUX_VERSION ?= "3.4.88"
+LINUX_VERSION ?= "3.4.91"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "2ab0a0cc26d2fc3e59f66a27e8a6de8bd608a2d5"
-SRCREV_meta ?= "03cd6f841fd2566b033db19eb6665228ea406adf"
+SRCREV_machine ?= "498189ccb98f833daa2092ceee72da8c878e0009"
+SRCREV_meta ?= "a8742041c8b9f447d4ad4c3f478e022f1e4bfcfd"
 
 PR = "${INC_PR}.1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
index 4f959226853a..1eabf764ef6d 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
@@ -11,17 +11,17 @@ KBRANCH_qemux86  = "standard/common-pc/base"
 KBRANCH_qemux86-64  = "standard/common-pc-64/base"
 KBRANCH_qemumips64 = "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "2ed52bacbd346dac90f65138daf16c17b2fd5066"
-SRCREV_machine_qemumips  ?= "3e67c74737d97909d7ec069579fde35419a04f00"
-SRCREV_machine_qemuppc ?= "fe300607aba102ec9f567eb966ed067645966e7b"
-SRCREV_machine_qemux86 ?= "2ab0a0cc26d2fc3e59f66a27e8a6de8bd608a2d5"
-SRCREV_machine_qemux86-64 ?= "2ab0a0cc26d2fc3e59f66a27e8a6de8bd608a2d5"
-SRCREV_machine ?= "2ab0a0cc26d2fc3e59f66a27e8a6de8bd608a2d5"
-SRCREV_meta ?= "03cd6f841fd2566b033db19eb6665228ea406adf"
+SRCREV_machine_qemuarm ?= "192b56b2f529af1be014ea85667c9f3fea0afd53"
+SRCREV_machine_qemumips  ?= "58fb8b8fb2f9911cac84cd840d63c8a58bada6ca"
+SRCREV_machine_qemuppc ?= "4fe50989bc8bcb3564ca37c2cffd42ac176b428d"
+SRCREV_machine_qemux86 ?= "498189ccb98f833daa2092ceee72da8c878e0009"
+SRCREV_machine_qemux86-64 ?= "498189ccb98f833daa2092ceee72da8c878e0009"
+SRCREV_machine ?= "498189ccb98f833daa2092ceee72da8c878e0009"
+SRCREV_meta ?= "a8742041c8b9f447d4ad4c3f478e022f1e4bfcfd"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-LINUX_VERSION ?= "3.4.88"
+LINUX_VERSION ?= "3.4.91"
 
 PR = "${INC_PR}.5"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.8.1.2


