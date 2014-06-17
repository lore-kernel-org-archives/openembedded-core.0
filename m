Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A30346FFD8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jun 2014 15:26:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s5HFQT63020950
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 17 Jun 2014 08:26:29 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Tue, 17 Jun 2014 08:26:28 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 17 Jun 2014 11:26:15 -0400
Message-ID: <13e7f739aab04df13d56dbaac18ed9a0f525702d.1403016995.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1403016995.git.bruce.ashfield@windriver.com>
References: <cover.1403016995.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] linux-yocto/3.10: update to v3.10.43
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
X-List-Received-Date: Tue, 17 Jun 2014 15:26:35 -0000
Content-Type: text/plain

Importing the v3.10.42 and 43 korg -stable updates.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   |  8 ++++----
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      | 18 +++++++++---------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
index a1cee9f6440e..65a74d3ec75d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
@@ -3,13 +3,13 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH = "standard/preempt-rt/base"
 KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
 
-SRCREV_machine ?= "f49f81e77f7bf3191a11c2557b2b47a8d0927a3a"
-SRCREV_machine_qemuppc ?= "2ef670ee74499eed8564da01bc43930343a2deb4"
-SRCREV_meta ?= "b6d95bb5bf6b9e9b5c149e68ffed6db7a58b4187"
+SRCREV_machine ?= "c373b342af7bcbeda346df9598a5b1e9784d362f"
+SRCREV_machine_qemuppc ?= "767da5a30782cc1bc6522cef8aa5fd8130ecc06c"
+SRCREV_meta ?= "199943142f7e0a283240246ee6c02f4376b315f0"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
 
-LINUX_VERSION ?= "3.10.41"
+LINUX_VERSION ?= "3.10.43"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
index 560d86b98195..b70d7bc081ce 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
@@ -5,12 +5,12 @@ KBRANCH = "${KBRANCH_DEFAULT}"
 LINUX_KERNEL_TYPE = "tiny"
 KCONFIG_MODE = "--allnoconfig"
 
-LINUX_VERSION ?= "3.10.41"
+LINUX_VERSION ?= "3.10.43"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "ca510b5192c3b3814f1d1a19403d8847ba5db12b"
-SRCREV_meta ?= "b6d95bb5bf6b9e9b5c149e68ffed6db7a58b4187"
+SRCREV_machine ?= "aa677a2d02677ec92d59a8c36d001cf2f5cf3260"
+SRCREV_meta ?= "199943142f7e0a283240246ee6c02f4376b315f0"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.10.bb b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
index 4e4b6670b0d7..57395b4ebb1b 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
@@ -11,18 +11,18 @@ KBRANCH_qemux86  = "standard/common-pc/base"
 KBRANCH_qemux86-64  = "standard/common-pc-64/base"
 KBRANCH_qemumips64 = "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "cb8bf1fb82bb1d00fadc92608f5fd018b2dbf556"
-SRCREV_machine_qemumips ?= "7cbc39735f2cc708858d8319b96338b750ec76cb"
-SRCREV_machine_qemuppc ?= "15e1d5d7380a13907016e1f4c941026580e810a9"
-SRCREV_machine_qemux86 ?= "ca510b5192c3b3814f1d1a19403d8847ba5db12b"
-SRCREV_machine_qemux86-64 ?= "ca510b5192c3b3814f1d1a19403d8847ba5db12b"
-SRCREV_machine_qemumips64 ?= "34bd311a9ebb5b1f44a156f5e9d61646a6077c5f"
-SRCREV_machine ?= "ca510b5192c3b3814f1d1a19403d8847ba5db12b"
-SRCREV_meta ?= "b6d95bb5bf6b9e9b5c149e68ffed6db7a58b4187"
+SRCREV_machine_qemuarm ?= "db489eed7f5c86037358cc9d0fefa7b90dbbaa86"
+SRCREV_machine_qemumips ?= "780aac11b3f20ed2f5df3f173b0d02b28a6eb96b"
+SRCREV_machine_qemuppc ?= "48a9dec5fc4cc9c19d12866c6ec560a83df21d85"
+SRCREV_machine_qemux86 ?= "aa677a2d02677ec92d59a8c36d001cf2f5cf3260"
+SRCREV_machine_qemux86-64 ?= "aa677a2d02677ec92d59a8c36d001cf2f5cf3260"
+SRCREV_machine_qemumips64 ?= "d4b0d6f727167d7946e03dbfb50fef0891207bd1"
+SRCREV_machine ?= "aa677a2d02677ec92d59a8c36d001cf2f5cf3260"
+SRCREV_meta ?= "199943142f7e0a283240246ee6c02f4376b315f0"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-LINUX_VERSION ?= "3.10.41"
+LINUX_VERSION ?= "3.10.43"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
1.8.1.2


