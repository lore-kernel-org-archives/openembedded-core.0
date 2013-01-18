Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1Tw4ba-0000Ri-6F
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Jan 2013 06:35:15 +0100
Received: from yow-bashfiel-d3.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r0I5JaTH006246;
	Thu, 17 Jan 2013 21:19:40 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Fri, 18 Jan 2013 00:19:31 -0500
Message-Id: <c78b8353f2c6469fe29409b43b467e307c637fea.1358485481.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1358485481.git.bruce.ashfield@windriver.com>
References: <cover.1358485481.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1358485481.git.bruce.ashfield@windriver.com>
References: <cover.1358485481.git.bruce.ashfield@windriver.com>
Cc: linux-yocto@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: [PATCH 6/7] linux-yocto/3.4: integrate LTSI-3.4
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
X-List-Received-Date: Fri, 18 Jan 2013 05:35:16 -0000

Updating the linux-yocto-3.4 SRCREVS to activate the merge of the 3.4.25-ltsi
tree:

   http://git.linuxfoundation.org/?p=ltsi-kernel.git;a=tag;h=refs/tags/v3.4.25-ltsi

The pristine patch queue can be seen on the "ltsi" branch in the repository.
This branch has been merged into the standard/base branch of linux-yocto-3.4
and to all BSP branches in the tree.

LTSI based BSPs or features are not activated as part of this commit, they
are controlled by the meta branch of the kernel repository and are activated
in separate patches.

[YOCTO #2396]

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb   |    4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.4.bb      |   12 ++++++------
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
index bcac395..25e9a10 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
@@ -8,8 +8,8 @@ LINUX_KERNEL_TYPE = "preempt-rt"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "729e8634f75bf10582916eae6b5b96325785c001"
-SRCREV_machine_qemuppc ?= "15ce18fac50c49ea4893b0d7ed3d0086ef9c7448"
+SRCREV_machine ?= "086782fe576d96cda54068a2248c697a9f1946c6"
+SRCREV_machine_qemuppc ?= "4a3d7cbda063ece64ba286749e23bfd4b81831b8"
 SRCREV_meta ?= "2cbb5aca2c25e37b04828cf0b7d90e2f22af816e"
 
 PR = "${INC_PR}.0"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
index 984476f..17eb6dd 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
@@ -12,7 +12,7 @@ LINUX_VERSION ?= "3.4.24"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "5432e2acb6053f9f7563cf63abd101ed2fdc1b6f"
+SRCREV_machine ?= "7146d001a5f95068a3e2da23a8b3d15aeb20087a"
 SRCREV_meta ?= "2cbb5aca2c25e37b04828cf0b7d90e2f22af816e"
 
 PR = "${INC_PR}.0"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
index 0ac51b9..62eb4be 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
@@ -3,12 +3,12 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH_DEFAULT = "standard/base"
 KBRANCH = "${KBRANCH_DEFAULT}"
 
-SRCREV_machine_qemuarm ?= "50986c7d971c28505acdbdcab6601f4d5b6dbff4"
-SRCREV_machine_qemumips  ?= "4d355c57fe0d9f117c272f1679fa3d3f451a8c8e"
-SRCREV_machine_qemuppc ?= "1c8a1aa8cc839f0328edbfe0d755100368bc4ae6"
-SRCREV_machine_qemux86 ?= "5432e2acb6053f9f7563cf63abd101ed2fdc1b6f"
-SRCREV_machine_qemux86-64 ?= "5432e2acb6053f9f7563cf63abd101ed2fdc1b6f"
-SRCREV_machine ?= "5432e2acb6053f9f7563cf63abd101ed2fdc1b6f"
+SRCREV_machine_qemuarm ?= "2ed05c280920e592f62d09bda15ab006baffa996"
+SRCREV_machine_qemumips  ?= "81ef4ad8f02c979a236a460c6831dcb4fbf2ef3c"
+SRCREV_machine_qemuppc ?= "6b5d5a60ca6c3cf05d28c9ad447c133563340232"
+SRCREV_machine_qemux86 ?= "7146d001a5f95068a3e2da23a8b3d15aeb20087a"
+SRCREV_machine_qemux86-64 ?= "7146d001a5f95068a3e2da23a8b3d15aeb20087a"
+SRCREV_machine ?= "7146d001a5f95068a3e2da23a8b3d15aeb20087a"
 SRCREV_meta ?= "2cbb5aca2c25e37b04828cf0b7d90e2f22af816e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
-- 
1.7.10.4



