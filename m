Return-Path: <nitin.a.kamble@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2420165EF1
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 11 Apr 2014 16:59:45 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 11 Apr 2014 09:59:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,842,1389772800"; d="scan'208";a="519246326"
Received: from yocto-hm1.jf.intel.com ([10.23.232.34])
	by orsmga002.jf.intel.com with ESMTP; 11 Apr 2014 09:59:46 -0700
From: nitin.a.kamble@intel.com
To: Openembedded-core@lists.openembedded.org, bruce.ashfield@windriver.com,
	darren.hart@intel.com, richard.purdie@linuxfoundation.org
Date: Fri, 11 Apr 2014 10:05:09 -0700
Message-Id: <f1c400fe717177e267c91a497143bc0267b5fe17.1397235602.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <cover.1397235602.git.nitin.a.kamble@intel.com>
References: <cover.1397235602.git.nitin.a.kamble@intel.com>
Subject: [PATCH 1/1] meta-skeleton: linux-yocto-custom.bb: use machine overrides
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
X-List-Received-Date: Fri, 11 Apr 2014 16:59:46 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Use machine overrides for variables for this skeleton recipe so that
people following skeleton do it right at the beginning.

The machine overrides for the variables reduces pollution of name space
and avoid unintentional influences on other layers.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
index c329106..76457ca 100644
--- a/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
+++ b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
@@ -46,10 +46,10 @@ require recipes-kernel/linux/linux-yocto.inc
 
 # Override SRC_URI in a bbappend file to point at a different source
 # tree if you do not want to build from Linus' tree.
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git;protocol=git;nocheckout=1;name=machine"
+SRC_URI_machine = "git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git;protocol=git;nocheckout=1;name=machine"
 
-LINUX_VERSION ?= "3.4"
-LINUX_VERSION_EXTENSION ?= "-custom"
+LINUX_VERSION_machine ?= "3.4"
+LINUX_VERSION_EXTENSION_machine ?= "-custom"
 
 # Override SRCREV to point to a different commit in a bbappend file to
 # build a different release of the Linux kernel.
@@ -61,4 +61,4 @@ PV = "${LINUX_VERSION}+git${SRCPV}"
 
 # Override COMPATIBLE_MACHINE to include your machine in a bbappend
 # file. Leaving it empty here ensures an early explicit build failure.
-COMPATIBLE_MACHINE = "(^$)"
+COMPATIBLE_MACHINE_machine = "(^$)"
-- 
1.8.1.4


