Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1U2l8G-00044S-39
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 17:12:30 +0100
Received: from yow-bashfiel-d3.corp.ad.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r15FuZtL028089;
	Tue, 5 Feb 2013 07:56:36 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Tue,  5 Feb 2013 10:56:34 -0500
Message-Id: <cbcbeb8793a5ade5333d6cbc391c7da9c5509e84.1360079063.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1360079063.git.bruce.ashfield@windriver.com>
References: <cover.1360079063.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1360079063.git.bruce.ashfield@windriver.com>
References: <cover.1360079063.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] linux-yocto/3.4: update to v3.4.28, 3.4.28-rt40
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Feb 2013 16:12:34 -0000
X-List-Received-Date: Tue, 05 Feb 2013 16:12:34 -0000

Updating the linux-yocto_3.4 SRCREVs to pick up the 3.4.28 -stable update
as well as the 3.4.28-rt40 refresh.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb   |    8 ++++----
 meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb |    6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.4.bb      |   16 ++++++++--------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
index dcc416b..ca9aa42 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
@@ -3,14 +3,14 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH = "standard/preempt-rt/base"
 KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
 
-LINUX_VERSION ?= "3.4.26"
+LINUX_VERSION ?= "3.4.28"
 LINUX_KERNEL_TYPE = "preempt-rt"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "408343900a234254d7be8f0bb52d6f87c8fbbc76"
-SRCREV_machine_qemuppc ?= "bd7b26015e1dcbed4e8e0e9b6ac2ef4c744e0257"
-SRCREV_meta ?= "c0b3904d60830e24b3930b0fa606a48b2758d979"
+SRCREV_machine ?= "3d56b103cd7072d520c395194e620aba2f6e52e3"
+SRCREV_machine_qemuppc ?= "09178bc8825d6fb66ddcb1785f20a022c4ba2efd"
+SRCREV_meta ?= "f697e099bc76d5df3a307a5bc0cc25021dd6dfe0"
 
 PR = "${INC_PR}.0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
index 1e82d16..265d082 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
@@ -8,12 +8,12 @@ KBRANCH = "${KBRANCH_DEFAULT}"
 LINUX_KERNEL_TYPE = "tiny"
 KCONFIG_MODE = "--allnoconfig"
 
-LINUX_VERSION ?= "3.4.26"
+LINUX_VERSION ?= "3.4.28"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "59c2a9eb334c2def405c9d93ed6d8d4e822d1945"
-SRCREV_meta ?= "c0b3904d60830e24b3930b0fa606a48b2758d979"
+SRCREV_machine ?= "13809f2cfd9be0ce86bd486e1643f9b90bed6f4f"
+SRCREV_meta ?= "f697e099bc76d5df3a307a5bc0cc25021dd6dfe0"
 
 PR = "${INC_PR}.0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
index 7be330a..4ab8c73 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
@@ -3,17 +3,17 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH_DEFAULT = "standard/base"
 KBRANCH = "${KBRANCH_DEFAULT}"
 
-SRCREV_machine_qemuarm ?= "b5a80c6a46604d7636c18a3e1ad362d1e6ed234e"
-SRCREV_machine_qemumips  ?= "66bc662b2cd469a9807fbe838069d3f85cb01bd9"
-SRCREV_machine_qemuppc ?= "d771422df10af41ee61598f4aa06e3c3a018c323"
-SRCREV_machine_qemux86 ?= "59c2a9eb334c2def405c9d93ed6d8d4e822d1945"
-SRCREV_machine_qemux86-64 ?= "59c2a9eb334c2def405c9d93ed6d8d4e822d1945"
-SRCREV_machine ?= "59c2a9eb334c2def405c9d93ed6d8d4e822d1945"
-SRCREV_meta ?= "c0b3904d60830e24b3930b0fa606a48b2758d979"
+SRCREV_machine_qemuarm ?= "a720acacc415b3323a3ee9076bf9a621a964af2f"
+SRCREV_machine_qemumips  ?= "7d9f14326db1e602b4408f295bef7d12fd07dd55"
+SRCREV_machine_qemuppc ?= "62d3cb6a8e048c4833a5501bea2f35998de0b89d"
+SRCREV_machine_qemux86 ?= "13809f2cfd9be0ce86bd486e1643f9b90bed6f4f"
+SRCREV_machine_qemux86-64 ?= "13809f2cfd9be0ce86bd486e1643f9b90bed6f4f"
+SRCREV_machine ?= "13809f2cfd9be0ce86bd486e1643f9b90bed6f4f"
+SRCREV_meta ?= "f697e099bc76d5df3a307a5bc0cc25021dd6dfe0"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-LINUX_VERSION ?= "3.4.26"
+LINUX_VERSION ?= "3.4.28"
 
 PR = "${INC_PR}.3"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.7.10.4



