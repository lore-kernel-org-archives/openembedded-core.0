Return-Path: <mike.looijmans@topic.nl>
Received: from smtp10.online.nl (smtp10.online.nl [194.134.42.55])
	by mail.openembedded.org (Postfix) with ESMTP id 3A2D360199
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Apr 2014 12:39:43 +0000 (UTC)
Received: from smtp10.online.nl (localhost [127.0.0.1])
	by smtp10.online.nl (Postfix) with ESMTP id AFE6C40695;
	Sun, 20 Apr 2014 14:39:42 +0200 (CEST)
Received: from phenom.local (s55969068.adsl.online.nl [85.150.144.104])
	by smtp10.online.nl (Postfix) with ESMTP;
	Sun, 20 Apr 2014 14:39:42 +0200 (CEST)
From: mike.looijmans@topic.nl
To: openembedded-core@lists.openembedded.org
Date: Sun, 20 Apr 2014 14:39:38 +0200
Message-Id: <1397997578-3623-1-git-send-email-mike.looijmans@topic.nl>
X-Mailer: git-send-email 1.7.9.5
X-Online-Scanned: by Cloudmark authority (on smtp10.online.nl)
Cc: Mike Looijmans <milo-software@users.sourceforge.net>
Subject: [PATCH] PR bumps to remove PRINC use in meta-openpli
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
X-List-Received-Date: Sun, 20 Apr 2014 12:39:45 -0000

From: Mike Looijmans <milo-software@users.sourceforge.net>

Resolves warnings of this kind in the OpenPLi layer:
 WARNING: Use of PRINC * was detected in the recipe *
---
 meta/recipes-bsp/alsa-state/alsa-state.bb          |    2 +-
 meta/recipes-connectivity/bluez/bluez4_4.101.bb    |    2 +-
 .../nfs-utils/nfs-utils_1.2.9.bb                   |    1 +
 meta/recipes-connectivity/ofono/ofono_1.14.bb      |    2 ++
 meta/recipes-core/base-files/base-files_3.0.14.bb  |    2 +-
 meta/recipes-core/busybox/busybox_1.22.1.bb        |    2 ++
 meta/recipes-core/initscripts/initscripts_1.0.bb   |    2 +-
 meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb     |    2 +-
 meta/recipes-core/udev/udev_182.bb                 |    2 +-
 meta/recipes-core/util-linux/util-linux_2.24.1.bb  |    1 +
 10 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-bsp/alsa-state/alsa-state.bb b/meta/recipes-bsp/alsa-state/alsa-state.bb
index 5ab1b13..874d6bb 100644
--- a/meta/recipes-bsp/alsa-state/alsa-state.bb
+++ b/meta/recipes-bsp/alsa-state/alsa-state.bb
@@ -10,7 +10,7 @@ sound state at system boot and save it at system shut down."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 PV = "0.2.0"
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "\
   file://asound.conf \
diff --git a/meta/recipes-connectivity/bluez/bluez4_4.101.bb b/meta/recipes-connectivity/bluez/bluez4_4.101.bb
index ccd230d..28a94ed 100644
--- a/meta/recipes-connectivity/bluez/bluez4_4.101.bb
+++ b/meta/recipes-connectivity/bluez/bluez4_4.101.bb
@@ -1,6 +1,6 @@
 require bluez4.inc
 
-PR = "r10"
+PR = "r11"
 
 SRC_URI += "file://bluetooth.conf \
             file://sbc_mmx.patch \
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.9.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.9.bb
index da37160..4f287f4 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.9.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.9.bb
@@ -3,6 +3,7 @@ DESCRIPTION = "The nfs-utils package provides a daemon for the kernel \
 NFS server and related tools."
 HOMEPAGE = "http://nfs.sourceforge.net/"
 SECTION = "console/network"
+PR = "r1"
 
 LICENSE = "MIT & GPLv2+ & BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=95f3a93a5c3c7888de623b46ea085a84"
diff --git a/meta/recipes-connectivity/ofono/ofono_1.14.bb b/meta/recipes-connectivity/ofono/ofono_1.14.bb
index f107fe6..dea5d88 100644
--- a/meta/recipes-connectivity/ofono/ofono_1.14.bb
+++ b/meta/recipes-connectivity/ofono/ofono_1.14.bb
@@ -1,5 +1,7 @@
 require ofono.inc
 
+PR = "r1"
+
 SRC_URI  = "\
   ${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
   file://ofono \
diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index 9699e31..6d76a2b 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Miscellaneous files for the base system"
 DESCRIPTION = "The base-files package creates the basic system directory structure and provides a small set of key configuration files for the system."
 SECTION = "base"
-PR = "r86"
+PR = "r89"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://licenses/GPL-2;md5=94d55d512a9ba36caa9b7df079bae19f"
 # Removed all license related tasks in this recipe as license.bbclass 
diff --git a/meta/recipes-core/busybox/busybox_1.22.1.bb b/meta/recipes-core/busybox/busybox_1.22.1.bb
index 782752c..46641e1 100644
--- a/meta/recipes-core/busybox/busybox_1.22.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.22.1.bb
@@ -1,5 +1,7 @@
 require busybox.inc
 
+PR = "r32"
+
 SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://get_header_tar.patch \
            file://busybox-appletlib-dependency.patch \
diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index 62d0eae..e8a5b78 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Initscripts provide the basic system startup initialization scrip
 SECTION = "base"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-PR = "r154"
+PR = "r153"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
diff --git a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
index c06eac4..34e0a54 100644
--- a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
@@ -5,7 +5,7 @@ SECTION = "base"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
                     file://COPYRIGHT;endline=15;md5=349c872e0066155e1818b786938876a4"
-PR = "r11"
+PR = "r13"
 
 RDEPENDS_${PN} = "${PN}-inittab"
 
diff --git a/meta/recipes-core/udev/udev_182.bb b/meta/recipes-core/udev/udev_182.bb
index d66292e..a90c289 100644
--- a/meta/recipes-core/udev/udev_182.bb
+++ b/meta/recipes-core/udev/udev_182.bb
@@ -1,6 +1,6 @@
 include udev.inc
 
-PR = "r7"
+PR = "r8"
 
 # module-init-tools from kmod_git will provide libkmod runtime
 DEPENDS += "module-init-tools"
diff --git a/meta/recipes-core/util-linux/util-linux_2.24.1.bb b/meta/recipes-core/util-linux/util-linux_2.24.1.bb
index 8b6a1ce..3fc9875 100644
--- a/meta/recipes-core/util-linux/util-linux_2.24.1.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.24.1.bb
@@ -1,5 +1,6 @@
 MAJOR_VERSION = "2.24"
 require util-linux.inc
+PR = "r1"
 
 # To support older hosts, we need to patch and/or revert
 # some upstream changes.  Only do this for native packages.
-- 
1.7.9.5


