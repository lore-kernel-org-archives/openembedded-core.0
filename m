Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 5E9067706D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 16:11:42 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 25 Jan 2016 08:10:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,345,1449561600"; d="scan'208";a="641143874"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 25 Jan 2016 08:10:46 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Jan 2016 18:07:10 +0200
Message-Id: <cover.1453737141.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0.rc3
Subject: [PATCH 00/16] A bunch of minor updates
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
X-List-Received-Date: Mon, 25 Jan 2016 16:11:43 -0000

While Jussi Kukkonen is working on sato-gtk3 project, I thought I'd update
some of the packages assigned to him, where possibility of breakage is minimal.
So major GL-related updates are excluded.

The following changes since commit c192bd60e8c7bcb9bbdd24158bd66eb691bfee5a:

  Revert "xz: Allow to work with ASSUME_PROVIDED xz-native" (2016-01-25 12:44:13 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akanavin/package-version-updates
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akanavin/package-version-updates

Alexander Kanavin (16):
  cmake: update to 3.4.2
  at-spi2-core: update to 2.18.3
  gcr: check only even upstream versions
  webkitgtk: update to 2.10.5
  libsecret: update to 0.18.4
  freetype: update to 2.6.2
  gdk-pixbuf: update to 2.32.3
  glib-2.0: update to 2.46.2
  gtk+: update to 2.24.29
  gtk+3: update to 3.18.6
  gtk-icon-utils-native: update to 3.18.6
  libsoup-2.4: update to 2.52.2
  pixman: only check even upstream versions
  waffle: update to 1.5.2
  vala: update to 0.30.0
  rxvt-unicode: update to 9.22

 ...on-t-depend-on-a-data-file-that-s-not-bui.patch | 38 -------------
 .../{glib-2.0_2.46.1.bb => glib-2.0_2.46.2.bb}     |  5 +-
 ...cmake-native_3.3.2.bb => cmake-native_3.4.2.bb} |  0
 meta/recipes-devtools/cmake/cmake.inc              |  4 +-
 .../cmake/{cmake_3.3.2.bb => cmake_3.4.2.bb}       |  0
 .../vala/{vala_0.28.0.bb => vala_0.30.0.bb}        |  4 +-
 meta/recipes-gnome/gcr/gcr_3.18.0.bb               |  2 +-
 .../gdk-pixbuf/gdk-pixbuf/libc_memfuncs.patch      | 63 ----------------------
 .../{gdk-pixbuf_2.32.1.bb => gdk-pixbuf_2.32.3.bb} |  5 +-
 .../gtk+/{gtk+3_3.18.2.bb => gtk+3_3.18.6.bb}      |  4 +-
 .../gtk+/{gtk+_2.24.28.bb => gtk+_2.24.29.bb}      |  4 +-
 ...e_3.18.2.bb => gtk-icon-utils-native_3.18.6.bb} |  4 +-
 .../{libsecret_0.18.3.bb => libsecret_0.18.4.bb}   |  4 +-
 .../{freetype_2.6.bb => freetype_2.6.2.bb}         |  6 +--
 .../waffle/{waffle_1.5.1.bb => waffle_1.5.2.bb}    |  4 +-
 meta/recipes-graphics/xorg-lib/pixman_0.32.8.bb    |  3 ++
 meta/recipes-sato/puzzles/puzzles_git.bb           |  2 +-
 meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc    |  2 +-
 .../{rxvt-unicode_9.21.bb => rxvt-unicode_9.22.bb} |  6 +--
 .../{webkitgtk_2.10.4.bb => webkitgtk_2.10.5.bb}   |  4 +-
 ...-spi2-core_2.18.1.bb => at-spi2-core_2.18.3.bb} |  4 +-
 ...libsoup-2.4_2.52.1.bb => libsoup-2.4_2.52.2.bb} |  4 +-
 22 files changed, 36 insertions(+), 136 deletions(-)
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-Don-t-depend-on-a-data-file-that-s-not-bui.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.46.1.bb => glib-2.0_2.46.2.bb} (79%)
 rename meta/recipes-devtools/cmake/{cmake-native_3.3.2.bb => cmake-native_3.4.2.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.3.2.bb => cmake_3.4.2.bb} (100%)
 rename meta/recipes-devtools/vala/{vala_0.28.0.bb => vala_0.30.0.bb} (42%)
 delete mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/libc_memfuncs.patch
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.32.1.bb => gdk-pixbuf_2.32.3.bb} (95%)
 rename meta/recipes-gnome/gtk+/{gtk+3_3.18.2.bb => gtk+3_3.18.6.bb} (83%)
 rename meta/recipes-gnome/gtk+/{gtk+_2.24.28.bb => gtk+_2.24.29.bb} (90%)
 rename meta/recipes-gnome/gtk+/{gtk-icon-utils-native_3.18.2.bb => gtk-icon-utils-native_3.18.6.bb} (94%)
 rename meta/recipes-gnome/libsecret/{libsecret_0.18.3.bb => libsecret_0.18.4.bb} (71%)
 rename meta/recipes-graphics/freetype/{freetype_2.6.bb => freetype_2.6.2.bb} (89%)
 rename meta/recipes-graphics/waffle/{waffle_1.5.1.bb => waffle_1.5.2.bb} (91%)
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode_9.21.bb => rxvt-unicode_9.22.bb} (50%)
 rename meta/recipes-sato/webkit/{webkitgtk_2.10.4.bb => webkitgtk_2.10.5.bb} (96%)
 rename meta/recipes-support/atk/{at-spi2-core_2.18.1.bb => at-spi2-core_2.18.3.bb} (85%)
 rename meta/recipes-support/libsoup/{libsoup-2.4_2.52.1.bb => libsoup-2.4_2.52.2.bb} (86%)

-- 
2.7.0.rc3


