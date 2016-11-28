Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 4C75D71A7B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 13:37:22 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga102.jf.intel.com with ESMTP; 28 Nov 2016 05:37:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,564,1473145200"; d="scan'208";a="36412220"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 28 Nov 2016 05:37:23 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Nov 2016 15:34:11 +0200
Message-Id: <cover.1480333940.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.10.2
Subject: [PATCH 00/18] Recipe version updates
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
X-List-Received-Date: Mon, 28 Nov 2016 13:37:24 -0000

Various stuff that has piled up over the past few weeks.
Epiphany update requires also webkitgtk update,
so that patch is included, just in case.

The following changes since commit 12a0ee049e453b6d0d2ce2f3fa981d1b6e02bd78:

  dev-manual: Added note about RPM not dealing with post-install (2016-11-23 11:10:35 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akanavin/package-version-updates
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akanavin/package-version-updates

Alexander Kanavin (17):
  icu: update to 58.1
  sysprof: update to 3.22.2
  btrfs-tools: update to 4.8.4
  ca-certificates: upgrade to 20161102
  lighttpd: upgrade to 1.4.43
  cmake: update to 3.7.0
  gnome-desktop3: update to 3.22.2
  upstream-version-is-even.bbclass: ensure that the full version is
    matched.
  gnutls: update to 3.5.6
  gobject-introspection: update to 1.50.0
  iso-codes: update to 3.71
  msmtp: update to 1.6.6
  npth: update to 1.3
  vala: update to 0.34.3
  rng-tools: use SOURCEFORGE_MIRROR in SRC_URI
  epiphany: update to 3.22.3
  ffmpeg: update to 3.2.1

Carlos Alberto Lopez Perez (1):
  webkitgtk: update to 2.14.2

 meta/classes/upstream-version-is-even.bbclass      |  2 +-
 .../{btrfs-tools_4.8.2.bb => btrfs-tools_4.8.4.bb} |  2 +-
 ...cmake-native_3.6.2.bb => cmake-native_3.7.0.bb} |  1 +
 meta/recipes-devtools/cmake/cmake.inc              |  8 ++---
 .../cmake/{cmake_3.6.2.bb => cmake_3.7.0.bb}       |  1 +
 .../vala/{vala_0.34.2.bb => vala_0.34.3.bb}        |  4 +--
 .../{lighttpd_1.4.42.bb => lighttpd_1.4.43.bb}     |  4 +--
 .../msmtp/{msmtp_1.6.5.bb => msmtp_1.6.6.bb}       |  4 +--
 .../{epiphany_3.22.1.bb => epiphany_3.22.3.bb}     |  4 +--
 ...desktop3_3.22.1.bb => gnome-desktop3_3.22.2.bb} |  4 +--
 ...n_1.48.0.bb => gobject-introspection_1.50.0.bb} |  6 ++--
 ...ward-port-mips-arm-memory-barrier-patches.patch | 38 ----------------------
 .../files/0001-callgraph-Use-U64_TO_POINTER.patch  | 29 -----------------
 .../sysprof/{sysprof_git.bb => sysprof_3.22.2.bb}  | 12 ++-----
 .../ffmpeg/{ffmpeg_3.2.bb => ffmpeg_3.2.1.bb}      |  4 +--
 .../{webkitgtk_2.14.1.bb => webkitgtk_2.14.2.bb}   |  4 +--
 ...tes_20160104.bb => ca-certificates_20161102.bb} |  2 +-
 .../gnutls/{gnutls_3.5.5.bb => gnutls_3.5.6.bb}    |  4 +--
 meta/recipes-support/icu/icu.inc                   | 12 +++++--
 .../icu/{icu_57.1.bb => icu_58.1.bb}               |  6 ++--
 .../{iso-codes_3.70.bb => iso-codes_3.71.bb}       |  4 +--
 .../npth/{npth_1.2.bb => npth_1.3.bb}              |  4 +--
 meta/recipes-support/rng-tools/rng-tools_5.bb      |  2 +-
 23 files changed, 48 insertions(+), 113 deletions(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_4.8.2.bb => btrfs-tools_4.8.4.bb} (95%)
 rename meta/recipes-devtools/cmake/{cmake-native_3.6.2.bb => cmake-native_3.7.0.bb} (95%)
 rename meta/recipes-devtools/cmake/{cmake_3.6.2.bb => cmake_3.7.0.bb} (97%)
 rename meta/recipes-devtools/vala/{vala_0.34.2.bb => vala_0.34.3.bb} (56%)
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.42.bb => lighttpd_1.4.43.bb} (94%)
 rename meta/recipes-extended/msmtp/{msmtp_1.6.5.bb => msmtp_1.6.6.bb} (86%)
 rename meta/recipes-gnome/epiphany/{epiphany_3.22.1.bb => epiphany_3.22.3.bb} (82%)
 rename meta/recipes-gnome/gnome-desktop/{gnome-desktop3_3.22.1.bb => gnome-desktop3_3.22.2.bb} (83%)
 rename meta/recipes-gnome/gobject-introspection/{gobject-introspection_1.48.0.bb => gobject-introspection_1.50.0.bb} (97%)
 delete mode 100644 meta/recipes-kernel/sysprof/files/0001-Forward-port-mips-arm-memory-barrier-patches.patch
 delete mode 100644 meta/recipes-kernel/sysprof/files/0001-callgraph-Use-U64_TO_POINTER.patch
 rename meta/recipes-kernel/sysprof/{sysprof_git.bb => sysprof_3.22.2.bb} (71%)
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_3.2.bb => ffmpeg_3.2.1.bb} (97%)
 rename meta/recipes-sato/webkit/{webkitgtk_2.14.1.bb => webkitgtk_2.14.2.bb} (97%)
 rename meta/recipes-support/ca-certificates/{ca-certificates_20160104.bb => ca-certificates_20161102.bb} (98%)
 rename meta/recipes-support/gnutls/{gnutls_3.5.5.bb => gnutls_3.5.6.bb} (60%)
 rename meta/recipes-support/icu/{icu_57.1.bb => icu_58.1.bb} (77%)
 rename meta/recipes-support/iso-codes/{iso-codes_3.70.bb => iso-codes_3.71.bb} (76%)
 rename meta/recipes-support/npth/{npth_1.2.bb => npth_1.3.bb} (81%)

-- 
2.10.2


