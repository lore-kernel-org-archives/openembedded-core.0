Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 7787A6AC4B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 15:08:00 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 14 Dec 2015 07:08:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,427,1444719600"; d="scan'208";a="707063947"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 14 Dec 2015 07:07:57 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Dec 2015 17:05:12 +0200
Message-Id: <cover.1450104283.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.2
Subject: [PATCH 00/20] Recipe version updates
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
X-List-Received-Date: Mon, 14 Dec 2015 15:08:01 -0000

Here are more recipe version updates - I've been looking at recipes that
have been last touched in 2014 or earlier. Other than valgrind (which needs
a significant effort to update), they're all here.

The following changes since commit b3d6872bf169a13e572638e3809c50a868246616:

  lttng-tools: Revert wrong enforcement of Python 3.0 use (2015-12-12 23:42:55 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akanavin/package-version-updates
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akanavin/package-version-updates

Alexander Kanavin (20):
  libidn: add native and nativesdk support
  gnutls: update to 3.4.7
  puzzles: update to current commit
  cdrtools-native: update to 3.01 final
  cpio: update to 2.12
  dmidecode: update to 3.0
  libxml-simple-perl: update to 2.22
  python-numpy: update to 1.10.1
  unfs3: update to r497
  mtd-utils: update to 1.5.2
  flex: update to 2.6.0
  docbook-xsl-stylesheets: fix UPSTREAM_CHECK_REGEX
  gmp: update to 6.1.0
  kbd: update to 2.0.3
  systemtap: update to 2.9
  nfs-utils: update to 1.3.3
  powertop: update to 2.8
  babeltrace: update to 1.3.1
  procps: update to 3.3.11
  grep: update to 2.22

 .../{nfs-utils_1.3.1.bb => nfs-utils_1.3.3.bb}     |   7 +-
 ...-Only-inluclude-kernel-headers-with-glibc.patch |  29 ---
 .../kbd/{kbd_2.0.2.bb => kbd_2.0.3.bb}             |   5 +-
 ...s-native_3.01a31.bb => cdrtools-native_3.01.bb} |  10 +-
 .../{dmidecode_2.12.bb => dmidecode_3.0.bb}        |   9 +-
 .../docbook-xml/docbook-xsl-stylesheets_1.78.1.bb  |   3 +-
 ...fixes-Do-not-use-obsolete-bison-construct.patch |  80 --------
 meta/recipes-devtools/flex/files/run-ptest         |  30 +--
 meta/recipes-devtools/flex/flex.inc                |  19 +-
 ...-target-for-building-tests-without-runnin.patch |  28 +++
 meta/recipes-devtools/flex/flex_2.5.39.bb          |   9 -
 meta/recipes-devtools/flex/flex_2.6.0.bb           |  13 ++
 .../mtd/mtd-utils/0001-Fix-build-with-musl.patch   |  24 ---
 ...emove-duplicate-hashtable_iterator_value-.patch |  64 ------
 ...ibfec-use-standard-C-type-instead-of-u_lo.patch |  56 ------
 meta/recipes-devtools/mtd/mtd-utils_git.bb         |   6 +-
 ...ple-perl_2.20.bb => libxml-simple-perl_2.22.bb} |   6 +-
 ...-usr-and-so-on-for-libraries-by-default-.patch} |  33 ++-
 ...ython-numpy_1.7.0.bb => python-numpy_1.10.1.bb} |   9 +-
 .../unfs3/unfs3/fix_warnings.patch                 |  53 -----
 .../{unfs3_0.9.22.r490.bb => unfs3_0.9.22.r497.bb} |  11 +-
 .../0001-fix-testcase-of-symlink-bad-length.patch  |  57 ------
 ...-bad-length-test-for-64-bit-architectures.patch |  36 ----
 .../cpio/cpio-2.11/fix-memory-overrun.patch        | 220 --------------------
 .../fix-testcase-symlink-bad-lengths.patch         |  33 ---
 .../cpio/cpio-2.11/remove-gets.patch               |  20 --
 meta/recipes-extended/cpio/cpio-2.11/statdef.patch |  17 --
 .../0001-Fix-CVE-2015-1197.patch}                  | 103 ++++++----
 ...need_charset_alias-when-building-for-musl.patch |   0
 meta/recipes-extended/cpio/cpio_2.11.bb            |  18 --
 meta/recipes-extended/cpio/cpio_2.12.bb            |  12 ++
 meta/recipes-extended/cpio/cpio_2.8.bb             |   4 +-
 meta/recipes-extended/cpio/cpio_v2.inc             |   1 -
 .../grep/grep/grep-fix-CVE-2015-1345.patch         | 154 --------------
 .../grep/{grep_2.21.bb => grep_2.22.bb}            |   5 +-
 meta/recipes-extended/libidn/libidn_0.6.14.bb      |   3 +
 meta/recipes-extended/libidn/libidn_1.32.bb        |   3 +
 .../procps/procps/fix-configure.patch              |  19 --
 .../procps/{procps_3.3.10.bb => procps_3.3.11.bb}  |   5 +-
 .../{babeltrace_1.2.4.bb => babeltrace_1.3.1.bb}   |   5 +-
 .../powertop/{powertop_2.7.bb => powertop_2.8.bb}  |   4 +-
 .../systemtap/systemtap-uprobes_git.bb             |   2 -
 meta/recipes-kernel/systemtap/systemtap_git.inc    |   4 +-
 .../fix-compiling-failure-with-option-g-O.patch    |   9 -
 meta/recipes-sato/puzzles/puzzles_git.bb           |   8 +-
 meta/recipes-support/gmp/gmp-6.0.0/configure.patch | 222 ---------------------
 .../gmp/gmp-6.0.0/gmp-6.0.0-ppc64.patch            |  26 ---
 ...ser-provided-flags-to-the-auto-detected-.patch} |  39 ++--
 .../gmp/{gmp-6.0.0 => gmp-6.1.0}/amd64.patch       |   0
 .../{gmp-6.0.0 => gmp-6.1.0}/use-includedir.patch  |   0
 .../gmp/{gmp_6.0.0.bb => gmp_6.1.0.bb}             |  17 +-
 meta/recipes-support/gnutls/gnutls.inc             |   3 +-
 ...tch => 0001-configure.ac-fix-sed-command.patch} |  29 +--
 .../gnutls/{gnutls_3.3.17.1.bb => gnutls_3.4.7.bb} |   6 +-
 54 files changed, 260 insertions(+), 1328 deletions(-)
 rename meta/recipes-connectivity/nfs-utils/{nfs-utils_1.3.1.bb => nfs-utils_1.3.3.bb} (95%)
 delete mode 100644 meta/recipes-core/kbd/kbd/0003-Only-inluclude-kernel-headers-with-glibc.patch
 rename meta/recipes-core/kbd/{kbd_2.0.2.bb => kbd_2.0.3.bb} (83%)
 rename meta/recipes-devtools/cdrtools/{cdrtools-native_3.01a31.bb => cdrtools-native_3.01.bb} (61%)
 rename meta/recipes-devtools/dmidecode/{dmidecode_2.12.bb => dmidecode_3.0.bb} (59%)
 delete mode 100644 meta/recipes-devtools/flex/files/0001-bison-test-fixes-Do-not-use-obsolete-bison-construct.patch
 create mode 100644 meta/recipes-devtools/flex/flex/0001-tests-add-a-target-for-building-tests-without-runnin.patch
 delete mode 100644 meta/recipes-devtools/flex/flex_2.5.39.bb
 create mode 100644 meta/recipes-devtools/flex/flex_2.6.0.bb
 delete mode 100644 meta/recipes-devtools/mtd/mtd-utils/0001-hashtable-Remove-duplicate-hashtable_iterator_value-.patch
 delete mode 100644 meta/recipes-devtools/mtd/mtd-utils/0001-mtd-utils-libfec-use-standard-C-type-instead-of-u_lo.patch
 rename meta/recipes-devtools/perl/{libxml-simple-perl_2.20.bb => libxml-simple-perl_2.22.bb} (78%)
 rename meta/recipes-devtools/python/python-numpy/{no-host-paths.patch => 0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch} (69%)
 rename meta/recipes-devtools/python/{python-numpy_1.7.0.bb => python-numpy_1.10.1.bb} (88%)
 delete mode 100644 meta/recipes-devtools/unfs3/unfs3/fix_warnings.patch
 rename meta/recipes-devtools/unfs3/{unfs3_0.9.22.r490.bb => unfs3_0.9.22.r497.bb} (88%)
 delete mode 100644 meta/recipes-extended/cpio/cpio-2.11/0001-fix-testcase-of-symlink-bad-length.patch
 delete mode 100644 meta/recipes-extended/cpio/cpio-2.11/Fix-symlink-bad-length-test-for-64-bit-architectures.patch
 delete mode 100644 meta/recipes-extended/cpio/cpio-2.11/fix-memory-overrun.patch
 delete mode 100644 meta/recipes-extended/cpio/cpio-2.11/fix-testcase-symlink-bad-lengths.patch
 delete mode 100644 meta/recipes-extended/cpio/cpio-2.11/remove-gets.patch
 delete mode 100644 meta/recipes-extended/cpio/cpio-2.11/statdef.patch
 rename meta/recipes-extended/cpio/{cpio-2.11/cpio-CVE-2015-1197.patch => cpio-2.12/0001-Fix-CVE-2015-1197.patch} (57%)
 rename meta/recipes-extended/cpio/{cpio-2.11 => cpio-2.12}/0001-Unset-need_charset_alias-when-building-for-musl.patch (100%)
 delete mode 100644 meta/recipes-extended/cpio/cpio_2.11.bb
 create mode 100644 meta/recipes-extended/cpio/cpio_2.12.bb
 delete mode 100644 meta/recipes-extended/grep/grep/grep-fix-CVE-2015-1345.patch
 rename meta/recipes-extended/grep/{grep_2.21.bb => grep_2.22.bb} (85%)
 delete mode 100644 meta/recipes-extended/procps/procps/fix-configure.patch
 rename meta/recipes-extended/procps/{procps_3.3.10.bb => procps_3.3.11.bb} (93%)
 rename meta/recipes-kernel/lttng/{babeltrace_1.2.4.bb => babeltrace_1.3.1.bb} (90%)
 rename meta/recipes-kernel/powertop/{powertop_2.7.bb => powertop_2.8.bb} (88%)
 delete mode 100644 meta/recipes-support/gmp/gmp-6.0.0/configure.patch
 delete mode 100644 meta/recipes-support/gmp/gmp-6.0.0/gmp-6.0.0-ppc64.patch
 rename meta/recipes-support/gmp/{gmp-6.0.0/append_user_provided_flags.patch => gmp-6.1.0/0001-Append-the-user-provided-flags-to-the-auto-detected-.patch} (50%)
 rename meta/recipes-support/gmp/{gmp-6.0.0 => gmp-6.1.0}/amd64.patch (100%)
 rename meta/recipes-support/gmp/{gmp-6.0.0 => gmp-6.1.0}/use-includedir.patch (100%)
 rename meta/recipes-support/gmp/{gmp_6.0.0.bb => gmp_6.1.0.bb} (58%)
 rename meta/recipes-support/gnutls/gnutls/{configure.ac-fix-sed-command.patch => 0001-configure.ac-fix-sed-command.patch} (40%)
 rename meta/recipes-support/gnutls/{gnutls_3.3.17.1.bb => gnutls_3.4.7.bb} (42%)

-- 
2.6.2


