Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6310B70022
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Sep 2016 01:08:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u8818uHH015177
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 7 Sep 2016 18:08:56 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 7 Sep 2016 18:08:55 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 7 Sep 2016 21:08:48 -0400
Message-ID: <4d4a31993e794fe69a20600966a7ffb01d1c1245.1473296553.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1473296553.git.bruce.ashfield@windriver.com>
References: <cover.1473296553.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5] linux-yocto: update to 4.8-rc5
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
X-List-Received-Date: Thu, 08 Sep 2016 01:08:57 -0000
Content-Type: text/plain

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_4.8.bb      | 18 +++++++++---------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
index 9fe0112fff4f..84699ef70908 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "a7d71794e4e38d2f861c1b1dbff761ae0b0836b3"
-SRCREV_meta ?= "dd820fa5f7079ac75338f0484151e6454db06951"
+SRCREV_machine ?= "9e7ee5155e3466824abe94eebb641c63ab5cd5f2"
+SRCREV_meta ?= "25fb74eaaef249519f25e243e7f9bf0cab0e1781"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.8.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.8;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
index 7ef5e7e83484..58d3fea6c95d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
@@ -9,8 +9,8 @@ LINUX_VERSION ?= "4.8-rc4"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "3eab887a55424fc2c27553b7bfe32330df83f7b8"
-SRCREV_meta ?= "dd820fa5f7079ac75338f0484151e6454db06951"
+SRCREV_machine ?= "9e7ee5155e3466824abe94eebb641c63ab5cd5f2"
+SRCREV_meta ?= "25fb74eaaef249519f25e243e7f9bf0cab0e1781"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.8.bb b/meta/recipes-kernel/linux/linux-yocto_4.8.bb
index 279c0db924fa..d6837d8a1827 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.8.bb
@@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "20544507201f870a365c43759e5dea1ab49a2d68"
-SRCREV_machine_qemuarm64 ?= "3eab887a55424fc2c27553b7bfe32330df83f7b8"
-SRCREV_machine_qemumips ?= "03d4caf37d133a923e49b8ad6d814ee299cf92c7"
-SRCREV_machine_qemuppc ?= "3eab887a55424fc2c27553b7bfe32330df83f7b8"
-SRCREV_machine_qemux86 ?= "a7d71794e4e38d2f861c1b1dbff761ae0b0836b3"
-SRCREV_machine_qemux86-64 ?= "a7d71794e4e38d2f861c1b1dbff761ae0b0836b3"
-SRCREV_machine_qemumips64 ?= "a4793b209b32964533e37ebd28a72b757c0f651a"
-SRCREV_machine ?= "a7d71794e4e38d2f861c1b1dbff761ae0b0836b3"
-SRCREV_meta ?= "dd820fa5f7079ac75338f0484151e6454db06951"
+SRCREV_machine_qemuarm ?= "9a91ef47f85a741d842b876267b29f8ded751f68"
+SRCREV_machine_qemuarm64 ?= "9e7ee5155e3466824abe94eebb641c63ab5cd5f2"
+SRCREV_machine_qemumips ?= "40c7a721efe2822fdb7df4b2902a1994add40a77"
+SRCREV_machine_qemuppc ?= "9e7ee5155e3466824abe94eebb641c63ab5cd5f2"
+SRCREV_machine_qemux86 ?= "9e7ee5155e3466824abe94eebb641c63ab5cd5f2"
+SRCREV_machine_qemux86-64 ?= "9e7ee5155e3466824abe94eebb641c63ab5cd5f2"
+SRCREV_machine_qemumips64 ?= "fe4805532e149324939bf9d8415ed43dac357709"
+SRCREV_machine ?= "9e7ee5155e3466824abe94eebb641c63ab5cd5f2"
+SRCREV_meta ?= "25fb74eaaef249519f25e243e7f9bf0cab0e1781"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.8.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.8;destsuffix=${KMETA}"
-- 
2.5.0


