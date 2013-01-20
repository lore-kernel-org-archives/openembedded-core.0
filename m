Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1TwnhR-00052z-Bl
	for openembedded-core@lists.openembedded.org;
	Sun, 20 Jan 2013 06:44:10 +0100
Received: from yow-bashfiel-d3.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r0K5Schs024828;
	Sat, 19 Jan 2013 21:28:39 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Sun, 20 Jan 2013 00:28:29 -0500
Message-Id: <5849a4feb7c18a56124444688a201211914809ac.1358659549.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1358659549.git.bruce.ashfield@windriver.com>
References: <cover.1358659549.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1358659549.git.bruce.ashfield@windriver.com>
References: <cover.1358659549.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] linux-yocto/3.4: update to 3.4.26 and 3.4.25-rt37
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
X-List-Received-Date: Sun, 20 Jan 2013 05:44:10 -0000

Updating the yocto 3.4 kernel tree to the 3.4.25 and 3.4.26 -stable updates
as well as refreshing the preempt-rt branches to 3.4.25-rt37.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb   |    8 ++++----
 meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb |    6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.4.bb      |   16 ++++++++--------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
index 25e9a10..ca5eeda 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
@@ -3,14 +3,14 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH = "standard/preempt-rt/base"
 KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
 
-LINUX_VERSION ?= "3.4.24"
+LINUX_VERSION ?= "3.4.26"
 LINUX_KERNEL_TYPE = "preempt-rt"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "086782fe576d96cda54068a2248c697a9f1946c6"
-SRCREV_machine_qemuppc ?= "4a3d7cbda063ece64ba286749e23bfd4b81831b8"
-SRCREV_meta ?= "2cbb5aca2c25e37b04828cf0b7d90e2f22af816e"
+SRCREV_machine ?= "408343900a234254d7be8f0bb52d6f87c8fbbc76"
+SRCREV_machine_qemuppc ?= "bd7b26015e1dcbed4e8e0e9b6ac2ef4c744e0257"
+SRCREV_meta ?= "3b37e8fd4c88d5d3dce94fc1a80aee49a60a69a8"
 
 PR = "${INC_PR}.0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
index 17eb6dd..67a9c87 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
@@ -8,12 +8,12 @@ KBRANCH = "${KBRANCH_DEFAULT}"
 LINUX_KERNEL_TYPE = "tiny"
 KCONFIG_MODE = "--allnoconfig"
 
-LINUX_VERSION ?= "3.4.24"
+LINUX_VERSION ?= "3.4.26"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "7146d001a5f95068a3e2da23a8b3d15aeb20087a"
-SRCREV_meta ?= "2cbb5aca2c25e37b04828cf0b7d90e2f22af816e"
+SRCREV_machine ?= "59c2a9eb334c2def405c9d93ed6d8d4e822d1945"
+SRCREV_meta ?= "3b37e8fd4c88d5d3dce94fc1a80aee49a60a69a8"
 
 PR = "${INC_PR}.0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
index 62eb4be..05ca1cc 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
@@ -3,17 +3,17 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH_DEFAULT = "standard/base"
 KBRANCH = "${KBRANCH_DEFAULT}"
 
-SRCREV_machine_qemuarm ?= "2ed05c280920e592f62d09bda15ab006baffa996"
-SRCREV_machine_qemumips  ?= "81ef4ad8f02c979a236a460c6831dcb4fbf2ef3c"
-SRCREV_machine_qemuppc ?= "6b5d5a60ca6c3cf05d28c9ad447c133563340232"
-SRCREV_machine_qemux86 ?= "7146d001a5f95068a3e2da23a8b3d15aeb20087a"
-SRCREV_machine_qemux86-64 ?= "7146d001a5f95068a3e2da23a8b3d15aeb20087a"
-SRCREV_machine ?= "7146d001a5f95068a3e2da23a8b3d15aeb20087a"
-SRCREV_meta ?= "2cbb5aca2c25e37b04828cf0b7d90e2f22af816e"
+SRCREV_machine_qemuarm ?= "b5a80c6a46604d7636c18a3e1ad362d1e6ed234e"
+SRCREV_machine_qemumips  ?= "66bc662b2cd469a9807fbe838069d3f85cb01bd9"
+SRCREV_machine_qemuppc ?= "d771422df10af41ee61598f4aa06e3c3a018c323"
+SRCREV_machine_qemux86 ?= "59c2a9eb334c2def405c9d93ed6d8d4e822d1945"
+SRCREV_machine_qemux86-64 ?= "59c2a9eb334c2def405c9d93ed6d8d4e822d1945"
+SRCREV_machine ?= "59c2a9eb334c2def405c9d93ed6d8d4e822d1945"
+SRCREV_meta ?= "3b37e8fd4c88d5d3dce94fc1a80aee49a60a69a8"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-LINUX_VERSION ?= "3.4.24"
+LINUX_VERSION ?= "3.4.26"
 
 PR = "${INC_PR}.3"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.7.10.4



