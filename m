Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TxzOr-0007zF-4I
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Jan 2013 13:25:53 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 23 Jan 2013 04:10:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,521,1355126400"; d="scan'208";a="275597144"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.151])
	by orsmga002.jf.intel.com with ESMTP; 23 Jan 2013 04:10:19 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Jan 2013 12:10:09 +0000
Message-Id: <cover.1358942978.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 0/5] Zypper removal
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 23 Jan 2013 12:25:55 -0000

The following changes since commit ffab86f13cafb10d8d6273b6af8cd9a3c84eae20:

  prserv: add LOCALCOUNT to AUTOINCs migration feature (2013-01-22 16:01:17 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/zypper-remove
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/zypper-remove

Paul Eggleton (5):
  zypper: remove
  libzypp: remove
  sat-solver: remove
  classes/image-swab: remove zypper-related references
  libcheck: fix HOMEPAGE

 meta/classes/image-swab.bbclass                    |    3 -
 .../arm-workaround-global-constructor.patch        |   71 ---
 meta/recipes-extended/libzypp/libzypp/close.patch  |   32 --
 .../libzypp/libzypp/config-release.patch           |   23 -
 meta/recipes-extended/libzypp/libzypp/cstdio.patch |   49 --
 .../libzypp/fix_for_compile_wth_gcc-4.6.0.patch    |   22 -
 .../libzypp/libzypp/hardcode-lib-fix.patch         |   22 -
 .../libzypp/libzypp/libzypp-compatargs.patch       |   54 ---
 .../libzypp/libzypp/libzypp-oearch.patch           |  500 --------------------
 .../libzypp/libzypp/libzypp-rpm549.patch           |   32 --
 .../mips-workaround-gcc-tribool-error.patch        |   24 -
 meta/recipes-extended/libzypp/libzypp/no-doc.patch |   33 --
 .../libzypp/libzypp/rpm5-no-rpmdbinit.patch        |   27 --
 meta/recipes-extended/libzypp/libzypp/rpm5.patch   |   32 --
 meta/recipes-extended/libzypp/libzypp_git.bb       |  160 -------
 ...fopen.c-Forward-port-to-zlib-1.2.6-gzFile.patch |   57 ---
 .../sat-solver/sat-solver/cmake.patch              |   31 --
 .../sat-solver/sat-solver/db5.patch                |   26 -
 .../sat-solver/fix_gcc-4.6.0_compile_issue.patch   |  115 -----
 .../sat-solver/sat-solver/futimes.patch            |   32 --
 .../sat-solver/sat-solver/sat-solver_core.patch    |  127 -----
 .../sat-solver/sat-solver_obsolete.patch           |   22 -
 .../sat-solver/sat-solver/sat-solver_rpm5.patch    |   69 ---
 meta/recipes-extended/sat-solver/sat-solver_git.bb |   67 ---
 meta/recipes-extended/zypper/zypper/cmake.patch    |   22 -
 .../zypper/zypper/cmake_libxml2.patch              |   28 --
 .../zypper/dso_linking_change_build_fix.patch      |   60 ---
 .../recipes-extended/zypper/zypper/gcc-scope.patch |   20 -
 .../recipes-extended/zypper/zypper/rpm5-flag.patch |   18 -
 meta/recipes-extended/zypper/zypper/rpmatch.patch  |   23 -
 meta/recipes-extended/zypper/zypper_git.bb         |   29 --
 meta/recipes-support/libcheck/libcheck_0.9.9.bb    |    2 +-
 32 files changed, 1 insertion(+), 1831 deletions(-)
 delete mode 100644 meta/recipes-extended/libzypp/libzypp/arm-workaround-global-constructor.patch
 delete mode 100644 meta/recipes-extended/libzypp/libzypp/close.patch
 delete mode 100644 meta/recipes-extended/libzypp/libzypp/config-release.patch
 delete mode 100644 meta/recipes-extended/libzypp/libzypp/cstdio.patch
 delete mode 100644 meta/recipes-extended/libzypp/libzypp/fix_for_compile_wth_gcc-4.6.0.patch
 delete mode 100644 meta/recipes-extended/libzypp/libzypp/hardcode-lib-fix.patch
 delete mode 100644 meta/recipes-extended/libzypp/libzypp/libzypp-compatargs.patch
 delete mode 100644 meta/recipes-extended/libzypp/libzypp/libzypp-oearch.patch
 delete mode 100644 meta/recipes-extended/libzypp/libzypp/libzypp-rpm549.patch
 delete mode 100644 meta/recipes-extended/libzypp/libzypp/mips-workaround-gcc-tribool-error.patch
 delete mode 100644 meta/recipes-extended/libzypp/libzypp/no-doc.patch
 delete mode 100644 meta/recipes-extended/libzypp/libzypp/rpm5-no-rpmdbinit.patch
 delete mode 100644 meta/recipes-extended/libzypp/libzypp/rpm5.patch
 delete mode 100644 meta/recipes-extended/libzypp/libzypp_git.bb
 delete mode 100644 meta/recipes-extended/sat-solver/sat-solver/0001-sat_xfopen.c-Forward-port-to-zlib-1.2.6-gzFile.patch
 delete mode 100644 meta/recipes-extended/sat-solver/sat-solver/cmake.patch
 delete mode 100644 meta/recipes-extended/sat-solver/sat-solver/db5.patch
 delete mode 100644 meta/recipes-extended/sat-solver/sat-solver/fix_gcc-4.6.0_compile_issue.patch
 delete mode 100644 meta/recipes-extended/sat-solver/sat-solver/futimes.patch
 delete mode 100644 meta/recipes-extended/sat-solver/sat-solver/sat-solver_core.patch
 delete mode 100644 meta/recipes-extended/sat-solver/sat-solver/sat-solver_obsolete.patch
 delete mode 100644 meta/recipes-extended/sat-solver/sat-solver/sat-solver_rpm5.patch
 delete mode 100644 meta/recipes-extended/sat-solver/sat-solver_git.bb
 delete mode 100644 meta/recipes-extended/zypper/zypper/cmake.patch
 delete mode 100644 meta/recipes-extended/zypper/zypper/cmake_libxml2.patch
 delete mode 100644 meta/recipes-extended/zypper/zypper/dso_linking_change_build_fix.patch
 delete mode 100644 meta/recipes-extended/zypper/zypper/gcc-scope.patch
 delete mode 100644 meta/recipes-extended/zypper/zypper/rpm5-flag.patch
 delete mode 100644 meta/recipes-extended/zypper/zypper/rpmatch.patch
 delete mode 100644 meta/recipes-extended/zypper/zypper_git.bb

-- 
1.7.10.4



