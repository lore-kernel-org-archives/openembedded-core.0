Received: from oh-69-34-21-229.sta.embarqhsd.net ([69.34.21.229]
	helo=happy.bec-systems.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1R5zhg-0005FM-Av; Tue, 20 Sep 2011 14:45:36 +0200
Received: from localhost.localdomain ([127.0.0.1] helo=happy.bec-systems.com)
	by happy.bec-systems.com with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1R5zcN-0001ch-Hl; Tue, 20 Sep 2011 08:40:07 -0400
Date: Tue, 20 Sep 2011 08:40:07 -0400
Message-Id: <E1R5zcN-0001ch-Hl@happy.bec-systems.com>
X-Mailer: Nodemailer (0.1.13; +http://www.nodemailer.org)
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org
MIME-Version: 1.0
Subject: OE Changelog for 2011-09-12 to 2011-09-19
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
X-List-Received-Date: Tue, 20 Sep 2011 12:45:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Changelog for 2011-09-12 to 2011-09-19.  Projects included in this report:

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

Christopher Larson (1):
=20=20taskdata: fix string formatting of an error message

Joshua Lock (5):
=20=20ui/crumbs/hobeventhandler: fix test for BBFILES
=20=20ui/crumbs/hobeventhandler: don't check BBPATH and BBFILES each build
=20=20hob: correctly handle an exception
=20=20hob: correctly set the selected image when loading a recipe
=20=20fetch2/wget: make checkstatus() quieter

Martin Jansa (2):
=20=20fetch2/git: fix logger.debug
=20=20fetch2/git: be more carefull in _contains_ref when checking git log =
output

Paul Eggleton (1):
=20=20fetch2/git: fix subpath destination directory

Richard Purdie (2):
=20=20git.py: Fix logging vs logger typo
=20=20cooker.py: Fix key expansion issues in showVersions

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Bernhard Guillon (1):
=20=20liboil-0.3.17: add upstream Fix-enable-vfp-flag patch

Bruce Ashfield (3):
=20=20linux-yocto: move common tasks to a common location
=20=20linux-yocto: split e100 and e1000 support
=20=20linux-yocto-rt: correct 3.0.3->3.0.4 mismerge for, stop_machine.c

Darren Hart (2):
=20=20Set an explicit path for the initrd scripts
=20=20Prevent IMAGE_FEATURES from contaminating initrd

Dexuan Cui (3):
=20=20dpkg: fix pkg_postinst_dpkg, don't supply {bindir}/update-alternatives
=20=20package_deb.bbclass, populate_sdk_deb.bbclass: fix =
meta-toolchain-gmae build
=20=20distro-tracking: Update package alias

Dmitry Eremin-Solenikov (3):
=20=20icecc-create-env: a tool to create icecc toolchain tarballs
=20=20icecc.bbclass: replace with updated version
=20=20bugzilla.bbclass: add a class to report build problems to bugzilla

Dongxiao Xu (3):
=20=20base.bbclass: do not expand PREFERRED_PROVIDER for kernel recipe
=20=20multilib: Remove recipe from multilib.conf that inherits allarch
=20=20distro_tracking: update package alias

Eric B=C3=A9nard (1):
=20=20qt4: add blacklist-diginotar-certs patch

Joshua Lock (2):
=20=20sanity: disable mirrors for connectivity check
=20=20texinfo: several changes to build without zlib and ncurses headers on =
host

Khem Raj (1):
=20=20eglibc-2.13: Replace oewarn with bbwarn

Lianhao Lu (3):
=20=20debian/_ipk.bbclass: Added multilib support for package_name_hook()
=20=20Misc: Added MLPREFIX to final pkg names in case of DEBIAN_NAMES.
=20=20image/package.bbclass: Revise multilib support for DEBIAN_NAME.

Mark Hatle (1):
=20=20Uprev to latest version of prelink_git, fixing TLS issues

Martin Jansa (5):
=20=20openssh: update init script to create ECDSA keys if needed
=20=20task-core-boot: allow distributions to define login and init manager
=20=20subversion: remove neon-detection.patch and --with-neon option
=20=20abiword: be carefull with # comments ending with backslash
=20=20claws-mail: be carefull with # comments ending with backslash

Paul Eggleton (6):
=20=20task-core: split into task-core-console and task-core-x11
=20=20lib/oe/terminal.py: declare konsole from KDE 4.x as unsupported
=20=20sanity.bbclass: add a sanity check for KDE 4.x konsole in TERMCMD
=20=20libgcrypt: add libcap to DEPENDS
=20=20libgnome-keyring: add libgcrypt to DEPENDS
=20=20freetype: disable bzip2 compressed font support

Richard Purdie (4):
=20=20Revert "pango: use qemu to generate pango.modules during rootfs =
construction
=20=20core-image-minimal: Add missing POKY_EXTRA_IMAGE variable
=20=20cml1/kernel: Update do_menuconfig to use oe.terminal()
=20=20qemu: Fix reversed BGR values on ARM Versatile emulation

Saul Wold (4):
=20=20libzypp: move package-manger to it own package
=20=20task-core-sdk: change task-core -> task-core-console
=20=20web: Fix SRCREV due to lost commit in web-sato
=20=20base.bbclass: add crosssdk items to INCOMPATIBLE_LICENSE exclude list

Tom Zanussi (8):
=20=20initramfs-live-install: add support for grub2
=20=20grub2: new recipe
=20=20liberation-fonts_1.04: add PN to RDEPENDS
=20=20liberation-fonts_1.06: add PN to RDEPENDS
=20=20ttf-bitstream-vera_1.10: add PN to RDEPENDS
=20=20grub_1.99: add PN to RDEPENDS
=20=20initramfs-live-install: add PN to RDEPENDS
=20=20package.bbclass: fix spurious 'installed but not shipped' warning

Yu Ke (1):
=20=20distro_tracking_field: add distro checking field

Zhai Edwin (2):
=20=20opensp: Fix hard path in native nsgmls.
=20=20distro-tracking: Update alias

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Denis (1):
=20=20qwt: import from openembedded.dev

Eric BENARD (1):
=20=20binutils-2.20.1: fix checksums as 2.20.1 is now 2.20.1a

Imran Mehmood (1):
=20=20cramfs: Adds cvs version recipe (initial recipe)

Khem Raj (4):
=20=20openssl: Upgrade 1.0.0d -> 1.0.0e
=20=20imagemagick: Fix configure on x86_64
=20=20systemd: Refresh format-replace-m-uclibc patch
=20=20gcc-4.5: Upgrade to latest FSF 4.5 branch and bring in latest linaro =
patches

Koen Kooi (10):
=20=20vlc: fix gettext usage
=20=20vlc: update to 1.1.11 and fix xml2 build
=20=20Revert "openssl: fixup the openssl-fix-link patch"
=20=20usb-modeswitch-data: add 20110805
=20=20usb-modeswitch: add 1.1.9
=20=20libnl1: import from OE .dev
=20=20networkmanager: add 0.9.0
=20=20network-manager-applet: add 0.9.0
=20=20rfkill 0.4: import from OE .dev
=20=20modemmanager: add 0.5

Martin Jansa (13):
=20=20udev-173: use tar.gz instead of git checkout
=20=20tslib: import from meta-aurora
=20=20recipes: be carefull with # comments ending with backslash
=20=20connman: drop initscript file used by SHR
=20=20vlc: drop depends not yet in meta-oe
=20=20xserver-xorg-conf: drop from meta-oe, update xorg-xserver-common.inc =
to RDEP
=20=20pointercal-xinput: move machine specific files to their bsp layers, =
remove S
=20=20xserver-xorg: drop 1.9.4 and git version
=20=20xcb: drop from meta-oe, now it's in oe-core
=20=20xorg-app: use xorg-app-common.inc from oe-core
=20=20xorg-driver: use .inc files from oe-core
=20=20task-x11: define better default XSERVER/XSERVER_COMMON values and =
make whole
=20=20libdrm-2.4.25: drop from meta-oe, now there is 2.4.26 in oe-core

Otavio Salvador (2):
=20=20xf86-input-void: add 1.4.0 recipe
=20=20xorg-xserver-common.inc: usr ${datadir} instead of /usr/share

Pau Espin Pedrol (2):
=20=20enjoy: Add var LIC_FILES_CHKSUM to recipe
=20=20enjoy: Add inherit gettext

lumag (3):
=20=20openssl: fixup the openssl-fix-link patch
=20=20gcc-4.5: include libgcov.a into libgcc-dev package
=20=20gconf: fix the "unshipped files" warnings

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Koen Kooi (4):
=20=20use wildcard for openssl version
=20=20drop busybox pinning, it's managed sanely in oe-core nowadays
=20=20angstrom-version: include some bits of layer info into =
/etc/angstrom-build-i
=20=20angstrom: remove networkmanager pinning

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Bernhard Guillon (1):
=20=20liboil-0.3.17: add upstream Fix-enable-vfp-flag patch

Bruce Ashfield (3):
=20=20linux-yocto: move common tasks to a common location
=20=20linux-yocto: split e100 and e1000 support
=20=20linux-yocto-rt: correct 3.0.3->3.0.4 mismerge for, stop_machine.c

Darren Hart (2):
=20=20Set an explicit path for the initrd scripts
=20=20Prevent IMAGE_FEATURES from contaminating initrd

Dexuan Cui (3):
=20=20dpkg: fix pkg_postinst_dpkg, don't supply {bindir}/update-alternatives
=20=20package_deb.bbclass, populate_sdk_deb.bbclass: fix =
meta-toolchain-gmae build
=20=20distro-tracking: Update package alias

Dmitry Eremin-Solenikov (3):
=20=20icecc-create-env: a tool to create icecc toolchain tarballs
=20=20icecc.bbclass: replace with updated version
=20=20bugzilla.bbclass: add a class to report build problems to bugzilla

Dongxiao Xu (3):
=20=20base.bbclass: do not expand PREFERRED_PROVIDER for kernel recipe
=20=20multilib: Remove recipe from multilib.conf that inherits allarch
=20=20distro_tracking: update package alias

Eric B=C3=A9nard (1):
=20=20qt4: add blacklist-diginotar-certs patch

Joshua Lock (6):
=20=20ui/crumbs/hobeventhandler: fix test for BBFILES
=20=20ui/crumbs/hobeventhandler: don't check BBPATH and BBFILES each build
=20=20hob: correctly handle an exception
=20=20hob: correctly set the selected image when loading a recipe
=20=20sanity: disable mirrors for connectivity check
=20=20texinfo: several changes to build without zlib and ncurses headers on =
host

Khem Raj (1):
=20=20eglibc-2.13: Replace oewarn with bbwarn

Lianhao Lu (3):
=20=20debian/_ipk.bbclass: Added multilib support for package_name_hook()
=20=20Misc: Added MLPREFIX to final pkg names in case of DEBIAN_NAMES.
=20=20image/package.bbclass: Revise multilib support for DEBIAN_NAME.

Mark Hatle (1):
=20=20Uprev to latest version of prelink_git, fixing TLS issues

Martin Jansa (5):
=20=20openssh: update init script to create ECDSA keys if needed
=20=20task-core-boot: allow distributions to define login and init manager
=20=20subversion: remove neon-detection.patch and --with-neon option
=20=20abiword: be carefull with # comments ending with backslash
=20=20claws-mail: be carefull with # comments ending with backslash

Paul Eggleton (6):
=20=20task-core: split into task-core-console and task-core-x11
=20=20local.conf.sample: remove emenlow from example machines
=20=20qt4-x11-free: remove emenlow reference from meta-yocto bbappend
=20=20linux-yocto: remove emenlow from meta-yocto bbappend (2.6.37 version)
=20=20lib/oe/terminal.py: declare konsole from KDE 4.x as unsupported
=20=20sanity.bbclass: add a sanity check for KDE 4.x konsole in TERMCMD

Richard Purdie (6):
=20=20Revert "pango: use qemu to generate pango.modules during rootfs =
construction
=20=20core-image-minimal: Add missing POKY_EXTRA_IMAGE variable
=20=20cml1/kernel: Update do_menuconfig to use oe.terminal()
=20=20qemu: Fix reversed BGR values on ARM Versatile emulation
=20=20git.py: Fix logging vs logger typo
=20=20cooker.py: Fix key expansion issues in showVersions

Saul Wold (4):
=20=20libzypp: move package-manger to it own package
=20=20task-core-sdk: change task-core -> task-core-console
=20=20web: Fix SRCREV due to lost commit in web-sato
=20=20base.bbclass: add crosssdk items to INCOMPATIBLE_LICENSE exclude list

Scott Rifenbark (6):
=20=20documentation/adt-manual: Rewrite for Indigo version of Eclipse.
=20=20documentation/adt-manual/adt-eclipse.xml: Fixed ifconfig command.
=20=20documentation/adt-manual/adt-prepare.xml: Added note about sato
=20=20documentation/dev-manual/dev-manual-newbie.xml: Updates from Robert =
Berger
=20=20documentation/dev-manual/dev-manual-start.xml: Suggestions by Robert =
Berger
=20=20documentation/dev-manual/dev-manual-newbie.xml: Suggestions Robert =
Berger

Tom Zanussi (8):
=20=20initramfs-live-install: add support for grub2
=20=20grub2: new recipe
=20=20liberation-fonts_1.04: add PN to RDEPENDS
=20=20liberation-fonts_1.06: add PN to RDEPENDS
=20=20ttf-bitstream-vera_1.10: add PN to RDEPENDS
=20=20grub_1.99: add PN to RDEPENDS
=20=20initramfs-live-install: add PN to RDEPENDS
=20=20package.bbclass: fix spurious 'installed but not shipped' warning

Yu Ke (1):
=20=20distro_tracking_field: add distro checking field

Zhai Edwin (2):
=20=20opensp: Fix hard path in native nsgmls.
=20=20distro-tracking: Update alias

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-texasinstruments:

Jason Kridner (4):
=20=20linux-3.0: added bbtoys ulcd support
=20=20linux-3.0: fix BeagleBoard-xM eth mac using die id
=20=20linux-3.0: patch.sh: manually update git remotes
=20=20linux-3.0: patch.sh: adjusted tags and error handling

Koen Kooi (3):
=20=20linux-3.0: add patch helper script
=20=20gstreamer-ti: use MEMARGS variable instead of hardcoding omap3 config
=20=20xserver-xf86-config: add config for OMAP3 SOC_FAMILY

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

Denis Carikli (1):
=20=20meta-palm: fix tslib machine specific paths

GNUtoo (1):
=20=20meta-openmoko: fix om-gta02 sound modules autoload

Martin Jansa (12):
=20=20e-wm-theme-illume-gry: bump SRCREV
=20=20task-shr-feed: add elfe
=20=20SHR: prefer openssl-1.0.0e
=20=20SHR: base-files: use own profile and motd
=20=20meta-nokia: autoload pn-pep kernel module
=20=20opimd-utils: drop all PACKAGE_ARCH
=20=20meta-openmoko,meta-nokia: cleanup module_autoload
=20=20meta-htc,meta-nokia,meta-openmoko,meta-palm: include xorg.conf from =
meta-oe/
=20=20meta-nokia,meta-openmoko: include pointercal-xinput from meta-oe
=20=20meta-openmoko: libdrm: add glamo support
=20=20nokia900: remove debug leftover
=20=20meta-samsung: fix README

Simon Busch (1):
=20=20meta-aurora: drop git version of tslib; it's now in meta-openembedded

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-micro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-slugos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nslu2:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Tom Zanussi (5):
=20=20meta-intel: update SRCREVs
=20=20meta-intel/common: remove grub-1.98
=20=20meta-intel/MAINTAINERS: remove grub
=20=20meta-intel: update BSPs to use grub2
=20=20meta-intel/common: remove initramfs-live-install .bbappend

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-handheld:

Andrea Adami (2):
=20=20linux-2.6.39.inc: do not reassign SRC_URI
=20=20linux-kexecboot.inc: hardcode loglevel=3D3 to keep bootlogo intact

Dmitry Eremin-Solenikov (12):
=20=20linux.inc: drop a part of the file for the devices we don't care about
=20=20linux.inc: drop a hack for kernels <=3D 2.6.29
=20=20linux.inc: drop at91sam9263ek cmdline setting
=20=20linux.inc: drop RPSRC - it's unused now
=20=20linux.inc: drop devicetree settings
=20=20linux.inc: devicetree is used on hh boxes, drop dt handling
=20=20linux.inc: drop savedefconfig, it is provided by kernel.bbclass
=20=20linux.inc: drop old udev check
=20=20linux.inc: drop OABI-only support
=20=20linux.inc: drop cortex-a8 fixup, none of meta-hh machines uses A8
=20=20linux.inc: drop bigendian support
=20=20linux.inc: clean up handling of config variables

Martin Jansa (3):
=20=20linux-kexecboot: move defconfig to linux-kexecboot-2.6.39
=20=20linux(-kexecboot): add recipes for git version 3.1.0-rc6
=20=20linux_git: set CMDLINE_DEBUG to debug for git version

Paul Eggleton (4):
=20=20klibc.bbclass: remove
=20=20keymaps: add keymaps from OE classic
=20=20formfactor: add formfactor files previously removed from OE-core
=20=20Add missing device_table-ezx.txt for Motorola EZX devices

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-opie:

Dmitry Eremin-Solenikov (15):
=20=20opie-taskbar: fix linking issues for 1.2.5 version
=20=20opie-taskbar: launcher also uses opiepim2 library, add it to LIBS
=20=20opie-today-addressbookplugin: add dependencies on opie-today and =
libqtaux2
=20=20opie-libqrsync: package static library
=20=20libopieobex0: drop setting of FILES for -dbg package
=20=20task-opie: provide defaults for screen resolution
=20=20opie: drop MOC and UIC overrides on command line
=20=20uicmoc-native: install tools with suffix 2
=20=20qmake.bbclass: adapt for {moc,uic} -> {moc,uic}2 change
=20=20qte-common: adapt for {moc,uic} -> {moc,uic}2 change
=20=20qmake: do not try to regenerate moc
=20=20opie: fix GPLv2 plus license
=20=20opie: mass-correct licenses for LGPL packages
=20=20opie: mass GPL->GPLv2 fixup
=20=20opie-icon-reload: for completeness add git version

Paul Eggleton (22):
=20=20opie-restartapplet2: remove duplicate recipes
=20=20opie-bluepin: remove git recipe
=20=20task-opie: remove opie-bluepin from task-opie-bluetooth
=20=20opie-bluetoothd: add opiebluetoothd recipe
=20=20opie-bluetoothapplet: add RDEPENDS on opiebluetoothd for git version
=20=20opie-bluetoothmanager: add RDEPENDS on opiebluetoothd for git version
=20=20opie-taskbar: fix server.pro patch for current git
=20=20libopieobex0: fix disable-bit-check patch for current git
=20=20libqtaux2: use INC_PR for 1.2.5 version
=20=20libopie2: introduce INC_PR
=20=20Correct TrollTech GPL/QPL LICENSE field syntax
=20=20qpf-qte: remove 3.3.5 version
=20=20task-qpe: add task-qpe from OE classic
=20=20task-qpe: fix for recipe removals/replacements in meta-opie
=20=20opie-wellenreiter: fix LIC_FILES_CHKSUM
=20=20manufacturers: fix S for git fetcher subpath patch
=20=20opie-libqrsync: correct LICENSE / LIC_FILES_CHKSUM
=20=20opie-keypebble: fix LIC_FILES_CHKSUM
=20=20opie-remote: fix LIC_FILES_CHKSUM
=20=20opie-zsafe: fix LIC_FILES_CHKSUM
=20=20opie-taskbar-images: add dummy PACKAGES to fix task-opie
=20=20task-opie: reverse default display width/height

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:

Koen Kooi (1):
=20=20gtk-icon-cache bbclass: python +=3D doesn't add a leading space like =
bitbake d

Steffen Sledz (4):
=20=20eglibc-2.9: allow building with GNU make >=3D 3.82
=20=20rsyslog: switch to new upstream version 5.8.4
=20=20linux-libc-headers 2.6.24: backport arm/asm/hwcap.h from linux 2.6.26
=20=20linux-2.6.28: allow building with GNU make >=3D 3.82




