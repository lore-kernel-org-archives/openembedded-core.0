Received: from oh-69-34-21-229.sta.embarqhsd.net ([69.34.21.229]
	helo=happy.bec-systems.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1RQmXF-0001k4-CK; Wed, 16 Nov 2011 21:56:46 +0100
Received: from localhost.localdomain ([127.0.0.1] helo=happy.bec-systems.com)
	by happy.bec-systems.com with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1RQmR1-0004Qo-C6; Wed, 16 Nov 2011 15:50:19 -0500
Date: Wed, 16 Nov 2011 15:50:19 -0500
Message-Id: <E1RQmR1-0004Qo-C6@happy.bec-systems.com>
X-Mailer: Nodemailer (0.1.13; +http://www.nodemailer.org)
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
MIME-Version: 1.0
Subject: OE Changelog for 2011-11-7 to 2011-11-14
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
X-List-Received-Date: Wed, 16 Nov 2011 20:56:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Changelog for 2011-11-7 to 2011-11-14.  Projects included in this report:

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

Richard Purdie (4):
=20=20utils.py: Fix lockfile retry handling
=20=20cooker.py: Ensure only one copy of bitbake executes at once
=20=20Add FAKEROOTNOENV variable
=20=20data_smart: Add appendVar/prependVar functions

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Bruce Ashfield (1):
=20=20linux-yocto: config cleanups + romely rt support

Darren Hart (1):
=20=20ncurses: refactor configure to avoid configuring widec when disabled

Dmitry Cherukhin (1):
=20=20qt-mobility: qa_configure stage failed

Dongxiao Xu (1):
=20=20multilib: Drop MULTILIB_IMAGE_INSTALL

Eric B=C3=A9nard (2):
=20=20dbus: fix install for virtclass-nativesdk
=20=20useradd.bbclass: handle nativesdk case

Jan Luebbe (1):
=20=20syslinux: fix the SRC_URI by using the 4.xx directory

Joshua Lock (14):
=20=20cogl: add cogl 1.8.0 recipe
=20=20clutter-1.8: add 1.8.0
=20=20clutter-gst-1.8: add 1.4.2 for use with clutter 1.8
=20=20clutter-gtk-1.8: add clutter-gtk 0.11.4
=20=20mx: add mx toolkit 1.3.2
=20=20libcanberra: add libvorbis to DEPENDS
=20=20gypsy: fix packaging
=20=20connman: split scripts into separate package
=20=20pulseaudio: make X11 dependencies optional and add gtk+
=20=20contacts: fix packaging of icons
=20=20clutter-gst: fix patch filename
=20=20shared-mime-info: package runtime data separately
=20=20classes/[gnome|gnomebase|mime]: enhance gnome related classes
=20=20gconf: add upstream GNOME gconf 3.2.3 and drop gconf-dbus

Mark Hatle (6):
=20=20pseudo: Uprev pseudo to version 1.2
=20=20rootfs_rpm.bbclass: Enable pre and post install scripts
=20=20rootfs_rpm.bbclass: Turn off script debugging
=20=20wpa-supplicant: Avoid blocking the post install script at cross =
rootfs time.
=20=20shadow: Generate the shadow files at rootfs construction
=20=20sudo: Avoid post install scripts

Martin Jansa (6):
=20=20libxml2: use Copyright in LIC_FILES_CHKSUM instead of COPYING
=20=20kbd: import from meta-oe
=20=20kbd: add RREPLACES/RCONFLICTS/RPROVIDES for upgradeable path from =
console-to
=20=20task-core-boot, keymaps: add another VIRTUAL-RUNTIME to allow =
distributions=20
=20=20keymaps: depend on kbd instead of console-tools
=20=20task-core-x11: use VIRTUAL-RUNTIME variables for xserver_common and =
graphica

Matthew McClintock (2):
=20=20Add new IMAGE_CLASSES variable for classes for image generation
=20=20Introduce new SERIAL_CONSOLES to add multiple consoles for your =
MACHINE

Otavio Salvador (7):
=20=20libcap: fix sstate for native package
=20=20files/device_table-minimal.txt: add /dev/kmsg
=20=20dhcp: drop unused dhcp3.inc file
=20=20dhcp: rename dhcp4.inc to dhcp.inc
=20=20dhcp: move server configuration to dhcp-server-config
=20=20util-linux: split mcookie into a package
=20=20xinit: rdepends on util-linux-mcookie to avoid brining whole =
util-linux

Paul Eggleton (2):
=20=20classes/package_rpm: disable uninstall scripts for upgrades
=20=20busybox: add grep to temporary links during uninstall

Paul Menzel (2):
=20=20libarchive: Remove obsolete comment and empty line at the end
=20=20xinit: Fix `startx` looking for `mcookie` in sysroot

Richard Purdie (13):
=20=20mime.bbclass: No need to import os.path, it then breaks the os module
=20=20gconf: Drop polkit dependency
=20=20useradd: Add missing DEPEND on shadow
=20=20scripts/qemuimage-testlib: Output a slightly better error if expect =
is missi
=20=20classes: Remove various bashisms
=20=20qemu: Ensure an internal qemugl script uses bash as it has bashisms
=20=20Allow use of dash as /bin/sh
=20=20Convert to use direct access to the data store (instead of =
bb.data.*Var*())
=20=20bitbake.conf: Unload pseudo when its not required for a given task
=20=20populate_*.bbclass: Drop pointless fakeroot attribute (fakeroot is at =
the ta
=20=20populate_*.bbclass: Correct INSTALL variable name after recent =
multilib chan
=20=20rootfs_ipk.bbclass: Ensure bad recommendations persist in the status =
file
=20=20opkg: Ensure we use the uname/gname fields when extracting tarballs

Saul Wold (4):
=20=20Distro_tracking: Update Manual Check Date
=20=20udev-extraconf: blacklist /dev/md
=20=20libtasn1: update to 2.10
=20=20lame: update to 3.99.1

Scott Garman (5):
=20=20useradd.bbclass: fix how RDEPENDS is setup
=20=20useradd.bbclass: only modify packages in USERADD_PACKAGES
=20=20useradd.bbclass: do not modify -nativesdk packages
=20=20useradd-example.bb: update example documentation comments
=20=20avahi: remove USERADDPN

Tom Zanussi (4):
=20=20gmp_5.0.2: Set CC_FOR_BUILD to BUILD_CC
=20=20libzypp: fix mishandling of hyphenated arches
=20=20python: skip setup.py 'import check' when cross-compiling
=20=20python: bump PR

Xiaofeng Yan (5):
=20=20libarchive: update to 2.8.5
=20=20distro_tracking_fields.inc: update to libarchive to 2.8.5
=20=20qmmp: update to 0.5.2
=20=20distro_tracking_fields.inc: Modify the status of qmmp
=20=20local.conf.sample.extended: Fix bug 1674

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Anders Darander (1):
=20=20rsyslog: change postrm to prerm

Andreas M=C3=BCller (1):
=20=20task-xfce-extended: initial add task for full featured XFCE

Jason Kridner (2):
=20=20cloud9: updated to latest version
=20=20cloud9: fixed loading of o3.node

Koen Kooi (19):
=20=20udev: update to 175
=20=20systemd: bump SRCREV
=20=20ntp 4.2.6p3: add native systemd support
=20=20cronie 1.4.8: add native systemd support
=20=20nodejs 0.4.2: make npm and node-waf work
=20=20gateone: make it work
=20=20gateone: add avahi and systemd support
=20=20libsocketcan: add 0.0.8 + fixes
=20=20canutils: add 4.0.6
=20=20networkmanager: update to 0.9.2.0
=20=20gateone: add missing files
=20=20gateone: bump SRCREV to latest git
=20=20classes: remove duplicate classes
=20=20gateone: update SRCREV to drag in the http redirect option
=20=20network-manager-applet: update to 0.9.2.0
=20=20qcanobserver: import from OE Classic with updates and cleanups
=20=20qcanobserver-socketcan: import from OE Classic with updates
=20=20nodejs: update to 0.4.9
=20=20nodejs: add 0.6.1

Martin Jansa (2):
=20=20openssl: bump PR to fix license
=20=20kbd: move to oe-core

Otavio Salvador (3):
=20=20systemd.bbclass: stop using SYSTEMDPN to rdepends addition
=20=20connman: bump PR due systemd.bbclass fixes
=20=20atftp: add 0.7 version

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Bernhard Guillon (1):
=20=20angstrom-version.bb: fix LexToken(TOKEN, 'nobranch', 0, 0) error

Koen Kooi (2):
=20=20angstrom: prefer udev 175
=20=20timestap-service: /etc/timestamp support for systemd

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Bruce Ashfield (1):
=20=20linux-yocto: config cleanups + romely rt support

Christopher Larson (5):
=20=20codeparser: merge the nested python parsing classes
=20=20codeparser: simplify how we compare the called node names
=20=20codeparser: accept a name for better messages
=20=20codeparser: drop expand tracking
=20=20codeparser: silence non-literal warnings for vardeps

Darren Hart (1):
=20=20ncurses: refactor configure to avoid configuring widec when disabled

Dmitry Cherukhin (1):
=20=20qt-mobility: qa_configure stage failed

Dongxiao Xu (1):
=20=20multilib: Drop MULTILIB_IMAGE_INSTALL

Eric B=C3=A9nard (2):
=20=20dbus: fix install for virtclass-nativesdk
=20=20useradd.bbclass: handle nativesdk case

Joshua Lock (16):
=20=20cogl: add cogl 1.8.0 recipe
=20=20clutter-1.8: add 1.8.0
=20=20clutter-gst-1.8: add 1.4.2 for use with clutter 1.8
=20=20clutter-gtk-1.8: add clutter-gtk 0.11.4
=20=20mx: add mx toolkit 1.3.2
=20=20libcanberra: add libvorbis to DEPENDS
=20=20gypsy: fix packaging
=20=20connman: split scripts into separate package
=20=20pulseaudio: make X11 dependencies optional and add gtk+
=20=20contacts: fix packaging of icons
=20=20clutter-gst: fix patch filename
=20=20clutter-1.8: add bbappend for new clutter-1.8 recipe
=20=20clutter-1.8: this should be a bbappend
=20=20shared-mime-info: package runtime data separately
=20=20classes/[gnome|gnomebase|mime]: enhance gnome related classes
=20=20gconf: add upstream GNOME gconf 3.2.3 and drop gconf-dbus

Mark Hatle (6):
=20=20pseudo: Uprev pseudo to version 1.2
=20=20rootfs_rpm.bbclass: Enable pre and post install scripts
=20=20rootfs_rpm.bbclass: Turn off script debugging
=20=20wpa-supplicant: Avoid blocking the post install script at cross =
rootfs time.
=20=20shadow: Generate the shadow files at rootfs construction
=20=20sudo: Avoid post install scripts

Martin Jansa (6):
=20=20libxml2: use Copyright in LIC_FILES_CHKSUM instead of COPYING
=20=20kbd: import from meta-oe
=20=20kbd: add RREPLACES/RCONFLICTS/RPROVIDES for upgradeable path from =
console-to
=20=20task-core-boot, keymaps: add another VIRTUAL-RUNTIME to allow =
distributions=20
=20=20keymaps: depend on kbd instead of console-tools
=20=20task-core-x11: use VIRTUAL-RUNTIME variables for xserver_common and =
graphica

Matthew McClintock (2):
=20=20Add new IMAGE_CLASSES variable for classes for image generation
=20=20Introduce new SERIAL_CONSOLES to add multiple consoles for your =
MACHINE

Otavio Salvador (7):
=20=20libcap: fix sstate for native package
=20=20files/device_table-minimal.txt: add /dev/kmsg
=20=20dhcp: drop unused dhcp3.inc file
=20=20dhcp: rename dhcp4.inc to dhcp.inc
=20=20dhcp: move server configuration to dhcp-server-config
=20=20util-linux: split mcookie into a package
=20=20xinit: rdepends on util-linux-mcookie to avoid brining whole =
util-linux

Paul Eggleton (4):
=20=20classes/package_rpm: disable uninstall scripts for upgrades
=20=20busybox: add grep to temporary links during uninstall
=20=20README.hardware: update atom-pc instructions
=20=20README.hardware: declare support for BeagleBoard xM rev B

Paul Menzel (2):
=20=20libarchive: Remove obsolete comment and empty line at the end
=20=20xinit: Fix `startx` looking for `mcookie` in sysroot

Richard Purdie (17):
=20=20mime.bbclass: No need to import os.path, it then breaks the os module
=20=20gconf: Drop polkit dependency
=20=20useradd: Add missing DEPEND on shadow
=20=20utils.py: Fix lockfile retry handling
=20=20cooker.py: Ensure only one copy of bitbake executes at once
=20=20Add FAKEROOTNOENV variable
=20=20data_smart: Add appendVar/prependVar functions
=20=20scripts/qemuimage-testlib: Output a slightly better error if expect =
is missi
=20=20classes: Remove various bashisms
=20=20qemu: Ensure an internal qemugl script uses bash as it has bashisms
=20=20Allow use of dash as /bin/sh
=20=20Convert to use direct access to the data store (instead of =
bb.data.*Var*())
=20=20bitbake.conf: Unload pseudo when its not required for a given task
=20=20populate_*.bbclass: Drop pointless fakeroot attribute (fakeroot is at =
the ta
=20=20populate_*.bbclass: Correct INSTALL variable name after recent =
multilib chan
=20=20rootfs_ipk.bbclass: Ensure bad recommendations persist in the status =
file
=20=20opkg: Ensure we use the uname/gname fields when extracting tarballs

Robert P. J. Day (6):
=20=20Documentation/dev-manual/dev-manual-intro.xml: Edits to Intro section.
=20=20documentation/dev-manual/dev-manual-start.xml: Robert P. J. Edits
=20=20documentation/dev-manual/dev-manual-newbie.xml: Robert P. J. Edits
=20=20documentation/dev-manual/dev-manual-newbie.xml: Robert P. J. Edits
=20=20documentation/dev-manual/dev-manual-model.xml: Robert P. J. Day Edits
=20=20documentation/dev-manual/dev-manual-bsp-appendix.xml: Robert P. J. =
Day edits

Saul Wold (4):
=20=20Distro_tracking: Update Manual Check Date
=20=20udev-extraconf: blacklist /dev/md
=20=20libtasn1: update to 2.10
=20=20lame: update to 3.99.1

Scott Garman (5):
=20=20useradd.bbclass: fix how RDEPENDS is setup
=20=20useradd.bbclass: only modify packages in USERADD_PACKAGES
=20=20useradd.bbclass: do not modify -nativesdk packages
=20=20useradd-example.bb: update example documentation comments
=20=20avahi: remove USERADDPN

Scott Rifenbark (9):
=20=20documentation/dev-manual/dev-manual-bsp-appendix.xml: Added text to =
find t-b
=20=20documentation/dev-manual/dev-manual-bsp-appendix.xml: Robert P. J. =
Day edits
=20=20documentation/bsp-guide/bsp.xml: fix link - found by Robert P. J. Day
=20=20documentation/dev-manual/dev-manual-bsp-appendix.xml: Tom Zanussi =
edits.
=20=20documentation/dev-manual/dev-manual-bsp-appendix.xml: Added footnote
=20=20documentation/dev-manual/style.css: added .footnote element
=20=20documentation/dev-manual: Fixed PDF Note line breaks
=20=20documentation/dev-manual/style.css: Fixed HTML output
=20=20documentation/adt-manual/adt-prepare.xml: Fixed broken link

Tom Zanussi (5):
=20=20documentation/dev-manual/dev-manual-bsp-appendix.xml: BSP example =
scrub
=20=20gmp_5.0.2: Set CC_FOR_BUILD to BUILD_CC
=20=20libzypp: fix mishandling of hyphenated arches
=20=20python: skip setup.py 'import check' when cross-compiling
=20=20python: bump PR

Xiaofeng Yan (5):
=20=20libarchive: update to 2.8.5
=20=20distro_tracking_fields.inc: update to libarchive to 2.8.5
=20=20qmmp: update to 0.5.2
=20=20distro_tracking_fields.inc: Modify the status of qmmp
=20=20local.conf.sample.extended: Fix bug 1674

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-texasinstruments:

Jason Kridner (1):
=20=20cloud9-image: added ntp

Joel A Fernandes (4):
=20=20beaglebone-tester: Update to latest, add quiet option to bootargs
=20=20gadget-init: Add network-gadget services and other fixes
=20=20udhcpd: Fixes and new udev rule
=20=20linux-ti33x-psp: Check if scheduling is required after DMA

Koen Kooi (34):
=20=20u-boot 2011.10rc: turn on dcache for beaglebone
=20=20sdcard_image bbclass: switch to vfat layout
=20=20sdcard_image bbclass: reinstate vfat copy of uImage
=20=20u-boot 2011.10rc: uboot extX loading is 20 times slower than vfat =
loading :(
=20=20u-boot 2011.10rc: fatload does not set loadaddr, so be explicit
=20=20cloud9-image: add more stuff
=20=20cloud9-image: switch to ntpdate+cron instead of ntpd
=20=20cloud9-image: add hicolor-icon-theme
=20=20cloud9-image: add gateone
=20=20linux-omap4 2.6.35.x: update to glp1.4
=20=20linux-omap4: add experimental 3.0.0 version
=20=20cloud9-image: add tar, gdb and gdbserver
=20=20linux-ti33x-psp 3.1: add custom beaglebone bootlogo
=20=20gadget-init: also package activation symlinks
=20=20gadget-init: minor logic cleanups
=20=20linux-ti335x-psp 3.1: backport some PSP patches, add beaglebone =
bootlogo
=20=20linux-ti335x-psp 3.1: add CAN bus patches
=20=20beaglebone-getting-started: update to latest SRCREV
=20=20ti-hw-bringup-image: add timestamp service
=20=20bonescript: fixup git repo
=20=20cloud9-image: add nodejs-dev
=20=20beaglebone getting started: bump SRCREV
=20=20beaglebone-getting-started: add windows installer, update README, etc
=20=20linux 3.0: update to 3.0.9
=20=20beaglebone-getting-started: update to latest git
=20=20beaglebone-getting-started: add systemd unit
=20=20beaglebone-getting-started: active bone101 webserver on boot
=20=20beaglebone-getting-started: update to latest SRCREV
=20=20beaglebone-getting-started: disable bone101 autostart, it takes 100% =
cpu all
=20=20sdcard_image bbclass: run genex2fs directly on the loop device
=20=20u-boot: enhance deploy symlinking logic
=20=20x-load: sync deploy layout with u-boot SPL
=20=20bonescript, beaglebone-getting-started: move bone101 startup to =
proper recip

Peter A. Bigot (1):
=20=20sdcard_image: add dependency on native ext2 utilities

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

Klaus Kurzmann (1):
=20=20meta-fso: bump FSO_CORNUCOPIA_SRCREV

Martin Jansa (5):
=20=20meta-aurora: qt-components: bump SRCREV and pass qmake-exec param to =
find qm
=20=20meta-smartphone: meta-nokia: add mplayer2_git.bbappend for -vo omapfb
=20=20aurora-daemon: export XDG_DATA_DIRS to help valac find vapis
=20=20mplayer2: force tremor instead of libvorbis
=20=20meta-shr: drop TCLIBCAPPEND, add it to local.conf if you don't want =
to rebui

Sebastian Krzyszkowiak (1):
=20=20e-wm-theme-illume-gry: bump rev for keyboard fix

Simon Busch (7):
=20=20qt-components: remove it as the relevant parts are now part of aurora =
itself
=20=20meta-aurora: aurora-daemon: remove dependency for qt-components which =
is not
=20=20meta-aurora: aurora-daemon: update md5 checksum for COPYING license =
file
=20=20meta-aurora: aurora-base: bump SRCREV
=20=20meta-aurora: aurora-daemon: add libfsobasics and libfsoframework as =
dependen
=20=20meta-aurora: aurora-daemon: add qt4-plugin-imageformat-svg to RDEPENDS
=20=20meta-fso: libsamsung-ipc: add vapi to dev package and bump PR

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-micro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-slugos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nslu2:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Tom Zanussi (2):
=20=20meta-emenlow: fix mesa-dri multiple-providers warning
=20=20meta-intel: update kernel SRCREVs

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-handheld:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-opie:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:

Florian Boor (1):
=20=20libgee.inc: Increment PR in order to fix decrement from previous =
revert.=20=20=20=20

Koen Kooi (1):
=20=20Revert "omap3.inc: Remove hardcoded x-loader dependency breaking =
builds for=20

Marco Cavallini (3):
=20=20linux_2.6.28.bb: added download of a patch for at91sam9263-ek, =
ronetix-pm926
=20=20ronetix-pm9263/defconfig: added PWM and BACKLIGHT options
=20=20mh355/defconfig: added PWM and BACKLIGHT options

Philip Balister (2):
=20=20uhd-firmware : Update to 3.3.1.
=20=20uhd : Update to version 3.3.1.

Todd Kempel (1):
=20=20batctl: Add version 2011.3.0 (initial recipe)




