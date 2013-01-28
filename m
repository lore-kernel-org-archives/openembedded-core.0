Received: from new.bec-systems.com ([74.208.70.121] helo=bec-systems.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1Tzrm0-0004Ws-P4; Mon, 28 Jan 2013 17:41:35 +0100
Received: from oh-69-34-21-229.sta.embarqhsd.net ([69.34.21.229]
	helo=happy.bec-systems.com)
	by bec-systems.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cliff.brake@gmail.com>)
	id 1TzrLm-0003Bt-RI; Mon, 28 Jan 2013 11:14:30 -0500
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Date: Mon, 28 Jan 2013 16:25:43 GMT
Message-Id: <1359390343148.556dd4e8@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
X-Spam_score: -2.9
X-Spam_score_int: -28
X-Spam_bar: --
Subject: OE Changelog since 2013-01-20 until 2013-01-27
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
X-List-Received-Date: Mon, 28 Jan 2013 16:41:35 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2013-01-20 until 2013-01-27.  Projects included in this =
report:

bitbake: git://git.openembedded.org/bitbake
openembedded-core: git://git.openembedded.org/openembedded-core
meta-openembedded: git://git.openembedded.org/meta-openembedded
meta-angstrom: git://github.com/Angstrom-distribution/meta-angstrom.git
meta-arago: git://arago-project.org/git/meta-arago.git
meta-beagleboard: git://github.com/beagleboard/meta-beagleboard.git
meta-browser: git://github.com/OSSystems/meta-browser.git
meta-bug: git://github.com/buglabs/meta-bug.git
meta-chicken: git://github.com/OSSystems/meta-chicken
meta-efikamx: git://github.com/kraj/meta-efikamx.git
meta-ettus: http://github.com/koenkooi/meta-ettus.git
meta-fsl-arm: git://git.yoctoproject.org/meta-fsl-arm
meta-fsl-arm-extra: git://github.com/Freescale/meta-fsl-arm-extra.git
meta-fsl-ppc: git://git.yoctoproject.org/meta-fsl-ppc
meta-guacamayo: git://github.com/Guacamayo/meta-guacamayo.git
meta-gumstix: git://github.com/gumstix/meta-gumstix.git
meta-gumstix-community: =
git://gitorious.org/schnitzeltony-oe-meta/meta-gumstix-community.git
meta-handheld: git://git.openembedded.org/meta-handheld
meta-igep: http://github.com/ebutera/meta-igep.git
meta-intel: git://git.yoctoproject.org/meta-intel
meta-ivi: git://git.yoctoproject.org/meta-ivi
meta-java: git://github.com/woglinde/meta-java
meta-kde: git://gitorious.org/openembedded-core-layers/meta-kde.git
meta-micro: git://git.openembedded.org/meta-micro
meta-mono: git://git.yoctoproject.org/meta-mono.git
meta-netbookpro: git://github.com/tworaz/meta-netbookpro
meta-nslu2: git://github.com/kraj/meta-nslu2
meta-opie: git://git.openembedded.org/meta-opie
meta-qt3: git://git.yoctoproject.org/meta-qt3
meta-slugos: git://github.com/kraj/meta-slugos
meta-systemd: git://git.yoctoproject.org/meta-systemd
meta-raspberrypi: git://github.com/djwillis/meta-raspberrypi.git
meta-smartphone: http://git.shr-project.org/repo/meta-smartphone.git
meta-ti: git://git.yoctoproject.org/meta-ti
meta-webos: git://github.com/openwebos/meta-webos.git
meta-xilinx: git://git.yoctoproject.org/meta-xilinx
meta-yocto: git://git.yoctoproject.org/meta-yocto
openembedded: git://git.openembedded.org/openembedded

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for bitbake:

Constantin Musca (3):
=20=20parse_py: add ~ to config_regexp
=20=20persist_data: add get_by_pattern method to API
=20=20prserv: use only PRSERV_HOST

Cristiana Voicu (4):
=20=20hob: progress bar changed to busy cursor when you open log file
=20=20hob: Hob should display warnings generated during parsing
=20=20hob: combo box updated correctly
=20=20hob: hob do not use .hob dir for variables from local.conf and =
bblayers.conf

Richard Purdie (4):
=20=20bitbake: BBHandler/ConfHandler: Improve multiline comment handling
=20=20BBHandler/ConfHandler: Merge fix for multiline comments
=20=20crumbs: Add file lost from previous commit
=20=20bitbake-diffigs: Don't pull in tinfoil unless we really need/plan to =
use it

Robert Yang (2):
=20=20cache.py: remove the duplicated self.file_depends
=20=20bitbake-layers: fix get_file_layer

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Chen Qi (2):
=20=20rootfs_rpm.bbclass: fix the unexpected postinst error
=20=20init-live.sh: move /media/xxx over to the real root filesystem

Christopher Larson (1):
=20=20package.bbclass: drop unnecessary and broken packages.remove()

Constantin Musca (10):
=20=20prserv: add LOCALCOUNT to AUTOINCs migration feature
=20=20prserv: change PRSERV_HOST semantics
=20=20prserv: change PRSERV_HOST format
=20=20packagegroup-core-gtk-directfb: rename to packagegroup-core-directfb
=20=20core-image-gtk-directfb: rename to core-image-directfb
=20=20gtk+: remove directfb support
=20=20cairo: use directfb instead of gtk-directfb
=20=20cairo: upgrade to 1.12.10
=20=20puzzles: upgrade to r9751
=20=20wpa-supplicant: upgrade to 2.0

Cristian Iorga (1):
=20=20dbus: upgrade to 1.6.8

Darren Hart (1):
=20=20bb-matrix: Fix min and max calculations

Jack Mitchell (1):
=20=20systemd: remove usbutils dependancy

Kang Kai (3):
=20=20createrepo-native: update dependency
=20=20perl-native: update to 5.14.3:
=20=20perl: update to 5.14.3

Khem Raj (12):
=20=20boost: Upgrade 1.51 -> 1.52
=20=20uclibc-git: Upgrades to latest git
=20=20systemd: Fix build on uclibc
=20=20qemu.inc: Define preferred providers for libgl, libgles1 and libgles2
=20=20systemd: Fix build on ppc
=20=20nfs-utils: Upgrade 1.2.3 -> 1.2.8-rc3
=20=20uclibc-git/uClibc.distro: Enable UCLIBC_HAS_REENTRANT_RPC
=20=20tcmode-default.inc: Switch to git version of uclibc by default
=20=20libtirpc: Disable DES functions on uclibc
=20=20libpcap: Turn canusb support into PACKAGECONFIG
=20=20gawk: Add missing dependency on readline
=20=20gettext: Fix build with uclibc remove upstreamed patches

Marcin Juszkiewicz (2):
=20=20bitbake.conf: unbreak all builds with custom DISTRO_FEATURES
=20=20eglibc: fix evacuate_scripts for external toolchains

Martin Jansa (5):
=20=20prservice.py: fix NameError: global name 'host' is not defined
=20=20automake: use autotools_do_install
=20=20gcc-configure-runtime: always remove info/dir
=20=20eglibc-package: remove infodir/dir if it exists
=20=20eglibc-scripts: don't package mtrace, RDEPEND on eglibc-mtrace =
instead, fix=20

Matthew McClintock (1):
=20=20oprofile: backport patches to fix ppc build issues

MiLo (1):
=20=20gcc: Enable OpenMP compiling and library

Paul Eggleton (7):
=20=20zypper: remove
=20=20libzypp: remove
=20=20sat-solver: remove
=20=20classes/image-swab: remove zypper-related references
=20=20libcheck: fix HOMEPAGE
=20=20rpm: properly disable perl file dependency checking for rpmdeps
=20=20valgrind: explicitly disable MPI2 support

Philip Balister (1):
=20=20base.bblass : Add support for cmake to PACKAGECONFIG.

Radu Moisan (1):
=20=20sample.extended: Add DISTRO_FEATURES_INITMAN

Richard Purdie (14):
=20=20perl: Fix errors if configure is reattempted
=20=20core-image-lsb-sdk/dev: Inherit the base image instead of duplicating
=20=20base: make feature backfilling happen earlier
=20=20packagegroup-core-x11-xserver: Add XSERVERCODECS variable
=20=20core-image: Add hwcodecs IMAGE_FEATURE
=20=20sanity.bbclass: Ensure tmpdir exists when running the check
=20=20packagedata: Add error message if multiple recipes try to write the =
same pac
=20=20cpan_build: Fix cmaker Build.PL module builds
=20=20perl-native: Add errno_ver.diff patch to native perl
=20=20perl: Add dyanloader build hack
=20=20perl-rprovides: Fix perl-module-config anf perl-module-build providers
=20=20Split do_packagedata task from do_package
=20=20sstate: Add optimisation for useradd injected dependencies
=20=20staging: Drop obsolete comments

Ross Burton (15):
=20=20gtk+3: refresh cross.patch
=20=20systemd: skip in non-systemd distros to fix world builds
=20=20udev: skip in systemd distros, to fix world builds
=20=20systemd: fix typo in FILES
=20=20gtk-doc: parameterise the documentation directory
=20=20systemd: use new GTKDOC_DOCDIR and clean up
=20=20systemd: add missing patch headers
=20=20site: add x86-32/64 alignment values for at-spi2-core
=20=20gupnp: remove, migrated to meta-multimedia
=20=20packagegroup-sdk-gmae: remove GUPnP stack as it's no longer in oe-core
=20=20systemd: update uclibc patch headers
=20=20systemd-serialgetty: remove redundant statements
=20=20systemd-serialgetty: skip package when not using systemd
=20=20systemd: remove unused SERIAL_CONSOLE variable
=20=20meta: remove all mention of PCMCIA_MANAGER

Saul Wold (1):
=20=20blktrace: add back do_install method

Wenzong Fan (1):
=20=20git: remove unpackaged perl-native files

Wolfgang Denk (1):
=20=20populate_sdk_base.bbclass: Allow installation of ix86 SDK on x86_64 =
host

wenzong.fan@windriver.com (1):
=20=20bind: disable nslookup man page

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Amy Fong (1):
=20=20autofs: fails to compile with openldap disabled

Jack Mitchell (1):
=20=20jansson: update to 2.4

Khem Raj (2):
=20=20lua5.1: Fix multilib install
=20=20luajit_2.0.0.bb: Fix regexpt to change hardcodes path to fix rebuilds

Koen Kooi (5):
=20=20apcupsd: add 3.14.10
=20=20iftop: add 1.0pre2
=20=20accel-ppp: add 1.7.3 + fixes from git
=20=20znc: add git version
=20=20yasm: import from meta-intel and update to 1.2.0

Marcin Juszkiewicz (1):
=20=20php: cleanup QA warnings

Martin Jansa (6):
=20=20systemd: remove dbus-systemd from RDEPENDS
=20=20webkit-efl: add edbus dependency
=20=20openldap: fix QA warnings
=20=20gateone: fix QA warnings
=20=20xfce-icon-theme: fix QA warnings
=20=20autofs: fix QA warnings

Riku Voipio (1):
=20=20fuse: add aarch64 support

Ross Burton (2):
=20=20libcanberra: upgrade and refresh packaging
=20=20metacity: add, from oe-core

Wayne Tams (1):
=20=20gst-rtsp: add GStreamer RTSP server/library

Zhenhua Luo (1):
=20=20apache2: fix the race issue of parallel installation

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Andreas M=C3=BCller (1):
=20=20angstrom-next.conf: remove PREFERRED_PROVIDER_udev

Khem Raj (2):
=20=20angstrom/conf: Add systemd to DISTRO_FEATURES
=20=20zypper: Delete bbappend

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Chase Maupin (9):
=20=20arago-amsdk-image: use gz compression instead of bz2
=20=20tisdk-image: Package gz file systems by default
=20=20tisdk-image: Fix missing header in SW manifest
=20=20ti-tisdk-setup: Pull latest sources for create-sdcard fix
=20=20ti-crypto-examples: Add cryptography example C applications
=20=20crypto-tasks: Add ti-crypto-examples
=20=20ti-tisdk-makefile: add ti-crypto-examples targets
=20=20matrix-gui-apps-git: update to latest commit
=20=20ti-crypto-examples: update to latest sources and add DEPENDS

Dave Gerlach (2):
=20=20Makefile_am-benchmarks: Renamed to Makefile_arm-benchmarks
=20=20Makefile_qml-playground: Renamed to Makefile_quick-playground

Eyal Reizer (14):
=20=20wifi-direct-demo: fix segmentation error on exit
=20=20bluetooth-gui: Fix segmentation fault on exit
=20=20battleship: Fix build issue when upgrading qt4
=20=20obexd: increase opp push timeout
=20=20ti-compat-wireless-wl12xx: update for wlan r5_sp3 release
=20=20wl12xx-firmware: update for wlan r5_sp3 release
=20=20ti-compat-bluetooth: update to use a different compat zip
=20=20hostapd: update for wlan r5_sp3 release
=20=20wpa-supplicant: update based on wlan r5_sp3 release
=20=20ti-wifi-utils: update based on wlan r5_sp3 release
=20=20arago.conf: update preferred versions of wpa-supplicant and hostapd
=20=20battleship: update license information
=20=20wifi-direct-demo: add license info
=20=20wl1271-demo: add license file

Franklin S. Cooper Jr (51):
=20=20obexd: Pull in obexd from Arago
=20=20obexd: Add UTF16BE to UTF8 conversion patch
=20=20arago.conf: Use obexd version 0.34
=20=20arago.conf Use libnl version 2.0
=20=20crda: Pull version 1.1.1 from Arago
=20=20arago.conf: Use crda version 1.1.1
=20=20bt-enable: Add bt-enable recipe
=20=20bt-firmware: Port bt-firmware recipe
=20=20wl12xx-firmware: Port wl12xx-firmware recipe
=20=20bluez4: Pull in bluez4 from Arago
=20=20bluez4: Add Arago SDK specific patches
=20=20arago.conf: Use bluez4 version 4.98
=20=20bluez-hcidump: Pull in bluez-hcidump from Arago
=20=20arago.conf: Use bluez-hcidump version 2.2
=20=20ti-compat-wireless: Port ti-compat-wireless recipe.
=20=20ti-compat-bluetooth: Port ti-compat-bluetooth recipe
=20=20task-arago-tisdk-connectivity: Add back wlan and bluetooth firmware =
and driv
=20=20task-arago-tisdk-connectivity: Add back battleship demo
=20=20task-arago-tisdk-matrix: Add back Bluetooth and WLAN Matrix Demos
=20=20task-arago-tisdk-matrix: Fix syntax for am180x-evm for =
MATRIX_APPS_append
=20=20oe-layersetup: Add oe-layersetup script
=20=20arago-source-ipk: Create source ipk file for oe-layersetup
=20=20task-arago-qte-sdk-target: Delete unused task
=20=20task-arago-qte: Add additional packages
=20=20task-arago-qte-toolchain-target: Add additional packages
=20=20mount-sdcard: Add recipe that automounts SD Card partitions
=20=20task-arago-tisdk-amsdk: Add mount-sdcard init script
=20=20task-arago-gst: Remove gst-plugins-ugly
=20=20libav: Disable any mp3 or mpeg2 related features
=20=20gst-plugins-bad: Disable any feature based on mpeg2 or mp3
=20=20arago.conf: Remove commercial license whitelisting
=20=20tisdk-rootfs-image: Build on top of arago-base-tisdk-image
=20=20ti-tisdk-setup: Switch back filesystem file type
=20=20busybox: Enable rev utility
=20=20qt-tstat: Remove proxy settings
=20=20matrix-gui-apps-git.inc: Update Matrix v2 applications
=20=20meta-toolchain-arago: Substitute dirname statement
=20=20bluez4: Re-enable hidd tool
=20=20ti-tisdk-setup: Add 12.04 as a supported OS
=20=20task-arago-standalone-sdk-target: Fix PREFERRED_PROVIDER
=20=20am33x-cm3: Update to latest firmware
=20=20linux-am335x: Update to latest am335x PSP kernel
=20=20arago.conf: Set PREFERRED_VERSION for readline-native
=20=20gst-plugins-good: Remove gconf dependency
=20=20Revert "board-port-labs: Tweak recipe"
=20=20sourceipk.bbclass: Remove .git directory
=20=20tisdk-image.bbclass: Update manifest text
=20=20bash: Mimic patch "Make it possible to run bash 3.2.48 instead of =
4.2."
=20=20bash: Use non GPLv3 version of bash
=20=20arago-image.inc: Use bash as shell instead of busybox
=20=20bash: Remove reserved word

Michael Tadyshak (1):
=20=20pinmux-utility: Pull in Pin Mux Utility v2.4.1.0

dgerlach (1):
=20=20alsa-state: Creating empty asound.conf file

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-beagleboard:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-browser:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-bug:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-chicken:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-efikamx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ettus:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm:

Javier Martinez Canillas (1):
=20=20linux-imx (3.0.35): enable netfilter support

Leonardo Sandoval (1):
=20=20linux-imx-3.0.35: egalax single touch built-in in defconfig

Noor Ahsan (1):
=20=20linux-linaro: Fix an error related to multiline comment.

Otavio Salvador (1):
=20=20linux-imx (3.0.35): Fix imx6sabrelite patch to remove eGalax change

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

Fabio Estevam (2):
=20=20README: Point to the official Yocto git tree
=20=20linux-imx-2.6.35.3: udev needs CONFIG_DEVTMPFS_MOUNT

Leonardo Sandoval (1):
=20=20README: include info to send patches

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-ppc:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-guacamayo:

Andreas Henriksson (1):
=20=20alsa-plugins: Add use_libavutil.patch from Debian to fix linking

Ross Burton (1):
=20=20pulseaudio: fix bashisms in scripts

Tomas Frydrych (8):
=20=20userland: add egl.pc and vchiq.sh and fix the include headers install
=20=20userland.bbappend: inherit update-rc.d
=20=20RPi: revert back to using the binary firmaware vc-graphics package
=20=20guacamayo-session-egl: fix shutdown permissions setup
=20=20task-guacamayo-openmax: new task that depends on MACHINE_FEATURE =
openmax
=20=20raspberrypi.conf: added openmax to machine features
=20=20pulseaudio config: on RPi do not load the suspend-on-idle module
=20=20Revert "pulseaudio config: on RPi do not load the suspend-on-idle =
module"

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix-community:

Andreas M=C3=BCller (3):
=20=20linux-mainline-3.8: remove multiline comments
=20=20u-boot-variables: add consoleblank
=20=20overo.conf: replace libgles-omap3 by omap3-sgx-modules

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-handheld:

Andrea Adami (6):
=20=20linux-yocto-3.2: remove yaffs2 references from poodle.cfg
=20=20linux-yocto_3.2: convert ktype/standard to explicit =
ktypes/standard/standard
=20=20linux-yocto_3.4: convert ktype/standard to explicit =
ktypes/standard/standard
=20=20linux-kexecboot_3.2: convert ktype/tiny to explicit =
ktypes/tiny/tiny.scc
=20=20linux-yocto_3.4: minor config cleanings towards 3.8
=20=20linux-yocto_3.4: add general MTD options to zaurus-hardware.cfg

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-igep:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Andrei Gherzan (2):
=20=20ffmpeg: Remove package as nobody depends on it anymore
=20=20fri2.conf: mesa-dri was updated to 9.0.1

Nitin A Kamble (11):
=20=20crownbay: clean up the linux-yocto-3.4 recipe
=20=20sys940x: linux-yocto_3.4: cleanup the SRC_URI
=20=20fri2: fix a typo in specifying the kernel feature
=20=20emgd-1.14: prepare for coexisting with emgd-1.16 recipe
=20=20emgd-1.16: create a new recipe
=20=20emenlow: use emgd 1.16 driver for graphics
=20=20crownbay: use emgd 1.16 driver for graphics
=20=20emenlow.conf: use the new method for specifying VA codecs
=20=20crownbay.conf: use the new method for specifying VA codecs
=20=20fri2.conf: use the new method for specifying VA codecs
=20=20sys940x.conf: use the new method for specifying VA codecs

Tom Zanussi (2):
=20=20meta-intel: update MAINTAINERS with new mailing list
=20=20emenlow: add LICENSE_FLAG_WHITELIST information to README

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

Florin Sarbu (3):
=20=20linux-yocto: Add missing AF_BUS kernel config for qemux86.     Add =
CONFIG_NE
=20=20dbus: Update .bbappend to version 1.6.8
=20=20packagegroup-core-p2.bb: Add wireless-tools as a P2 component.

Holger Behrens (1):
=20=20excalibur-image.bb: prepare 3.0.3

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-java:

Henning Heinold (19):
=20=20classpath-initial: fix bitbake files searchpath
=20=20classpath-initial: remove trailing whitespace
=20=20jamvm-initial: rename patches directory for newer bitbake
=20=20classpath-initial: remove files shared with classpath-native
=20=20regexp: correct license and bump PR
=20=20servlet2.3: correct LICENSE and bump PR
=20=20oro: correct license and bump PR
=20=20jakarta-commons: switch to INC_PR and fix license
=20=20avalon-framework-api: fix license and bump PR
=20=20logkit: fix license and bump PR
=20=20ant; fix license and bump PR
=20=20junit: fix license and bump PR
=20=20llvm: disable llvm-mc again until we have real fix for
=20=20icedtea6-native: remove older patches
=20=20icedtea6-native: prepend FILESPATH for newer bitbake
=20=20openjdk-7: use $D in postinst so readonly fs works and switch to =
update-alte
=20=20openjdk: factor out the postinst bits
=20=20openjdk: link libjvm.so from hotspot to archdir
=20=20openjdk: remove llvm as dependency until we can shark enable again

Khem Raj (1):
=20=20openjdk-7: Remove mutliline comment

woglinde (1):
=20=20Merge pull request #35 from kraj/master

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-kde:

Khem Raj (1):
=20=20qt4-native, qt4-x11-free: Rename bbappends to match current OE-Core =
recipes

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-micro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-mono:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-netbookpro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nslu2:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-opie:

Khem Raj (1):
=20=20kdepimpi-base: Remove mutliline commented code

Paul Eggleton (2):
=20=20layer.conf: fix parsing with recent change to meta-systemd
=20=20layer.conf: fix parse errors in some git recipes when not using git =
version

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-qt3:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-slugos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-systemd:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-raspberrypi:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

Cliff Brake (2):
=20=20linux_3.1: add extra '#' to multi-line comment
=20=20beagleboard.conf: add additional sound modules

Denys Dmytriyenko (4):
=20=20u-boot: update to the latest dev release for keystone
=20=20linux-keystone: update to the latest dev release for keystone
=20=20multi-kernel.inc: repeat do_configure after do_compileconfigs
=20=20multi-kernel.inc: drop use of KERNEL_CCSUFFIX to match oe-core

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

Keith Derrick (3):
=20=20webos-image: sleepd=3D14,1.1.1
=20=20webos-image: Remove storaged from image
=20=20webos-image: nyx-lib=3D63,v4.0.0~rc1, nyx-modules=3D78,v4.0.0

Martin Jansa (14):
=20=20dhcp: rename bbappend to match new version from oe-core
=20=20libtinyxml: Drop, no longer used by Open webOS
=20=20bbclasses, recipes: use 4 spaces in python tasks
=20=20webos-image: pull dropbear through ssh-server-dropbear
=20=20task-webos-extended: provide upgrade path from task-webos-core
=20=20task*: rename to packagegroup to match oe-core
=20=20packagegroup: provide upgrade path from task-* recipes
=20=20packagegroup: inherit packagegroup, drop PACKAGES and ALLOW_EMPTY
=20=20webos.conf: use packagegroup-* names instead of task-*
=20=20webos-image.bbclass: use packagegroup-* names instead of task-*
=20=20webos.conf: change preferred version of linux-yocto to 3.4
=20=20busybox: Rename bbappend to match new version, update defconfig
=20=20yajl: Import older 1.0.12 version
=20=20webos-image: browserserver=3D0.7.2

Sapna Todwal (1):
=20=20webos-image: webos-connman-adapter=3D3

Simon Busch (4):
=20=20webos-image: support selecting an alternative to dropbear
=20=20iproute2: rename as we have a newer version in oe-core
=20=20nodejs: Don't use host python when building
=20=20webos-image: define WEBOS_IMAGE_DEFAULT_FEATURES

Weiwen Zhao (1):
=20=20meta-webos: comment cleanups

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Andrei Dinu (1):
=20=20Maintainers.inc file update

Brian A. Lloyd (1):
=20=20yocto-bsp: qualify user files with machine name

Constantin Musca (1):
=20=20prserv: change PRSERV_HOST format

Radu Moisan (1):
=20=20sample.extended: Add DISTRO_FEATURES_INITMAN

Ross Burton (1):
=20=20distro-tracking: remove e-d-s and libical

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:




