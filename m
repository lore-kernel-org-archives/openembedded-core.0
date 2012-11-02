Received: from new.bec-systems.com ([74.208.70.121] helo=bec-systems.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1TUHI1-0008AD-0r; Fri, 02 Nov 2012 14:28:01 +0100
Received: from oh-69-34-21-229.sta.embarqhsd.net ([69.34.21.229]
	helo=happy.bec-systems.com)
	by bec-systems.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cliff.brake@gmail.com>)
	id 1TUGwO-00036v-Oy; Fri, 02 Nov 2012 09:05:45 -0400
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Date: Fri, 02 Nov 2012 13:14:09 GMT
Message-Id: <1351862049475.d41626c4@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
X-Spam_score: -2.9
X-Spam_score_int: -28
X-Spam_bar: --
Subject: OE Changelog since 2012-10-21 until 2012-10-28
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
X-List-Received-Date: Fri, 02 Nov 2012 13:28:02 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2012-10-21 until 2012-10-28.  Projects included in this =
report:

bitbake: git://git.openembedded.org/bitbake
openembedded-core: git://git.openembedded.org/openembedded-core
meta-openembedded: git://git.openembedded.org/meta-openembedded
meta-smartphone: http://git.shr-project.org/repo/meta-smartphone.git
meta-micro: git://git.openembedded.org/meta-micro
meta-slugos: git://github.com/kraj/meta-slugos
meta-nslu2: git://github.com/kraj/meta-nslu2
meta-intel: git://git.yoctoproject.org/meta-intel
meta-handheld: git://git.openembedded.org/meta-handheld
meta-opie: git://git.openembedded.org/meta-opie
openembedded: git://git.openembedded.org/openembedded
meta-bug: git://github.com/buglabs/meta-bug.git
meta-efikamx: git://github.com/kraj/meta-efikamx.git
meta-ettus: http://github.com/koenkooi/meta-ettus.git
meta-fsl-ppc: git://git.yoctoproject.org/meta-fsl-ppc
meta-igep: http://github.com/ebutera/meta-igep.git
meta-netbookpro: git://github.com/tworaz/meta-netbookpro
meta-xilinx: git://git.yoctoproject.org/meta-xilinx
meta-chicken: git://github.com/OSSystems/meta-chicken
meta-java: git://github.com/woglinde/meta-java
meta-qt3: git://git.yoctoproject.org/meta-qt3
meta-telephony: git://gitorious.org/sysmocom-openembedded/meta-telephony.git
meta-ti: git://git.yoctoproject.org/meta-ti
meta-angstrom: git://github.com/Angstrom-distribution/meta-angstrom.git
meta-browser: git://github.com/OSSystems/meta-browser.git
meta-mono: git://git.yoctoproject.org/meta-mono.git
meta-raspberrypi: git://github.com/djwillis/meta-raspberrypi.git
meta-kde: git://gitorious.org/openembedded-core-layers/meta-kde.git
meta-yocto: git://git.yoctoproject.org/meta-yocto
meta-webos: git://github.com/openwebos/meta-webos.git
meta-arago: git://arago-project.org/git/meta-arago.git
meta-ivi: git://git.yoctoproject.org/meta-ivi
meta-systemd: git://git.yoctoproject.org/meta-systemd
meta-guacamayo: git://github.com/Guacamayo/meta-guacamayo.git
meta-beagleboard: git://github.com/beagleboard/meta-beagleboard.git
meta-gumstix: git://github.com/gumstix/meta-gumstix.git
meta-gumstix-community: =
git://gitorious.org/schnitzeltony-oe-meta/meta-gumstix-community.git

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for bitbake:

Andrei Dinu (2):
=20=20hob: image size displayed wrong size in edit packages screen
=20=20hob: stop build without percentage shown

Cristian Iorga (4):
=20=20bitbake: hob/hobwidget: "Brought in by" column is now displayed =
correctly
=20=20bitbake: hob/builder: Image selection is remembered while changing =
adv setti
=20=20bitbake: hob/builder: Hob crashes because of bad init
=20=20hob/hig: Hob doesn't save properly proxy settings

Cristiana Voicu (7):
=20=20hob: change behavior for "cancel" button from the Recipe selection =
page
=20=20hob/imageconfigurationpage: progress bar shows when recipe parsing is =
stoppe
=20=20hob/builddetailspage: set "Log" page as default
=20=20hob/settings: add a scroll bar for the box with mirrors
=20=20hob: add a progress indicator when you select 'view log'
=20=20hob: during recipe parsing, progress bar text provides details about =
the pro
=20=20hob: reordering the layers in the Hob Layers dialog

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Alexandru DAMIAN (1):
=20=20udev: upgrade to 182

Andreas M=C3=BCller (4):
=20=20gnome-icon-theme: fix icon mapping
=20=20gnome-icon-theme: remove unused configure variable
=20=20sato-icon-theme: fix build
=20=20sato-icon-theme: merge sato-icon-theme.inc into recipe

Andrei Gherzan (5):
=20=20opkg: Add patch to fix removing packages with recommends
=20=20opkg: Don't print empty PROVIDES
=20=20rootfs_ipk.bbclass: Don't duplicate remove_packaging_data_files code
=20=20rootfs_ipk.bbclass: Some extra spaces / tabs were removed / formated
=20=20opkg-utils: Add needed python modules as RDEPENDS

Andy Ross (2):
=20=20busybox: add /usr/bin/stat applet
=20=20udev-extraconf: Don't mount root filesystem under /media

Aristov Maxim (1):
=20=20uClibc: Resolve conflicting options when building for mips32

Christopher Larson (1):
=20=20lttng-2.0: fix srcrev/pv to match the recipe filenames

Damien Lespiau (1):
=20=20mtdev: New recipe for mtdev

Daniel Stone (1):
=20=20atk: Update to 2.6.0

Denis 'GNUtoo' Carikli (1):
=20=20libsdl: fix inconditional alsa disabling.

Fabien Proriol (1):
=20=20populate_sdk_base: allow SDK path of various level

Holger Hans Peter Freyther (1):
=20=20kernel.bbclass: Do not chdir to /boot before running =
update-alternatives

Kang Kai (4):
=20=20perl: update dependencies among modules
=20=20autoconf: update runtime dependencies
=20=20automake: update dependencies
=20=20perl: update dependencies

Khem Raj (2):
=20=20eglibc-2.16: Use tar ball instead of svn SRC_URI
=20=20bitbake.conf: Change systemd_unitdir definition

Marcin Juszkiewicz (1):
=20=20shadow-securetty: add ARM AMBA serial ports

Mark Hatle (4):
=20=20multilib: Add support for cross-canadian multilib packages
=20=20multilib - crosssdk: Stop building multilib for crosssdk packages
=20=20populate_sdk_base: Update extraction script for multilibs
=20=20populate_sdk_base: Ensure that the multilib cross-canadian tools are =
used

Martin Jansa (1):
=20=20opkg-utils: bump SRCREV to latest

Mihai Lindner (1):
=20=20distro_identifier: replace slash with hyphen

Morten Minde Neergaard (1):
=20=20terminal: Add support for running custom terminals.

Paul Eggleton (1):
=20=20zeroconf: remove

Peter Seebach (1):
=20=20insane.bbclass and friends: Fix sanity checks and multlib headers for =
n32

Phil Blundell (2):
=20=20eglibc: Move perl- and bash-using scripts to separate recipes
=20=20cpan-base: Add more debug paths to FILES

Richard Purdie (10):
=20=20perl: Fix perl module dependency issues
=20=20base.bbclass: Add PKGTRIPLETS and PKGMLTRIPLETS variables
=20=20lib/oe/packagedata: Use the PKGMLTRIPLETS variable
=20=20package.bbclass: Switch shlibs to pkgdata directory and make package =
non-mac
=20=20sstate: Improve handling of machine specific manifests
=20=20multilib/clsextend: Improve handling of regexps in PACKAGES_DYNAMIC
=20=20package.bbclass: Exclude the PKGTRIPLETS variable
=20=20package: Hardlink debug source to improve performance
=20=20qemugl: Remove since support for it was removed from qemu
=20=20cogl/clutter: Explicitly depend on libdrm for GLX

Robert Yang (3):
=20=20nativesdk-ncurses 5.9: files were installed but not shipped
=20=20rootfs_rpm.bbclass: maybe no rpm postinst script
=20=20bitbake.conf: break three very long lines

Ross Burton (15):
=20=20xorg: remove XF86 BigFont extension
=20=20xserver-xorg: add runtime provides for the driver ABI version
=20=20insane: add a check for Xorg driver ABI dependencies
=20=20gmae: remove Evolution Data Server
=20=20evolution-data-server: remove
=20=20libical: remove
=20=20libxkbcommon: new window system-independent XKB library
=20=20linux-firmare: upgrade to latest commit
=20=20xorg-driver: add xserver driver ABI dependencies
=20=20gst-plugins-good: disable taglib explicitly
=20=20diffutils: fix rebuilds
=20=20pulseaudio: add GConf dependency
=20=20pulseaudio: move helper binaries into the relevant module packages
=20=20pulseaudio: fix library packaging
=20=20pulseaudio: remove libpulse-browse, removed upstream in 2011

Samuel Stirtzel (1):
=20=20gtk-immodules-cache: Add initial class to update gtk inputmethod =
module cach

Saul Wold (3):
=20=20gst-meta-base: include ximagesink plugin when x11 is a feature
=20=20sstate: add manifest info for shared file matches
=20=20ltp: add perl to RDEPENDS

Tom Zanussi (2):
=20=20packagegroup-core-tools-profile: replace 'legacy' lttng with lttng 2.0
=20=20lttng-modules: remove unused lttng-syscalls patch

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Andreas M=C3=BCller (2):
=20=20devilspie2: initial add 0.24
=20=20libgphoto2: fix build

Jack Mitchell (1):
=20=20Jansson: new recipe, library for creating and manipulating JSON =
strings in C

Khem Raj (1):
=20=20systemd: Upgrade past v194

Koen Kooi (3):
=20=20systemd: update to 195
=20=20Revert "maliit-framework: Clean up recipe and use =
gtk-immodules-cache.bbclas
=20=20f2fs-tools: add 1.1.0

Marc Ferland (1):
=20=20lmsensors: Initial commit

Marc Reilly (1):
=20=20hplip: Introduce version 3.12.6

Martin Jansa (10):
=20=20systemd: disable python
=20=20foxtrotgps: inherit gconf
=20=20tangogps: inherit gconf
=20=20imlib2: inherit binconfig
=20=20midori: inherit vala
=20=20vala-terminal: inherit vala
=20=20loudmouth: depend on libcheck instead of check
=20=20check: drop from meta-oe, there is libcheck in oe-core
=20=20python-pyqt: don't bypass sstate with sip files
=20=20samba: update documentation2.patch to apply

Morgan Little (4):
=20=20ntp: Move from meta-oe to meta-networking
=20=20ntp: Uprev from 4.2.6p3 to 4.2.6p5
=20=20ntp: Clean up recipes
=20=20traceroute: Add from OE-Classic, uprev and update

Otavio Salvador (3):
=20=20epdfview: Sync with Debian 0.1.8-3 patches
=20=20rage: Add license checksum
=20=20samba: update to version 3.6.8

Paul Eggleton (3):
=20=20mysql: always replace paths in mysql_config script
=20=20apache2: avoid injecting host include path
=20=20hddtemp: add from OE-Classic and update

Ross Burton (1):
=20=20pimlico: remove Poky overrides

Samuel Stirtzel (2):
=20=20libjpeg-turbo: Add RPROVIDES to fix errors when rdepending on jpeg
=20=20maliit-framework: Clean up recipe and use gtk-immodules-cache.bbclass

Sander van Grieken (1):
=20=20smbnetfs: add recipe for smbnetfs, a fuse filesystem for windows =
networks

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

Denis 'GNUtoo' Carikli (2):
=20=20meta-openmoko: linux-gta04: add XV support and fix cmdline arguments.
=20=20meta-openmoko: gta04: pull xserver-xorg-extension-extmod for XV.

Martin Jansa (12):
=20=20samba: drop bbappend with PRINC
=20=20podboy: add patches from Benjamin Deering
=20=20chroneo: add patch from Benjamin Deering
=20=20qi: add STAGING_INCDIR to includes
=20=20qi: limit COMPATIBLE_MACHINE
=20=20qi: pass CC instead of gcc
=20=20libcmtspeechdata: use libcheck instead of check
=20=20podboy: change patch to apply it without striplevel
=20=20chroneo: change patch to apply it without striplevel

V=C3=ADctor Enr=C3=ADquez (1):
=20=20Add a recipe for geeksphone one kernel.

vquicksilver (2):
=20=20Add a new layer for geeksphone one devices. Signed-off-by: =
vquicksilver <vic
=20=20Adds a machine configuration for geeksphone one.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-micro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-slugos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nslu2:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Darren Hart (5):
=20=20fri2: Add linux-yocto-tiny_3.4 support
=20=20fri2: README: Correct typographical and wording errors
=20=20fri2: Add grub-efi workaround for USB keyboard initialization
=20=20fri2: Update SRCREVs for linux-yocto recipes
=20=20fri2: Add tiny-init bbappend for devtmpfs and console

Kishore Bodke (3):
=20=20meta-intel/common: Add a new recipe for Zlib qat_mem Module.
=20=20meta-intel/common: Add new recipe for libcrypto module.
=20=20meta-crystalforest: Add zlib-qat and openssl-qat modules to custom =
images.

Nitin A Kamble (6):
=20=20MAINTAINERS: correct pathname
=20=20chiefriver: add WEBTITLE & Compliance information
=20=20crownbay: add WEBTITLE & Compliance information
=20=20emenlow: add WEBTITLE & Compliance information
=20=20jasperforest: add WEBTITLE & Compliance information
=20=20sugarbay: add WEBTITLE & Compliance information

Rahul Saxena (1):
=20=20cedartrail: add WEBTITLE & Compliance information

Richard Purdie (2):
=20=20lms: Ensure do_unpack2 task can rerun
=20=20emgd-driver-bin: The item in LICENSE_FLAGS_WHITELIST is case =
sensitive, fix=20

Ross Burton (2):
=20=20meta-intel: don't require commercial licenses for gstreamer-vaapi
=20=20gstreamer-vaapi: add missing build dependencies

Tom Zanussi (2):
=20=20meta-intel: fix VA_FEATURES assignment in machine configs
=20=20meta-crystalforest: update kernel SRCREVs

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-handheld:

Andrea Adami (2):
=20=20linux-yocto_3.2: move to its specific directory
=20=20udev_164: update .bbappend to 182 as in oe-core

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-opie:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-bug:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-efikamx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ettus:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-ppc:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-igep:

Enrico Butera (1):
=20=20Merge pull request #8 from eballetbo/master-next

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-netbookpro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-chicken:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-java:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-qt3:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-telephony:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

Enrico Butera (1):
=20=20libdrm: enable omap experimental api support

Nicolas Dechesne (2):
=20=20xf86-video-omap: add new recipe for OMAP4/5 X11 video driver
=20=20pandaboard: use xf86-video-omap by default in XSERVER config

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-browser:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-mono:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-raspberrypi:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-kde:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Darren Hart (1):
=20=20yocto-bsp: Fix git url parsing, allowing for local mirrors

Richard Purdie (1):
=20=20poky.conf: Add multiarch to DISTRO_FEATURES

Tom Zanussi (1):
=20=20yocto-bsp: set branches_base for list_property_values()

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

Herb Kuta (5):
=20=20mjson: Remove from image
=20=20Make various improvements to recipes for Isis Project components
=20=20Add creation of vmdk images unless building for ARM
=20=20webkit-supplemental: Fix not to install directly into sysroot
=20=20webkit-webos: Fix syntax error in test for gold

Martin Jansa (14):
=20=20upstart: update LICENSE to GPLv2+
=20=20upstart: dont mix tabs and spaces
=20=20qt4-webos: drop unused qpixmapatlascpp.patch
=20=20task-webos-boot: use ${PN} in PACKAGES and RDEPENDS+RRECOMMENDS
=20=20task-webos-boot: drop DEPENDS
=20=20qt4-webos: store parts of builddir and srcdir for webkit-webos and =
webkit-su
=20=20webkit-supplemental: don't use WORKDIR from qt4-webos build, but =
stored head
=20=20webkit-webos: make it MACHINE_ARCH
=20=20webkit-supplemental: make it MACHINE_ARCH
=20=20browser-adapter: make it MACHINE_ARCH
=20=20browserserver: make it MACHINE_ARCH
=20=20luna-sysservice: make it MACHINE_ARCH
=20=20browser-adapter: fix unmatched quotes and variable names
=20=20browser-adapter: fix installation of BrowserAdapter.so

Roger Stringer (1):
=20=20Fix format of ALLOW_EMPTY and update recipe

Sapna Todwal (1):
=20=20webos-image submission: nyx-modules=3D73

Simon Busch (7):
=20=20webkit: use substitution variables for common paths like /usr
=20=20db8: inherit from webos_system_bus to add luna-service files into our =
packag
=20=20distro: webos: stick to udev 164 version from oe-core
=20=20distro: webos: make sure we always prefer version 1.0.12 for yajl
=20=20libgcrypt: don't install m4 file into a subdirectory where it can not =
be fou
=20=20upstart: add alternative link for telinit utility
=20=20qt4-webos: make it MACHINE_ARCH

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Chase Maupin (3):
=20=20arago: set PREFERRED_PROVIDER for jpeg
=20=20remove-net-rules: Add a class to remove net rules from images
=20=20arago-base-tisdk-image: inherit remove-net-rules

Denys Dmytriyenko (14):
=20=20task-arago-cross-canadian: no need for meta-environment package
=20=20arago.conf: set SDK names, versions and paths
=20=20external-arago-sdk-toolchain: adjust path of host pieces, as expected =
by too
=20=20tcmode-external-arago.inc: flatten host SDK (nativesdk) pieces to =
match Arag
=20=20meta-toolchain-arago: complete adjustments to SDK directory structure
=20=20wpa-gui-e: fix file permissions
=20=20ti-wifi-utils: fix file permissions
=20=20task-arago-base-tisdk: remove secondary bootloader and dbus-x11
=20=20dbus: remove dependency on x11
=20=20qt4-tools-nativesdk: remove dependency on x11
=20=20arago.conf: fix the DISTRO_FEATURES to not skip standard libc ones
=20=20task-arago-sdk-host-nativesdk: remove autotools from sdk
=20=20task-arago-qte-toolchain-target: standard qte target sdk packages
=20=20meta-toolchain-arago-qte: Qt/E based Arago SDK recipe

Franklin S Cooper Jr (1):
=20=20task-arago-tisdk-crypto: Port crypto tasks from arago to meta-arago

Franklin S. Cooper Jr (18):
=20=20ltp-ddt: Add Arago tweaks
=20=20iperf: Upgrade to version 2.0.5
=20=20arago.conf: Set Arago's DISTRO_FEATURES
=20=20linux: Add copy-defconfig and setup-defconfig include files
=20=20qt4-embedded-gles: Port qt4-embedded-gles recipe from oe-classic
=20=20arago.conf: Select PREFERRED_PROVIDER of qt4-embedded
=20=20u-boot_2011.09-psp04.06.00.08: Add Arago specific tweaks
=20=20arago.conf: Set preferred u-boot version for am335x
=20=20linux-am335x: Add Arago tweak to linux-am335x recipe
=20=20arago.conf: Set preferred kernel version for am335x
=20=20arago.conf: Set PREFERRED_VERSION of the Graphics SDK
=20=20task-arago-qte: Port task-arago-qte task from Arago
=20=20ti-tisdk-makefile: Port ti-tisdk-makefile recipe from Arago
=20=20task-arago-tisdk-graphics: Create graphics task
=20=20qt-tstat: Add TI thermostat demo v2
=20=20task-arago-tisdk-qte: Add new Qt embedded task.
=20=20task-arago-tisdk-matrix: Add thermostat demo
=20=20arago-tisdk-image: Create image that builds Sitara SDK filesystem

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

Andrei Gherzan (18):
=20=20audiomanager_git: Set default preference to -1
=20=20audiomanager_git: Switch to public genivi git repository
=20=20audiomanager_git: Remove ERROR_QA overwriting
=20=20audiomanager: Switch to public genivi git repository
=20=20audiomanager: Remove ERROR_QA overwriting
=20=20audiomanager: Use systemd bbclass from meta-systemd
=20=20dlt-daemon: Switch to public genivi git repository
=20=20layer-management_git: Switch to public genivi git repository
=20=20layer-management: Switch to public genivi git repository
=20=20dl_pkgs: Remove packages that are now on public git repository
=20=20README.md: Script can be ran from layer directly
=20=20node-startup-controller: Fix systemd services and use systemd bbclass
=20=20node-startup-controller: Remove useless comment
=20=20node-startup-controller_git: Set default preference to -1
=20=20dlt-daemon: Remove useless line
=20=20dlt-daemon: Use systemd_unitdir for systemd
=20=20mesa: Replace mesa recipes with a bbappend
=20=20vexpressa9.conf: Add mesa-dri-driver-swrast to XSERVER packages

Florin Sarbu (3):
=20=20systemd_git.bbappend: Replace FILESEXTRAPATHS with =
FILESEXTRAPATHS_append
=20=20systemd_git: Remove patches that have been now merged in current 195 =
systemd
=20=20README.md: Update BBMASK and depending layers' revisions

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-systemd:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-guacamayo:

Ross Burton (2):
=20=20xkeyboard-common: disable runtime dep checking
=20=20tracker: explicitly disable miners we don't want

Saul Wold (2):
=20=20fuse: fix unparsable line due to extra "
=20=20gupnp-dlna: Update depends

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-beagleboard:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix-community:

Andreas M=C3=BCller (2):
=20=20linux-mainline-3.6: update to 3.6.3
=20=20linux-mainline-3.6: ensure vsynch isr registering




