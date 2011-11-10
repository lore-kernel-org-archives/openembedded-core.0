Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1ROPOB-0005aX-6b
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Nov 2011 08:49:35 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 09 Nov 2011 23:43:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,488,1315206000"; d="scan'208";a="83351183"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.14])
	by fmsmga001.fm.intel.com with ESMTP; 09 Nov 2011 23:43:17 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Nov 2011 23:42:42 -0800
Message-Id: <cover.1320910946.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
MIME-Version: 1.0
Subject: [CONSOLIDATED PULL (v2) 00/33] Loads of Change!
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
X-List-Received-Date: Thu, 10 Nov 2011 07:49:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Richard,

This set of changes is currently being built on the Autobuilder
along with some change I dropped for this request. Based on the
initial builds, I believe that most of these changes are correct
and buildable.

I an attempt to clear the decks and move things forward I am suggesting
we take these changes in.  I dropped Martin's SDL changes since they are
causing some of the Autobuilder failures currently

There still seems to be an issue with connman sanity,
and shadow (populate_sysroot_setscene):

ERROR: Task 3037 (/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/meta/recipes-extended/shadow/shadow-sysroot_4.1.4.3.bb, do_populate_sysroot_setscene) failed with exit code '1'

I included many of your patches in this to verify them as part of
this build.

Please review the AB failures, to confirm my thoughts above.

Thanks
        Sau!

The following changes since commit 25fae81538a92e15eab3fc169ebce44505f67839:

  python: skip setup.py 'import check' when cross-compiling (2011-11-08 21:44:23 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage2
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage2

Bruce Ashfield (1):
  linux-yocto: config cleanups + romely rt support

Darren Hart (1):
  ncurses: refactor configure to avoid configuring widec when disabled

Joshua Lock (3):
  shared-mime-info: package runtime data separately
  classes/[gnome|gnomebase|mime]: enhance gnome related classes
  gconf: add upstream GNOME gconf 3.2.3 and drop gconf-dbus

Martin Jansa (6):
  libxml2: use Copyright in LIC_FILES_CHKSUM instead of COPYING
  kbd: import from meta-oe
  kbd: add RREPLACES/RCONFLICTS/RPROVIDES for upgradeable path from
    console-tools
  task-core-boot, keymaps: add another VIRTUAL-RUNTIME to allow
    distributions to use different set of initscripts or no initscripts
    at all
  keymaps: depend on kbd instead of console-tools
  task-core-x11: use VIRTUAL-RUNTIME variables for xserver_common and
    graphical_init_manager

Matthew McClintock (1):
  Introduce new SERIAL_CONSOLES to add multiple consoles for your
    MACHINE

Paul Eggleton (2):
  classes/package_rpm: disable uninstall scripts for upgrades
  busybox: add grep to temporary links during uninstall

Paul Menzel (2):
  libarchive: Remove obsolete comment and empty line at the end
  xinit: Fix `startx` looking for `mcookie` in sysroot

Richard Purdie (7):
  hacktastic patch to fix adduser under rpm
  bitbake.conf: Unload pseudo when its not required for a given task
  scripts/qemuimage-testlib: Output a slightly better error if expect
    is missing
  classes: Remove various bashisms
  Allow use of dash as /bin/sh
  qemu: Ensure an internal qemugl script uses bash as it has bashisms
  useradd: Add missing DEPEND on shadow

Saul Wold (4):
  Distro_tracking: Update Manual Check Date
  libtasn1: update to 2.10
  lame: update to 3.99.1
  udev-extraconf: blacklist /dev/md

Scott Garman (4):
  useradd.bbclass: only modify packages in USERADD_PACKAGES
  useradd.bbclass: do not modify -nativesdk packages
  useradd-example.bb: update example documentation comments
  avahi: remove USERADDPN

Tom Zanussi (1):
  python: bump PR

Xiaofeng Yan (1):
  local.conf.sample.extended: Fix bug 1674

 .../recipes-skeleton/useradd/useradd-example.bb    |    9 +-
 meta/classes/gnome.bbclass                         |   18 +-
 meta/classes/gnomebase.bbclass                     |   30 +
 meta/classes/image-prelink.bbclass                 |    2 +-
 meta/classes/kernel.bbclass                        |    2 +-
 meta/classes/mime.bbclass                          |   58 +
 meta/classes/package_rpm.bbclass                   |   39 +-
 meta/classes/sanity.bbclass                        |    3 -
 meta/classes/useradd.bbclass                       |   49 +-
 meta/conf/bitbake.conf                             |    1 +
 meta/conf/distro/include/default-providers.inc     |    2 -
 .../conf/distro/include/distro_tracking_fields.inc |   94 +-
 meta/conf/local.conf.sample.extended               |    3 +
 meta/conf/multilib.conf                            |    2 +-
 meta/recipes-bsp/keymaps/keymaps_1.0.bb            |    9 +-
 meta/recipes-connectivity/avahi/avahi.inc          |    1 -
 .../recipes-core/base-passwd/base-passwd_3.5.22.bb |    8 +-
 meta/recipes-core/busybox/busybox.inc              |   11 +-
 meta/recipes-core/busybox/busybox_1.18.5.bb        |    2 +-
 meta/recipes-core/kbd/kbd_1.15.2.bb                |   24 +
 meta/recipes-core/libxml/libxml2.inc               |    2 +-
 meta/recipes-core/libxml/libxml2_2.7.8.bb          |    2 +-
 meta/recipes-core/ncurses/ncurses.inc              |   66 +-
 .../sysvinit/sysvinit-inittab_2.88dsf.bb           |   10 +
 meta/recipes-core/tasks/task-core-boot.bb          |    6 +-
 meta/recipes-core/udev/files/mount.blacklist       |    1 +
 meta/recipes-core/udev/udev-extraconf_0.0.bb       |    2 +-
 meta/recipes-devtools/libtool/libtool/prefix.patch |   11 +-
 .../openjade/openjade-native_1.3.2.bb              |    4 +-
 meta/recipes-devtools/python/python_2.7.2.bb       |    2 +-
 .../qemu/qemu-0.14.0/qemu-git-qemugl-host.patch    |    2 +-
 .../qemu/qemu-0.15.0/qemu-git-qemugl-host.patch    |    2 +-
 .../qemu/qemu-git/qemu-git-qemugl-host.patch       |    2 +-
 meta/recipes-devtools/qemu/qemu_0.14.0.bb          |    2 +-
 meta/recipes-devtools/qemu/qemu_0.15.0.bb          |    2 +-
 meta/recipes-devtools/qemu/qemu_git.bb             |    2 +-
 meta/recipes-devtools/rpm/psm.c                    | 3115 ++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm/hacktastic.patch     |   62 +
 meta/recipes-devtools/rpm/rpm_5.4.0.bb             |    3 +-
 .../libarchive/libarchive_2.8.5.bb                 |    3 -
 meta/recipes-gnome/gnome/gconf-3.2.3/nointro.patch |   59 +
 meta/recipes-gnome/gnome/gconf-dbus_705.bb         |   43 -
 meta/recipes-gnome/gnome/gconf_3.2.3.bb            |   43 +
 meta/recipes-graphics/xorg-app/xinit_1.3.0.bb      |    7 +-
 meta/recipes-kernel/linux/linux-yocto_3.0.bb       |    2 +-
 .../lame/{lame-3.98.4 => lame}/no-gtk1.patch       |    0
 .../lame/{lame_3.98.4.bb => lame_3.99.1.bb}        |    6 +-
 meta/recipes-sato/tasks/task-core-x11.bb           |   10 +-
 .../gnutls/{libtasn1_2.9.bb => libtasn1_2.10.bb}   |    8 +-
 .../shared-mime-info/shared-mime-info.inc          |    9 +-
 .../shared-mime-info/shared-mime-info_0.91.bb      |    2 +-
 scripts/qemuimage-testlib                          |   14 +
 52 files changed, 3644 insertions(+), 227 deletions(-)
 create mode 100644 meta/classes/gnomebase.bbclass
 create mode 100644 meta/classes/mime.bbclass
 create mode 100644 meta/recipes-core/kbd/kbd_1.15.2.bb
 create mode 100644 meta/recipes-devtools/rpm/psm.c
 create mode 100644 meta/recipes-devtools/rpm/rpm/hacktastic.patch
 create mode 100644 meta/recipes-gnome/gnome/gconf-3.2.3/nointro.patch
 delete mode 100644 meta/recipes-gnome/gnome/gconf-dbus_705.bb
 create mode 100644 meta/recipes-gnome/gnome/gconf_3.2.3.bb
 rename meta/recipes-multimedia/lame/{lame-3.98.4 => lame}/no-gtk1.patch (100%)
 rename meta/recipes-multimedia/lame/{lame_3.98.4.bb => lame_3.99.1.bb} (82%)
 rename meta/recipes-support/gnutls/{libtasn1_2.9.bb => libtasn1_2.10.bb} (65%)

-- 
1.7.6.4



