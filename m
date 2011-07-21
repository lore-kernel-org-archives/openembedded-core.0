Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qjo8S-0001Eg-NB
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 09:57:32 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 21 Jul 2011 00:53:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,240,1309762800"; d="scan'208";a="29787045"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.254])
	by azsmga001.ch.intel.com with ESMTP; 21 Jul 2011 00:53:10 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Jul 2011 00:52:48 -0700
Message-Id: <cover.1311234475.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [CONSOLIDATED PULL 00/20] July 21, 2011
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
X-List-Received-Date: Thu, 21 Jul 2011 07:57:32 -0000


Richard,

Review and tested, the inherit perlnatives are needed.


Sau!

The following changes since commit 0d03800caffc2341b74190d38f7a372223c89f4c:

  lsbsetup_1.0.bb: Change the hardcoded /usr/lib to support multilib (2011-07-20 15:43:43 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Martin Jansa (9):
  tcmode-default: set preferred version also for (e)glibc-locale
  eglibc-package: don't fail without localedef/gconv
  python: save Makefile.sysroot in do_compile
  python: add patch to fix cross compilation on host with linux-3.0
  polkit: inherit perlnative
  shared-mime-info: inherit perlnative
  xkeyboard-config: inherit perlnative
  avahi: inherit perlnative
  vte: inherit perlnative

Matthew McClintock (2):
  Add endianess macros used by previous endian-ness_handling.patch
  Make intltool use perlnative instead of perl on host

Saul Wold (2):
  clutter-box2d: fix isfinite.patch
  gettext: Add depends to gettext to avoid host contamination

Tom Rini (7):
  python-native: Mangle scripts to use /usr/bin/env python, bump PR
  gnome-doc-utils: Use /usr/bin/env python in xml2po, bump PR
  perl-native: Add a perl-native wrapper in the normal bindir
  cpan.bbclass: Perform more mangling for perl path
  icon-naming-utils-native: Fix long path to perl in icon-name-mapping
  siteinfo.bbclass: Port over oe.dev logic for site files
  local.conf.sample: Add a note about ASSUME_PROVIDED for help2man

 meta/classes/cpan.bbclass                          |    3 +
 meta/classes/siteinfo.bbclass                      |  203 ++++++++++----------
 meta/conf/distro/include/tcmode-default.inc        |    2 +
 meta/conf/local.conf.sample                        |    3 +
 meta/recipes-connectivity/avahi/avahi.inc          |    2 +-
 meta/recipes-core/eglibc/eglibc-package.inc        |    8 +-
 .../ldconfig-native-2.12.1/endianess-header.patch  |  113 +++++++++++
 meta/recipes-core/eglibc/ldconfig-native_2.12.1.bb |    5 +-
 meta/recipes-core/gettext/gettext_0.18.1.1.bb      |    6 +-
 .../icon-naming-utils-native_0.8.7.bb              |    7 +-
 meta/recipes-devtools/intltool/intltool.inc        |    2 +-
 meta/recipes-devtools/intltool/intltool_0.40.6.bb  |    2 +-
 meta/recipes-devtools/perl/liburi-perl_1.58.bb     |    2 +-
 .../perl/libxml-parser-perl_2.40.bb                |    2 +-
 meta/recipes-devtools/perl/libxml-perl_0.08.bb     |    2 +-
 .../perl/libxml-simple-perl_2.18.bb                |    2 +-
 meta/recipes-devtools/perl/perl-native_5.12.3.bb   |   17 ++-
 .../recipes-devtools/python/python-native_2.6.6.bb |    5 +
 .../python/python/07-linux3-regen-fix.patch        |   18 ++
 meta/recipes-devtools/python/python_2.6.6.bb       |    8 +-
 .../sgmlspl/sgmlspl-native_1.03ii.bb               |    2 +-
 .../perl/libconvert-asn1-perl_0.22.bb              |    2 +-
 .../recipes-extended/perl/libtimedate-perl_1.20.bb |    2 +-
 .../perl/libxml-namespacesupport-perl_1.11.bb      |    2 +-
 meta/recipes-extended/perl/libxml-sax-perl_0.96.bb |    2 +-
 meta/recipes-extended/polkit/polkit_0.101.bb       |    2 +-
 .../use-usr-bin-env-for-python-in-xml2po.patch     |   33 ++++
 meta/recipes-gnome/gnome/gnome-doc-utils_0.20.6.bb |    5 +-
 .../clutter/clutter-box2d/isfinite.patch           |   18 +-
 .../xorg-lib/xkeyboard-config_2.1.bb               |    2 +-
 .../shared-mime-info/shared-mime-info.inc          |    2 +-
 meta/recipes-support/vte/vte.inc                   |    2 +-
 32 files changed, 342 insertions(+), 144 deletions(-)
 create mode 100644 meta/recipes-core/eglibc/ldconfig-native-2.12.1/endianess-header.patch
 create mode 100644 meta/recipes-devtools/python/python/07-linux3-regen-fix.patch
 create mode 100644 meta/recipes-gnome/gnome/gnome-doc-utils/use-usr-bin-env-for-python-in-xml2po.patch
 create mode 100644 meta/site/common-linux

-- 
1.7.3.4



