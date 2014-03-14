Return-Path: <dvhart@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id ED5136F7E3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Mar 2014 21:08:57 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 14 Mar 2014 14:08:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,657,1389772800"; d="scan'208";a="472787489"
Received: from fear.jf.intel.com (HELO localhost) ([10.7.201.149])
	by orsmga001.jf.intel.com with ESMTP; 14 Mar 2014 14:08:57 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	Bruce Ashfield <bruce.ashfield@windriver.com>,
	Saul Wold <sgw@linux.intel.com>
Date: Fri, 14 Mar 2014 14:15:20 -0700
Message-Id: <0b46d38b8e08d22c308a49d3ccb96ae9c8f14121.1394831720.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH] linux-yocto-custom: Use SRCREV_machine
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
X-List-Received-Date: Fri, 14 Mar 2014 21:08:58 -0000

The Yocto kernel tools look for SRCREV_machine in do_validate_branches,
if it's empty, it just returns and silently continues. This likely needs
at least a warning. However, this recipe should be using SRCREV_machine,
and not just SRCREV.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Reported-by: Saul Wold <sgw@linux.intel.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 .../recipes-kernel/linux/linux-yocto-custom.bb     |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
index 4115d2f..42162f3 100644
--- a/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
+++ b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
@@ -54,7 +54,7 @@ LINUX_VERSION_EXTENSION ?= "-custom"
 # Override SRCREV to point to a different commit in a bbappend file to
 # build a different release of the Linux kernel.
 # tag: v3.4 76e10d158efb6d4516018846f60c2ab5501900bc
-SRCREV="76e10d158efb6d4516018846f60c2ab5501900bc"
+SRCREV_machine="76e10d158efb6d4516018846f60c2ab5501900bc"
 
 PR = "r1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.7.9.5


