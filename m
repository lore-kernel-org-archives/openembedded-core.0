Received: from oh-69-34-21-229.sta.embarqhsd.net ([69.34.21.229]
	helo=happy.bec-systems.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1Rm6PQ-0007WX-Bu; Sat, 14 Jan 2012 17:24:49 +0100
Received: from localhost.localdomain ([127.0.0.1] helo=happy.bec-systems.com)
	by happy.bec-systems.com with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1Rm6I5-0006Sq-9f; Sat, 14 Jan 2012 11:17:13 -0500
Date: Sat, 14 Jan 2012 11:17:13 -0500
Message-Id: <E1Rm6I5-0006Sq-9f@happy.bec-systems.com>
X-Mailer: Nodemailer (0.1.13; +http://www.nodemailer.org)
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
MIME-Version: 1.0
Subject: OE Changelog for 2012-01-2 to 2012-01-9
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
X-List-Received-Date: Sat, 14 Jan 2012 16:24:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Changelog for 2012-01-2 to 2012-01-9.  Projects included in this report:

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

Dongxiao Xu (8):
=20=20command.py: Modify needcache value for certain functions
=20=20cooker: user bb.configuration.data to inject events
=20=20command.py: add initCooker API
=20=20xmlrpc: Change BitbakeServerInfo init function
=20=20cooker: remove command import in cooker.py
=20=20cooker: remove command import in cooker.py
=20=20bitbake: add a new option "--server-only"
=20=20command.py: add parseConfigurationFiles API

Juraj Hercek (1):
=20=20fetch2/git: change colon to dot in ud.host

Paul Eggleton (1):
=20=20bitbake-layers: fix Python error during parse

Richard Purdie (3):
=20=20cooker.py: Convert a bb.data.expand refernce to the updated syntax
=20=20bitbake/runqueue: Improve the setscene logging
=20=20cooker.py: Add missing BB_WORKERCONTEXT conditionals

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Andrea Adami (2):
=20=20xorg-driver: add xf86-video-fbdev from meta-openembedded
=20=20x11-common: remove extraneous BSP customizations

Andrei Gherzan (1):
=20=20wpa-supplicant - pulls GPLv3 license rpm in a non-GPLv3 build =
(libgnutls-ext

Bruce Ashfield (7):
=20=20linux-yocto: add cedartrail BSP support
=20=20linux-yocto: update hardware reference boards to 3.0.12
=20=20kern-tools: update SRCREV to pickup git operation fixes
=20=20linux-yocto: use PATH to locate kconf_check
=20=20kern-tools: import flexible branching support
=20=20linux-yocto: bump kernel version to v3.0.14
=20=20linux-yocto: use src_patches for out of tree kernel feature support

Christopher Larson (5):
=20=20buildhistory: avoid quoting issues with the layer list for build-id
=20=20patch.bbclass: abstract out logic that determines patches to apply
=20=20glib-2.0: we need zlib
=20=20elfutils: fix for dso link change in recent ld
=20=20opkg-utils: use /usr/bin/env python

Darren Hart (4):
=20=20linux-yocto-tiny: New kernel recipe for tiny distros
=20=20task-core-boot: Allow DISTRO to disable keymaps via =
VIRTUAL-RUNTIME_keymaps
=20=20image_types: Ensure /init exists for cpio rootfs archives
=20=20distro: Add poky-tiny distro definition

Derek Buitenhuis (1):
=20=20binutils-cross-canadian: Allow ld-is-gold

Dexuan Cui (7):
=20=20mdadm: upgrade to the latest version 3.2.3
=20=20liburcu: upgrade from 0.6.4 to the latest 0.6.7
=20=20lttng-ust: upgrade from 0.15 to the latest 0.16
=20=20libpciaccess: upgrade from 0.12.1 to 0.12.902
=20=20util-macros: upgrade from 1.15.0 to the latest 1.16.0
=20=20distro_tracking_fields.inc: update the info
=20=20mc: fix configure with automake 1.11.2

Dongxiao Xu (2):
=20=20image.bbclass: Use ?=3D to set LINGUAS_INSTALL
=20=20bblayers.conf.sample: Use ?=3D to set BBLAYERS

Frans Meulenbroeks (1):
=20=20u-boot: improved DESCRIPTION, fixed HOMEPAGE

Gary Thomas (2):
=20=20xserver-kdrive: work around issues with -Werror=3Daddress
=20=20base-files: filesystems: fix mount order

Joshua Lock (3):
=20=20linux-tools: add binutils to perf DEPENDS
=20=20cogl: ensure we can build on armv4
=20=20busybox: rename syslog.conf to syslog-startup.conf

Koen Kooi (2):
=20=20webkit-gtk svn: update to r101488
=20=20procps: raise update-alternatives priority

Mark Hatle (1):
=20=20base.bbclass: Allow buildstats to be optionally supplied

Mei Lei (1):
=20=20rpm: Fix rpm database files capacity issue.

Nitin A Kamble (23):
=20=20byacc: upgrade from 20110908 to 20111219
=20=20rpm: fix build with automake-1.11.2
=20=20autotools.bbclass: fix cp error for empty dir
=20=20jpeg: fix configure with automake 1.11.2
=20=20avahi: fix configure with automake 1.11.2
=20=20misc patches: fix patch headers
=20=20perl: mark upstream status for all patches
=20=20gcc: mark upstream status for all patches
=20=20avahi-ui: fix build with automake-1.11.2
=20=20systemtap: fix configure with automake 1.11.2
=20=20btrfs-tools: add attr as dependency to fix compilation
=20=20quilt upgreade from 0.48 to 0.50
=20=20automake: upgrade from 1.11.1 to 1.11.2
=20=20btrfs-tools:Fix multithreaded building
=20=20prelink: also look at nonstandard lib paths
=20=20vte: upgrade from 0.24.3 to 0.28.2
=20=20autoconf: fix nativesdk rdepends
=20=20python-pycairo: fix for x32
=20=20libevent: fix compilation for x32
=20=20vte: update patch header
=20=20automake-1.11.2: backport pkglibexec_SCRIPTS fix
=20=20mc: remove not needed fix for automake 1.11.2
=20=20systemtap: remove not needed fix for automake 1.11.2

Otavio Salvador (15):
=20=20udev: drop 145 version
=20=20udev-extraconf: move mount.blacklist to udev-extraconf dir
=20=20udev: reorganize files of 164 version
=20=20udev: use tabs for init script (no code changes)
=20=20udev: skip mounting /dev on tmpfs if it is on devtmpfs
=20=20udev: use 'echo' instead of 'echo -n' in init script
=20=20udev: split utilities onto udev-utils
=20=20udev: remove commented code from init script (no code changes)
=20=20qt4-graphics-system: add
=20=20qt4e.bbclass: add QT_BASE_NAME for use in recipes
=20=20qt4x11.bbclass: add QT_BASE_NAME for use in recipes
=20=20qt4-embedded.inc: use QT_BASE_NAME from qt4e.bbclass
=20=20qt4-x11-free.inc: use QT_BASE_NAME from qt4x11.bbclass
=20=20initscripts: avoid mounting /sys if it is already mounted
=20=20udev: ensure /dev/pts and /dev/shm does exists

Paul Eggleton (14):
=20=20classes/rootfs_rpm: handle recommends in query functions
=20=20classes/image: implement generic locale package installation
=20=20buildhistory: improve git commit robustness
=20=20qt4: fix incorrect architecture for qt4 tools
=20=20qt4: add version 4.8.0
=20=20distro-tracking-fields: update qt recipe info
=20=20classes/update-alternatives: fix typos and grammar
=20=20README: add short description of OE-Core
=20=20conf/local.conf.sample: fix typos/grammar/formatting
=20=20qt4: add Upstream-Status to recently added qt-4.8.0 patch
=20=20buildhistory: add script to check for significant changes
=20=20classes/buildhistory: add hostname to commit message
=20=20classes/buildhistory: make the package version backwards error =
non-fatal
=20=20classes/buildhistory: remove redundant package history checking stub

Phil Blundell (2):
=20=20bitbake.conf: remove some redundant/unnecessary variable exports
=20=20python-native: correct prefix handling for oe-core sysroot layout

Richard Purdie (6):
=20=20poky-tiny: remove poky-tiny, it was added to the wrong accidentally
=20=20populate_sdk_ipk.bbclass: Ensure the correct environment is setup for =
postin
=20=20valgrind: Fix for automake update
=20=20native.bbclass: Fix variable remapping coverage
=20=20multilib: Abstract class extension code into classextend.py
=20=20image-mklibs/package_ipk: Remove bashisms

Saul Wold (20):
=20=20resolvconf: Update to 1.63
=20=20libiconv: Update to 1.14
=20=20dropbear: fix CRYPTLIB patch
=20=20python: add md5module support
=20=20util-linux: Update to 2.20.1
=20=20rxvt-unicode: Update to 9.14
=20=20Add Upstream-Status to patches
=20=20boost: Update to 1.48 and Clean ups
=20=20distro_tracking: Updated for Upgrades and Manual Check Dates
=20=20puzzles: fixed SRC_URI Checksums
=20=20texinfo: fix gettext patch
=20=20gnutls: more gettext version fixes
=20=20glib-2.0: disable dtrace due to host contamination
=20=20pseudo: ensure libs are included in package
=20=20image_types: Fix rootfs size calcuation
=20=20libxp: fix cast error
=20=20glib-2.0: ensure dtrace is diabled for all distro options and fix =
packaging
=20=20Patch Upstream-Status Update
=20=20util-linux: Update patch for non-GPLv3
=20=20gnutls: remove gettext patch for non-GPLv3

Scott Garman (11):
=20=20prelink: update to latest git version
=20=20chrpath: upgrade to 0.14
=20=20libevent: upgrade to 2.0.16
=20=20ncurses: move libraries to base_libdir
=20=20libcap: move library to base_libdir
=20=20util-linux: move libraries to base_libdir
=20=20e2fsprogs: move libraries to base_libdir
=20=20libusb1: move libraries to base_libdir
=20=20insane.bbclass: add QA tests for unsafe references to exec_prefix
=20=20insane.bbclass: use bb.process.Popen instead of =
subprocess.check_output
=20=20libusb-compat: move libraries to base_libdir

Shane Wang (30):
=20=20distro_tracking_fields: update the info for the manual check list =
(2011/12/2
=20=20distro_tracking_fields: take the ownership of Mei Lei's
=20=20polkit: upgrade to 0.103
=20=20gst-plugins-ugly: upgrade to 0.10.18
=20=20gst-plugins-bad: upgrade to 0.10.22
=20=20gst-fluendo-mp3: upgrade to 0.10.16
=20=20gst-fluendo-mpegdemux: upgrade to 0.10.69
=20=20gst-ffmpeg: upgrade to 0.10.13
=20=20mtd-utils: upgrade to 1.4.9
=20=20valgrind: upgrade to 3.7.0
=20=20telepathy-glib: upgrade to 0.17.4
=20=20ofono: upgrade to 1.0
=20=20libpcap: upgrade to 1.2.0
=20=20distro_tracking_fields: update the info for recipe upgrading
=20=20freetype: upgrade to 2.4.8
=20=20minicom: upgrade to 2.5
=20=20glib-2.0: upgrade to 2.30.2
=20=20libical: upgrade to 0.48
=20=20libsamplerate0: upgrade to 0.1.8
=20=20distro_tracking_fields: update the info for recipe upgrade.
=20=20distro_tracking_fields: update the info for recipe upgrade.
=20=20distro_tracking_fields: update the info for recipe upgrade.
=20=20oprofileui: upgrade to 82ecf8c6b53b84f80682a8312f9defa83a95f2a3
=20=20libomxil: upgrade to 0.9.3
=20=20linux-firmware: upgrade to 15888a2eab052ac3d3f49334e4f6f05f347a516e
=20=20matchbox-wm-2: ugrade to 01fa5465743c9ee43d040350f4405d35293e4869
=20=20quota: upgrade to 4.00
=20=20watchdog: upgrade to 5.11
=20=20puzzles: upgrade to r9375.
=20=20distro_tracking_fields: update the info for this round of package =
upgrade

Tom Zanussi (1):
=20=20rpm2cpio.sh: make compression tests case-insensitive

Xiaofeng Yan (1):
=20=20core-image-gtk-directfb: add a bb file to build an image for gtk over =
direct

Zhai Edwin (9):
=20=20mini-x-session: Add this recipe as the session file for mini X
=20=20Add mini X core tasks
=20=20Add "builder" user for specific purpose.
=20=20self-hosted-image: Add builder user and mini X
=20=20gnome-keyring: fix gsettings_data_convert seg fault
=20=20lighttpd: Upgrade to 1.4.30
=20=20apr-util: Upgrade to 1.4.1
=20=20libassuan: Upgrade to 2.0.3
=20=20matchbox-wm: Remove x-session-manager handling

Zhenhua Luo (1):
=20=20valgrind: add powerpc to the compatible host and add ${TCLIBC}-dbg in =
RRECOM

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Andrea Adami (2):
=20=20kernel.bbclass: fix pkg_postinst and pkg_postrm (from oe-core)
=20=20xf86-video-fbdev: remove, driver is now in oe-core

Andreas M=C3=BCller (8):
=20=20tumbler: update to 0.1.23
=20=20xfwm4: update to 4.8.1
=20=20libxfce4ui: update to 4.8.1
=20=20xfce.bbclass: inherit gettext
=20=20libxfce4ui: remove gettext from DEPENDS since xfce.bbclass takes care
=20=20ristretto: fix build error by including locale.h
=20=20udisks: add native systemd support
=20=20gvfs: rework and add recipe for gvfs-gdu-volume-monitor

Koen Kooi (3):
=20=20lighttpd: move bbappend to new version to match OE-core
=20=20nodejs-native: clarify dependencies to match updated oe-core parser
=20=20kmod: add recipe for version 3, no compatibility symlinks yet

Otavio Salvador (5):
=20=20xserver-nodm-init: move systemd service to xserver-nodm-init-systemd
=20=20meta-efl: elsa: rconflicts/rreplaces xserver-nodm-init-systemd
=20=20task-x11: use xserver-nodm-init-systemd
=20=20busybox: add systemd support for syslog service
=20=20udisks: disable manpage building

Peter A. Bigot (2):
=20=20python-pyusb: add recipe to support usb development in Python
=20=20ntp: correct systemd EnvironmentFile, add ntpdate service

Zhenhua Luo (1):
=20=20xfsprogs: add version 3.1.7

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Khem Raj (1):
=20=20angstrom-2010.x.conf, angstrom-bleeding.conf: Define =
ANGSTROM_EGLIBC_VERSION

Koen Kooi (1):
=20=20efl-nodm-image: adjust to update xserver-nodm-init in meta-oe

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Andrea Adami (2):
=20=20xorg-driver: add xf86-video-fbdev from meta-openembedded
=20=20x11-common: remove extraneous BSP customizations

Andrei Gherzan (1):
=20=20wpa-supplicant - pulls GPLv3 license rpm in a non-GPLv3 build =
(libgnutls-ext

Bruce Ashfield (9):
=20=20linux-yocto: add cedartrail BSP support
=20=20linux-yocto: update hardware reference boards to 3.0.12
=20=20kern-tools: update SRCREV to pickup git operation fixes
=20=20linux-yocto: use PATH to locate kconf_check
=20=20linux-yocto/meta-yocto: routerstationpro/beagleboard: add 3.0.x =
support
=20=20linux-yocto-rt/meta-yocto: add routerstationpro support
=20=20kern-tools: import flexible branching support
=20=20linux-yocto: bump kernel version to v3.0.14
=20=20linux-yocto: use src_patches for out of tree kernel feature support

Christopher Larson (5):
=20=20buildhistory: avoid quoting issues with the layer list for build-id
=20=20patch.bbclass: abstract out logic that determines patches to apply
=20=20glib-2.0: we need zlib
=20=20elfutils: fix for dso link change in recent ld
=20=20opkg-utils: use /usr/bin/env python

Darren Hart (7):
=20=20linux-yocto-tiny: New kernel recipe for tiny distros
=20=20task-core-boot: Allow DISTRO to disable keymaps via =
VIRTUAL-RUNTIME_keymaps
=20=20image_types: Ensure /init exists for cpio rootfs archives
=20=20distro: Add POKY_DEFAULT_EXTRA_R* variables
=20=20distro: Add poky-tiny distro definition
=20=20distro: Add poky-tiny distro definition
=20=20distro: Update poky-tiny distro definition

Derek Buitenhuis (1):
=20=20binutils-cross-canadian: Allow ld-is-gold

Dexuan Cui (7):
=20=20mdadm: upgrade to the latest version 3.2.3
=20=20liburcu: upgrade from 0.6.4 to the latest 0.6.7
=20=20lttng-ust: upgrade from 0.15 to the latest 0.16
=20=20libpciaccess: upgrade from 0.12.1 to 0.12.902
=20=20util-macros: upgrade from 1.15.0 to the latest 1.16.0
=20=20distro_tracking_fields.inc: update the info
=20=20mc: fix configure with automake 1.11.2

Dongxiao Xu (10):
=20=20image.bbclass: Use ?=3D to set LINGUAS_INSTALL
=20=20bblayers.conf.sample: Use ?=3D to set BBLAYERS
=20=20command.py: Modify needcache value for certain functions
=20=20cooker: user bb.configuration.data to inject events
=20=20command.py: add initCooker API
=20=20xmlrpc: Change BitbakeServerInfo init function
=20=20cooker: remove command import in cooker.py
=20=20cooker: remove command import in cooker.py
=20=20bitbake: add a new option "--server-only"
=20=20command.py: add parseConfigurationFiles API

Frans Meulenbroeks (1):
=20=20u-boot: improved DESCRIPTION, fixed HOMEPAGE

Gary Thomas (2):
=20=20xserver-kdrive: work around issues with -Werror=3Daddress
=20=20base-files: filesystems: fix mount order

Joshua Lock (3):
=20=20linux-tools: add binutils to perf DEPENDS
=20=20cogl: ensure we can build on armv4
=20=20busybox: rename syslog.conf to syslog-startup.conf

Juraj Hercek (1):
=20=20fetch2/git: change colon to dot in ud.host

Koen Kooi (2):
=20=20webkit-gtk svn: update to r101488
=20=20procps: raise update-alternatives priority

Mark Hatle (1):
=20=20base.bbclass: Allow buildstats to be optionally supplied

Mei Lei (1):
=20=20rpm: Fix rpm database files capacity issue.

Nitin A Kamble (23):
=20=20byacc: upgrade from 20110908 to 20111219
=20=20rpm: fix build with automake-1.11.2
=20=20autotools.bbclass: fix cp error for empty dir
=20=20jpeg: fix configure with automake 1.11.2
=20=20avahi: fix configure with automake 1.11.2
=20=20misc patches: fix patch headers
=20=20perl: mark upstream status for all patches
=20=20gcc: mark upstream status for all patches
=20=20avahi-ui: fix build with automake-1.11.2
=20=20systemtap: fix configure with automake 1.11.2
=20=20btrfs-tools: add attr as dependency to fix compilation
=20=20quilt upgreade from 0.48 to 0.50
=20=20automake: upgrade from 1.11.1 to 1.11.2
=20=20btrfs-tools:Fix multithreaded building
=20=20prelink: also look at nonstandard lib paths
=20=20vte: upgrade from 0.24.3 to 0.28.2
=20=20autoconf: fix nativesdk rdepends
=20=20python-pycairo: fix for x32
=20=20libevent: fix compilation for x32
=20=20vte: update patch header
=20=20automake-1.11.2: backport pkglibexec_SCRIPTS fix
=20=20mc: remove not needed fix for automake 1.11.2
=20=20systemtap: remove not needed fix for automake 1.11.2

Otavio Salvador (15):
=20=20udev: drop 145 version
=20=20udev-extraconf: move mount.blacklist to udev-extraconf dir
=20=20udev: reorganize files of 164 version
=20=20udev: use tabs for init script (no code changes)
=20=20udev: skip mounting /dev on tmpfs if it is on devtmpfs
=20=20udev: use 'echo' instead of 'echo -n' in init script
=20=20udev: split utilities onto udev-utils
=20=20udev: remove commented code from init script (no code changes)
=20=20qt4-graphics-system: add
=20=20qt4e.bbclass: add QT_BASE_NAME for use in recipes
=20=20qt4x11.bbclass: add QT_BASE_NAME for use in recipes
=20=20qt4-embedded.inc: use QT_BASE_NAME from qt4e.bbclass
=20=20qt4-x11-free.inc: use QT_BASE_NAME from qt4x11.bbclass
=20=20initscripts: avoid mounting /sys if it is already mounted
=20=20udev: ensure /dev/pts and /dev/shm does exists

Paul Eggleton (15):
=20=20classes/rootfs_rpm: handle recommends in query functions
=20=20classes/image: implement generic locale package installation
=20=20buildhistory: improve git commit robustness
=20=20qt4: fix incorrect architecture for qt4 tools
=20=20qt4: add version 4.8.0
=20=20distro-tracking-fields: update qt recipe info
=20=20bitbake-layers: fix Python error during parse
=20=20classes/update-alternatives: fix typos and grammar
=20=20README: add short description of OE-Core
=20=20conf/local.conf.sample: fix typos/grammar/formatting
=20=20qt4: add Upstream-Status to recently added qt-4.8.0 patch
=20=20buildhistory: add script to check for significant changes
=20=20classes/buildhistory: add hostname to commit message
=20=20classes/buildhistory: make the package version backwards error =
non-fatal
=20=20classes/buildhistory: remove redundant package history checking stub

Phil Blundell (2):
=20=20bitbake.conf: remove some redundant/unnecessary variable exports
=20=20python-native: correct prefix handling for oe-core sysroot layout

Richard Purdie (7):
=20=20poky-tiny: remove poky-tiny, it was added to the wrong accidentally
=20=20populate_sdk_ipk.bbclass: Ensure the correct environment is setup for =
postin
=20=20valgrind: Fix for automake update
=20=20native.bbclass: Fix variable remapping coverage
=20=20multilib: Abstract class extension code into classextend.py
=20=20bitbake/runqueue: Improve the setscene logging
=20=20image-mklibs/package_ipk: Remove bashisms

Saul Wold (20):
=20=20resolvconf: Update to 1.63
=20=20libiconv: Update to 1.14
=20=20dropbear: fix CRYPTLIB patch
=20=20python: add md5module support
=20=20util-linux: Update to 2.20.1
=20=20rxvt-unicode: Update to 9.14
=20=20Add Upstream-Status to patches
=20=20boost: Update to 1.48 and Clean ups
=20=20distro_tracking: Updated for Upgrades and Manual Check Dates
=20=20puzzles: fixed SRC_URI Checksums
=20=20texinfo: fix gettext patch
=20=20gnutls: more gettext version fixes
=20=20glib-2.0: disable dtrace due to host contamination
=20=20pseudo: ensure libs are included in package
=20=20image_types: Fix rootfs size calcuation
=20=20libxp: fix cast error
=20=20glib-2.0: ensure dtrace is diabled for all distro options and fix =
packaging
=20=20Patch Upstream-Status Update
=20=20util-linux: Update patch for non-GPLv3
=20=20gnutls: remove gettext patch for non-GPLv3

Scott Garman (11):
=20=20prelink: update to latest git version
=20=20chrpath: upgrade to 0.14
=20=20libevent: upgrade to 2.0.16
=20=20ncurses: move libraries to base_libdir
=20=20libcap: move library to base_libdir
=20=20util-linux: move libraries to base_libdir
=20=20e2fsprogs: move libraries to base_libdir
=20=20libusb1: move libraries to base_libdir
=20=20insane.bbclass: add QA tests for unsafe references to exec_prefix
=20=20insane.bbclass: use bb.process.Popen instead of =
subprocess.check_output
=20=20libusb-compat: move libraries to base_libdir

Scott Rifenbark (7):
=20=20documentation/kernel-manual/kernel-doc-intro.xml: General clean-up
=20=20documentation/kernel-manual/kernel-concepts.xml: General edits.
=20=20documentation/kernel-manual/kernel-how-to.xml: general edits
=20=20documentation/poky-ref-manual: Enabling recipes with commercial =
license requ
=20=20documentation/poky-ref-manual/ref-variables.xml: image size glossary
=20=20documentation/yocto-project-qs/yocto-project-qs.xml: Added =
libxml-parser-per
=20=20documentation/yocto-project-qs/yocto-project-qs.xml: removed disable =
dash te

Shane Wang (30):
=20=20distro_tracking_fields: update the info for the manual check list =
(2011/12/2
=20=20distro_tracking_fields: take the ownership of Mei Lei's
=20=20polkit: upgrade to 0.103
=20=20gst-plugins-ugly: upgrade to 0.10.18
=20=20gst-plugins-bad: upgrade to 0.10.22
=20=20gst-fluendo-mp3: upgrade to 0.10.16
=20=20gst-fluendo-mpegdemux: upgrade to 0.10.69
=20=20gst-ffmpeg: upgrade to 0.10.13
=20=20mtd-utils: upgrade to 1.4.9
=20=20valgrind: upgrade to 3.7.0
=20=20telepathy-glib: upgrade to 0.17.4
=20=20ofono: upgrade to 1.0
=20=20libpcap: upgrade to 1.2.0
=20=20distro_tracking_fields: update the info for recipe upgrading
=20=20freetype: upgrade to 2.4.8
=20=20minicom: upgrade to 2.5
=20=20glib-2.0: upgrade to 2.30.2
=20=20libical: upgrade to 0.48
=20=20libsamplerate0: upgrade to 0.1.8
=20=20distro_tracking_fields: update the info for recipe upgrade.
=20=20distro_tracking_fields: update the info for recipe upgrade.
=20=20distro_tracking_fields: update the info for recipe upgrade.
=20=20oprofileui: upgrade to 82ecf8c6b53b84f80682a8312f9defa83a95f2a3
=20=20libomxil: upgrade to 0.9.3
=20=20linux-firmware: upgrade to 15888a2eab052ac3d3f49334e4f6f05f347a516e
=20=20matchbox-wm-2: ugrade to 01fa5465743c9ee43d040350f4405d35293e4869
=20=20quota: upgrade to 4.00
=20=20watchdog: upgrade to 5.11
=20=20puzzles: upgrade to r9375.
=20=20distro_tracking_fields: update the info for this round of package =
upgrade

Tom Zanussi (1):
=20=20rpm2cpio.sh: make compression tests case-insensitive

Xiaofeng Yan (1):
=20=20core-image-gtk-directfb: add a bb file to build an image for gtk over =
direct

Zhai Edwin (9):
=20=20mini-x-session: Add this recipe as the session file for mini X
=20=20Add mini X core tasks
=20=20Add "builder" user for specific purpose.
=20=20self-hosted-image: Add builder user and mini X
=20=20gnome-keyring: fix gsettings_data_convert seg fault
=20=20lighttpd: Upgrade to 1.4.30
=20=20apr-util: Upgrade to 1.4.1
=20=20libassuan: Upgrade to 2.0.3
=20=20matchbox-wm: Remove x-session-manager handling

Zhenhua Luo (1):
=20=20valgrind: add powerpc to the compatible host and add ${TCLIBC}-dbg in =
RRECOM

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-texasinstruments:

Koen Kooi (4):
=20=20bonescript: update to latest git
=20=20bonescript: make git config a CONFFILE to protect user updates
=20=20linux-ti33x-psp 3.1: register all cape/daugherboard EEPROM =
permutation in th
=20=20beaglebone-tester: clarify GPIO naming and print more EEPROM data

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

Lukas M=C3=A4rdian (4):
=20=20meta-shr: bump shr-e-gadgets SRCREV
=20=20meta-openmoko: gta04: switch to neil's 3.2-gta04 stable branch
=20=20meta-shr: bump libphone-ui
=20=20meta-shr: bump phoneuid's SRCREV

Martin Jansa (14):
=20=20estardict: add recipe for new version
=20=20task-shr-feed: add estardict
=20=20fsogsmd: fix typo in PACKAGES
=20=20meta-shr: prefer newer QT
=20=20polkit: drop bbappend
=20=20linux-openmoko: add git version for builds from gitorious/shr/linux
=20=20libphone-ui-shr: bump SRCREV
=20=20libphone-ui-shr: bump SRCREV
=20=20libphone-ui-shr: bump SRCREV
=20=20distro-feed-configs: implement filter for feeds which are empty or =
from lowe
=20=20intone: switch upstream repo from svn to git and upgrade to latest =
version
=20=20task-shr-feed: remove mcnavi
=20=20task-shr-feed: remove mcnavi

Simon Busch (2):
=20=20meta-shr: libphone-ui: bump SRCREV to get latest configuration for =
crespo ma
=20=20meta-fso: cornucopia: bump SRCREV for several bug fixes

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-micro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-slugos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nslu2:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-handheld:

Andrea Adami (1):
=20=20linux(-kexecboot): upgrade from 3.1.6 to 3.1.7

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-opie:

Paul Eggleton (2):
=20=20opie-mediaplayer2-skin-*: use common inc file
=20=20classes: add palmtop-defs.bbclass

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:




