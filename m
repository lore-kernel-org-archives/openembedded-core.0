Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 937D86B6BA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 16:55:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8DGt0Mx011803
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 13 Sep 2013 09:55:00 -0700 (PDT)
Received: from yow-bashfiel-d3.corp.ad.wrs.com (128.224.130.112) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Fri, 13 Sep 2013 09:54:59 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 13 Sep 2013 12:54:58 -0400
Message-ID: <41cf0a561dffde1f698f7d4fe49d72c59bf315fe.1379091188.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1379091188.git.bruce.ashfield@windriver.com>
References: <cover.1379091188.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] linux-yocto/3.10: genericx86 meta data factoring
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
X-List-Received-Date: Fri, 13 Sep 2013 16:55:01 -0000
Content-Type: text/plain

Updating the 3.10 meta branch to import the following commits from Darren
Hart:

   285f93b meta/common-pc-64: Add USB 3.0 support
   75072e4 meta/common-pc*: Refactor common-pc-64 to reuse common-pc drivers
   da06bde meta/common-pc: Split out CPU and Drivers config fragments
   5f55e40 meta/common-pc: Cleanup common-pc.cfg and common-pc-gfx.cfg
   0a3f784 meta/common-pc: Add common Wifi drivers
   f4b9f5e meta/common-pc: Add common Realtek and Atheros Ethernet drivers
   4d9d3eb meta/common-pc: Build Ethernet and Wifi drivers as modules
   13141ee meta/common-pc: Refactor Ethernet and Wifi options

These are in support of a new genericx86 multi-target BSP.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   |    2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
index e28a4af..1a2870c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
@@ -5,7 +5,7 @@ KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
 
 SRCREV_machine ?= "4de6b6b24c44ef644b46405a85c550128d4a779a"
 SRCREV_machine_qemuppc ?= "24a1786e5ed0d479638af5738375e396bf4c922c"
-SRCREV_meta ?= "b683dce390b1bbe434b15df6308ed03e5fd3a4ac"
+SRCREV_meta ?= "285f93bf942e8f6fa678ffc6cc53696ed5400718"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
index 7270bcb..f9009c1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
@@ -10,7 +10,7 @@ LINUX_VERSION ?= "3.10.11"
 KMETA = "meta"
 
 SRCREV_machine ?= "702040ac7c7ec66a29b4d147665ccdd0ff015577"
-SRCREV_meta ?= "b683dce390b1bbe434b15df6308ed03e5fd3a4ac"
+SRCREV_meta ?= "285f93bf942e8f6fa678ffc6cc53696ed5400718"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.10.bb b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
index 722f758..77fa3db 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
@@ -10,7 +10,7 @@ SRCREV_machine_qemux86 ?= "702040ac7c7ec66a29b4d147665ccdd0ff015577"
 SRCREV_machine_qemux86-64 ?= "702040ac7c7ec66a29b4d147665ccdd0ff015577"
 SRCREV_machine_qemumips64 ?= "6b3a777e3724d30ba03d88d75698fa0734c5a73f"
 SRCREV_machine ?= "702040ac7c7ec66a29b4d147665ccdd0ff015577"
-SRCREV_meta ?= "b683dce390b1bbe434b15df6308ed03e5fd3a4ac"
+SRCREV_meta ?= "285f93bf942e8f6fa678ffc6cc53696ed5400718"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-- 
1.7.10.4


