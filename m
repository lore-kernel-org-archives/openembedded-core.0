Received: from oh-69-34-21-229.sta.embarqhsd.net ([69.34.21.229]
	helo=happy.bec-systems.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1Qx0LH-0003oo-IM; Fri, 26 Aug 2011 19:37:21 +0200
Received: from localhost ([127.0.0.1] helo=happy.bec-systems.com)
	by happy.bec-systems.com with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1Qx0Ga-0006f6-Ob; Fri, 26 Aug 2011 13:32:28 -0400
Date: Fri, 26 Aug 2011 13:32:28 -0400
Message-Id: <E1Qx0Ga-0006f6-Ob@happy.bec-systems.com>
X-Mailer: Nodemailer (0.1.13; +http://www.nodemailer.org)
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org
MIME-Version: 1.0
Subject: OE Changelog for 2011-08-15 to 2011-08-22
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
X-List-Received-Date: Fri, 26 Aug 2011 17:37:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Changelog for 2011-08-15 to 2011-08-22.  Projects included in this report:

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
openembedded: git://git.openembedded.org/openembedded

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for bitbake:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Anders Darander (7):
=20=20qmake_base: add uclibceabi
=20=20connman: use DISTRO_FEATURES to enable wifi and bluetooth
=20=20create-pull-request: increase likelihood of detecting a rename
=20=20ofono: conditionally enable bluetooth
=20=20qt4: allow a reduction in build time
=20=20qemu: modify search paths for libgl
=20=20scripts/runqemu: modify search paths for libgl

Beth Flanagan (1):
=20=20buildstats.bbclass: Fixing task endtime

Bruce Ashfield (3):
=20=20linux-yocto: bump version string to 3.0.1
=20=20qemu: change default kernel to 3.0.x
=20=20linux-yocto: meta SRCREV bump

Darren Hart (1):
=20=20kernel: restore crtsavres.o to enable building external modules on =
powerpc

Dexuan Cui (10):
=20=20bluez-hcidump: upgrade from 2.0 to 2.1
=20=20tcf-agent: add openssl into DEPENDS
=20=20cronie: upgrade from 1.4.7 to 1.4.8
=20=20mdadm: upgrade mdadm from 3.2.1 to 3.2.2
=20=20util-macros: upgrade from 1.14.0 to the latest version 0.15.0
=20=20freetype: upgrade from 2.4.4 to 2.4.6
=20=20xproto: upgrade from 7.0.21 to 7.0.22
=20=20glproto: upgrade from 1.4.13 to 1.4.14
=20=20dri2proto: upgrade from 2.4 to 2.6
=20=20distro_tracking_fields.inc: update the info for the following recipes

Dmitry Eremin-Solenikov (1):
=20=20libxcb: enable native/nativesdk builds as was done previously in =
meta-oe

Dongxiao Xu (10):
=20=20rootfs_rpm: Fix DEFAULTTUNE setting in multilib case
=20=20package_rpm: enhance strip_multilib function
=20=20package_rpm: Fix package rename issue in multilib case
=20=20gtk-icon-cache: Adding MLPREFIX when dynamically set RDEPENDS
=20=20busybox: Change ${PN} to ${BPN} in file names
=20=20sysvinit: Change ${PN} to ${BPN} in file names
=20=20curl: Use BPN instead of PN for style like lib${PN}
=20=20ea-acl: Use BPN instead of PN for style like lib${PN}
=20=20attr: Use BPN instead of PN for style like lib${PN}
=20=20acl: Use BPN instead of PN for style like lib${PN}

Jingdong Lu (1):
=20=20initrdscripts: fix init-live.sh

Joshua Lock (3):
=20=20shadow: switch to a fetchable SRC_URI
=20=20glib-2.0: explicitly disable dtrace and systemtap for native varaint
=20=20bluez4: drop usbpath from DEPENDS

Kang Kai (6):
=20=20at: make at usable for common user
=20=20eglibc: check dependencies among eglibc options
=20=20mailx: update license and distro tracking fileds
=20=20slang: add homepage and update distro tracking fields
=20=20alsa-tools: update license and add distro tracking fields
=20=20newt: update distro tracking fields

Khem Raj (2):
=20=20task-core-tools: Use LTTNGUST variable instead of hardcoding lttng-ust
=20=20gdb: Add lttng-ust to DEPENDS only for eglibc

Lianhao Lu (1):
=20=20package(_ipk).bbclass: opkg using ALL_MULTILIB_PACKAGE_ARCHS

Martin Jansa (2):
=20=20task-core-boot: allow distribution to override default dev_manager =
provider=20
=20=20bluez4: update recipe from meta-oe

Paul Eggleton (2):
=20=20image.bbclass, kernel.bbclass: create warning file about deleting =
deploydir=20
=20=20sanity.bbclass: add optional untested host distro warning

Phil Blundell (3):
=20=20cmake.bbclass, perlnative.bbclass: arrange for cmake to find =
perl-native
=20=20libproxy: remove dependency on X libs
=20=20libxslt: fix packaging of static libraries

Richard Purdie (2):
=20=20libgcc: Remove fetch/unpack/patch noexec stamps
=20=20xcb/libpthreads: Add BBCLASSEXTEND to resolve missing providers in =
world bui

Wenzong Fan (1):
=20=20perl-native: Update find_perl to find the perl wrapper

Zhai Edwin (1):
=20=20qemu: Make qemu buildable inside qemux86/qemuppc target

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Anders Darander (5):
=20=20libx11: skip self if x11 not in DISTRO_FEATURES
=20=20ckermit: import from OE rev 5350bbef01b8979617e3d0fd38939f94f1fa5315
=20=20ckermit: update to version 9.0
=20=20connman: conditionally enable wifi and bluetooth
=20=20ckermit: revert the SRC_URI change

Andrea Adami (2):
=20=20klibc: initial commit of version 1.5.24
=20=20klibc.bbclass: shared include for building against klibc

Joel A Fernandes (1):
=20=20gnome-system-monitor: Add dependency on gnome-icon-theme

Khem Raj (1):
=20=20openssl-1.0.0: Remove spurious comment in recipe

Koen Kooi (7):
=20=20xcb: add missing bbappends
=20=20nodejs 0.4.2: import from OE rev =
e02237d7e46e60fbd9eb4a05a308e6adcf916ebb
=20=20libvpx 0.9.5: import from OE rev =
e02237d7e46e60fbd9eb4a05a308e6adcf916ebb
=20=20libav: enable libvpx
=20=20README: fix typo
=20=20tk 8.5.8: import from OE rev 5350bbef01b8979617e3d0fd38939f94f1fa5315
=20=20xdotool: import from OE rev 5350bbef01b8979617e3d0fd38939f94f1fa5315

Martin Jansa (7):
=20=20openssl-1.0.0d: use openssl.inc from meta-oe
=20=20e-base: bump EFL_SRCREV
=20=20e-wm: remove SHR specific patch
=20=20kexec-tools-klibc: import from meta-zaurus layer
=20=20kexec-tools: add bbappend to keep old packaging with separate kexec =
and kdum
=20=20bluez-hcidump: remove older 2.0
=20=20bluez4: remove from meta-oe, fixed version is now in oe-core

lumag (5):
=20=20binutils-2.20.1: import several patches from Debian
=20=20emprint: add LIC_FILES_CHKSUM
=20=20udisks: add checksums for udisks-1.0.2
=20=20meta-efl/screenshot: add LIC_FILES_CHKSUM
=20=20meta-efl/screenshot: fix building with current gettext/auto*

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Dmitry Eremin-Solenikov (1):
=20=20angstrom-2010: bump glibmm version to 2.28.2

Koen Kooi (1):
=20=20update README

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Anders Darander (7):
=20=20qmake_base: add uclibceabi
=20=20connman: use DISTRO_FEATURES to enable wifi and bluetooth
=20=20create-pull-request: increase likelihood of detecting a rename
=20=20ofono: conditionally enable bluetooth
=20=20qt4: allow a reduction in build time
=20=20qemu: modify search paths for libgl
=20=20scripts/runqemu: modify search paths for libgl

Beth Flanagan (1):
=20=20buildstats.bbclass: Fixing task endtime

Bruce Ashfield (3):
=20=20linux-yocto: bump version string to 3.0.1
=20=20qemu: change default kernel to 3.0.x
=20=20linux-yocto: meta SRCREV bump

Darren Hart (3):
=20=20kernel: restore crtsavres.o to enable building external modules on =
powerpc
=20=20meta-yocto: allow for virtual/kernel override
=20=20meta-yocto: add linux-yocto-rt support for all meta-yocto machines

Dexuan Cui (10):
=20=20bluez-hcidump: upgrade from 2.0 to 2.1
=20=20tcf-agent: add openssl into DEPENDS
=20=20cronie: upgrade from 1.4.7 to 1.4.8
=20=20mdadm: upgrade mdadm from 3.2.1 to 3.2.2
=20=20util-macros: upgrade from 1.14.0 to the latest version 0.15.0
=20=20freetype: upgrade from 2.4.4 to 2.4.6
=20=20xproto: upgrade from 7.0.21 to 7.0.22
=20=20glproto: upgrade from 1.4.13 to 1.4.14
=20=20dri2proto: upgrade from 2.4 to 2.6
=20=20distro_tracking_fields.inc: update the info for the following recipes

Dmitry Eremin-Solenikov (1):
=20=20libxcb: enable native/nativesdk builds as was done previously in =
meta-oe

Dongxiao Xu (10):
=20=20rootfs_rpm: Fix DEFAULTTUNE setting in multilib case
=20=20package_rpm: enhance strip_multilib function
=20=20package_rpm: Fix package rename issue in multilib case
=20=20gtk-icon-cache: Adding MLPREFIX when dynamically set RDEPENDS
=20=20busybox: Change ${PN} to ${BPN} in file names
=20=20sysvinit: Change ${PN} to ${BPN} in file names
=20=20curl: Use BPN instead of PN for style like lib${PN}
=20=20ea-acl: Use BPN instead of PN for style like lib${PN}
=20=20attr: Use BPN instead of PN for style like lib${PN}
=20=20acl: Use BPN instead of PN for style like lib${PN}

Jiajun Xu (1):
=20=20poky.conf: add flag opengl into DISTRO_FEATURES

Jingdong Lu (1):
=20=20initrdscripts: fix init-live.sh

Joshua Lock (3):
=20=20shadow: switch to a fetchable SRC_URI
=20=20glib-2.0: explicitly disable dtrace and systemtap for native varaint
=20=20bluez4: drop usbpath from DEPENDS

Kang Kai (6):
=20=20at: make at usable for common user
=20=20eglibc: check dependencies among eglibc options
=20=20mailx: update license and distro tracking fileds
=20=20slang: add homepage and update distro tracking fields
=20=20alsa-tools: update license and add distro tracking fields
=20=20newt: update distro tracking fields

Khem Raj (2):
=20=20task-core-tools: Use LTTNGUST variable instead of hardcoding lttng-ust
=20=20gdb: Add lttng-ust to DEPENDS only for eglibc

Lianhao Lu (1):
=20=20package(_ipk).bbclass: opkg using ALL_MULTILIB_PACKAGE_ARCHS

Martin Jansa (2):
=20=20task-core-boot: allow distribution to override default dev_manager =
provider=20
=20=20bluez4: update recipe from meta-oe

Paul Eggleton (2):
=20=20image.bbclass, kernel.bbclass: create warning file about deleting =
deploydir=20
=20=20sanity.bbclass: add optional untested host distro warning

Phil Blundell (3):
=20=20cmake.bbclass, perlnative.bbclass: arrange for cmake to find =
perl-native
=20=20libproxy: remove dependency on X libs
=20=20libxslt: fix packaging of static libraries

Richard Purdie (2):
=20=20libgcc: Remove fetch/unpack/patch noexec stamps
=20=20xcb/libpthreads: Add BBCLASSEXTEND to resolve missing providers in =
world bui

Scott Rifenbark (10):
=20=20documentation/dev-manual/dev-manual.xml: updated note for latest =
documentati
=20=20documentation: updated the note in the front matter to use a link =
specific t
=20=20documentation/dev-manual/dev-manual-kernel-appendix.xml: Added kernel =
reconf
=20=20documentation/dev-manual/dev-manual-bsp-appendix.xml: Corrected the =
SRCREV s
=20=20documentation/dev-manual/dev-manual-newbie.xml: added picture for =
newbie Git
=20=20documentation/Makefile: added git-workflow.png and =
kernel-dev-flow-png to ta
=20=20documentation/adt-manual/adt-prepare.xml: edit pass for new =
termninology
=20=20documentation/adt-manual/adt-package.xml: Minor edits
=20=20documentation/adt-manual/adt-eclipse.xml: general edits and =
formatting.
=20=20documentation/adt-manual/adt-command.xml: general edits.

Wenzong Fan (1):
=20=20perl-native: Update find_perl to find the perl wrapper

Zhai Edwin (1):
=20=20qemu: Make qemu buildable inside qemux86/qemuppc target

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-texasinstruments:

Denys Dmytriyenko (2):
=20=20linux-omapl138: import 2.6.37 PSP kernel from Arago
=20=20am180x-evm: add config for AM180x machine

Enrico Butera (10):
=20=20import codec engine and dependencies from oe classic
=20=20xdctools: remove broken version
=20=20xdctools: remove broken version
=20=20ti devtools: fix LIC_FILES_CHKSUM
=20=20xdctools: fix toolchain hardcoded paths
=20=20ti-dsplink: fix module packaging
=20=20ti-codecs-omap3530: disable c6accel, build fix, add LIC_FILES_CHKSUM
=20=20dmai: fix build and update omap3 srcrev to 642
=20=20gstreamer-ti: import from oe classic and fix build
=20=20gstreamer-ti: bump srcrev to fix runtime error, build fix

Koen Kooi (19):
=20=20linux 3.1rc: bump to rc2
=20=20linux-davinci: clean up contents a bit
=20=20linux-davinci: remove obsolete patches
=20=20dmai: move into a seperate dir
=20=20ti-cgt6x: move license checksum to recipe
=20=20dmai: don't break parsing for machines that don't set SRCREV_pn-dmai
=20=20c6accel: move to a seperate dir
=20=20ti-c6accel: fix patch
=20=20ti-codec-engine: fix -dbg packaging
=20=20ti-c6accel: add license checksum
=20=20c6accel: fix toolchain path
=20=20c6accel: fix LINUXLIBS_INSTALL_DIR
=20=20c6accel: update to 1.0.1.00.06
=20=20TI recipes: only use PACKAGE_ARCH =3D "${MACHINE_ARCH}" where needed
=20=20ti-linux-utils: ensure fixdep exists before trying to build modules
=20=20linux-3.0: add support for 'uLCD' expansionboard
=20=20linux-3.0: fixes
=20=20linux-3.0: update to 3.0.3-stable
=20=20ti-linuxutils: use MACHINE_KERNEL_PR

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

Andrea Adami (7):
=20=20linux-kexecboot: fix dependency on lzma-native, nowadays xz is used
=20=20linux-kexecboot.inc: remove unneded dependency
=20=20linux-kexecboot.inc: remove foreign mipsel code
=20=20linux-kexecboot.inc: remove do_savedefconfig task, now in =
kernel.bbclass
=20=20linux(-kexecboot)_2.6.39: add locomo_kbd_tweak-r2 patch
=20=20linux-kexecboot.inc: set debug level according to oe-core
=20=20linux-kexecboot.inc: remove checks for unsupported kernel versions

Martin JaMa Jansa (8):
=20=20SHR: prefer openssl-1.0.0d
=20=20libphone-ui-shr: apply patches upstream and bump SRCREV
=20=20libphone-ui-shr: bump SRCREV
=20=20klibc: remove 1.5.23 and bbclass, moved to meta-oe
=20=20meta-zaurus: update README to list meta-oe dependency
=20=20SHR: set ONLINE_PACKAGE_MANAGEMENT to full like Angstrom does to =
enable test
=20=20SHR: use empty dev_manager provider
=20=20kexec-tools: remove, moved to meta-oe

Martin Jansa (6):
=20=20SHR: stop gpsd-udev from pulling udev to image
=20=20initscripts-shr: remove in favor of initscripts.bbappend
=20=20shr-wizard: move /var/volatile/appshadow creation from initscripts to =
shr-wi
=20=20initscripts: move files from P to PN
=20=20initscripts: use FILESEXTRAPATHS
=20=20shr-wizard: fix volatiles config file name

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-micro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-slugos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nslu2:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Darren Hart (1):
=20=20n450: decouple from meta-yocto atom-pc machine config

Tom Zanussi (4):
=20=20meta-intel: update linux-yocto 3.0 kernel SRCREVs
=20=20meta-intel: change PREFERRED_VERSIONs
=20=20meta-intel: update SRCREVs
=20=20meta-intel: update init-install.sh

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:

Martin JaMa Jansa (1):
=20=20libphone-ui-shr, libphone-ui, libphone-utils, =
e-wm-config-illume2-shr: bump=20

Martin Jansa (1):
=20=20initscripts-shr: PR bump

Paul Menzel (10):
=20=20ckermit: Order meta fields according to style guide [1]
=20=20ckermit: Fix typos in comments
=20=20lightmediascanner: Order fields according to style guide
=20=20lightmediascanner_0.2.0.0: Correct license to LGPLv2.1+ [1][2]
=20=20lightmediascanner: Change author name from Profusion to ProFUSION [1]
=20=20lightmediascanner: Add `HOMEPAGE =3D "http://lms.garage.maemo.org/"`
=20=20lightmediascanner: Add `virtual/libiconv` to `DEPENDS` and add patch =
for `li
=20=20lightmediascanner_0.4.1.0: Use `${S}` instead of =
`${WORKDIR}/${PN}-${PV}`
=20=20lightmediascanner: Add version 0.4.3.0
=20=20lightmediascanner: Remove version 0.2.0.0 and 0.4.1.0

Sylvain 'GarthPS' Par=C3=A9 (1):
=20=20libpng: Upgrade to version 1.2.46 and remove old patch

Sylvain Par=C3=A9 (1):
=20=20initscripts-shr: changed mountdevsubfs.sh to mount /dev/pts after udev




