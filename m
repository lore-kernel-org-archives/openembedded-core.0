Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1ToGq9-0005zm-99
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Dec 2012 18:01:54 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 27 Dec 2012 08:46:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,363,1355126400"; d="scan'208";a="239513244"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.22])
	by orsmga001.jf.intel.com with ESMTP; 27 Dec 2012 08:46:57 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Dec 2012 08:46:57 -0800
Message-Id: <cover.1356626500.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
Subject: [CONSOLIDATED PULL 00/26] Next batch, mostly updates
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
X-List-Received-Date: Thu, 27 Dec 2012 17:01:55 -0000

Richard,

Here is another batch of patches, mostly straightforward updates.

I would like a little more review of Constantin's multilib allarch
patch, it seems OK to me, but want your eyes on it also. It built OK 
on the AB.  I will be trying a world build with his next patch set.

Thanks
	Sau!


The following changes since commit 69bbce0176183b0dc14eda21e4f6b601443060f0:

  libpng: fix packaging (2012-12-25 14:00:22 -0800)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Constantin Musca (17):
  ethtool: upgrade to 3.7
  freetype: upgrade to 2.4.11
  gnome-doc-utils: upgrade to 0.20.10
  gsettings-desktop-schemas: add recipe
  gthumb: remove recipe
  json-glib: upgrade to 0.15.2
  libcroco: upgrade to 0.6.8
  libsoup-2.4: upgrade to 2.40.2
  libuser: upgrade to 0.58
  matchbox-panel-2: fix PV
  menu-cache: upgrade to 0.4.1
  metacity: upgrade to 2.34.13
  shared-mime-info: upgrade to 1.0
  libcroco: fix license
  multilib: fix allarch/kernel/module-base multilib issues
  xserver-xorg: enable multilib
  xorg-driver: enable multilib

Marko Kati? (1):
  udev: Remove deprecated binaries from packaging

Marko Lindqvist (2):
  curl: update to upstream version 7.28.1
  sqlite: update to upstream version 3.7.15.1

Martin Jansa (2):
  xf86-video-omap: skip package if opengl isn't in DISTRO_FEATURES
  webkit-gtk: fix build with bison-2.6+

Noor Ahsan (1):
  cairo: Adds libxext in X11DEPENDS.

Roy.Li (1):
  replace portmap with rpcbind.

Saul Wold (1):
  iproute2: DEPENDS on iptables

Ting Liu (1):
  eglibc: run libm-err-tab.pl with specific dirs in ${S}

 meta/classes/multilib.bbclass                      |   3 +
 meta/classes/multilib_global.bbclass               |   5 +-
 meta/classes/package.bbclass                       |  30 ++
 meta/classes/sanity.bbclass                        |   4 +
 meta/conf/multilib.conf                            |   2 +
 meta/recipes-connectivity/iproute2/iproute2.inc    |   2 +-
 .../nfs-utils/nfs-utils_1.2.3.bb                   |   2 +-
 ...n-libm-err-tab.pl-with-specific-dirs-in-S.patch |  36 ++
 meta/recipes-core/eglibc/eglibc_2.16.bb            |   3 +-
 .../initscripts/initscripts-1.0/mountnfs.sh        |  16 +-
 .../packagegroups/packagegroup-base.bb             |   2 +-
 meta/recipes-core/udev/udev.inc                    |  14 +-
 .../ethtool/{ethtool_3.6.bb => ethtool_3.7.bb}     |   4 +-
 .../libuser/{libuser_0.57.1.bb => libuser_0.58.bb} |  12 +-
 .../gnome-doc-utils/sysrooted-pkg-config.patch     |  12 +-
 .../use-usr-bin-env-for-python-in-xml2po.patch     |  25 +-
 .../gnome/gnome-doc-utils/xsltproc_nonet.patch     |  57 +--
 ...-utils_0.20.6.bb => gnome-doc-utils_0.20.10.bb} |  10 +-
 .../gnome/gsettings-desktop-schemas_3.7.3.bb       |  15 +
 .../gnome/metacity/crosscompile.patch              |  62 ---
 .../metacity/remove-yelp-help-rules-var.patch      |  28 ++
 .../{metacity_2.30.3.bb => metacity_2.34.13.bb}    |  14 +-
 meta/recipes-gnome/gthumb/files/parallel.patch     | 158 ------
 meta/recipes-gnome/gthumb/gthumb_2.12.4.bb         |  27 -
 .../{json-glib_0.14.2.bb => json-glib_0.15.2.bb}   |   8 +-
 meta/recipes-graphics/cairo/cairo.inc              |   2 +-
 meta/recipes-graphics/cairo/cairo_1.12.8.bb        |   2 +-
 .../no-hardcode.patch                              |   0
 .../{freetype_2.4.10.bb => freetype_2.4.11.bb}     |   4 +-
 .../{menu-cache_0.3.3.bb => menu-cache_0.4.1.bb}   |   6 +-
 .../xorg-driver/xf86-video-omap_git.bb             |   6 +
 .../xorg-driver/xorg-driver-common.inc             |   5 +-
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |   5 +-
 .../matchbox-panel-2/matchbox-panel-2_git.bb       |   4 +-
 .../packagegroups/packagegroup-core-x11-sato.bb    |   1 -
 meta/recipes-sato/webkit/files/bison-2.6.patch     | 558 +++++++++++++++++++++
 meta/recipes-sato/webkit/webkit-gtk_1.8.2.bb       |   3 +-
 meta/recipes-support/curl/curl/pkgconfig_fix.patch |  45 +-
 .../curl/{curl_7.26.0.bb => curl_7.28.1.bb}        |   4 +-
 meta/recipes-support/libcroco/files/croco.patch    |  15 -
 .../files/libcroco_fix_for_automake-1.12.patch     |  22 -
 .../{libcroco_0.6.3.bb => libcroco_0.6.8.bb}       |  11 +-
 ...libsoup-2.4_2.38.1.bb => libsoup-2.4_2.40.2.bb} |   6 +-
 .../shared-mime-info/parallelmake.patch            |  11 +-
 ...d-mime-info_0.91.bb => shared-mime-info_1.0.bb} |   6 +-
 meta/recipes-support/sqlite/sqlite3_3.7.15.0.bb    |  11 -
 meta/recipes-support/sqlite/sqlite3_3.7.15.1.bb    |  13 +
 47 files changed, 850 insertions(+), 441 deletions(-)
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/0001-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch
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
 create mode 100644 meta/recipes-sato/webkit/files/bison-2.6.patch
 rename meta/recipes-support/curl/{curl_7.26.0.bb => curl_7.28.1.bb} (93%)
 delete mode 100644 meta/recipes-support/libcroco/files/croco.patch
 delete mode 100644 meta/recipes-support/libcroco/files/libcroco_fix_for_automake-1.12.patch
 rename meta/recipes-support/libcroco/{libcroco_0.6.3.bb => libcroco_0.6.8.bb} (57%)
 rename meta/recipes-support/libsoup/{libsoup-2.4_2.38.1.bb => libsoup-2.4_2.40.2.bb} (81%)
 rename meta/recipes-support/shared-mime-info/{shared-mime-info_0.91.bb => shared-mime-info_1.0.bb} (41%)
 delete mode 100644 meta/recipes-support/sqlite/sqlite3_3.7.15.0.bb
 create mode 100644 meta/recipes-support/sqlite/sqlite3_3.7.15.1.bb

-- 
1.8.0.2



