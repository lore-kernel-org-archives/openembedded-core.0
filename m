Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 3B03C70100
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Jun 2017 14:58:38 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id 123so12672982wmg.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Jun 2017 07:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=07AyavSn3gYJiKzq1J7Kpk3Ublc2JVl9oeYgRD279kY=;
	b=dQYUUK4jtf/AIZIcfG3ol3pqMuv4ld+U5cr/P66KaIzvycSM9kRnn3l6vO/gGKnhKS
	bkOJCBFGSfTUPTmQu4hfpah+FcKvyC2v1l+BOSgxOhuwhNvL8VNIKe0WAU1zPTaQMFrW
	YAQddd63n0JGgOCDEYkbTO1e2QId2yF/iqYaMBQFbmtrzGuoqnbjqtfqE2rXQCunvgL+
	xx+aZmX8SJnhT+LWlK8aDH8hheoZGuBY6mDXrHJ+spc+jWintKTtuaKggAo/DS+8QpOa
	Efs36XTH6ve/Ls5PXF0bY6K5hLgp/FlmlwsrkzOSWg/iira42ltbaW1Ivf1jEHe04kMd
	gNpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=07AyavSn3gYJiKzq1J7Kpk3Ublc2JVl9oeYgRD279kY=;
	b=siAmEOa2WHvOKF/Rbe5S+1AOAIBGSeycNT2tOdD+4QPKiD4NOWBTbDIFit/7V71Dkz
	8LSkEtpB8lPlDqVNXL7LIiVhjaSv7CZ7O+U+xMajfFkxwtUCq+RfqeqZtKb3wvCHWWxv
	/aZtnZIO15Vq7eIRB0C4oBwmcpnPMIlate2FDdFjymMwYnsVecZUWNTmMPsn5l/ygX6F
	4RbsJ4DClcVuenhs7UINiVXBtg3fQIbqVOQHHOyt++zugiBNssL1MfD1h+/GuZPhvVd4
	qCA1gG+O1wtVq9XCK88gYvMuQRBMRzsHecyqnS5SWCl4Egh+wXvNAfOi+mH/idEun+pk
	yjsg==
X-Gm-Message-State: AODbwcDyP/LVr6EiAW/cUQfxbJ+2ZYIJA8ghJ8EpMyiTFXrqnm32vxn7
	BdA8EF4XEtc2C13zcw4=
X-Received: by 10.28.100.131 with SMTP id y125mr3132734wmb.2.1496415519229;
	Fri, 02 Jun 2017 07:58:39 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	l93sm11164827wrc.46.2017.06.02.07.58.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 02 Jun 2017 07:58:38 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Jun 2017 15:58:36 +0100
Message-Id: <cover.1496415439.git.ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH 00/41] Consolidated Pull
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
X-List-Received-Date: Fri, 02 Jun 2017 14:58:40 -0000

Another Friday, another consolidated pull.  The wic changes that were previously
in here have been deferred as there were mysterious dependency problems that I
can't replicate.

Ross

The following changes since commit 35ecff3cf077bd22cf7d0a6145732cdcc34f15dc:

  bitbake: fetch/git: add support for removing arbitrary revs for shallow (2017-06-02 13:36:57 +0100)

are available in the git repository at:

  ssh://git@git.yoctoproject.org/poky-contrib ross/mut

for you to fetch changes up to 6ec5f58acad63baba744ab1bd5901ff8256c6bfc:

  dropbear: upgrade 2016.74 -> 2017.75 (2017-06-02 15:10:29 +0100)

----------------------------------------------------------------
Choong YinThong (1):
      start_getty: Over added SERIAL_CONSOLE cause error in userspace log

Daniel Lublin (2):
      devtool: deploy-target: Don't use find -exec
      devtool: deploy-target: Let script continue even if rm fails

Dengke Du (2):
      json-glib: upgrade 1.2.2 -> 1.2.8
      dropbear: upgrade 2016.74 -> 2017.75

Ed Bartosh (1):
      isoimage-isohybrid: don't use TRANSLATED_TARGET_ARCH

Gan, Yau Wai (1):
      insane.bbclass: fix override handling in RDEPENDS QA

Jonathan Liu (1):
      bitbake.conf: Add sdl-config to HOSTTOOLS if using host SDL

Joshua Watt (1):
      archiver: Escape recipe name in regex

Jussi Kukkonen (18):
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
      vte: Upgrade 0.46.1 -> 0.48.3
      libevdev: Upgrade 1.5.6 -> 1.5.7
      clutter-1.0: Upgrade 1.26.0 -> 1.26.2
      clutter-gst-3.0: Upgrade 3.0.22 -> 3.0.24
      xf86-input-libinput: Upgrade 0.24.0 -> 0.25.1
      xserver-xorg: Upgrade 1.19.1 -> 1.19.3
      xkbcomp: Upgrade 1.3.1 -> 1.4.0
      xkeyboard-config: Upgrade 2.20 -> 2.21

Khem Raj (3):
      nfs-utils: Fix build error due to missing stdint.h> include
      glibc: Configure with extra hardening options
      libatomic-ops: Upgrade to 7.6.0

Leonardo Sandoval (1):
      maintainers: update maintainers in several python modules, cronie and swig

Marek Vasut (2):
      u-boot: Update to 2017.05 release
      u-boot: Fix build with OpenSSL 1.1.x

Maxin B. John (3):
      sqlite3: upgrade 3.18.0 -> 3.19.2
      libtasn1: upgrade 4.10 -> 4.12
      pkgconfig: upgrade 0.29.1 -> 0.29.2

Mikko Rapeli (1):
      scripts: Fix return value checks from subprocess.call()'s

Nicolas Dechesne (1):
      mesa: upgrade to 17.1.1

Ola x Nilsson (1):
      devtool: Compare abspath of both B and S

Paul Eggleton (1):
      classes/buildhistory: make a single commit per build

Ross Burton (1):
      kconfig-frontends: fix another build race

 meta-poky/conf/distro/include/maintainers.inc      |  32 ++---
 meta/classes/archiver.bbclass                      |   4 +-
 meta/classes/buildhistory.bbclass                  |  12 +-
 meta/classes/image_types_wic.bbclass               |   2 +-
 meta/classes/insane.bbclass                        |   2 +-
 meta/conf/bitbake.conf                             |   3 +
 .../0001-rsa-Fix-build-with-OpenSSL-1.1.x.patch    | 158 +++++++++++++++++++++
 ...ols-kwbimage-fix-build-with-OpenSSL-1.1.x.patch | 101 +++++++++++++
 meta/recipes-bsp/u-boot/files/default-gcc.patch    |  39 -----
 ...ommon_2017.01.inc => u-boot-common_2017.05.inc} |   8 +-
 ...utils_2017.01.bb => u-boot-fw-utils_2017.05.bb} |   2 -
 ...kimage_2017.01.bb => u-boot-mkimage_2017.05.bb} |   2 -
 .../{u-boot_2017.01.bb => u-boot_2017.05.bb}       |   0
 ...nclude-stdint.h-for-UINT16_MAX-definition.patch |  27 ++++
 .../nfs-utils/nfs-utils_2.1.1.bb                   |   1 +
 .../dropbear/support-out-of-tree-builds.patch      |  43 ------
 meta/recipes-core/dropbear/dropbear_2016.74.bb     |   7 -
 meta/recipes-core/dropbear/dropbear_2017.75.bb     |   5 +
 .../glib-2.0/glib-2.0/fix-conflicting-rand.patch   |  35 -----
 .../glib-2.0/glib-2.0/glib-gettextize-dir.patch    |  24 ----
 .../{glib-2.0_2.50.3.bb => glib-2.0_2.52.2.bb}     |   8 +-
 meta/recipes-core/glib-2.0/glib.inc                |   1 +
 meta/recipes-core/glibc/glibc_2.25.bb              |   4 +
 .../sysvinit/sysvinit-inittab/start_getty          |  38 ++++-
 .../kconfig-frontends/files/missing-mkdir.patch    |   4 +
 ...e-Move-warning-pragma-outside-of-function.patch |  39 -----
 meta/recipes-devtools/pkgconfig/pkgconfig_git.bb   |   5 +-
 .../0001-Don-t-use-AC_CANONICAL_HOST.patch         |  29 ++++
 ...heme_3.22.0.bb => adwaita-icon-theme_3.24.0.bb} |   5 +-
 ...d_3.22.2.bb => gnome-themes-standard_3.22.3.bb} |   4 +-
 .../gtk+/{gtk+3_3.22.8.bb => gtk+3_3.22.15.bb}     |   4 +-
 ..._3.22.8.bb => gtk-icon-utils-native_3.22.15.bb} |   4 +-
 .../{json-glib_1.2.2.bb => json-glib_1.2.8.bb}     |   4 +-
 .../{librsvg_2.40.16.bb => librsvg_2.40.17.bb}     |   7 +-
 ...clutter-1.0_1.26.0.bb => clutter-1.0_1.26.2.bb} |   4 +-
 ...gst-3.0_3.0.22.bb => clutter-gst-3.0_3.0.24.bb} |   4 +-
 .../{libepoxy_1.4.1.bb => libepoxy_1.4.2.bb}       |   4 +-
 .../0001-Use-wayland-scanner-in-the-path.patch     |  12 +-
 ...l-rand_xor-add-missing-include-statements.patch |  35 +++++
 .../mesa/{mesa-gl_17.0.6.bb => mesa-gl_17.1.1.bb}  |   0
 meta/recipes-graphics/mesa/mesa.inc                |   6 +-
 .../mesa/{mesa_17.0.6.bb => mesa_17.1.1.bb}        |   5 +-
 .../{xkbcomp_1.3.1.bb => xkbcomp_1.4.0.bb}         |   4 +-
 ...put_0.24.0.bb => xf86-input-libinput_0.25.1.bb} |   4 +-
 ...ard-config_2.20.bb => xkeyboard-config_2.21.bb} |   4 +-
 ...erver-xorg_1.19.1.bb => xserver-xorg_1.19.3.bb} |   4 +-
 ...at-spi2-atk_2.24.0.bb => at-spi2-atk_2.24.1.bb} |   4 +-
 ...-spi2-core_2.24.0.bb => at-spi2-core_2.24.1.bb} |   4 +-
 .../atk/{atk_2.22.0.bb => atk_2.24.0.bb}           |   4 +-
 .../gnutls/{libtasn1_4.10.bb => libtasn1_4.12.bb}  |   4 +-
 .../libatomic-ops/libatomic-ops_7.4.4.bb           |  32 -----
 .../libatomic-ops/libatomic-ops_7.6.0.bb           |  20 +++
 .../{libevdev_1.5.6.bb => libevdev_1.5.7.bb}       |   4 +-
 ...libsoup-2.4_2.56.0.bb => libsoup-2.4_2.58.1.bb} |   4 +-
 .../{sqlite3_3.18.0.bb => sqlite3_3.19.2.bb}       |   4 +-
 .../vte/{vte_0.46.1.bb => vte_0.48.3.bb}           |  11 +-
 scripts/lib/devtool/__init__.py                    |   2 +-
 scripts/lib/devtool/deploy.py                      |   8 +-
 .../lib/wic/plugins/source/isoimage-isohybrid.py   |   6 +-
 scripts/runqemu                                    |   8 +-
 60 files changed, 535 insertions(+), 329 deletions(-)
 create mode 100644 meta/recipes-bsp/u-boot/files/0001-rsa-Fix-build-with-OpenSSL-1.1.x.patch
 create mode 100644 meta/recipes-bsp/u-boot/files/0002-tools-kwbimage-fix-build-with-OpenSSL-1.1.x.patch
 delete mode 100644 meta/recipes-bsp/u-boot/files/default-gcc.patch
 rename meta/recipes-bsp/u-boot/{u-boot-common_2017.01.inc => u-boot-common_2017.05.inc} (57%)
 rename meta/recipes-bsp/u-boot/{u-boot-fw-utils_2017.01.bb => u-boot-fw-utils_2017.05.bb} (96%)
 rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2017.01.bb => u-boot-mkimage_2017.05.bb} (96%)
 rename meta/recipes-bsp/u-boot/{u-boot_2017.01.bb => u-boot_2017.05.bb} (100%)
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-include-stdint.h-for-UINT16_MAX-definition.patch
 delete mode 100644 meta/recipes-core/dropbear/dropbear/support-out-of-tree-builds.patch
 delete mode 100644 meta/recipes-core/dropbear/dropbear_2016.74.bb
 create mode 100644 meta/recipes-core/dropbear/dropbear_2017.75.bb
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/fix-conflicting-rand.patch
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/glib-gettextize-dir.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.50.3.bb => glib-2.0_2.52.2.bb} (70%)
 delete mode 100644 meta/recipes-devtools/pkgconfig/pkgconfig/0001-gdate-Move-warning-pragma-outside-of-function.patch
 create mode 100644 meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch
 rename meta/recipes-gnome/gnome/{adwaita-icon-theme_3.22.0.bb => adwaita-icon-theme_3.24.0.bb} (89%)
 rename meta/recipes-gnome/gnome/{gnome-themes-standard_3.22.2.bb => gnome-themes-standard_3.22.3.bb} (91%)
 rename meta/recipes-gnome/gtk+/{gtk+3_3.22.8.bb => gtk+3_3.22.15.bb} (84%)
 rename meta/recipes-gnome/gtk+/{gtk-icon-utils-native_3.22.8.bb => gtk-icon-utils-native_3.22.15.bb} (93%)
 rename meta/recipes-gnome/json-glib/{json-glib_1.2.2.bb => json-glib_1.2.8.bb} (82%)
 rename meta/recipes-gnome/librsvg/{librsvg_2.40.16.bb => librsvg_2.40.17.bb} (84%)
 rename meta/recipes-graphics/clutter/{clutter-1.0_1.26.0.bb => clutter-1.0_1.26.2.bb} (67%)
 rename meta/recipes-graphics/clutter/{clutter-gst-3.0_3.0.22.bb => clutter-gst-3.0_3.0.24.bb} (58%)
 rename meta/recipes-graphics/libepoxy/{libepoxy_1.4.1.bb => libepoxy_1.4.2.bb} (81%)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-util-rand_xor-add-missing-include-statements.patch
 rename meta/recipes-graphics/mesa/{mesa-gl_17.0.6.bb => mesa-gl_17.1.1.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_17.0.6.bb => mesa_17.1.1.bb} (76%)
 rename meta/recipes-graphics/xorg-app/{xkbcomp_1.3.1.bb => xkbcomp_1.4.0.bb} (78%)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-libinput_0.24.0.bb => xf86-input-libinput_0.25.1.bb} (63%)
 rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.20.bb => xkeyboard-config_2.21.bb} (87%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.19.1.bb => xserver-xorg_1.19.3.bb} (89%)
 rename meta/recipes-support/atk/{at-spi2-atk_2.24.0.bb => at-spi2-atk_2.24.1.bb} (81%)
 rename meta/recipes-support/atk/{at-spi2-core_2.24.0.bb => at-spi2-core_2.24.1.bb} (88%)
 rename meta/recipes-support/atk/{atk_2.22.0.bb => atk_2.24.0.bb} (79%)
 rename meta/recipes-support/gnutls/{libtasn1_4.10.bb => libtasn1_4.12.bb} (83%)
 delete mode 100644 meta/recipes-support/libatomic-ops/libatomic-ops_7.4.4.bb
 create mode 100644 meta/recipes-support/libatomic-ops/libatomic-ops_7.6.0.bb
 rename meta/recipes-support/libevdev/{libevdev_1.5.6.bb => libevdev_1.5.7.bb} (74%)
 rename meta/recipes-support/libsoup/{libsoup-2.4_2.56.0.bb => libsoup-2.4_2.58.1.bb} (89%)
 rename meta/recipes-support/sqlite/{sqlite3_3.18.0.bb => sqlite3_3.19.2.bb} (59%)
 rename meta/recipes-support/vte/{vte_0.46.1.bb => vte_0.48.3.bb} (84%)

Choong YinThong (1):
  start_getty: Over added SERIAL_CONSOLE cause error in userspace log

Daniel Lublin (2):
  devtool: deploy-target: Don't use find -exec
  devtool: deploy-target: Let script continue even if rm fails

Dengke Du (2):
  json-glib: upgrade 1.2.2 -> 1.2.8
  dropbear: upgrade 2016.74 -> 2017.75

Ed Bartosh (1):
  isoimage-isohybrid: don't use TRANSLATED_TARGET_ARCH

Gan, Yau Wai (1):
  insane.bbclass: fix override handling in RDEPENDS QA

Jonathan Liu (1):
  bitbake.conf: Add sdl-config to HOSTTOOLS if using host SDL

Joshua Watt (1):
  archiver: Escape recipe name in regex

Jussi Kukkonen (18):
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
  vte: Upgrade 0.46.1 -> 0.48.3
  libevdev: Upgrade 1.5.6 -> 1.5.7
  clutter-1.0: Upgrade 1.26.0 -> 1.26.2
  clutter-gst-3.0: Upgrade 3.0.22 -> 3.0.24
  xf86-input-libinput: Upgrade 0.24.0 -> 0.25.1
  xserver-xorg: Upgrade 1.19.1 -> 1.19.3
  xkbcomp: Upgrade 1.3.1 -> 1.4.0
  xkeyboard-config: Upgrade 2.20 -> 2.21

Khem Raj (3):
  nfs-utils: Fix build error due to missing stdint.h> include
  glibc: Configure with extra hardening options
  libatomic-ops: Upgrade to 7.6.0

Leonardo Sandoval (1):
  maintainers: update maintainers in several python modules, cronie and
    swig

Marek Vasut (2):
  u-boot: Update to 2017.05 release
  u-boot: Fix build with OpenSSL 1.1.x

Maxin B. John (3):
  sqlite3: upgrade 3.18.0 -> 3.19.2
  libtasn1: upgrade 4.10 -> 4.12
  pkgconfig: upgrade 0.29.1 -> 0.29.2

Mikko Rapeli (1):
  scripts: Fix return value checks from subprocess.call()'s

Nicolas Dechesne (1):
  mesa: upgrade to 17.1.1

Ola x Nilsson (1):
  devtool: Compare abspath of both B and S

Paul Eggleton (1):
  classes/buildhistory: make a single commit per build

Ross Burton (1):
  kconfig-frontends: fix another build race

 meta-poky/conf/distro/include/maintainers.inc      |  32 ++---
 meta/classes/archiver.bbclass                      |   4 +-
 meta/classes/buildhistory.bbclass                  |  12 +-
 meta/classes/image_types_wic.bbclass               |   2 +-
 meta/classes/insane.bbclass                        |   2 +-
 meta/conf/bitbake.conf                             |   3 +
 .../0001-rsa-Fix-build-with-OpenSSL-1.1.x.patch    | 158 +++++++++++++++++++++
 ...ols-kwbimage-fix-build-with-OpenSSL-1.1.x.patch | 101 +++++++++++++
 meta/recipes-bsp/u-boot/files/default-gcc.patch    |  39 -----
 ...ommon_2017.01.inc => u-boot-common_2017.05.inc} |   8 +-
 ...utils_2017.01.bb => u-boot-fw-utils_2017.05.bb} |   2 -
 ...kimage_2017.01.bb => u-boot-mkimage_2017.05.bb} |   2 -
 .../{u-boot_2017.01.bb => u-boot_2017.05.bb}       |   0
 ...nclude-stdint.h-for-UINT16_MAX-definition.patch |  27 ++++
 .../nfs-utils/nfs-utils_2.1.1.bb                   |   1 +
 .../dropbear/support-out-of-tree-builds.patch      |  43 ------
 meta/recipes-core/dropbear/dropbear_2016.74.bb     |   7 -
 meta/recipes-core/dropbear/dropbear_2017.75.bb     |   5 +
 .../glib-2.0/glib-2.0/fix-conflicting-rand.patch   |  35 -----
 .../glib-2.0/glib-2.0/glib-gettextize-dir.patch    |  24 ----
 .../{glib-2.0_2.50.3.bb => glib-2.0_2.52.2.bb}     |   8 +-
 meta/recipes-core/glib-2.0/glib.inc                |   1 +
 meta/recipes-core/glibc/glibc_2.25.bb              |   4 +
 .../sysvinit/sysvinit-inittab/start_getty          |  38 ++++-
 .../kconfig-frontends/files/missing-mkdir.patch    |   4 +
 ...e-Move-warning-pragma-outside-of-function.patch |  39 -----
 meta/recipes-devtools/pkgconfig/pkgconfig_git.bb   |   5 +-
 .../0001-Don-t-use-AC_CANONICAL_HOST.patch         |  29 ++++
 ...heme_3.22.0.bb => adwaita-icon-theme_3.24.0.bb} |   5 +-
 ...d_3.22.2.bb => gnome-themes-standard_3.22.3.bb} |   4 +-
 .../gtk+/{gtk+3_3.22.8.bb => gtk+3_3.22.15.bb}     |   4 +-
 ..._3.22.8.bb => gtk-icon-utils-native_3.22.15.bb} |   4 +-
 .../{json-glib_1.2.2.bb => json-glib_1.2.8.bb}     |   4 +-
 .../{librsvg_2.40.16.bb => librsvg_2.40.17.bb}     |   7 +-
 ...clutter-1.0_1.26.0.bb => clutter-1.0_1.26.2.bb} |   4 +-
 ...gst-3.0_3.0.22.bb => clutter-gst-3.0_3.0.24.bb} |   4 +-
 .../{libepoxy_1.4.1.bb => libepoxy_1.4.2.bb}       |   4 +-
 .../0001-Use-wayland-scanner-in-the-path.patch     |  12 +-
 ...l-rand_xor-add-missing-include-statements.patch |  35 +++++
 .../mesa/{mesa-gl_17.0.6.bb => mesa-gl_17.1.1.bb}  |   0
 meta/recipes-graphics/mesa/mesa.inc                |   6 +-
 .../mesa/{mesa_17.0.6.bb => mesa_17.1.1.bb}        |   5 +-
 .../{xkbcomp_1.3.1.bb => xkbcomp_1.4.0.bb}         |   4 +-
 ...put_0.24.0.bb => xf86-input-libinput_0.25.1.bb} |   4 +-
 ...ard-config_2.20.bb => xkeyboard-config_2.21.bb} |   4 +-
 ...erver-xorg_1.19.1.bb => xserver-xorg_1.19.3.bb} |   4 +-
 ...at-spi2-atk_2.24.0.bb => at-spi2-atk_2.24.1.bb} |   4 +-
 ...-spi2-core_2.24.0.bb => at-spi2-core_2.24.1.bb} |   4 +-
 .../atk/{atk_2.22.0.bb => atk_2.24.0.bb}           |   4 +-
 .../gnutls/{libtasn1_4.10.bb => libtasn1_4.12.bb}  |   4 +-
 ...batomic-ops_7.4.4.bb => libatomic-ops_7.6.0.bb} |  20 +--
 .../{libevdev_1.5.6.bb => libevdev_1.5.7.bb}       |   4 +-
 ...libsoup-2.4_2.56.0.bb => libsoup-2.4_2.58.1.bb} |   4 +-
 .../{sqlite3_3.18.0.bb => sqlite3_3.19.2.bb}       |   4 +-
 .../vte/{vte_0.46.1.bb => vte_0.48.3.bb}           |  11 +-
 scripts/lib/devtool/__init__.py                    |   2 +-
 scripts/lib/devtool/deploy.py                      |   8 +-
 .../lib/wic/plugins/source/isoimage-isohybrid.py   |   6 +-
 scripts/runqemu                                    |   8 +-
 59 files changed, 519 insertions(+), 313 deletions(-)
 create mode 100644 meta/recipes-bsp/u-boot/files/0001-rsa-Fix-build-with-OpenSSL-1.1.x.patch
 create mode 100644 meta/recipes-bsp/u-boot/files/0002-tools-kwbimage-fix-build-with-OpenSSL-1.1.x.patch
 delete mode 100644 meta/recipes-bsp/u-boot/files/default-gcc.patch
 rename meta/recipes-bsp/u-boot/{u-boot-common_2017.01.inc => u-boot-common_2017.05.inc} (57%)
 rename meta/recipes-bsp/u-boot/{u-boot-fw-utils_2017.01.bb => u-boot-fw-utils_2017.05.bb} (96%)
 rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2017.01.bb => u-boot-mkimage_2017.05.bb} (96%)
 rename meta/recipes-bsp/u-boot/{u-boot_2017.01.bb => u-boot_2017.05.bb} (100%)
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-include-stdint.h-for-UINT16_MAX-definition.patch
 delete mode 100644 meta/recipes-core/dropbear/dropbear/support-out-of-tree-builds.patch
 delete mode 100644 meta/recipes-core/dropbear/dropbear_2016.74.bb
 create mode 100644 meta/recipes-core/dropbear/dropbear_2017.75.bb
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/fix-conflicting-rand.patch
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/glib-gettextize-dir.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.50.3.bb => glib-2.0_2.52.2.bb} (70%)
 delete mode 100644 meta/recipes-devtools/pkgconfig/pkgconfig/0001-gdate-Move-warning-pragma-outside-of-function.patch
 create mode 100644 meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch
 rename meta/recipes-gnome/gnome/{adwaita-icon-theme_3.22.0.bb => adwaita-icon-theme_3.24.0.bb} (89%)
 rename meta/recipes-gnome/gnome/{gnome-themes-standard_3.22.2.bb => gnome-themes-standard_3.22.3.bb} (91%)
 rename meta/recipes-gnome/gtk+/{gtk+3_3.22.8.bb => gtk+3_3.22.15.bb} (84%)
 rename meta/recipes-gnome/gtk+/{gtk-icon-utils-native_3.22.8.bb => gtk-icon-utils-native_3.22.15.bb} (93%)
 rename meta/recipes-gnome/json-glib/{json-glib_1.2.2.bb => json-glib_1.2.8.bb} (82%)
 rename meta/recipes-gnome/librsvg/{librsvg_2.40.16.bb => librsvg_2.40.17.bb} (84%)
 rename meta/recipes-graphics/clutter/{clutter-1.0_1.26.0.bb => clutter-1.0_1.26.2.bb} (67%)
 rename meta/recipes-graphics/clutter/{clutter-gst-3.0_3.0.22.bb => clutter-gst-3.0_3.0.24.bb} (58%)
 rename meta/recipes-graphics/libepoxy/{libepoxy_1.4.1.bb => libepoxy_1.4.2.bb} (81%)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-util-rand_xor-add-missing-include-statements.patch
 rename meta/recipes-graphics/mesa/{mesa-gl_17.0.6.bb => mesa-gl_17.1.1.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_17.0.6.bb => mesa_17.1.1.bb} (76%)
 rename meta/recipes-graphics/xorg-app/{xkbcomp_1.3.1.bb => xkbcomp_1.4.0.bb} (78%)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-libinput_0.24.0.bb => xf86-input-libinput_0.25.1.bb} (63%)
 rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.20.bb => xkeyboard-config_2.21.bb} (87%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.19.1.bb => xserver-xorg_1.19.3.bb} (89%)
 rename meta/recipes-support/atk/{at-spi2-atk_2.24.0.bb => at-spi2-atk_2.24.1.bb} (81%)
 rename meta/recipes-support/atk/{at-spi2-core_2.24.0.bb => at-spi2-core_2.24.1.bb} (88%)
 rename meta/recipes-support/atk/{atk_2.22.0.bb => atk_2.24.0.bb} (79%)
 rename meta/recipes-support/gnutls/{libtasn1_4.10.bb => libtasn1_4.12.bb} (83%)
 rename meta/recipes-support/libatomic-ops/{libatomic-ops_7.4.4.bb => libatomic-ops_7.6.0.bb} (45%)
 rename meta/recipes-support/libevdev/{libevdev_1.5.6.bb => libevdev_1.5.7.bb} (74%)
 rename meta/recipes-support/libsoup/{libsoup-2.4_2.56.0.bb => libsoup-2.4_2.58.1.bb} (89%)
 rename meta/recipes-support/sqlite/{sqlite3_3.18.0.bb => sqlite3_3.19.2.bb} (59%)
 rename meta/recipes-support/vte/{vte_0.46.1.bb => vte_0.48.3.bb} (84%)

-- 
2.8.1


