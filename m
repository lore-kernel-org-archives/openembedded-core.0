Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SOz7J-00084I-1B
	for openembedded-core@lists.openembedded.org;
	Tue, 01 May 2012 00:30:50 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 30 Apr 2012 15:21:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="138453890"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.182])
	by orsmga002.jf.intel.com with ESMTP; 30 Apr 2012 15:21:05 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Apr 2012 15:20:44 -0700
Message-Id: <cover.1335824356.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [CONSOLIDATED PULL 00/19] Updates and Fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Apr 2012 22:30:50 -0000

The updates are starting with this contains many updates, there are
also some fixes and more warning clean-ups.

Sau!

The following changes since commit b8dc9182ed8959ce5a6aa285c3c7f78df2432ac3:

  qt-4.8.1: Fix compile failures on qemux86 (2012-04-30 10:42:07 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Andreas Oberritter (1):
  opkg-collateral: import fixes from OE-Classic

Dongxiao Xu (6):
  gst-fluendo-mpegdemux: upgrade to version 0.10.70
  telepathy-mission-control: upgrade to version 5.12.0
  telepathy-glib: upgrade to version 0.18.1
  bluez-hcidump: upgrade to version 2.4
  iptables: upgrade to version 1.4.13
  distro_tracking_fields: Change for ofono, iptables, etc

Kang Kai (1):
  alsa-tools: update to 1.0.25

Martin Jansa (6):
  xorg: add more native BBCLASSEXTENDs from meta-oe
  opkg-utils: bump SRCREV for Packages cache fix and other fixes
  glib-2.0: upgrade to 2.32.1
  gobject-introspection: upgrade to 1.32.1
  libsoup-2.4: upgrade to 2.38.1
  ofono: upgrade to 1.6

Peter Seebach (1):
  tune-sh4.inc: Fix spelling of big-endian feature set

Saul Wold (4):
  Fix a couple of missing Upstream-Status
  eglibc-package: remove /var
  libgcc: Add MLPREFIX to sanity check skip
  gcc-package-target: add libexec for plugins

 .../conf/distro/include/distro_tracking_fields.inc |   46 ++++++------
 meta/conf/machine/include/tune-sh3.inc             |    2 +-
 meta/conf/machine/include/tune-sh4.inc             |    4 +-
 meta/conf/machine/include/tune-xscale.inc          |    2 +-
 ...b-1.99-gcc-4.7.0-uninitialized-var-errors.patch |    2 +-
 .../{bluez-hcidump_2.3.bb => bluez-hcidump_2.4.bb} |    4 +-
 meta/recipes-connectivity/ofono/ofono_1.5.bb       |   14 ----
 meta/recipes-connectivity/ofono/ofono_1.6.bb       |   15 ++++
 ...thy-glib_0.17.5.bb => telepathy-glib_0.18.1.bb} |    4 +-
 ...11.0.bb => telepathy-mission-control_5.12.0.bb} |    6 +-
 meta/recipes-core/eglibc/eglibc-package.inc        |    1 +
 meta/recipes-core/eglibc/eglibc_2.15.bb            |    2 +-
 .../glib-2.0/glib-2.0/configure-libtool.patch      |   54 ++++++++++----
 .../glib-2.0/glib-2.0/g_once_init_enter.patch      |   24 -------
 .../{glib-2.0_2.30.3.bb => glib-2.0_2.32.1.bb}     |    6 +-
 meta/recipes-core/glib-2.0/glib.inc                |    2 +-
 meta/recipes-devtools/gcc/gcc-4.7.inc              |    2 +-
 meta/recipes-devtools/gcc/gcc-package-target.inc   |   11 +--
 meta/recipes-devtools/gcc/libgcc_4.7.bb            |    5 +-
 .../opkg-utils/opkg-utils/add-license-field.patch  |   39 -----------
 .../opkg-utils/arfile_header_split.patch           |   27 -------
 .../opkg-utils/index-ignore-filenotfound.patch     |   73 --------------------
 .../opkg-utils/opkg-utils/mtime-int.patch          |   30 --------
 .../opkg-utils/opkg-utils/shebang.patch            |   46 ------------
 meta/recipes-devtools/opkg-utils/opkg-utils_git.bb |    7 +--
 meta/recipes-devtools/opkg/opkg-collateral.bb      |    8 ++-
 meta/recipes-devtools/opkg/opkg-collateral/lists   |    2 +-
 .../opkg/opkg-collateral/opkg.conf.comments        |    3 +
 .../iptables/iptables/GNUmakefile.patch            |   18 -----
 .../{iptables_1.4.12.2.bb => iptables_1.4.13.bb}   |    5 +-
 ..._1.31.20.bb => gobject-introspection_1.32.1.bb} |   13 ++--
 .../xorg-lib/libxcomposite_0.4.3.bb                |    1 +
 .../recipes-graphics/xorg-lib/libxcursor_1.1.13.bb |    1 +
 meta/recipes-graphics/xorg-lib/libxdamage_1.1.3.bb |    1 +
 meta/recipes-graphics/xorg-lib/libxfixes_5.0.bb    |    2 +-
 meta/recipes-graphics/xorg-lib/libxrandr_1.3.2.bb  |    2 +-
 .../xorg-proto/compositeproto_0.4.2.bb             |    1 +
 .../xorg-proto/damageproto_1.2.1.bb                |    1 +
 meta/recipes-graphics/xorg-proto/fixesproto_5.0.bb |    2 +-
 .../xorg-proto/randrproto_1.3.2.bb                 |    2 +-
 .../autotools.patch                                |    0
 ...alsa-tools_1.0.24.1.bb => alsa-tools_1.0.25.bb} |   10 ++-
 ...0.10.69.bb => gst-fluendo-mpegdemux_0.10.70.bb} |    4 +-
 .../qt4/files/qt-mobility-no-opengl.patch          |    2 +
 ...libsoup-2.4_2.36.1.bb => libsoup-2.4_2.38.1.bb} |    8 +-
 45 files changed, 143 insertions(+), 371 deletions(-)
 rename meta/recipes-connectivity/bluez/{bluez-hcidump_2.3.bb => bluez-hcidump_2.4.bb} (83%)
 delete mode 100644 meta/recipes-connectivity/ofono/ofono_1.5.bb
 create mode 100644 meta/recipes-connectivity/ofono/ofono_1.6.bb
 rename meta/recipes-connectivity/telepathy/{telepathy-glib_0.17.5.bb => telepathy-glib_0.18.1.bb} (82%)
 rename meta/recipes-connectivity/telepathy/{telepathy-mission-control_5.11.0.bb => telepathy-mission-control_5.12.0.bb} (91%)
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/g_once_init_enter.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.30.3.bb => glib-2.0_2.32.1.bb} (91%)
 delete mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/add-license-field.patch
 delete mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/arfile_header_split.patch
 delete mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/index-ignore-filenotfound.patch
 delete mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/mtime-int.patch
 delete mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/shebang.patch
 delete mode 100644 meta/recipes-extended/iptables/iptables/GNUmakefile.patch
 rename meta/recipes-extended/iptables/{iptables_1.4.12.2.bb => iptables_1.4.13.bb} (89%)
 rename meta/recipes-gnome/gnome/{gobject-introspection_1.31.20.bb => gobject-introspection_1.32.1.bb} (52%)
 rename meta/recipes-multimedia/alsa/{alsa-tools-1.0.24.1 => alsa-tools-1.0.25}/autotools.patch (100%)
 rename meta/recipes-multimedia/alsa/{alsa-tools_1.0.24.1.bb => alsa-tools_1.0.25.bb} (73%)
 rename meta/recipes-multimedia/gstreamer/{gst-fluendo-mpegdemux_0.10.69.bb => gst-fluendo-mpegdemux_0.10.70.bb} (71%)
 rename meta/recipes-support/libsoup/{libsoup-2.4_2.36.1.bb => libsoup-2.4_2.38.1.bb} (55%)

-- 
1.7.7.6



