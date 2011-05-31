Received: from oh-69-34-21-229.sta.embarqhsd.net ([69.34.21.229]
	helo=happy.bec-systems.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1QRNfN-0005Xh-9Q; Tue, 31 May 2011 14:03:21 +0200
Received: from localhost ([127.0.0.1] helo=happy.bec-systems.com)
	by happy.bec-systems.com with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1QRNcD-0000dn-ME; Tue, 31 May 2011 08:00:05 -0400
Date: Tue, 31 May 2011 08:00:05 -0400
Message-Id: <E1QRNcD-0000dn-ME@happy.bec-systems.com>
X-Mailer: Nodemailer (0.1.13; +http://www.nodemailer.org)
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org
MIME-Version: 1.0
Subject: OE Changelog for 2011-05-23 to 2011-05-30
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
X-List-Received-Date: Tue, 31 May 2011 12:03:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Changelog for 2011-05-23 to 2011-05-30.  Projects included in this report:

openembedded-core: git://git.openembedded.org/openembedded-core
meta-openembedded: git://git.openembedded.org/meta-openembedded
meta-angstrom: git://git.angstrom-distribution.org/meta-angstrom
meta-texasinstruments: =
git://git.angstrom-distribution.org/meta-texasinstruments
meta-smartphone: http://git.shr-project.org/repo/meta-smartphone.git
meta-micro: git://git.openembedded.org/meta-micro
meta-slugos: git://github.com/kraj/meta-slugos
meta-nslu2: git://github.com/kraj/meta-nslu2
meta-intel: git://git.yoctoproject.org/meta-intel
openembedded: git://git.openembedded.org/openembedded

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Beth Flanagan (4):
=20=20common-licenses: Adding new licenses and renaming
=20=20License Field Cleanup: Non-standard field names
=20=20license.bbclass: Sane Parsing of licenses
=20=20license.bbclass: Infinite recursion of or nodes

Cliff Brake (1):
=20=20test commit

Darren Hart (4):
=20=20create-pull-request: generalize the repository URL parsing
=20=20u-boot: remove UBOOT_MACHINE and COMPATIBLE_MACHINES
=20=20u-boot: rename u-boot_git.bb to u-boot_${PV}.bb
=20=20utils.bbclass: make FILESEXTRAPATHS colon delimited

Kang Kai (1):
=20=20ghostscript: fix run failure on mpc8315e

Khem Raj (11):
=20=20opkg_svn.bb: Install rcS.d into $D instead of $IMAGE_ROOTFS
=20=20distcc_2.18.3.bb: Fix compilation on uclibc
=20=20uclibc: Upgrade to 0.9.32-rc3
=20=20elfutils_0.148.bb: Fix compilation on uclibc
=20=20eglibc.inc: Transfer PARALLEL_MAKE to PARALLELMFLAGS
=20=20uclibc_git.bb: Fix compilation on arm when using thumb instruction set
=20=20uclibc.inc: Set COMPILE_IN_THUMB_MODE in .config if =
ARM_INSTRUCTION_SET !=3D a
=20=20shared-mime-info_0.90.bb: Fix more parallel build issues
=20=20uclibc_git.bb: Fix patch path in SRC_URI
=20=20uclibc: Add disabled COMPILE_IN_THUMB_MODE to uClibc.machine for all =
ARM con
=20=20package.bbclass,prserv.bbclass: Compare USE_PR_SERV with "1" or "0"

Koen Kooi (11):
=20=20qemu machines: drop MACHINE_ESSENTIAL_EXTRA_RDEPENDS =3D "qemu-config"
=20=20pulseaudio: package udev rules
=20=20dbus: split X11 dependant dbus-launch into its own subpackage
=20=20qemu-config: add runtime dep on dbus-x11
=20=20x11-common 0.1: add runtime dep on dbus-x11
=20=20dbus 1.4.1: enable systemd support, but package systemd files =
seperately
=20=20dbus: clean up dbus-x11 packaging
=20=20x11-common: fix dbus-launch RDEPENDS
=20=20avahi: enable systemd support, but package systemd files seperately
=20=20dbus 1.4.1: create UUIDDIR in postinst
=20=20bitbake.conf: make OVERRIDES match what people expect

Lianhao Lu (3):
=20=20conf/bitbake.conf: Added variables for PR service.
=20=20classes/package(prserv).bbclass: Get PRAUTO and use PKGV/PKGR.
=20=20classes/package_xxx.class: Use PKGE/PKGV/PKGR.

Martin Jansa (4):
=20=20python-2.6.6: py_package_preprocess should change Makefile only in =
PKGD not=20
=20=20console-tools: use u-a also for fgconsole otherwise it collides with =
busybox
=20=20rm_work: keep all sigdata files in stamps dir
=20=20libcap: add native BBCLASSEXTEND to fix gnutls-native after =
ffc32d6436bcd11b

Nitin A Kamble (9):
=20=20tcmode-default: switch to eglibc 2.13 from 2.12
=20=20tcmode-default: switch to gcc 4.6.0 for ppc & mips also
=20=20gplv2 recipes update upstream status of patches
=20=20git: upgrade from 1.7.4.3 to 1.7.5.1
=20=20libpcre: upgrade from 8.10 to 8.12
=20=20byacc: upgrade from 20101127 to 20101229
=20=20python-pygpbject: upgrade from 2.27 to 2.27.91
=20=20distro-tracking: update toolchain recipe fields
=20=20tcmode-default: workaround for gcc 4.6.0 failure on beagleboard

Otavio Salvador (2):
=20=20send-pull-request: drop sendemail checks
=20=20syslinux: rdepends on mtools

Phil Blundell (1):
=20=20rootfs_ipk: issue a diagnostic if rootfs is declared read-only and =
not all m

Qing He (1):
=20=20rpm: fix fprint pointer issue

Richard Purdie (4):
=20=20binutils: Add missing dependency on zlib-native
=20=20dbus: Fix commit typo, I mixed the patch versions up
=20=20gcc-cross-csl-2008q1: Drop last remaining fail-fast override use and =
make it

Saul Wold (10):
=20=20puzzles: update to r9173
=20=20gail: update gail to 1.20.2
=20=20update-alternatives-dpkg: Update to dpkg base 1.15.8.7
=20=20gst-plugins-base: Add tremor to DEPENDS
=20=20IMAGE_ROOTFS_SIZE Cleanup
=20=20image_types: add IMAGE_ROOTFS_EXTRA_SPACE
=20=20bitbake.conf: change IMAGE_ROOTFS_EXTRA_SPACE to soft (?=3D) default
=20=20gnutls: Add libcap to DEPENDS
=20=20Revert "createrepo: Update to 0.9.9"
=20=20gupnp-tools: Add gupnp-av to DEPENDS

Yu Ke (2):
=20=20xorg.conf: update keyboard config with evdev
=20=20site/powerpc-common: remove the incorrect dlopen default setting

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Khem Raj (2):
=20=20gcc-4.6.inc: Always build runtime in ARM mode.
=20=20gcc-4.6: Update with patches from gcc-4_6-branch and linaro 2011.05 =
release

Koen Kooi (29):
=20=20gpe-scap: import from OE rev aae5b51e4a8dd57b28a6f91e6c14a5311aadbdae
=20=20task-boot: bump PR for MACHINE_ESSENTIAL_EXTRA_RDEPENDS  change in =
OE-core
=20=20mesa: makedepend-native is needed by every mesa, not just the DRI one
=20=20bluez4: update to 4.93
=20=20bluez4 4.93: add missing udev dep
=20=20mesa-common.inc: fix make-depend typo
=20=20xserver-xorg: add missing mesa-dri dependency
=20=20yavta: add git version of v4l2 test tool
=20=20media-ctl: add git version for MCF controller app
=20=20machine includes: remove from layer
=20=20libcap2: import for OE rev 01d461a53cec16ddec29b996896839a17c51a74
=20=20libcgroups: import from OE rev =
01d461a53cec16ddec29b996896839a17c51a74a
=20=20kbd: add 1.15.2
=20=20dbus: drop from meta-oe
=20=20systemd: import from OE rev 84696f215bbf81cb3def7e03e45dd66b0a85b1bb
=20=20udev 168: enable systemd support, but package systemd files seperately
=20=20systemd: drag in new {udev,dbus}-systemd packages
=20=20systemd: update to v28
=20=20uclibc: moved into OE-core, delete from meta-oe
=20=20systemd: add hack to fix parsing for machines without SERIAL_CONSOLE =
set
=20=20connman: fix systemd packaging
=20=20systemd: fix "double getty" problem on serial console with recent =
kernels
=20=20systemd: use PKGV and create 'lock' group in postinst
=20=20systemd: add u-a entries for reboot, halt and friends
=20=20systemd: expand RRECOMMENDS with kernel modules recommended by INSTALL
=20=20udev 171: add recipe with DP =3D -1
=20=20udev-extra-rules: recipe with extra rules previously provided by udev
=20=20udev 171: cleanup duplicated rules some more
=20=20udev: drop 168 and associated files

Martin Jansa (34):
=20=20xserver-xorg: upgrade to 1.10.1.901 and return randr-support patch
=20=20xf86-video-glamo: fix build with gcc-4.6
=20=20connman: add gnutls to depends and move iptables dependency also to =
inc fil
=20=20gconf: depend on polkit not policykit
=20=20policykit: drop recipes, oe-core has newer versions named right polkit
=20=20farsight2: fix LICENSE and add LIC_FILES_CHKSUM
=20=20libnice: improve LICENSE and add LIC_FILES_CHKSUM
=20=20tangogps: add LIC_FILES_CHKSUM and drop distro override
=20=20pidgin: add LIC_FILES_CHKSUM
=20=20evtest: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
=20=20gpsd: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
=20=20foxtrotgps: import from OE rev =
d4f0211e2078d5033ae0dee74664de5520d8392d
=20=20tiff: add bbappned with native BBCLASSEXTEND
=20=20gd: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
=20=20librsvg: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
=20=20imagemagick: import from OE rev =
d4f0211e2078d5033ae0dee74664de5520d8392d
=20=20portaudio: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
=20=20alsa-oss: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
=20=20flite-alsa: import from OE rev =
d4f0211e2078d5033ae0dee74664de5520d8392d
=20=20espeak: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
=20=20navit: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
=20=20devmem2: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
=20=20dbus-daemon-proxy: add LIC_FILES_CHKSUM and disable as-needed
=20=20s3c24xx-gpio,s3c64xx-gpio: add LIC_FILES_CHKSUM
=20=20socat: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
=20=20mbuffer: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
=20=20nmon: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
=20=20ltrace: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
=20=20pxaregs: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
=20=20serial-utils: import from OE rev =
d4f0211e2078d5033ae0dee74664de5520d8392d
=20=20tcp-wrappers: import from OE rev =
d4f0211e2078d5033ae0dee74664de5520d8392d
=20=20nfs-utils: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
=20=20i2c-tools: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
=20=20tcpdump: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d

Otavio Salvador (4):
=20=20udev: fix init script indenting
=20=20udev: fix action used during startup
=20=20udev: remove udev.inc since it was not being in use
=20=20udev: move ConsoleKit files to udev-consolekit

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Koen Kooi (9):
=20=20upload-packages: don't fail is there are no morgue/ directories
=20=20drop dbus pinning
=20=20base-files 3.0.14: override fstab
=20=20systemd-image: image to test systemd integration into angstrom
=20=20base-files 3.0.14: stage one of volatiles overhaul
=20=20base-files: also remove /var/tmp from volatiles
=20=20angstrom: bump mesa version
=20=20angstrom: fix QT version
=20=20base-files: add sysvinit compat

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-texasinstruments:

Khem Raj (1):
=20=20conf/layer.conf: Document the operation on BBPATH correctly in the =
comment

Koen Kooi (11):
=20=20linux-omap 2.6.39: refresh patchset
=20=20linux-omap 2.6.39: add base PM set back in
=20=20x-load: bump SRCREV for OMAP4 fixes
=20=20linux-omap 2.6.39: add cpuidle patchset
=20=20linux-omap 2.6.39: add sensor driver for aptina 5MP and 1GHz hack for =
beagle
=20=20machine includes: move from meta-oe
=20=20linux-omap 2.6.39: update to latest beagle patchset
=20=20beagleboard: move console from ttyS2 to ttyO2
=20=20omap3-sgx-modules: add 1.6.16.3977 version
=20=20libgles-omap3: add 4.03.00.02
=20=20linux-omap 2.6.39: switch to 'userspace' governor on beagle

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

Denis 'GNUtoo' Carikli (1):
=20=20shr-image.inc: migrate nokia900 to devtmpfs

Martin Jansa (14):
=20=20libphone-utils: bump SRCREV to fix build with gcc-4.6
=20=20qi: fix build with gcc-4.6
=20=20libphone-ui-shr: fix build with gcc-4.6
=20=20libphone-ui-shr: bump SRCREV to fix build with gcc-4.6
=20=20linux-openmoko: search for mtdutils in sbinding
=20=20freesmartphone: bump SRCREVs
=20=20fso-specs: older SRCREV because HEAD causes libfreesmartphone-glib to =
fail
=20=20linux-openmoko: sync with oe.dev and add 2.6.39, remove old
=20=20linux-nokia: merge changes from oe.dev
=20=20linux-openmoko: fix om-gta01 SRC_URI and defconfig
=20=20task-shr: drop few apps in order to make this parseble
=20=20navit: add bbappend with our stuff
=20=20meta-fso: add LIC_FILES_CHKSUM for tools
=20=20shr: drop qt and strace bindings

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-micro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-slugos:

Khem Raj (1):
=20=20slugos.conf: Switch to using gcc 4.6

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nslu2:

Khem Raj (5):
=20=20kexec-tools-2.0.2: Fix compilation with gcc 4.6
=20=20linux-ixp4xx_2.6.37.bb: Make it compile with gcc 4.6
=20=20linux-ixp4xx: Fix missing 4.6 warnings resulting in errors
=20=20nslu2-image.bbclass: Use STAGING_FIRMWARE_DIR to locale firmware
=20=20ixp4xx-npe: Package firmware into /lib/firmware on target rfs

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Darren Hart (1):
=20=20linux-yocto*: correct FILESEXTRAPATHS assignment in all layers

Tom Zanussi (3):
=20=20meta-intel: fix BBFILE_COLLECTIONS overrides
=20=20meta-sugarbay: Change build instructions in README to use BSP tarball
=20=20meta-intel: Change build instructions in README to use BSP tarball

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:

Anand Balagopalakrishnan (2):
=20=20libgles-omap3: Add wsegl.h to the destination include directory
=20=20qt4: Fix the include path for SGX PowerVR drivers

Andrea Adami (6):
=20=20linux: add remaining 2.6.39 defconfigs for Zaurus devices
=20=20linux-kexecboot: add remaining 2.6.39 defconfigs for Zaurus devices.
=20=20linux-kexecboot: sync Zaurus _git defconfigs with 2.6.39 ones.
=20=20linux: : sync Zaurus _git defconfigs with 2.6.39 ones.
=20=20linux-kexecboot: set DEFAULT_PREFERENCE =3D "1" for 2.6.39 on Zaurus.
=20=20linux: set DEFAULT_PREFERENCE =3D "1" for 2.6.39 on Zaurus.

Andreas Oberritter (3):
=20=20kernel.bbclass: pass KERNEL_VERSION through legitimize_package_name
=20=20lib/oe/unpack.py: unpack rar archives
=20=20kernel.bbclass: pass AR, NM and OBJCOPY to make

Benjamin Deering (1):
=20=20xserver-xorg-1.10.1.901: fix screen rotation

Bernhard Guillon (1):
=20=20opkg-utils: port arfile.py patch to opkg-utils, bump PR

Denis 'GNUtoo' Carikli (1):
=20=20nokia900: move more kernel drivers that were built in the =
kernel(=3Dy) to modu

Denis Carikli (1):
=20=20bug20.conf: override the omap3 kernel PR and bump PR

Henning Heinold (3):
=20=20opie-image: revert part of my bogus commit =
2a1c9e1ee5eb8067592d26100b563dd2a
=20=20opencv-dsp-acceleration: revert part of my bogus commit =
2a1c9e1ee5eb8067592d
=20=20firefox: DEPENDENCY on libintl is only needed for uclibc

Holger Hans Peter Freyther (1):
=20=20dvnixload: The directory structure was changed upstream, update.

Koen Kooi (15):
=20=20x-load git: bump SRCREV
=20=20mango-lassi: add missing xtst to DEPENDS
=20=20avahi-ui: update to 0.6.30, improve packaging a bit
=20=20avahi-ui 0.6.30: improve packaging some more
=20=20gnome-bluetooth 2.32.0: package gconf files
=20=20linux-omap 2.6.39: sync with meta-texasinstruments
=20=20angstrom 2010.x: use 2.6.39 for beagleboard
=20=20yavta: import from meta-oe
=20=20media-ctl: import from meta-oe
=20=20udev git: check if systemd files are present before symlinking
=20=20udev git: bump SRCREV for systemd fixes
=20=20systemd: bump to a rev where hwclock isn't needed anymore
=20=20qt4: bump PR for wsegl header change
=20=20angstrom: prefer the git version of tslib
=20=20linux-omap 2.6.39: sync with meta-texasinstruments

Martin Jansa (11):
=20=20freesmartphone: bump SRCREVs
=20=20fso-specs: older SRCREV because HEAD causes libfreesmartphone-glib to =
fail
=20=20linux-2.6.39: sync om-gta02 defconfig with defconfig from larsc a bit
=20=20linux_2.6.39: revert MMC changes from openmoko.patch in shr.patch
=20=20xserver-xorg: upgrade from 1.10.1.901 to 1.10.1.902
=20=20linux-openmoko-2.6.3[79]: fix nand with badblocks
=20=20linux: add new kernel task savedefconfig
=20=20om-gta01: minimize 2.6.37 defconfig with savedefconfig
=20=20linux-nokia900-meego: minimize defconfig with savedefconfig
=20=20linux-2.6.39: add defconfig for om-gta01
=20=20qt4: remove qte.sh from shared SRC_URI and PACKAGE_ARCH_palmpre

Paul Eggleton (3):
=20=20qte: enable 18bpp support
=20=20qte: revert changes from 2a1c9e1ee5eb8067592d26100b563dd2ae7be00d
=20=20manufacturers: define a SRCREV to fix package build

Paul Menzel (2):
=20=20avahi-ui: add `libglade` to `DEPENDS`
=20=20mango-lassi: add `scrollkeeper-native` to `DEPENDS`

Simon Busch (5):
=20=20aurora: use qte.sh script at bootup to get the correct touchscreen =
configura
=20=20python-2.6.6: backport pkgconfig support from version 2.7.1 and bump =
PR
=20=20aurora: update recipe for latest changes to aurora and bump PR
=20=20libshiboken: fixup several issues with the generated pkgconfig file =
and bump
=20=20python-pyside-embedded: update patch for qws support and bump PR

Stanislav Brabec (7):
=20=20crda: Fix build by disabling of make environment overrides.
=20=20crda: Upgrade regulatory database to 2011.04.28.
=20=20gnome-desktop: Disable doc build - XSL processing depends on =
/usr/share/xml=20
=20=20mavit-svn: Upgrade to SVN snapshot 4495. Changed SVN URI to http =
(https does
=20=20bluez-hcidump: Fix declaration clash (remove definition of ntoh64() =
already=20
=20=20balsa: Fix DEPENDS. Disable doc build - XSL processing is dependent =
on host=20
=20=20mumpot: Upgrade to version 0.6.

Steffen Sledz (1):
=20=20apr-util: disable odbc support to avoid QA error

Thomas Zimmermann (1):
=20=20sflphone-common: Update to 0.9.13 and remove sflphone-pjproject

Tom Rini (4):
=20=20sysvinit: Upstream patch for newer libcs
=20=20openssl.inc: Fix PowerPC64 builds
=20=20boa: Add bison-native to DEPENDS
=20=20boa: Also flex-native




