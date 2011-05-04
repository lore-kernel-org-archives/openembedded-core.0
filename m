Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QHdSf-00074W-LN
	for openembedded-core@lists.openembedded.org;
	Wed, 04 May 2011 16:53:58 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 04 May 2011 07:51:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,314,1301900400"; d="scan'208";a="688058507"
Received: from unknown (HELO helios) ([10.255.13.83])
	by fmsmga002.fm.intel.com with SMTP; 04 May 2011 07:51:16 -0700
Received: by helios (sSMTP sendmail emulation); Wed, 04 May 2011 15:51:14 +0100
Message-Id: <cover.1304520272.git.paul.eggleton@linux.intel.com>
Old-Date: Wed, 4 May 2011 15:44:32 +0100
Date: Wed, 04 May 2011 15:51:14 +0100
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH 0/3] Remove machine/distro-specific metadata v3 + add some back to meta-yocto
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
X-List-Received-Date: Wed, 04 May 2011 14:53:58 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

Remove overrides & files for machines and distros that are not / no longer
in oe-core. Since the second patchset, the patches have been rebased on
current Poky master and the atom-pc / beagleboard bits have been added
back in via meta-yocto.

The other machine-specific items may be added to other layers where it makes
sense (and in some cases are probably already better supported elsewhere).

Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: paule/poky-remove-specifics
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=paule/poky-remove-specifics

Thanks,
    Paul Eggleton <paul.eggleton@linux.intel.com>
---


Paul Eggleton (3):
  Remove machine-specific metadata for machines no longer in oe-core
  Remove distro-specific metadata for distros not in oe-core
  meta-yocto: add pieces removed from oe-core for beagleboard & atom-pc

 .../openswan/openswan_2.4.7.bb                     |    3 +-
 .../formfactor/formfactor}/atom-pc/machconfig      |    0
 .../formfactor/formfactor}/beagleboard/machconfig  |    0
 .../recipes-bsp/formfactor/formfactor_0.0.bbappend |    3 +
 .../recipes-core/tasks/task-core-tools.bbappend    |    2 +
 .../uclibc/uclibc}/atom-pc/uClibc.machine          |    0
 .../recipes-core/uclibc/uclibc_0.9.30.1.bbappend   |    3 +
 .../tasks/task-poky-sdk-gmae.bbappend              |    1 +
 .../task-poky-standalone-gmae-sdk-target.bbappend  |    1 +
 .../clutter/clutter-1.4_1.4.2.bbappend             |    4 +
 .../clutter/clutter-1.6_1.6.14.bbappend            |    4 +
 .../recipes-graphics/clutter/clutter_git.bbappend  |    4 +
 .../recipes-graphics/mesa/mesa-dri_7.10.2.bbappend |    3 +
 .../recipes-graphics/mesa/mesa-dri_git.bbappend    |    3 +
 .../xserver-xf86-config/atom-pc/xorg.conf          |    0
 .../xorg-xserver/xserver-xf86-config_0.1.bbappend  |    3 +
 .../recipes-qt/qt4/qt4-x11-free_4.6.3.bbappend     |    2 +
 .../recipes-qt/qt4/qt4-x11-free_4.7.2.bbappend     |    2 +
 meta/recipes-bsp/formfactor/files/akita/machconfig |   15 -
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
 meta/recipes-connectivity/dhcp/dhcp3.inc           |    4 -
 meta/recipes-connectivity/dhcp/dhcp4.inc           |    4 -
 meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb       |    2 +-
 meta/recipes-connectivity/ppp/ppp_2.4.5.bb         |    5 +-
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
 meta/recipes-core/base-files/base-files_3.0.14.bb  |   46 +--
 .../recipes-core/base-passwd/base-passwd_3.5.22.bb |    7 +-
 meta/recipes-core/busybox/busybox.inc              |    3 -
 meta/recipes-core/busybox/busybox_1.18.4.bb        |    2 +-
 meta/recipes-core/dropbear/dropbear.inc            |    2 +-
 meta/recipes-core/dropbear/dropbear_0.52.bb        |    2 +-
 .../netbase/netbase-4.45/colinux/interfaces        |    8 -
 .../netbase/netbase-4.45/epia/interfaces           |   10 -
 .../netbase/netbase-4.45/mtx-1/interfaces          |   29 -
 .../netbase/netbase-4.45/nokia800/interfaces       |    5 -
 .../recipes-core/netbase/netbase-4.45/openmn/hosts |    2 -
 .../netbase/netbase-4.45/openmn/interfaces         |   10 -
 .../netbase/netbase-4.45/tosa/interfaces           |   24 -
 .../netbase/netbase-4.45/wrt54/interfaces          |   23 -
 .../netbase/netbase-4.45/xxs1500/interfaces        |   15 -
 meta/recipes-core/netbase/netbase_4.45.bb          |   10 +-
 meta/recipes-core/tasks/task-core-tools.bb         |    2 -
 .../uclibc/uclibc-0.9.30.1/akita/uClibc.machine    |   70 ---
 .../uclibc/uclibc-0.9.30.1/c7x0/uClibc.machine     |   70 ---
 .../uclibc/uclibc-0.9.30.1/cm-x270/uClibc.machine  |   70 ---
 .../uclibc/uclibc-0.9.30.1/om-gta01/uClibc.machine |   69 ---
 .../uclibc/uclibc-0.9.30.1/spitz/uClibc.machine    |   70 ---
 meta/recipes-core/udev/files/50-hostap_cs.rules    |    4 -
 meta/recipes-core/udev/files/akita/mount.blacklist |    3 -
 meta/recipes-core/udev/files/c7x0/mount.blacklist  |    3 -
 .../recipes-core/udev/files/slugos/mount.blacklist |    4 -
 meta/recipes-core/udev/files/spitz/mount.blacklist |    4 -
 meta/recipes-core/udev/files/tosa/mount.blacklist  |    3 -
 meta/recipes-core/udev/udev-new.inc                |    7 -
 meta/recipes-core/udev/udev_145.bb                 |    9 +-
 meta/recipes-core/udev/udev_164.bb                 |    2 +-
 meta/recipes-devtools/dpkg/dpkg.inc                |    1 -
 meta/recipes-devtools/dpkg/dpkg_1.15.8.7.bb        |    2 +-
 meta/recipes-devtools/perl/perl-native_5.12.3.bb   |    8 +-
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
 .../update-modules-1.0/openmn/update-modules       |    3 -
 .../update-modules/update-modules_1.0.bb           |   11 +-
 .../pulseaudio/pulseaudio_0.9.22.bb                |    4 -
 meta/recipes-qt/qt4/qt4-x11-free.inc               |    4 +-
 .../matchbox-sato/matchbox-session-sato_0.1.bb     |    8 +-
 meta/recipes-support/hal/hal.inc                   |    1 -
 meta/recipes-support/hal/hal_0.5.14.bb             |    2 +-
 meta/recipes-support/hal/hal_git.bb                |    2 +-
 159 files changed, 58 insertions(+), 4305 deletions(-)
 rename {meta/recipes-bsp/formfactor/files => meta-yocto/recipes-bsp/formfactor/formfactor}/atom-pc/machconfig (100%)
 rename {meta/recipes-bsp/formfactor/files => meta-yocto/recipes-bsp/formfactor/formfactor}/beagleboard/machconfig (100%)
 create mode 100644 meta-yocto/recipes-bsp/formfactor/formfactor_0.0.bbappend
 create mode 100644 meta-yocto/recipes-core/tasks/task-core-tools.bbappend
 rename {meta/recipes-core/uclibc/uclibc-0.9.30.1 => meta-yocto/recipes-core/uclibc/uclibc}/atom-pc/uClibc.machine (100%)
 create mode 100644 meta-yocto/recipes-core/uclibc/uclibc_0.9.30.1.bbappend
 create mode 100644 meta-yocto/recipes-gnome/tasks/task-poky-sdk-gmae.bbappend
 create mode 100644 meta-yocto/recipes-gnome/tasks/task-poky-standalone-gmae-sdk-target.bbappend
 create mode 100644 meta-yocto/recipes-graphics/clutter/clutter-1.4_1.4.2.bbappend
 create mode 100644 meta-yocto/recipes-graphics/clutter/clutter-1.6_1.6.14.bbappend
 create mode 100644 meta-yocto/recipes-graphics/clutter/clutter_git.bbappend
 create mode 100644 meta-yocto/recipes-graphics/mesa/mesa-dri_7.10.2.bbappend
 create mode 100644 meta-yocto/recipes-graphics/mesa/mesa-dri_git.bbappend
 rename {meta => meta-yocto}/recipes-graphics/xorg-xserver/xserver-xf86-config/atom-pc/xorg.conf (100%)
 create mode 100644 meta-yocto/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bbappend
 create mode 100644 meta-yocto/recipes-qt/qt4/qt4-x11-free_4.6.3.bbappend
 create mode 100644 meta-yocto/recipes-qt/qt4/qt4-x11-free_4.7.2.bbappend
 delete mode 100755 meta/recipes-bsp/formfactor/files/akita/machconfig
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
 delete mode 100644 meta/recipes-core/netbase/netbase-4.45/colinux/interfaces
 delete mode 100644 meta/recipes-core/netbase/netbase-4.45/epia/interfaces
 delete mode 100644 meta/recipes-core/netbase/netbase-4.45/mtx-1/interfaces
 delete mode 100644 meta/recipes-core/netbase/netbase-4.45/nokia800/interfaces
 delete mode 100644 meta/recipes-core/netbase/netbase-4.45/openmn/hosts
 delete mode 100644 meta/recipes-core/netbase/netbase-4.45/openmn/interfaces
 delete mode 100644 meta/recipes-core/netbase/netbase-4.45/tosa/interfaces
 delete mode 100644 meta/recipes-core/netbase/netbase-4.45/wrt54/interfaces
 delete mode 100644 meta/recipes-core/netbase/netbase-4.45/xxs1500/interfaces
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.30.1/akita/uClibc.machine
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.30.1/c7x0/uClibc.machine
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.30.1/cm-x270/uClibc.machine
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.30.1/om-gta01/uClibc.machine
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.30.1/spitz/uClibc.machine
 delete mode 100644 meta/recipes-core/udev/files/50-hostap_cs.rules
 delete mode 100644 meta/recipes-core/udev/files/akita/mount.blacklist
 delete mode 100644 meta/recipes-core/udev/files/c7x0/mount.blacklist
 delete mode 100644 meta/recipes-core/udev/files/slugos/mount.blacklist
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
 delete mode 100755 meta/recipes-kernel/update-modules/update-modules-1.0/openmn/update-modules

-- 
1.7.4.1



