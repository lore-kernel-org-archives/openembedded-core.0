Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4F86170EE1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Aug 2014 16:21:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7KGLb5A024550
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 20 Aug 2014 09:21:37 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Wed, 20 Aug 2014 09:21:37 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 20 Aug 2014 12:21:29 -0400
Message-ID: <ad1c2d51ee6e3931c1c25e78a8bd26674962179f.1408551509.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1408551509.git.bruce.ashfield@windriver.com>
References: <cover.1408551509.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/7] linux-yocto/3.14: KASLR and VDSO backports
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
X-List-Received-Date: Wed, 20 Aug 2014 16:21:44 -0000
Content-Type: text/plain

Updating the 3.14 linux-yocto SRCREVs for feature backports:

   6cfe9c448741 x86, kaslr: boot-time selectable with hibernation
   881a5f5812fd x86, kaslr: fix module lock ordering problem
   121ec40d905d x86, kaslr: randomize module base load address
   6efd2d21273c x86, vdso: Add 32 bit VDSO time support for 64 bit kernel
   642441e17072 x86, vdso: Add 32 bit VDSO time support for 32 bit kernel
   1d8dd2e617d4 x86, vdso: Patch alternatives in the 32-bit VDSO
   353f3eadb16d x86, vdso: Introduce VVAR marco for vdso32
   5e6e6ec6eb5c x86, vdso: Cleanup __vdso_gettimeofday()
   91efa61ed6c2 x86, vdso: Replace VVAR(vsyscall_gtod_data) by gtod macro
   f9c259ee1b2f x86, vdso: __vdso_clock_gettime() cleanup
   63d9b1c4ec72 x86, vdso: Revamp vclock_gettime.c
   e3a8ed44c964 mm: Add new func _install_special_mapping() to mmap.c
   02a67e32e58d x86, vdso: Make vsyscall_gtod_data handling x86 generic
   d076cfb68504 x86, vdso, xen: Remove stray reference to FIX_VDSO
   949153696c99 x86_32, mm: Remove user bit from identity map PDE
   e5cf7dfec74d x86, vdso: Remove compat vdso support

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_3.14.bb      | 16 ++++++++--------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
index 503185ee2d88..f827dabe5422 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
@@ -3,9 +3,9 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH = "standard/preempt-rt/base"
 KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
 
-SRCREV_machine ?= "5935fa1a250b3da3fe37297ce8bc9eb4f54438a6"
-SRCREV_machine_qemuppc ?= "36f6a51491f8f4c4bfc83800dae36f85b2bad922"
-SRCREV_meta ?= "3a897e59cb5de59e7fdaabdfa89db5da69966def"
+SRCREV_machine ?= "1275afa7dabab618d705c2708518fc84b54b8f21"
+SRCREV_machine_qemuppc ?= "88ef131d9825e3f356d632bdd341106f986b230c"
+SRCREV_meta ?= "3eefa4379f073768df150184e9dad1ff3228a0ff"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
index ffe198e58bc2..50a742f88861 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
@@ -8,8 +8,8 @@ LINUX_VERSION ?= "3.14.13"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "59ed057796efe35d264c2ebe4f79acdbe40026e5"
-SRCREV_meta ?= "3a897e59cb5de59e7fdaabdfa89db5da69966def"
+SRCREV_machine ?= "6cfe9c448741ab317d70a8ded3a953a0e66bb0a5"
+SRCREV_meta ?= "3eefa4379f073768df150184e9dad1ff3228a0ff"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.14.bb b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
index e7a733cc91b4..b14674f1b170 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
@@ -10,14 +10,14 @@ KBRANCH_qemux86  = "standard/common-pc/base"
 KBRANCH_qemux86-64  = "standard/common-pc-64/base"
 KBRANCH_qemumips64 = "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "c3aa4d4809315f226de525a20072d0055fbb2649"
-SRCREV_machine_qemumips ?= "40fb9a61f54d3090be4046d0fef3ea635f53023e"
-SRCREV_machine_qemuppc ?= "0fb630e8897fe7d4e8ddda667df5d5701b71c409"
-SRCREV_machine_qemux86 ?= "6fc66b1dbd642850474145f49b387e19be1e04c9"
-SRCREV_machine_qemux86-64 ?= "59ed057796efe35d264c2ebe4f79acdbe40026e5"
-SRCREV_machine_qemumips64 ?= "886a5a31a12305148b7e7cac1200b521eec3fdfc"
-SRCREV_machine ?= "59ed057796efe35d264c2ebe4f79acdbe40026e5"
-SRCREV_meta ?= "3a897e59cb5de59e7fdaabdfa89db5da69966def"
+SRCREV_machine_qemuarm ?= "cb29a7b2d69ec89d851c9ad5a44b69c62feb7963"
+SRCREV_machine_qemumips ?= "b9a7220e0dbe4faac06bedff201102d1642e32d1"
+SRCREV_machine_qemuppc ?= "9ae4c4cdc2737f2570b7f71314be68c065179b53"
+SRCREV_machine_qemux86 ?= "5542d96bf43c6c9f7c81cf36259e03d21ed5c210"
+SRCREV_machine_qemux86-64 ?= "6cfe9c448741ab317d70a8ded3a953a0e66bb0a5"
+SRCREV_machine_qemumips64 ?= "a779a38ca4a1cf78c6f07071ff51937214ff063d"
+SRCREV_machine ?= "6cfe9c448741ab317d70a8ded3a953a0e66bb0a5"
+SRCREV_meta ?= "3eefa4379f073768df150184e9dad1ff3228a0ff"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-- 
1.8.1.2


