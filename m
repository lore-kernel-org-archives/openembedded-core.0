Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 700A871B25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2016 15:09:09 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga101.jf.intel.com with ESMTP; 19 Oct 2016 08:09:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,514,1473145200"; d="scan'208";a="21266832"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 19 Oct 2016 08:09:09 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Oct 2016 18:06:35 +0300
Message-Id: <cover.1476888929.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH 00/19] Recipe updates and version check fixes
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
X-List-Received-Date: Wed, 19 Oct 2016 15:09:09 -0000

This is a bunch of assorted version updates, and upstream check fixes. I have also
re-enabled gobject introspection on musl (seems to work now). Some version updates
are held off by the need to update glib/gtk first, or are more involved (openssl),
they will come later.

The following changes since commit 9c04beb9adf5ed05b4fe89322bfa4dd60296de2b:

  ref-manual: Removed RM_OLD_IMAGE variable description. (2016-10-19 12:56:33 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akanavin/package-version-updates
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akanavin/package-version-updates

Alexander Kanavin (19):
  musl: enable gobject introspection
  mklibs-native: fix upstream version check
  cve-check-tool: fix upstream version check
  pigz: fix upstream version check
  boost: update to 1.62.0
  btrfs-tools: update to 4.8.1
  cmake: update to 3.6.2
  dtc: update to 1.4.2
  ffmpeg: update to 3.1.4
  gnome-desktop3: update to 3.22.1
  gnutls: update to 3.5.5
  libksba: update to 1.3.5
  lighttpd: update to 1.4.42
  mpg123: update to 1.23.8
  nspr: update to 4.13
  nss: update to 3.27.1
  vala: update to 0.34.1
  webkitgtk: update to 2.14.1
  epiphany: update to 3.22.1

 meta/conf/distro/include/tclibc-musl.inc           |   4 -
 .../btrfs-tools/btrfs-tools/fix-parallel.patch     |  32 ---
 .../{btrfs-tools_4.7.1.bb => btrfs-tools_4.8.1.bb} |   3 +-
 ...cmake-native_3.6.1.bb => cmake-native_3.6.2.bb} |   0
 meta/recipes-devtools/cmake/cmake.inc              |   4 +-
 .../cmake/{cmake_3.6.1.bb => cmake_3.6.2.bb}       |   0
 .../cve-check-tool/cve-check-tool_5.6.4.bb         |   2 +
 .../mklibs/mklibs-native_0.1.41.bb                 |   2 +
 meta/recipes-devtools/vala/vala.inc                |   2 +-
 .../vala/{vala_0.32.1.bb => vala_0.34.1.bb}        |   4 +-
 .../{lighttpd_1.4.41.bb => lighttpd_1.4.42.bb}     |   4 +-
 meta/recipes-extended/pigz/pigz.inc                |   2 -
 meta/recipes-extended/pigz/pigz_2.3.3.bb           |   2 +-
 .../{epiphany_3.20.3.bb => epiphany_3.22.1.bb}     |   6 +-
 ...desktop3_3.20.2.bb => gnome-desktop3_3.22.1.bb} |   4 +-
 .../dtc/{dtc_git.bb => dtc_1.4.2.bb}               |   3 +-
 .../ffmpeg/{ffmpeg_3.1.3.bb => ffmpeg_3.1.4.bb}    |   4 +-
 .../mpg123/{mpg123_1.23.6.bb => mpg123_1.23.8.bb}  |   4 +-
 ...bKitMacros-Append-to-I-and-not-to-isystem.patch | 272 +++++++++------------
 .../{webkitgtk_2.12.5.bb => webkitgtk_2.14.1.bb}   |  26 +-
 ...bjam-native_1.61.0.bb => bjam-native_1.62.0.bb} |   0
 .../boost/{boost-1.61.0.inc => boost-1.62.0.inc}   |   4 +-
 ...ips-assembly-doesn-t-compile-in-mips16e-m.patch |  60 -----
 .../boost/{boost_1.61.0.bb => boost_1.62.0.bb}     |   1 -
 ...001-Use-correct-include-dir-with-minitasn.patch |  31 ---
 .../gnutls/gnutls/CVE-2016-7444.patch              |  35 ---
 meta/recipes-support/gnutls/gnutls_3.5.3.bb        |  13 -
 meta/recipes-support/gnutls/gnutls_3.5.5.bb        |   9 +
 .../libksba/{libksba_1.3.4.bb => libksba_1.3.5.bb} |   4 +-
 .../nspr/{nspr_4.12.bb => nspr_4.13.bb}            |   4 +-
 .../recipes-support/nss/nss/pqg.c-ULL_addend.patch |   8 +-
 .../nss/{nss_3.25.bb => nss_3.27.1.bb}             |   6 +-
 32 files changed, 173 insertions(+), 382 deletions(-)
 delete mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/fix-parallel.patch
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_4.7.1.bb => btrfs-tools_4.8.1.bb} (91%)
 rename meta/recipes-devtools/cmake/{cmake-native_3.6.1.bb => cmake-native_3.6.2.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.6.1.bb => cmake_3.6.2.bb} (100%)
 rename meta/recipes-devtools/vala/{vala_0.32.1.bb => vala_0.34.1.bb} (56%)
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.41.bb => lighttpd_1.4.42.bb} (94%)
 rename meta/recipes-gnome/epiphany/{epiphany_3.20.3.bb => epiphany_3.22.1.bb} (77%)
 rename meta/recipes-gnome/gnome-desktop/{gnome-desktop3_3.20.2.bb => gnome-desktop3_3.22.1.bb} (83%)
 rename meta/recipes-kernel/dtc/{dtc_git.bb => dtc_1.4.2.bb} (75%)
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_3.1.3.bb => ffmpeg_3.1.4.bb} (97%)
 rename meta/recipes-multimedia/mpg123/{mpg123_1.23.6.bb => mpg123_1.23.8.bb} (95%)
 rename meta/recipes-sato/webkit/{webkitgtk_2.12.5.bb => webkitgtk_2.14.1.bb} (85%)
 rename meta/recipes-support/boost/{bjam-native_1.61.0.bb => bjam-native_1.62.0.bb} (100%)
 rename meta/recipes-support/boost/{boost-1.61.0.inc => boost-1.62.0.inc} (83%)
 delete mode 100644 meta/recipes-support/boost/boost/0003-smart_ptr-mips-assembly-doesn-t-compile-in-mips16e-m.patch
 rename meta/recipes-support/boost/{boost_1.61.0.bb => boost_1.62.0.bb} (85%)
 delete mode 100644 meta/recipes-support/gnutls/gnutls/0001-Use-correct-include-dir-with-minitasn.patch
 delete mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2016-7444.patch
 delete mode 100644 meta/recipes-support/gnutls/gnutls_3.5.3.bb
 create mode 100644 meta/recipes-support/gnutls/gnutls_3.5.5.bb
 rename meta/recipes-support/libksba/{libksba_1.3.4.bb => libksba_1.3.5.bb} (86%)
 rename meta/recipes-support/nspr/{nspr_4.12.bb => nspr_4.13.bb} (96%)
 rename meta/recipes-support/nss/{nss_3.25.bb => nss_3.27.1.bb} (97%)

-- 
2.9.3


