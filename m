Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke.yu@intel.com>) id 1QK3mL-0003bT-S0
	for openembedded-core@lists.openembedded.org;
	Wed, 11 May 2011 09:24:18 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 11 May 2011 00:21:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,350,1301900400"; 
   d="scan'208";a="765957"
Received: from kyu3-dev32.bj.intel.com (HELO localhost) ([10.238.153.187])
	by fmsmga001.fm.intel.com with ESMTP; 11 May 2011 00:21:29 -0700
Message-Id: <cover.1305098201.git.ke.yu@intel.com>
Old-Date: Wed, 11 May 2011 15:16:41 +0800
Date: Wed, 11 May 2011 15:27:46 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Yu Ke <ke.yu@intel.com>
Subject: [PATCH 0/5] recipes upgrade: xserver, sqlite3, xf86-video-intel
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
X-List-Received-Date: Wed, 11 May 2011 07:24:18 -0000

From: Yu Ke <ke.yu@intel.com>

Test with qemux86, qemuarm, and atom-pc

Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: kyu3/upgrade-05-11
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kyu3/upgrade-05-11

Thanks,
    Yu Ke <ke.yu@intel.com>
---


Yu Ke (5):
  xf86-video-intel: upgrade from 2.14.0 to 2.15.0
  sqlite: upgrade from 3.7.5 to 3.7.6.2
  xserver-xf86-dri-lite: upgrade from 1.9.3 to 1.10.1
  xserver-xf86-dri-lite_git: upgrade to 1.10.2 RC1 snapshot
  xserver-xf86-lite: upgrade to from 1.7 RC2 to 1.10.1

 .../distro/include/preferred-xorg-versions.inc     |    4 +-
 ...-intel_2.14.0.bb => xf86-video-intel_2.15.0.bb} |    6 +-
 .../cache-xkbcomp-output-for-fast-start-up.patch   |    2 +
 .../xserver-xf86-dri-lite/crosscompile.patch       |    2 +
 .../xserver-xf86-dri-lite/doublefix.patch          |   13 -
 .../xserver-xf86-dri-lite/drmfix.patch             |   13 -
 .../xserver-xf86-dri-lite/fix_macros.patch         |   21 --
 .../xserver-xf86-dri-lite/fix_macros1.patch        |    2 +
 .../fix_open_max_preprocessor_error.patch          |    2 +
 .../libdri-xinerama-symbol.patch                   |   50 ----
 .../xserver-xf86-dri-lite/macro_tweak.patch        |    2 +
 .../xserver-xf86-dri-lite/nodolt.patch             |   12 -
 .../xorg-server-disable-dri_sarea.patch            |   12 -
 .../xorg-server-enable-dri2.patch                  |   23 --
 .../xserver-1.5.0-bg-none-root.patch               |  156 ------------
 .../xserver-DRI2Swapbuffer.patch                   |  179 --------------
 .../xserver-xf86-dri-lite/xserver-boottime.patch   |   38 ---
 .../xserver-xf86-dri-lite/xserver-no-root-2.patch  |  105 --------
 .../xorg-xserver/xserver-xf86-dri-lite_1.10.1.bb   |   20 ++
 .../xorg-xserver/xserver-xf86-dri-lite_1.9.3.bb    |   22 --
 .../xorg-xserver/xserver-xf86-dri-lite_git.bb      |   21 +-
 .../xserver-xf86-lite/crosscompile.patch           |   35 ++--
 .../xorg-xserver/xserver-xf86-lite/drmfix.patch    |   13 -
 .../xserver-xf86-lite/libdri-xinerama-symbol.patch |   50 ----
 .../xserver-xf86-lite/macro_tweak.patch            |   30 +++
 .../xorg-xserver/xserver-xf86-lite/nodolt.patch    |   12 -
 ...make_sys_c_use_unaligned_access_functions.patch |  256 --------------------
 .../xorg-xserver/xserver-xf86-lite_1.10.1.bb       |   12 +
 .../xorg-xserver/xserver-xf86-lite_1.7.99.2.bb     |   12 -
 meta/recipes-support/sqlite/sqlite3.inc            |    5 -
 meta/recipes-support/sqlite/sqlite3/libtool.patch  |   25 --
 meta/recipes-support/sqlite/sqlite3_3.7.5.bb       |   10 -
 meta/recipes-support/sqlite/sqlite3_3.7.6.2.bb     |   10 +
 33 files changed, 113 insertions(+), 1062 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-video-intel_2.14.0.bb => xf86-video-intel_2.15.0.bb} (83%)
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/doublefix.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/drmfix.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/fix_macros.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/libdri-xinerama-symbol.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/nodolt.patch
 delete mode 100755 meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/xorg-server-disable-dri_sarea.patch
 delete mode 100755 meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/xorg-server-enable-dri2.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/xserver-1.5.0-bg-none-root.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/xserver-DRI2Swapbuffer.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/xserver-boottime.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/xserver-no-root-2.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_1.10.1.bb
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_1.9.3.bb
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-lite/drmfix.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-lite/libdri-xinerama-symbol.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-lite/macro_tweak.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-lite/nodolt.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-lite/revert_make_sys_c_use_unaligned_access_functions.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-lite_1.10.1.bb
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-lite_1.7.99.2.bb
 delete mode 100644 meta/recipes-support/sqlite/sqlite3/libtool.patch
 delete mode 100644 meta/recipes-support/sqlite/sqlite3_3.7.5.bb
 create mode 100644 meta/recipes-support/sqlite/sqlite3_3.7.6.2.bb



