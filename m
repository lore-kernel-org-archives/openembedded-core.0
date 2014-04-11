Return-Path: <nitin.a.kamble@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 9276765D24
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 11 Apr 2014 17:54:06 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 11 Apr 2014 10:54:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,843,1389772800"; d="scan'208";a="519054660"
Received: from yocto-hm1.jf.intel.com ([10.23.232.34])
	by fmsmga002.fm.intel.com with ESMTP; 11 Apr 2014 10:54:07 -0700
From: nitin.a.kamble@intel.com
To: Openembedded-core@lists.openembedded.org, darren.hart@intel.com,
	bruce.ashfield@windriver.com, richard.purdie@linuxfoundation.org
Date: Fri, 11 Apr 2014 10:59:30 -0700
Message-Id: <12b191e0f58ed7954477dab64bb89d7e94b95039.1397238371.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <cover.1397238371.git.nitin.a.kamble@intel.com>
References: <cover.1397238371.git.nitin.a.kamble@intel.com>
Subject: [Patch v2 1/1] meta-skeleton: linux-yocto-custom.bb: use machine overrides
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
X-List-Received-Date: Fri, 11 Apr 2014 17:54:06 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Use machine overrides for variables for this skeleton kernel recipe
so that people following skeleton do it right at the beginning.

The machine overrides for the variables reduces  variable name-space
pollution and avoids unintentional influences on other layers.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
index c329106..16db4a3 100644
--- a/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
+++ b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
@@ -44,21 +44,23 @@
 inherit kernel
 require recipes-kernel/linux/linux-yocto.inc
 
+#Note: Replace the yourmachine string with your actual machine name here
+
 # Override SRC_URI in a bbappend file to point at a different source
 # tree if you do not want to build from Linus' tree.
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git;protocol=git;nocheckout=1;name=machine"
+SRC_URI_yourmachine = "git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git;protocol=git;nocheckout=1;name=yourmachine"
 
-LINUX_VERSION ?= "3.4"
-LINUX_VERSION_EXTENSION ?= "-custom"
+LINUX_VERSION_yourmachine ?= "3.4"
+LINUX_VERSION_EXTENSION_yourmachine ?= "-custom"
 
 # Override SRCREV to point to a different commit in a bbappend file to
 # build a different release of the Linux kernel.
 # tag: v3.4 76e10d158efb6d4516018846f60c2ab5501900bc
-SRCREV_machine="76e10d158efb6d4516018846f60c2ab5501900bc"
+SRCREV_yourmachine="76e10d158efb6d4516018846f60c2ab5501900bc"
 
 PR = "r1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-# Override COMPATIBLE_MACHINE to include your machine in a bbappend
-# file. Leaving it empty here ensures an early explicit build failure.
-COMPATIBLE_MACHINE = "(^$)"
+# Override COMPATIBLE_MACHINE to include your yourmachine in a bbappend
+# file.
+COMPATIBLE_MACHINE_yourmachine = "yourmachine"
-- 
1.8.1.4


