Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 40CCB6C062
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 15:51:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8AFp74B009233
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 10 Sep 2013 08:51:07 -0700 (PDT)
Received: from yow-bashfiel-d3.corp.ad.wrs.com (128.224.22.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Tue, 10 Sep 2013 08:51:06 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 10 Sep 2013 11:50:58 -0400
Message-ID: <28e6f9781ee0503231c161dbf3f6cab52981507c.1378827962.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1378827962.git.bruce.ashfield@windriver.com>
References: <cover.1378827962.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] linux-yocto/3.10: bump kver to 3.10.11
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
X-List-Received-Date: Tue, 10 Sep 2013 15:51:07 -0000
Content-Type: text/plain

Bumping to the 3.10.11 -stable release. Of note in this update is
the timer_list fix, which broke ssh access in the previous 3.10
series of updates:

    timer_list: correct the iterator for timer_list

    commit 84a78a6504f5c5394a8e558702e5b54131f01d14 upstream.

With this, we can revert the two temporary fixes for timer lists.
ssh access has been directly tested after this update.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   |    8 ++++----
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |    6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      |   18 +++++++++---------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
index a4366d0..e28a4af 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
@@ -3,13 +3,13 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH = "standard/preempt-rt/base"
 KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
 
-SRCREV_machine ?= "38793e629654f6b3e3f371a6b1f1745df26450f4"
-SRCREV_machine_qemuppc ?= "d4c836c55fce6f1a7f299bba2104f457b201c63d"
-SRCREV_meta ?= "ea900d1db60ba48962227f0976ac55f9e25bfa24"
+SRCREV_machine ?= "4de6b6b24c44ef644b46405a85c550128d4a779a"
+SRCREV_machine_qemuppc ?= "24a1786e5ed0d479638af5738375e396bf4c922c"
+SRCREV_meta ?= "b683dce390b1bbe434b15df6308ed03e5fd3a4ac"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
 
-LINUX_VERSION ?= "3.10.10"
+LINUX_VERSION ?= "3.10.11"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
index b3457b3..7270bcb 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
@@ -5,12 +5,12 @@ KBRANCH = "${KBRANCH_DEFAULT}"
 LINUX_KERNEL_TYPE = "tiny"
 KCONFIG_MODE = "--allnoconfig"
 
-LINUX_VERSION ?= "3.10.10"
+LINUX_VERSION ?= "3.10.11"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "ebc8428fdd938cfdfcdcadd77c3308ece6a57de1"
-SRCREV_meta ?= "ea900d1db60ba48962227f0976ac55f9e25bfa24"
+SRCREV_machine ?= "702040ac7c7ec66a29b4d147665ccdd0ff015577"
+SRCREV_meta ?= "b683dce390b1bbe434b15df6308ed03e5fd3a4ac"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.10.bb b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
index e570cd6..722f758 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
@@ -3,18 +3,18 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH_DEFAULT = "standard/base"
 KBRANCH = "${KBRANCH_DEFAULT}"
 
-SRCREV_machine_qemuarm ?= "6a38a13d2aa6058d7e7d88c3dc44b0bdfc4fe551"
-SRCREV_machine_qemumips  ?= "6c8921e44618938847865e4a9951086d7dc23085"
-SRCREV_machine_qemuppc ?= "677afd6cdbfb5c23a9e5479acafb7ba484789837"
-SRCREV_machine_qemux86 ?= "ebc8428fdd938cfdfcdcadd77c3308ece6a57de1"
-SRCREV_machine_qemux86-64 ?= "ebc8428fdd938cfdfcdcadd77c3308ece6a57de1"
-SRCREV_machine_qemumips64 ?= "ebc55bed9558a0e2f390e9cef03161b299138326"
-SRCREV_machine ?= "ebc8428fdd938cfdfcdcadd77c3308ece6a57de1"
-SRCREV_meta ?= "ea900d1db60ba48962227f0976ac55f9e25bfa24"
+SRCREV_machine_qemuarm ?= "4901b46258e7195bd4d4ff14a618a2cb71395bf3"
+SRCREV_machine_qemumips  ?= "bc6be45f32ef091ff13b16ba0f74f611232e5d21"
+SRCREV_machine_qemuppc ?= "789d821269f0496e95ed953f2d1126c4eb39c591"
+SRCREV_machine_qemux86 ?= "702040ac7c7ec66a29b4d147665ccdd0ff015577"
+SRCREV_machine_qemux86-64 ?= "702040ac7c7ec66a29b4d147665ccdd0ff015577"
+SRCREV_machine_qemumips64 ?= "6b3a777e3724d30ba03d88d75698fa0734c5a73f"
+SRCREV_machine ?= "702040ac7c7ec66a29b4d147665ccdd0ff015577"
+SRCREV_meta ?= "b683dce390b1bbe434b15df6308ed03e5fd3a4ac"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-LINUX_VERSION ?= "3.10.10"
+LINUX_VERSION ?= "3.10.11"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
1.7.10.4


