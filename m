Received: from oh-69-34-21-229.sta.embarqhsd.net ([69.34.21.229]
	helo=happy.bec-systems.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1QTYmc-0002XY-WB; Mon, 06 Jun 2011 14:19:51 +0200
Received: from localhost ([127.0.0.1] helo=happy.bec-systems.com)
	by happy.bec-systems.com with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1QTYjR-0007yQ-5d; Mon, 06 Jun 2011 08:16:33 -0400
Date: Mon, 06 Jun 2011 08:16:33 -0400
Message-Id: <E1QTYjR-0007yQ-5d@happy.bec-systems.com>
X-Mailer: Nodemailer (0.1.13; +http://www.nodemailer.org)
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org
MIME-Version: 1.0
Subject: OE Changelog for 2011-05-30 to 2011-06-6
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
X-List-Received-Date: Mon, 06 Jun 2011 12:19:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Changelog for 2011-05-30 to 2011-06-6.  Projects included in this report:

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

Bruce Ashfield (1):
=20=20linux-yocto: update meta SRCREV

Dexuan Cui (2):
=20=20recipes: Upstream-status --> Upstream-Status: for multiple patches
=20=20send-pull-request: fix a small typo that fails the script

Jingdong Lu (1):
=20=20libx11: fix libX11 keysyms to pass xts5 of lsb

Kang Kai (1):
=20=20task-core-lsb: add cups and ghostscript into image

Koen Kooi (5):
=20=20sysvinit: make pidof usuable in a standalone setting
=20=20dbus 1.4.1: disable sysv script properly when using systemd
=20=20u-boot: package up u-boot.bin for field upgrades
=20=20shadow: remove selinux entry from pam.d/login
=20=20avahi: enable service when using systemd

Martin Jansa (3):
=20=20create-pull-request: allow '+' in git PROTO_RE, ie for 'git+ssh://'
=20=20siteinfo: replace all-linux with allarch-linux to match =
5d7d4e1ed9bedf2b6510
=20=20gnutls: add --with-libdl-prefix and --with-libpthread-prefix

Nitin A Kamble (1):
=20=20gettext-0.16.1: mark upstream status for gplv2 recipe's patches

Otavio Salvador (1):
=20=20qmake_base.bbclass: fix lrelease/lupdate binary names

Phil Blundell (8):
=20=20prelink: remove dependency on transfig-native
=20=20busybox: sync do_install() with oe master (mostly)
=20=20binconfig: improve handling of empty prefixes
=20=20rootfs_ipk: delete opkg metadata if package management not required =
and all=20
=20=20rpm: avoid dependency on perl and python for -native build
=20=20dbus: avoid dependency on x11 for -native build
=20=20eglibc: fix mispackaging of libcidn
=20=20libc-package: fix typo causing annoying diagnostic

Richard  Purdie (1):
=20=20allarch.bbclass: A "all" TARGET_ARCH is dangerous as an OVERRIDE

Richard Purdie (3):
=20=20Improve handling of 'all' architecture recipes and their interaction =
with ss
=20=20sysvinit: Mark as machine specific since there are machine specific =
componen
=20=20gettext: Add DEPENDS on git-native

Saul Wold (26):
=20=20less: update to 443
=20=20sysstat: update to 10.0.0
=20=20tzdata: update to 2011g
=20=20libmad: add Upstream-Status
=20=20mpeg2dev: add Upstream-Status
=20=20newt: add Upstream-Status
=20=20util-linux: update to 2.19.1
=20=20glew: update to 1.6.0
=20=20gettext: Update to 0.18.1.1
=20=20gobject-introspection: Update to 0.10.8 Git
=20=20dtc: Cleanup and update recipe
=20=20update-alternatives-dpkg update to 1.16.0.3
=20=20chkconfig: update to 1.3.52
=20=20mailx: update to 12.5
=20=20mc: update to 4.7.5.2
=20=20msmtp: update tof 1.4.24
=20=20gthumb: update to 2.12.3
=20=20alsa-tools: update to 1.0.24.1
=20=20qmmp: update to 0.5.1
=20=20rxvt-unicode: update to 9.11
=20=20gnutls: update to 2.12.5
=20=20distro tracking: updates
=20=20puzzles: Update to 9175
=20=20clutter-1.6: Add patch to update gettext macro version
=20=20gcc: Fix volatile access issue for ARM
=20=20ghostscript: Fix up file locations and add i686

Xiaofeng Yan (1):
=20=20sudo.inc: Add do_install_prepend () to sudo.inc

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Koen Kooi (20):
=20=20systemd: fix postinst so u-a can run offline
=20=20connman: fix systemd packaging
=20=20udev 171: disable cache on systemd setups
=20=20systemd-compat-units: package to fixup the rootfs, shouldn't be =
needed in th
=20=20udev 171: readd modprobe rule to main recipe
=20=20udev-extra-rules: remove modprobe rule, it has moved back to udev
=20=20siteinfo bbclass: sync compat section with oe-core
=20=20siteinfo bbclass: add entry for allarch
=20=20v4l-utils: add 0.8.4 release
=20=20connman: enable service when using systemd
=20=20connman: update to 0.74
=20=20audiofile: import from OE rev 7ae56b81f8cc22f9ef13a48cde000e32138948ea
=20=20libbonobo:  import from OE rev =
7ae56b81f8cc22f9ef13a48cde000e32138948ea
=20=20esound import from OE rev 7ae56b81f8cc22f9ef13a48cde000e32138948ea
=20=20libgnome: import from OE rev 7ae56b81f8cc22f9ef13a48cde000e32138948ea
=20=20libgnomecanvas: import from OE rev =
7ae56b81f8cc22f9ef13a48cde000e32138948ea
=20=20libbonoboui: import from OE rev =
7ae56b81f8cc22f9ef13a48cde000e32138948ea
=20=20libgnomeui: import from OE rev =
7ae56b81f8cc22f9ef13a48cde000e32138948ea
=20=20systemd: bump SRCREV and fix postinst
=20=20systemd-compat-units: disable old style 'networking' script for the =
time bei

Martin Jansa (7):
=20=20xserver-xorg: upgrade from 1.10.1.902 to 1.10.2 and replace part of =
randr-su
=20=20librsvg: replace .bb with smaller .bbappend
=20=20gpsd,tangogps,foxtrotgps,navit: move to new recipes-navigation
=20=20siteinfo: add allarch-linux target
=20=20recipes: use allarch.bbclass instead just PACKAGE_ARCH =3D all
=20=20gobject-introspection: add newer git version compatible with =
glib-2.0_git
=20=20gobject-introspection: move to recipes-gnome to match oe-core =
structure

Otavio Salvador (6):
=20=20freerdp-extension-xpunlimited: bump to fix a cache issue SRCREV
=20=20inih: bump SRCREV
=20=20freerdp: bump SRCREV to 20110530 snapshot
=20=20udev-extra-rules: refactor mount.sh script
=20=20ccid: add 1.4.4 version recipe
=20=20pcsc-lite: rdepends on ccid and drop init script

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Koen Kooi (4):
=20=20systemd-image: tweaks to make first boot succeed
=20=20systemd image: catch up with connman packaging changes
=20=20systemd-image: add netbase for /etc/services
=20=20basefile: add the nordic dots issue.*

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-texasinstruments:

Koen Kooi (7):
=20=20linux-omap 2.6.39: add v5 of mt9p031 support
=20=20linux.inc: fix cortex errata logic
=20=20linux-omap4: add 2.6.35.7, based on L24.13
=20=20linux-omap 2.6.39: add v6 of the MT9P031 sensor support
=20=20linux-omap 2.6.39: add right set of camera patches
=20=20linux-omap 2.6.39: add MFD patch set and refresh other patches
=20=20linux-davinci: fix multi-kernel usage

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

Martin Jansa (9):
=20=20shr: return preferred qt version but set it to 4.7.3
=20=20navit: move to recipes-navigation
=20=20linux-openmoko: use relative path for link to latest kernel
=20=20shr: remove LIBC and PREFERRED_PKG_FORMAT from image name
=20=20recipes: use allarch.bbclass instead just PACKAGE_ARCH =3D all
=20=20shr: prefer newer gobject-introspection
=20=20libgisi: add LEAD_SONAME
=20=20fsogsmd: bump PR to pickup new libgisi name
=20=20shr-image: temporary put opkg directly here, not sure why =
ROOTFS_PKGMANAGE i

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-micro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-slugos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nslu2:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Paul Eggleton (2):
=20=20meta-emenlow: remove obsolete bbappends
=20=20meta-crownbay: tidy up layer configuration

Tom Zanussi (9):
=20=20meta-crownbay: new recipe for emgd 1.6 driver binaries
=20=20meta-intel: add xserver-xf86-dri-lite_1.9.3 to common
=20=20meta-crownbay: add common to BBFILES
=20=20meta-crownbay: update crownbay.conf
=20=20meta-crownbay: remove obsolete graphics recipes
=20=20meta-crownbay: update README with new build instructions.
=20=20meta-intel: update kernel SRCREVs
=20=20meta-fishriver: remove crownbay specifics
=20=20meta-intel: update kernel SRCREVs

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:

Andrea Adami (2):
=20=20kexecboot: move to git rev 698cf7185e013e873aa7df9388a31d857727d408
=20=20kexecboot: update list of configure args in kexecboot.inc

Andreas M=C3=BCller (1):
=20=20utils.bbclass: modify create_wrapper to correctly follow symlinks

Chris Larson (4):
=20=20sourceipk: allow override of the section
=20=20sourceipk: use tar to get the files copied, rather than cp
=20=20sourceipk: deal with compileconfigs only when it exists
=20=20sourceipk: exclude temp dirs when S =3D=3D WORKDIR

Denis 'GNUtoo' Carikli (3):
=20=20base-files: fix nokia900's fstab and bump PR
=20=20shr-image.inc: add support for kexecboot for nokia900
=20=20linux-nokia900-meego: update with lastest source release from meego

Khem Raj (1):
=20=20busybox_1.18.4.bb: Fix checksums of busybox-1.18.4-hush.patch

Klaus Kurzmann (2):
=20=20fsoaudiod_git.bb: enable cmtspeech plugin
=20=20cornucopia.inc: bump FSO_CORNUCOPIA_SRCREV to catch up with newer vala

Koen Kooi (7):
=20=20udev git: bump SRCREV past 171
=20=20udev: add 171
=20=20angstrom: prefer udev 171
=20=20linux-omap 2.6.39: sync with meta-texasinstruments for bootup fixes
=20=20libxaw: fix depchains
=20=20linux-omap4 2.6.35.3: backport fixes from L24.13 kernel in =
meta-texasinstrum
=20=20linux-omap 2.6.39: sync with meta-texasinstruments again

Mario Schuknecht (2):
=20=20linux-libc-headers-2.6.24: add additional tcp ioctl (for hipox =
machine only)
=20=20linux-2.6.24: optimize flash timings (hipox machine only)

Martin Jansa (1):
=20=20xserver-xorg: upgrade from 1.10.1.902 to 1.10.2 and replace part of =
randr-su

Michael 'Mickey' Lauer (2):
=20=20vala[-native]: 0.12.0 -> 0.12.1

Paul Eggleton (22):
=20=20Opie: remove 1.2.4 recipes and obsolete patches
=20=20opie-init: add 1.2.5 version
=20=20opie-sh: add missing opie-sh-path.patch
=20=20contrib/opie/opie_release.sh: handle opie-init
=20=20contrib/opie: add trivial script to find all Opie patches
=20=20opie-vmemo: remove bogus DEPENDS
=20=20opie-recorder: remove bogus DEPENDS
=20=20libqpe-opie: move DEPENDS value to .inc file
=20=20opie-packagemanager: move DEPENDS value to .inc file
=20=20opie-taskbar: tidy up installation of configuration files
=20=20libopie2: tidy up for 1.2.5
=20=20opie-security: move do_install customisations to .inc file
=20=20conf/distro/include: update preferred-opie-* for 1.2.4 removal
=20=20conf/distro: update distro Opie references to 1.2.5
=20=20opie-ftplib: remove legacy staging
=20=20libmailwrapper: remove legacy staging
=20=20opie-lupdate-native: remove legacy staging
=20=20libopie2: remove legacy staging
=20=20qte: remove legacy staging
=20=20h1940: prefer linux 2.6.39, switch to uImage
=20=20linux-2.6.39: add defconfig for h1940
=20=20linux-h1940: drop obsolete linux-h1940 kernels

Paul Menzel (3):
=20=20lynx: correct `LICENSE` from `GPL` to `GPLv2`
=20=20lynx: inherit class `gettext` to fix build with `minimal-uclibc`
=20=20gammu: add `curl` to `DEPENDS`

Simon Busch (3):
=20=20qfsodbusxml2cpp-native: add initial recipe
=20=20aurora: make it suitable for the latest version and bump PR/SRCREV
=20=20aurora: supply QT_DIR_NAME to configure script and bump PR/SRCREV

Stanislav Brabec (7):
=20=20gammu: Upgrade to version 1.29.0 and fix build.
=20=20navit: Update to SVN revision 4503.
=20=20mtkbabel: Upgrade to version 0.8.2.
=20=20lynx: New recipe, version 2.8.7.
=20=20lynx: New recipe, version 2.8.7.
=20=20lynx: Fixed download URL of the latest release.

Steffen Sledz (3):
=20=20iotop: add missing runtime dependency
=20=20linux-2.6.24: disable 2nd SATA port (hipox machine only)
=20=20linux-2.6.24: enable some more kernel debug options (hipox machine =
only)

Thilo Fromm (3):
=20=20linux-2.6.24: fix 1/2-byte read access to PCI config space (hipox =
machine on
=20=20linux-2.6.24: add PCI abort handler (hipox machine only)
=20=20linux-2.6.24: enable some more diagnostic options (hipox machine only)

Tom Rini (5):
=20=20iproute2: Add 2.6.38 version
=20=20lmbench: Obey ranlib
=20=20perl-native: Bump PR
=20=20lmsensors-apps: Various important fixes
=20=20lmbench: Add missing end-quote




