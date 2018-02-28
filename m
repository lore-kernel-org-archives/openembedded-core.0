Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 563197887F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Feb 2018 02:06:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w1S26wrg020658
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 27 Feb 2018 18:06:59 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Tue, 27 Feb 2018 18:06:32 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 27 Feb 2018 21:06:54 -0500
Message-ID: <800a060ed6aa52970d0672be3b63acf046abf522.1519783331.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1519783331.git.bruce.ashfield@windriver.com>
References: <cover.1519783331.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] linux-yocto/4.14/4.15: yaffs2 fixes
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
X-List-Received-Date: Wed, 28 Feb 2018 02:07:00 -0000
Content-Type: text/plain

Integrating the following fixes for yaffs2:

  9f9649fffac9 yaffs2: Adjust the timer callback and init functions
  0ef24a829eee yaffs2: include rawnand.h instead of nand.h

Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_4.14.bb      | 18 +++++++++---------
 meta/recipes-kernel/linux/linux-yocto_4.15.bb      | 18 +++++++++---------
 6 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
index d1f338f52ca9..b181f2064f97 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "801d947020635762ac9af9ddf2edfaa1b2858414"
-SRCREV_meta ?= "b4468b54b2a7e7fbdf207ead7ca925bc24976d1b"
+SRCREV_machine ?= "7d5b8bc3ba49d0ea78fbbb7c628ee56a08a60253"
+SRCREV_meta ?= "c5e05f3c61046bf6445adff30d5a03a82677d351"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.14;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb
index 7e2d6998fea2..d908eeca0ce8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "a6a3a6a73d628798fc6eb6832bf829a9ea43f6bd"
-SRCREV_meta ?= "030f397472fc8ea8e7f8a069153bc3b6d52f3d45"
+SRCREV_machine ?= "9f9649fffac97603862fdc90530e0b3ff038eed1"
+SRCREV_meta ?= "ac4dd298328c282f5e70b3ddb469edcad57590cf"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.15;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
index 62d6a34fb0fa..dcf4ff4af6b4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
@@ -9,8 +9,8 @@ LINUX_VERSION ?= "4.14.19"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "537602db26fe2d26c1959f1ecb43966770c10ff2"
-SRCREV_meta ?= "b4468b54b2a7e7fbdf207ead7ca925bc24976d1b"
+SRCREV_machine ?= "57ed1d816d318dfafd0339fade9c694b3c00998d"
+SRCREV_meta ?= "c5e05f3c61046bf6445adff30d5a03a82677d351"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb
index 72abe438eda5..d7bc84878643 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb
@@ -18,8 +18,8 @@ SRCREV_machine_qemuppc ?= "9c2e6c0fc71526c45fc7ddf3ec91e2e2f27e3da0"
 SRCREV_machine_qemux86 ?= "9c2e6c0fc71526c45fc7ddf3ec91e2e2f27e3da0"
 SRCREV_machine_qemux86-64 ?= "9c2e6c0fc71526c45fc7ddf3ec91e2e2f27e3da0"
 SRCREV_machine_qemumips64 ?= "f9a3a72209bde080e4ecb4fbe7a0f99954643131"
-SRCREV_machine ?= "a6a3a6a73d628798fc6eb6832bf829a9ea43f6bd"
-SRCREV_meta ?= "030f397472fc8ea8e7f8a069153bc3b6d52f3d45"
+SRCREV_machine ?= "9f9649fffac97603862fdc90530e0b3ff038eed1"
+SRCREV_meta ?= "ac4dd298328c282f5e70b3ddb469edcad57590cf"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.15;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.14.bb b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
index 070d08e01038..bfae61d28905 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
@@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "v4.14/standard/base"
 KBRANCH_qemux86-64 ?= "v4.14/standard/base"
 KBRANCH_qemumips64 ?= "v4.14/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "773cb1d2d59644bf9574abed9803f8ec12bbabe1"
-SRCREV_machine_qemuarm64 ?= "537602db26fe2d26c1959f1ecb43966770c10ff2"
-SRCREV_machine_qemumips ?= "5fad9fa9377a7badd71ae4c1f1b1108d8cfcb047"
-SRCREV_machine_qemuppc ?= "537602db26fe2d26c1959f1ecb43966770c10ff2"
-SRCREV_machine_qemux86 ?= "537602db26fe2d26c1959f1ecb43966770c10ff2"
-SRCREV_machine_qemux86-64 ?= "537602db26fe2d26c1959f1ecb43966770c10ff2"
-SRCREV_machine_qemumips64 ?= "141cd6a1644eade83d4d43675a9ab11824ea01ea"
-SRCREV_machine ?= "537602db26fe2d26c1959f1ecb43966770c10ff2"
-SRCREV_meta ?= "b4468b54b2a7e7fbdf207ead7ca925bc24976d1b"
+SRCREV_machine_qemuarm ?= "481c15cd5198aa4de9faa1b0edcf69e08f45540b"
+SRCREV_machine_qemuarm64 ?= "57ed1d816d318dfafd0339fade9c694b3c00998d"
+SRCREV_machine_qemumips ?= "b1adde8239132a9e189acbfd0e1c27d1a4ae695f"
+SRCREV_machine_qemuppc ?= "57ed1d816d318dfafd0339fade9c694b3c00998d"
+SRCREV_machine_qemux86 ?= "57ed1d816d318dfafd0339fade9c694b3c00998d"
+SRCREV_machine_qemux86-64 ?= "57ed1d816d318dfafd0339fade9c694b3c00998d"
+SRCREV_machine_qemumips64 ?= "971d3f31a5caf6035dbff8cefea2323c196178a9"
+SRCREV_machine ?= "57ed1d816d318dfafd0339fade9c694b3c00998d"
+SRCREV_meta ?= "c5e05f3c61046bf6445adff30d5a03a82677d351"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.14;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.15.bb b/meta/recipes-kernel/linux/linux-yocto_4.15.bb
index fea14ccf8ea5..daad4309b7af 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.15.bb
@@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "v4.15/standard/base"
 KBRANCH_qemux86-64 ?= "v4.15/standard/base"
 KBRANCH_qemumips64 ?= "v4.15/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "312b80a833f6be40034526f3155360f61d78608a"
-SRCREV_machine_qemuarm64 ?= "a6a3a6a73d628798fc6eb6832bf829a9ea43f6bd"
-SRCREV_machine_qemumips ?= "a52de76fa49f7c93031a807d8668ae2d7c2c4d0a"
-SRCREV_machine_qemuppc ?= "a6a3a6a73d628798fc6eb6832bf829a9ea43f6bd"
-SRCREV_machine_qemux86 ?= "a6a3a6a73d628798fc6eb6832bf829a9ea43f6bd"
-SRCREV_machine_qemux86-64 ?= "a6a3a6a73d628798fc6eb6832bf829a9ea43f6bd"
-SRCREV_machine_qemumips64 ?= "3a25d83e268bd34ff12f12011b0b8254e86833a2"
-SRCREV_machine ?= "a6a3a6a73d628798fc6eb6832bf829a9ea43f6bd"
-SRCREV_meta ?= "030f397472fc8ea8e7f8a069153bc3b6d52f3d45"
+SRCREV_machine_qemuarm ?= "5a2a8f7f757b964da55bd3d2a95130051af2c173"
+SRCREV_machine_qemuarm64 ?= "9f9649fffac97603862fdc90530e0b3ff038eed1"
+SRCREV_machine_qemumips ?= "ee76cb3c65f9138c9e580c13feff6d0c6ebf5f9a"
+SRCREV_machine_qemuppc ?= "9f9649fffac97603862fdc90530e0b3ff038eed1"
+SRCREV_machine_qemux86 ?= "9f9649fffac97603862fdc90530e0b3ff038eed1"
+SRCREV_machine_qemux86-64 ?= "9f9649fffac97603862fdc90530e0b3ff038eed1"
+SRCREV_machine_qemumips64 ?= "3b587c8f1db7c5b425b35a98276c6d9b8dd61a2b"
+SRCREV_machine ?= "9f9649fffac97603862fdc90530e0b3ff038eed1"
+SRCREV_meta ?= "ac4dd298328c282f5e70b3ddb469edcad57590cf"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.15;destsuffix=${KMETA}"
-- 
2.5.0


