Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1A7B1757AC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 22:17:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t8OMHt1p009664
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 24 Sep 2015 15:17:56 -0700 (PDT)
Received: from yow-bashfiel-d4.corp.ad.wrs.com (147.11.116.147) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Thu, 24 Sep 2015 15:17:55 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 24 Sep 2015 18:17:53 -0400
Message-ID: <f0c6e4af7ed7f7555786cf509df4310055fa7355.1443132765.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1443132765.git.bruce.ashfield@windriver.com>
References: <cover.1443132765.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] linux-yocto/4.1: common-pc-drivers: add CONFIG_PATA_SCH
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
X-List-Received-Date: Thu, 24 Sep 2015 22:17:58 -0000
Content-Type: text/plain

Updating the meta SRCREVs to integrate the following config change:

Author: Saul Wold <sgw@linux.intel.com>
Date:   Tue Sep 22 07:23:06 2015 -0700

    common-pc-drivers: add CONFIG_PATA_SCH

    The NUC uses this hardware and should still operate correctly with a
    genericx86

    Signed-off-by: Saul Wold <sgw@linux.intel.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index ad26334cd134..0d9ecf50cc19 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -3,7 +3,7 @@ KBRANCH ?= "standard/preempt-rt"
 require recipes-kernel/linux/linux-yocto.inc
 
 SRCREV_machine ?= "79a31b9d23db126f8a6be3eb88fd683056a213f1"
-SRCREV_meta ?= "ef417dc3dbac098e2273b9157bf7ea8b1ade0ec5"
+SRCREV_meta ?= "5ecf2a70fee383f13388a97086c4a8766fc9cbcc"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index 63fca3f0842d..69aac25e74bb 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "79a31b9d23db126f8a6be3eb88fd683056a213f1"
-SRCREV_meta ?= "ef417dc3dbac098e2273b9157bf7ea8b1ade0ec5"
+SRCREV_meta ?= "5ecf2a70fee383f13388a97086c4a8766fc9cbcc"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index d5a612bd29bc..0d8d28136736 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "79a31b9d23db126f8a6be3eb88fd683056a213f1"
 SRCREV_machine_qemux86-64 ?= "79a31b9d23db126f8a6be3eb88fd683056a213f1"
 SRCREV_machine_qemumips64 ?= "049105492e5657dd735bad1aa3a32f4f752a9edd"
 SRCREV_machine ?= "79a31b9d23db126f8a6be3eb88fd683056a213f1"
-SRCREV_meta ?= "ef417dc3dbac098e2273b9157bf7ea8b1ade0ec5"
+SRCREV_meta ?= "5ecf2a70fee383f13388a97086c4a8766fc9cbcc"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
-- 
2.1.0


