Return-Path: <cliff.brake@gmail.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id 980A36C732;
	Mon, 10 Feb 2014 21:10:08 +0000 (UTC)
Received: by mail-ig0-f177.google.com with SMTP id k19so7382252igc.4
	for <multiple recipients>; Mon, 10 Feb 2014 13:10:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:from:to:subject:content-type
	:content-transfer-encoding;
	bh=X3M0imIEljWLvbNKNGwNEUcNGPYRA30y2QZaCyBe5yM=;
	b=laoxrpExdZ4D50zObfHHXNExm9ds0JT+2zZxsY+MowDKJXWZjaHd0mSzLYOY45MwUt
	IcWXDgOpYpuwB4i8gvctIoXNGCzs0i7tqGB/kudOaxi+SO1QqN3bKLrzYSm7Eu8A+PbA
	9YexhmmUKlPSTPYCMQ2gQgKrYHd1+kU8v+W9U4E5xssiuYldOh0gOMudawpH+Xz5JD4/
	0aEuH7AqsjLUhK4cQ8urzTdoG/Fz2zW5V1rR9z6x2uIaEzMjd4T56ga8PYGXeKtqNLbh
	232ztoqg8wweKPRSMCzPUq5B8SZ9H0TtR/QoqeH+HfAYfT+0w9IjlFZz7zL0a4FDEgQW
	klAg==
X-Received: by 10.42.92.194 with SMTP id u2mr20757753icm.19.1392066608804;
	Mon, 10 Feb 2014 13:10:08 -0800 (PST)
Received: from happy.bec-systems.com (cable-pool6-cs-200.doycomm.com.
	[66.219.185.200]) by mx.google.com with ESMTPSA id
	kb10sm46130202igb.6.2014.02.10.13.10.07 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 10 Feb 2014 13:10:07 -0800 (PST)
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Date: Mon, 10 Feb 2014 13:10:07 -0800 (PST)
Message-Id: <1392066606684.be732bb6@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
Subject: OE Changelog since 2014-02-02 until 2014-02-09
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
X-List-Received-Date: Mon, 10 Feb 2014 21:10:09 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2014-02-02 until 2014-02-09.  Projects included in this =
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

Laurentiu Palcu (1):
=20=20bitbake: build.py: create separate function for shell trap creation =
code

Richard Purdie (1):
=20=20data: Account for pre/postfunc functions when calculating dependencies

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Cristian Iorga (4):
=20=20build-appliance-image: Update to poky commit =
b37dd451a52622d5b570183a81583cc
=20=20sbc: upgrade to 1.2
=20=20bluez5: upgrade to 5.14
=20=20minicom: updated download link

David Nystr=C3=B6m (4):
=20=20postinst-intercept: New recipe to include postinstall intercepts in =
nativesd
=20=20nativesdk-packagegroup-sdk-host: Adding nativesdk-postinst-intercept =
to SDK
=20=20nspr: Added nativesdk to BBCLASSEXTEND
=20=20nss: Add nativesdk to BBCLASSEXTEND and bugfix

Fathi Boudra (1):
=20=20systemtap: add aarch64 support

Khem Raj (15):
=20=20generate-manifest-3.3.py: Add script to generate python 3.3 manifests
=20=20python-3.3-manifest: Add python3 manifest file
=20=20python3native.bbclass: Add python3 abstraction class
=20=20package_rpm.bbclass: Trigger the regexp on exact keyword match
=20=20classes/distutils: Introduce PYTHON_PN
=20=20classes: Add distutils for python3
=20=20distutils: Introduce PYTHON_ABI variable
=20=20python3: Add target and native recipes
=20=20python_2.7.3.bb: Inherit python-dir
=20=20python-distribute: Add recipes for python2 and python3
=20=20python-setuptools: Remove its provided by python-distribute
=20=20binutils: Upgrade to 2.24
=20=20wireless-tools: Upgrade 29 -> 30.pre9
=20=20binutils: Package additional file when using ld-is-gold
=20=20ossp-uuid: Use alternative source mirror

Koen Kooi (2):
=20=20openssh: package sshd PAM config inside openssh-sshd package
=20=20openssh: drag in required PAM modules.

Laszlo Papp (1):
=20=20meta/recipes-core/base-passwd/base-passwd/noshadow.patch: Split it =
into two=20

Laurentiu Palcu (13):
=20=20nasm: upgrade to 2.11
=20=20xextproto: upgrade to 7.3.0
=20=20gdb: upgrade to 7.6.2
=20=20xcb-util-wm: upgrade to 0.4.0
=20=20xtrans: upgrade to 1.3.3
=20=20libdrm: upgrade to 2.4.52
=20=20xkeyboard-config: upgrade to 2.11
=20=20libmpc: upgrade to 1.0.2
=20=20xf86-input-synaptics: upgrade to 1.7.3
=20=20presentproto_git.bb: add recipe
=20=20xf86-video-intel: add compat patch for xorg >=3D 1.14.99.2
=20=20xserver-xorg: upgrade to 1.15.0
=20=20python-pycurl: upgrade to 7.19.3

Marius Avram (1):
=20=20libpng: upgrade to 1.6.8

Mark Hatle (2):
=20=20useradd.bbclass: Fix build time install issues
=20=20useradd.bbclass: Add ability to select a static uid/gid automatically

Noor (1):
=20=20libcgroup: Add bison-native and flex-native in depends

Paul Eggleton (4):
=20=20classes/buildhistory: fix expansion of escape sequences
=20=20classes/buildhistory: write out files in UTF-8 format
=20=20iproute2: split out package for tc
=20=20classes/populate_sdk_base: remove nostamp from do_populate_sdk

Phil Blundell (4):
=20=20base-passwd: Remove unnecessary DEPENDS
=20=20image.bbclass: Also uninstall update-alternatives and shadow for =
read-only-r
=20=20lttng-ust: Move lttng-gen-tp to ${PN}-bin
=20=20rootfs_ipk: Ensure that BAD_RECOMMENDATIONS are honoured for all =
architectur

Randy MacLeod (1):
=20=20jpeg and directfb: cosmetic, fix perms for patches

Richard Purdie (5):
=20=20insane: Fix python function whitespace changes
=20=20tcl-native: Depend on zlib-native
=20=20sstate: Improve funciton checksums
=20=20systemd-compat-units: Handle nfs scripts
=20=20binutils: Add backports to resolve systemd (from git) breakage

Ross Burton (11):
=20=20glib-2.0: fix handling of skipped tests
=20=20oeqa/runtime/systemd: remove race in settle()
=20=20dbus: mask the dbus-1 init script if using systemd
=20=20systemd-compat-units: don't mask dbus, the recipe does this itself
=20=20systemd: add a hard dependency on udev=3D$EXTENDPKGV
=20=20glib-2.0: fix race in parallel builds
=20=20distcc: rename systemd service to distcc
=20=20pcmanfm: apply a patch to the source, not a generated file
=20=20gnome-desktop-testing: upgrade to 2014.1
=20=20gdk-pixbuf: enable ptest
=20=20binconfig: mangle ${base_libdir}

Saul Wold (1):
=20=20rootfs_deb: Fix whitespace issue

Sipke Vriend (1):
=20=20lib/oeqa: allow multiple layers to provide their own TEST_TARGET class

Stefan Stanacar (4):
=20=20testimage: add ability to export tests
=20=20lib/oeqa: add module for running tests outside of the build system
=20=20oeqa/utils: targetbuild: don't use bb.fetch anymore
=20=20scripts/oe-selftest: return based on the test results

Tom Zanussi (8):
=20=20wic: Move some common items to oe.misc
=20=20wic: Create and use new functions for getting bitbake variables
=20=20wic: Add wic-specific bootloader subclass
=20=20wic: Add SourcePlugin class
=20=20wic: Add BootimgEFIPlugin and BootimgPcbiosPlugin
=20=20wic: Hook up BootimgEFIPlugin and BootimgPcbiosPlugin plugins
=20=20wic: Hook up --debug option
=20=20wic: Honor --size for --source partititions

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Martin Jansa (1):
=20=20busybox: rename .bbappend to match new version from oe-core

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Khem Raj (1):
=20=20angstrom-uclibc: Switch to using libiconv and gettext

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Chase Maupin (9):
=20=20branding-glsdk: pin to GLSDK libdrm version
=20=20arago-prefs: set PREFERRED VERSION of libdrm to latest
=20=20tisdk-image: change to regex matching
=20=20arago-source-ipk: Add Keystone sourceipk settings
=20=20tisdk-amsdk-sdk-host: remove pinmux for keystone devices
=20=20arago-base-tisdk-image: add keystone support
=20=20arago-core-tisdk-image: add support for keystone devices
=20=20mmc-utils: add mmc-utils for working with eMMC devices
=20=20tisdk-addons: add mmc-utils package

Franklin S. Cooper Jr (9):
=20=20dual-camera-demo: Pull in latest commits of camera demo
=20=20ti-tisdk-makefile: Update U-boot makefile
=20=20wl18xx-firmware: Add Makefile as a patch
=20=20Update recipes to pull in Makefile changes
=20=20tisdk-install: Use updated environment variable
=20=20ti-tisdk-makefile: Update Makefile stubs
=20=20cryptodev: Autoload cryptodev module
=20=20ti-tisdk-makefile: Update kernel and device tree stubs Makefile stubs
=20=20ti-tisdk-makefile: Fix dual camera demo stub

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-beagleboard:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-browser:

Diego Rondini (1):
=20=20chromium: Fix build with nss 3.15

Martin Jansa (1):
=20=20Update after toplevel LICENSE file checksum change

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

Carlos Rafael Giani (2):
=20=20eglinfo: Add i.MX6 specific support
=20=20gstreamer1.0-imx: Add GStreamer 1.0 plugins

Rogerio Nunes (2):
=20=20imx-test: add missing runtime dependency
=20=20gpu-viv-g2d: Split libg2d package

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

Alexandre Belloni (1):
=20=20cfa100xx.conf: add myself as maintainer

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-ppc:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-guacamayo:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix-community:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-handheld:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-igep:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

Holger Behrens (2):
=20=20TEMPLATECONF: add template local.conf & bblayers.conf files
=20=20busybox: follow upstream to 1.22.1

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-java:

Henning Heinold (1):
=20=20Merge pull request #51 from mindrunner/master

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

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-slugos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-systemd:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-raspberrypi:

Andrei Gherzan (4):
=20=20sdcard_image-rpi: Add support for u-boot and uImage
=20=20README: Add info about U-Boot support
=20=20u-boot-rpi: Integrate package
=20=20rpi-mkimage: Integrate package

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

Baptiste DURAND (1):
=20=20linux-omap4 3.4: Fix random segfaults and boot issues seen with gcc =
4.8

Denys Dmytriyenko (6):
=20=20am33x-cm3: update with FW version 0x185 aka 05.00.00.02
=20=20linux-ti-staging: update with many fixes for the upcoming release
=20=20u-boot-ti-staging: update with many fixes for the upcoming release
=20=20am33x-cm3: update md5 for license reformat, fix CC unset issue
=20=20linux-ti-staging: update to 3.12.10, merge Audio/Display fixed
=20=20u-boot-ti-staging: update with fixes for NAND partition names and =
sizes

Sam Nelson (3):
=20=20keystone: Add pci feature to MACHINE Keystone
=20=20linux-keystone: Update to linux kernel version 3.10
=20=20linux-keystone-rt: Add new recipe for build rt-kernel

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

Gayathri Srinivasan (3):
=20=20webos-image: pmloglib{-private}=3D49,v3.0.2 pmlogdaemon=3D116
=20=20webos-image: pmloglib=3D50
=20=20webos-image: pmloglib=3D51

Herb Kuta (1):
=20=20webos_no_static_libraries: Add bbclass to control static library usage

Iyad Qumei (2):
=20=20webos-image: Correct LICENSE for various upstream components
=20=20eglibc: Correct licensing of eglibc packages

Martin Jansa (8):
=20=20webos.inc: Drop include for webos-repositories.inc
=20=20webos-image: Remove dropbear from end-user hardware production images
=20=20webos-image: Invent "webos-production-image" value for IMAGE_FEATURES
=20=20webos_version: Allow the branch to be specified
=20=20webos_enhanced_submissions: Check that SHA-1 is included in right =
branch
=20=20webos_enhanced_submissions: Temporary remove setting branch in SRC_URI
=20=20prepare-submission.sh: Allow non-numeric submissions
=20=20libpam: Depend only on native bison not target one, add libxml2-native

Sapna Todwal (1):
=20=20webos-image: sleepd=3D30

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

Nathan Rossi (4):
=20=20binutils: Update for binutils 2.24
=20=20binutils-microblaze-2.24.inc: Fix file path error
=20=20README: Update README

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Laszlo Papp (1):
=20=20package_regex.inc: fix a minor typo

Mark Hatle (1):
=20=20useradd.bbclass: Add ability to select a static uid/gid automatically

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



