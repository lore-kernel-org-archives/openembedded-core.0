Received: from oh-69-34-21-229.sta.embarqhsd.net ([69.34.21.229]
	helo=happy.bec-systems.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1Rgkrs-0000MS-6P; Fri, 30 Dec 2011 23:24:04 +0100
Received: from localhost.localdomain ([127.0.0.1] helo=happy.bec-systems.com)
	by happy.bec-systems.com with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1Rgkkn-0000Ou-4B; Fri, 30 Dec 2011 17:16:45 -0500
Date: Fri, 30 Dec 2011 17:16:45 -0500
Message-Id: <E1Rgkkn-0000Ou-4B@happy.bec-systems.com>
X-Mailer: Nodemailer (0.1.13; +http://www.nodemailer.org)
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
MIME-Version: 1.0
Subject: OE Changelog for 2011-12-19 to 2011-12-26
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
X-List-Received-Date: Fri, 30 Dec 2011 22:24:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Changelog for 2011-12-19 to 2011-12-26.  Projects included in this report:

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

Joshua Lock (2):
=20=20ui/crumbs/runningbuild: handle InvalidTask events
=20=20ui/crumbs/hobprefs: trigger a reparse after changing IMAGE_FSTYPES

Khem Raj (1):
=20=20vim/syntax: Recognize ?? operator

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Andrea Adami (1):
=20=20kernel.bbclass: fix pkg_postinst and pkg_postrm

Beth Flanagan (2):
=20=20license: Fix manifest conditional
=20=20less: Correcting generic license

Darren Hart (1):
=20=20ncurses: Allow override of ENABLE_WIDEC

Dexuan Cui (2):
=20=20socat: add the latest stable version 1.7.2.0
=20=20wget: fix a host intrusion issue introduced by adding =
--with-ssl=3Dopenssl.

H.J. Lu (1):
=20=20gmp: Don't check "$CC $CFLAGS" for x32 in gmp configure

Ilya Yanok (1):
=20=20arch-powerpc: set PACKAGE_EXTRA_ARCHS

Jiajun Xu (3):
=20=20ltp: Add recipe from OE
=20=20distro_tracking_fields: add information for ltp
=20=20task-core-tools: add ltp to testapps list

Joshua Lock (10):
=20=20gypsy: fix LICENSE field
=20=20udev: tidy the LICENSE fields
=20=20apt: clarify LICENSE as GPLv2.0
=20=20dpkg: clarify LICENSE as GPLv2.0
=20=20clutter: clarify LICENSE as LGPLv2.1
=20=20cogl: clarify LICENSE as LGPLv2.1 and fix metadata
=20=20matchbox-wm: clarify LICENSE as GPLv2.0
=20=20pango: clarify LICENSE is LGPLv2.0+
=20=20matchbox-desktop: clarify LICENSE is GPLv2.0+
=20=20matchbox-session-sato: clarify LICENSE in GPLv2.0

Ken Werner (1):
=20=20Change -mno-thumb to -marm

Koen Kooi (1):
=20=20connman-gnome: update SRC_URI to new repo

Mark Hatle (6):
=20=20package.bbclass: Adjust RPM call to use dynamic location for magic =
files
=20=20package_rpm.bbclass: Add RPMSPEC_PREAMBLE
=20=20rpm_5.4.0: Fix configuration issue with native/nativesdk
=20=20udev: Remove linux-libc-headers dependency
=20=20gperf: Add missing SRC checksum
=20=20which: Add missing SRC checksums

Mei Lei (2):
=20=20curl: Upgrade from 7.22.0 to 7.23.1
=20=20distro_tracking_fields: Update curl info and fix other recipes' typo =
issues

Nitin A Kamble (2):
=20=20binutils: fix building on distros with matching binutils version
=20=20image-types: add btrfs as a supported fstype

Paul Eggleton (9):
=20=20xrestop: fix SRC_URI and LICENSE
=20=20matchbox-desktop: fix SRC_URI
=20=20matchbox-themes-extra: fix SRC_URI
=20=20libmatchbox: fix SRC_URI
=20=20libxsettings-client: fix SRC_URI
=20=20mtools: fix SRC_URI for GPLv2 version
=20=20eds-dbus: replace o-hand example contact
=20=20libsync: move to git.yoctoproject.org
=20=20qemu: explicitly disable kvm support for native without kvm header

Richard Purdie (3):
=20=20multilib.conf: Enable shadow-sysroot and libffi
=20=20opkg: Fix installation order in feeds with mutiple providers of =
packages
=20=20which: Disable iberty since its not listed in DEPENDS

Saul Wold (11):
=20=20distro tracking: update man-pages, gts-plugin-bluetooth, usbutils,
=20=20python-pycairo: Upgrade to 1.10.0
=20=20augeas: Upgrade to 0.10.0
=20=20libidn: Upgrade to 1.23
=20=20mc: Add version 4.8.1 now GPLv3
=20=20texi2html: Upgrade to 5.0
=20=20libdrm: Upgrade to 2.4.29
=20=20distro_tracking: Mark Upgrade Info
=20=20zypper: add patch from libxml2
=20=20bash: Add SRC_URI Checksums for GPLv2
=20=20coreutils: ensure --color works so DEPEND on libcap

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Eric BENARD (1):
=20=20gdb-cross-canadian: build gdb with python support

Khem Raj (1):
=20=20gcc-4.5: Update gxx headers patch

Koen Kooi (4):
=20=20gdm 2.32.2: add missing source checksums
=20=20epiphany 2.30.6: add missing source checksums
=20=20task-basic: adjust rsyslog dependency
=20=20xbmc: bump SRCREV to latest eden branch

Martin Jansa (7):
=20=20e-base: bump EFL_SRCREV remove EFL_SRCREV_1.* and applied patches =
from libef
=20=20edje: fix unpackaged multisense modules
=20=20e-base: bump EFL_SRCREV a bit more
=20=20e-tasks: add patch to fix changed callback name
=20=20gpsd: upgrade from 2.95 to 2.96, drop 2 patches applied upstream
=20=20navit: bump PR after gpsd upgrade (.so name change)
=20=20midori: upgrade from 0.4.2 to 0.4.3

Otavio Salvador (4):
=20=20pcsc-lite: ccid downgraded to a runtime recommendation
=20=20rsyslog: move systemd support to rsyslog-systemd
=20=20systemd: depends on intltool-native
=20=20dialog: add 1.1-20111020 recipe (dynamic and static)

Sylvain Par=C3=A9 (1):
=20=20vlc: rework dependencies

Zhenhua Luo (6):
=20=20xmlto: add version 0.0.25
=20=20libxaw: fix build error due to missing xmlto
=20=20ietutils: add version 1.0
=20=20ipsec-tools: add version 0.7.2
=20=20libnfnetlink: add version 1.0.0
=20=20ptpd: add version 1.0.0

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Andrea Adami (1):
=20=20kernel.bbclass: fix pkg_postinst and pkg_postrm

Beth Flanagan (2):
=20=20license: Fix manifest conditional
=20=20less: Correcting generic license

Darren Hart (1):
=20=20ncurses: Allow override of ENABLE_WIDEC

Dexuan Cui (2):
=20=20socat: add the latest stable version 1.7.2.0
=20=20wget: fix a host intrusion issue introduced by adding =
--with-ssl=3Dopenssl.

H.J. Lu (1):
=20=20gmp: Don't check "$CC $CFLAGS" for x32 in gmp configure

Ilya Yanok (1):
=20=20arch-powerpc: set PACKAGE_EXTRA_ARCHS

Jiajun Xu (3):
=20=20ltp: Add recipe from OE
=20=20distro_tracking_fields: add information for ltp
=20=20task-core-tools: add ltp to testapps list

Joshua Lock (12):
=20=20ui/crumbs/runningbuild: handle InvalidTask events
=20=20ui/crumbs/hobprefs: trigger a reparse after changing IMAGE_FSTYPES
=20=20dpkg: clarify LICENSE as GPLv2.0
=20=20clutter: clarify LICENSE as LGPLv2.1
=20=20cogl: clarify LICENSE as LGPLv2.1 and fix metadata
=20=20matchbox-wm: clarify LICENSE as GPLv2.0
=20=20pango: clarify LICENSE is LGPLv2.0+
=20=20matchbox-desktop: clarify LICENSE is GPLv2.0+
=20=20matchbox-session-sato: clarify LICENSE in GPLv2.0
=20=20apt: clarify LICENSE as GPLv2.0
=20=20udev: tidy the LICENSE fields
=20=20gypsy: fix LICENSE field

Ken Werner (1):
=20=20Change -mno-thumb to -marm

Khem Raj (1):
=20=20vim/syntax: Recognize ?? operator

Koen Kooi (1):
=20=20connman-gnome: update SRC_URI to new repo

Mark Hatle (6):
=20=20package.bbclass: Adjust RPM call to use dynamic location for magic =
files
=20=20package_rpm.bbclass: Add RPMSPEC_PREAMBLE
=20=20rpm_5.4.0: Fix configuration issue with native/nativesdk
=20=20udev: Remove linux-libc-headers dependency
=20=20gperf: Add missing SRC checksum
=20=20which: Add missing SRC checksums

Mei Lei (2):
=20=20curl: Upgrade from 7.22.0 to 7.23.1
=20=20distro_tracking_fields: Update curl info and fix other recipes' typo =
issues

Nitin A Kamble (2):
=20=20binutils: fix building on distros with matching binutils version
=20=20image-types: add btrfs as a supported fstype

Paul Eggleton (9):
=20=20xrestop: fix SRC_URI and LICENSE
=20=20matchbox-desktop: fix SRC_URI
=20=20matchbox-themes-extra: fix SRC_URI
=20=20libmatchbox: fix SRC_URI
=20=20libxsettings-client: fix SRC_URI
=20=20mtools: fix SRC_URI for GPLv2 version
=20=20eds-dbus: replace o-hand example contact
=20=20libsync: move to git.yoctoproject.org
=20=20qemu: explicitly disable kvm support for native without kvm header

Richard Purdie (3):
=20=20multilib.conf: Enable shadow-sysroot and libffi
=20=20opkg: Fix installation order in feeds with mutiple providers of =
packages
=20=20which: Disable iberty since its not listed in DEPENDS

Saul Wold (11):
=20=20distro tracking: update man-pages, gts-plugin-bluetooth, usbutils,
=20=20python-pycairo: Upgrade to 1.10.0
=20=20augeas: Upgrade to 0.10.0
=20=20libidn: Upgrade to 1.23
=20=20mc: Add version 4.8.1 now GPLv3
=20=20texi2html: Upgrade to 5.0
=20=20libdrm: Upgrade to 2.4.29
=20=20distro_tracking: Mark Upgrade Info
=20=20zypper: add patch from libxml2
=20=20bash: Add SRC_URI Checksums for GPLv2
=20=20coreutils: ensure --color works so DEPEND on libcap

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-texasinstruments:

Koen Kooi (13):
=20=20linux 3.1: set COMPATIBLE_MACHINE to beagleboard for the time being =
to work=20
=20=20linux-ti81xx-psp 2.6.37: update to match latest *SDK
=20=20linux-ti335x-psp 3.1: disable whiteheat firmware to unbreak build =
with make=20
=20=20ti-linuxutils: fix LICENSE syntax
=20=20ti-cgt6x: update to 6.1.20
=20=20ti-cgt6x: add 7.2.7
=20=20linux 3.0: update to 3.0.14
=20=20ti-dmai: clean up recipe
=20=20ti-dsplink: fix build with make 3.85 (e.g. fedora)
=20=20u-boot: cleanup
=20=20pandaboard: new machine config to support both omap4430 and omap4460 =
based p
=20=20u-boot 2011.12: add 2011.12rc1
=20=20u-boot 2011.12rc1: add beagleboard and pandaboard patches

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

Klaus Kurzmann (4):
=20=20om-gta04.conf: add libertas-sdio to the recommended and autoloaded =
kernel mo
=20=20linux-gta04_git.bb: bump SRCREV
=20=20om-gta04.conf: add libertas-sdio to the recommended and autoloaded =
kernel mo
=20=20linux-gta04_git.bb: bump SRCREV

Martin Jansa (19):
=20=20meta-shr: rename feed for shr-2012.01
=20=20meta-shr: update SRCREVs to latest
=20=20shr-autorev.inc: rename to shr-core-autorev.inc so only core =
developers will
=20=20phoneui-apps: package phone-log and fix QA issues with unpackaged =
files
=20=20rm_old_work: keep PN in WORKDIR, because -dbg packages put sources to =
/usr/s
=20=20phonefsod: bump SRCREV
=20=20Merge remote-tracking branch 'origin/master'
=20=20Merge remote-tracking branch 'origin/shr'
=20=20libdrm: rename bbappend to match new version
=20=20phonefsod: bump SRCREV, SIM is full message finally solved
=20=20she-e-gadgets: bump SRCREV and remove applied patch
=20=20libphone-ui-shr: bump SRCREV and remove applied patches
=20=20dbus: drop chown postinst and bump PRINC
=20=20libcmtspeechdata: it checks for dbus in configure
=20=20vagalume: fix LICENSE metadata and gst plugins package names
=20=20numptyphysics: fix LICENSE metadata
=20=20task-shr: uncomment apps we had included by default
=20=20vagalume: fix gst plugins package names

Simon Busch (6):
=20=20meta-fso: libsamsung-ipc: bump SRCREV
=20=20meta-fso: cornucopia: bump SRCREV
=20=20meta-fso: frameworkd: bump SRCREV
=20=20meta-fso: cornucopia: bump SRCREV
=20=20meta-fso: frameworkd: bump SRCREV
=20=20meta-fso: cornucopia: bump SRCREV

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-micro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-slugos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nslu2:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Tom Zanussi (2):
=20=20meta-intel: add PROVIDES for extra packages provided by libva
=20=20meta-intel: change EMGD xserver libva dependency to libva-x11

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-handheld:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-opie:

Paul Eggleton (1):
=20=20opie-pimconverter: remove sqlite dependencies

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:

Frans Meulenbroeks (1):
=20=20net-snmp: added version 5.7.1




