Received: from new.bec-systems.com ([74.208.70.121] helo=bec-systems.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1UUJJA-0007uq-Gy; Mon, 22 Apr 2013 18:09:39 +0200
Received: from oh-67-76-203-50.sta.embarqhsd.net ([67.76.203.50]
	helo=happy.bec-systems.com)
	by bec-systems.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cliff.brake@gmail.com>)
	id 1UUJ0G-0001p7-Of; Mon, 22 Apr 2013 11:50:07 -0400
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Date: Mon, 22 Apr 2013 15:51:44 GMT
Message-Id: <1366645904494.8e912def@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
X-Spam_score: -2.9
X-Spam_score_int: -28
X-Spam_bar: --
Subject: OE Changelog since 2013-04-14 until 2013-04-21
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
X-List-Received-Date: Mon, 22 Apr 2013 16:09:49 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2013-04-14 until 2013-04-21.  Projects included in this =
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

Cristiana Voicu (1):
=20=20hob: Refine sorting mechanisms in Hob

Martin Jansa (1):
=20=20fetch2: rename file with bad checksum instead of removing it =
completely

Paul Eggleton (1):
=20=20data: fix performance regression

Robert Yang (1):
=20=20monitordisk.py: disable inode checking for btrfs

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Andreas M=C3=BCller (1):
=20=20xserver-xorg: fix segfaults for ARM SoCs

Andreas Oberritter (2):
=20=20mesa: don't fail if x11 isn't available
=20=20separatebuilddir.inc: disable libmusicbrainz

Bruce Ashfield (2):
=20=20kern-tools: fix custom repository BSP generation
=20=20linux-yocto/3.8: Makefile: add -grecord-gcc-switches if using -mfentry

Christopher Larson (1):
=20=20oe.terminal: add tmux classes

Cristian Iorga (1):
=20=20connman: Fix wrong INC_PR reset

Enrico Scholz (1):
=20=20systemd: depend on libgcrypt

Kai Kang (1):
=20=20libpam: backport patches from upstream

Koen Kooi (1):
=20=20systemd: fix bootup with 'ro' by re-adding util-linux-mount to =
RDEPENDS

Laurentiu Palcu (2):
=20=20busybox: fix mount issue
=20=20xserver-xf86-config: set DefaultDepth to 16 for qemumips

Martin Jansa (1):
=20=20systemd: use AC_CHECK_TOOL instead of AC_PATH_TOOL when checking =
objcopy, st

Nitin A Kamble (1):
=20=20initramfs-live-install*: fix the "install" boot option

Paul Eggleton (5):
=20=20rpm-postinsts: remove erroneous call to /etc/default/rcS
=20=20hicolor-icon-theme: bump PR to allow removal of duplicate from =
meta-gnome
=20=20qt4-x11-free: bump PR to allow removal of meta-oe bbappend
=20=20packagegroup-qte-toolchain-target: bump PR to allow removal of =
meta-oe bbapp
=20=20qt4-embedded: bump PR to allow removal of meta-oe bbappend

Richard Purdie (28):
=20=20kernel.bbclass: Ensure we have correct version information in deploy =
data
=20=20update-alternatives: Ensure DEPENDS is correct in multilib case
=20=20ttf-bitstream-vera: Use fontcache class for postinstall
=20=20encodings: Set RDEPENDS correctly
=20=20qemuwrapper-cross: Inhibit default dependencies
=20=20nfs-export-root: Update to use packagegroup naming
=20=20allarch: Drop various problematic allarch usages
=20=20runqemu-internal: Drop distcc support
=20=20systemd: Fix shell variable assignment spacing
=20=20consolekit: Fix ${S} !=3D ${B} issues with pam enabled
=20=20augeas: Fix missing files with separate build directory
=20=20package.bbclass: Fix populate_packages for glob expansion issues
=20=20pcmciautils: Use pkgconfig to set udev variables correctly
=20=20bluez4: Set udev variables using pkg-config
=20=20pulseaudio: Set udev variables using pkg-config
=20=20udev: Effectively revert the move to /sbin
=20=20packagegroup: Add init-manager sanity check
=20=20alsa-utils: Use pkg-config instead of hardcoded udev paths
=20=20systemd: Fix udevd init script so sysvinit in systemd mode works
=20=20build-appliance: Update revision to dylan release
=20=20gst-plugins-bad: Disable neon, its not on DEPENDS
=20=20multilib: Ensure we map the USERADD_PACKAGES variable
=20=20package.bbclass: Add useradd variables to PACKAGEVARS
=20=20package_ipk: Ensure the status file exists
=20=20psplash: Fix multilib build
=20=20perf: Ensure license is handled correctly
=20=20dpkg: Correct paths in postinst
=20=20build-appliance: Update to latest dylan revision for release

Ross Burton (15):
=20=20initramfs-live-boot: explicitly depend on udev-extraconf
=20=20coreutils: add realpath to alternatives
=20=20cairo: fix builds with libpng 1.6
=20=20avahi: don't call DBus init script directly
=20=20wpa-supplicant: don't call DBus init script directly
=20=20udev: remove explicit path to udevadm
=20=20systemd: fix out of tree builds
=20=20seperatebuilddir: add systemd
=20=20systemd: Effectively revert the move to /sbin
=20=20udev: explicitly package nonarch_base_libdir
=20=20busybox: hard-code the syslog service file
=20=20systemd: fix -dbg package with multilib
=20=20util-linux: fix systemd service in multilib
=20=20udev: drop dependency on udev in libudev
=20=20udev: disable systemd support

Ting Liu (3):
=20=20busybox: detects customized configs when do_install
=20=20busybox: Add inetd related files
=20=20openssl: update range information in man-section.patch

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Andreas M=C3=BCller (1):
=20=20gnome-desktop3: add gnome-common to DEPENDS

Jack Mitchell (4):
=20=20net-snmp: fix failure when starting on system without pci bus
=20=20net-snmp: Update to 5.7.2
=20=20net-snmp: merge .inc into .bb and clean up obsolete parts of recipe
=20=20net-snmp: set correct SYSTEMD_PACKAGES

Jackie Huang (2):
=20=20modphp: revert pthread-check.patch and add one against threads.m4
=20=20modphp: enable mysql option in PACKAGECONFIG

Khem Raj (1):
=20=20ntp: Create a separate package for sntp

Koen Kooi (6):
=20=20python-tornado: update to top of 2.2 branch
=20=20gateone: fix html5 feature check
=20=20nodejs4: reinstate installing all the files
=20=20cloud9: use node4 to build o3-xml binary
=20=20nodejs 8.8.18: unset RDEPENDS for native builds
=20=20metacity 2.24.13: fix crash on startup

Marcin Juszkiewicz (2):
=20=20tbb: update to 4.1 Update 3 version from 20130314
=20=20v4l-utils: make it build for AArch64

Mario Domenech Goulart (3):
=20=20libgsf: update to version 1.14.26
=20=20goffice: update to version 0.10.1
=20=20gnumeric: add recipe for version 1.12.0

Martin Jansa (51):
=20=20openssh: fix warnings about overwritting keys
=20=20atftpd: fix warning about overwritting keys
=20=20gpsd: fix warning about overwritting keys
=20=20libgpewidget: fix warning about overwritting keys
=20=20nodejs4: fix build with dash
=20=20keymaps: move bbappend to oe-core subdirectory
=20=20dropbear: move bbappend to oe-core subdirectory
=20=20busybox: move bbappend to oe-core subdirectory
=20=20rpcbind: move bbappend to oe-core subdirectory
=20=20at: move bbappend to oe-core subdirectory
=20=20entrance: move systemd support from meta-systemd back to meta-efl
=20=20gdm: move systemd support from meta-systemd back to meta-gnome
=20=20mpd: move systemd support from meta-systemd back to meta-multimedia
=20=20autofs: move systemd support from meta-systemd back to meta-networking
=20=20ntp: move systemd support from meta-systemd back to meta-networking
=20=20yp-tools, ypbind-mt: move systemd support from meta-systemd back to =
meta-net
=20=20xfce4-session: move systemd support from meta-systemd back to =
meta-xfce
=20=20cloud9: move systemd support from meta-systemd back to meta-oe
=20=20dnsmasq: move systemd support from meta-systemd back to meta-oe
=20=20udisks: move systemd support from meta-systemd back to meta-oe
=20=20strongswan: move systemd support from meta-systemd back to meta-oe
=20=20gpsd: move systemd support from meta-systemd back to meta-oe
=20=20xserver-nodm-init: move systemd support from meta-systemd back to =
meta-oe
=20=20net-snmp: move systemd support from meta-systemd back to meta-oe
=20=20xinput-calibrator: move systemd support from meta-systemd back to =
meta-oe
=20=20cherokee: move systemd support from meta-systemd back to meta-oe
=20=20gateone: move systemd support from meta-systemd back to meta-oe
=20=20atftp: move systemd support from meta-systemd back to meta-oe
=20=20zram: move systemd support from meta-systemd back to meta-oe
=20=20syslog-ng: move systemd support from meta-systemd back to meta-oe
=20=20rsyslog: move systemd support from meta-systemd back to meta-oe
=20=20lxdm: move systemd support from meta-systemd back to meta-oe
=20=20pcsc-lite: move systemd support from meta-systemd back to meta-oe
=20=20networkmanager: move systemd support from meta-systemd back to meta-oe
=20=20packagegroup-basic: Drop bbappend from meta-systemd
=20=20polkit: move systemd support from meta-systemd back to meta-oe
=20=20meta-systemd: drop now unused gitpkgv.bbclass
=20=20layer.conf: remove detection of other layers, now there are only =
oe-core bba
=20=20systemd: add .bbappend to fix upgrade-path
=20=20dbus: add bbappend to fix upgrade path
=20=20busybox: fix upgrade path
=20=20gst123: move to nonworking directory
=20=20minidlna: move to nonworking directory
=20=20libetpan: add liblockfile dependency
=20=20recipes: Unify indentation
=20=20multipath-tools: move to right place
=20=20qt4-embedded, qt4-x11-free, packagegroup-qte-toolchain-target: drop =
PRINC
=20=20llvm2.8: Import from meta-java
=20=20xserver-nodm-init: install .service and conf only with systemd in =
DISTRO_FEA
=20=20xinput-calibrator: install .service only with systemd in =
DISTRO_FEATURES
=20=20cherokee: move systemd service file to meta-webserver too

Otavio Salvador (2):
=20=20xfce4-session: Add x-session-manager alternative
=20=20fio: Add armv6 support

Paul Barker (2):
=20=20vim: recommend that runtime data is installed along with binaries
=20=20vim: prevent binaries from being stripped too early

Paul Eggleton (12):
=20=20qt4: remove bbappend content
=20=20hicolor-icon-theme: remove
=20=20libical: remove
=20=20vsftpd: move from meta-oe to meta-networking and tweak
=20=20openvpn: move to meta-networking and tweak
=20=20bridge-utils: move to meta-networking and tweak
=20=20rp-pppoe: move from meta-oe to meta-networking and tweak
=20=20dnsmasq: move to meta-networking and tweak
=20=20ipsec-tools: move to meta-networking and tweak
=20=20atftp: move to meta-networking and tweak
=20=20cherokee: move to meta-webserver and tweak
=20=20nostromo: move to meta-webserver and tweak

Stefan Herbrechtsmeier (1):
=20=20cryptsetup: Update to latest version and use openssl as crypto backend

Ting Liu (1):
=20=20tclap: initial add 1.2.1

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Chase Maupin (17):
=20=20tisdk-connectivity: move ti-wifi-utils
=20=20tisdk-connectivity: remove drivers and firmware for ti33x
=20=20tisdk-image: add support for DTB files
=20=20linux-am335x: use setup-defconfig from meta-ti
=20=20setup-defconfig: remove local copy
=20=20linux-ti-staging: use KERNEL_LOCALVERSION for SRCPV
=20=20u-boot-ti-staging: use UBOOT_LOCALVERSION to add version string
=20=20arago-console: Add tune2fs package to allow tuning file systems
=20=20matrix-gui-apps: update to latest git revision
=20=20tisdk-matrix: add multimedia demos for omap-a15 devices
=20=20ti-tisdk-setup: Update to latest source revision
=20=20matrix-gui-crypto-demos: update to new apps layout
=20=20linux-ti-staging: overlay dtb symlinks
=20=20linux-ti-staging: overlay LOCALVERSION fix
=20=20u-boot-ti-staging: overlay LOCALVERSION fix
=20=20arago-core-tisdk-image: Add DTB_FILTER settings
=20=20am33x-cm3: remove the SRC_URI setting

Denys Dmytriyenko (3):
=20=20meta-toolchain-arago*: fix where SDKPATH should really be =
SDKPATHNATIVE
=20=20meta-toolchain-arago*: use ${bindir_nativesdk} instead of /bin, bump =
PR
=20=20packagegroup-arago-test: add libdrm-tests package, which provides =
modetest

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-beagleboard:

Koen Kooi (3):
=20=20linux-mainline 3.8: update to 3.8.7
=20=20linux-mainline 3.8: update to 3.8.8, add HDMI audio patches for bone.
=20=20u-boot-denx: upgrade to 2013.04

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-browser:

Andreas M=C3=BCller (1):
=20=20chromium: fix icon location in google-chrome.desktop

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-bug:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-chicken:

Mario Domenech Goulart (21):
=20=20scripts/gen-egg-recipes: remove unused chicken-major-version variable
=20=20scripts/gen-egg-recipes: whitespace cleanup
=20=20scripts/gen-egg-recipes: fix comment
=20=20scripts/gen-egg-recipes: indentation fixes
=20=20scripts/gen-egg-recipes: handle --help and friends
=20=20scripts/gen-egg-recipes: fix bug when checking if recipes dir is a =
directory
=20=20scripts/gen-egg-recipes: remove redefinition of `die'
=20=20scripts/gen-egg-recipes: `die' accepts a format string
=20=20scripts/gen-egg-recipes: remove support for eggs without tags =
directory
=20=20scripts/gen-egg-recipes: refactor egg-dependencies
=20=20scripts/gen-egg-recipes: add recipe-pathname
=20=20scripts/gen-egg-recipes: wrap into a module
=20=20scripts/gen-egg-recipes: refactor gen-recipe
=20=20scripts/gen-egg-recipes: generate recipes with SRC_URI
=20=20scripts/gen-egg-recipes: add recipes-extra-data
=20=20recipes-extra-data/scron_0.2.red: add extra data for the scron recipe
=20=20chicken-egg-sendfile_1.7.6.bb: remove
=20=20recipes-extra-data/dbus_0.91.red: add extra data for the dbus recipe
=20=20scripts/gen-egg-recipes: set OE's S in egg recipes
=20=20Update all egg recipes to make SRC_URI point to tarballs
=20=20chicken_install.bbclass: use egg tarballs

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-efikamx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ettus:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm:

Fabio Estevam (4):
=20=20linux-imx_2.6.35.3: Update to the latest top of tree
=20=20imx-base.inc: Fix UBOOT_ENTRYPOINT
=20=20imx-base.inc: Place UBOOT_ENTRYPOINT into common location
=20=20mxs-base.inc: Fix UBOOT_ENTRYPOINT

Otavio Salvador (15):
=20=20imx6dlsabresd: Use U-Boot 2009.08 from Freescale
=20=20gst-fsl-plugin (3.0.6): Fix the tarball's checksum
=20=20gst-fsl-plugin (3.0.6): Add 'virtual/kernel' dependency
=20=20imx-base.inc: Disable firmware include for not fully supported BSPs
=20=20imx-base.inc: Avoid including imx-audio for every SoC family
=20=20imx-base.inc: Override GStreamer plugins for i.MX3
=20=20imx-base.inc: Do not assign UBOOT_LOADADDRESS
=20=20Fix use of SOC_FAMILY as the most right value is preferred
=20=20xf86-dri-vivante: Ensure install fails if .la cannot be removed
=20=20xf86-dri-vivante: Fix DRI module name
=20=20xf86-video-imxfb-vivante: Enable software rendering support
=20=20u-boot-fslc: Update to patches-2013.04's 20130410 snapshot
=20=20linux-imx.inc: Pass LOADADDRESS to kernel build
=20=20linux-fslc: Refactor to use linux-imx.inc and avoid duplication of =
code
=20=20u-boot-fslc: Update to patches-2013.04's 20130415 snapshot based on =
2013.04-

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

Otavio Salvador (1):
=20=20Fix use of SOC_FAMILY as the most right value is preferred

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-ppc:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-guacamayo:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix-community:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-handheld:

Andrea Adami (4):
=20=20linux-yocto_3.8: remove patch already upstream
=20=20linux-yocto_3.8: pxamci: Refactor regulator support
=20=20linux-yocto_3.8: move Zaurus patches to the respective subdirs
=20=20linux-yocto_3.8: patches: add Upstream-Status and do minor edits

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-igep:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Darren Hart (1):
=20=20init-ifupdown: move network interfaces file for fri2 and sys940x

Tom Zanussi (1):
=20=20emgd-driver-bin: add cairo dependency

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-java:

Henning Heinold (2):
=20=20openjdk-6: add arm thumb2 fix for version 1.12.4
=20=20classpath-initial: fix do_install for removing the classpath tools

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

Christophe Chapuis (2):
=20=20meta-acer: add a500 machine configuration
=20=20meta-acer: added patched A500 Android 3.1.10 kernel

Martin Jansa (5):
=20=20libhybris: exclude from world, because it conflicts with mesa
=20=20meta-acer: update layer dependency to shr
=20=20meta-acer: update layer dependency to master

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

Chase Maupin (4):
=20=20setup-defconfig: allow using KERNEL_LOCALVERSION
=20=20u-boot-ti-staging: Add SRCPV to the PR
=20=20am33x-cm3: use init script to load firmware
=20=20linux-ti-staging: make cm3 firmware a run-time dependency

Denys Dmytriyenko (2):
=20=20linux-ti-staging: update to the latest 3.8.8
=20=20u-boot-ti-staging: update to the latest

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

Anatoliy Klymenko (1):
=20=20webos-image: pmloglib=3D25,v2.2.0

Daniel Gunn (1):
=20=20webos-image: libpbnjson=3D8

Herb Kuta (1):
=20=20Remove execute permissions from non-executable files

Igor Kuksyuk (1):
=20=20meta-webos submission: smartkey-hun=3D4

Iyad Qumei (1):
=20=20webos-image-devel: add python to devel image

Janne Hurskainen (1):
=20=20lsb: Add patch to make lsb_release work if there are parens in =
codename

Jose Dapena Paz (1):
=20=20distro: webos: set PREFERRED_PROVIDER_jpeg to libjpeg-turbo

Martin Jansa (5):
=20=20webos-preferred-versions: Prefer connman 1.4
=20=20webos-image: Inherit core-image and remove duplicated stuff
=20=20webos: Define VIRTUAL-RUNTIME_init-manager and use it
=20=20packagegroup-webos-boot: Drop and use packagegroup-core-boot instead
=20=20webos: Select udev provider based on DISTRO_FEATURES

Pekka Ropo (2):
=20=20webos-image: nyx-modules=3D85
=20=20webos-image: nyx-lib=3D66, nyx-modules=3D86

Sapna Todwal (1):
=20=20webos-image: webos-connman-adapter=3D7

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

Elvis Dowson (10):
=20=20virtex-4: Add support for virtex-4 SOC family.
=20=20virtex-4-ml405-powerpc-405: Add new machine configuration file.
=20=20recipes-core/gettext: Remove recipe override.
=20=20recipes-devtools/gnu-config: Update to gnu-config_20120814.bbappend
=20=20recipes-core/util-linux: Update to util-linux-2.22.2.bbappend
=20=20Remove xilinx-default-revisions.inc
=20=20linux-xilinx-3.3: Update recipe to use SRCREV and remove un-supported =
machin
=20=20zynq-7: Add support for Avnet Zynq Evaluation and Development Board =
(ZedBoar
=20=20linux-xilinx-3.6: Update recipe to xilinx-v14.4 tag.
=20=20linux-xilinx-3.6: Add zynq-7-zedboard.dts file.

Nathan Rossi (2):
=20=20ncurses: Remove recipe override
=20=20db: Remove recipe override

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Paul Eggleton (1):
=20=20poky.conf: add Poky 1.4 and CentOS 6.4 to SANITY_TESTED_DISTROS

Richard Purdie (1):
=20=20README.hardware: Update mpc8315 load address

Saul Wold (1):
=20=20init-ifupdown: move network interfaces file for the beagleboard

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:

Florian Boor (1):
=20=20gpe-login: Add new version 0.96 (new upstream release)




