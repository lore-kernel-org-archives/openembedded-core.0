Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1182671F92
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Nov 2014 17:14:41 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 04 Nov 2014 09:12:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,313,1413270000"; d="scan'208";a="631275938"
Received: from alimon-thinkpad-w540.zpn.intel.com ([10.219.4.154])
	by orsmga002.jf.intel.com with ESMTP; 04 Nov 2014 09:14:34 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Nov 2014 11:14:59 -0600
Message-Id: <1415121300-16524-8-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1415121300-16524-1-git-send-email-anibal.limon@linux.intel.com>
References: <1415121300-16524-1-git-send-email-anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCHv2 7/8] packagegropups: Added LIC_FILES_CHKSUM with MIT license to avoid warning when create license manifest.
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
X-List-Received-Date: Tue, 04 Nov 2014 17:14:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb       | 1 +
 meta/recipes-core/packagegroups/packagegroup-base.bb                     | 1 +
 meta/recipes-core/packagegroups/packagegroup-core-boot.bb                | 1 +
 meta/recipes-core/packagegroups/packagegroup-core-buildessential.bb      | 1 +
 meta/recipes-core/packagegroups/packagegroup-core-eclipse-debug.bb       | 1 +
 meta/recipes-core/packagegroups/packagegroup-core-nfs.bb                 | 1 +
 meta/recipes-core/packagegroups/packagegroup-core-sdk.bb                 | 1 +
 meta/recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb        | 1 +
 meta/recipes-core/packagegroups/packagegroup-core-ssh-openssh.bb         | 1 +
 .../packagegroups/packagegroup-core-standalone-sdk-target.bb             | 1 +
 meta/recipes-core/packagegroups/packagegroup-core-tools-debug.bb         | 1 +
 meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb       | 1 +
 meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb      | 1 +
 meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb           | 1 +
 meta/recipes-core/packagegroups/packagegroup-self-hosted.bb              | 1 +
 meta/recipes-devtools/packagegroups/packagegroup-core-device-devel.bb    | 1 +
 meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb    | 1 +
 meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb             | 1 +
 meta/recipes-graphics/packagegroups/packagegroup-core-clutter.bb         | 1 +
 meta/recipes-graphics/packagegroups/packagegroup-core-directfb.bb        | 1 +
 meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb        | 1 +
 meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb     | 1 +
 meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb             | 1 +
 .../packagegroups/nativesdk-packagegroup-qt-toolchain-host.inc           | 1 +
 meta/recipes-qt/packagegroups/packagegroup-core-qt.bb                    | 1 +
 meta/recipes-qt/packagegroups/packagegroup-core-qt4e.bb                  | 1 +
 meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.inc       | 1 +
 meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb            | 1 +
 28 files changed, 28 insertions(+)

diff --git a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
index 0c6a530..4e7153d 100644
--- a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
+++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
@@ -5,6 +5,7 @@
 SUMMARY = "Host packages for the standalone SDK or external toolchain"
 PR = "r12"
 LICENSE = "MIT"
+LIC_FILES_CHKSUM ?= "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
 inherit packagegroup nativesdk
 
diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/recipes-core/packagegroups/packagegroup-base.bb
index f4b2cd5..455d1b7 100644
--- a/meta/recipes-core/packagegroups/packagegroup-base.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
@@ -1,5 +1,6 @@
 SUMMARY = "Merge machine and distro options to create a basic machine task/package"
 LICENSE = "MIT"
+LIC_FILES_CHKSUM ?= "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 PR = "r83"
 
 #
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
index 09f5373..8ce4b53 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
@@ -5,6 +5,7 @@
 SUMMARY = "Minimal boot requirements"
 DESCRIPTION = "The minimal set of packages required to boot the system"
 LICENSE = "MIT"
+LIC_FILES_CHKSUM ?= "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 PR = "r17"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-buildessential.bb b/meta/recipes-core/packagegroups/packagegroup-core-buildessential.bb
index 74ed247..e97522c 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-buildessential.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-buildessential.bb
@@ -5,6 +5,7 @@
 
 SUMMARY = "Essential build dependencies"
 LICENSE = "MIT"
+LIC_FILES_CHKSUM ?= "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
 inherit packagegroup
 
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-eclipse-debug.bb b/meta/recipes-core/packagegroups/packagegroup-core-eclipse-debug.bb
index e7b013d..e67c131 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-eclipse-debug.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-eclipse-debug.bb
@@ -1,5 +1,6 @@
 SUMMARY = "Remote debugging tools for Eclipse integration"
 LICENSE = "MIT"
+LIC_FILES_CHKSUM ?= "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
 inherit packagegroup
 
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-nfs.bb b/meta/recipes-core/packagegroups/packagegroup-core-nfs.bb
index 247a30e..1d3fb96 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-nfs.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-nfs.bb
@@ -4,6 +4,7 @@
 
 SUMMARY = "NFS package groups"
 LICENSE = "MIT"
+LIC_FILES_CHKSUM ?= "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 PR = "r2"
 
 inherit packagegroup
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
index a544bbd..a674a31 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
@@ -4,6 +4,7 @@
 
 SUMMARY = "Software development tools"
 LICENSE = "MIT"
+LIC_FILES_CHKSUM ?= "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 PR = "r9"
 
 inherit packagegroup
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb b/meta/recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb
index e99946f..8b82f80 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb
@@ -1,5 +1,6 @@
 SUMMARY = "Dropbear SSH client/server"
 LICENSE = "MIT"
+LIC_FILES_CHKSUM ?= "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 PR = "r1"
 
 inherit packagegroup
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-ssh-openssh.bb b/meta/recipes-core/packagegroups/packagegroup-core-ssh-openssh.bb
index 32d20e6..0dba895 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-ssh-openssh.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-ssh-openssh.bb
@@ -1,5 +1,6 @@
 SUMMARY = "OpenSSH SSH client/server"
 LICENSE = "MIT"
+LIC_FILES_CHKSUM ?= "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 PR = "r1"
 
 inherit packagegroup
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb b/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
index 154a55c..c84f4f4 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
@@ -1,6 +1,7 @@
 SUMMARY = "Target packages for the standalone SDK"
 PR = "r8"
 LICENSE = "MIT"
+LIC_FILES_CHKSUM ?= "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
 inherit packagegroup
 
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-debug.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-debug.bb
index 82347b9..f2783cf 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-debug.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-debug.bb
@@ -4,6 +4,7 @@
 
 SUMMARY = "Debugging tools"
 LICENSE = "MIT"
+LIC_FILES_CHKSUM ?= "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
 inherit packagegroup
 
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
index 41d2548..155acf7 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
@@ -4,6 +4,7 @@
 
 SUMMARY = "Profiling tools"
 LICENSE = "MIT"
+LIC_FILES_CHKSUM ?= "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
 PR = "r3"
 
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
index 33a3eee..2c7254c 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
@@ -4,6 +4,7 @@
 
 SUMMARY = "Testing tools/applications"
 LICENSE = "MIT"
+LIC_FILES_CHKSUM ?= "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
 PR = "r2"
 
diff --git a/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb b/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
index e3b1c18..c4b474e 100644
--- a/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
@@ -1,6 +1,7 @@
 SUMMARY = "Host SDK package for cross canadian toolchain"
 PN = "packagegroup-cross-canadian-${MACHINE}"
 LICENSE = "MIT"
+LIC_FILES_CHKSUM ?= "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
 # Save TRANSLATED_TARGET_ARCH before allarch tramples it
 TRANSLATED_TARGET_ARCH = "${@d.getVar('TUNE_ARCH', True).replace('_', '-')}"
diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index 65aca7f..1fd9a17 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -6,6 +6,7 @@ SUMMARY = "Self-hosting"
 DESCRIPTION = "Packages required to run the build system"
 PR = "r13"
 LICENSE = "MIT"
+LIC_FILES_CHKSUM ?= "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
 inherit packagegroup
 
diff --git a/meta/recipes-devtools/packagegroups/packagegroup-core-device-devel.bb b/meta/recipes-devtools/packagegroups/packagegroup-core-device-devel.bb
index e831860..c570be4 100644
--- a/meta/recipes-devtools/packagegroups/packagegroup-core-device-devel.bb
+++ b/meta/recipes-devtools/packagegroups/packagegroup-core-device-devel.bb
@@ -1,5 +1,6 @@
 SUMMARY = "Provides a small set of tools for development on the device"
 LICENSE = "MIT"
+LIC_FILES_CHKSUM ?= "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
 PR = "r1"
 
diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb b/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
index ad3f240..2f4e2a9 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
@@ -6,6 +6,7 @@ SUMMARY = "Standard full-featured Linux system"
 DESCRIPTION = "Package group bringing in packages needed for a more traditional full-featured Linux system"
 PR = "r6"
 LICENSE = "MIT"
+LIC_FILES_CHKSUM ?= "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
 inherit packagegroup
 
diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
index dd96fbe..d9572cd 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
@@ -6,6 +6,7 @@ SUMMARY = "Linux Standard Base (LSB)"
 DESCRIPTION = "Packages required to satisfy the Linux Standard Base (LSB) specification"
 PR = "r10"
 LICENSE = "MIT"
+LIC_FILES_CHKSUM ?= "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
 inherit packagegroup
 
diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-clutter.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-clutter.bb
index 7540821..b44447a 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-clutter.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-clutter.bb
@@ -4,6 +4,7 @@
 
 SUMMARY = "Clutter package groups"
 LICENSE = "MIT"
+LIC_FILES_CHKSUM ?= "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
 PR = "r6"
 
diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-directfb.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-directfb.bb
index 53dc0ae..b2a5946 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-directfb.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-directfb.bb
@@ -1,5 +1,6 @@
 SUMMARY = "DirectFB without X11"
 LICENSE = "MIT"
+LIC_FILES_CHKSUM ?= "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb
index 2eff371..ddee3d9 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb
@@ -1,6 +1,7 @@
 SUMMARY = "Basic X11 session"
 DESCRIPTION = "Packages required to set up a basic working X11 session"
 LICENSE = "MIT"
+LIC_FILES_CHKSUM ?= "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 PR = "r1"
 
 inherit packagegroup
diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb
index 2d68e97..21aee34 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb
@@ -4,6 +4,7 @@
 
 SUMMARY = "X11 display server"
 LICENSE = "MIT"
+LIC_FILES_CHKSUM ?= "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 PR = "r40"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
index fde5144..0200c5e 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
@@ -3,6 +3,7 @@
 #
 
 LICENSE = "MIT"
+LIC_FILES_CHKSUM ?= "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 PR = "r40"
 
 inherit packagegroup
diff --git a/meta/recipes-qt/packagegroups/nativesdk-packagegroup-qt-toolchain-host.inc b/meta/recipes-qt/packagegroups/nativesdk-packagegroup-qt-toolchain-host.inc
index a3c275f..787a98d 100644
--- a/meta/recipes-qt/packagegroups/nativesdk-packagegroup-qt-toolchain-host.inc
+++ b/meta/recipes-qt/packagegroups/nativesdk-packagegroup-qt-toolchain-host.inc
@@ -2,5 +2,6 @@ require recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
 
 DESCRIPTION = "Host packages for Qt Embedded SDK"
 LICENSE = "MIT"
+LIC_FILES_CHKSUM ?= "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
 RDEPENDS_${PN} += "nativesdk-qt4-tools"
diff --git a/meta/recipes-qt/packagegroups/packagegroup-core-qt.bb b/meta/recipes-qt/packagegroups/packagegroup-core-qt.bb
index d28e032..b1b4e7e 100644
--- a/meta/recipes-qt/packagegroups/packagegroup-core-qt.bb
+++ b/meta/recipes-qt/packagegroups/packagegroup-core-qt.bb
@@ -4,6 +4,7 @@
 
 SUMMARY = "Qt package groups"
 LICENSE = "MIT"
+LIC_FILES_CHKSUM ?= "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 PR = "r4"
 
 # Qt4 could NOT be built on MIPS64 with 64 bits userspace
diff --git a/meta/recipes-qt/packagegroups/packagegroup-core-qt4e.bb b/meta/recipes-qt/packagegroups/packagegroup-core-qt4e.bb
index d7a457c..e6cd9ed 100644
--- a/meta/recipes-qt/packagegroups/packagegroup-core-qt4e.bb
+++ b/meta/recipes-qt/packagegroups/packagegroup-core-qt4e.bb
@@ -1,6 +1,7 @@
 SUMMARY = "Qt for Embedded Linux (Qt without X11)"
 PR = "r2"
 LICENSE = "MIT"
+LIC_FILES_CHKSUM ?= "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
 # Qt4 could NOT be built on MIPS64 with 64 bits userspace
 COMPATIBLE_HOST_mips64 = "mips64.*-linux-gnun32"
diff --git a/meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.inc b/meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.inc
index fc1ccba..ee0c4b6 100644
--- a/meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.inc
+++ b/meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.inc
@@ -1,4 +1,5 @@
 LICENSE = "MIT"
+LIC_FILES_CHKSUM ?= "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
 # Qt4 could NOT be built on MIPS64 with 64 bits userspace
 COMPATIBLE_HOST_mips64 = "mips64.*-linux-gnun32"
diff --git a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
index bc3e0fd..da8d5e0 100644
--- a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
+++ b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
@@ -4,6 +4,7 @@
 
 SUMMARY = "Sato desktop"
 LICENSE = "MIT"
+LIC_FILES_CHKSUM ?= "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 PR = "r33"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
1.9.1


