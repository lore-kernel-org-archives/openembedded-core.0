Received: from oh-69-34-21-229.sta.embarqhsd.net ([69.34.21.229]
	helo=happy.bec-systems.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1RJWql-000342-TI; Thu, 27 Oct 2011 22:46:56 +0200
Received: from localhost.localdomain ([127.0.0.1] helo=happy.bec-systems.com)
	by happy.bec-systems.com with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1RJWkv-0001RX-LN; Thu, 27 Oct 2011 16:40:53 -0400
Date: Thu, 27 Oct 2011 16:40:53 -0400
Message-Id: <E1RJWkv-0001RX-LN@happy.bec-systems.com>
X-Mailer: Nodemailer (0.1.13; +http://www.nodemailer.org)
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org
MIME-Version: 1.0
Subject: OE Changelog for 2011-10-17 to 2011-10-24
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Oct 2011 20:46:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Changelog for 2011-10-17 to 2011-10-24.  Projects included in this report:

bitbake: git://git.openembedded.org/bitbake
openembedded-core: git://git.openembedded.org/openembedded-core
meta-openembedded: git://git.openembedded.org/meta-openembedded
meta-angstrom: git://git.angstrom-distribution.org/meta-angstrom
meta-yocto: git://git.yoctoproject.org/poky
meta-texasinstruments: =
git://git.angstrom-distribution.org/meta-texasinstruments
meta-smartphone: http://git.shr-project.org/repo/meta-smartphone.git
meta-micro: git://git.openembedded.org/meta-micro
meta-slugos: git://github.com/kraj/meta-slugos
meta-nslu2: git://github.com/kraj/meta-nslu2
meta-intel: git://git.yoctoproject.org/meta-intel
meta-handheld: git://git.openembedded.org/meta-handheld
meta-opie: git://git.openembedded.org/meta-opie
openembedded: git://git.openembedded.org/openembedded

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for bitbake:

Joshua Lock (3):
=20=20fetch2: improve usability of checksums
=20=20fetch2: enable checksum definition as SRC_URI parameter
=20=20doc: update manual for checksum changes

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Anders Darander (1):
=20=20module.bbclass: add lock to prevent error bulding ext modules

Cliff Brake (1):
=20=20squashfs-tools: add recipe

Darren Hart (1):
=20=20insane.bbclass: print full path on invalid LICENSE_FILES_CHKSUM

Joshua Lock (5):
=20=20gst-plugins-good: update to 0.10.30
=20=20tzdata: updated SRC_URI and update to 2011k
=20=20tzcode-native: update SRC_URI to new IANA location
=20=20distro-tracking-fields: update fields for tzdata and gst-plugins-good
=20=20gst-plugins-good: correctly handle gconf schema

Kang Kai (5):
=20=20ghostscript: update to 9.04
=20=20libxml-sax-perl: update to 0.99
=20=20liburi-perl: update to 1.59
=20=20libsdl: update to 1.2.14
=20=20distro_tracking_fields: update packages tracking fields

Khem Raj (10):
=20=20bluez4: Add glib-2.0 to DEPENDS
=20=20gcc-4.6: Upgrade SRCREV to latest FSF 4.6 branch
=20=20gcc-4.6: Backport PR46934 fix
=20=20tcmode-default.inc: Add TRANSLATED_TARGET_ARCH suffix to =
binutils-cross-cana
=20=20binutils-cross-canadian: Point sysroot to correct location
=20=20gcc-configure-sdk: Point sysroot to correct location
=20=20xserver-xorg: Add mesa-dri to depends instead of virtual/libgl
=20=20gcc-4.6: Backport fix for PR32219
=20=20coreutils: Upgrade recipe 8.12 -> 8.14
=20=20pulseaudio: inherit perlnative

Lauri Hintsala (1):
=20=20poky: fix broken ubifs link in deploy folder

Martin Jansa (6):
=20=20fontconfig: fix fix-pkgconfig.patch
=20=20apr: add native support
=20=20neon: add native support
=20=20apr-util: add native support
=20=20subversion-1.6.15: add native support too
=20=20default-providers: switch virtual/libgl from mesa-xlib to mesa-dri

Nitin A Kamble (7):
=20=20x86 tune files: set baselib for x32 tune as libx32
=20=20python-scons: upgrade from 2.0.1 to 2.1.0
=20=20python-dbus: upgrade from 0.83.2 to 0.84.0
=20=20libxml-parser-perl: upgrade from 2.40 to 2.41
=20=20distro-tracking: update data for some toolchain recipes
=20=20tcl: upgrade from 8.5.9 to 8.5.10
=20=20perl: upgrade from 5.12.3 to 5.14.2

Otavio Salvador (5):
=20=20src_distribute.bbclass, src_distribute_local.bbclass: mostly rewritten
=20=20bootimg.bbclass: add support to disable HDD image building
=20=20useradd.bbclass: check if a group already exists manually
=20=20base-passwd: move initial criation of group and passwd to preinst
=20=20dbus: use useradd class to allow use in read-only filesystems

Saul Wold (4):
=20=20ghostscript: Disable parallel make due to install issues
=20=20ghostscript: renamed x86_64 to x86-64 for patch to work
=20=20texi2html: Added recipe from OE
=20=20oprofile: Update to 0.9.7 and convert cvs->git

Wenzong Fan (2):
=20=20ccache: update to 3.1.6
=20=20chkconfig: Update to 1.3.55

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Andreas M=C3=BCller (5):
=20=20xfce-panel-plugin: bbclass for panel plugins
=20=20xfce4-cpufreq-plugin: initial add 1.0.0
=20=20xfce4-cpugraph-plugin: initial add 1.0.1
=20=20epdfview: add initial recipe with version 0.1.8
=20=20xfce4-icon-theme: initial add 4.4.3

Jason Kridner (2):
=20=20Cloud9: incremental submodule and build fixes
=20=20cloud9: build node-03-xml manually, waf is just too broken for =
crosscompilat

Joel A Fernandes (1):
=20=20memtester: Import from OE classic

Khem Raj (2):
=20=20gcc-4.6: Remove the patches that are already applied via oe-core
=20=20fuse: Fix linking issues with gold linker

Koen Kooi (23):
=20=20pixman 0.23.6: refresh patches with versions for pixman master
=20=20systemd-compat-units: start opkg after remount-rootfs.target, not =
before
=20=20pixman 0.23.6: apply typo fix from upstream
=20=20upower: update to 0.9.14
=20=20network-manager-applet 0.9.0: add gnome-keyring to recommends
=20=20cloud9 0.5.1: convert to fetch SRC_URI
=20=20nodejs: also package wafadmin
=20=20task-basic: include MACHINE_EXTRA_RRECOMMENDS
=20=20task-basic: include a minimal set of timezone data
=20=20systemd: fix initramfs symlink
=20=20cloud9 0.5.1: fix up node-o3-xml library location
=20=20udisks: update to 1.0.4
=20=20wavpack 4.60.1: import from OE classic
=20=20libmicrohttpd 0.4.6: import from OE classic
=20=20enca 1.9: import from OE classic
=20=20subsurface: update to 1.1 release, start using gitpkgv
=20=20libass 0.9.11: import from OE classic
=20=20live555: fix build due to missing INC_PR
=20=20libftdi: import 0.18 from OE classic, update to 0.19
=20=20soft66 git: import from OE classic
=20=20udev 174: add version 174, disabled by default (see below)
=20=20asio 1.4.1: import from OE classic
=20=20goffice 0.8.17: import from OE classic

Martin Jansa (13):
=20=20syslog-ng: move conflicting file modules.conf to own packages and fix =
unpack
=20=20xf86-input-tslib: fix build with newer xserver
=20=20e-wm-illume-dict-pl: fix licensing information
=20=20e-tasks: fix licensing information
=20=20ttf-droid: add LIC_FILES_CHKSUM, switch to github.com
=20=20abiword: add LIC_FILES_CHKSUM
=20=20abiword: add SRC_URI checksums
=20=20abiword: fix install, newer versions doesn't allow to overwrite just =
install
=20=20wv: add SRC_URI checksums and drop deprecated patch=3D1 param
=20=20efm-nav, efm-path, efm-pathbar: drop from meta-efl, now are part of =
efm itse
=20=20e-base: bump EFL_SRCREV
=20=20webkit-efl: upgrade to 1.6.1
=20=20enjoy: include icon in FILES_${PN}

Otavio Salvador (5):
=20=20openssl: disable parallel install
=20=20udev: udev-systemd refactory
=20=20systemd-serialgetty: don't require systemd_git.bb
=20=20systemd: add systemd-initramfs
=20=20systemd: add lock group using useradd.bbclass

Pau Espin Pedrol (1):
=20=20lightmediascanner: Add version 0.4.4 (initial recipe)

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Denys Dmytriyenko (2):
=20=20preferred-versions: update mesa version to 7.11 to match oe-core
=20=20preferred-versions: update tiff version to 3.9.5 to match oe-core

Khem Raj (2):
=20=20angstrom-2010-preferred-versions: Pin xserver-xorg to 1.11.1
=20=20angstrom-2010.x: Suffix binutils-cross-canadian with =
TRANSLATED_TARGET_ARCH

Koen Kooi (3):
=20=20update-rc.d 0.7: don't let update-rc.d start initscripts when systemd =
is pre
=20=20images: don't include speed hacks anymore
=20=20angstrom: drop preferred version settings for perl, there's only one =
version

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Anders Darander (1):
=20=20module.bbclass: add lock to prevent error bulding ext modules

Cliff Brake (1):
=20=20squashfs-tools: add recipe

Darren Hart (1):
=20=20insane.bbclass: print full path on invalid LICENSE_FILES_CHKSUM

Joshua Lock (9):
=20=20gst-plugins-good: update to 0.10.30
=20=20tzdata: updated SRC_URI and update to 2011k
=20=20tzcode-native: update SRC_URI to new IANA location
=20=20distro-tracking-fields: update fields for tzdata and gst-plugins-good
=20=20gst-plugins-good: correctly handle gconf schema
=20=20hob: fix backtrace when dismissing open dialog
=20=20fetch2: improve usability of checksums
=20=20fetch2: enable checksum definition as SRC_URI parameter
=20=20doc: update manual for checksum changes

Kang Kai (5):
=20=20ghostscript: update to 9.04
=20=20libxml-sax-perl: update to 0.99
=20=20liburi-perl: update to 1.59
=20=20libsdl: update to 1.2.14
=20=20distro_tracking_fields: update packages tracking fields

Khem Raj (10):
=20=20bluez4: Add glib-2.0 to DEPENDS
=20=20gcc-4.6: Upgrade SRCREV to latest FSF 4.6 branch
=20=20gcc-4.6: Backport PR46934 fix
=20=20tcmode-default.inc: Add TRANSLATED_TARGET_ARCH suffix to =
binutils-cross-cana
=20=20binutils-cross-canadian: Point sysroot to correct location
=20=20gcc-configure-sdk: Point sysroot to correct location
=20=20xserver-xorg: Add mesa-dri to depends instead of virtual/libgl
=20=20gcc-4.6: Backport fix for PR32219
=20=20coreutils: Upgrade recipe 8.12 -> 8.14
=20=20pulseaudio: inherit perlnative

Lauri Hintsala (1):
=20=20poky: fix broken ubifs link in deploy folder

Martin Jansa (6):
=20=20fontconfig: fix fix-pkgconfig.patch
=20=20apr: add native support
=20=20neon: add native support
=20=20apr-util: add native support
=20=20subversion-1.6.15: add native support too
=20=20default-providers: switch virtual/libgl from mesa-xlib to mesa-dri

Nitin A Kamble (7):
=20=20x86 tune files: set baselib for x32 tune as libx32
=20=20python-scons: upgrade from 2.0.1 to 2.1.0
=20=20python-dbus: upgrade from 0.83.2 to 0.84.0
=20=20libxml-parser-perl: upgrade from 2.40 to 2.41
=20=20distro-tracking: update data for some toolchain recipes
=20=20tcl: upgrade from 8.5.9 to 8.5.10
=20=20perl: upgrade from 5.12.3 to 5.14.2

Otavio Salvador (5):
=20=20src_distribute.bbclass, src_distribute_local.bbclass: mostly rewritten
=20=20bootimg.bbclass: add support to disable HDD image building
=20=20useradd.bbclass: check if a group already exists manually
=20=20base-passwd: move initial criation of group and passwd to preinst
=20=20dbus: use useradd class to allow use in read-only filesystems

Paul Eggleton (2):
=20=20gst-plugins-base: update to 0.10.35
=20=20gst-plugins-good: add pulseaudio to DEPENDS

Saul Wold (4):
=20=20ghostscript: Disable parallel make due to install issues
=20=20ghostscript: renamed x86_64 to x86-64 for patch to work
=20=20texi2html: Added recipe from OE
=20=20oprofile: Update to 0.9.7 and convert cvs->git

Wenzong Fan (2):
=20=20ccache: update to 3.1.6
=20=20chkconfig: Update to 1.3.55

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-texasinstruments:

Denys Dmytriyenko (3):
=20=20u-boot-2011.10rc: update to cover ti33x SOC boards, not just =
beaglebone
=20=20u-boot 2011.10rc: update with latest rev and new SRC_URI
=20=20u-boot 2011.10rc: update to the latest revision

Joel A Fernandes (6):
=20=20linux-ti33x-psp 3.1rc8: Add pin mux and init for beaglebone specific =
devices
=20=20sdcard_image: Copy user.txt/uEnv.txt if it exists in /boot
=20=20beaglebone-tester: Update to latest and bump PR
=20=20u-boot 2011.10rc: Read EEPROM header correctly for BeagleBone board =
detectio
=20=20beaglebone-tester: Update to latest and bump PR
=20=20linux-ti33x-psp 3.1rc8: Update to latest SRCREV, add EEPROM patches

Khem Raj (1):
=20=20signgp: Point S to WORKDIR

Koen Kooi (31):
=20=20gadget-init: add ugly, ugly hack to make USB work on ti33x boards
=20=20linux-ti33x-psp 3.1rc8: fix USB regression for beaglebone, don't =
disable DEB
=20=20gadget-init: fix target in the unit files
=20=20sdcard_image bbclass: make VFAT partition name overridable
=20=20u-boot 2011.10rc: make uboot pass beaglebone machine ID when =
encountering a=20
=20=20linux-ti335x-psp 3.1rc8: add proper machine ID for beaglebone
=20=20linux 3.0: move to 3.0.7
=20=20linux 3.0: enable more usb wifi cards for beagleboard, fix write =
protect pin
=20=20linux-ti33x-psp 3.1rc8: bump SRCREV, enable RTC for bone
=20=20u-boot 2011.10rc: update with latest rev
=20=20ti-hw-bringup-image: ship musb workaround
=20=20sdcard_image bblass: set beaglebone VFAT label to 'BEAGLE_BONE'
=20=20multi-kernel: the fetcher doesn't support dotfiles anymore, so get =
rid of th
=20=20linux-ti33x-psp 3.1rc8: only use one config for beaglebone
=20=20README: update
=20=20linux 3.0: refresh all patches against 3.0.7
=20=20libgles-omap3: adjust INSANE_SKIP to match the new format
=20=20matrix: sync with arago-next
=20=20uboot 2011.10rc: rediff RO patch
=20=20linux-ti33x-psp 3.1rc8: remove MUSB probe order for beaglebone
=20=20gadget-init: add in latest batch of workarounds
=20=20omap3-sgx-modules: use MACHINE_KERNEL_PR
=20=20u-boot 2011.10rc: remove beaglebone machine ID patch
=20=20linux-ti33x-psp 3.1rc8: include latest MUSB code, remove machine ID =
patches
=20=20gadget-init: adjust to latest 335x kernel
=20=20cloud9 image: also ship vimrc
=20=20sdcard image bbclass: don't copy uEnv.txt for the time being
=20=20linux-ti33x-psp 3.1rc8: use LZO compression for beaglebone to squeeze =
out so
=20=20linux-ti335x-psp 3.1rc8: tree has been rebased, fix SRCREV
=20=20sdcard_image bbclass: reinstate uEnv.txt copying
=20=20ti-hw-bringup-image: don't include speed hacks

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

Klaus Kurzmann (5):
=20=20om-gta04.conf: add a machine config for the gta04
=20=20linux-gta04_git.bb: add a kernel for the gta04
=20=20shr-image.inc: we don't want udev for the gta04
=20=20xserver-xf86-config: add a xorg.conf for the om-gta04 machine
=20=20fsogsmd_git.bb: give the modem plugin for gta04 it's own package

Lukas M=C3=A4rdian (1):
=20=20shr-splash-theme-logo: add om-gta04, bump SRCREV

Martin Jansa (9):
=20=20SHR: drop pulseaudio P_V
=20=20meta-shr: add abiword provider
=20=20meta-openmoko: linux-openmoko: fix usbhost
=20=20meta-shr: subversion: prefer 1.7.0
=20=20meta-openmoko: mesa-dri, libdrm: fix override, armv4t =
(PACKAGE_ARCH/TUNE_PKG
=20=20shr-image: add debug-tweaks
=20=20meta-shr: use --non-interactive --trust-server-cert in FETCHCMD_svn
=20=20linux.inc: sync with cleaned version from meta-handheld
=20=20linux.inc: be more strict in CONF_SED_SCRIPT

Simon Busch (11):
=20=20meta-fso: libsamsung-ipc: bump SRCREV
=20=20meta-fso: cornucopia: bump SRCREV
=20=20meta-shr: shr-image: don't use udev for palmpre machine; we're using =
plain d
=20=20meta-aurora: aurora-image: choose devtmpfs or other depending on what =
the ma
=20=20meta-shr: shr-image: we want devtmpfs rather than udev for the crespo =
machin
=20=20meta-aurora: aurora-base: bump SRCREV
=20=20meta-fso: fso-specs: bump SRCREV and PV
=20=20meta-fso: libfso-glib: bump SRCREV and PV
=20=20meta-fso: qfsodbusxml2cpp: import from oe-dev and add BBCLASSEXTEND =
=3D "nativ
=20=20meta-fso: libfso-qt: import from oe-dev
=20=20meta-aurora: aurora-daemon: add libfso-qt as dependency

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-micro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-slugos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nslu2:

Khem Raj (1):
=20=20linux-firmware: Remove use from meta-oe

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Tom Zanussi (1):
=20=20meta-jasperforest: add xserver-xorg bbappend

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-handheld:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-opie:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:

Paul Menzel (6):
=20=20binutils-{canadian,cross}-sdk_2.18: Remove checksums and implicitly =
update t
=20=20memtester: Add `HOMEPAGE =3D "http://pyropus.ca/software/memtester/"`
=20=20memtester: Order header fields according to style guide [1]
=20=20memtester: Remove redundant `S =3D "${WORKDIR}/memtester-${PV}"`
=20=20memtester: Remove version 4.0.5
=20=20memtester: Remove version 4.0.6




