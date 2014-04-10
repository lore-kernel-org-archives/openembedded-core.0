Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1931B65E87
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Apr 2014 15:12:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s3AFCnZV013354
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 10 Apr 2014 08:12:50 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Thu, 10 Apr 2014 08:12:49 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 10 Apr 2014 11:12:31 -0400
Message-ID: <6f0485b65b003b9f1270e1784c03fc5f59b38442.1397142033.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1397142033.git.bruce.ashfield@windriver.com>
References: <cover.1397142033.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/6] linux-yocto/3.10: v3.10.35 and emenlow boot fixes
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
X-List-Received-Date: Thu, 10 Apr 2014 15:12:53 -0000
Content-Type: text/plain

Updating the 3.10 SRCREVs to pick up 3.10.35 and a LTSI cherry pick that
fixes a boot issue with the emenlow.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   |  8 ++++----
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      | 18 +++++++++---------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
index fe6773a5ece3..98bf996a7092 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
@@ -3,13 +3,13 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH = "standard/preempt-rt/base"
 KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
 
-SRCREV_machine ?= "f4351616572c6ad5a8b71b1becf02c3e779b85b8"
-SRCREV_machine_qemuppc ?= "a6dfc85e99633d739068a03d2551e39847628551"
-SRCREV_meta ?= "df3aa753c8826127fb5ad811d56d57168551d6e4"
+SRCREV_machine ?= "d1e73a1e09f9641c44e7d713d1a6b5b088411459"
+SRCREV_machine_qemuppc ?= "9a34d9c957e69f28e89e879d9dd6e8fe5c7270c5"
+SRCREV_meta ?= "b6e58b33dd427fe471f8827c83e311acdf4558a4"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
 
-LINUX_VERSION ?= "3.10.34"
+LINUX_VERSION ?= "3.10.35"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
index 123f3070d9f7..9e5c070c106d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
@@ -5,12 +5,12 @@ KBRANCH = "${KBRANCH_DEFAULT}"
 LINUX_KERNEL_TYPE = "tiny"
 KCONFIG_MODE = "--allnoconfig"
 
-LINUX_VERSION ?= "3.10.34"
+LINUX_VERSION ?= "3.10.35"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "c7739be126930006e3bfbdb2fb070a967abc5e09"
-SRCREV_meta ?= "df3aa753c8826127fb5ad811d56d57168551d6e4"
+SRCREV_machine ?= "cee957655fe67826b2e827e2db41f156fa8f0cc4"
+SRCREV_meta ?= "b6e58b33dd427fe471f8827c83e311acdf4558a4"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.10.bb b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
index 10f407202175..f275693ae4ed 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
@@ -11,18 +11,18 @@ KBRANCH_qemux86  = "standard/common-pc/base"
 KBRANCH_qemux86-64  = "standard/common-pc-64/base"
 KBRANCH_qemumips64 = "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "52a6807f42846c7d1442e11227722f59221fc64e"
-SRCREV_machine_qemumips ?= "b6b20f49e9a169a0672b7cc2d7b93d6652ca7873"
-SRCREV_machine_qemuppc ?= "d71b782615b802c78e1586494b94dd40531775c8"
-SRCREV_machine_qemux86 ?= "c7739be126930006e3bfbdb2fb070a967abc5e09"
-SRCREV_machine_qemux86-64 ?= "c7739be126930006e3bfbdb2fb070a967abc5e09"
-SRCREV_machine_qemumips64 ?= "88abb1eb327f4e3c711d19a228cb153fdd9b3506"
-SRCREV_machine ?= "c7739be126930006e3bfbdb2fb070a967abc5e09"
-SRCREV_meta ?= "df3aa753c8826127fb5ad811d56d57168551d6e4"
+SRCREV_machine_qemuarm ?= "7b466aae62395490769f96635bd077ee8f313f18"
+SRCREV_machine_qemumips ?= "cc5059ae360e0586375bbd1ed46e1e6f3e267dea"
+SRCREV_machine_qemuppc ?= "663a3068c9756137a84bbfb3a76eeae7cb4373e1"
+SRCREV_machine_qemux86 ?= "cee957655fe67826b2e827e2db41f156fa8f0cc4"
+SRCREV_machine_qemux86-64 ?= "cee957655fe67826b2e827e2db41f156fa8f0cc4"
+SRCREV_machine_qemumips64 ?= "a1491c3b367a75c7003b2fb58706e3631413b337"
+SRCREV_machine ?= "cee957655fe67826b2e827e2db41f156fa8f0cc4"
+SRCREV_meta ?= "b6e58b33dd427fe471f8827c83e311acdf4558a4"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-LINUX_VERSION ?= "3.10.34"
+LINUX_VERSION ?= "3.10.35"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
1.8.1.2


