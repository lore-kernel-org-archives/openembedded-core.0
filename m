Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1RoBxz-0001TR-8C
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Jan 2012 11:45:07 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 20 Jan 2012 02:35:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="109029975"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.2])
	by fmsmga001.fm.intel.com with ESMTP; 20 Jan 2012 02:35:27 -0800
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2012 18:52:00 +0800
Message-Id: <69ff8f763687a58c4541f9d376c27de12e20ef25.1327056627.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1327056627.git.shane.wang@intel.com>
References: <cover.1327056627.git.shane.wang@intel.com>
In-Reply-To: <cover.1327056627.git.shane.wang@intel.com>
References: <cover.1327056627.git.shane.wang@intel.com>
Subject: [PATCH 1/1] core-image-foo: add description to each image bb file
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
X-List-Received-Date: Fri, 20 Jan 2012 10:45:07 -0000

Add DESCRIPTION to each image bb file according to poky reference manual for Hob2 use later.

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
index 13a7650..71ff3b9 100644
--- a/meta/recipes-core/images/core-image-base.bb
+++ b/meta/recipes-core/images/core-image-base.bb
@@ -1,6 +1,8 @@
 #
 # Copyright (C) 2007 OpenedHand Ltd.
 #
+DESCRIPTION = "A console-only image that fully supports the target device \
+hardware."
 
 IMAGE_FEATURES += "apps-console-core"
 
diff --git a/meta/recipes-core/images/core-image-core.bb b/meta/recipes-core/images/core-image-core.bb
index 57ff085..2d768e0 100644
--- a/meta/recipes-core/images/core-image-core.bb
+++ b/meta/recipes-core/images/core-image-core.bb
@@ -1,6 +1,8 @@
 #
 # Copyright (C) 2007 OpenedHand Ltd.
 #
+DESCRIPTION = "An X11 image with simple applications such as terminal, editor \
+and file manager."
 
 IMAGE_FEATURES += "apps-console-core ${X11_IMAGE_FEATURES}"
 
diff --git a/meta/recipes-core/images/core-image-minimal-dev.bb b/meta/recipes-core/images/core-image-minimal-dev.bb
index 89ec9f8..3a0a187 100644
--- a/meta/recipes-core/images/core-image-minimal-dev.bb
+++ b/meta/recipes-core/images/core-image-minimal-dev.bb
@@ -1,6 +1,8 @@
 #
 # Copyright (C) 2007 OpenedHand Ltd.
 #
+DESCRIPTION = "A core-image-minimal image suitable for development work."
+
 IMAGE_INSTALL = "task-core-boot ${ROOTFS_PKGMANAGE}"
 
 IMAGE_FEATURES += "dev-pkgs"
diff --git a/meta/recipes-core/images/core-image-minimal-initramfs.bb b/meta/recipes-core/images/core-image-minimal-initramfs.bb
index 5149f31..85b9ff9 100644
--- a/meta/recipes-core/images/core-image-minimal-initramfs.bb
+++ b/meta/recipes-core/images/core-image-minimal-initramfs.bb
@@ -1,4 +1,7 @@
 # Simple initramfs image. Mostly used for live images.
+DESCRIPTION = "A core-image-minimal image that has the Minimal RAM-based \
+Initial Root Filesystem (initramfs) as part of the kernel, which allows the \
+system to find the first 'init' program more efficiently."
 
 IMAGE_INSTALL = "initramfs-live-boot initramfs-live-install busybox udev base-passwd"
 
diff --git a/meta/recipes-core/images/core-image-minimal-mtdutils.bb b/meta/recipes-core/images/core-image-minimal-mtdutils.bb
index adabaa4..7b7f700 100644
--- a/meta/recipes-core/images/core-image-minimal-mtdutils.bb
+++ b/meta/recipes-core/images/core-image-minimal-mtdutils.bb
@@ -3,4 +3,8 @@
 #
 require core-image-minimal.bb
 
+DESCRIPTION = "A core-image-minimal image that has support the Minimal MTD \
+Utilities, which let the user interact with the MTD subsystem in the kernel \
+to perform operations on flash devices."
+
 IMAGE_INSTALL += "mtd-utils"
diff --git a/meta/recipes-core/images/core-image-minimal.bb b/meta/recipes-core/images/core-image-minimal.bb
index 56fc20c..687f72a 100644
--- a/meta/recipes-core/images/core-image-minimal.bb
+++ b/meta/recipes-core/images/core-image-minimal.bb
@@ -1,6 +1,8 @@
 #
 # Copyright (C) 2007 OpenedHand Ltd.
 #
+DESCRIPTION = "A small image just capable of allowing a device to boot."
+
 IMAGE_INSTALL = "task-core-boot ${ROOTFS_PKGMANAGE_BOOTSTRAP} ${POKY_EXTRA_INSTALL}"
 
 IMAGE_LINGUAS = " "
diff --git a/meta/recipes-extended/images/core-image-basic.bb b/meta/recipes-extended/images/core-image-basic.bb
index ba71cd0..5e58e60 100644
--- a/meta/recipes-extended/images/core-image-basic.bb
+++ b/meta/recipes-extended/images/core-image-basic.bb
@@ -1,3 +1,6 @@
+DESCRIPTION = "A foundational basic image without support for X that can be \
+reasonably used for customization."
+
 IMAGE_FEATURES += "apps-console-core ssh-server-openssh"
 
 IMAGE_INSTALL = "\
diff --git a/meta/recipes-extended/images/core-image-lsb-dev.bb b/meta/recipes-extended/images/core-image-lsb-dev.bb
index 9ef85ff..2d6f674 100644
--- a/meta/recipes-extended/images/core-image-lsb-dev.bb
+++ b/meta/recipes-extended/images/core-image-lsb-dev.bb
@@ -1,3 +1,7 @@
+DESCRIPTION = "A core-image-lsb that includes everything in meta-toolchain \
+but also includes development headers and libraries to form a complete \
+standalone SDK."
+
 IMAGE_FEATURES += "apps-console-core dev-pkgs ssh-server-openssh"
 
 IMAGE_INSTALL = "\
diff --git a/meta/recipes-extended/images/core-image-lsb-sdk.bb b/meta/recipes-extended/images/core-image-lsb-sdk.bb
index 5e0e7ae..105c8db 100644
--- a/meta/recipes-extended/images/core-image-lsb-sdk.bb
+++ b/meta/recipes-extended/images/core-image-lsb-sdk.bb
@@ -1,3 +1,7 @@
+DESCRIPTION = "A core-image-lsb that includes everything in meta-toolchain \
+but also includes development headers and libraries to form a complete \
+standalone SDK."
+
 IMAGE_FEATURES += "apps-console-core tools-sdk dev-pkgs ssh-server-openssh"
 EXTRA_IMAGE_FEATURES = "tools-debug tools-profile tools-testapps debug-tweaks"
 
diff --git a/meta/recipes-extended/images/core-image-lsb.bb b/meta/recipes-extended/images/core-image-lsb.bb
index 22eb7f4..f669618 100644
--- a/meta/recipes-extended/images/core-image-lsb.bb
+++ b/meta/recipes-extended/images/core-image-lsb.bb
@@ -1,3 +1,6 @@
+DESCRIPTION = "A core-image-basic image suitable for implementations that \
+conform to Linux Standard Base (LSB)."
+
 IMAGE_FEATURES += "apps-console-core ssh-server-openssh"
 
 IMAGE_INSTALL = "\
diff --git a/meta/recipes-graphics/images/core-image-clutter.bb b/meta/recipes-graphics/images/core-image-clutter.bb
index 7d50405..636238a 100644
--- a/meta/recipes-graphics/images/core-image-clutter.bb
+++ b/meta/recipes-graphics/images/core-image-clutter.bb
@@ -1,3 +1,6 @@
+DESCRIPTION = "An image with support for the Open GL-based toolkit Clutter, \
+which enables development of rich and animated graphical user interfaces."
+
 IMAGE_FEATURES += "apps-console-core ${SATO_IMAGE_FEATURES}"
 
 LICENSE = "MIT"
diff --git a/meta/recipes-sato/images/core-image-sato-dev.bb b/meta/recipes-sato/images/core-image-sato-dev.bb
index 7322b4a..b30447c 100644
--- a/meta/recipes-sato/images/core-image-sato-dev.bb
+++ b/meta/recipes-sato/images/core-image-sato-dev.bb
@@ -1,6 +1,9 @@
 #
 # Copyright (C) 2007 OpenedHand Ltd.
 #
+DESCRIPTION = "A core-image-sato image suitable for development that also \
+includes a native toolchain and libraries needed to build applications on the \
+device itself."
 
 IMAGE_FEATURES += "apps-console-core ${SATO_IMAGE_FEATURES} dev-pkgs"
 
diff --git a/meta/recipes-sato/images/core-image-sato-sdk.bb b/meta/recipes-sato/images/core-image-sato-sdk.bb
index 6c2dc60..2cf8cad 100644
--- a/meta/recipes-sato/images/core-image-sato-sdk.bb
+++ b/meta/recipes-sato/images/core-image-sato-sdk.bb
@@ -1,7 +1,9 @@
 #
 # Copyright (C) 2007 OpenedHand Ltd.
 #
-
+DESCRIPTION = "A core-image-sato image that includes everything in \
+meta-toolchain. The image also includes development headers and libraries \
+to form a complete standalone SDK."
 
 IMAGE_FEATURES += "apps-console-core ${SATO_IMAGE_FEATURES} dev-pkgs tools-sdk qt4-pkgs"
 EXTRA_IMAGE_FEATURES += "tools-debug tools-profile tools-testapps debug-tweaks"
diff --git a/meta/recipes-sato/images/core-image-sato.bb b/meta/recipes-sato/images/core-image-sato.bb
index 3465174..11c3318 100644
--- a/meta/recipes-sato/images/core-image-sato.bb
+++ b/meta/recipes-sato/images/core-image-sato.bb
@@ -1,6 +1,8 @@
 #
 # Copyright (C) 2007 OpenedHand Ltd.
 #
+DESCRIPTION = "An image with Sato support, a mobile environment and visual \
+style that works well with mobile devices."
 
 IMAGE_FEATURES += "apps-console-core ${SATO_IMAGE_FEATURES}"
 
-- 
1.7.6



