Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1U59Er-0007oy-B9
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Feb 2013 07:21:10 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 11 Feb 2013 22:05:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,647,1355126400"; d="scan'208";a="201359541"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.192])
	by AZSMGA002.ch.intel.com with ESMTP; 11 Feb 2013 22:04:45 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Feb 2013 22:04:44 -0800
Message-Id: <cover.1360648588.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
Subject: [CONSOLIDATED PULL 00/30] Updates and Patches
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
X-List-Received-Date: Tue, 12 Feb 2013 06:21:11 -0000

Richard,

I have built these on and got green builds (the failures were due
to the AB05 Update and the Qemu paravirtualization).

This patch set seems straight forward to me, the mulitlib
changes from Contantin might need a check.

There was some discussion about the tzdata changes, but the result
is V3 included here.

Sau!


The following changes since commit 273c437813b19577d68fa49ec04ea42154ad70c9:

  libiconv: Remove RPATH from binaries (2013-02-11 15:39:47 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Anders Roxell (1):
  distro_check: Remove creation of empty Meego filelist.

Chen Qi (1):
  busybox: add config fragments

Constantin Musca (5):
  cairo: upgrade to 1.12.12
  pixman: upgrade to 0.29.2
  mesa: upgrade to 9.0.2
  multilib.bbclass: save multilib variables before executing the
    gcc-cross-canadian statements
  gcc-cross-canadian: enable multilib support

Enrico Scholz (2):
  lib/oe/path.py: support missing directory components in realpath()
  package.bbclass: support dangling path components

Laurentiu Palcu (6):
  Add pixbufcache class
  gdk-pixbuf: use the new pixbufcache class
  librsvg: use the new pixbufcache class
  gtk-immodules-cache: add weak asignment for GTKIMMODULES_PACKAGES
  gtk+: use gtk-immodules-cache class
  gnome-keyring: compile schemas on host

Marko Lindqvist (6):
  libevent: fix build with automake-1.13
  texinfo: remove help2man dependency
  libidn: remove help2man dependency
  systemtap: replace obsolete automake macros with working ones
  diffutils: replace obsolete automake macros with working ones
  gamin: replace obsolete automake macros with working ones

Otavio Salvador (2):
  tzdata: We shouldn't override the localtime if it is valid
  tzdata: Simplify code removing not used cases

Paul Eggleton (1):
  qt4: use system SQLite

Ross Burton (4):
  fontconfig: remove unexplainable and broken build tweaking
  fontconfig: drop explicit -native recipe
  fontconfig: rename the patches directory
  systemd.bbclass: use PACKAGESPLITFUNCS instead of
    populate_packages_prepend

Saul Wold (1):
  tzcode/tzdata: Update to 2012j

Stefan Eichenberger (1):
  Write DPKG_ARCH to /etc/apt/apt.conf

 meta/classes/gtk-immodules-cache.bbclass           |  2 +
 meta/classes/multilib.bbclass                      | 11 +--
 meta/classes/package.bbclass                       |  8 +--
 meta/classes/pixbufcache.bbclass                   | 57 ++++++++++++++++
 meta/classes/systemd.bbclass                       | 14 ++--
 meta/lib/oe/distro_check.py                        | 11 ++-
 meta/lib/oe/path.py                                | 26 +++----
 meta/lib/oe/tests/test_path.py                     | 10 +--
 meta/recipes-core/busybox/busybox.inc              | 13 ++++
 meta/recipes-devtools/apt/apt_0.7.14.bb            |  5 ++
 meta/recipes-devtools/gcc/gcc-4.7.inc              |  2 +-
 meta/recipes-devtools/gcc/gcc-cross-canadian.inc   |  1 +
 meta/recipes-devtools/gcc/gcc-multilib-config.inc  |  3 +-
 .../diffutils-3.2/obsolete_automake_macros.patch   | 14 ++++
 meta/recipes-extended/diffutils/diffutils_3.2.bb   |  6 +-
 .../gamin-0.1.10/obsolete_automake_macros.patch    | 23 +++++++
 meta/recipes-extended/gamin/gamin_0.1.10.bb        |  6 +-
 .../libidn/libidn/dont-depend-on-help2man.patch    | 23 +++++++
 meta/recipes-extended/libidn/libidn_1.26.bb        |  6 +-
 .../texinfo-4.13a/dont-depend-on-help2man.patch    | 79 ++++++++++++++++++++++
 meta/recipes-extended/texinfo/texinfo_4.13a.bb     |  3 +-
 ...code-native_2011i.bb => tzcode-native_2012j.bb} | 13 ++--
 .../tzdata/{tzdata_2012d.bb => tzdata_2012j.bb}    | 50 +++++---------
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.26.5.bb | 48 +------------
 meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb   | 12 +---
 meta/recipes-gnome/gtk+/gtk+.inc                   |  8 +--
 meta/recipes-gnome/gtk+/gtk+3_3.4.4.bb             | 12 +---
 meta/recipes-gnome/gtk+/gtk+_2.24.14.bb            |  4 +-
 meta/recipes-gnome/librsvg/librsvg_2.32.1.bb       | 21 ++----
 .../cairo/{cairo_1.12.10.bb => cairo_1.12.12.bb}   |  4 +-
 ...Add-sysroot-option-to-fc-cache-and-fc-cat.patch |  0
 .../fontconfig-2.10.2/fix-pkgconfig.patch          | 15 ----
 .../fontconfig/fontconfig-native_2.10.2.bb         | 14 ----
 .../fontconfig/fontconfig_2.10.2.bb                | 47 ++-----------
 .../mesa/{mesa-9.0.1.inc => mesa-9.0.2.inc}        |  4 +-
 .../mesa/{mesa-dri_9.0.1.bb => mesa-dri_9.0.2.bb}  |  0
 .../xorg-lib/pixman/obsolete_automake_macros.patch | 14 ----
 .../{pixman_0.28.2.bb => pixman_0.29.2.bb}         |  7 +-
 .../systemtap/obsolete_automake_macros.patch       | 27 ++++++++
 meta/recipes-kernel/systemtap/systemtap_git.bb     |  2 +-
 meta/recipes-kernel/systemtap/systemtap_git.inc    |  1 +
 meta/recipes-qt/qt4/qt4.inc                        |  2 +-
 .../libevent/libevent-2.0.21/disable_tests.patch   | 15 ++++
 .../libevent-2.0.21/obsolete_automake_macros.patch | 15 ++++
 meta/recipes-support/libevent/libevent_2.0.21.bb   |  7 +-
 45 files changed, 384 insertions(+), 281 deletions(-)
 create mode 100644 meta/classes/pixbufcache.bbclass
 create mode 100644 meta/recipes-extended/diffutils/diffutils-3.2/obsolete_automake_macros.patch
 create mode 100644 meta/recipes-extended/gamin/gamin-0.1.10/obsolete_automake_macros.patch
 create mode 100644 meta/recipes-extended/libidn/libidn/dont-depend-on-help2man.patch
 create mode 100644 meta/recipes-extended/texinfo/texinfo-4.13a/dont-depend-on-help2man.patch
 rename meta/recipes-extended/tzcode/{tzcode-native_2011i.bb => tzcode-native_2012j.bb} (46%)
 rename meta/recipes-extended/tzdata/{tzdata_2012d.bb => tzdata_2012j.bb} (88%)
 rename meta/recipes-graphics/cairo/{cairo_1.12.10.bb => cairo_1.12.12.bb} (92%)
 rename meta/recipes-graphics/fontconfig/{fontconfig-2.10.2 => files}/Add-sysroot-option-to-fc-cache-and-fc-cat.patch (100%)
 delete mode 100644 meta/recipes-graphics/fontconfig/fontconfig-2.10.2/fix-pkgconfig.patch
 delete mode 100644 meta/recipes-graphics/fontconfig/fontconfig-native_2.10.2.bb
 rename meta/recipes-graphics/mesa/{mesa-9.0.1.inc => mesa-9.0.2.inc} (66%)
 rename meta/recipes-graphics/mesa/{mesa-dri_9.0.1.bb => mesa-dri_9.0.2.bb} (100%)
 delete mode 100644 meta/recipes-graphics/xorg-lib/pixman/obsolete_automake_macros.patch
 rename meta/recipes-graphics/xorg-lib/{pixman_0.28.2.bb => pixman_0.29.2.bb} (85%)
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/obsolete_automake_macros.patch
 create mode 100644 meta/recipes-support/libevent/libevent-2.0.21/disable_tests.patch
 create mode 100644 meta/recipes-support/libevent/libevent-2.0.21/obsolete_automake_macros.patch

-- 
1.8.0.2



