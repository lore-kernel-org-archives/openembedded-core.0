Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C2D73607B3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2016 15:16:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u8KFGg4T016918
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 20 Sep 2016 08:16:42 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 20 Sep 2016 08:16:41 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 20 Sep 2016 11:16:37 -0400
Message-ID: <32d7bffdc86a90263f4f22daf75f4c1abae2fe85.1474384321.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1474384321.git.bruce.ashfield@windriver.com>
References: <cover.1474384321.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] linux-yocto/4.8: integrate 4.8-rc7
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
X-List-Received-Date: Tue, 20 Sep 2016 15:16:41 -0000
Content-Type: text/plain

Updating to the latest release candidate.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.8.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
index 10dd349eb002..17aae6b2c7bd 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "e6e0dea72e605a070373bd52c6c2637202ce4b38"
-SRCREV_meta ?= "25fb74eaaef249519f25e243e7f9bf0cab0e1781"
+SRCREV_machine ?= "cde1a7d656b7fdd96f82f619e4251965a4e96489"
+SRCREV_meta ?= "a9240b538ce4de29ff1fc7eaf328450c51ab9e80"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.8.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.8;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.8-rc6"
+LINUX_VERSION ?= "4.8-rc7"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
index 50a54a1a48ea..5df5e0c3c0b9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.8-rc6"
+LINUX_VERSION ?= "4.8-rc7"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "e6e0dea72e605a070373bd52c6c2637202ce4b38"
-SRCREV_meta ?= "25fb74eaaef249519f25e243e7f9bf0cab0e1781"
+SRCREV_machine ?= "eb9c19c72d40a4bb8a6a3b7b949e41e5c31c0d94"
+SRCREV_meta ?= "fb4159467f0f46f788b59f0aff31e3fcd757d00d"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.8.bb b/meta/recipes-kernel/linux/linux-yocto_4.8.bb
index f4f4bfe855ec..2e0dbfa34625 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.8.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "29b1dac023fac237c408620aaa79a60a611dc2df"
-SRCREV_machine_qemuarm64 ?= "e6e0dea72e605a070373bd52c6c2637202ce4b38"
-SRCREV_machine_qemumips ?= "edb3f19ae13818cd5af56f21566e843c975ba897"
-SRCREV_machine_qemuppc ?= "e6e0dea72e605a070373bd52c6c2637202ce4b38"
-SRCREV_machine_qemux86 ?= "e6e0dea72e605a070373bd52c6c2637202ce4b38"
-SRCREV_machine_qemux86-64 ?= "e6e0dea72e605a070373bd52c6c2637202ce4b38"
-SRCREV_machine_qemumips64 ?= "c583570fc64c2e01e3cf51edd0e732ee6789c9ef"
-SRCREV_machine ?= "e6e0dea72e605a070373bd52c6c2637202ce4b38"
-SRCREV_meta ?= "25fb74eaaef249519f25e243e7f9bf0cab0e1781"
+SRCREV_machine_qemuarm ?= "ba792fae8c979ae4ecaae5e8403b150863173509"
+SRCREV_machine_qemuarm64 ?= "eb9c19c72d40a4bb8a6a3b7b949e41e5c31c0d94"
+SRCREV_machine_qemumips ?= "19b41be93a8fefc65ef4c1c1ab3e8b2d815de93d"
+SRCREV_machine_qemuppc ?= "eb9c19c72d40a4bb8a6a3b7b949e41e5c31c0d94"
+SRCREV_machine_qemux86 ?= "eb9c19c72d40a4bb8a6a3b7b949e41e5c31c0d94"
+SRCREV_machine_qemux86-64 ?= "eb9c19c72d40a4bb8a6a3b7b949e41e5c31c0d94"
+SRCREV_machine_qemumips64 ?= "c6e9e8d1caacea5deca7e41b47fd6076a747b6fa"
+SRCREV_machine ?= "eb9c19c72d40a4bb8a6a3b7b949e41e5c31c0d94"
+SRCREV_meta ?= "fb4159467f0f46f788b59f0aff31e3fcd757d00d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.8.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.8;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.8-rc6"
+LINUX_VERSION ?= "4.8-rc7"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


