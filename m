Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RGK9L-0005vk-NC
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Oct 2011 02:36:52 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 18 Oct 2011 17:30:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,368,1315206000"; d="scan'208";a="63952934"
Received: from nbuild2.sc.intel.com ([172.25.110.37])
	by azsmga001.ch.intel.com with ESMTP; 18 Oct 2011 17:30:59 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Oct 2011 17:30:56 -0700
Message-Id: <cover.1318984111.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.4.4
Subject: [PATCH 0/6] recipe upgrades + some fixes
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
X-List-Received-Date: Wed, 19 Oct 2011 00:36:52 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

More information in the commit log bellow.
Thanks,
Nitin

The following changes since commit b4757833c3548b5ee3a1cce58e2f059b3f63cb09:

  fontconfig: fix fix-pkgconfig.patch (2011-10-18 18:18:36 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib nitin/upgrades
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/upgrades

Nitin A Kamble (6):
  x86 tune files: set baselib for x32 tune as libx32
  gmp: also generate the libgmpcxx library
  python-scons: upgrade from 2.0.1 to 2.1.0
  python-dbus: upgrade from 0.83.2 to 0.84.0
  libxml-parser-perl: upgrade from 2.40 to 2.41
  distro-tracking: update data for some toolchain recipes

 .../conf/distro/include/distro_tracking_fields.inc |   42 ++++++++++++--------
 meta/conf/machine/include/ia32/arch-ia32.inc       |    2 +-
 meta/conf/machine/include/tune-core2.inc           |    2 +-
 ...ser-perl_2.40.bb => libxml-parser-perl_2.41.bb} |    6 +-
 ...python-dbus_0.83.2.bb => python-dbus_0.84.0.bb} |    4 +-
 ...ative_2.0.1.bb => python-scons-native_2.1.0.bb} |    3 +-
 ...python-scons_2.0.1.bb => python-scons_2.1.0.bb} |    6 +-
 meta/recipes-support/gmp/gmp.inc                   |    2 +
 meta/recipes-support/gmp/gmp_4.2.1.bb              |    2 +-
 meta/recipes-support/gmp/gmp_5.0.2.bb              |    2 +-
 10 files changed, 40 insertions(+), 31 deletions(-)
 rename meta/recipes-devtools/perl/{libxml-parser-perl_2.40.bb => libxml-parser-perl_2.41.bb} (82%)
 rename meta/recipes-devtools/python/{python-dbus_0.83.2.bb => python-dbus_0.84.0.bb} (83%)
 rename meta/recipes-devtools/python/{python-scons-native_2.0.1.bb => python-scons-native_2.1.0.bb} (89%)
 rename meta/recipes-devtools/python/{python-scons_2.0.1.bb => python-scons_2.1.0.bb} (51%)

-- 
1.7.4.4



