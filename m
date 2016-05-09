Return-Path: <cliff.brake@gmail.com>
Received: from mail-qg0-f66.google.com (mail-qg0-f66.google.com
	[209.85.192.66])
	by mail.openembedded.org (Postfix) with ESMTP id 16CF47317C;
	Mon,  9 May 2016 15:32:10 +0000 (UTC)
Received: by mail-qg0-f66.google.com with SMTP id f74so11747131qge.3;
	Mon, 09 May 2016 08:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:mime-version:message-id:from:to:subject
	:content-transfer-encoding;
	bh=PS/Y017svdnkk0qrLxYMAIdM3Ua+/0PShDEGKjxcEDY=;
	b=Y6cdGne7PNvEdQ+czTNgFZAx6K1Zd4hGFaXD7v5xE8piex9dvSlZVpaZLJ1mEa4HcT
	c8zoY2y8XqzZfsVRQUvQV7hDT0dEg4Vz2/YclxzhT+fihxMRPBXR1YND2cYRrSFMclNJ
	WI3OG2HoNpMaIkECejYLv+WsAaU4OMhZpDIl3y9qMRVeMk01xyGnwOPaNRG1V4YLwn0w
	+M49+dYn+w+05Ux0l6S9aQLByhv7Z8UIbY2cmRfQrp3seD/x7z/VaO2304rKr2fOTNzA
	706aI/cwBvvWtZ6ks6G0YYgw14c7ulO9Goo1kw11Hw58BCmVLXi490db9zo3EwotqN/9
	HOZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:mime-version:message-id:from:to:subject
	:content-transfer-encoding;
	bh=PS/Y017svdnkk0qrLxYMAIdM3Ua+/0PShDEGKjxcEDY=;
	b=g/w31cu9T9Mb/lY4sjpveR8P+SQA3D0k3E4smcIhc/GHjrjaNzglY/AD0vBxUY1lhU
	pVfRPXi0VetOBYGBDH+dX6g8XZnJ2oP75M993/N4vdxYhpNFsC/5gImjhXKlViWhelPE
	Q9c/9BHDqs1OnA2P2XZf832nwCrMuDKvwY//haK+ZpPNPxHT34fSjW7Mq6VldWus4zbb
	OpPktelSEmnfIY5SzpchLai76+GGVn796QFY2TDnd79kX/0MMplOVHJVbFHr4z19OQr7
	IeoRI5Gic6Qdt+HUIKSYS6AJHvVNKiwVCXJ+sV0rrR6nh+QvrDT+6lfhfpn7wQshUnIu
	D96g==
X-Gm-Message-State: AOPr4FWgQXehRNvrkOPhQ4Anf2GhW343bTQqD7VzskFdz5sPGZgcas81YYWo0POegQjc7Q==
X-Received: by 10.140.235.14 with SMTP id g14mr36099228qhc.86.1462807931345;
	Mon, 09 May 2016 08:32:11 -0700 (PDT)
Received: from [127.0.0.1] (cable-pool5-cs-73.doycomm.com. [66.219.182.73])
	by smtp.gmail.com with ESMTPSA id f89sm133524qkf.4.2016.05.09.08.32.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 09 May 2016 08:32:09 -0700 (PDT)
Date: Mon, 09 May 2016 08:32:09 -0700 (PDT)
X-Google-Original-Date: Mon, 09 May 2016 15:32:08 GMT
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Message-Id: <1462807928384.298887d2@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
Subject: OE Changelog since 2016-05-01 until 2016-05-08
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
X-List-Received-Date: Mon, 09 May 2016 15:32:13 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2016-05-01 until 2016-05-08.  Projects included in this =
report:

bitbake: git://git.openembedded.org/bitbake
openembedded-core: git://git.openembedded.org/openembedded-core
meta-openembedded: git://git.openembedded.org/meta-openembedded
meta-angstrom: git://github.com/Angstrom-distribution/meta-angstrom.git
meta-arago: git://arago-project.org/git/meta-arago.git
meta-atmel: https://github.com/linux4sam/meta-atmel.git
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
https://github.com/schnitzeltony/meta-gumstix-community.git
meta-handheld: git://git.openembedded.org/meta-handheld
meta-igep: http://github.com/ebutera/meta-igep.git
meta-intel: git://git.yoctoproject.org/meta-intel
meta-ivi: git://git.yoctoproject.org/meta-ivi
meta-java: git://github.com/woglinde/meta-java
meta-jetson-tk1: https://github.com/cubicool/meta-jetson-tk1.git
meta-kde: git://gitorious.org/openembedded-core-layers/meta-kde.git
meta-micro: git://git.openembedded.org/meta-micro
meta-mono: git://git.yoctoproject.org/meta-mono.git
meta-netbookpro: git://github.com/tworaz/meta-netbookpro
meta-nodejs: https://github.com/imyller/meta-nodejs.git
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

Christopher Larson (7):
=20=20bb.build: handle __builtins__ as a module
=20=20bb.event: handle __builtins__ as a module
=20=20bb.data_smart: use iter() for __len__
=20=20bb.utils: add load_plugins from scriptutils
=20=20bb.utils: use imp.get_suffixes for load_plugins
=20=20bb.utils: let loaded plugins provide a plugin object
=20=20bb.{cooker, data}: only emit a var as python if 'func' is set

Leonardo Sandoval (1):
=20=20bitbake: fetch2: Safer check for BB_ORIGENV datastore

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Alexander Kanavin (1):
=20=20arch-powerpc64.inc: disable the use of qemu usermode on ppc64

Andr=C3=A9 Draszik (1):
=20=20tune-mips32r2.inc: add soft-float variants

Awais Belal (1):
=20=20mesa-demos: remove demos using obsolete screen surface

Carlos Rafael Giani (3):
=20=20gstreamer1.0-plugins-ugly: upgrade to version 1.8.1
=20=20gstreamer1.0-libav: upgrade to version 1.8.1
=20=20gstreamer1.0-rtsp-server: upgrade to version 1.8.1

Christopher Larson (5):
=20=20scripts/lib/argparse_oe: show self.prog in the error message
=20=20scripts/lib/argparse_oe: show subparser help for unrecognized args
=20=20scripts/lib/argparse_oe: simplify options title change
=20=20scripts/lib/argparse_oe: also change 'positional arguments' to =
'arguments'
=20=20ddimage: if 'pv' is installed, use it

Denys Dmytriyenko (1):
=20=20arch-armv7ve: inherit armv7a tunes file

Ed Bartosh (8):
=20=20wic: use truncate utility to create sparse files
=20=20wic: get rid of inheritance Disk->DiskImage
=20=20wic: get rid of fs_related.makedirs
=20=20wic: moved DiskImage to direct.py
=20=20wic: add FIEMAP and SEEK_HOLE / SEEK_DATA APIs
=20=20wic: add sparse_copy API
=20=20wic: use sparse_copy to copy partitions
=20=20wic: use sparse_copy to preserve sparseness

Joshua Lock (2):
=20=20security_flags: turn potential string format security issues into an =
error
=20=20packagegroup-core-lsb: fix whitespace in meta-qt* warnings

Maxin B. John (3):
=20=20popt: fix dependencies and QA Issue
=20=20bash: fix dependencies and QA Issue
=20=20libxml2: fix dependencies and QA Issues

Paul Eggleton (2):
=20=20recipetool: create: fix picking up false npm package directories
=20=20recipetool: create: fix falling back to declared license for npm =
packages

Richard Purdie (2):
=20=20meta-selftest/images: Add LIC_FILES_CHKSUM to images using =
image.bbclass
=20=20test-empty-image: Fix LIC_FILES_CHKSUM typo

Robert Yang (6):
=20=20insane.bbclass: remove workdir from package_qa_check_license()
=20=20insane.bbclass: package_qa_check_license -> populate_lic_qa_checksum
=20=20packagegroup.bbclass: set LICENSE and LIC_FILES_CHKSUM
=20=20packagegroup-foo.bb: remove LICENSE =3D "MIT"
=20=20meta-world-pkgdata: add LIC_FILES_CHKSUM
=20=20libxsettings-client: fix COPYING file

Ross Burton (11):
=20=20autotools: add default for CACHED_CONFIGUREVARS
=20=20python-pygobject: remove redundant gnome-common dependency
=20=20gnome-desktop3: remove redundant gnome-common dependency
=20=20webkitgtk: remove gnome-common dependency
=20=20qemu: remove explicit but redundant native build dependencies
=20=20mesa-gl: add missing MESA_CRYPTO to PACKAGECONFIG
=20=20oeqa/selftest/buildoptions: remove buildhistory signature test
=20=20eudev: add PACKAGECONFIG for hwdb
=20=20dbus-test: install executables not libtool wrapper scripts
=20=20mesa: add PACKAGECONFIG for gbm
=20=20bitbake.conf: change APACHE_MIRROR to point at archive.apache.org

Roy Li (1):
=20=20curl: add krb5 to PACKAGECONFIG

Stephano Cetola (2):
=20=20toolchain-scripts: replace source built-in call
=20=20sysvinit-inittab: restrict labels to 4 chars

Tristan Van Berkom (1):
=20=20cross-localedef-native_2.22.bb: Use autotools configure

Yannick Gicquel (4):
=20=20u-boot: basic support of dtb append for verified boot
=20=20u-boot: deploy u-boot-nodtb and dtb files
=20=20kernel: fitimage: support device tree compiler options
=20=20kernel: fitimage: basic support for fitimage signature

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Andreas M=C3=BCller (5):
=20=20meta-xfce: add intltool-native to DEPENDS
=20=20xfce-polkit: fix warning not able to copy license
=20=20fluidsynth: set correct portaudio packageconfig dependency
=20=20xfce4-cpufreq-plugin: update to 1.1.3
=20=20xfce4-eyes-plugin: update to 4.4.5

Ann Thornton (1):
=20=20packagegroup-tools-bluetooth.bb: Selects the tools appropriate for =
the versi

Armin Kuster (2):
=20=20ntp: Security fixes via update to 4.2.8p7
=20=20wireshark: update package to 2.0.3

Bruno Bottazzini (1):
=20=20libmicrohttpd: update to 0.9.49

Catalin Enache (2):
=20=20proftpd: CVE-2016-3125
=20=20squid: CVE-2016-3947

Christophe PRIOUZEAU (1):
=20=20netdata: add new recipe

Christopher Larson (2):
=20=20fbida: use separate builddir
=20=20sox: dep on ffmpeg, not libav

Derek Straka (11):
=20=20netdata: fix whitespace in the patch that caused failures when =
applying
=20=20netdata: replace deprecated 'base_contains' with 'bb.utils.contains'
=20=20fribidi: update to version 0.19.7
=20=20fio: update to version 2.9
=20=20iozone3: update to version 434
=20=20iperf3: update to version 3.1.2 plus bug fixes
=20=20nginx: update stable version to 1.10.0
=20=20nginx: update to version 1.9.15
=20=20tinymembench: update to version 0.4.0 plus bug fixes
=20=20fbreader: add cflags fix for fribidi 0.19.7
=20=20python-pyparsing: modify build to correctly use setuptools rather =
than distu

Eduardo Silva (1):
=20=20fluentbit: add new recipe

Herrie (1):
=20=20pidgin: Update to 2.10.12

Ioan-Adrian Ratiu (2):
=20=20openconnect: add missing dependencies
=20=20syslog-ng.inc: fix prerm script & class includes

Khem Raj (1):
=20=20ltrace: Remove deprecated readdir_r()

Li xin (2):
=20=20rp-pppoe: Fix rootfs creation errors
=20=20ltrace: Error Fix for ARM

Mark Asselstine (1):
=20=20samba: remove dependency on ctdb

Martin Jansa (4):
=20=20sblim-sfcb: add missing dependency on unzip-native
=20=20pidgin: add PACKAGECONFIGs
=20=20pidgin: use pkg-config instead of hardcoded paths or python-config
=20=20poppler: add --std=3Dc++11 to fix build with Qt 5.7

Neena Busireddy (1):
=20=20glmark2: wl_surface should be destoryed after destroying wl_window

Otavio Salvador (1):
=20=20opencv: Fix metapkg dependencies for opencv-java and opencv-locales

Paul Barker (3):
=20=20vim: Upgrade to v7.4.1689
=20=20toybox: Remove out-of-date patch
=20=20toybox: Upgrade to 0.7.0

Philip Balister (1):
=20=20thrift: Add recipe for Apache Thrift.

Qi.Chen@windriver.com (2):
=20=20dovecot: fix QA issue and remove from blacklist
=20=20rrdtool: fix do_configure failure on some hosts

Ross Burton (1):
=20=20meta-networking: use bb.utils.contains() instead of base_contains()

Zhu Yanjun (1):
=20=20net-snmp: enable ipv6 support

eu@felipetonello.com (2):
=20=20protobuf: add protobuf-c recipe
=20=20protobuf: split package to main and compiler packages

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Denys Dmytriyenko (11):
=20=20busybox: finally drop local copies of inetd files
=20=20arago.conf: 32-bit SDK hosts no longer supported, drop NO32LIBS
=20=20packagegroup: remove unused file
=20=20recipes: replace remaining base_contains with bb.utils.contains
=20=20php, libdrm: make local patches version-agnostic
=20=20cryptodev-module: drop local patch, make bbappend version-agnostic
=20=20oprofile: drop unneeded bbappend
=20=20arago.conf: don't disable sysvinit distro feature to get old =
initscripts
=20=20common-csl-ip-rtos: depend on doxygen-native
=20=20branding-core: re-enable SGX, as driver fixes went in
=20=20HACK: matrix-gui-3d-demos: disable another instance of omapdrmtest =
dependenc

Jacob Stiffler (2):
=20=20ocl: Bump SRCREV to version 1.1.8.1
=20=20opencl-examples: examples with openmp need to link with libdl

Karthik Ramanan (2):
=20=20gstreamer1.0-plugins-bad: Update SRCREV
=20=20gstreamer1.0-plugins-ducati: Update SRCREV

Sam Nelson (1):
=20=20doxygen: Update to work with flex 2.6.0

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-atmel:

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

Carlos Rafael Giani (1):
=20=20libimxvpuapi: Update to version 0.10.2

Dominic Sacr=C3=A9 (1):
=20=20linux-fslc-imx-rt: Upgrade to 4.1.15-1.0.0 GA

Otavio Salvador (3):
=20=20imx-gpu-viv: Remove dead code
=20=20imx-gpu-viv: Rework code so it is easier to read
=20=20linux-fslc-imx: Bump revision to deb84cd

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

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

California Sullivan (1):
=20=20linux-yocto/4.4: Update SRCREVs for Broxton enablement

Ong Chun Weng (1):
=20=20linux-yocto-4.4: Update SRCREVs to latest

Saul Wold (1):
=20=20linux-firmware: Add -19 version to support iwlwifi-8000c drivers

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-java:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-jetson-tk1:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-kde:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-micro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-mono:

Alex J Lennon (2):
=20=20mono: add support for mono 4.4.0.148
=20=20README: add notes on testing mono 4.4.0.148

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-netbookpro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nodejs:

Ilkka Myller (11):
=20=20bower: 1.7.9 - 2016-04-05
=20=20grunt-cli: v1.2.0 2016-04-01
=20=202016-05-05, Version 4.4.4 'Argon' (LTS)
=20=202016-05-05, Version 5.11.1 (Stable)
=20=202016-05-05, Version 6.1.0 (Current)
=20=202016-05-06 Version 0.10.45 (Maintenance) Release
=20=202016-05-06 Version 0.12.14 (Maintenance) Release
=20=20Merge pull request #35 from mbroadst/fix-target-arch
=20=20Renamed nodejs-arch mapping class
=20=20Update README.md
=20=20Match directory layout with Yocto core

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nslu2:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-opie:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-qt3:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-qt5:

Andreas M=C3=BCller (1):
=20=20replace base_contains by bb.utils.contains

Martin Jansa (4):
=20=20qt5: upgrade to latest revisions in 5.7 branches
=20=20qtbase: Remove unsupported options xvideo, xinerama, xinput, gtkstyle
=20=20qtbase: remove fonts packages
=20=20qtwebkit: add PACKAGECONFIGs for libxcomposite, libxrender, fontconfig

Samuli Piippo (1):
=20=20qt5: add one more subfolder for ${PN}-qmldesigner

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

Anand Balagopalakrishnan (2):
=20=20ti-sgx-ddk-um: update srcrev and bump PR
=20=20ti-sgx-ddk-km: update srcrev and branch name, bump PR

Denys Dmytriyenko (7):
=20=20recipes: replace remaining base_contains with bb.utils.contains
=20=20ti-unpack: update for new Ubuntu 32bit lib packaging
=20=20linux-ti-staging: update with latest fixes, add new DTBs
=20=20eudev: install the new firmware rule
=20=20machines: configure all used consoles regardless of UART driver
=20=20linux-ti-staging: 4.4.9 with SGX, A/D, platform, connectivity, rpmsg =
updates
=20=20u-boot-ti-staging: 2016.05-rc3 with K2, PRU and other updates

Jacob Stiffler (1):
=20=20openmp-rtos: Add zip-native as a dependency

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

Jason Wu (10):
=20=20linux/config: Add config fragments for Xilinx DRM
=20=20linux/config: Add keyboard gpio cfg and scc
=20=20linux-xlnx-dev: Update kernel version from 4.0+ to 4.4+
=20=20linux/config: Add config fragments for Zybo sound support
=20=20linux/config: Add config fragment for enabling v4l2
=20=20conf/machine: Add zybo-linux-bd-zynq7 machine support
=20=20linux-xlnx: Add Digilent encoder and axi dynclk drivers
=20=20linux/config: Add config fragments for Digilent DRM encoder
=20=20zybo-linux-bd-zynq7: Enable required kernel drivers
=20=20u-boot_2016.03: Add SPL load bitstream and uEnv.txt support

Manjukumar Matha (6):
=20=20linux-xlnx_4.4.bb: Update to xilinx-v2016.1 tag
=20=20machine-xilinx-default.inc: Default to v4.4 kernel
=20=20u-boot-xlnx_2016.01.bb: v2016.1 release tag
=20=20arm-trusted-firmware_git.bb: Tag to xilinx-v2016.1
=20=20external-xilinx-toolchain: Remove toolchain support
=20=20zcu102-zynqmp.conf: Add support for ZCU102 board

Nathan Rossi (5):
=20=20zybo-linux-bd.bb: Add sysroot population of ps7_init files
=20=20linux-xlnx_4.4: Add patch to resolve DPMS issues
=20=20zybo-linux-bd-zynq7: Force default kernel and u-boot
=20=20u-boot-spl-zynq-init.inc: Add variable to trigger platform overwriting
=20=20zybo-linux-bd-zynq7: Use FORCE_PS7INIT to override platform-init

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



