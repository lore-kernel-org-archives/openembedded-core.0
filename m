Return-Path: <zhe.he@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8919C6E672
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Oct 2017 07:20:47 +0000 (UTC)
Received: from ala-blade47.wrs.com (ala-blade47.wrs.com [147.11.105.67])
	by mail.windriver.com (8.15.2/8.15.1) with SMTP id v9A7KlZP018141;
	Tue, 10 Oct 2017 00:20:47 -0700 (PDT)
Received: by ala-blade47.wrs.com (sSMTP sendmail emulation);
	Tue, 10 Oct 2017 00:20:47 -0700
From: He Zhe <zhe.he@windriver.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Oct 2017 00:20:44 -0700
Message-Id: <20171010072044.42902-1-zhe.he@windriver.com>
X-Mailer: git-send-email 2.10.2
Cc: bruce.ashfield@windriver.com
Subject: [PATCH] linux-yocto/4.12: integrate CGL features support
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
X-List-Received-Date: Tue, 10 Oct 2017 07:20:47 -0000

The CGL features now have a 4.12 port, so we can integrate them into
the reference kernel.

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.12.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
index c49a934..faf82ed 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "16de0149674ed12d983b77a453852ac2e64584b4"
-SRCREV_meta ?= "eda4d18ce4b259c84ccd5c249c3dc5958c16928c"
+SRCREV_meta ?= "73365069d89a8423a6f9f4b5560ee6bfdfc0b3d1"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
index ba67af3..efad337 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "16de0149674ed12d983b77a453852ac2e64584b4"
-SRCREV_meta ?= "eda4d18ce4b259c84ccd5c249c3dc5958c16928c"
+SRCREV_meta ?= "73365069d89a8423a6f9f4b5560ee6bfdfc0b3d1"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.12.bb b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
index a262409..c9449e2 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "16de0149674ed12d983b77a453852ac2e64584b4"
 SRCREV_machine_qemux86-64 ?= "16de0149674ed12d983b77a453852ac2e64584b4"
 SRCREV_machine_qemumips64 ?= "9d63d9c11c44ceabd452d7ee49cf55a88c39383f"
 SRCREV_machine ?= "16de0149674ed12d983b77a453852ac2e64584b4"
-SRCREV_meta ?= "eda4d18ce4b259c84ccd5c249c3dc5958c16928c"
+SRCREV_meta ?= "73365069d89a8423a6f9f4b5560ee6bfdfc0b3d1"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
-- 
2.10.2


