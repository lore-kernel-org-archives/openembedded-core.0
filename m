Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QjSD0-0001ZJ-9y
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 10:32:47 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 20 Jul 2011 01:28:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,233,1309762800"; d="scan'208";a="29753221"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.254])
	by orsmga001.jf.intel.com with ESMTP; 20 Jul 2011 01:28:38 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jul 2011 01:27:47 -0700
Message-Id: <cover.1311150183.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH 00/50] Major Update for Uclibc and gcc4.5.1
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
X-List-Received-Date: Wed, 20 Jul 2011 08:32:47 -0000

Richard,

I have done a basic review of these patches, and built both
uclibc/oe-core along with yocto based x86 and arm builds with 
these changes.

There is some additional multilib support from Dongxiao and Ke

This mostly gets us caught up.

Thanks
	Sau!


The following changes since commit 6ca80453618fa308cc2d6329450aaf5dfdf2d610:

  Fixed concurrency problem for ZIP packed recipes. (2011-07-19 18:03:04 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Andreas Mueller (1):
  gdk-pixbuf(-native): Fix build by disabling introspection

Dongxiao Xu (4):
  alsa-tools: Fix recipe build error.
  xcb-proto: add multilib support.
  pciutils: Change the hardcoded /usr/lib to support multilib.
  udev: Change hard coded /usr/lib to support multilib

Ilya Yanok (7):
  gcc_4.5.1: fix arm_bswapsi2.patch
  gcc_4.5.1: add pr43810.patch
  gcc_4.5.1: add pr44290.patch
  gcc_4.5.1: add pr44606.patch
  gcc_4.5.1: add pr45094.patch
  gcc_4.5.1: add pr45052.patch
  gcc_4.5.1: add pr45886.patch

Joshua Lock (1):
  pseudo: fix uninitialised variable in realpath_fix.patch

Khem Raj (19):
  Revert "libiconv: add version 1.13.1"
  libiconv: Add recipes for 1.13.1
  default-distrovars: Add largefile and argp to DISTRO_FEATURES
  acl,attr: Fix build failures when NLS is disabled on uclibc
  classes/gettext: Do not disable nls for non target recipes
  libxdamage,libxft,libxrandr: Add missing dependency on virtual/libx11
  tzcode,tzdata: Update tzdata to 2011h
  task-core-x11-sato: Add empty NETWORK_MANAGER for uclibc
  uclibc_0.9.32: Implement sync_file_range2.
  oprofile: Fix build when query_module is not there
  powertop: Add lintl to linker commandline on uclibc
  pimlico/dates: Fix build on uclibc
  binutils: Fix build when compiling target binutils recipe with gcc
    4.6
  clutter-box2d: Replace use of finite macro with C99 compliant
    isfinite()
  sysprof: Define NT_GNU_BUILD_ID if undefined
  mesa-xlib: Dont use locales with uclibc
  mesa-dri: Fix build on uclibc
  task-core-tools: Exclude systemtap for uclibc
  site/x86_64-linux-uclibc: Cache lf_cv_sane_realloc

Kumar Gala (6):
  gcc: Add gcc configure for PowerPC e500v2/SPE embedded floating point
    ABI
  tclibc-*libc: Utilize TARGET_FPU for gnuspe setting
  tune-ppce500v2: Add a tune file for PowerPC e500v2 cores
  openssl: Add handling for linux-gnuspe-powerpc
  flac: fix build issues with e500v2 (gnuspe) toolchain
  tune-ppce500mc: Add a tune file for PowerPC e500mc core

Paul Eggleton (1):
  scripts/contrib: add build time regression test script

Phil Blundell (1):
  uclibc: improve packaging granularity

Scott Garman (2):
  libpng: upgrade to v1.2.46
  distro-tracking: update libpng

Tom Rini (7):
  metacity: Add gnome-doc-utils to DEPENDS
  gnome-doc-utils: Package up python site packages, bump PR
  iptuils: Add sgmlspl-native to DEPENDS
  btrfs-tools: Add util-linux to DEPENDS
  bitbake.conf, sanity.bbclass: Drop mercurial-native
  help2man-native: Add 1.38.2
  autotools.bbclass: Add help2man-native to the main DEPENDS tree

Yu Ke (1):
  perl: revise the RRECOMMENDS_perl-modules for multilib case

 meta/classes/autotools.bbclass                     |    4 +-
 meta/classes/gettext.bbclass                       |    2 +-
 meta/classes/sanity.bbclass                        |    2 +-
 meta/conf/bitbake.conf                             |    1 -
 meta/conf/distro/include/default-distrovars.inc    |    3 +-
 .../conf/distro/include/distro_tracking_fields.inc |   10 +-
 meta/conf/distro/include/tclibc-eglibc.inc         |    2 +-
 meta/conf/distro/include/tclibc-glibc.inc          |    2 +-
 meta/conf/distro/include/tclibc-uclibc.inc         |    1 +
 meta/conf/machine/include/tune-ppce500mc.inc       |    4 +
 meta/conf/machine/include/tune-ppce500v2.inc       |    4 +
 .../pciutils/pciutils-3.1.7/makefile.patch         |   14 +
 meta/recipes-bsp/pciutils/pciutils_3.1.7.bb        |    5 +-
 meta/recipes-connectivity/openssl/openssl.inc      |    3 +
 .../recipes-connectivity/openssl/openssl_0.9.8r.bb |    2 +-
 meta/recipes-core/tasks/task-core-tools.bb         |   11 +-
 .../uclibc/uclibc-0.9.32/sync_file_range2.patch    |   40 +
 meta/recipes-core/uclibc/uclibc.inc                |   31 +-
 meta/recipes-core/uclibc/uclibc_0.9.32.bb          |    3 +-
 meta/recipes-core/udev/udev-164/makefile.patch     |   16 +
 meta/recipes-core/udev/udev-new.inc                |    1 +
 meta/recipes-core/udev/udev_164.bb                 |    2 +-
 .../binutils/binutils/clone-shadow.patch           |   79 +
 meta/recipes-devtools/binutils/binutils_2.21.1.bb  |    3 +-
 .../btrfs-tools/btrfs-tools_git.bb                 |    3 +-
 meta/recipes-devtools/gcc/gcc-4.5.1.inc            |    6 +
 .../gcc/gcc-4.5.1/arm-bswapsi2.patch               |    2 +-
 meta/recipes-devtools/gcc/gcc-4.5.1/pr43810.patch  |   57 +
 meta/recipes-devtools/gcc/gcc-4.5.1/pr44290.patch  |  119 +
 meta/recipes-devtools/gcc/gcc-4.5.1/pr44606.patch  |  106 +
 meta/recipes-devtools/gcc/gcc-4.5.1/pr45052.patch  |   30 +
 meta/recipes-devtools/gcc/gcc-4.5.1/pr45094.patch  |   75 +
 meta/recipes-devtools/gcc/gcc-4.5.1/pr45886.patch  |   55 +
 meta/recipes-devtools/gcc/gcc-4.6.inc              |    2 +-
 meta/recipes-devtools/gcc/gcc-common.inc           |    2 +
 .../help2man/help2man-native_1.38.2.bb             |   25 +
 meta/recipes-devtools/perl/perl_5.12.3.bb          |    2 +-
 .../pseudo/pseudo/realpath_fix.patch               |    2 +-
 meta/recipes-devtools/pseudo/pseudo_1.1.1.bb       |    2 +-
 meta/recipes-extended/iputils/iputils_s20101006.bb |    4 +-
 .../recipes-extended/tzcode/tzcode-native_2011g.bb |    7 +-
 .../tzdata/{tzdata_2011g.bb => tzdata_2011h.bb}    |    8 +-
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.22.1.bb |    3 +-
 meta/recipes-gnome/gnome/gnome-doc-utils.inc       |    4 +-
 meta/recipes-gnome/gnome/gnome-doc-utils_0.20.6.bb |    2 +-
 meta/recipes-gnome/gnome/metacity_2.30.3.bb        |    4 +-
 .../clutter/clutter-box2d-1.6_0.10.0.bb            |    6 +-
 .../clutter/clutter-box2d/isfinite.patch           |   19 +
 meta/recipes-graphics/mesa/mesa-dri/uclibc.patch   |   26 +
 meta/recipes-graphics/mesa/mesa-dri_7.10.2.bb      |    6 +-
 .../mesa/mesa-xlib/uclibc_locale.patch             |   31 +
 meta/recipes-graphics/mesa/mesa-xlib_7.10.2.bb     |    3 +-
 .../xcb/xcb-proto-1.6/aclocal.patch                |   22 +
 meta/recipes-graphics/xcb/xcb-proto.inc            |    3 +-
 meta/recipes-graphics/xcb/xcb-proto_1.6.bb         |    2 +-
 meta/recipes-graphics/xcb/xcb-proto_git.bb         |    2 +-
 meta/recipes-graphics/xorg-lib/libxdamage_1.1.3.bb |    4 +-
 meta/recipes-graphics/xorg-lib/libxft_2.2.0.bb     |    4 +-
 meta/recipes-graphics/xorg-lib/libxrandr_1.3.1.bb  |    4 +-
 .../oprofile/oprofile-no-query-modules.patch       |   29 +
 meta/recipes-kernel/oprofile/oprofile_0.9.6.bb     |    3 +-
 meta/recipes-kernel/powertop/powertop_1.13.bb      |   11 +-
 .../sysprof/files/define-NT_GNU_BUILD_ID.patch     |   22 +
 meta/recipes-kernel/sysprof/sysprof_git.bb         |    5 +-
 .../alsa/alsa-tools-1.0.24.1/autotools.patch       |   34 +
 .../recipes-multimedia/alsa/alsa-tools_1.0.24.1.bb |    7 +-
 .../flac/flac-1.2.1/0001-No-AltiVec-on-SPE.patch   |   74 +
 meta/recipes-multimedia/flac/flac_1.2.1.bb         |    5 +-
 .../libpng/{libpng_1.2.44.bb => libpng_1.2.46.bb}  |   11 +-
 meta/recipes-sato/pimlico/dates.inc                |    2 +-
 .../uclibc-NL_TIME_FIRST_WEEKDAY-absent.patch      |   37 +
 meta/recipes-sato/pimlico/dates_git.bb             |    6 +-
 meta/recipes-sato/tasks/task-core-x11-sato.bb      |    2 +
 meta/recipes-support/attr/acl_2.2.51.bb            |    2 +-
 meta/recipes-support/attr/attr.inc                 |    4 -
 meta/recipes-support/attr/attr_2.4.46.bb           |    2 +-
 meta/recipes-support/attr/ea-acl.inc               |    3 +
 .../{files => libiconv-1.11.1}/autoconf.patch      |    2 -
 .../shared_preloadable_libiconv_linux.patch        |    2 -
 .../libiconv/libiconv-1.13.1/autoconf.patch        |16018 ++++++++++++++++++++
 meta/recipes-support/libiconv/libiconv.inc         |   18 +
 meta/recipes-support/libiconv/libiconv_1.11.1.bb   |   24 +-
 meta/recipes-support/libiconv/libiconv_1.13.1.bb   |   39 +-
 meta/site/x86_64-linux-uclibc                      |    3 +
 scripts/contrib/test_build_time.sh                 |  237 +
 scripts/contrib/test_build_time_worker.sh          |   37 +
 86 files changed, 17390 insertions(+), 146 deletions(-)
 create mode 100644 meta/conf/machine/include/tune-ppce500mc.inc
 create mode 100644 meta/conf/machine/include/tune-ppce500v2.inc
 create mode 100644 meta/recipes-bsp/pciutils/pciutils-3.1.7/makefile.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/sync_file_range2.patch
 create mode 100644 meta/recipes-core/udev/udev-164/makefile.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/clone-shadow.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.5.1/pr43810.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.5.1/pr44290.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.5.1/pr44606.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.5.1/pr45052.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.5.1/pr45094.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.5.1/pr45886.patch
 create mode 100644 meta/recipes-devtools/help2man/help2man-native_1.38.2.bb
 rename meta/recipes-extended/tzdata/{tzdata_2011g.bb => tzdata_2011h.bb} (96%)
 create mode 100644 meta/recipes-graphics/clutter/clutter-box2d/isfinite.patch
 create mode 100644 meta/recipes-graphics/mesa/mesa-dri/uclibc.patch
 create mode 100644 meta/recipes-graphics/mesa/mesa-xlib/uclibc_locale.patch
 create mode 100644 meta/recipes-graphics/xcb/xcb-proto-1.6/aclocal.patch
 create mode 100644 meta/recipes-kernel/oprofile/oprofile/oprofile-no-query-modules.patch
 create mode 100644 meta/recipes-kernel/sysprof/files/define-NT_GNU_BUILD_ID.patch
 create mode 100644 meta/recipes-multimedia/alsa/alsa-tools-1.0.24.1/autotools.patch
 create mode 100644 meta/recipes-multimedia/flac/flac-1.2.1/0001-No-AltiVec-on-SPE.patch
 rename meta/recipes-multimedia/libpng/{libpng_1.2.44.bb => libpng_1.2.46.bb} (55%)
 create mode 100644 meta/recipes-sato/pimlico/dates/uclibc-NL_TIME_FIRST_WEEKDAY-absent.patch
 rename meta/recipes-support/libiconv/{files => libiconv-1.11.1}/autoconf.patch (98%)
 rename meta/recipes-support/libiconv/{files => libiconv-1.11.1}/shared_preloadable_libiconv_linux.patch (98%)
 create mode 100644 meta/recipes-support/libiconv/libiconv-1.13.1/autoconf.patch
 create mode 100644 meta/recipes-support/libiconv/libiconv.inc
 create mode 100755 scripts/contrib/test_build_time.sh
 create mode 100755 scripts/contrib/test_build_time_worker.sh

-- 
1.7.3.4



