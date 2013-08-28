Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 808CF6BCA5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2013 22:05:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r7SM5NVY006749
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 28 Aug 2013 15:05:23 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.147.67) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Wed, 28 Aug 2013 15:05:23 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 28 Aug 2013 18:05:08 -0400
Message-ID: <35e1f700ed6947471791e282320df0f3bd69f27d.1377727293.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1377727293.git.bruce.ashfield@windriver.com>
References: <cover.1377727293.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] linux-yocto/3.4: v3.4.59, mohonpeak
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
X-List-Received-Date: Wed, 28 Aug 2013 22:05:26 -0000
Content-Type: text/plain

This is a standard refresh of the 3.4 LTSI kernel to include v3.4.59 and to
introduce the updated mohonpeak BSP.

Build and boot testing on qemu showed no issues.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb   |    8 ++++----
 meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb |    6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.4.bb      |   16 ++++++++--------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
index ec53206..632d624 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
@@ -3,14 +3,14 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH = "standard/preempt-rt/base"
 KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
 
-LINUX_VERSION ?= "3.4.52"
+LINUX_VERSION ?= "3.4.59"
 LINUX_KERNEL_TYPE = "preempt-rt"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "516cc41b2f9a93d77fe6713bb6dfec20aa24f5ce"
-SRCREV_machine_qemuppc ?= "a96230572ba5bc05decb7bcaa81b02e972d6841b"
-SRCREV_meta ?= "7250de4d4afc2558082cd42b8a0d151903436e8f"
+SRCREV_machine ?= "2c997de11fbd934bdfe407b7f529b6561a476ea2"
+SRCREV_machine_qemuppc ?= "3d2eb9c9a5c0c0b0048f687b3666b42cca26c7f2"
+SRCREV_meta ?= "f36797c2df3fbe9491c8ac5977fb691f4a75e9b7"
 
 PR = "${INC_PR}.1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
index 18c469c..7e01a96 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
@@ -8,12 +8,12 @@ KBRANCH = "${KBRANCH_DEFAULT}"
 LINUX_KERNEL_TYPE = "tiny"
 KCONFIG_MODE = "--allnoconfig"
 
-LINUX_VERSION ?= "3.4.52"
+LINUX_VERSION ?= "3.4.59"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "4122d6cf3f9e1fd6d54f6e13af29c4c589289fdc"
-SRCREV_meta ?= "7250de4d4afc2558082cd42b8a0d151903436e8f"
+SRCREV_machine ?= "ea977edd05ae2ebfa82731e0bee309bdfd08abee"
+SRCREV_meta ?= "f36797c2df3fbe9491c8ac5977fb691f4a75e9b7"
 
 PR = "${INC_PR}.1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
index 8db015a..3aea1f9 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
@@ -3,17 +3,17 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH_DEFAULT = "standard/base"
 KBRANCH = "${KBRANCH_DEFAULT}"
 
-SRCREV_machine_qemuarm ?= "a3bd53305c7dcd11a2683fbe5d830d44236f4cd4"
-SRCREV_machine_qemumips  ?= "e142ba98038a697e3a96b8f30a16e93602eff3c7"
-SRCREV_machine_qemuppc ?= "290c3dd687145104d4e3f0e7732669c1c42b19fe"
-SRCREV_machine_qemux86 ?= "4122d6cf3f9e1fd6d54f6e13af29c4c589289fdc"
-SRCREV_machine_qemux86-64 ?= "4122d6cf3f9e1fd6d54f6e13af29c4c589289fdc"
-SRCREV_machine ?= "4122d6cf3f9e1fd6d54f6e13af29c4c589289fdc"
-SRCREV_meta ?= "7250de4d4afc2558082cd42b8a0d151903436e8f"
+SRCREV_machine_qemuarm ?= "e1dd6f40b76b3e9bd0686629004621aeddc6a982"
+SRCREV_machine_qemumips  ?= "47af1ab871c8dfa4428cec26ec74e96a5b10c566"
+SRCREV_machine_qemuppc ?= "65e4b20a87b02cf7bcb3ad3f725a079933828d4d"
+SRCREV_machine_qemux86 ?= "ea977edd05ae2ebfa82731e0bee309bdfd08abee"
+SRCREV_machine_qemux86-64 ?= "ea977edd05ae2ebfa82731e0bee309bdfd08abee"
+SRCREV_machine ?= "ea977edd05ae2ebfa82731e0bee309bdfd08abee"
+SRCREV_meta ?= "f36797c2df3fbe9491c8ac5977fb691f4a75e9b7"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-LINUX_VERSION ?= "3.4.52"
+LINUX_VERSION ?= "3.4.59"
 
 PR = "${INC_PR}.5"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.7.10.4


