Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B05756011F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2016 15:16:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u8KFGes7018405
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 20 Sep 2016 08:16:41 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 20 Sep 2016 08:16:40 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 20 Sep 2016 11:16:36 -0400
Message-ID: <3f0a55ff64017df58ca3fba58ece1999d00d9c6b.1474384321.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1474384321.git.bruce.ashfield@windriver.com>
References: <cover.1474384321.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] linux-yocto/4.1: 4.1.32 content and configuration warning fixes
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

The LINUX_VERSION was previously updated to 4.1.32, but the
SRCREVs for the actual content were missed. This gets our actual
version and the PV back in sync.

We also update the meta data to fix configuration audit warnings
from the beaglebone builds.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>

squash with 4.1

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 18 +++++++++---------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index 4308a07a9765..1f38a54bf551 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "ee83bffe0f76032fe0a0b7fde436f0f596101df2"
-SRCREV_meta ?= "b30b6b9ef215433b28e8966c73ebb6b98a7f4d1f"
+SRCREV_machine ?= "91821a6c3a54fabf964037dd478944a8f3597f88"
+SRCREV_meta ?= "19cafe114e7d35e6202afa1079b32ce600646660"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index 2294a3db87da..5058954a814a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -9,8 +9,8 @@ LINUX_VERSION ?= "4.1.32"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "93b1a6cee7d4a4437a1c0edf3e54ffe78edb4462"
-SRCREV_meta ?= "b30b6b9ef215433b28e8966c73ebb6b98a7f4d1f"
+SRCREV_machine ?= "a6b3a8cc120640bf5e528c8558ce060675757fc1"
+SRCREV_meta ?= "19cafe114e7d35e6202afa1079b32ce600646660"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index f4006b74d096..249209d6495f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "4db58705727e27bea8ccf805bd5c7d04d2d029ed"
-SRCREV_machine_qemuarm64 ?= "93b1a6cee7d4a4437a1c0edf3e54ffe78edb4462"
-SRCREV_machine_qemumips ?= "d6237b3b244b894d4b3479ecf37acef041416dfa"
-SRCREV_machine_qemuppc ?= "8520e65497ae10e14c38c76920a3457dc64349bf"
-SRCREV_machine_qemux86 ?= "93b1a6cee7d4a4437a1c0edf3e54ffe78edb4462"
-SRCREV_machine_qemux86-64 ?= "93b1a6cee7d4a4437a1c0edf3e54ffe78edb4462"
-SRCREV_machine_qemumips64 ?= "d0524e144cd15a3c0edf768f68400968a4477cbe"
-SRCREV_machine ?= "93b1a6cee7d4a4437a1c0edf3e54ffe78edb4462"
-SRCREV_meta ?= "b30b6b9ef215433b28e8966c73ebb6b98a7f4d1f"
+SRCREV_machine_qemuarm ?= "a2fde8c9a8b709574b36931f728fb78617892d98"
+SRCREV_machine_qemuarm64 ?= "a6b3a8cc120640bf5e528c8558ce060675757fc1"
+SRCREV_machine_qemumips ?= "33efda07565f45c576671358e75b39dc6a069cbf"
+SRCREV_machine_qemuppc ?= "96b9a39490bc348b36d0de13397a086e66a4b1cb"
+SRCREV_machine_qemux86 ?= "a6b3a8cc120640bf5e528c8558ce060675757fc1"
+SRCREV_machine_qemux86-64 ?= "a6b3a8cc120640bf5e528c8558ce060675757fc1"
+SRCREV_machine_qemumips64 ?= "a46e08c52a6764b0e54f4dbbdfaa3050a379ac4a"
+SRCREV_machine ?= "a6b3a8cc120640bf5e528c8558ce060675757fc1"
+SRCREV_meta ?= "19cafe114e7d35e6202afa1079b32ce600646660"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
-- 
2.5.0


