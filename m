Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 720136AC43
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2015 09:15:53 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t2I9FrsU013310
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2015 02:15:54 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.236) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Wed, 18 Mar 2015 02:15:54 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 18 Mar 2015 17:16:12 +0800
Message-ID: <53581d89959ef4370e3f38ff49927d6de391b350.1426670089.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1426670089.git.Qi.Chen@windriver.com>
References: <cover.1426670089.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/5] packagegroup: add LIC_FILES_CHKSUM
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
X-List-Received-Date: Wed, 18 Mar 2015 09:15:53 -0000
Content-Type: text/plain

We treat a license without checksum specified as invalid. In specific,
find_license_files in license.bbclass needs LIC_FILES_CHKSUM there.

This patch adds LIC_FILES_CHKSUM information to packagegroup recipes to
avoid warnings like below at rootfs time.

    WARNING: The license listed MIT was not in the licenses collected for packagegroup-core-boot

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
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
 meta/recipes-qt/packagegroups/packagegroup-core-qt.bb                    | 1 +
 meta/recipes-qt/packagegroups/packagegroup-core-qt4e.bb                  | 1 +
 meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.inc       | 1 +
 meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb            | 1 +
 26 files changed, 26 insertions(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/recipes-core/packagegroups/packagegroup-base.bb
index 369b63e..41559db 100644
--- a/meta/recipes-core/packagegroups/packagegroup-base.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
@@ -1,5 +1,6 @@
 SUMMARY = "Merge machine and distro options to create a basic machine task/package"
 LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 PR = "r83"
 
 #
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
index 09f5373..fa9c82d 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
@@ -5,6 +5,7 @@
 SUMMARY = "Minimal boot requirements"
 DESCRIPTION = "The minimal set of packages required to boot the system"
 LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 PR = "r17"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-buildessential.bb b/meta/recipes-core/packagegroups/packagegroup-core-buildessential.bb
index 74ed247..c33782e 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-buildessential.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-buildessential.bb
@@ -5,6 +5,7 @@
 
 SUMMARY = "Essential build dependencies"
 LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 inherit packagegroup
 
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-eclipse-debug.bb b/meta/recipes-core/packagegroups/packagegroup-core-eclipse-debug.bb
index e7b013d..713b1b5 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-eclipse-debug.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-eclipse-debug.bb
@@ -1,5 +1,6 @@
 SUMMARY = "Remote debugging tools for Eclipse integration"
 LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 inherit packagegroup
 
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-nfs.bb b/meta/recipes-core/packagegroups/packagegroup-core-nfs.bb
index 247a30e..75813aa 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-nfs.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-nfs.bb
@@ -4,6 +4,7 @@
 
 SUMMARY = "NFS package groups"
 LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 PR = "r2"
 
 inherit packagegroup
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
index a41eada..2fd6789 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
@@ -4,6 +4,7 @@
 
 SUMMARY = "Software development tools"
 LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 PR = "r9"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb b/meta/recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb
index e99946f..3d4f4a9 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb
@@ -1,5 +1,6 @@
 SUMMARY = "Dropbear SSH client/server"
 LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 PR = "r1"
 
 inherit packagegroup
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-ssh-openssh.bb b/meta/recipes-core/packagegroups/packagegroup-core-ssh-openssh.bb
index 32d20e6..d35f04c 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-ssh-openssh.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-ssh-openssh.bb
@@ -1,5 +1,6 @@
 SUMMARY = "OpenSSH SSH client/server"
 LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 PR = "r1"
 
 inherit packagegroup
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb b/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
index 154a55c..1ae8b95 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
@@ -1,6 +1,7 @@
 SUMMARY = "Target packages for the standalone SDK"
 PR = "r8"
 LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 inherit packagegroup
 
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-debug.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-debug.bb
index 82347b9..bdd94c6 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-debug.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-debug.bb
@@ -4,6 +4,7 @@
 
 SUMMARY = "Debugging tools"
 LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 inherit packagegroup
 
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
index 6f4842f..92adba7 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
@@ -4,6 +4,7 @@
 
 SUMMARY = "Profiling tools"
 LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 PR = "r3"
 
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
index 4177c45..92954c6 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
@@ -4,6 +4,7 @@
 
 SUMMARY = "Testing tools/applications"
 LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 PR = "r2"
 
diff --git a/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb b/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
index e3b1c18..7646399 100644
--- a/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
@@ -1,6 +1,7 @@
 SUMMARY = "Host SDK package for cross canadian toolchain"
 PN = "packagegroup-cross-canadian-${MACHINE}"
 LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 # Save TRANSLATED_TARGET_ARCH before allarch tramples it
 TRANSLATED_TARGET_ARCH = "${@d.getVar('TUNE_ARCH', True).replace('_', '-')}"
diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index 47589b6..e855fb9 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -6,6 +6,7 @@ SUMMARY = "Self-hosting"
 DESCRIPTION = "Packages required to run the build system"
 PR = "r13"
 LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 inherit packagegroup  distro_features_check
 # rdepends on libx11-dev
diff --git a/meta/recipes-devtools/packagegroups/packagegroup-core-device-devel.bb b/meta/recipes-devtools/packagegroups/packagegroup-core-device-devel.bb
index e831860..02dcf98 100644
--- a/meta/recipes-devtools/packagegroups/packagegroup-core-device-devel.bb
+++ b/meta/recipes-devtools/packagegroups/packagegroup-core-device-devel.bb
@@ -1,5 +1,6 @@
 SUMMARY = "Provides a small set of tools for development on the device"
 LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 PR = "r1"
 
diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb b/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
index ad3f240..caa8aec 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
@@ -6,6 +6,7 @@ SUMMARY = "Standard full-featured Linux system"
 DESCRIPTION = "Package group bringing in packages needed for a more traditional full-featured Linux system"
 PR = "r6"
 LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 inherit packagegroup
 
diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
index e0f32e0..509131a 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
@@ -6,6 +6,7 @@ SUMMARY = "Linux Standard Base (LSB)"
 DESCRIPTION = "Packages required to satisfy the Linux Standard Base (LSB) specification"
 PR = "r10"
 LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 inherit packagegroup
 
diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-clutter.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-clutter.bb
index 7540821..5c6a799 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-clutter.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-clutter.bb
@@ -4,6 +4,7 @@
 
 SUMMARY = "Clutter package groups"
 LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 PR = "r6"
 
diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-directfb.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-directfb.bb
index 53dc0ae..0107ac8 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-directfb.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-directfb.bb
@@ -1,5 +1,6 @@
 SUMMARY = "DirectFB without X11"
 LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb
index 17301a0..b77c8916 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb
@@ -1,6 +1,7 @@
 SUMMARY = "Basic X11 session"
 DESCRIPTION = "Packages required to set up a basic working X11 session"
 LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 PR = "r1"
 
 inherit packagegroup distro_features_check
diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb
index c53f1b7..89d2392 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb
@@ -4,6 +4,7 @@
 
 SUMMARY = "X11 display server"
 LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 PR = "r40"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
index 3537d8c..a7594a3 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
@@ -3,6 +3,7 @@
 #
 
 LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 PR = "r40"
 
 inherit packagegroup distro_features_check
diff --git a/meta/recipes-qt/packagegroups/packagegroup-core-qt.bb b/meta/recipes-qt/packagegroups/packagegroup-core-qt.bb
index 5f6916a..c5a5bf4 100644
--- a/meta/recipes-qt/packagegroups/packagegroup-core-qt.bb
+++ b/meta/recipes-qt/packagegroups/packagegroup-core-qt.bb
@@ -4,6 +4,7 @@
 
 SUMMARY = "Qt package groups"
 LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 PR = "r4"
 
 # Qt4 could NOT be built on MIPS64 with 64 bits userspace
diff --git a/meta/recipes-qt/packagegroups/packagegroup-core-qt4e.bb b/meta/recipes-qt/packagegroups/packagegroup-core-qt4e.bb
index d4f0fd1..e2a1615 100644
--- a/meta/recipes-qt/packagegroups/packagegroup-core-qt4e.bb
+++ b/meta/recipes-qt/packagegroups/packagegroup-core-qt4e.bb
@@ -1,6 +1,7 @@
 SUMMARY = "Qt for Embedded Linux (Qt without X11)"
 PR = "r2"
 LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 # Qt4 could NOT be built on MIPS64 with 64 bits userspace
 COMPATIBLE_HOST_mips64 = "null"
diff --git a/meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.inc b/meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.inc
index 02a0326..19f5a54 100644
--- a/meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.inc
+++ b/meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.inc
@@ -1,4 +1,5 @@
 LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 # Qt4 could NOT be built on MIPS64 with 64 bits userspace
 COMPATIBLE_HOST_mips64 = "null"
diff --git a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
index 2d046c4..261608d 100644
--- a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
+++ b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
@@ -4,6 +4,7 @@
 
 SUMMARY = "Sato desktop"
 LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 PR = "r33"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
1.9.1


