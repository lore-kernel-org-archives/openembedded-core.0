Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QW160-0002Fr-E4
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Jun 2011 08:58:00 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 12 Jun 2011 23:54:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,356,1304319600"; d="scan'208";a="17500591"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.216])
	by fmsmga001.fm.intel.com with ESMTP; 12 Jun 2011 23:54:35 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 12 Jun 2011 23:54:10 -0700
Message-Id: <cover.1307947593.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [*RFC CONSOLIDATED PULL RFC* 00/23] 13-June-2011
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
X-List-Received-Date: Mon, 13 Jun 2011 06:58:00 -0000


Richard et al,

This is a RFC, please review this list, most should be straight
foward udpdate for uclibc and world / docs build issues.

This does note include Khem's latest GCC and eglibc updates, whichs
need more testing.


Sau!


The following changes since commit 6a3e57fcd3a172c9b2707510d65741734c98a143:

  Revert "gcc: rebase the patch to avoid patch rejection" (2011-06-10 12:56:29 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Anders Darander (1):
  perl-native: fix download url

Bruce Ashfield (1):
  linux-yocto: rename recipes to explicitly indicate version

Dexuan Cui (1):
  git: restore the dependency on perl-native

Kang Kai (1):
  ghostscript: update SRC_URI

Khem Raj (4):
  util-macros_1.13.0.bb: Depend on virtual/gettext instead of gettext
  uclibc.inc: libsegfault is only RPROVIDED by uclibc
  gettext_0.18.1.1.bb: Fix build on uclibc
  uclibc: Cleanup the machine dependent config files

Koen Kooi (2):
  qemu.inc: append to IMAGE_FSTYPES instead of weakly assigning them
  connman-gnome 0.5: build from git

Phil Blundell (5):
  busybox: backport distro-features handling from oe master
  uclibc: fix compile error on i586
  import recipe_sanity.bbclass from oe master
  uclibc: remove redundant python code
  uclibc: remove PACKAGE_ARCH, fix compilation on i586

Saul Wold (8):
  json-glib: Fix up SRC_URI Checksums
  gconf-dbus: Update to 2.29.1 git
  clutter-box2d_git: Switch SRC_URI to git.gnome.org
  update-alternatives-dpkg: Fix SRC_URI Checksum
  jsib-glib: Fix SRC_URI Checksum
  rxvt-unicode: Fix SRC_URI & LIC_FILES Checksum
  alsa-tools: fix Checksums
  libx11-diet: Fixed checksum and rebase patch

 meta/classes/recipe_sanity.bbclass                 |  179 +
 meta/conf/machine/include/qemu.inc                 |    2 +-
 .../connman-gnome/applet_menu_popup_fix.patch      |   19 -
 .../connman/connman-gnome/connman-gnome.patch      | 4162 --------------------
 .../remove-connman-property-desktop-file.patch     |   42 -
 .../connman-gnome/service_name_update.patch        |   36 -
 .../connman/connman-gnome_0.5.bb                   |   13 +-
 meta/recipes-core/busybox/busybox.inc              |   80 +-
 meta/recipes-core/busybox/busybox_1.18.4.bb        |    2 +-
 .../gnulib-uclibc-sched_param-def.patch            |   21 +
 meta/recipes-core/gettext/gettext_0.18.1.1.bb      |    7 +-
 .../uclibc/uclibc-git/armv5te/uClibc.machine       |    4 +-
 .../{nslu2be => armv5teb}/uClibc.machine           |    0
 .../uclibc/uclibc-git/efika/uClibc.machine         |   45 -
 .../uclibc/uclibc-git/epoll-asm-fix.patch          |   25 +
 .../uclibc-git/{qemumips => mips}/uClibc.machine   |    0
 .../uclibc/uclibc-git/qemuarm/uClibc.machine       |   77 -
 .../uclibc/uclibc-git/qemux86/uClibc.machine       |   59 -
 meta/recipes-core/uclibc/uclibc-git/uClibc.distro  |   14 +-
 meta/recipes-core/uclibc/uclibc.inc                |   19 +-
 meta/recipes-core/uclibc/uclibc_git.bb             |    6 +-
 meta/recipes-devtools/git/git.inc                  |    6 +-
 meta/recipes-devtools/git/git_1.7.5.1.bb           |    2 +-
 meta/recipes-devtools/perl/perl-native_5.12.3.bb   |    2 +-
 .../update-alternatives-dpkg_1.16.0.3.bb           |    4 +-
 .../ghostscript/ghostscript_9.02.bb                |    7 +-
 .../gnome/{gconf-dbus_svn.bb => gconf-dbus_git.bb} |   12 +-
 meta/recipes-gnome/json-glib/json-glib_0.12.4.bb   |    4 +-
 meta/recipes-graphics/clutter/clutter-box2d_git.bb |    2 +-
 meta/recipes-graphics/xorg-lib/libx11-diet_1.3.bb  |   14 +-
 .../xorg-lib/libx11/X18NCMSstubs.diff              |   62 +-
 .../xorg-util/util-macros_1.13.0.bb                |    4 +-
 ...x-yocto-stable_git.bb => linux-yocto_2.6.34.bb} |    0
 .../{linux-yocto_git.bb => linux-yocto_2.6.37.bb}  |    0
 .../recipes-multimedia/alsa/alsa-tools_1.0.24.1.bb |    7 +-
 .../recipes-sato/rxvt-unicode/rxvt-unicode_9.11.bb |    8 +-
 36 files changed, 409 insertions(+), 4537 deletions(-)
 create mode 100644 meta/classes/recipe_sanity.bbclass
 delete mode 100644 meta/recipes-connectivity/connman/connman-gnome/applet_menu_popup_fix.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman-gnome/connman-gnome.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman-gnome/remove-connman-property-desktop-file.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman-gnome/service_name_update.patch
 create mode 100644 meta/recipes-core/gettext/gettext-0.18.1.1/gnulib-uclibc-sched_param-def.patch
 rename meta/recipes-core/uclibc/uclibc-git/{nslu2be => armv5teb}/uClibc.machine (100%)
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/efika/uClibc.machine
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/epoll-asm-fix.patch
 rename meta/recipes-core/uclibc/uclibc-git/{qemumips => mips}/uClibc.machine (100%)
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/qemuarm/uClibc.machine
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/qemux86/uClibc.machine
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/uClibc.config
 rename meta/recipes-gnome/gnome/{gconf-dbus_svn.bb => gconf-dbus_git.bb} (76%)
 rename meta/recipes-kernel/linux/{linux-yocto-stable_git.bb => linux-yocto_2.6.34.bb} (100%)
 rename meta/recipes-kernel/linux/{linux-yocto_git.bb => linux-yocto_2.6.37.bb} (100%)

-- 
1.7.3.4



