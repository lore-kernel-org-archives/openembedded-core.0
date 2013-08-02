Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 4B4F1601AF
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Aug 2013 07:15:13 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 02 Aug 2013 00:12:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,799,1367996400"; d="scan'208";a="380521152"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.203])
	by orsmga002.jf.intel.com with ESMTP; 02 Aug 2013 00:15:00 -0700
From: Saul Wold <sgw@linux.intel.com>
To: ross.burton@intel.com, paul.eggleton@linux.intel.com,
	richard.purdie@linuxfoundation.org,
	openembedded-core@lists.openembedded.org
Date: Fri,  2 Aug 2013 00:15:00 -0700
Message-Id: <cover.1375419531.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [CONSOLIDATED PULL 00/45] Initial Review - lots of upgrades
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
X-List-Received-Date: Fri, 02 Aug 2013 07:15:13 -0000

Ross, Paul:

Please review this batch, contains alot of updates along with some
patches and bug fixes.

Thanks
	Sau!


The following changes since commit f192c444c2d88c49738bea4ff4c3af0cc72916de:

  texinfo: Update to 5.1 (2013-07-31 06:56:28 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Chen Qi (1):
  opkg.inc: remove the obsolete REDIRECT_CMD

Cristian Iorga (2):
  alsa-lib: upgrade to v1.0.27.2
  alsa-utils: upgrade to 1.0.27.2

Eric Nelson (1):
  gst-plugins-gl: add explicit dependency on libpng

Ionut Radu (1):
  apt: Upgrade from 0.9.8.2 to 0.9.9.4

Joe MacDonald (1):
  oe-find-native-sysroot: minor optimization

Jukka Rissanen (3):
  ofono: Add systemd support
  ofono: Move bluetooth enabling to .inc file
  ofono: Enable test scripts by default

Khem Raj (1):
  gcc-4.8: Fix meta-fsl-arm iperf build issue

Laurentiu Palcu (13):
  adt_installer: allow specifying relative target sysroot paths
  xf86-video-intel: upgrade to 2.21.13
  git: upgrade to 1.8.3.4
  nasm: upgrade to 2.10.09
  powertop: upgrade to 2.4
  libdrm: upgrade to 2.4.46
  libpciaccess: upgrade to 0.13.2
  xrandr: upgrade to 1.4.1
  xf86-input-evdev: upgrade to 2.8.1
  xhost: upgrade to 1.0.6
  makedepend: upgrade to 1.0.5
  flex: upgrade to 2.5.37
  grub_2.00: fix compilation when using flex 2.5.37

Martin Jansa (1):
  mesa: inherit gettext

Muhammad Shakeel (1):
  avahi: Remove unnecessary runtime dependency on sysvinit-pidof

Paul Barker (1):
  opkg: Bump SRCREV as patch has been applied upstream

Paul Eggleton (3):
  classes/sanity: check for suid root command evility
  classes/sanity: fix some grammatical errors in messages
  grub: disable floating ncurses dependency for GPLv2 version

Richard Tollerton (1):
  shadow: Fix build when DISTRO_FEATURES contains pam, libc-crypt

Rogerio Nunes (1):
  packagegroup-core-tools-testapps: isolate x11 dependent tools

Ross Burton (3):
  bluez5: Add obex-profiles as a PACKAGECONFIG, package obexd separately
  qemu: remove unused SDL variable
  u-boot: state the MACHINE when skipping u-boot

Saul Wold (7):
  dpkg: upgrade to 1.17.1
  dpkg: Drop INC_PR as it's unused
  glew: upgrade to 1.10.0
  libgcrypt: upgrade to 1.5.3
  resolvconf: upgrade to 1.74
  xorg-cf-files: upgrade to 1.0.5
  grep: Add patch for texinfo 5.1

Stefan Stanacar (4):
  oeqa/utils/sshcontrol: increase and log timeout in output
  oeqa/utils/qemurunner: add comment and header
  oeqa/utils/qemurunner: tweak console bootparam and ip command
  oeqa/runtime/xorg: use the right ps command for xorg test

 meta/classes/sanity.bbclass                        | 16 ++++-
 meta/lib/oeqa/runtime/xorg.py                      |  4 +-
 meta/lib/oeqa/utils/qemurunner.py                  | 11 ++-
 meta/lib/oeqa/utils/sshcontrol.py                  | 10 +--
 .../grub-2.00/fix-issue-with-flex-2.5.37.patch     | 21 ++++++
 meta/recipes-bsp/grub/grub_0.97.bb                 |  2 +
 meta/recipes-bsp/grub/grub_2.00.bb                 |  4 +-
 meta/recipes-bsp/u-boot/u-boot.inc                 |  2 +-
 meta/recipes-connectivity/avahi/avahi.inc          |  2 -
 meta/recipes-connectivity/bluez5/bluez5.inc        | 13 +++-
 meta/recipes-connectivity/ofono/ofono.inc          | 11 ++-
 meta/recipes-connectivity/ofono/ofono_1.12.bb      |  4 --
 meta/recipes-connectivity/ofono/ofono_git.bb       |  4 --
 .../{resolvconf_1.73.bb => resolvconf_1.74.bb}     |  4 +-
 .../packagegroup-core-tools-testapps.bb            | 20 +++---
 .../disable-configure-in-makefile.patch            |  0
 .../fix-gcc-4.6-null-not-defined.patch             |  0
 .../{apt-0.9.8.2 => apt-0.9.9.4}/makerace.patch    | 12 ++--
 .../no-ko-translation.patch                        |  0
 .../{apt-0.9.8.2 => apt-0.9.9.4}/no-nls-dpkg.patch |  0
 .../{apt-0.9.8.2 => apt-0.9.9.4}/noconfigure.patch |  0
 .../apt/{apt-0.9.8.2 => apt-0.9.9.4}/nodoc.patch   |  0
 .../truncate-filename.patch                        |  0
 .../{apt-0.9.8.2 => apt-0.9.9.4}/use-host.patch    |  0
 ...apt-native_0.9.8.2.bb => apt-native_0.9.9.4.bb} |  0
 .../apt/{apt_0.9.8.2.bb => apt_0.9.9.4.bb}         |  4 +-
 meta/recipes-devtools/dpkg/dpkg.inc                |  2 -
 ...-for-mipsn32-el-and-mips64-el-to-arch-tab.patch | 78 ----------------------
 meta/recipes-devtools/dpkg/dpkg/preinst.patch      | 30 ++++-----
 .../dpkg/dpkg/remove-tar-no-timestamp.patch        | 21 +++---
 .../dpkg/{dpkg_1.16.10.bb => dpkg_1.17.1.bb}       |  7 +-
 .../flex/files/do_not_create_pdf_doc.patch         | 17 +++++
 .../flex/flex/avoid-FORTIFY-warnings.patch         | 59 ----------------
 .../flex/int-is-not-the-same-size-as-size_t.patch  | 42 ------------
 meta/recipes-devtools/flex/flex_2.5.35.bb          | 11 ---
 meta/recipes-devtools/flex/flex_2.5.37.bb          | 10 +++
 meta/recipes-devtools/gcc/gcc-4.8.inc              |  1 +
 .../gcc/gcc-4.8/0042-pr57748.patch                 | 78 ++++++++++++++++++++++
 .../git/{git_1.8.3.bb => git_1.8.3.4.bb}           |  4 +-
 .../installer/adt-installer/adt_installer          |  4 ++
 .../adt-installer/scripts/adt_installer_internal   |  2 +
 .../nasm/{nasm_2.10.07.bb => nasm_2.10.09.bb}      |  5 +-
 meta/recipes-devtools/opkg/opkg.inc                |  2 -
 .../0001-Fix-libopkg-header-installation.patch     | 32 ---------
 meta/recipes-devtools/opkg/opkg_svn.bb             |  3 +-
 meta/recipes-devtools/qemu/qemu.inc                |  4 --
 .../grep/grep-2.5.1a/fix-for-texinfo-5.1.patch     | 13 ++++
 meta/recipes-extended/grep/grep_2.5.1a.bb          |  1 +
 meta/recipes-extended/shadow/shadow_4.1.4.3.bb     |  4 ++
 .../drm/{libdrm_2.4.45.bb => libdrm_2.4.46.bb}     |  4 +-
 .../glew/files/fix-glew.pc-install.patch           | 23 ++++---
 .../glew/{glew_1.9.0.bb => glew_1.10.0.bb}         |  5 +-
 meta/recipes-graphics/mesa/mesa.inc                |  2 +-
 .../xorg-app/{xhost_1.0.5.bb => xhost_1.0.6.bb}    |  5 +-
 .../xorg-app/{xrandr_1.4.0.bb => xrandr_1.4.1.bb}  |  5 +-
 ...ut-evdev_2.8.0.bb => xf86-input-evdev_2.8.1.bb} |  4 +-
 ...intel_2.21.9.bb => xf86-video-intel_2.21.13.bb} |  4 +-
 ...bpciaccess_0.13.1.bb => libpciaccess_0.13.2.bb} |  8 +--
 .../obsolete_automake_macros.patch                 | 15 -----
 .../{makedepend_1.0.4.bb => makedepend_1.0.5.bb}   |  7 +-
 ...rg-cf-files_1.0.4.bb => xorg-cf-files_1.0.5.bb} |  5 +-
 .../powertop/{powertop_2.3.bb => powertop_2.4.bb}  |  4 +-
 .../fix-O0-Optimize-unable-inline-function.patch   | 63 -----------------
 .../alsa/alsa-lib/obsolete_automake_macros.patch   | 15 -----
 .../alsa/alsa-lib/unbreak_plugindir.patch          | 14 ----
 .../{alsa-lib_1.0.26.bb => alsa-lib_1.0.27.2.bb}   | 12 ++--
 ...f_1.0.26.bb => alsa-utils-alsaconf_1.0.27.2.bb} |  0
 ...-t-let-systemd-unit-restore-the-volume-wh.patch | 40 +++++------
 .../alsa/alsa-utils/obsolete_automake_macros.patch | 15 -----
 .../alsa/alsa-utils/uclibc-exp10-replacement.patch | 21 ------
 ...alsa-utils_1.0.26.bb => alsa-utils_1.0.27.2.bb} |  7 +-
 .../gstreamer/gst-plugins-gl_0.10.3.bb             |  2 +-
 meta/recipes-support/libgcrypt/libgcrypt_1.5.2.bb  |  4 --
 meta/recipes-support/libgcrypt/libgcrypt_1.5.3.bb  |  4 ++
 scripts/oe-find-native-sysroot                     |  4 +-
 75 files changed, 325 insertions(+), 541 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/grub-2.00/fix-issue-with-flex-2.5.37.patch
 rename meta/recipes-connectivity/resolvconf/{resolvconf_1.73.bb => resolvconf_1.74.bb} (92%)
 rename meta/recipes-devtools/apt/{apt-0.9.8.2 => apt-0.9.9.4}/disable-configure-in-makefile.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.9.8.2 => apt-0.9.9.4}/fix-gcc-4.6-null-not-defined.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.9.8.2 => apt-0.9.9.4}/makerace.patch (66%)
 rename meta/recipes-devtools/apt/{apt-0.9.8.2 => apt-0.9.9.4}/no-ko-translation.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.9.8.2 => apt-0.9.9.4}/no-nls-dpkg.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.9.8.2 => apt-0.9.9.4}/noconfigure.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.9.8.2 => apt-0.9.9.4}/nodoc.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.9.8.2 => apt-0.9.9.4}/truncate-filename.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.9.8.2 => apt-0.9.9.4}/use-host.patch (100%)
 rename meta/recipes-devtools/apt/{apt-native_0.9.8.2.bb => apt-native_0.9.9.4.bb} (100%)
 rename meta/recipes-devtools/apt/{apt_0.9.8.2.bb => apt_0.9.9.4.bb} (74%)
 delete mode 100644 meta/recipes-devtools/dpkg/dpkg/Add-support-for-mipsn32-el-and-mips64-el-to-arch-tab.patch
 rename meta/recipes-devtools/dpkg/{dpkg_1.16.10.bb => dpkg_1.17.1.bb} (58%)
 create mode 100644 meta/recipes-devtools/flex/files/do_not_create_pdf_doc.patch
 delete mode 100644 meta/recipes-devtools/flex/flex/avoid-FORTIFY-warnings.patch
 delete mode 100644 meta/recipes-devtools/flex/flex/int-is-not-the-same-size-as-size_t.patch
 delete mode 100644 meta/recipes-devtools/flex/flex_2.5.35.bb
 create mode 100644 meta/recipes-devtools/flex/flex_2.5.37.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0042-pr57748.patch
 rename meta/recipes-devtools/git/{git_1.8.3.bb => git_1.8.3.4.bb} (67%)
 rename meta/recipes-devtools/nasm/{nasm_2.10.07.bb => nasm_2.10.09.bb} (80%)
 delete mode 100644 meta/recipes-devtools/opkg/opkg/0001-Fix-libopkg-header-installation.patch
 create mode 100644 meta/recipes-extended/grep/grep-2.5.1a/fix-for-texinfo-5.1.patch
 rename meta/recipes-graphics/drm/{libdrm_2.4.45.bb => libdrm_2.4.46.bb} (46%)
 rename meta/recipes-graphics/glew/{glew_1.9.0.bb => glew_1.10.0.bb} (81%)
 rename meta/recipes-graphics/xorg-app/{xhost_1.0.5.bb => xhost_1.0.6.bb} (79%)
 rename meta/recipes-graphics/xorg-app/{xrandr_1.4.0.bb => xrandr_1.4.1.bb} (70%)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-evdev_2.8.0.bb => xf86-input-evdev_2.8.1.bb} (83%)
 rename meta/recipes-graphics/xorg-driver/{xf86-video-intel_2.21.9.bb => xf86-video-intel_2.21.13.bb} (85%)
 rename meta/recipes-graphics/xorg-lib/{libpciaccess_0.13.1.bb => libpciaccess_0.13.2.bb} (50%)
 delete mode 100644 meta/recipes-graphics/xorg-util/makedepend-1.0.4/obsolete_automake_macros.patch
 rename meta/recipes-graphics/xorg-util/{makedepend_1.0.4.bb => makedepend_1.0.5.bb} (76%)
 rename meta/recipes-graphics/xorg-util/{xorg-cf-files_1.0.4.bb => xorg-cf-files_1.0.5.bb} (65%)
 rename meta/recipes-kernel/powertop/{powertop_2.3.bb => powertop_2.4.bb} (87%)
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-lib/fix-O0-Optimize-unable-inline-function.patch
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-lib/obsolete_automake_macros.patch
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-lib/unbreak_plugindir.patch
 rename meta/recipes-multimedia/alsa/{alsa-lib_1.0.26.bb => alsa-lib_1.0.27.2.bb} (84%)
 rename meta/recipes-multimedia/alsa/{alsa-utils-alsaconf_1.0.26.bb => alsa-utils-alsaconf_1.0.27.2.bb} (100%)
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-utils/obsolete_automake_macros.patch
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-utils/uclibc-exp10-replacement.patch
 rename meta/recipes-multimedia/alsa/{alsa-utils_1.0.26.bb => alsa-utils_1.0.27.2.bb} (93%)
 delete mode 100644 meta/recipes-support/libgcrypt/libgcrypt_1.5.2.bb
 create mode 100644 meta/recipes-support/libgcrypt/libgcrypt_1.5.3.bb

-- 
1.8.1.4


