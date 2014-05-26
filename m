Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (unknown [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 88AE56FA2F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 May 2014 17:40:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s4QHeIxu018898
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 26 May 2014 10:40:18 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Mon, 26 May 2014 10:40:14 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 26 May 2014 13:40:10 -0400
Message-ID: <81e37d5db466c157a8ca0069c60102eb12616532.1401124899.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1401124899.git.bruce.ashfield@windriver.com>
References: <cover.1401124899.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] linux-yocto/3.10: bump kver to v3.10.40
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
X-List-Received-Date: Mon, 26 May 2014 17:40:19 -0000
Content-Type: text/plain

Integrating the latest korg releases for the 3.10 kernel.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   |  8 ++++----
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      | 18 +++++++++---------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
index 893d9852c08d..4648b5504b9f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
@@ -3,13 +3,13 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH = "standard/preempt-rt/base"
 KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
 
-SRCREV_machine ?= "8aa9023c5e2e2ca4180e971da9a2c139d5b3c79e"
-SRCREV_machine_qemuppc ?= "3dd7fd5d191245ab92889e69060ff732bdec770b"
-SRCREV_meta ?= "617c6158c3d5b931f0d6131e0b0a7b374c792599"
+SRCREV_machine ?= "c2869b4ecec4fe3efee1ec44e4be6d83dbeac225"
+SRCREV_machine_qemuppc ?= "7179683c2125e6cc76a7d88c3de6b7e493621130"
+SRCREV_meta ?= "13ae75f4a26fcd65abe526ef5f1dcde0583f453d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
 
-LINUX_VERSION ?= "3.10.38"
+LINUX_VERSION ?= "3.10.40"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
index 7081cd18aa57..b1b80341d6d2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
@@ -5,12 +5,12 @@ KBRANCH = "${KBRANCH_DEFAULT}"
 LINUX_KERNEL_TYPE = "tiny"
 KCONFIG_MODE = "--allnoconfig"
 
-LINUX_VERSION ?= "3.10.38"
+LINUX_VERSION ?= "3.10.40"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "02f7e63e56c061617957388c23bd5cf9b05c5388"
-SRCREV_meta ?= "617c6158c3d5b931f0d6131e0b0a7b374c792599"
+SRCREV_machine ?= "f53a6114b3a6e8c03ca4752de829887015f4c942"
+SRCREV_meta ?= "13ae75f4a26fcd65abe526ef5f1dcde0583f453d"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.10.bb b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
index e5774f99470e..220d1c9bfb58 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
@@ -11,18 +11,18 @@ KBRANCH_qemux86  = "standard/common-pc/base"
 KBRANCH_qemux86-64  = "standard/common-pc-64/base"
 KBRANCH_qemumips64 = "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "dd18759fd19771885589066811e254852e56d421"
-SRCREV_machine_qemumips ?= "2dbb607d161aeaa8d542b128203d7a10527aec7e"
-SRCREV_machine_qemuppc ?= "92dda91b216cbacfa71fd9036413dba0d2406332"
-SRCREV_machine_qemux86 ?= "02f7e63e56c061617957388c23bd5cf9b05c5388"
-SRCREV_machine_qemux86-64 ?= "02f7e63e56c061617957388c23bd5cf9b05c5388"
-SRCREV_machine_qemumips64 ?= "ebd521c1b609b445d8baf522d71453d4c26a0440"
-SRCREV_machine ?= "02f7e63e56c061617957388c23bd5cf9b05c5388"
-SRCREV_meta ?= "617c6158c3d5b931f0d6131e0b0a7b374c792599"
+SRCREV_machine_qemuarm ?= "a3a7014ff1104ce5f82da9c4d50fa2ec792e1463"
+SRCREV_machine_qemumips ?= "20f36e63a0e2de14c68e3031058fe6c7764a1926"
+SRCREV_machine_qemuppc ?= "9d34a73cf18c3bed1e1bc2df6d1e3ccedec87c8a"
+SRCREV_machine_qemux86 ?= "f53a6114b3a6e8c03ca4752de829887015f4c942"
+SRCREV_machine_qemux86-64 ?= "f53a6114b3a6e8c03ca4752de829887015f4c942"
+SRCREV_machine_qemumips64 ?= "093261d8a9879ac056d4f261545658addc71e452"
+SRCREV_machine ?= "f53a6114b3a6e8c03ca4752de829887015f4c942"
+SRCREV_meta ?= "13ae75f4a26fcd65abe526ef5f1dcde0583f453d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-LINUX_VERSION ?= "3.10.38"
+LINUX_VERSION ?= "3.10.40"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
1.8.1.2


