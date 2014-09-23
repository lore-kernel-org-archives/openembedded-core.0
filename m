Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 493DD6AFB5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 14:57:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8NEvpMM029677
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 23 Sep 2014 07:57:51 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Tue, 23 Sep 2014 07:57:51 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 23 Sep 2014 10:57:40 -0400
Message-ID: <c008dc8f6a49cc3133395bd2d4f2866ebccb46a4.1411483823.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1411483823.git.bruce.ashfield@windriver.com>
References: <cover.1411483823.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/7] linux-yocto/3.14: update to v3.14.18 and -rt9
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
X-List-Received-Date: Tue, 23 Sep 2014 14:57:51 -0000
Content-Type: text/plain

Refreshing the 3.14 kernel to a new korg stable and -rt release.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb   |  8 ++++----
 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.14.bb      | 18 +++++++++---------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
index 1d69fc687bde..0977b6275c6e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
@@ -3,13 +3,13 @@ KBRANCH_qemuppc ?= "standard/preempt-rt/qemuppc"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "cf214eea750707e6261818837e5c508ac1299b19"
-SRCREV_machine_qemuppc ?= "3d5a421fc5c171cd5d322b092e78e0e0dd4f340e"
-SRCREV_meta ?= "a94680bfeb0e8e3025b57f8b42d0825ba743376b"
+SRCREV_machine ?= "41975d7825d8043b054378565b01824ffa961834"
+SRCREV_machine_qemuppc ?= "3bbc23a726520784618a3854747b82792d2a108f"
+SRCREV_meta ?= "80c78725e098d26b9464c4d5cffd37c28f42dc7b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
 
-LINUX_VERSION ?= "3.14.17"
+LINUX_VERSION ?= "3.14.18"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
index 9f78951c52bf..4eb7b1dd477d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
@@ -4,12 +4,12 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "3.14.17"
+LINUX_VERSION ?= "3.14.18"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "b85edae6fd61ceadfc08099608e8ac90aa4c5c33"
-SRCREV_meta ?= "a94680bfeb0e8e3025b57f8b42d0825ba743376b"
+SRCREV_machine ?= "fabce749eb25b8053250b5507868a246ddaf4423"
+SRCREV_meta ?= "80c78725e098d26b9464c4d5cffd37c28f42dc7b"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.14.bb b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
index e06b191673e3..6eac062d5964 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
@@ -10,18 +10,18 @@ KBRANCH_qemux86  ?= "standard/common-pc/base"
 KBRANCH_qemux86-64 ?= "standard/common-pc-64/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "c32a2e1190325f685a61196f38fc03ceff2645bf"
-SRCREV_machine_qemumips ?= "1ff50c529b49ceb55a670258f7cb8233c8006c6c"
-SRCREV_machine_qemuppc ?= "12e9828a5b78891374375233b4075f682b9fbd0e"
-SRCREV_machine_qemux86 ?= "58d49fe770ad642e2bc0616159195ba837dc513b"
-SRCREV_machine_qemux86-64 ?= "b85edae6fd61ceadfc08099608e8ac90aa4c5c33"
-SRCREV_machine_qemumips64 ?= "dcd579737386fca4d7bcf224bc118b14eb3c1d55"
-SRCREV_machine ?= "b85edae6fd61ceadfc08099608e8ac90aa4c5c33"
-SRCREV_meta ?= "a94680bfeb0e8e3025b57f8b42d0825ba743376b"
+SRCREV_machine_qemuarm ?= "3d5be74be2cab047a1b85e07620beee4791d4594"
+SRCREV_machine_qemumips ?= "2834013809154887772cf1552191a682ed42d9eb"
+SRCREV_machine_qemuppc ?= "44dddef534a3cae1aa952f77f4fd299978552307"
+SRCREV_machine_qemux86 ?= "d77fb23dcc717061f74678babaeb4fa487c55fec"
+SRCREV_machine_qemux86-64 ?= "fabce749eb25b8053250b5507868a246ddaf4423"
+SRCREV_machine_qemumips64 ?= "5c5d8fd23d2b8fb0e8e00e54d2783feeba86ebd0"
+SRCREV_machine ?= "fabce749eb25b8053250b5507868a246ddaf4423"
+SRCREV_meta ?= "80c78725e098d26b9464c4d5cffd37c28f42dc7b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-LINUX_VERSION ?= "3.14.17"
+LINUX_VERSION ?= "3.14.18"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
1.8.1.2


