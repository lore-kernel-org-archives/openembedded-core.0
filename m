Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1TwnhR-000531-Bj
	for openembedded-core@lists.openembedded.org;
	Sun, 20 Jan 2013 06:44:10 +0100
Received: from yow-bashfiel-d3.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r0K5Scht024828;
	Sat, 19 Jan 2013 21:28:39 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Sun, 20 Jan 2013 00:28:30 -0500
Message-Id: <eeea5366e87e8f3ed5543bd6af72d36215b140ae.1358659549.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1358659549.git.bruce.ashfield@windriver.com>
References: <cover.1358659549.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1358659549.git.bruce.ashfield@windriver.com>
References: <cover.1358659549.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] linux-yocto/3.4: update intel graphics features/configs
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

Updating the meta branch to import the following commits that cleanup and
reorganize the features that make up the graphics features of the Intel
BSPs

  c0b3904 meta: add config fragment for gma600 graphics driver
  f41638f meta: add config fragment for gma500 graphics driver
  ff8ad3e meta: sys940x: drop vesa fragment from bsp config
  fcb82ac meta: sys940x: remove emgd config from bsp config
  c1677bb meta: fri2: drop vesa fragment from bsp config
  7324440 meta: fri2: remove emgd config from bsp config
  dd435c6 meta: emenlow: drop vesa fragment from bsp config
  243b515 meta: emenlow: remove emgd config from bsp config
  3e1be82 meta: crownbay: drop vesa fragment from bsp config
  fc5ed4e meta: crownbay: remove emgd config from bsp config
  d46236b meta: drm-emgd.cfg: add configs for dependent routines
  db4bc5e meta: relocate git-merge of emgd branch

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb   |    2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.4.bb      |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
index ca5eeda..dcc416b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
@@ -10,7 +10,7 @@ KMETA = "meta"
 
 SRCREV_machine ?= "408343900a234254d7be8f0bb52d6f87c8fbbc76"
 SRCREV_machine_qemuppc ?= "bd7b26015e1dcbed4e8e0e9b6ac2ef4c744e0257"
-SRCREV_meta ?= "3b37e8fd4c88d5d3dce94fc1a80aee49a60a69a8"
+SRCREV_meta ?= "c0b3904d60830e24b3930b0fa606a48b2758d979"
 
 PR = "${INC_PR}.0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
index 67a9c87..1e82d16 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
@@ -13,7 +13,7 @@ LINUX_VERSION ?= "3.4.26"
 KMETA = "meta"
 
 SRCREV_machine ?= "59c2a9eb334c2def405c9d93ed6d8d4e822d1945"
-SRCREV_meta ?= "3b37e8fd4c88d5d3dce94fc1a80aee49a60a69a8"
+SRCREV_meta ?= "c0b3904d60830e24b3930b0fa606a48b2758d979"
 
 PR = "${INC_PR}.0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
index 05ca1cc..d8b00d1 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
@@ -9,7 +9,7 @@ SRCREV_machine_qemuppc ?= "d771422df10af41ee61598f4aa06e3c3a018c323"
 SRCREV_machine_qemux86 ?= "59c2a9eb334c2def405c9d93ed6d8d4e822d1945"
 SRCREV_machine_qemux86-64 ?= "59c2a9eb334c2def405c9d93ed6d8d4e822d1945"
 SRCREV_machine ?= "59c2a9eb334c2def405c9d93ed6d8d4e822d1945"
-SRCREV_meta ?= "3b37e8fd4c88d5d3dce94fc1a80aee49a60a69a8"
+SRCREV_meta ?= "c0b3904d60830e24b3930b0fa606a48b2758d979"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-- 
1.7.10.4



