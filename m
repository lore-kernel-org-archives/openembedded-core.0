Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C359E76FC9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Sep 2015 17:12:58 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 28 Sep 2015 10:12:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,603,1437462000"; d="scan'208";a="569939904"
Received: from cmorale1-mobl3.amr.corp.intel.com (HELO
	swold-mobl.amr.corp.intel.com) ([10.254.191.92])
	by FMSMGA003.fm.intel.com with ESMTP; 28 Sep 2015 10:12:58 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Mon, 28 Sep 2015 10:12:57 -0700
Message-Id: <1443460377-16480-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Cc: bruce.ashfield@windriver.com, dvhart@linux.intel.com
Subject: [PATCH] linux-yocto-custom: Update for newer kernel
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
X-List-Received-Date: Mon, 28 Sep 2015 17:13:01 -0000

Update the NAME version tweak example patch for the
newer kernel. This moves the example to the 4.2 stable
kernel and appends -custom to the VERSION string.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../recipes-kernel/linux/linux-yocto-custom.bb      | 15 +++++++--------
 .../0001-linux-version-tweak.patch                  | 21 ++++++++++++---------
 2 files changed, 19 insertions(+), 17 deletions(-)

diff --git a/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
index cce44d9..6194d4f 100644
--- a/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
+++ b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
@@ -43,9 +43,9 @@
 #   
 #   example configuration addition:
 #            SRC_URI += "file://smp.cfg"
-#   example patch addition (for kernel v3.4 only):
-#            SRC_URI += "file://0001-linux-version-tweak.patch
-#   example feature addition (for kernel v3.4 only):
+#   example patch addition (for kernel v4.x only):
+#            SRC_URI += "file://0001-linux-version-tweak.patch"
+#   example feature addition (for kernel v4.x only):
 #            SRC_URI += "file://feature.scc"
 #
 
@@ -56,15 +56,14 @@ require recipes-kernel/linux/linux-yocto.inc
 # tree if you do not want to build from Linus' tree.
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git;protocol=git;nocheckout=1;name=machine"
 
-LINUX_VERSION ?= "3.4"
-LINUX_VERSION_EXTENSION ?= "-custom"
+LINUX_VERSION ?= "4.2"
+LINUX_VERSION_EXTENSION_append = "-custom"
 
 # Modify SRCREV to a different commit hash in a copy of this recipe to
 # build a different release of the Linux kernel.
-# tag: v3.4 76e10d158efb6d4516018846f60c2ab5501900bc
-SRCREV_machine="76e10d158efb6d4516018846f60c2ab5501900bc"
+# tag: v4.2 64291f7db5bd8150a74ad2036f1037e6a0428df2
+SRCREV_machine="64291f7db5bd8150a74ad2036f1037e6a0428df2"
 
-PR = "r1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
 # Override COMPATIBLE_MACHINE to include your machine in a copy of this recipe
diff --git a/meta-skeleton/recipes-kernel/linux/linux-yocto-custom/0001-linux-version-tweak.patch b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom/0001-linux-version-tweak.patch
index c9562da..39c7ee8 100644
--- a/meta-skeleton/recipes-kernel/linux/linux-yocto-custom/0001-linux-version-tweak.patch
+++ b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom/0001-linux-version-tweak.patch
@@ -1,26 +1,29 @@
-From 5a55943a6bbb10a79994a0b18071b2427dffb15f Mon Sep 17 00:00:00 2001
+From fb2c401374d4efe89e8da795e21d96fac038639d Mon Sep 17 00:00:00 2001
 From: Bruce Ashfield <bruce.ashfield@windriver.com>
 Date: Mon, 11 Jun 2012 15:31:42 -0400
 Subject: [PATCH] linux: version tweak
 
+Upstream-Status: Inapproriate [example code]
+
 Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
 ---
- Makefile |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile b/Makefile
-index a687963..f5b1ac3 100644
+index c361593..099e8ff 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -2,7 +2,7 @@ VERSION = 3
- PATCHLEVEL = 4
+@@ -2,7 +2,7 @@ VERSION = 4
+ PATCHLEVEL = 2
  SUBLEVEL = 0
  EXTRAVERSION =
--NAME = Saber-toothed Squirrel
-+NAME = Saber-toothed Squirrel-custom
+-NAME = Hurr durr I'ma sheep
++NAME = Hurr durr I'ma customized sheep 
  
  # *DOCUMENTATION*
  # To see a list of typical targets execute "make help"
 -- 
-1.7.5.4
+2.1.4
 
-- 
2.1.4


