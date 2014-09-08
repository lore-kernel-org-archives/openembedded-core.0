Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id A144862252
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Sep 2014 11:58:51 +0000 (UTC)
Received: by mail-wi0-f171.google.com with SMTP id hi2so2485741wib.16
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Sep 2014 04:58:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-type:content-transfer-encoding;
	bh=cb9TEmGRTE98FF5220TkJQhMg2lvJEHsTgi4SAjXIl4=;
	b=LNkN5QSYqxzEuod+ZqXISOxnybC8Gy6JJ9WJPS7xhssqZW6dC4AGuLiXHm1ajlIy7S
	QPYVD/NAjuSxpfPACsJHxrMT5f4ZgL7BsT86kEQLEWHCtLldbB9mdA2+nFdkZehsNjud
	rP4FdbFcRq0k/Gu3pNZ5o1Ri/hOmBfP/ARJDvGPLFN/2GxvZnZ3eCkzi/WUg8x4iAEa7
	lXZS4MMkgk4YFFbU0bv3ggtVWH7Hfi55XLJc77D1d8Gyqr9/Zdt/cKGsNy1OJnWumr5z
	c4PlFix0xBRqAYvDIvIatKx8zk+fl83C6gpvXcFsh8NZL8gL8PjtAkZKO/5ZvschihiO
	xHpw==
X-Gm-Message-State: ALoCoQn43dIklwlJ0tJ0/4WNqKQpYrthgefOxsL21JpDyBA+Usrrbn9NYoSu0xLgLRAXqJZWkf6B
X-Received: by 10.180.212.78 with SMTP id ni14mr22450460wic.44.1410177532905; 
	Mon, 08 Sep 2014 04:58:52 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	gl10sm11003928wib.1.2014.09.08.04.58.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Sep 2014 04:58:52 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Sep 2014 12:58:18 +0100
Message-Id: <cover.1410177322.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 00/27] Consolidated pull
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
X-List-Received-Date: Mon, 08 Sep 2014 11:58:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

Working through the patch backlog, here is my first consolidated pull.  For
anyone watching closely this has had a few patches removed from the autobuilder
run which has some failures.

Ross

The following changes since commit 1894522f357fdf0b6adb2dcc14f12817628596bd:

  bitbake: tinfoil: add a means of enabling variable history tracking (2014-09-05 10:14:25 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ross/mut

for you to fetch changes up to 10bd19c2bde21e4e10615548c682c2001741eb19:

  alsa-utils: hard-code alsa-utils in SRC_URI (2014-09-08 12:53:09 +0100)

----------------------------------------------------------------
Chong Lu (2):
      libunwind: add recipes
      perf: add libunwind support

Cristian Iorga (1):
      alsa-utils: upgrade to 1.0.28

Dan McGregor (2):
      sudo: make sudoers a config file
      lighttpd: install config file without execute permissions

Drew Moseley (1):
      gstreamer: Set DEPENDS dynamically for plugins-ugly and plugins-bad

Fathi Boudra (1):
      shadow: add Qualcomm and STMicroelectronics SoCs

Hongxu Jia (3):
      sstate: Add extra intercept functions SSTATEPOSTCREATEFUNCS
      bbclass/sstate: add hook SSTATE_CHECK_FUNCTIONS for sstate checking
      bbclass/sstate_readonly: only allowed sstate-cache objects to be built (read-only sstate-cache)

Kévin THIERRY (1):
      package_manager: RpmPkgsList: determine rpm version

Marius Avram (1):
      glib-2.0: fix mount detection

Marko Lindqvist (5):
      gtk+2: update to 2.24.24
      libpng: drop unnecessary automake requirement lowering patch
      libpng: update to 1.6.13
      pango: update to 1.36.6
      gtk+3: update to 3.12.2

Martin Jansa (1):
      qemu.bbclass: add -r ${OLDEST_KERNEL} parameter

Mikhail Durnev (1):
      libxkbcommon: Add missing dependency on xkeyboard-config

Richard Purdie (1):
      alsa-utils: hard-code alsa-utils in SRC_URI

Robert Yang (2):
      insane.bbclass: add QA check: file-rdeps
      package_manager.py: use RPM_PREFER_ELF_ARCH

Ross Burton (1):
      pixman: upgrade to 0.32.6

Sujith H (2):
      os-release: Adding a new recipe for operating system identification
      systemd: Adding RRECOMMENDS for os-release

Yasir-Khan (2):
      bluez5: Allow method calls over dbus for bluetooth daemon
      python-native: disable user site support

 meta/classes/insane.bbclass                        |   72 +++++++++++++++++++-
 meta/classes/qemu.bbclass                          |   25 +++----
 meta/classes/sstate.bbclass                        |   30 +++++++-
 meta/classes/sstate_readonly.bbclass               |   53 ++++++++++++++
 meta/lib/oe/package_manager.py                     |   35 +++++-----
 meta/lib/oe/rootfs.py                              |    2 +-
 .../bluez5/bluez5/bluetooth.conf                   |    1 +
 ...un-media-sdX-drive-mount-if-username-root.patch |   39 +++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.40.0.bb      |    1 +
 meta/recipes-core/os-release/os-release.bb         |   36 ++++++++++
 meta/recipes-core/systemd/systemd_216.bb           |    2 +-
 .../recipes-devtools/python/python-native_2.7.3.bb |    4 ++
 meta/recipes-extended/lighttpd/lighttpd_1.4.35.bb  |    2 +-
 meta/recipes-extended/shadow/files/securetty       |   15 ++++
 meta/recipes-extended/sudo/sudo.inc                |    2 +
 ...utton-do-not-prelight-in-touchscreen-mode.patch |    0
 ...Duplicate-the-exec-string-returned-by-gtk.patch |    0
 .../cellrenderer-cairo.patch                       |    0
 .../configure-nm.patch                             |    0
 .../configurefix.patch                             |    0
 .../{gtk+-2.24.22 => gtk+-2.24.24}/doc-fixes.patch |    0
 .../entry-cairo.patch                              |    0
 .../hardcoded_libtool.patch                        |    0
 .../run-iconcache.patch                            |   11 +--
 .../toggle-font.diff                               |    0
 .../{gtk+-2.24.22 => gtk+-2.24.24}/xsettings.patch |    0
 meta/recipes-gnome/gtk+/gtk+3.inc                  |    6 +-
 .../fix-build-when-wayland-backend-enabled.patch   |   43 ------------
 .../gtk+/{gtk+3_3.10.7.bb => gtk+3_3.12.2.bb}      |    5 +-
 .../gtk+/{gtk+_2.24.22.bb => gtk+_2.24.24.bb}      |    4 +-
 .../pango/{pango_1.36.5.bb => pango_1.36.6.bb}     |    4 +-
 .../xorg-lib/libxkbcommon_0.4.3.bb                 |    2 +-
 .../xorg-lib/pixman/mips-export-revert.patch       |   22 ++++++
 .../{pixman_0.32.4.bb => pixman_0.32.6.bb}         |    5 +-
 meta/recipes-kernel/perf/perf-features.inc         |    2 +-
 meta/recipes-kernel/perf/perf.bb                   |    5 +-
 .../gstreamer/gst-meta-base_0.10.bb                |    7 +-
 .../gstreamer/gstreamer1.0-meta-base.bb            |    5 +-
 ...0001-configure-lower-automake-requirement.patch |   31 ---------
 .../libpng/{libpng_1.6.10.bb => libpng_1.6.13.bb}  |   11 ++-
 meta/recipes-support/libunwind/libunwind.inc       |   30 ++++++++
 meta/recipes-support/libunwind/libunwind_1.1.bb    |    4 ++
 42 files changed, 381 insertions(+), 135 deletions(-)
 create mode 100644 meta/classes/sstate_readonly.bbclass
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/allow-run-media-sdX-drive-mount-if-username-root.patch
 create mode 100644 meta/recipes-core/os-release/os-release.bb
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.22 => gtk+-2.24.24}/0001-GtkButton-do-not-prelight-in-touchscreen-mode.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.22 => gtk+-2.24.24}/0001-bgo-584832-Duplicate-the-exec-string-returned-by-gtk.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.22 => gtk+-2.24.24}/cellrenderer-cairo.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.22 => gtk+-2.24.24}/configure-nm.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.22 => gtk+-2.24.24}/configurefix.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.22 => gtk+-2.24.24}/doc-fixes.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.22 => gtk+-2.24.24}/entry-cairo.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.22 => gtk+-2.24.24}/hardcoded_libtool.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.22 => gtk+-2.24.24}/run-iconcache.patch (72%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.22 => gtk+-2.24.24}/toggle-font.diff (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.22 => gtk+-2.24.24}/xsettings.patch (100%)
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+3/fix-build-when-wayland-backend-enabled.patch
 rename meta/recipes-gnome/gtk+/{gtk+3_3.10.7.bb => gtk+3_3.12.2.bb} (75%)
 rename meta/recipes-gnome/gtk+/{gtk+_2.24.22.bb => gtk+_2.24.24.bb} (93%)
 rename meta/recipes-graphics/pango/{pango_1.36.5.bb => pango_1.36.6.bb} (56%)
 create mode 100644 meta/recipes-graphics/xorg-lib/pixman/mips-export-revert.patch
 rename meta/recipes-graphics/xorg-lib/{pixman_0.32.4.bb => pixman_0.32.6.bb} (86%)
 delete mode 100644 meta/recipes-multimedia/libpng/libpng/0001-configure-lower-automake-requirement.patch
 rename meta/recipes-multimedia/libpng/{libpng_1.6.10.bb => libpng_1.6.13.bb} (58%)
 create mode 100644 meta/recipes-support/libunwind/libunwind.inc
 create mode 100644 meta/recipes-support/libunwind/libunwind_1.1.bb

Chong Lu (2):
  libunwind: add recipes
  perf: add libunwind support

Cristian Iorga (1):
  alsa-utils: upgrade to 1.0.28

Dan McGregor (2):
  sudo: make sudoers a config file
  lighttpd: install config file without execute permissions

Drew Moseley (1):
  gstreamer: Set DEPENDS dynamically for plugins-ugly and plugins-bad

Fathi Boudra (1):
  shadow: add Qualcomm and STMicroelectronics SoCs

Hongxu Jia (3):
  sstate: Add extra intercept functions SSTATEPOSTCREATEFUNCS
  bbclass/sstate: add hook SSTATE_CHECK_FUNCTIONS for sstate checking
  bbclass/sstate_readonly: only allowed sstate-cache objects to be
    built (read-only sstate-cache)

Kévin THIERRY (1):
  package_manager: RpmPkgsList: determine rpm version

Marius Avram (1):
  glib-2.0: fix mount detection

Marko Lindqvist (5):
  gtk+2: update to 2.24.24
  libpng: drop unnecessary automake requirement lowering patch
  libpng: update to 1.6.13
  pango: update to 1.36.6
  gtk+3: update to 3.12.2

Martin Jansa (1):
  qemu.bbclass: add -r ${OLDEST_KERNEL} parameter

Mikhail Durnev (1):
  libxkbcommon: Add missing dependency on xkeyboard-config

Richard Purdie (1):
  alsa-utils: hard-code alsa-utils in SRC_URI

Robert Yang (2):
  insane.bbclass: add QA check: file-rdeps
  package_manager.py: use RPM_PREFER_ELF_ARCH

Ross Burton (1):
  pixman: upgrade to 0.32.6

Sujith H (2):
  os-release: Adding a new recipe for operating system identification
  systemd: Adding RRECOMMENDS for os-release

Yasir-Khan (2):
  bluez5: Allow method calls over dbus for bluetooth daemon
  python-native: disable user site support

 meta/classes/insane.bbclass                        |   72 +++++++++++++++++++-
 meta/classes/qemu.bbclass                          |   25 +++----
 meta/classes/sstate.bbclass                        |   30 +++++++-
 meta/classes/sstate_readonly.bbclass               |   53 ++++++++++++++
 meta/lib/oe/package_manager.py                     |   35 +++++-----
 meta/lib/oe/rootfs.py                              |    2 +-
 .../bluez5/bluez5/bluetooth.conf                   |    1 +
 ...un-media-sdX-drive-mount-if-username-root.patch |   39 +++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.40.0.bb      |    1 +
 meta/recipes-core/os-release/os-release.bb         |   36 ++++++++++
 meta/recipes-core/systemd/systemd_216.bb           |    2 +-
 .../recipes-devtools/python/python-native_2.7.3.bb |    4 ++
 meta/recipes-extended/lighttpd/lighttpd_1.4.35.bb  |    2 +-
 meta/recipes-extended/shadow/files/securetty       |   15 ++++
 meta/recipes-extended/sudo/sudo.inc                |    2 +
 ...utton-do-not-prelight-in-touchscreen-mode.patch |    0
 ...Duplicate-the-exec-string-returned-by-gtk.patch |    0
 .../cellrenderer-cairo.patch                       |    0
 .../configure-nm.patch                             |    0
 .../configurefix.patch                             |    0
 .../{gtk+-2.24.22 => gtk+-2.24.24}/doc-fixes.patch |    0
 .../entry-cairo.patch                              |    0
 .../hardcoded_libtool.patch                        |    0
 .../run-iconcache.patch                            |   11 +--
 .../toggle-font.diff                               |    0
 .../{gtk+-2.24.22 => gtk+-2.24.24}/xsettings.patch |    0
 meta/recipes-gnome/gtk+/gtk+3.inc                  |    6 +-
 .../fix-build-when-wayland-backend-enabled.patch   |   43 ------------
 .../gtk+/{gtk+3_3.10.7.bb => gtk+3_3.12.2.bb}      |    5 +-
 .../gtk+/{gtk+_2.24.22.bb => gtk+_2.24.24.bb}      |    4 +-
 .../pango/{pango_1.36.5.bb => pango_1.36.6.bb}     |    4 +-
 .../xorg-lib/libxkbcommon_0.4.3.bb                 |    2 +-
 .../xorg-lib/pixman/mips-export-revert.patch       |   22 ++++++
 .../{pixman_0.32.4.bb => pixman_0.32.6.bb}         |    5 +-
 meta/recipes-kernel/perf/perf-features.inc         |    2 +-
 meta/recipes-kernel/perf/perf.bb                   |    5 +-
 .../gstreamer/gst-meta-base_0.10.bb                |    7 +-
 .../gstreamer/gstreamer1.0-meta-base.bb            |    5 +-
 ...0001-configure-lower-automake-requirement.patch |   31 ---------
 .../libpng/{libpng_1.6.10.bb => libpng_1.6.13.bb}  |   11 ++-
 meta/recipes-support/libunwind/libunwind.inc       |   30 ++++++++
 meta/recipes-support/libunwind/libunwind_1.1.bb    |    4 ++
 42 files changed, 381 insertions(+), 135 deletions(-)
 create mode 100644 meta/classes/sstate_readonly.bbclass
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/allow-run-media-sdX-drive-mount-if-username-root.patch
 create mode 100644 meta/recipes-core/os-release/os-release.bb
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.22 => gtk+-2.24.24}/0001-GtkButton-do-not-prelight-in-touchscreen-mode.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.22 => gtk+-2.24.24}/0001-bgo-584832-Duplicate-the-exec-string-returned-by-gtk.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.22 => gtk+-2.24.24}/cellrenderer-cairo.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.22 => gtk+-2.24.24}/configure-nm.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.22 => gtk+-2.24.24}/configurefix.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.22 => gtk+-2.24.24}/doc-fixes.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.22 => gtk+-2.24.24}/entry-cairo.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.22 => gtk+-2.24.24}/hardcoded_libtool.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.22 => gtk+-2.24.24}/run-iconcache.patch (72%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.22 => gtk+-2.24.24}/toggle-font.diff (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.22 => gtk+-2.24.24}/xsettings.patch (100%)
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+3/fix-build-when-wayland-backend-enabled.patch
 rename meta/recipes-gnome/gtk+/{gtk+3_3.10.7.bb => gtk+3_3.12.2.bb} (75%)
 rename meta/recipes-gnome/gtk+/{gtk+_2.24.22.bb => gtk+_2.24.24.bb} (93%)
 rename meta/recipes-graphics/pango/{pango_1.36.5.bb => pango_1.36.6.bb} (56%)
 create mode 100644 meta/recipes-graphics/xorg-lib/pixman/mips-export-revert.patch
 rename meta/recipes-graphics/xorg-lib/{pixman_0.32.4.bb => pixman_0.32.6.bb} (86%)
 delete mode 100644 meta/recipes-multimedia/libpng/libpng/0001-configure-lower-automake-requirement.patch
 rename meta/recipes-multimedia/libpng/{libpng_1.6.10.bb => libpng_1.6.13.bb} (58%)
 create mode 100644 meta/recipes-support/libunwind/libunwind.inc
 create mode 100644 meta/recipes-support/libunwind/libunwind_1.1.bb

-- 
1.7.10.4


