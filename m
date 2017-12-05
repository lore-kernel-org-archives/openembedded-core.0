Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id A285978296
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Dec 2017 12:57:14 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Dec 2017 04:57:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,364,1508828400"; d="scan'208";a="1252099868"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 05 Dec 2017 04:57:14 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Dec 2017 14:57:34 +0200
Message-Id: <cover.1512478515.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
Subject: [PATCH 00/13] A rollup of not yet merged patches
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
X-List-Received-Date: Tue, 05 Dec 2017 12:57:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I've rebased all the patches sent previously and not yet merged, and rolled
them into a single patchset. Psmisc's gettext issue in the previous update patch
should now be fixed.

The following changes since commit 4469acdf1d0338220f3fe2ecb5e079eea6fda375:

  lib/oe/utils: remove param_bool() (2017-12-02 11:25:34 +0000)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib akanavin/package-version-updates
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akanavin/package-version-updates

Alexander Kanavin (13):
  package.bbclass: replace rpm/debugedit with dwarfsrcfiles
  rpm: update to 4.14.0
  rpm: upstream version is now known
  libdnf: update to 0.11.1
  librepo: update to 1.8.1
  dnf: update to 2.7.5
  gobject-introspection: update to 1.54.1
  webkitgtk: update to 2.18.3
  psmisc: update to 23.0
  ffmpeg: update to 3.4
  devtool: add a 'latest-version' command
  devtool: provide useful defaults for version/commit when upgrading
    recipes
  devtool: add license checksum change handling to 'devtool upgrade'

 meta/classes/package.bbclass                       |  29 +++-
 ...eck-conf.releasever-instead-of-releasever.patch |  31 ----
 ...Corretly-install-tmpfiles.d-configuration.patch |   7 +-
 ...hardcode-etc-and-systemd-unit-directories.patch |   9 +-
 ...005-Do-not-prepend-installroot-to-logdir.patch} |  14 +-
 ...-set-PYTHON_INSTALL_DIR-by-running-python.patch |   9 +-
 .../dnf/0030-Run-python-scripts-using-env.patch    |  11 +-
 .../dnf/{dnf_2.6.3.bb => dnf_2.7.5.bb}             |  10 +-
 .../dwarfsrcfiles/dwarfsrcfiles.bb                 |  22 +++
 .../dwarfsrcfiles/files/dwarfsrcfiles.c            | 111 +++++++++++++
 ...ers-for-both-libsolv-and-libsolvext-libdn.patch |  11 +-
 ...-variables-with-pkg-config-cmake-s-own-mo.patch |  11 +-
 .../libdnf/{libdnf_0.9.3.bb => libdnf_0.11.1.bb}   |   2 +-
 ...ly-set-the-library-installation-directory.patch |  28 ----
 ...to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch |  49 ++++--
 ...-race-when-deleting-temporary-directories.patch |  41 -----
 ...rrect-LRO_SSLVERIFYHOST-with-CURLOPT_SSL_.patch |  40 -----
 .../librepo/{librepo_git.bb => librepo_1.8.1.bb}   |   6 +-
 ...N_ABI-when-searching-for-python-libraries.patch |  30 ----
 ...code-lib-rpm-as-the-installation-path-for.patch |  20 +--
 .../files/0001-Fix-build-with-musl-C-library.patch |  66 +++-----
 ...alue-cannot-be-reset-issue-a-notice-inste.patch |  31 ----
 ...c-remove-static-local-variables-from-buil.patch |  54 +++---
 ...ire-that-ELF-binaries-are-executable-to-b.patch |  11 +-
 ...onditional-to-access-_docdir-in-macros.in.patch |  36 ----
 .../0013-Add-a-new-option-alldeps-to-rpmdeps.patch |  17 +-
 .../rpm/{rpm_git.bb => rpm_4.14.0.bb}              |   9 +-
 ...001-Typo-in-fuser-makes-M-on-all-the-time.patch |  46 ------
 .../files/0002-Include-limits.h-for-PATH_MAX.patch |  29 ----
 meta/recipes-extended/psmisc/psmisc.inc            |   9 +
 ...-create-src-directory-before-attempting-t.patch |  30 ++++
 meta/recipes-extended/psmisc/psmisc_22.21.bb       |  12 --
 meta/recipes-extended/psmisc/psmisc_23.0.bb        |  10 ++
 ...n_1.52.1.bb => gobject-introspection_1.54.1.bb} |   7 +-
 .../ffmpeg/ffmpeg/0001-build-fix-for-mips.patch    |  44 -----
 .../ffmpeg/{ffmpeg_3.3.4.bb => ffmpeg_3.4.bb}      |   8 +-
 .../webkitgtk/0001-Fix-build-with-musl.patch       |  77 +++++++++
 ...ix-racy-parallel-build-of-WebKit2-4.0.gir.patch |  23 +--
 ...c-settings-so-that-gtkdoc-generation-work.patch |  21 +--
 ...bKitMacros-Append-to-I-and-not-to-isystem.patch | 182 ++++++++-------------
 ...ng-introspection-files-add-CMAKE_C_FLAGS-.patch |  24 +--
 .../detect-atomics-during-configure.patch          |  26 ++-
 meta/recipes-sato/webkit/webkitgtk/gcc7.patch      |  23 ---
 .../recipes-sato/webkit/webkitgtk/musl-fixes.patch |  48 ------
 .../webkit/webkitgtk/ppc-musl-fix.patch            |  26 ---
 .../{webkitgtk_2.16.6.bb => webkitgtk_2.18.3.bb}   |  13 +-
 scripts/lib/devtool/upgrade.py                     | 117 ++++++++++++-
 47 files changed, 688 insertions(+), 802 deletions(-)
 delete mode 100644 meta/recipes-devtools/dnf/dnf/0001-Check-conf.releasever-instead-of-releasever.patch
 rename meta/recipes-devtools/dnf/dnf/{0001-Do-not-prepend-installroot-to-logdir.patch => 0005-Do-not-prepend-installroot-to-logdir.patch} (67%)
 rename meta/recipes-devtools/dnf/{dnf_2.6.3.bb => dnf_2.7.5.bb} (92%)
 create mode 100644 meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb
 create mode 100644 meta/recipes-devtools/dwarfsrcfiles/files/dwarfsrcfiles.c
 rename meta/recipes-devtools/libdnf/{libdnf_0.9.3.bb => libdnf_0.11.1.bb} (95%)
 delete mode 100644 meta/recipes-devtools/librepo/librepo/0001-Correctly-set-the-library-installation-directory.patch
 delete mode 100644 meta/recipes-devtools/librepo/librepo/0003-tests-fix-a-race-when-deleting-temporary-directories.patch
 delete mode 100644 meta/recipes-devtools/librepo/librepo/0005-Fix-typo-correct-LRO_SSLVERIFYHOST-with-CURLOPT_SSL_.patch
 rename meta/recipes-devtools/librepo/{librepo_git.bb => librepo_1.8.1.bb} (68%)
 delete mode 100644 meta/recipes-devtools/rpm/files/0001-Add-PYTHON_ABI-when-searching-for-python-libraries.patch
 delete mode 100644 meta/recipes-devtools/rpm/files/0001-When-nice-value-cannot-be-reset-issue-a-notice-inste.patch
 delete mode 100644 meta/recipes-devtools/rpm/files/0012-Use-conditional-to-access-_docdir-in-macros.in.patch
 rename meta/recipes-devtools/rpm/{rpm_git.bb => rpm_4.14.0.bb} (92%)
 delete mode 100644 meta/recipes-extended/psmisc/files/0001-Typo-in-fuser-makes-M-on-all-the-time.patch
 delete mode 100644 meta/recipes-extended/psmisc/files/0002-Include-limits.h-for-PATH_MAX.patch
 create mode 100644 meta/recipes-extended/psmisc/psmisc/0001-Makefile.am-create-src-directory-before-attempting-t.patch
 delete mode 100644 meta/recipes-extended/psmisc/psmisc_22.21.bb
 create mode 100644 meta/recipes-extended/psmisc/psmisc_23.0.bb
 rename meta/recipes-gnome/gobject-introspection/{gobject-introspection_1.52.1.bb => gobject-introspection_1.54.1.bb} (97%)
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-build-fix-for-mips.patch
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_3.3.4.bb => ffmpeg_3.4.bb} (95%)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-with-musl.patch
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/gcc7.patch
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/musl-fixes.patch
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/ppc-musl-fix.patch
 rename meta/recipes-sato/webkit/{webkitgtk_2.16.6.bb => webkitgtk_2.18.3.bb} (93%)

-- 
2.15.0


