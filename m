Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9E7ED70022
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Sep 2016 01:08:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u8818tiW022087
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 7 Sep 2016 18:08:55 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 7 Sep 2016 18:08:54 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 7 Sep 2016 21:08:47 -0400
Message-ID: <c2eac7f6d5b97fd5ca8b3688e9b807ecf706f05e.1473296553.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1473296553.git.bruce.ashfield@windriver.com>
References: <cover.1473296553.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] kernel-yocto: restore missing configuration meta data
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
X-List-Received-Date: Thu, 08 Sep 2016 01:08:56 -0000
Content-Type: text/plain

Some of the meta-data from the 4.4 kernel was missing from the 4.8
branch. This resulted in some functionality drops and also a size/time
increase in the kernel build (due to debug being turned on).

With this resync, we now have the missing config restored.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.8.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
index c602bd3b2c9c..9fe0112fff4f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "a7d71794e4e38d2f861c1b1dbff761ae0b0836b3"
-SRCREV_meta ?= "8cb7317502c2577f8c83eaf1c061603023824313"
+SRCREV_meta ?= "dd820fa5f7079ac75338f0484151e6454db06951"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.8.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.8;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
index ea89eebe6617..7ef5e7e83484 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "3eab887a55424fc2c27553b7bfe32330df83f7b8"
-SRCREV_meta ?= "8cb7317502c2577f8c83eaf1c061603023824313"
+SRCREV_meta ?= "dd820fa5f7079ac75338f0484151e6454db06951"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.8.bb b/meta/recipes-kernel/linux/linux-yocto_4.8.bb
index cf31d3c846bd..279c0db924fa 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.8.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "a7d71794e4e38d2f861c1b1dbff761ae0b0836b3"
 SRCREV_machine_qemux86-64 ?= "a7d71794e4e38d2f861c1b1dbff761ae0b0836b3"
 SRCREV_machine_qemumips64 ?= "a4793b209b32964533e37ebd28a72b757c0f651a"
 SRCREV_machine ?= "a7d71794e4e38d2f861c1b1dbff761ae0b0836b3"
-SRCREV_meta ?= "8cb7317502c2577f8c83eaf1c061603023824313"
+SRCREV_meta ?= "dd820fa5f7079ac75338f0484151e6454db06951"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.8.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.8;destsuffix=${KMETA}"
-- 
2.5.0


