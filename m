Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QHtTa-0002qr-4a
	for openembedded-core@lists.openembedded.org;
	Thu, 05 May 2011 09:59:58 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 05 May 2011 00:57:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,318,1301900400"; d="scan'208";a="688482708"
Received: from unknown (HELO localhost) ([10.255.13.11])
	by fmsmga002.fm.intel.com with ESMTP; 05 May 2011 00:57:17 -0700
Message-Id: <1a3617920b5ef3fd38f2f89a7d74b71e1bee7b85.1304581770.git.sgw@linux.intel.com>
In-Reply-To: <cover.1304581769.git.sgw@linux.intel.com>
References: <cover.1304581769.git.sgw@linux.intel.com>
Old-Date: Thu, 21 Apr 2011 17:49:08 +0100
Date: Thu, 05 May 2011  0:57:17 -0700
To: openembedded-core@lists.openembedded.org,bruce.ashfield@windriver.com
From: Saul Wold <sgw@linux.intel.com>
Cc: Kyle McMartin <kyle@redhat.com>, Greg Kroah-Hartman <gregkh@suse.de>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Kang Kai <kai.kang@windriver.com>, Thomas Meyer <thomas@m3y3r.de>
Subject: [PATCH 13/26] meta-yocto: add pieces removed from oe-core for beagleboard & atom-pc
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
X-List-Received-Date: Thu, 05 May 2011 07:59:58 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../formfactor/formfactor/atom-pc/machconfig       |    6 ++
 .../formfactor/formfactor/beagleboard/machconfig   |    3 +
 .../recipes-bsp/formfactor/formfactor_0.0.bbappend |    3 +
 .../recipes-core/tasks/task-core-tools.bbappend    |    2 +
 .../uclibc/uclibc/atom-pc/uClibc.machine           |   69 ++++++++++++++++++++
 .../recipes-core/uclibc/uclibc_0.9.30.1.bbappend   |    3 +
 .../tasks/task-poky-sdk-gmae.bbappend              |    1 +
 .../task-poky-standalone-gmae-sdk-target.bbappend  |    1 +
 .../clutter/clutter-1.4_1.4.2.bbappend             |    4 +
 .../clutter/clutter-1.6_1.6.14.bbappend            |    4 +
 .../recipes-graphics/clutter/clutter_git.bbappend  |    4 +
 .../recipes-graphics/mesa/mesa-dri_7.10.2.bbappend |    3 +
 .../recipes-graphics/mesa/mesa-dri_git.bbappend    |    3 +
 .../xserver-xf86-config/atom-pc/xorg.conf          |   26 +++++++
 .../xorg-xserver/xserver-xf86-config_0.1.bbappend  |    3 +
 .../recipes-qt/qt4/qt4-x11-free_4.6.3.bbappend     |    2 +
 .../recipes-qt/qt4/qt4-x11-free_4.7.2.bbappend     |    2 +
 17 files changed, 139 insertions(+), 0 deletions(-)
 create mode 100644 meta-yocto/recipes-bsp/formfactor/formfactor/atom-pc/machconfig
 create mode 100755 meta-yocto/recipes-bsp/formfactor/formfactor/beagleboard/machconfig
 create mode 100644 meta-yocto/recipes-bsp/formfactor/formfactor_0.0.bbappend
 create mode 100644 meta-yocto/recipes-core/tasks/task-core-tools.bbappend
 create mode 100644 meta-yocto/recipes-core/uclibc/uclibc/atom-pc/uClibc.machine
 create mode 100644 meta-yocto/recipes-core/uclibc/uclibc_0.9.30.1.bbappend
 create mode 100644 meta-yocto/recipes-gnome/tasks/task-poky-sdk-gmae.bbappend
 create mode 100644 meta-yocto/recipes-gnome/tasks/task-poky-standalone-gmae-sdk-target.bbappend
 create mode 100644 meta-yocto/recipes-graphics/clutter/clutter-1.4_1.4.2.bbappend
 create mode 100644 meta-yocto/recipes-graphics/clutter/clutter-1.6_1.6.14.bbappend
 create mode 100644 meta-yocto/recipes-graphics/clutter/clutter_git.bbappend
 create mode 100644 meta-yocto/recipes-graphics/mesa/mesa-dri_7.10.2.bbappend
 create mode 100644 meta-yocto/recipes-graphics/mesa/mesa-dri_git.bbappend
 create mode 100644 meta-yocto/recipes-graphics/xorg-xserver/xserver-xf86-config/atom-pc/xorg.conf
 create mode 100644 meta-yocto/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bbappend
 create mode 100644 meta-yocto/recipes-qt/qt4/qt4-x11-free_4.6.3.bbappend
 create mode 100644 meta-yocto/recipes-qt/qt4/qt4-x11-free_4.7.2.bbappend

diff --git a/meta-yocto/recipes-bsp/formfactor/formfactor/atom-pc/machconfig b/meta-yocto/recipes-bsp/formfactor/formfactor/atom-pc/machconfig
new file mode 100644
index 0000000..bef4ce3
--- /dev/null
+++ b/meta-yocto/recipes-bsp/formfactor/formfactor/atom-pc/machconfig
@@ -0,0 +1,6 @@
+HAVE_TOUCHSCREEN=0
+HAVE_KEYBOARD=1
+ 
+DISPLAY_CAN_ROTATE=0
+DISPLAY_ORIENTATION=0
+DISPLAY_DPI=133
diff --git a/meta-yocto/recipes-bsp/formfactor/formfactor/beagleboard/machconfig b/meta-yocto/recipes-bsp/formfactor/formfactor/beagleboard/machconfig
new file mode 100755
index 0000000..a46859f
--- /dev/null
+++ b/meta-yocto/recipes-bsp/formfactor/formfactor/beagleboard/machconfig
@@ -0,0 +1,3 @@
+# Assume a USB mouse and touchscreen are connected
+HAVE_TOUCHSCREEN=0
+HAVE_KEYBOARD=1
diff --git a/meta-yocto/recipes-bsp/formfactor/formfactor_0.0.bbappend b/meta-yocto/recipes-bsp/formfactor/formfactor_0.0.bbappend
new file mode 100644
index 0000000..4b8d0e6
--- /dev/null
+++ b/meta-yocto/recipes-bsp/formfactor/formfactor_0.0.bbappend
@@ -0,0 +1,3 @@
+THISDIR := "${@os.path.dirname(bb.data.getVar('FILE', d, True))}"
+FILESPATH =. "${@base_set_filespath(["${THISDIR}/${PN}"], d)}:"
+
diff --git a/meta-yocto/recipes-core/tasks/task-core-tools.bbappend b/meta-yocto/recipes-core/tasks/task-core-tools.bbappend
new file mode 100644
index 0000000..ad9dcf4
--- /dev/null
+++ b/meta-yocto/recipes-core/tasks/task-core-tools.bbappend
@@ -0,0 +1,2 @@
+RDEPENDS_task-core-tools-profile_append_atom-pc = " lttng-ust systemtap"
+
diff --git a/meta-yocto/recipes-core/uclibc/uclibc/atom-pc/uClibc.machine b/meta-yocto/recipes-core/uclibc/uclibc/atom-pc/uClibc.machine
new file mode 100644
index 0000000..5df15f9
--- /dev/null
+++ b/meta-yocto/recipes-core/uclibc/uclibc/atom-pc/uClibc.machine
@@ -0,0 +1,69 @@
+#
+# Automatically generated make config: don't edit
+# Fri Nov 23 15:49:33 2007
+#
+# TARGET_alpha is not set
+# TARGET_arm is not set
+# TARGET_bfin is not set
+# TARGET_cris is not set
+# TARGET_e1 is not set
+# TARGET_frv is not set
+# TARGET_h8300 is not set
+# TARGET_hppa is not set
+TARGET_i386=y
+# TARGET_i960 is not set
+# TARGET_ia64 is not set
+# TARGET_m68k is not set
+# TARGET_microblaze is not set
+# TARGET_mips is not set
+# TARGET_nios is not set
+# TARGET_nios2 is not set
+# TARGET_powerpc is not set
+# TARGET_sh is not set
+# TARGET_sh64 is not set
+# TARGET_sparc is not set
+# TARGET_v850 is not set
+# TARGET_vax is not set
+# TARGET_x86_64 is not set
+
+#
+# Target Architecture Features and Options
+#
+TARGET_ARCH="i386"
+FORCE_OPTIONS_FOR_ARCH=y
+CONFIG_GENERIC_386=y
+# CONFIG_386 is not set
+# CONFIG_486 is not set
+# CONFIG_586 is not set
+# CONFIG_586MMX is not set
+# CONFIG_686 is not set
+# CONFIG_PENTIUMII is not set
+# CONFIG_PENTIUMIII is not set
+# CONFIG_PENTIUM4 is not set
+# CONFIG_K6 is not set
+# CONFIG_K7 is not set
+# CONFIG_ELAN is not set
+# CONFIG_CRUSOE is not set
+# CONFIG_WINCHIPC6 is not set
+# CONFIG_WINCHIP2 is not set
+# CONFIG_CYRIXIII is not set
+# CONFIG_NEHEMIAH is not set
+TARGET_SUBARCH=""
+
+#
+# Using ELF file format
+#
+ARCH_LITTLE_ENDIAN=y
+
+#
+# Using Little Endian
+#
+ARCH_HAS_MMU=y
+ARCH_USE_MMU=y
+UCLIBC_HAS_FLOATS=y
+UCLIBC_HAS_FPU=y
+DO_C99_MATH=y
+KERNEL_HEADERS="/usr/include"
+HAVE_DOT_CONFIG=y
+
+UCLIBC_HAS_FENV=y
diff --git a/meta-yocto/recipes-core/uclibc/uclibc_0.9.30.1.bbappend b/meta-yocto/recipes-core/uclibc/uclibc_0.9.30.1.bbappend
new file mode 100644
index 0000000..4b8d0e6
--- /dev/null
+++ b/meta-yocto/recipes-core/uclibc/uclibc_0.9.30.1.bbappend
@@ -0,0 +1,3 @@
+THISDIR := "${@os.path.dirname(bb.data.getVar('FILE', d, True))}"
+FILESPATH =. "${@base_set_filespath(["${THISDIR}/${PN}"], d)}:"
+
diff --git a/meta-yocto/recipes-gnome/tasks/task-poky-sdk-gmae.bbappend b/meta-yocto/recipes-gnome/tasks/task-poky-sdk-gmae.bbappend
new file mode 100644
index 0000000..0105ade
--- /dev/null
+++ b/meta-yocto/recipes-gnome/tasks/task-poky-sdk-gmae.bbappend
@@ -0,0 +1 @@
+SDK-EXTRAS_atom-pc ?= " lttng-ust-dev"
diff --git a/meta-yocto/recipes-gnome/tasks/task-poky-standalone-gmae-sdk-target.bbappend b/meta-yocto/recipes-gnome/tasks/task-poky-standalone-gmae-sdk-target.bbappend
new file mode 100644
index 0000000..0105ade
--- /dev/null
+++ b/meta-yocto/recipes-gnome/tasks/task-poky-standalone-gmae-sdk-target.bbappend
@@ -0,0 +1 @@
+SDK-EXTRAS_atom-pc ?= " lttng-ust-dev"
diff --git a/meta-yocto/recipes-graphics/clutter/clutter-1.4_1.4.2.bbappend b/meta-yocto/recipes-graphics/clutter/clutter-1.4_1.4.2.bbappend
new file mode 100644
index 0000000..c7cc683
--- /dev/null
+++ b/meta-yocto/recipes-graphics/clutter/clutter-1.4_1.4.2.bbappend
@@ -0,0 +1,4 @@
+DEPENDS_atom-pc = "${STDDEPENDS} virtual/xserver-xf86 virtual/libgl"
+EXTRA_OECONF_atom-pc = "${BASE_CONF} --with-flavour=glx"
+PACKAGE_ARCH_atom-pc = "${MACHINE_ARCH}"
+
diff --git a/meta-yocto/recipes-graphics/clutter/clutter-1.6_1.6.14.bbappend b/meta-yocto/recipes-graphics/clutter/clutter-1.6_1.6.14.bbappend
new file mode 100644
index 0000000..c7cc683
--- /dev/null
+++ b/meta-yocto/recipes-graphics/clutter/clutter-1.6_1.6.14.bbappend
@@ -0,0 +1,4 @@
+DEPENDS_atom-pc = "${STDDEPENDS} virtual/xserver-xf86 virtual/libgl"
+EXTRA_OECONF_atom-pc = "${BASE_CONF} --with-flavour=glx"
+PACKAGE_ARCH_atom-pc = "${MACHINE_ARCH}"
+
diff --git a/meta-yocto/recipes-graphics/clutter/clutter_git.bbappend b/meta-yocto/recipes-graphics/clutter/clutter_git.bbappend
new file mode 100644
index 0000000..c7cc683
--- /dev/null
+++ b/meta-yocto/recipes-graphics/clutter/clutter_git.bbappend
@@ -0,0 +1,4 @@
+DEPENDS_atom-pc = "${STDDEPENDS} virtual/xserver-xf86 virtual/libgl"
+EXTRA_OECONF_atom-pc = "${BASE_CONF} --with-flavour=glx"
+PACKAGE_ARCH_atom-pc = "${MACHINE_ARCH}"
+
diff --git a/meta-yocto/recipes-graphics/mesa/mesa-dri_7.10.2.bbappend b/meta-yocto/recipes-graphics/mesa/mesa-dri_7.10.2.bbappend
new file mode 100644
index 0000000..61d3891
--- /dev/null
+++ b/meta-yocto/recipes-graphics/mesa/mesa-dri_7.10.2.bbappend
@@ -0,0 +1,3 @@
+# Atom PCs have DRI support so use mesa-dri by default
+DEFAULT_PREFERENCE_atom-pc = "1"
+
diff --git a/meta-yocto/recipes-graphics/mesa/mesa-dri_git.bbappend b/meta-yocto/recipes-graphics/mesa/mesa-dri_git.bbappend
new file mode 100644
index 0000000..61d3891
--- /dev/null
+++ b/meta-yocto/recipes-graphics/mesa/mesa-dri_git.bbappend
@@ -0,0 +1,3 @@
+# Atom PCs have DRI support so use mesa-dri by default
+DEFAULT_PREFERENCE_atom-pc = "1"
+
diff --git a/meta-yocto/recipes-graphics/xorg-xserver/xserver-xf86-config/atom-pc/xorg.conf b/meta-yocto/recipes-graphics/xorg-xserver/xserver-xf86-config/atom-pc/xorg.conf
new file mode 100644
index 0000000..e18b911
--- /dev/null
+++ b/meta-yocto/recipes-graphics/xorg-xserver/xserver-xf86-config/atom-pc/xorg.conf
@@ -0,0 +1,26 @@
+Section "Device"
+    Identifier    "Intel Graphics Driver"
+    Driver        "intel"
+EndSection
+
+Section "Monitor"
+    Identifier    "Generic Monitor"
+    Option        "DPMS"
+EndSection
+
+Section "Screen"
+    Identifier    "Default Screen"
+    Device        "Intel Graphics Driver"
+    Monitor        "Generic Monitor"
+    DefaultDepth    24
+EndSection
+
+Section "ServerLayout"
+    Identifier    "Default Layout"
+    Screen        "Default Screen"
+EndSection
+
+Section "ServerFlags"
+    Option        "DontZap"  "0"
+    Option	  "AutoAddDevices" "False"
+EndSection
diff --git a/meta-yocto/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bbappend b/meta-yocto/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bbappend
new file mode 100644
index 0000000..4b8d0e6
--- /dev/null
+++ b/meta-yocto/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bbappend
@@ -0,0 +1,3 @@
+THISDIR := "${@os.path.dirname(bb.data.getVar('FILE', d, True))}"
+FILESPATH =. "${@base_set_filespath(["${THISDIR}/${PN}"], d)}:"
+
diff --git a/meta-yocto/recipes-qt/qt4/qt4-x11-free_4.6.3.bbappend b/meta-yocto/recipes-qt/qt4/qt4-x11-free_4.6.3.bbappend
new file mode 100644
index 0000000..076ade2
--- /dev/null
+++ b/meta-yocto/recipes-qt/qt4/qt4-x11-free_4.6.3.bbappend
@@ -0,0 +1,2 @@
+QT_GLFLAGS_atom-pc = "-opengl"
+
diff --git a/meta-yocto/recipes-qt/qt4/qt4-x11-free_4.7.2.bbappend b/meta-yocto/recipes-qt/qt4/qt4-x11-free_4.7.2.bbappend
new file mode 100644
index 0000000..076ade2
--- /dev/null
+++ b/meta-yocto/recipes-qt/qt4/qt4-x11-free_4.7.2.bbappend
@@ -0,0 +1,2 @@
+QT_GLFLAGS_atom-pc = "-opengl"
+
-- 
1.7.1.1



