Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 89DD665E89
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 May 2014 15:07:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s45EAG4s004270
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 5 May 2014 07:10:16 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Mon, 5 May 2014 07:10:16 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 5 May 2014 10:10:09 -0400
Message-ID: <a0c34d9ffd36713406d5ca86d05c6862c44b5e25.1399297986.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1399297986.git.bruce.ashfield@windriver.com>
References: <cover.1399297986.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/6] linux-yocto/3.4: update to v3.4.88
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
X-List-Received-Date: Mon, 05 May 2014 15:07:34 -0000
Content-Type: text/plain

Updating the 3.4 SRCREVs to import the korg v3.4.88 -stable release.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb   |  8 ++++----
 meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.4.bb      | 16 ++++++++--------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
index dc3813ca6d00..493317c38275 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
@@ -3,14 +3,14 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH = "standard/preempt-rt/base"
 KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
 
-LINUX_VERSION ?= "3.4.85"
+LINUX_VERSION ?= "3.4.88"
 LINUX_KERNEL_TYPE = "preempt-rt"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "fd1626cc2a1144a7760bcfc9c6e48a14de28624e"
-SRCREV_machine_qemuppc ?= "605cdff89f2d36d44ebfc75d6427eea5f236a940"
-SRCREV_meta ?= "7c9e1e0117e7ca1f7451870dad5db50adc21732e"
+SRCREV_machine ?= "990282c0af215b2d4261c5c6dacbb27d7248f4f4"
+SRCREV_machine_qemuppc ?= "c1d13a32b44fab908fe821f67ac7947195385652"
+SRCREV_meta ?= "03cd6f841fd2566b033db19eb6665228ea406adf"
 
 PR = "${INC_PR}.1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
index f22a3f46a0b9..4639a90dd53c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
@@ -8,12 +8,12 @@ KBRANCH = "${KBRANCH_DEFAULT}"
 LINUX_KERNEL_TYPE = "tiny"
 KCONFIG_MODE = "--allnoconfig"
 
-LINUX_VERSION ?= "3.4.85"
+LINUX_VERSION ?= "3.4.88"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "95a3ff6e3c2eec2fafe9d1813048fcdb468a678e"
-SRCREV_meta ?= "7c9e1e0117e7ca1f7451870dad5db50adc21732e"
+SRCREV_machine ?= "2ab0a0cc26d2fc3e59f66a27e8a6de8bd608a2d5"
+SRCREV_meta ?= "03cd6f841fd2566b033db19eb6665228ea406adf"
 
 PR = "${INC_PR}.1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
index 3a2ff2f50417..4f959226853a 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
@@ -11,17 +11,17 @@ KBRANCH_qemux86  = "standard/common-pc/base"
 KBRANCH_qemux86-64  = "standard/common-pc-64/base"
 KBRANCH_qemumips64 = "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "64f9a290683b1ab08136ef5d54d1845a961a6940"
-SRCREV_machine_qemumips  ?= "ad7aa3ecf8ab00055d31c3f7b059c8b8a8633e19"
-SRCREV_machine_qemuppc ?= "7aaa5a4debe4b1987d2d11707313e682b185e876"
-SRCREV_machine_qemux86 ?= "95a3ff6e3c2eec2fafe9d1813048fcdb468a678e"
-SRCREV_machine_qemux86-64 ?= "95a3ff6e3c2eec2fafe9d1813048fcdb468a678e"
-SRCREV_machine ?= "95a3ff6e3c2eec2fafe9d1813048fcdb468a678e"
-SRCREV_meta ?= "7c9e1e0117e7ca1f7451870dad5db50adc21732e"
+SRCREV_machine_qemuarm ?= "2ed52bacbd346dac90f65138daf16c17b2fd5066"
+SRCREV_machine_qemumips  ?= "3e67c74737d97909d7ec069579fde35419a04f00"
+SRCREV_machine_qemuppc ?= "fe300607aba102ec9f567eb966ed067645966e7b"
+SRCREV_machine_qemux86 ?= "2ab0a0cc26d2fc3e59f66a27e8a6de8bd608a2d5"
+SRCREV_machine_qemux86-64 ?= "2ab0a0cc26d2fc3e59f66a27e8a6de8bd608a2d5"
+SRCREV_machine ?= "2ab0a0cc26d2fc3e59f66a27e8a6de8bd608a2d5"
+SRCREV_meta ?= "03cd6f841fd2566b033db19eb6665228ea406adf"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-LINUX_VERSION ?= "3.4.85"
+LINUX_VERSION ?= "3.4.88"
 
 PR = "${INC_PR}.5"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.8.1.2


