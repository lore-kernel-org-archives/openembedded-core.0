Return-Path: <jussi.kukkonen@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 01C9E730D7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 13:02:27 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP; 22 Feb 2017 05:02:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,194,1484035200"; d="scan'208";a="1101006529"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 22 Feb 2017 05:02:28 -0800
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id B20266A4080;
	Wed, 22 Feb 2017 05:02:27 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Feb 2017 15:02:21 +0200
Message-Id: <cover.1487764904.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/6] Version upgrades
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
X-List-Received-Date: Wed, 22 Feb 2017 13:02:28 -0000

A bunch of minor version upgrades.

The one that might need a closer look is gdk-pixbuf: There's now yet
another tool that's required at build time and the build system is
broken for the cross-compile case.

Please drop the earlier gdk-pixbuf (2.36.4) upgrade.

Cheers,
  Jussi

The following changes since commit e436a6398684d2872cb541f1cfb0f67b3618d15a:

  layer.conf: bump version for change in eSDK selftest behaviour (2017-02-19 09:39:03 -0800)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/m3-upgrades
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/m3-upgrades

Jussi Kukkonen (6):
  glib-2.0: Upgrade 2.50.2 -> 2.50.3
  gtk+3: Upgrade 3.22.7 -> 3.22.8
  libgudev: Upgrade 230 -> 231
  libdrm: Upgrade 2.4.74 -> 2.4.75
  menu-cache: Upgrade 1.0.1 -> 1.0.2
  gdk-pixbuf: Upgrade 2.36.1 -> 2.36.5

 .../{glib-2.0_2.50.2.bb => glib-2.0_2.50.3.bb}     |  4 +-
 ...-around-thumbnailer-cross-compile-failure.patch | 47 ++++++++++++++++++++++
 .../{gdk-pixbuf_2.36.1.bb => gdk-pixbuf_2.36.5.bb} | 12 ++++--
 .../gtk+/{gtk+3_3.22.7.bb => gtk+3_3.22.8.bb}      |  4 +-
 ...e_3.22.7.bb => gtk-icon-utils-native_3.22.8.bb} |  4 +-
 .../libgudev/{libgudev_230.bb => libgudev_231.bb}  |  6 ++-
 .../recipes-graphics/drm/libdrm/installtests.patch | 28 ++++++++-----
 .../drm/{libdrm_2.4.74.bb => libdrm_2.4.75.bb}     |  6 +--
 .../{menu-cache_1.0.1.bb => menu-cache_1.0.2.bb}   |  4 +-
 9 files changed, 89 insertions(+), 26 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.50.2.bb => glib-2.0_2.50.3.bb} (86%)
 create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Work-around-thumbnailer-cross-compile-failure.patch
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.36.1.bb => gdk-pixbuf_2.36.5.bb} (88%)
 rename meta/recipes-gnome/gtk+/{gtk+3_3.22.7.bb => gtk+3_3.22.8.bb} (84%)
 rename meta/recipes-gnome/gtk+/{gtk-icon-utils-native_3.22.7.bb => gtk-icon-utils-native_3.22.8.bb} (93%)
 rename meta/recipes-gnome/libgudev/{libgudev_230.bb => libgudev_231.bb} (65%)
 rename meta/recipes-graphics/drm/{libdrm_2.4.74.bb => libdrm_2.4.75.bb} (91%)
 rename meta/recipes-graphics/menu-cache/{menu-cache_1.0.1.bb => menu-cache_1.0.2.bb} (79%)

-- 
2.1.4


