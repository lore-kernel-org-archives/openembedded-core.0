Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1QZV4p-0005lb-Ek
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 23:35:11 +0200
Received: from localhost.localdomain (yow-bashfiel-d2.ottawa.windriver.com
	[128.224.146.167])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5MLVTBk005219;
	Wed, 22 Jun 2011 14:31:31 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Wed, 22 Jun 2011 17:29:19 -0400
Message-Id: <13b6560cbb0a8a498266eba93e93f71fb34be9c2.1308777703.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1308777703.git.bruce.ashfield@windriver.com>
References: <cover.1308777703.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1308777703.git.bruce.ashfield@windriver.com>
References: <cover.1308777703.git.bruce.ashfield@windriver.com>
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	koen@dominion.thruhere.net, saul.wold@intel.com
Subject: [PATCH 1/2] linux-yocto: update meta SRCREV for new config groups
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
X-List-Received-Date: Wed, 22 Jun 2011 21:35:11 -0000

Updating the SRCREV for the kernel repo's meta branch to capture
the following commits:

  94fa015 meta: add taskstats experimental feature group
  4fb2ed5 meta: enable freezer support
  88d619e meta: enable fuse and cuse as modules
  f465827 meta: add namespaces + experimental configs
  fbdd376 meta: add devtmpfs config group
  b04f6d9 meta: re-enable cgroups options in the standard kernel

There's also a change to the recipe itself to trigger the taskstats
optional config items by default. This is to allow the introduction
of these changes gradually, since other recipes inheriting the kernel
can add or ignore these options at their convenience.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto_2.6.37.bb |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_2.6.37.bb b/meta/recipes-kernel/linux/linux-yocto_2.6.37.bb
index 2ee801e..90943c2 100644
--- a/meta/recipes-kernel/linux/linux-yocto_2.6.37.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_2.6.37.bb
@@ -20,9 +20,9 @@ SRCREV_machine_qemuppc = "9d278962ff228ea9627a85b0d21ed717246ebf1f"
 SRCREV_machine_qemux86 = "57545699dff0b384bb16be74b0358059da5cce6a"
 SRCREV_machine_qemux86-64 = "5d36c23eecdc9663c9c3a2a511d4872d3b3fd669"
 SRCREV_machine = "12646d158aced2ba0122787bd56ff554e371091c"
-SRCREV_meta = "8888d948e0ddbc5f37bd3dc23cc1b398ab230e2e"
+SRCREV_meta = "94fa015b130e96a3b6242a8ac4ff4cca9406951f"
 
-PR = "r18"
+PR = "r19"
 PV = "${LINUX_VERSION}+git${SRCPV}"
 SRCREV_FORMAT = "meta_machine"
 
@@ -33,6 +33,7 @@ COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemuppc|qemumips|qemux86-64)"
 # Functionality flags
 KERNEL_REVISION_CHECKING ?= "t"
 KERNEL_FEATURES="features/netfilter"
+KERNEL_FEATURES_append=" features/taskstats"
 KERNEL_FEATURES_append_qemux86=" cfg/sound"
 KERNEL_FEATURES_append_qemux86-64=" cfg/sound"
 
-- 
1.7.0.4



