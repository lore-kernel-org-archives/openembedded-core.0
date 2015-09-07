Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id C376A762A2
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Sep 2015 09:59:36 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 07 Sep 2015 02:59:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,484,1437462000"; d="scan'208";a="799932349"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 07 Sep 2015 02:59:35 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Sep 2015 13:01:11 +0300
Message-Id: <45e1a4face3a70d6f6de71d9e52df9e5ed16e6c4.1441620055.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1441620055.git.alexander.kanavin@linux.intel.com>
References: <cover.1441620055.git.alexander.kanavin@linux.intel.com>
Subject: [RFC PATCH 1/1] qemuppc64: add a configuration for a powerpc64 machine
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
X-List-Received-Date: Mon, 07 Sep 2015 09:59:36 -0000

Note that I copied and tweaked the ppc (32 bit) configuration and
didn't in any way test this with qemu; I only wanted
a working configuration for testing ppc64 builds using poky.
But it could be a starting point.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/conf/machine/qemuppc64.conf | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta/conf/machine/qemuppc64.conf

diff --git a/meta/conf/machine/qemuppc64.conf b/meta/conf/machine/qemuppc64.conf
new file mode 100644
index 0000000..d18eea2
--- /dev/null
+++ b/meta/conf/machine/qemuppc64.conf
@@ -0,0 +1,11 @@
+#@TYPE: Machine
+#@NAME: qemu PPC Emulator setup
+#@DESCRIPTION: Machine configuration for running an PPC system under qemu emulation
+
+require conf/machine/include/qemu.inc
+require conf/machine/include/tune-power5.inc
+
+KERNEL_IMAGETYPE = "vmlinux"
+
+SERIAL_CONSOLE = "115200 ttyS0"
+
-- 
2.1.4


