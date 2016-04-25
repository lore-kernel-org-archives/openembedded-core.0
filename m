Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C74F270100
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Apr 2016 13:51:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u3PDplfl005838
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Apr 2016 06:51:47 -0700
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 25 Apr 2016 06:51:46 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 25 Apr 2016 06:51:41 -0700
Message-ID: <403dc96ad9e2bec4ebc8f14c15b49c114a23a64d.1461592183.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1461592183.git.liezhi.yang@windriver.com>
References: <cover.1461592183.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/6] packagegroup-foo.bb: remove LICENSE = "MIT"
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
X-List-Received-Date: Mon, 25 Apr 2016 13:51:47 -0000
Content-Type: text/plain

It has been set in packagegroup.bbclass.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-core/packagegroups/packagegroup-base.bb                     | 1 -
 meta/recipes-core/packagegroups/packagegroup-core-boot.bb                | 1 -
 meta/recipes-core/packagegroups/packagegroup-core-buildessential.bb      | 1 -
 meta/recipes-core/packagegroups/packagegroup-core-eclipse-debug.bb       | 1 -
 meta/recipes-core/packagegroups/packagegroup-core-nfs.bb                 | 1 -
 meta/recipes-core/packagegroups/packagegroup-core-sdk.bb                 | 1 -
 meta/recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb        | 1 -
 meta/recipes-core/packagegroups/packagegroup-core-ssh-openssh.bb         | 1 -
 .../packagegroups/packagegroup-core-standalone-sdk-target.bb             | 1 -
 meta/recipes-core/packagegroups/packagegroup-core-tools-debug.bb         | 1 -
 meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb       | 1 -
 meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb      | 1 -
 meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb           | 1 -
 meta/recipes-core/packagegroups/packagegroup-self-hosted.bb              | 1 -
 meta/recipes-devtools/packagegroups/packagegroup-core-device-devel.bb    | 1 -
 meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb    | 1 -
 meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb             | 1 -
 meta/recipes-graphics/packagegroups/packagegroup-core-clutter.bb         | 1 -
 meta/recipes-graphics/packagegroups/packagegroup-core-directfb.bb        | 1 -
 meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb        | 1 -
 meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb     | 1 -
 meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb             | 1 -
 meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb            | 1 -
 23 files changed, 23 deletions(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/recipes-core/packagegroups/packagegroup-base.bb
index 9e40b28..2e94fde 100644
--- a/meta/recipes-core/packagegroups/packagegroup-base.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
@@ -1,5 +1,4 @@
 SUMMARY = "Merge machine and distro options to create a basic machine task/package"
-LICENSE = "MIT"
 PR = "r83"
 
 #
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
index bac93b8..04bc0f2 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
@@ -4,7 +4,6 @@
 
 SUMMARY = "Minimal boot requirements"
 DESCRIPTION = "The minimal set of packages required to boot the system"
-LICENSE = "MIT"
 PR = "r17"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-buildessential.bb b/meta/recipes-core/packagegroups/packagegroup-core-buildessential.bb
index 74ed247..78cc65d 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-buildessential.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-buildessential.bb
@@ -4,7 +4,6 @@
 #
 
 SUMMARY = "Essential build dependencies"
-LICENSE = "MIT"
 
 inherit packagegroup
 
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-eclipse-debug.bb b/meta/recipes-core/packagegroups/packagegroup-core-eclipse-debug.bb
index e7b013d..c45463f 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-eclipse-debug.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-eclipse-debug.bb
@@ -1,5 +1,4 @@
 SUMMARY = "Remote debugging tools for Eclipse integration"
-LICENSE = "MIT"
 
 inherit packagegroup
 
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-nfs.bb b/meta/recipes-core/packagegroups/packagegroup-core-nfs.bb
index 1882d3a..b345e31 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-nfs.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-nfs.bb
@@ -3,7 +3,6 @@
 #
 
 SUMMARY = "NFS package groups"
-LICENSE = "MIT"
 PR = "r2"
 
 inherit packagegroup
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
index bee1665..ea07e98 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
@@ -3,7 +3,6 @@
 #
 
 SUMMARY = "Software development tools"
-LICENSE = "MIT"
 PR = "r9"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb b/meta/recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb
index e99946f..5ec3f6c 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb
@@ -1,5 +1,4 @@
 SUMMARY = "Dropbear SSH client/server"
-LICENSE = "MIT"
 PR = "r1"
 
 inherit packagegroup
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-ssh-openssh.bb b/meta/recipes-core/packagegroups/packagegroup-core-ssh-openssh.bb
index 32d20e6..703f956 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-ssh-openssh.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-ssh-openssh.bb
@@ -1,5 +1,4 @@
 SUMMARY = "OpenSSH SSH client/server"
-LICENSE = "MIT"
 PR = "r1"
 
 inherit packagegroup
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb b/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
index 6997f39..274e11a 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
@@ -1,6 +1,5 @@
 SUMMARY = "Target packages for the standalone SDK"
 PR = "r8"
-LICENSE = "MIT"
 
 inherit packagegroup
 
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-debug.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-debug.bb
index 82347b9..9fc2b0e 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-debug.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-debug.bb
@@ -3,7 +3,6 @@
 #
 
 SUMMARY = "Debugging tools"
-LICENSE = "MIT"
 
 inherit packagegroup
 
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
index ff2b577..71b3651 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
@@ -3,7 +3,6 @@
 #
 
 SUMMARY = "Profiling tools"
-LICENSE = "MIT"
 
 PR = "r3"
 
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
index e8d585e..5938d7e 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
@@ -3,7 +3,6 @@
 #
 
 SUMMARY = "Testing tools/applications"
-LICENSE = "MIT"
 
 PR = "r2"
 
diff --git a/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb b/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
index 180dd96..d551147 100644
--- a/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
@@ -1,6 +1,5 @@
 SUMMARY = "Host SDK package for cross canadian toolchain"
 PN = "packagegroup-cross-canadian-${MACHINE}"
-LICENSE = "MIT"
 
 inherit cross-canadian packagegroup
 
diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index 225204d..aa88cf9 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -5,7 +5,6 @@
 SUMMARY = "Self-hosting"
 DESCRIPTION = "Packages required to run the build system"
 PR = "r13"
-LICENSE = "MIT"
 
 inherit packagegroup  distro_features_check
 # rdepends on libx11-dev
diff --git a/meta/recipes-devtools/packagegroups/packagegroup-core-device-devel.bb b/meta/recipes-devtools/packagegroups/packagegroup-core-device-devel.bb
index e831860..b037057 100644
--- a/meta/recipes-devtools/packagegroups/packagegroup-core-device-devel.bb
+++ b/meta/recipes-devtools/packagegroups/packagegroup-core-device-devel.bb
@@ -1,5 +1,4 @@
 SUMMARY = "Provides a small set of tools for development on the device"
-LICENSE = "MIT"
 
 PR = "r1"
 
diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb b/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
index 1d7e608..f33b43e 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
@@ -5,7 +5,6 @@
 SUMMARY = "Standard full-featured Linux system"
 DESCRIPTION = "Package group bringing in packages needed for a more traditional full-featured Linux system"
 PR = "r6"
-LICENSE = "MIT"
 
 inherit packagegroup
 
diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
index a29c3d7..2b6b7a5 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
@@ -5,7 +5,6 @@
 SUMMARY = "Linux Standard Base (LSB)"
 DESCRIPTION = "Packages required to satisfy the Linux Standard Base (LSB) specification"
 PR = "r10"
-LICENSE = "MIT"
 
 inherit packagegroup distro_features_check
 
diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-clutter.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-clutter.bb
index 5734b27..87c700e 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-clutter.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-clutter.bb
@@ -3,7 +3,6 @@
 #
 
 SUMMARY = "Clutter package groups"
-LICENSE = "MIT"
 
 PR = "r6"
 
diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-directfb.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-directfb.bb
index a657a1a..5ead60d 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-directfb.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-directfb.bb
@@ -1,5 +1,4 @@
 SUMMARY = "DirectFB without X11"
-LICENSE = "MIT"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb
index 17301a0..db3dfe3 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb
@@ -1,6 +1,5 @@
 SUMMARY = "Basic X11 session"
 DESCRIPTION = "Packages required to set up a basic working X11 session"
-LICENSE = "MIT"
 PR = "r1"
 
 inherit packagegroup distro_features_check
diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb
index c53f1b7..6b50028 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb
@@ -3,7 +3,6 @@
 #
 
 SUMMARY = "X11 display server"
-LICENSE = "MIT"
 PR = "r40"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
index 3537d8c..4291424 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
@@ -2,7 +2,6 @@
 # Copyright (C) 2011 Intel Corporation
 #
 
-LICENSE = "MIT"
 PR = "r40"
 
 inherit packagegroup distro_features_check
diff --git a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
index 8ba4923..913e8cd 100644
--- a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
+++ b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
@@ -3,7 +3,6 @@
 #
 
 SUMMARY = "Sato desktop"
-LICENSE = "MIT"
 PR = "r33"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
2.7.4


