Received: from oh-69-34-21-229.sta.embarqhsd.net ([69.34.21.229]
	helo=happy.bec-systems.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1RSsbo-0004is-MZ; Tue, 22 Nov 2011 16:50:09 +0100
Received: from localhost.localdomain ([127.0.0.1] helo=happy.bec-systems.com)
	by happy.bec-systems.com with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1RSrL8-0001ss-IV; Tue, 22 Nov 2011 09:28:50 -0500
Date: Tue, 22 Nov 2011 09:28:50 -0500
Message-Id: <E1RSrL8-0001ss-IV@happy.bec-systems.com>
X-Mailer: Nodemailer (0.1.13; +http://www.nodemailer.org)
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
MIME-Version: 1.0
Subject: OE Changelog for 2011-11-14 to 2011-11-21
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
X-List-Received-Date: Tue, 22 Nov 2011 15:50:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Changelog for 2011-11-14 to 2011-11-21.  Projects included in this report:

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

Paul Eggleton (1):
=20=20lib/bb/runqueue: avoid marking runtime dependencies as covered

Richard Purdie (3):
=20=20siggen.py: Fix diffsigs output for filename comparisions
=20=20siggen.py: Include list of variables in hashes
=20=20parse_py: Use absolute paths for FILE

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Chris Larson (1):
=20=20bitbake.conf: add a couple explicit vardeps

Connor Abbott (1):
=20=20mime.bbclass: fix typo

Damien Lespiau (1):
=20=20bootimg: Create a valid boot sector for the iso image

Dmitry Eremin-Solenikov (2):
=20=20screenshot: rename to sato-screenshot
=20=20gobject-introspection: update frome meta-oe

Henning Heinold (1):
=20=20glib-2.0: fix qsort_t testing for uclibc

Jan Luebbe (1):
=20=20libpcap: use binconfig class to deploy pcap-config

Jiajun Xu (2):
=20=20sanitytest: use different option for command ps from busybox and =
procps
=20=20sanitytest: remove rpm/zypper tests if PACKAGE_CLASSES does not set =
package_

Kang Kai (1):
=20=20mesa: fix calling host's commands

Koen Kooi (1):
=20=20shared-mime-info: fix ordering of PACKAGES

Martin Jansa (16):
=20=20subversion: add 1.7.0 with native support and negative D_P for now
=20=20util-linux: use u-a for flock and blockdev, conflicts with busybox
=20=20util-linux: add missing u-a calls for setsid chrt
=20=20util-linux: bump PR after u-a changes
=20=20kbd: use u-a for chvt, deallocvt, fgconssole, openvt, conflicts with =
busybox
=20=20time: rename files dir to time-1.7 for faster lookup
=20=20time: drop default S and 2 useless comments
=20=20time: use u-a for time, conflicts with busybox
=20=20libatomics-ops: force ARM mode
=20=20pulseaudio-0.9.23: force ARM mode
=20=20aspell: force ARM mode
=20=20webkit-gtk: force arm mode to work around binutils segfault
=20=20alsa-lib: use PKGSUFFIX for every package to resolve multiple runtime =
provid
=20=20alsa-lib: add nativesdk BBCLASSEXTEND
=20=20base.bbclass: add subversion-native to DEPENDS if there is svn:// in =
SRC_URI
=20=20apr-util: extend sed call to fix libtool patch for case without SHELL =
in LIB

Michael Brown (1):
=20=20gcc-4.6: fix toolchain build for SH4

Nitin A Kamble (7):
=20=20libpcre: upgrade from 8.12 to 8.20
=20=20mpfr: upgrade from 3.0.1 to 3.1.0
=20=20tcl: upgrade from 8.5.10 to 8.5.11
=20=20python-gst: upgrade from 0.10.21 to 0.10.22
=20=20insane.bbclass: avoid errors for x32 kernel
=20=20update distro tracking recipe information
=20=20btrfs-tools: update to the latest git commit

Otavio Salvador (1):
=20=20dhcp: generate initial leases files for server

Phil Blundell (1):
=20=20libnss-mdns: avoid race condition in postinst

Richard Purdie (9):
=20=20base-passwd: Fix the broken preinst/postinstall
=20=20base-passwd: Move update-passwd into a separate package
=20=20dpkg/update-alternatives: Fix dpkg version of update-alternatives to =
be usab
=20=20bitbake.conf: Correct svn-native -> subversion-native so we use =
consistent n
=20=20libconvert-asn1-perl/libtimedate-perl: Convert to use allarch
=20=20sanity.bbclass: No need to check for cvs any more
=20=20update-alternatives: Various fixes
=20=20package.bbclass: Ensure we tell rpmdeps where to find its magic file
=20=20package_rpm: Set _tmppath to avoid races over tmp files

Saul Wold (7):
=20=20libgcrypt: add BBCLASSEXTEND native for gnutls-native
=20=20libgpg-error: add BBCLASSEXTEND native for libgcrypts and =
gnutls-native
=20=20file: update to 5.09
=20=20gnu-config: update to git HEAD
=20=20gnu-config: Create 2011111 release
=20=20boost: Update to 1.47.0 & Cleanup
=20=20bitbake.conf: Update ASSUME_PROVIDED

Simon Busch (1):
=20=20qt4-x11-free: bring back pkg-config fixups

Xiaofeng Yan (2):
=20=20libx11-diet: update to 1.4.4
=20=20directfb: update to 1.4.15

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Andreas M=C3=BCller (5):
=20=20xfce4-dev-tools: cleanups
=20=20midori: update to 0.4.2
=20=20tumbler: initial add 0.1.22
=20=20ristretto: update to 0.3.0
=20=20ristretto: add tumbler to RRECOMMENDS_${PN}

Koen Kooi (20):
=20=20qcanobserver: import from OE Classic with updates and cleanups
=20=20qcanobserver-socketcan: import from OE Classic with updates
=20=20nodejs: update to 0.4.9
=20=20nodejs: add 0.6.1
=20=20python-imaging: add 1.1.7
=20=20gateone: update to latest SRCREV, add missing python modules
=20=20networkmanager 0.9.2.0: add patch to fix dhcp version detection
=20=20gvfs 1.8.2: disable samba, it causes an OOM
=20=20uhd-firmware: update to 3.3.1
=20=20uhd: update to 3.3.1 to match kernel and FPGA firmware
=20=20gateone: update to latest SRCREV for performance improvements
=20=20gateone: convert to allarch, it's pure python + js
=20=20systemd: bump SRCREV
=20=20gconf: drop from meta-oe, oe-core has 3.2.3 nowadays
=20=20libwmf: add 0.2.8.4
=20=20t1lib: add 5.1.2
=20=20gtkmathview: add 0.8.0
=20=20libwmf 0.2.8.4: fix native build
=20=20loudmouth: add 1.4.3
=20=20abiword: update to 2.8.6

Martin Jansa (1):
=20=20systemd: add prerm u-a calls

Otavio Salvador (1):
=20=20freerdp: use FreeRDP-old repository as 1.0 release is not stable yet

Stefan Schmidt (1):
=20=20nodejs: Update to latest 0.4x series release 0.4.12

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Chris Larson (1):
=20=20bitbake.conf: add a couple explicit vardeps

Connor Abbott (1):
=20=20mime.bbclass: fix typo

Damien Lespiau (1):
=20=20bootimg: Create a valid boot sector for the iso image

Dmitry Eremin-Solenikov (2):
=20=20screenshot: rename to sato-screenshot
=20=20gobject-introspection: update frome meta-oe

Henning Heinold (1):
=20=20glib-2.0: fix qsort_t testing for uclibc

Jan Luebbe (2):
=20=20syslinux: fix the SRC_URI by using the 4.xx directory
=20=20libpcap: use binconfig class to deploy pcap-config

Jiajun Xu (2):
=20=20sanitytest: use different option for command ps from busybox and =
procps
=20=20sanitytest: remove rpm/zypper tests if PACKAGE_CLASSES does not set =
package_

Kang Kai (1):
=20=20mesa: fix calling host's commands

Koen Kooi (1):
=20=20shared-mime-info: fix ordering of PACKAGES

Martin Jansa (16):
=20=20subversion: add 1.7.0 with native support and negative D_P for now
=20=20util-linux: use u-a for flock and blockdev, conflicts with busybox
=20=20util-linux: add missing u-a calls for setsid chrt
=20=20util-linux: bump PR after u-a changes
=20=20kbd: use u-a for chvt, deallocvt, fgconssole, openvt, conflicts with =
busybox
=20=20time: rename files dir to time-1.7 for faster lookup
=20=20time: drop default S and 2 useless comments
=20=20time: use u-a for time, conflicts with busybox
=20=20libatomics-ops: force ARM mode
=20=20pulseaudio-0.9.23: force ARM mode
=20=20aspell: force ARM mode
=20=20webkit-gtk: force arm mode to work around binutils segfault
=20=20alsa-lib: use PKGSUFFIX for every package to resolve multiple runtime =
provid
=20=20alsa-lib: add nativesdk BBCLASSEXTEND
=20=20base.bbclass: add subversion-native to DEPENDS if there is svn:// in =
SRC_URI
=20=20apr-util: extend sed call to fix libtool patch for case without SHELL =
in LIB

Michael Brown (1):
=20=20gcc-4.6: fix toolchain build for SH4

Nitin A Kamble (7):
=20=20libpcre: upgrade from 8.12 to 8.20
=20=20mpfr: upgrade from 3.0.1 to 3.1.0
=20=20tcl: upgrade from 8.5.10 to 8.5.11
=20=20python-gst: upgrade from 0.10.21 to 0.10.22
=20=20insane.bbclass: avoid errors for x32 kernel
=20=20update distro tracking recipe information
=20=20btrfs-tools: update to the latest git commit

Otavio Salvador (1):
=20=20dhcp: generate initial leases files for server

Paul Eggleton (1):
=20=20lib/bb/runqueue: avoid marking runtime dependencies as covered

Phil Blundell (1):
=20=20libnss-mdns: avoid race condition in postinst

Richard Purdie (12):
=20=20base-passwd: Fix the broken preinst/postinstall
=20=20base-passwd: Move update-passwd into a separate package
=20=20dpkg/update-alternatives: Fix dpkg version of update-alternatives to =
be usab
=20=20bitbake.conf: Correct svn-native -> subversion-native so we use =
consistent n
=20=20libconvert-asn1-perl/libtimedate-perl: Convert to use allarch
=20=20sanity.bbclass: No need to check for cvs any more
=20=20update-alternatives: Various fixes
=20=20package.bbclass: Ensure we tell rpmdeps where to find its magic file
=20=20siggen.py: Fix diffsigs output for filename comparisions
=20=20siggen.py: Include list of variables in hashes
=20=20package_rpm: Set _tmppath to avoid races over tmp files
=20=20parse_py: Use absolute paths for FILE

Saul Wold (7):
=20=20libgcrypt: add BBCLASSEXTEND native for gnutls-native
=20=20libgpg-error: add BBCLASSEXTEND native for libgcrypts and =
gnutls-native
=20=20file: update to 5.09
=20=20gnu-config: update to git HEAD
=20=20gnu-config: Create 2011111 release
=20=20boost: Update to 1.47.0 & Cleanup
=20=20bitbake.conf: Update ASSUME_PROVIDED

Simon Busch (1):
=20=20qt4-x11-free: bring back pkg-config fixups

Xiaofeng Yan (2):
=20=20libx11-diet: update to 1.4.4
=20=20directfb: update to 1.4.15

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-texasinstruments:

Jason Kridner (1):
=20=20gadget-init: create info.txt upon starting storage gadget

Joel A Fernandes (3):
=20=20linux-ti33x-psp: Refresh musb patch
=20=20sdcard_image: Add image version info to root fs
=20=20gadget-init: Add image-version-info to info.txt

Koen Kooi (11):
=20=20linux-ti33x-psp 3.1: remove CAN patch that hardcodes evm as machine =
instead=20
=20=20linux-ti33x-psp 3.1: switch to beagleboard repo
=20=20bonescript: fix c/p mistake
=20=20beaglebone getting started: update to latest SRCREV
=20=20bonescript: update to latest SRCREV for fiber support
=20=20beaglebone getting started: update to latest SRCREV
=20=20beaglebone getting started: update to 1.0 release
=20=20bonescript: update to latest SRCREV
=20=20linux-ti335x 3.1: enable i2c2 for beaglebone
=20=20u-boot 2011.10rc: enable i2c2 for beaglebone
=20=20linux-ti335x-psp 3.1: enable all i2c and spi sensors for beaglebone

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

Denis 'GNUtoo' Carikli (2):
=20=20meta-openmoko: base-files: override /etc/fstab with one that =
automounts the=20
=20=20meta-shr: recipes-graphics: xserver-xorg: bring back =
randr-support.patch

Klaus Kurzmann (1):
=20=20linux-gta04_git.bb: switch to master branch based on 3.1

Lukas M=C3=A4rdian (1):
=20=20frameworkd: update SRCREV and bump PR

Martin Jansa (8):
=20=20base-files: move PRINC to meta-shr
=20=20qi: upgrade to latest SRCREV
=20=20linux-openmoko_2.6.39: apply work around for GCC bug
=20=20linux-openmoko: remove only glamo_mci_pre_request & =
glamo_mci_post_request i
=20=20elsa: add bbappend with our autologin elsa.conf
=20=20libphone-ui-shr: bump PR
=20=20meta-nokia: add formfactor files
=20=20initscripts: move PRINC to meta-shr

Simon Busch (6):
=20=20meta-fso: libsamsung-ipc: add vapi to dev package and bump PR
=20=20meta-aurora: aurora-base: bump SRCREV
=20=20meta-samsung: xf86-input-mtev: bump SRCREV
=20=20meta-fso: cornucopia: bump SRCREV
=20=20meta-fso: libsamsung-ipc: bump SRCREV
=20=20meta-aurora: aurora-base: bump SRCREV to a more stable version than =
before

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-micro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-slugos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nslu2:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Tom Zanussi (1):
=20=20meta-intel: update kernel SRCREVs

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-handheld:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-opie:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:

Todd Kempel (1):
=20=20batctl: Add version 2011.3.0 (initial recipe)

Vita Preskovsky (1):
=20=20bluez4: Add version 4.95




