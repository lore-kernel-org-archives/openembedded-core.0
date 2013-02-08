Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1U3jes-0006SX-2F
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 09:50:10 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 08 Feb 2013 00:34:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,628,1355126400"; d="scan'208";a="284376139"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.90])
	by fmsmga001.fm.intel.com with ESMTP; 08 Feb 2013 00:34:02 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Feb 2013 00:34:02 -0800
Message-Id: <cover.1360312207.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
MIME-Version: 1.0
Subject: [CONSOLIDATED PULL 00/32] AB Tested set of patches
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
X-List-Received-Date: Fri, 08 Feb 2013 08:50:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Richard,

This is a set of patches that I have build tested on the
AB, this includes a set from Windriver.

The only one that we have commented on before is the 
coreutil (non-GPLv3) which seems correct.

I had to modify Ross's update-rc.d patch because it was not 
rebased after your package changes, it still seems like the
right thing to do.

Bruce indirectly ack'ed the busybox so it's good to go with
fixes expected later.

Sau!

The following changes since commit 688e9485980de0f29aa00e24ce53a3efd3a3a7cc:

  qemu.bbclass: fix segfaults when running through pseudo (2013-02-07 16:50:40 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Bernhard Reutner-Fischer (6):
  base.bbclass: Commentary typo fix
  uclibc: add c6x arch
  uclibc: turn on kernel module support
  busybox: add ifup's ifstate dir to package
  base.bbclass: remove redundant setting of MAKE
  create-pull-request: Error message on missing -u

Chen Qi (1):
  busybox: add config fragments

David Nyström (1):
  create-recipe: Bugfixes for create-recipe easy_install handling.

Holger Hans Peter Freyther (1):
  systemd_197.bb: Point to the place where we keep the /etc/rcN.d files

Jackie Huang (1):
  populate_sdk_base.bbclass: add execution permission for
    self-extracting archive

Jason Wessel (1):
  eglibc-nativesdk: Fix buffer overrun with a relocated SDK

Jesse Zhang (6):
  ghostscript: add pregenerated objarch for mipsel/mips64/mips64el
  libart-lgpl: add art_config for mips64/mips64el
  ghostscript: fix endianness detection
  coreutils: remove dependency on coreutils-native
  initscripts: Add status function to /etc/init.d/functions
  udev: Add start/stop/status/restart support to init script

Jim Somerville (1):
  rt-tests: fix cyclictest reported 1 sec latencies

Laurentiu Palcu (6):
  Add pixbufcache class
  gdk-pixbuf: use the new pixbufcache class
  librsvg: use the new pixbufcache class
  gtk-immodules-cache: add weak asignment for GTKIMMODULES_PACKAGES
  gtk+: use gtk-immodules-cache class
  gnome-keyring: compile schemas on host

Martin Jansa (1):
  qemu: disable smartcard support

Mihai Prica (1):
  qemu: Enabled SDL when compiling for target architecture

Peter Seebach (1):
  pseudo.inc: Fix sqlite libdir again, pseudo 1.4.3

Randy MacLeod (1):
  openssl: Add mips64 configure support.

Richard Purdie (2):
  dbus: Drop old 1.5.12 version
  dbus-native: Don't install dbus-launch

Saul Wold (1):
  Revert: update-rc.d: disable update-rc.d.bbclass when systemd enabled

Xin Ouyang (1):
  libcgroup: fix failure for absolute path

 meta/classes/base.bbclass                          |   3 +-
 meta/classes/gtk-immodules-cache.bbclass           |   2 +
 meta/classes/pixbufcache.bbclass                   |  57 ++++++++++
 meta/classes/populate_sdk_base.bbclass             |   3 +
 meta/classes/update-rc.d.bbclass                   |  87 +++++++++++++++-
 meta/classes/update-rc.d_real.bbclass              |  86 ---------------
 meta/recipes-connectivity/openssl/openssl.inc      |   3 +
 meta/recipes-core/busybox/busybox.inc              |  17 +++
 meta/recipes-core/coreutils/coreutils_6.9.bb       |   3 +-
 meta/recipes-core/dbus/dbus-1.5.12/dbus-1.init     | 116 ---------------------
 meta/recipes-core/dbus/dbus-1.5.12/tmpdir.patch    |  44 --------
 meta/recipes-core/dbus/dbus.inc                    |   4 +
 meta/recipes-core/dbus/dbus_1.5.12.bb              |   9 --
 .../eglibc-2.17/relocatable_sdk_fix_openpath.patch |  41 ++++++++
 meta/recipes-core/eglibc/eglibc_2.17.bb            |   3 +-
 .../initscripts/initscripts-1.0/functions          |  15 +++
 meta/recipes-core/initscripts/initscripts_1.0.bb   |   2 +-
 meta/recipes-core/libcgroup/libcgroup_0.38.bb      |   5 +-
 meta/recipes-core/systemd/systemd_197.bb           |   3 +-
 meta/recipes-core/uclibc/uclibc-config.inc         |   1 +
 meta/recipes-core/uclibc/uclibc-git/uClibc.distro  |   2 +
 meta/recipes-core/udev/udev/init                   | 113 +++++++++++---------
 meta/recipes-core/udev/udev_182.bb                 |   2 +-
 meta/recipes-devtools/pseudo/pseudo.inc            |   8 +-
 meta/recipes-devtools/pseudo/pseudo_1.4.1.bb       |   8 --
 meta/recipes-devtools/pseudo/pseudo_1.4.3.bb       |   8 ++
 meta/recipes-devtools/pseudo/pseudo_git.bb         |   6 +-
 meta/recipes-devtools/qemu/qemu.inc                |  19 ++--
 .../ghostscript-9.05-NOT-check-endian.patch        |  40 ++-----
 .../ghostscript/ghostscript/mips/objarch.h         |   2 +-
 .../ghostscript/ghostscript/mips64/objarch.h       |  40 +++++++
 .../ghostscript/ghostscript/mips64el/objarch.h     |  40 +++++++
 .../ghostscript/ghostscript/mipsel/objarch.h       |  40 +++++++
 .../ghostscript/ghostscript_9.05.bb                |   9 +-
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.26.5.bb |  48 +--------
 meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb   |  12 +--
 .../gnome/libart-lgpl/mips64/art_config.h          |  10 ++
 .../gnome/libart-lgpl/mips64el/art_config.h        |  10 ++
 meta/recipes-gnome/gtk+/gtk+.inc                   |   8 +-
 meta/recipes-gnome/gtk+/gtk+3_3.4.4.bb             |  12 +--
 meta/recipes-gnome/gtk+/gtk+_2.24.14.bb            |   4 +-
 meta/recipes-gnome/librsvg/librsvg_2.32.1.bb       |  21 +---
 ...st-finish-removal-of-1-second-first-loops.patch |  58 +++++++++++
 meta/recipes-rt/rt-tests/rt-tests.inc              |   3 +-
 scripts/create-pull-request                        |   5 +-
 scripts/create-recipe                              |   6 +-
 46 files changed, 569 insertions(+), 469 deletions(-)
 create mode 100644 meta/classes/pixbufcache.bbclass
 delete mode 100644 meta/classes/update-rc.d_real.bbclass
 delete mode 100644 meta/recipes-core/dbus/dbus-1.5.12/dbus-1.init
 delete mode 100644 meta/recipes-core/dbus/dbus-1.5.12/tmpdir.patch
 delete mode 100644 meta/recipes-core/dbus/dbus_1.5.12.bb
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.17/relocatable_sdk_fix_openpath.patch
 delete mode 100644 meta/recipes-devtools/pseudo/pseudo_1.4.1.bb
 create mode 100644 meta/recipes-devtools/pseudo/pseudo_1.4.3.bb
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/mips64/objarch.h
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/mips64el/objarch.h
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/mipsel/objarch.h
 create mode 100644 meta/recipes-gnome/gnome/libart-lgpl/mips64/art_config.h
 create mode 100644 meta/recipes-gnome/gnome/libart-lgpl/mips64el/art_config.h
 create mode 100644 meta/recipes-rt/rt-tests/files/cyclictest-finish-removal-of-1-second-first-loops.patch

-- 
1.8.0.2



