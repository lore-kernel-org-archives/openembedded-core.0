Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QM5cs-0003R0-Ag
	for openembedded-core@lists.openembedded.org;
	Mon, 16 May 2011 23:46:55 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 16 May 2011 14:44:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,221,1304319600"; 
   d="scan'208";a="2999728"
Received: from unknown (HELO localhost) ([10.255.12.119])
	by fmsmga001.fm.intel.com with ESMTP; 16 May 2011 14:43:59 -0700
Message-Id: <cover.1305580484.git.sgw@linux.intel.com>
Old-Date: Mon, 16 May 2011 14:14:44 -0700
Date: Mon, 16 May 2011 14:43:59 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 00/14] 16-May-2011 Consolidated Pull Request
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
X-List-Received-Date: Mon, 16 May 2011 21:46:55 -0000

From: Saul Wold <sgw@linux.intel.com>

Richard,

This contains the Kernel updates, Upstream-Status updates along with
some changes from Nitin, Khem, Tom and myself.


Pull URL: git://git.openembedded.org/openembedded-core-contrib
  Branch: sgw/stage
  Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Thanks,
    Saul Wold <sgw@linux.intel.com>
---


Bruce Ashfield (2):
  linux-yocto: detect and avoid branch revision checking for AUTOREV
  linux-yocto: update meta SRCREV

Khem Raj (3):
  opkg: Bump SRCREV to 609
  e2fsprogs_1.41.14.bb: Package libraries into separate packages
  base.bbclass: Fix PR increment bug when PR number is a single digit

Mei Lei (1):
  Add a new task checklicense and fix some bugs in distro_check.py

Nitin A Kamble (1):
  task-core-nfs: fix a bitbake error

Saul Wold (1):
  mutter: Recipe Update for clutter 1.6 update

Scott Garman (1):
  recipes: Add Upstream-Status to various recipe patches

Tom Rini (2):
  openssh: Don't use ${libdir}exec
  perl-native: create_wrapper on perl${PV} too

Yu Ke (2):
  xserver-kdrive: upgrade from 1.7.99.2 to 1.10.1
  Upstream-Status update for several recipes

Zhai Edwin (1):
  Upstream-Status: Update patch upstream-status for libfm, eggdbus,
    screenshot...

 meta/classes/base.bbclass                          |   19 +-
 meta/classes/distrodata.bbclass                    |  177 ++++---
 meta/classes/kernel-yocto.bbclass                  |    7 +
 meta/lib/oe/distro_check.py                        |   27 +-
 meta/recipes-bsp/keymaps/files/GPLv2.patch         |    2 +
 meta/recipes-bsp/libacpi/files/makefile-fix.patch  |    2 +
 .../openssh/openssh-5.6p1/nostrip.patch            |    9 +-
 meta/recipes-connectivity/openssh/openssh_5.6p1.bb |    4 +-
 .../console-tools-0.3.2/codepage.patch             |    1 +
 .../console-tools-0.3.2/compile.patch              |    2 +
 .../console-tools-0.3.2/configure.patch            |    1 +
 .../console-tools-0.3.2/kbdrate.patch              |    2 +
 .../console-tools-0.3.2/uclibc-fileno.patch        |    2 +
 .../dbus/dbus-glib-0.92/no-examples.patch          |    9 +-
 meta/recipes-core/eggdbus/eggdbus/gtk-doc.patch    |    2 +
 meta/recipes-core/eggdbus/eggdbus/marshal.patch    |    2 +
 .../recipes-core/expat/expat-2.0.1/autotools.patch |   10 +-
 .../initscripts/initscripts-1.0/GPLv2.patch        |    2 +
 meta/recipes-core/tasks/task-core-nfs.bb           |    4 +-
 .../e2fsprogs/e2fsprogs_1.41.14.bb                 |    6 +
 .../opensp/opensp/attributevalue.patch             |    3 +
 .../opensp/opensp/fix-docdir.patch                 |    3 +
 meta/recipes-devtools/opensp/opensp/m4.patch       |    3 +
 .../opensp/opensp/rangmap-fix.patch                |    3 +
 meta/recipes-devtools/opkg/opkg.inc                |    8 +-
 meta/recipes-devtools/opkg/opkg_svn.bb             |    3 +-
 meta/recipes-devtools/perl/perl-native_5.12.3.bb   |    1 +
 .../qemu/qemu-git/enable-i386-linux-user.patch     |    2 +
 meta/recipes-devtools/qemu/qemu-git/fix-nogl.patch |    2 +
 .../qemu/qemu-git/linker-flags.patch               |    3 +
 meta/recipes-devtools/qemu/qemu-git/no-strip.patch |    2 +
 .../qemu/qemu-git/qemu-git-qemugl-host.patch       |    2 +
 .../qemu/qemu-git/qemu-vmware-vga-depth.patch      |    3 +
 .../qemu-git/qemugl-allow-glxcontext-release.patch |    2 +
 .../sgml-common/sgml-common-0.6.3/autohell.patch   |    3 +
 .../sgml-common/sgml-common-0.6.3/license.patch    |    3 +
 meta/recipes-extended/at/at-3.1.12/configure.patch |    8 +-
 .../at/at-3.1.12/fix_parallel_build_error.patch    |    4 +
 meta/recipes-extended/cpio/cpio-2.11/statdef.patch |    8 +-
 .../pam/libpam/pam-no-innetgr.patch                |    5 +
 meta/recipes-extended/sudo/files/libtool.patch     |   10 +-
 .../gtk+/gtk+-2.12.7/filechooser-props.patch       |    2 +
 .../clutter-box2d/fix-disable-introspection.patch  |    2 +
 .../mesa-demos/dso_linking_change_build_fix.patch  |    1 +
 meta/recipes-graphics/mutter/mutter.inc            |    2 +-
 .../mutter/fix_CGL_TEXTURE_RECTANGLE_ARB.patch     |   47 ++
 meta/recipes-graphics/mutter/mutter_2.28.1.bb      |    9 +-
 meta/recipes-graphics/mutter/mutter_git.bb         |    1 +
 .../enable-builtin-fonts.patch                     |   12 -
 .../xserver-kdrive-1.3.0.0/enable-epson.patch      |   11 -
 .../xserver-kdrive-1.3.0.0/enable-tslib.patch      |   12 -
 .../xserver-kdrive-1.3.0.0/enable-xcalibrate.patch |  110 -----
 .../xserver-kdrive-1.3.0.0/fbdev_use_current.patch |   41 --
 .../hide-cursor-and-ppm-root.patch                 |  307 ------------
 .../xserver-kdrive-1.3.0.0/kdrive-evdev.patch      |  515 --------------------
 .../xserver-kdrive-1.3.0.0/kdrive-use-evdev.patch  |   54 --
 .../xserver-kdrive-1.3.0.0/optional-xkb.patch      |   58 ---
 .../report-correct-randr12.patch                   |   29 --
 .../xserver-kdrive-1.3.0.0/scheduler.patch         |  151 ------
 .../xserver-kdrive-1.3.0.0/xcalibrate_coords.patch |  122 -----
 .../xserver-kdrive-1.7.99.2/crosscompile.patch     |   19 -
 .../xserver-kdrive-1.7.99.2/disable-apm.patch      |   20 -
 .../enable-builtin-fonts.patch                     |   12 -
 .../enable-xcalibrate.patch                        |  148 ------
 .../xserver-kdrive-1.7.99.2/extra-kmodes.patch     |   83 ----
 .../fbdev_xrandr_ioctl.patch                       |   61 ---
 .../fix-newer-xorg-headers.patch                   |   18 -
 .../xserver-kdrive-1.7.99.2/kdrive-evdev.patch     |  515 --------------------
 .../xserver-kdrive-1.7.99.2/kdrive-use-evdev.patch |   54 --
 .../no-serial-probing.patch                        |   13 -
 .../xserver-kdrive-1.7.99.2/nodolt.patch           |   12 -
 .../xserver-kdrive-1.7.99.2/optional-xkb.patch     |   58 ---
 .../xorg-xserver/xserver-kdrive.inc                |    2 +-
 .../xorg-xserver/xserver-kdrive/crosscompile.patch |   22 +
 .../xorg-xserver/xserver-kdrive/disable-apm.patch  |   20 +-
 .../xserver-kdrive/disable-xf86-dga-xorgcfg.patch  |   39 --
 .../xorg-xserver/xserver-kdrive/extra-kmodes.patch |   33 +-
 .../xserver-kdrive/fbdev_xrandr_ioctl.patch        |   25 +-
 .../fix-newer-xorg-headers.patch                   |    0
 .../hide-cursor-and-ppm-root.patch                 |   68 ++--
 .../keyboard-resume-workaround.patch               |    0
 .../xorg-xserver/xserver-kdrive_1.10.1.bb          |   22 +
 .../xorg-xserver/xserver-kdrive_1.7.99.2.bb        |   29 --
 .../fix_open_max_preprocessor_error.patch          |    2 +
 .../kern-tools/kern-tools-native_git.bb            |    2 +-
 meta/recipes-kernel/linux/linux-yocto_git.bb       |    2 +-
 .../module-init-tools/files/disable_man.patch      |    2 +
 .../files/grab_module_memset.patch                 |    2 +
 .../files/ignore_arch_directory.patch              |    2 +
 .../files/modutils_extension.patch                 |    3 +
 .../files/no-static-binaries.patch                 |    2 +
 meta/recipes-kernel/modutils/files/PD.patch        |    2 +
 meta/recipes-kernel/modutils/files/armeb.patch     |    2 +
 meta/recipes-kernel/modutils/files/configure.patch |    1 +
 meta/recipes-kernel/modutils/files/gcc4.patch      |    2 +
 meta/recipes-kernel/modutils/files/lex.l.diff      |    2 +
 .../modutils/files/modutils-notest.patch           |    2 +
 .../modutils/files/program_prefix.patch            |    2 +
 .../modutils/modutils-cross/module.h.diff          |    2 +
 .../screenshot/files/fix_ldadd_order.patch         |    3 +
 meta/recipes-support/icu/files/gccfix.patch        |    6 +
 meta/recipes-support/icu/files/noldlibpath.patch   |    5 +
 .../icu/files/use-g++-for-linking.patch            |    7 +
 .../libfm/libfm-0.1.14/use_deprecate_func.patch    |    2 +
 104 files changed, 480 insertions(+), 2705 deletions(-)
 create mode 100644 meta/recipes-graphics/mutter/mutter/fix_CGL_TEXTURE_RECTANGLE_ARB.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.3.0.0/enable-builtin-fonts.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.3.0.0/enable-epson.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.3.0.0/enable-tslib.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.3.0.0/enable-xcalibrate.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.3.0.0/fbdev_use_current.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.3.0.0/hide-cursor-and-ppm-root.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.3.0.0/kdrive-evdev.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.3.0.0/kdrive-use-evdev.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.3.0.0/optional-xkb.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.3.0.0/report-correct-randr12.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.3.0.0/scheduler.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.3.0.0/xcalibrate_coords.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/crosscompile.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/disable-apm.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/enable-builtin-fonts.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/enable-xcalibrate.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/extra-kmodes.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/fbdev_xrandr_ioctl.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/fix-newer-xorg-headers.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/kdrive-evdev.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/kdrive-use-evdev.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/no-serial-probing.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/nodolt.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/optional-xkb.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive/crosscompile.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive/disable-xf86-dga-xorgcfg.patch
 rename meta/recipes-graphics/xorg-xserver/{xserver-kdrive-1.3.0.0 => xserver-kdrive}/fix-newer-xorg-headers.patch (100%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-kdrive-1.7.99.2 => xserver-kdrive}/hide-cursor-and-ppm-root.patch (79%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-kdrive-1.7.99.2 => xserver-kdrive}/keyboard-resume-workaround.patch (100%)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.10.1.bb
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.7.99.2.bb



