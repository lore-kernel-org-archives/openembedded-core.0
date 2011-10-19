Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RGRbI-0000ob-U3
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Oct 2011 10:34:13 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 19 Oct 2011 01:28:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="64658090"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.6])
	by orsmga002.jf.intel.com with ESMTP; 19 Oct 2011 01:28:21 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Oct 2011 01:28:03 -0700
Message-Id: <cover.1319012721.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.2
Subject: [CONSOLIDATED PULL 00/16] Various Updates
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
X-List-Received-Date: Wed, 19 Oct 2011 08:34:13 -0000

Richard, 

This set include upgrades from Khem for GCC along with Nitin for various 
toolchain items. There are also some other good updates from Josh.

Please look at the change from Otavio for src_distrubute, It looks good
to me, but need another set of eyes on code.

Thanks
	Sau!


The following changes since commit e31dd9b65f3b03f79cabab25eca157532de3bd9c:

  fontconfig: fix fix-pkgconfig.patch (2011-10-18 18:13:47 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Darren Hart (1):
  insane.bbclass: print full path on invalid LICENSE_FILES_CHKSUM

Joshua Lock (2):
  gst-plugins-good: update to 0.10.30
  tzdata: updated SRC_URI and update to 2011k

Khem Raj (3):
  bluez4: Add glib-2.0 to DEPENDS
  gcc-4.6: Upgrade SRCREV to latest FSF 4.6 branch
  gcc-4.6: Backport PR46934 fix

Lauri Hintsala (1):
  poky: fix broken ubifs link in deploy folder

Nitin A Kamble (6):
  x86 tune files: set baselib for x32 tune as libx32
  gmp: also generate the libgmpcxx library
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

 meta/classes/image_types.bbclass                   |    2 +-
 meta/classes/insane.bbclass                        |    2 +-
 meta/classes/src_distribute.bbclass                |   54 ++-
 meta/classes/src_distribute_local.bbclass          |   28 +-
 .../conf/distro/include/distro_tracking_fields.inc |   42 ++-
 meta/conf/machine/include/ia32/arch-ia32.inc       |    2 +-
 meta/conf/machine/include/tune-core2.inc           |    2 +-
 meta/recipes-connectivity/bluez/bluez4.inc         |    2 +-
 meta/recipes-connectivity/bluez/bluez4_4.96.bb     |    2 +-
 meta/recipes-devtools/gcc/gcc-4.6.inc              |    5 +-
 meta/recipes-devtools/gcc/gcc-4.6/pr46934.patch    |  392 ++++++++++++++++++++
 ...ser-perl_2.40.bb => libxml-parser-perl_2.41.bb} |    6 +-
 ...python-dbus_0.83.2.bb => python-dbus_0.84.0.bb} |    4 +-
 ...ative_2.0.1.bb => python-scons-native_2.1.0.bb} |    3 +-
 ...python-scons_2.0.1.bb => python-scons_2.1.0.bb} |    6 +-
 .../ghostscript/{x86_64 => x86-64}/objarch.h       |    0
 .../ghostscript/{x86_64 => x86-64}/soobjarch.h     |    0
 .../ghostscript/ghostscript_9.02.bb                |    4 +
 .../tzdata/{tzdata_2011k.bb => tzdata_2011l.bb}    |    6 +-
 ...good_0.10.28.bb => gst-plugins-good_0.10.30.bb} |    4 +-
 meta/recipes-support/gmp/gmp.inc                   |    2 +
 meta/recipes-support/gmp/gmp_4.2.1.bb              |    2 +-
 meta/recipes-support/gmp/gmp_5.0.2.bb              |    2 +-
 23 files changed, 500 insertions(+), 72 deletions(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6/pr46934.patch
 rename meta/recipes-devtools/perl/{libxml-parser-perl_2.40.bb => libxml-parser-perl_2.41.bb} (82%)
 rename meta/recipes-devtools/python/{python-dbus_0.83.2.bb => python-dbus_0.84.0.bb} (83%)
 rename meta/recipes-devtools/python/{python-scons-native_2.0.1.bb => python-scons-native_2.1.0.bb} (89%)
 rename meta/recipes-devtools/python/{python-scons_2.0.1.bb => python-scons_2.1.0.bb} (51%)
 rename meta/recipes-extended/ghostscript/ghostscript/{x86_64 => x86-64}/objarch.h (100%)
 rename meta/recipes-extended/ghostscript/ghostscript/{x86_64 => x86-64}/soobjarch.h (100%)
 rename meta/recipes-extended/tzdata/{tzdata_2011k.bb => tzdata_2011l.bb} (96%)
 rename meta/recipes-multimedia/gstreamer/{gst-plugins-good_0.10.28.bb => gst-plugins-good_0.10.30.bb} (84%)

-- 
1.7.6.2



