Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 8FE9177330
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 16:02:59 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 25 Feb 2016 08:02:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,498,1449561600"; d="scan'208";a="659219984"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 25 Feb 2016 08:02:21 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Feb 2016 17:59:17 +0200
Message-Id: <cover.1456415870.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH 00/19] Recipe version updates
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
X-List-Received-Date: Thu, 25 Feb 2016 16:03:00 -0000

The deadline for version updates is in a few days, so I thought I'd push
one last batch of 'easy' updates (that don't require rebasing patches
or extensive testing).

The following changes since commit 23056103c949b498c23b47579e8dd57ce78e6ed9:

  uclibc: Do not use immediate expansion operator (2016-02-22 20:42:48 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akanavin/package-version-updates
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akanavin/package-version-updates

Alexander Kanavin (19):
  epiphany: update to 3.18.4
  libfm: update to 1.2.4
  pcmanfm: update to 1.2.4
  nspr: update to 4.12
  ffmpeg: update to 3.0
  libsolv: update to 0.6.19
  ccache: update to 3.2.4
  clutter-gst-3.0: update to 3.0.16
  gnupg: update to 2.1.11
  git: update to 2.7.2
  gtk-icon-utils-native: update to 3.18.8
  gtk+3: update to 3.18.8
  libdrm: update to 2.4.67
  ncurses: update to revision 20160213
  nettle: update to 3.2
  pax-utils: update to 1.1.5
  python-git: update to 1.0.2
  vala: update to 0.30.1
  shared-mime-info: update to 1.6

 .../ncurses/{ncurses-6.0 => files}/config.cache    |   0
 .../ncurses/{ncurses-6.0 => files}/tic-hang.patch  |   0
 .../{ncurses_6.0.bb => ncurses_6.0+20160213.bb}    |   6 +-
 .../ccache/{ccache_3.2.3.bb => ccache_3.2.4.bb}    |   4 +-
 ...ion-in-recent-change-related-to-zlib-in-n.patch |  73 -----------
 meta/recipes-devtools/git/git_2.7.0.bb             |  11 --
 meta/recipes-devtools/git/git_2.7.2.bb             |  11 ++
 .../pax-utils/files/fix-configure-failure.patch    | 146 ---------------------
 .../{pax-utils_1.1.4.bb => pax-utils_1.1.5.bb}     |   7 +-
 .../{python-git_1.0.1.bb => python-git_1.0.2.bb}   |   4 +-
 .../vala/{vala_0.30.0.bb => vala_0.30.1.bb}        |   4 +-
 meta/recipes-extended/libsolv/libsolv_git.bb       |   4 +-
 .../{epiphany_3.18.3.bb => epiphany_3.18.4.bb}     |   4 +-
 .../gtk+/{gtk+3_3.18.6.bb => gtk+3_3.18.8.bb}      |   4 +-
 ...e_3.18.6.bb => gtk-icon-utils-native_3.18.8.bb} |   4 +-
 ...gst-3.0_3.0.14.bb => clutter-gst-3.0_3.0.16.bb} |   4 +-
 ...tests-kms-steal-crtc-Include-sys-select.h.patch |  96 --------------
 meta/recipes-graphics/drm/libdrm/detect.patch      |  59 ---------
 .../drm/{libdrm_2.4.66.bb => libdrm_2.4.67.bb}     |   6 +-
 .../ffmpeg/{ffmpeg_2.8.6.bb => ffmpeg_3.0.bb}      |   7 +-
 meta/recipes-sato/pcmanfm/files/no-desktop.patch   |   2 +-
 .../pcmanfm/{pcmanfm_1.2.3.bb => pcmanfm_1.2.4.bb} |   4 +-
 .../gnupg/{gnupg_2.1.10.bb => gnupg_2.1.11.bb}     |   4 +-
 .../{libfm-extra_1.2.3.bb => libfm-extra_1.2.4.bb} |   6 +-
 .../libfm/{libfm_1.2.3.bb => libfm_1.2.4.bb}       |   8 +-
 .../nettle/{nettle_3.1.1.bb => nettle_3.2.bb}      |   4 +-
 .../nspr/{nspr_4.11.bb => nspr_4.12.bb}            |   4 +-
 ...ed-mime-info_1.5.bb => shared-mime-info_1.6.bb} |   4 +-
 28 files changed, 55 insertions(+), 435 deletions(-)
 rename meta/recipes-core/ncurses/{ncurses-6.0 => files}/config.cache (100%)
 rename meta/recipes-core/ncurses/{ncurses-6.0 => files}/tic-hang.patch (100%)
 rename meta/recipes-core/ncurses/{ncurses_6.0.bb => ncurses_6.0+20160213.bb} (62%)
 rename meta/recipes-devtools/ccache/{ccache_3.2.3.bb => ccache_3.2.4.bb} (57%)
 delete mode 100644 meta/recipes-devtools/ccache/files/0001-Fix-regression-in-recent-change-related-to-zlib-in-n.patch
 delete mode 100644 meta/recipes-devtools/git/git_2.7.0.bb
 create mode 100644 meta/recipes-devtools/git/git_2.7.2.bb
 delete mode 100644 meta/recipes-devtools/pax-utils/files/fix-configure-failure.patch
 rename meta/recipes-devtools/pax-utils/{pax-utils_1.1.4.bb => pax-utils_1.1.5.bb} (82%)
 rename meta/recipes-devtools/python/{python-git_1.0.1.bb => python-git_1.0.2.bb} (87%)
 rename meta/recipes-devtools/vala/{vala_0.30.0.bb => vala_0.30.1.bb} (42%)
 rename meta/recipes-gnome/epiphany/{epiphany_3.18.3.bb => epiphany_3.18.4.bb} (84%)
 rename meta/recipes-gnome/gtk+/{gtk+3_3.18.6.bb => gtk+3_3.18.8.bb} (83%)
 rename meta/recipes-gnome/gtk+/{gtk-icon-utils-native_3.18.6.bb => gtk-icon-utils-native_3.18.8.bb} (93%)
 rename meta/recipes-graphics/clutter/{clutter-gst-3.0_3.0.14.bb => clutter-gst-3.0_3.0.16.bb} (58%)
 delete mode 100644 meta/recipes-graphics/drm/libdrm/0001-tests-kms-steal-crtc-Include-sys-select.h.patch
 delete mode 100644 meta/recipes-graphics/drm/libdrm/detect.patch
 rename meta/recipes-graphics/drm/{libdrm_2.4.66.bb => libdrm_2.4.67.bb} (87%)
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_2.8.6.bb => ffmpeg_3.0.bb} (94%)
 rename meta/recipes-sato/pcmanfm/{pcmanfm_1.2.3.bb => pcmanfm_1.2.4.bb} (90%)
 rename meta/recipes-support/gnupg/{gnupg_2.1.10.bb => gnupg_2.1.11.bb} (90%)
 rename meta/recipes-support/libfm/{libfm-extra_1.2.3.bb => libfm-extra_1.2.4.bb} (79%)
 rename meta/recipes-support/libfm/{libfm_1.2.3.bb => libfm_1.2.4.bb} (84%)
 rename meta/recipes-support/nettle/{nettle_3.1.1.bb => nettle_3.2.bb} (75%)
 rename meta/recipes-support/nspr/{nspr_4.11.bb => nspr_4.12.bb} (96%)
 rename meta/recipes-support/shared-mime-info/{shared-mime-info_1.5.bb => shared-mime-info_1.6.bb} (43%)

-- 
2.7.0


