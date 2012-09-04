Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T8wPr-0005u4-FY
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Sep 2012 18:55:56 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 04 Sep 2012 09:43:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,367,1344236400"; d="scan'208";a="141382028"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.161])
	by AZSMGA002.ch.intel.com with ESMTP; 04 Sep 2012 09:43:31 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Sep 2012 17:43:26 +0100
Message-Id: <a1f2ebcbbf01b5c2f7aa3251f4167bc18f8f5e11.1346776916.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1346776916.git.paul.eggleton@linux.intel.com>
References: <cover.1346776916.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1346776916.git.paul.eggleton@linux.intel.com>
References: <cover.1346776916.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] packagegroup-*: add RREPLACES/RCONFLICTS
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
X-List-Received-Date: Tue, 04 Sep 2012 16:55:56 -0000

These are needed to support upgrading from task-* to packagegroup-*
within existing target images at runtime.

Note: these settings will very likely be moved out to a separate inc
file at some point in the future.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../packagegroups/packagegroup-core-boot.bb        |    4 +++-
 .../packagegroups/packagegroup-core-nfs.bb         |    4 +++-
 .../packagegroups/packagegroup-core-sdk.bb         |    4 +++-
 .../packagegroup-core-ssh-dropbear.bb              |    4 +++-
 .../packagegroups/packagegroup-core-ssh-openssh.bb |    4 +++-
 .../packagegroup-core-standalone-sdk-target.bb     |    6 +++++-
 .../packagegroups/packagegroup-core-tools-debug.bb |    4 +++-
 .../packagegroup-core-tools-profile.bb             |    4 ++++
 .../packagegroup-core-tools-testapps.bb            |    4 ++++
 .../packagegroup-core-device-devel.bb              |    3 +++
 .../packagegroups/packagegroup-core-sdk-gmae.bb    |    4 +++-
 ...packagegroup-core-standalone-gmae-sdk-target.bb |    4 +++-
 .../packagegroups/packagegroup-core-clutter.bb     |    4 +++-
 .../packagegroup-core-gtk-directfb.bb              |    4 +++-
 .../packagegroups/packagegroup-core-x11-base.bb    |    4 +++-
 .../packagegroups/packagegroup-core-qt.bb          |    4 +++-
 .../packagegroups/packagegroup-core-qt4e.bb        |    4 +++-
 .../packagegroups/packagegroup-core-x11-sato.bb    |    4 +++-
 18 files changed, 58 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
index d29dc2b..16ad4e3 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
@@ -6,7 +6,7 @@ SUMMARY = "Minimal boot requirements"
 DESCRIPTION = "The minimal set of packages required to boot the system"
 LICENSE = "MIT"
 DEPENDS = "virtual/kernel"
-PR = "r9"
+PR = "r10"
 
 inherit packagegroup
 
@@ -20,6 +20,8 @@ MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS ?= ""
 
 # For backwards compatibility after rename
 RPROVIDES_${PN} = "task-core-boot"
+RREPLACES_${PN} = "task-core-boot"
+RCONFLICTS_${PN} = "task-core-boot"
 
 # Distro can override the following VIRTUAL-RUNTIME providers:
 VIRTUAL-RUNTIME_dev_manager ?= "udev"
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-nfs.bb b/meta/recipes-core/packagegroups/packagegroup-core-nfs.bb
index 03f9c12..531eceb 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-nfs.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-nfs.bb
@@ -4,7 +4,7 @@
 
 DESCRIPTION = "NFS package groups"
 LICENSE = "MIT"
-PR = "r1"
+PR = "r2"
 
 inherit packagegroup
 
@@ -12,6 +12,8 @@ PACKAGES = "${PN}-server"
 
 # For backwards compatibility after rename
 RPROVIDES_${PN}-server = "task-core-nfs-server"
+RREPLACES_${PN}-server = "task-core-nfs-server"
+RCONFLICTS_${PN}-server = "task-core-nfs-server"
 
 SUMMARY_${PN}-server = "NFS server"
 RDEPENDS_${PN}-server = "\
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
index f05e099..b00bf07 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
@@ -4,7 +4,7 @@
 
 SUMMARY = "Software development tools"
 LICENSE = "MIT"
-PR = "r8"
+PR = "r9"
 
 inherit packagegroup
 
@@ -12,6 +12,8 @@ inherit packagegroup
 
 # For backwards compatibility after rename
 RPROVIDES_packagegroup-core-sdk = "task-core-sdk"
+RREPLACES_packagegroup-core-sdk = "task-core-sdk"
+RCONFLICTS_packagegroup-core-sdk = "task-core-sdk"
 
 RDEPENDS_packagegroup-core-sdk = "\
     autoconf \
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb b/meta/recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb
index 7fa06e9..458d8fa 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb
@@ -1,10 +1,12 @@
 SUMMARY = "Dropbear SSH client/server"
 LICENSE = "MIT"
-PR = "r0"
+PR = "r1"
 
 inherit packagegroup
 
 # For backwards compatibility after rename
 RPROVIDES_${PN} = "task-core-ssh-dropbear"
+RREPLACES_${PN} = "task-core-ssh-dropbear"
+RCONFLICTS_${PN} = "task-core-ssh-dropbear"
 
 RDEPENDS_${PN} = "dropbear"
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-ssh-openssh.bb b/meta/recipes-core/packagegroups/packagegroup-core-ssh-openssh.bb
index 3221e8b..df70962 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-ssh-openssh.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-ssh-openssh.bb
@@ -1,10 +1,12 @@
 SUMMARY = "OpenSSH SSH client/server"
 LICENSE = "MIT"
-PR = "r0"
+PR = "r1"
 
 inherit packagegroup
 
 # For backwards compatibility after rename
 RPROVIDES_${PN} = "task-core-ssh-openssh"
+RREPLACES_${PN} = "task-core-ssh-openssh"
+RCONFLICTS_${PN} = "task-core-ssh-openssh"
 
 RDEPENDS_${PN} = "openssh"
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb b/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
index 6af2995..c8b5623 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
@@ -1,12 +1,16 @@
 DESCRIPTION = "Target packages for the standalone SDK"
-PR = "r7"
+PR = "r8"
 LICENSE = "MIT"
 
 inherit packagegroup
 
 # For backwards compatibility after rename
 RPROVIDES_${PN} = "task-core-standalone-sdk-target"
+RREPLACES_${PN} = "task-core-standalone-sdk-target"
+RCONFLICTS_${PN} = "task-core-standalone-sdk-target"
 RPROVIDES_${PN}-dbg = "task-core-standalone-sdk-target-dbg"
+RREPLACES_${PN}-dbg = "task-core-standalone-sdk-target-dbg"
+RCONFLICTS_${PN}-dbg = "task-core-standalone-sdk-target-dbg"
 
 RDEPENDS_${PN} = "\
     libgcc \
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-debug.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-debug.bb
index 6687b32..d49f224 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-debug.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-debug.bb
@@ -7,12 +7,14 @@ LICENSE = "MIT"
 
 inherit packagegroup
 
-PR = "r1"
+PR = "r2"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 # For backwards compatibility after rename
 RPROVIDES_${PN} = "task-core-tools-debug"
+RREPLACES_${PN} = "task-core-tools-debug"
+RCONFLICTS_${PN} = "task-core-tools-debug"
 
 MTRACE = ""
 MTRACE_libc-glibc = "libc-mtrace"
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
index 931984e..1035036 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
@@ -5,12 +5,16 @@
 SUMMARY = "Profiling tools"
 LICENSE = "MIT"
 
+PR = "r1"
+
 inherit packagegroup
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 # For backwards compatibility after rename
 RPROVIDES_${PN} = "task-core-tools-profile"
+RREPLACES_${PN} = "task-core-tools-profile"
+RCONFLICTS_${PN} = "task-core-tools-profile"
 
 RRECOMMENDS_${PN} = "\
     perf \
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
index 9720e5a..514e4ec 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
@@ -5,12 +5,16 @@
 SUMMARY = "Testing tools/applications"
 LICENSE = "MIT"
 
+PR = "r1"
+
 inherit packagegroup
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 # For backwards compatibility after rename
 RPROVIDES_${PN} = "task-core-tools-testapps"
+RREPLACES_${PN} = "task-core-tools-testapps"
+RCONFLICTS_${PN} = "task-core-tools-testapps"
 
 # kexec-tools doesn't work on Mips
 KEXECTOOLS ?= "kexec"
diff --git a/meta/recipes-devtools/packagegroups/packagegroup-core-device-devel.bb b/meta/recipes-devtools/packagegroups/packagegroup-core-device-devel.bb
index e55eed5..e831860 100644
--- a/meta/recipes-devtools/packagegroups/packagegroup-core-device-devel.bb
+++ b/meta/recipes-devtools/packagegroups/packagegroup-core-device-devel.bb
@@ -1,10 +1,13 @@
 SUMMARY = "Provides a small set of tools for development on the device"
 LICENSE = "MIT"
 
+PR = "r1"
+
 inherit packagegroup
 
 RPROVIDES_${PN} = "qemu-config"
 RREPLACES_${PN} = "qemu-config"
+RCONFLICTS_${PN} = "qemu-config"
 
 RDEPENDS_${PN} = "\
     distcc-config \
diff --git a/meta/recipes-gnome/packagegroups/packagegroup-core-sdk-gmae.bb b/meta/recipes-gnome/packagegroups/packagegroup-core-sdk-gmae.bb
index e959c5b..d42ea7e 100644
--- a/meta/recipes-gnome/packagegroups/packagegroup-core-sdk-gmae.bb
+++ b/meta/recipes-gnome/packagegroups/packagegroup-core-sdk-gmae.bb
@@ -4,7 +4,7 @@
 
 SUMMARY = "GNOME Mobile And Embedded SDK (host tools)"
 LICENSE = "MIT"
-PR = "r12"
+PR = "r13"
 
 inherit packagegroup
 
@@ -14,6 +14,8 @@ PACKAGEGROUP_DISABLE_COMPLEMENTARY = "1"
 
 # For backwards compatibility after rename
 RPROVIDES_${PN} = "task-core-sdk-gmae"
+RREPLACES_${PN} = "task-core-sdk-gmae"
+RCONFLICTS_${PN} = "task-core-sdk-gmae"
 
 RDEPENDS_${PN} = "\
     packagegroup-core-sdk \
diff --git a/meta/recipes-gnome/packagegroups/packagegroup-core-standalone-gmae-sdk-target.bb b/meta/recipes-gnome/packagegroups/packagegroup-core-standalone-gmae-sdk-target.bb
index 3f322a0..e3b8484 100644
--- a/meta/recipes-gnome/packagegroups/packagegroup-core-standalone-gmae-sdk-target.bb
+++ b/meta/recipes-gnome/packagegroups/packagegroup-core-standalone-gmae-sdk-target.bb
@@ -4,7 +4,7 @@
 
 SUMMARY = "GNOME Mobile And Embedded SDK (target tools)"
 LICENSE = "MIT"
-PR = "r15"
+PR = "r16"
 
 inherit packagegroup
 
@@ -12,6 +12,8 @@ require packagegroup-sdk-gmae.inc
 
 # For backwards compatibility after rename
 RPROVIDES_${PN} = "task-core-standalone-gmae-sdk-target"
+RREPLACES_${PN} = "task-core-standalone-gmae-sdk-target"
+RCONFLICTS_${PN} = "task-core-standalone-gmae-sdk-target"
 
 RDEPENDS_${PN} = "\
     packagegroup-core-standalone-sdk-target \
diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-clutter.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-clutter.bb
index 37e9a87..7b1cedc 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-clutter.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-clutter.bb
@@ -5,7 +5,7 @@
 SUMMARY = "Clutter package groups"
 LICENSE = "MIT"
 
-PR = "r4"
+PR = "r5"
 
 inherit packagegroup
 
@@ -15,6 +15,8 @@ PACKAGES = "\
 
 # For backwards compatibility after rename
 RPROVIDES_${PN}-core = "task-core-clutter-core"
+RREPLACES_${PN}-core = "task-core-clutter-core"
+RCONFLICTS_${PN}-core = "task-core-clutter-core"
 
 SUMMARY_${PN}-core = "Clutter graphics library"
 RDEPENDS_${PN}-core = "\
diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-gtk-directfb.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-gtk-directfb.bb
index d6c2985..55b0b9d 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-gtk-directfb.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-gtk-directfb.bb
@@ -1,11 +1,13 @@
 SUMMARY = "GTK+ over DirectFB without X11"
-PR = "r0"
+PR = "r1"
 LICENSE = "MIT"
 
 inherit packagegroup
 
 # For backwards compatibility after rename
 RPROVIDES_${PN} = "task-core-gtk-directfb-base"
+RREPLACES_${PN} = "task-core-gtk-directfb-base"
+RCONFLICTS_${PN} = "task-core-gtk-directfb-base"
 
 TOUCH = ' ${@base_contains("MACHINE_FEATURES", "touchscreen", "tslib tslib-calibrate tslib-tests", "",d)}'
 
diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb
index ebae741..a5d02ed 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb
@@ -1,12 +1,14 @@
 SUMMARY = "Basic X11 session"
 DESCRIPTION = "Packages required to set up a basic working X11 session"
 LICENSE = "MIT"
-PR = "r0"
+PR = "r1"
 
 inherit packagegroup
 
 # For backwards compatibility after rename
 RPROVIDES_${PN} = "task-core-x11-mini task-core-x11-base"
+RREPLACES_${PN} = "task-core-x11-mini task-core-x11-base"
+RCONFLICTS_${PN} = "task-core-x11-mini task-core-x11-base"
 
 RDEPENDS_${PN} = "\
     packagegroup-core-x11-xserver \
diff --git a/meta/recipes-qt/packagegroups/packagegroup-core-qt.bb b/meta/recipes-qt/packagegroups/packagegroup-core-qt.bb
index ed13354..315df33 100644
--- a/meta/recipes-qt/packagegroups/packagegroup-core-qt.bb
+++ b/meta/recipes-qt/packagegroups/packagegroup-core-qt.bb
@@ -4,7 +4,7 @@
 
 DESCRIPTION = "Qt package groups"
 LICENSE = "MIT"
-PR = "r3"
+PR = "r4"
 
 inherit packagegroup
 
@@ -12,6 +12,8 @@ PACKAGES = "${PN}-demoapps"
 
 # For backwards compatibility after rename
 RPROVIDES_${PN}-demoapps = "task-core-qt-demos"
+RREPLACES_${PN}-demoapps = "task-core-qt-demos"
+RCONFLICTS_${PN}-demoapps = "task-core-qt-demos"
 
 QTDEMOS ?= "quicky ${COMMERCIAL_QT} fotowall"
 
diff --git a/meta/recipes-qt/packagegroups/packagegroup-core-qt4e.bb b/meta/recipes-qt/packagegroups/packagegroup-core-qt4e.bb
index 042efb8..9263828 100644
--- a/meta/recipes-qt/packagegroups/packagegroup-core-qt4e.bb
+++ b/meta/recipes-qt/packagegroups/packagegroup-core-qt4e.bb
@@ -1,11 +1,13 @@
 SUMMARY = "Qt for Embedded Linux (Qt without X11)"
-PR = "r1"
+PR = "r2"
 LICENSE = "MIT"
 
 inherit packagegroup
 
 # For backwards compatibility after rename
 RPROVIDES_${PN} = "task-qt4e-base"
+RREPLACES_${PN} = "task-qt4e-base"
+RCONFLICTS_${PN} = "task-qt4e-base"
 
 TOUCH = ' ${@base_contains("MACHINE_FEATURES", "touchscreen", "tslib tslib-calibrate tslib-tests", "",d)}'
 
diff --git a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
index 53e15d3..f2997a7 100644
--- a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
+++ b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
@@ -4,7 +4,7 @@
 
 SUMMARY = "Sato desktop"
 LICENSE = "MIT"
-PR = "r32"
+PR = "r33"
 
 inherit packagegroup
 
@@ -14,6 +14,8 @@ PACKAGES = "${PN} ${PN}-base ${PN}-apps ${PN}-games"
 
 # For backwards compatibility after rename
 RPROVIDES_${PN} = "task-core-x11-sato"
+RREPLACES_${PN} = "task-core-x11-sato"
+RCONFLICTS_${PN} = "task-core-x11-sato"
 
 RDEPENDS_${PN} = "\
     ${PN}-base \
-- 
1.7.9.5



