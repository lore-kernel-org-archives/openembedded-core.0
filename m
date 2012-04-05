Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1SFibJ-0002wN-3G
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Apr 2012 11:03:29 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 05 Apr 2012 01:53:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="128946086"
Received: from envy.jf.intel.com ([10.7.201.175])
	by orsmga002.jf.intel.com with ESMTP; 05 Apr 2012 01:53:17 -0700
From: Beth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Apr 2012 01:57:38 -0700
Message-Id: <3c321d3b65757206e52cf9a4ca78d30c014c9cd0.1333615939.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1333615939.git.elizabeth.flanagan@intel.com>
References: <cover.1333615939.git.elizabeth.flanagan@intel.com>
Subject: [PATCH 1/1] Hob: Modify Image Descriptions
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
X-List-Received-Date: Thu, 05 Apr 2012 09:03:29 -0000

From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>

Fixes [YOCTO #2227]

I've updated the image descriptions per the bug description.

Signed-off-by: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
---
 meta/recipes-core/images/core-image-core.bb        |    2 +-
 meta/recipes-core/images/core-image-minimal-dev.bb |    3 ++-
 .../images/core-image-minimal-initramfs.bb         |    6 +++---
 .../images/core-image-minimal-mtdutils.bb          |    6 +++---
 meta/recipes-core/images/self-hosted-image.bb      |    1 +
 meta/recipes-extended/images/core-image-lsb-dev.bb |    6 +++---
 meta/recipes-extended/images/core-image-lsb-sdk.bb |    6 +++---
 meta/recipes-extended/images/core-image-lsb.bb     |    3 ++-
 meta/recipes-qt/images/qt4e-demo-image.bb          |    1 +
 meta/recipes-rt/images/core-image-rt-sdk.bb        |    4 +++-
 meta/recipes-rt/images/core-image-rt.bb            |    3 ++-
 meta/recipes-sato/images/core-image-sato-dev.bb    |    6 +++---
 meta/recipes-sato/images/core-image-sato-sdk.bb    |    6 +++---
 meta/recipes-sato/images/core-image-sato.bb        |    5 +++--
 14 files changed, 33 insertions(+), 25 deletions(-)

diff --git a/meta/recipes-core/images/core-image-core.bb b/meta/recipes-core/images/core-image-core.bb
index 2d768e0..ae32be8 100644
--- a/meta/recipes-core/images/core-image-core.bb
+++ b/meta/recipes-core/images/core-image-core.bb
@@ -1,7 +1,7 @@
 #
 # Copyright (C) 2007 OpenedHand Ltd.
 #
-DESCRIPTION = "An X11 image with simple applications such as terminal, editor \
+DESCRIPTION = "An X11 image with simple applications such as terminal, editor, \
 and file manager."
 
 IMAGE_FEATURES += "apps-console-core ${X11_IMAGE_FEATURES}"
diff --git a/meta/recipes-core/images/core-image-minimal-dev.bb b/meta/recipes-core/images/core-image-minimal-dev.bb
index 3a0a187..67c7790 100644
--- a/meta/recipes-core/images/core-image-minimal-dev.bb
+++ b/meta/recipes-core/images/core-image-minimal-dev.bb
@@ -1,7 +1,8 @@
 #
 # Copyright (C) 2007 OpenedHand Ltd.
 #
-DESCRIPTION = "A core-image-minimal image suitable for development work."
+DESCRIPTION = "A small image just capable of allowing a device to boot and \
+is suitable for development work."
 
 IMAGE_INSTALL = "task-core-boot ${ROOTFS_PKGMANAGE}"
 
diff --git a/meta/recipes-core/images/core-image-minimal-initramfs.bb b/meta/recipes-core/images/core-image-minimal-initramfs.bb
index 85b9ff9..4aeb618 100644
--- a/meta/recipes-core/images/core-image-minimal-initramfs.bb
+++ b/meta/recipes-core/images/core-image-minimal-initramfs.bb
@@ -1,7 +1,7 @@
 # Simple initramfs image. Mostly used for live images.
-DESCRIPTION = "A core-image-minimal image that has the Minimal RAM-based \
-Initial Root Filesystem (initramfs) as part of the kernel, which allows the \
-system to find the first 'init' program more efficiently."
+DESCRIPTION = "Small image capable of booting a device. The kernel includes \
+the Minimal RAM-based Initial Root Filesystem (initramfs), which finds the \
+first “init” program more efficiently."
 
 IMAGE_INSTALL = "initramfs-live-boot initramfs-live-install busybox udev base-passwd"
 
diff --git a/meta/recipes-core/images/core-image-minimal-mtdutils.bb b/meta/recipes-core/images/core-image-minimal-mtdutils.bb
index df2fab1..331f16c 100644
--- a/meta/recipes-core/images/core-image-minimal-mtdutils.bb
+++ b/meta/recipes-core/images/core-image-minimal-mtdutils.bb
@@ -3,8 +3,8 @@
 #
 require core-image-minimal.bb
 
-DESCRIPTION = "A core-image-minimal image that supports the Minimal MTD \
-Utilities, which let the user interact with the MTD subsystem in the kernel \
-to perform operations on flash devices."
+DESCRIPTION = "Small image capable of booting a device with support for the \
+Minimal MTD Utilities, which let the user interact with the MTD subsystem in \
+the kernel to perform operations on flash devices."
 
 IMAGE_INSTALL += "mtd-utils"
diff --git a/meta/recipes-core/images/self-hosted-image.bb b/meta/recipes-core/images/self-hosted-image.bb
index 1db6a7a..cf3ef5f 100644
--- a/meta/recipes-core/images/self-hosted-image.bb
+++ b/meta/recipes-core/images/self-hosted-image.bb
@@ -1,3 +1,4 @@
+DESCRIPTION = "Version 1.0-r6 of the self-hosted image."
 IMAGE_INSTALL = "task-core-boot task-core-apps-console task-core-ssh-openssh task-self-hosted"
 
 LICENSE = "MIT"
diff --git a/meta/recipes-extended/images/core-image-lsb-dev.bb b/meta/recipes-extended/images/core-image-lsb-dev.bb
index e6d7bc9..3bb7800 100644
--- a/meta/recipes-extended/images/core-image-lsb-dev.bb
+++ b/meta/recipes-extended/images/core-image-lsb-dev.bb
@@ -1,6 +1,6 @@
-DESCRIPTION = "A core-image-lsb that includes everything in meta-toolchain \
-but also includes development headers and libraries to form a complete \
-standalone SDK."
+DESCRIPTION = "Basic image without X support suitable for development work. It \
+can be used for customization and implementations that conform to Linux \
+Standard Base (LSB)."
 
 IMAGE_FEATURES += "apps-console-core dev-pkgs ssh-server-openssh"
 
diff --git a/meta/recipes-extended/images/core-image-lsb-sdk.bb b/meta/recipes-extended/images/core-image-lsb-sdk.bb
index 0892891..32a5077 100644
--- a/meta/recipes-extended/images/core-image-lsb-sdk.bb
+++ b/meta/recipes-extended/images/core-image-lsb-sdk.bb
@@ -1,6 +1,6 @@
-DESCRIPTION = "A core-image-lsb that includes everything in meta-toolchain \
-but also includes development headers and libraries to form a complete \
-standalone SDK."
+DESCRIPTION = "Basic image without X support suitable for Linux Standard Base \
+(LSB) implementations. It includes the full meta-toolchain, plus development \
+headers and libraries to form a standalone SDK."
 
 IMAGE_FEATURES += "apps-console-core tools-sdk dev-pkgs ssh-server-openssh"
 EXTRA_IMAGE_FEATURES = "tools-debug tools-profile tools-testapps debug-tweaks"
diff --git a/meta/recipes-extended/images/core-image-lsb.bb b/meta/recipes-extended/images/core-image-lsb.bb
index b0a3a4d..b370d49 100644
--- a/meta/recipes-extended/images/core-image-lsb.bb
+++ b/meta/recipes-extended/images/core-image-lsb.bb
@@ -1,4 +1,5 @@
-DESCRIPTION = "A core-image-basic image suitable for implementations that \
+DESCRIPTION = "A foundational basic image without support for X that can be \
+reasonably used for customization and is suitable for implementations that \
 conform to Linux Standard Base (LSB)."
 
 IMAGE_FEATURES += "apps-console-core ssh-server-openssh"
diff --git a/meta/recipes-qt/images/qt4e-demo-image.bb b/meta/recipes-qt/images/qt4e-demo-image.bb
index 2e50bf6..6c0dc70 100644
--- a/meta/recipes-qt/images/qt4e-demo-image.bb
+++ b/meta/recipes-qt/images/qt4e-demo-image.bb
@@ -1,3 +1,4 @@
+DESCRIPTION = "Version 1.0-r1 of the qtr3-demo-image."
 LICENSE = "MIT"
 PR="r1"
 
diff --git a/meta/recipes-rt/images/core-image-rt-sdk.bb b/meta/recipes-rt/images/core-image-rt-sdk.bb
index 6e98343..5a67eeb 100644
--- a/meta/recipes-rt/images/core-image-rt-sdk.bb
+++ b/meta/recipes-rt/images/core-image-rt-sdk.bb
@@ -2,7 +2,9 @@
 # Copyright (C) 2011 Intel Corporation.
 #
 
-DESCRIPTION = "Real-Time Linux Image with SDK support"
+DESCRIPTION = "Small image capable of booting a device with a test suite and \
+tools for real-time use. It includes the full meta-toolchain, development \
+headers and libraries to form a standalone SDK."
 DEPENDS = "linux-yocto-rt"
 
 require recipes-core/images/core-image-minimal.bb
diff --git a/meta/recipes-rt/images/core-image-rt.bb b/meta/recipes-rt/images/core-image-rt.bb
index e11f159..ef547a6 100644
--- a/meta/recipes-rt/images/core-image-rt.bb
+++ b/meta/recipes-rt/images/core-image-rt.bb
@@ -2,7 +2,8 @@
 # Copyright (C) 2010 Intel Corporation.
 #
 
-DESCRIPTION = "Real-Time Linux Image"
+DESCRIPTION = "A small image just capable of allowing a device to boot plus a \
+real-time test suite and tools appropriate for real-time use."
 DEPENDS = "linux-yocto-rt"
 
 require recipes-core/images/core-image-minimal.bb
diff --git a/meta/recipes-sato/images/core-image-sato-dev.bb b/meta/recipes-sato/images/core-image-sato-dev.bb
index b30447c..bd31727 100644
--- a/meta/recipes-sato/images/core-image-sato-dev.bb
+++ b/meta/recipes-sato/images/core-image-sato-dev.bb
@@ -1,9 +1,9 @@
 #
 # Copyright (C) 2007 OpenedHand Ltd.
 #
-DESCRIPTION = "A core-image-sato image suitable for development that also \
-includes a native toolchain and libraries needed to build applications on the \
-device itself."
+DESCRIPTION = "Image with Sato for development work. It includes everything \
+within core-image-sato plus a native toolchain, application development and \
+testing libraries, profiling and debug symbols."
 
 IMAGE_FEATURES += "apps-console-core ${SATO_IMAGE_FEATURES} dev-pkgs"
 
diff --git a/meta/recipes-sato/images/core-image-sato-sdk.bb b/meta/recipes-sato/images/core-image-sato-sdk.bb
index 2cf8cad..6dfd470 100644
--- a/meta/recipes-sato/images/core-image-sato-sdk.bb
+++ b/meta/recipes-sato/images/core-image-sato-sdk.bb
@@ -1,9 +1,9 @@
 #
 # Copyright (C) 2007 OpenedHand Ltd.
 #
-DESCRIPTION = "A core-image-sato image that includes everything in \
-meta-toolchain. The image also includes development headers and libraries \
-to form a complete standalone SDK."
+DESCRIPTION = "Image with Sato support that includes everything within \
+core-image-sato plus meta-toolchain, development headers and libraries to \
+form a standalone SD."
 
 IMAGE_FEATURES += "apps-console-core ${SATO_IMAGE_FEATURES} dev-pkgs tools-sdk qt4-pkgs"
 EXTRA_IMAGE_FEATURES += "tools-debug tools-profile tools-testapps debug-tweaks"
diff --git a/meta/recipes-sato/images/core-image-sato.bb b/meta/recipes-sato/images/core-image-sato.bb
index 11c3318..b6c51fb 100644
--- a/meta/recipes-sato/images/core-image-sato.bb
+++ b/meta/recipes-sato/images/core-image-sato.bb
@@ -1,8 +1,9 @@
 #
 # Copyright (C) 2007 OpenedHand Ltd.
 #
-DESCRIPTION = "An image with Sato support, a mobile environment and visual \
-style that works well with mobile devices."
+DESCRIPTION = "Image with Sato, a mobile environment and visual style for \
+mobile devices. The image supports X11 with a Sato theme, Pimlico \
+applications, and contains terminal, editor, and file manager."
 
 IMAGE_FEATURES += "apps-console-core ${SATO_IMAGE_FEATURES}"
 
-- 
1.7.1



