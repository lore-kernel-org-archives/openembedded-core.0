Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TrNNn-0004a8-Gm
	for openembedded-core@lists.openembedded.org;
	Sat, 05 Jan 2013 07:37:28 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 04 Jan 2013 22:22:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,415,1355126400"; d="scan'208";a="240215851"
Received: from unknown (HELO swold-linux.amr.corp.intel.com) ([10.255.14.97])
	by azsmga001.ch.intel.com with ESMTP; 04 Jan 2013 22:22:15 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Jan 2013 22:22:14 -0800
Message-Id: <cover.1357366840.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
MIME-Version: 1.0
Subject: [CONSOLIDATED PULL (V2) 00/35] Updates, Multilib Patches and other fixes
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
X-List-Received-Date: Sat, 05 Jan 2013 06:37:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Richard,

Finally another collected set of patches, my network access
was worse than I thought it would be the last few days.

I built these locally.

Thanks
	Sau!

The following changes since commit b693f6d3d48b281fbbf71fd56996c85e23c3a9c9:

  freetype: update to 2.4.11 which includes fixes for CVE-2012-{5668, 5669, 5670} (2012-12-31 09:42:49 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Chen Qi (1):
  init-live.sh: avoid duplicate mount points for the same filesystem

Christopher Larson (6):
  update-alternatives.bbclass: use absolute paths for link targets
  opkg-native: obey virtual/update-alternatives-native
  chkconfig: don't inherit autotools
  chkconfig: obey sysconfdir, base_libdir
  chkconfig: package the update-alternatives implementation
  chkconfig-alternatives-native-1.3.59: add recipe

Constantin Musca (8):
  libpam: enable multilib
  package.bbclass: don't prepend MLPREFIX to LOCALEBASEPN
  eglibc-locale: enable multilib
  sysstat: fix sa_lib_dir
  rpm: replace /usr/lib with ${libdir}
  libfm: upgrade to 1.1.0
  pcmanfm: upgrade to 1.1.0
  vte: add missing unpackaged files

David Nyström (1):
  Added ability to parse python sources to create-recipe

Kang Kai (4):
  autoconf: update RDEDENDS
  perl: add sub-package perl-tests
  perl: update RPROVIDES and popuate_package script
  perl: update dependency creating script

Laurentiu Palcu (1):
  pango: have postinstalls run at do_rootfs time

Marko Lindqvist (7):
  automake: update to upstream version 1.12.6
  gmp: update SRC_URI and HOMEPAGE
  gmp: update to upstream version 5.1.0
  mpfr: update to upstream version 3.1.1
  icu: update to upstream version 50.1.1
  harfbuzz: add recipe, version 0.9.9
  pango: update to upstream version 1.32.5

Martin Jansa (1):
  kernel.bbclass: include PE in KERNEL_IMAGE_BASE_NAME

Noor Ahsan (1):
  cairo: Adds libxext in X11DEPENDS.

Robert P. J. Day (2):
  lib_package.bbclass: Correct comment referring to bin directories.
  package.bbclass: Skip testing "packages" a second time.

Saul Wold (3):
  libnl: Update to 3.2.16
  glib-2.0: Update to 2.35.3
  glib-networking: Update to 2.35.1

 meta/classes/kernel.bbclass                        |    2 +-
 meta/classes/lib_package.bbclass                   |    2 +-
 meta/classes/package.bbclass                       |    4 +-
 meta/classes/update-alternatives.bbclass           |    2 +-
 meta/recipes-core/eglibc/eglibc-locale.inc         |    4 +-
 .../{glib-2.0_2.34.3.bb => glib-2.0_2.35.3.bb}     |    4 +-
 meta/recipes-core/glib-2.0/glib.inc                |    2 +-
 ...working_2.28.7.bb => glib-networking_2.35.1.bb} |   10 +-
 meta/recipes-core/initrdscripts/files/init-live.sh |    9 +-
 meta/recipes-devtools/autoconf/autoconf.inc        |    1 -
 meta/recipes-devtools/autoconf/autoconf_2.69.bb    |    2 +-
 ...-compile-compile-only-optimized-byte-code.patch |   28 +-
 .../automake/automake/python-libdir.patch          |   41 +-
 .../{automake_1.12.5.bb => automake_1.12.6.bb}     |    4 +-
 meta/recipes-devtools/opkg/opkg.inc                |   10 +-
 meta/recipes-devtools/perl/perl-5.14.2/config.sh   |   18 +-
 .../recipes-devtools/perl/perl-rdepends_5.14.2.inc | 2336 +++++++++++++++++++-
 meta/recipes-devtools/perl/perl-tests.inc          |   34 +
 meta/recipes-devtools/perl/perl_5.14.2.bb          |   12 +-
 meta/recipes-devtools/rpm/rpm_5.4.9.bb             |    4 +-
 .../chkconfig-alternatives-native_1.3.59.bb        |   43 +
 .../recipes-extended/chkconfig/chkconfig_1.3.58.bb |   48 +-
 meta/recipes-extended/pam/libpam_1.1.6.bb          |   15 +-
 meta/recipes-extended/sysstat/sysstat.inc          |    6 +-
 meta/recipes-graphics/cairo/cairo.inc              |    2 +-
 meta/recipes-graphics/cairo/cairo_1.12.8.bb        |    2 +-
 meta/recipes-graphics/harfbuzz/harfbuzz_0.9.9.bb   |   27 +
 .../pango/pango-1.30.1/multilib-fix-clean.patch    |   42 -
 .../pango/pango-1.32.5/multilib-fix-clean.patch    |   60 +
 .../{pango-1.30.1 => pango-1.32.5}/no-tests.patch  |    0
 meta/recipes-graphics/pango/pango.inc              |   30 +-
 .../pango/{pango_1.30.1.bb => pango_1.32.5.bb}     |    4 +-
 .../pcmanfm/files/owl-window-menu.patch            |   81 -
 .../files/pcmanfm_fix_for_automake_1.12.patch      |   35 -
 .../{pcmanfm_0.9.10.bb => pcmanfm_1.1.0.bb}        |   11 +-
 .../gmp/{gmp => gmp-4.2.1}/configure.patch         |    0
 meta/recipes-support/gmp/gmp-5.1.0/configure.patch |  210 ++
 meta/recipes-support/gmp/gmp.inc                   |    4 +-
 .../gmp/gmp/gmp_fix_for_automake-1.12.patch        |   48 -
 .../gmp/{gmp_5.0.5.bb => gmp_5.1.0.bb}             |    5 +-
 meta/recipes-support/icu/icu_50.1.1.bb             |   11 +
 meta/recipes-support/icu/icu_50.1.bb               |   11 -
 .../libfm/libfm-0.1.17/configure_fix.patch         |   19 -
 .../libfm-0.1.17/libfm_fix_for_automake-1.12.patch |   48 -
 .../libfm-1.1.0/fix-make-parallelism-issue.patch   |   31 +
 .../libfm/{libfm_0.1.17.bb => libfm_1.1.0.bb}      |    8 +-
 .../libnl/{libnl_3.2.14.bb => libnl_3.2.16.bb}     |    4 +-
 .../mpfr-3.1.0/mpfr_fix_for_automake-1.12.patch    |   35 -
 .../long-long-thumb.patch                          |    0
 .../mpfr/{mpfr_3.1.0.bb => mpfr_3.1.1.bb}          |    7 +-
 meta/recipes-support/vte/vte.inc                   |    4 +-
 scripts/create-recipe                              |   51 +-
 52 files changed, 2944 insertions(+), 487 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.34.3.bb => glib-2.0_2.35.3.bb} (92%)
 rename meta/recipes-core/glib-networking/{glib-networking_2.28.7.bb => glib-networking_2.35.1.bb} (70%)
 rename meta/recipes-devtools/automake/{automake_1.12.5.bb => automake_1.12.6.bb} (90%)
 create mode 100644 meta/recipes-devtools/perl/perl-tests.inc
 create mode 100644 meta/recipes-extended/chkconfig/chkconfig-alternatives-native_1.3.59.bb
 create mode 100644 meta/recipes-graphics/harfbuzz/harfbuzz_0.9.9.bb
 delete mode 100644 meta/recipes-graphics/pango/pango-1.30.1/multilib-fix-clean.patch
 create mode 100644 meta/recipes-graphics/pango/pango-1.32.5/multilib-fix-clean.patch
 rename meta/recipes-graphics/pango/{pango-1.30.1 => pango-1.32.5}/no-tests.patch (100%)
 rename meta/recipes-graphics/pango/{pango_1.30.1.bb => pango_1.32.5.bb} (59%)
 delete mode 100644 meta/recipes-sato/pcmanfm/files/owl-window-menu.patch
 delete mode 100644 meta/recipes-sato/pcmanfm/files/pcmanfm_fix_for_automake_1.12.patch
 rename meta/recipes-sato/pcmanfm/{pcmanfm_0.9.10.bb => pcmanfm_1.1.0.bb} (76%)
 rename meta/recipes-support/gmp/{gmp => gmp-4.2.1}/configure.patch (100%)
 create mode 100644 meta/recipes-support/gmp/gmp-5.1.0/configure.patch
 delete mode 100644 meta/recipes-support/gmp/gmp/gmp_fix_for_automake-1.12.patch
 rename meta/recipes-support/gmp/{gmp_5.0.5.bb => gmp_5.1.0.bb} (60%)
 create mode 100644 meta/recipes-support/icu/icu_50.1.1.bb
 delete mode 100644 meta/recipes-support/icu/icu_50.1.bb
 delete mode 100644 meta/recipes-support/libfm/libfm-0.1.17/configure_fix.patch
 delete mode 100644 meta/recipes-support/libfm/libfm-0.1.17/libfm_fix_for_automake-1.12.patch
 create mode 100644 meta/recipes-support/libfm/libfm-1.1.0/fix-make-parallelism-issue.patch
 rename meta/recipes-support/libfm/{libfm_0.1.17.bb => libfm_1.1.0.bb} (75%)
 rename meta/recipes-support/libnl/{libnl_3.2.14.bb => libnl_3.2.16.bb} (90%)
 delete mode 100644 meta/recipes-support/mpfr/mpfr-3.1.0/mpfr_fix_for_automake-1.12.patch
 rename meta/recipes-support/mpfr/{mpfr-3.1.0 => mpfr-3.1.1}/long-long-thumb.patch (100%)
 rename meta/recipes-support/mpfr/{mpfr_3.1.0.bb => mpfr_3.1.1.bb} (65%)

-- 
1.8.0.2



