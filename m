Return-Path: <cliff.brake@gmail.com>
X-Greylist: delayed 1648 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 12 May 2014 16:18:18 UTC
Received: from mail-ie0-f180.google.com (unknown [209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id F215D601A0;
	Mon, 12 May 2014 16:18:18 +0000 (UTC)
Received: by mail-ie0-f180.google.com with SMTP id as1so7159410iec.39
	for <multiple recipients>; Mon, 12 May 2014 09:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:from:to:subject:content-type
	:content-transfer-encoding;
	bh=vjvBC39Kiai9Qvsiv5PBh7bHeudFdw3e9mcCXDqjaSQ=;
	b=ObjxC4H/5UtjooiGCOE+/sZixgRPeNPz0H+gAEOOpkXaJgL9tscnB0772c9yovRSt2
	mmtZvpqcSvyW27O/kA7LtR2JNgFBe32gDBuvspZvH72Fqi9iA7rINxRZkun6JsobB7eb
	YSN0KTxYhduxqoCOusrvw4oO+3axX11nSJrFW/8364dZeqKzKXAdBHT+7s/i5CxLFmdX
	gqTqPj0T64nM6QBoNyuLUfZbuT6IRkmYMdsoBI5XEVxQk4jriC4ox4ZUSHUcb/CcIgoi
	rYyaBfW91ol7UEzP66lH0gVBO8y9zV0o8NGZYdS2trRe+14tlNu4YdUNiMcJ6YDHM5RV
	mRjw==
X-Received: by 10.50.43.201 with SMTP id y9mr45986379igl.12.1399909851758;
	Mon, 12 May 2014 08:50:51 -0700 (PDT)
Received: from happy.bec-systems.com (cable-pool6-cs-200.doycomm.com.
	[66.219.185.200])
	by mx.google.com with ESMTPSA id kr5sm23127584igb.9.2014.05.12.08.50.49
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 May 2014 08:50:50 -0700 (PDT)
X-Google-Original-Date: Mon, 12 May 2014 15:50:49 GMT
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Date: Mon, 12 May 2014 08:50:50 -0700 (PDT)
Message-Id: <1399909849312.2408640f@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
Subject: OE Changelog since 2014-05-04 until 2014-05-11
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
X-List-Received-Date: Mon, 12 May 2014 16:18:19 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2014-05-04 until 2014-05-11.  Projects included in this =
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

Alexandru DAMIAN (2):
=20=20toaster: fix migration code for MySQL
=20=20toaster: modify SQL data type constraints

Andreas Bofjall (1):
=20=20setup.py: fix documentation build

Belen Barros Pena (1):
=20=20toaster: Make sure layer branch only shows when not empty

Dave Lerner (1):
=20=20toaster: fix span2 headings for packages

David Reyna (1):
=20=20toaster: sort outcome and sstate columns by string value

Nick Lewis (1):
=20=20Fix refetch of local files when they are read only

Richard Purdie (5):
=20=20data_smart: Ensure all possible overrides are cached including those =
with '_
=20=20parse/ast: Show append logging at lower log level
=20=20knotty: Fix output printed to the user at debug log levels
=20=20parse: Improve file inheritance logging
=20=20fetch2/perforce: Ensure command has a default

Volker Vogelhuber (1):
=20=20fix cloning of mercurial repository with username and password =
specified in=20

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Anders Roxell (1):
=20=20rt-tests: bump version 0.87 =3D> 0.89

Bruce Ashfield (6):
=20=20kernel-yocto: quote kconfig mode check
=20=20linux-yocto-custom: provide defconfig guidance
=20=20linux-yocto/3.4: update to v3.4.88
=20=20linux-yocto/3.10: update to v3.10.38
=20=20linux-yocto/3.14: update to v3.14.2
=20=20linux-yocto/3.10: mei.cfg: enable Intel chipsets

Changhyeok Bae (1):
=20=20mirrors.bbclass: Add mirror site for savannah

Chen Qi (3):
=20=20mmc-utils: fix compilation failure for mips64 target.
=20=20sudo: upgrade from 1.8.9p5 to 1.8.10p2
=20=20util-linux: fix parallel build issure for PATHFILES

Cristian Iorga (2):
=20=20taglib: upgrade to 1.9.1
=20=20linux-firmware: upgrade to commit =
dec41bce44e0dff6a2c3358a958fadf22bf58858

Cristiana Voicu (4):
=20=20babeltrace: upgrade to 1.2.1
=20=20rxvt-unicode: upgrade to 9.20
=20=20openssl: update upstream status for a patch
=20=20kmod: update Upstream-Status for one patch

Drew Moseley (1):
=20=20mesa-demos: Specify the lib dir to locate glut libraries

Fathi Boudra (2):
=20=20grub git: update to latest git (grub-2.02-beta2-81-g4b8b913)
=20=20systemtap: update to 2.5 release

Joel Fernandes (1):
=20=20serial-getty service: Add xterm as default TERM

Khem Raj (10):
=20=20gcc: Add 4.9 recipes
=20=20cairo: Fix build with gcc 4.9
=20=20binutils: Fix building nativesdk binutils with gcc 4.9
=20=20systemd: Fix build with gcc 4.9
=20=20oprofile: Update to 0.9.9
=20=20mdadm: Fix build on gcc 4.9
=20=20lttng-modules_2.3.3.bb: Fix build on ARM/gcc-4.9
=20=20procps: Do not detect 32/64 bit compiler options
=20=20tcmode-default.inc: Adjust for new toolchain component changes
=20=20systemd: Upgrade past 212 release

Koen Kooi (3):
=20=20xdg-utils: reinstall xdg-terminal
=20=20xinput-calibrator: fix XDG launch
=20=20ltp: enable PM and RT tests

Martin Jansa (5):
=20=20defaultsetup: enable blacklist by default
=20=20qt4: Explicitly disable sqlite2
=20=20gst-plugins-bad: add PACKAGECONFIG for schro, dc1394 and faac
=20=20gst-plugins-good: add PACKAGECONFIG for x11
=20=20gstreamer1.0-plugins-good: add libxfixes and libxdamange to x11 =
depends

Matt Cowell (1):
=20=20chrpath: properly handle rootdir with '..' in path

Matthieu Crapet (8):
=20=20tcl: cleanup
=20=20*.bbclass (shell): avoid pipe with sed
=20=20acpid: avoid pipe with sed
=20=20apmd: avoid pipe with sed
=20=20dropbear: avoid pipe with sed
=20=20sysvinit-inittab: avoid pipe with grep
=20=20initscripts: avoid pipe with sed
=20=20scripts/runqemu: avoid pipe with sed

Maxin B. John (4):
=20=20gdbm: enable ptest support
=20=20openssl: fix CVE-2014-0198
=20=20perl: update ptest package dependency list
=20=20libxml2: fix CVE-2014-0191

Ming Liu (1):
=20=20ldconfig-native: also default to lib32 and lib64 directories

Petter Mabacker (1):
=20=20x-load: remove recipe

Radek Dostal (1):
=20=20distutils.bbclass: only modify *.py file if it contains path to be =
removed

Ricardo Ribalda Delgado (2):
=20=20package_manager: Fix Argument list too long
=20=20package_manager: Fix NoneType Object on do_populate_sdk

Richard Purdie (12):
=20=20sstatetests: Use TUNE_ARCH instead of TARGET_ARCH
=20=20cleanup-workdir: Fix crosssdk reference after addition of PN
=20=20tcmode-default: Fix up sdk related PREFERRED_VERSION variables after =
toolcha
=20=20base.bbclass: Fix multilib PREFERRED_VERSION handling
=20=20python3/gcc/autoconf: Fix Upstream-Status in some patches I authored
=20=20ptest: Work from PTEST_ENABLED, not DISTRO_FEATURES
=20=20libiconv: Fix B !=3D S with uclibc builds
=20=20uclibc: Set MULTILIB_DIR based on baselib
=20=20separatebuilddir.inc: Drop, now obsolete
=20=20gcc: Handle uclibc linker relocation for multilib support
=20=20attr: Fix uclibc builds
=20=20classes/lib/oe: Fix cross/crosssdk references

Ross Burton (2):
=20=20librsvg: upgrade to 2.40.2
=20=20libxcb: disable check to avoid floating dependencies

Saul Wold (3):
=20=20libgcrypt: update to 1.6.1
=20=20openssh: add /var/log/lastlog to volatile list
=20=20update-rc.d: Handle multilib case for initscripts

Tim Orling (1):
=20=20perl: fix missing Module::Metadata

Tyler Hall (2):
=20=20python3: Substitute correct python version in shebang
=20=20python3: Revert python-config to distutils.sysconfig

Valentin Popa (8):
=20=20nettle: add nettle to oe-core
=20=20gnutls: update to 3.2.13
=20=20wpa-supplicant: add libgcrypt as a dependencie
=20=20icu: upgrade to 53.1
=20=20libtasn1: upgrade to 3.5
=20=20libsoup: upgrade to 2.46.0
=20=20libpng12: upgrade to 1.2.51
=20=20nettle: disable openssl

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Alex Lennon (1):
=20=20daq: Update from 2.0.1 to 2.0.2

Andre McCurdy (1):
=20=20libjpeg-turbo: update 1.3.0 -> 1.3.1

Andrea Galbusera (1):
=20=20libconfig: inherit from autotools-brokensep

Andreas M=C3=BCller (4):
=20=20xfce4-settings: fix crash when no pointer device is connected
=20=20xfce4-settings: add upower to DEPENDS
=20=20xfce4-weather-plugin: add dbus-glib and upower to DEPENDS
=20=20gimp: add DEPENDS and PACKAGECONFIG for help-browser

Koen Kooi (1):
=20=20php: fix do_installing when S!=3DB

Martin Jansa (13):
=20=20maliit-framework: add dependency on libxcomposite
=20=20e.bbclass: Fix do_configure_append for B!=3DS
=20=20coriander: add tiff dependency
=20=20devicekit-power: add libusb-compat dependency
=20=20gcr: add libgcrypt dependency
=20=20qt-creator: skip libdir qa check, because it's false positive
=20=20ruby: add --enable-wide-getaddrinfo to whitelist
=20=20efl: fix pkg-config files when B!=3DS
=20=20gtkperf: add gtk+ dependency
=20=20libmusicbrainz: add dependency on neon-native
=20=20daq: explicitly disable nfq and ipq modules
=20=20python-efl: add dependency on elementary
=20=20emacs, mplayer2, gnome-mplayer, xbmc, libimobiledevice, ifuse, tk: =
blacklist

Matthieu CRAPET (1):
=20=20tk: cleanup & add PACKAGECONFIG

Otavio Salvador (2):
=20=20dbench: Fix out of tree build
=20=20v4l-utils: Update to 1.0.1

Tim Orling (2):
=20=20fluidsynth: upgrade to 1.1.6
=20=20vlc: add dependencies, drop unrecognized options

Yue Tao (2):
=20=20net-snmp: Using the target perl
=20=20strongswan: Security Advisory - strongswan - CVE-2014-2338

yanjun.zhu (1):
=20=20net-snmp-5.7.2: fix CVE-2014-2284

yzhu1 (1):
=20=20net-snmp-5.7.2: fix CVE-2014-2285

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Khem Raj (1):
=20=20angstrom-next: Adapt to latest toolchain changes from OE-Core

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Denys Dmytriyenko (1):
=20=20packagegroup-*-addons: no u-boot-fw-utils support for keystone

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-beagleboard:

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

Otavio Salvador (3):
=20=20gst-fsl-plugin: Fix out of tree build
=20=20gst-fsl-plugin: Remove unused patches
=20=20linux-fslc: Update to 094066e revision

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

Eric Nelson (4):
=20=20u-boot-boundary: update to v2014.04 (srcrev 6d00ef4)
=20=20u-boot-script-boundary: Update to v2014.04 (srcrev 6d00ef4)
=20=20nitrogen6x: Add support for i.MX6SDL CPU variants to SOC_FAMILY
=20=20cubox-i: remove extraneous colons from SOC_FAMILY

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-ppc:

Chunrong Guo (1):
=20=20remove PRINC use in meta-fsl-ppc

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-guacamayo:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix-community:

Andreas M=C3=BCller (8):
=20=20linux-mainline-3.14: initial add 3.14.3
=20=20xserver-xf86-config: remove usage of FILESPATH
=20=20linux-omap-3.5: remove usage of FILESPATH
=20=20linux-omap-3.11: remove usage of FILESPATH
=20=20linux-mainline-3.14: remove usage of FILESPATH
=20=20xserver-xf86-config: remove broen THISDIR modification
=20=20layer.conf: seem BBFILE_PRIORITY =3D 11 is not accepted reduce to 7
=20=20xserver-xf86-config: add a hint to see if we have correct xorg.conf

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-handheld:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-igep:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Chan Wei Sern (5):
=20=20meta-mohonpeak: new BSP layer for Intel Atom Processor C2000
=20=20meta-mohonpeak: provide machine configuration for mohonpeak
=20=20meta-valleyisland: provide machine configuration for valleyisland
=20=20meta-valleyisland: provide a formfactor for the valleyisland BSP
=20=20meta-haswell-wc: provide meta-intel.inc in machine configuration

Nitin A Kamble (16):
=20=20common/linux-yocto_3.10: update SRCREVS to 3.10.38-ltsi
=20=20crownbay/linux-yocto_3.10: update SRCREVS to 3.10.38-ltsi
=20=20emenlow/linux-yocto_3.10: update SRCREVS to 3.10.38-ltsi
=20=20fri2/linux-yocto_3.10: update SRCREVS to 3.10.38-ltsi
=20=20common linux-yocto_3.10: update meta branch SRCREV
=20=20crownbay linux-yocto_3.10: update meta branch SRCREV
=20=20emenlow linux-yocto_3.10: update meta branch SRCREV
=20=20fri2 linux-yocto_3.10: update meta branch SRCREV
=20=20common linux-yocto_3.14: update SRCREVS to 3.14.2
=20=20crownbay/linux-yocto_3.14: update SRCREVS to 3.14.2
=20=20emenlow/linux-yocto_3.14: update SRCREVS to 3.14.2
=20=20fri2/linux-yocto_3.14: update SRCREVS to 3.14.2
=20=20common: linux-yocto_3.14 update meta SRCREV
=20=20crownbay: linux-yocto_3.14 update meta SRCREV
=20=20emenlow: linux-yocto_3.14 update meta SRCREV
=20=20fri2: linux-yocto_3.14 update meta SRCREV

Ong Boon Leong (4):
=20=20xf86-video-ast: new recipe for ASPEED Technology Card
=20=20meta-intel.inc: Enable ASPEED Tech Graphic Card
=20=20meta-mohonpeak: provide a formfactor for the mohonpeak BSP
=20=20meta-intel/common: Suppress canterbury corpus QA arch-check

Rebecca Chang Swee Fun (2):
=20=20meta-valleyisland: new BSP layer for Intel Atom E38XX Processor
=20=20meta-intel/common: add valleyisland-io feature support in kernel =
recipes

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

Holger Behrens (6):
=20=20bluez5: rename bbappend file
=20=20xserver-xorg: rename bbappend file
=20=20persistence-client-library: use autotools-brokensep work-around
=20=20README.md: update poky sha
=20=20ivi-image.bb: set PV to 6.0+snapshot-${DATE}
=20=20horizon-image.bb: set PV to 6.0.1

holger (1):
=20=20meta-ivi: refactor layer structure

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-java:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-kde:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-micro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-mono:

Alex J Lennon (2):
=20=20README: Updated documentation links, included wiki article on use of =
meta-mo
=20=20FAQ: Added link to wiki documentation on inclusion of Mono and build =
of asso

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

Andreas Oberritter (2):
=20=20qtbase: enable xkb by default if x11 is in DISTRO_FEATURES
=20=20qtbase: xinput2 depends on libxi

Jacob Kroon (1):
=20=20populate_sdk_qt5.bbclass: Fix PACKAGE_GROUP deprecation warning

Jonathan Liu (1):
=20=20qtlocation: add packageconfig for geoclue and gypsy

Martin Jansa (2):
=20=20cmake: remove .bbappends, resolved in oe-core
=20=20qtbase: add xcb-util-renderutil to xcb PACKAGECONFIG

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-slugos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-systemd:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-raspberrypi:

Andrei Gherzan (11):
=20=20bcm2835: Fix recipe when using separate build directory
=20=20omxplayer: Separate build directory is broken for this package
=20=20rpi-default-versions: Use 3.12.X as default kernel version
=20=20linux-raspberrypi: Update v3.10.30 to v3.10.38
=20=20linux-raspberrypi: Remove v3.11
=20=20linux-raspberrypi: Update v3.12.11 to v3.12.18
=20=20linux-raspberrypi: Replace v3.13.3 by v3.14.2
=20=20firmware: Update to remote's HEAD
=20=20userland: Update to remote's HEAD
=20=20rpi-gpio: Update to v0.5.5
=20=20omxplayer: Update to remote's HEAD

Micha=C3=ABl Burtin (1):
=20=20xserver-xf86-config: Remove changes of THISDIR and FILESPATH

Paul Barker (1):
=20=20Remove uses of PRINC

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

Martin Jansa (6):
=20=20abootimg: add util-linux dependency
=20=20aurora-daemon: skip libdir qa check, because of false positive
=20=20fsodeviced: remove --enable-htcdream-powercontrol option
=20=20intone, emacs: remove from image and feed
=20=20libphone-ui: add dependency on libx11

Simon Busch (1):
=20=20meta-lg: udev-extraconf: add touch specific rule

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

Denys Dmytriyenko (4):
=20=20setup-defconfig.inc: implement config fragments by using in-kernel =
script
=20=20linux-ti-staging: add baseport, connectivity, ipc and systest config =
fragmen
=20=20u-boot-keystone: update to the latest version
=20=20linux-keystone: update to the latest tag 03.10.10_14.03_03

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

Anatolii Sakhnik (1):
=20=20webos-image: luna-service2=3D187,v3.8.1

Kyrylo Kropivyanskiy (1):
=20=20webos-image: Add recipe for leveldb-tl=3Dv0.1.1

Martin Jansa (3):
=20=20webos_enhanced_submissions: Enable sanity checks even without tag =
param
=20=20webos_enhanced_submissions: Add limited support for multiple =
repositories
=20=20icecc.bbclass: Fix different signatures with ICECC_DISABLED

Simon Busch (1):
=20=20python-mock: Add recipe for v1.0.1 and dependencies

amotsok (1):
=20=20openssl: Fix build warning after upgrade to openssl 1.0.1g

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



