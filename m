Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QreR7-0005VE-5Y
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 01:13:14 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 11 Aug 2011 16:08:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="37688743"
Received: from unknown (HELO localhost) ([10.7.199.156])
	by orsmga001.jf.intel.com with ESMTP; 11 Aug 2011 16:08:31 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: bruce.ashfield@windriver.com, tom.zanussi@intel.com,
	openembedded-core@lists.openembedded.org
Date: Thu, 11 Aug 2011 16:08:23 -0700
Message-Id: <760d79558c5e35b9b0e73734bb90ebadf427f208.1313092152.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1313092152.git.dvhart@linux.intel.com>
References: <cover.1313092152.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1313092152.git.dvhart@linux.intel.com>
References: <cover.1313092152.git.dvhart@linux.intel.com>
Subject: [PATCH 10/10] recipes-rt: add a README documenting the contents of recipes-rt
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
X-List-Received-Date: Thu, 11 Aug 2011 23:13:15 -0000

Document the non-obvious bits of using the recipes-rt recipes.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 meta/recipes-rt/README |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-rt/README

diff --git a/meta/recipes-rt/README b/meta/recipes-rt/README
new file mode 100644
index 0000000..7d7558d
--- /dev/null
+++ b/meta/recipes-rt/README
@@ -0,0 +1,13 @@
+The recipes-rt recipes provide package and image recipes for using and testing
+the PREEMPT_RT kernel. The core-image-rt*.bb images are minimal images with
+a couple extra packages, including rt-tests. In order to build the image with
+the linux-yocto-rt kernel, be sure to include the following line in your
+local.conf, bblayers.conf, or your $MACHINE.conf.
+
+PREFERRED_PROVIDER_virtual/kernel = "linux-yocto-rt"
+
+If you are creating a new BSP which should use linux-yocto-rt by default,
+use the line above in the $MACHINE.conf in your BSP layer, and specify the
+following in a linux-yocto-rt bbappend recipe:
+
+COMPATIBLE_MACHINE_$MACHINE = $MACHINE
-- 
1.7.6



