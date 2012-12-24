Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1Tn3iG-0003pg-Eb
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Dec 2012 09:48:44 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 24 Dec 2012 00:33:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,346,1355126400"; d="scan'208";a="266440620"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by fmsmga001.fm.intel.com with ESMTP; 24 Dec 2012 00:33:52 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Dec 2012 10:34:12 +0200
Message-Id: <cover.1356337650.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
Subject: [PATCH 00/15] Package upgrades
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
X-List-Received-Date: Mon, 24 Dec 2012 08:48:45 -0000

This represents another set of package upgrades tested using core-image-sato
on all architectures.
The following changes since commit 90c0eb29f0b41e4ac2d3d17ebad7295c2ebdc02a:

  rootfs_rpm.bbclass: remove debug code (2012-12-19 21:43:55 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib cmuscax/pus
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=cmuscax/pus

Constantin Musca (15):
  ethtool: upgrade to 3.7
  freetype: upgrade to 2.4.11
  gnome-doc-utils: upgrade to 0.20.10
  gsettings-desktop-schemas: add recipe
  gthumb: remove recipe
  json-glib: upgrade to 0.15.2
  libcroco: upgrade to 0.6.8
  libfm: upgrade to 1.1.0
  libsoup-2.4: upgrade to 2.40.2
  libuser: upgrade to 0.58
  matchbox-panel-2: fix PV
  menu-cache: upgrade to 0.4.1
  metacity: upgrade to 2.34.13
  pcmanfm: upgrade to 1.1.0
  shared-mime-info: upgrade to 1.0

 .../ethtool/{ethtool_3.6.bb => ethtool_3.7.bb}     |   4 +-
 .../libuser/{libuser_0.57.1.bb => libuser_0.58.bb} |  12 +-
 .../gnome-doc-utils/sysrooted-pkg-config.patch     |  12 +-
 .../use-usr-bin-env-for-python-in-xml2po.patch     |  25 ++--
 .../gnome/gnome-doc-utils/xsltproc_nonet.patch     |  57 ++++----
 ...-utils_0.20.6.bb => gnome-doc-utils_0.20.10.bb} |  10 +-
 .../gnome/gsettings-desktop-schemas_3.7.3.bb       |  15 ++
 .../gnome/metacity/crosscompile.patch              |  62 --------
 .../metacity/remove-yelp-help-rules-var.patch      |  28 ++++
 .../{metacity_2.30.3.bb => metacity_2.34.13.bb}    |  14 +-
 meta/recipes-gnome/gthumb/files/parallel.patch     | 158 ---------------------
 meta/recipes-gnome/gthumb/gthumb_2.12.4.bb         |  27 ----
 .../{json-glib_0.14.2.bb => json-glib_0.15.2.bb}   |   8 +-
 .../no-hardcode.patch                              |   0
 .../{freetype_2.4.10.bb => freetype_2.4.11.bb}     |   4 +-
 .../{menu-cache_0.3.3.bb => menu-cache_0.4.1.bb}   |   6 +-
 .../matchbox-panel-2/matchbox-panel-2_git.bb       |   4 +-
 .../packagegroups/packagegroup-core-x11-sato.bb    |   1 -
 .../pcmanfm/files/owl-window-menu.patch            |  81 -----------
 .../files/pcmanfm_fix_for_automake_1.12.patch      |  35 -----
 .../{pcmanfm_0.9.10.bb => pcmanfm_1.1.0.bb}        |  11 +-
 meta/recipes-support/libcroco/files/croco.patch    |  15 --
 .../files/libcroco_fix_for_automake-1.12.patch     |  22 ---
 .../{libcroco_0.6.3.bb => libcroco_0.6.8.bb}       |  11 +-
 .../libfm-0.1.17/libfm_fix_for_automake-1.12.patch |  48 -------
 .../configure_fix.patch                            |   0
 .../libfm/libfm-1.1.0/fix-includedir-ln.patch      |  45 ++++++
 .../libfm/{libfm_0.1.17.bb => libfm_1.1.0.bb}      |   8 +-
 ...libsoup-2.4_2.38.1.bb => libsoup-2.4_2.40.2.bb} |   6 +-
 .../shared-mime-info/parallelmake.patch            |  11 +-
 ...d-mime-info_0.91.bb => shared-mime-info_1.0.bb} |   6 +-
 31 files changed, 188 insertions(+), 558 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool_3.6.bb => ethtool_3.7.bb} (79%)
 rename meta/recipes-extended/libuser/{libuser_0.57.1.bb => libuser_0.58.bb} (65%)
 rename meta/recipes-gnome/gnome/{gnome-doc-utils_0.20.6.bb => gnome-doc-utils_0.20.10.bb} (51%)
 create mode 100644 meta/recipes-gnome/gnome/gsettings-desktop-schemas_3.7.3.bb
 delete mode 100644 meta/recipes-gnome/gnome/metacity/crosscompile.patch
 create mode 100644 meta/recipes-gnome/gnome/metacity/remove-yelp-help-rules-var.patch
 rename meta/recipes-gnome/gnome/{metacity_2.30.3.bb => metacity_2.34.13.bb} (56%)
 delete mode 100644 meta/recipes-gnome/gthumb/files/parallel.patch
 delete mode 100644 meta/recipes-gnome/gthumb/gthumb_2.12.4.bb
 rename meta/recipes-gnome/json-glib/{json-glib_0.14.2.bb => json-glib_0.15.2.bb} (74%)
 rename meta/recipes-graphics/freetype/{freetype-2.4.10 => freetype-2.4.11}/no-hardcode.patch (100%)
 rename meta/recipes-graphics/freetype/{freetype_2.4.10.bb => freetype_2.4.11.bb} (91%)
 rename meta/recipes-graphics/menu-cache/{menu-cache_0.3.3.bb => menu-cache_0.4.1.bb} (77%)
 delete mode 100644 meta/recipes-sato/pcmanfm/files/owl-window-menu.patch
 delete mode 100644 meta/recipes-sato/pcmanfm/files/pcmanfm_fix_for_automake_1.12.patch
 rename meta/recipes-sato/pcmanfm/{pcmanfm_0.9.10.bb => pcmanfm_1.1.0.bb} (76%)
 delete mode 100644 meta/recipes-support/libcroco/files/croco.patch
 delete mode 100644 meta/recipes-support/libcroco/files/libcroco_fix_for_automake-1.12.patch
 rename meta/recipes-support/libcroco/{libcroco_0.6.3.bb => libcroco_0.6.8.bb} (57%)
 delete mode 100644 meta/recipes-support/libfm/libfm-0.1.17/libfm_fix_for_automake-1.12.patch
 rename meta/recipes-support/libfm/{libfm-0.1.17 => libfm-1.1.0}/configure_fix.patch (100%)
 create mode 100644 meta/recipes-support/libfm/libfm-1.1.0/fix-includedir-ln.patch
 rename meta/recipes-support/libfm/{libfm_0.1.17.bb => libfm_1.1.0.bb} (75%)
 rename meta/recipes-support/libsoup/{libsoup-2.4_2.38.1.bb => libsoup-2.4_2.40.2.bb} (81%)
 rename meta/recipes-support/shared-mime-info/{shared-mime-info_0.91.bb => shared-mime-info_1.0.bb} (41%)

-- 
1.7.11.7



