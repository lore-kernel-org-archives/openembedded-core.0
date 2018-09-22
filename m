Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C51387981D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Sep 2018 17:20:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8MHJcp4023445
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 22 Sep 2018 10:20:04 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Sat, 22 Sep 2018 10:19:54 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Sat, 22 Sep 2018 13:18:50 -0400
Message-ID: <d862456f6a40408f99a705b13c4d77500264d08e.1537636541.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1537636541.git.bruce.ashfield@windriver.com>
References: <cover.1537636541.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/8] linux-yocto: tweak RTC configuration
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
X-List-Received-Date: Sat, 22 Sep 2018 17:20:23 -0000
Content-Type: text/plain

[
  Author: Jens Rehsack <sno@netbsd.org>
  Date:   Thu Sep 13 19:29:54 2018 +0200

    cfg/timer/rtc: toggle RTC_CLASS instead of GEN_RTC

    In 2016, the final removal of GEN_RTC happened with commit
    6705fdb3 char/genrtc: remove the rest of the driver

    What is remaining, is a legacy driver (char/rtc) and the new
    RTC_CLASS framework - which supports everything except S390
    and Atari. Many platforms automatically support the right
    driver for RTC_CLASS framework.

    Signed-off-by: Jens Rehsack <sno@netbsd.org>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
]

Signed-off-by: Jens Rehsack <sno@netbsd.org>
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
index 86ce03ca4cca..dc53d6a140f8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "af1b926c9160b0dbf2bbe41b166a8a7b07191fd2"
-SRCREV_meta ?= "634d8f2230d1fb0b9ad4af974509d25d36e5179c"
+SRCREV_meta ?= "0936b18ed8d58257f8f1d79c085adbf6d4362530"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.14;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
index bd435c8890c4..15e788142722 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "d8a8f28746fdb335c3d6cab69a8b64156340c1c7"
-SRCREV_meta ?= "a0f78294ba59f10e8859595a540b220359db5573"
+SRCREV_meta ?= "eae1bf4c938bd04beb6a1b2405e86d2cef88426f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.18;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
index 4c2c7f75dc96..009b9262f6d5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
@@ -13,7 +13,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "74ecbeb03ebfc2b9a73a6554924b043b903295f5"
-SRCREV_meta ?= "634d8f2230d1fb0b9ad4af974509d25d36e5179c"
+SRCREV_meta ?= "0936b18ed8d58257f8f1d79c085adbf6d4362530"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
index 9456ec47701c..19355de67aec 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
@@ -14,7 +14,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "2a412d007ecc39f8d843fcb5ae2259f7f434b1ea"
-SRCREV_meta ?= "a0f78294ba59f10e8859595a540b220359db5573"
+SRCREV_meta ?= "eae1bf4c938bd04beb6a1b2405e86d2cef88426f"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.14.bb b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
index a289356c5284..1abd69c0513c 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "084af9624d268ddf4fd65b2f9e8e50ca2f22e62b"
 SRCREV_machine_qemux86-64 ?= "084af9624d268ddf4fd65b2f9e8e50ca2f22e62b"
 SRCREV_machine_qemumips64 ?= "44e1719a8f4fe10e88c13b9ec6c1fa1d041efaed"
 SRCREV_machine ?= "084af9624d268ddf4fd65b2f9e8e50ca2f22e62b"
-SRCREV_meta ?= "634d8f2230d1fb0b9ad4af974509d25d36e5179c"
+SRCREV_meta ?= "0936b18ed8d58257f8f1d79c085adbf6d4362530"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.14;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.18.bb b/meta/recipes-kernel/linux/linux-yocto_4.18.bb
index e74525edc22a..49db0d2bb93e 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.18.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "2a412d007ecc39f8d843fcb5ae2259f7f434b1ea"
 SRCREV_machine_qemux86-64 ?= "2a412d007ecc39f8d843fcb5ae2259f7f434b1ea"
 SRCREV_machine_qemumips64 ?= "1d92949184f78f9c2c71d069683d386b37cc6dca"
 SRCREV_machine ?= "2a412d007ecc39f8d843fcb5ae2259f7f434b1ea"
-SRCREV_meta ?= "a0f78294ba59f10e8859595a540b220359db5573"
+SRCREV_meta ?= "eae1bf4c938bd04beb6a1b2405e86d2cef88426f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.18;destsuffix=${KMETA}"
-- 
2.5.0


