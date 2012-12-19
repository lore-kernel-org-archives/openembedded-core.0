Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TlEqv-00085k-52
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Dec 2012 09:18:11 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 19 Dec 2012 00:03:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,313,1355126400"; d="scan'208";a="264288994"
Received: from unknown (HELO swold-linux.bigsur.com.bigsur.com)
	([10.255.14.45])
	by fmsmga001.fm.intel.com with ESMTP; 19 Dec 2012 00:03:19 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Dec 2012 00:03:18 -0800
Message-Id: <cover.1355903662.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
Subject: [CONSOLIDATED PULL v2 00/56] More Updates & Fixes
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
X-List-Received-Date: Wed, 19 Dec 2012 08:18:12 -0000

Richard,

From v1:
Richard,

Updated a bunch of packages from various folks, this
includes the ICU Upgrade which will fix the webkit-gtk
issue in master.

v2: more fixes, 
ICU: based on v1 icu investigated what was really needed
Multilib fixes
more SMART patches

*** biggest patch that might cause problem is the libpng
    update, it may require other recipes PR bumps to rebuild
    correctly, I have seen some inconsistenties when building
    in populated build dirs.

Thanks
	Sau!
The following changes since commit 26bf8f6a047ccc0f73eaa40093afddabfce8ea1b:

  gst-openmax: fix build with newer GLib (2012-12-17 17:53:33 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Alexandru DAMIAN (1):
  init-live: default to initrd shell if image isn't found

Bogdan Marinescu (1):
  python-smartpm: improve error reporting

Chen Qi (1):
  ICU: upgrade to 50.1.

Ciprian Ciubotariu (1):
  packagegroup-base: use virtual runtime instead of keymap

Constantin Musca (6):
  bitbake.conf: add nonarch_base_lib variable
  alsa-utils: Pass udev-rules-dir as parameter
  pcmciautils: set correct udevdir and add missing debug files
  bluez: set correct udevdir
  polkit: fix multilib packaging issue
  psplash: enable multilib

Johan Hovold (1):
  udev: fix failed /dev/shm mount

Khem Raj (1):
  gcc-cross-canadian.inc: Add dependency on cross-gcc

Laurentiu Palcu (7):
  avahi: use useradd.bbclass to add avahi-autoipd user
  distcc: use useradd.bbclass to add the distcc user
  gconf: add gconftool-2 native wrapper
  gtk+-native: add gtk-update-icon-cache wrapper
  xserver-xorg: upgrade to 1.13.1
  xf86-video-intel: upgrade to 2.20.16
  matchbox-session-sato: use a proper schema file

Marcin Juszkiewicz (2):
  net-tools: disable Token Ring and Strip support - both got removed in
    3.7 kernel
  xinetd: added gnu-configize for AArch64 support

Mark Hatle (1):
  package_rpm.bbclass: Refactor the attempt only install

Marko Kati? (1):
  udev: Remove deprecated binaries from packaging

Marko Lindqvist (9):
  fontconfig: update to upstream version 2.10.2
  gtk+: update to upstream version 2.24.14
  patch: drop global-reject-file patch
  patch: update to upstream version 2.7.1
  guile: update to upstream version 2.0.7
  gdk-pixbuf: update to upstream version 2.26.5
  gdb: update to upstream version 7.5.1
  pixman: update to upstream version 0.28.2
  libpng: update to upstream version 1.5.13

Martin Jansa (4):
  rootfs_*.bbclass: exclude BUILDNAME var dependency from do_rootfs
  bitbake.conf: exclude DATETIME var dependency from IMAGE_NAME
  kernel.bbclass: use the same versioning schema for modules.tgz and
    provide link to latest
  iptables: include /usr/share/xtables/pf.os in PN if it's build

Ming Liu (1):
  initscripts/urandom: create directory before staging into it

Paul Eggleton (1):
  classes/image: handle multilibs in complementary package lookup

Phil Blundell (1):
  kernel.bbclass: Allow modules*.tar.gz generation to be inhibited

Ross Burton (2):
  mutter: remove
  matchbox-wm-2: remove

Saul Wold (15):
  standalone-sdk: Need to have an update-alternatives package
  matchbox-theme-sato-2: remove, depends on matchbox-wm-2
  packagegroup-toolset-native: don't include mesa-dri-glsl-native
  sqlite: Update to 3.7.15.0
  man: Update to 1.6g
  nspr: Update to 4.9.4
  gconf: Update to 3.2.5
  less: Update to 457
  cups: Update to 1.6.1
  cmake: Update to 2.8.10.2
  dpkg: Update to 1.16.9
  lsbinitscripts: update to 9.43
  neon: added --disable-gssapi
  lsbinitscripts: Don't compile
  icu: reduce what's needed for cross tools

 meta/classes/gconf.bbclass                         |   1 -
 meta/classes/image.bbclass                         |  16 +-
 meta/classes/kernel.bbclass                        |  10 +-
 meta/classes/package_rpm.bbclass                   |  13 +-
 meta/classes/rootfs_deb.bbclass                    |   1 +
 meta/classes/rootfs_ipk.bbclass                    |   1 +
 meta/classes/rootfs_rpm.bbclass                    |   1 +
 meta/classes/staging.bbclass                       |   4 +
 meta/conf/bitbake.conf                             |   2 +
 meta/recipes-bsp/pcmciautils/pcmciautils.inc       |   3 +-
 meta/recipes-bsp/pcmciautils/pcmciautils_018.bb    |   6 +-
 meta/recipes-connectivity/avahi/avahi.inc          |  19 +-
 .../bluez/bluez4-4.101/fix-udev-paths.patch        |  37 +++
 meta/recipes-connectivity/bluez/bluez4.inc         |   2 +
 meta/recipes-connectivity/bluez/bluez4_4.101.bb    |   7 +-
 meta/recipes-core/initrdscripts/files/init-live.sh |  22 +-
 meta/recipes-core/initscripts/initscripts_1.0.bb   |   4 +-
 .../packagegroups/packagegroup-base.bb             |   5 +-
 .../packagegroup-core-standalone-sdk-target.bb     |   3 +
 meta/recipes-core/psplash/psplash_git.bb           |  16 +-
 meta/recipes-core/udev/udev.inc                    |  14 +-
 meta/recipes-core/udev/udev/init                   |   7 +-
 meta/recipes-core/udev/udev_182.bb                 |   2 +-
 ...native_2.8.10.1.bb => cmake-native_2.8.10.2.bb} |   0
 meta/recipes-devtools/cmake/cmake.inc              |   3 -
 .../cmake/{cmake_2.8.10.1.bb => cmake_2.8.10.2.bb} |   3 +
 meta/recipes-devtools/distcc/distcc_2.18.3.bb      |  19 +-
 .../dpkg/{dpkg_1.16.8.bb => dpkg_1.16.9.bb}        |   5 +-
 meta/recipes-devtools/gcc/gcc-cross-canadian.inc   |   2 +-
 meta/recipes-devtools/gdb/gdb-common.inc           |   4 +-
 ...canadian_7.5.bb => gdb-cross-canadian_7.5.1.bb} |   0
 .../gdb/{gdb-cross_7.5.bb => gdb-cross_7.5.1.bb}   |   0
 .../gdb/{gdb_7.5.bb => gdb_7.5.1.bb}               |   0
 ...all-data-hook-to-install-exec-hook-in-gui.patch |  36 ---
 .../guile/{guile_2.0.6.bb => guile_2.0.7.bb}       |   9 +-
 .../patch/patch-2.6.1/global-reject-file.diff      | 188 ---------------
 meta/recipes-devtools/patch/patch_2.6.1.bb         |  14 --
 meta/recipes-devtools/patch/patch_2.7.1.bb         |  11 +
 .../smart-improve-error-reporting.patch            | 253 +++++++++++++++++++++
 .../python/python-smartpm_1.4.1.bb                 |   3 +-
 .../0001-don-t-try-to-run-generated-binaries.patch |   0
 .../{cups-1.4.6 => cups}/cups-CVE-2011-2896.patch  |   0
 .../{cups-1.4.6 => cups}/cups-CVE-2011-3170.patch  |   0
 .../{cups-1.4.6 => cups}/cups-CVE-2012-5519.patch  |   0
 .../cups/{cups-1.4.6 => cups}/cups_serverbin.patch |   0
 .../use_echo_only_in_init.patch                    |  10 +-
 .../cups/{cups14.inc => cups16.inc}                |   2 +-
 .../cups/{cups_1.4.6.bb => cups_1.6.1.bb}          |  12 +-
 meta/recipes-extended/iptables/iptables_1.4.15.bb  |   4 +-
 .../less/{less_456.bb => less_457.bb}              |   4 +-
 .../lsb/lsbinitscripts/functions.patch             |  30 ++-
 ...binitscripts_9.03.bb => lsbinitscripts_9.43.bb} |  10 +-
 .../{man-1.6f => man}/man-1.5g-nonrootbuild.patch  |   0
 .../man/{man-1.6f => man}/man-1.5h1-gencat.patch   |   0
 .../man/{man-1.6f => man}/man-1.5h1-make.patch     |   0
 .../man/{man-1.6f => man}/man-1.5i2-initial.patch  |   0
 .../man/{man-1.6f => man}/man-1.5i2-newline.patch  |   0
 .../man/{man-1.6f => man}/man-1.5i2-overflow.patch |   0
 .../man/{man-1.6f => man}/man-1.5j-i18n.patch      |   0
 .../man/{man-1.6f => man}/man-1.5j-nocache.patch   |   0
 .../man/{man-1.6f => man}/man-1.5j-utf8.patch      |   0
 .../man/{man-1.6f => man}/man-1.5k-confpath.patch  |   0
 .../man/{man-1.6f => man}/man-1.5k-nonascii.patch  |   0
 .../man/{man-1.6f => man}/man-1.5k-sofix.patch     |   0
 .../man/{man-1.6f => man}/man-1.5m2-bug11621.patch |   0
 .../{man-1.6f => man}/man-1.5m2-buildroot.patch    |   0
 .../man/{man-1.6f => man}/man-1.5m2-multiple.patch |   0
 .../man-1.5m2-no-color-for-printing.patch          |   0
 .../man/{man-1.6f => man}/man-1.5m2-sigpipe.patch  |   0
 .../man/{man-1.6f => man}/man-1.5m2-tv_fhs.patch   |   0
 .../{man-1.6f => man}/man-1.6e-i18n_whatis.patch   |   0
 .../man-1.6e-lzma+xz-support.patch                 |   0
 .../man/{man-1.6f => man}/man-1.6e-mandirs.patch   |   0
 .../{man-1.6f => man}/man-1.6e-new_sections.patch  |   0
 .../man/{man-1.6f => man}/man-1.6e-ro_usr.patch    |   0
 .../man/{man-1.6f => man}/man-1.6e-security.patch  |   0
 .../man-1.6e-use_i18n_vars_in_a_std_way.patch      |   0
 .../man/{man-1.6f => man}/man-1.6e-whatis2.patch   |   0
 .../man/{man-1.6f => man}/man.1.gz                 | Bin
 .../man/{man-1.6f => man}/man.7.gz                 | Bin
 .../man/{man-1.6f => man}/man.conf                 |   0
 .../man/{man-1.6f => man}/manpath.5.gz             | Bin
 .../man/{man_1.6f.bb => man_1.6g.bb}               |   8 +-
 .../net-tools/net-tools-1.60-23/net-tools-config.h |   4 +-
 .../net-tools/net-tools_1.60-23.bb                 |   2 +-
 meta/recipes-extended/polkit/polkit_0.104.bb       |  12 +-
 meta/recipes-extended/xinetd/xinetd_2.3.15.bb      |   1 +
 .../gdk-pixbuf-2.24.1/configure_nm.patch           |  21 --
 .../configure_fix.patch                            |   0
 .../extending-libinstall-dependencies.patch        |   0
 .../hardcoded_libtool.patch                        |   0
 .../{gdk-pixbuf_2.24.1.bb => gdk-pixbuf_2.26.5.bb} |  10 +-
 .../gnome/gconf-3.2.3/backenddir.patch             |  45 ----
 .../gnome/{gconf_3.2.3.bb => gconf_3.2.5.bb}       |  16 +-
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
 .../matchbox-wm-2/matchbox-wm-2/fix_makefile.patch |  21 --
 .../matchbox-wm-2/matchbox-wm-2_git.bb             |  45 ----
 meta/recipes-graphics/mutter/mutter.inc            |  42 ----
 .../mutter/mutter/crosscompile.patch               |  57 -----
 .../mutter/fix_CGL_TEXTURE_RECTANGLE_ARB.patch     |  47 ----
 ...-7adb574bb3fa3880eb85dbc86e580cf3452d57c4.patch |  12 -
 .../mutter/mutter/fix_pkgconfig.patch              |  12 -
 meta/recipes-graphics/mutter/mutter/nodocs.patch   |  31 ---
 meta/recipes-graphics/mutter/mutter/nozenity.patch |  18 --
 meta/recipes-graphics/mutter/mutter_2.29.1.bb      |  13 --
 meta/recipes-graphics/mutter/mutter_git.bb         |  21 --
 ...ntel_2.20.12.bb => xf86-video-intel_2.20.16.bb} |   4 +-
 .../{pixman_0.28.0.bb => pixman_0.28.2.bb}         |   5 +-
 .../crosscompile.patch                             |   0
 .../fix_open_max_preprocessor_error.patch          |   0
 .../macro_tweak.patch                              |   0
 .../mips64-compiler.patch                          |   0
 ...erver-xorg_1.13.0.bb => xserver-xorg_1.13.1.bb} |   4 +-
 meta/recipes-multimedia/alsa/alsa-utils_1.0.25.bb  |   6 +-
 meta/recipes-multimedia/libpng/libpng_1.2.50.bb    |  23 --
 meta/recipes-multimedia/libpng/libpng_1.5.13.bb    |  24 ++
 .../matchbox-session-sato.schemas                  |  53 +++++
 .../matchbox-sato/matchbox-session-sato_0.1.bb     |  21 +-
 .../matchbox-theme-sato-2_git.bb                   |  11 -
 .../icu/files/fix-parallel-build.patch             |  19 --
 meta/recipes-support/icu/files/gccfix.patch        |  19 --
 .../icu/files/icu-add-pkgconfig-support.patch      |  43 ----
 .../icu/files/larger-cmd-size.patch                |  27 ---
 meta/recipes-support/icu/files/noldlibpath.patch   |  52 -----
 .../icu/files/use-g++-for-linking.patch            |  74 ------
 meta/recipes-support/icu/{icu-3.6.inc => icu.inc}  |  63 ++---
 meta/recipes-support/icu/icu_3.6.bb                |   6 -
 meta/recipes-support/icu/icu_50.1.bb               |  11 +
 meta/recipes-support/neon/neon_0.29.6.bb           |   3 +-
 .../nspr/{nspr_4.8.9.bb => nspr_4.9.4.bb}          |  14 +-
 meta/recipes-support/sqlite/sqlite3_3.7.14.1.bb    |  11 -
 meta/recipes-support/sqlite/sqlite3_3.7.15.0.bb    |  11 +
 149 files changed, 674 insertions(+), 1102 deletions(-)
 create mode 100644 meta/recipes-connectivity/bluez/bluez4-4.101/fix-udev-paths.patch
 rename meta/recipes-devtools/cmake/{cmake-native_2.8.10.1.bb => cmake-native_2.8.10.2.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_2.8.10.1.bb => cmake_2.8.10.2.bb} (88%)
 rename meta/recipes-devtools/dpkg/{dpkg_1.16.8.bb => dpkg_1.16.9.bb} (71%)
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_7.5.bb => gdb-cross-canadian_7.5.1.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb-cross_7.5.bb => gdb-cross_7.5.1.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb_7.5.bb => gdb_7.5.1.bb} (100%)
 delete mode 100644 meta/recipes-devtools/guile/files/change-install-data-hook-to-install-exec-hook-in-gui.patch
 rename meta/recipes-devtools/guile/{guile_2.0.6.bb => guile_2.0.7.bb} (93%)
 delete mode 100644 meta/recipes-devtools/patch/patch-2.6.1/global-reject-file.diff
 delete mode 100644 meta/recipes-devtools/patch/patch_2.6.1.bb
 create mode 100644 meta/recipes-devtools/patch/patch_2.7.1.bb
 create mode 100644 meta/recipes-devtools/python/python-smartpm/smart-improve-error-reporting.patch
 rename meta/recipes-extended/cups/{cups-1.4.6 => cups}/0001-don-t-try-to-run-generated-binaries.patch (100%)
 rename meta/recipes-extended/cups/{cups-1.4.6 => cups}/cups-CVE-2011-2896.patch (100%)
 rename meta/recipes-extended/cups/{cups-1.4.6 => cups}/cups-CVE-2011-3170.patch (100%)
 rename meta/recipes-extended/cups/{cups-1.4.6 => cups}/cups-CVE-2012-5519.patch (100%)
 rename meta/recipes-extended/cups/{cups-1.4.6 => cups}/cups_serverbin.patch (100%)
 rename meta/recipes-extended/cups/{cups-1.4.6 => cups}/use_echo_only_in_init.patch (42%)
 rename meta/recipes-extended/cups/{cups14.inc => cups16.inc} (99%)
 rename meta/recipes-extended/cups/{cups_1.4.6.bb => cups_1.6.1.bb} (56%)
 rename meta/recipes-extended/less/{less_456.bb => less_457.bb} (88%)
 rename meta/recipes-extended/lsb/{lsbinitscripts_9.03.bb => lsbinitscripts_9.43.bb} (64%)
 rename meta/recipes-extended/man/{man-1.6f => man}/man-1.5g-nonrootbuild.patch (100%)
 rename meta/recipes-extended/man/{man-1.6f => man}/man-1.5h1-gencat.patch (100%)
 rename meta/recipes-extended/man/{man-1.6f => man}/man-1.5h1-make.patch (100%)
 rename meta/recipes-extended/man/{man-1.6f => man}/man-1.5i2-initial.patch (100%)
 rename meta/recipes-extended/man/{man-1.6f => man}/man-1.5i2-newline.patch (100%)
 rename meta/recipes-extended/man/{man-1.6f => man}/man-1.5i2-overflow.patch (100%)
 rename meta/recipes-extended/man/{man-1.6f => man}/man-1.5j-i18n.patch (100%)
 rename meta/recipes-extended/man/{man-1.6f => man}/man-1.5j-nocache.patch (100%)
 rename meta/recipes-extended/man/{man-1.6f => man}/man-1.5j-utf8.patch (100%)
 rename meta/recipes-extended/man/{man-1.6f => man}/man-1.5k-confpath.patch (100%)
 rename meta/recipes-extended/man/{man-1.6f => man}/man-1.5k-nonascii.patch (100%)
 rename meta/recipes-extended/man/{man-1.6f => man}/man-1.5k-sofix.patch (100%)
 rename meta/recipes-extended/man/{man-1.6f => man}/man-1.5m2-bug11621.patch (100%)
 rename meta/recipes-extended/man/{man-1.6f => man}/man-1.5m2-buildroot.patch (100%)
 rename meta/recipes-extended/man/{man-1.6f => man}/man-1.5m2-multiple.patch (100%)
 rename meta/recipes-extended/man/{man-1.6f => man}/man-1.5m2-no-color-for-printing.patch (100%)
 rename meta/recipes-extended/man/{man-1.6f => man}/man-1.5m2-sigpipe.patch (100%)
 rename meta/recipes-extended/man/{man-1.6f => man}/man-1.5m2-tv_fhs.patch (100%)
 rename meta/recipes-extended/man/{man-1.6f => man}/man-1.6e-i18n_whatis.patch (100%)
 rename meta/recipes-extended/man/{man-1.6f => man}/man-1.6e-lzma+xz-support.patch (100%)
 rename meta/recipes-extended/man/{man-1.6f => man}/man-1.6e-mandirs.patch (100%)
 rename meta/recipes-extended/man/{man-1.6f => man}/man-1.6e-new_sections.patch (100%)
 rename meta/recipes-extended/man/{man-1.6f => man}/man-1.6e-ro_usr.patch (100%)
 rename meta/recipes-extended/man/{man-1.6f => man}/man-1.6e-security.patch (100%)
 rename meta/recipes-extended/man/{man-1.6f => man}/man-1.6e-use_i18n_vars_in_a_std_way.patch (100%)
 rename meta/recipes-extended/man/{man-1.6f => man}/man-1.6e-whatis2.patch (100%)
 rename meta/recipes-extended/man/{man-1.6f => man}/man.1.gz (100%)
 rename meta/recipes-extended/man/{man-1.6f => man}/man.7.gz (100%)
 rename meta/recipes-extended/man/{man-1.6f => man}/man.conf (100%)
 rename meta/recipes-extended/man/{man-1.6f => man}/manpath.5.gz (100%)
 rename meta/recipes-extended/man/{man_1.6f.bb => man_1.6g.bb} (91%)
 delete mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.24.1/configure_nm.patch
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf-2.24.1 => gdk-pixbuf-2.26.5}/configure_fix.patch (100%)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf-2.24.1 => gdk-pixbuf-2.26.5}/extending-libinstall-dependencies.patch (100%)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf-2.24.1 => gdk-pixbuf-2.26.5}/hardcoded_libtool.patch (100%)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.24.1.bb => gdk-pixbuf_2.26.5.bb} (95%)
 delete mode 100644 meta/recipes-gnome/gnome/gconf-3.2.3/backenddir.patch
 rename meta/recipes-gnome/gnome/{gconf_3.2.3.bb => gconf_3.2.5.bb} (83%)
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
 delete mode 100644 meta/recipes-multimedia/libpng/libpng_1.2.50.bb
 create mode 100644 meta/recipes-multimedia/libpng/libpng_1.5.13.bb
 create mode 100644 meta/recipes-sato/matchbox-sato/matchbox-session-sato/matchbox-session-sato.schemas
 delete mode 100644 meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato-2_git.bb
 delete mode 100644 meta/recipes-support/icu/files/fix-parallel-build.patch
 delete mode 100644 meta/recipes-support/icu/files/gccfix.patch
 delete mode 100644 meta/recipes-support/icu/files/icu-add-pkgconfig-support.patch
 delete mode 100644 meta/recipes-support/icu/files/larger-cmd-size.patch
 delete mode 100644 meta/recipes-support/icu/files/noldlibpath.patch
 delete mode 100644 meta/recipes-support/icu/files/use-g++-for-linking.patch
 rename meta/recipes-support/icu/{icu-3.6.inc => icu.inc} (41%)
 delete mode 100644 meta/recipes-support/icu/icu_3.6.bb
 create mode 100644 meta/recipes-support/icu/icu_50.1.bb
 rename meta/recipes-support/nspr/{nspr_4.8.9.bb => nspr_4.9.4.bb} (92%)
 delete mode 100644 meta/recipes-support/sqlite/sqlite3_3.7.14.1.bb
 create mode 100644 meta/recipes-support/sqlite/sqlite3_3.7.15.0.bb

-- 
1.8.0.2



