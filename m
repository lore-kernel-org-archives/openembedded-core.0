Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1RnrAI-0002Qb-9J
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jan 2012 13:32:26 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 19 Jan 2012 04:24:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="100372915"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.2])
	by orsmga002.jf.intel.com with ESMTP; 19 Jan 2012 04:24:45 -0800
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jan 2012 20:38:05 +0800
Message-Id: <09ab90b65169616911ae3811421b374158b6453d.1326976547.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1326976547.git.shane.wang@intel.com>
References: <cover.1326976547.git.shane.wang@intel.com>
In-Reply-To: <cover.1326976547.git.shane.wang@intel.com>
References: <cover.1326976547.git.shane.wang@intel.com>
Subject: [PATCH 1/1] core-image-foo: add summary to each image bb file
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
X-List-Received-Date: Thu, 19 Jan 2012 12:32:26 -0000

Add SUMMARY to each image bb file according to poky reference manual for Hob2 use later.

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 meta/recipes-core/images/core-image-base.bb        |    2 ++
 meta/recipes-core/images/core-image-core.bb        |    2 ++
 meta/recipes-core/images/core-image-minimal-dev.bb |    2 ++
 .../images/core-image-minimal-initramfs.bb         |    3 +++
 .../images/core-image-minimal-mtdutils.bb          |    4 ++++
 meta/recipes-core/images/core-image-minimal.bb     |    2 ++
 meta/recipes-extended/images/core-image-basic.bb   |    3 +++
 meta/recipes-extended/images/core-image-lsb-dev.bb |    4 ++++
 meta/recipes-extended/images/core-image-lsb-sdk.bb |    4 ++++
 meta/recipes-extended/images/core-image-lsb.bb     |    3 +++
 meta/recipes-graphics/images/core-image-clutter.bb |    3 +++
 meta/recipes-sato/images/core-image-sato-dev.bb    |    3 +++
 meta/recipes-sato/images/core-image-sato-sdk.bb    |    4 +++-
 meta/recipes-sato/images/core-image-sato.bb        |    2 ++
 14 files changed, 40 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/images/core-image-base.bb b/meta/recipes-core/images/core-image-base.bb
index 13a7650..1d3e793 100644
--- a/meta/recipes-core/images/core-image-base.bb
+++ b/meta/recipes-core/images/core-image-base.bb
@@ -1,6 +1,8 @@
 #
 # Copyright (C) 2007 OpenedHand Ltd.
 #
+SUMMARY = "A console-only image that fully supports the target device \
+hardware."
 
 IMAGE_FEATURES += "apps-console-core"
 
diff --git a/meta/recipes-core/images/core-image-core.bb b/meta/recipes-core/images/core-image-core.bb
index 57ff085..a36d513 100644
--- a/meta/recipes-core/images/core-image-core.bb
+++ b/meta/recipes-core/images/core-image-core.bb
@@ -1,6 +1,8 @@
 #
 # Copyright (C) 2007 OpenedHand Ltd.
 #
+SUMMARY = "An X11 image with simple applications such as terminal, editor \
+and file manager."
 
 IMAGE_FEATURES += "apps-console-core ${X11_IMAGE_FEATURES}"
 
diff --git a/meta/recipes-core/images/core-image-minimal-dev.bb b/meta/recipes-core/images/core-image-minimal-dev.bb
index 89ec9f8..76395f1 100644
--- a/meta/recipes-core/images/core-image-minimal-dev.bb
+++ b/meta/recipes-core/images/core-image-minimal-dev.bb
@@ -1,6 +1,8 @@
 #
 # Copyright (C) 2007 OpenedHand Ltd.
 #
+SUMMARY = "A core-image-minimal image suitable for development work."
+
 IMAGE_INSTALL = "task-core-boot ${ROOTFS_PKGMANAGE}"
 
 IMAGE_FEATURES += "dev-pkgs"
diff --git a/meta/recipes-core/images/core-image-minimal-initramfs.bb b/meta/recipes-core/images/core-image-minimal-initramfs.bb
index 5149f31..95b5a50 100644
--- a/meta/recipes-core/images/core-image-minimal-initramfs.bb
+++ b/meta/recipes-core/images/core-image-minimal-initramfs.bb
@@ -1,4 +1,7 @@
 # Simple initramfs image. Mostly used for live images.
+SUMMARY = "A core-image-minimal image that has the Minimal RAM-based \
+Initial Root Filesystem (initramfs) as part of the kernel, which allows the \
+system to find the first 'init' program more efficiently."
 
 IMAGE_INSTALL = "initramfs-live-boot initramfs-live-install busybox udev base-passwd"
 
diff --git a/meta/recipes-core/images/core-image-minimal-mtdutils.bb b/meta/recipes-core/images/core-image-minimal-mtdutils.bb
index adabaa4..2f8a3f5 100644
--- a/meta/recipes-core/images/core-image-minimal-mtdutils.bb
+++ b/meta/recipes-core/images/core-image-minimal-mtdutils.bb
@@ -3,4 +3,8 @@
 #
 require core-image-minimal.bb
 
+SUMMARY = "A core-image-minimal image that has support the Minimal MTD \
+Utilities, which let the user interact with the MTD subsystem in the kernel \
+to perform operations on flash devices."
+
 IMAGE_INSTALL += "mtd-utils"
diff --git a/meta/recipes-core/images/core-image-minimal.bb b/meta/recipes-core/images/core-image-minimal.bb
index 56fc20c..843030d 100644
--- a/meta/recipes-core/images/core-image-minimal.bb
+++ b/meta/recipes-core/images/core-image-minimal.bb
@@ -1,6 +1,8 @@
 #
 # Copyright (C) 2007 OpenedHand Ltd.
 #
+SUMMARY = "A small image just capable of allowing a device to boot."
+
 IMAGE_INSTALL = "task-core-boot ${ROOTFS_PKGMANAGE_BOOTSTRAP} ${POKY_EXTRA_INSTALL}"
 
 IMAGE_LINGUAS = " "
diff --git a/meta/recipes-extended/images/core-image-basic.bb b/meta/recipes-extended/images/core-image-basic.bb
index ba71cd0..261b993 100644
--- a/meta/recipes-extended/images/core-image-basic.bb
+++ b/meta/recipes-extended/images/core-image-basic.bb
@@ -1,3 +1,6 @@
+SUMMARY = "A foundational basic image without support for X that can be \
+reasonably used for customization."
+
 IMAGE_FEATURES += "apps-console-core ssh-server-openssh"
 
 IMAGE_INSTALL = "\
diff --git a/meta/recipes-extended/images/core-image-lsb-dev.bb b/meta/recipes-extended/images/core-image-lsb-dev.bb
index 9ef85ff..8397da1 100644
--- a/meta/recipes-extended/images/core-image-lsb-dev.bb
+++ b/meta/recipes-extended/images/core-image-lsb-dev.bb
@@ -1,3 +1,7 @@
+SUMMARY = "A core-image-lsb that includes everything in meta-toolchain \
+but also includes development headers and libraries to form a complete \
+standalone SDK."
+
 IMAGE_FEATURES += "apps-console-core dev-pkgs ssh-server-openssh"
 
 IMAGE_INSTALL = "\
diff --git a/meta/recipes-extended/images/core-image-lsb-sdk.bb b/meta/recipes-extended/images/core-image-lsb-sdk.bb
index 5e0e7ae..34e11b7 100644
--- a/meta/recipes-extended/images/core-image-lsb-sdk.bb
+++ b/meta/recipes-extended/images/core-image-lsb-sdk.bb
@@ -1,3 +1,7 @@
+SUMMARY = "A core-image-lsb that includes everything in meta-toolchain \
+but also includes development headers and libraries to form a complete \
+standalone SDK."
+
 IMAGE_FEATURES += "apps-console-core tools-sdk dev-pkgs ssh-server-openssh"
 EXTRA_IMAGE_FEATURES = "tools-debug tools-profile tools-testapps debug-tweaks"
 
diff --git a/meta/recipes-extended/images/core-image-lsb.bb b/meta/recipes-extended/images/core-image-lsb.bb
index 22eb7f4..306fde6 100644
--- a/meta/recipes-extended/images/core-image-lsb.bb
+++ b/meta/recipes-extended/images/core-image-lsb.bb
@@ -1,3 +1,6 @@
+SUMMARY = "A core-image-basic image suitable for implementations that \
+conform to Linux Standard Base (LSB)."
+
 IMAGE_FEATURES += "apps-console-core ssh-server-openssh"
 
 IMAGE_INSTALL = "\
diff --git a/meta/recipes-graphics/images/core-image-clutter.bb b/meta/recipes-graphics/images/core-image-clutter.bb
index 7d50405..7d8b8e6 100644
--- a/meta/recipes-graphics/images/core-image-clutter.bb
+++ b/meta/recipes-graphics/images/core-image-clutter.bb
@@ -1,3 +1,6 @@
+SUMMARY = "An image with support for the Open GL-based toolkit Clutter, \
+which enables development of rich and animated graphical user interfaces."
+
 IMAGE_FEATURES += "apps-console-core ${SATO_IMAGE_FEATURES}"
 
 LICENSE = "MIT"
diff --git a/meta/recipes-sato/images/core-image-sato-dev.bb b/meta/recipes-sato/images/core-image-sato-dev.bb
index 7322b4a..2fb366a 100644
--- a/meta/recipes-sato/images/core-image-sato-dev.bb
+++ b/meta/recipes-sato/images/core-image-sato-dev.bb
@@ -1,6 +1,9 @@
 #
 # Copyright (C) 2007 OpenedHand Ltd.
 #
+SUMMARY = "A core-image-sato image suitable for development that also \
+includes a native toolchain and libraries needed to build applications on the \
+device itself."
 
 IMAGE_FEATURES += "apps-console-core ${SATO_IMAGE_FEATURES} dev-pkgs"
 
diff --git a/meta/recipes-sato/images/core-image-sato-sdk.bb b/meta/recipes-sato/images/core-image-sato-sdk.bb
index 6c2dc60..9bcd1d7 100644
--- a/meta/recipes-sato/images/core-image-sato-sdk.bb
+++ b/meta/recipes-sato/images/core-image-sato-sdk.bb
@@ -1,7 +1,9 @@
 #
 # Copyright (C) 2007 OpenedHand Ltd.
 #
-
+SUMMARY = "A core-image-sato image that includes everything in \
+meta-toolchain. The image also includes development headers and libraries \
+to form a complete standalone SDK."
 
 IMAGE_FEATURES += "apps-console-core ${SATO_IMAGE_FEATURES} dev-pkgs tools-sdk qt4-pkgs"
 EXTRA_IMAGE_FEATURES += "tools-debug tools-profile tools-testapps debug-tweaks"
diff --git a/meta/recipes-sato/images/core-image-sato.bb b/meta/recipes-sato/images/core-image-sato.bb
index 3465174..3748fd3 100644
--- a/meta/recipes-sato/images/core-image-sato.bb
+++ b/meta/recipes-sato/images/core-image-sato.bb
@@ -1,6 +1,8 @@
 #
 # Copyright (C) 2007 OpenedHand Ltd.
 #
+SUMMARY = "An image with Sato support, a mobile environment and visual \
+style that works well with mobile devices."
 
 IMAGE_FEATURES += "apps-console-core ${SATO_IMAGE_FEATURES}"
 
-- 
1.7.6



