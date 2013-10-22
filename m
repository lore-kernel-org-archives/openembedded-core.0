Return-Path: <cliff.brake@gmail.com>
Received: from bec-systems.com (u15414263.onlinehome-server.com
	[74.208.70.121])
	by mail.openembedded.org (Postfix) with ESMTP id 3FFFC6D032;
	Tue, 22 Oct 2013 11:37:09 +0000 (UTC)
Received: from oh-67-76-203-50.sta.embarqhsd.net ([67.76.203.50]
	helo=happy.bec-systems.com)
	by bec-systems.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cliff.brake@gmail.com>)
	id 1VYa94-0001Um-7z; Tue, 22 Oct 2013 07:29:16 -0400
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Date: Tue, 22 Oct 2013 11:36:52 GMT
Message-Id: <1382441812408.352b9d56@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
X-Spam_score: -2.9
X-Spam_score_int: -28
X-Spam_bar: --
Subject: OE Changelog since 2013-10-13 until 2013-10-20
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
X-List-Received-Date: Tue, 22 Oct 2013 11:37:10 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2013-10-13 until 2013-10-20.  Projects included in this =
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
meta-qt5: git://github.com/meta-qt5/meta-qt5.git
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

Alexandru DAMIAN (3):
=20=20toaster: add toaster code to bitbake
=20=20toaster: adding frameworks for the Simple UI
=20=20toaster: add Toaster UI interface

Cristiana Voicu (1):
=20=20hob: Hob should ask for ports only when Manual proxy is selected

Olof Johansson (1):
=20=20monitordisk: lower inode check warning to note

Paul Eggleton (1):
=20=20siggen: handle recipe path changes in siginfo files

Richard Purdie (4):
=20=20bitbake: Update post 1.20 to development version
=20=20cooker/command: Add error state for the server and use for pre_serve =
errors
=20=20bitbake: bitbake: bb: Drop deprecated functions
=20=20utils: Don't show stack traces for BBHandledException

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Anders Roxell (1):
=20=20ltp: update to new release 20130904

Bruce Ashfield (1):
=20=20kernel: restore scripts in the sysroot

Chase Maupin (1):
=20=20udev: update local rules for new touchscreen device

Chen Qi (1):
=20=20device_table-minimal.txt: change group of /dev/hda back to disk

Cristiana Voicu (1):
=20=20separatebuilddir: remove entries for imake and xorg-cf-files

Darren Hart (2):
=20=20wic: Force lba off for FAT16 partitions
=20=20wic: Check for external modules

David Nystr=C3=B6m (9):
=20=20beecrypt: Add nativesdk in BBCLASSEXTEND
=20=20popt: Add nativesdk in BBCLASSEXTEND
=20=20icu: Add nativesdk in BBCLASSEXTEND
=20=20attr: Add nativesdk in BBCLASSEXTEND
=20=20acl: Add nativesdk in BBCLASSEXTEND
=20=20rpmresolve: Add nativesdk in BBCLASSEXTEND
=20=20smartpm: Add nativesdk in BBCLASSEXTEND
=20=20ossp-uuid: Add nativesdk in BBCLASSEXTEND
=20=20file: Add nativesdk in BBCLASSEXTEND

Diego Rondini (1):
=20=20libav: Add libswscale to PACKAGES_DYNAMIC

Felipe F. Tonello (1):
=20=20update-rc: Stop and remove service if updating package

Jack Mitchell (2):
=20=20grub: add patch to support 256 byte inodes
=20=20crond: remove UID check in init script

Jeffrey C Honig (1):
=20=20initscripts: insure checkroot.sh runs before anything writing to the =
file

Jonathan Liu (1):
=20=20qt4: add upstream QTBUG-31579 patch for QPainter regression

Laurentiu Palcu (10):
=20=20byacc: upgrade to 20130925
=20=20xkeyboard-config: upgrade to 2.10.1
=20=20xauth: upgrade to 1.0.8
=20=20xf86-input-evdev: upgrade to 2.8.2
=20=20libdrm: upgrade to 2.4.47
=20=20xset: upgrade to 1.2.3
=20=20xf86-video-intel: upgrade to 2.21.15
=20=20xinput: upgrade to 1.6.1
=20=20xprop: upgrade to 1.2.2
=20=20xf86-video-fbdev: upgrade to 0.4.4

Marko Lindqvist (2):
=20=20automake: unhardcode version number
=20=20automake: update to upstream version 1.13.4

Martin Jansa (3):
=20=20matchbox-wm: Add dependency on libxfixes and libxcursor
=20=20telepathy-mission-control: Add PACKAGECONFIG for upower and =
connectivity
=20=20bitbake.conf: Remove double slash from PATH_prepend and PKG_CONFIG_DIR

Maxin B. John (1):
=20=20sqlite3: update to version 3.8.0.1

Muhammad Shakeel (3):
=20=20sysvinit-inittab: Fix getting tty device name from SERIAL_CONSOLES =
entries
=20=20connman: Remove obsolete configurations from EXTRA_OECONF
=20=20connman: Upgrade to v1.18

Nobuhiro Iwamatsu (1):
=20=20kernel.bbclass: unset LDFLAGS when run devshell in kernel recipe

Otavio Salvador (1):
=20=20uboot-config.bbclass: Raise an error for unknown configs

Paul Eggleton (1):
=20=20classes/package: handle filenames containing wildcards

Qiang Chen (1):
=20=20openssh: fix sshd status command error prompt

Richard Purdie (3):
=20=20libarchive: Add -native version needed for pixz
=20=20nativesdk: Fix pn check
=20=20cross-canadian: Fix SHLIBSDIR when using multilib

Riku Voipio (1):
=20=20glib-2.0: fix build on Aarch64

Ross Burton (19):
=20=20xorg-lib-common: fix malloc0returnsnull usage
=20=20gtk+: remove unused configure options
=20=20libmatchbox: remove unused configure options
=20=20pango: fix x11 DISTRO_FEATURE check
=20=20libxt: remove unused configure option
=20=20insane: configure option checking
=20=20libsm: upgrade to 1.2.2
=20=20libxmu: upgrade to 1.1.2
=20=20libxpm: upgrade to 3.5.11
=20=20xf86-video-vesa: upgrade to 2.3.3
=20=20gnome-desktop-testing: add
=20=20glib-2.0: upgrade to 2.28.0
=20=20atk: upgrade to 2.10.0.
=20=20at-spi2-core: upgrade to 2.10.0.
=20=20at-spi2-gtk: upgrade to 2.10.0
=20=20glib-networking: upgrade to 2.38.0 and PACKAGECONFIGise
=20=20bitbake.conf: add WARN_QA and ERROR_QA to the hash whitelist
=20=20update-rcd.bbclass: fix host/target test
=20=20cairo: add explicit dependency on zlib

Saul Wold (24):
=20=20cups: upgrade to 1.6.4
=20=20desktop-file-utils-native: upgrade to 0.22
=20=20libbsd: upgrade to 0.6.0
=20=20man-pages: upgrade to 3.54
=20=20rsync: upgrade to 3.1.0
=20=20util-macros: upgrade to 1.17.1
=20=20file: Update to 5.15
=20=20tzcode: Update to 2013g
=20=20tzdata: Update to 2013g
=20=20lsbinitscripts: Update to 9.50
=20=20libpng: Update to 1.6.6
=20=20sqlite3: update to 3.8.0.2
=20=20kconfig-frontends: Update to 3.11.0.0
=20=20busybox: Add depmod (adds 2240 bytes)
=20=20local.conf.sample.extended: Add some additional comments for security =
flags
=20=20sysstat: upgrade to 10.1.7
=20=20xz: Add nativesdk for Python3 nativesdk dependency
=20=20kmod: Add patch to fix seperate build dir of ptest
=20=20kmod: Update to Rev 15 via git
=20=20check: add check recipe for kbd to use for creating unit tests
=20=20kbd: Update to 2.0.0
=20=20base-passwd: upgrade to 3.5.28
=20=20ca-certificates: Clarify in Description that certs are Debian based
=20=20packagegroup-core-basic: libuser has a hard depenency on libpam

Stefan Stanacar (1):
=20=20lib/oeqa/runtime: build kernel module on target test

Ting Liu (2):
=20=20kmod-native: use bswap to work on older Linux hosts
=20=20perf: flag __SANE_USERSPACE_TYPES__ to include int-ll64.h for =
powerpc64

Tom Zanussi (5):
=20=20wic: check for build artifacts
=20=20wic: check passed-in build artifact directories
=20=20wic: Check for the existence/correctness of build artifacts
=20=20wic: Initialize return values in find_artifacts()
=20=20wic: add pseudo to the populate-extfs step

Valentin Popa (1):
=20=20image types: split live into iso and hddimg

Victor Kamensky (1):
=20=20classes: add aarch64_be target

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Andreas M=C3=BCller (8):
=20=20qt-creator: add qt4-plugin-sqldriver-sqlite to RRECOMMENDS_${PN}
=20=20xfce4-settings: set correct version
=20=20xfce4-settings: add exo-native to DEPENDS
=20=20xfce4-weather-plugin: add libsoup-2.4 to DEPENDS
=20=20xfwm4: add exo-native to DEPENDS
=20=20xfce4-icon-theme: add xfce4-dev-tools-native to DEPENDS
=20=20orbit2: fix build after automake 1.13.4 update
=20=20connman: follow oe-core to 1.18

Andreas Oberritter (2):
=20=20autofs: pass systemd directory to configure
=20=20autofs: change DESCRIPTION to SUMMARY

Carlos Rafael Giani (1):
=20=20orc: update to version 0.4.18

Chunrong Guo (3):
=20=20libhugetlbfs: install static 4G-edge testcases
=20=20libhugetlbfs: not use hard coded path in run_tests.py
=20=20libhugetlbfs: install perl lib to directory perl instead of perl5

Cliff Brake (2):
=20=20libraw1394: add recipe
=20=20libdc1394: add recipe

David Turgeon (1):
=20=20tftpd-hpa: fix premature exit

Fathi Boudra (3):
=20=20python-numpy: add config files for armeb architecture
=20=20libjpeg-turbo: update to 1.3.0 release (svn r988)
=20=20libjpeg-turbo: fix variables spacing

Felipe F. Tonello (2):
=20=20Revert "gypsy: Added init script"
=20=20ofono: libqofono: Added libqofono recipe

Hongxu Jia (4):
=20=20mariadb: update libdir for libtool
=20=20mariadb: fix warning while invoking 'mysql_install_db' on target
=20=20mariadb: fix do_configure failed while multilib is used
=20=20mariadb: Add mysql5 to RPROVIDES for backwards compatibility

Jack Mitchell (3):
=20=20libsoc: update to 0.4
=20=20libestr: add 0.1.6
=20=20rsyslog: update to 7.4.4

Joe Slater (1):
=20=20xdebug: update to version 2.2.3

Khem Raj (4):
=20=20libmikmod: Upgrade libmikmod_3.2.0.bb -> libmikmod_3.3.2.bb
=20=20libgnomeui: Depend on libgnome-keyring not gnome-keyring
=20=20libqofono: Use BPN instead of PN in SRC_URI
=20=20opencv: Upgrade to latest on 2.4 branch

Koen Kooi (4):
=20=20image-magick: update to latest patchset
=20=20gdm: delete broken .desktop files
=20=20gdm 2.32.2: don't install broken gdm-autologin PAM file
=20=20python-pip: add 1.3.1

Roy Li (1):
=20=20vsftpd: use quotes to wrap variable

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Andreas M=C3=BCller (2):
=20=20angstrom.inc: add opengl to DISTRO_FEATURES for all machines
=20=20set mesa-gl as default provider for virtual/libgl

Khem Raj (2):
=20=20Revert "packagegroup-gnome: add gnome-applets"
=20=20angstrom: Override OE-Core for  virtual/libgl PREFERRED_PROVIDER

Koen Kooi (37):
=20=20systemd-image: fix u-a, include systemd-analyze
=20=20packagegroup-gnome: include missing gsettings files
=20=20packagegroup-gnome-apps: include cheese and abiword
=20=20angstrom: really backfill sysvinit this time
=20=20angstrom-gnome-icon-theme-enable: add SUMMARY
=20=20angstrom: add a switch to completely disable support for sysv scripts
=20=20tweaks: add gconf-sanity for providing =
/usr/libexec/gconf-sanity-check-2
=20=20systemd-gnome-image: add xinput-calibrator
=20=20development-gnome-image: a GNOME2 image with dev tools installed
=20=20development-gnome-image: add more tools
=20=20development-gnome-image: fix vimrc typo
=20=20development-gnome-image: add more filesystem tools
=20=20fixmac: a udev rule to generate a random MAC address when needed for =
eth* de
=20=20connman: add angstrom specific settings
=20=20images: add connman-angstrom-settings to connman based images
=20=20angstrom-version: enhance lsb_release
=20=20angstrom-version: more lsb_release improvements
=20=20libgnome: update wallpaper to include yocto compatible logo
=20=20libgnome: move Yocto Compatible logo up a bit in the Angstrom =
wallpaper
=20=20angstrom-gdm-autologin-hack: add SUMMARY
=20=20gconf-sanity: allow empty ${PN}
=20=20connman: add bbappend for network settings
=20=20systemd-image: drag in fixmac by default
=20=20gconf-sanity: update to match new libexec layout
=20=20systemd-image: include cpufreq-tweaks
=20=20packagegroup-gnome: add gnome-applets
=20=20packagegroup-gnome: add gnome-common-schemas
=20=20GNOME2 updates: drop gconf-sanity, replace xfce4-terminal with =
gnome-termina
=20=20systemd: add bbappend to install a custom journald.conf
=20=20connman: match bbappend to updated oe-core version (1.17)
=20=20cpufreq-tweaks: tweak cpufreq governor after boot
=20=20angstrom v2013.12: prefer openssh-sshd as ssh daemon
=20=20arm-defaults: switch pandaboard to cortexa8hf as well
=20=20arm-defaults: fix panda default tune
=20=20README: add branching checklist
=20=20angstrom next: add openssh-ssh client to default install
=20=20connman: update bbappend to 1.18 to match oe-core

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Chase Maupin (8):
=20=20meta-toolchain-arago: copy relocate_sdk from COREBASE
=20=20arago-core-tisdk-image: Add AM437x DTB filter
=20=20ti-tisdk-makefile: Add AM437x support
=20=20matrix-gui-apps-git: Update for AM437x
=20=20packagegroup crypto: Add AM437x support
=20=20udev: fix touchscreen detection rule
=20=20matrix-gui-crypto-demos: Add am437x support
=20=20packagegroup-arago-base: Add mtd-utils-ubifs

Chen Qi (1):
=20=20busybox: configure system user id to range from 100 to 999

Denys Dmytriyenko (17):
=20=20ti-crypto-examples: remove empty no longer used bbappend
=20=20chrpath.bbclass: remove local copy, as dylan now has all the fixes
=20=20relocate_sdk.py: remove local copy, as dylan now has all the fixes
=20=20init-ifupdown: move init and interfaces files from netbase to new =
init-ifupd
=20=20gst-ffmpeg: move to gstreamer directory to match upstream location
=20=20gettext: remove local bbappend that got merged upstream
=20=20libjpeg-turbo: update local bbappend with upstreamed fixes removed
=20=20python-m2crypto: remove since upstream meta-oe has newer version
=20=20README: update dependency information for dylan base
=20=20qtwebkit-examples: fix pushed upstream, remove locally
=20=20qtwebkit: update bbappend to 5.1.1
=20=20qtbase: update bbappend to 5.1.1, explicitly enable linuxfb
=20=20qt-tstat: fix Makefile to support build outside of source, i.e. ${S} =
!=3D ${B}
=20=20qt-provider: expand with extra dependency variables for qtsvg and =
qtscript
=20=20qtbase: update bbappend to disable eglfs/gles for now
=20=20qt-tstat: update recipe to be Qt4 and Qt5 compatible
=20=20arago-qt5-test-image: replace matrix-browser with qt-tstat demo

Franklin S. Cooper Jr (4):
=20=20ti-tisdk-makefile: Hardcode PLATFORM_ARCH variable
=20=20ti-tisdk-makefile: Speed up building of kernel and u-boot
=20=20tisdk-install: Set MAKE_JOBS variable during SDK installation
=20=20ti-tisdk-makefile: Pass in LOADADDR for Linux kernel

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

Christoph Settgast (1):
=20=20qtbase: update to version 5.1.1

Daiane Angolini (5):
=20=20imx-audio: Drop redundant package
=20=20alsa-state: Add default state values for mx5/mx6/mxs
=20=20imx-lib: Move from 11.09.01 to 11.09.02
=20=20imx-vpu: Add imx-vpu version 11.09.02
=20=20imx-test: Add dependency on imx-vpu

Khem Raj (1):
=20=20machines: Add PREFERRED_PROVIDER for virtual/bootloader

Otavio Salvador (2):
=20=20u-boot-fslc: Update to 2013.10 based release
=20=20linux-fslc: Update to 3.12-rc5 based release

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

Eric Nelson (2):
=20=20u-boot-boundary: update PV to reflect U-Boot version
=20=20imx6qsabrelite: Set MACHINEOVERRIDES to nitrogen6x

Otavio Salvador (1):
=20=20gk802: Remove board support

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-ppc:

Chunrong Guo (1):
=20=20linux-qoriq-sdk : add config fragments

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-guacamayo:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix-community:

Andreas M=C3=BCller (2):
=20=20card-part.sh: make card partition work for latest fedora
=20=20udev-udisks-rules-overo: hide boot volume with label 'BOOT'

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-handheld:

Andrea Adami (42):
=20=20linux-2.6.29: remove recipe, h3600 now prefers linux-yocto
=20=20hx4700.conf: update config and prefer linux-yocto
=20=20linux-yocto: initial commit of hx4700 defconfig
=20=20linux-3.0.1: remove recipe, hx4700 now prefers linux-yocto
=20=20linux-yocto-handhelds.inc: add missing bootlogo for hx4700
=20=20hx4700.conf: standardize the iwmmxt extra packaging
=20=20formfactor: add configuration for IPAQ with 3.5" screen
=20=20formfactor: add configuration for IPAQ with 3.8" screen
=20=20formfactor: add configuration for IPAQ with 4" screen
=20=20formfactor: refresh machconfig for Zaurus devices
=20=20meta-handheld: remove TARGET_ARCH from machine configurations
=20=20meta-handheld: remove obsolete refs to kdrive
=20=20meta-handheld: remove obsolete refs to kernel26 MACHINE_FEATURE
=20=20formfactor: h3600: set DISPLAY_BPP=3D16 even for 12bit LCD
=20=20formfactor: add ben-nanonote machconfig
=20=20formfactor: add config for IPAQ rx1950 and rx3000
=20=20formfactor: add config for jornada 56x, 6xx, 7xx
=20=20formfactor: add configurations for Motorola with 2.4" and 2.5" LCD
=20=20formfactor: add simpad configuration
=20=20formfactor: add configurations for PALM devices
=20=20formfactor: standardize the comments about real dpi size
=20=20zaurus.inc: append 'qvga' to MACHINE_FEATURES for collie and poodle
=20=20meta-handheld: ipaq: add qvga MACHINE_FEATURE
=20=20jornada56x.conf: add qvga to MACHINE_FEATURES
=20=20meta-handheld: add qvga to MACHINE_FEATURES for Motorola
=20=20ben-nanonote.conf: add qvga to MACHINE_FEATURES
=20=20meta-handheld: remove MACHINE_GUI* and MACHINE_DISPLAY* vars
=20=20linux_3.1: explicit qvga instead of LOGO_SIZE
=20=20linux.inc: remove LOGO_SIZE logic. BTW old linux.inc is deprecated.
=20=20formfactor: h1940: unset framebuffer rotation
=20=20meta-handheld: remove deprecated ROOT_FLASH_SIZE and =
VOLATILE_STORAGE_SIZE
=20=20h3800.conf: fix MACHINE_FEATURES
=20=20zaurus: readd specific bits to each machine
=20=20zaurus.inc: remove code for JFFS2 now split in machine configuration
=20=20meta-handheld: use explicit ERASEBLOCKSIZE and remove the variable
=20=20spitz.conf: reorder and add full example for SL-C3000
=20=20zaurus: simplify JFFS2 creation using code in image_fstype.bbclass
=20=20meta-handheld: use code in image_types.bbclass for JFFS2
=20=20motorola-ezx-base.inc: remove MACHINE_CLASS and MODUTILS vars
=20=20motorola-ezx-base.inc: reorder and remove old comments about iwmmxt
=20=20motorola-ezx-base.inc: remove -n from EXTRA_IMAGECMD_jffs2
=20=20zaurus: readd sum.jffs2 imagetype

Paul Eggleton (2):
=20=20tune-sh3.inc: drop in favour of OE-Core file
=20=20Restore MACHINE_GUI_CLASS and MACHINE_DISPLAY_WIDTH_PIXELS / =
HEIGHT_PIXELS

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-igep:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Nitin A Kamble (14):
=20=20emenlow: Enable 3.10 kernel recipe
=20=20emenlow: update default kernel to v3.10
=20=20fri2: Enable 3.10 kernel recipe
=20=20fri2: update default kernel to v3.10
=20=20sys940x: Enable 3.10 kernel recipe
=20=20sys940x: update default kernel to v3.10
=20=20chiefriver: linux-yocto_3.10: update srcrevs
=20=20jasperforest: linux-yocto_3.10: update srcrevs
=20=20nuc: linux-yocto_3.10: update srcrevs
=20=20sugarbay: linux-yocto_3.10: update srcrevs
=20=20crownbay-noemgd: linux-yocto_3.10: update srcrevs
=20=20emenlow-noemgd: linux-yocto_3.10: update srcrevs
=20=20fri2-noemgd: linux-yocto_3.10: update srcrevs
=20=20sys940x-noemgd: linux-yocto_3.10: update srcrevs

Ong Boon Leong (2):
=20=20meta-crystalforest: update linux-yocto_3.8 kernel to 3.8.13
=20=20meta-crystalforest: remove xserver-xf86-config

Tom Zanussi (3):
=20=20crownbay: Add linux-yocto_3.10 support
=20=20crownbay: Switch to linux-yocto-3.10
=20=20meta-intel/meta-isg: new area for ISG BSPs

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

Florin Sarbu (1):
=20=20node-state-manager: Update to version 1.2.0.0

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-java:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-kde:

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

Paul Eggleton (2):
=20=20opie-pics: use MACHINE_GUI_CLASS instead of older GUI_MACHINE_CLASS
=20=20opie-taskbar-images: drop PIXMAP_SIZE

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-qt3:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-qt5:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-slugos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-systemd:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-raspberrypi:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

Martin Jansa (3):
=20=20android-tools: Add zlib, openssl dependency

Simon Busch (4):
=20=20meta-android: initramfs-android-image: create as replacement for the =
chroot-
=20=20meta-android: kernel_android: use initramfs-android-image instead of =
chroot-
=20=20meta-android: libhybris: bump SRCREV
=20=20meta-android: android-system: prevent android from remounting rootfs =
read-on

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

Chase Maupin (1):
=20=20u-boot-ti-staging: update to 2013.10 release

Denys Dmytriyenko (2):
=20=20recipes: cruft removal and seasonal cleanup
=20=20linux-ti-staging: update to 3.12-rc5 and latest merges of feature =
trees

Franklin S. Cooper Jr (1):
=20=20machine conf: Set correct default ubi volume name for 335x and 437x

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

Ed Chejlava (3):
=20=20upstart: Fix memory leak by turning off logging
=20=20libnih: Fix upstart crash on power-up
=20=20Upstart: Fix memory leak by turning off logging

Gayathri Srinivasan (1):
=20=20webos-image: activitymanager=3D117

Mark Bessey (1):
=20=20nodejs: Remove mksnapshot from emulator builds

Martin Jansa (5):
=20=20nodejs: Fix build with long path to native sysroot, part II
=20=20nodejs: Fix build for qemux86-64
=20=20valgrind: Add ${TCLIBC}-dbg to RRECOMMENDS also for x86
=20=20recipes: Update WEBOS_VERSION to use SHA-1 of annotated tags
=20=20buildhistory: Generate installed-package-file-sizes.txt

Sangwoo Kang (1):
=20=20webos-image: db8=3D89

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Richard Purdie (1):
=20=20poky: Update Version post release

Saul Wold (2):
=20=20package-regex: Tweak python-docutils so it works correctly
=20=20local.conf.sample.extended: Add some additional comments for security =
flags

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



