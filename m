Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E35876FFA4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2016 02:41:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u5S2fF5E009690
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 27 Jun 2016 19:41:15 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Mon, 27 Jun 2016 19:41:14 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 27 Jun 2016 22:41:04 -0400
Message-ID: <82d67f68c7f575c9fdc536b06fe45d0fa2ac34a6.1467081585.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1467081584.git.bruce.ashfield@windriver.com>
References: <cover.1467081584.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 8/8] linux-yocto: bxt and input configuration changes
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
X-List-Received-Date: Tue, 28 Jun 2016 02:41:15 -0000
Content-Type: text/plain

Merging the following two configuration changes:

  Author: Rebecca Chang Swee Fun <rebecca.swee.fun.chang@intel.com>
  Date:   Mon Jun 27 15:11:04 2016 +0800

    broxton: set CONFIG_GPIO_GENERIC_PLATFORM instead of CONFIG_GPIO_GENERIC

    CONFIG_GPIO_GENERIC option is tristate, this will ensure we
    enable by selecting CONFIG_GPIO_GENERIC_PLATFORM.

    This addresses the following message:

    Value requested for CONFIG_GPIO_GENERIC not in final ".config"
    Requested value: "CONFIG_GPIO_GENERIC=y"
    Actual value set: ""

    Signed-off-by: Rebecca Chang Swee Fun <rebecca.swee.fun.chang@intel.com>

  Author: California Sullivan <california.l.sullivan@intel.com>
  Date:   Mon Jun 27 17:15:53 2016 -0700

    features/input: Add keyboard-gpio feature

    This feature adds keyboard-gpio support to the kernel. We also add a
    specific implementation by default. More can be added as necessary.

    Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index 29a0aa77ddbf..2fe221182b72 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "68484fa68d060d947fc46b2e85c0c6f2381d3e55"
-SRCREV_meta ?= "51216d70967be79dbe6c75ed4c7979abd4b95272"
+SRCREV_meta ?= "e978d15367ec69788c4a10d1e2a65bfa626c5d8c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index 34771aa75961..86bf8a7ba776 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "3bdc347cc2087a0217e3acddccda5bb775cd570b"
-SRCREV_meta ?= "29c7a2a5b02c1376b3345eeedea12c42806e89d9"
+SRCREV_meta ?= "44a610517357619a9ba827a597eef6d7f6e079f3"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index 67e12a52a464..432565f71497 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "9f166e918f63dd7214ad0388d64709d33f2a14a3"
-SRCREV_meta ?= "51216d70967be79dbe6c75ed4c7979abd4b95272"
+SRCREV_meta ?= "e978d15367ec69788c4a10d1e2a65bfa626c5d8c"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index 01f179a4fd50..638b3db9e4bd 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "13852755ecbf491848afbe40e66fc152bc70915b"
-SRCREV_meta ?= "29c7a2a5b02c1376b3345eeedea12c42806e89d9"
+SRCREV_meta ?= "44a610517357619a9ba827a597eef6d7f6e079f3"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index 66cddeb14bcb..b2cbc6067723 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "9f166e918f63dd7214ad0388d64709d33f2a14a3"
 SRCREV_machine_qemux86-64 ?= "9f166e918f63dd7214ad0388d64709d33f2a14a3"
 SRCREV_machine_qemumips64 ?= "b0e7bb69566a922a661c4902e496dce98cefeab9"
 SRCREV_machine ?= "9f166e918f63dd7214ad0388d64709d33f2a14a3"
-SRCREV_meta ?= "51216d70967be79dbe6c75ed4c7979abd4b95272"
+SRCREV_meta ?= "e978d15367ec69788c4a10d1e2a65bfa626c5d8c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index 6e745edffaf0..49ffd8deeca8 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "13852755ecbf491848afbe40e66fc152bc70915b"
 SRCREV_machine_qemux86-64 ?= "13852755ecbf491848afbe40e66fc152bc70915b"
 SRCREV_machine_qemumips64 ?= "d1c1f36412d196b560ed9f19392e291b5492b94c"
 SRCREV_machine ?= "13852755ecbf491848afbe40e66fc152bc70915b"
-SRCREV_meta ?= "29c7a2a5b02c1376b3345eeedea12c42806e89d9"
+SRCREV_meta ?= "44a610517357619a9ba827a597eef6d7f6e079f3"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
-- 
2.5.0


