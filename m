Received: from oh-69-34-21-229.sta.embarqhsd.net ([69.34.21.229]
	helo=happy.bec-systems.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1RNvJP-0007Ce-FG; Wed, 09 Nov 2011 00:42:40 +0100
Received: from localhost.localdomain ([127.0.0.1] helo=happy.bec-systems.com)
	by happy.bec-systems.com with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1RNvDK-0003NX-Kg; Tue, 08 Nov 2011 18:36:22 -0500
Date: Tue, 08 Nov 2011 18:36:22 -0500
Message-Id: <E1RNvDK-0003NX-Kg@happy.bec-systems.com>
X-Mailer: Nodemailer (0.1.13; +http://www.nodemailer.org)
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
MIME-Version: 1.0
Subject: OE Changelog for 2011-10-31 to 2011-11-7
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
X-List-Received-Date: Tue, 08 Nov 2011 23:42:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Changelog for 2011-10-31 to 2011-11-7.  Projects included in this report:

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

Christopher Larson (5):
=20=20codeparser: merge the nested python parsing classes
=20=20codeparser: simplify how we compare the called node names
=20=20codeparser: accept a name for better messages
=20=20codeparser: drop expand tracking
=20=20codeparser: silence non-literal warnings for vardeps

Richard Purdie (2):
=20=20Release 1.14.0
=20=20Increment version post release

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Bruce Ashfield (4):
=20=20linux-libc-headers: factor common code into linux-libc-headers.inc
=20=20linux-libc-headers: provide 3.0.x and 3.1 headers
=20=20linux-libc-headers: remove older recipes
=20=20linux-yocto_3.0: update base to v3.0.8 + meta config changes

Dmitry Cherukhin (1):
=20=20tslib: fix the bug with loading libts-1.0.so

Dongxiao Xu (2):
=20=20iptables: upgrade to version 1.4.12.1
=20=20connman: add xtables_version to fix xtables API change

Elizabeth Flanagan (1):
=20=20buildstats: Fix for buildstats on tmpfs

Holger Hans Peter Freyther (2):
=20=20udev: Fix the packaging of libgudev
=20=20udev: Split out consolekit and udev-acl

Joshua Lock (1):
=20=20lib/oe/terminal: add support for XFCE's terminal emulator

Koen Kooi (7):
=20=20avahi: fix useradd race condition
=20=20rootfs_ipk bbclass: special-case base-passwd preinst to run first
=20=20rt-tests: update to 0.83
=20=20image_types bbclass: use 4k bytes per inode so we don't run out of =
space imm
=20=20connman 0.75: bump PR for iptables library change
=20=20iproute2: update to 3.0.0 to fix build with updated iptables
=20=20lighttpd 1.4.29: rename index.html to avoid clashes with DL_DIR

Kumar Gala (1):
=20=20udev-164: Update init script to do an explicit add action

Martin Jansa (9):
=20=20bitbake.conf: drop STAGING_PYDIR
=20=20libxslt: use Copyright in LIC_FILES_CHKSUM instead of COPYING
=20=20lame: add SRC_URI checksums
=20=20libcense.bbclass: fix OpenSSL mapping
=20=20python: improve packaging
=20=20libnl-2.0: move fix-pktloc_syntax_h-race.patch to libnl-2.0 =
subdirectory and
=20=20libnl-2.0: add patch from meta-openembedded to fix pkg-config file
=20=20libnl-2.0: split to more packages, as meta-openembedded does
=20=20libnl-2.0: add PE/PR bump for upgradable patch for meta-openembedded =
users

Matthew McClintock (1):
=20=20dtc: update to latest git version

Paul Eggleton (11):
=20=20scripts/combo-layer: ignore merge commits
=20=20scripts/combo-layer: make init set up initial component data
=20=20scripts/combo-layer: tidy up config example
=20=20scripts/combo-layer: make component repo branch configurable
=20=20scripts/combo-layer: fix dirty repo check
=20=20scripts/combo-layer: auto-commit updated config file
=20=20scripts/combo-layer: improve some messages
=20=20scripts/combo-layer: skip empty commits
=20=20allarch.bbclass: disable shlib and debug symbol processing
=20=20core-image-minimal-initramfs: force IMAGE_FSTYPES
=20=20qemugl: switch to new git repo

Richard Purdie (11):
=20=20coreutils: Add missing PR bump
=20=20gnome-doc-utils: Add missing glib-2.0 dependency
=20=20package_ipk: There is no longer any need to force owners/groups to =
root
=20=20dbus: Use $D not ${D} in the postinstall
=20=20package.bbclass: Fix various problems
=20=20dbus: Ensure localstatedir is added to the package
=20=20util-macros: Drop unneeded dependencies
=20=20gettext: Switch to disabling nls and reducing -native build =
dependencies to=20
=20=20bash: Ensure we fully reautoconf the recipes so site data is used
=20=20patch: Convert to use oe_terminal
=20=20bitbake.conf: Drop remaining TERMCMD pieces and document OE_TERMINAL =
usage i

Robert P. J. Day (1):
=20=20Fix HOMEPAGE values in libzypp and sat-solver .bb files

Saul Wold (7):
=20=20avahi: use useradd to create avahi user for avahi-daemon
=20=20xserver-nodm-init: Use useradd to add the xuser for rootless X
=20=20connman: Use useradd to add the xuser for DBus
=20=20dbus: ensure that the useradd shell is set to /bin/false
=20=20cogl: COPYING file Updated FSF Address
=20=20dtc: Add patch to correctly install shared libraries and links
=20=20fotowall: disable videocapture since we do not have a webcam

Scott Garman (2):
=20=20distro_tracking_fields.inc: standardize date format
=20=20distro_tracking_fields: updates for sudo, mtools, grep, and openssh

Simon Busch (1):
=20=20meta: glib-2.0: don't apply qsort_r test removable patch for native =
version

Wenzong Fan (1):
=20=20distro_tracking_fields: Update the Month to 'MMM'

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Andreas M=C3=BCller (8):
=20=20imagemagick: fix QA warnings for unshipped files
=20=20mime.bbclass: Add --disable-update-mimedb to EXTRA_OECONF
=20=20xfce.bbclass: Add further folders for ${PN}-dev/-staticdev/-dbg
=20=20xfce-panel-plugin.bbclass: Add further directories to FILES_${PN}
=20=20xfce4-clipman-plugin: initial add 1.2.2
=20=20xfce4-netload-plugin: initial add 1.0.0
=20=20xfce4-diskperf-plugin: initial add 2.3.0
=20=20midori: add ca-certificates to RRECOMMENDS_${PN}

Connor Abbott (1):
=20=20opencv: import from oe-classic and upgrade to 2.3.1

Denis 'GNUtoo' Carikli (5):
=20=20id3lib: Import from openembedded classic
=20=20liblinebreak: import from openembedded classic
=20=20id3lib: import from openembedded classic, version 3.8.3
=20=20liblinebreak: import from openembedded classic, version 1.2
=20=20meta-efl: e-wm: renice to -2

Klaus Kurzmann (1):
=20=20xserver-common_1.34: patch Xserver to add support for gta04

Koen Kooi (18):
=20=20systemd: fix internal pager
=20=20systemd-compat-units: run systemd-machine-id-setup
=20=20python-pyopenssl: import from OE classic, update to 0.13
=20=20gateone: add git version
=20=20python-tornado: add patch to fix crasher
=20=20python-simplejson: import from OE classic and update to 2.2.1
=20=20bootchart: add meego C only version
=20=20cloud9: add avahi service file
=20=20lemon 3.5.4: import from OE classic
=20=20connman: bump PR for iptables change
=20=20libc-client: import from OE classic
=20=20php 5.3.6: import from OE classic
=20=20lighttpd: bbapend 1.4.29 to add native systemd support
=20=20mplayer2: armv7a fixes
=20=20cloud9: remove obsolete patch
=20=20libcgroup 0.37.1: disable parallel make, it breaks when using lots of =
thread
=20=20ca-certificates: update to 20111025 and clean up packaging
=20=20cloud9: bump SRCREVs

Martin Jansa (16):
=20=20midori: fix build with dirty vala
=20=20navit: upgrade to latest SRCREV and remove navit-icons
=20=20xserver-nodm-init: set USER and HOME
=20=20elsa: add new login manager for Enlightenment
=20=20e-base: bump EFL_SRCREV and refresh patches and elementary version
=20=20task-x11: remove server parts and add VIRTUAL_RUNTIME variables to be =
able t
=20=20systemd-serialgetty: use better default SERIAL_CONSOLE
=20=20elfe: bump SRCREV to fix more deprecated API calls
=20=20task-x11-server: import from Angstrom
=20=20recipes: bump PR after python upgrade
=20=20gpsd: fix build with python2.7 in sysroot and python2.6 on host
=20=20evas: bump SRCREV to fix gl_x11
=20=20mplayer2: import from OE-classic
=20=20libnl: drop 2.0 and git recipes, now there is usable in oe-core
=20=20libnl1: remove libnl.inc as it doesn't help much with libnl 2.0 in =
oe-core
=20=20libav: disable yasm for x86 and x86-64 builds, because we don't have =
recipe=20

Otavio Salvador (4):
=20=20systemd-systemctl-native: add a systemctl wrapper
=20=20systemd.bbclass: make easier handle service enabling
=20=20connman: refactor systemd packaging
=20=20dhcp: add system support to dhcp-server

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Koen Kooi (4):
=20=20angstrom move to 3.1.x for linux-libc-headers
=20=20README: update to match setup-scripts changes
=20=20angstrom: drop lighttpd pinning, only one version in oe-core
=20=20angstrom-led-config: rename to led-config

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Bruce Ashfield (4):
=20=20linux-libc-headers: factor common code into linux-libc-headers.inc
=20=20linux-libc-headers: provide 3.0.x and 3.1 headers
=20=20linux-libc-headers: remove older recipes
=20=20linux-yocto_3.0: update base to v3.0.8 + meta config changes

Christopher Larson (1):
=20=20codeparser: make var_expands actually hold useful information

Dmitry Cherukhin (1):
=20=20tslib: fix the bug with loading libts-1.0.so

Dongxiao Xu (3):
=20=20netbase.bbappend: Change to version 4.46 due to the upgrade
=20=20iptables: upgrade to version 1.4.12.1
=20=20connman: add xtables_version to fix xtables API change

Elizabeth Flanagan (1):
=20=20buildstats: Fix for buildstats on tmpfs

Holger Hans Peter Freyther (2):
=20=20udev: Fix the packaging of libgudev
=20=20udev: Split out consolekit and udev-acl

Joshua Lock (2):
=20=20lib/oe/terminal: add support for XFCE's terminal emulator
=20=20machine/atom-pc: enable sound

Koen Kooi (7):
=20=20avahi: fix useradd race condition
=20=20rootfs_ipk bbclass: special-case base-passwd preinst to run first
=20=20rt-tests: update to 0.83
=20=20image_types bbclass: use 4k bytes per inode so we don't run out of =
space imm
=20=20connman 0.75: bump PR for iptables library change
=20=20iproute2: update to 3.0.0 to fix build with updated iptables
=20=20lighttpd 1.4.29: rename index.html to avoid clashes with DL_DIR

Kumar Gala (1):
=20=20udev-164: Update init script to do an explicit add action

Martin Jansa (9):
=20=20bitbake.conf: drop STAGING_PYDIR
=20=20libxslt: use Copyright in LIC_FILES_CHKSUM instead of COPYING
=20=20lame: add SRC_URI checksums
=20=20libcense.bbclass: fix OpenSSL mapping
=20=20python: improve packaging
=20=20libnl-2.0: move fix-pktloc_syntax_h-race.patch to libnl-2.0 =
subdirectory and
=20=20libnl-2.0: add patch from meta-openembedded to fix pkg-config file
=20=20libnl-2.0: split to more packages, as meta-openembedded does
=20=20libnl-2.0: add PE/PR bump for upgradable patch for meta-openembedded =
users

Matthew McClintock (1):
=20=20dtc: update to latest git version

Paul Eggleton (11):
=20=20scripts/combo-layer: ignore merge commits
=20=20scripts/combo-layer: make init set up initial component data
=20=20scripts/combo-layer: tidy up config example
=20=20scripts/combo-layer: make component repo branch configurable
=20=20scripts/combo-layer: fix dirty repo check
=20=20scripts/combo-layer: auto-commit updated config file
=20=20scripts/combo-layer: improve some messages
=20=20scripts/combo-layer: skip empty commits
=20=20allarch.bbclass: disable shlib and debug symbol processing
=20=20core-image-minimal-initramfs: force IMAGE_FSTYPES
=20=20qemugl: switch to new git repo

Richard Purdie (13):
=20=20coreutils: Add missing PR bump
=20=20gnome-doc-utils: Add missing glib-2.0 dependency
=20=20package_ipk: There is no longer any need to force owners/groups to =
root
=20=20dbus: Use $D not ${D} in the postinstall
=20=20package.bbclass: Fix various problems
=20=20dbus: Ensure localstatedir is added to the package
=20=20util-macros: Drop unneeded dependencies
=20=20gettext: Switch to disabling nls and reducing -native build =
dependencies to=20
=20=20Release 1.14.0
=20=20Increment version post release
=20=20bash: Ensure we fully reautoconf the recipes so site data is used
=20=20patch: Convert to use oe_terminal
=20=20bitbake.conf: Drop remaining TERMCMD pieces and document OE_TERMINAL =
usage i

Robert P. J. Day (1):
=20=20Fix HOMEPAGE values in libzypp and sat-solver .bb files

Saul Wold (7):
=20=20avahi: use useradd to create avahi user for avahi-daemon
=20=20xserver-nodm-init: Use useradd to add the xuser for rootless X
=20=20connman: Use useradd to add the xuser for DBus
=20=20dbus: ensure that the useradd shell is set to /bin/false
=20=20cogl: COPYING file Updated FSF Address
=20=20dtc: Add patch to correctly install shared libraries and links
=20=20fotowall: disable videocapture since we do not have a webcam

Scott Garman (2):
=20=20distro_tracking_fields.inc: standardize date format
=20=20distro_tracking_fields: updates for sudo, mtools, grep, and openssh

Scott Rifenbark (1):
=20=20documentation/yocto-project-qs/yocto-project-qs.xml: Robert P. J. Day =
Review

Simon Busch (1):
=20=20meta: glib-2.0: don't apply qsort_r test removable patch for native =
version

Wenzong Fan (1):
=20=20distro_tracking_fields: Update the Month to 'MMM'

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-texasinstruments:

Andreas M=C3=BCller (1):
=20=20netbase: follow oe-core update to 4.46

Jason Kridner (2):
=20=20sdimage_class: eliminate 2GB exception for BeagleBone
=20=20beaglebone-getting-started: Update Mac driver

Joel A Fernandes (7):
=20=20beaglebone-tester: Update with latest fixes
=20=20beaglebone-tester: Use optargs instead of ip_method on kernel cmdline
=20=20linux-ti335x-psp 3.1: Fix gpio1_6 pinmux
=20=20linux-ti335x-psp 3.1: More modular and comprehensive defconfig for =
BeagleBon
=20=20u-boot 2011.10rc: Fix pmic shut down over USB power
=20=20U-boot 2011.10rc: Refresh PMIC patch with Rev A1 fixes
=20=20beaglebone-tester: Update to latest with fixes

Koen Kooi (40):
=20=20linux-ti335x-psp 3.1: hack in DVI support for beaglebone
=20=20Revert "sdcard_image: align partitions with flash pages"
=20=20cloud9-gfx-image: add image with cloud9 and X11
=20=20xserver-xf86-config: add configs for all SOC_FAMILIES
=20=20README: update to match setup-scripts instructions
=20=20u-boot 2011.10rc: update SRCREV and rediff patches
=20=20sdcard_image bbclass: raise number of inodes to avoid out of space =
errors
=20=20linux 3.0: moved to 3.0.8
=20=20linux-ti335x-psp 3.1: update to latest v3.1-staging branch, fix =
beaglebone e
=20=20matrix: sync with arago
=20=20u-boot 2011.10rc: tweak loadaddress for faster boot
=20=20cloud9-image: add screen, git and minicom
=20=20Revert "matrix: sync with arago"
=20=20beaglebone-getting-started: initial add
=20=20bonescript: initial add
=20=20matrix: sync with arago
=20=20matrix-gui 2.0: remove initscript, lighttpd takes care of that now
=20=20matrix-gui: fix license after php rewrite
=20=20matrix-gui: include php.ini in SRC_URI
=20=20linux-ti335x-psp 3.1: add missing panel definition
=20=20linux-ti335x-psp 3.1: shrink beaglebone uImage by 584kiB
=20=20sdcard_image bbclass: add timestamp to image filename
=20=20sdcard_image bbclass: add support to copy over payload from rootfs to =
vfat
=20=20matrix-gui-submenus: fix license checksum
=20=20sdcard_image bbclass: fix payload logic
=20=20sdcard_image bbclass: make payload errors non-fatal
=20=20bonescript: add runtime dependency for nodejs
=20=20beaglebone-getting-started: update SRCREV for 8.3 fixes
=20=20cloud9-image: include bonescript and beaglebone-getting-started
=20=20cloud9-image: ship led-config
=20=20beaglebone getting started: update to latest git
=20=20sdcard_image bbclass: increas inode count again
=20=20matrix-lighttpd-config: enable matrix in lighttpd
=20=20matrix-gui: depend on matrix-lighttpd-config
=20=20sdcard_image bbclass: add ext4 support note
=20=20cloud9-image: add opencv headers and libs
=20=20cloud9-image: remove matrix2, it may return when it actually works
=20=20sdcard_image bbclass: add proper ext4 support, fix inode =
calculations, etc,=20
=20=20u-boot 2011.10rc: move beaglebone to ext4
=20=20cloud9-image: switch beaglebone to ext4

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

Martin Jansa (10):
=20=20netbase: rename bbappend file to match oe-core
=20=20ffphonelog: remove applied patch and bump SRCREV
=20=20meta-shr: fix intone build with newer elementary
=20=20task-shr-feed: add more stuff again
=20=20meta-openmoko: mplayer2: add glamo patch for om-gta02
=20=20meta-shr: update README to be clear that we sometimes depend on =
contrib/shr
=20=20meta-smartphone: update README in all layers to be clear that we =
sometimes d
=20=20intone: add dbus to DEPENDS, transitive dependencies don't work very =
well ;/
=20=20intone: drop libsdl-x11 and libxv from RDEPENDS
=20=20meta-shr: prefer mplayer2

Simon Busch (12):
=20=20meta-aurora: update aurora recipes to meet new project structure
=20=20meta-aurora: aurora-image: remove old aurora packages from install =
list
=20=20meta-aurora: aurora-daemon: update license information
=20=20meta-aurora: add first version of the qt-components recipe
=20=20meta-aurora: aurora-base: bump SRCREV
=20=20meta-aurora: aurora-daemon needs to depend on qt-components
=20=20aurora-applications: the aurora applications are now part of the =
aurora-daem
=20=20meta-aurora: aurora-image: aurora-applications are gone and now part =
of auro
=20=20meta-aurora: aurora-base: bump SRCREV
=20=20meta-aurora: qt-components: fix cross compilation and license naming
=20=20meta-fso: qfsodbusxml2cpp: we only have and need a native version of =
this ut
=20=20meta-fso: libfso-qt: only depend on native version of qfsodbusxml2cpp =
utilit

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-micro:

Phil Blundell (4):
=20=20micro: don't include sane-feed.inc
=20=20sane-feed: deleted
=20=20util-linux: package blkid separately
=20=20eglibc: disable hwcaps processing

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-slugos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nslu2:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-handheld:

Andrea Adami (2):
=20=20formfactor: initial commit of collie, poodle and tosa machconfig
=20=20xserver-xf86-config: add more xorg.conf for other Zaurus devices

Martin Jansa (1):
=20=20linux.inc: be more strict in CONF_SED_SCRIPT

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-opie:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:

Florian Boor (5):
=20=20Revert "libgee.inc: Use libtool macros from installed libtool"
=20=20vmx25.conf: Voipac i.MX25 Module
=20=20tzdata: Update download location to IANA server which is still =
working.=20=20=20=20=20
=20=20tzcode: Update download location to IANA server which is still =
working.
=20=20omap3.inc: Remove hardcoded x-loader dependency breaking builds for =
every bo

Marco Cavallini (1):
=20=20at91bootstrap_3.0.bb: Updated expected MD5 and SHA256

Philip Balister (1):
=20=20gnuradio : Update version and build with qt support.

mlafauci (3):
=20=20linux: Add vulcanoG20 machine
=20=20u-boot: Add vulcanoG20 machine
=20=20Add new vulcanoG20 machine configuration




