Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1Soe8z-0007aI-84
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 19:22:37 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q6AHBLlD001136;
	Tue, 10 Jul 2012 10:11:23 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Tue, 10 Jul 2012 13:11:04 -0400
Message-Id: <2500062e552883cf9b6d689f717b1d7cc9cc61f7.1341933187.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1341933187.git.bruce.ashfield@windriver.com>
References: <cover.1341933187.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1341933187.git.bruce.ashfield@windriver.com>
References: <cover.1341933187.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 2/2] linux-yocto/3.4: perf, unionfs and yaffs2 fixes
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
X-List-Received-Date: Tue, 10 Jul 2012 17:22:37 -0000

Updating the 3.4 SRCREVs to pickup the following changes:

  6297e4c perf: add sgidefs.h to for mips builds
  69b7817 yaffs: add leading underscore to mtd_info function names
  160f1ac yaffs: change type for mode to umode_t
  2d875e8 Unionfs: use mode_t

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb |    4 ++--
 meta/recipes-kernel/linux/linux-yocto_3.4.bb    |   12 ++++++------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
index d2ba6c9..f30f6dd 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
@@ -8,8 +8,8 @@ LINUX_KERNEL_TYPE = "preempt-rt"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "6767c6a0821b8bb782bee9faa8aec6593a9d39dd"
-SRCREV_machine_qemuppc ?= "575b10dd912557cce881ea519c7ac2b84fbe7b47"
+SRCREV_machine ?= "b25f7c9730e3bd3be1bf7b7982251b7459ad6579"
+SRCREV_machine_qemuppc ?= "2777125ab6f92b624ecaf11d6b1ab604e64497a8"
 SRCREV_meta ?= "a8cf77018b0faa0d29f1483ff4e5a2034dc8edd5"
 
 PR = "${INC_PR}.0"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
index 2ea9aa6..39b5cdf 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
@@ -10,12 +10,12 @@ KBRANCH_qemumips64 = "standard/mti-malta64"
 KBRANCH_qemumips64el = "standard/mti-malta64"
 KBRANCH_qemuarm  = "standard/arm-versatile-926ejs"
 
-SRCREV_machine_qemuarm ?= "93bb8cf97a0c5aead15a97c825d8fd504759f038"
-SRCREV_machine_qemumips  ?= "b9b9aeb414c14f2587690d91052c9348e9ccd72a"
-SRCREV_machine_qemuppc ?= "53ca8948fa64ee445001392a1cd03491befa9f35"
-SRCREV_machine_qemux86 ?= "95c79fb2f965f1feb33bffe46c20ddb0b8e9da0d"
-SRCREV_machine_qemux86-64 ?= "95c79fb2f965f1feb33bffe46c20ddb0b8e9da0d"
-SRCREV_machine ?= "95c79fb2f965f1feb33bffe46c20ddb0b8e9da0d"
+SRCREV_machine_qemuarm ?= "9aca8fec49787efbe44d0f137f31ee59edd94c49"
+SRCREV_machine_qemumips  ?= "23fa942849b1207dbfc4528e2a5c8df0fd71870c"
+SRCREV_machine_qemuppc ?= "08732f25bc3cb404e29ae201074bcf5c1661ea83"
+SRCREV_machine_qemux86 ?= "6297e4c1d57e1063bfce297c2e12392348598559"
+SRCREV_machine_qemux86-64 ?= "6297e4c1d57e1063bfce297c2e12392348598559"
+SRCREV_machine ?= "6297e4c1d57e1063bfce297c2e12392348598559"
 SRCREV_meta ?= "a8cf77018b0faa0d29f1483ff4e5a2034dc8edd5"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
-- 
1.7.5.4



