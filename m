Return-Path: <cliff.brake@gmail.com>
Received: from bec-systems.com (u15414263.onlinehome-server.com
	[74.208.70.121])
	by mail.openembedded.org (Postfix) with ESMTP id F421D6B1E4;
	Thu, 18 Jul 2013 19:35:33 +0000 (UTC)
Received: from oh-67-76-203-50.sta.embarqhsd.net ([67.76.203.50]
	helo=happy.bec-systems.com)
	by bec-systems.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cliff.brake@gmail.com>)
	id 1UztuQ-0004iz-T5; Thu, 18 Jul 2013 15:30:47 -0400
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Date: Thu, 18 Jul 2013 19:35:13 GMT
Message-Id: <1374176113116.1bc6757c@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
X-Spam_score: -2.9
X-Spam_score_int: -28
X-Spam_bar: --
Subject: OE Changelog since 2013-07-07 until 2013-07-14
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 18 Jul 2013 19:35:34 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2013-07-07 until 2013-07-14.  Projects included in this =
report:

bitbake: git://git.openembedded.org/bitbake
openembedded-core: git://git.openembedded.org/openembedded-core
meta-openembedded: git://git.openembedded.org/meta-openembedded
meta-angstrom: git://github.com/Angstrom-distribution/meta-angstrom.git
meta-arago: git://arago-project.org/git/meta-arago.git
meta-beagleboard: git://github.com/beagleboard/meta-beagleboard.git
meta-browser: git://github.com/OSSystems/meta-browser.git
meta-bug: git://github.com/buglabs/meta-bug.git
meta-chicken: git://github.com/OSSystems/meta-chicken
meta-efikamx: git://github.com/kraj/meta-efikamx.git
meta-ettus: http://github.com/koenkooi/meta-ettus.git
meta-fsl-arm: git://git.yoctoproject.org/meta-fsl-arm
meta-fsl-arm-extra: git://github.com/Freescale/meta-fsl-arm-extra.git
meta-fsl-ppc: git://git.yoctoproject.org/meta-fsl-ppc
meta-guacamayo: git://github.com/Guacamayo/meta-guacamayo.git
meta-gumstix: git://github.com/gumstix/meta-gumstix.git
meta-gumstix-community: =
git://gitorious.org/schnitzeltony-oe-meta/meta-gumstix-community.git
meta-handheld: git://git.openembedded.org/meta-handheld
meta-igep: http://github.com/ebutera/meta-igep.git
meta-intel: git://git.yoctoproject.org/meta-intel
meta-ivi: git://git.yoctoproject.org/meta-ivi
meta-java: git://github.com/woglinde/meta-java
meta-kde: git://gitorious.org/openembedded-core-layers/meta-kde.git
meta-micro: git://git.openembedded.org/meta-micro
meta-mono: git://git.yoctoproject.org/meta-mono.git
meta-netbookpro: git://github.com/tworaz/meta-netbookpro
meta-nslu2: git://github.com/kraj/meta-nslu2
meta-opie: git://git.openembedded.org/meta-opie
meta-qt3: git://git.yoctoproject.org/meta-qt3
meta-qt5: git://github.com/meta-qt5/meta-qt5.git
meta-slugos: git://github.com/kraj/meta-slugos
meta-systemd: git://git.yoctoproject.org/meta-systemd
meta-raspberrypi: git://github.com/djwillis/meta-raspberrypi.git
meta-smartphone: http://git.shr-project.org/repo/meta-smartphone.git
meta-ti: git://git.yoctoproject.org/meta-ti
meta-webos: git://github.com/openwebos/meta-webos.git
meta-xilinx: git://git.yoctoproject.org/meta-xilinx
meta-yocto: git://git.yoctoproject.org/meta-yocto
openembedded: git://git.openembedded.org/openembedded

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for bitbake:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Andreas Oberritter (4):
=20=20xserver-xorg: extend packageconfig and dependencies
=20=20cogl-1.0: put each library into its own package
=20=20cogl-1.0: make building cogl-pango optional
=20=20qt4-x11-free: fix post-processing of QtWebKit.pc

Andrei Dinu (1):
=20=20e2fsprogs: upgrade to 1.42.8

Bernhard Guillon (1):
=20=20populate_sdk_base.bbclass: allow $OECORE_NATIVE_SYSROOT in =
sdk_env_script

Bian Naimeng (1):
=20=20package_rpm.bbclass: remove xx.spec before doing rpmbuild xx.src.rpm

Bruce Ashfield (1):
=20=20linux-yocto/3.4: update to v3.4.52

Cristian Iorga (4):
=20=20glib-2.0: upgrade to 2.36.3
=20=20libogg: upgrade to 1.3.1
=20=20xdg-utils: upgrade to 1.1.0-rc1
=20=20dbus: upgrade to 1.6.10

Darren Hart (1):
=20=20alsa-state: Provide an empty asound.conf by default

Emilia Ciobanu (1):
=20=20distrodata.bbaclass: change in git and svn package reporting

Gabriel Barbu (1):
=20=20ethtool: add ptest

Hongxu Jia (5):
=20=20nspr: add native version
=20=20packagegroup-core-lsb: add nss for LSB library check
=20=20nss: add version 3.15.1
=20=20nss: create checksum files for the nss libraries
=20=20nss: fix incorrect shebang line of perl script

Ionut Radu (8):
=20=20libassuan: Updated from 2.1.0 to 2.1.1
=20=20augeas: Update from 1.0.0 to 1.1.0
=20=20libxvmc: Update from 1.0.7 to 1.0.8
=20=20libxi: Update from 1.7.1 to 1.7.2
=20=20libgpg-error: Updated from 1.11 to 1.12
=20=20libxrender: Updated from 0.9.7 to 0.9.8
=20=20libxv: Updated from 1.0.8 to 1.0.9
=20=20ethtool: Updated from 3.9 to 3.10

Jackie Huang (3):
=20=20initscripts: overwrite default hostname.sh
=20=20initscripts: add dmesg file to /var/log
=20=20glib-2.0: add -march=3Di486 into CFLAGS automatically when needed.

Jonathan Liu (2):
=20=20qt4: add upstream QTBUG-31579 patch to fix polyline drawing regression
=20=20boot-directdisk: allow specifying custom MBR disk signature

Kang Kai (3):
=20=20webkit: set COMPATIBLE_HOST for mips64
=20=20packagegroup-core-lsb: set COMPATIBLE_HOST to mips64
=20=20packagegroup-core-tools-profile: exclude systemtap and valgrind for =
mips64

Khem Raj (1):
=20=20eglibc: Update 2.18 recipes to fix ppc/e500 failures

Laurentiu Palcu (6):
=20=20populate_sdk_base: fix bashism
=20=20sysvinit: allow users in shutdown group to perform halt/reboot
=20=20xuser-account: create separate recipe for xuser creation
=20=20connman: remove xuser creation, RDEPEND on xuser-account
=20=20xserver-nodm-init: remove xuser creation, RDEPEND on xuser-account
=20=20shutdown-desktop: give entire path in Exec field

Mark Hatle (1):
=20=20qemu: QEMU fix libtool usage

Martin Jansa (8):
=20=20(lib)telepathy*: add missing dependency on libxslt-native
=20=20gst-plugins-bad: inherit gsettings
=20=20gst-plugins-base: add missing dependency on glib-2.0-native
=20=20taglib: add missing dependency on zlib
=20=20quota: inherit pkgconfig
=20=20libpam: inherit pkgconfig
=20=20systemtap: inherit pkgconfig
=20=20eglibc-locale: add missing dependency on =
virtual/${TARGET_PREFIX}binutils

Mihaela Sendrea (1):
=20=20libxml2: Add ptest

Nathan Rossi (2):
=20=20scripts/runqemu: Add support for 'qemuzynq' machine
=20=20scripts/runqemu: Add support for 'qemumicroblaze' machine

Paul Eggleton (1):
=20=20cmake: fix configure error if system Qt installation is broken

Radu Moisan (12):
=20=20lib/oeqa/utils/qemurunner.py: class to handle qemu instance
=20=20lib/oeqa/utils/decorators.py: decorators for test methods
=20=20elfutils: Upgrade to v0.155
=20=20rxvt-unicode: Upgrade to v9.18
=20=20ed: Upgrade to v1.8
=20=20libdmx: Upgrade to v1.1.3
=20=20apr: Upgrade to v1.4.8
=20=20apr-util: Upgrade to v1.5.2
=20=20usbutils: Upgrade to v007
=20=20iputils: Upgrade to v20121221
=20=20diffutils: Upgrade to v3.3
=20=20rxvt-unicode: Check existence of acinclude.m4

Randy Witt (1):
=20=20systemd: Don't enable systemd services when native.

Robert Yang (3):
=20=20package_rpm.bbclass: make DESCRIPTION support newline
=20=20package_ipk.bbclass: make DESCRIPTION support newline
=20=20package_deb.bbclass: make DESCRIPTION support newline

Ross Burton (2):
=20=20gtkdoc: set the default docdir to ${S}, not ${B}
=20=20pango: drop unexplainable elfutils dependency

Roy.Li (1):
=20=20pango: remove pango-module-basic-x RRECOMMENDS

Saul Wold (10):
=20=20packagegroup-core-basic: remove libpam
=20=20util-linux: Use PACKAGECONFIG to control pam and system config options
=20=20man-pages: Update to 3.52
=20=20cmake: Update to 2.8.11.2
=20=20tzcode-native: Update to 2013d
=20=20kconfig-frontends: Update to 3.10
=20=20security_flags: Add addition recipes to the non pie list
=20=20boost: backport glibc patch for new eglibc
=20=20pciutils: Add kmod dependency
=20=20ncurses: add xterm-256color to terminfo-base

Sergey Matyukevich (1):
=20=20powertop: fix update-alternatives link

Stefan Stanacar (6):
=20=20classes/testimage.bbclass: new class for image tests
=20=20lib/oeqa/oetest.py: base module for all runtime unittests
=20=20lib/oeqa/utils/sshcontrol.py: helper module for running remote =
commands
=20=20lib/oeqa/utils/oeqemuconsole.py: handle qemu serial console connection
=20=20lib/oeqa/runtime: image sanity tests
=20=20lib/oeqa/runtime: add gcc test

Ting Liu (1):
=20=20qemu: use PACKAGECONFIG to address libaio/attr/libcap dependencies

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Andrea Adami (1):
=20=20initramfs-kexecboot-image: remove obsolete IMAGE_ vars

Andreas M=C3=BCller (2):
=20=20abiword: remove abiword.inc - it is of no use
=20=20asio: fix runtime dependencies for images with dev-pkgs in =
IMAGE_FEATURES

Eric BENARD (1):
=20=20hexedit: new recipe

Jonathan Liu (9):
=20=20openldap: remove empty /var/run directory
=20=20networkmanager: remove /var/run from package
=20=20cherokee: remove empty /var/run directory
=20=20collectd: remove empty /var/run directory
=20=20gdm: remove /var/run from package
=20=20samba: remove /var/lock and /var/run from package
=20=20hiawatha: remove empty /var/run directory
=20=20qt-creator: add new recipe for version 2.7.2
=20=20nostromo: fix installed but not shipped /run and /run/nostromo =
warnings

Khem Raj (1):
=20=20uhd: Fix compile errors

Martin Jansa (23):
=20=20f2fs-tools: add util-linux dependency
=20=20ruby: add missing dependency on ruby-native
=20=20xorg-sgml-doctools: add missing dependency on util-macros
=20=20cpufrequtils: inherit gettext
=20=20cryptsetup: add missing dependency on libgcrypt
=20=20gsoap: add missing dependency on zlib
=20=20libspatialite: add missing dependency on sqlite3
=20=20wbxml2: add missing dependency on expat
=20=20fbida: define -I when checking jpeg version
=20=20iso-codes: add missing dependency on gettext-native
=20=20libetpan: explicitly disable sasl support
=20=20llvm: Consolidate .inc files
=20=20llvm2: don't install llvm-config to bindir
=20=20llvm: use newer class-native overrides instead of virtclass
=20=20llvm: split packages a bit more
=20=20llvm3.3: Add zlib dependency and explicitly enable it
=20=20mysql5: prevent using bundled zlib at all costs
=20=20gypsy: add dependency on libxslt-native
=20=20portaudio: inherit pkgconfig
=20=20media-ctl: inherit pkgconfig
=20=20rsyslog: inherit pkgconfig
=20=20portaudio: explicitly disable oss, add PACKAGECONFIG for alsa and jack
=20=20llvm3.3: Add zlib dependency and explicitly enable it

Noor (1):
=20=20gvfs: Handle samba dependency based on GPLv3 license.

Otavio Salvador (1):
=20=20lmbench: remove /run/lmbench from package

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Denys Dmytriyenko (23):
=20=20qt4-embedded/qt4-tools: update recipes and bbappends to the latest =
version
=20=20gdb-canadian-cross: remove overlayed recipe, as python fix is upstream
=20=20openssl: update bbappend to the latest version
=20=20openssh: update bbappend to the latest version
=20=20php: update bbappend to the latest version
=20=20freetype: update bbappend to the latest version
=20=20gnutls: update bbappend to the latest version
=20=20bash: remove overlayed recipe, as the fix is upstream now
=20=20curl: update bbappend to the latest version
=20=20pulseaudio: update bbappend to the latest version
=20=20libav: update bbappend to the latest version
=20=20libav: remove local tweak due to vpx being broken for hardfp
=20=20tiff: update bbappend to the latest version
=20=20dbus: update bbappend to the latest version
=20=20bluez: update bbappend to the latest version
=20=20kernel.bbclass: remove locally, as fixes are now upstream
=20=20tisdk-image: fix RDEPENDS being package-specific
=20=20external-arago-toolchain: move SUPPORTED file into pkg-specific path
=20=20ti-wifi-utils: fix RDEPENDS being package-specific
=20=20packagegroup-arago-tisdk-test-addons: remove unneeded ALLOW_EMPTY
=20=20packagegroup-{connectivity,matrix}: remove TI/ECS specific WiFi/BT =
pieces th
=20=20arago-prefs: update new versions and add providers
=20=20arago.conf: workaround curl breakage with -D and bump distro version

Franklin S. Cooper Jr (6):
=20=20u-boot-am33x: Update to latest u-boot versoin for 3.2 kernel
=20=20linux-am335x-psp: Update to latest 3.2 release
=20=20arago-source-ipk: Enable sourceipk for oprofile-example
=20=20ti-tisdk-makefile: Add oprofile-example to SDK top level Makefile
=20=20packagegroup-arago-tisdk-addons-sdk-host: Add oprofile-example =
sources to SD
=20=20packagegroup-arago-tisdk-addons: Only include parted utility for =
omap-a15

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-beagleboard:

Koen Kooi (7):
=20=20linux-mainline 3.8: import GSoC ADC work, add PPS-gpio support and =
import so
=20=20contrib: bone-flash-tool: try harder to get eMMC controller to flush =
its cac
=20=20linux-mainline 3.8: fix build failure
=20=20linux-mainline 3.8: add leds-pwm and bacon cape support
=20=20contrib: bone-flash-tool: mount vfat async again
=20=20contrib: bone-flash-tool: switch to new date mode for emmc-prepare =
and fix v
=20=20linux-mainline 3.8: add PRU rpmsg support and fix IIO mappings

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-browser:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-bug:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-chicken:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-efikamx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ettus:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm:

Fabio Estevam (1):
=20=20linux-imx (3.0.35): Update to the latest commit of 4.0.0 branch

Otavio Salvador (9):
=20=20linux-imx (3.0.35): Sync i.MX6 defconfig files
=20=20linux-imx (3.0.35): Enable tracing support so lttng's modules are =
build
=20=20linux-imx (2.6.35.3): Sync i.MX5 and i.MX28 defconfig files
=20=20linux-imx (2.6.35.3): Enable tracing support so lttng's modules are =
build
=20=20linux-imx (2.6.35.3): Update GIT revision to a0de0f9
=20=20linux-imx (3.0.35): Update git revision to 08814d9
=20=20u-boot-fslc: Update to 2013.07-rc2 release
=20=20imx6dlsabresd: Use U-Boot 2013.07
=20=20linux-imx (3.0.35): Remove referenced patch kept by mistake

Rogerio Nunes (3):
=20=20gst-plugins-gl: Upgrade to IMX_MMCODEC_3.0.35_4.0.0
=20=20gst-plugins-gl: Enforce glib2 deprecated API support
=20=20gst-plugins-gl: Package arch must match machine arch for i.MX6

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

Erik Bot=C3=B6 (1):
=20=20linux-boundary: Updated SRCREV to pull latest changes.

John Weber (1):
=20=20linux-wandboard: Add support for non-Android kernel

Otavio Salvador (2):
=20=20broadcom-nvram-config: Add wandboard-quad as compatible machine
=20=20wandboard-quad: Add Wandboard Quad support

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-ppc:

Chunrong Guo (1):
=20=20u-boot: append sdk version into uboot version

Ting Liu (2):
=20=20change layout to follow oe-core guidelines of recipes
=20=20hypervisor: fix sizeof-pointer-memaccess error

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-guacamayo:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix-community:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-handheld:

Andrea Adami (2):
=20=20linux-yocto_3.8: use 'require' instead of 'include' for compliance
=20=20linux-yocto-tiny-kexecboot_3.8: use 'require' instead of 'include' =
for compl

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-igep:

Enric Balletbo i Serra (2):
=20=20linux_git: igep00x0: Switch to use device tree based kernel.
=20=20u-boot_git: Latest mainline u-boot code.

Enrico Butera (1):
=20=20Merge pull request #16 from eballetbo/update-dev-packages

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Laurentiu Palcu (2):
=20=20libva: upgrade to 1.2.1
=20=20libva-intel-driver: upgrade to 1.2.0

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

Andrei Gherzan (2):
=20=20busybox: Sync recipe's version with upstream
=20=20qt4: Sync recipe's version with upstream

Florin Sarbu (4):
=20=20packagegroup-specific-component-p2: Add common-api-c++ and     =
common-api-c+
=20=20layer-management: Update to version 1_0_1
=20=20vexpressa9.conf: Add PREFERRED_VERSION_linux-yocto to be 3.8
=20=20Update kernel bbappend for version 3.8

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-java:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-kde:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-micro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-mono:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-netbookpro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nslu2:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-opie:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-qt3:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-qt5:

Eric BENARD (1):
=20=20qtbase-native-5.0.2: fix compilation on Fedora 19

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-slugos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-systemd:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-raspberrypi:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

Franklin S. Cooper Jr (2):
=20=20u-boot-am33x: Update am335x to use latest u-boot for 3.2 kernel
=20=20u-boot: Add memory alignment fix for armv7 for am37x and am3517

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

Anatolii Sakhnik (1):
=20=20webos-image: libpbnjson=3D14

Eric Blade (1):
=20=20webos-image: luna-init=3Dv2.0.1,3

Gayathri Srinivasan (1):
=20=20webos-image: nodejs-module-webos-pmlog=3D14

Maksym Shevchenko (1):
=20=20Assign Copyright to LG Electronics, Inc.

Martin Jansa (6):
=20=20alsa-plugins: Disable a52 plugin
=20=20luna-sysservice: Add missing dependency on libxml2 and sqlite3
=20=20xkeyboard-config: Remove xkbcomp from RDEPENDS
=20=20boost: Remove .bbappend, resolved in oe-core
=20=20luna-sysmgr-common: Add dependency on binutils-cross
=20=20webos-recipe-blacklist: Blacklist more upstream recipes

Roger Stringer (1):
=20=20webos-image: smartkey-hun=3D6

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

Nathan Rossi (8):
=20=20site/microblaze-common: Fix glib format configure value
=20=20binutils: Added MicroBlaze specific patches
=20=20gcc: Added MicroBlaze specific patches
=20=20linux-xlnx: Change 3.8 kernel to use .scc for patches
=20=20linux-xlnx: Resolve Packaging QA error
=20=20gcc: Add patch to resolve MicroBlaze -mhard-float issue
=20=20qemumicroblaze: Update TUNE_FEATURES
=20=20Merge MicroBlaze Toolchain Enablement.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Bruce Ashfield (1):
=20=20meta-yocto-bsp: update reference board SRCREVs

Emilia Ciobanu (1):
=20=20package_regex.inc: Changes in regexes

Tom Zanussi (1):
=20=20yocto-kernel: make BBLAYERS parsing more robust

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



