Return-Path: <cliff.brake@gmail.com>
Received: from mail-ie0-f174.google.com (mail-ie0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 612AE65FC8;
	Mon,  9 Jun 2014 19:32:09 +0000 (UTC)
Received: by mail-ie0-f174.google.com with SMTP id lx4so3001579iec.19
	for <multiple recipients>; Mon, 09 Jun 2014 12:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:mime-version:message-id:from:to:subject:content-type
	:content-transfer-encoding;
	bh=MSjHLy4VVyOKrRF4Dxs5YDK+3RBDkdzWvQauY9COy6s=;
	b=p+LF+FO2HfTlVZKfOjyIHs8xL4GQr+y0OmKePiQ3+yswXdSdMRmJnQut30tsUdFmbj
	8cG4+MLdZdLbZ2bvd8j+vFbHia0A1NNzTQmEu9yyjWrNQZ+GtLoWQN/FBGwKPfjP+BDa
	hPd6OVP2kFcQBDMyL6hbCaN97AJL58YDeSmRbN+Dv9VjqB6vZBTWm1AxoDdQQzkmAmxG
	l/DapM6dtIqay4eAUhHXNrpe5VW8pHufgT3v0urXKGgNNXD16vDQOjRctoKdTC0KCkKm
	Bx6/9RFl7i0Zr1N6gza/4CJevv1YvC5OM+o4+mWEnoDoM5xuUQroXvTuZmqdA+RsbBAl
	xqxA==
X-Received: by 10.50.50.141 with SMTP id c13mr20879599igo.0.1402342330299;
	Mon, 09 Jun 2014 12:32:10 -0700 (PDT)
Received: from happy.bec-systems.com (cable-pool6-cs-200.doycomm.com.
	[66.219.185.200])
	by mx.google.com with ESMTPSA id mi4sm33820082igb.5.2014.06.09.12.32.08
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Jun 2014 12:32:09 -0700 (PDT)
Date: Mon, 09 Jun 2014 12:32:09 -0700 (PDT)
X-Google-Original-Date: Mon, 09 Jun 2014 19:32:07 GMT
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Message-Id: <1402342327849.cc64ce3c@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
Subject: OE Changelog since 2014-06-01 until 2014-06-08
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
X-List-Received-Date: Mon, 09 Jun 2014 19:32:13 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2014-06-01 until 2014-06-08.  Projects included in this =
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

Alexandru DAMIAN (9):
=20=20bitbake: move configuration reading code
=20=20xmlrpc: client - remove fatal errors
=20=20uievent: retry on handler registration failure
=20=20toaster: read database settings from the environment
=20=20toaster: startup script noweb mode
=20=20toaster: startup script standalone mode
=20=20toaster: update toaster to run in managed mode
=20=20toaster: add project related models
=20=20toasterui: fix django settings environment value

Ash Charles (1):
=20=20bitbake: show wildcard appends for bitbake-layers

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Alex J Lennon (1):
=20=20gstreamer1.0-rtsp-server: Add recipe to support gst-rtsp-server

Alexandru DAMIAN (1):
=20=20toaster.bbclass: exclude variable dependency on toaster postfunc

Armin Kuster (2):
=20=20Update tzcode to 2014d for zic fix
=20=20Update tzdata to 2014d

Chen Qi (5):
=20=20grep: upgrade 2.18 to 2.19
=20=20systemd: update a uclibc specific patch to avoid segment fault error
=20=20gawk: upgrade from 4.0.2 to 4.1.1
=20=20file: upgrade from 5.17 to 5.18
=20=20autogen-native: upgrade from 2.18.2 to 2.18.3

Cristian Iorga (2):
=20=20v86d: fix for SeaBIOS VGA BIOS compatibility
=20=20qemu: upgrade to 2.0.0

Drew Moseley (3):
=20=20mesa-demos: Build with system data files
=20=20mesa-demos: Add missing data files.
=20=20mesa-demos: Use DEMOS_DATA_DIR.

Hongxu Jia (3):
=20=20elfutils: upgrade to 0.158
=20=20apr-util: upgrade to 1.5.3
=20=20apr: upgrade to 1.5.1

Jo=C3=A3o Henrique Ferreira de Freitas (2):
=20=20wic: default plugin type directory should be added only once
=20=20wic: check if BBLAYERS is valid before use

Khem Raj (1):
=20=20x264: Update SRCREV to match commit in upstream git repo

Lucian Musat (1):
=20=20Added new test cases for bitbake modes (-e -n -p -r -R -c -k)

Matt Fleming (2):
=20=20generate-manifest-3.3.py: Add importlib
=20=20generate-manifest-2.7.py: Add importlib

Paul Eggleton (4):
=20=20qt4: upgrade to version 4.8.6
=20=20qt4: add patch for GIF denial-of-service vulnerability
=20=20libarchive: avoid dependency on e2fsprogs
=20=20libxml2: fix python packaging for nativesdk

Richard Purdie (9):
=20=20libfm: Ensure m4 directory exists
=20=20recipes: Add missing pkgconfig class inherits
=20=20lame: Add missing DEPENDS on gettext-native
=20=20gsettings-desktop-schemas: Add missing DEPENDS on =
gobject-introspection-stub
=20=20libcroco/libfm/menu-cache: Add missing gtk-doc class dependencies
=20=20oprofileui-server/oprofileui/pcmanfm: Add missing intltool-native =
DEPENDS
=20=20sanity.bbclass: Add libsdl-native check
=20=20image_types: Fix ubi filesystem return codes
=20=20neard: fix for parallel build

Ross Burton (5):
=20=20diffstat: fix autoheader warning due to missing AC_DEFINE template
=20=20diffstat: patches have now been submitted upstream
=20=20readline-5.2: use upstream's aclocal.m4 as acinclude.m4
=20=20readline-5.2: exclude autoheader
=20=20autoconf: don't disable the autoheader warnings

Roy Li (2):
=20=20grub-2.00: remove our 40_custom
=20=20grub-2.00: remove our 40_custom

Saul Wold (10):
=20=20libxkbcommon: Update to 0.4.2
=20=20libcheck: Update to 0.9.13
=20=20libffi: Update to 3.1
=20=20man-pages: Update to 3.68
=20=20cups: Update to 1.7.3
=20=20resolvconf: Update to 1.75
=20=20freetype: enable 64 bit file support
=20=20fontconfig: enable 64 bit file support
=20=20update-rc.d/useradd: Add additional dependecies
=20=20busybox: put udhcpc in background

Tim Orling (2):
=20=20cogl: update to 1.18.0
=20=20clutter: update to 1.18.2

Trevor Woerner (1):
=20=20grub_git: fix build warning->error

Valentin Popa (1):
=20=20gnutls: upgrade to 3.2.15

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Alexandre Fournier (1):
=20=20net-snmp: install net-snmp-config script to STAGING_BINDIR_CROSS

Dan McGregor (1):
=20=20netcat-openbsd: fixup patching

Eduardo Silva (1):
=20=20monkey: add Monkey HTTP Server

Jack Mitchell (1):
=20=20ntp: fix incorrect pidfile handling in ntpd init script

Maxim Uvarov (1):
=20=20update snort to 2.9.6.0

Mihaela Sendrea (2):
=20=20lksctp-tools: add recipe (version 1.0.16)
=20=20netperf: enable SCTP support

Tim Orling (10):
=20=20libtext-diff-perl: add 1.41
=20=20libcapture-tiny-perl: add 0.24
=20=20libmodule-runtime-perl: add 0.014
=20=20libextutils-config-perl: add 0.007
=20=20libextutils-helper-perl: add 0.022
=20=20libextutils-installpaths-perl: add 0.010
=20=20libmodule-build-tiny-perl: add 0.036
=20=20libextutils-cppguess-perl: add 0.07
=20=20libalgorithm-diff-perl: add 1.15
=20=20libtest-harness-perl: add 3.30

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Denys Dmytriyenko (5):
=20=20qt-tstat: fix install with Qt5, broken by latest change
=20=20refresh-screen: convert to Qt5
=20=20arago-prefs: make ARAGO_QT_PROVIDER aware of Qt5
=20=20packagegroup-*-qt5: add Qt5 versions of arago packagegroups
=20=20tisdk-rootfs-image: use correct packagegroup for Qt4/Qt5

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-beagleboard:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-browser:

Carlos Rafael Giani (1):
=20=20chromium: Upgrade to version 35.0.1916.114

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

Alexey Ignatov (2):
=20=20image_types_fsl.bbclass: Add U-Boot NAND support for i.MX23/i.MX28
=20=20imx28evk: Add U-Boot NAND image generation support

Carlos Rafael Giani (1):
=20=20imx-base.inc: Add values for i.MX GStreamer 1.0 plugins

Jacob Kroon (1):
=20=20linux-imx-rt: Enable CONFIG_FHANDLE

Lauren Post (1):
=20=20weston: Upgrade patches to 1.5 with GPU integration

Thomas Senyk (1):
=20=20qtmultimedia: Fix zero-copy patch for imx6 so that the plugin will be =
build

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-ppc:

Chunrong Guo (1):
=20=20conf/machine/*.conf: Rework information header

Fahad Arslan (1):
=20=20conf/machine/*.inc: install kernel-modules package for FSL PPC targets

chunrong guo (1):
=20=20qemu: add libssh2 options in configure

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-guacamayo:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix-community:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-handheld:

Andrea Adami (3):
=20=20linux-yocto_3.14: hx4700: v 3.14.4: remove upstreamed patch
=20=20linux-yocto_3.14: collie: remove detection hack
=20=20linux-yocto(-tiny-kexecboot)_3.10: collie: remove detection hack

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-igep:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Chan Wei Sern (2):
=20=20meta-crystalforest: fix email address for crystalforest  maintainer
=20=20meta-romley: fix email address for romley  maintainer

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-java:

Henning Heinold (2):
=20=20cacao-initial: switch to autotools-brokensep
=20=20cacao: switch to autotools-brokensep

Martin R=C3=B6sch (1):
=20=20Added patch to fix build of package classpath-0.99 with the freetype2 =
librar

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

Paul Eggleton (5):
=20=20qte: port QSound to use ALSA
=20=20opie-image*: drop LIC_FILES_CHKSUM
=20=20packagegroup-xqtlauncher: drop LIC_FILES_CHKSUM
=20=20packagegroup-opie-toolchain-target: drop LIC_FILES_CHKSUM, inherit =
packagegr
=20=20libqpe-opie: do not poke files into the sysroot

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-qt3:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-qt5:

Otavio Salvador (1):
=20=20qt5.inc: Fix packaging of plugins

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

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

Alexandr Smoktal (1):
=20=20webos-image: luna-service2=3D192,v3.9.1

Andrii Motsok (1):
=20=20webos-image: gtest=3Dr2

Andrii Zora (1):
=20=20webos-image: libpbnjson=3D36,v2.8.0

Eric Blade (1):
=20=20sqlcipher: don't build with TCL support

Iyad Qumei (1):
=20=20webos_enhanced_submissions: Fix various SRCREV sanity check failures

Kyrylo Kropivyanskiy (3):
=20=20webos-image: curl=3Dv7.29.0-0webos1
=20=20webos-image: libjson=3D0 add json-c=3Dv0.11
=20=20upstart: Switch from cjson to json-c

Martin Jansa (4):
=20=20webos-image: libpalmsocket=3D32
=20=20webos_enhanced_submissions.bbclass: Run git remote update when sanity =
fails
=20=20luna-*: Replace <integer>.<integer> submissions with just <integer>
=20=20enyo-1.0: Add branch parameter, introduce ENYOJS_GIT_REPO_COMPLETE

Nikolay Orliuk (1):
=20=20webos_version.bbclass: Allow branch names with dots

Oleksii Rudenko (1):
=20=20webos-image: luna-service2=3D193,v3.9.2

Sergey Olendarenko (3):
=20=20webos-image: libgcrypt=3Dv1.5.0-0webos1
=20=20webos-image: gnutls=3Dv2.12.23-0webos1
=20=20webos-image: gzip=3Dv1.3.12-0webos1

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

Nathan Rossi (1):
=20=20qemu: Update qemu to version 2.0.0

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Corneliu Stoicescu (1):
=20=20oeqa/controllers/beaglebonetarget.py: fix conditions for files copied =
to /bo

Saul Wold (2):
=20=20poky-tiny: Update kernel version to 3.14
=20=20busybox: fix meta-yocto's bbappend's FILESEXTRAPATH

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



