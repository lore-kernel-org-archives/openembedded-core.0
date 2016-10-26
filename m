Return-Path: <jussi.kukkonen@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 44F04607A4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 13:28:07 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga101.jf.intel.com with ESMTP; 26 Oct 2016 06:27:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,550,1473145200"; d="scan'208";a="23892147"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 26 Oct 2016 06:27:47 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 124D86A4006;
	Wed, 26 Oct 2016 06:27:12 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Oct 2016 16:27:34 +0300
Message-Id: <cover.1477488358.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 00/14] GTK+ upgrades
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
X-List-Received-Date: Wed, 26 Oct 2016 13:28:08 -0000

Mostly unexciting upgrades to GNOME libraries fall 2016 releases.

Thanks,
  Jussi



The following changes since commit 30d1af89ce2a2fb30f32a898ec12c9a51db57013:

  image_types: Use softer setting of WKS_FILE (2016-10-25 17:58:59 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/gtk
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/gtk

Jussi Kukkonen (14):
  pango: Upgrade 1.40.1 -> 1.40.3
  adwaita-icon-theme: Upgrade 3.20 -> 3.22.0
  gnome-themes-standard: Upgrade 3.20.2 -> 3.22.2
  glib-2.0: Upgrade 2.48.2 -> 2.50.1
  libsoup-2.4: Upgrade 2.54.1 -> 2.56.0
  atk: Upgrade 2.20.0 -> 2.22.0
  at-spi2-core: Upgrade 2.20.2 -> 2.22.0
  at-spi2-atk: Upgrade 2.20.1 -> 2.22.0
  freetype: Upgrade 2.6.5 -> 2.7
  glib-networking: Upgrade 2.48.2 -> 2.50.0
  gdk-pixbuf: 2.34.0 -> 2.36.0
  gtk-icon-utils-native: Upgrade 3.20.9 -> 3.22.1
  gtk+: Upgrade 2.24.30 -> 2.24.31
  gtk+3: Upgrade 3.20.9 -> 3.22.1

 .../glib-2.0/0002-tests-Ignore-y2k-warnings.patch  |  42 ---
 .../{glib-2.0_2.48.2.bb => glib-2.0_2.50.1.bb}     |   5 +-
 meta/recipes-core/glib-2.0/glib.inc                |   3 +-
 ...working_2.48.2.bb => glib-networking_2.50.0.bb} |   4 +-
 .../{gdk-pixbuf_2.34.0.bb => gdk-pixbuf_2.36.0.bb} |   4 +-
 ...-theme_3.20.bb => adwaita-icon-theme_3.22.0.bb} |   7 +-
 ...d_3.20.2.bb => gnome-themes-standard_3.22.2.bb} |  12 +-
 meta/recipes-gnome/gtk+/gtk+3.inc                  |   2 +-
 ...Redo-focus-handling-in-treeview-once-more.patch |  39 ---
 .../0003-Add-disable-opengl-configure-option.patch | 365 ++++++++-------------
 .../gtk+/{gtk+3_3.20.9.bb => gtk+3_3.22.1.bb}      |   5 +-
 .../gtk+/{gtk+_2.24.30.bb => gtk+_2.24.31.bb}      |   4 +-
 ...e_3.20.9.bb => gtk-icon-utils-native_3.22.1.bb} |   4 +-
 .../{freetype_2.6.5.bb => freetype_2.7.bb}         |   4 +-
 .../pango/{pango_1.40.1.bb => pango_1.40.3.bb}     |   4 +-
 ...at-spi2-atk_2.20.1.bb => at-spi2-atk_2.22.0.bb} |   4 +-
 ...-spi2-core_2.20.2.bb => at-spi2-core_2.22.0.bb} |   4 +-
 .../atk/{atk_2.20.0.bb => atk_2.22.0.bb}           |   4 +-
 ...libsoup-2.4_2.54.1.bb => libsoup-2.4_2.56.0.bb} |   4 +-
 19 files changed, 169 insertions(+), 351 deletions(-)
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0002-tests-Ignore-y2k-warnings.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.48.2.bb => glib-2.0_2.50.1.bb} (82%)
 rename meta/recipes-core/glib-networking/{glib-networking_2.48.2.bb => glib-networking_2.50.0.bb} (88%)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.34.0.bb => gdk-pixbuf_2.36.0.bb} (96%)
 rename meta/recipes-gnome/gnome/{adwaita-icon-theme_3.20.bb => adwaita-icon-theme_3.22.0.bb} (86%)
 rename meta/recipes-gnome/gnome/{gnome-themes-standard_3.20.2.bb => gnome-themes-standard_3.22.2.bb} (78%)
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+3/0001-Redo-focus-handling-in-treeview-once-more.patch
 rename meta/recipes-gnome/gtk+/{gtk+3_3.20.9.bb => gtk+3_3.22.1.bb} (78%)
 rename meta/recipes-gnome/gtk+/{gtk+_2.24.30.bb => gtk+_2.24.31.bb} (91%)
 rename meta/recipes-gnome/gtk+/{gtk-icon-utils-native_3.20.9.bb => gtk-icon-utils-native_3.22.1.bb} (93%)
 rename meta/recipes-graphics/freetype/{freetype_2.6.5.bb => freetype_2.7.bb} (93%)
 rename meta/recipes-graphics/pango/{pango_1.40.1.bb => pango_1.40.3.bb} (92%)
 rename meta/recipes-support/atk/{at-spi2-atk_2.20.1.bb => at-spi2-atk_2.22.0.bb} (81%)
 rename meta/recipes-support/atk/{at-spi2-core_2.20.2.bb => at-spi2-core_2.22.0.bb} (88%)
 rename meta/recipes-support/atk/{atk_2.20.0.bb => atk_2.22.0.bb} (79%)
 rename meta/recipes-support/libsoup/{libsoup-2.4_2.54.1.bb => libsoup-2.4_2.56.0.bb} (90%)

-- 
2.1.4


