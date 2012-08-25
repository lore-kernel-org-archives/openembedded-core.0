Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1T58HL-0000NH-6j
	for openembedded-core@lists.openembedded.org;
	Sat, 25 Aug 2012 06:47:23 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 24 Aug 2012 21:35:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,309,1344236400"; d="scan'208";a="184740802"
Received: from unknown (HELO localhost) ([10.255.12.244])
	by azsmga001.ch.intel.com with ESMTP; 24 Aug 2012 21:35:12 -0700
From: tom.zanussi@intel.com
To: richard.purdie@linuxfoundation.org,
	openembedded-core@lists.openembedded.org
Date: Fri, 24 Aug 2012 23:34:47 -0500
Message-Id: <65d8351bbcb9fb6012c296222795f3c938dc5624.1345867875.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.11.4
In-Reply-To: <cover.1345867875.git.tom.zanussi@intel.com>
References: <cover.1345867875.git.tom.zanussi@intel.com>
Subject: [PATCH 1/1] ia32-base.inc: new include file
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
X-List-Received-Date: Sat, 25 Aug 2012 04:47:23 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

This is the ia32-base.inc moved over from meta-intel.  See meta-intel
for the complete history of contributions to this file.

Here's the initial commit text that explains the purpose of this file:

  The meta-intel BSPs currently have a number of machine settings common
  to all - factor these out into a common include file.

  Also add several new intel-specific XSERVER variables for building
  XSERVER variables in BSPs.

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
---
 meta/conf/machine/include/ia32-base.inc | 58 +++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 meta/conf/machine/include/ia32-base.inc

diff --git a/meta/conf/machine/include/ia32-base.inc b/meta/conf/machine/include/ia32-base.inc
new file mode 100644
index 0000000..af583ae
--- /dev/null
+++ b/meta/conf/machine/include/ia32-base.inc
@@ -0,0 +1,58 @@
+#
+# base machine settings for ia32-architecture BSPs
+#
+
+#
+# common settings for Intel-based machines
+#
+MACHINE_FEATURES += "screen keyboard pci usbhost ext2 ext3 x86 \
+                     acpi serial usbgadget alsa"
+
+MACHINE_EXTRA_RRECOMMENDS += "kernel-modules eee-acpi-scripts"
+MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "grub"
+
+IMAGE_FSTYPES += "ext3 cpio.gz live"
+
+KERNEL_IMAGETYPE ?= "bzImage"
+
+SERIAL_CONSOLE ?= "115200 ttyS0"
+
+#
+# glibc-related variables
+#
+GLIBC_ADDONS ?= "nptl"
+
+#
+# kernel-related variables
+#
+PREFERRED_PROVIDER_virtual/kernel ??= "linux-yocto"
+PREFERRED_VERSION_linux-yocto ??= "3.0%"
+
+#
+# XSERVER subcomponents, used to build the XSERVER variable
+#
+XSERVER_IA32_BASE = "xserver-xorg \
+           xf86-input-mouse \
+           xf86-input-keyboard \
+           xf86-input-evdev \
+           xf86-input-synaptics \
+           mesa-dri \
+           "
+
+XSERVER_IA32_EXT = "xserver-xorg-extension-dri \
+           xserver-xorg-extension-dri2 \
+           xserver-xorg-extension-glx \
+           xserver-xorg-extension-extmod \
+           xserver-xorg-extension-dbe \
+           xserver-xorg-module-libint10 \
+           "
+
+XSERVER_IA32_I915 = "xf86-video-intel \
+           mesa-dri-driver-i915 \
+           "
+
+XSERVER_IA32_I965 = "xf86-video-intel \
+           mesa-dri-driver-i965 \
+           "
+
+XSERVER_IA32_VESA = "xf86-video-vesa"
-- 
1.7.11.4



