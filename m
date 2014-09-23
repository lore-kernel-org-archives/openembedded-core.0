Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A37437151B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 14:57:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8NEvtG3025467
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 23 Sep 2014 07:57:55 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Tue, 23 Sep 2014 07:57:54 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 23 Sep 2014 10:57:45 -0400
Message-ID: <b692de2aaa515c04fe66e26b554b7535932349eb.1411483823.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1411483823.git.bruce.ashfield@windriver.com>
References: <cover.1411483823.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/7] linux-yocto/3.14: update to v3.14.19
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
X-List-Received-Date: Tue, 23 Sep 2014 14:57:56 -0000
Content-Type: text/plain

Updating to the latest korg -stable update.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb   |  8 ++++----
 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.14.bb      | 18 +++++++++---------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
index 0977b6275c6e..7eecc7fe562b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
@@ -3,13 +3,13 @@ KBRANCH_qemuppc ?= "standard/preempt-rt/qemuppc"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "41975d7825d8043b054378565b01824ffa961834"
-SRCREV_machine_qemuppc ?= "3bbc23a726520784618a3854747b82792d2a108f"
-SRCREV_meta ?= "80c78725e098d26b9464c4d5cffd37c28f42dc7b"
+SRCREV_machine ?= "63e1f827790683d4ef01c71acfdf20b79f986d99"
+SRCREV_machine_qemuppc ?= "2c51fd8a6fcf79386e3418ff78d42390ad6b5aa2"
+SRCREV_meta ?= "0bd3ec19b64191efc9d0ba83d05c9f7f9bf4473a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
 
-LINUX_VERSION ?= "3.14.18"
+LINUX_VERSION ?= "3.14.19"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
index 4eb7b1dd477d..ff4a5748067e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
@@ -4,12 +4,12 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "3.14.18"
+LINUX_VERSION ?= "3.14.19"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "fabce749eb25b8053250b5507868a246ddaf4423"
-SRCREV_meta ?= "80c78725e098d26b9464c4d5cffd37c28f42dc7b"
+SRCREV_machine ?= "14fea2388e7b248c4e9442ac95fcbf1e4d265ee2"
+SRCREV_meta ?= "0bd3ec19b64191efc9d0ba83d05c9f7f9bf4473a"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.14.bb b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
index 6eac062d5964..efc193bb3c4f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
@@ -10,18 +10,18 @@ KBRANCH_qemux86  ?= "standard/common-pc/base"
 KBRANCH_qemux86-64 ?= "standard/common-pc-64/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "3d5be74be2cab047a1b85e07620beee4791d4594"
-SRCREV_machine_qemumips ?= "2834013809154887772cf1552191a682ed42d9eb"
-SRCREV_machine_qemuppc ?= "44dddef534a3cae1aa952f77f4fd299978552307"
-SRCREV_machine_qemux86 ?= "d77fb23dcc717061f74678babaeb4fa487c55fec"
-SRCREV_machine_qemux86-64 ?= "fabce749eb25b8053250b5507868a246ddaf4423"
-SRCREV_machine_qemumips64 ?= "5c5d8fd23d2b8fb0e8e00e54d2783feeba86ebd0"
-SRCREV_machine ?= "fabce749eb25b8053250b5507868a246ddaf4423"
-SRCREV_meta ?= "80c78725e098d26b9464c4d5cffd37c28f42dc7b"
+SRCREV_machine_qemuarm ?= "1c7a46a46b2cbf68777713531647cd4b1cf22f12"
+SRCREV_machine_qemumips ?= "f3dea87bc7aaccae5c24240b378a4e09034d80af"
+SRCREV_machine_qemuppc ?= "195f2029d49fc2440cf236d5134eb2ab88b8d407"
+SRCREV_machine_qemux86 ?= "bdef75805ede16c13f4383cc53d66dad3e83da64"
+SRCREV_machine_qemux86-64 ?= "14fea2388e7b248c4e9442ac95fcbf1e4d265ee2"
+SRCREV_machine_qemumips64 ?= "b5c533e6ffba299b24d31cc2b8f32f6302f5d7e3"
+SRCREV_machine ?= "14fea2388e7b248c4e9442ac95fcbf1e4d265ee2"
+SRCREV_meta ?= "0bd3ec19b64191efc9d0ba83d05c9f7f9bf4473a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-LINUX_VERSION ?= "3.14.18"
+LINUX_VERSION ?= "3.14.19"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
1.8.1.2


