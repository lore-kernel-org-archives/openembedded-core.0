Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9D54E79AEB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 13:40:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9HDdXB5000527
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 17 Oct 2018 06:40:04 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Wed, 17 Oct 2018 06:39:49 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 17 Oct 2018 09:38:56 -0400
Message-ID: <81996e962da8cd7a40e7cce19fd3d4062c7c1efe.1539783452.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1539783452.git.bruce.ashfield@windriver.com>
References: <cover.1539783452.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/6] linux-yocto/4.18: kernel configuration cleanups
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
X-List-Received-Date: Wed, 17 Oct 2018 13:40:23 -0000
Content-Type: text/plain

Integrating the following kernel config cleanups:

  2c4eb01d57fd media-radio.cfg: change CONFIG_RADIO_SI470X to m
  3d38c0dbb0f4 usb-typec: enable CONFIF_TYPEC
  ae6272d621dd iio: rename CONFIG_TSL2x7x to CONFIG_TSL2772
  10c18d643dea iio: change CONFIG_AD5686 to CONFIG_AD5686_SPI
  f06703a4c55e media-rc: CONFIG_LIRC is now a bool
  a8cbad4a0533 media-i2c: remove configs selected by zoran drivers
  9c43f6157a44 media-pci-capture: remove zoran configs

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.18.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
index 68d63ffe1231..920c2a5858af 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "4eb8994d5c8556fe917d851d678f7db8cfc30c77"
-SRCREV_meta ?= "607726b2d0b8e1d8c5653003448a24353a88c63b"
+SRCREV_meta ?= "76b18ecbd6c324b400c4f08e212b8acd605d2d69"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.18;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
index 69ca1dc0e08b..bf595a7717e0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
@@ -14,7 +14,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "0cdc8564c61958a39704d97e008120bd7c762f60"
-SRCREV_meta ?= "607726b2d0b8e1d8c5653003448a24353a88c63b"
+SRCREV_meta ?= "76b18ecbd6c324b400c4f08e212b8acd605d2d69"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.18.bb b/meta/recipes-kernel/linux/linux-yocto_4.18.bb
index 948ce3bb9554..e1fbb8f1f807 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.18.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "0cdc8564c61958a39704d97e008120bd7c762f60"
 SRCREV_machine_qemux86-64 ?= "0cdc8564c61958a39704d97e008120bd7c762f60"
 SRCREV_machine_qemumips64 ?= "766c469b1707fd3101116f572052a7b8d5ac0658"
 SRCREV_machine ?= "0cdc8564c61958a39704d97e008120bd7c762f60"
-SRCREV_meta ?= "607726b2d0b8e1d8c5653003448a24353a88c63b"
+SRCREV_meta ?= "76b18ecbd6c324b400c4f08e212b8acd605d2d69"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.18;destsuffix=${KMETA}"
-- 
2.5.0


