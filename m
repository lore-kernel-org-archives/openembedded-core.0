Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1RVXD2-0003S2-1F
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 00:35:32 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 29 Nov 2011 15:28:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="81086466"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by orsmga001.jf.intel.com with ESMTP; 29 Nov 2011 15:28:52 -0800
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Nov 2011 07:24:18 +0800
Message-Id: <7dda3dc84e07424863a863f6a3f6223610e936bc.1322608823.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1322608823.git.edwin.zhai@intel.com>
References: <cover.1322608823.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1322608823.git.edwin.zhai@intel.com>
References: <cover.1322608823.git.edwin.zhai@intel.com>
Subject: [PATCH 7/8] eee-acpi-scritps: Upgrade to 1.1.12 via git tag
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
X-List-Received-Date: Tue, 29 Nov 2011 23:35:32 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../eee-acpi-scripts/eee-acpi-scripts_git.bb       |    6 +-
 .../eee-acpi-scripts/files/remove-doc-check.patch  |   42 ++++++++++----------
 2 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/meta/recipes-bsp/eee-acpi-scripts/eee-acpi-scripts_git.bb b/meta/recipes-bsp/eee-acpi-scripts/eee-acpi-scripts_git.bb
index b721bb5..244cd94 100644
--- a/meta/recipes-bsp/eee-acpi-scripts/eee-acpi-scripts_git.bb
+++ b/meta/recipes-bsp/eee-acpi-scripts/eee-acpi-scripts_git.bb
@@ -5,9 +5,9 @@ SECTION = "base"
 LICENSE="GPL"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=77ef83ab5f4af938a93edb61f7b74f2c"
 
-SRCREV = "e224937ba51165e2a52252f9a113c8a82c01bb36"
-PV = "1.1.11+git${SRCPV}"
-PR = "r4"
+SRCREV = "9d4cdedca25b396405f8587f9c4fbf8229e041c2"
+PV = "1.1.12+git${SRCPV}"
+PR = "r0"
 
 RDEPENDS_${PN} = "pm-utils"
 
diff --git a/meta/recipes-bsp/eee-acpi-scripts/files/remove-doc-check.patch b/meta/recipes-bsp/eee-acpi-scripts/files/remove-doc-check.patch
index fc2c291..efb3dca 100644
--- a/meta/recipes-bsp/eee-acpi-scripts/files/remove-doc-check.patch
+++ b/meta/recipes-bsp/eee-acpi-scripts/files/remove-doc-check.patch
@@ -7,14 +7,14 @@
 
 Upstream-Status: Inappropriate [configuration]
 
-Index: git/eeepc-acpi-scripts/hotkey.sh
+Index: git/eeepc-acpi-scripts/volume.sh
 ===================================================================
---- git.orig/eeepc-acpi-scripts/hotkey.sh	2010-11-28 16:02:17.000000000 +0800
-+++ git/eeepc-acpi-scripts/hotkey.sh	2010-11-28 16:02:44.000000000 +0800
-@@ -1,12 +1,10 @@
- #!/bin/sh
+--- git.orig/eeepc-acpi-scripts/volume.sh	2011-11-29 19:21:55.000000000 +0800
++++ git/eeepc-acpi-scripts/volume.sh	2011-11-29 19:41:36.000000000 +0800
+@@ -3,12 +3,10 @@
+ [ -d /sys/devices/platform/eeepc ] || [ -d /sys/devices/platform/eeepc-wmi ] || exit 0
+ # Volume controls
  
- test -d /sys/bus/platform/devices/eeepc || exit 0
 -# do nothing if package is removed
  PKG=eeepc-acpi-scripts
  PKG_DIR=/usr/share/acpi-support/$PKG
@@ -22,16 +22,16 @@ Index: git/eeepc-acpi-scripts/hotkey.sh
  DEFAULT=/etc/default/$PKG
 -[ -e "$FUNC_LIB" ] || exit 0
  
- case $(runlevel) in
-     *0|*6)
-Index: git/eeepc-acpi-scripts/vga-toggle.sh
+ . $FUNC_LIB
+ . $PKG_DIR/lib/sound.sh
+Index: git/eeepc-acpi-scripts/hotkey.sh
 ===================================================================
---- git.orig/eeepc-acpi-scripts/vga-toggle.sh	2010-11-28 16:03:57.000000000 +0800
-+++ git/eeepc-acpi-scripts/vga-toggle.sh	2010-11-28 16:04:03.000000000 +0800
+--- git.orig/eeepc-acpi-scripts/hotkey.sh	2011-11-29 19:21:55.000000000 +0800
++++ git/eeepc-acpi-scripts/hotkey.sh	2011-11-29 19:39:51.000000000 +0800
 @@ -1,12 +1,10 @@
  #!/bin/sh
  
- test -d /sys/bus/platform/devices/eeepc || exit 0
+ [ -d /sys/devices/platform/eeepc ] || [ -d /sys/devices/platform/eeepc-wmi ] || exit 0
 -# do nothing if package is removed
  PKG=eeepc-acpi-scripts
  PKG_DIR=/usr/share/acpi-support/$PKG
@@ -39,16 +39,16 @@ Index: git/eeepc-acpi-scripts/vga-toggle.sh
  DEFAULT=/etc/default/$PKG
 -[ -e "$FUNC_LIB" ] || exit 0
  
- if [ -e "$DEFAULT" ]; then . "$DEFAULT"; fi
- . $FUNC_LIB
-Index: git/eeepc-acpi-scripts/volume.sh
+ case $(runlevel) in
+     *0|*6)
+Index: git/eeepc-acpi-scripts/vga-toggle.sh
 ===================================================================
---- git.orig/eeepc-acpi-scripts/volume.sh	2010-11-28 16:04:34.000000000 +0800
-+++ git/eeepc-acpi-scripts/volume.sh	2010-11-28 16:04:40.000000000 +0800
-@@ -3,12 +3,10 @@
- test -d /sys/bus/platform/devices/eeepc || exit 0
- # Volume controls
+--- git.orig/eeepc-acpi-scripts/vga-toggle.sh	2011-11-29 19:21:55.000000000 +0800
++++ git/eeepc-acpi-scripts/vga-toggle.sh	2011-11-29 19:40:24.000000000 +0800
+@@ -1,12 +1,10 @@
+ #!/bin/sh
  
+ [ -d /sys/devices/platform/eeepc ] || [ -d /sys/devices/platform/eeepc-wmi ] || exit 0
 -# do nothing if package is removed
  PKG=eeepc-acpi-scripts
  PKG_DIR=/usr/share/acpi-support/$PKG
@@ -56,5 +56,5 @@ Index: git/eeepc-acpi-scripts/volume.sh
  DEFAULT=/etc/default/$PKG
 -[ -e "$FUNC_LIB" ] || exit 0
  
+ if [ -e "$DEFAULT" ]; then . "$DEFAULT"; fi
  . $FUNC_LIB
- . $PKG_DIR/lib/sound.sh
-- 
1.7.1



