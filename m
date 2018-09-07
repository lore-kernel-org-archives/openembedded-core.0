Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B790979724
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Sep 2018 13:39:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w87DctTR031853
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 7 Sep 2018 06:39:05 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Fri, 7 Sep 2018 06:38:44 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 7 Sep 2018 09:38:41 -0400
Message-ID: <749691c5ceb47959d05aaa4cf288632a264fe00e.1536327277.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1536327277.git.bruce.ashfield@windriver.com>
References: <cover.1536327277.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] linux-yocto/4.14/4.18: address kernel configuration warnings
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
X-List-Received-Date: Fri, 07 Sep 2018 13:39:30 -0000
Content-Type: text/plain

Making the following commits available to address kernel configuration
warnings:

  734172039130 preempt-rt: remove entry for aufs
  7a6753341309 common_pc: remove config audit warnings
  dea9c6aa7ddd common-pc/tiny: mask configuration warnings

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.14.bb      | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.18.bb      | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
index d9953c32bec6..48cdd3560c5c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "af1b926c9160b0dbf2bbe41b166a8a7b07191fd2"
-SRCREV_meta ?= "5c089e91b398ac284f027a4611979136becbf9b1"
+SRCREV_meta ?= "9beb3a28736e7b00199641864a46ee4b8e2e6428"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.14;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
index 5b102069f1f5..2399ac0f356d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "6b38725fe97a59cefef01b5213a1d234dd38a542"
-SRCREV_meta ?= "22eefa3b53d5231d8df49bae5e01c1b12fbd95d4"
+SRCREV_meta ?= "73417203913023f9438ea196377a363233857172"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.18;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
index a3b40a8a3f3a..393295846ea3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
@@ -13,7 +13,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "74ecbeb03ebfc2b9a73a6554924b043b903295f5"
-SRCREV_meta ?= "5c089e91b398ac284f027a4611979136becbf9b1"
+SRCREV_meta ?= "9beb3a28736e7b00199641864a46ee4b8e2e6428"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
index ec7e1fcbd9d7..704035f8992a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
@@ -14,7 +14,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "71799edb8a38622626cf3b5582dff152b512ccf0"
-SRCREV_meta ?= "22eefa3b53d5231d8df49bae5e01c1b12fbd95d4"
+SRCREV_meta ?= "73417203913023f9438ea196377a363233857172"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.14.bb b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
index 8d9b46fbd3e4..ff1497918633 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "084af9624d268ddf4fd65b2f9e8e50ca2f22e62b"
 SRCREV_machine_qemux86-64 ?= "084af9624d268ddf4fd65b2f9e8e50ca2f22e62b"
 SRCREV_machine_qemumips64 ?= "44e1719a8f4fe10e88c13b9ec6c1fa1d041efaed"
 SRCREV_machine ?= "084af9624d268ddf4fd65b2f9e8e50ca2f22e62b"
-SRCREV_meta ?= "5c089e91b398ac284f027a4611979136becbf9b1"
+SRCREV_meta ?= "9beb3a28736e7b00199641864a46ee4b8e2e6428"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.14;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.18.bb b/meta/recipes-kernel/linux/linux-yocto_4.18.bb
index fc1c1ad8e9d0..d6e3768d9245 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.18.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "71799edb8a38622626cf3b5582dff152b512ccf0"
 SRCREV_machine_qemux86-64 ?= "71799edb8a38622626cf3b5582dff152b512ccf0"
 SRCREV_machine_qemumips64 ?= "f3add308bccafeeed79fde2a3720236bf4fd6457"
 SRCREV_machine ?= "71799edb8a38622626cf3b5582dff152b512ccf0"
-SRCREV_meta ?= "22eefa3b53d5231d8df49bae5e01c1b12fbd95d4"
+SRCREV_meta ?= "73417203913023f9438ea196377a363233857172"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.18;destsuffix=${KMETA}"
-- 
2.5.0


