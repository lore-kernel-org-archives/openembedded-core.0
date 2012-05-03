Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SPlQQ-0006gd-6D
	for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 04:05:47 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 02 May 2012 18:56:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="95772170"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.179])
	by AZSMGA002.ch.intel.com with ESMTP; 02 May 2012 18:55:59 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 May 2012 18:55:19 -0700
Message-Id: <cover.1336008687.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [CONSOLIDATED PULL 00/36] Updates and and fixes
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
X-List-Received-Date: Thu, 03 May 2012 02:05:47 -0000

Richard,

Here is the lastest tested set of changes, I addessed 
issues found in the last MUT build.

Sau!

The following changes since commit 35b5fb2dd2131d4c7dc6635c14c6e08ea6926457:

  eglibc-package: remove /var (2012-05-01 12:36:18 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Christopher Larson (14):
  mesa: add missing flex-native/bison-native deps
  distcc: use PACKAGECONFIG for x11 distro feature
  libpcap: use PACKAGECONFIG for bluetooth distro feature
  libsndfile1: use PACKAGECONFIG for alsa distro feature
  bitbake.conf: shift build config summary control to here
  base.bbclass: use isinstance for base_eventhandler
  csl-versions.inc: capture version in signatures
  external-csl-toolchain: split out a libstdc++-staticdev package
  external-csl-toolchain: silence .a/.debug QA warnings
  external-csl-toolchain: cleanup, simplify, use base_libdir
  external-csl-toolchain: update SUPPORTED to match toolchain
  tclibc-eglibc: drop hardcoded locale-base-en-us/en-gb
  libc-package: rework ''precompiled' locale handling
  tcmode-external-csl: use the existing precompiled locale files

Kang Kai (2):
  autospectacle.pl: pull it from meego as a base
  create-recipe: base on autospectacle.pl to create recipe file

Nitin A Kamble (5):
  makedepend: upgrade from 1.0.3 to 1.0.4
  quilt: upgrade from 0.51 to 0.60
  gdb: upgrade from 7.4 to 7.4.1
  python: upgrade from 2.7.2 to 2.7.3
  distro-tracking: update as per recent recipe upgrades

Saul Wold (15):
  libgcc: Add MLPREFIX to sanity check skip
  gcc-package-target: add libexec for plugin
  resolvconf: Update to 1.65
  libtasn1: Update to 2.12
  xmodmap: Update to 1.0.7
  xhost: Update to 1.0.5
  cairo: Update to 1.12.2
  util-linux: Update to 2.21.1
  mc: Update to 4.8.3
  xkbcomp: Update to 1.2.4
  bigreqsproto: Update to 1.1.2
  xauth: Update to 1.0.7
  gnutls: Update to 2.12.18
  builder: Add Please Wait Dialog Box
  pulseaudio: disable tcpwrap by default

 meta/classes/base.bbclass                          |   60 +-
 meta/classes/libc-package.bbclass                  |   96 +-
 meta/conf/bitbake.conf                             |    7 +
 meta/conf/distro/include/csl-versions.inc          |    4 +
 meta/conf/distro/include/default-versions.inc      |    4 +-
 .../conf/distro/include/distro_tracking_fields.inc |   20 +-
 meta/conf/distro/include/tclibc-eglibc.inc         |   12 +-
 meta/conf/distro/include/tcmode-external-csl.inc   |    4 +
 meta/recipes-connectivity/libpcap/libpcap.inc      |    5 +-
 .../{resolvconf_1.64.bb => resolvconf_1.65.bb}     |    4 +-
 meta/recipes-core/meta/external-csl-toolchain.bb   |   70 +-
 .../meta/external-csl-toolchain/SUPPORTED          |  257 +++-
 .../{util-linux-2.21 => util-linux}/MCONFIG        |    0
 .../{util-linux-2.21 => util-linux}/defines.h      |    0
 .../fix_NL_TIME_FIRST_WEEKDAY.patch                |    0
 .../{util-linux-2.21 => util-linux}/make_include   |    0
 .../remove-lscpu.patch                             |    0
 .../remove_sigsetmark.patch                        |    0
 .../{util-linux-2.21 => util-linux}/swapargs.h     |    0
 .../uclibc-__progname-conflict.patch               |    0
 .../uclibc-compile.patch                           |    0
 .../util-linux-ng-2.16-mount_lock_path.patch       |    0
 .../util-linux-ng-replace-siginterrupt.patch       |    0
 .../{util-linux_2.21.bb => util-linux_2.21.1.bb}   |    6 +-
 meta/recipes-devtools/distcc/distcc_2.18.3.bb      |   14 +-
 meta/recipes-devtools/gcc/gcc-4.7.inc              |    2 +-
 meta/recipes-devtools/gcc/gcc-package-target.inc   |    2 +-
 meta/recipes-devtools/gcc/libgcc_4.7.bb            |    3 +-
 meta/recipes-devtools/gdb/gdb-common.inc           |    6 +-
 ...canadian_7.4.bb => gdb-cross-canadian_7.4.1.bb} |    2 +-
 .../gdb/{gdb-cross_7.4.bb => gdb-cross_7.4.1.bb}   |    0
 .../gdb/{gdb_7.4.bb => gdb_7.4.1.bb}               |    0
 ...thon-native_2.7.2.bb => python-native_2.7.3.bb} |    6 +-
 meta/recipes-devtools/python/python.inc            |    8 +-
 .../python/python/04-default-is-optimized.patch    |   30 +-
 .../python/fix_for_using_different_libdir.patch    |   30 +-
 .../python/sys_platform_is_now_always_linux2.patch |   39 -
 .../python/{python_2.7.2.bb => python_2.7.3.bb}    |    3 +-
 .../quilt/{quilt-0.51.inc => quilt-0.60.inc}       |    4 +-
 .../{quilt-native_0.51.bb => quilt-native_0.60.bb} |    2 +-
 .../quilt/{quilt_0.51.bb => quilt_0.60.bb}         |    2 +-
 .../mc/{mc_4.8.1.bb => mc_4.8.3.bb}                |    6 +-
 meta/recipes-graphics/builder/builder_0.1.bb       |    7 +-
 .../builder/files/builder_hob_start.sh             |    2 +
 .../builder/files/please_wait_dialog.py            |   28 +
 .../cairo/{cairo_1.10.2.bb => cairo_1.12.2.bb}     |   20 +-
 meta/recipes-graphics/mesa/mesa-common.inc         |    2 +-
 .../xorg-app/{xauth_1.0.6.bb => xauth_1.0.7.bb}    |    4 +-
 .../xorg-app/{xhost_1.0.4.bb => xhost_1.0.5.bb}    |    4 +-
 .../{xkbcomp_1.2.3.bb => xkbcomp_1.2.4.bb}         |    5 +-
 .../{xmodmap_1.0.5.bb => xmodmap_1.0.7.bb}         |    4 +-
 ...bigreqsproto_1.1.1.bb => bigreqsproto_1.1.2.bb} |    4 +-
 .../{makedepend_1.0.3.bb => makedepend_1.0.4.bb}   |    5 +-
 .../libsndfile/libsndfile1_1.0.25.bb               |    5 +-
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |    1 +
 .../pulseaudio/pulseaudio_1.1.bb                   |    2 +-
 .../configure-fix.patch                            |    0
 .../correct_rpl_gettimeofday_signature.patch       |    0
 .../fix-gettext-version.patch                      |    0
 .../gnutls-openssl.patch                           |    0
 .../gnutls-texinfo-euro.patch                      |    0
 meta/recipes-support/gnutls/gnutls.inc             |    2 +-
 .../{gnutls_2.12.17.bb => gnutls_2.12.18.bb}       |    4 +-
 .../gnutls/{libtasn1_2.11.bb => libtasn1_2.12.bb}  |    6 +-
 scripts/create-recipe                              | 1926 ++++++++++++++++++++
 65 files changed, 2475 insertions(+), 264 deletions(-)
 rename meta/recipes-connectivity/resolvconf/{resolvconf_1.64.bb => resolvconf_1.65.bb} (88%)
 rename meta/recipes-core/util-linux/{util-linux-2.21 => util-linux}/MCONFIG (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.21 => util-linux}/defines.h (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.21 => util-linux}/fix_NL_TIME_FIRST_WEEKDAY.patch (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.21 => util-linux}/make_include (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.21 => util-linux}/remove-lscpu.patch (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.21 => util-linux}/remove_sigsetmark.patch (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.21 => util-linux}/swapargs.h (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.21 => util-linux}/uclibc-__progname-conflict.patch (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.21 => util-linux}/uclibc-compile.patch (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.21 => util-linux}/util-linux-ng-2.16-mount_lock_path.patch (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.21 => util-linux}/util-linux-ng-replace-siginterrupt.patch (100%)
 rename meta/recipes-core/util-linux/{util-linux_2.21.bb => util-linux_2.21.1.bb} (90%)
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_7.4.bb => gdb-cross-canadian_7.4.1.bb} (88%)
 rename meta/recipes-devtools/gdb/{gdb-cross_7.4.bb => gdb-cross_7.4.1.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb_7.4.bb => gdb_7.4.1.bb} (100%)
 rename meta/recipes-devtools/python/{python-native_2.7.2.bb => python-native_2.7.3.bb} (92%)
 delete mode 100644 meta/recipes-devtools/python/python/sys_platform_is_now_always_linux2.patch
 rename meta/recipes-devtools/python/{python_2.7.2.bb => python_2.7.3.bb} (98%)
 rename meta/recipes-devtools/quilt/{quilt-0.51.inc => quilt-0.60.inc} (84%)
 rename meta/recipes-devtools/quilt/{quilt-native_0.51.bb => quilt-native_0.60.bb} (83%)
 rename meta/recipes-devtools/quilt/{quilt_0.51.bb => quilt_0.60.bb} (98%)
 rename meta/recipes-extended/mc/{mc_4.8.1.bb => mc_4.8.3.bb} (81%)
 create mode 100644 meta/recipes-graphics/builder/files/please_wait_dialog.py
 rename meta/recipes-graphics/cairo/{cairo_1.10.2.bb => cairo_1.12.2.bb} (72%)
 rename meta/recipes-graphics/xorg-app/{xauth_1.0.6.bb => xauth_1.0.7.bb} (69%)
 rename meta/recipes-graphics/xorg-app/{xhost_1.0.4.bb => xhost_1.0.5.bb} (81%)
 rename meta/recipes-graphics/xorg-app/{xkbcomp_1.2.3.bb => xkbcomp_1.2.4.bb} (78%)
 rename meta/recipes-graphics/xorg-app/{xmodmap_1.0.5.bb => xmodmap_1.0.7.bb} (78%)
 rename meta/recipes-graphics/xorg-proto/{bigreqsproto_1.1.1.bb => bigreqsproto_1.1.2.bb} (73%)
 rename meta/recipes-graphics/xorg-util/{makedepend_1.0.3.bb => makedepend_1.0.4.bb} (82%)
 rename meta/recipes-support/gnutls/{gnutls-2.12.17 => gnutls-2.12.18}/configure-fix.patch (100%)
 rename meta/recipes-support/gnutls/{gnutls-2.12.17 => gnutls-2.12.18}/correct_rpl_gettimeofday_signature.patch (100%)
 rename meta/recipes-support/gnutls/{gnutls-2.12.17 => gnutls-2.12.18}/fix-gettext-version.patch (100%)
 rename meta/recipes-support/gnutls/{gnutls-2.12.17 => gnutls-2.12.18}/gnutls-openssl.patch (100%)
 rename meta/recipes-support/gnutls/{gnutls-2.12.17 => gnutls-2.12.18}/gnutls-texinfo-euro.patch (100%)
 rename meta/recipes-support/gnutls/{gnutls_2.12.17.bb => gnutls_2.12.18.bb} (77%)
 rename meta/recipes-support/gnutls/{libtasn1_2.11.bb => libtasn1_2.12.bb} (71%)
 create mode 100755 scripts/create-recipe

-- 
1.7.7.6



