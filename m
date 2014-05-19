Return-Path: <cliff.brake@gmail.com>
Received: from mail-ie0-f178.google.com (unknown [209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id B144265F11;
	Mon, 19 May 2014 18:38:23 +0000 (UTC)
Received: by mail-ie0-f178.google.com with SMTP id rl12so2643758iec.23
	for <multiple recipients>; Mon, 19 May 2014 11:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:from:to:subject:content-type
	:content-transfer-encoding;
	bh=GdrZrVxH5g0PV0BlxUgecyRzPmzG1PT4v64ZRGa0teY=;
	b=TLNDqvUisSIGrT0li0Zy9flaQijeqyNdcA6j34dHjyVV4axTVrdvVBD5L0bsZjBi7F
	Zkw4i3htinK+saTIehpryg9osz5veAHvN0t33UVXOH9PXpPHA5usTJyqmRA5f0yFTC1t
	0rQsyFm2hznl13LPykqpzJDfq15ehAwbgyavweb9vZ/+BntgdzpQxIOJOiYBF4Xzlmaa
	MdLB1g/0vPUyiO7HJ+7kqSkzHtniR/9aoJ5dArhLwtBOfCaIS2qjYm6FpKVHDvKvCfvR
	5mtYP2k+h+0GcXdatJGJs3o3sqMmduRwZcQd4vjrwK2zvrsSa2CNLvMSAq50o/9F9Wk+
	Lp5Q==
X-Received: by 10.42.47.208 with SMTP id p16mr12833282icf.16.1400524703956;
	Mon, 19 May 2014 11:38:23 -0700 (PDT)
Received: from happy.bec-systems.com (cable-pool6-cs-200.doycomm.com.
	[66.219.185.200]) by mx.google.com with ESMTPSA id
	fn3sm22757777igb.22.2014.05.19.11.38.21 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 May 2014 11:38:22 -0700 (PDT)
X-Google-Original-Date: Mon, 19 May 2014 18:38:20 GMT
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Date: Mon, 19 May 2014 11:38:22 -0700 (PDT)
Message-Id: <1400524700552.17d67dff@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
Subject: OE Changelog since 2014-05-11 until 2014-05-18
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
X-List-Received-Date: Mon, 19 May 2014 18:38:24 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2014-05-11 until 2014-05-18.  Projects included in this =
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

Andrea Adami (1):
=20=20mips: add tune file for mips32r2 (only hard-float)

Chen Qi (3):
=20=20gdb: add PACKAGECONFIG for babeltrace
=20=20openssh: fix for CVE-2014-2532
=20=20openssh: fix for CVE-2014-2653

Chong Lu (1):
=20=20dbus: Update to 1.8.2 version

Drew Moseley (2):
=20=20mesa-demos: Specify the lib dir properly.
=20=20glib-2.0: Do not use readlink to set target paths.

Gary S. Robertson (1):
=20=20rt-tests: restore erroneously deleted patch files

Hongxu Jia (1):
=20=20pax-utils: upgrade to 0.8.1

Joe Slater (1):
=20=20qemu: define PACKAGECONFIG[] for ssh2

Jo=C3=A3o Henrique Ferreira de Freitas (3):
=20=20wic: Move find_bitbake_env_line() to oe.misc
=20=20wic: add find_artifact() to get a specific bitbake variable
=20=20wic: Extend indirect string connection to support image names and =
rootfs

Koen Kooi (2):
=20=20ca-certificates: generate CAfile for -native in do_install
=20=20curl: make PACKAGES match with FILES/RRECOMMENDS

Laurentiu Palcu (1):
=20=20adt_installer: run autoreconf before configuring opkg

Mark Hatle (1):
=20=20rpm: Fix rpm -V usage

Maxin B. John (1):
=20=20bzip2: fix ptest execution failure

Paul Eggleton (6):
=20=20openssh: update to 6.6p1
=20=20openssh: move packaging definitions to the end
=20=20ethtool: upgrade to 3.14
=20=20nfs-utils: upgrade to 1.3.0
=20=20dropbear: add missing patch header
=20=20libsdl2: upgrade to 2.0.3

Petter Mab=C3=A4cker (13):
=20=20systemtap: remove usage of FILESPATH
=20=20dbus: remove usage of FILESPATH
=20=20gstreamer: remove unused FILESPATH
=20=20trace-cmd: refactoring recipe
=20=20xorg-lib: remove usage of FILESPATH
=20=20mesa: remove usage of FILESPATH
=20=20qemu: remove unused FILESPATH
=20=20linuxdoc-tools: remove usage of FILESPATH
=20=20gcc: remove usage of FILESPATH
=20=20python: remove usage of FILESPATH
=20=20u-boot: remove unused FILESPATH
=20=20uclibc: remove usage of FILESPATH
=20=20eglibc: remove usage of FILESPATH

Richard Purdie (3):
=20=20git: Fix various makefile flags
=20=20rt-tests: Fix warning flag typo
=20=20gstreamer/lame: Better gcc 4.9 fix

Ross Burton (8):
=20=20gst-openmax: fix build with GLib 2.40 onwards
=20=20glib-2.0: upgrade to 2.40.0
=20=20freetype: upgrade to 2.5.3
=20=20gdk-pixbuf: upgrade to 2.30.7
=20=20python-numpy: add Signed-off-by to patches
=20=20json-glib: upgrade to 1.0.0
=20=20systemd: remove tcp-wrappers option
=20=20freetype: disable harfbuzz

Saul Wold (1):
=20=20libusb1: Update to 1.0.18

Tim Orling (1):
=20=20licenses.conf: add AGPL variations

Tudor Florea (1):
=20=20curl: remove inapporpriate file from curl release

Yasir-Khan (1):
=20=20bluez5: Update the bluetooth.conf

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Ben Shelton (7):
=20=20bdftopcf: add recipe
=20=20font-adobe-100dpi: add recipe
=20=20font-adobe-utopia: add recipe
=20=20font-bh-100dpi: add recipe
=20=20font-bh-lucidatypewriter: add recipe
=20=20font-bitstream-100dpi: add recipe
=20=20xorg-fonts-100dpi: add recipe

Changhyeok Bae (1):
=20=20quagga, fim, gpsd, hddtemp, libunwind, lzip: Change the url to =
variable for=20

Diego Rondini (1):
=20=20glmark2: update to version 2014.03

Fathi Boudra (4):
=20=20pm-qa: update to 0.4.9 release
=20=20fwts: update to 14.05.00 release
=20=20acpica: update to 20140424 release
=20=20acpitests: update to 20140424 release

Kai Kang (1):
=20=20fbset: add dependency flex-native

Koen Kooi (1):
=20=20openldap: fix build against gnutls3

Martin Jansa (19):
=20=20elementary: use B =3D "$S"
=20=20libao: add PACKAGECONFIG for alsa and pulseaudio
=20=20navit: add PACKAGECONFIG for imlib2, qt, gtk, sdl
=20=20sox: add PACKAGECONFIG for ao
=20=20tk: Fix build with xft
=20=20xterm: add PACKAGECONFIG for xft
=20=20maliit-framework: add dependency on dbus, gtk+ and gtk+3 for =
deterministic b
=20=20mongodb: add libpcap dependency
=20=20mongodb: update LICENSE AGPLv3 -> AGPL-3.0
=20=20python-efl: add dependency on python-dbus and lua to always build =
edje and e
=20=20azy: fix build for B!=3DS
=20=20lightmediascanner: fix build for B!=3DS
=20=20exalt: fix build for B!=3DS
=20=20rain: fix build for B!=3DS
=20=20flame: fix build for B!=3DS
=20=20ephoto, libeflvala: use autotools-brokensep
=20=20elmdentica: remove autopoint to fix B!=3DS build
=20=20exalt-client: fix build for B!=3DS
=20=20log4cplus: use better file for LIC_FILES_CHKSUM

Matthieu CRAPET (2):
=20=20xdelta3: add optional lzma support
=20=20jq: add new recipe for version 1.3

Paul Eggleton (4):
=20=20modphp: update to 5.5.12
=20=20phpmyadmin: update to 4.2.0
=20=20xdebug: update to 2.2.5
=20=20xdebug: add license file

Tim Orling (1):
=20=20wv: add libpng dependency

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Khem Raj (1):
=20=20angstrom-core-tweaks: Set PACKAGE_CLASSES to be package_ipk

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

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

Otavio Salvador (2):
=20=20u-boot-fslc: Update 2014.01-based version to f5d8030
=20=20linux-fslc: Update 3.14-based branch to c34636a

Prabhu Sundararaj (1):
=20=20qtwebkit: Fix shader generation to be compliant to the specification

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

Andreas M=C3=BCller (6):
=20=20linux-mainline-3.14: fix restart issue on 600MHz overo
=20=20linux-mainline-3.14: fix nonworking nand
=20=20linux-mainline-3.14: update to 3.14.4
=20=20linux-mainline-3.14: export symbols required by powervr modules
=20=20add omap3.inc to get a bit more independent from meta-ti
=20=20linux-mainline-3.14: print out further OMAP3 revision information

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-handheld:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-igep:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Chan Wei Sern (2):
=20=20meta-intel/common: Added do_unpack_append() to Calgary Corpus recipe
=20=20meta-intel/common: Added do_unpack_append() to Canterbury Corpus =
recipe

Darren Hart (1):
=20=20linux-yocto: Update intel-common 3.14 SRCREVs for Baytrail support

Nitin A Kamble (11):
=20=20common: Update linux-yocto_3.10 meta branch SRCREVs
=20=20common: Update linux-yocto-rt_3.10 kernel SRCREVs
=20=20crownbay-noemgd: Use standard/base machine branch for linux-yocto_3.14
=20=20emenlow-noemgd: Use standard/base machine branch for linux-yocto_3.14
=20=20fri2-noemgd: Use standard/base machine branch for linux-yocto_3.14
=20=20crownbay: Update kernel branch SRCREVs for linux-yocto_3.14
=20=20emenlow: Update kernel branch SRCREVs for linux-yocto_3.14
=20=20fri2: Update kernel branch SRCREVs for linux-yocto_3.14
=20=20crownbay-noemgd: Use the common v3.14 kernel
=20=20fri2-noemgd: Use the common v3.14 kernel
=20=20common: Update SRCREVs for linux-yocto-rt_3.10

Rebecca Chang Swee Fun (1):
=20=20meta-valleyisland: fix build errors for valleyisland-32

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

Florin Sarbu (4):
=20=20Add weston.ini config file
=20=20dlt-daemon: Update to version 2.10.0
=20=20weston: Update to version 1.4.0-v13
=20=20wayland-ivi-extension: Update to version 1.2.0-rc5

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-java:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-kde:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-micro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-mono:

Alex J Lennon (9):
=20=20README, FAQ: Added details on building Mono under Windows
=20=20README: Changed to markdown format
=20=20core-image-mono: Removed extraneous dependency on libgdiplus
=20=20image-full-mono: Starting point for an image that will build all =
recipes in=20
=20=20mono-addings: Initial recipe
=20=20mono-upnp: Initial recipe
=20=20taglib-sharp: Initial recipe
=20=20mono-addins: Added missing dependency on gtk-sharp
=20=20image-full-mono: Added meta-mono recipes

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

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

Martin Jansa (5):
=20=20x-load: Drop .bbappend, recipe was dropped
=20=20udev-extraconf: Rename .bbappends to match new version from oe-core
=20=20xserver-xorg: Rename .bbappend to match with new version from oe-core

Simon Busch (1):
=20=20meta-lg: android-system: initialize wifi mac on startup

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

Andrii Motsok (2):
=20=20webos-image: c-ares=3Dv1.10.0
=20=20native: Add node-gyp-{packages,registry}-native=3Dv0.10.4

Andrii Zora (1):
=20=20webos-image: luna-service2=3D190,v3.8.2

Dmytro Bozhko (1):
=20=20webos-image: nodejs=3Dv0.10.25 node-gyp-native=3Dv0.12.2 add =
node-gyp-{packages,

Igor (1):
=20=20webos-image: db8=3D139

Iurii Artemenko (1):
=20=20webos-image: gptfdisk=3Dv0.8.10

Iyad Qumei (5):
=20=20Make various fixes to allow meta-toolchain to build
=20=20Add ARM vfpv4 tuning option support
=20=20icecc: exclude gmp-native from building with icecc
=20=20libsoup: Add missing dependencies
=20=20cracklib-native: Add missing dependencies

Martin Unsal (1):
=20=20webos_lttng.bbclass: Add lttng-modules to build when LTTng is enabled

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



