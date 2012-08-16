Received: from new.bec-systems.com ([74.208.70.121] helo=bec-systems.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1T22Q4-00058g-KB; Thu, 16 Aug 2012 17:55:37 +0200
Received: from oh-69-34-21-229.sta.embarqhsd.net ([69.34.21.229]
	helo=happy.bec-systems.com)
	by bec-systems.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cliff.brake@gmail.com>)
	id 1T21Zw-0008FU-Gl; Thu, 16 Aug 2012 11:01:48 -0400
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Date: Thu, 16 Aug 2012 15:07:41 GMT
Message-Id: <1345129661832.d55ecfab@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
X-Spam_score: -2.9
X-Spam_score_int: -28
X-Spam_bar: --
Subject: OE Changelog since 2012-08-05 until 2012-08-12
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
X-List-Received-Date: Thu, 16 Aug 2012 15:55:37 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2012-08-05 until 2012-08-12.  Projects included in this =
report:

bitbake: git://git.openembedded.org/bitbake
openembedded-core: git://git.openembedded.org/openembedded-core
meta-openembedded: git://git.openembedded.org/meta-openembedded
meta-yocto: git://git.yoctoproject.org/poky
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
meta-gumstix: git://gitorious.org/schnitzeltony-oe-meta/meta-gumstix.git
meta-ettus: http://github.com/koenkooi/meta-ettus.git
meta-fsl-ppc: git://git.yoctoproject.org/meta-fsl-ppc
meta-igep: http://github.com/ebutera/meta-igep.git
meta-netbookpro: git://github.com/tworaz/meta-netbookpro
meta-xilinx: git://git.yoctoproject.org/meta-xilinx
meta-chicken: git://github.com/OSSystems/meta-chicken
meta-java: git://github.com/woglinde/meta-java
meta-qt3: git://git.yoctoproject.org/meta-qt3
meta-telephony: git://gitorious.org/sysmocom-openembedded/meta-telephony.git
meta-eldk: git://git.denx.de/eldk.git
meta-ti: git://git.yoctoproject.org/meta-ti
meta-angstrom: git://github.com/Angstrom-distribution/meta-angstrom.git
meta-browser: git://github.com/OSSystems/meta-browser.git
meta-mono: git://git.yoctoproject.org/meta-mono.git
meta-raspberrypi: git://github.com/djwillis/meta-raspberrypi.git
meta-kde: git://gitorious.org/openembedded-core-layers/meta-kde.git

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for bitbake:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Andy Ross (1):
=20=20iputils: Break libsysfs dependency

Bogdan Marinescu (2):
=20=20bison: updated to 2.5.1
=20=20subversion: Add missing build dependency on sqlite3

Damien Lespiau (2):
=20=20mesa: Update to 8.0.4 (latest stable version)
=20=20mesa: Use 'require' instead of 'include'

Darren Hart (1):
=20=20linux-yocto-custom: Clarify usage and clear COMPATIBLE_MACHINE

Franklin S Cooper Jr (1):
=20=20psplash: Update to latest psplash version

Jackie Huang (2):
=20=20tcl: Add ${bindir_crossscripts}/tclConfig.sh to sysroot stage
=20=20python: Fix to support the python module _bsddb built with db 5.3

Javier Martinez Canillas (25):
=20=20xinetd: use ${sbindir} and ${sysconfdir} instead of /usr/sbin and /etc
=20=20alsa-state: use ${sbindir} instead of /usr/sbin for packaging
=20=20lsbsetup: use ${bindir} instead of /usr/bin for packaging
=20=20sudo: use ${bindir} and ${sysconfdir} instead of /usr/bin and /etc
=20=20lsbtest: use ${bindir} instead of /usr/bin for packaging
=20=20cronie: use variables instead of hardcoded paths
=20=20useradd-example: use ${datadir} instead of /usr/share for packaging
=20=20ubootchart: use variables instead of hardcoded paths
=20=20xkeyboard-config: use ${datadir} instead of /usr/share for packaging
=20=20systemtap: use ${datadir} instead of /usr/share for packaging
=20=20mingetty: use ${base_sbindir} instead of /sbin for packaging
=20=20openssh: use ${localstatedir} instead of /var for packaging
=20=20libpam: use ${localstatedir} and ${sysconfdir} instead of /var and =
/etc
=20=20x11-common: use ${sysconfdir} instead of /etc for packaging
=20=20builder: use ${sysconfdir} instead of /etc for packaging
=20=20xserver-nodm-init: use ${sysconfdir} instead of /etc for packaging
=20=20qemu-config: use ${sysconfdir} instead of /etc for packaging
=20=20chkconfig: use ${sysconfdir} instead of /etc for packaging
=20=20man: use ${sysconfdir} instead of /etc for packaging
=20=20rsync: use ${sysconfdir} instead of /etc for packaging
=20=20lsbinitscripts: use ${sysconfdir} instead of /etc for packaging
=20=20usbinit: use ${sysconfdir} instead of /etc for packaging
=20=20lsb: use ${base_bindir} and ${sysconfdir} instead of /bin and /etc
=20=20kernel.bbclass: use ${base_libdir} and ${sysconfdir} instead of /lib =
and /et
=20=20linux-firware: use ${base_libdir} instead of /lib for packaging

Jesse Zhang (1):
=20=20image-mklibs: pass correct libdir to mklibs

Khem Raj (3):
=20=20populate_sdk_rpm.bbclass: Depend do_populate_sdk task on =
createrepo-native
=20=20glib-2.0-nativesdk: Add dependency on glib-2.0-native
=20=20binutils: Enable threaded linking with gold

Marcin Juszkiewicz (1):
=20=20libpam: disable NIS to not link with libtirpc when it is available

Martin Jansa (4):
=20=20qt4-native: fix creating /include directory in build host root
=20=20bitbake.conf: exclude whole MACHINEOVERRIDES from OVERRIDES vardeps
=20=20eglibc-locale: bump PR after fc4b138948656d482603b80f8c8e86fdbb185df4
=20=20curl: disable ldap/ldaps explicitly

Paul Eggleton (9):
=20=20classes/buildhistory: remove obsolete flat package history feature
=20=20classes/buildhistory: ensure old package info is removed
=20=20classes/buildhistory: remove unused functions
=20=20classes/buildhistory: save preinst/postinst/prerm/postrm
=20=20classes/buildhistory: record PKG/PKGE/PKGV/PKGR
=20=20buildhistory_analysis: tidy up duplicate split_version function
=20=20buildhistory_analysis: ignore removal of self-dependencies
=20=20classes/buildhistory: save metadata revisions
=20=20classes/package: don't make locale pkgs depend on PN pkg if not in =
PACKAGES

Radu Moisan (2):
=20=20atk: package update 2.2 -> 2.4
=20=20babeltrace: Update to upstream stable versrion 0.12

Richard Purdie (14):
=20=20gcc-cross-initial: Ensure it uses an isolated sysroot
=20=20at: Use variables from the environment to override the makefile =
defaults
=20=20gdb-cross: Explicitly disable python
=20=20kernelshark: Inherit pythonnative
=20=20kernel.bbclass: Revert ${base_libdir} change
=20=20Revert "linux-firware: use ${base_libdir} instead of /lib for =
packaging"
=20=20linux-firmware: Ensure PR goes forward, not backwards after the revert
=20=20linux-yocto-3.4: Disable extra slang header search path
=20=20python: Fix RPATH QA issue on non-gplv3 builds
=20=20gcc: Disable use of sdt.h header
=20=20package-index: Remove the python hack, its not needed after the =
pythonnative
=20=20linux-yocto-3.0: Apply slang workaround fixing perf builds to 3.0 =
kernels to
=20=20linux-yocto-3.2: Apply slang workaround fixing perf builds to 3.2 =
kernels to
=20=20automake: Fix version reference in path substitutions

Ross Burton (8):
=20=20mesa: no need to depend on python-native, the class does that
=20=20mesa: format the packages list nicely
=20=20mesa: move glu.pc to libglu-dev
=20=20mesa: add --enable-shared-glapi, and package it in libglapi
=20=20mesa: enable the Graphic Buffer Manager library
=20=20gthumb: fix parallel build problems
=20=20buildhistory: correctly handle reductions of numeric fields
=20=20buildhistory: reduce the numeric delta to 10%

Roy.Li (1):
=20=20busybox: fix du-k-works test case

Saul Wold (1):
=20=20foomatic: fix perl path for target

Wenzong Fan (1):
=20=20gdk-pixbuf: fix parallel install issue

Xin Ouyang (1):
=20=20findutils-4.4.2: add bison-native to DEPENDS

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Andreas M=C3=BCller (2):
=20=20systemd-systemctl-native: handle ALIAS tag
=20=20gdm: replace 'WantedBy=3Dgraphical.target' by =
'Alias=3Ddisplay-manager.service'

Franklin Cooper Jr (1):
=20=20ltrace: Fix make error

Gary Thomas (2):
=20=20media-ctl: Fix build with latest automake
=20=20libxml++: New recipe - C++ bindings for libxml

Horia Geanta (1):
=20=20strongswan: upgrade to version 5.0.0

Khem Raj (6):
=20=20gitpkgv.bbclass: Add a symlink from meta-oe
=20=20testlab.bbclass: Delete
=20=20systemd: Upgrade to 187 tag
=20=20busybox: stopping systemd-kmsg-syslogd is not needed
=20=20busybox-syslog.service.in: Create alias for syslog.service
=20=20systemd: Use cross cpp

Koen Kooi (4):
=20=20orc: update to 0.4.16
=20=20nodejs: update to 0.6.20
=20=20fuse: update to 2.9.1
=20=20sox: add 14.4.0

Martin Ertsaas (1):
=20=20cpufrequtils: Use CC, LD etc. that comes from OE.

Martin Jansa (14):
=20=20fbreader: drop machine overrides
=20=20emacs: rename TUTORIAL.ko to TUTORIAL.KO so it's not picked by =
package.bbcla
=20=20emacs: copy only needed stuff to qemu-treedir, not whole sysroot
=20=20phonet-utils: simplify with inherit autotools
=20=20sip: import from oe-classic and upgrade to latest
=20=20python-sip: import from oe-classic and upgrade to latest
=20=20python-pyqt: import from oe-classic
=20=20anki: import from oe-classic
=20=20systemd-compat-units: move list of disabled services to variable, fix =
hwcloc
=20=20mplayer2: enable speex
=20=20php: inherit pythonnative
=20=20php: add build-defs.h to SSTATE_SCAN_FILES it defines path to sysroot =
where=20
=20=20systemd-compat-units: use systemctl mask
=20=20systemd-systemctl-native: extend systemctl wrapper to support mask =
action

Otavio Salvador (4):
=20=20libxaw: Fix libxaw-dev to not depends on non-existent libxaw package
=20=20tiobench: fix aligned allocation method clash with newer glibc
=20=20postgresql: Fix redundant rpath for '/usr/lib'
=20=20postgresql: Fix packaging of static libraries

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Andy Ross (1):
=20=20iputils: Break libsysfs dependency

Bogdan Marinescu (2):
=20=20bison: updated to 2.5.1
=20=20subversion: Add missing build dependency on sqlite3

Damien Lespiau (2):
=20=20mesa: Update to 8.0.4 (latest stable version)
=20=20mesa: Use 'require' instead of 'include'

Darren Hart (1):
=20=20linux-yocto-custom: Clarify usage and clear COMPATIBLE_MACHINE

Franklin S Cooper Jr (1):
=20=20psplash: Update to latest psplash version

Jackie Huang (2):
=20=20tcl: Add ${bindir_crossscripts}/tclConfig.sh to sysroot stage
=20=20python: Fix to support the python module _bsddb built with db 5.3

Javier Martinez Canillas (25):
=20=20xinetd: use ${sbindir} and ${sysconfdir} instead of /usr/sbin and /etc
=20=20alsa-state: use ${sbindir} instead of /usr/sbin for packaging
=20=20lsbsetup: use ${bindir} instead of /usr/bin for packaging
=20=20sudo: use ${bindir} and ${sysconfdir} instead of /usr/bin and /etc
=20=20lsbtest: use ${bindir} instead of /usr/bin for packaging
=20=20cronie: use variables instead of hardcoded paths
=20=20useradd-example: use ${datadir} instead of /usr/share for packaging
=20=20ubootchart: use variables instead of hardcoded paths
=20=20xkeyboard-config: use ${datadir} instead of /usr/share for packaging
=20=20systemtap: use ${datadir} instead of /usr/share for packaging
=20=20mingetty: use ${base_sbindir} instead of /sbin for packaging
=20=20openssh: use ${localstatedir} instead of /var for packaging
=20=20libpam: use ${localstatedir} and ${sysconfdir} instead of /var and =
/etc
=20=20x11-common: use ${sysconfdir} instead of /etc for packaging
=20=20builder: use ${sysconfdir} instead of /etc for packaging
=20=20xserver-nodm-init: use ${sysconfdir} instead of /etc for packaging
=20=20qemu-config: use ${sysconfdir} instead of /etc for packaging
=20=20chkconfig: use ${sysconfdir} instead of /etc for packaging
=20=20man: use ${sysconfdir} instead of /etc for packaging
=20=20rsync: use ${sysconfdir} instead of /etc for packaging
=20=20lsbinitscripts: use ${sysconfdir} instead of /etc for packaging
=20=20usbinit: use ${sysconfdir} instead of /etc for packaging
=20=20lsb: use ${base_bindir} and ${sysconfdir} instead of /bin and /etc
=20=20kernel.bbclass: use ${base_libdir} and ${sysconfdir} instead of /lib =
and /et
=20=20linux-firware: use ${base_libdir} instead of /lib for packaging

Jesse Zhang (1):
=20=20image-mklibs: pass correct libdir to mklibs

Khem Raj (3):
=20=20populate_sdk_rpm.bbclass: Depend do_populate_sdk task on =
createrepo-native
=20=20glib-2.0-nativesdk: Add dependency on glib-2.0-native
=20=20binutils: Enable threaded linking with gold

Marcin Juszkiewicz (1):
=20=20libpam: disable NIS to not link with libtirpc when it is available

Martin Jansa (4):
=20=20qt4-native: fix creating /include directory in build host root
=20=20bitbake.conf: exclude whole MACHINEOVERRIDES from OVERRIDES vardeps
=20=20eglibc-locale: bump PR after fc4b138948656d482603b80f8c8e86fdbb185df4
=20=20curl: disable ldap/ldaps explicitly

Paul Eggleton (9):
=20=20classes/buildhistory: remove obsolete flat package history feature
=20=20classes/buildhistory: ensure old package info is removed
=20=20classes/buildhistory: remove unused functions
=20=20classes/buildhistory: save preinst/postinst/prerm/postrm
=20=20classes/buildhistory: record PKG/PKGE/PKGV/PKGR
=20=20buildhistory_analysis: tidy up duplicate split_version function
=20=20buildhistory_analysis: ignore removal of self-dependencies
=20=20classes/buildhistory: save metadata revisions
=20=20classes/package: don't make locale pkgs depend on PN pkg if not in =
PACKAGES

Radu Moisan (2):
=20=20atk: package update 2.2 -> 2.4
=20=20babeltrace: Update to upstream stable versrion 0.12

Richard Purdie (15):
=20=20gcc-cross-initial: Ensure it uses an isolated sysroot
=20=20at: Use variables from the environment to override the makefile =
defaults
=20=20mesa: 7.11 -> 8.0.4
=20=20gdb-cross: Explicitly disable python
=20=20kernelshark: Inherit pythonnative
=20=20kernel.bbclass: Revert ${base_libdir} change
=20=20Revert "linux-firware: use ${base_libdir} instead of /lib for =
packaging"
=20=20linux-firmware: Ensure PR goes forward, not backwards after the revert
=20=20linux-yocto-3.4: Disable extra slang header search path
=20=20python: Fix RPATH QA issue on non-gplv3 builds
=20=20gcc: Disable use of sdt.h header
=20=20package-index: Remove the python hack, its not needed after the =
pythonnative
=20=20linux-yocto-3.0: Apply slang workaround fixing perf builds to 3.0 =
kernels to
=20=20linux-yocto-3.2: Apply slang workaround fixing perf builds to 3.2 =
kernels to
=20=20automake: Fix version reference in path substitutions

Ross Burton (8):
=20=20mesa: no need to depend on python-native, the class does that
=20=20mesa: format the packages list nicely
=20=20mesa: move glu.pc to libglu-dev
=20=20mesa: add --enable-shared-glapi, and package it in libglapi
=20=20mesa: enable the Graphic Buffer Manager library
=20=20gthumb: fix parallel build problems
=20=20buildhistory: correctly handle reductions of numeric fields
=20=20buildhistory: reduce the numeric delta to 10%

Roy.Li (1):
=20=20busybox: fix du-k-works test case

Saul Wold (1):
=20=20foomatic: fix perl path for target

Wenzong Fan (1):
=20=20gdk-pixbuf: fix parallel install issue

Xin Ouyang (1):
=20=20findutils-4.4.2: add bison-native to DEPENDS

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

Denis 'GNUtoo' Carikli (1):
=20=20meta-shr: 3rdparty: add ubx-utils uttilites for the om-gta02 machine.

Martin Jansa (14):
=20=20meta-shr: systemd-compat-units: simplify
=20=20mesa: drop glamo patch
=20=20meta-smartphone: kernel recipes using MACHINE_KERNEL_PR now need to =
inherith
=20=20meta-shr, meta-openmoko: rename gpsd bbappends
=20=20shr-e-gadgets: bump PR after enlightenment upgrade
=20=20libphone-ui-shr: update for new elm APIs
=20=20shr-wizard: bump SRCREV to fix compatibility with python-elementary =
r71083 a
=20=20shr-wizard: bump SRCREV to fix compatibility with python-elementary =
r65604 a
=20=20shr-settings: bump SRCREV for newer EFL and remove now unneeded =
do_configure
=20=20meta-shr: libphone-ui-shr: fix runtime issues in phoneuid after =
EFL_SRCREV r
=20=20elsa: rename to entrance
=20=20libphone-ui-shr: bump SRCREV and drop local patches

Simon Busch (5):
=20=20meta-samsung: samsung-modem-mgr: add initial recipe
=20=20meta-samsung: netbase: add specific network interface configuration =
for cres
=20=20Initial creation of the meta-android layer
=20=20Move all android specific recipes from meta-fso to meta-android
=20=20meta-fso: drop android utilities from fso-autorev.inc

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-micro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-slugos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nslu2:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Kishore Bodke (3):
=20=20meta-romley: Move Matrox MGA Xorg driver to meta-intel/common
=20=20meta-intel:Add a MATROX MGA variable to ia32-base.inc
=20=20meta-romley: Add Matrox MGA variable to romley.conf

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-handheld:

Andrea Adami (1):
=20=20zaurus: fix jffs2 and ubifs images for collie

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-opie:

Paul Eggleton (9):
=20=20snes9x: remove X11-based recipe
=20=20snes9x-sdl-qpe: use FILESEXTRAPATHS instead of FILESPATHPKG
=20=20kaffe: add missing patch from OE-Classic
=20=20libsdl-qpe: add missing patches from OE-Classic
=20=20gnuplot: remove
=20=20opie-taskbar-images: allow re-exec of do_install
=20=20libetpan: remove
=20=20opie-sysinfo: split out machine-specific images
=20=20task-opie-16mb: use 240x320 not 320x240 images

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-bug:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-efikamx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix:

Andreas M=C3=BCller (4):
=20=20linux-omap: defonfig add WLAN USB chips and add debug for libertas
=20=20linux-omap: defconfig compile UBIFS into kernel
=20=20linux-omap: fix ADS7846 init fault
=20=20linux-omap: update to v3.5

Samuel Stirtzel (1):
=20=20overo.inc: Use the linux-firmware-sd8686 instead of =
marvell-sdio-fw_9.70.3-p

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ettus:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-ppc:

Matthew McClintock (2):
=20=20u-boot: change UBOOT_MACHINES to use ?=3D so they can be overridden
=20=20update preferred version for linux kernel

Zhenhua Luo (2):
=20=20fsl-image-lsb-sdk.bb: replace POKY_BASE_INSTALL with =
CORE_IMAGE_BASE_INSTALL
=20=20add NOR u-boot into the default build list of p1010rdb

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-igep:

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
Changelog for meta-eldk:

Andy Ross (1):
=20=20iputils: Break libsysfs dependency

Bogdan Marinescu (2):
=20=20bison: updated to 2.5.1
=20=20subversion: Add missing build dependency on sqlite3

Damien Lespiau (2):
=20=20mesa: Update to 8.0.4 (latest stable version)
=20=20mesa: Use 'require' instead of 'include'

Darren Hart (1):
=20=20linux-yocto-custom: Clarify usage and clear COMPATIBLE_MACHINE

Franklin S Cooper Jr (1):
=20=20psplash: Update to latest psplash version

Jackie Huang (2):
=20=20tcl: Add ${bindir_crossscripts}/tclConfig.sh to sysroot stage
=20=20python: Fix to support the python module _bsddb built with db 5.3

Javier Martinez Canillas (25):
=20=20xinetd: use ${sbindir} and ${sysconfdir} instead of /usr/sbin and /etc
=20=20alsa-state: use ${sbindir} instead of /usr/sbin for packaging
=20=20lsbsetup: use ${bindir} instead of /usr/bin for packaging
=20=20sudo: use ${bindir} and ${sysconfdir} instead of /usr/bin and /etc
=20=20lsbtest: use ${bindir} instead of /usr/bin for packaging
=20=20cronie: use variables instead of hardcoded paths
=20=20useradd-example: use ${datadir} instead of /usr/share for packaging
=20=20ubootchart: use variables instead of hardcoded paths
=20=20xkeyboard-config: use ${datadir} instead of /usr/share for packaging
=20=20systemtap: use ${datadir} instead of /usr/share for packaging
=20=20mingetty: use ${base_sbindir} instead of /sbin for packaging
=20=20openssh: use ${localstatedir} instead of /var for packaging
=20=20libpam: use ${localstatedir} and ${sysconfdir} instead of /var and =
/etc
=20=20x11-common: use ${sysconfdir} instead of /etc for packaging
=20=20builder: use ${sysconfdir} instead of /etc for packaging
=20=20xserver-nodm-init: use ${sysconfdir} instead of /etc for packaging
=20=20qemu-config: use ${sysconfdir} instead of /etc for packaging
=20=20chkconfig: use ${sysconfdir} instead of /etc for packaging
=20=20man: use ${sysconfdir} instead of /etc for packaging
=20=20rsync: use ${sysconfdir} instead of /etc for packaging
=20=20lsbinitscripts: use ${sysconfdir} instead of /etc for packaging
=20=20usbinit: use ${sysconfdir} instead of /etc for packaging
=20=20lsb: use ${base_bindir} and ${sysconfdir} instead of /bin and /etc
=20=20kernel.bbclass: use ${base_libdir} and ${sysconfdir} instead of /lib =
and /et
=20=20linux-firware: use ${base_libdir} instead of /lib for packaging

Jesse Zhang (1):
=20=20image-mklibs: pass correct libdir to mklibs

Khem Raj (3):
=20=20populate_sdk_rpm.bbclass: Depend do_populate_sdk task on =
createrepo-native
=20=20glib-2.0-nativesdk: Add dependency on glib-2.0-native
=20=20binutils: Enable threaded linking with gold

Marcin Juszkiewicz (1):
=20=20libpam: disable NIS to not link with libtirpc when it is available

Martin Jansa (4):
=20=20qt4-native: fix creating /include directory in build host root
=20=20bitbake.conf: exclude whole MACHINEOVERRIDES from OVERRIDES vardeps
=20=20eglibc-locale: bump PR after fc4b138948656d482603b80f8c8e86fdbb185df4
=20=20curl: disable ldap/ldaps explicitly

Paul Eggleton (9):
=20=20classes/buildhistory: remove obsolete flat package history feature
=20=20classes/buildhistory: ensure old package info is removed
=20=20classes/buildhistory: remove unused functions
=20=20classes/buildhistory: save preinst/postinst/prerm/postrm
=20=20classes/buildhistory: record PKG/PKGE/PKGV/PKGR
=20=20buildhistory_analysis: tidy up duplicate split_version function
=20=20buildhistory_analysis: ignore removal of self-dependencies
=20=20classes/buildhistory: save metadata revisions
=20=20classes/package: don't make locale pkgs depend on PN pkg if not in =
PACKAGES

Radu Moisan (2):
=20=20atk: package update 2.2 -> 2.4
=20=20babeltrace: Update to upstream stable versrion 0.12

Richard Purdie (15):
=20=20gcc-cross-initial: Ensure it uses an isolated sysroot
=20=20at: Use variables from the environment to override the makefile =
defaults
=20=20mesa: 7.11 -> 8.0.4
=20=20gdb-cross: Explicitly disable python
=20=20kernelshark: Inherit pythonnative
=20=20kernel.bbclass: Revert ${base_libdir} change
=20=20Revert "linux-firware: use ${base_libdir} instead of /lib for =
packaging"
=20=20linux-firmware: Ensure PR goes forward, not backwards after the revert
=20=20linux-yocto-3.4: Disable extra slang header search path
=20=20python: Fix RPATH QA issue on non-gplv3 builds
=20=20gcc: Disable use of sdt.h header
=20=20package-index: Remove the python hack, its not needed after the =
pythonnative
=20=20linux-yocto-3.0: Apply slang workaround fixing perf builds to 3.0 =
kernels to
=20=20linux-yocto-3.2: Apply slang workaround fixing perf builds to 3.2 =
kernels to
=20=20automake: Fix version reference in path substitutions

Ross Burton (8):
=20=20mesa: no need to depend on python-native, the class does that
=20=20mesa: format the packages list nicely
=20=20mesa: move glu.pc to libglu-dev
=20=20mesa: add --enable-shared-glapi, and package it in libglapi
=20=20mesa: enable the Graphic Buffer Manager library
=20=20gthumb: fix parallel build problems
=20=20buildhistory: correctly handle reductions of numeric fields
=20=20buildhistory: reduce the numeric delta to 10%

Roy.Li (1):
=20=20busybox: fix du-k-works test case

Saul Wold (1):
=20=20foomatic: fix perl path for target

Wenzong Fan (1):
=20=20gdk-pixbuf: fix parallel install issue

Xin Ouyang (1):
=20=20findutils-4.4.2: add bison-native to DEPENDS

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

Andreas M=C3=BCller (1):
=20=20ti-dmai.inc: fix 'proto=3D'-warning on recipe parsing

Koen Kooi (1):
=20=20u-boot 2011.09+git: update to latest version of Tom Rini's tree

Roger Monk (3):
=20=20gstreamer-ti: convert proto to protocol in SRC_URI
=20=20am-sysinfo: switch 'proto' to 'protocol' in SRC_URI
=20=20u-boot_2011.09[.10rc]: Always use gnu ld for LD

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-browser:

Martin Jansa (2):
=20=20chromium-20: add unistd.patch which was used in 19*
=20=20mozilla: disable elf-hack

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-mono:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-raspberrypi:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-kde:

Samuel Stirtzel (10):
=20=20task-kde-image: Remove redundant entry shared-mime-info
=20=20kdelibs4: Update to 4.9.0
=20=20kdelibs4-native: Update to 4.9.0
=20=20kde-runtime: Update to 4.9.0
=20=20kde-workspace: Update to 4.9.0
=20=20libkactivities4: Update to 4.9.0
=20=20nepomuk-core: Update to 4.9.0 to fix kde-runtime errors
=20=20plasma-active: Update to 4.9.0 to fix various issues
=20=20angstrom-kde-desktop-image: Temporary remove networkmanager
=20=20Update README




