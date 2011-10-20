Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RGnUm-0002nx-H6
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Oct 2011 09:56:56 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 20 Oct 2011 00:51:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="64982164"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.6])
	by orsmga001.jf.intel.com with ESMTP; 20 Oct 2011 00:51:03 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Oct 2011 00:50:36 -0700
Message-Id: <cover.1319096633.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.2
Subject: [CONSOLIDATED PULL - v2 00/26] More Updates and Fixes
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
X-List-Received-Date: Thu, 20 Oct 2011 07:56:57 -0000

Richard,

This adds on to yesterday's Consolidated Pull with more patches for
both updates and fixes.

a couple of note:  Anders' module.bbclass change
                   Otavio's distubute_src, this change looks good, 
                            but needs your eyes.

The rest are mostly straight forward updates, I held off Nitin's gmp change 
on this round do to a failure I was seeing when images failed to work.

Sau!


The following changes since commit e31dd9b65f3b03f79cabab25eca157532de3bd9c:

  fontconfig: fix fix-pkgconfig.patch (2011-10-18 18:13:47 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage2
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage2

Anders Darander (1):
  module.bbclass: add lock to prevent error bulding ext modules

Darren Hart (1):
  insane.bbclass: print full path on invalid LICENSE_FILES_CHKSUM

Joshua Lock (5):
  gst-plugins-good: update to 0.10.30
  tzdata: updated SRC_URI and update to 2011k
  tzcode-native: update SRC_URI to new IANA location
  gst-plugins-good: correctly handle gconf schema
  distro-tracking-fields: update fields for tzdata and gst-plugins-good

Kang Kai (5):
  ghostscript: update to 9.04
  libxml-sax-perl: update to 0.99
  liburi-perl: update to 1.59
  libsdl: update to 1.2.14
  distro_tracking_fields: update packages tracking fields

Khem Raj (3):
  bluez4: Add glib-2.0 to DEPENDS
  gcc-4.6: Upgrade SRCREV to latest FSF 4.6 branch
  gcc-4.6: Backport PR46934 fix

Lauri Hintsala (1):
  poky: fix broken ubifs link in deploy folder

Nitin A Kamble (5):
  x86 tune files: set baselib for x32 tune as libx32
  python-scons: upgrade from 2.0.1 to 2.1.0
  python-dbus: upgrade from 0.83.2 to 0.84.0
  libxml-parser-perl: upgrade from 2.40 to 2.41
  distro-tracking: update data for some toolchain recipes

Otavio Salvador (1):
  src_distribute.bbclass, src_distribute_local.bbclass: mostly
    rewritten

Saul Wold (2):
  ghostscript: Disable parallel make due to install issues
  ghostscript: renamed x86_64 to x86-64 for patch to work

Wenzong Fan (2):
  ccache: update to 3.1.6
  chkconfig: Update to 1.3.55

 meta/classes/image_types.bbclass                   |    2 +-
 meta/classes/insane.bbclass                        |    2 +-
 meta/classes/module.bbclass                        |    5 +-
 meta/classes/src_distribute.bbclass                |   54 ++-
 meta/classes/src_distribute_local.bbclass          |   28 +-
 .../conf/distro/include/distro_tracking_fields.inc |   82 +++--
 meta/conf/machine/include/ia32/arch-ia32.inc       |    2 +-
 meta/conf/machine/include/tune-core2.inc           |    2 +-
 meta/recipes-connectivity/bluez/bluez4.inc         |    2 +-
 meta/recipes-connectivity/bluez/bluez4_4.96.bb     |    2 +-
 .../ccache/{ccache_3.1.5.bb => ccache_3.1.6.bb}    |    4 +-
 meta/recipes-devtools/gcc/gcc-4.6.inc              |    5 +-
 meta/recipes-devtools/gcc/gcc-4.6/pr46934.patch    |  392 ++++++++++++++++++++
 .../{liburi-perl_1.58.bb => liburi-perl_1.59.bb}   |    6 +-
 ...ser-perl_2.40.bb => libxml-parser-perl_2.41.bb} |    6 +-
 ...python-dbus_0.83.2.bb => python-dbus_0.84.0.bb} |    4 +-
 ...ative_2.0.1.bb => python-scons-native_2.1.0.bb} |    3 +-
 ...python-scons_2.0.1.bb => python-scons_2.1.0.bb} |    6 +-
 .../{chkconfig_1.3.52.bb => chkconfig_1.3.55.bb}   |    6 +-
 .../ghostscript/ghostscript/arm/soobjarch.h        |   40 --
 .../ghostscript-9.02-prevent_recompiling.patch     |   74 ++--
 .../ghostscript/ghostscript/i586/soobjarch.h       |   41 --
 .../ghostscript/ghostscript/mips/soobjarch.h       |   40 --
 .../ghostscript/ghostscript/powerpc/soobjarch.h    |   40 --
 .../ghostscript/ghostscript/powerpc64/soobjarch.h  |   40 --
 .../ghostscript/{x86_64 => x86-64}/objarch.h       |    0
 .../ghostscript/ghostscript/x86_64/soobjarch.h     |   40 --
 .../{ghostscript_9.02.bb => ghostscript_9.04.bb}   |   28 +-
 ...ml-sax-perl_0.96.bb => libxml-sax-perl_0.99.bb} |    7 +-
 .../recipes-extended/tzcode/tzcode-native_2011i.bb |    4 +-
 .../tzdata/{tzdata_2011k.bb => tzdata_2011l.bb}    |    6 +-
 meta/recipes-graphics/libsdl/files/acinclude.m4    |  189 ----------
 .../libsdl/files/configure_tweak.patch             |  281 +++++++--------
 .../libsdl/files/kernel-asm-page.patch             |   15 -
 .../libsdl/{libsdl_1.2.11.bb => libsdl_1.2.14.bb}  |   17 +-
 ...good_0.10.28.bb => gst-plugins-good_0.10.30.bb} |   10 +-
 36 files changed, 738 insertions(+), 747 deletions(-)
 rename meta/recipes-devtools/ccache/{ccache_3.1.5.bb => ccache_3.1.6.bb} (47%)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6/pr46934.patch
 rename meta/recipes-devtools/perl/{liburi-perl_1.58.bb => liburi-perl_1.59.bb} (81%)
 rename meta/recipes-devtools/perl/{libxml-parser-perl_2.40.bb => libxml-parser-perl_2.41.bb} (82%)
 rename meta/recipes-devtools/python/{python-dbus_0.83.2.bb => python-dbus_0.84.0.bb} (83%)
 rename meta/recipes-devtools/python/{python-scons-native_2.0.1.bb => python-scons-native_2.1.0.bb} (89%)
 rename meta/recipes-devtools/python/{python-scons_2.0.1.bb => python-scons_2.1.0.bb} (51%)
 rename meta/recipes-extended/chkconfig/{chkconfig_1.3.52.bb => chkconfig_1.3.55.bb} (83%)
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/arm/soobjarch.h
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/i586/soobjarch.h
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/mips/soobjarch.h
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/powerpc/soobjarch.h
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/powerpc64/soobjarch.h
 rename meta/recipes-extended/ghostscript/ghostscript/{x86_64 => x86-64}/objarch.h (100%)
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/x86_64/soobjarch.h
 rename meta/recipes-extended/ghostscript/{ghostscript_9.02.bb => ghostscript_9.04.bb} (78%)
 rename meta/recipes-extended/perl/{libxml-sax-perl_0.96.bb => libxml-sax-perl_0.99.bb} (85%)
 rename meta/recipes-extended/tzdata/{tzdata_2011k.bb => tzdata_2011l.bb} (96%)
 delete mode 100644 meta/recipes-graphics/libsdl/files/acinclude.m4
 delete mode 100644 meta/recipes-graphics/libsdl/files/kernel-asm-page.patch
 rename meta/recipes-graphics/libsdl/{libsdl_1.2.11.bb => libsdl_1.2.14.bb} (81%)
 rename meta/recipes-multimedia/gstreamer/{gst-plugins-good_0.10.28.bb => gst-plugins-good_0.10.30.bb} (75%)

-- 
1.7.6.2



