Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A13116FF56
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jun 2014 15:26:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s5HFQOmU020939
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 17 Jun 2014 08:26:25 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Tue, 17 Jun 2014 08:26:24 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 17 Jun 2014 11:26:11 -0400
Message-ID: <23f60d2a96aff05c712be04ac9857d640be626bd.1403016995.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1403016995.git.bruce.ashfield@windriver.com>
References: <cover.1403016995.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5] linux-yocto/3.10: update to v3.10.41
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

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   |  8 ++++----
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      | 18 +++++++++---------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
index 4648b5504b9f..a1cee9f6440e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
@@ -3,13 +3,13 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH = "standard/preempt-rt/base"
 KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
 
-SRCREV_machine ?= "c2869b4ecec4fe3efee1ec44e4be6d83dbeac225"
-SRCREV_machine_qemuppc ?= "7179683c2125e6cc76a7d88c3de6b7e493621130"
-SRCREV_meta ?= "13ae75f4a26fcd65abe526ef5f1dcde0583f453d"
+SRCREV_machine ?= "f49f81e77f7bf3191a11c2557b2b47a8d0927a3a"
+SRCREV_machine_qemuppc ?= "2ef670ee74499eed8564da01bc43930343a2deb4"
+SRCREV_meta ?= "b6d95bb5bf6b9e9b5c149e68ffed6db7a58b4187"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
 
-LINUX_VERSION ?= "3.10.40"
+LINUX_VERSION ?= "3.10.41"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
index b1b80341d6d2..560d86b98195 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
@@ -5,12 +5,12 @@ KBRANCH = "${KBRANCH_DEFAULT}"
 LINUX_KERNEL_TYPE = "tiny"
 KCONFIG_MODE = "--allnoconfig"
 
-LINUX_VERSION ?= "3.10.40"
+LINUX_VERSION ?= "3.10.41"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "f53a6114b3a6e8c03ca4752de829887015f4c942"
-SRCREV_meta ?= "13ae75f4a26fcd65abe526ef5f1dcde0583f453d"
+SRCREV_machine ?= "ca510b5192c3b3814f1d1a19403d8847ba5db12b"
+SRCREV_meta ?= "b6d95bb5bf6b9e9b5c149e68ffed6db7a58b4187"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.10.bb b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
index 220d1c9bfb58..4e4b6670b0d7 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
@@ -11,18 +11,18 @@ KBRANCH_qemux86  = "standard/common-pc/base"
 KBRANCH_qemux86-64  = "standard/common-pc-64/base"
 KBRANCH_qemumips64 = "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "a3a7014ff1104ce5f82da9c4d50fa2ec792e1463"
-SRCREV_machine_qemumips ?= "20f36e63a0e2de14c68e3031058fe6c7764a1926"
-SRCREV_machine_qemuppc ?= "9d34a73cf18c3bed1e1bc2df6d1e3ccedec87c8a"
-SRCREV_machine_qemux86 ?= "f53a6114b3a6e8c03ca4752de829887015f4c942"
-SRCREV_machine_qemux86-64 ?= "f53a6114b3a6e8c03ca4752de829887015f4c942"
-SRCREV_machine_qemumips64 ?= "093261d8a9879ac056d4f261545658addc71e452"
-SRCREV_machine ?= "f53a6114b3a6e8c03ca4752de829887015f4c942"
-SRCREV_meta ?= "13ae75f4a26fcd65abe526ef5f1dcde0583f453d"
+SRCREV_machine_qemuarm ?= "cb8bf1fb82bb1d00fadc92608f5fd018b2dbf556"
+SRCREV_machine_qemumips ?= "7cbc39735f2cc708858d8319b96338b750ec76cb"
+SRCREV_machine_qemuppc ?= "15e1d5d7380a13907016e1f4c941026580e810a9"
+SRCREV_machine_qemux86 ?= "ca510b5192c3b3814f1d1a19403d8847ba5db12b"
+SRCREV_machine_qemux86-64 ?= "ca510b5192c3b3814f1d1a19403d8847ba5db12b"
+SRCREV_machine_qemumips64 ?= "34bd311a9ebb5b1f44a156f5e9d61646a6077c5f"
+SRCREV_machine ?= "ca510b5192c3b3814f1d1a19403d8847ba5db12b"
+SRCREV_meta ?= "b6d95bb5bf6b9e9b5c149e68ffed6db7a58b4187"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-LINUX_VERSION ?= "3.10.40"
+LINUX_VERSION ?= "3.10.41"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
1.8.1.2


