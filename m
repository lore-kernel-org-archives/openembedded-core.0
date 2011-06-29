Received: from oh-69-34-21-229.sta.embarqhsd.net ([69.34.21.229]
	helo=happy.bec-systems.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1QbvLl-0004mO-TH; Wed, 29 Jun 2011 16:02:42 +0200
Received: from localhost ([127.0.0.1] helo=happy.bec-systems.com)
	by happy.bec-systems.com with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1QbvI9-000453-TO; Wed, 29 Jun 2011 09:58:57 -0400
Date: Wed, 29 Jun 2011 09:58:57 -0400
Message-Id: <E1QbvI9-000453-TO@happy.bec-systems.com>
X-Mailer: Nodemailer (0.1.13; +http://www.nodemailer.org)
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org
MIME-Version: 1.0
Subject: OE Changelog for 2011-06-20 to 2011-06-27
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
X-List-Received-Date: Wed, 29 Jun 2011 14:02:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Changelog for 2011-06-20 to 2011-06-27.  Projects included in this report:

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

Brandon Stafford (1):
=20=20doc/usermanual.xml: Tweaks for the manual

Christopher Larson (2):
=20=20msg: use a simpler enumeration for the domains
=20=20msg: fix domain enum use

Mark Hatle (1):
=20=20runqueue.py: Add umask task control

Scott Garman (1):
=20=20fetch2/git.py: improve error reporting when an invalid protocol is =
used

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Beth Flanagan (1):
=20=20common-licenses: Additions and corrections

Bruce Ashfield (3):
=20=20linux-yocto: update SRCREVs for utrace merge
=20=20linux-yocto: update meta SRCREV for new config groups
=20=20linux-yocto: update meta and yocto/standard SRCREVs

Jiajun Xu (1):
=20=20qemuimagetest: update cvs and iptables to newer version for toolchain =
test

Khem Raj (10):
=20=20gettext-0.18.1.1: Remove unused patches
=20=20uclibc/x86_64/uClibc.machine: Enable ARCH_USE_MMU
=20=20uclibc: Add support for $ORIGIN
=20=20uclibc.inc: libsegfault is only RPROVIDED by uclibc
=20=20binutils_2.21.bb: Fix ld segfault exposed by eglibc 2.14 on x86_64
=20=20eglibc-package.inc: Package newly added sotruss and supporting =
libraries
=20=20eglibc: Upgrade recipes from 2.13 -> 2.14
=20=20tcmode-default.inc: Bump EGLIBCVERSION to 2.14
=20=20gcc-4.6: Switch to using svn SRC_URI for recipe
=20=20tcmode-default.inc: use 4.6 for GCCVERSION and SDKGCCVERSION

Koen Kooi (4):
=20=20gnome-keyring 2.32.1: fix packaging
=20=20glib-2.0 2.28.x: update to 2.28.8
=20=20alsa-utils 1.0.24.2: fix packaging
=20=20kernel.bbclass: restore kernel-abiversion file

Mark Hatle (40):
=20=20tinylogin: Avoid stripped binaries
=20=20boost: Move the do_configure_prepend to a seperate task
=20=20nasm: Fix aclocal
=20=20dropbear: Don't patch in configure
=20=20unzip: Avoid stripping binaries
=20=20db: Avoid stripping binaries
=20=20sysstat: Avoid stripping binaries
=20=20quota: Avoid stripping binaries
=20=20busybox: Avoid stripping binaries
=20=20wireless-tools: Avoid stripping binaries
=20=20libproxy: Add missing debug files
=20=20gtk-sato-engine: Add missing debug files
=20=20gstreamer: Add missing debug files.
=20=20trace-cmd: Add missing debug files
=20=20systemtamp: Add missing debug files
=20=20gthumb: Add missing debug files
=20=20gamin: Add missing debug files to -dbg
=20=20mc: Add missing debug files to -dbg
=20=20python-gst: Add missing files to the -dbg package
=20=20liba52: Remove custom -dbg, fall back to default
=20=20modutils: Add in missing -dbg package
=20=20psmisc: Remove custom -dbg packages, use default
=20=20texinfo: Change to use the standard -dbg file
=20=20libxml-parser-perl: Fix debug package
=20=20python-pyobject: Remove unnecessary -dbg setting
=20=20python: Switch to using the default -dbg package
=20=20classes/package_rpm.bbclass: Enhance diagnostic messages
=20=20sysfsutils: Fall back to default -dbg package
=20=20kernel.bbclass: Add support for perf-dbg package
=20=20perf: Fix linux-tools to ensure perf is installed under "fakeroot"
=20=20classes/package_rpm.bbclass: Change the way the PV is transformed
=20=20native.bbclass: Add a simple chown intercept command
=20=20resolveconf: Fix file owners
=20=20base-passwd: Fix owners/groups
=20=20ghostscript: Fix owner/group of /etc/cups
=20=20libtirpc: Fix owner/group of /etc/netconfig
=20=20tzdata: Ensure all files are owned by root:root
=20=20gnome-doc-utils: Fix the owner/group on select files
=20=20db: Fix file ownership
=20=20python: Add python to the dependency to pygobject

Paul Eggleton (4):
=20=20u-boot: set SRCREV to a git revision instead of a tag reference
=20=20qt4-tools-nativesdk: fix unpack failure due to missing g++.conf
=20=20qt4-tools-nativesdk: drop freetype include as we build with =
-no-freetype
=20=20qt4-tools-nativesdk: fix compile failure in src/dbus

Richard Purdie (4):
=20=20Revert "tcmode-default.inc: Bump EGLIBCVERSION to 2.14"
=20=20Revert "eglibc: Upgrade recipes from 2.13 -> 2.14"
=20=20packagedata.py: Fix read_subpkgdata_dict()
=20=20kernel.bbclass: Stop do_install poking directly into the sysroot and =
evading

Tom Rini (1):
=20=20kernel.bbclass: Stage System.map with KERNEL_VERSION suffix

Xiaofeng Yan (1):
=20=20task-core-lsb: Add absent libraries and commands to task-core-lsb.bb

Zhai Edwin (2):
=20=20gnome-vfs: remove gnome-vfs as it is deprecated in favour of GVFS and =
GIO
=20=20clutter: Use new git repo

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Khem Raj (1):
=20=20gcc-4.6: Change the bbappend to match oe-core changes

Koen Kooi (34):
=20=20sessreg 1.0.6: import from OE rev =
58b79786c6b1ee26340b20e7606d2144f52543ed
=20=20slim: add 1.3.2
=20=20libgsf: update to 1.14.21 and be specific about which features to =
disable
=20=20gnome-menus 2.30.5: remove spurious gnome-vfs dependency
=20=20libgweather: update to 2.30.3
=20=20gdm, gnome-control-center: clean up dependencies
=20=20gnome-panel: update to 2.32.x from the git release branch
=20=20gnome-session: update to 2.32.1
=20=20gnome-settings-daemon: clean up dependencies
=20=20libgnomekbd 2.32.0: clean up dependencies
=20=20gdm: fix build against newer gnome-panel
=20=20gnome-power-manager: libpanel-applets-2 is gone, so disable applets
=20=20dconf 0.5.1: import from OE rev =
58b79786c6b1ee26340b20e7606d2144f52543ed
=20=20kernel.bbclass: restore kernel-abiversion file
=20=20glib-2.0: sync with OE-core
=20=20gnome-settings-daemon 2.32.1: build from stable branch for bugfixes, =
fix dep
=20=20mesa: move PACKAGE_ARCH =3D MACHINE_ARCH to the mesa-dri include
=20=20mesa-dri: sync packaging with OE-core, prepare for further =
PACKAGE_ARCH clea
=20=20gnome-panel 2.32.1: add missing gettext inherit
=20=20lvm2: import from OE rev 58b79786c6b1ee26340b20e7606d2144f52543ed
=20=20gtk+3: add initial 3.0.11 recipe
=20=20dconf: update to 0.7.5
=20=20gnome-desktop 2.32.1: import from OE-core
=20=20gsettings-desktop-schemas: add 3.0.1
=20=20gnome-desktop3: add 3.0.2
=20=20libwnck3: add 3.0.2
=20=20libgweather3: add 3.0.2
=20=20gnome-panel3: add 3.0.2
=20=20libnotify3: add 0.7.3
=20=20nautilus3: add 3.0.2
=20=20nautilus 2.32.2: fix packaging
=20=20gnome-session 2.32.1: add pam-plugin-ck-connector dependency when =
using pam
=20=20gdm 2.32.2: gdm supports running sessions under ssh-agent, so add =
openssh-mi
=20=20mesa: package dri drivers seperately, like OE-core does

Richard Purdie (1):
=20=20kernel.bbclass: Stop do_install poking directly into the sysroot and =
evading

Tom Rini (1):
=20=20kernel.bbclass: Stage System.map with KERNEL_VERSION suffix

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Khem Raj (1):
=20=20angstrom-bleeding.conf: Prefer gcc 4.6* instead of 4.6.0

Koen Kooi (11):
=20=20angstrom: prefer linux-libc-headers 2.6.39
=20=20replace qemux86* XSERVER var with something that works
=20=20update samba version to the one present in meta-oe
=20=20angstrom feed sorted: add support for qemux86_64
=20=20prefer glib 2.28.8
=20=20angstrom-task-boot: a sysVinit-less version of task-boot
=20=20efl-nodm-image: install more wm configs
=20=20systemd-image: switch to angstrom-task-boot
=20=20angstrom-task-gnome: replace midori with epiphany
=20=20angstrom-task-gnome3: add a task for a GNOME 3.x images, WIP
=20=20console-base-image: switch to angstrom-task-boot

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Beth Flanagan (1):
=20=20common-licenses: Additions and corrections

Brandon Stafford (1):
=20=20doc/usermanual.xml: Tweaks for the manual

Bruce Ashfield (5):
=20=20linux-yocto: update SRCREVs for utrace merge
=20=20linux-yocto/meta-yocto: update SRCREVs for utrace merge
=20=20linux-yocto: update meta SRCREV for new config groups
=20=20linux-yocto: update meta and yocto/standard SRCREVs
=20=20linux-yocto/meta-yocto: update yocto/standard and beagleboard SRCREVs

Darren Hart (3):
=20=20beagleboard: cleanup machine config commentary
=20=20beagleboard: add basic audio mixer defaults
=20=20beagleboard: switch to xserver-xf86-lite

Jiajun Xu (1):
=20=20qemuimagetest: update cvs and iptables to newer version for toolchain =
test

Khem Raj (10):
=20=20gettext-0.18.1.1: Remove unused patches
=20=20uclibc/x86_64/uClibc.machine: Enable ARCH_USE_MMU
=20=20uclibc: Add support for $ORIGIN
=20=20uclibc.inc: libsegfault is only RPROVIDED by uclibc
=20=20binutils_2.21.bb: Fix ld segfault exposed by eglibc 2.14 on x86_64
=20=20eglibc-package.inc: Package newly added sotruss and supporting =
libraries
=20=20eglibc: Upgrade recipes from 2.13 -> 2.14
=20=20tcmode-default.inc: Bump EGLIBCVERSION to 2.14
=20=20gcc-4.6: Switch to using svn SRC_URI for recipe
=20=20tcmode-default.inc: use 4.6 for GCCVERSION and SDKGCCVERSION

Koen Kooi (4):
=20=20gnome-keyring 2.32.1: fix packaging
=20=20glib-2.0 2.28.x: update to 2.28.8
=20=20alsa-utils 1.0.24.2: fix packaging
=20=20kernel.bbclass: restore kernel-abiversion file

Mark Hatle (41):
=20=20tinylogin: Avoid stripped binaries
=20=20boost: Move the do_configure_prepend to a seperate task
=20=20nasm: Fix aclocal
=20=20dropbear: Don't patch in configure
=20=20unzip: Avoid stripping binaries
=20=20db: Avoid stripping binaries
=20=20sysstat: Avoid stripping binaries
=20=20quota: Avoid stripping binaries
=20=20busybox: Avoid stripping binaries
=20=20wireless-tools: Avoid stripping binaries
=20=20libproxy: Add missing debug files
=20=20gtk-sato-engine: Add missing debug files
=20=20gstreamer: Add missing debug files.
=20=20trace-cmd: Add missing debug files
=20=20systemtamp: Add missing debug files
=20=20gthumb: Add missing debug files
=20=20gamin: Add missing debug files to -dbg
=20=20mc: Add missing debug files to -dbg
=20=20python-gst: Add missing files to the -dbg package
=20=20liba52: Remove custom -dbg, fall back to default
=20=20modutils: Add in missing -dbg package
=20=20psmisc: Remove custom -dbg packages, use default
=20=20texinfo: Change to use the standard -dbg file
=20=20libxml-parser-perl: Fix debug package
=20=20python-pyobject: Remove unnecessary -dbg setting
=20=20python: Switch to using the default -dbg package
=20=20classes/package_rpm.bbclass: Enhance diagnostic messages
=20=20sysfsutils: Fall back to default -dbg package
=20=20kernel.bbclass: Add support for perf-dbg package
=20=20perf: Fix linux-tools to ensure perf is installed under "fakeroot"
=20=20classes/package_rpm.bbclass: Change the way the PV is transformed
=20=20native.bbclass: Add a simple chown intercept command
=20=20resolveconf: Fix file owners
=20=20base-passwd: Fix owners/groups
=20=20ghostscript: Fix owner/group of /etc/cups
=20=20libtirpc: Fix owner/group of /etc/netconfig
=20=20tzdata: Ensure all files are owned by root:root
=20=20gnome-doc-utils: Fix the owner/group on select files
=20=20db: Fix file ownership
=20=20python: Add python to the dependency to pygobject
=20=20runqueue.py: Add umask task control

Paul Eggleton (4):
=20=20u-boot: set SRCREV to a git revision instead of a tag reference
=20=20qt4-tools-nativesdk: fix unpack failure due to missing g++.conf
=20=20qt4-tools-nativesdk: drop freetype include as we build with =
-no-freetype
=20=20qt4-tools-nativesdk: fix compile failure in src/dbus

Richard Purdie (5):
=20=20beagleboard-audio: Set COMPATIBLE_MACHINE and also remove toolchain =
dependen
=20=20Revert "tcmode-default.inc: Bump EGLIBCVERSION to 2.14"
=20=20Revert "eglibc: Upgrade recipes from 2.13 -> 2.14"
=20=20packagedata.py: Fix read_subpkgdata_dict()
=20=20kernel.bbclass: Stop do_install poking directly into the sysroot and =
evading

Scott Garman (1):
=20=20fetch2/git.py: improve error reporting when an invalid protocol is =
used

Scott Rifenbark (33):
=20=20documentation/poky-ref-manual/ref-variables.xml - YOCTO #1104 =
EXTRA_IMAGE_FE
=20=20documentation/poky-ref-manual/ref-variables.xml: YOCTO #1104 =
EXTRA_IMAGE_FEA
=20=20documentation/poky-ref-manual/ref-features.xml: YOCTO #1104 =
EXTRA_IMAGE_FEAT
=20=20documentation/poky-ref-manual/ref-varlocality.xml: YOCTO #1104 =
EXTRA_IMAGE_F
=20=20documentation/poky-ref-manual/extendpoky.xml: YOCTO #1104 =
EXTRA_IMAGE_FEATUR
=20=20documentation/poky-ref-manual/ref-structure.xml: Fixed a type (From =
yocto-do
=20=20documentation/poky-ref-manual/faq.xml: Updated Python FAQ entry
=20=20documentation/yocto-project-qs/yocto-project-qs.xml: Updated for =
Python 2.7
=20=20documentation/yocto-project-qs/yocto-project-qs.xml: multi-core update
=20=20documentation/yocto-project-qs/yocto-project-qs.xml: zypper for =
OpenSUSE
=20=20documentation/yocto-project-qs/yocto-project-qs.xml: Updated package =
install
=20=20documentation/yocto-project-qs/yocto-project-qs.xml: OS support added =
(parti
=20=20documentation/yocto-project-qs/yocto-project-qs.xml: added libtool to =
packag
=20=20documentation/adt-manual/adt-intro.xml: changed definition of ADT
=20=20documentation/adt-manual/adt-intro.xml: Grammar correction (From =
yocto-docs=20
=20=20documentation/adt-manual/adt-intro.xml: updated QEMU overview
=20=20documentation/adt-manual/adt-intro.xml: Updated description of =
toolchain (Fr
=20=20documentation/adt-manual/adt-prepare.xml: Updates to ADT install steps
=20=20documentation/adt-manual/adt-prepare.xml: Corrected setup command
=20=20documentation/adt-manual/adt-prepare.xml: Updated kernel note
=20=20documentation/adt-manual/adt-package.xml: Updated PMS section
=20=20documentation/adt-manual/adt-prepare.xml: Clarified sysroot =
discussions
=20=20documentation/adt-manual/adt-package.xml: Updates to configuring PMS
=20=20documentation/adt-manual/adt-eclipse.xml: Wording Change
=20=20documentation/adt-manual/adt-eclipse.xml: recommending Indigo Eclipse =
(From=20
=20=20documentation/adt-manual/adt-eclipse.xml: changed CDT 7.0 to 8.0 for =
Indigo=20
=20=20documentation/adt-manual/adt-eclipse.xml: Edits to SDK and Poky tree =
modes
=20=20documentation/adt-manual/adt-eclipse.xml: Updated configuring sysroot
=20=20documentation/adt-manual/adt-eclipse.xml: Updates to choosing target =
options
=20=20documentation/adt-manual/adt-eclipse.xml: Updated new modes for tree
=20=20documentation/adt-manual/adt-eclipse.xml: misc wordings changed (From =
yocto-
=20=20documentation/adt-manual/adt-eclipse.xml: General minor edits (From =
yocto-do
=20=20documentation/adt-manual/adt-command.xml: Small edits for terminology =
(From=20

Tom Rini (1):
=20=20kernel.bbclass: Stage System.map with KERNEL_VERSION suffix

Xiaofeng Yan (2):
=20=20task-core-lsb: Add absent libraries and commands to task-core-lsb.bb
=20=20poky-lsb.conf: Instead of +=3D with _append

Zhai Edwin (2):
=20=20gnome-vfs: remove gnome-vfs as it is deprecated in favour of GVFS and =
GIO
=20=20clutter: Use new git repo

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-texasinstruments:

Koen Kooi (7):
=20=20pandaboard: move to L24.13 kernel, update machine config to match
=20=20libgles-omap3: drag in 'initscripts' to make cputype work
=20=20ti-biosutils: add 1.02.02 from OE .dev
=20=20ti-edma3lld: add 01.11.01.04 from OE .dev
=20=20u-boot: add 2011.06rc recipe for beagle and panda
=20=20linux-omap 2.6.39: switch to GPTIMER1 on modern beagles
=20=20omap3-sgx-modules: bump PR for OE-core kernel.bbclass fix

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-micro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-slugos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nslu2:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:

Andrea Adami (5):
=20=20zaurus.inc: remove orphan LZMA_COMPRESSION_LEVEL
=20=20linux-kexecboot: upgrade from 2.6.39.1 to 2.6.39.2
=20=20linux: upgrade from 2.6.39.1 to 2.6.39.2
=20=20linux-kexecboot: update git recipe to 3.0-rc4
=20=20linux: update git recipe to 3.0-rc4

Denis 'GNUtoo' Carikli (2):
=20=20Add new linux-kexecboot_git-nokia900-meego recipe
=20=20nokia900.conf: add support for kexecboot

Jeff Lance (4):
=20=20matrix_gui: Update SRCREV to revision 265
=20=20matrix_gui: Add beagleboard platform support
=20=20matrix-tui: update SRCREV to 42 with makefile.init fixes
=20=20matrix-gui: update SRCREV to revision 175

Joel A Fernandes (2):
=20=20linux-omap: Disable UART sleep timeout to avoid serial port problems =
on wake
=20=20ti-dmai: Fixes for Display and Capture.

Koen Kooi (2):
=20=20linux-omap-psp 2.6.32: bump PR
=20=20gstreamer-ti: hack it to build with libtool sysroot enabled

Matthew McClintock (1):
=20=20valgrind: Fix shebang issues when compiling valgrind on old bash

Otavio Salvador (1):
=20=20conf/bitbake: unbreak and improve lzma image compression handling and =
adapt=20

Pau Espin Pedrol (2):
=20=20emtooth2: bump SRCREV to 143
=20=20enjoy: add alsa and autodetect gst modules.

Paul Eggleton (1):
=20=20classes/native*.bbclass: fix error during parse with bitbake master

Paul Menzel (4):
=20=20libshiboken: Do not override `DEPENDS`
=20=20libfso-qt-embedded: Do not override `DEPENDS`
=20=20aurora: Add `qt4-embedded` to `DEPENDS`
=20=20pulseaudio_git: Update `SRC_URI` to new URL at freedesktop.org [1]

Simon Busch (11):
=20=20frameworkd: check even in ${MACHINE_CLASS} directory for a config =
file and b
=20=20elfe: bump SRCREV to latest version
=20=20python-pyside-embedded: create one include file per version for the =
checksum
=20=20python-pyside: put no-accessibility-support.patch in the global files =
direct
=20=20python-pyside-x11: add x11 variant of python-pyside
=20=20libmsmrpc: add initial version of the recipe
=20=20msmcomm: bump SRCREV to latest version
=20=20fsousaged: fix configuration for palmpre with aurora distro and bump =
PR
=20=20fso-specs: bump version and SRCREV
=20=20libfso-glib: bump SRCREV and PV according to latest changes
=20=20linux-palmpre: update to the latest version

Tom Rini (1):
=20=20udev: Fix cache problem

chase maupin (1):
=20=20kernel bbclass: add the crypto directory to staging




