Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A433F60169
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Dec 2014 01:18:09 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 02 Dec 2014 17:15:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,691,1406617200"; d="scan'208";a="492641389"
Received: from smoffitt-mobl.ger.corp.intel.com (HELO
	swold-linux.amr.corp.intel.com) ([10.255.13.114])
	by orsmga003.jf.intel.com with ESMTP; 02 Dec 2014 17:14:54 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Dec 2014 17:18:04 -0800
Message-Id: <cover.1417552133.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH 0/4] Package Updates
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
X-List-Received-Date: Wed, 03 Dec 2014 01:18:11 -0000

The following changes since commit 68ddb28a68ceb59cd1ed322c16143827ce1ac712:

  distrodata_class: checkpkg make usage of latest_versionstring methods in bitbake fetcher (2014-11-28 13:59:52 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/updates
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/updates

Saul Wold (4):
  libaio: Upgrade to 3.110
  libgpg-error: Update to 1.17
  gnupg: Upgrade to 2.1.0
  valgrind: Upgrade to 3.10.0

 meta/conf/distro/include/security_flags.inc        |   1 +
 .../valgrind/remove-arm-variant-specific.patch     |  20 +-
 .../valgrind/remove-ppc-tests-failing-build.patch  |  26 +--
 .../valgrind/valgrind/valgrind-remove-rpath.patch  |  25 +++
 .../{valgrind_3.9.0.bb => valgrind_3.10.0.bb}      |   6 +-
 .../recipes-extended/libaio/libaio/00_arches.patch | 208 ++-------------------
 .../libaio/libaio/libaio-aarch64.patch             |  28 ---
 .../libaio/libaio/libaio_fix_for_mips64.patch      |  68 ++++---
 .../recipes-extended/libaio/libaio/toolchain.patch |  27 ---
 .../{libaio_0.3.109.bb => libaio_0.3.110.bb}       |   9 +-
 .../gnupg/gnupg/dirmngr-uses-libgpg-error.patch    |  16 ++
 meta/recipes-support/gnupg/gnupg/pkgconfig.patch   |  24 ++-
 .../use-pkgconfig-instead-of-npth-config.patch     |  72 +++++++
 .../gnupg/{gnupg_2.0.26.bb => gnupg_2.1.0.bb}      |  16 +-
 .../pkgconfig.patch                                |  67 ++++---
 .../{libgpg-error_1.12.bb => libgpg-error_1.17.bb} |  30 ++-
 16 files changed, 293 insertions(+), 350 deletions(-)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/valgrind-remove-rpath.patch
 rename meta/recipes-devtools/valgrind/{valgrind_3.9.0.bb => valgrind_3.10.0.bb} (94%)
 delete mode 100644 meta/recipes-extended/libaio/libaio/libaio-aarch64.patch
 delete mode 100644 meta/recipes-extended/libaio/libaio/toolchain.patch
 rename meta/recipes-extended/libaio/{libaio_0.3.109.bb => libaio_0.3.110.bb} (74%)
 create mode 100644 meta/recipes-support/gnupg/gnupg/dirmngr-uses-libgpg-error.patch
 create mode 100644 meta/recipes-support/gnupg/gnupg/use-pkgconfig-instead-of-npth-config.patch
 rename meta/recipes-support/gnupg/{gnupg_2.0.26.bb => gnupg_2.1.0.bb} (70%)
 rename meta/recipes-support/libgpg-error/{libgpg-error-1.12 => libgpg-error}/pkgconfig.patch (70%)
 rename meta/recipes-support/libgpg-error/{libgpg-error_1.12.bb => libgpg-error_1.17.bb} (40%)

-- 
1.8.3.1


