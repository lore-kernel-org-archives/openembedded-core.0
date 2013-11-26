Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 608FC6DD7C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2013 17:33:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rAQHXm0r017023
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 26 Nov 2013 09:33:48 -0800 (PST)
Received: from yow-bashfiel-d3.wrs.com (128.224.147.67) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Tue, 26 Nov 2013 09:33:48 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 26 Nov 2013 12:33:44 -0500
Message-ID: <7d4f08e148f710bbccfe2d43d562697f5d3e4186.1385487115.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1385487115.git.bruce.ashfield@windriver.com>
References: <cover.1385487115.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] linux-yocto/3.4: update to v3.4.69
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
X-List-Received-Date: Tue, 26 Nov 2013 17:33:50 -0000
Content-Type: text/plain

Bumping the 3.4 kernel to the latest korg -stable release.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_3.4.bb      | 14 +++++++-------
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
index 438b511..73fd3a9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
@@ -3,13 +3,13 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH = "standard/preempt-rt/base"
 KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
 
-LINUX_VERSION ?= "3.4.59"
+LINUX_VERSION ?= "3.4.69"
 LINUX_KERNEL_TYPE = "preempt-rt"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "2c997de11fbd934bdfe407b7f529b6561a476ea2"
-SRCREV_machine_qemuppc ?= "3d2eb9c9a5c0c0b0048f687b3666b42cca26c7f2"
+SRCREV_machine ?= "f59ffc4762503e4d6eaa8d934dbf1464d966f51e"
+SRCREV_machine_qemuppc ?= "60a0fa3cf1a08778b70bf64e19f8733019e9abd7"
 SRCREV_meta ?= "f36797c2df3fbe9491c8ac5977fb691f4a75e9b7"
 
 PR = "${INC_PR}.1"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
index d28da9e..0b43dab 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
@@ -8,11 +8,11 @@ KBRANCH = "${KBRANCH_DEFAULT}"
 LINUX_KERNEL_TYPE = "tiny"
 KCONFIG_MODE = "--allnoconfig"
 
-LINUX_VERSION ?= "3.4.59"
+LINUX_VERSION ?= "3.4.69"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "ea977edd05ae2ebfa82731e0bee309bdfd08abee"
+SRCREV_machine ?= "7f4d818b0450a5dc79f81b51dc7d13d0682b1287"
 SRCREV_meta ?= "f36797c2df3fbe9491c8ac5977fb691f4a75e9b7"
 
 PR = "${INC_PR}.1"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
index f1bb343..9b8456f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
@@ -3,17 +3,17 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH_DEFAULT = "standard/base"
 KBRANCH = "${KBRANCH_DEFAULT}"
 
-SRCREV_machine_qemuarm ?= "e1dd6f40b76b3e9bd0686629004621aeddc6a982"
-SRCREV_machine_qemumips  ?= "47af1ab871c8dfa4428cec26ec74e96a5b10c566"
-SRCREV_machine_qemuppc ?= "65e4b20a87b02cf7bcb3ad3f725a079933828d4d"
-SRCREV_machine_qemux86 ?= "ea977edd05ae2ebfa82731e0bee309bdfd08abee"
-SRCREV_machine_qemux86-64 ?= "ea977edd05ae2ebfa82731e0bee309bdfd08abee"
-SRCREV_machine ?= "ea977edd05ae2ebfa82731e0bee309bdfd08abee"
+SRCREV_machine_qemuarm ?= "38fe75106c5faa3ea49d0a285769de3d08478f90"
+SRCREV_machine_qemumips  ?= "67c8918ce3cfd66f19f23b46381993ff488b3fe0"
+SRCREV_machine_qemuppc ?= "0e81c96b36e05746ae978a830fe3dbdac8a51e58"
+SRCREV_machine_qemux86 ?= "7f4d818b0450a5dc79f81b51dc7d13d0682b1287"
+SRCREV_machine_qemux86-64 ?= "7f4d818b0450a5dc79f81b51dc7d13d0682b1287"
+SRCREV_machine ?= "7f4d818b0450a5dc79f81b51dc7d13d0682b1287"
 SRCREV_meta ?= "f36797c2df3fbe9491c8ac5977fb691f4a75e9b7"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-LINUX_VERSION ?= "3.4.59"
+LINUX_VERSION ?= "3.4.69"
 
 PR = "${INC_PR}.5"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.8.1.2


