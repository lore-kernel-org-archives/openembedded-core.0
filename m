Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D28E0731D2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 16:57:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u6RGvEmY008702
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 27 Jul 2016 09:57:14 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 27 Jul 2016 09:57:14 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 27 Jul 2016 12:57:07 -0400
Message-ID: <be0801ec0a04ed59d57b42f1ae8960ccc3be8b39.1469638333.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1469638333.git.bruce.ashfield@windriver.com>
References: <cover.1469638333.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5] linux-yocto/4.4: lx-dialog and mei bug fixes
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
X-List-Received-Date: Wed, 27 Jul 2016 16:57:15 -0000
Content-Type: text/plain

Integrating the following changes, that resolve issues with previous
functionality merges:

  ddab24299940 mei: drop wr_msg from the mei_dev structure
  26e282c0686e lx-dialog: fix merge issues

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 18 +++++++++---------
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index 64b81496d2d7..ec573083c111 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "3bdc347cc2087a0217e3acddccda5bb775cd570b"
-SRCREV_meta ?= "8c6158ec5e43a4cae59058af49f70e0406d18091"
+SRCREV_meta ?= "4789b41c5605189902d2c1a674f8616d41ee218d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index b32721ba5bbe..635d91ca3ad7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -9,8 +9,8 @@ LINUX_VERSION ?= "4.4.15"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "1238684aa5173dc6f431ad1b3c85a37830244824"
-SRCREV_meta ?= "8c6158ec5e43a4cae59058af49f70e0406d18091"
+SRCREV_machine ?= "ddab242999407fadae68e7ee5381b0ec6679d443"
+SRCREV_meta ?= "4789b41c5605189902d2c1a674f8616d41ee218d"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index f68fdfa0f738..036a5b1550e3 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "75b02cc20216b6a068e1757a997f4e0d405d6ded"
-SRCREV_machine_qemuarm64 ?= "1238684aa5173dc6f431ad1b3c85a37830244824"
-SRCREV_machine_qemumips ?= "e656b69259deb08cfe6d606fb126b4c0810abf64"
-SRCREV_machine_qemuppc ?= "1238684aa5173dc6f431ad1b3c85a37830244824"
-SRCREV_machine_qemux86 ?= "1238684aa5173dc6f431ad1b3c85a37830244824"
-SRCREV_machine_qemux86-64 ?= "1238684aa5173dc6f431ad1b3c85a37830244824"
-SRCREV_machine_qemumips64 ?= "8c40a1bc5e4ece3f72d4ade764087bd0fcc01c38"
-SRCREV_machine ?= "1238684aa5173dc6f431ad1b3c85a37830244824"
-SRCREV_meta ?= "8c6158ec5e43a4cae59058af49f70e0406d18091"
+SRCREV_machine_qemuarm ?= "c2507bd62854f90030433307a3d783474332f821"
+SRCREV_machine_qemuarm64 ?= "ddab242999407fadae68e7ee5381b0ec6679d443"
+SRCREV_machine_qemumips ?= "8d0a4875a93017329b32b42ce7d67b02f63a173b"
+SRCREV_machine_qemuppc ?= "ddab242999407fadae68e7ee5381b0ec6679d443"
+SRCREV_machine_qemux86 ?= "ddab242999407fadae68e7ee5381b0ec6679d443"
+SRCREV_machine_qemux86-64 ?= "ddab242999407fadae68e7ee5381b0ec6679d443"
+SRCREV_machine_qemumips64 ?= "df3ba701aa1fa3b2faadc5445003e7577aa4f016"
+SRCREV_machine ?= "ddab242999407fadae68e7ee5381b0ec6679d443"
+SRCREV_meta ?= "4789b41c5605189902d2c1a674f8616d41ee218d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
-- 
2.5.0


