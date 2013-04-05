Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1UOC76-0005mO-4D
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Apr 2013 21:15:54 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 05 Apr 2013 11:58:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,416,1363158000"; d="scan'208";a="290058329"
Received: from fear.jf.intel.com (HELO rage.local) ([10.7.201.160])
	by orsmga001.jf.intel.com with ESMTP; 05 Apr 2013 11:58:36 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Apr 2013 12:00:56 -0700
Message-Id: <ec31660cfa91feb98f0111a9b391ac8f560b6150.1365188456.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH] linux-yocto-tiny: Add 3.8.4 recipe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 05 Apr 2013 19:16:01 -0000

Bring linux-yocto-tiny up to the latest linux-yocto 3.8.4 version.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb |   26 +++++++++++++++++++++
 1 files changed, 26 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb

diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb
new file mode 100644
index 0000000..07b620c
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb
@@ -0,0 +1,26 @@
+require recipes-kernel/linux/linux-yocto.inc
+
+# We need lzma (as CONFIG_KERNEL_LZMA=y)
+DEPENDS += "xz-native"
+
+KBRANCH_DEFAULT = "standard/tiny/base"
+KBRANCH = "${KBRANCH_DEFAULT}"
+LINUX_KERNEL_TYPE = "tiny"
+KCONFIG_MODE = "--allnoconfig"
+
+LINUX_VERSION ?= "3.8.4"
+
+KMETA = "meta"
+
+SRCREV_machine ?= "42ddf06111efe45f3c36012d5a04a1eeb9781f42"
+SRCREV_meta ?= "f86199dd4c142fae61517a993b3f7162bb6d4f94"
+
+PR = "${INC_PR}.0"
+PV = "${LINUX_VERSION}+git${SRCPV}"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.8.git;protocol=git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
+
+COMPATIBLE_MACHINE = "(qemux86)"
+
+# Functionality flags
+KERNEL_FEATURES = ""
-- 
1.7.5.4



