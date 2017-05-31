Return-Path: <jussi.kukkonen@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 0B90B719E7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 May 2017 11:23:13 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga105.fm.intel.com with ESMTP; 31 May 2017 04:23:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,423,1491289200"; d="scan'208";a="1176489750"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 31 May 2017 04:23:14 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id AC979580244;
	Wed, 31 May 2017 04:23:12 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 May 2017 14:22:47 +0300
Message-Id: <cover.1496229576.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 00/10] Version upgrades
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
X-List-Received-Date: Wed, 31 May 2017 11:23:14 -0000

Fairly uneventful version updates in and around the GNOME stack.

Thanks,
 Jussi



The following changes since commit bd063fa288b49b6e3ea77982d0ccc46610feb1ad:

  tune-mips32*.inc: use consistent comments across all three .inc files (2017-05-30 10:15:20 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/updates
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/updates

Jussi Kukkonen (10):
  glib-2.0: Upgrade 2.50.3 -> 2.52.2
  libsoup-2.4: Upgrade 2.56.0 -> 2.58.1
  atk: Upgrade 2.22 -> 2.24
  atk-spi2-core: Upgrade 2.24.0 -> 2.24.1
  at-spi2-atk: Upgrade 2.24.0 -> 2.24.1
  adwaita-icon-theme: Upgrade 3.22.0 -> 3.24.0
  libepoxy: Upgrade 1.4.1 -> 1.4.2
  librsvg: Upgrade 2.40.16 -> 2.40.17
  gtk+3: Upgrade 3.22.8 -> 3.22.15
  gnome-themes-standard: Upgrade 3.22.2 -> 3.22.3

 .../glib-2.0/glib-2.0/fix-conflicting-rand.patch   | 35 ----------------------
 .../glib-2.0/glib-2.0/glib-gettextize-dir.patch    | 24 ---------------
 .../{glib-2.0_2.50.3.bb => glib-2.0_2.52.2.bb}     |  8 ++---
 meta/recipes-core/glib-2.0/glib.inc                |  1 +
 .../0001-Don-t-use-AC_CANONICAL_HOST.patch         | 29 ++++++++++++++++++
 ...heme_3.22.0.bb => adwaita-icon-theme_3.24.0.bb} |  5 ++--
 ...d_3.22.2.bb => gnome-themes-standard_3.22.3.bb} |  4 +--
 .../gtk+/{gtk+3_3.22.8.bb => gtk+3_3.22.15.bb}     |  4 +--
 ..._3.22.8.bb => gtk-icon-utils-native_3.22.15.bb} |  4 +--
 .../{librsvg_2.40.16.bb => librsvg_2.40.17.bb}     |  7 +++--
 .../{libepoxy_1.4.1.bb => libepoxy_1.4.2.bb}       |  4 +--
 ...at-spi2-atk_2.24.0.bb => at-spi2-atk_2.24.1.bb} |  4 +--
 ...-spi2-core_2.24.0.bb => at-spi2-core_2.24.1.bb} |  4 +--
 .../atk/{atk_2.22.0.bb => atk_2.24.0.bb}           |  4 +--
 ...libsoup-2.4_2.56.0.bb => libsoup-2.4_2.58.1.bb} |  4 +--
 15 files changed, 56 insertions(+), 85 deletions(-)
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/fix-conflicting-rand.patch
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/glib-gettextize-dir.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.50.3.bb => glib-2.0_2.52.2.bb} (70%)
 create mode 100644 meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch
 rename meta/recipes-gnome/gnome/{adwaita-icon-theme_3.22.0.bb => adwaita-icon-theme_3.24.0.bb} (89%)
 rename meta/recipes-gnome/gnome/{gnome-themes-standard_3.22.2.bb => gnome-themes-standard_3.22.3.bb} (91%)
 rename meta/recipes-gnome/gtk+/{gtk+3_3.22.8.bb => gtk+3_3.22.15.bb} (84%)
 rename meta/recipes-gnome/gtk+/{gtk-icon-utils-native_3.22.8.bb => gtk-icon-utils-native_3.22.15.bb} (93%)
 rename meta/recipes-gnome/librsvg/{librsvg_2.40.16.bb => librsvg_2.40.17.bb} (84%)
 rename meta/recipes-graphics/libepoxy/{libepoxy_1.4.1.bb => libepoxy_1.4.2.bb} (81%)
 rename meta/recipes-support/atk/{at-spi2-atk_2.24.0.bb => at-spi2-atk_2.24.1.bb} (81%)
 rename meta/recipes-support/atk/{at-spi2-core_2.24.0.bb => at-spi2-core_2.24.1.bb} (88%)
 rename meta/recipes-support/atk/{atk_2.22.0.bb => atk_2.24.0.bb} (79%)
 rename meta/recipes-support/libsoup/{libsoup-2.4_2.56.0.bb => libsoup-2.4_2.58.1.bb} (89%)

-- 
2.1.4


