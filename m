Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 15C8371AFD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2016 01:08:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u9J18Kli025516
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 18 Oct 2016 18:08:20 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 18 Oct 2016 18:08:20 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 18 Oct 2016 21:08:17 -0400
Message-ID: <6f1d08c8977a5993a734ad429372d862e6e2c797.1476839114.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1476839114.git.bruce.ashfield@windriver.com>
References: <cover.1476839114.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] linux-yocto/4.4/4.8: kernel config warning cleanups
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
X-List-Received-Date: Wed, 19 Oct 2016 01:08:21 -0000
Content-Type: text/plain

Merging the following patches into 4.4 and 4.8 to remove kernel
configuration warnings:

  bbaf01752b01 meta-yocto-bsp: beaglebone: remove the stale kernel options
  552a83790b17 features: Fix configcheck warnings in features used by intel-quark BSPs
  c33d9c2c575f features: Fix configcheck warnings in features used by intel-core* BSPs

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.8.bb      | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index 4fc3458b5fae..33091f1b4ff6 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "6f27f97ed8466b5d7390e8fbb8696c13835a0b1f"
-SRCREV_meta ?= "d9f20333c42e024d42d633b3da2458f2e0d9c52a"
+SRCREV_meta ?= "bbaf01752b0168a63b164978495fad4ead7e8972"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
index 565d8997fa54..fc1c40caf7b2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "b266f7ba78f0cb3d7073e1bf7bd7dfc92bec7431"
-SRCREV_meta ?= "03bf3dd73190db9c615565d37c02f218382a2283"
+SRCREV_meta ?= "552a83790b1797b6dd4e4c48ff5bc8f215ed57da"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.8.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.8;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index 7ca5d86dcd42..44ddf21c04b8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "f4e52341c304e044dbe581a35aad6b930c9410d1"
-SRCREV_meta ?= "d9f20333c42e024d42d633b3da2458f2e0d9c52a"
+SRCREV_meta ?= "bbaf01752b0168a63b164978495fad4ead7e8972"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
index b669efedd5dc..41ff5637ec59 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "67813e7efa3a4614e209c2f058d92ef9a636441a"
-SRCREV_meta ?= "03bf3dd73190db9c615565d37c02f218382a2283"
+SRCREV_meta ?= "552a83790b1797b6dd4e4c48ff5bc8f215ed57da"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index f2d07be2dc89..41db3f682ae6 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "f4e52341c304e044dbe581a35aad6b930c9410d1"
 SRCREV_machine_qemux86-64 ?= "f4e52341c304e044dbe581a35aad6b930c9410d1"
 SRCREV_machine_qemumips64 ?= "857685d23d1e8d8a8deb4198b139b95a5bb80825"
 SRCREV_machine ?= "f4e52341c304e044dbe581a35aad6b930c9410d1"
-SRCREV_meta ?= "d9f20333c42e024d42d633b3da2458f2e0d9c52a"
+SRCREV_meta ?= "bbaf01752b0168a63b164978495fad4ead7e8972"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.8.bb b/meta/recipes-kernel/linux/linux-yocto_4.8.bb
index bc4941bb22b2..5738f4974b9b 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.8.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "67813e7efa3a4614e209c2f058d92ef9a636441a"
 SRCREV_machine_qemux86-64 ?= "67813e7efa3a4614e209c2f058d92ef9a636441a"
 SRCREV_machine_qemumips64 ?= "674818dad577cdfc23c6c857aa2b769fc64e379c"
 SRCREV_machine ?= "67813e7efa3a4614e209c2f058d92ef9a636441a"
-SRCREV_meta ?= "03bf3dd73190db9c615565d37c02f218382a2283"
+SRCREV_meta ?= "552a83790b1797b6dd4e4c48ff5bc8f215ed57da"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.8.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.8;destsuffix=${KMETA}"
-- 
2.5.0


