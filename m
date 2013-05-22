Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id EB4426065C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2013 23:03:05 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 22 May 2013 16:03:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,724,1363158000"; d="scan'208";a="306502504"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.171])
	by azsmga001.ch.intel.com with ESMTP; 22 May 2013 16:03:05 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 May 2013 16:03:05 -0700
Message-Id: <cover.1369263517.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
MIME-Version: 1.0
Subject: [CONSOLIDATED PULL 00/34] Update patch set
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 May 2013 23:03:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Richard,

Here is a build and lightly boot tested.  There were some issues on the AB, but
not related to this patch set. 

You probably need to look at Phil's cross patch and I think that Martin's buildhistory
patch is correct, if fixed my fetch issues locally.


Sau!

The following changes since commit aeb704fee8b4ffeaeddcdb36ae4e1d62c264ce42:

  scripts/bitbake: Handle the case where git isn't installed cleanly (2013-05-21 10:06:11 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/updates

Andreas Müller (2):
  glib-2.0: update to 2.36.2
  glib-networking: update to 2.36.2

Andrei Dinu (1):
  SLiRP support in runqemu

Cristian Iorga (1):
  connman: upgrade to 1.14

Ionut Radu (1):
  qemu: Updated from 1.4.0 to 1.4.1

Jack Mitchell (1):
  sqlite3: update to 3.7.17

Jesse Zhang (1):
  perl-tests: convert to ptest

Jonathan Liu (3):
  util-linux: Update to 2.23
  populate-volatile.sh: remove repeated leading slashes in TNAME
  busybox: backport sulogin empty root password fix

Kang Kai (1):
  sudo: set CFLAGS for build mksigname and mksiglist

Laurentiu Palcu (1):
  runqemu: fix networking issues

Martin Jansa (2):
  kernel: Remove unnecessary cd and rm, fix MODULE_TARBALL_SYMLINK_NAME
    creation
  buildhistory: adapt to fetcher changes

Phil Blundell (1):
  cross: Clear do_populate_sysroot[stamp-extra-info] so that stamps are
    not MACHINE specific

Riku Voipio (1):
  xserver-xorg: enable xvfb

Ross Burton (6):
  pixbufcache: update the loader cache when installing natively
  gdk-pixbuf: remove native loader cache generation, use the class
  librsvg: add more PACKAGECONFIG options
  librsvg: clean up native depends
  librsvg: small cleanups
  librsvg: add sstate dependencies so that the SVG loader works at
    staging time

Saul Wold (8):
  gnupg: Update to 2.0.20
  desktop-file-utils: Update to 0.21
  mklibs: Update to 0.1.37
  libnl: Update to 3.2.22
  mc: Update to 4.8.8
  cmake: Update to 2.8.11
  resolvconf: Update to 1.72
  patch: diable xattr as default

Tomas Frydrych (4):
  cogl: further improvements
  clutter.bbclass: removed unused function
  clutter: further improvements
  clutter-gst: removed no longer required configure fragment

 meta/classes/buildhistory.bbclass                  |   5 +-
 meta/classes/clutter.bbclass                       |   5 -
 meta/classes/cross.bbclass                         |   1 +
 meta/classes/kernel.bbclass                        |   9 +-
 meta/classes/pixbufcache.bbclass                   |  20 ++
 .../connman/{connman_1.13.bb => connman_1.14.bb}   |   9 +-
 .../{resolvconf_1.71.bb => resolvconf_1.72.bb}     |   4 +-
 .../busybox-sulogin-empty-root-password.patch      |  58 +++++
 meta/recipes-core/busybox/busybox_1.20.2.bb        |   1 +
 .../{glib-2.0_2.36.1.bb => glib-2.0_2.36.2.bb}     |   4 +-
 ...working_2.36.0.bb => glib-networking_2.36.2.bb} |   4 +-
 .../initscripts-1.0/populate-volatile.sh           |  14 +-
 meta/recipes-core/util-linux/util-linux.inc        |   5 +-
 ...-fix-loopcxt_check_size-to-work-with-blkd.patch |  60 +++++
 ...etup-use-warn_size-for-regular-files-only.patch |  29 +++
 .../util-linux/util-linux/mbsalign-license.patch   |  78 ------
 .../util-linux/uclibc-__progname-conflict.patch    |  15 +-
 .../{util-linux_2.22.2.bb => util-linux_2.23.bb}   |  11 +-
 .../cmake/cmake-native_2.8.10.2.bb                 |   7 -
 meta/recipes-devtools/cmake/cmake-native_2.8.11.bb |   5 +
 meta/recipes-devtools/cmake/cmake.inc              |   2 -
 .../cmake/cmake/support-oe-qt4-tools-names.patch   |  70 ++----
 .../cmake/{cmake_2.8.10.2.bb => cmake_2.8.11.bb}   |   6 +-
 ...e_0.15.bb => desktop-file-utils-native_0.21.bb} |  10 +-
 ...bs-native_0.1.35.bb => mklibs-native_0.1.37.bb} |   4 +-
 meta/recipes-devtools/patch/patch_2.7.1.bb         |   2 +
 meta/recipes-devtools/perl/perl-5.14.3/run-ptest   |   2 +
 meta/recipes-devtools/perl/perl-ptest.inc          |  49 ++++
 meta/recipes-devtools/perl/perl-tests.inc          |  36 ---
 meta/recipes-devtools/perl/perl_5.14.3.bb          |   2 +-
 meta/recipes-devtools/qemu/qemu.inc                |   1 -
 .../qemu/{qemu_1.4.0.bb => qemu_1.4.1.bb}          |   8 +-
 .../mc/{mc_4.8.7.bb => mc_4.8.8.bb}                |   6 +-
 meta/recipes-extended/sudo/sudo.inc                |   2 +-
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.26.5.bb |   3 -
 meta/recipes-gnome/librsvg/librsvg_2.32.1.bb       |  41 ++--
 meta/recipes-graphics/clutter/clutter-1.0.inc      |  22 +-
 meta/recipes-graphics/clutter/clutter-gst-1.0.inc  |   5 -
 meta/recipes-graphics/cogl/cogl-1.0.inc            |  24 +-
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |   2 +-
 .../gnupg/gnupg-2.0.19/GnuPG2-CVE-2012-6085.patch  |  63 -----
 .../gnupg/{gnupg_2.0.19.bb => gnupg_2.0.20.bb}     |   8 +-
 .../libnl/{libnl_3.2.21.bb => libnl_3.2.22.bb}     |   5 +-
 .../{sqlite3_3071602.bb => sqlite3_3071700.bb}     |   4 +-
 scripts/runqemu                                    |   3 +
 scripts/runqemu-ifup                               |  15 +-
 scripts/runqemu-internal                           | 272 +++++++++++----------
 47 files changed, 488 insertions(+), 523 deletions(-)
 rename meta/recipes-connectivity/connman/{connman_1.13.bb => connman_1.14.bb} (59%)
 rename meta/recipes-connectivity/resolvconf/{resolvconf_1.71.bb => resolvconf_1.72.bb} (88%)
 create mode 100644 meta/recipes-core/busybox/busybox-1.20.2/busybox-sulogin-empty-root-password.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.36.1.bb => glib-2.0_2.36.2.bb} (92%)
 rename meta/recipes-core/glib-networking/{glib-networking_2.36.0.bb => glib-networking_2.36.2.bb} (85%)
 create mode 100644 meta/recipes-core/util-linux/util-linux/0001-lib-loopdev-fix-loopcxt_check_size-to-work-with-blkd.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/0001-losetup-use-warn_size-for-regular-files-only.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux/mbsalign-license.patch
 rename meta/recipes-core/util-linux/{util-linux_2.22.2.bb => util-linux_2.23.bb} (55%)
 delete mode 100644 meta/recipes-devtools/cmake/cmake-native_2.8.10.2.bb
 create mode 100644 meta/recipes-devtools/cmake/cmake-native_2.8.11.bb
 rename meta/recipes-devtools/cmake/{cmake_2.8.10.2.bb => cmake_2.8.11.bb} (86%)
 rename meta/recipes-devtools/desktop-file-utils/{desktop-file-utils-native_0.15.bb => desktop-file-utils-native_0.21.bb} (57%)
 rename meta/recipes-devtools/mklibs/{mklibs-native_0.1.35.bb => mklibs-native_0.1.37.bb} (80%)
 create mode 100644 meta/recipes-devtools/perl/perl-5.14.3/run-ptest
 create mode 100644 meta/recipes-devtools/perl/perl-ptest.inc
 delete mode 100644 meta/recipes-devtools/perl/perl-tests.inc
 rename meta/recipes-devtools/qemu/{qemu_1.4.0.bb => qemu_1.4.1.bb} (49%)
 rename meta/recipes-extended/mc/{mc_4.8.7.bb => mc_4.8.8.bb} (81%)
 delete mode 100644 meta/recipes-support/gnupg/gnupg-2.0.19/GnuPG2-CVE-2012-6085.patch
 rename meta/recipes-support/gnupg/{gnupg_2.0.19.bb => gnupg_2.0.20.bb} (80%)
 rename meta/recipes-support/libnl/{libnl_3.2.21.bb => libnl_3.2.22.bb} (90%)
 rename meta/recipes-support/sqlite/{sqlite3_3071602.bb => sqlite3_3071700.bb} (60%)

-- 
1.8.1.4


