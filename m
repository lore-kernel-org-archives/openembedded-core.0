Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 18BF16E660
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Sep 2018 17:19:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w8MHJR0a021470
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 22 Sep 2018 10:19:27 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Sat, 22 Sep 2018 10:19:26 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Sat, 22 Sep 2018 13:18:48 -0400
Message-ID: <a9a51ca2124c6b34f28b9b2b3a519882c12a77cd.1537636541.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1537636541.git.bruce.ashfield@windriver.com>
References: <cover.1537636541.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/8] linux-yocto: configuration warning fixes
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
X-List-Received-Date: Sat, 22 Sep 2018 17:19:28 -0000
Content-Type: text/plain

Integrating the following commits to address kernel configuration
audit warnings:

  856794172e8f features/intel-pinctrl: Fix conflict with configs
  397b67321037 bsp/intel-x86: Rename CONFIG_R8723BE to CONFIG_RTL8723BE
  fca2a16483f2 features/thermal: Add dependency for kernel option
  b6110e2e8e55 features/tpm: fix conflict with configs and add dependency
  ee22bc1f8fcd features/mmc: modify dependency
  e50eb6bd929b features: drop the obsolete kernel option
  f5327047994f features/hostapd: drop obsolete configs
  48b54e625876 bsp/intel-x86: Drop configs that has been removed by kernel

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
index 350d907a4ef6..86ce03ca4cca 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "af1b926c9160b0dbf2bbe41b166a8a7b07191fd2"
-SRCREV_meta ?= "9beb3a28736e7b00199641864a46ee4b8e2e6428"
+SRCREV_meta ?= "634d8f2230d1fb0b9ad4af974509d25d36e5179c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.14;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
index 5333e156cd77..3e0e3dc40ed1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "6b38725fe97a59cefef01b5213a1d234dd38a542"
-SRCREV_meta ?= "73417203913023f9438ea196377a363233857172"
+SRCREV_meta ?= "856794172e8f046e7d6542e09d431c5a412a8a45"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.18;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
index 393295846ea3..4c2c7f75dc96 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
@@ -13,7 +13,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "74ecbeb03ebfc2b9a73a6554924b043b903295f5"
-SRCREV_meta ?= "9beb3a28736e7b00199641864a46ee4b8e2e6428"
+SRCREV_meta ?= "634d8f2230d1fb0b9ad4af974509d25d36e5179c"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
index 704035f8992a..60ceef6db293 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
@@ -14,7 +14,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "71799edb8a38622626cf3b5582dff152b512ccf0"
-SRCREV_meta ?= "73417203913023f9438ea196377a363233857172"
+SRCREV_meta ?= "856794172e8f046e7d6542e09d431c5a412a8a45"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.14.bb b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
index ff1497918633..a289356c5284 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "084af9624d268ddf4fd65b2f9e8e50ca2f22e62b"
 SRCREV_machine_qemux86-64 ?= "084af9624d268ddf4fd65b2f9e8e50ca2f22e62b"
 SRCREV_machine_qemumips64 ?= "44e1719a8f4fe10e88c13b9ec6c1fa1d041efaed"
 SRCREV_machine ?= "084af9624d268ddf4fd65b2f9e8e50ca2f22e62b"
-SRCREV_meta ?= "9beb3a28736e7b00199641864a46ee4b8e2e6428"
+SRCREV_meta ?= "634d8f2230d1fb0b9ad4af974509d25d36e5179c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.14;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.18.bb b/meta/recipes-kernel/linux/linux-yocto_4.18.bb
index d6e3768d9245..80c36d72e36f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.18.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "71799edb8a38622626cf3b5582dff152b512ccf0"
 SRCREV_machine_qemux86-64 ?= "71799edb8a38622626cf3b5582dff152b512ccf0"
 SRCREV_machine_qemumips64 ?= "f3add308bccafeeed79fde2a3720236bf4fd6457"
 SRCREV_machine ?= "71799edb8a38622626cf3b5582dff152b512ccf0"
-SRCREV_meta ?= "73417203913023f9438ea196377a363233857172"
+SRCREV_meta ?= "856794172e8f046e7d6542e09d431c5a412a8a45"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.18;destsuffix=${KMETA}"
-- 
2.5.0


