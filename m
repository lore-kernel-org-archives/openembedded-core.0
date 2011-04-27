Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QF6dT-0005dh-63
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Apr 2011 17:26:45 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 27 Apr 2011 08:24:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,274,1301900400"; d="scan'208";a="634851998"
Received: from unknown (HELO helios) ([10.255.13.83])
	by orsmga002.jf.intel.com with SMTP; 27 Apr 2011 08:24:03 -0700
Received: by helios (sSMTP sendmail emulation); Wed, 27 Apr 2011 16:24:05 +0100
Message-Id: <313923fe4c078ca606e83574d61c05d97b2c6d6b.1303917262.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1303917262.git.paul.eggleton@linux.intel.com>
References: <cover.1303917262.git.paul.eggleton@linux.intel.com>
Old-Date: Thu, 21 Apr 2011 14:32:45 +0100
Date: Wed, 27 Apr 2011 16:24:05 +0100
To: openembedded-core@lists.openembedded.org
CC: 
From: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] Remove machine-specific metadata for machines no longer in oe-core
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
X-List-Received-Date: Wed, 27 Apr 2011 15:26:45 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-bsp/formfactor/files/akita/machconfig |   15 -
 .../formfactor/files/atom-pc/machconfig            |    6 -
 .../formfactor/files/beagleboard/machconfig        |    3 -
 .../formfactor/files/bootcdx86/machconfig          |    5 -
 meta/recipes-bsp/formfactor/files/c7x0/machconfig  |   15 -
 .../formfactor/files/cm-x270/machconfig            |    9 -
 .../formfactor/files/em-x270/machconfig            |   15 -
 .../formfactor/files/htcuniversal/machconfig       |   15 -
 .../formfactor/files/igep0020/machconfig           |    3 -
 .../formfactor/files/nokia800/machconfig           |   13 -
 .../formfactor/files/om-gta01/machconfig           |   14 -
 .../formfactor/files/omap-3430ldp/machconfig       |   15 -
 .../formfactor/files/omap-3430sdp/machconfig       |   15 -
 meta/recipes-bsp/formfactor/files/spitz/machconfig |   15 -
 .../formfactor/files/zylonite/machconfig           |   12 -
 .../recipes-bsp/keymaps/files/akita/keymap-2.4.map |  128 -----
 .../recipes-bsp/keymaps/files/akita/keymap-2.6.map |  228 --------
 meta/recipes-bsp/keymaps/files/c7x0/keymap-2.6.map |  213 -------
 .../keymaps/files/collie/keymap-2.4.map            |  114 ----
 .../keymaps/files/collie/keymap-2.6.map            |  262 ---------
 .../recipes-bsp/keymaps/files/h2200/keymap-2.6.map |   17 -
 .../keymaps/files/htcuniversal/keymap-2.6.map      |   20 -
 .../keymaps/files/jornada6xx/keymap-de.map         |  597 --------------------
 .../keymaps/files/jornada6xx/keymap-sp.map         |  222 --------
 .../keymaps/files/jornada6xx/keymap-uk.map         |  278 ---------
 .../keymaps/files/poodle/keymap-2.6.map            |  152 -----
 .../recipes-bsp/keymaps/files/spitz/keymap-2.4.map |  128 -----
 .../recipes-bsp/keymaps/files/spitz/keymap-2.6.map |  228 --------
 meta/recipes-bsp/keymaps/files/tosa/keymap-2.4.map |  133 -----
 meta/recipes-bsp/keymaps/files/tosa/keymap-2.6.map |  210 -------
 meta/recipes-bsp/keymaps/keymaps_1.0.bb            |   20 +-
 meta/recipes-bsp/pointercal/files/akita/pointercal |    1 -
 meta/recipes-bsp/pointercal/files/c7x0/pointercal  |    1 -
 .../pointercal/files/htcuniversal/pointercal       |    1 -
 .../pointercal/files/om-gta01/pointercal           |    1 -
 .../pointercal/files/omap-3430ldp/pointercal       |    1 -
 meta/recipes-bsp/pointercal/files/spitz/pointercal |    1 -
 meta/recipes-bsp/zaurusd/zaurusd_svn.bb            |   19 -
 .../recipes-core/base-files/base-files/akita/fstab |   16 -
 .../base-files/base-files/akita/rotation           |    1 -
 meta/recipes-core/base-files/base-files/c7x0/fstab |   12 -
 meta/recipes-core/base-files/base-files/c7x0/usbd  |    1 -
 .../base-files/base-files/collie/fstab             |    8 -
 .../recipes-core/base-files/base-files/collie/usbd |    1 -
 .../base-files/base-files/htcuniversal/rotation    |    1 -
 .../base-files/base-files/hx2000/fstab             |    9 -
 .../recipes-core/base-files/base-files/mtx-1/fstab |    8 -
 .../base-files/base-files/mtx-1/profile            |   25 -
 .../base-files/base-files/nokia770/fstab           |    6 -
 .../base-files/base-files/poodle/fstab             |   13 -
 .../recipes-core/base-files/base-files/poodle/usbd |    1 -
 .../recipes-core/base-files/base-files/spitz/fstab |   28 -
 .../base-files/base-files/spitz/rotation           |    1 -
 meta/recipes-core/base-files/base-files/tosa/fstab |   12 -
 meta/recipes-core/base-files/base-files/tosa/usbd  |    5 -
 meta/recipes-core/base-files/base-files_3.0.14.bb  |   17 +-
 .../netbase/netbase-4.45/epia/interfaces           |   10 -
 .../netbase/netbase-4.45/mtx-1/interfaces          |   29 -
 .../netbase/netbase-4.45/nokia800/interfaces       |    5 -
 .../netbase/netbase-4.45/tosa/interfaces           |   24 -
 .../netbase/netbase-4.45/wrt54/interfaces          |   23 -
 .../netbase/netbase-4.45/xxs1500/interfaces        |   15 -
 meta/recipes-core/netbase/netbase_4.45.bb          |    7 +-
 meta/recipes-core/tasks/task-core-tools.bb         |    2 -
 .../uclibc/uclibc-0.9.30.1/akita/uClibc.machine    |   70 ---
 .../uclibc/uclibc-0.9.30.1/atom-pc/uClibc.machine  |   69 ---
 .../uclibc/uclibc-0.9.30.1/c7x0/uClibc.machine     |   70 ---
 .../uclibc/uclibc-0.9.30.1/cm-x270/uClibc.machine  |   70 ---
 .../uclibc/uclibc-0.9.30.1/om-gta01/uClibc.machine |   69 ---
 .../uclibc/uclibc-0.9.30.1/spitz/uClibc.machine    |   70 ---
 meta/recipes-core/udev/files/50-hostap_cs.rules    |    4 -
 meta/recipes-core/udev/files/akita/mount.blacklist |    3 -
 meta/recipes-core/udev/files/c7x0/mount.blacklist  |    3 -
 meta/recipes-core/udev/files/spitz/mount.blacklist |    4 -
 meta/recipes-core/udev/files/tosa/mount.blacklist  |    3 -
 meta/recipes-core/udev/udev-new.inc                |    7 -
 meta/recipes-core/udev/udev_145.bb                 |    9 +-
 meta/recipes-core/udev/udev_164.bb                 |    2 +-
 meta/recipes-gnome/tasks/task-sdk-gmae.inc         |    2 -
 meta/recipes-graphics/clutter/clutter-1.4_1.4.2.bb |    2 +-
 .../recipes-graphics/clutter/clutter-1.6_1.6.14.bb |    2 +-
 meta/recipes-graphics/clutter/clutter.inc          |   35 --
 meta/recipes-graphics/clutter/clutter_git.bb       |    2 +-
 meta/recipes-graphics/mesa/mesa-dri_7.10.2.bb      |    3 -
 meta/recipes-graphics/mesa/mesa-dri_git.bb         |    3 -
 meta/recipes-graphics/mutter/mutter.inc            |    3 -
 meta/recipes-graphics/tslib/tslib/a780/tslib.sh    |    6 -
 meta/recipes-graphics/tslib/tslib/collie/ts.conf   |    5 -
 meta/recipes-graphics/tslib/tslib/collie/tslib.sh  |   13 -
 meta/recipes-graphics/tslib/tslib/devfs.patch      |   18 -
 meta/recipes-graphics/tslib/tslib/e680/tslib.sh    |    6 -
 meta/recipes-graphics/tslib/tslib/event1.patch     |   80 ---
 .../tslib/tslib/jornada56x/ts.conf                 |    5 -
 .../tslib/tslib/jornada56x/tslib.sh                |    5 -
 .../tslib/tslib/jornada6xx/ts.conf                 |    5 -
 .../tslib/tslib/jornada6xx/tslib.sh                |    5 -
 .../tslib/tslib/jornada7xx/ts.conf                 |    5 -
 .../tslib/tslib/jornada7xx/tslib.sh                |    5 -
 meta/recipes-graphics/tslib/tslib/mnci/ts.conf     |    5 -
 meta/recipes-graphics/tslib/tslib/mnci/tslib.sh    |    1 -
 .../tslib/tslib/netbook-pro/ts.conf                |    5 -
 .../tslib/tslib/netbook-pro/tslib.sh               |    5 -
 .../tslib/tslib/omap1610h2/tslib.sh                |    5 -
 .../tslib/tslib/omap5912osk/tslib.sh               |    4 -
 meta/recipes-graphics/tslib/tslib/simpad/tslib.sh  |   14 -
 .../tslib/tslib/ts.conf-collie-2.4                 |    5 -
 .../tslib/tslib/ts.conf-simpad-2.4                 |    5 -
 meta/recipes-graphics/tslib/tslib_1.0.bb           |   32 +-
 .../xserver-xf86-config/atom-pc/xorg.conf          |   26 -
 .../xserver-xf86-config/igep0020/xorg.conf         |   47 --
 .../modutils/files/ipaq-pxa-2.6/modules            |   18 -
 .../modutils/files/ipaq-pxa-2.6/modules.conf       |    1 -
 meta/recipes-kernel/modutils/files/mnci/modules    |    1 -
 .../modutils/files/mnci/modules-ramses             |    1 -
 .../modutils/files/mnci/modules.conf               |   20 -
 .../recipes-kernel/modutils/files/mnci/modutils.sh |   10 -
 meta/recipes-kernel/modutils/files/mtx-1/modules   |    3 -
 meta/recipes-kernel/modutils/files/poodle/modules  |    3 -
 .../modutils/files/poodle/modules.conf             |    4 -
 meta/recipes-kernel/modutils/files/tosa/modules    |    4 -
 .../modutils/files/tosa/modules.conf               |    4 -
 meta/recipes-kernel/modutils/files/wrt54/modules   |    4 -
 .../pulseaudio/pulseaudio_0.9.22.bb                |    4 -
 meta/recipes-qt/qt4/qt4-x11-free.inc               |    4 +-
 .../matchbox-sato/matchbox-session-sato_0.1.bb     |    8 +-
 meta/recipes-support/hal/hal.inc                   |    1 -
 meta/recipes-support/hal/hal_0.5.14.bb             |    2 +-
 meta/recipes-support/hal/hal_git.bb                |    2 +-
 128 files changed, 14 insertions(+), 4322 deletions(-)
 delete mode 100755 meta/recipes-bsp/formfactor/files/akita/machconfig
 delete mode 100644 meta/recipes-bsp/formfactor/files/atom-pc/machconfig
 delete mode 100755 meta/recipes-bsp/formfactor/files/beagleboard/machconfig
 delete mode 100644 meta/recipes-bsp/formfactor/files/bootcdx86/machconfig
 delete mode 100755 meta/recipes-bsp/formfactor/files/c7x0/machconfig
 delete mode 100755 meta/recipes-bsp/formfactor/files/cm-x270/machconfig
 delete mode 100755 meta/recipes-bsp/formfactor/files/em-x270/machconfig
 delete mode 100755 meta/recipes-bsp/formfactor/files/htcuniversal/machconfig
 delete mode 100755 meta/recipes-bsp/formfactor/files/igep0020/machconfig
 delete mode 100755 meta/recipes-bsp/formfactor/files/nokia800/machconfig
 delete mode 100644 meta/recipes-bsp/formfactor/files/om-gta01/machconfig
 delete mode 100755 meta/recipes-bsp/formfactor/files/omap-3430ldp/machconfig
 delete mode 100755 meta/recipes-bsp/formfactor/files/omap-3430sdp/machconfig
 delete mode 100755 meta/recipes-bsp/formfactor/files/spitz/machconfig
 delete mode 100755 meta/recipes-bsp/formfactor/files/zylonite/machconfig
 delete mode 100644 meta/recipes-bsp/keymaps/files/akita/keymap-2.4.map
 delete mode 100644 meta/recipes-bsp/keymaps/files/akita/keymap-2.6.map
 delete mode 100755 meta/recipes-bsp/keymaps/files/c7x0/keymap-2.6.map
 delete mode 100644 meta/recipes-bsp/keymaps/files/collie/keymap-2.4.map
 delete mode 100644 meta/recipes-bsp/keymaps/files/collie/keymap-2.6.map
 delete mode 100644 meta/recipes-bsp/keymaps/files/h2200/keymap-2.6.map
 delete mode 100644 meta/recipes-bsp/keymaps/files/htcuniversal/keymap-2.6.map
 delete mode 100644 meta/recipes-bsp/keymaps/files/jornada6xx/keymap-de.map
 delete mode 100644 meta/recipes-bsp/keymaps/files/jornada6xx/keymap-sp.map
 delete mode 100644 meta/recipes-bsp/keymaps/files/jornada6xx/keymap-uk.map
 delete mode 100644 meta/recipes-bsp/keymaps/files/poodle/keymap-2.6.map
 delete mode 100644 meta/recipes-bsp/keymaps/files/spitz/keymap-2.4.map
 delete mode 100644 meta/recipes-bsp/keymaps/files/spitz/keymap-2.6.map
 delete mode 100644 meta/recipes-bsp/keymaps/files/tosa/keymap-2.4.map
 delete mode 100644 meta/recipes-bsp/keymaps/files/tosa/keymap-2.6.map
 delete mode 100644 meta/recipes-bsp/pointercal/files/akita/pointercal
 delete mode 100644 meta/recipes-bsp/pointercal/files/c7x0/pointercal
 delete mode 100644 meta/recipes-bsp/pointercal/files/htcuniversal/pointercal
 delete mode 100644 meta/recipes-bsp/pointercal/files/om-gta01/pointercal
 delete mode 100644 meta/recipes-bsp/pointercal/files/omap-3430ldp/pointercal
 delete mode 100644 meta/recipes-bsp/pointercal/files/spitz/pointercal
 delete mode 100644 meta/recipes-bsp/zaurusd/zaurusd_svn.bb
 delete mode 100644 meta/recipes-core/base-files/base-files/akita/fstab
 delete mode 100644 meta/recipes-core/base-files/base-files/akita/rotation
 delete mode 100644 meta/recipes-core/base-files/base-files/c7x0/fstab
 delete mode 100644 meta/recipes-core/base-files/base-files/c7x0/usbd
 delete mode 100644 meta/recipes-core/base-files/base-files/collie/fstab
 delete mode 100644 meta/recipes-core/base-files/base-files/collie/usbd
 delete mode 100644 meta/recipes-core/base-files/base-files/htcuniversal/rotation
 delete mode 100644 meta/recipes-core/base-files/base-files/hx2000/fstab
 delete mode 100644 meta/recipes-core/base-files/base-files/mtx-1/fstab
 delete mode 100644 meta/recipes-core/base-files/base-files/mtx-1/profile
 delete mode 100644 meta/recipes-core/base-files/base-files/nokia770/fstab
 delete mode 100644 meta/recipes-core/base-files/base-files/poodle/fstab
 delete mode 100644 meta/recipes-core/base-files/base-files/poodle/usbd
 delete mode 100644 meta/recipes-core/base-files/base-files/spitz/fstab
 delete mode 100644 meta/recipes-core/base-files/base-files/spitz/rotation
 delete mode 100644 meta/recipes-core/base-files/base-files/tosa/fstab
 delete mode 100644 meta/recipes-core/base-files/base-files/tosa/usbd
 delete mode 100644 meta/recipes-core/netbase/netbase-4.45/epia/interfaces
 delete mode 100644 meta/recipes-core/netbase/netbase-4.45/mtx-1/interfaces
 delete mode 100644 meta/recipes-core/netbase/netbase-4.45/nokia800/interfaces
 delete mode 100644 meta/recipes-core/netbase/netbase-4.45/tosa/interfaces
 delete mode 100644 meta/recipes-core/netbase/netbase-4.45/wrt54/interfaces
 delete mode 100644 meta/recipes-core/netbase/netbase-4.45/xxs1500/interfaces
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.30.1/akita/uClibc.machine
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.30.1/atom-pc/uClibc.machine
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.30.1/c7x0/uClibc.machine
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.30.1/cm-x270/uClibc.machine
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.30.1/om-gta01/uClibc.machine
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.30.1/spitz/uClibc.machine
 delete mode 100644 meta/recipes-core/udev/files/50-hostap_cs.rules
 delete mode 100644 meta/recipes-core/udev/files/akita/mount.blacklist
 delete mode 100644 meta/recipes-core/udev/files/c7x0/mount.blacklist
 delete mode 100644 meta/recipes-core/udev/files/spitz/mount.blacklist
 delete mode 100644 meta/recipes-core/udev/files/tosa/mount.blacklist
 delete mode 100644 meta/recipes-graphics/tslib/tslib/a780/tslib.sh
 delete mode 100644 meta/recipes-graphics/tslib/tslib/collie/ts.conf
 delete mode 100644 meta/recipes-graphics/tslib/tslib/collie/tslib.sh
 delete mode 100644 meta/recipes-graphics/tslib/tslib/devfs.patch
 delete mode 100644 meta/recipes-graphics/tslib/tslib/e680/tslib.sh
 delete mode 100644 meta/recipes-graphics/tslib/tslib/event1.patch
 delete mode 100644 meta/recipes-graphics/tslib/tslib/jornada56x/ts.conf
 delete mode 100644 meta/recipes-graphics/tslib/tslib/jornada56x/tslib.sh
 delete mode 100644 meta/recipes-graphics/tslib/tslib/jornada6xx/ts.conf
 delete mode 100644 meta/recipes-graphics/tslib/tslib/jornada6xx/tslib.sh
 delete mode 100644 meta/recipes-graphics/tslib/tslib/jornada7xx/ts.conf
 delete mode 100644 meta/recipes-graphics/tslib/tslib/jornada7xx/tslib.sh
 delete mode 100644 meta/recipes-graphics/tslib/tslib/mnci/ts.conf
 delete mode 100644 meta/recipes-graphics/tslib/tslib/mnci/tslib.sh
 delete mode 100644 meta/recipes-graphics/tslib/tslib/netbook-pro/ts.conf
 delete mode 100644 meta/recipes-graphics/tslib/tslib/netbook-pro/tslib.sh
 delete mode 100644 meta/recipes-graphics/tslib/tslib/omap1610h2/tslib.sh
 delete mode 100644 meta/recipes-graphics/tslib/tslib/omap5912osk/tslib.sh
 delete mode 100644 meta/recipes-graphics/tslib/tslib/simpad/tslib.sh
 delete mode 100644 meta/recipes-graphics/tslib/tslib/ts.conf-collie-2.4
 delete mode 100644 meta/recipes-graphics/tslib/tslib/ts.conf-simpad-2.4
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-config/atom-pc/xorg.conf
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-config/igep0020/xorg.conf
 delete mode 100644 meta/recipes-kernel/modutils/files/ipaq-pxa-2.6/modules
 delete mode 100644 meta/recipes-kernel/modutils/files/ipaq-pxa-2.6/modules.conf
 delete mode 100644 meta/recipes-kernel/modutils/files/mnci/modules
 delete mode 100644 meta/recipes-kernel/modutils/files/mnci/modules-ramses
 delete mode 100644 meta/recipes-kernel/modutils/files/mnci/modules.conf
 delete mode 100755 meta/recipes-kernel/modutils/files/mnci/modutils.sh
 delete mode 100644 meta/recipes-kernel/modutils/files/mtx-1/modules
 delete mode 100644 meta/recipes-kernel/modutils/files/omap1610h2/modules
 delete mode 100644 meta/recipes-kernel/modutils/files/omap1610h2/modules.conf
 delete mode 100644 meta/recipes-kernel/modutils/files/poodle/modules
 delete mode 100644 meta/recipes-kernel/modutils/files/poodle/modules.conf
 delete mode 100644 meta/recipes-kernel/modutils/files/tosa/modules
 delete mode 100644 meta/recipes-kernel/modutils/files/tosa/modules.conf
 delete mode 100644 meta/recipes-kernel/modutils/files/wrt54/modules

diff --git a/meta/recipes-bsp/formfactor/files/akita/machconfig b/meta/recipes-bsp/formfactor/files/akita/machconfig
deleted file mode 100755
index a9649e0..0000000
--- a/meta/recipes-bsp/formfactor/files/akita/machconfig
+++ /dev/null
@@ -1,15 +0,0 @@
-HAVE_TOUCHSCREEN=1
-HAVE_KEYBOARD=1
-HAVE_KEYBOARD_PORTRAIT=0
-HAVE_KEYBOARD_LANDSCAPE=1
- 
-DISPLAY_CAN_ROTATE=1
-DISPLAY_ORIENTATION=270
-DISPLAY_WIDTH_PIXELS=480
-DISPLAY_WIDTH_MM=56
-DISPLAY_HEIGHT_PIXELS=640
-DISPLAY_HEIGHT_MM=74
-DISPLAY_BPP=16
-#DISPLAY_DPI=220
-DISPLAY_DPI=150
-DISPLAY_SUBPIXEL_ORDER=rgb
diff --git a/meta/recipes-bsp/formfactor/files/atom-pc/machconfig b/meta/recipes-bsp/formfactor/files/atom-pc/machconfig
deleted file mode 100644
index bef4ce3..0000000
--- a/meta/recipes-bsp/formfactor/files/atom-pc/machconfig
+++ /dev/null
@@ -1,6 +0,0 @@
-HAVE_TOUCHSCREEN=0
-HAVE_KEYBOARD=1
- 
-DISPLAY_CAN_ROTATE=0
-DISPLAY_ORIENTATION=0
-DISPLAY_DPI=133
diff --git a/meta/recipes-bsp/formfactor/files/beagleboard/machconfig b/meta/recipes-bsp/formfactor/files/beagleboard/machconfig
deleted file mode 100755
index a46859f..0000000
--- a/meta/recipes-bsp/formfactor/files/beagleboard/machconfig
+++ /dev/null
@@ -1,3 +0,0 @@
-# Assume a USB mouse and touchscreen are connected
-HAVE_TOUCHSCREEN=0
-HAVE_KEYBOARD=1
diff --git a/meta/recipes-bsp/formfactor/files/bootcdx86/machconfig b/meta/recipes-bsp/formfactor/files/bootcdx86/machconfig
deleted file mode 100644
index adf707e..0000000
--- a/meta/recipes-bsp/formfactor/files/bootcdx86/machconfig
+++ /dev/null
@@ -1,5 +0,0 @@
-HAVE_TOUCHSCREEN=0
-HAVE_KEYBOARD=1
- 
-DISPLAY_CAN_ROTATE=0
-DISPLAY_ORIENTATION=0
diff --git a/meta/recipes-bsp/formfactor/files/c7x0/machconfig b/meta/recipes-bsp/formfactor/files/c7x0/machconfig
deleted file mode 100755
index ad3620f..0000000
--- a/meta/recipes-bsp/formfactor/files/c7x0/machconfig
+++ /dev/null
@@ -1,15 +0,0 @@
-HAVE_TOUCHSCREEN=1
-HAVE_KEYBOARD=1
-HAVE_KEYBOARD_PORTRAIT=0
-HAVE_KEYBOARD_LANDSCAPE=1
- 
-DISPLAY_CAN_ROTATE=1
-DISPLAY_ORIENTATION=0
-DISPLAY_WIDTH_PIXELS=640
-DISPLAY_WIDTH_MM=74
-DISPLAY_HEIGHT_PIXELS=480
-DISPLAY_HEIGHT_MM=56
-DISPLAY_BPP=16
-#DISPLAY_DPI=220
-DISPLAY_DPI=150
-DISPLAY_SUBPIXEL_ORDER=rgb
diff --git a/meta/recipes-bsp/formfactor/files/cm-x270/machconfig b/meta/recipes-bsp/formfactor/files/cm-x270/machconfig
deleted file mode 100755
index f738729..0000000
--- a/meta/recipes-bsp/formfactor/files/cm-x270/machconfig
+++ /dev/null
@@ -1,9 +0,0 @@
-HAVE_TOUCHSCREEN=0
-HAVE_KEYBOARD=1
- 
-DISPLAY_CAN_ROTATE=0
-DISPLAY_ORIENTATION=0
-DISPLAY_WIDTH_PIXELS=640
-DISPLAY_HEIGHT_PIXELS=480
-DISPLAY_BPP=16
-DISPLAY_DPI=150
diff --git a/meta/recipes-bsp/formfactor/files/em-x270/machconfig b/meta/recipes-bsp/formfactor/files/em-x270/machconfig
deleted file mode 100755
index 651e59e..0000000
--- a/meta/recipes-bsp/formfactor/files/em-x270/machconfig
+++ /dev/null
@@ -1,15 +0,0 @@
-HAVE_TOUCHSCREEN=1
-HAVE_KEYBOARD=0
-HAVE_KEYBOARD_PORTRAIT=0
-HAVE_KEYBOARD_LANDSCAPE=0
- 
-DISPLAY_CAN_ROTATE=1
-DISPLAY_ORIENTATION=270
-DISPLAY_WIDTH_PIXELS=480
-DISPLAY_WIDTH_MM=56
-DISPLAY_HEIGHT_PIXELS=640
-DISPLAY_HEIGHT_MM=74
-DISPLAY_BPP=16
-# This is a lie
-DISPLAY_DPI=150
-DISPLAY_SUBPIXEL_ORDER=rgb
diff --git a/meta/recipes-bsp/formfactor/files/htcuniversal/machconfig b/meta/recipes-bsp/formfactor/files/htcuniversal/machconfig
deleted file mode 100755
index a9649e0..0000000
--- a/meta/recipes-bsp/formfactor/files/htcuniversal/machconfig
+++ /dev/null
@@ -1,15 +0,0 @@
-HAVE_TOUCHSCREEN=1
-HAVE_KEYBOARD=1
-HAVE_KEYBOARD_PORTRAIT=0
-HAVE_KEYBOARD_LANDSCAPE=1
- 
-DISPLAY_CAN_ROTATE=1
-DISPLAY_ORIENTATION=270
-DISPLAY_WIDTH_PIXELS=480
-DISPLAY_WIDTH_MM=56
-DISPLAY_HEIGHT_PIXELS=640
-DISPLAY_HEIGHT_MM=74
-DISPLAY_BPP=16
-#DISPLAY_DPI=220
-DISPLAY_DPI=150
-DISPLAY_SUBPIXEL_ORDER=rgb
diff --git a/meta/recipes-bsp/formfactor/files/igep0020/machconfig b/meta/recipes-bsp/formfactor/files/igep0020/machconfig
deleted file mode 100755
index ffce012..0000000
--- a/meta/recipes-bsp/formfactor/files/igep0020/machconfig
+++ /dev/null
@@ -1,3 +0,0 @@
-# Assume a USB mouse and keyboard are connected
-HAVE_TOUCHSCREEN=0
-HAVE_KEYBOARD=1
diff --git a/meta/recipes-bsp/formfactor/files/nokia800/machconfig b/meta/recipes-bsp/formfactor/files/nokia800/machconfig
deleted file mode 100755
index ebe626c..0000000
--- a/meta/recipes-bsp/formfactor/files/nokia800/machconfig
+++ /dev/null
@@ -1,13 +0,0 @@
-HAVE_TOUCHSCREEN=1
-HAVE_KEYBOARD=0
- 
-DISPLAY_CAN_ROTATE=0
-DISPLAY_ORIENTATION=0
-DISPLAY_WIDTH_PIXELS=800
-DISPLAY_WIDTH_MM=90
-DISPLAY_HEIGHT_PIXELS=480
-DISPLAY_HEIGHT_MM=54
-DISPLAY_BPP=16
-#DISPLAY_DPI=220
-DISPLAY_DPI=150
-#DISPLAY_SUBPIXEL_ORDER=
diff --git a/meta/recipes-bsp/formfactor/files/om-gta01/machconfig b/meta/recipes-bsp/formfactor/files/om-gta01/machconfig
deleted file mode 100644
index 38a9bb0..0000000
--- a/meta/recipes-bsp/formfactor/files/om-gta01/machconfig
+++ /dev/null
@@ -1,14 +0,0 @@
-HAVE_TOUCHSCREEN=1
-HAVE_KEYBOARD=0
-HAVE_KEYBOARD_PORTRAIT=0
-HAVE_KEYBOARD_LANDSCAPE=0
- 
-DISPLAY_CAN_ROTATE=1
-DISPLAY_ORIENTATION=270
-DISPLAY_WIDTH_PIXELS=480
-DISPLAY_WIDTH_MM=74
-DISPLAY_HEIGHT_PIXELS=640
-DISPLAY_HEIGHT_MM=56
-DISPLAY_BPP=16
-DISPLAY_DPI=280
-DISPLAY_SUBPIXEL_ORDER=rgb
diff --git a/meta/recipes-bsp/formfactor/files/omap-3430ldp/machconfig b/meta/recipes-bsp/formfactor/files/omap-3430ldp/machconfig
deleted file mode 100755
index 341ae1c..0000000
--- a/meta/recipes-bsp/formfactor/files/omap-3430ldp/machconfig
+++ /dev/null
@@ -1,15 +0,0 @@
-HAVE_TOUCHSCREEN=1
-HAVE_KEYBOARD=0
-HAVE_KEYBOARD_PORTRAIT=0
-HAVE_KEYBOARD_LANDSCAPE=0
- 
-DISPLAY_CAN_ROTATE=1
-DISPLAY_ORIENTATION=0
-DISPLAY_WIDTH_PIXELS=480
-DISPLAY_WIDTH_MM=56
-DISPLAY_HEIGHT_PIXELS=640
-DISPLAY_HEIGHT_MM=74
-DISPLAY_BPP=16
-#DISPLAY_DPI=220
-DISPLAY_DPI=150
-DISPLAY_SUBPIXEL_ORDER=rgb
diff --git a/meta/recipes-bsp/formfactor/files/omap-3430sdp/machconfig b/meta/recipes-bsp/formfactor/files/omap-3430sdp/machconfig
deleted file mode 100755
index 341ae1c..0000000
--- a/meta/recipes-bsp/formfactor/files/omap-3430sdp/machconfig
+++ /dev/null
@@ -1,15 +0,0 @@
-HAVE_TOUCHSCREEN=1
-HAVE_KEYBOARD=0
-HAVE_KEYBOARD_PORTRAIT=0
-HAVE_KEYBOARD_LANDSCAPE=0
- 
-DISPLAY_CAN_ROTATE=1
-DISPLAY_ORIENTATION=0
-DISPLAY_WIDTH_PIXELS=480
-DISPLAY_WIDTH_MM=56
-DISPLAY_HEIGHT_PIXELS=640
-DISPLAY_HEIGHT_MM=74
-DISPLAY_BPP=16
-#DISPLAY_DPI=220
-DISPLAY_DPI=150
-DISPLAY_SUBPIXEL_ORDER=rgb
diff --git a/meta/recipes-bsp/formfactor/files/spitz/machconfig b/meta/recipes-bsp/formfactor/files/spitz/machconfig
deleted file mode 100755
index a9649e0..0000000
--- a/meta/recipes-bsp/formfactor/files/spitz/machconfig
+++ /dev/null
@@ -1,15 +0,0 @@
-HAVE_TOUCHSCREEN=1
-HAVE_KEYBOARD=1
-HAVE_KEYBOARD_PORTRAIT=0
-HAVE_KEYBOARD_LANDSCAPE=1
- 
-DISPLAY_CAN_ROTATE=1
-DISPLAY_ORIENTATION=270
-DISPLAY_WIDTH_PIXELS=480
-DISPLAY_WIDTH_MM=56
-DISPLAY_HEIGHT_PIXELS=640
-DISPLAY_HEIGHT_MM=74
-DISPLAY_BPP=16
-#DISPLAY_DPI=220
-DISPLAY_DPI=150
-DISPLAY_SUBPIXEL_ORDER=rgb
diff --git a/meta/recipes-bsp/formfactor/files/zylonite/machconfig b/meta/recipes-bsp/formfactor/files/zylonite/machconfig
deleted file mode 100755
index 89f7f0c..0000000
--- a/meta/recipes-bsp/formfactor/files/zylonite/machconfig
+++ /dev/null
@@ -1,12 +0,0 @@
-HAVE_TOUCHSCREEN=1
-HAVE_KEYBOARD=0
-HAVE_KEYBOARD_PORTRAIT=0
-HAVE_KEYBOARD_LANDSCAPE=0
- 
-DISPLAY_CAN_ROTATE=0
-DISPLAY_ORIENTATION=0
-DISPLAY_WIDTH_PIXELS=480
-DISPLAY_HEIGHT_PIXELS=640
-DISPLAY_BPP=16
-#DISPLAY_DPI=220
-DISPLAY_DPI=150
diff --git a/meta/recipes-bsp/keymaps/files/akita/keymap-2.4.map b/meta/recipes-bsp/keymaps/files/akita/keymap-2.4.map
deleted file mode 100644
index e633997..0000000
--- a/meta/recipes-bsp/keymaps/files/akita/keymap-2.4.map
+++ /dev/null
@@ -1,128 +0,0 @@
-keymaps 0-2,4-5,8
-keycode   1 = +a                +A                +a                Control_a        Control_a       
-keycode   2 = +b                +B                underscore       Control_b        Control_b       
-keycode   3 = +c                +C                +c                Control_c        Control_c       
-keycode   4 = +d                +D                +d                Control_d        Control_d       
-keycode   5 = +e                +E                equal            Control_e        Control_e       
-keycode   6 = +f                +F                backslash        Control_f        Control_f       
-keycode   7 = +g                +G                semicolon        Control_g        Control_g       
-keycode   8 = +h                +H                colon            BackSpace        BackSpace       
-keycode   9 = +i                +I                +i                Tab              Tab             
-keycode  10 = +j                +J                asterisk         Linefeed         Linefeed        
-keycode  11 = +k                +K                backslash        Control_k        Control_k       
-keycode  12 = +l                +L                bar              Control_l        Control_l       
-keycode  13 = +m                +M                +m                Control_m        Control_m       
-keycode  14 = +n                +N                +n                Control_n        Control_n       
-keycode  15 = +o                +O                +o                Control_o        Control_o       
-keycode  16 = +p                +P                +p                Control_p        Control_p       
-keycode  17 = +q                +Q                +q                Control_q        Control_q       
-keycode  18 = +r                +R                plus             Control_r        Control_r       
-keycode  19 = +s                +S                +s                Control_s        Control_s       
-keycode  20 = +t                +T                bracketleft      Control_t        Control_t       
-keycode  21 = +u                +U                +u                Control_u        Control_u       
-keycode  22 = +v                +V                +v                Control_v        Control_v       
-keycode  23 = +w                +W                asciicircum      Control_w        Control_w       
-keycode  24 = +x                +X                +x                Control_x        Control_x       
-keycode  25 = +y                +Y                bracketright     Control_y        Control_y       
-keycode  26 = +z                +Z                +z                Control_z        Control_z       
-keycode  27 = Shift            Shift            Shift            Shift            Shift           
-keycode  28 = Return           Return           Return           Return           Return          
-keycode  29 = F11              F11              F11              F11              F11             
-keycode  30 = AltGr            AltGr            AltGr            AltGr            AltGr           
-keycode  31 = BackSpace        BackSpace        Delete           BackSpace        BackSpace       
-keycode  32 = Num_Lock         Num_Lock         Num_Lock         Num_Lock         Num_Lock        
-keycode  33 = VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol      
-keycode  34 = Escape           Escape           Escape           Escape           Escape          
-keycode  35 = Left             Left             Left             Left             Left		Decr_Console            
-keycode  36 = Up               Up               PageUp           Up               Up              
-keycode  37 = Down             Down             PageDown         Down             Down            
-keycode  38 = Right            Right            Right             Right            Right	Incr_Console           
-keycode  39 = Return           Return           Return           Return           Return          
-keycode  40 = F12              VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol      
-keycode  41 = one              exclam           VoidSymbol       VoidSymbol       VoidSymbol 	Console_1      
-keycode  42 = two              quotedbl         VoidSymbol       VoidSymbol       VoidSymbol 	Console_2 	
-keycode  43 = three            numbersign       VoidSymbol       VoidSymbol       VoidSymbol 	Console_3 	
-keycode  44 = four             dollar           VoidSymbol       VoidSymbol       VoidSymbol  	Console_4 	
-keycode  45 = five             percent          VoidSymbol       VoidSymbol       VoidSymbol  	Console_5 	
-keycode  46 = six              ampersand        VoidSymbol       VoidSymbol       VoidSymbol      
-keycode  47 = seven            apostrophe       VoidSymbol       VoidSymbol       VoidSymbol      
-keycode  48 = eight            parenleft        VoidSymbol       VoidSymbol       VoidSymbol      
-keycode  49 = nine             parenright       VoidSymbol       VoidSymbol       VoidSymbol      
-keycode  50 = zero             asciitilde       VoidSymbol       VoidSymbol       VoidSymbol      
-keycode  51 = minus            equal            VoidSymbol       VoidSymbol       VoidSymbol      
-keycode  52 = asciicircum      asciitilde       VoidSymbol       VoidSymbol       VoidSymbol      
-keycode  53 = backslash        bar              VoidSymbol       VoidSymbol       VoidSymbol      
-keycode  54 = bracketleft      braceleft        VoidSymbol       VoidSymbol       VoidSymbol      
-keycode  55 = at               grave            VoidSymbol       VoidSymbol       VoidSymbol      
-keycode  56 = Control          Control          Control          Control          Control         
-keycode  57 = Alt              Alt              Alt              Alt              Alt             
-keycode  58 = Control          Control          Control          Control          Control         
-keycode  59 = minus            VoidSymbol       at	         VoidSymbol       VoidSymbol      
-keycode  60 = Shift_Lock       Shift_Lock       Shift_Lock       Shift_Lock       Shift_Lock      
-keycode  61 = VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol      
-keycode  62 = VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol      
-keycode  63 = comma            slash            less             VoidSymbol       VoidSymbol      
-keycode  64 = VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol      
-keycode  65 = Tab              Tab              Caps_Lock        Tab              Tab             
-keycode  66 = VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol      
-keycode  67 = VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol      
-keycode  68 = VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol      
-keycode  69 = Alt	       VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol      
-keycode  70 = slash            VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol      
-keycode  71 = KP_1             KP_1             KP_1             KP_1             KP_1            
-keycode  72 = KP_2             KP_2             KP_2             KP_2             KP_2            
-keycode  73 = KP_3             KP_3             KP_3             KP_3             KP_3            
-keycode  74 = KP_4             KP_4             KP_4             KP_4             KP_4            
-keycode  75 = KP_5             KP_5             KP_5             KP_5             KP_5            
-keycode  76 = KP_6             KP_6             KP_6             KP_6             KP_6            
-keycode  77 = KP_7             KP_7             KP_7             KP_7             KP_7            
-keycode  78 = KP_8             KP_8             KP_8             KP_8             KP_8            
-keycode  79 = KP_9             KP_9             KP_9             KP_9             KP_9            
-keycode  80 = KP_0             KP_0             KP_0             KP_0             KP_0            
-keycode  81 = Delete           Delete           Delete           Delete           Delete          
-keycode  82 = KP_Divide        KP_Divide        KP_Divide        KP_Divide        KP_Divide       
-keycode  83 = KP_Multiply      KP_Multiply      KP_Multiply      KP_Multiply      KP_Multiply     
-keycode  84 = Return           Return           Return           Return           Return          
-keycode  85 = KP_Subtract      KP_Subtract      KP_Subtract      KP_Subtract      KP_Subtract     
-keycode  86 = KP_Add           KP_Add           KP_Add           KP_Add           KP_Add          
-keycode  87 = KP_Enter         KP_Enter         KP_Enter         KP_Enter         KP_Enter        
-keycode  88 = F9               F9               F9               F9               F9              
-keycode  89 = F10              F10              F10              F10              F10             
-keycode  90 = F13              F13              F13              F13              F13             
-keycode  91 = VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol      
-keycode  92 = space            space            space            space            space           
-keycode  93 = KP_Period        KP_Period        KP_Period        KP_Period        KP_Period       
-keycode  94 = Escape           Escape           Escape           Escape
-keycode  95 = semicolon        plus             VoidSymbol       VoidSymbol       VoidSymbol      
-keycode  96 = colon            asterisk         VoidSymbol       VoidSymbol       VoidSymbol      
-keycode  97 = bracketright     braceright       VoidSymbol       VoidSymbol       VoidSymbol      
-keycode  98 = comma            less             VoidSymbol       VoidSymbol       VoidSymbol      
-keycode  99 = period           greater          VoidSymbol       VoidSymbol       VoidSymbol      
-keycode 100 = slash            question         VoidSymbol       VoidSymbol       VoidSymbol      
-keycode 101 = underscore       underscore       VoidSymbol       VoidSymbol       VoidSymbol      
-keycode 102 = F15	       VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol      
-keycode 103 = period           question         greater          VoidSymbol       VoidSymbol      
-keycode 104 = Find             Find             Find             Find             Find            
-keycode 105 = Select           Select           Select           Select           Select          
-keycode 106 = Prior            Scroll_Backward  Prior            Prior            Prior           
-keycode 107 = Next             Scroll_Forward   Next             Next             Next            
-keycode 108 = VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol      
-keycode 109 = VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol      
-keycode 110 = VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol      
-keycode 111 = VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol      
-keycode 112 = Shift            Shift            Shift            Shift            Shift      
-keycode 113 = VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol      
-keycode 114 = VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol      
-keycode 115 = VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol      
-keycode 116 = VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol      
-keycode 117 = Control          Control          Control          Control          Control         
-keycode 118 = VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol      
-keycode 119 = VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol      
-keycode 120 = VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol      
-keycode 121 = VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol      
-keycode 122 = VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol      
-keycode 123 = VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol      
-keycode 124 = VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol      
-keycode 125 = Up               Up               Up               Up
-keycode 126 = Down             Down             Down             Down
-keycode 127 = VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol      
diff --git a/meta/recipes-bsp/keymaps/files/akita/keymap-2.6.map b/meta/recipes-bsp/keymaps/files/akita/keymap-2.6.map
deleted file mode 100644
index 11a0e8b..0000000
--- a/meta/recipes-bsp/keymaps/files/akita/keymap-2.6.map
+++ /dev/null
@@ -1,228 +0,0 @@
-# Default kernel keymap. This uses 7 modifier combinations.
-keymaps 0-2,4-5,8,12
-# Change the above line into
-#	keymaps 0-2,4-6,8,12
-# in case you want the entries
-#	altgr   control keycode  83 = Boot            
-#	altgr   control keycode 111 = Boot            
-# below.
-#
-keycode   1 =        
-keycode   2 = one              exclam    
-	control alt     keycode  2 = Console_1
-keycode   3 = two              quotedbl			
-	control alt     keycode  3 = Console_2
-keycode   4 = three            numbersign      
-	control alt     keycode  4 = Console_3
-keycode   5 = four             dollar           
-	control alt     keycode  5 = Console_4
-keycode   6 = five             percent         
-	control alt     keycode  6 = Console_5
-keycode   7 = six              ampersand     
-	control alt     keycode  7 = Console_6
-keycode   8 = seven            apostrophe
-keycode   9 = eight            parenleft
-keycode  10 = nine             parenright
-keycode  11 = zero             asciitilde
-keycode  12 = minus            at
-	altgr keycode 12 = at
-keycode  13 = 
-keycode  14 = BackSpace
-	altgr keycode 14 = Delete
-keycode  15 = Tab
-	altgr keycode 15 = Caps_Lock
-keycode  16 = q               
-keycode  17 = w               
-	altgr keycode 17 = asciicircum
-keycode  18 = e
-	altgr keycode 18 = equal
-keycode  19 = r          
-	altgr keycode 19 = plus     
-keycode  20 = t               
-	altgr keycode 20 = bracketleft
-keycode  21 = y               
-	altgr keycode 21 = bracketright
-keycode  22 = u      
-	altgr keycode 22 = braceleft         
-keycode  23 = i           
-	altgr keycode 23 = braceright    
-keycode  24 = o               
-keycode  25 = p               
-keycode  26 = 
-keycode  27 =
-keycode  28 = Return          
-keycode  29 = Control         
-keycode  30 = a
-keycode  31 = s               
-keycode  32 = d
-keycode  33 = f
-	altgr keycode 33 = backslash             
-keycode  34 = g               
-	altgr keycode 34 = semicolon
-keycode  35 = h         
-	altgr keycode 35 = colon      
-keycode  36 = j        
-	altgr keycode 36 = asterisk       
-keycode  37 = k   
-    altgr keycode 37 = backslash
-keycode  38 = l         
-	altgr keycode 38 = bar      
-keycode  39 =  
-keycode  40 = 
-keycode  41 =     
-keycode  42 = Shift           
-keycode  43 =  
-keycode  44 = z               
-keycode  45 = x               
-keycode  46 = c
-keycode  47 = v               
-keycode  48 = b
-	altgr keycode 48 = underscore
-keycode  49 = n               
-keycode  50 = m               
-keycode  51 = comma		slash
-	altgr keycode 51 = less
-keycode  52 = period           question         
-	altgr     keycode  52 = greater     
-keycode  53 =      
-keycode  54 = Shift           
-keycode  55 = 
-keycode  56 = Alt             
-keycode  57 = space            space           
-	control keycode  57 = nul   
-keycode 59 = F9
-keycode 60 = F10
-keycode 61 = AltGr
-keycode 62 = Escape
-keycode 63 = Return
-keycode 64 = Escape
-keycode 65 = Down
-keycode 66 = Up
-keycode 67 = Control
-keycode 68 = F13
-keycode 79 = F15
-keycode 80 = F16
-keycode 82 = F17
-keycode 87 = Return
-keycode 88 = F11	          
-keycode 97 = Control  
-keycode 99 = F12       
-keycode 103 = Up              
-	altgr     keycode 103 = PageUp
-keycode 105 = Left            
-	altgr     keycode 105 = Decr_Console
-keycode 106 = Right           
-	altgr     keycode 106 = Incr_Console
-keycode 108 = Down  
-	altgr     keycode 108 = PageDown
-	
-
-# LCD Softkeys as represented by zaurusd	
-keycode 82 = F5	
-keycode 79 = F15		# Home
-keycode 80 = F6
-keycode 81 = F16		# Email
-keycode 75 = F7
-keycode 76 = F17		# Addresses
-keycode 77 = F8
-keycode 71 = F18		# Calendar
-keycode 72 = F9
-keycode 73 = F19		# Book
-keycode 78 = F10
-
-string F1 = "\033[[A"
-string F2 = "\033[[B"
-string F3 = "\033[[C"
-string F4 = "\033[[D"
-string F5 = "\033[[E"
-string F6 = "\033[17~"
-string F7 = "\033[18~"
-string F8 = "\033[19~"
-string F9 = "\033[20~"
-string F10 = "\033[21~"
-string F11 = "\033[23~"
-string F12 = "\033[24~"
-string F13 = "\033[25~"
-string F14 = "\033[26~"
-string F15 = "\033[28~"
-string F16 = "\033[29~"
-string F17 = "\033[31~"
-string F18 = "\033[32~"
-string F19 = "\033[33~"
-string F20 = "\033[34~"
-string Find = "\033[1~"
-string Insert = "\033[2~"
-string Remove = "\033[3~"
-string Select = "\033[4~"
-string Prior = "\033[5~"
-string Next = "\033[6~"
-string Macro = "\033[M"
-string Pause = "\033[P"
-compose '`' 'A' to '¿'
-compose '`' 'a' to '‡'
-compose '\'' 'A' to '¡'
-compose '\'' 'a' to '·'
-compose '^' 'A' to '¬'
-compose '^' 'a' to '‚'
-compose '~' 'A' to '√'
-compose '~' 'a' to '„'
-compose '"' 'A' to 'ƒ'
-compose '"' 'a' to '‰'
-compose 'O' 'A' to '≈'
-compose 'o' 'a' to 'Â'
-compose '0' 'A' to '≈'
-compose '0' 'a' to 'Â'
-compose 'A' 'A' to '≈'
-compose 'a' 'a' to 'Â'
-compose 'A' 'E' to '∆'
-compose 'a' 'e' to 'Ê'
-compose ',' 'C' to '«'
-compose ',' 'c' to 'Á'
-compose '`' 'E' to '»'
-compose '`' 'e' to 'Ë'
-compose '\'' 'E' to '…'
-compose '\'' 'e' to 'È'
-compose '^' 'E' to ' '
-compose '^' 'e' to 'Í'
-compose '"' 'E' to 'À'
-compose '"' 'e' to 'Î'
-compose '`' 'I' to 'Ã'
-compose '`' 'i' to 'Ï'
-compose '\'' 'I' to 'Õ'
-compose '\'' 'i' to 'Ì'
-compose '^' 'I' to 'Œ'
-compose '^' 'i' to 'Ó'
-compose '"' 'I' to 'œ'
-compose '"' 'i' to 'Ô'
-compose '-' 'D' to '–'
-compose '-' 'd' to ''
-compose '~' 'N' to '—'
-compose '~' 'n' to 'Ò'
-compose '`' 'O' to '“'
-compose '`' 'o' to 'Ú'
-compose '\'' 'O' to '”'
-compose '\'' 'o' to 'Û'
-compose '^' 'O' to '‘'
-compose '^' 'o' to 'Ù'
-compose '~' 'O' to '’'
-compose '~' 'o' to 'ı'
-compose '"' 'O' to '÷'
-compose '"' 'o' to 'ˆ'
-compose '/' 'O' to 'ÿ'
-compose '/' 'o' to '¯'
-compose '`' 'U' to 'Ÿ'
-compose '`' 'u' to '˘'
-compose '\'' 'U' to '⁄'
-compose '\'' 'u' to '˙'
-compose '^' 'U' to '€'
-compose '^' 'u' to '˚'
-compose '"' 'U' to '‹'
-compose '"' 'u' to '¸'
-compose '\'' 'Y' to '›'
-compose '\'' 'y' to '˝'
-compose 'T' 'H' to 'ﬁ'
-compose 't' 'h' to '˛'
-compose 's' 's' to 'ﬂ'
-compose '"' 'y' to 'ˇ'
-compose 's' 'z' to 'ﬂ'
-compose 'i' 'j' to 'ˇ'
diff --git a/meta/recipes-bsp/keymaps/files/c7x0/keymap-2.6.map b/meta/recipes-bsp/keymaps/files/c7x0/keymap-2.6.map
deleted file mode 100755
index 6fc3a9a..0000000
--- a/meta/recipes-bsp/keymaps/files/c7x0/keymap-2.6.map
+++ /dev/null
@@ -1,213 +0,0 @@
-# Default kernel keymap. This uses 7 modifier combinations.
-keymaps 0-2,4-5,8,12
-# Change the above line into
-#	keymaps 0-2,4-6,8,12
-# in case you want the entries
-#	altgr   control keycode  83 = Boot            
-#	altgr   control keycode 111 = Boot            
-# below.
-#
-keycode   1 =        
-keycode   2 = one              exclam    
-	control alt     keycode  2 = Console_1
-keycode   3 = two              quotedbl			
-	control alt     keycode  3 = Console_2
-keycode   4 = three            numbersign      
-	control alt     keycode  4 = Console_3
-keycode   5 = four             dollar           
-	control alt     keycode  5 = Console_4
-keycode   6 = five             percent         
-	control alt     keycode  6 = Console_5
-keycode   7 = six              ampersand     
-	control alt     keycode  7 = Console_6
-keycode   8 = seven            apostrophe
-keycode   9 = eight            parenleft
-keycode  10 = nine             parenright
-keycode  11 = zero             asciitilde
-keycode  12 = minus            at
-	altgr keycode 12 = at
-keycode  13 = 
-keycode  14 = BackSpace
-	altgr keycode 14 = Delete
-keycode  15 = Tab
-	altgr keycode 15 = Caps_Lock
-keycode  16 = q               
-keycode  17 = w               
-	altgr keycode 17 = asciicircum
-keycode  18 = e
-	altgr keycode 18 = equal
-keycode  19 = r          
-	altgr keycode 19 = plus     
-keycode  20 = t               
-	altgr keycode 20 = bracketleft
-keycode  21 = y               
-	altgr keycode 21 = bracketright
-keycode  22 = u      
-	altgr keycode 22 = braceleft         
-keycode  23 = i           
-	altgr keycode 23 = braceright    
-keycode  24 = o               
-keycode  25 = p               
-keycode  26 = 
-keycode  27 =
-keycode  28 = Return          
-keycode  29 = Control         
-keycode  30 = a
-keycode  31 = s               
-keycode  32 = d
-keycode  33 = f
-	altgr keycode 33 = backslash             
-keycode  34 = g               
-	altgr keycode 34 = semicolon
-keycode  35 = h         
-	altgr keycode 35 = colon      
-keycode  36 = j        
-	altgr keycode 36 = asterisk       
-keycode  37 = k   
-    altgr keycode 37 = backslash
-keycode  38 = l         
-	altgr keycode 38 = bar      
-keycode  39 =  
-keycode  40 = 
-keycode  41 =     
-keycode  42 = Shift           
-keycode  43 =  
-keycode  44 = z               
-keycode  45 = x               
-keycode  46 = c
-keycode  47 = v               
-keycode  48 = b
-	altgr keycode 48 = underscore
-keycode  49 = n               
-keycode  50 = m               
-keycode  51 = comma		slash
-	altgr keycode 51 = less
-keycode  52 = period           question         
-	altgr     keycode  52 = greater     
-keycode  53 =      
-keycode  54 = Shift           
-keycode  55 = 
-keycode  56 = Alt             
-keycode  57 = space            space           
-	control keycode  57 = nul   
-keycode 59 = F9
-keycode 60 = F10
-keycode 61 = AltGr
-keycode 62 = Escape
-keycode 63 = Return
-keycode 64 = Escape
-keycode 65 = Down
-keycode 66 = Up
-keycode 67 = Control
-keycode 68 = F13
-keycode 79 = F15
-keycode 80 = F16
-keycode 82 = F17
-keycode 87 = Return
-keycode 88 = F11	          
-keycode 97 = Control  
-keycode 99 = F12       
-keycode 103 = Up              
-	altgr     keycode 103 = PageUp
-keycode 105 = Left            
-	altgr     keycode 105 = Decr_Console
-keycode 106 = Right           
-	altgr     keycode 106 = Incr_Console
-keycode 108 = Down  
-	altgr     keycode 108 = PageDown
-string F1 = "\033[[A"
-string F2 = "\033[[B"
-string F3 = "\033[[C"
-string F4 = "\033[[D"
-string F5 = "\033[[E"
-string F6 = "\033[17~"
-string F7 = "\033[18~"
-string F8 = "\033[19~"
-string F9 = "\033[20~"
-string F10 = "\033[21~"
-string F11 = "\033[23~"
-string F12 = "\033[24~"
-string F13 = "\033[25~"
-string F14 = "\033[26~"
-string F15 = "\033[28~"
-string F16 = "\033[29~"
-string F17 = "\033[31~"
-string F18 = "\033[32~"
-string F19 = "\033[33~"
-string F20 = "\033[34~"
-string Find = "\033[1~"
-string Insert = "\033[2~"
-string Remove = "\033[3~"
-string Select = "\033[4~"
-string Prior = "\033[5~"
-string Next = "\033[6~"
-string Macro = "\033[M"
-string Pause = "\033[P"
-compose '`' 'A' to '¿'
-compose '`' 'a' to '‡'
-compose '\'' 'A' to '¡'
-compose '\'' 'a' to '·'
-compose '^' 'A' to '¬'
-compose '^' 'a' to '‚'
-compose '~' 'A' to '√'
-compose '~' 'a' to '„'
-compose '"' 'A' to 'ƒ'
-compose '"' 'a' to '‰'
-compose 'O' 'A' to '≈'
-compose 'o' 'a' to 'Â'
-compose '0' 'A' to '≈'
-compose '0' 'a' to 'Â'
-compose 'A' 'A' to '≈'
-compose 'a' 'a' to 'Â'
-compose 'A' 'E' to '∆'
-compose 'a' 'e' to 'Ê'
-compose ',' 'C' to '«'
-compose ',' 'c' to 'Á'
-compose '`' 'E' to '»'
-compose '`' 'e' to 'Ë'
-compose '\'' 'E' to '…'
-compose '\'' 'e' to 'È'
-compose '^' 'E' to ' '
-compose '^' 'e' to 'Í'
-compose '"' 'E' to 'À'
-compose '"' 'e' to 'Î'
-compose '`' 'I' to 'Ã'
-compose '`' 'i' to 'Ï'
-compose '\'' 'I' to 'Õ'
-compose '\'' 'i' to 'Ì'
-compose '^' 'I' to 'Œ'
-compose '^' 'i' to 'Ó'
-compose '"' 'I' to 'œ'
-compose '"' 'i' to 'Ô'
-compose '-' 'D' to '–'
-compose '-' 'd' to ''
-compose '~' 'N' to '—'
-compose '~' 'n' to 'Ò'
-compose '`' 'O' to '“'
-compose '`' 'o' to 'Ú'
-compose '\'' 'O' to '”'
-compose '\'' 'o' to 'Û'
-compose '^' 'O' to '‘'
-compose '^' 'o' to 'Ù'
-compose '~' 'O' to '’'
-compose '~' 'o' to 'ı'
-compose '"' 'O' to '÷'
-compose '"' 'o' to 'ˆ'
-compose '/' 'O' to 'ÿ'
-compose '/' 'o' to '¯'
-compose '`' 'U' to 'Ÿ'
-compose '`' 'u' to '˘'
-compose '\'' 'U' to '⁄'
-compose '\'' 'u' to '˙'
-compose '^' 'U' to '€'
-compose '^' 'u' to '˚'
-compose '"' 'U' to '‹'
-compose '"' 'u' to '¸'
-compose '\'' 'Y' to '›'
-compose '\'' 'y' to '˝'
-compose 'T' 'H' to 'ﬁ'
-compose 't' 'h' to '˛'
-compose 's' 's' to 'ﬂ'
-compose '"' 'y' to 'ˇ'
-compose 's' 'z' to 'ﬂ'
-compose 'i' 'j' to 'ˇ'
diff --git a/meta/recipes-bsp/keymaps/files/collie/keymap-2.4.map b/meta/recipes-bsp/keymaps/files/collie/keymap-2.4.map
deleted file mode 100644
index 4cd8325..0000000
--- a/meta/recipes-bsp/keymaps/files/collie/keymap-2.4.map
+++ /dev/null
@@ -1,114 +0,0 @@
-keymaps 0-1,4-5
-alt_is_meta
-keycode   1 = a               
-keycode   2 = b               
-keycode   3 = c               
-keycode   4 = d               
-keycode   5 = e               
-keycode   6 = f               
-keycode   7 = g               
-keycode   8 = h               
-keycode   9 = i               
-keycode  10 = j               
-keycode  11 = k               
-keycode  12 = l               
-keycode  13 = m               
-keycode  14 = n               
-keycode  15 = o               
-keycode  16 = p               
-keycode  17 = q               
-keycode  18 = r               
-keycode  19 = s               
-keycode  20 = t               
-keycode  21 = u               
-keycode  22 = v               
-keycode  23 = w               
-keycode  24 = x               
-keycode  25 = y               
-keycode  26 = z               
-keycode  27 = Shift           
-keycode  28 = Return          
-keycode  29 = F2              
-keycode  30 =
-keycode  31 = BackSpace       
-keycode  32 = bar             
-keycode  33 =
-keycode  34 = Escape          
-keycode  35 = Left            
-	control	keycode  35 = Decr_Console    
-keycode  36 = Up              
-keycode  37 = Down            
-keycode  38 = Right           
-	control	keycode  38 = Incr_Console    
-keycode  39 = Return          
-keycode  40 =
-keycode  41 = one             
-keycode  42 = two             
-keycode  43 = three           
-keycode  44 = four            
-keycode  45 = five            
-keycode  46 = six             
-keycode  47 = seven           
-keycode  48 = eight           
-keycode  49 = nine            
-keycode  50 = zero            
-keycode  51 = +adiaeresis      
-keycode  52 = +udiaeresis      
-keycode  53 = +odiaeresis      
-keycode  54 = +Adiaeresis      
-keycode  55 = +Udiaeresis      
-keycode  56 = +Odiaeresis      
-keycode  57 = +ssharp          
-keycode  58 = minus           
-keycode  59 = plus            
-keycode  60 = Shift_Lock      
-keycode  61 = at              
-keycode  62 = question        
-keycode  63 = comma           
-keycode  64 = period          
-keycode  65 = Tab             
-keycode  66 = F5              
-keycode  67 = F6              
-keycode  68 = F7              
-keycode  69 = slash           
-keycode  70 = apostrophe      
-keycode  71 = semicolon       
-keycode  72 = quotedbl        
-keycode  73 = colon           
-keycode  74 = numbersign      
-keycode  75 = dollar          
-keycode  76 = percent         
-keycode  77 = underscore      
-keycode  78 = ampersand       
-keycode  79 = asterisk        
-keycode  80 = parenleft       
-keycode  81 = Delete          
-keycode  82 = F10             
-keycode  83 = equal           
-keycode  84 = parenright      
-keycode  85 = asciitilde      
-keycode  86 = less            
-keycode  87 = greater         
-keycode  88 = Control         
-keycode  89 = Alt             
-keycode  90 =
-keycode  91 = space           
-	control	keycode  91 = nul             
-keycode  92 = space           
-	control	keycode  92 = nul             
-keycode  93 =
-keycode  94 = exclam          
-keycode  95 =
-keycode  96 =
-keycode  97 =
-keycode  98 =
-keycode  99 =
-keycode 100 =
-keycode 101 =
-keycode 102 =
-keycode 103 = Shift           
-keycode 104 = Control         
-keycode 105 = Control         
-keycode 106 = Alt             
-keycode 107 = Alt             
-keycode 108 = AltGr           
diff --git a/meta/recipes-bsp/keymaps/files/collie/keymap-2.6.map b/meta/recipes-bsp/keymaps/files/collie/keymap-2.6.map
deleted file mode 100644
index 13eb7d2..0000000
--- a/meta/recipes-bsp/keymaps/files/collie/keymap-2.6.map
+++ /dev/null
@@ -1,262 +0,0 @@
-# Note:
-# The way in which the modifiers are handled are quite different
-# than how they were handled in the 2.4.6-rmk1-np2-embedix kernel.
-# 
-# Here, we simply pass up Fn as Control, and the german accent key
-# as Altgr, and simply use a proper keymap.  Said keymap is as
-# follows.
-# keymaps 0-2,4-5,8,12,20
-keycode  14 = BackSpace
-	shift   keycode  14 = BackSpace
-	control keycode  14 = Delete
-	shiftl  control keycode  14 = bracketleft
-	control shiftr  keycode  14 = bracketleft
-keycode  15 = Tab              Tab             
-	shift   keycode  15 = backslash
-	control keycode  15 = Caps_Lock
-	shiftl  control keycode  15 = Caps_Lock
-	control shiftr  keycode  15 = Caps_Lock
-keycode  16 = q               
-	control	keycode  16 = one             
-	shiftl	control	keycode  16 = Control_q       
-	control	shiftr	keycode  16 = Meta_q       
-keycode  17 = w               
-	control	keycode  17 = two       
-	shiftl	control	keycode  17 = Control_w       
-	control	shiftr	keycode  17 = Meta_w       
-keycode  18 = e               
-	control	keycode  18 = three       
-	shiftl	control	keycode  18 = Control_e       
-	control	shiftr	keycode  18 = Meta_e       
-keycode  19 = r               
-	control	keycode  19 = four       
-	shiftr	control	keycode  19 = Control_r       
-	control	shiftl	keycode  19 = Meta_r       
-keycode  20 = t               
-	control	keycode  20 = five       
-	shiftl	control	keycode  20 = Control_t       
-	control	shiftr	keycode  20 = Meta_t       
-keycode  21 = y               
-	control	keycode  21 = six       
-	shiftl	control	keycode  21 = Control_y       
-	control	shiftr	keycode  21 = Meta_y       
-keycode  22 = u               
-	control	keycode  22 = seven       
-	shiftl	control	keycode  22 = Control_u       
-	control	shiftr	keycode  22 = Meta_u       
-keycode  23 = i               
-	control	keycode  23 = eight             
-	shiftl	control	keycode  23 = Control_i             
-	control	shiftr	keycode  23 = Meta_i             
-keycode  24 = o               
-	control	keycode  24 = nine       
-	shiftl	control	keycode  24 = Control_o       
-	control	shiftr	keycode  24 = Meta_o       
-keycode  25 = p               
-	control	keycode  25 = zero       
-	shiftl	control	keycode  25 = Control_p       
-	control	shiftr	keycode  25 = Meta_p       
-keycode  28 = Return          
-	control keycode  28 = greater
-	shiftl  control keycode  28 = braceright
-	control shiftr  keycode  28 = braceright
-keycode  29 = Control         
-keycode  30 = a               
-	control	keycode  30 = exclam       
-	shiftl	control	keycode  30 = Control_a       
-	control	shiftr	keycode  30 = Meta_a       
-keycode  31 = s               
-	control	keycode  31 = at       
-	shiftl	control	keycode  31 = Control_s       
-	control	shiftr	keycode  31 = Meta_s       
-keycode  32 = d               
-	control	keycode  32 = numbersign
-	shiftl	control	keycode  32 = Control_d       
-	control	shiftr	keycode  32 = Meta_d       
-keycode  33 = f               
-	control	keycode  33 = dollar       
-	shiftl	control	keycode  33 = Control_f       
-	control	shiftr	keycode  33 = Meta_f       
-keycode  34 = g               
-	control	keycode  34 = percent       
-	shiftl	control	keycode  34 = Control_g       
-	control	shiftr	keycode  34 = Meta_g       
-keycode  35 = h               
-	control	keycode  35 = underscore       
-	shiftl	control	keycode  35 = BackSpace       
-	control	shiftr	keycode  35 = BackSpace       
-keycode  36 = j               
-	control	keycode  36 = ampersand        
-	shiftl	control	keycode  36 = Linefeed        
-	control	shiftr	keycode  36 = Linefeed        
-keycode  37 = k               
-	control	keycode  37 = asterisk       
-	shiftl	control	keycode  37 = Control_k       
-	control	shiftr	keycode  37 = Meta_k       
-keycode  38 = l               
-	control	keycode  38 = bracketleft       
-	shiftl  control keycode  51 = parenleft
-	control shiftr  keycode  51 = parenleft
-keycode  40 = apostrophe       quotedbl
-	control	keycode  40 = asciitilde       
-	shiftl	control	keycode  40 = asciicircum
-	control	shiftr	keycode  40 = asciicircum       
-keycode  42 = Shift           
-keycode  44 = z               
-	control	keycode  44 = Control_z       
-	shiftl	control	keycode  44 = Control_z       
-	control	shiftr	keycode  44 = Meta_z       
-keycode  45 = x               
-	control	keycode  45 = Control_x       
-	shiftl	control	keycode  45 = Control_x       
-	control	shiftr	keycode  45 = Meta_x       
-keycode  46 = c               
-	control	keycode  46 = Control_c       
-	shiftl	control	keycode  46 = Control_c       
-	control	shiftr	keycode  46 = Meta_c       
-keycode  47 = v               
-	control	keycode  47 = Control_v       
-	shiftl	control	keycode  47 = Control_v       
-	control	shiftr	keycode  47 = Meta_v       
-## current location ##
-keycode  48 = b               
-	control	keycode  48 = minus       
-	shiftl	control	keycode  48 = Control_b       
-	control	shiftr	keycode  48 = Meta_b       
-keycode  49 = n               
-	control	keycode  49 = plus       
-	shiftl	control	keycode  49 = Control_n       
-	control	shiftr	keycode  49 = Meta_n       
-keycode  50 = m               
-	control	keycode  50 = equal       
-	shiftl	control	keycode  50 = Control_m       
-	control	shiftr	keycode  50 = Meta_m       
-keycode  51 = comma
-	shift   keycode  51 = semicolon
-	control keycode  51 = bracketright
-	shiftl  control keycode  51 = parenright
-	control shiftr  keycode  51 = parenright
-keycode  52 = period
-	shift   keycode  52 = colon
-	control keycode  52 = less
-	shiftl  control keycode  52 = braceleft
-	control shiftr  keycode  52 = braceleft
-keycode  53 = slash
-	shift   keycode  53 = question
-	control	keycode  53 = Num_Lock
-	shiftl  control keycode  53 = Num_Lock
-	control shiftr  keycode  53 = Num_Lock
-keycode  54 = AltGr
-keycode  55 = KP_Multiply     
-keycode  56 = Alt             
-keycode  57 = space
-	shift   keycode  57 = bar
-	control	keycode  57 = nul
-	shiftl  control keycode  57 = grave
-	control shiftr  keycode  57 = grave
-keycode  67 = Control         
-keycode  99 = Control_backslash
-	control keycode  99 = Control_backslash
-keycode 100 = AltGr           
-keycode 103 = Up              
-keycode 105 = Left            
-keycode 106 = Right           
-keycode 107 = Select          
-keycode 108 = Down            
-keycode 116  = Escape          
-string F1 = "\033[[A"
-string F2 = "\033[[B"
-string F3 = "\033[[C"
-string F4 = "\033[[D"
-string F5 = "\033[[E"
-string F6 = "\033[17~"
-string F7 = "\033[18~"
-string F8 = "\033[19~"
-string F9 = "\033[20~"
-string F10 = "\033[21~"
-string F11 = "\033[23~"
-string F12 = "\033[24~"
-string F13 = "\033[25~"
-string F14 = "\033[26~"
-string F15 = "\033[28~"
-string F16 = "\033[29~"
-string F17 = "\033[31~"
-string F18 = "\033[32~"
-string F19 = "\033[33~"
-string F20 = "\033[34~"
-string Find = "\033[1~"
-string Insert = "\033[2~"
-string Remove = "\033[3~"
-string Select = "\033[4~"
-string Prior = "\033[5~"
-string Next = "\033[6~"
-string Macro = "\033[M"
-string Pause = "\033[P"
-compose '`' 'A' to '¿'
-compose '`' 'a' to '‡'
-compose '\'' 'A' to '¡'
-compose '\'' 'a' to '·'
-compose '^' 'A' to '¬'
-compose '^' 'a' to '‚'
-compose '~' 'A' to '√'
-compose '~' 'a' to '„'
-compose '"' 'A' to 'ƒ'
-compose '"' 'a' to '‰'
-compose 'O' 'A' to '≈'
-compose 'o' 'a' to 'Â'
-compose '0' 'A' to '≈'
-compose '0' 'a' to 'Â'
-compose 'A' 'A' to '≈'
-compose 'a' 'a' to 'Â'
-compose 'A' 'E' to '∆'
-compose 'a' 'e' to 'Ê'
-compose ',' 'C' to '«'
-compose ',' 'c' to 'Á'
-compose '`' 'E' to '»'
-compose '`' 'e' to 'Ë'
-compose '\'' 'E' to '…'
-compose '\'' 'e' to 'È'
-compose '^' 'E' to ' '
-compose '^' 'e' to 'Í'
-compose '"' 'E' to 'À'
-compose '"' 'e' to 'Î'
-compose '`' 'I' to 'Ã'
-compose '`' 'i' to 'Ï'
-compose '\'' 'I' to 'Õ'
-compose '\'' 'i' to 'Ì'
-compose '^' 'I' to 'Œ'
-compose '^' 'i' to 'Ó'
-compose '"' 'I' to 'œ'
-compose '"' 'i' to 'Ô'
-compose '-' 'D' to '–'
-compose '-' 'd' to ''
-compose '~' 'N' to '—'
-compose '~' 'n' to 'Ò'
-compose '`' 'O' to '“'
-compose '`' 'o' to 'Ú'
-compose '\'' 'O' to '”'
-compose '\'' 'o' to 'Û'
-compose '^' 'O' to '‘'
-compose '^' 'o' to 'Ù'
-compose '~' 'O' to '’'
-compose '~' 'o' to 'ı'
-compose '"' 'O' to '÷'
-compose '"' 'o' to 'ˆ'
-compose '/' 'O' to 'ÿ'
-compose '/' 'o' to '¯'
-compose '`' 'U' to 'Ÿ'
-compose '`' 'u' to '˘'
-compose '\'' 'U' to '⁄'
-compose '\'' 'u' to '˙'
-compose '^' 'U' to '€'
-compose '^' 'u' to '˚'
-compose '"' 'U' to '‹'
-compose '"' 'u' to '¸'
-compose '\'' 'Y' to '›'
-compose '\'' 'y' to '˝'
-compose 'T' 'H' to 'ﬁ'
-compose 't' 'h' to '˛'
-compose 's' 's' to 'ﬂ'
-compose '"' 'y' to 'ˇ'
-compose 's' 'z' to 'ﬂ'
-compose 'i' 'j' to 'ˇ'
diff --git a/meta/recipes-bsp/keymaps/files/h2200/keymap-2.6.map b/meta/recipes-bsp/keymaps/files/h2200/keymap-2.6.map
deleted file mode 100644
index 8b4c43f..0000000
--- a/meta/recipes-bsp/keymaps/files/h2200/keymap-2.6.map
+++ /dev/null
@@ -1,17 +0,0 @@
-# Kernel keymap for h2200 keys
-
-# Apps keys
-keycode  67 = F9
-keycode  68 = F10
-keycode  87 = F11
-keycode  88 = F12
-
-# Joypad
-keycode 103 = Up
-keycode 105 = Left
-keycode 106 = Right
-keycode 108 = Down
-keycode  28 = Return
-
-# Power key
-keycode 116 = F34
diff --git a/meta/recipes-bsp/keymaps/files/htcuniversal/keymap-2.6.map b/meta/recipes-bsp/keymaps/files/htcuniversal/keymap-2.6.map
deleted file mode 100644
index 0d03675..0000000
--- a/meta/recipes-bsp/keymaps/files/htcuniversal/keymap-2.6.map
+++ /dev/null
@@ -1,20 +0,0 @@
-altgr keycode 2 = exclam
-altgr keycode 3 = at
-altgr keycode 4 = numbersign
-altgr keycode 6 = percent
-altgr keycode 7 = asciicircum
-altgr keycode 8 = ampersand
-altgr keycode 9 = asterisk
-altgr keycode 10 = parenleft
-altgr keycode 11 = parenright
-altgr keycode 12 = underscore
-altgr keycode 13 = plus
-altgr keycode 15 = tilde
-altgr keycode 24 = slash
-altgr keycode 25 = backslash
-altgr keycode 32 = pound
-altgr keycode 37 = quotedbl
-altgr keycode 38 = apostrophe
-altgr keycode 50 = question
-altgr keycode 51 = semicolon
-altgr keycode 52 = colon
diff --git a/meta/recipes-bsp/keymaps/files/jornada6xx/keymap-de.map b/meta/recipes-bsp/keymaps/files/jornada6xx/keymap-de.map
deleted file mode 100644
index 98083d2..0000000
--- a/meta/recipes-bsp/keymaps/files/jornada6xx/keymap-de.map
+++ /dev/null
@@ -1,597 +0,0 @@
-keymaps 0-6,8-10,12
-keycode   1 = Escape           Escape          
-keycode   2 = one              exclam		bar          
-keycode   3 = two              quotedbl         twosuperior     
-keycode   4 = three            section          threesuperior   
-	control	keycode   4 = Escape          
-	alt	keycode   4 = Meta_three      
-	control	alt	keycode   4 = Meta_Escape     
-keycode   5 = four             dollar          
-	alt	keycode   5 = Meta_four       
-	shift	alt	keycode   5 = Meta_dollar     
-keycode   6 = five             percent         
-	alt	keycode   6 = Meta_five       
-	shift	alt	keycode   6 = Meta_percent    
-keycode   7 = six              ampersand       
-	control	keycode   7 = Control_asciicircum
-	alt	keycode   7 = Meta_six        
-	shift	alt	keycode   7 = Meta_ampersand  
-keycode   8 = seven            slash            braceleft       
-	alt	keycode   8 = Meta_seven      
-	shift	alt	keycode   8 = Meta_slash      
-	altgr	alt	keycode   8 = Meta_braceleft  
-keycode   9 = eight            parenleft        bracketleft     
-	alt	keycode   9 = Meta_eight      
-	shift	alt	keycode   9 = Meta_parenleft  
-	altgr	alt	keycode   9 = Meta_bracketleft
-keycode  10 = nine             parenright       bracketright    
-	altgr	control	keycode  10 = Control_bracketright
-	alt	keycode  10 = Meta_nine       
-	shift	alt	keycode  10 = Meta_parenright 
-	altgr	alt	keycode  10 = Meta_bracketright
-keycode  11 = zero             equal            braceright      
-	alt	keycode  11 = Meta_zero       
-	shift	alt	keycode  11 = Meta_equal      
-	altgr	alt	keycode  11 = Meta_braceright 
-keycode  12 = ssharp           question         backslash       
-	altgr	control	keycode  12 = Control_backslash
-	shift	alt	keycode  12 = Meta_question   
-	altgr	alt	keycode  12 = Meta_backslash  
-keycode  13 = apostrophe       grave           
-	alt	keycode  13 = 0x08b4          
-	shift	alt	keycode  13 = Meta_grave      
-keycode  14 = Delete           Delete          
-	alt	keycode  14 = Meta_Delete     
-	shift	alt	keycode  14 = Meta_Delete     
-keycode  15 = Tab              Meta_Tab        
-	alt	keycode  15 = Meta_Tab        
-keycode  16 = +q               +Q               at              
-	control	keycode  16 = Control_q       
-	shift	control	keycode  16 = Control_q       
-	altgr	control	keycode  16 = nul             
-	alt	keycode  16 = Meta_q          
-	shift	alt	keycode  16 = Meta_Q          
-	altgr	alt	keycode  16 = Meta_at         
-	control	alt	keycode  16 = Meta_Control_q  
-keycode  17 = +w              
-	shift	keycode  17 = +W              
-	shift	altgr	keycode  17 = VoidSymbol      
-	control	keycode  17 = Control_w       
-	shift	control	keycode  17 = Control_w       
-	altgr	control	keycode  17 = Control_w       
-	alt	keycode  17 = Meta_w          
-	shift	alt	keycode  17 = Meta_W          
-	altgr	alt	keycode  17 = Meta_w          
-	control	alt	keycode  17 = Meta_Control_w  
-keycode  18 = +e               +E               currency        
-	control	keycode  18 = Control_e       
-	shift	control	keycode  18 = Control_e       
-	altgr	control	keycode  18 = Control_e       
-	alt	keycode  18 = Meta_e          
-	shift	alt	keycode  18 = Meta_E          
-	altgr	alt	keycode  18 = Meta_e          
-	control	alt	keycode  18 = Meta_Control_e  
-keycode  19 = +r              
-	shift	keycode  19 = +R              
-	shift	altgr	keycode  19 = VoidSymbol      
-	control	keycode  19 = Control_r       
-	shift	control	keycode  19 = Control_r       
-	altgr	control	keycode  19 = Control_r       
-	alt	keycode  19 = Meta_r          
-	shift	alt	keycode  19 = Meta_R          
-	altgr	alt	keycode  19 = Meta_r          
-	control	alt	keycode  19 = Meta_Control_r  
-keycode  20 = +t              
-	shift	keycode  20 = +T              
-	shift	altgr	keycode  20 = VoidSymbol      
-	control	keycode  20 = Control_t       
-	shift	control	keycode  20 = Control_t       
-	altgr	control	keycode  20 = Control_t       
-	alt	keycode  20 = Meta_t          
-	shift	alt	keycode  20 = Meta_T          
-	altgr	alt	keycode  20 = Meta_t          
-	control	alt	keycode  20 = Meta_Control_t  
-keycode  21 = +z              
-	shift	keycode  21 = +Z              
-	shift	altgr	keycode  21 = VoidSymbol      
-	control	keycode  21 = Control_z       
-	shift	control	keycode  21 = Control_z       
-	altgr	control	keycode  21 = Control_z       
-	alt	keycode  21 = Meta_z          
-	shift	alt	keycode  21 = Meta_Z          
-	altgr	alt	keycode  21 = Meta_z          
-	control	alt	keycode  21 = Meta_Control_z  
-keycode  22 = +u              
-	shift	keycode  22 = +U              
-	shift	altgr	keycode  22 = VoidSymbol      
-	control	keycode  22 = Control_u       
-	shift	control	keycode  22 = Control_u       
-	altgr	control	keycode  22 = Control_u       
-	alt	keycode  22 = Meta_u          
-	shift	alt	keycode  22 = Meta_U          
-	altgr	alt	keycode  22 = Meta_u          
-	control	alt	keycode  22 = Meta_Control_u  
-keycode  23 = +i              
-	shift	keycode  23 = +I              
-	shift	altgr	keycode  23 = VoidSymbol      
-	control	keycode  23 = Tab             
-	shift	control	keycode  23 = Tab             
-	altgr	control	keycode  23 = Tab             
-	alt	keycode  23 = Meta_i          
-	shift	alt	keycode  23 = Meta_I          
-	altgr	alt	keycode  23 = Meta_i          
-	control	alt	keycode  23 = Meta_Tab        
-keycode  24 = +o              
-	shift	keycode  24 = +O              
-	shift	altgr	keycode  24 = VoidSymbol      
-	control	keycode  24 = Control_o       
-	shift	control	keycode  24 = Control_o       
-	altgr	control	keycode  24 = Control_o       
-	alt	keycode  24 = Meta_o          
-	shift	alt	keycode  24 = Meta_O          
-	altgr	alt	keycode  24 = Meta_o          
-	control	alt	keycode  24 = Meta_Control_o  
-keycode  25 = +p              
-	shift	keycode  25 = +P              
-	shift	altgr	keycode  25 = VoidSymbol      
-	control	keycode  25 = Control_p       
-	shift	control	keycode  25 = Control_p       
-	altgr	control	keycode  25 = Control_p       
-	alt	keycode  25 = Meta_p          
-	shift	alt	keycode  25 = Meta_P          
-	altgr	alt	keycode  25 = Meta_p          
-	control	alt	keycode  25 = Meta_Control_p  
-keycode  26 = +udiaeresis      +Udiaeresis     
-keycode  27 = plus             asterisk         asciitilde      
-	alt	keycode  27 = Meta_plus       
-	shift	alt	keycode  27 = Meta_asterisk   
-keycode  28 = Return          
-	shift	altgr	keycode  28 = VoidSymbol      
-	alt	keycode  28 = Meta_Control_m  
-keycode  29 = Control        
-	shift	keycode  29 = Compose         
-	shift	altgr	keycode  29 = VoidSymbol      
-keycode  30 = +a              
-	shift	keycode  30 = +A              
-	shift	altgr	keycode  30 = VoidSymbol      
-	control	keycode  30 = Control_a       
-	shift	control	keycode  30 = Control_a       
-	altgr	control	keycode  30 = Control_a       
-	alt	keycode  30 = Meta_a          
-	shift	alt	keycode  30 = Meta_A          
-	altgr	alt	keycode  30 = Meta_a          
-	control	alt	keycode  30 = Meta_Control_a  
-keycode  31 = +s              
-	shift	keycode  31 = +S              
-	shift	altgr	keycode  31 = VoidSymbol      
-	control	keycode  31 = Control_s       
-	shift	control	keycode  31 = Control_s       
-	altgr	control	keycode  31 = Control_s       
-	alt	keycode  31 = Meta_s          
-	shift	alt	keycode  31 = Meta_S          
-	altgr	alt	keycode  31 = Meta_s          
-	control	alt	keycode  31 = Meta_Control_s  
-keycode  32 = +d              
-	shift	keycode  32 = +D              
-	shift	altgr	keycode  32 = VoidSymbol      
-	control	keycode  32 = Control_d       
-	shift	control	keycode  32 = Control_d       
-	altgr	control	keycode  32 = Control_d       
-	alt	keycode  32 = Meta_d          
-	shift	alt	keycode  32 = Meta_D          
-	altgr	alt	keycode  32 = Meta_d          
-	control	alt	keycode  32 = Meta_Control_d  
-keycode  33 = +f              
-	shift	keycode  33 = +F              
-	shift	altgr	keycode  33 = VoidSymbol      
-	control	keycode  33 = Control_f       
-	shift	control	keycode  33 = Control_f       
-	altgr	control	keycode  33 = Control_f       
-	alt	keycode  33 = Meta_f          
-	shift	alt	keycode  33 = Meta_F          
-	altgr	alt	keycode  33 = Meta_f          
-	control	alt	keycode  33 = Meta_Control_f  
-keycode  34 = +g              
-	shift	keycode  34 = +G              
-	shift	altgr	keycode  34 = VoidSymbol      
-	control	keycode  34 = Control_g       
-	shift	control	keycode  34 = Control_g       
-	altgr	control	keycode  34 = Control_g       
-	alt	keycode  34 = Meta_g          
-	shift	alt	keycode  34 = Meta_G          
-	altgr	alt	keycode  34 = Meta_g          
-	control	alt	keycode  34 = Meta_Control_g  
-keycode  35 = +h              
-	shift	keycode  35 = +H              
-	shift	altgr	keycode  35 = VoidSymbol      
-	control	keycode  35 = BackSpace       
-	shift	control	keycode  35 = BackSpace       
-	altgr	control	keycode  35 = BackSpace       
-	alt	keycode  35 = Meta_h          
-	shift	alt	keycode  35 = Meta_H          
-	altgr	alt	keycode  35 = Meta_h          
-	control	alt	keycode  35 = Meta_BackSpace  
-keycode  36 = +j              
-	shift	keycode  36 = +J              
-	shift	altgr	keycode  36 = VoidSymbol      
-	control	keycode  36 = Linefeed        
-	shift	control	keycode  36 = Linefeed        
-	altgr	control	keycode  36 = Linefeed        
-	alt	keycode  36 = Meta_j          
-	shift	alt	keycode  36 = Meta_J          
-	altgr	alt	keycode  36 = Meta_j          
-	control	alt	keycode  36 = Meta_Linefeed   
-keycode  37 = +k              
-	shift	keycode  37 = +K              
-	shift	altgr	keycode  37 = VoidSymbol      
-	control	keycode  37 = Control_k       
-	shift	control	keycode  37 = Control_k       
-	altgr	control	keycode  37 = Control_k       
-	alt	keycode  37 = Meta_k          
-	shift	alt	keycode  37 = Meta_K          
-	altgr	alt	keycode  37 = Meta_k          
-	control	alt	keycode  37 = Meta_Control_k  
-keycode  38 = +l              
-	shift	keycode  38 = +L              
-	shift	altgr	keycode  38 = VoidSymbol      
-	control	keycode  38 = Control_l       
-	shift	control	keycode  38 = Control_l       
-	altgr	control	keycode  38 = Control_l       
-	alt	keycode  38 = Meta_l          
-	shift	alt	keycode  38 = Meta_L          
-	altgr	alt	keycode  38 = Meta_l          
-	control	alt	keycode  38 = Meta_Control_l  
-keycode  39 = +odiaeresis      +Odiaeresis     
-keycode  40 = +adiaeresis      +Adiaeresis     
-keycode  41 = F11		F23      
-	control	keycode  41 = Control_asciicircum
-	control	alt	keycode  41 = Meta_Control_asciicircum
-keycode  42 = Shift		Shift		Caps_Lock           
-	shift	altgr	keycode  42 = VoidSymbol      
-	control	keycode  42 = Compose         
-keycode  43 = numbersign       apostrophe      
-	alt	keycode  43 = Meta_numbersign 
-	shift	alt	keycode  43 = Meta_apostrophe 
-keycode  44 = +y		+Y		less              
-	shift	altgr	keycode  44 = VoidSymbol      
-	control	keycode  44 = Control_y       
-	shift	control	keycode  44 = Control_y       
-	altgr	control	keycode  44 = Control_y       
-	alt	keycode  44 = Meta_y          
-	shift	alt	keycode  44 = Meta_Y          
-	altgr	alt	keycode  44 = Meta_y          
-	control	alt	keycode  44 = Meta_Control_y  
-keycode  45 = +x		+X		greater              
-	shift	altgr	keycode  45 = VoidSymbol      
-	control	keycode  45 = Control_x       
-	shift	control	keycode  45 = Control_x       
-	altgr	control	keycode  45 = Control_x       
-	alt	keycode  45 = Meta_x          
-	shift	alt	keycode  45 = Meta_X          
-	altgr	alt	keycode  45 = Meta_x          
-	control	alt	keycode  45 = Meta_Control_x  
-keycode  46 = +c               +C               cent            
-	control	keycode  46 = Control_c       
-	shift	control	keycode  46 = Control_c       
-	altgr	control	keycode  46 = Control_c       
-	alt	keycode  46 = Meta_c          
-	shift	alt	keycode  46 = Meta_C          
-	altgr	alt	keycode  46 = Meta_c          
-	control	alt	keycode  46 = Meta_Control_c  
-keycode  47 = +v              
-	shift	keycode  47 = +V              
-	shift	altgr	keycode  47 = VoidSymbol      
-	control	keycode  47 = Control_v       
-	shift	control	keycode  47 = Control_v       
-	altgr	control	keycode  47 = Control_v       
-	alt	keycode  47 = Meta_v          
-	shift	alt	keycode  47 = Meta_V          
-	altgr	alt	keycode  47 = Meta_v          
-	control	alt	keycode  47 = Meta_Control_v  
-keycode  48 = +b              
-	shift	keycode  48 = +B              
-	shift	altgr	keycode  48 = VoidSymbol      
-	control	keycode  48 = Control_b       
-	shift	control	keycode  48 = Control_b       
-	altgr	control	keycode  48 = Control_b       
-	alt	keycode  48 = Meta_b          
-	shift	alt	keycode  48 = Meta_B          
-	altgr	alt	keycode  48 = Meta_b          
-	control	alt	keycode  48 = Meta_Control_b  
-keycode  49 = +n              
-	shift	keycode  49 = +N              
-	shift	altgr	keycode  49 = VoidSymbol      
-	control	keycode  49 = Control_n       
-	shift	control	keycode  49 = Control_n       
-	altgr	control	keycode  49 = Control_n       
-	alt	keycode  49 = Meta_n          
-	shift	alt	keycode  49 = Meta_N          
-	altgr	alt	keycode  49 = Meta_n          
-	control	alt	keycode  49 = Meta_Control_n  
-keycode  50 = +m               +M               mu              
-	control	keycode  50 = Control_m       
-	shift	control	keycode  50 = Control_m       
-	altgr	control	keycode  50 = Control_m       
-	alt	keycode  50 = Meta_m          
-	shift	alt	keycode  50 = Meta_M          
-	altgr	alt	keycode  50 = Meta_m          
-	control	alt	keycode  50 = Meta_Control_m  
-keycode  51 = comma            semicolon       
-	alt	keycode  51 = Meta_comma      
-	shift	alt	keycode  51 = Meta_semicolon  
-keycode  52 = period           colon           
-	alt	keycode  52 = Meta_period     
-	shift	alt	keycode  52 = Meta_colon      
-keycode  53 = minus            underscore       Meta_minus      
-	shift	control	keycode  53 = Control_underscore
-	alt	keycode  53 = Meta_minus      
-	shift	alt	keycode  53 = Meta_underscore 
-keycode  54 = Shift           
-	shift	altgr	keycode  54 = VoidSymbol      
-	control	keycode  54 = Compose         
-keycode  56 = Alt             
-	shift	altgr	keycode  56 = VoidSymbol      
-keycode  57 = space            space            Meta_space      
-	control	keycode  57 = nul             
-	alt	keycode  57 = Meta_space      
-	shift	alt	keycode  57 = Meta_space      
-	control	alt	keycode  57 = Meta_nul        
-keycode  58 = F9       
-	shift	altgr	keycode  58 = VoidSymbol      
-keycode  59 = F1               F13              Console_13      
-	control	keycode  59 = F25             
-	alt	keycode  59 = Console_1       
-	control	alt	keycode  59 = Console_1       
-keycode  60 = F2               F14              Console_14      
-	control	keycode  60 = F26             
-	alt	keycode  60 = Console_2       
-	control	alt	keycode  60 = Console_2       
-keycode  61 = F3               F15              Console_15      
-	control	keycode  61 = F27             
-	alt	keycode  61 = Console_3       
-	control	alt	keycode  61 = Console_3       
-keycode  62 = F4               F16              Console_16      
-	control	keycode  62 = F28             
-	alt	keycode  62 = Console_4       
-	control	alt	keycode  62 = Console_4       
-keycode  63 = F5               F17              Console_17      
-	control	keycode  63 = F29             
-	alt	keycode  63 = Console_5       
-	control	alt	keycode  63 = Console_5       
-keycode  64 = F6               F18              Console_18      
-	control	keycode  64 = F30             
-	alt	keycode  64 = Console_6       
-	control	alt	keycode  64 = Console_6       
-keycode  65 = F7               F19              Console_19      
-	control	keycode  65 = F31             
-	alt	keycode  65 = Console_7       
-	control	alt	keycode  65 = Console_7       
-keycode  66 = F8               F20              Console_20      
-	control	keycode  66 = F32             
-	alt	keycode  66 = Console_8       
-	control	alt	keycode  66 = Console_8       
-keycode  72 = Up
-	alt	keycode  72 = Prior           
-	shift	alt	keycode  72 = Scroll_Backward      
-keycode  75 = KP_4            
-	altgr	keycode  75 = Hex_4           
-	shift	altgr	keycode  75 = VoidSymbol      
-	alt	keycode  75 = Find         
-keycode  77 = KP_6            
-	altgr	keycode  77 = Hex_6           
-	shift	altgr	keycode  77 = VoidSymbol      
-	alt	keycode  77 = Select         
-keycode  80 = KP_2            
-	altgr	keycode  80 = Hex_2           
-	shift	altgr	keycode  80 = VoidSymbol      
-	alt	keycode  80 = Next         
-keycode  83 = Remove        
-	alt	keycode 83 = Insert
-	shift	altgr	keycode  83 = VoidSymbol      
-	altgr	control	keycode  83 = Boot            
-	control	alt	keycode  83 = Boot            
-keycode  91 = Insert
-keycode 112 = F10		F22           
-	shift	altgr	keycode 112 = VoidSymbol      
-	altgr	control	keycode 112 = VoidSymbol      
-	shift	alt	keycode 112 = VoidSymbol      
-	altgr	alt	keycode 112 = VoidSymbol      
-keycode 115 = AltGr            
-	shift	altgr	keycode 115 = VoidSymbol      
-	altgr	control	keycode 115 = VoidSymbol      
-	shift	alt	keycode 115 = VoidSymbol      
-	altgr	alt	keycode 115 = VoidSymbol      
-keycode 123 = asciicircum      degree
-string F1 = "\033[[A"
-string F2 = "\033[[B"
-string F3 = "\033[[C"
-string F4 = "\033[[D"
-string F5 = "\033[[E"
-string F6 = "\033[17~"
-string F7 = "\033[18~"
-string F8 = "\033[19~"
-string F9 = "\033[20~"
-string F10 = "\033[21~"
-string F11 = "\033[23~"
-string F12 = "\033[24~"
-string F13 = "\033[25~"
-string F14 = "\033[26~"
-string F15 = "\033[28~"
-string F16 = "\033[29~"
-string F17 = "\033[31~"
-string F18 = "\033[32~"
-string F19 = "\033[33~"
-string F20 = "\033[34~"
-string Find = "\033[1~"
-string Insert = "\033[2~"
-string Remove = "\033[3~"
-string Select = "\033[4~"
-string Prior = "\033[5~"
-string Next = "\033[6~"
-string Macro = "\033[M"
-string Pause = "\033[P"
-compose '`' 'A' to '¿'
-compose '`' 'a' to '‡'
-compose '\'' 'A' to '¡'
-compose '\'' 'a' to '·'
-compose '^' 'A' to '¬'
-compose '^' 'a' to '‚'
-compose '~' 'A' to '√'
-compose '~' 'a' to '„'
-compose '"' 'A' to 'ƒ'
-compose '"' 'a' to '‰'
-compose '-' 'a' to '™'
-compose '-' 'A' to '™'
-compose 'O' 'A' to '≈'
-compose 'o' 'a' to 'Â'
-compose '0' 'A' to '≈'
-compose '0' 'a' to 'Â'
-compose 'A' 'A' to '≈'
-compose 'a' 'a' to 'Â'
-compose '∞' 'A' to '≈'
-compose '∞' 'a' to 'Â'
-compose 'A' 'E' to '∆'
-compose 'a' 'e' to 'Ê'
-compose ',' 'C' to '«'
-compose ',' 'c' to 'Á'
-compose '^' 'C' to '«'
-compose '^' 'c' to 'Á'
-compose '`' 'E' to '»'
-compose '`' 'e' to 'Ë'
-compose '\'' 'E' to '…'
-compose '\'' 'e' to 'È'
-compose '^' 'E' to ' '
-compose '^' 'e' to 'Í'
-compose '"' 'E' to 'À'
-compose '"' 'e' to 'Î'
-compose '`' 'I' to 'Ã'
-compose '`' 'i' to 'Ï'
-compose '\'' 'I' to 'Õ'
-compose '\'' 'i' to 'Ì'
-compose '^' 'I' to 'Œ'
-compose '^' 'i' to 'Ó'
-compose '"' 'I' to 'œ'
-compose '"' 'i' to 'Ô'
-compose '-' 'D' to '–'
-compose '-' 'd' to ''
-compose '^' 'D' to '–'
-compose '^' 'd' to ''
-compose '~' 'N' to '—'
-compose '~' 'n' to 'Ò'
-compose '^' 'N' to '—'
-compose '^' 'n' to 'Ò'
-compose '`' 'O' to '“'
-compose '`' 'o' to 'Ú'
-compose '\'' 'O' to '”'
-compose '\'' 'o' to 'Û'
-compose '^' 'O' to '‘'
-compose '^' 'o' to 'Ù'
-compose '~' 'O' to '’'
-compose '~' 'o' to 'ı'
-compose '"' 'O' to '÷'
-compose '"' 'o' to 'ˆ'
-compose '/' 'O' to 'ÿ'
-compose '/' 'o' to '¯'
-compose '-' 'o' to '∫'
-compose '-' 'O' to '∫'
-compose '`' 'U' to 'Ÿ'
-compose '`' 'u' to '˘'
-compose '\'' 'U' to '⁄'
-compose '\'' 'u' to '˙'
-compose '^' 'U' to '€'
-compose '^' 'u' to '˚'
-compose '"' 'U' to '‹'
-compose '"' 'u' to '¸'
-compose '\'' 'Y' to '›'
-compose '\'' 'y' to '˝'
-compose 'T' 'H' to 'ﬁ'
-compose 't' 'h' to '˛'
-compose 's' 's' to 'ﬂ'
-compose '"' 'y' to 'ˇ'
-compose 's' 'z' to 'ﬂ'
-compose 'n' 'n' to 'Ò'
-compose 'n' 'h' to 'Ò'
-compose 'N' 'Y' to '—'
-compose 'N' 'N' to '—'
-compose 'N' 'H' to '—'
-compose 'N' 'y' to '—'
-compose 'N' 'n' to '—'
-compose 'N' 'h' to '—'
-compose '-' 'L' to '£'
-compose '<' '<' to '´'
-compose '>' '>' to 'ª'
-compose '?' '?' to 'ø'
-compose '^' '?' to 'ø'
-compose '!' '!' to '°'
-compose '^' '!' to '°'
-compose '^' '1' to 'π'
-compose '^' '2' to '≤'
-compose '^' '3' to '≥'
-compose '+' '-' to '±'
-compose 'c' '=' to '¢'
-compose 'c' '/' to '¢'
-compose '/' 'c' to '¢'
-compose '-' 'c' to '¢'
-compose '-' 'C' to '¢'
-compose '|' 'c' to '¢'
-compose '|' 'C' to '¢'
-compose 'L' '=' to '£'
-compose '-' 'L' to '£'
-compose '-' 'l' to '£'
-compose '^' '*' to '◊'
-compose '^' 'x' to '◊'
-compose 'x' 'x' to '◊'
-compose '^' '.' to '∑'
-compose '.' '.' to '∑'
-compose '^' '/' to '˜'
-compose '^' ':' to '˜'
-compose '-' ':' to '˜'
-compose ':' '-' to '˜'
-compose 'Y' '=' to '•'
-compose '=' 'Y' to '•'
-compose '-' 'Y' to '•'
-compose '-' 'l' to '•'
-compose '(' 'c' to '©'
-compose '"' 'c' to '©'
-compose 'O' 'C' to '©'
-compose '(' 'C' to '©'
-compose 'C' ')' to '©'
-compose '-' 'a' to '™'
-compose '-' 'A' to '™'
-compose '-' 'o' to '∫'
-compose '-' 'O' to '∫'
-compose '(' 'r' to 'Æ'
-compose '"' 'r' to 'Æ'
-compose 'O' 'R' to 'Æ'
-compose '(' 'R' to 'Æ'
-compose 'R' ')' to 'Æ'
-compose 'm' 'u' to 'µ'
-compose 'P' 'P' to '∂'
-compose '1' '4' to 'º'
-compose '1' '2' to 'Ω'
-compose '3' '4' to 'æ'
-compose 'e' '=' to '§'
-compose '-' 'e' to '§'
-compose '-' 'E' to '§'
-compose '=' 'E' to '§'
-compose 'v' 'S' to '¶'
-compose '^' 'S' to '¶'
-compose 'v' 's' to '®'
-compose '^' 's' to '®'
-compose 'v' 'Z' to '¥'
-compose '^' 'Z' to '¥'
-compose 'v' 'z' to '∏'
-compose '^' 'z' to '∏'
-compose 'O' 'E' to 'º'
-compose 'O' 'e' to 'º'
-compose 'o' 'e' to 'Ω'
-compose '"' 'Y' to 'æ'
-compose 'i' 'j' to 'ˇ'
-compose 'I' 'J' to 'æ'
-compose '|' 's' to '$'
-compose '|' 'S' to '$'
-compose 'S' 'S' to 'ß'
-compose '=' 'C' to '§'
-compose 'C' '=' to '§'
-compose 'o' 'x' to '§'
-compose 'x' 'o' to '§'
diff --git a/meta/recipes-bsp/keymaps/files/jornada6xx/keymap-sp.map b/meta/recipes-bsp/keymaps/files/jornada6xx/keymap-sp.map
deleted file mode 100644
index ba05387..0000000
--- a/meta/recipes-bsp/keymaps/files/jornada6xx/keymap-sp.map
+++ /dev/null
@@ -1,222 +0,0 @@
-# <ES.Keymap> for JLime
-# 
-# By Pau Rodriguez-Estivill
-# <20060708>
-
-strings as usual
-
-keycode   1 = Escape
-keycode   2 = one              
-          shift keycode 2 = exclam
-          AltGr keycode 2 = 0246
-keycode   3 = two             
-          Shift keycode 3 = quotedbl
-          AltGr keycode 3 = 0247
-keycode   4 = three            
-          shift keycode 4 = numbersign
-keycode   5 = four             
-          shift keycode 5 = dollar
-          AltGr keycode 5 = asciitilde
-keycode   6 = five             
-          shift keycode 6 = percent
-keycode   7 = six              
-          shift keycode 7 = ampersand
-keycode   8 = seven            
-          shift keycode 8 = slash
-keycode   9 = eight            
-          shift keycode 9 = parenleft
-keycode  10 = nine             
-         shift keycode 10 = parenright
-keycode  11 = zero             
-         shift keycode 11 = equal
-keycode  12 = apostrophe
-         shift keycode 12 = question
-         AltGr keycode 12 = backslash
-keycode  13 = 0250           
-         shift keycode 13 = 0255
-keycode  14 = Delete
-keycode  15 = Tab              
-keycode  16 = +q               +Q               
-         AltGr keycode 16 = at
-keycode  17 = +w              
-	shift	keycode  17 = +W              
-keycode  18 = +e               +E              
-         AltGr keycode 18 = currency
-keycode  19 = +r              
-	shift	keycode  19 = +R              
-keycode  20 = +t              
-	shift	keycode  20 = +T              
-keycode  21 = +y              
-	shift	keycode  21 = +Y
-keycode  22 = +u              
-	shift	keycode  22 = +U              
-keycode  23 = +i              
-	shift	keycode  23 = +I              
-keycode  24 = +o              
-	shift	keycode  24 = +O              
-keycode  25 = +p              
-	shift	keycode  25 = +P              
-keycode  26 = dead_acute
-        shift   keycode  26 = dead_diaeresis
-keycode  27 = plus             asterisk         asciitilde      
-keycode  28 = Return          
-keycode  29 = Control
-         AltGr keycode 29 = Num_Lock
-keycode  30 = +a              
-	shift	keycode  30 = +A              
-keycode  31 = +s              
-	shift	keycode  31 = +S              
-keycode  32 = +d              
-	shift	keycode  32 = +D              
-keycode  33 = +f              
-	shift	keycode  33 = +F              
-keycode  34 = +g              
-	shift	keycode  34 = +G              
-keycode  35 = +h              
-	shift	keycode  35 = +H              
-keycode  36 = +j              
-	shift	keycode  36 = +J              
-keycode  37 = +k              
-	shift	keycode  37 = +K              
-keycode  38 = +l              
-	shift	keycode  38 = +L              
-keycode  39 = +0244
-         shift keycode 39 = +0245
-keycode  40 = braceleft          
-         shift keycode 40 = bracketleft
-         AltGr keycode 40 = dead_circumflex         
-keycode  41 = F11
-         alt    keycode 41 = Console_11      
-         shift  keycode 41 = F12      
-         shift alt    keycode 41 = Console_12      
-keycode  42 = Shift         
-         AltGr keycode 42 = Caps_Lock         
-keycode  43 = braceright      
-         shift keycode 43 = bracketright
-         AltGr keycode 43 = dead_grave         
-keycode  44 = +z		+Z		              
-         AltGr keycode 44 = less         
-keycode  45 = +x		+X		              
-         AltGr keycode 45 = greater         
-keycode  46 = +c                +C                          
-         AltGr keycode 46 = 0247         
-         shift AltGr keycode 46 = 0246         
-keycode  47 = +v              
-	shift	keycode  47 = +V              
-keycode  48 = +b              
-	shift	keycode  48 = +B              
-keycode  49 = +n              
-	shift	keycode  49 = +N              
-keycode  50 = +m               +M               mu              
-keycode  51 = comma            
-	 shift   keycode  51 = semicolon
-keycode  52 = period          
-         shift keycode 52 = colon           
-keycode  53 = minus            underscore       Meta_minus      
-keycode  54 = Shift
-keycode  56 = Alt             
-keycode  57 = space            space            Meta_space      
-keycode  58 = F9       
- 	 alt	keycode 58 = Console_9       
-keycode  59 = F1      
-keycode  60 = F2      
-keycode  61 = F3     
- 	 alt	keycode 61 = Console_3       
-keycode  62 = F4      
- 	 alt	keycode 62 = Console_4       
-keycode  63 = F5
- 	 alt	keycode 63 = Console_5       
-keycode  64 = F6  
- 	 alt	keycode 64 = Console_6       
-keycode  65 = F7               
-         alt    keycode 65 = Console_7      
-keycode  66 = F8  
-         alt    keycode 66 = Console_8      
-keycode  72 = Up
-         alt    keycode 72 = PageUp
-         shift alt    keycode 72 = Scroll_Backward
-keycode  75 = Left            
-         alt    keycode  75 = Home           
-keycode  77 = Right            
-         alt    keycode  77 = End            
-keycode  80 = Down    
-        alt     keycode 80 = PageDown    
-	shift alt keycode 80 = Scroll_Forward
-keycode  83 = Remove        
-	alt	keycode 83 = Insert
-keycode  91 = Insert
-keycode 112 = F10
-         alt    keycode 112 = Console_10      
-keycode 115 = AltGr
-keycode 123 = bar 
-        shift           keycode 123 = 0372        
-        AltGr           keycode 123 = +0252
-! compose for cp 850
-compose '`' 'A' to '∑'
-compose '`' 'a' to 'Ö'
-compose '\'' 'A' to 'µ'
-compose '\'' 'a' to '†'
-compose '^' 'A' to '∂'
-compose '^' 'a' to 'É'
-compose '~' 'A' to '«'
-compose '~' 'a' to '∆'
-compose '"' 'A' to 'é'
-compose '"' 'a' to 'Ñ'
-compose 'O' 'A' to 'è'
-compose 'o' 'a' to 'Ü'
-compose '0' 'A' to 'è'
-compose '0' 'a' to 'Ü'
-compose 'A' 'A' to 'è'
-compose 'a' 'a' to 'Ü'
-compose 'A' 'E' to 'í'
-compose 'a' 'e' to 'ë'
-compose ',' 'C' to 'Ä'
-compose ',' 'c' to 'á'
-compose '`' 'E' to '‘'
-compose '`' 'e' to 'ä'
-compose '\'' 'E' to 'ê'
-compose '\'' 'e' to 'Ç'
-compose '^' 'E' to '“'
-compose '^' 'e' to 'à'
-compose '"' 'E' to '”'
-compose '"' 'e' to 'â'
-compose '`' 'I' to 'ﬁ'
-compose '`' 'i' to 'ç'
-compose '\'' 'I' to '÷'
-compose '\'' 'i' to '°'
-compose '^' 'I' to '◊'
-compose '^' 'i' to 'å'
-compose '"' 'I' to 'ÿ'
-compose '"' 'i' to 'ã'
-compose '-' 'D' to '—'
-compose '-' 'd' to '–'
-compose '~' 'N' to '•'
-compose '~' 'n' to '§'
-compose '`' 'O' to '„'
-compose '`' 'o' to 'ï'
-compose '\'' 'O' to '‡'
-compose '\'' 'o' to '¢'
-compose '^' 'O' to '‚'
-compose '^' 'o' to 'ì'
-compose '~' 'O' to 'Â'
-compose '~' 'o' to '‰'
-compose '"' 'O' to 'ô'
-compose '"' 'o' to 'î'
-compose '/' 'O' to 'ù'
-compose '/' 'o' to 'õ'
-compose '`' 'U' to 'Î'
-compose '`' 'u' to 'ó'
-compose '\'' 'U' to 'È'
-compose '\'' 'u' to '£'
-compose '^' 'U' to 'Í'
-compose '^' 'u' to 'ñ'
-compose '"' 'U' to 'ö'
-compose '"' 'u' to 'Å'
-compose '\'' 'Y' to 'Ì'
-compose '\'' 'y' to 'Ï'
-compose 'T' 'H' to 'Ë'
-compose 't' 'h' to 'Á'
-compose 's' 's' to '·'
-compose '"' 'y' to 'ò'
-compose 's' 'z' to '·'
-compose 'i' 'j' to 'ò'
diff --git a/meta/recipes-bsp/keymaps/files/jornada6xx/keymap-uk.map b/meta/recipes-bsp/keymaps/files/jornada6xx/keymap-uk.map
deleted file mode 100644
index a7bb082..0000000
--- a/meta/recipes-bsp/keymaps/files/jornada6xx/keymap-uk.map
+++ /dev/null
@@ -1,278 +0,0 @@
-# English keymap for Jornada 6xx devices.
-#
-# Created by Tibor Zenis ( zenis <at> fmph.uniba.sk )
-# (Lightly) Modified by Alex Palestras ( B_Linuz <at> yahoo.com )
-# plain, shift, altgr,  ctrl, shift + ctrl,  alt,  ctrl + alt
-
-keymaps 0-2,4-5,8,12
-keycode   1 = Escape           Escape          
-	alt	keycode   1 = Meta_Escape     
-keycode   2 = one              exclam		asciitilde
-	alt	keycode   2 = Meta_one
-keycode   3 = two              at		grave
-	alt	keycode   3 = Meta_two
-keycode   4 = three            numbersign      
-	alt	keycode   4 = Meta_three      
-	altgr	keycode   4 = pound
-keycode   5 = four             dollar
-	control	keycode   5 = Control_backslash
-	alt	keycode   5 = Meta_four       
-	altgr	keycode   5 = currency
-keycode   6 = five             percent         
-	control	keycode   6 = Control_bracketright
-	alt	keycode   6 = Meta_five       
-keycode   7 = six              asciicircum     
-	control	keycode   7 = Control_asciicircum
-	alt	keycode   7 = Meta_six        
-keycode   8 = seven            ampersand        braceleft
-	control	keycode   8 = Control_underscore
-	altgr	keycode   8 = KP_7      
-keycode   9 = eight            asterisk         bracketleft
-	control	keycode   9 = Delete
-	altgr	keycode   9 = KP_8      
-keycode  10 = nine             parenleft        bracketright    
-	altgr	keycode  10 = KP_9       
-keycode  11 = zero             parenright       braceright      
-	altgr	keycode  11 = KP_Divide       
-keycode  12 = minus            underscore       backslash
-	control	keycode  11 = Control_underscore
-	shift control	keycode  11 = Control_underscore
-	alt	keycode  11 = Meta_minus
-keycode  13 = equal            plus            
-	alt	keycode  13 = Meta_equal      
-keycode  14 = Delete           Delete          
-	control	keycode  14 = BackSpace       
-	alt	keycode  14 = Meta_Delete     
-keycode  15 = Tab              Tab             
-	alt	keycode  15 = Meta_Tab        
-keycode  16 = q               
-keycode  17 = w               
-keycode  18 = e
-	Shift	keycode  18 = E
-keycode  19 = r               
-keycode  20 = t               
-keycode  21 = y               
-	altgr	keycode  21 = KP_4
-keycode  22 = u               
-	altgr	keycode  22 = KP_5
-keycode  23 = i               
-	altgr	keycode  23 = KP_6
-keycode  24 = o
-	altgr	keycode  24 = KP_Multiply
-keycode  25 = p             
-		AltGr keycode 25 = braceleft  
-keycode  26 = backslash	bar
-		AltGr keycode 26 = braceright 
-keycode  28 = Return          
-	alt	keycode  28 = Meta_Control_m  
-keycode  29 = Control         
-	altgr	keycode  29 = Num_Lock
-keycode  30 = a
-keycode  31 = s               
-keycode  32 = d
-keycode  33 = f
-keycode  34 = g               
-keycode  35 = h               
-	altgr	keycode  35 = KP_1
-keycode  36 = j               
-	altgr	keycode  36 = KP_2
-keycode  37 = k               
-	altgr	keycode  37 = KP_3
-keycode  38 = l               
-	altgr	keycode  38 = KP_Subtract
-keycode  39 = semicolon        colon           bracketleft
-	alt	keycode  39 = Meta_semicolon
-keycode  40 = apostrophe       quotedbl        bracketright
-	control	keycode  40 = Control_g       
-	alt	keycode  40 = Meta_apostrophe
-keycode  41 = F11             
-	shift	keycode  41 = F21
-	altgr	keycode  41 = Console_23      
-	alt	keycode  41 = Console_11      
-	control	alt	keycode  41 = Console_11      
-keycode  42 = Shift           
-	altgr	keycode  42 = Caps_Lock
-keycode  44 = z               
-keycode  45 = x               
-keycode  46 = c
-keycode  47 = v               
-keycode  48 = b
-keycode  49 = n               
-	altgr	keycode  49 = KP_0
-keycode  50 = m               
-	altgr	keycode  50 = KP_Comma
-keycode  51 = comma            less            
-	altgr	keycode  51 = KP_Period      
-keycode  52 = period           greater         
-	control	keycode  52 = Compose         
-	altgr	keycode  52 = KP_Add     
-keycode  54 = Shift 
-keycode  56 = Alt             
-keycode  57 = space            space           
-	alt	keycode  57 = Meta_space      
-keycode  58 = F9              
-	shift	keycode  58 = F19             
-	altgr	keycode  58 = Console_21      
-	alt	keycode  58 = Console_9       
-	control	alt	keycode  58 = Console_9       
-keycode  59 = F1              
-	altgr	keycode  59 = Console_13      
-	alt	keycode  59 = Console_1       
-	control	alt	keycode  59 = Console_1 
-keycode  60 = F2              
-	shift	keycode  60 = F12             
-	altgr	keycode  60 = Console_14      
-	alt	keycode  60 = Console_2       
-	control	alt	keycode  60 = Console_2       
-keycode  61 = F3              
-	shift	keycode  61 = F13             
-	altgr	keycode  61 = Console_15      
-	alt	keycode  61 = Console_3       
-	control	alt	keycode  61 = Console_3       
-keycode  62 = F4              
-	shift	keycode  62 = F14             
-	altgr	keycode  62 = Console_16      
-	alt	keycode  62 = Console_4       
-	control	alt	keycode  62 = Console_4       
-keycode  63 = F5              
-	shift	keycode  63 = F15             
-	altgr	keycode  63 = Console_17      
-	alt	keycode  63 = Console_5       
-	control	alt	keycode  63 = Console_5       
-keycode  64 = F6              
-	shift	keycode  64 = F16             
-	altgr	keycode  64 = Console_18      
-	alt	keycode  64 = Console_6       
-	control	alt	keycode  64 = Console_6       
-keycode  65 = F7              
-	shift	keycode  65 = F17             
-	altgr	keycode  65 = Console_19      
-	alt	keycode  65 = Console_7       
-	control	alt	keycode  65 = Console_7       
-keycode  66 = F8              
-	shift	keycode  66 = F18             
-	altgr	keycode  66 = Console_20      
-	alt	keycode  66 = Console_8       
-	control	alt	keycode  66 = Console_8       
-keycode  72 = Up
-	shift	keycode  72 = Scroll_Backward           
-	altgr	keycode  72 = Scroll_Backward           
-	alt	keycode  72 = Prior 
-keycode  75 = Left
-	altgr	keycode  75 = Decr_Console
-	alt	keycode  75 = Find      
-keycode  77 = Right
-	altgr	keycode  77 = Incr_Console
-	alt	keycode  77 = Select         
-keycode  80 = Down
-	shift	keycode  80 = Scroll_Forward
-	altgr	keycode  80 = Scroll_Forward
-	alt	keycode  80 = Next         
-keycode  83 = Remove	Remove		Meta_Delete
-	alt	keycode  83 = Meta_Delete            
-keycode 112 = F10             
-	shift	keycode 112 = F20             
-	altgr	keycode 112 = Console_22      
-	alt	keycode 112 = Console_10      
-	control	alt	keycode 112 = Console_10      
-keycode 115 = slash	question        
-	control	keycode  115 = Delete          
-	alt	keycode  115 = Meta_slash      
-keycode 123 = AltGr
-keycode 219 = Insert
-string F1 = "\033[11~"
-string F2 = "\033[12~"
-string F3 = "\033[13~"
-string F4 = "\033[14~"
-string F5 = "\033[15~"
-string F6 = "\033[17~"
-string F7 = "\033[18~"
-string F8 = "\033[19~"
-string F9 = "\033[20~"
-string F10 = "\033[21~"
-string F11 = "\033[23~"
-string F12 = "\033[24~"
-string F13 = "\033[25~"
-string F14 = "\033[26~"
-string F15 = "\033[28~"
-string F16 = "\033[29~"
-string F17 = "\033[31~"
-string F18 = "\033[32~"
-string F19 = "\033[33~"
-string F20 = "\033[34~"
-string Find = "\033[1~"
-string Insert = "\033[2~"
-string Remove = "\033[3~"
-string Select = "\033[4~"
-string Prior = "\033[5~"
-string Next = "\033[6~"
-string Macro = "\033[M"
-string Pause = "\033[P"
-compose '`' 'A' to '¿'
-compose '`' 'a' to '‡'
-compose '\'' 'A' to '¡'
-compose '\'' 'a' to '·'
-compose '^' 'A' to '¬'
-compose '^' 'a' to '‚'
-compose '~' 'A' to '√'
-compose '~' 'a' to '„'
-compose '"' 'A' to 'ƒ'
-compose '"' 'a' to '‰'
-compose 'O' 'A' to '≈'
-compose 'o' 'a' to 'Â'
-compose '0' 'A' to '≈'
-compose '0' 'a' to 'Â'
-compose 'A' 'A' to '≈'
-compose 'a' 'a' to 'Â'
-compose 'A' 'E' to '∆'
-compose 'a' 'e' to 'Ê'
-compose ',' 'C' to '«'
-compose ',' 'c' to 'Á'
-compose '`' 'E' to '»'
-compose '`' 'e' to 'Ë'
-compose '\'' 'E' to '…'
-compose '\'' 'e' to 'È'
-compose '^' 'E' to ' '
-compose '^' 'e' to 'Í'
-compose '"' 'E' to 'À'
-compose '"' 'e' to 'Î'
-compose '`' 'I' to 'Ã'
-compose '`' 'i' to 'Ï'
-compose '\'' 'I' to 'Õ'
-compose '\'' 'i' to 'Ì'
-compose '^' 'I' to 'Œ'
-compose '^' 'i' to 'Ó'
-compose '"' 'I' to 'œ'
-compose '"' 'i' to 'Ô'
-compose '-' 'D' to '–'
-compose '-' 'd' to ''
-compose '~' 'N' to '—'
-compose '~' 'n' to 'Ò'
-compose '`' 'O' to '“'
-compose '`' 'o' to 'Ú'
-compose '\'' 'O' to '”'
-compose '\'' 'o' to 'Û'
-compose '^' 'O' to '‘'
-compose '^' 'o' to 'Ù'
-compose '~' 'O' to '’'
-compose '~' 'o' to 'ı'
-compose '"' 'O' to '÷'
-compose '"' 'o' to 'ˆ'
-compose '/' 'O' to 'ÿ'
-compose '/' 'o' to '¯'
-compose '`' 'U' to 'Ÿ'
-compose '`' 'u' to '˘'
-compose '\'' 'U' to '⁄'
-compose '\'' 'u' to '˙'
-compose '^' 'U' to '€'
-compose '^' 'u' to '˚'
-compose '"' 'U' to '‹'
-compose '"' 'u' to '¸'
-compose '\'' 'Y' to '›'
-compose '\'' 'y' to '˝'
-compose 'T' 'H' to 'ﬁ'
-compose 't' 'h' to '˛'
-compose 's' 's' to 'ﬂ'
-compose '"' 'y' to 'ˇ'
-compose 's' 'z' to 'ﬂ'
-compose 'i' 'j' to 'ˇ'
diff --git a/meta/recipes-bsp/keymaps/files/poodle/keymap-2.6.map b/meta/recipes-bsp/keymaps/files/poodle/keymap-2.6.map
deleted file mode 100644
index a39b886..0000000
--- a/meta/recipes-bsp/keymaps/files/poodle/keymap-2.6.map
+++ /dev/null
@@ -1,152 +0,0 @@
-keymaps 0-2,4,8,12
-
-# 	      Default 		Shift 		AltGr 		Control 	Alt 		Ctrl+Alt 	
-keycode  29 = SControl	# Calendar	
-keycode  60 = SAlt	# Address
-keycode  63 = space	#Select
-keycode  68 = F13 	# Mail
-keycode  87 = F33	#OK	
-keycode  88 = F11 	# Menu
-keycode 102 = F12	# Home
-keycode 103 = Up		Up		Prior
-keycode 105 = Left		Left		Decr_Console	
-keycode 106 = Right		Right		Incr_Console	
-keycode 108 = Down		Down		Next
-keycode 116 = Escape		
-
-keycode  14 = BackSpace		BackSpace	Delete
-keycode  15 = Tab		backslash       Caps_Lock
-keycode  28 = Return         	Return		greater	
-keycode  40 = apostrophe       	quotedbl        tilde
-keycode  42 = SShift		
-keycode  51 = comma            	semicolon	parenright
-keycode  52 = period		colon		less
-keycode  53 = slash		question	Num_Lock
-keycode  54 = SShift 
-keycode  57 = space		bar		bar
-keycode  67 = SAltGr
-
-keycode  16 = +q                +Q		one		Control_q	Meta_q
-keycode  17 = +w               	+W		two		Control_w	Meta_w
-keycode  18 = +e               	+E		three		Control_e	Meta_e
-keycode  19 = +r               	+R		four		Control_r	Meta_r
-keycode  20 = +t               	+T		five		Control_t	Meta_t
-keycode  21 = +y               	+Y		six		Control_y	Meta_y
-keycode  22 = +u               	+U		seven		Control_u	Meta_u
-keycode  23 = +i               	+I		eight		Control_i	Meta_i
-keycode  24 = +o               	+O		nine		Control_o	Meta_o
-keycode  25 = +p               	+P		zero		Control_p	Meta_p
-keycode  30 = +a            	+A		exclam   	Control_a	Meta_a
-keycode  31 = +s               	+S		at		Control_s	Meta_s
-keycode  32 = +d		+D		numbersign	Control_d	Meta_d
-keycode  33 = +f		+F		dollar		Control_f	Meta_f
-keycode  34 = +g               	+G		percent		Control_g	Meta_g
-keycode  35 = +h               	+H		underscore	Control_h	Meta_h
-keycode  36 = +j               	+J		ampersand	Control_j	Meta_j
-keycode  37 = +k               	+K		asterisk	Control_k	Meta_k
-keycode  38 = +l               	+L		parenleft	Control_l	Meta_l
-keycode  44 = +z               	+Z		VoidSymbol	Control_z	Meta_z
-keycode  45 = +x               	+X		Control_x	Control_x	Meta_x
-keycode  46 = +c               	+C		Control_c	Control_c	Meta_c
-keycode  47 = +v               	+V		Control_v	Control_v	Meta_v
-keycode  48 = +b		+B		minus		Control_b	Meta_b
-keycode  49 = +n               	+N		plus		Control_n	Meta_n
-keycode  50 = +m               	+M		equal		Control_m	Meta_m
-		
-string F1 = "\033[[A"
-string F2 = "\033[[B"
-string F3 = "\033[[C"
-string F4 = "\033[[D"
-string F5 = "\033[[E"
-string F6 = "\033[17~"
-string F7 = "\033[18~"
-string F8 = "\033[19~"
-string F9 = "\033[20~"
-string F10 = "\033[21~"
-string F11 = "\033[23~"
-string F12 = "\033[24~"
-string F13 = "\033[25~"
-string F14 = "\033[26~"
-string F15 = "\033[28~"
-string F16 = "\033[29~"
-string F17 = "\033[31~"
-string F18 = "\033[32~"
-string F19 = "\033[33~"
-string F20 = "\033[34~"
-string F33 = "\033[49~"
-string Find = "\033[1~"
-string Insert = "\033[2~"
-string Remove = "\033[3~"
-string Select = "\033[4~"
-string Prior = "\033[5~"
-string Next = "\033[6~"
-string Macro = "\033[M"
-string Pause = "\033[P"
-compose '`' 'A' to '¿'
-compose '`' 'a' to '‡'
-compose '\'' 'A' to '¡'
-compose '\'' 'a' to '·'
-compose '^' 'A' to '¬'
-compose '^' 'a' to '‚'
-compose '~' 'A' to '√'
-compose '~' 'a' to '„'
-compose '"' 'A' to 'ƒ'
-compose '"' 'a' to '‰'
-compose 'O' 'A' to '≈'
-compose 'o' 'a' to 'Â'
-compose '0' 'A' to '≈'
-compose '0' 'a' to 'Â'
-compose 'A' 'A' to '≈'
-compose 'a' 'a' to 'Â'
-compose 'A' 'E' to '∆'
-compose 'a' 'e' to 'Ê'
-compose ',' 'C' to '«'
-compose ',' 'c' to 'Á'
-compose '`' 'E' to '»'
-compose '`' 'e' to 'Ë'
-compose '\'' 'E' to '…'
-compose '\'' 'e' to 'È'
-compose '^' 'E' to ' '
-compose '^' 'e' to 'Í'
-compose '"' 'E' to 'À'
-compose '"' 'e' to 'Î'
-compose '`' 'I' to 'Ã'
-compose '`' 'i' to 'Ï'
-compose '\'' 'I' to 'Õ'
-compose '\'' 'i' to 'Ì'
-compose '^' 'I' to 'Œ'
-compose '^' 'i' to 'Ó'
-compose '"' 'I' to 'œ'
-compose '"' 'i' to 'Ô'
-compose '-' 'D' to '–'
-compose '-' 'd' to ''
-compose '~' 'N' to '—'
-compose '~' 'n' to 'Ò'
-compose '`' 'O' to '“'
-compose '`' 'o' to 'Ú'
-compose '\'' 'O' to '”'
-compose '\'' 'o' to 'Û'
-compose '^' 'O' to '‘'
-compose '^' 'o' to 'Ù'
-compose '~' 'O' to '’'
-compose '~' 'o' to 'ı'
-compose '"' 'O' to '÷'
-compose '"' 'o' to 'ˆ'
-compose '/' 'O' to 'ÿ'
-compose '/' 'o' to '¯'
-compose '`' 'U' to 'Ÿ'
-compose '`' 'u' to '˘'
-compose '\'' 'U' to '⁄'
-compose '\'' 'u' to '˙'
-compose '^' 'U' to '€'
-compose '^' 'u' to '˚'
-compose '"' 'U' to '‹'
-compose '"' 'u' to '¸'
-compose '\'' 'Y' to '›'
-compose '\'' 'y' to '˝'
-compose 'T' 'H' to 'ﬁ'
-compose 't' 'h' to '˛'
-compose 's' 's' to 'ﬂ'
-compose '"' 'y' to 'ˇ'
-compose 's' 'z' to 'ﬂ'
-compose 'i' 'j' to 'ˇ'
diff --git a/meta/recipes-bsp/keymaps/files/spitz/keymap-2.4.map b/meta/recipes-bsp/keymaps/files/spitz/keymap-2.4.map
deleted file mode 100644
index e633997..0000000
--- a/meta/recipes-bsp/keymaps/files/spitz/keymap-2.4.map
+++ /dev/null
@@ -1,128 +0,0 @@
-keymaps 0-2,4-5,8
-keycode   1 = +a                +A                +a                Control_a        Control_a       
-keycode   2 = +b                +B                underscore       Control_b        Control_b       
-keycode   3 = +c                +C                +c                Control_c        Control_c       
-keycode   4 = +d                +D                +d                Control_d        Control_d       
-keycode   5 = +e                +E                equal            Control_e        Control_e       
-keycode   6 = +f                +F                backslash        Control_f        Control_f       
-keycode   7 = +g                +G                semicolon        Control_g        Control_g       
-keycode   8 = +h                +H                colon            BackSpace        BackSpace       
-keycode   9 = +i                +I                +i                Tab              Tab             
-keycode  10 = +j                +J                asterisk         Linefeed         Linefeed        
-keycode  11 = +k                +K                backslash        Control_k        Control_k       
-keycode  12 = +l                +L                bar              Control_l        Control_l       
-keycode  13 = +m                +M                +m                Control_m        Control_m       
-keycode  14 = +n                +N                +n                Control_n        Control_n       
-keycode  15 = +o                +O                +o                Control_o        Control_o       
-keycode  16 = +p                +P                +p                Control_p        Control_p       
-keycode  17 = +q                +Q                +q                Control_q        Control_q       
-keycode  18 = +r                +R                plus             Control_r        Control_r       
-keycode  19 = +s                +S                +s                Control_s        Control_s       
-keycode  20 = +t                +T                bracketleft      Control_t        Control_t       
-keycode  21 = +u                +U                +u                Control_u        Control_u       
-keycode  22 = +v                +V                +v                Control_v        Control_v       
-keycode  23 = +w                +W                asciicircum      Control_w        Control_w       
-keycode  24 = +x                +X                +x                Control_x        Control_x       
-keycode  25 = +y                +Y                bracketright     Control_y        Control_y       
-keycode  26 = +z                +Z                +z                Control_z        Control_z       
-keycode  27 = Shift            Shift            Shift            Shift            Shift           
-keycode  28 = Return           Return           Return           Return           Return          
-keycode  29 = F11              F11              F11              F11              F11             
-keycode  30 = AltGr            AltGr            AltGr            AltGr            AltGr           
-keycode  31 = BackSpace        BackSpace        Delete           BackSpace        BackSpace       
-keycode  32 = Num_Lock         Num_Lock         Num_Lock         Num_Lock         Num_Lock        
-keycode  33 = VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol      
-keycode  34 = Escape           Escape           Escape           Escape           Escape          
-keycode  35 = Left             Left             Left             Left             Left		Decr_Console            
-keycode  36 = Up               Up               PageUp           Up               Up              
-keycode  37 = Down             Down             PageDown         Down             Down            
-keycode  38 = Right            Right            Right             Right            Right	Incr_Console           
-keycode  39 = Return           Return           Return           Return           Return          
-keycode  40 = F12              VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol      
-keycode  41 = one              exclam           VoidSymbol       VoidSymbol       VoidSymbol 	Console_1      
-keycode  42 = two              quotedbl         VoidSymbol       VoidSymbol       VoidSymbol 	Console_2 	
-keycode  43 = three            numbersign       VoidSymbol       VoidSymbol       VoidSymbol 	Console_3 	
-keycode  44 = four             dollar           VoidSymbol       VoidSymbol       VoidSymbol  	Console_4 	
-keycode  45 = five             percent          VoidSymbol       VoidSymbol       VoidSymbol  	Console_5 	
-keycode  46 = six              ampersand        VoidSymbol       VoidSymbol       VoidSymbol      
-keycode  47 = seven            apostrophe       VoidSymbol       VoidSymbol       VoidSymbol      
-keycode  48 = eight            parenleft        VoidSymbol       VoidSymbol       VoidSymbol      
-keycode  49 = nine             parenright       VoidSymbol       VoidSymbol       VoidSymbol      
-keycode  50 = zero             asciitilde       VoidSymbol       VoidSymbol       VoidSymbol      
-keycode  51 = minus            equal            VoidSymbol       VoidSymbol       VoidSymbol      
-keycode  52 = asciicircum      asciitilde       VoidSymbol       VoidSymbol       VoidSymbol      
-keycode  53 = backslash        bar              VoidSymbol       VoidSymbol       VoidSymbol      
-keycode  54 = bracketleft      braceleft        VoidSymbol       VoidSymbol       VoidSymbol      
-keycode  55 = at               grave            VoidSymbol       VoidSymbol       VoidSymbol      
-keycode  56 = Control          Control          Control          Control          Control         
-keycode  57 = Alt              Alt              Alt              Alt              Alt             
-keycode  58 = Control          Control          Control          Control          Control         
-keycode  59 = minus            VoidSymbol       at	         VoidSymbol       VoidSymbol      
-keycode  60 = Shift_Lock       Shift_Lock       Shift_Lock       Shift_Lock       Shift_Lock      
-keycode  61 = VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol      
-keycode  62 = VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol      
-keycode  63 = comma            slash            less             VoidSymbol       VoidSymbol      
-keycode  64 = VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol      
-keycode  65 = Tab              Tab              Caps_Lock        Tab              Tab             
-keycode  66 = VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol      
-keycode  67 = VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol      
-keycode  68 = VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol      
-keycode  69 = Alt	       VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol      
-keycode  70 = slash            VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol      
-keycode  71 = KP_1             KP_1             KP_1             KP_1             KP_1            
-keycode  72 = KP_2             KP_2             KP_2             KP_2             KP_2            
-keycode  73 = KP_3             KP_3             KP_3             KP_3             KP_3            
-keycode  74 = KP_4             KP_4             KP_4             KP_4             KP_4            
-keycode  75 = KP_5             KP_5             KP_5             KP_5             KP_5            
-keycode  76 = KP_6             KP_6             KP_6             KP_6             KP_6            
-keycode  77 = KP_7             KP_7             KP_7             KP_7             KP_7            
-keycode  78 = KP_8             KP_8             KP_8             KP_8             KP_8            
-keycode  79 = KP_9             KP_9             KP_9             KP_9             KP_9            
-keycode  80 = KP_0             KP_0             KP_0             KP_0             KP_0            
-keycode  81 = Delete           Delete           Delete           Delete           Delete          
-keycode  82 = KP_Divide        KP_Divide        KP_Divide        KP_Divide        KP_Divide       
-keycode  83 = KP_Multiply      KP_Multiply      KP_Multiply      KP_Multiply      KP_Multiply     
-keycode  84 = Return           Return           Return           Return           Return          
-keycode  85 = KP_Subtract      KP_Subtract      KP_Subtract      KP_Subtract      KP_Subtract     
-keycode  86 = KP_Add           KP_Add           KP_Add           KP_Add           KP_Add          
-keycode  87 = KP_Enter         KP_Enter         KP_Enter         KP_Enter         KP_Enter        
-keycode  88 = F9               F9               F9               F9               F9              
-keycode  89 = F10              F10              F10              F10              F10             
-keycode  90 = F13              F13              F13              F13              F13             
-keycode  91 = VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol      
-keycode  92 = space            space            space            space            space           
-keycode  93 = KP_Period        KP_Period        KP_Period        KP_Period        KP_Period       
-keycode  94 = Escape           Escape           Escape           Escape
-keycode  95 = semicolon        plus             VoidSymbol       VoidSymbol       VoidSymbol      
-keycode  96 = colon            asterisk         VoidSymbol       VoidSymbol       VoidSymbol      
-keycode  97 = bracketright     braceright       VoidSymbol       VoidSymbol       VoidSymbol      
-keycode  98 = comma            less             VoidSymbol       VoidSymbol       VoidSymbol      
-keycode  99 = period           greater          VoidSymbol       VoidSymbol       VoidSymbol      
-keycode 100 = slash            question         VoidSymbol       VoidSymbol       VoidSymbol      
-keycode 101 = underscore       underscore       VoidSymbol       VoidSymbol       VoidSymbol      
-keycode 102 = F15	       VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol      
-keycode 103 = period           question         greater          VoidSymbol       VoidSymbol      
-keycode 104 = Find             Find             Find             Find             Find            
-keycode 105 = Select           Select           Select           Select           Select          
-keycode 106 = Prior            Scroll_Backward  Prior            Prior            Prior           
-keycode 107 = Next             Scroll_Forward   Next             Next             Next            
-keycode 108 = VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol      
-keycode 109 = VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol      
-keycode 110 = VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol      
-keycode 111 = VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol      
-keycode 112 = Shift            Shift            Shift            Shift            Shift      
-keycode 113 = VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol      
-keycode 114 = VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol      
-keycode 115 = VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol      
-keycode 116 = VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol      
-keycode 117 = Control          Control          Control          Control          Control         
-keycode 118 = VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol      
-keycode 119 = VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol      
-keycode 120 = VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol      
-keycode 121 = VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol      
-keycode 122 = VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol      
-keycode 123 = VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol      
-keycode 124 = VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol      
-keycode 125 = Up               Up               Up               Up
-keycode 126 = Down             Down             Down             Down
-keycode 127 = VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol       VoidSymbol      
diff --git a/meta/recipes-bsp/keymaps/files/spitz/keymap-2.6.map b/meta/recipes-bsp/keymaps/files/spitz/keymap-2.6.map
deleted file mode 100644
index 11a0e8b..0000000
--- a/meta/recipes-bsp/keymaps/files/spitz/keymap-2.6.map
+++ /dev/null
@@ -1,228 +0,0 @@
-# Default kernel keymap. This uses 7 modifier combinations.
-keymaps 0-2,4-5,8,12
-# Change the above line into
-#	keymaps 0-2,4-6,8,12
-# in case you want the entries
-#	altgr   control keycode  83 = Boot            
-#	altgr   control keycode 111 = Boot            
-# below.
-#
-keycode   1 =        
-keycode   2 = one              exclam    
-	control alt     keycode  2 = Console_1
-keycode   3 = two              quotedbl			
-	control alt     keycode  3 = Console_2
-keycode   4 = three            numbersign      
-	control alt     keycode  4 = Console_3
-keycode   5 = four             dollar           
-	control alt     keycode  5 = Console_4
-keycode   6 = five             percent         
-	control alt     keycode  6 = Console_5
-keycode   7 = six              ampersand     
-	control alt     keycode  7 = Console_6
-keycode   8 = seven            apostrophe
-keycode   9 = eight            parenleft
-keycode  10 = nine             parenright
-keycode  11 = zero             asciitilde
-keycode  12 = minus            at
-	altgr keycode 12 = at
-keycode  13 = 
-keycode  14 = BackSpace
-	altgr keycode 14 = Delete
-keycode  15 = Tab
-	altgr keycode 15 = Caps_Lock
-keycode  16 = q               
-keycode  17 = w               
-	altgr keycode 17 = asciicircum
-keycode  18 = e
-	altgr keycode 18 = equal
-keycode  19 = r          
-	altgr keycode 19 = plus     
-keycode  20 = t               
-	altgr keycode 20 = bracketleft
-keycode  21 = y               
-	altgr keycode 21 = bracketright
-keycode  22 = u      
-	altgr keycode 22 = braceleft         
-keycode  23 = i           
-	altgr keycode 23 = braceright    
-keycode  24 = o               
-keycode  25 = p               
-keycode  26 = 
-keycode  27 =
-keycode  28 = Return          
-keycode  29 = Control         
-keycode  30 = a
-keycode  31 = s               
-keycode  32 = d
-keycode  33 = f
-	altgr keycode 33 = backslash             
-keycode  34 = g               
-	altgr keycode 34 = semicolon
-keycode  35 = h         
-	altgr keycode 35 = colon      
-keycode  36 = j        
-	altgr keycode 36 = asterisk       
-keycode  37 = k   
-    altgr keycode 37 = backslash
-keycode  38 = l         
-	altgr keycode 38 = bar      
-keycode  39 =  
-keycode  40 = 
-keycode  41 =     
-keycode  42 = Shift           
-keycode  43 =  
-keycode  44 = z               
-keycode  45 = x               
-keycode  46 = c
-keycode  47 = v               
-keycode  48 = b
-	altgr keycode 48 = underscore
-keycode  49 = n               
-keycode  50 = m               
-keycode  51 = comma		slash
-	altgr keycode 51 = less
-keycode  52 = period           question         
-	altgr     keycode  52 = greater     
-keycode  53 =      
-keycode  54 = Shift           
-keycode  55 = 
-keycode  56 = Alt             
-keycode  57 = space            space           
-	control keycode  57 = nul   
-keycode 59 = F9
-keycode 60 = F10
-keycode 61 = AltGr
-keycode 62 = Escape
-keycode 63 = Return
-keycode 64 = Escape
-keycode 65 = Down
-keycode 66 = Up
-keycode 67 = Control
-keycode 68 = F13
-keycode 79 = F15
-keycode 80 = F16
-keycode 82 = F17
-keycode 87 = Return
-keycode 88 = F11	          
-keycode 97 = Control  
-keycode 99 = F12       
-keycode 103 = Up              
-	altgr     keycode 103 = PageUp
-keycode 105 = Left            
-	altgr     keycode 105 = Decr_Console
-keycode 106 = Right           
-	altgr     keycode 106 = Incr_Console
-keycode 108 = Down  
-	altgr     keycode 108 = PageDown
-	
-
-# LCD Softkeys as represented by zaurusd	
-keycode 82 = F5	
-keycode 79 = F15		# Home
-keycode 80 = F6
-keycode 81 = F16		# Email
-keycode 75 = F7
-keycode 76 = F17		# Addresses
-keycode 77 = F8
-keycode 71 = F18		# Calendar
-keycode 72 = F9
-keycode 73 = F19		# Book
-keycode 78 = F10
-
-string F1 = "\033[[A"
-string F2 = "\033[[B"
-string F3 = "\033[[C"
-string F4 = "\033[[D"
-string F5 = "\033[[E"
-string F6 = "\033[17~"
-string F7 = "\033[18~"
-string F8 = "\033[19~"
-string F9 = "\033[20~"
-string F10 = "\033[21~"
-string F11 = "\033[23~"
-string F12 = "\033[24~"
-string F13 = "\033[25~"
-string F14 = "\033[26~"
-string F15 = "\033[28~"
-string F16 = "\033[29~"
-string F17 = "\033[31~"
-string F18 = "\033[32~"
-string F19 = "\033[33~"
-string F20 = "\033[34~"
-string Find = "\033[1~"
-string Insert = "\033[2~"
-string Remove = "\033[3~"
-string Select = "\033[4~"
-string Prior = "\033[5~"
-string Next = "\033[6~"
-string Macro = "\033[M"
-string Pause = "\033[P"
-compose '`' 'A' to '¿'
-compose '`' 'a' to '‡'
-compose '\'' 'A' to '¡'
-compose '\'' 'a' to '·'
-compose '^' 'A' to '¬'
-compose '^' 'a' to '‚'
-compose '~' 'A' to '√'
-compose '~' 'a' to '„'
-compose '"' 'A' to 'ƒ'
-compose '"' 'a' to '‰'
-compose 'O' 'A' to '≈'
-compose 'o' 'a' to 'Â'
-compose '0' 'A' to '≈'
-compose '0' 'a' to 'Â'
-compose 'A' 'A' to '≈'
-compose 'a' 'a' to 'Â'
-compose 'A' 'E' to '∆'
-compose 'a' 'e' to 'Ê'
-compose ',' 'C' to '«'
-compose ',' 'c' to 'Á'
-compose '`' 'E' to '»'
-compose '`' 'e' to 'Ë'
-compose '\'' 'E' to '…'
-compose '\'' 'e' to 'È'
-compose '^' 'E' to ' '
-compose '^' 'e' to 'Í'
-compose '"' 'E' to 'À'
-compose '"' 'e' to 'Î'
-compose '`' 'I' to 'Ã'
-compose '`' 'i' to 'Ï'
-compose '\'' 'I' to 'Õ'
-compose '\'' 'i' to 'Ì'
-compose '^' 'I' to 'Œ'
-compose '^' 'i' to 'Ó'
-compose '"' 'I' to 'œ'
-compose '"' 'i' to 'Ô'
-compose '-' 'D' to '–'
-compose '-' 'd' to ''
-compose '~' 'N' to '—'
-compose '~' 'n' to 'Ò'
-compose '`' 'O' to '“'
-compose '`' 'o' to 'Ú'
-compose '\'' 'O' to '”'
-compose '\'' 'o' to 'Û'
-compose '^' 'O' to '‘'
-compose '^' 'o' to 'Ù'
-compose '~' 'O' to '’'
-compose '~' 'o' to 'ı'
-compose '"' 'O' to '÷'
-compose '"' 'o' to 'ˆ'
-compose '/' 'O' to 'ÿ'
-compose '/' 'o' to '¯'
-compose '`' 'U' to 'Ÿ'
-compose '`' 'u' to '˘'
-compose '\'' 'U' to '⁄'
-compose '\'' 'u' to '˙'
-compose '^' 'U' to '€'
-compose '^' 'u' to '˚'
-compose '"' 'U' to '‹'
-compose '"' 'u' to '¸'
-compose '\'' 'Y' to '›'
-compose '\'' 'y' to '˝'
-compose 'T' 'H' to 'ﬁ'
-compose 't' 'h' to '˛'
-compose 's' 's' to 'ﬂ'
-compose '"' 'y' to 'ˇ'
-compose 's' 'z' to 'ﬂ'
-compose 'i' 'j' to 'ˇ'
diff --git a/meta/recipes-bsp/keymaps/files/tosa/keymap-2.4.map b/meta/recipes-bsp/keymaps/files/tosa/keymap-2.4.map
deleted file mode 100644
index 31ca75b..0000000
--- a/meta/recipes-bsp/keymaps/files/tosa/keymap-2.4.map
+++ /dev/null
@@ -1,133 +0,0 @@
-keymaps 0-2,4-5
-alt_is_meta
-keycode   1 = a              
-keycode   2 = b               
-keycode   3 = c               
-keycode   4 = d               
-keycode   5 = e               
-keycode   6 = f               
-keycode   7 = g               
-keycode   8 = h               
-keycode   9 = i               
-keycode  10 = j               
-keycode  11 = k               
-keycode  12 = l               
-keycode  13 = m               
-keycode  14 = n               
-keycode  15 = o               
-keycode  16 = p               
-keycode  17 = q               
-keycode  18 = r               
-keycode  19 = s               
-keycode  20 = t               
-keycode  21 = u               
-keycode  22 = v               
-keycode  23 = w               
-keycode  24 = x               
-keycode  25 = y               
-keycode  26 = z               
-keycode  27 = Shift           
-keycode  28 = Return          
-keycode  29 = F11              
-keycode  30 = AltGr
-keycode  31 = BackSpace       
-keycode  32 = Num_Lock             
-keycode  33 = F15 
-keycode  34 = Escape          
-keycode  35 = Left           
-	altgr keycode 35 = Decr_Console
-keycode  36 = Up              
-keycode  37 = Down            
-keycode  38 = Right           
-	altgr keycode 38 = Incr_Console
-keycode  39 = Return          
-keycode  40 = F12
-keycode  41 = one             exclam		one
-keycode  42 = two             quotedbl		two
-keycode  43 = three           numbersign	three
-keycode  44 = four            dollar		four
-keycode  45 = five            percent		five
-keycode  46 = six             ampersand		six
-keycode  47 = seven           apostrophe	seven
-keycode  48 = eight           parenleft		eight
-keycode  49 = nine            parenright	nine
-keycode  50 = zero            asciitilde	zero
-keycode  51 = minus           equal
-keycode  52 = asciicircum     asciitilde
-keycode  53 = backslash       bar
-keycode  54 = bracketleft     braceleft
-keycode  55 = at              grave
-keycode  56 = Control      
-keycode  57 = Alt          
-keycode  58 = minus           
-keycode  59 = plus            
-keycode  60 = Caps_Lock      
-keycode  61 = at              
-keycode  62 = question        
-keycode  63 = comma           
-keycode  64 = period          
-keycode  65 = Tab             
-keycode  66 = F5              
-keycode  67 = F6              
-keycode  68 = F7              
-keycode  69 = slash           
-keycode  70 = apostrophe      
-keycode  71 = semicolon       
-keycode  72 = quotedbl        
-keycode  73 = colon           
-keycode  74 = numbersign      
-keycode  75 = dollar          
-keycode  76 = percent         
-keycode  77 = underscore      
-keycode  78 = ampersand       
-keycode  79 = asterisk        
-keycode  80 = parenleft       
-keycode  81 = Delete          
-keycode  82 = F10             
-keycode  83 = equal           
-keycode  84 = parenright      
-keycode  85 = asciitilde      
-keycode  86 = less            
-keycode  87 = greater         
-keycode  88 = F9              
-keycode  89 = F10             
-keycode  90 = F13             
-keycode  91 = space           
-	control	keycode  91 = nul             
-keycode  92 = space           
-	control	keycode  92 = nul             
-keycode  93 =  
-keycode  94 = exclam
-keycode  95 = semicolon
-keycode  96 = colon
-keycode  97 = bracketright
-keycode  98 = comma
-keycode  99 = period
-keycode 100 = slash
-keycode 101 = underscore
-keycode 102 = F15
-keycode 103 = Shift           
-keycode 104 = Find         
-keycode 105 = Select         
-keycode 106 = Prior             
-keycode 107 = Next             
-keycode 108 = AltGr           
-keycode 109 = F31
-keycode 110 = 
-keycode 111 =
-keycode 112 = Shift
-keycode 113 =
-keycode 114 =
-keycode 115 =
-keycode 116 = underscore
-keycode 117 = Control
-keycode 118 =
-keycode 119 =
-keycode 120 = F24
-keycode 121 = Left
-keycode 122 = Up
-keycode 123 = Down
-keycode 124 = Right
-keycode 125 = Up
-keycode 126 = Down
-keycode 127 =
diff --git a/meta/recipes-bsp/keymaps/files/tosa/keymap-2.6.map b/meta/recipes-bsp/keymaps/files/tosa/keymap-2.6.map
deleted file mode 100644
index b85d561..0000000
--- a/meta/recipes-bsp/keymaps/files/tosa/keymap-2.6.map
+++ /dev/null
@@ -1,210 +0,0 @@
-# Default kernel keymap. This uses 7 modifier combinations.
-keymaps 0-2,4-5,8,12
-# Change the above line into
-#	keymaps 0-2,4-6,8,12
-# in case you want the entries
-#	altgr   control keycode  83 = Boot            
-#	altgr   control keycode 111 = Boot            
-# below.
-#
-keycode   1 =        
-keycode  14 = BackSpace
-	altgr keycode 14 = Delete
-keycode  15 = Tab
-	altgr keycode 65 = Caps_Lock
-keycode  16 = q
-	altgr keycode 16 = one
-keycode  17 = w               
-	altgr keycode 17 = two
-keycode  18 = e
-	altgr keycode 18 = three
-keycode  19 = r          
-	altgr keycode 19 = four
-keycode  20 = t               
-	altgr keycode 20 = five
-keycode  21 = y               
-	altgr keycode 21 = six
-keycode  22 = u      
-	altgr keycode 22 = seven
-keycode  23 = i           
-	altgr keycode 23 = eight
-keycode  24 = o               
-	altgr keycode 24 = nine
-keycode  25 = p               
-	altgr keycode 25 = zero
-keycode  26 = 
-keycode  27 =
-keycode  28 = Return          
-	altgr     keycode  28 = greater     
-keycode  29 = Control         
-keycode  30 = a
-	altgr keycode 30 = exclam
-keycode  31 = s               
-	altgr keycode 31 = at
-keycode  32 = d
-	altgr keycode 32 = numbersign
-keycode  33 = f
-	altgr keycode 33 = dollar
-keycode  34 = g               
-	altgr keycode 34 = percent
-keycode  35 = h         
-	altgr keycode 35 = underscore
-keycode  36 = j        
-	altgr keycode 36 = ampersand
-keycode  37 = k   
-    altgr keycode 37 = asterisk
-keycode  38 = l         
-	altgr keycode 38 = parenleft
-keycode  39 =  
-keycode  40 = apostrophe
-	altgr keycode 40 = asciitilde
-	shift keycode 40 = quotedbl
-keycode  41 =     
-keycode  42 = Shift           
-keycode  43 =  
-keycode  44 = z               
-keycode  45 = x               
-keycode  46 = c
-keycode  47 = v               
-keycode  48 = b
-	altgr keycode 48 = minus
-keycode  49 = n               
-	altgr keycode 49 = plus
-keycode  50 = m               
-	altgr keycode 50 = equal
-keycode  51 = comma
-	altgr keycode 51 = parenright
-	shift keycode 51 = semicolon
-keycode  52 = period           
-	shift keycode 52 = colon
-	altgr keycode 52 = less
-
-keycode  53 = slash
-	shift keycode 53 = question
-	altgr keycode 53 = Num_Lock
-
-keycode  54 = Shift           
-keycode  55 = 
-keycode  56 = Alt             
-keycode  57 = space            space           
-	control keycode  57 = nul   
-	altgr keycode 57 = bar
-keycode 59 = F9
-keycode 60 = F10
-keycode 61 = AltGr
-keycode 62 = Escape
-keycode 63 = space
-keycode 64 = Control
-keycode 65 = F15
-keycode 66 = F24
-keycode 67 = F12
-keycode 68 = F13
-keycode 79 = F15
-keycode 80 = F16
-keycode 82 = F17
-keycode 87 = Return
-keycode 88 = F11	          
-keycode 97 = Control  
-keycode 99 = F12       
-keycode 103 = Up              
-keycode 105 = Left            
-	altgr     keycode 105 = Decr_Console
-keycode 106 = Right           
-	altgr     keycode 106 = Incr_Console
-keycode 108 = Down  
-string F1 = "\033[[A"
-string F2 = "\033[[B"
-string F3 = "\033[[C"
-string F4 = "\033[[D"
-string F5 = "\033[[E"
-string F6 = "\033[17~"
-string F7 = "\033[18~"
-string F8 = "\033[19~"
-string F9 = "\033[20~"
-string F10 = "\033[21~"
-string F11 = "\033[23~"
-string F12 = "\033[24~"
-string F13 = "\033[25~"
-string F14 = "\033[26~"
-string F15 = "\033[28~"
-string F16 = "\033[29~"
-string F17 = "\033[31~"
-string F18 = "\033[32~"
-string F19 = "\033[33~"
-string F20 = "\033[34~"
-string Find = "\033[1~"
-string Insert = "\033[2~"
-string Remove = "\033[3~"
-string Select = "\033[4~"
-string Prior = "\033[5~"
-string Next = "\033[6~"
-string Macro = "\033[M"
-string Pause = "\033[P"
-compose '`' 'A' to '¿'
-compose '`' 'a' to '‡'
-compose '\'' 'A' to '¡'
-compose '\'' 'a' to '·'
-compose '^' 'A' to '¬'
-compose '^' 'a' to '‚'
-compose '~' 'A' to '√'
-compose '~' 'a' to '„'
-compose '"' 'A' to 'ƒ'
-compose '"' 'a' to '‰'
-compose 'O' 'A' to '≈'
-compose 'o' 'a' to 'Â'
-compose '0' 'A' to '≈'
-compose '0' 'a' to 'Â'
-compose 'A' 'A' to '≈'
-compose 'a' 'a' to 'Â'
-compose 'A' 'E' to '∆'
-compose 'a' 'e' to 'Ê'
-compose ',' 'C' to '«'
-compose ',' 'c' to 'Á'
-compose '`' 'E' to '»'
-compose '`' 'e' to 'Ë'
-compose '\'' 'E' to '…'
-compose '\'' 'e' to 'È'
-compose '^' 'E' to ' '
-compose '^' 'e' to 'Í'
-compose '"' 'E' to 'À'
-compose '"' 'e' to 'Î'
-compose '`' 'I' to 'Ã'
-compose '`' 'i' to 'Ï'
-compose '\'' 'I' to 'Õ'
-compose '\'' 'i' to 'Ì'
-compose '^' 'I' to 'Œ'
-compose '^' 'i' to 'Ó'
-compose '"' 'I' to 'œ'
-compose '"' 'i' to 'Ô'
-compose '-' 'D' to '–'
-compose '-' 'd' to ''
-compose '~' 'N' to '—'
-compose '~' 'n' to 'Ò'
-compose '`' 'O' to '“'
-compose '`' 'o' to 'Ú'
-compose '\'' 'O' to '”'
-compose '\'' 'o' to 'Û'
-compose '^' 'O' to '‘'
-compose '^' 'o' to 'Ù'
-compose '~' 'O' to '’'
-compose '~' 'o' to 'ı'
-compose '"' 'O' to '÷'
-compose '"' 'o' to 'ˆ'
-compose '/' 'O' to 'ÿ'
-compose '/' 'o' to '¯'
-compose '`' 'U' to 'Ÿ'
-compose '`' 'u' to '˘'
-compose '\'' 'U' to '⁄'
-compose '\'' 'u' to '˙'
-compose '^' 'U' to '€'
-compose '^' 'u' to '˚'
-compose '"' 'U' to '‹'
-compose '"' 'u' to '¸'
-compose '\'' 'Y' to '›'
-compose '\'' 'y' to '˝'
-compose 'T' 'H' to 'ﬁ'
-compose 't' 'h' to '˛'
-compose 's' 's' to 'ﬂ'
-compose '"' 'y' to 'ˇ'
-compose 's' 'z' to 'ﬂ'
-compose 'i' 'j' to 'ˇ'
diff --git a/meta/recipes-bsp/keymaps/keymaps_1.0.bb b/meta/recipes-bsp/keymaps/keymaps_1.0.bb
index 7f2211a..4683fa1 100644
--- a/meta/recipes-bsp/keymaps/keymaps_1.0.bb
+++ b/meta/recipes-bsp/keymaps/keymaps_1.0.bb
@@ -5,35 +5,17 @@ RDEPENDS_${PN} = "initscripts console-tools"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-PR = "r18"
+PR = "r19"
 
 inherit update-rc.d
 
 SRC_URI = "file://keymap.sh \
 	   file://GPLv2.patch"
 
-SRC_URI_append_c7x0         = " file://keymap-*.map"
-SRC_URI_append_tosa         = " file://keymap-*.map"
-SRC_URI_append_akita        = " file://keymap-*.map"
-SRC_URI_append_spitz        = " file://keymap-*.map"
-SRC_URI_append_collie       = " file://keymap-*.map"
-SRC_URI_append_poodle       = " file://keymap-*.map"
-SRC_URI_append_jornada6xx   = " file://keymap-*.map"
-SRC_URI_append_h2200        = " file://keymap-*.map"
-SRC_URI_append_htcuniversal = " file://keymap-*.map"
-
 INITSCRIPT_NAME = "keymap.sh"
 INITSCRIPT_PARAMS = "start 01 S ."
 
 do_install () {
     install -d ${D}${sysconfdir}/init.d/
     install -m 0755 ${WORKDIR}/keymap.sh ${D}${sysconfdir}/init.d/
-
-    case ${MACHINE} in
-        c7x0 | tosa | spitz | akita | borzoi | collie | poodle | jornada6xx | h2200 | htcuniversal )
-            install -m 0644 ${WORKDIR}/keymap-*.map	${D}${sysconfdir}
-            ;;
-        *)
-            ;;
-    esac
 }
diff --git a/meta/recipes-bsp/pointercal/files/akita/pointercal b/meta/recipes-bsp/pointercal/files/akita/pointercal
deleted file mode 100644
index 89f407e..0000000
--- a/meta/recipes-bsp/pointercal/files/akita/pointercal
+++ /dev/null
@@ -1 +0,0 @@
-12 -8946 33795672 12135 73 -2444604 65536
diff --git a/meta/recipes-bsp/pointercal/files/c7x0/pointercal b/meta/recipes-bsp/pointercal/files/c7x0/pointercal
deleted file mode 100644
index eb99f60..0000000
--- a/meta/recipes-bsp/pointercal/files/c7x0/pointercal
+++ /dev/null
@@ -1 +0,0 @@
-12572 -34 -2892400 5 8615 -1959428 65536
diff --git a/meta/recipes-bsp/pointercal/files/htcuniversal/pointercal b/meta/recipes-bsp/pointercal/files/htcuniversal/pointercal
deleted file mode 100644
index f78c816..0000000
--- a/meta/recipes-bsp/pointercal/files/htcuniversal/pointercal
+++ /dev/null
@@ -1 +0,0 @@
--1143 6 34078032 0 1470 -2677528 65536
diff --git a/meta/recipes-bsp/pointercal/files/om-gta01/pointercal b/meta/recipes-bsp/pointercal/files/om-gta01/pointercal
deleted file mode 100644
index 198fd2a..0000000
--- a/meta/recipes-bsp/pointercal/files/om-gta01/pointercal
+++ /dev/null
@@ -1 +0,0 @@
--67 36365 -2733100 -48253 -310 45219816 65536
diff --git a/meta/recipes-bsp/pointercal/files/omap-3430ldp/pointercal b/meta/recipes-bsp/pointercal/files/omap-3430ldp/pointercal
deleted file mode 100644
index 42cf01b..0000000
--- a/meta/recipes-bsp/pointercal/files/omap-3430ldp/pointercal
+++ /dev/null
@@ -1 +0,0 @@
--15 8748 -1858708 11310 31 -2326312 65536
diff --git a/meta/recipes-bsp/pointercal/files/spitz/pointercal b/meta/recipes-bsp/pointercal/files/spitz/pointercal
deleted file mode 100644
index 7e9f7a8..0000000
--- a/meta/recipes-bsp/pointercal/files/spitz/pointercal
+++ /dev/null
@@ -1 +0,0 @@
-16 -8880 34043380 12130 72 -2479548 65536
diff --git a/meta/recipes-bsp/zaurusd/zaurusd_svn.bb b/meta/recipes-bsp/zaurusd/zaurusd_svn.bb
deleted file mode 100644
index 455a29f..0000000
--- a/meta/recipes-bsp/zaurusd/zaurusd_svn.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-DESCRIPTION = "Daemon to handle device specifc features."
-SECTION = "base"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-DEPENDS = "tslib"
-RDEPENDS_${PN} = "xrandr"
-PV = "0.0+svnr${SRCPV}"
-PR = "r2"
-
-SRC_URI = "svn://svn.o-hand.com/repos/misc/trunk;module=zaurusd;proto=http"
-
-S = "${WORKDIR}/${PN}"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-inherit autotools pkgconfig update-rc.d
-
-INITSCRIPT_NAME = "zaurusd"
-INITSCRIPT_PARAMS = "start 99 5 2 . stop 20 0 1 6 ."
diff --git a/meta/recipes-core/base-files/base-files/akita/fstab b/meta/recipes-core/base-files/base-files/akita/fstab
deleted file mode 100644
index 5f2c941..0000000
--- a/meta/recipes-core/base-files/base-files/akita/fstab
+++ /dev/null
@@ -1,16 +0,0 @@
-/dev/mtdblock2	/ 	jffs2	rw,noatime	1  1 
-/dev/mtdblock3	/home 	jffs2	defaults,noatime	1  2
-proc		/proc	proc	defaults	0  0
-/dev/hda1	/media/cf	auto	defaults,sync,noauto	0  0
-
-tmpfs		/var/volatile	tmpfs   defaults        0  0
-tmpfs		/media/ram	tmpfs	defaults	0  0
-
-# SD/MMC in kernel 2.4
-/dev/mmcda1	/media/card	auto	defaults,sync,noauto	0  0
-# SD/MMC in kernel 2.6
-/dev/mmcblk0p1	/media/card	auto	defaults,sync,noauto	0  0
-
-# USB Storage
-/dev/sda1 /media/usbhdd		vfat	noauto,umask=000,noatime,iocharset=utf8,codepage=932	0	0
-
diff --git a/meta/recipes-core/base-files/base-files/akita/rotation b/meta/recipes-core/base-files/base-files/akita/rotation
deleted file mode 100644
index 2a14d60..0000000
--- a/meta/recipes-core/base-files/base-files/akita/rotation
+++ /dev/null
@@ -1 +0,0 @@
-270
\ No newline at end of file
diff --git a/meta/recipes-core/base-files/base-files/c7x0/fstab b/meta/recipes-core/base-files/base-files/c7x0/fstab
deleted file mode 100644
index e065e81..0000000
--- a/meta/recipes-core/base-files/base-files/c7x0/fstab
+++ /dev/null
@@ -1,12 +0,0 @@
-/dev/mtdblock2	/ 	jffs2	rw,noatime	1  1 
-/dev/mtdblock3	/home 	jffs2	defaults,noatime	1  2
-proc		/proc	proc	defaults	0  0
-/dev/hda1	/media/cf	auto	defaults,sync,noauto	0  0
-
-tmpfs		/var/volatile	tmpfs   defaults        0  0
-tmpfs		/media/ram	tmpfs	defaults	0  0
-
-# SD/MMC in kernel 2.4
-/dev/mmcda1	/media/card	auto	defaults,sync,noauto	0  0
-# SD/MMC in kernel 2.6
-/dev/mmcblk0p1	/media/card	auto	defaults,sync,noauto	0  0
diff --git a/meta/recipes-core/base-files/base-files/c7x0/usbd b/meta/recipes-core/base-files/base-files/c7x0/usbd
deleted file mode 100644
index 40931ee..0000000
--- a/meta/recipes-core/base-files/base-files/c7x0/usbd
+++ /dev/null
@@ -1 +0,0 @@
-usbdmodule=pxa_bi
diff --git a/meta/recipes-core/base-files/base-files/collie/fstab b/meta/recipes-core/base-files/base-files/collie/fstab
deleted file mode 100644
index dc3499b..0000000
--- a/meta/recipes-core/base-files/base-files/collie/fstab
+++ /dev/null
@@ -1,8 +0,0 @@
-/dev/mtdblock4	/ 	jffs2	defaults	1  1 
-proc            /proc   proc    defaults        0  0
-/dev/hda1	/media/cf	auto	defaults,sync,noauto,noatime,user,exec,suid,gid=100,umask=0002	0  0
-/dev/mmcda1	/media/card	auto	defaults,sync,noauto,noatime,user,exec,suid	0  0
-tmpfs		/var/volatile	tmpfs	defaults	0  0
-
-# we use a non-volatile ramdisk, see /etc/init.d/ramdisk
-#tmpfs		/media/ram	tmpfs	defaults	0  0
diff --git a/meta/recipes-core/base-files/base-files/collie/usbd b/meta/recipes-core/base-files/base-files/collie/usbd
deleted file mode 100644
index 4257614..0000000
--- a/meta/recipes-core/base-files/base-files/collie/usbd
+++ /dev/null
@@ -1 +0,0 @@
-usbdmodule=sa1100_bi
diff --git a/meta/recipes-core/base-files/base-files/htcuniversal/rotation b/meta/recipes-core/base-files/base-files/htcuniversal/rotation
deleted file mode 100644
index 2a14d60..0000000
--- a/meta/recipes-core/base-files/base-files/htcuniversal/rotation
+++ /dev/null
@@ -1 +0,0 @@
-270
\ No newline at end of file
diff --git a/meta/recipes-core/base-files/base-files/hx2000/fstab b/meta/recipes-core/base-files/base-files/hx2000/fstab
deleted file mode 100644
index 2d4b7aa..0000000
--- a/meta/recipes-core/base-files/base-files/hx2000/fstab
+++ /dev/null
@@ -1,9 +0,0 @@
-/dev/mtdblock2 	/		jffs2	defaults		1  1		
-/dev/mtdblock3 	/home   jffs2   defaults        1  1
-
-proc            /proc		proc    defaults        0  0
-sys             /sys        sysfs	defaults        0  0
-
-/dev/hda1		/media/cf	auto	defaults,noauto,noatime,exec,suid	0  0
-tmpfs			/var/volatile	tmpfs	defaults	0  0
-tmpfs			/media/ram	tmpfs	defaults	0  0
diff --git a/meta/recipes-core/base-files/base-files/mtx-1/fstab b/meta/recipes-core/base-files/base-files/mtx-1/fstab
deleted file mode 100644
index ee3fab0..0000000
--- a/meta/recipes-core/base-files/base-files/mtx-1/fstab
+++ /dev/null
@@ -1,8 +0,0 @@
-# /etc/fstab: static file system information. mtx-1
-#
-# <file system> <mount pt>     <type>     <options>         <dump> <pass>
-rootfs          /              auto       defaults          1      1
-tmpfs           /var/volatile  tmpfs      size=10m          0      0
-proc            /proc          proc       defaults          0      0
-devpts          /dev/pts       devpts     mode=0620,gid=5   0      0
-usbdevfs        /proc/bus/usb  usbdevfs   noauto            0      0
diff --git a/meta/recipes-core/base-files/base-files/mtx-1/profile b/meta/recipes-core/base-files/base-files/mtx-1/profile
deleted file mode 100644
index bedf2fc..0000000
--- a/meta/recipes-core/base-files/base-files/mtx-1/profile
+++ /dev/null
@@ -1,25 +0,0 @@
-# /etc/profile: system-wide .profile file for the Bourne shell (sh(1))
-# and Bourne compatible shells (bash(1), ksh(1), ash(1), ...).
-
-PATH="/usr/local/bin:/usr/bin:/bin"
-
-if [ "`id -u`" -eq 0 ]; then
-   PATH=$PATH:/usr/local/sbin:/usr/sbin:/sbin:
-fi
-if [ "$PS1" ]; then
-# works for bash and ash (no other shells known to be in use here)
-   PS1='\u@\h:\w\$ '
-fi
-
-if [ -d /etc/profile.d ]; then
-  for i in `ls /etc/profile.d/`; do
-    . /etc/profile.d/$i
-  done
-  unset i
-fi
-
-export PATH PS1
-
-umask 022
-
-alias ll="ls -lah"
\ No newline at end of file
diff --git a/meta/recipes-core/base-files/base-files/nokia770/fstab b/meta/recipes-core/base-files/base-files/nokia770/fstab
deleted file mode 100644
index 7dbae25..0000000
--- a/meta/recipes-core/base-files/base-files/nokia770/fstab
+++ /dev/null
@@ -1,6 +0,0 @@
-rootfs          /               rootfs     defaults,errors=remount-ro,noatime  0 0
-/dev/mmcblk0p1  /media/card     auto       defaults,noauto,noatime,exec,suid   0 0
-tmpfs           /var/volatile   tmpfs      defaults             0  0
-tmpfs           /media/ram      tmpfs      defaults             0  0
-proc            /proc           proc       defaults             0  0
-usbdevfs        /proc/bus/usb   usbdevfs   noauto               0  0
diff --git a/meta/recipes-core/base-files/base-files/poodle/fstab b/meta/recipes-core/base-files/base-files/poodle/fstab
deleted file mode 100644
index b96b750..0000000
--- a/meta/recipes-core/base-files/base-files/poodle/fstab
+++ /dev/null
@@ -1,13 +0,0 @@
-/dev/mtdblock2	/ 	jffs2	rw,noatime	1  1 
-/dev/mtdblock3	/home 	jffs2	defaults,noatime	1  2
-proc		/proc	proc	defaults	0  0
-/dev/hda1	/media/cf	auto	defaults,sync,noauto	0  0
-
-# SD/MMC in kernel 2.6
-/dev/mmcblk0p1	/media/card	auto	defaults,sync,noauto	0  0
-
-# SD/MMC in kernel 2.4
-/dev/mmcda1	/media/card	auto	defaults,sync,noauto	0  0
-
-tmpfs		/var/volatile	tmpfs	defaults	0  0
-tmpfs		/media/ram	tmpfs	defaults	0  0
diff --git a/meta/recipes-core/base-files/base-files/poodle/usbd b/meta/recipes-core/base-files/base-files/poodle/usbd
deleted file mode 100644
index 40931ee..0000000
--- a/meta/recipes-core/base-files/base-files/poodle/usbd
+++ /dev/null
@@ -1 +0,0 @@
-usbdmodule=pxa_bi
diff --git a/meta/recipes-core/base-files/base-files/spitz/fstab b/meta/recipes-core/base-files/base-files/spitz/fstab
deleted file mode 100644
index 3d0e508..0000000
--- a/meta/recipes-core/base-files/base-files/spitz/fstab
+++ /dev/null
@@ -1,28 +0,0 @@
-# don't mount /dev/mtdblock2 since Spitz uses pivot_root
-# or 2.6 directly boots from the hdd
-# /dev/mtdblock2     /            jffs2   rw,noatime              1  1
-rootfs             /            auto    defaults                1  1
-proc               /proc        proc    defaults                0  0
-# we can use a normal var filesystem with a microdrive
-# tmpfs              /var         tmpfs   defaults                0  0
-tmpfs              /media/ram   tmpfs   defaults                0  0
-
-# Compact Flash memory cards
-/dev/hdc1       /media/cf       auto    defaults,sync,noauto    0  0
-# SD/MMC in kernel 2.4
-/dev/mmcda1     /media/card     auto    defaults,sync,noauto    0  0
-# SD/MMC in kernel 2.6
-/dev/mmcblk0p1  /media/card     auto    defaults,sync,noauto    0  0
-
-#
-# USB
-#
-/dev/sda1       /media/usbhdd   vfat            noauto,umask=000,noatime,iocharset=utf8,codepage=932    0  0
-devpts          /dev/pts        devpts          mode=0620,gid=5       0  0
-usbfs           /proc/bus/usb   usbfs           noauto                0  0
-
-#
-# Harddisk
-#
-/dev/hda2           /home           ext3	defaults    0  0
-/dev/hda3           /media/hdd      vfat	defaults    0  0
diff --git a/meta/recipes-core/base-files/base-files/spitz/rotation b/meta/recipes-core/base-files/base-files/spitz/rotation
deleted file mode 100644
index 2a14d60..0000000
--- a/meta/recipes-core/base-files/base-files/spitz/rotation
+++ /dev/null
@@ -1 +0,0 @@
-270
\ No newline at end of file
diff --git a/meta/recipes-core/base-files/base-files/tosa/fstab b/meta/recipes-core/base-files/base-files/tosa/fstab
deleted file mode 100644
index e065e81..0000000
--- a/meta/recipes-core/base-files/base-files/tosa/fstab
+++ /dev/null
@@ -1,12 +0,0 @@
-/dev/mtdblock2	/ 	jffs2	rw,noatime	1  1 
-/dev/mtdblock3	/home 	jffs2	defaults,noatime	1  2
-proc		/proc	proc	defaults	0  0
-/dev/hda1	/media/cf	auto	defaults,sync,noauto	0  0
-
-tmpfs		/var/volatile	tmpfs   defaults        0  0
-tmpfs		/media/ram	tmpfs	defaults	0  0
-
-# SD/MMC in kernel 2.4
-/dev/mmcda1	/media/card	auto	defaults,sync,noauto	0  0
-# SD/MMC in kernel 2.6
-/dev/mmcblk0p1	/media/card	auto	defaults,sync,noauto	0  0
diff --git a/meta/recipes-core/base-files/base-files/tosa/usbd b/meta/recipes-core/base-files/base-files/tosa/usbd
deleted file mode 100644
index 8c80044..0000000
--- a/meta/recipes-core/base-files/base-files/tosa/usbd
+++ /dev/null
@@ -1,5 +0,0 @@
-# I know that this was created for usb-client stuff
-# but tosa/2.6 need (un)loading USB Host module
-# on suspend/resume and this way is simplest one ;)
-
-usbdmodule=ohci-hcd
diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index 857df13..1c5078e 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -2,7 +2,7 @@ SUMMARY = "Miscellaneous files for the base system."
 DESCRIPTION = "The base-files package creates the basic system directory structure and provides a small set of key configuration files for the system."
 SECTION = "base"
 PRIORITY = "required"
-PR = "r67"
+PR = "r68"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://licenses/GPL-2;md5=94d55d512a9ba36caa9b7df079bae19f"
 SRC_URI = "file://rotation \
@@ -64,8 +64,6 @@ conffiles = "${sysconfdir}/debian_version ${sysconfdir}/host.conf \
 #
 hostname = "openembedded"
 hostname_slugos = "nslu2"
-hostname_mnci = "MNCI"
-hostname_rt3000 = "MNRT"
 hostname_jlime = "JLime"
 
 BASEFILESISSUEINSTALL ?= "do_install_basefilesissue"
@@ -135,11 +133,6 @@ do_install_basefilesissue () {
  	fi
 }
 
-do_install_append_mnci () {
-	rmdir ${D}/tmp
-	ln -s var/tmp ${D}/tmp
-}
-
 do_install_append_nylon() {
 	printf "" "" >${D}${sysconfdir}/resolv.conf
 	rm -r ${D}/mnt/*
@@ -156,10 +149,6 @@ do_install_append_slugos() {
 	ln -s ../root ${D}/home/root
 }
 
-do_install_append_netbook-pro () {
-	mkdir -p ${D}/initrd
-}
-
 do_install_append_linuxstdbase() {
 	for d in ${dirs3755}; do
                 install -m 0755 -d ${D}$d
@@ -174,10 +163,6 @@ PACKAGES = "${PN}-doc ${PN} ${PN}-dev ${PN}-dbg"
 FILES_${PN} = "/"
 FILES_${PN}-doc = "${docdir} ${datadir}/common-licenses"
 
-# M&N specific packaging
-PACKAGE_ARCH_mnci = "mnci"
-PACKAGE_ARCH_rt3000 = "rt3000"
-
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 # Unslung distribution specific packaging
diff --git a/meta/recipes-core/netbase/netbase-4.45/epia/interfaces b/meta/recipes-core/netbase/netbase-4.45/epia/interfaces
deleted file mode 100644
index 673618f..0000000
--- a/meta/recipes-core/netbase/netbase-4.45/epia/interfaces
+++ /dev/null
@@ -1,10 +0,0 @@
-# /etc/network/interfaces -- configuration file for ifup(8), ifdown(8)
- 
-# The loopback interface
-auto lo
-iface lo inet loopback
-
-# Ethernet
-auto eth0
-iface eth0 inet dhcp
-
diff --git a/meta/recipes-core/netbase/netbase-4.45/mtx-1/interfaces b/meta/recipes-core/netbase/netbase-4.45/mtx-1/interfaces
deleted file mode 100644
index a7c6da5..0000000
--- a/meta/recipes-core/netbase/netbase-4.45/mtx-1/interfaces
+++ /dev/null
@@ -1,29 +0,0 @@
-# /etc/network/interfaces -- configuration file for ifup(8), ifdown(8)
- 
-# The loopback interface
-auto lo
-iface lo inet loopback
-
-# Ethernet
-auto eth0
-iface eth0 inet dhcp
-
-# wlan interface 1 for clients
-auto wlan0
-iface wlan0 inet static
-	address 10.0.0.1
-	netmask 255.0.0.0
-	wireless_mode master
-	wireless_essid cube-ap
-	wireless_channel 1
-	
-# wlan interface 2 for mesh
-auto wlan1
-iface wlan1 inet static
-	address 172.16.0.1
-	netmask 255.240.0.0
-	broadcast 172.31.255.255
-	wireless_mode ad-hoc
-	wireless_essid cube-mesh
-	wireless_channel 11
-	wireless_rts 250
diff --git a/meta/recipes-core/netbase/netbase-4.45/nokia800/interfaces b/meta/recipes-core/netbase/netbase-4.45/nokia800/interfaces
deleted file mode 100644
index 1696776..0000000
--- a/meta/recipes-core/netbase/netbase-4.45/nokia800/interfaces
+++ /dev/null
@@ -1,5 +0,0 @@
-# /etc/network/interfaces -- configuration file for ifup(8), ifdown(8)
- 
-# The loopback interface
-auto lo
-iface lo inet loopback
diff --git a/meta/recipes-core/netbase/netbase-4.45/tosa/interfaces b/meta/recipes-core/netbase/netbase-4.45/tosa/interfaces
deleted file mode 100644
index 0da7168..0000000
--- a/meta/recipes-core/netbase/netbase-4.45/tosa/interfaces
+++ /dev/null
@@ -1,24 +0,0 @@
-# /etc/network/interfaces -- configuration file for ifup(8), ifdown(8)
- 
-# The loopback interface
-auto lo
-iface lo inet loopback
-
-# Wireless interfaces
-iface wlan0 inet dhcp
-  wireless_type wlan-ng
-  wireless_mode Managed
-  pre-up modprobe prism2_usb
-#  pre-up /sbin/usbctl on 1
-#  post-down /sbin/usbctl off 1
-  post-down rmmod prism2_usb
-
-# Wired or wireless interfaces
-iface eth0 inet dhcp
-iface eth1 inet dhcp
-
-# Zaurus usbnet
-iface usbd0 inet dhcp
-
-# usbnet from the other side
-iface usb0 inet dhcp
diff --git a/meta/recipes-core/netbase/netbase-4.45/wrt54/interfaces b/meta/recipes-core/netbase/netbase-4.45/wrt54/interfaces
deleted file mode 100644
index 8b2852a..0000000
--- a/meta/recipes-core/netbase/netbase-4.45/wrt54/interfaces
+++ /dev/null
@@ -1,23 +0,0 @@
-# /etc/network/interfaces -- configuration file for ifup(8), ifdown(8)
-
-# loopback interface
-auto lo
-iface lo inet loopback
-
-# the 4 LAN ports
-auto vlan0
-iface vlan0 inet static
-	address 192.168.1.1
-	netmask 255.255.255.0
-
-# WAN port
-auto vlan1
-iface vlan1 inet dhcp
-
-# wireless interface
-auto eth1
-iface eth1 inet static
-	wireless_mode master
-	wireless_essid wrt
-	address 10.0.0.1
-	netmask 255.255.255.0
diff --git a/meta/recipes-core/netbase/netbase-4.45/xxs1500/interfaces b/meta/recipes-core/netbase/netbase-4.45/xxs1500/interfaces
deleted file mode 100644
index 23ccccd..0000000
--- a/meta/recipes-core/netbase/netbase-4.45/xxs1500/interfaces
+++ /dev/null
@@ -1,15 +0,0 @@
-# /etc/network/interfaces -- configuration file for ifup(8), ifdown(8)
- 
-# The loopback interface
-auto lo
-iface lo inet loopback
-
-# Ethernet
-auto eth0 eth1
-iface eth0 inet static
-	address 192.168.127.1
-	netmask 255.255.255.0	
-	
-iface eth1 inet static
-	address 192.168.128.1
-	netmask 255.255.255.0
diff --git a/meta/recipes-core/netbase/netbase_4.45.bb b/meta/recipes-core/netbase/netbase_4.45.bb
index 68cde85..85daa16 100644
--- a/meta/recipes-core/netbase/netbase_4.45.bb
+++ b/meta/recipes-core/netbase/netbase_4.45.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://packages.debian.org/netbase"
 SECTION = "base"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=3dd6192d306f582dee7687da3d8748ab"
-PR = "r0"
+PR = "r1"
 
 inherit update-rc.d
 
@@ -40,7 +40,7 @@ do_install () {
 
 	# Disable network manager on machines that commonly do NFS booting
 	case "${MACHINE}" in
-		"omap-3430sdp" | "omap-3430ldp" | "omap-2430sdp" | "qemuarm" | "qemux86" | "qemux86-64" )
+		"qemuarm" | "qemux86" | "qemux86-64" | "qemumips" | "qemuppc" )
 			touch ${D}${sysconfdir}/network/nm-disabled-eth0
 			;;
 		*)
@@ -50,9 +50,6 @@ do_install () {
 
 CONFFILES_${PN} = "${sysconfdir}/hosts ${sysconfdir}/network/interfaces"
 
-PACKAGE_ARCH_omap-3430sdp = "${MACHINE_ARCH}"
-PACKAGE_ARCH_omap-3430ldp = "${MACHINE_ARCH}"
-PACKAGE_ARCH_omap-2430sdp = "${MACHINE_ARCH}"
 PACKAGE_ARCH_qemuarm = "${MACHINE_ARCH}"
 PACKAGE_ARCH_qemux86 = "${MACHINE_ARCH}"
 PACKAGE_ARCH_qemux86-64 = "${MACHINE_ARCH}"
diff --git a/meta/recipes-core/tasks/task-core-tools.bb b/meta/recipes-core/tasks/task-core-tools.bb
index 9b2a4ce..01e93ec 100644
--- a/meta/recipes-core/tasks/task-core-tools.bb
+++ b/meta/recipes-core/tasks/task-core-tools.bb
@@ -63,8 +63,6 @@ RRECOMMENDS_task-core-tools-profile = "\
 RDEPENDS_task-core-tools-profile_append_qemux86 = " valgrind lttng-ust systemtap"
 RDEPENDS_task-core-tools-profile_append_qemux86-64 = " lttng-ust systemtap"
 RDEPENDS_task-core-tools-profile_append_qemuppc = " lttng-ust systemtap"
-RDEPENDS_task-core-tools-profile_append_emenlow = " lttng-ust systemtap"
-RDEPENDS_task-core-tools-profile_append_atom-pc = " lttng-ust systemtap"
 
 RDEPENDS_task-core-tools-testapps = "\
     blktool \
diff --git a/meta/recipes-core/uclibc/uclibc-0.9.30.1/akita/uClibc.machine b/meta/recipes-core/uclibc/uclibc-0.9.30.1/akita/uClibc.machine
deleted file mode 100644
index e27931c..0000000
--- a/meta/recipes-core/uclibc/uclibc-0.9.30.1/akita/uClibc.machine
+++ /dev/null
@@ -1,70 +0,0 @@
-#
-# Automatically generated make config: don't edit
-# Sat May 12 23:18:41 2007
-#
-# TARGET_alpha is not set
-TARGET_arm=y
-# TARGET_bfin is not set
-# TARGET_cris is not set
-# TARGET_e1 is not set
-# TARGET_frv is not set
-# TARGET_h8300 is not set
-# TARGET_hppa is not set
-# TARGET_i386 is not set
-# TARGET_i960 is not set
-# TARGET_ia64 is not set
-# TARGET_m68k is not set
-# TARGET_microblaze is not set
-# TARGET_mips is not set
-# TARGET_nios is not set
-# TARGET_nios2 is not set
-# TARGET_powerpc is not set
-# TARGET_sh is not set
-# TARGET_sh64 is not set
-# TARGET_sparc is not set
-# TARGET_v850 is not set
-# TARGET_vax is not set
-# TARGET_x86_64 is not set
-
-#
-# Target Architecture Features and Options
-#
-TARGET_ARCH="arm"
-FORCE_OPTIONS_FOR_ARCH=y
-# CONFIG_ARM_OABI is not set
-CONFIG_ARM_EABI=y
-USE_BX=y
-# CONFIG_GENERIC_ARM is not set
-# CONFIG_ARM610 is not set
-# CONFIG_ARM710 is not set
-# CONFIG_ARM7TDMI is not set
-# CONFIG_ARM720T is not set
-# CONFIG_ARM920T is not set
-# CONFIG_ARM922T is not set
-# CONFIG_ARM926T is not set
-# CONFIG_ARM10T is not set
-# CONFIG_ARM1136JF_S is not set
-# CONFIG_ARM1176JZ_S is not set
-# CONFIG_ARM1176JZF_S is not set
-# CONFIG_ARM_SA110 is not set
-# CONFIG_ARM_SA1100 is not set
-# CONFIG_ARM_XSCALE is not set
-CONFIG_ARM_IWMMXT=y
-TARGET_SUBARCH=""
-
-#
-# Using ELF file format
-#
-ARCH_ANY_ENDIAN=y
-ARCH_LITTLE_ENDIAN=y
-# ARCH_WANTS_BIG_ENDIAN is not set
-ARCH_WANTS_LITTLE_ENDIAN=y
-ARCH_HAS_MMU=y
-ARCH_USE_MMU=y
-UCLIBC_HAS_FLOATS=y
-# UCLIBC_HAS_FPU is not set
-UCLIBC_HAS_SOFT_FLOAT=y
-DO_C99_MATH=y
-KERNEL_HEADERS="/usr/include"
-HAVE_DOT_CONFIG=y
-
diff --git a/meta/recipes-core/uclibc/uclibc-0.9.30.1/atom-pc/uClibc.machine b/meta/recipes-core/uclibc/uclibc-0.9.30.1/atom-pc/uClibc.machine
deleted file mode 100644
index 5df15f9..0000000
--- a/meta/recipes-core/uclibc/uclibc-0.9.30.1/atom-pc/uClibc.machine
+++ /dev/null
@@ -1,69 +0,0 @@
-#
-# Automatically generated make config: don't edit
-# Fri Nov 23 15:49:33 2007
-#
-# TARGET_alpha is not set
-# TARGET_arm is not set
-# TARGET_bfin is not set
-# TARGET_cris is not set
-# TARGET_e1 is not set
-# TARGET_frv is not set
-# TARGET_h8300 is not set
-# TARGET_hppa is not set
-TARGET_i386=y
-# TARGET_i960 is not set
-# TARGET_ia64 is not set
-# TARGET_m68k is not set
-# TARGET_microblaze is not set
-# TARGET_mips is not set
-# TARGET_nios is not set
-# TARGET_nios2 is not set
-# TARGET_powerpc is not set
-# TARGET_sh is not set
-# TARGET_sh64 is not set
-# TARGET_sparc is not set
-# TARGET_v850 is not set
-# TARGET_vax is not set
-# TARGET_x86_64 is not set
-
-#
-# Target Architecture Features and Options
-#
-TARGET_ARCH="i386"
-FORCE_OPTIONS_FOR_ARCH=y
-CONFIG_GENERIC_386=y
-# CONFIG_386 is not set
-# CONFIG_486 is not set
-# CONFIG_586 is not set
-# CONFIG_586MMX is not set
-# CONFIG_686 is not set
-# CONFIG_PENTIUMII is not set
-# CONFIG_PENTIUMIII is not set
-# CONFIG_PENTIUM4 is not set
-# CONFIG_K6 is not set
-# CONFIG_K7 is not set
-# CONFIG_ELAN is not set
-# CONFIG_CRUSOE is not set
-# CONFIG_WINCHIPC6 is not set
-# CONFIG_WINCHIP2 is not set
-# CONFIG_CYRIXIII is not set
-# CONFIG_NEHEMIAH is not set
-TARGET_SUBARCH=""
-
-#
-# Using ELF file format
-#
-ARCH_LITTLE_ENDIAN=y
-
-#
-# Using Little Endian
-#
-ARCH_HAS_MMU=y
-ARCH_USE_MMU=y
-UCLIBC_HAS_FLOATS=y
-UCLIBC_HAS_FPU=y
-DO_C99_MATH=y
-KERNEL_HEADERS="/usr/include"
-HAVE_DOT_CONFIG=y
-
-UCLIBC_HAS_FENV=y
diff --git a/meta/recipes-core/uclibc/uclibc-0.9.30.1/c7x0/uClibc.machine b/meta/recipes-core/uclibc/uclibc-0.9.30.1/c7x0/uClibc.machine
deleted file mode 100644
index ec0385b..0000000
--- a/meta/recipes-core/uclibc/uclibc-0.9.30.1/c7x0/uClibc.machine
+++ /dev/null
@@ -1,70 +0,0 @@
-#
-# Automatically generated make config: don't edit
-# Sun May 13 11:16:02 2007
-#
-# TARGET_alpha is not set
-TARGET_arm=y
-# TARGET_bfin is not set
-# TARGET_cris is not set
-# TARGET_e1 is not set
-# TARGET_frv is not set
-# TARGET_h8300 is not set
-# TARGET_hppa is not set
-# TARGET_i386 is not set
-# TARGET_i960 is not set
-# TARGET_ia64 is not set
-# TARGET_m68k is not set
-# TARGET_microblaze is not set
-# TARGET_mips is not set
-# TARGET_nios is not set
-# TARGET_nios2 is not set
-# TARGET_powerpc is not set
-# TARGET_sh is not set
-# TARGET_sh64 is not set
-# TARGET_sparc is not set
-# TARGET_v850 is not set
-# TARGET_vax is not set
-# TARGET_x86_64 is not set
-
-#
-# Target Architecture Features and Options
-#
-TARGET_ARCH="arm"
-FORCE_OPTIONS_FOR_ARCH=y
-# CONFIG_ARM_OABI is not set
-CONFIG_ARM_EABI=y
-USE_BX=y
-# CONFIG_GENERIC_ARM is not set
-# CONFIG_ARM610 is not set
-# CONFIG_ARM710 is not set
-# CONFIG_ARM7TDMI is not set
-# CONFIG_ARM720T is not set
-# CONFIG_ARM920T is not set
-# CONFIG_ARM922T is not set
-# CONFIG_ARM926T is not set
-# CONFIG_ARM10T is not set
-# CONFIG_ARM1136JF_S is not set
-# CONFIG_ARM1176JZ_S is not set
-# CONFIG_ARM1176JZF_S is not set
-# CONFIG_ARM_SA110 is not set
-# CONFIG_ARM_SA1100 is not set
-CONFIG_ARM_XSCALE=y
-# CONFIG_ARM_IWMMXT is not set
-TARGET_SUBARCH=""
-
-#
-# Using ELF file format
-#
-ARCH_ANY_ENDIAN=y
-ARCH_LITTLE_ENDIAN=y
-# ARCH_WANTS_BIG_ENDIAN is not set
-ARCH_WANTS_LITTLE_ENDIAN=y
-ARCH_HAS_MMU=y
-ARCH_USE_MMU=y
-UCLIBC_HAS_FLOATS=y
-# UCLIBC_HAS_FPU is not set
-UCLIBC_HAS_SOFT_FLOAT=y
-DO_C99_MATH=y
-KERNEL_HEADERS="/data/build/koen/OE/build/tmp/angstrom/cross/arm-angstrom-linux-uclibcgnueabi/include"
-HAVE_DOT_CONFIG=y
-
diff --git a/meta/recipes-core/uclibc/uclibc-0.9.30.1/cm-x270/uClibc.machine b/meta/recipes-core/uclibc/uclibc-0.9.30.1/cm-x270/uClibc.machine
deleted file mode 100644
index e27931c..0000000
--- a/meta/recipes-core/uclibc/uclibc-0.9.30.1/cm-x270/uClibc.machine
+++ /dev/null
@@ -1,70 +0,0 @@
-#
-# Automatically generated make config: don't edit
-# Sat May 12 23:18:41 2007
-#
-# TARGET_alpha is not set
-TARGET_arm=y
-# TARGET_bfin is not set
-# TARGET_cris is not set
-# TARGET_e1 is not set
-# TARGET_frv is not set
-# TARGET_h8300 is not set
-# TARGET_hppa is not set
-# TARGET_i386 is not set
-# TARGET_i960 is not set
-# TARGET_ia64 is not set
-# TARGET_m68k is not set
-# TARGET_microblaze is not set
-# TARGET_mips is not set
-# TARGET_nios is not set
-# TARGET_nios2 is not set
-# TARGET_powerpc is not set
-# TARGET_sh is not set
-# TARGET_sh64 is not set
-# TARGET_sparc is not set
-# TARGET_v850 is not set
-# TARGET_vax is not set
-# TARGET_x86_64 is not set
-
-#
-# Target Architecture Features and Options
-#
-TARGET_ARCH="arm"
-FORCE_OPTIONS_FOR_ARCH=y
-# CONFIG_ARM_OABI is not set
-CONFIG_ARM_EABI=y
-USE_BX=y
-# CONFIG_GENERIC_ARM is not set
-# CONFIG_ARM610 is not set
-# CONFIG_ARM710 is not set
-# CONFIG_ARM7TDMI is not set
-# CONFIG_ARM720T is not set
-# CONFIG_ARM920T is not set
-# CONFIG_ARM922T is not set
-# CONFIG_ARM926T is not set
-# CONFIG_ARM10T is not set
-# CONFIG_ARM1136JF_S is not set
-# CONFIG_ARM1176JZ_S is not set
-# CONFIG_ARM1176JZF_S is not set
-# CONFIG_ARM_SA110 is not set
-# CONFIG_ARM_SA1100 is not set
-# CONFIG_ARM_XSCALE is not set
-CONFIG_ARM_IWMMXT=y
-TARGET_SUBARCH=""
-
-#
-# Using ELF file format
-#
-ARCH_ANY_ENDIAN=y
-ARCH_LITTLE_ENDIAN=y
-# ARCH_WANTS_BIG_ENDIAN is not set
-ARCH_WANTS_LITTLE_ENDIAN=y
-ARCH_HAS_MMU=y
-ARCH_USE_MMU=y
-UCLIBC_HAS_FLOATS=y
-# UCLIBC_HAS_FPU is not set
-UCLIBC_HAS_SOFT_FLOAT=y
-DO_C99_MATH=y
-KERNEL_HEADERS="/usr/include"
-HAVE_DOT_CONFIG=y
-
diff --git a/meta/recipes-core/uclibc/uclibc-0.9.30.1/om-gta01/uClibc.machine b/meta/recipes-core/uclibc/uclibc-0.9.30.1/om-gta01/uClibc.machine
deleted file mode 100644
index 898b73a..0000000
--- a/meta/recipes-core/uclibc/uclibc-0.9.30.1/om-gta01/uClibc.machine
+++ /dev/null
@@ -1,69 +0,0 @@
-#
-# Automatically generated make config: don't edit
-# Mon May 14 10:23:14 2007
-#
-# TARGET_alpha is not set
-TARGET_arm=y
-# TARGET_bfin is not set
-# TARGET_cris is not set
-# TARGET_e1 is not set
-# TARGET_frv is not set
-# TARGET_h8300 is not set
-# TARGET_hppa is not set
-# TARGET_i386 is not set
-# TARGET_i960 is not set
-# TARGET_ia64 is not set
-# TARGET_m68k is not set
-# TARGET_microblaze is not set
-# TARGET_mips is not set
-# TARGET_nios is not set
-# TARGET_nios2 is not set
-# TARGET_powerpc is not set
-# TARGET_sh is not set
-# TARGET_sh64 is not set
-# TARGET_sparc is not set
-# TARGET_v850 is not set
-# TARGET_vax is not set
-# TARGET_x86_64 is not set
-
-#
-# Target Architecture Features and Options
-#
-TARGET_ARCH="arm"
-FORCE_OPTIONS_FOR_ARCH=y
-# CONFIG_ARM_OABI is not set
-CONFIG_ARM_EABI=y
-USE_BX=y
-# CONFIG_GENERIC_ARM is not set
-# CONFIG_ARM610 is not set
-# CONFIG_ARM710 is not set
-# CONFIG_ARM7TDMI is not set
-# CONFIG_ARM720T is not set
-CONFIG_ARM920T=y
-# CONFIG_ARM922T is not set
-# CONFIG_ARM926T is not set
-# CONFIG_ARM10T is not set
-# CONFIG_ARM1136JF_S is not set
-# CONFIG_ARM1176JZ_S is not set
-# CONFIG_ARM1176JZF_S is not set
-# CONFIG_ARM_SA110 is not set
-# CONFIG_ARM_SA1100 is not set
-# CONFIG_ARM_XSCALE is not set
-# CONFIG_ARM_IWMMXT is not set
-TARGET_SUBARCH=""
-
-#
-# Using ELF file format
-#
-ARCH_ANY_ENDIAN=y
-ARCH_LITTLE_ENDIAN=y
-# ARCH_WANTS_BIG_ENDIAN is not set
-ARCH_WANTS_LITTLE_ENDIAN=y
-ARCH_HAS_MMU=y
-ARCH_USE_MMU=y
-UCLIBC_HAS_FLOATS=y
-# UCLIBC_HAS_FPU is not set
-UCLIBC_HAS_SOFT_FLOAT=y
-KERNEL_HEADERS="/usr/include"
-HAVE_DOT_CONFIG=y
-
diff --git a/meta/recipes-core/uclibc/uclibc-0.9.30.1/spitz/uClibc.machine b/meta/recipes-core/uclibc/uclibc-0.9.30.1/spitz/uClibc.machine
deleted file mode 100644
index e27931c..0000000
--- a/meta/recipes-core/uclibc/uclibc-0.9.30.1/spitz/uClibc.machine
+++ /dev/null
@@ -1,70 +0,0 @@
-#
-# Automatically generated make config: don't edit
-# Sat May 12 23:18:41 2007
-#
-# TARGET_alpha is not set
-TARGET_arm=y
-# TARGET_bfin is not set
-# TARGET_cris is not set
-# TARGET_e1 is not set
-# TARGET_frv is not set
-# TARGET_h8300 is not set
-# TARGET_hppa is not set
-# TARGET_i386 is not set
-# TARGET_i960 is not set
-# TARGET_ia64 is not set
-# TARGET_m68k is not set
-# TARGET_microblaze is not set
-# TARGET_mips is not set
-# TARGET_nios is not set
-# TARGET_nios2 is not set
-# TARGET_powerpc is not set
-# TARGET_sh is not set
-# TARGET_sh64 is not set
-# TARGET_sparc is not set
-# TARGET_v850 is not set
-# TARGET_vax is not set
-# TARGET_x86_64 is not set
-
-#
-# Target Architecture Features and Options
-#
-TARGET_ARCH="arm"
-FORCE_OPTIONS_FOR_ARCH=y
-# CONFIG_ARM_OABI is not set
-CONFIG_ARM_EABI=y
-USE_BX=y
-# CONFIG_GENERIC_ARM is not set
-# CONFIG_ARM610 is not set
-# CONFIG_ARM710 is not set
-# CONFIG_ARM7TDMI is not set
-# CONFIG_ARM720T is not set
-# CONFIG_ARM920T is not set
-# CONFIG_ARM922T is not set
-# CONFIG_ARM926T is not set
-# CONFIG_ARM10T is not set
-# CONFIG_ARM1136JF_S is not set
-# CONFIG_ARM1176JZ_S is not set
-# CONFIG_ARM1176JZF_S is not set
-# CONFIG_ARM_SA110 is not set
-# CONFIG_ARM_SA1100 is not set
-# CONFIG_ARM_XSCALE is not set
-CONFIG_ARM_IWMMXT=y
-TARGET_SUBARCH=""
-
-#
-# Using ELF file format
-#
-ARCH_ANY_ENDIAN=y
-ARCH_LITTLE_ENDIAN=y
-# ARCH_WANTS_BIG_ENDIAN is not set
-ARCH_WANTS_LITTLE_ENDIAN=y
-ARCH_HAS_MMU=y
-ARCH_USE_MMU=y
-UCLIBC_HAS_FLOATS=y
-# UCLIBC_HAS_FPU is not set
-UCLIBC_HAS_SOFT_FLOAT=y
-DO_C99_MATH=y
-KERNEL_HEADERS="/usr/include"
-HAVE_DOT_CONFIG=y
-
diff --git a/meta/recipes-core/udev/files/50-hostap_cs.rules b/meta/recipes-core/udev/files/50-hostap_cs.rules
deleted file mode 100644
index efefdc5..0000000
--- a/meta/recipes-core/udev/files/50-hostap_cs.rules
+++ /dev/null
@@ -1,4 +0,0 @@
-# hostap_cs needs ignore_cis_vcc=1 set - this should handle all cards
-#
-ACTION=="add", DEVICE=="hostap_cs", \
- SYSFS{func_id}=="0x06", RUN+="/sbin/modprobe hostap_cs ignore_cis_vcc=1"
diff --git a/meta/recipes-core/udev/files/akita/mount.blacklist b/meta/recipes-core/udev/files/akita/mount.blacklist
deleted file mode 100644
index c15b582..0000000
--- a/meta/recipes-core/udev/files/akita/mount.blacklist
+++ /dev/null
@@ -1,3 +0,0 @@
-/dev/mtdblock
-/dev/loop
-/dev/ram
diff --git a/meta/recipes-core/udev/files/c7x0/mount.blacklist b/meta/recipes-core/udev/files/c7x0/mount.blacklist
deleted file mode 100644
index c15b582..0000000
--- a/meta/recipes-core/udev/files/c7x0/mount.blacklist
+++ /dev/null
@@ -1,3 +0,0 @@
-/dev/mtdblock
-/dev/loop
-/dev/ram
diff --git a/meta/recipes-core/udev/files/spitz/mount.blacklist b/meta/recipes-core/udev/files/spitz/mount.blacklist
deleted file mode 100644
index aee308f..0000000
--- a/meta/recipes-core/udev/files/spitz/mount.blacklist
+++ /dev/null
@@ -1,4 +0,0 @@
-/dev/mtdblock
-/dev/hda
-/dev/loop
-/dev/ram
diff --git a/meta/recipes-core/udev/files/tosa/mount.blacklist b/meta/recipes-core/udev/files/tosa/mount.blacklist
deleted file mode 100644
index c15b582..0000000
--- a/meta/recipes-core/udev/files/tosa/mount.blacklist
+++ /dev/null
@@ -1,3 +0,0 @@
-/dev/mtdblock
-/dev/loop
-/dev/ram
diff --git a/meta/recipes-core/udev/udev-new.inc b/meta/recipes-core/udev/udev-new.inc
index 4faaae1..d1abf39 100644
--- a/meta/recipes-core/udev/udev-new.inc
+++ b/meta/recipes-core/udev/udev-new.inc
@@ -27,8 +27,6 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
            file://udev-cache \
            file://init"
 
-SRC_URI_append_h2200 = " file://50-hostap_cs.rules "
-
 inherit autotools pkgconfig update-rc.d
 
 # udevd/udevadm -> /sbin/, libudev.so.* -> /lib/
@@ -39,7 +37,6 @@ EXTRA_OECONF = "--disable-introspection --with-rootlibdir=${base_libdir} \
 
 PACKAGES =+ "udev-cache libudev libudev-dev libudev-dbg"
 PACKAGES =+ "libgudev libgudev-dev libgudev-dbg"
-PACKAGE_ARCH_h2200 = "h2200"
 
 INITSCRIPT_PACKAGES = "udev udev-cache"
 INITSCRIPT_NAME_udev = "udev"
@@ -86,7 +83,3 @@ do_install_append () {
 	install -m 0755 ${WORKDIR}/mount.sh ${D}${sysconfdir}/udev/scripts/mount.sh
 	install -m 0755 ${WORKDIR}/network.sh ${D}${sysconfdir}/udev/scripts
 }
-
-do_install_append_h2200() {
-	install -m 0644 ${WORKDIR}/50-hostap_cs.rules         ${D}${sysconfdir}/udev/rules.d/50-hostap_cs.rules
-}
diff --git a/meta/recipes-core/udev/udev_145.bb b/meta/recipes-core/udev/udev_145.bb
index fde5050..becef04 100644
--- a/meta/recipes-core/udev/udev_145.bb
+++ b/meta/recipes-core/udev/udev_145.bb
@@ -1,15 +1,12 @@
 RPROVIDES_${PN} = "hotplug"
 
-PR = "r10"
+PR = "r11"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
            file://enable-gudev.patch;patch=1 \
 	   file://run.rules \
 	   "
 
-SRC_URI_append_h2200 = " file://50-hostap_cs.rules "
-PACKAGE_ARCH_h2200 = "h2200"
-
 require udev.inc
 
 INITSCRIPT_PARAMS = "start 03 S ."
@@ -56,7 +53,3 @@ do_install () {
 	install -d ${D}${base_libdir}/udev/
 }
 
-do_install_append_h2200() {
-	install -m 0644 ${WORKDIR}/50-hostap_cs.rules         ${D}${sysconfdir}/udev/rules.d/50-hostap_cs.rules
-}
-
diff --git a/meta/recipes-core/udev/udev_164.bb b/meta/recipes-core/udev/udev_164.bb
index 135685f..76fd907 100644
--- a/meta/recipes-core/udev/udev_164.bb
+++ b/meta/recipes-core/udev/udev_164.bb
@@ -1,6 +1,6 @@
 include udev-new.inc
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI[md5sum] = "fddac2d54761ea34865af9467377ca9f"
 SRC_URI[sha256sum] = "c12e66280b5e1465f6587a8cfa47d7405c4caa7e52ce5dd13478d04f6ec05e5c"
diff --git a/meta/recipes-gnome/tasks/task-sdk-gmae.inc b/meta/recipes-gnome/tasks/task-sdk-gmae.inc
index 2071089..586d76f 100644
--- a/meta/recipes-gnome/tasks/task-sdk-gmae.inc
+++ b/meta/recipes-gnome/tasks/task-sdk-gmae.inc
@@ -36,5 +36,3 @@ SDK-EXTRAS_qemux86 ?= " valgrind lttng-ust-dev"
 SDK-EXTRAS_qemux86-64 ?= " lttng-ust-dev"
 SDK-EXTRAS_qemuppc ?= " lttng-ust-dev"
 SDK-EXTRAS_qemuarm ?= " lttng-ust-dev"
-SDK-EXTRAS_emenlow ?= " lttng-ust-dev"
-SDK-EXTRAS_atom-pc ?= " lttng-ust-dev"
diff --git a/meta/recipes-graphics/clutter/clutter-1.4_1.4.2.bb b/meta/recipes-graphics/clutter/clutter-1.4_1.4.2.bb
index 998545a..b736846 100644
--- a/meta/recipes-graphics/clutter/clutter-1.4_1.4.2.bb
+++ b/meta/recipes-graphics/clutter/clutter-1.4_1.4.2.bb
@@ -1,6 +1,6 @@
 require clutter.inc
 
-PR = "r0"
+PR = "r1"
 
 PACKAGES =+ "${PN}-examples"
 FILES_${PN}-examples = "${bindir}/test-* ${pkgdatadir}/redhand.png"
diff --git a/meta/recipes-graphics/clutter/clutter-1.6_1.6.14.bb b/meta/recipes-graphics/clutter/clutter-1.6_1.6.14.bb
index ab9e0e0..938a30c 100644
--- a/meta/recipes-graphics/clutter/clutter-1.6_1.6.14.bb
+++ b/meta/recipes-graphics/clutter/clutter-1.6_1.6.14.bb
@@ -1,6 +1,6 @@
 require recipes-graphics/clutter/clutter.inc
 
-PR = "r0"
+PR = "r1"
 
 # Internal json-glib was removed in Clutter 1.5.2
 STDDEPENDS += "json-glib"
diff --git a/meta/recipes-graphics/clutter/clutter.inc b/meta/recipes-graphics/clutter/clutter.inc
index 2f9a55c..54f65c5 100644
--- a/meta/recipes-graphics/clutter/clutter.inc
+++ b/meta/recipes-graphics/clutter/clutter.inc
@@ -2,47 +2,12 @@ DESCRIPTION = "Clutter graphics library"
 HOMEPAGE = "http://www.clutter-project.org/"
 LICENSE = "LGPL"
 
-COMPATIBLE_MACHINE = "(zylonite|mx31litekit|omap-3430ldp|omap-3430sdp|mx31ads|qemuarm|qemux86|ipodtouch|atom-pc|menlow)"
-
 STDDEPENDS = "virtual/libx11 gtk-doc-native pango glib-2.0 libxfixes gtk+ libxi"
 BASE_CONF = "--disable-gtk-doc ${@get_clutter_fpu_setting(bb, d)}"
 
 DEPENDS = "${STDDEPENDS} virtual/libgl"
 EXTRA_OECONF = "${BASE_CONF} --with-flavour=glx"
 
-DEPENDS_zylonite = "${STDDEPENDS} libgles-zylonite tslib"
-EXTRA_OECONF_zylonite = "${BASE_CONF} --with-flavour=eglnative"
-PACKAGE_ARCH_zylonite = "${MACHINE_ARCH}"
-LDFLAGS_append_zylonite = " -lnws -lstdc++ "
-
-DEPENDS_mx31litekit = "${STDDEPENDS} libgles-mx31 tslib"
-EXTRA_OECONF_mx31litekit = "${BASE_CONF} --with-flavour=eglnative"
-PACKAGE_ARCH_mx31litekit = "${MACHINE_ARCH}"
-LDFLAGS_append_mx31litekit = " -lpvrNULLWSEGL -lstdc++ "
-
-DEPENDS_omap-3430ldp = "${STDDEPENDS} libgles-omap3 tslib"
-# The eglx drivers are pretty dire, use eglnative
-EXTRA_OECONF_omap-3430ldp = "${BASE_CONF} --with-flavour=eglnative"
-PACKAGE_ARCH_omap-3430ldp = "${MACHINE_ARCH}"
-
-DEPENDS_omap-3430sdp = "${STDDEPENDS} libgles-omap3 tslib"
-# The eglx drivers are pretty dire, use eglnative
-EXTRA_OECONF_omap-3430sdp = "${BASE_CONF} --with-flavour=eglnative"
-PACKAGE_ARCH_omap-3430sdp = "${MACHINE_ARCH}"
-
-DEPENDS_mx31ads = "${STDDEPENDS} libgles-mx31 tslib"
-EXTRA_OECONF_mx31ads = "${BASE_CONF} --with-flavour=eglnative"
-PACKAGE_ARCH_mx31ads = "${MACHINE_ARCH}"
-LDFLAGS_append_mx31ads = " -lpvrNULLWSEGL -lstdc++ "
-
-DEPENDS_atom-pc = "${STDDEPENDS} virtual/xserver-xf86 virtual/libgl"
-EXTRA_OECONF_atom-pc = "${BASE_CONF} --with-flavour=glx"
-PACKAGE_ARCH_atom-pc = "${MACHINE_ARCH}"
-
-DEPENDS_menlow = "${STDDEPENDS} virtual/xserver-xf86 virtual/libgl"
-EXTRA_OECONF_menlow = "${BASE_CONF} --with-flavour=glx"
-PACKAGE_ARCH_menlow = "${MACHINE_ARCH}"
-
 FILESPATH = "${FILE_DIRNAME}/clutter"
 
 inherit autotools pkgconfig gtk-doc gettext
diff --git a/meta/recipes-graphics/clutter/clutter_git.bb b/meta/recipes-graphics/clutter/clutter_git.bb
index dd5f980..34cb6cd 100644
--- a/meta/recipes-graphics/clutter/clutter_git.bb
+++ b/meta/recipes-graphics/clutter/clutter_git.bb
@@ -4,7 +4,7 @@ require clutter-package.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
 PV = "1.0.0+git${SRCPV}"
-PR = "r8"
+PR = "r9"
 
 SRC_URI = "git://git.clutter-project.org/clutter.git;protocol=git;branch=master \
            file://enable_tests-654c26a1301c9bc5f8e3e5e3b68af5eb1b2e0673.patch;patch=1;rev=654c26a1301c9bc5f8e3e5e3b68af5eb1b2e0673 \
diff --git a/meta/recipes-graphics/mesa/mesa-dri_7.10.2.bb b/meta/recipes-graphics/mesa/mesa-dri_7.10.2.bb
index 28f9f27..c7bd974 100644
--- a/meta/recipes-graphics/mesa/mesa-dri_7.10.2.bb
+++ b/meta/recipes-graphics/mesa/mesa-dri_7.10.2.bb
@@ -19,9 +19,6 @@ SRC_URI[sha256sum] = "8ced2678ce11cf30804694a92ea3ca6b82f158ae8995bdc626c7e85aac
 # most of our targets do not have DRI so will use mesa-xlib
 DEFAULT_PREFERENCE = "-1"
 
-# Atom PCs have DRI support so use mesa-dri by default
-DEFAULT_PREFERENCE_atom-pc = "1"
-
 LEAD_SONAME = "libGL.so.1"
 
 EXTRA_OECONF += "--with-driver=dri --disable-egl --disable-gallium"
diff --git a/meta/recipes-graphics/mesa/mesa-dri_git.bb b/meta/recipes-graphics/mesa/mesa-dri_git.bb
index 20bb912..fca76a5 100644
--- a/meta/recipes-graphics/mesa/mesa-dri_git.bb
+++ b/meta/recipes-graphics/mesa/mesa-dri_git.bb
@@ -17,9 +17,6 @@ PR = "r1"
 # most of our targets do not have DRI so will use mesa-xlib
 DEFAULT_PREFERENCE = "-1"
 
-# Atom PCs have DRI support so use mesa-dri by default
-DEFAULT_PREFERENCE_atom-pc = "1"
-
 PACKAGES =+ "${PN}-xprogs"
 PACKAGES_DYNAMIC = "mesa-dri-driver-*"
 
diff --git a/meta/recipes-graphics/mutter/mutter.inc b/meta/recipes-graphics/mutter/mutter.inc
index a734cdd..60ceed4 100644
--- a/meta/recipes-graphics/mutter/mutter.inc
+++ b/meta/recipes-graphics/mutter/mutter.inc
@@ -10,9 +10,6 @@ ALTERNATIVE_LINK = "${bindir}/x-window-manager"
 ALTERNATIVE_PATH = "${bindir}/mutter"
 ALTERNATIVE_PRIORITY = "11"
 
-COMPATIBLE_MACHINE = "(zylonite|mx31litekit|omap-3430ldp|omap-3430sdp|mx31ads|qemuarm|qemux86|ipodtouch|atom-pc|menlow)"
-
-
 EXTRA_OECONF += "--disable-verbose	\
 	         --disable-xinerama	\
 	         --without-introspection \
diff --git a/meta/recipes-graphics/tslib/tslib/a780/tslib.sh b/meta/recipes-graphics/tslib/tslib/a780/tslib.sh
deleted file mode 100644
index 51cd0f1..0000000
--- a/meta/recipes-graphics/tslib/tslib/a780/tslib.sh
+++ /dev/null
@@ -1,6 +0,0 @@
-#!/bin/sh
-
-TSLIB_TSDEVICE=/dev/input/event1
-TSLIB_CONFFILE=/etc/ts.conf
-
-export TSLIB_TSDEVICE TSLIB_CONFFILE
diff --git a/meta/recipes-graphics/tslib/tslib/collie/ts.conf b/meta/recipes-graphics/tslib/tslib/collie/ts.conf
deleted file mode 100644
index 2099b9b..0000000
--- a/meta/recipes-graphics/tslib/tslib/collie/ts.conf
+++ /dev/null
@@ -1,5 +0,0 @@
-module_raw collie
-module pthres pmin=1
-module variance delta=30
-module dejitter delta=100
-module linear
diff --git a/meta/recipes-graphics/tslib/tslib/collie/tslib.sh b/meta/recipes-graphics/tslib/tslib/collie/tslib.sh
deleted file mode 100644
index 664bda4..0000000
--- a/meta/recipes-graphics/tslib/tslib/collie/tslib.sh
+++ /dev/null
@@ -1,13 +0,0 @@
-#!/bin/sh
-
-TSLIB_TSDEVICE=/dev/input/touchscreen0
-TSLIB_CONFFILE=/etc/ts.conf
-
-case `uname -r` in
-2.4*)
-	TSLIB_TSDEVICE=/dev/ts
-	TSLIB_CONFFILE=/usr/share/tslib/ts.conf-collie-2.4
-	;;
-esac
-
-export TSLIB_TSDEVICE TSLIB_CONFFILE
diff --git a/meta/recipes-graphics/tslib/tslib/devfs.patch b/meta/recipes-graphics/tslib/tslib/devfs.patch
deleted file mode 100644
index d7ef0a9..0000000
--- a/meta/recipes-graphics/tslib/tslib/devfs.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-
-#
-# Patch managed by http://www.holgerschurig.de/patcher.html
-#
-
---- tslib/tests/fbutils.c~devfs.patch
-+++ tslib/tests/fbutils.c
-@@ -44,8 +44,8 @@
- static unsigned colormap [256];
- int xres, yres;
- 
--static char *defaultfbdevice = "/dev/fb0";
--static char *defaultconsoledevice = "/dev/tty";
-+static char *defaultfbdevice = "/dev/fb/0";
-+static char *defaultconsoledevice = "/dev/vc/";
- static char *fbdevice = NULL;
- static char *consoledevice = NULL;
- 
diff --git a/meta/recipes-graphics/tslib/tslib/e680/tslib.sh b/meta/recipes-graphics/tslib/tslib/e680/tslib.sh
deleted file mode 100644
index 51cd0f1..0000000
--- a/meta/recipes-graphics/tslib/tslib/e680/tslib.sh
+++ /dev/null
@@ -1,6 +0,0 @@
-#!/bin/sh
-
-TSLIB_TSDEVICE=/dev/input/event1
-TSLIB_CONFFILE=/etc/ts.conf
-
-export TSLIB_TSDEVICE TSLIB_CONFFILE
diff --git a/meta/recipes-graphics/tslib/tslib/event1.patch b/meta/recipes-graphics/tslib/tslib/event1.patch
deleted file mode 100644
index 88cc3f3..0000000
--- a/meta/recipes-graphics/tslib/tslib/event1.patch
+++ /dev/null
@@ -1,80 +0,0 @@
-
-#
-# Patch managed by http://www.holgerschurig.de/patcher.html
-#
-
---- tslib/tests/ts_calibrate.c~event1
-+++ tslib/tests/ts_calibrate.c
-@@ -179,11 +179,7 @@
- 	if( (tsdevice = getenv("TSLIB_TSDEVICE")) != NULL ) {
- 		ts = ts_open(tsdevice,0);
- 	} else {
--#ifdef USE_INPUT_API
--		ts = ts_open("/dev/input/event0", 0);
--#else
--		ts = ts_open("/dev/touchscreen/ucb1x00", 0);
--#endif /* USE_INPUT_API */
-+		ts = ts_open("/dev/input/event1", 0);
- 	}
- 
- 	if (!ts) {
---- tslib/tests/ts_print.c~event1
-+++ tslib/tests/ts_print.c
-@@ -28,11 +28,7 @@
-         if( (tsdevice = getenv("TSLIB_TSDEVICE")) != NULL ) {
-                 ts = ts_open(tsdevice,0);
-         } else {
--#ifdef USE_INPUT_API
--                ts = ts_open("/dev/input/event0", 0);
--#else
--                ts = ts_open("/dev/touchscreen/ucb1x00", 0);
--#endif /* USE_INPUT_API */
-+                ts = ts_open("/dev/input/event1", 0);
-         }
- 
- 	if (!ts) {
---- tslib/tests/ts_test.c~event1
-+++ tslib/tests/ts_test.c
-@@ -120,11 +120,7 @@
- 	signal(SIGTERM, sig);
- 
- 	if ((tsdevice = getenv("TSLIB_TSDEVICE")) == NULL) {
--#ifdef USE_INPUT_API
--		tsdevice = strdup ("/dev/input/event0");
--#else
--		tsdevice = strdup ("/dev/touchscreen/ucb1x00");
--#endif /* USE_INPUT_API */
-+		tsdevice = strdup ("/dev/input/event1");
-         }
- 
- 	ts = ts_open (tsdevice, 0);
---- tslib/tests/ts_print_raw.c~event1
-+++ tslib/tests/ts_print_raw.c
-@@ -28,11 +28,7 @@
-         if( (tsdevice = getenv("TSLIB_TSDEVICE")) != NULL ) {
-                 ts = ts_open(tsdevice,0);
-         } else {
--#ifdef USE_INPUT_API
--                ts = ts_open("/dev/input/event0", 0);
--#else
--                ts = ts_open("/dev/touchscreen/ucb1x00", 0);
--#endif /* USE_INPUT_API */
-+                ts = ts_open("/dev/input/event1", 0);
-         }
- 
- 	if (!ts) {
---- tslib/tests/ts_harvest.c~event1
-+++ tslib/tests/ts_harvest.c
-@@ -75,11 +75,7 @@
- 	signal(SIGTERM, sig);
- 
- 	if ((tsdevice = getenv("TSLIB_TSDEVICE")) == NULL) {
--#ifdef USE_INPUT_API
--		tsdevice = strdup ("/dev/input/event0");
--#else
--		tsdevice = strdup ("/dev/touchscreen/ucb1x00");
--#endif /* USE_INPUT_API */
-+		tsdevice = strdup ("/dev/input/event1");
-         }
- 
- 	ts = ts_open (tsdevice, 0);
diff --git a/meta/recipes-graphics/tslib/tslib/jornada56x/ts.conf b/meta/recipes-graphics/tslib/tslib/jornada56x/ts.conf
deleted file mode 100644
index 20729b6..0000000
--- a/meta/recipes-graphics/tslib/tslib/jornada56x/ts.conf
+++ /dev/null
@@ -1,5 +0,0 @@
-module_raw h3600
-module pthres pmin=1
-module variance delta=30
-module dejitter delta=100
-module linear
diff --git a/meta/recipes-graphics/tslib/tslib/jornada56x/tslib.sh b/meta/recipes-graphics/tslib/tslib/jornada56x/tslib.sh
deleted file mode 100644
index 8f907b0..0000000
--- a/meta/recipes-graphics/tslib/tslib/jornada56x/tslib.sh
+++ /dev/null
@@ -1,5 +0,0 @@
-#!/bin/sh
-
-TSLIB_TSDEVICE=/dev/input/tsraw0
-
-export TSLIB_TSDEVICE
diff --git a/meta/recipes-graphics/tslib/tslib/jornada6xx/ts.conf b/meta/recipes-graphics/tslib/tslib/jornada6xx/ts.conf
deleted file mode 100644
index 20729b6..0000000
--- a/meta/recipes-graphics/tslib/tslib/jornada6xx/ts.conf
+++ /dev/null
@@ -1,5 +0,0 @@
-module_raw h3600
-module pthres pmin=1
-module variance delta=30
-module dejitter delta=100
-module linear
diff --git a/meta/recipes-graphics/tslib/tslib/jornada6xx/tslib.sh b/meta/recipes-graphics/tslib/tslib/jornada6xx/tslib.sh
deleted file mode 100644
index 1b5db78..0000000
--- a/meta/recipes-graphics/tslib/tslib/jornada6xx/tslib.sh
+++ /dev/null
@@ -1,5 +0,0 @@
-#!/bin/sh
-
-TSLIB_TSDEVICE=/dev/input/ts0
-
-export TSLIB_TSDEVICE
diff --git a/meta/recipes-graphics/tslib/tslib/jornada7xx/ts.conf b/meta/recipes-graphics/tslib/tslib/jornada7xx/ts.conf
deleted file mode 100644
index 0930971..0000000
--- a/meta/recipes-graphics/tslib/tslib/jornada7xx/ts.conf
+++ /dev/null
@@ -1,5 +0,0 @@
-module_raw input
-module pthres pmin=1
-module variance delta=30
-module dejitter delta=100
-module linear
diff --git a/meta/recipes-graphics/tslib/tslib/jornada7xx/tslib.sh b/meta/recipes-graphics/tslib/tslib/jornada7xx/tslib.sh
deleted file mode 100644
index 040f4de..0000000
--- a/meta/recipes-graphics/tslib/tslib/jornada7xx/tslib.sh
+++ /dev/null
@@ -1,5 +0,0 @@
-#!/bin/sh
-
-TSLIB_TSDEVICE=/dev/input/event1
-
-export TSLIB_TSDEVICE
diff --git a/meta/recipes-graphics/tslib/tslib/mnci/ts.conf b/meta/recipes-graphics/tslib/tslib/mnci/ts.conf
deleted file mode 100644
index adff177..0000000
--- a/meta/recipes-graphics/tslib/tslib/mnci/ts.conf
+++ /dev/null
@@ -1,5 +0,0 @@
-module_raw input
-module pthres pmin=600
-module variance delta=30
-module dejitter delta=100
-module linear
diff --git a/meta/recipes-graphics/tslib/tslib/mnci/tslib.sh b/meta/recipes-graphics/tslib/tslib/mnci/tslib.sh
deleted file mode 100644
index 07928f2..0000000
--- a/meta/recipes-graphics/tslib/tslib/mnci/tslib.sh
+++ /dev/null
@@ -1 +0,0 @@
-export TSLIB_TSDEVICE=/dev/input/event1
diff --git a/meta/recipes-graphics/tslib/tslib/netbook-pro/ts.conf b/meta/recipes-graphics/tslib/tslib/netbook-pro/ts.conf
deleted file mode 100644
index 6d94a8f..0000000
--- a/meta/recipes-graphics/tslib/tslib/netbook-pro/ts.conf
+++ /dev/null
@@ -1,5 +0,0 @@
-module_raw input
-module variance delta=80
-#module dejitter delta=2
-module linear
-
diff --git a/meta/recipes-graphics/tslib/tslib/netbook-pro/tslib.sh b/meta/recipes-graphics/tslib/tslib/netbook-pro/tslib.sh
deleted file mode 100644
index d31bc76..0000000
--- a/meta/recipes-graphics/tslib/tslib/netbook-pro/tslib.sh
+++ /dev/null
@@ -1,5 +0,0 @@
-#!/bin/sh
-
-TSLIB_TSDEVICE=`detect-stylus --device`
-
-export TSLIB_TSDEVICE
diff --git a/meta/recipes-graphics/tslib/tslib/omap1610h2/tslib.sh b/meta/recipes-graphics/tslib/tslib/omap1610h2/tslib.sh
deleted file mode 100644
index 040f4de..0000000
--- a/meta/recipes-graphics/tslib/tslib/omap1610h2/tslib.sh
+++ /dev/null
@@ -1,5 +0,0 @@
-#!/bin/sh
-
-TSLIB_TSDEVICE=/dev/input/event1
-
-export TSLIB_TSDEVICE
diff --git a/meta/recipes-graphics/tslib/tslib/omap5912osk/tslib.sh b/meta/recipes-graphics/tslib/tslib/omap5912osk/tslib.sh
deleted file mode 100644
index 6bb5665..0000000
--- a/meta/recipes-graphics/tslib/tslib/omap5912osk/tslib.sh
+++ /dev/null
@@ -1,4 +0,0 @@
-#!/bin/sh
-
-export TSLIB_TSDEVICE=/dev/input/event1
-export QWS_MOUSE_PROTO=TPanel
diff --git a/meta/recipes-graphics/tslib/tslib/simpad/tslib.sh b/meta/recipes-graphics/tslib/tslib/simpad/tslib.sh
deleted file mode 100644
index 9c4eb1e..0000000
--- a/meta/recipes-graphics/tslib/tslib/simpad/tslib.sh
+++ /dev/null
@@ -1,14 +0,0 @@
-#!/bin/sh
-
-TSLIB_TSDEVICE=/dev/input/touchscreen0
-TSLIB_CONFFILE=/etc/ts.conf
-
-case `uname -r` in
-2.4*)
-	TSLIB_TSDEVICE=/dev/touchscreen/ucb1x00
-	TSLIB_CONFFILE=/usr/share/tslib/ts.conf-simpad-2.4
-	;;
-esac
-
-export TSLIB_TSDEVICE TSLIB_CONFFILE
-
diff --git a/meta/recipes-graphics/tslib/tslib/ts.conf-collie-2.4 b/meta/recipes-graphics/tslib/tslib/ts.conf-collie-2.4
deleted file mode 100644
index 2099b9b..0000000
--- a/meta/recipes-graphics/tslib/tslib/ts.conf-collie-2.4
+++ /dev/null
@@ -1,5 +0,0 @@
-module_raw collie
-module pthres pmin=1
-module variance delta=30
-module dejitter delta=100
-module linear
diff --git a/meta/recipes-graphics/tslib/tslib/ts.conf-simpad-2.4 b/meta/recipes-graphics/tslib/tslib/ts.conf-simpad-2.4
deleted file mode 100644
index 035e794..0000000
--- a/meta/recipes-graphics/tslib/tslib/ts.conf-simpad-2.4
+++ /dev/null
@@ -1,5 +0,0 @@
-module_raw ucb1x00
-module pthres pmin=1
-module variance delta=10
-module dejitter delta=150
-module linear
diff --git a/meta/recipes-graphics/tslib/tslib_1.0.bb b/meta/recipes-graphics/tslib/tslib_1.0.bb
index 51529e3..9ab8259 100644
--- a/meta/recipes-graphics/tslib/tslib_1.0.bb
+++ b/meta/recipes-graphics/tslib/tslib_1.0.bb
@@ -10,19 +10,15 @@ SECTION = "base"
 LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f30a9716ef3762e3467a2f62bf790f0a"
 
-PR = "r16"
+PR = "r17"
 
 SRC_URI = "http://download.berlios.de/tslib/tslib-${PV}.tar.bz2 \
            file://fix_version.patch;patch=1 \
            file://ts.conf \
-           file://ts.conf-simpad-2.4 \
-           file://ts.conf-collie-2.4 \
            file://tslib.sh"
 
 SRC_URI[md5sum] = "92b2eb55b1e4ef7e2c0347069389390e"
 SRC_URI[sha256sum] = "9c40d914e4f6fe00bdd77137d671c7ce4f211686228f2eb8b2d3c2360bc249c8"
-SRC_URI_append_mnci += " file://devfs.patch;patch=1"
-SRC_URI_append_mnci += " file://event1.patch;patch=1"
 SRC_URI_append_qemumips += " file://32bitBE-support.patch;patch=1"
 
 
@@ -37,18 +33,6 @@ do_install_prepend() {
 do_install_append() {
 	install -d ${D}${sysconfdir}/profile.d/
 	install -m 0755 ${WORKDIR}/tslib.sh ${D}${sysconfdir}/profile.d/
-	case ${MACHINE} in
-	collie )
-		install -d ${D}${datadir}/tslib
-		install -m 0644 ${WORKDIR}/ts.conf-collie-2.4 ${D}${datadir}/tslib/
-		;;
-	simpad )
-		install -d ${D}${datadir}/tslib
-		install -m 0644 ${WORKDIR}/ts.conf-simpad-2.4 ${D}${datadir}/tslib/
-		;;
-	*)
-		;;
-	esac
 }
 
 SRC_URI_OVERRIDES_PACKAGE_ARCH = "0"
@@ -58,20 +42,6 @@ SRC_URI_OVERRIDES_PACKAGE_ARCH = "0"
 #RDEPENDS_tslib-conf_weird-machine = "detect-stylus"
 RPROVIDES_tslib-conf = "libts-0.0-conf"
 
-# Machines with machine specific patches
-PACKAGE_ARCH_mnci = "${MACHINE_ARCH}"
-# Machines with machine specific config files (tslib.sh)
-PACKAGE_ARCH_tslib-conf_a780 = "${MACHINE_ARCH}"
-PACKAGE_ARCH_tslib-conf_collie = "${MACHINE_ARCH}"
-PACKAGE_ARCH_tslib-conf_e680 = "${MACHINE_ARCH}"
-PACKAGE_ARCH_tslib-conf_jornada56x = "${MACHINE_ARCH}"
-PACKAGE_ARCH_tslib-conf_jornada6xx = "${MACHINE_ARCH}"
-PACKAGE_ARCH_tslib-conf_jornada7xx = "${MACHINE_ARCH}"
-PACKAGE_ARCH_tslib-conf_netbook-pro = "${MACHINE_ARCH}"
-PACKAGE_ARCH_tslib-conf_omap1610h2 = "${MACHINE_ARCH}"
-PACKAGE_ARCH_tslib-conf_omap5912osk = "${MACHINE_ARCH}"
-PACKAGE_ARCH_tslib-conf_simpad = "${MACHINE_ARCH}"
-
 PACKAGES =+ "tslib-conf tslib-tests tslib-calibrate"
 DEBIAN_NOAUTONAME_tslib-conf = "1"
 DEBIAN_NOAUTONAME_tslib-tests = "1"
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/atom-pc/xorg.conf b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/atom-pc/xorg.conf
deleted file mode 100644
index e18b911..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/atom-pc/xorg.conf
+++ /dev/null
@@ -1,26 +0,0 @@
-Section "Device"
-    Identifier    "Intel Graphics Driver"
-    Driver        "intel"
-EndSection
-
-Section "Monitor"
-    Identifier    "Generic Monitor"
-    Option        "DPMS"
-EndSection
-
-Section "Screen"
-    Identifier    "Default Screen"
-    Device        "Intel Graphics Driver"
-    Monitor        "Generic Monitor"
-    DefaultDepth    24
-EndSection
-
-Section "ServerLayout"
-    Identifier    "Default Layout"
-    Screen        "Default Screen"
-EndSection
-
-Section "ServerFlags"
-    Option        "DontZap"  "0"
-    Option	  "AutoAddDevices" "False"
-EndSection
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/igep0020/xorg.conf b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/igep0020/xorg.conf
deleted file mode 100644
index ae8a395..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/igep0020/xorg.conf
+++ /dev/null
@@ -1,47 +0,0 @@
-
-Section "Files"
-EndSection
-
-Section "InputDevice"
-    Identifier    "Generic Keyboard"
-    Driver        "kbd"
-    Option        "CoreKeyboard"
-    Option        "XkbRules"    "xorg"
-    Option        "XkbModel"    "pc105"
-    Option        "XkbLayout"    "us"
-EndSection
-
-Section "InputDevice"
-    Identifier    "Configured Mouse"
-    Driver        "mouse"
-    Option        "CorePointer"
-    Option        "Device"        "/dev/input/mice"
-    Option        "Protocol"        "ImPS/2"
-    Option        "ZAxisMapping"        "4 5"
-    Option        "Emulate3Buttons"    "true"
-EndSection
-
-Section "Device"
-    Identifier    "OMAPFB Graphics Controller"
-    Driver        "omapfb"
-EndSection
-
-Section "Monitor"
-    Identifier    "Generic Monitor"
-    Option        "DPMS"
-EndSection
-
-Section "Screen"
-    Identifier    "Default Screen"
-    Device        "OMAPFB Graphics Controller"
-    Monitor       "Generic Monitor"
-EndSection
-
-Section "ServerLayout"
-    Identifier    "Default Layout"
-    Screen        "Default Screen"
-    InputDevice    "Generic Keyboard"
-    InputDevice    "Configured Mouse"
-    Option         "AllowEmptyInput" "no" 
-EndSection
-
diff --git a/meta/recipes-kernel/modutils/files/ipaq-pxa-2.6/modules b/meta/recipes-kernel/modutils/files/ipaq-pxa-2.6/modules
deleted file mode 100644
index ca99e71..0000000
--- a/meta/recipes-kernel/modutils/files/ipaq-pxa-2.6/modules
+++ /dev/null
@@ -1,18 +0,0 @@
-mq11xx_base
-soc-device
-h2200_lcd
-h4000_lcd
-cfbcopyarea
-cfbfillrect
-cfbimgblt
-mq1100fb
-pxafb
-lcd
-backlight
-font
-fbcon
-pxa2xx_udc
-g_ether
-sunrpc
-lockd
-nfs
diff --git a/meta/recipes-kernel/modutils/files/ipaq-pxa-2.6/modules.conf b/meta/recipes-kernel/modutils/files/ipaq-pxa-2.6/modules.conf
deleted file mode 100644
index ef2e561..0000000
--- a/meta/recipes-kernel/modutils/files/ipaq-pxa-2.6/modules.conf
+++ /dev/null
@@ -1 +0,0 @@
-# Add ipaq-pxa-2.6 modules parameters and aliases here
diff --git a/meta/recipes-kernel/modutils/files/mnci/modules b/meta/recipes-kernel/modutils/files/mnci/modules
deleted file mode 100644
index e228d2e..0000000
--- a/meta/recipes-kernel/modutils/files/mnci/modules
+++ /dev/null
@@ -1 +0,0 @@
-sysctl
diff --git a/meta/recipes-kernel/modutils/files/mnci/modules-ramses b/meta/recipes-kernel/modutils/files/mnci/modules-ramses
deleted file mode 100644
index e228d2e..0000000
--- a/meta/recipes-kernel/modutils/files/mnci/modules-ramses
+++ /dev/null
@@ -1 +0,0 @@
-sysctl
diff --git a/meta/recipes-kernel/modutils/files/mnci/modules.conf b/meta/recipes-kernel/modutils/files/mnci/modules.conf
deleted file mode 100644
index 310e5bb..0000000
--- a/meta/recipes-kernel/modutils/files/mnci/modules.conf
+++ /dev/null
@@ -1,20 +0,0 @@
-alias irda0 pxa_ir
-alias usbd0 usbdmonitor
-alias usbf usb-eth
-alias sound-slot-0 pxa-ac97
-alias sound-slot-1 pxa-ac97
-
-# Affix modules
-alias net-pf-27 affix
-alias char-major-60 affix_rfcomm
-
-# BlueZ modules
-alias net-pf-31 bluez
-alias bt-proto-0 l2cap
-alias bt-proto-2 sco
-alias bt-proto-3 rfcomm
-alias bt-proto-4 bnep
-alias bt-proto-5 cmtp
-alias bt-proto-6 hidp
-alias tty-ldisc-15 hci_uart
-alias char-major-10-250 hci_vhci
diff --git a/meta/recipes-kernel/modutils/files/mnci/modutils.sh b/meta/recipes-kernel/modutils/files/mnci/modutils.sh
deleted file mode 100755
index 378915c..0000000
--- a/meta/recipes-kernel/modutils/files/mnci/modutils.sh
+++ /dev/null
@@ -1,10 +0,0 @@
-depmod -Ae
-
-(cat /etc/modules; echo; ) |
-while read module args
-do
-	case "$module" in
-		\#*|"") continue ;;
-	esac
-	modprobe $module $args
-done
diff --git a/meta/recipes-kernel/modutils/files/mtx-1/modules b/meta/recipes-kernel/modutils/files/mtx-1/modules
deleted file mode 100644
index 3eb719a..0000000
--- a/meta/recipes-kernel/modutils/files/mtx-1/modules
+++ /dev/null
@@ -1,3 +0,0 @@
-tun
-ppp_async
-hostap_pci
\ No newline at end of file
diff --git a/meta/recipes-kernel/modutils/files/omap1610h2/modules b/meta/recipes-kernel/modutils/files/omap1610h2/modules
deleted file mode 100644
index e69de29..0000000
diff --git a/meta/recipes-kernel/modutils/files/omap1610h2/modules.conf b/meta/recipes-kernel/modutils/files/omap1610h2/modules.conf
deleted file mode 100644
index e69de29..0000000
diff --git a/meta/recipes-kernel/modutils/files/poodle/modules b/meta/recipes-kernel/modutils/files/poodle/modules
deleted file mode 100644
index 28d14f6..0000000
--- a/meta/recipes-kernel/modutils/files/poodle/modules
+++ /dev/null
@@ -1,3 +0,0 @@
-usbdcore
-net_fd
-pxa_bi
diff --git a/meta/recipes-kernel/modutils/files/poodle/modules.conf b/meta/recipes-kernel/modutils/files/poodle/modules.conf
deleted file mode 100644
index 8ff8787..0000000
--- a/meta/recipes-kernel/modutils/files/poodle/modules.conf
+++ /dev/null
@@ -1,4 +0,0 @@
-alias irda0 pxa_ir
-alias usbd0 usbdmonitor
-alias usbf usb-eth
-
diff --git a/meta/recipes-kernel/modutils/files/tosa/modules b/meta/recipes-kernel/modutils/files/tosa/modules
deleted file mode 100644
index 754cc7f..0000000
--- a/meta/recipes-kernel/modutils/files/tosa/modules
+++ /dev/null
@@ -1,4 +0,0 @@
-usbdcore
-net_fd
-pxa_bi
-usb_ohci_tc6393
\ No newline at end of file
diff --git a/meta/recipes-kernel/modutils/files/tosa/modules.conf b/meta/recipes-kernel/modutils/files/tosa/modules.conf
deleted file mode 100644
index 8ff8787..0000000
--- a/meta/recipes-kernel/modutils/files/tosa/modules.conf
+++ /dev/null
@@ -1,4 +0,0 @@
-alias irda0 pxa_ir
-alias usbd0 usbdmonitor
-alias usbf usb-eth
-
diff --git a/meta/recipes-kernel/modutils/files/wrt54/modules b/meta/recipes-kernel/modutils/files/wrt54/modules
deleted file mode 100644
index 78f651a..0000000
--- a/meta/recipes-kernel/modutils/files/wrt54/modules
+++ /dev/null
@@ -1,4 +0,0 @@
-et
-wl
-wlcompat
-diag
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.22.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.22.bb
index 0d2f328..91893d7 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.22.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.22.bb
@@ -4,10 +4,6 @@ PR = "r0"
 
 DEPENDS += "gdbm speex"
 
-DEFAULT_PREFERENCE_om-gta01 = "-1"
-DEFAULT_PREFERENCE_om-gta02 = "-1"
-DEFAULT_PREFERENCE_motorola-ezx = "-1"
-
 inherit gettext
 
 SRC_URI += "\
diff --git a/meta/recipes-qt/qt4/qt4-x11-free.inc b/meta/recipes-qt/qt4/qt4-x11-free.inc
index ba08dc8..4b3571b 100644
--- a/meta/recipes-qt/qt4/qt4-x11-free.inc
+++ b/meta/recipes-qt/qt4/qt4-x11-free.inc
@@ -6,12 +6,10 @@ SECTION = "x11/libs"
 PRIORITY = "optional"
 DEPENDS += "virtual/libgl virtual/libx11 fontconfig libxft libxext libxrender libxrandr libxcursor"
 
-INC_PR = "r22"
+INC_PR = "r23"
 
 QT_GLFLAGS ?= "-no-opengl"
 QT_GLFLAGS_qemux86 = "-opengl"
-QT_GLFLAGS_emenlow = "-opengl"
-QT_GLFLAGS_atom-pc = "-opengl"
 QT_GLFLAGS_qemuppc = "-opengl"
 QT_CONFIG_FLAGS += "-no-xinerama -no-xkb ${QT_GLFLAGS}"
 QT_BASE_NAME ?= "qt4"
diff --git a/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb b/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb
index a4abea4..01e456e 100644
--- a/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb
+++ b/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb
@@ -44,11 +44,5 @@ fi
 gconftool-2 --config-source=xml::$D${sysconfdir}/gconf/gconf.xml.defaults --direct --type string --set /desktop/poky/interface/theme Sato
 gconftool-2 --config-source=xml::$D${sysconfdir}/gconf/gconf.xml.defaults --direct --type string --set /desktop/poky/interface/icon_theme Sato
 gconftool-2 --config-source=xml::$D${sysconfdir}/gconf/gconf.xml.defaults --direct --type bool --set /desktop/poky/interface/touchscreen true
-
-if [ "`machine_id`" = "gta01" ]
-then
-    gconftool-2 --config-source=xml::$D${sysconfdir}/gconf/gconf.xml.defaults --direct --type string --set /desktop/poky/interface/font_name "Sans 6"
-else
-    gconftool-2 --config-source=xml::$D${sysconfdir}/gconf/gconf.xml.defaults --direct --type string --set /desktop/poky/interface/font_name "Sans 9"
-fi
+gconftool-2 --config-source=xml::$D${sysconfdir}/gconf/gconf.xml.defaults --direct --type string --set /desktop/poky/interface/font_name "Sans 9"
 }
diff --git a/meta/recipes-support/hal/hal.inc b/meta/recipes-support/hal/hal.inc
index ee6c7ba..d276d46 100644
--- a/meta/recipes-support/hal/hal.inc
+++ b/meta/recipes-support/hal/hal.inc
@@ -33,7 +33,6 @@ EXTRA_OECONF = "--with-hwdata=${datadir}/hwdata \
 MY_ARCH := "${PACKAGE_ARCH}"
 PACKAGE_ARCH = "${@base_contains('MACHINE_FEATURES', 'acpi', '${MACHINE_ARCH}', '${MY_ARCH}',d)}"
 PACKAGE_ARCH = "${@base_contains('MACHINE_FEATURES', 'pci', '${MACHINE_ARCH}', '${MY_ARCH}',d)}"
-PACKAGE_ARCH_emenlow := "${PACKAGE_ARCH}"
 
 do_install_append() {
         install -d ${D}/etc/dbus-1/event.d
diff --git a/meta/recipes-support/hal/hal_0.5.14.bb b/meta/recipes-support/hal/hal_0.5.14.bb
index 8b82ca8..aa67ae6 100644
--- a/meta/recipes-support/hal/hal_0.5.14.bb
+++ b/meta/recipes-support/hal/hal_0.5.14.bb
@@ -1,6 +1,6 @@
 require hal.inc
 
-PR = "r3"
+PR = "r4"
 
 EXTRA_OECONF += "--with-linux-input-header=${STAGING_INCDIR}/linux/input.h"
 EXTRA_OEMAKE += "-e 'udevrulesdir=$(sysconfdir)/udev/rules.d'"
diff --git a/meta/recipes-support/hal/hal_git.bb b/meta/recipes-support/hal/hal_git.bb
index 483867f..e4ec09b 100644
--- a/meta/recipes-support/hal/hal_git.bb
+++ b/meta/recipes-support/hal/hal_git.bb
@@ -1,7 +1,7 @@
 require hal.inc
 
 PV = "0.5.9.1+git${SRCDATE}"
-PR = "r8"
+PR = "r9"
 
 SRC_URI = "git://anongit.freedesktop.org/hal/;protocol=git \
         file://20hal \
-- 
1.7.1



