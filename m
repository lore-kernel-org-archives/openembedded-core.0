Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 01A116103B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2013 07:14:39 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 02 Jul 2013 00:12:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,979,1363158000"; d="scan'208";a="339129440"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.91])
	by orsmga001.jf.intel.com with ESMTP; 02 Jul 2013 00:14:40 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Jul 2013 00:14:40 -0700
Message-Id: <cover.1372749046.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
MIME-Version: 1.0
Subject: [PREVIEW CONSOLIDATED PATCH 00/42] M2 Final Pull - Preview
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
X-List-Received-Date: Tue, 02 Jul 2013 07:14:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Paul, Ross:

Please take a look at this set, been tested mostly on the Auotbuiler,
I have already pulled a couple of items from MUT since they were causing
issues with the build.

I will send a final version in my morning for RP to sync with.

We need to start the Weekly build by around 11:00am PT.

Thanks
	Sau!

The following changes since commit ff65497cd9a96d5ab49b16ba1f7e30a216ff4a42:

  classes/insane: remove la2 check which no longer exists from ERROR_QA (2013-06-28 16:33:05 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Chen Qi (2):
  udev-cache: take a read-only rootfs into consideration
  base-files: remove the unnecessary /media/xxx directories

Ionut Radu (12):
  libxext: Update from 1.3.1 to 1.3.2
  libxcursor: Update from 1.1.13 to 1.1.14
  libxinerama: Updated from 1.1.2 to 1.1.3
  libxau: Updated from 1.0.7 to 1.0.8
  libxres: Updated from 1.0.6 to 1.0.7
  libxv: Updated from 1.0.7 to 1.0.8
  libxtst: Updated from 1.2.1 to 1.2.2
  libxxf86vm: Updated from 1.1.2 to 1.1.3
  libxfixes: Updated from 5.0 to 5.0.1
  libxcb: Updated from 1.9 to 1.9.1
  apt: Updated from 0.9.8.1 to 0.9.8.2
  gpgme: Updated from 1.4.1 to 1.4.2

Jonathan Liu (1):
  qt4e.bbclass: export OE_QMAKE_QT_CONFIG

Jukka Rissanen (1):
  connman: Set the VPN client program paths

Khem Raj (3):
  uclibc: Update to latest git/master version
  uclibc: Remove 0.9.33 recipes
  bison: Delete unused patch

Laurentiu Palcu (1):
  xinput-calibrator: move it from meta-oe to oe-core

Marc Ferland (1):
  openssh: fix initscript restart command

Paul Eggleton (11):
  python-async: add recipe
  python-smmap: add recipe
  python-gitdb: add recipe
  python-git: add recipe
  buildtools-tarball: add python-git
  packagegroup-self-hosted: add python-git
  lib/oe/lsb.py: fall back to /etc/os-release for host distro ID
  linux-firmware: be consistent with license package naming
  linux-firmware: fix ralink license file name
  python-native: add python-codecs-native to RPROVIDES
  lttng-modules: allow building without tracepoints enabled in kernel

Randy Witt (1):
  image-systemd: Support enabling/disabling units at image creation
    time.

Riku Voipio (1):
  webkit-gtk: add aarch64 support

Ross Burton (2):
  clutter: fix out-of-tree builds
  seperatebuilddir: cogl and clutter build out of tree

Saul Wold (4):
  packagegroup-core-basic: remove hardcode udev
  udev: Add RRECOMMENDS for udev-cache to enable the cache
  local.conf.sample.extended: Add example line for enabling security
    flags
  security_flags: Add the compiler and linker flags that enhance
    security

Tyler Hall (2):
  terminal: Run command using a wrapper script
  TmuxRunning: handle multi-word commands

 meta/classes/image-systemd.bbclass                 |   26 +
 meta/classes/qt4e.bbclass                          |    1 +
 meta/classes/terminal.bbclass                      |   41 +-
 meta/conf/distro/include/security_flags.inc        |   26 +
 meta/conf/distro/include/seperatebuilddir.inc      |    8 +-
 meta/conf/local.conf.sample.extended               |    4 +
 meta/lib/oe/lsb.py                                 |   16 +-
 meta/lib/oe/terminal.py                            |    2 +-
 meta/recipes-connectivity/connman/connman.inc      |    8 +-
 .../openssh/openssh-6.2p2/init                     |    2 +-
 meta/recipes-core/base-files/base-files/fstab      |    1 -
 meta/recipes-core/base-files/base-files_3.0.14.bb  |    7 +-
 meta/recipes-core/meta/buildtools-tarball.bb       |    1 +
 .../packagegroups/packagegroup-self-hosted.bb      |    1 +
 meta/recipes-core/uclibc/uclibc-0.9.33.inc         |   23 -
 .../uclibc/uclibc-0.9.33/argp-headers.patch        |  583 ---
 .../uclibc/uclibc-0.9.33/argp-support.patch        | 5192 --------------------
 .../uclibc-0.9.33/compile-arm-fork-with-O2.patch   |   21 -
 .../uclibc-0.9.33/define-MSG_CMSG_CLOEXEC.patch    |   25 -
 meta/recipes-core/uclibc/uclibc-0.9.33/dup3.patch  |   37 -
 ...so_use_arm_dl_linux_resolve_in_thumb_mode.patch |   27 -
 .../libc_symbols_include_bits_uclibc_config.patch  |   23 -
 .../uclibc/uclibc-0.9.33/mount.h-update.patch      |   83 -
 .../uclibc/uclibc-0.9.33/orign_path.patch          |  185 -
 .../uclibc/uclibc-0.9.33/posix_fallocate.patch     |  407 --
 .../uclibc/uclibc-0.9.33/powerpc_copysignl.patch   |  113 -
 .../remove_attribute_optimize_Os.patch             |  179 -
 .../uclibc/uclibc-0.9.33/uClibc.distro             |  190 -
 .../uclibc/uclibc-0.9.33/uClibc.machine            |   14 -
 .../uclibc/uclibc-0.9.33/uclibc-execvpe.patch      |  163 -
 .../uclibc-0.9.33/uclibc_enable_log2_test.patch    |   35 -
 meta/recipes-core/uclibc/uclibc-config.inc         |   12 +
 meta/recipes-core/uclibc/uclibc-git.inc            |    8 +-
 .../0001-add-posix_fadvise-for-arm.patch           |   68 +
 .../0001-i386-sysdep.h-Remove-STABS_-macros.patch  |   71 -
 ...-Move-aeabi_read_tp-to-uclibc_nonshared.a.patch |    9 +-
 meta/recipes-core/uclibc/uclibc-git/locale.cfg     |    3 +
 meta/recipes-core/uclibc/uclibc-git/obstack.cfg    |    1 +
 .../uclibc/uclibc-git/powerpc_copysignl.patch      |   10 +-
 meta/recipes-core/uclibc/uclibc-initial_0.9.33.bb  |   36 -
 meta/recipes-core/uclibc/uclibc.inc                |    6 +-
 meta/recipes-core/uclibc/uclibc_0.9.33.bb          |   22 -
 meta/recipes-core/udev/udev.inc                    |    2 +-
 meta/recipes-core/udev/udev/init                   |   54 +-
 meta/recipes-core/udev/udev/udev-cache             |    6 +
 .../disable-configure-in-makefile.patch            |    0
 .../fix-gcc-4.6-null-not-defined.patch             |    0
 .../{apt-0.9.8.1 => apt-0.9.8.2}/makerace.patch    |    0
 .../no-ko-translation.patch                        |    0
 .../{apt-0.9.8.1 => apt-0.9.8.2}/no-nls-dpkg.patch |    0
 .../{apt-0.9.8.1 => apt-0.9.8.2}/noconfigure.patch |    0
 .../apt/{apt-0.9.8.1 => apt-0.9.8.2}/nodoc.patch   |    0
 .../truncate-filename.patch                        |    0
 .../{apt-0.9.8.1 => apt-0.9.8.2}/use-host.patch    |    0
 ...apt-native_0.9.8.1.bb => apt-native_0.9.8.2.bb} |    0
 .../apt/{apt_0.9.8.1.bb => apt_0.9.8.2.bb}         |    4 +-
 .../recipes-devtools/bison/bison/remove-gets.patch |   20 -
 meta/recipes-devtools/python/python-async_0.6.1.bb |   17 +
 .../python/python-git_0.3.2.RC1.bb                 |   22 +
 meta/recipes-devtools/python/python-gitdb_0.5.4.bb |   18 +
 .../recipes-devtools/python/python-native_2.7.3.bb |    2 +-
 meta/recipes-devtools/python/python-smmap_0.8.2.bb |   20 +
 .../packagegroups/packagegroup-core-basic.bb       |    1 -
 meta/recipes-graphics/clutter/clutter-1.0.inc      |    2 +-
 .../xcb/{libxcb_1.9.bb => libxcb_1.9.1.bb}         |    4 +-
 .../pointercal-xinput/pointercal.xinput            |    1 +
 .../xinput-calibrator/pointercal-xinput_0.0.bb     |   17 +
 .../xinput-calibrator/30xinput_calibrate.sh        |    7 +
 ...t_calibrator_pointercal.sh-to-be-run-as-n.patch |   66 +
 .../xinput-calibrator/xinput-calibrator_git.bb     |   34 +
 .../xorg-lib/{libxau_1.0.7.bb => libxau_1.0.8.bb}  |    5 +-
 .../{libxcursor_1.1.13.bb => libxcursor_1.1.14.bb} |    5 +-
 .../{libxext_1.3.1.bb => libxext_1.3.2.bb}         |    7 +-
 .../{libxfixes_5.0.bb => libxfixes_5.0.1.bb}       |    4 +-
 .../{libxinerama_1.1.2.bb => libxinerama_1.1.3.bb} |    4 +-
 .../{libxres_1.0.6.bb => libxres_1.0.7.bb}         |    4 +-
 .../{libxtst_1.2.1.bb => libxtst_1.2.2.bb}         |    6 +-
 .../xorg-lib/{libxv_1.0.7.bb => libxv_1.0.8.bb}    |    4 +-
 .../{libxxf86vm_1.1.2.bb => libxxf86vm_1.1.3.bb}   |    4 +-
 .../linux-firmware/linux-firmware_git.bb           |   10 +-
 meta/recipes-kernel/lttng/lttng-modules_2.1.1.bb   |   11 +
 .../webkit/webkit-gtk-1.8.3/aarch64.patch          |   41 +
 meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb       |    1 +
 .../disable_gpgconf_check.patch                    |    0
 .../gpgme/{gpgme_1.4.1.bb => gpgme_1.4.2.bb}       |    6 +-
 85 files changed, 546 insertions(+), 7553 deletions(-)
 create mode 100644 meta/classes/image-systemd.bbclass
 create mode 100644 meta/conf/distro/include/security_flags.inc
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.33.inc
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.33/argp-headers.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.33/argp-support.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.33/compile-arm-fork-with-O2.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.33/define-MSG_CMSG_CLOEXEC.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.33/dup3.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.33/ldso_use_arm_dl_linux_resolve_in_thumb_mode.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.33/libc_symbols_include_bits_uclibc_config.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.33/mount.h-update.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.33/orign_path.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.33/posix_fallocate.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.33/powerpc_copysignl.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.33/remove_attribute_optimize_Os.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.33/uClibc.distro
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.33/uClibc.machine
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.33/uclibc-execvpe.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.33/uclibc_enable_log2_test.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-add-posix_fadvise-for-arm.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-i386-sysdep.h-Remove-STABS_-macros.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/locale.cfg
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/obstack.cfg
 delete mode 100644 meta/recipes-core/uclibc/uclibc-initial_0.9.33.bb
 delete mode 100644 meta/recipes-core/uclibc/uclibc_0.9.33.bb
 rename meta/recipes-devtools/apt/{apt-0.9.8.1 => apt-0.9.8.2}/disable-configure-in-makefile.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.9.8.1 => apt-0.9.8.2}/fix-gcc-4.6-null-not-defined.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.9.8.1 => apt-0.9.8.2}/makerace.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.9.8.1 => apt-0.9.8.2}/no-ko-translation.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.9.8.1 => apt-0.9.8.2}/no-nls-dpkg.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.9.8.1 => apt-0.9.8.2}/noconfigure.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.9.8.1 => apt-0.9.8.2}/nodoc.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.9.8.1 => apt-0.9.8.2}/truncate-filename.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.9.8.1 => apt-0.9.8.2}/use-host.patch (100%)
 rename meta/recipes-devtools/apt/{apt-native_0.9.8.1.bb => apt-native_0.9.8.2.bb} (100%)
 rename meta/recipes-devtools/apt/{apt_0.9.8.1.bb => apt_0.9.8.2.bb} (74%)
 delete mode 100644 meta/recipes-devtools/bison/bison/remove-gets.patch
 create mode 100644 meta/recipes-devtools/python/python-async_0.6.1.bb
 create mode 100644 meta/recipes-devtools/python/python-git_0.3.2.RC1.bb
 create mode 100644 meta/recipes-devtools/python/python-gitdb_0.5.4.bb
 create mode 100644 meta/recipes-devtools/python/python-smmap_0.8.2.bb
 rename meta/recipes-graphics/xcb/{libxcb_1.9.bb => libxcb_1.9.1.bb} (55%)
 create mode 100644 meta/recipes-graphics/xinput-calibrator/pointercal-xinput/pointercal.xinput
 create mode 100644 meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
 create mode 100644 meta/recipes-graphics/xinput-calibrator/xinput-calibrator/30xinput_calibrate.sh
 create mode 100644 meta/recipes-graphics/xinput-calibrator/xinput-calibrator/Allow-xinput_calibrator_pointercal.sh-to-be-run-as-n.patch
 create mode 100644 meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
 rename meta/recipes-graphics/xorg-lib/{libxau_1.0.7.bb => libxau_1.0.8.bb} (75%)
 rename meta/recipes-graphics/xorg-lib/{libxcursor_1.1.13.bb => libxcursor_1.1.14.bb} (79%)
 rename meta/recipes-graphics/xorg-lib/{libxext_1.3.1.bb => libxext_1.3.2.bb} (75%)
 rename meta/recipes-graphics/xorg-lib/{libxfixes_5.0.bb => libxfixes_5.0.1.bb} (79%)
 rename meta/recipes-graphics/xorg-lib/{libxinerama_1.1.2.bb => libxinerama_1.1.3.bb} (80%)
 rename meta/recipes-graphics/xorg-lib/{libxres_1.0.6.bb => libxres_1.0.7.bb} (77%)
 rename meta/recipes-graphics/xorg-lib/{libxtst_1.2.1.bb => libxtst_1.2.2.bb} (68%)
 rename meta/recipes-graphics/xorg-lib/{libxv_1.0.7.bb => libxv_1.0.8.bb} (78%)
 rename meta/recipes-graphics/xorg-lib/{libxxf86vm_1.1.2.bb => libxxf86vm_1.1.3.bb} (78%)
 create mode 100644 meta/recipes-sato/webkit/webkit-gtk-1.8.3/aarch64.patch
 rename meta/recipes-support/gpgme/{gpgme-1.4.1 => gpgme-1.4.2}/disable_gpgconf_check.patch (100%)
 rename meta/recipes-support/gpgme/{gpgme_1.4.1.bb => gpgme_1.4.2.bb} (83%)

-- 
1.8.1.4


