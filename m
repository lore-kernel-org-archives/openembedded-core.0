Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 1618671C2F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Nov 2016 15:27:49 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 01 Nov 2016 08:27:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,580,1473145200"; d="scan'208";a="780876132"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 01 Nov 2016 08:27:49 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Nov 2016 17:25:07 +0200
Message-Id: <cover.1478013701.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.10.1
Subject: [PATCH 00/13] Version updates, and various fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Nov 2016 15:27:50 -0000

Here's another batch of version updates that didn't make it into
the previous patchset, and also a few dependency fixes and
other small improvements.

The following changes since commit c3d2df883a9d6d5036277114339673656d89a728:

  oeqa/selftest/kernel.py: Add new file destined for kernel related tests (2016-11-01 10:05:46 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akanavin/package-version-updates
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akanavin/package-version-updates

Alexander Kanavin (13):
  btrfs-tools: update to 4.8.2
  ffmpeg: update to 3.2
  gnome-desktop3: fix dependencies
  nspr: update to 4.13.1
  vala: update to 0.34.2
  webkitgtk: remove lib_package inherit as executables are now installed
    in libexecdir
  epiphany: remove unnecessary libwnck3 dependency
  libwnck3: remove the recipe
  icu: update to 58.1
  libarchive: update to 3.2.2
  valgrind: update to 3.12.0
  rt-tests: fix the recipe version to match upstream
  boost: fix upstream version check

 .../{btrfs-tools_4.8.1.bb => btrfs-tools_4.8.2.bb} |  4 +-
 .../vala/{vala_0.34.1.bb => vala_0.34.2.bb}        |  4 +-
 .../valgrind/valgrind/11_mips-link-tool.patch      | 37 -------------
 .../valgrind/valgrind/gcc5-port.patch              | 64 ----------------------
 .../{valgrind_3.11.0.bb => valgrind_3.12.0.bb}     |  6 +-
 .../{libarchive_3.2.1.bb => libarchive_3.2.2.bb}   |  4 +-
 meta/recipes-gnome/epiphany/epiphany_3.22.1.bb     |  4 +-
 .../gnome-desktop/gnome-desktop3_3.22.1.bb         |  2 +-
 meta/recipes-gnome/libwnck/libwnck3_3.20.1.bb      | 19 -------
 .../ffmpeg/{ffmpeg_3.1.4.bb => ffmpeg_3.2.bb}      |  7 +--
 .../{hwlatdetect_2.0.bb => hwlatdetect_1.1.bb}     |  0
 meta/recipes-rt/rt-tests/rt-tests.inc              |  5 +-
 .../rt-tests/{rt-tests_2.0.bb => rt-tests_1.1.bb}  |  0
 meta/recipes-sato/webkit/webkitgtk_2.14.1.bb       |  2 +-
 meta/recipes-support/boost/boost-1.62.0.inc        |  2 +
 meta/recipes-support/icu/icu.inc                   |  4 +-
 .../icu/{icu_57.1.bb => icu_58.1.bb}               |  6 +-
 .../nspr/{nspr_4.13.bb => nspr_4.13.1.bb}          |  4 +-
 18 files changed, 25 insertions(+), 149 deletions(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_4.8.1.bb => btrfs-tools_4.8.2.bb} (90%)
 rename meta/recipes-devtools/vala/{vala_0.34.1.bb => vala_0.34.2.bb} (56%)
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/11_mips-link-tool.patch
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/gcc5-port.patch
 rename meta/recipes-devtools/valgrind/{valgrind_3.11.0.bb => valgrind_3.12.0.bb} (95%)
 rename meta/recipes-extended/libarchive/{libarchive_3.2.1.bb => libarchive_3.2.2.bb} (94%)
 delete mode 100644 meta/recipes-gnome/libwnck/libwnck3_3.20.1.bb
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_3.1.4.bb => ffmpeg_3.2.bb} (95%)
 rename meta/recipes-rt/rt-tests/{hwlatdetect_2.0.bb => hwlatdetect_1.1.bb} (100%)
 rename meta/recipes-rt/rt-tests/{rt-tests_2.0.bb => rt-tests_1.1.bb} (100%)
 rename meta/recipes-support/icu/{icu_57.1.bb => icu_58.1.bb} (77%)
 rename meta/recipes-support/nspr/{nspr_4.13.bb => nspr_4.13.1.bb} (96%)

-- 
2.10.1


