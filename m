Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 25EEF6067D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 14:59:55 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 08 Jan 2016 06:59:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,539,1444719600"; d="scan'208";a="889143721"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 08 Jan 2016 06:59:55 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jan 2016 16:57:03 +0200
Message-Id: <cover.1452264916.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.4
Subject: [PATCH 0/3] Valgrind: update to 3.11.0
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
X-List-Received-Date: Fri, 08 Jan 2016 14:59:56 -0000

This version of the patchset fixes the ppc32 build failures, and adds
Andre McCurdy's fixes for arm.

The following changes since commit 0f3ad7c77aa0f8bb7641af1886e1420cdfa8419f:

  scripts/yocto-layer: Avoids duplication of "meta-" prefix (2016-01-07 13:52:21 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akanavin/package-version-updates
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akanavin/package-version-updates

Alexander Kanavin (1):
  valgrind: update to 3.11.0

Andre McCurdy (2):
  valgrind: don't restrict to armv7a
  valgrind: include aarch64 in COMPATIBLE_HOST

 ...s-that-fail-to-build-on-some-PPC32-config.patch |  51 +++++
 ...able-rt_sigpending-syscall-on-ppc64-linux.patch |  35 ---
 .../valgrind/valgrind/0002-remove-rpath.patch      |  35 +++
 .../valgrind/0004-Fix-out-of-tree-builds.patch     | 175 +++++++++++++++
 ...vg_test-wrapper-to-support-PTEST-formats.patch} |  87 ++++----
 .../valgrind/enable.building.on.4.x.kernel.patch   |  37 ----
 .../valgrind/valgrind/force-nostabs.patch          |  42 ----
 .../recipes-devtools/valgrind/valgrind/glibc.patch |  44 ----
 .../pass-maltivec-only-if-it-supported.patch       |  68 ------
 .../valgrind/remove-ppc-tests-failing-build.patch  |  75 -------
 .../valgrind/valgrind/sepbuildfix.patch            | 235 ---------------------
 .../{valgrind_3.10.1.bb => valgrind_3.11.0.bb}     |  41 ++--
 12 files changed, 329 insertions(+), 596 deletions(-)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-Remove-tests-that-fail-to-build-on-some-PPC32-config.patch
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-valgrind-Enable-rt_sigpending-syscall-on-ppc64-linux.patch
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0002-remove-rpath.patch
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0004-Fix-out-of-tree-builds.patch
 rename meta/recipes-devtools/valgrind/valgrind/{add-ptest.patch => 0005-Modify-vg_test-wrapper-to-support-PTEST-formats.patch} (80%)
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/enable.building.on.4.x.kernel.patch
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/force-nostabs.patch
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/glibc.patch
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/pass-maltivec-only-if-it-supported.patch
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/remove-ppc-tests-failing-build.patch
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/sepbuildfix.patch
 rename meta/recipes-devtools/valgrind/{valgrind_3.10.1.bb => valgrind_3.11.0.bb} (72%)

-- 
2.6.4


