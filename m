Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Tl1xA-0000qe-98
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Dec 2012 19:31:45 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 18 Dec 2012 10:16:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,310,1355126400"; d="scan'208";a="266441780"
Received: from unknown (HELO swold-linux.bigsur.com.bigsur.com)
	([10.255.13.212])
	by fmsmga002.fm.intel.com with ESMTP; 18 Dec 2012 10:16:54 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Dec 2012 10:16:54 -0800
Message-Id: <cover.1355854182.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
Subject: [CONSOLIDATED PULL 00/31] Package Updates and fixes (cover letter only)
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
X-List-Received-Date: Tue, 18 Dec 2012 18:31:45 -0000

Richard,

Updated a bunch of packages from various folks, this
includes the ICU Upgrade which will fix the webkit-gtk
issue in master.

Thanks
	Sau!

The following changes since commit 26bf8f6a047ccc0f73eaa40093afddabfce8ea1b:

  gst-openmax: fix build with newer GLib (2012-12-17 17:53:33 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Chen Qi (1):
  ICU: upgrade to 50.1.

Constantin Musca (6):
  bitbake.conf: add nonarch_base_lib variable
  alsa-utils: Pass udev-rules-dir as parameter
  pcmciautils: set correct udevdir and add missing debug files
  bluez: set correct udevdir
  polkit: fix multilib packaging issue
  psplash: enable multilib

Laurentiu Palcu (6):
  avahi: use useradd.bbclass to add avahi-autoipd user
  distcc: use useradd.bbclass to add the distcc user
  gconf: add gconftool-2 native wrapper
  gtk+-native: add gtk-update-icon-cache wrapper
  xserver-xorg: upgrade to 1.13.1
  xf86-video-intel: upgrade to 2.20.16

Marko Lindqvist (8):
  fontconfig: update to upstream version 2.10.2
  gtk+: update to upstream version 2.24.14
  patch: drop global-reject-file patch
  patch: update to upstream version 2.7.1
  guile: update to upstream version 2.0.7
  gdk-pixbuf: update to upstream version 2.26.5
  gdb: update to upstream version 7.5.1
  pixman: update to upstream version 0.28.2

Martin Jansa (4):
  rootfs_*.bbclass: exclude BUILDNAME var dependency from do_rootfs
  bitbake.conf: exclude DATETIME var dependency from IMAGE_NAME
  kernel.bbclass: use the same versioning schema for modules.tgz and
    provide link to latest
  iptables: include /usr/share/xtables/pf.os in PN if it's build

Phil Blundell (1):
  kernel.bbclass: Allow modules*.tar.gz generation to be inhibited

Ross Burton (2):
  mutter: remove
  matchbox-wm-2: remove

Saul Wold (3):
  standalone-sdk: Need to have an update-alternatives package
  matchbox-theme-sato-2: remove, depends on matchbox-wm-2
  packagegroup-toolset-native: don't include mesa-dri-glsl-native

 meta/classes/gconf.bbclass                         |   1 -
 meta/classes/kernel.bbclass                        |  10 +-
 meta/classes/rootfs_deb.bbclass                    |   1 +
 meta/classes/rootfs_ipk.bbclass                    |   1 +
 meta/classes/rootfs_rpm.bbclass                    |   1 +
 meta/classes/staging.bbclass                       |   4 +
 meta/conf/bitbake.conf                             |   2 +
 meta/recipes-bsp/pcmciautils/pcmciautils.inc       |   3 +-
 meta/recipes-bsp/pcmciautils/pcmciautils_018.bb    |   6 +-
 meta/recipes-connectivity/avahi/avahi.inc          |  19 +--
 .../bluez/bluez4-4.101/fix-udev-paths.patch        |  37 ++++
 meta/recipes-connectivity/bluez/bluez4.inc         |   2 +
 meta/recipes-connectivity/bluez/bluez4_4.101.bb    |   7 +-
 .../packagegroup-core-standalone-sdk-target.bb     |   3 +
 meta/recipes-core/psplash/psplash_git.bb           |  16 +-
 meta/recipes-devtools/distcc/distcc_2.18.3.bb      |  19 ++-
 meta/recipes-devtools/gdb/gdb-common.inc           |   4 +-
 ...canadian_7.5.bb => gdb-cross-canadian_7.5.1.bb} |   0
 .../gdb/{gdb-cross_7.5.bb => gdb-cross_7.5.1.bb}   |   0
 .../gdb/{gdb_7.5.bb => gdb_7.5.1.bb}               |   0
 ...all-data-hook-to-install-exec-hook-in-gui.patch |  36 ----
 .../guile/{guile_2.0.6.bb => guile_2.0.7.bb}       |   9 +-
 .../patch/patch-2.6.1/global-reject-file.diff      | 188 ---------------------
 meta/recipes-devtools/patch/patch_2.6.1.bb         |  14 --
 meta/recipes-devtools/patch/patch_2.7.1.bb         |  11 ++
 meta/recipes-extended/iptables/iptables_1.4.15.bb  |   4 +-
 meta/recipes-extended/polkit/polkit_0.104.bb       |  12 +-
 .../gdk-pixbuf-2.24.1/configure_nm.patch           |  21 ---
 .../configure_fix.patch                            |   0
 .../extending-libinstall-dependencies.patch        |   0
 .../hardcoded_libtool.patch                        |   0
 .../{gdk-pixbuf_2.24.1.bb => gdk-pixbuf_2.26.5.bb} |  10 +-
 meta/recipes-gnome/gnome/gconf_3.2.3.bb            |   7 +-
 ...utton-do-not-prelight-in-touchscreen-mode.patch |   0
 ...Duplicate-the-exec-string-returned-by-gtk.patch |   0
 .../cellrenderer-cairo.patch                       |   0
 .../configure-nm.patch                             |   0
 .../configurefix.patch                             |   0
 .../{gtk+-2.24.13 => gtk+-2.24.14}/doc-fixes.patch |   0
 .../entry-cairo.patch                              |   0
 .../hardcoded_libtool.patch                        |   0
 .../{gtk+-2.24.13 => gtk+-2.24.14}/no-demos.patch  |   0
 .../run-iconcache.patch                            |   0
 .../toggle-font.diff                               |   0
 .../{gtk+-2.24.13 => gtk+-2.24.14}/xsettings.patch |   0
 .../gtk+/{gtk+_2.24.13.bb => gtk+_2.24.14.bb}      |  11 +-
 .../packagegroups/packagegroup-toolset-native.bb   |   1 -
 .../97_fontconfig                                  |   0
 .../fix-pkgconfig.patch                            |   0
 ...ative_2.10.1.bb => fontconfig-native_2.10.2.bb} |   0
 .../{fontconfig_2.10.1.bb => fontconfig_2.10.2.bb} |   4 +-
 .../matchbox-wm-2/matchbox-wm-2/fix_makefile.patch |  21 ---
 .../matchbox-wm-2/matchbox-wm-2_git.bb             |  45 -----
 meta/recipes-graphics/mutter/mutter.inc            |  42 -----
 .../mutter/mutter/crosscompile.patch               |  57 -------
 .../mutter/fix_CGL_TEXTURE_RECTANGLE_ARB.patch     |  47 ------
 ...-7adb574bb3fa3880eb85dbc86e580cf3452d57c4.patch |  12 --
 .../mutter/mutter/fix_pkgconfig.patch              |  12 --
 meta/recipes-graphics/mutter/mutter/nodocs.patch   |  31 ----
 meta/recipes-graphics/mutter/mutter/nozenity.patch |  18 --
 meta/recipes-graphics/mutter/mutter_2.29.1.bb      |  13 --
 meta/recipes-graphics/mutter/mutter_git.bb         |  21 ---
 ...ntel_2.20.12.bb => xf86-video-intel_2.20.16.bb} |   4 +-
 .../{pixman_0.28.0.bb => pixman_0.28.2.bb}         |   5 +-
 .../crosscompile.patch                             |   0
 .../fix_open_max_preprocessor_error.patch          |   0
 .../macro_tweak.patch                              |   0
 .../mips64-compiler.patch                          |   0
 ...erver-xorg_1.13.0.bb => xserver-xorg_1.13.1.bb} |   4 +-
 meta/recipes-multimedia/alsa/alsa-utils_1.0.25.bb  |   6 +-
 .../matchbox-theme-sato-2_git.bb                   |  11 --
 .../icu/files/fix-parallel-build.patch             |  19 ---
 meta/recipes-support/icu/files/gccfix.patch        |  19 ---
 .../icu/files/icu-add-pkgconfig-support.patch      |  43 -----
 .../icu/files/larger-cmd-size.patch                |  27 ---
 meta/recipes-support/icu/files/noldlibpath.patch   |  52 ------
 .../icu/files/use-g++-for-linking.patch            |  74 --------
 meta/recipes-support/icu/{icu-3.6.inc => icu.inc}  |  61 +++----
 meta/recipes-support/icu/icu_3.6.bb                |   6 -
 meta/recipes-support/icu/icu_50.1.bb               |  11 ++
 80 files changed, 183 insertions(+), 942 deletions(-)
 create mode 100644 meta/recipes-connectivity/bluez/bluez4-4.101/fix-udev-paths.patch
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_7.5.bb => gdb-cross-canadian_7.5.1.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb-cross_7.5.bb => gdb-cross_7.5.1.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb_7.5.bb => gdb_7.5.1.bb} (100%)
 delete mode 100644 meta/recipes-devtools/guile/files/change-install-data-hook-to-install-exec-hook-in-gui.patch
 rename meta/recipes-devtools/guile/{guile_2.0.6.bb => guile_2.0.7.bb} (93%)
 delete mode 100644 meta/recipes-devtools/patch/patch-2.6.1/global-reject-file.diff
 delete mode 100644 meta/recipes-devtools/patch/patch_2.6.1.bb
 create mode 100644 meta/recipes-devtools/patch/patch_2.7.1.bb
 delete mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.24.1/configure_nm.patch
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf-2.24.1 => gdk-pixbuf-2.26.5}/configure_fix.patch (100%)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf-2.24.1 => gdk-pixbuf-2.26.5}/extending-libinstall-dependencies.patch (100%)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf-2.24.1 => gdk-pixbuf-2.26.5}/hardcoded_libtool.patch (100%)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.24.1.bb => gdk-pixbuf_2.26.5.bb} (95%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.13 => gtk+-2.24.14}/0001-GtkButton-do-not-prelight-in-touchscreen-mode.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.13 => gtk+-2.24.14}/0001-bgo-584832-Duplicate-the-exec-string-returned-by-gtk.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.13 => gtk+-2.24.14}/cellrenderer-cairo.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.13 => gtk+-2.24.14}/configure-nm.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.13 => gtk+-2.24.14}/configurefix.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.13 => gtk+-2.24.14}/doc-fixes.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.13 => gtk+-2.24.14}/entry-cairo.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.13 => gtk+-2.24.14}/hardcoded_libtool.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.13 => gtk+-2.24.14}/no-demos.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.13 => gtk+-2.24.14}/run-iconcache.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.13 => gtk+-2.24.14}/toggle-font.diff (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.13 => gtk+-2.24.14}/xsettings.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+_2.24.13.bb => gtk+_2.24.14.bb} (87%)
 rename meta/recipes-graphics/fontconfig/{fontconfig-2.10.1 => fontconfig-2.10.2}/97_fontconfig (100%)
 rename meta/recipes-graphics/fontconfig/{fontconfig-2.10.1 => fontconfig-2.10.2}/fix-pkgconfig.patch (100%)
 rename meta/recipes-graphics/fontconfig/{fontconfig-native_2.10.1.bb => fontconfig-native_2.10.2.bb} (100%)
 rename meta/recipes-graphics/fontconfig/{fontconfig_2.10.1.bb => fontconfig_2.10.2.bb} (95%)
 delete mode 100644 meta/recipes-graphics/matchbox-wm-2/matchbox-wm-2/fix_makefile.patch
 delete mode 100644 meta/recipes-graphics/matchbox-wm-2/matchbox-wm-2_git.bb
 delete mode 100644 meta/recipes-graphics/mutter/mutter.inc
 delete mode 100644 meta/recipes-graphics/mutter/mutter/crosscompile.patch
 delete mode 100644 meta/recipes-graphics/mutter/mutter/fix_CGL_TEXTURE_RECTANGLE_ARB.patch
 delete mode 100644 meta/recipes-graphics/mutter/mutter/fix_pkgconfig-7adb574bb3fa3880eb85dbc86e580cf3452d57c4.patch
 delete mode 100644 meta/recipes-graphics/mutter/mutter/fix_pkgconfig.patch
 delete mode 100644 meta/recipes-graphics/mutter/mutter/nodocs.patch
 delete mode 100644 meta/recipes-graphics/mutter/mutter/nozenity.patch
 delete mode 100644 meta/recipes-graphics/mutter/mutter_2.29.1.bb
 delete mode 100644 meta/recipes-graphics/mutter/mutter_git.bb
 rename meta/recipes-graphics/xorg-driver/{xf86-video-intel_2.20.12.bb => xf86-video-intel_2.20.16.bb} (86%)
 rename meta/recipes-graphics/xorg-lib/{pixman_0.28.0.bb => pixman_0.28.2.bb} (89%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg-1.13.0 => xserver-xorg-1.13.1}/crosscompile.patch (100%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg-1.13.0 => xserver-xorg-1.13.1}/fix_open_max_preprocessor_error.patch (100%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg-1.13.0 => xserver-xorg-1.13.1}/macro_tweak.patch (100%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg-1.13.0 => xserver-xorg-1.13.1}/mips64-compiler.patch (100%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.13.0.bb => xserver-xorg_1.13.1.bb} (88%)
 delete mode 100644 meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato-2_git.bb
 delete mode 100644 meta/recipes-support/icu/files/fix-parallel-build.patch
 delete mode 100644 meta/recipes-support/icu/files/gccfix.patch
 delete mode 100644 meta/recipes-support/icu/files/icu-add-pkgconfig-support.patch
 delete mode 100644 meta/recipes-support/icu/files/larger-cmd-size.patch
 delete mode 100644 meta/recipes-support/icu/files/noldlibpath.patch
 delete mode 100644 meta/recipes-support/icu/files/use-g++-for-linking.patch
 rename meta/recipes-support/icu/{icu-3.6.inc => icu.inc} (42%)
 delete mode 100644 meta/recipes-support/icu/icu_3.6.bb
 create mode 100644 meta/recipes-support/icu/icu_50.1.bb

-- 
1.8.0.2



