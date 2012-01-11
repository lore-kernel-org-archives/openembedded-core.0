Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1Rl3Pi-0005AA-N3
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Jan 2012 20:00:47 +0100
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(yow-bashfiel-d3.ottawa.windriver.com [128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q0BIqk2m020538;
	Wed, 11 Jan 2012 10:52:52 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Wed, 11 Jan 2012 13:52:23 -0500
Message-Id: <6468addcd5e4729270ebc0152504eb8f35a3cd3f.1326307011.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1326307011.git.bruce.ashfield@windriver.com>
References: <cover.1326307011.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1326307011.git.bruce.ashfield@windriver.com>
References: <cover.1326307011.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 5/5] linux-yocto: consolidated fix SRCREV updates
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Jan 2012 19:00:47 -0000

Updating the SRCREVs to include the following fixes from Khem Raj and
Zumeng Chen.

 6f5b118 compiler.h: Undef before redefining __attribute_const__
 fe80c1e oprofile, arm/sh: Fix oprofile_arch_exit() linkage issue

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb |    4 ++--
 meta/recipes-kernel/linux/linux-yocto_3.0.bb    |   13 +++++++------
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
index c6bf446..145e548 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
@@ -14,8 +14,8 @@ KBRANCH_qemuppc = "yocto/standard/preempt-rt/qemu-ppc32"
 LINUX_VERSION ?= "3.0.14"
 LINUX_KERNEL_TYPE = "preempt-rt"
 
-SRCREV_machine ?= "bcf4107c7f22d10952618a2ad146e6149d240cd2"
-SRCREV_machine_qemuppc ?= "1e5511ea2cb5f150ffce86071035a81c0499494b"
+SRCREV_machine ?= "f1cc220f4ddf434bf254707c83a45794a63f117f"
+SRCREV_machine_qemuppc ?= "8bd5b80cb3243dadc9d6c5c09482c49994dff1a8"
 SRCREV_meta ?= "73dafd44ea875df654129b32b2877f342d5573e4"
 
 PR = "r1"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.0.bb b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
index e624b48..0b79bee 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
@@ -12,12 +12,13 @@ KBRANCH = ${KMACHINE}
 
 LINUX_VERSION ?= "3.0.14"
 
-SRCREV_machine_qemuarm ?= "c498cc6e4b56784b3c2c547cb9a7af435b9412c1"
-SRCREV_machine_qemumips ?= "791c3f4124a238a798e2360340800f4989fad695"
-SRCREV_machine_qemuppc ?= "10e808d1c304b14cf42903fd637f239766b78476"
-SRCREV_machine_qemux86 ?= "e04f9f8e564c60b1ce907d64074c18730f8dab4e"
-SRCREV_machine_qemux86-64 ?= "53c2fa060d34e9a0b59e19398aeebbe73f24d89b"
-SRCREV_machine ?= "fe80c1e343bf8f038328a612cef7f821d7ec8dbf"
+
+SRCREV_machine_qemuarm ?= "c0386e4195c685b0ff94b7e21581ec47008ab13b"
+SRCREV_machine_qemumips ?= "56e4361a1bfc10042d83a7d8a5f96932056e3f35"
+SRCREV_machine_qemuppc ?= "53e71af30e30162e17e32b2f57e4481f5bc0573e"
+SRCREV_machine_qemux86 ?= "9e73573b6b227ab2c62e66e63470866d136f8d76"
+SRCREV_machine_qemux86-64 ?= "3551fd0412965b1f6b0b2f6ba35f7fecdaddb58a"
+SRCREV_machine ?= "6f5b11830deba4a6262c8c4abf67e608924f649e"
 SRCREV_meta ?= "73dafd44ea875df654129b32b2877f342d5573e4"
 
 PR = "r2"
-- 
1.7.4.1



