Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2207876A33
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 13:51:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t7ODpRn1010634
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 24 Aug 2015 06:51:27 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Mon, 24 Aug 2015 06:51:26 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 24 Aug 2015 09:51:20 -0400
Message-ID: <828e74975db9483e48ad4c69fa080e094cd48e6f.1440424002.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1440424002.git.bruce.ashfield@windriver.com>
References: <cover.1440424002.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/6] linux-yocto/3.19/4.1: add coretemp to intel-common-drivers
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
X-List-Received-Date: Mon, 24 Aug 2015 13:51:28 -0000
Content-Type: text/plain

Updating the 3.19 and 4.1 meta SRCREVs to pull in the coretemp
configuration values.

Partial fix for [YOCTO #8107].

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb    | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb  | 2 +-
 meta/recipes-kernel/linux/linux-yocto_3.19.bb      | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.1.bb       | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index 1cefff871440..848bc965a0b0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -3,7 +3,7 @@ KBRANCH ?= "standard/preempt-rt"
 require recipes-kernel/linux/linux-yocto.inc
 
 SRCREV_machine ?= "fe1ee443489d4ab5ce04c903b0362ae565547bd1"
-SRCREV_meta ?= "45393dd54f5ad77d43014c407c2b3520da42f427"
+SRCREV_meta ?= "4ea43922558a9032af33ea42ea74ac02416079e7"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb
index c82da372681d..a6a58a2ed84f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "e152349de59b43b2a75f2c332b44171df461d5a0"
-SRCREV_meta ?= "361c186effc0b0038dfbfd3fe71ecf3df5edb43d"
+SRCREV_meta ?= "1016714868249d64fc16692fd7679672b1efa17b"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index 38167cc2e85e..0e53d1d9149c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "4e30e64c44df9e59bd13239951bb8d2b5b276e6f"
-SRCREV_meta ?= "45393dd54f5ad77d43014c407c2b3520da42f427"
+SRCREV_meta ?= "4ea43922558a9032af33ea42ea74ac02416079e7"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.19.bb b/meta/recipes-kernel/linux/linux-yocto_3.19.bb
index 364f1f60ddcd..e8c16407a1c5 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.19.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "e152349de59b43b2a75f2c332b44171df461d5a0"
 SRCREV_machine_qemux86-64 ?= "e152349de59b43b2a75f2c332b44171df461d5a0"
 SRCREV_machine_qemumips64 ?= "3eb70cea3532e22ab1b6da9864446621229e6616"
 SRCREV_machine ?= "e152349de59b43b2a75f2c332b44171df461d5a0"
-SRCREV_meta ?= "361c186effc0b0038dfbfd3fe71ecf3df5edb43d"
+SRCREV_meta ?= "1016714868249d64fc16692fd7679672b1efa17b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.19.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-3.19;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index 9eff93d35764..cbc3981f6d54 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "4e30e64c44df9e59bd13239951bb8d2b5b276e6f"
 SRCREV_machine_qemux86-64 ?= "4e30e64c44df9e59bd13239951bb8d2b5b276e6f"
 SRCREV_machine_qemumips64 ?= "5c2b3697082a4ec6641aa5a8eca3974ca609cecf"
 SRCREV_machine ?= "4e30e64c44df9e59bd13239951bb8d2b5b276e6f"
-SRCREV_meta ?= "0a1457774f203eae4213822a0bd17a07f3b5d89a"
+SRCREV_meta ?= "4ea43922558a9032af33ea42ea74ac02416079e7"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
-- 
2.1.0


