Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D0CB276CF1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 12:17:46 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 28 Aug 2015 05:17:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,424,1437462000"; d="scan'208";a="550250962"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by FMSMGA003.fm.intel.com with ESMTP; 28 Aug 2015 05:17:31 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Aug 2015 15:18:49 +0300
Message-Id: <cover.1440763946.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/8] Recipe updates
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
X-List-Received-Date: Fri, 28 Aug 2015 12:17:47 -0000

This patchset contains various recipe version updates that have accumulated;
I have also deprectead upstream_tracking.inc and moved its contents to recipes.
The same thing will be done later with package_regex.inc and maintainers.inc.

Also no update reasons are added for rpm, db and e2fsprogs.

The following changes since commit 393bd7496d71eb101f21234c1233a2d18fd2c73e:

  oeqa/oetest.py: add better package search for hasPackage() (2015-08-26 08:28:06 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akanavin/package-version-updates
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akanavin/package-version-updates

Alexander Kanavin (8):
  upstream_tracking.inc: deprecate and move contents to recipes
  dpkg: update to 1.18.2
  dropbear: update to 2015.68
  libnotify: don't inherit unnecessary distro_features_check
  e2fsprogs: explain why there is no update for now
  package_regex.inc: updates to improve upstream tracking
  ccache: update to 3.2.3
  cmake: update to 3.3.1

 meta/conf/distro/include/package_regex.inc         |  8 +++-
 meta/conf/distro/include/upstream_tracking.inc     | 18 +--------
 .../recipes-core/base-passwd/base-passwd_3.5.29.bb |  2 +
 meta/recipes-core/dropbear/dropbear.inc            |  2 +-
 meta/recipes-core/dropbear/dropbear_2015.67.bb     |  4 --
 meta/recipes-core/dropbear/dropbear_2015.68.bb     |  4 ++
 meta/recipes-devtools/ccache/ccache.inc            |  4 +-
 meta/recipes-devtools/ccache/ccache_3.1.11.bb      |  7 ----
 meta/recipes-devtools/ccache/ccache_3.2.3.bb       |  6 +++
 ...cmake-native_3.2.2.bb => cmake-native_3.3.1.bb} |  3 --
 meta/recipes-devtools/cmake/cmake.inc              |  3 ++
 .../cmake/{cmake_3.2.2.bb => cmake_3.3.1.bb}       |  3 --
 meta/recipes-devtools/dpkg/dpkg.inc                |  2 +-
 ...-do_package_write_deb-we-have-trees-of-h.patch} | 37 +++++++++++-------
 ...nux-wrs-kernel-version-which-has-characte.patch | 38 ++++++++++++++++++
 ...insts-expect-D-to-be-set-when-running-in.patch} | 29 +++++++++-----
 ...-function-doesn-t-work-properly-for-all-s.patch | 31 +++++++++++++++
 ...tch => 0005-dpkg-compiler.m4-remove-Wvla.patch} | 26 +++++++------
 .../dpkg/dpkg/check_snprintf.patch                 | 34 ----------------
 .../recipes-devtools/dpkg/dpkg/check_version.patch | 28 --------------
 .../dpkg/dpkg/fix-timestamps.patch                 | 21 ----------
 meta/recipes-devtools/dpkg/dpkg/tarfix.patch       | 45 ----------------------
 .../dpkg/{dpkg_1.17.25.bb => dpkg_1.18.2.bb}       | 14 +++----
 .../recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb |  1 +
 .../python/python-pygobject_2.28.3.bb              |  3 ++
 meta/recipes-devtools/rpm/rpm_5.4.14.bb            |  2 +
 meta/recipes-devtools/unfs3/unfs3_0.9.22.r490.bb   |  5 +++
 .../recipes-extended/chkconfig/chkconfig_1.3.58.bb |  2 +
 meta/recipes-gnome/libnotify/libnotify_0.7.6.bb    |  2 +-
 .../ttf-fonts/liberation-fonts_1.04.bb             |  2 +
 meta/recipes-multimedia/tremor/tremor_20150107.bb  |  5 +++
 .../createrepo/createrepo_0.4.11.bb                |  2 +
 meta/recipes-support/db/db_6.0.30.bb               |  2 +
 33 files changed, 185 insertions(+), 210 deletions(-)
 delete mode 100644 meta/recipes-core/dropbear/dropbear_2015.67.bb
 create mode 100644 meta/recipes-core/dropbear/dropbear_2015.68.bb
 delete mode 100644 meta/recipes-devtools/ccache/ccache_3.1.11.bb
 create mode 100644 meta/recipes-devtools/ccache/ccache_3.2.3.bb
 rename meta/recipes-devtools/cmake/{cmake-native_3.2.2.bb => cmake-native_3.3.1.bb} (72%)
 rename meta/recipes-devtools/cmake/{cmake_3.2.2.bb => cmake_3.3.1.bb} (92%)
 rename meta/recipes-devtools/dpkg/dpkg/{tar-error-code.patch => 0001-When-running-do_package_write_deb-we-have-trees-of-h.patch} (60%)
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/0002-Adapt-to-linux-wrs-kernel-version-which-has-characte.patch
 rename meta/recipes-devtools/dpkg/dpkg/{preinst.patch => 0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch} (59%)
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/0004-The-lutimes-function-doesn-t-work-properly-for-all-s.patch
 rename meta/recipes-devtools/dpkg/dpkg/{no-vla-warning.patch => 0005-dpkg-compiler.m4-remove-Wvla.patch} (58%)
 delete mode 100644 meta/recipes-devtools/dpkg/dpkg/check_snprintf.patch
 delete mode 100644 meta/recipes-devtools/dpkg/dpkg/check_version.patch
 delete mode 100644 meta/recipes-devtools/dpkg/dpkg/fix-timestamps.patch
 delete mode 100644 meta/recipes-devtools/dpkg/dpkg/tarfix.patch
 rename meta/recipes-devtools/dpkg/{dpkg_1.17.25.bb => dpkg_1.18.2.bb} (49%)

-- 
2.1.4


