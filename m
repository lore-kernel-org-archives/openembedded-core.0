Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1U6GHk-0001Ok-PJ
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Feb 2013 09:04:51 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 14 Feb 2013 23:48:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,671,1355126400"; d="scan'208";a="291549712"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.50])
	by fmsmga002.fm.intel.com with ESMTP; 14 Feb 2013 23:48:39 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Feb 2013 23:48:39 -0800
Message-Id: <cover.1360914386.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
Subject: [CONSOLIDATED PULL 00/22] Package Updates & Fixes
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
X-List-Received-Date: Fri, 15 Feb 2013 08:04:52 -0000

Richard,

This is mostly a set of package updates with a couple of fixes 
fro systemd from Khem and Ross.

Please review Peter's rename patch.

I have build and booted sato locally with most of the udpated pacakges,
the Auotbuilder is currently running with Master under Test.

Thanks
	Sau!

The following changes since commit 6c6568e47d6b3b0edaba569bfa4e38f9d72b5122:

  tzcode/tzdata: Update to 2012j (2013-02-14 23:17:18 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Constantin Musca (1):
  qemu: upgrade to 1.3.1

Cristian Iorga (1):
  alsa-lib: upgrade to 1.0.26

Cristiana Voicu (1):
  sanity.bbclass: when bblayers.conf is updated, it invokes a reparse

Franklin S. Cooper Jr (1):
  scripts/bitbake: Remove all instances of paths to a layer's scripts
    directory.

Khem Raj (1):
  systemd.bbclass: Dont use libdir and base_libdir for units

Laurentiu Palcu (7):
  xf86-video-intel: upgrade to 2.21.0
  xf86-input-vmmouse: upgrade to 13.0.0
  libdrm: upgrade to 2.4.42
  xkeyboard-config: upgrade to 2.8
  xf86-input-synaptics: upgrade to 1.6.3
  xf86-video-vmware: upgrade to 13.0.0
  xev: upgrade to 1.2.1

Marko Lindqvist (4):
  webkit-gtk: update to upstream version 1.8.3
  gtk+: update to upstream version 2.24.15
  harfbuzz: update to upstream version 0.9.12
  libpng: update to upstream version 1.5.14

Peter Seebach (1):
  libc-common.bbclass: rename ALL the packages

Ross Burton (4):
  systemd: add udev-extraconf and USB/PCI IDs to RRECOMMENDS
  package_ipk: check CONFFILES exist before adding them to metadata
  xserver-xf86-config: don't ship empty xorg.conf
  xserver-xf86-config: empty generic xorg.conf

Saul Wold (1):
  gnupg: fix CVE-2012-6085

 meta/classes/libc-common.bbclass                   |   19 +-
 meta/classes/package_ipk.bbclass                   |    3 +-
 meta/classes/sanity.bbclass                        |   18 +-
 meta/classes/systemd.bbclass                       |   13 +-
 meta/recipes-core/systemd/systemd_197.bb           |    1 +
 .../qemu/{qemu_1.3.0.bb => qemu_1.3.1.bb}          |    4 +-
 meta/recipes-devtools/qemu/qemu_git.bb             |    2 +-
 .../gtk+/gtk+-2.24.14/hardcoded_libtool.patch      |   33 -
 .../gtk+-2.24.14/obsolete_automake_macros.patch    |   23 -
 ...utton-do-not-prelight-in-touchscreen-mode.patch |    0
 ...Duplicate-the-exec-string-returned-by-gtk.patch |    0
 .../cellrenderer-cairo.patch                       |    0
 .../configure-nm.patch                             |   11 +-
 .../configurefix.patch                             |    0
 .../{gtk+-2.24.14 => gtk+-2.24.15}/doc-fixes.patch |    0
 .../entry-cairo.patch                              |    0
 .../gtk+/gtk+-2.24.15/hardcoded_libtool.patch      | 1814 ++++++++++++++++++++
 .../{gtk+-2.24.14 => gtk+-2.24.15}/no-demos.patch  |    0
 .../run-iconcache.patch                            |    0
 .../toggle-font.diff                               |    0
 .../{gtk+-2.24.14 => gtk+-2.24.15}/xsettings.patch |    0
 .../gtk+/{gtk+_2.24.14.bb => gtk+_2.24.15.bb}      |    7 +-
 .../drm/{libdrm_2.4.40.bb => libdrm_2.4.42.bb}     |    4 +-
 .../avoid_double_version_h.patch                   |    0
 .../disable_graphite.patch                         |    0
 .../{harfbuzz_0.9.10.bb => harfbuzz_0.9.12.bb}     |    8 +-
 meta/recipes-graphics/xorg-app/xev_1.2.0.bb        |   12 -
 meta/recipes-graphics/xorg-app/xev_1.2.1.bb        |   12 +
 ...tics_1.6.2.bb => xf86-input-synaptics_1.6.3.bb} |    6 +-
 ...ouse_12.9.0.bb => xf86-input-vmmouse_13.0.0.bb} |    4 +-
 ...intel_2.20.17.bb => xf86-video-intel_2.21.0.bb} |    4 +-
 ...ware-port-vmware-driver-to-new-compat-API.patch |  655 -------
 ...mware_12.0.2.bb => xf86-video-vmware_13.0.0.bb} |    7 +-
 ...board-config_2.7.bb => xkeyboard-config_2.8.bb} |    4 +-
 .../xorg-xserver/xserver-xf86-config/xorg.conf     |   26 -
 .../xorg-xserver/xserver-xf86-config_0.1.bb        |   10 +-
 .../fix-tstamp-declaration.patch                   |    0
 .../obsolete_automake_macros.patch                 |    0
 .../unbreak_plugindir.patch                        |    0
 .../{alsa-lib_1.0.25.bb => alsa-lib_1.0.26.bb}     |    7 +-
 .../libpng-1.5.13/obsolete_automake_macros.patch   |   15 -
 .../libpng/{libpng_1.5.13.bb => libpng_1.5.14.bb}  |   11 +-
 .../{webkit-gtk_1.8.2.bb => webkit-gtk_1.8.3.bb}   |    6 +-
 .../gnupg/gnupg-1.4.7/GnuPG1-CVE-2012-6085.patch   |   63 +
 .../gnupg/gnupg-2.0.19/GnuPG2-CVE-2012-6085.patch  |   63 +
 meta/recipes-support/gnupg/gnupg_1.4.7.bb          |    3 +-
 meta/recipes-support/gnupg/gnupg_2.0.19.bb         |    5 +-
 scripts/bitbake                                    |    2 +-
 48 files changed, 2041 insertions(+), 834 deletions(-)
 rename meta/recipes-devtools/qemu/{qemu_1.3.0.bb => qemu_1.3.1.bb} (64%)
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+-2.24.14/hardcoded_libtool.patch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+-2.24.14/obsolete_automake_macros.patch
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.14 => gtk+-2.24.15}/0001-GtkButton-do-not-prelight-in-touchscreen-mode.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.14 => gtk+-2.24.15}/0001-bgo-584832-Duplicate-the-exec-string-returned-by-gtk.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.14 => gtk+-2.24.15}/cellrenderer-cairo.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.14 => gtk+-2.24.15}/configure-nm.patch (50%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.14 => gtk+-2.24.15}/configurefix.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.14 => gtk+-2.24.15}/doc-fixes.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.14 => gtk+-2.24.15}/entry-cairo.patch (100%)
 create mode 100644 meta/recipes-gnome/gtk+/gtk+-2.24.15/hardcoded_libtool.patch
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.14 => gtk+-2.24.15}/no-demos.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.14 => gtk+-2.24.15}/run-iconcache.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.14 => gtk+-2.24.15}/toggle-font.diff (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.14 => gtk+-2.24.15}/xsettings.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+_2.24.14.bb => gtk+_2.24.15.bb} (92%)
 rename meta/recipes-graphics/drm/{libdrm_2.4.40.bb => libdrm_2.4.42.bb} (50%)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz-0.9.10 => harfbuzz-0.9.12}/avoid_double_version_h.patch (100%)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz-0.9.10 => harfbuzz-0.9.12}/disable_graphite.patch (100%)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_0.9.10.bb => harfbuzz_0.9.12.bb} (82%)
 delete mode 100644 meta/recipes-graphics/xorg-app/xev_1.2.0.bb
 create mode 100644 meta/recipes-graphics/xorg-app/xev_1.2.1.bb
 rename meta/recipes-graphics/xorg-driver/{xf86-input-synaptics_1.6.2.bb => xf86-input-synaptics_1.6.3.bb} (79%)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-vmmouse_12.9.0.bb => xf86-input-vmmouse_13.0.0.bb} (75%)
 rename meta/recipes-graphics/xorg-driver/{xf86-video-intel_2.20.17.bb => xf86-video-intel_2.21.0.bb} (86%)
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-vmware/vmware-port-vmware-driver-to-new-compat-API.patch
 rename meta/recipes-graphics/xorg-driver/{xf86-video-vmware_12.0.2.bb => xf86-video-vmware_13.0.0.bb} (62%)
 rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.7.bb => xkeyboard-config_2.8.bb} (88%)
 rename meta/recipes-multimedia/alsa/{alsa-lib-1.0.25 => alsa-lib}/fix-tstamp-declaration.patch (100%)
 rename meta/recipes-multimedia/alsa/{alsa-lib-1.0.25 => alsa-lib}/obsolete_automake_macros.patch (100%)
 rename meta/recipes-multimedia/alsa/{alsa-lib-1.0.25 => alsa-lib}/unbreak_plugindir.patch (100%)
 rename meta/recipes-multimedia/alsa/{alsa-lib_1.0.25.bb => alsa-lib_1.0.26.bb} (91%)
 delete mode 100644 meta/recipes-multimedia/libpng/libpng-1.5.13/obsolete_automake_macros.patch
 rename meta/recipes-multimedia/libpng/{libpng_1.5.13.bb => libpng_1.5.14.bb} (47%)
 rename meta/recipes-sato/webkit/{webkit-gtk_1.8.2.bb => webkit-gtk_1.8.3.bb} (97%)
 create mode 100644 meta/recipes-support/gnupg/gnupg-1.4.7/GnuPG1-CVE-2012-6085.patch
 create mode 100644 meta/recipes-support/gnupg/gnupg-2.0.19/GnuPG2-CVE-2012-6085.patch

-- 
1.8.0.2



