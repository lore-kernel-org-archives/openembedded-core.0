Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TqUW7-0005FG-R4
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Jan 2013 21:02:24 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 02 Jan 2013 11:47:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,398,1355126400"; d="scan'208";a="272144225"
Received: from unknown (HELO swold-linux.amr.corp.intel.com) ([10.255.14.135])
	by fmsmga002.fm.intel.com with ESMTP; 02 Jan 2013 11:47:17 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Jan 2013 11:47:16 -0800
Message-Id: <cover.1357155947.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
MIME-Version: 1.0
Subject: [CONSOLIDATED PULL 00/17] Updates and ML Fixes
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
X-List-Received-Date: Wed, 02 Jan 2013 20:02:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Richard,

Here is another batch of patches, mostly multilib fixes and
some more updates.

Sau!

The following changes since commit b693f6d3d48b281fbbf71fd56996c85e23c3a9c9:

  freetype: update to 2.4.11 which includes fixes for CVE-2012-{5668, 5669, 5670} (2012-12-31 09:42:49 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Constantin Musca (7):
  libpam: enable multilib
  package.bbclass: don't prepend MLPREFIX to LOCALEBASEPN
  eglibc-locale: enable multilib
  sysstat: fix sa_lib_dir
  rpm: replace /usr/lib with ${libdir}
  libfm: upgrade to 1.1.0
  pcmanfm: upgrade to 1.1.0

David Nyström (1):
  Added ability to parse python sources to create-recipe

Kang Kai (4):
  autoconf: update RDEDENDS
  perl: add sub-package perl-tests
  perl: update RPROVIDES and popuate_package script
  perl: update dependency creating script

Laurentiu Palcu (1):
  pango: have postinstalls run at do_rootfs time

Marko Lindqvist (3):
  automake: update to upstream version 1.12.6
  gettext: update to upstream version 0.18.2
  icu: update to upstream version 50.1.1

Martin Jansa (1):
  kernel.bbclass: include PE in KERNEL_IMAGE_BASE_NAME

 meta/classes/kernel.bbclass                        |    2 +-
 meta/classes/package.bbclass                       |    2 +-
 meta/recipes-core/eglibc/eglibc-locale.inc         |    4 +-
 .../gettext/gettext-0.18.1.1/remove_gets.patch     |   58 -
 .../gnulib-uclibc-sched_param-def.patch            |    0
 .../parallel.patch                                 |    0
 .../wchar-uclibc.patch                             |    0
 .../{gettext_0.18.1.1.bb => gettext_0.18.2.bb}     |    7 +-
 meta/recipes-devtools/autoconf/autoconf.inc        |    1 -
 meta/recipes-devtools/autoconf/autoconf_2.69.bb    |    2 +-
 ...-compile-compile-only-optimized-byte-code.patch |   28 +-
 .../automake/automake/python-libdir.patch          |   41 +-
 .../{automake_1.12.5.bb => automake_1.12.6.bb}     |    4 +-
 meta/recipes-devtools/perl/perl-5.14.2/config.sh   |   18 +-
 .../recipes-devtools/perl/perl-rdepends_5.14.2.inc | 2336 +++++++++++++++++++-
 meta/recipes-devtools/perl/perl-tests.inc          |   34 +
 meta/recipes-devtools/perl/perl_5.14.2.bb          |   12 +-
 meta/recipes-devtools/rpm/rpm_5.4.9.bb             |    4 +-
 meta/recipes-extended/pam/libpam_1.1.6.bb          |   15 +-
 meta/recipes-extended/sysstat/sysstat.inc          |    6 +-
 meta/recipes-graphics/pango/pango.inc              |   26 +-
 .../pcmanfm/files/owl-window-menu.patch            |   81 -
 .../files/pcmanfm_fix_for_automake_1.12.patch      |   35 -
 .../{pcmanfm_0.9.10.bb => pcmanfm_1.1.0.bb}        |   11 +-
 meta/recipes-support/icu/icu_50.1.1.bb             |   11 +
 meta/recipes-support/icu/icu_50.1.bb               |   11 -
 .../libfm/libfm-0.1.17/configure_fix.patch         |   19 -
 .../libfm-0.1.17/libfm_fix_for_automake-1.12.patch |   48 -
 .../libfm-1.1.0/fix-make-parallelism-issue.patch   |   31 +
 .../libfm/{libfm_0.1.17.bb => libfm_1.1.0.bb}      |    8 +-
 scripts/create-recipe                              |   51 +-
 31 files changed, 2526 insertions(+), 380 deletions(-)
 delete mode 100644 meta/recipes-core/gettext/gettext-0.18.1.1/remove_gets.patch
 rename meta/recipes-core/gettext/{gettext-0.18.1.1 => gettext-0.18.2}/gnulib-uclibc-sched_param-def.patch (100%)
 rename meta/recipes-core/gettext/{gettext-0.18.1.1 => gettext-0.18.2}/parallel.patch (100%)
 rename meta/recipes-core/gettext/{gettext-0.18.1.1 => gettext-0.18.2}/wchar-uclibc.patch (100%)
 rename meta/recipes-core/gettext/{gettext_0.18.1.1.bb => gettext_0.18.2.bb} (96%)
 rename meta/recipes-devtools/automake/{automake_1.12.5.bb => automake_1.12.6.bb} (90%)
 create mode 100644 meta/recipes-devtools/perl/perl-tests.inc
 delete mode 100644 meta/recipes-sato/pcmanfm/files/owl-window-menu.patch
 delete mode 100644 meta/recipes-sato/pcmanfm/files/pcmanfm_fix_for_automake_1.12.patch
 rename meta/recipes-sato/pcmanfm/{pcmanfm_0.9.10.bb => pcmanfm_1.1.0.bb} (76%)
 create mode 100644 meta/recipes-support/icu/icu_50.1.1.bb
 delete mode 100644 meta/recipes-support/icu/icu_50.1.bb
 delete mode 100644 meta/recipes-support/libfm/libfm-0.1.17/configure_fix.patch
 delete mode 100644 meta/recipes-support/libfm/libfm-0.1.17/libfm_fix_for_automake-1.12.patch
 create mode 100644 meta/recipes-support/libfm/libfm-1.1.0/fix-make-parallelism-issue.patch
 rename meta/recipes-support/libfm/{libfm_0.1.17.bb => libfm_1.1.0.bb} (75%)

-- 
1.8.0.2



