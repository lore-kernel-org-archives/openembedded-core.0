Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 22413719A3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Oct 2016 05:54:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u935sk8n006017
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 2 Oct 2016 22:54:46 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Sun, 2 Oct 2016 22:54:45 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 3 Oct 2016 01:54:35 -0400
Message-ID: <c8d7881cee59b5c673a7550341d38d0e7e2e3860.1475473494.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1475473494.git.bruce.ashfield@windriver.com>
References: <cover.1475473494.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/7] linux-yocto/4.8: update to 4.8 -final release
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
X-List-Received-Date: Mon, 03 Oct 2016 05:54:45 -0000
Content-Type: text/plain

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.8.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
index d667860ad0c3..515f8783e906 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "5e21764783494fe8cafa9a107775040d54a4d4d1"
-SRCREV_meta ?= "ab82ea0e92a1726d5135e2d7541acb958a74b6e5"
+SRCREV_machine ?= "cd97b2cf4bc73316204a5148d2b0f5fc5d2ecc19"
+SRCREV_meta ?= "6128a9e47cd1aeb46b604469c17bff3eba8d5f93"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.8.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.8;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.8-rc8"
+LINUX_VERSION ?= "4.8"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
index 7c175d60b14f..8ed52ddbfc58 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.8-rc8"
+LINUX_VERSION ?= "4.8"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "8edbf10bb6e0759bfb6f18035d1b4773f573d33c"
-SRCREV_meta ?= "ab82ea0e92a1726d5135e2d7541acb958a74b6e5"
+SRCREV_machine ?= "707621a083512f037f749a711df3f4f1fb3ef842"
+SRCREV_meta ?= "6128a9e47cd1aeb46b604469c17bff3eba8d5f93"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.8.bb b/meta/recipes-kernel/linux/linux-yocto_4.8.bb
index d4366c1cf4ac..71dc5ae35a0f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.8.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "3a2b4be23e0d3115962cd49302f80679c86a2df4"
-SRCREV_machine_qemuarm64 ?= "8edbf10bb6e0759bfb6f18035d1b4773f573d33c"
-SRCREV_machine_qemumips ?= "fc863e7a0f5664eef65ff36f35cc41c0be59ef3b"
-SRCREV_machine_qemuppc ?= "8edbf10bb6e0759bfb6f18035d1b4773f573d33c"
-SRCREV_machine_qemux86 ?= "8edbf10bb6e0759bfb6f18035d1b4773f573d33c"
-SRCREV_machine_qemux86-64 ?= "8edbf10bb6e0759bfb6f18035d1b4773f573d33c"
-SRCREV_machine_qemumips64 ?= "dd0e6bc1cb1973d72ff9d3b4ee44a0edc04fea3c"
-SRCREV_machine ?= "8edbf10bb6e0759bfb6f18035d1b4773f573d33c"
-SRCREV_meta ?= "ab82ea0e92a1726d5135e2d7541acb958a74b6e5"
+SRCREV_machine_qemuarm ?= "fc4881574f295bf2480f95d7c3e279ab32b44d8a"
+SRCREV_machine_qemuarm64 ?= "707621a083512f037f749a711df3f4f1fb3ef842"
+SRCREV_machine_qemumips ?= "013be1e230a0173677dfbfc081aea63fd7c58ec8"
+SRCREV_machine_qemuppc ?= "707621a083512f037f749a711df3f4f1fb3ef842"
+SRCREV_machine_qemux86 ?= "707621a083512f037f749a711df3f4f1fb3ef842"
+SRCREV_machine_qemux86-64 ?= "707621a083512f037f749a711df3f4f1fb3ef842"
+SRCREV_machine_qemumips64 ?= "7496d66804993fcfc569dd062f7e63a7490bc62f"
+SRCREV_machine ?= "707621a083512f037f749a711df3f4f1fb3ef842"
+SRCREV_meta ?= "6128a9e47cd1aeb46b604469c17bff3eba8d5f93"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.8.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.8;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.8-rc8"
+LINUX_VERSION ?= "4.8"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


