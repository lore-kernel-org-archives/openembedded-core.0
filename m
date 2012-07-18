Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SrP5E-0004Vi-Ft
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 09:54:08 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 18 Jul 2012 00:42:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="123776712"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.178])
	by AZSMGA002.ch.intel.com with ESMTP; 18 Jul 2012 00:42:45 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Jul 2012 00:42:44 -0700
Message-Id: <cover.1342597081.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Cc: Jeffrey C Honig <jeffrey.honig@windriver.com>,
	Matthew McClintock <msm@freescale.com>
Subject: [CONSOLIDATED PULL 00/18] Typos and cleanups
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
X-List-Received-Date: Wed, 18 Jul 2012 07:54:08 -0000

Richard,

This set contains a bunch of patch header cleanups and
updates to webkit.

I built world and ppc since that seemed to be where most of 
the changes where.

Sau!

The following changes since commit 2bd0aaf98c5d586638d82f5f22c1c24122a889a3:

  toolchain-scripts: Sync the SDK/ADT values to the build system (2012-07-17 18:02:10 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Andrea Adami (1):
  psplash: use default OE vga logo (from kernel bootlogo)

Jeffrey C Honig (1):
  terminal.py: Fix Xfce on ubuntu/debian; some cleanup

Jessica Zhang (1):
  meta-ide-support: Add native qemu support for meta-ide-support

Khem Raj (1):
  eglibc: Fix build for e500 cores

Martin Jansa (2):
  qt-mobility, xserver-xorg, ofono, bluez4, gst-plugins-good: bump PR
    to rebuild after libudev0 soname change to libudev1
  recipes: svn SRC_URI s/proto=/protocol=/g

Matthew McClintock (2):
  gcc-package-runtime.inc: Fix QA warning
  task-core-tools-testapps.bb: kexec-tools does not work on e5500-64b
    parts

Nitin A Kamble (1):
  fix my typos in patch headers

Peter Seebach (1):
  tune-ppc476.inc: Support ppc476

Richard Purdie (1):
  scripts/bitbake: Check the git-native version and build it if
    necessary

Ross Burton (5):
  web-webkit: remove unused dependencies (taken from the gecko-based
    recipe)
  web-webkit: push make whitespace fix upstream
  web-webkit: don't link using g++, it's not needed anymore
  webkit-gtk: remove no-parallel bodge
  webkit-gtk: remove spurious install_prepend hack

Roy.Li (1):
  slang: add header to patch

Saul Wold (1):
  puzzles, mkelfimage: Add protocol=http

 meta/classes/toolchain-scripts.bbclass             |    2 +-
 meta/conf/machine/include/tune-ppc476.inc          |   14 +
 meta/lib/oe/terminal.py                            |   37 +-
 meta/recipes-connectivity/bluez/bluez4_4.101.bb    |    2 +-
 meta/recipes-connectivity/ofono/ofono_1.8.bb       |    1 +
 meta/recipes-connectivity/ofono/ofono_git.bb       |    2 +-
 .../eglibc/cross-localedef-native_2.15.bb          |    2 +-
 .../eglibc/cross-localedef-native_2.16.bb          |    2 +-
 .../eglibc/eglibc-2.16/e500-math_private.patch     |   31 +
 meta/recipes-core/eglibc/eglibc_2.16.bb            |    3 +-
 meta/recipes-core/meta/meta-ide-support.bb         |    4 +-
 meta/recipes-core/psplash/files/psplash-poky-img.h | 2313 +++++++++++---------
 meta/recipes-core/psplash/psplash_git.bb           |    2 +-
 .../recipes-core/tasks/task-core-tools-testapps.bb |    1 +
 meta/recipes-devtools/gcc/gcc-package-runtime.inc  |    3 +-
 meta/recipes-devtools/git/git.inc                  |    2 +
 meta/recipes-devtools/mkelfimage/mkelfimage_svn.bb |    2 +-
 ..._MKDIR_P_warning_error_with_automake_1.12.patch |   10 +-
 ...change-char-type-to-signed-char-in-macros.patch |   16 +
 .../xorg-xserver/xserver-xorg-1.11.2.inc           |    2 +-
 .../gstreamer/gst-plugins-good_0.10.31.bb          |    2 +-
 meta/recipes-multimedia/tremor/tremor_20120314.bb  |    2 +-
 meta/recipes-qt/qt4/qt-mobility_1.2.0.inc          |    2 +-
 meta/recipes-sato/puzzles/puzzles_r9561.bb         |    2 +-
 .../web/web-webkit/link-with-g++.patch             |   35 -
 meta/recipes-sato/web/web-webkit/make-382.patch    |   17 -
 meta/recipes-sato/web/web-webkit_git.bb            |   16 +-
 meta/recipes-sato/webkit/webkit-gtk_1.8.1.bb       |    9 -
 ..._MKDIR_P_warning_error_with_automake_1.12.patch |   10 +-
 .../gnutls/gnutls_fix_for_automake_1.12.1.patch    |    2 +-
 scripts/bitbake                                    |   17 +-
 31 files changed, 1388 insertions(+), 1177 deletions(-)
 create mode 100644 meta/conf/machine/include/tune-ppc476.inc
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/e500-math_private.patch
 delete mode 100644 meta/recipes-sato/web/web-webkit/link-with-g++.patch
 delete mode 100644 meta/recipes-sato/web/web-webkit/make-382.patch

-- 
1.7.7.6



