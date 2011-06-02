Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QS2xC-0006YD-2D
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Jun 2011 10:08:30 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 02 Jun 2011 01:05:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,308,1304319600"; 
   d="scan'208";a="5775200"
Received: from unknown (HELO swold-MOBL.nomadix.com) ([10.255.12.203])
	by azsmga001.ch.intel.com with ESMTP; 02 Jun 2011 01:05:13 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Jun 2011 01:04:59 -0700
Message-Id: <cover.1307001679.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [CONSOLIDATED PULL 00/12] 2-June-2011
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
X-List-Received-Date: Thu, 02 Jun 2011 08:08:30 -0000

Richard:

Pulling a number of patches and updates from the list, they have been
built on the autobuild.

This has the gcc fix for qt4-x11-free in the form of a gcc patch

Sau!

The following changes since commit 0a496df0209c93fd00ea929b5f27faa1a6e600c0:

  clutter-1.6: Add patch to update gettext macro version (2011-06-01 18:32:30 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Jingdong Lu (1):
  libx11: fix libX11 keysyms to pass xts5 of lsb

Kang Kai (1):
  task-core-lsb: add cups and ghostscript into image

Koen Kooi (3):
  u-boot: package up u-boot.bin for field upgrades
  shadow: remove selinux entry from pam.d/login
  avahi: enable service when using systemd

Nitin A Kamble (4):
  m4: upgrade from 1.4.15 to 1.4.16
  autoconf: upgrade from 2.65 to 2.68
  bison: upgrade from 2.4.3 to 2.5
  gettext-0.16.1: mark upstream status for gplv2 recipe's patches

Phil Blundell (1):
  rootfs_ipk: delete opkg metadata if package management not required
    and all packages are configured

Saul Wold (2):
  ghostscript: Fix up file locations and add i686
  gcc: Fix volatile access issue for ARM

 meta/classes/rootfs_ipk.bbclass                    |   11 ++
 meta/recipes-bsp/uboot/u-boot.inc                  |   11 ++
 meta/recipes-bsp/uboot/u-boot_2011.03.bb           |    2 +-
 meta/recipes-connectivity/avahi/avahi.inc          |   18 +++
 meta/recipes-connectivity/avahi/avahi_0.6.30.bb    |    2 +-
 .../gettext/gettext-0.16.1/disable_java.patch      |    3 +-
 .../gettext-0.16.1/fix_aclocal_version.patch       |    1 +
 .../gettext-0.16.1/fix_gnu_source_circular.patch   |    3 +-
 .../gettext/gettext-0.16.1/fixchicken.patch        |    3 +-
 .../gettext/gettext-0.16.1/getline.m4.patch        |    3 +-
 .../gettext-autoconf-lib-link-no-L.patch           |    3 +-
 .../gettext-error_print_progname.patch             |    3 +-
 .../gettext/gettext-0.16.1/gettext-vpath.patch     |    3 +-
 .../gettext-0.16.1/hardcode_macro_version.patch    |    3 +-
 .../gettext/gettext-0.16.1/linklib_from_0.17.patch |    3 +-
 .../{autoconf-2.65 => autoconf}/autoconf-x.patch   |    0
 .../autoheader-nonfatal-warnings.patch             |    0
 .../autoreconf-exclude.patch                       |    0
 .../autoreconf-foreign.patch                       |    0
 .../autoreconf-gnuconfigize.patch                  |    0
 .../autoreconf-include.patch                       |    0
 .../{autoconf-2.65 => autoconf}/config_site.patch  |   19 ++-
 .../fix_path_xtra.patch                            |   14 +-
 .../path_prog_fixes.patch                          |    0
 .../program_prefix.patch                           |    0
 .../{autoconf_2.65.bb => autoconf_2.68.bb}         |    6 +-
 meta/recipes-devtools/bison/bison/m4.patch         |  131 --------------------
 .../bison/bison/uclibc-sched_param-def.patch       |   21 ---
 .../bison/{bison_2.4.3.bb => bison_2.5.bb}         |    7 +-
 meta/recipes-devtools/gcc/gcc-4.6.0.inc            |    4 +-
 .../gcc/gcc-4.6.0/volatile_access_backport.patch   |   28 ++++
 .../{m4-native_1.4.15.bb => m4-native_1.4.16.bb}   |    0
 .../m4/{m4_1.4.15.bb => m4_1.4.16.bb}              |    6 +-
 .../ghostscript/{ => }/ghostscript/arm/objarch.h   |    0
 .../ghostscript/{ => }/ghostscript/arm/soobjarch.h |    0
 .../ghostscript/{ => }/ghostscript/i586/objarch.h  |    0
 .../{ => }/ghostscript/i586/soobjarch.h            |    0
 meta/recipes-extended/ghostscript/ghostscript/i686 |    1 +
 .../ghostscript/{ => }/ghostscript/mips/objarch.h  |    0
 .../{ => }/ghostscript/mips/soobjarch.h            |    0
 .../{ => }/ghostscript/powerpc/objarch.h           |    0
 .../{ => }/ghostscript/powerpc/soobjarch.h         |    0
 .../{ => }/ghostscript/x86_64/objarch.h            |    0
 .../{ => }/ghostscript/x86_64/soobjarch.h          |    0
 meta/recipes-extended/shadow/files/pam.d/login     |    7 -
 meta/recipes-extended/shadow/shadow.inc            |    2 +
 meta/recipes-extended/tasks/task-core-lsb.bb       |    3 +-
 .../libx11-1.3.4/makekeys_crosscompile.patch       |   45 +++++++
 .../recipes-graphics/xorg-lib/libx11-trim_1.3.4.bb |    5 +-
 meta/recipes-graphics/xorg-lib/libx11.inc          |    8 +-
 meta/recipes-graphics/xorg-lib/libx11_1.3.4.bb     |    5 +-
 51 files changed, 185 insertions(+), 199 deletions(-)
 rename meta/recipes-devtools/autoconf/{autoconf-2.65 => autoconf}/autoconf-x.patch (100%)
 rename meta/recipes-devtools/autoconf/{autoconf-2.65 => autoconf}/autoheader-nonfatal-warnings.patch (100%)
 rename meta/recipes-devtools/autoconf/{autoconf-2.65 => autoconf}/autoreconf-exclude.patch (100%)
 rename meta/recipes-devtools/autoconf/{autoconf-2.65 => autoconf}/autoreconf-foreign.patch (100%)
 rename meta/recipes-devtools/autoconf/{autoconf-2.65 => autoconf}/autoreconf-gnuconfigize.patch (100%)
 rename meta/recipes-devtools/autoconf/{autoconf-2.65 => autoconf}/autoreconf-include.patch (100%)
 rename meta/recipes-devtools/autoconf/{autoconf-2.65 => autoconf}/config_site.patch (60%)
 rename meta/recipes-devtools/autoconf/{autoconf-2.65 => autoconf}/fix_path_xtra.patch (90%)
 rename meta/recipes-devtools/autoconf/{autoconf-2.65 => autoconf}/path_prog_fixes.patch (100%)
 rename meta/recipes-devtools/autoconf/{autoconf-2.65 => autoconf}/program_prefix.patch (100%)
 rename meta/recipes-devtools/autoconf/{autoconf_2.65.bb => autoconf_2.68.bb} (85%)
 delete mode 100644 meta/recipes-devtools/bison/bison/uclibc-sched_param-def.patch
 rename meta/recipes-devtools/bison/{bison_2.4.3.bb => bison_2.5.bb} (85%)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/volatile_access_backport.patch
 rename meta/recipes-devtools/m4/{m4-native_1.4.15.bb => m4-native_1.4.16.bb} (100%)
 rename meta/recipes-devtools/m4/{m4_1.4.15.bb => m4_1.4.16.bb} (75%)
 rename meta/recipes-extended/ghostscript/{ => }/ghostscript/arm/objarch.h (100%)
 rename meta/recipes-extended/ghostscript/{ => }/ghostscript/arm/soobjarch.h (100%)
 rename meta/recipes-extended/ghostscript/{ => }/ghostscript/i586/objarch.h (100%)
 rename meta/recipes-extended/ghostscript/{ => }/ghostscript/i586/soobjarch.h (100%)
 create mode 120000 meta/recipes-extended/ghostscript/ghostscript/i686
 rename meta/recipes-extended/ghostscript/{ => }/ghostscript/mips/objarch.h (100%)
 rename meta/recipes-extended/ghostscript/{ => }/ghostscript/mips/soobjarch.h (100%)
 rename meta/recipes-extended/ghostscript/{ => }/ghostscript/powerpc/objarch.h (100%)
 rename meta/recipes-extended/ghostscript/{ => }/ghostscript/powerpc/soobjarch.h (100%)
 rename meta/recipes-extended/ghostscript/{ => }/ghostscript/x86_64/objarch.h (100%)
 rename meta/recipes-extended/ghostscript/{ => }/ghostscript/x86_64/soobjarch.h (100%)
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11-1.3.4/makekeys_crosscompile.patch

-- 
1.7.3.4



