Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C8E6777216
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Sep 2016 18:16:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u8CIGbcX013606
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 12 Sep 2016 11:16:37 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Mon, 12 Sep 2016 11:16:37 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 12 Sep 2016 14:16:33 -0400
Message-ID: <f6f64692920862ec9a6f4513c69639862e7973d8.1473704020.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1473704020.git.bruce.ashfield@windriver.com>
References: <cover.1473704020.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] linux-yocto/4.8: update to v4.8-rc6
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
X-List-Received-Date: Mon, 12 Sep 2016 18:16:40 -0000
Content-Type: text/plain

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_4.8.bb      | 18 +++++++++---------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
index ff726815d2a3..10dd349eb002 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "9e7ee5155e3466824abe94eebb641c63ab5cd5f2"
+SRCREV_machine ?= "e6e0dea72e605a070373bd52c6c2637202ce4b38"
 SRCREV_meta ?= "25fb74eaaef249519f25e243e7f9bf0cab0e1781"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.8.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.8;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.8-rc5"
+LINUX_VERSION ?= "4.8-rc6"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
index 6f62d22aa4c5..50a54a1a48ea 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
@@ -4,12 +4,12 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.8-rc5"
+LINUX_VERSION ?= "4.8-rc6"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "9e7ee5155e3466824abe94eebb641c63ab5cd5f2"
+SRCREV_machine ?= "e6e0dea72e605a070373bd52c6c2637202ce4b38"
 SRCREV_meta ?= "25fb74eaaef249519f25e243e7f9bf0cab0e1781"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.8.bb b/meta/recipes-kernel/linux/linux-yocto_4.8.bb
index b0e2a7673745..f4f4bfe855ec 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.8.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "9a91ef47f85a741d842b876267b29f8ded751f68"
-SRCREV_machine_qemuarm64 ?= "9e7ee5155e3466824abe94eebb641c63ab5cd5f2"
-SRCREV_machine_qemumips ?= "40c7a721efe2822fdb7df4b2902a1994add40a77"
-SRCREV_machine_qemuppc ?= "9e7ee5155e3466824abe94eebb641c63ab5cd5f2"
-SRCREV_machine_qemux86 ?= "9e7ee5155e3466824abe94eebb641c63ab5cd5f2"
-SRCREV_machine_qemux86-64 ?= "9e7ee5155e3466824abe94eebb641c63ab5cd5f2"
-SRCREV_machine_qemumips64 ?= "fe4805532e149324939bf9d8415ed43dac357709"
-SRCREV_machine ?= "9e7ee5155e3466824abe94eebb641c63ab5cd5f2"
+SRCREV_machine_qemuarm ?= "29b1dac023fac237c408620aaa79a60a611dc2df"
+SRCREV_machine_qemuarm64 ?= "e6e0dea72e605a070373bd52c6c2637202ce4b38"
+SRCREV_machine_qemumips ?= "edb3f19ae13818cd5af56f21566e843c975ba897"
+SRCREV_machine_qemuppc ?= "e6e0dea72e605a070373bd52c6c2637202ce4b38"
+SRCREV_machine_qemux86 ?= "e6e0dea72e605a070373bd52c6c2637202ce4b38"
+SRCREV_machine_qemux86-64 ?= "e6e0dea72e605a070373bd52c6c2637202ce4b38"
+SRCREV_machine_qemumips64 ?= "c583570fc64c2e01e3cf51edd0e732ee6789c9ef"
+SRCREV_machine ?= "e6e0dea72e605a070373bd52c6c2637202ce4b38"
 SRCREV_meta ?= "25fb74eaaef249519f25e243e7f9bf0cab0e1781"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.8.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.8;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.8-rc5"
+LINUX_VERSION ?= "4.8-rc6"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


