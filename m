Return-Path: <cliff.brake@gmail.com>
Received: from mail-ie0-f180.google.com (mail-ie0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 1D2076FDEB;
	Mon, 29 Sep 2014 13:39:50 +0000 (UTC)
Received: by mail-ie0-f180.google.com with SMTP id ar1so16434522iec.25
	for <multiple recipients>; Mon, 29 Sep 2014 06:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:mime-version:message-id:from:to:subject:content-type
	:content-transfer-encoding;
	bh=t9MKbISJDQDs1IVgBtW0MtnF/MPNGDpjQ6dnRlTXg90=;
	b=okdmoLIDLFEsZi5iHCEzvC3Emy528QULfEbvgqbKTersGrDy50qrwY5paJVwJ4Bv7i
	hN6DTtzd2RrIMeLBfPSM7E+rL3c8001fdjVGr4i5lpmFtRlGZFlI6TOhQj7H+sodoDXi
	SKAF8653JsrjBcVYpP/JXkUSbx6gBaFeL1Xyjq332T0WnHvMjpt0WM/but+QfAsTtzJS
	CmD8yrTjGjgkS8Uxs9jDDoX9lernzLYvPkanh9/VC4HANbzSB1dr14UonABsb+xoPoJ0
	hezNaArs7F8Rq9+WoPWj5l6qvhBv5WFgqK1DO8+PRzzZoIzxXgz5zAZyikctsLgYNJS0
	Z8Vg==
X-Received: by 10.50.164.202 with SMTP id ys10mr51336097igb.6.1411997991541;
	Mon, 29 Sep 2014 06:39:51 -0700 (PDT)
Received: from [127.0.0.1] (cable2-pool191-cs-105.doycomm.com.
	[66.219.191.105])
	by mx.google.com with ESMTPSA id a4sm10399336igv.1.2014.09.29.06.39.49
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Sep 2014 06:39:50 -0700 (PDT)
Date: Mon, 29 Sep 2014 06:39:50 -0700 (PDT)
X-Google-Original-Date: Mon, 29 Sep 2014 13:39:48 GMT
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Message-Id: <1411997988564.badbdbc8@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
Subject: OE Changelog since 2014-09-21 until 2014-09-28
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
X-List-Received-Date: Mon, 29 Sep 2014 13:39:54 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2014-09-21 until 2014-09-28.  Projects included in this =
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

Chad Nelson (2):
=20=20fetch2/perforce: Fix localfile name if labels are used
=20=20fetch2/perforce: Use replace (1 line) instead of find (3 lines)

Richard Purdie (3):
=20=20bitbake-worker: Fix bitbake -n
=20=20knotty: Ensure commandline parameters are updated in memres server
=20=20bin/bitbake: Update to version 1.24.0

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Alejandro Hernandez (1):
=20=20ltp: Added zip-native as a DEPENDS

Bruce Ashfield (7):
=20=20linux-yocto/3.10: update to v3.10.54 and -rt55
=20=20linux-yocto/3.14: update to v3.14.18 and -rt9
=20=20linux-yocto/3.17: update to v3.17-rc5
=20=20linux-yocto/3.17: switch to dedicated 3.17 repository
=20=20linux-yocto/3.17: bump to v3.17-rc6
=20=20linux-yocto/3.10: update to v3.10.55
=20=20linux-yocto/3.14: update to v3.14.19

Carlos Rafael Giani (1):
=20=20kernel.bbclass: use one package split for all firmware filename =
extensions

Chong Lu (1):
=20=20perl: remove unneeded patches in ptest directory

Christopher Larson (9):
=20=20flex: fix the deps for ptest builds
=20=20zlib: obey LDFLAGS for tests
=20=20gdbm-1.8.3: obey LDFLAGS
=20=20ossp-uuid: obey LDFLAGS
=20=20setserial: obey LDFLAGS
=20=20hostap-utils: obey LDFLAGS
=20=20blktrace: obey LDFLAGS for btrecord
=20=20irda-utils: obey LDFLAGS
=20=20python: obey LDFLAGS

Denys Dmytriyenko (1):
=20=20u-boot: cleanup indentation and consolidate .inc file

Hongxu Jia (1):
=20=20man: fix not support xz/bz2 compression

Lucian Musat (1):
=20=20oeqa/selftest: Added decorators to buildoptions.py

Maciej Borzecki (7):
=20=20wic: minor comment update
=20=20wic: use IMAGE_EXTRA_SPACE for vfat rootfs
=20=20wic: fix vfat partition sector count only if needed
=20=20wic: set bootimg_dir when using image-name artifacts
=20=20documentation.conf: document IMAGE_BOOT_FILES
=20=20wic: add new bootimg-partition plugin
=20=20wic: add sdimage-bootpart kickstart file

Philip Balister (1):
=20=20cmake.bbclass : Add support for cmake projects that use .S files.

Richard Purdie (9):
=20=20meta-environment: Fix TARGET_OS problem for ppc
=20=20populate_sdk_base/meta-environment: Remove overlap from the two
=20=20oe-init-build-env-memres: Fix automatic port usage
=20=20uninative: Add uninative - a way of reusing native/cross over =
multiple distr
=20=20layer.conf: Add in useradd dependencies as ABISAFE dependencies
=20=20update-rc.d/systemd: Remove OVERRIDES dependency
=20=20layer.conf: Mark opkg-utils as ABISAFE for update-alternatives usage
=20=20sanity.conf: Update minimum bitbake version to 1.23.2 due to event =
changes
=20=20build-appliance-image: Update to dizzy head revision

Ross Burton (1):
=20=20irda-utils: remove inherit autotools

Roy.Li (1):
=20=20ltp: make setregid02 be able to pass

Wenzong Fan (2):
=20=20gstreamer1.0-plugins-bad: disable libssh2
=20=20systemtap: disable libvirt

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Andrea Adami (1):
=20=20klibc: klcc: consider --sysroot option and override gcc-cross encoded =
sysroo

Armin Kuster (1):
=20=20wireshark: update to 12.1

Chen Qi (6):
=20=20mariadb: use ${PN} for SYSTEMD_SERVICE
=20=20hostapd: use ${PN} for SYSTEMD_SERVICE
=20=20rsyslog: add UPDATE_ALTERNATIVE for syslog-service
=20=20radvd: add systemd service file
=20=20smartmontools: fix for its SysV init script
=20=20smartmontools: add systemd service file

Chong.Lu@windriver.com (3):
=20=20postgresql: move initdb to postgresql-setup
=20=20postgresql: add systemd unit file
=20=20collectd: add systemd unit file

Denys Dmytriyenko (1):
=20=20ltp-ddt: keep do_make_scripts as separate task to lock correctly

Hongxu Jia (1):
=20=20proftpd: fix integer overflow CVE-2013-4359

Jackie Huang (1):
=20=20rsyslog: add ptest support

Joe Slater (4):
=20=20ptpd: update to version 2.3.1-rc2
=20=20vftpd: update to version 3.0.2
=20=20radvd: update to 1.14
=20=20multipath-tools: update to version 0.5.0+

Khem Raj (8):
=20=20libgnomekbd: Drop using autotools-brokensep
=20=20nautilus: Drop using autotools-brokensep
=20=20glade3: Enable gnome support in meta-gnome instead of meta-oe
=20=20ckermit: Update recipe ckermit_301.bb -> ckermit_302.bb
=20=20numlockx: Update SRC_URI to somewhere fetchable
=20=20luajit, acpitests: Fix build on hardfloat arm
=20=20collectd: Upgrade to 5.4.1 and fix with glibc 2.20
=20=20subsurface: Adjust dependencies to match eglibc -> glibc move

Mark Asselstine (2):
=20=20ruby.bbclass: introduce a class to assist in building gems
=20=20ruby.inc: DEPEND on libyaml-native

Paul Barker (1):
=20=20toybox: New recipe for toybox-0.4.9

Paul Eggleton (4):
=20=20libunwind: remove as recipe is now in OE-Core
=20=20dhcp: remove parts now merged into OE-Core recipe
=20=20portmap: systemd support now in OE-Core
=20=20keymaps: systemd support now in OE-Core

Robert Yang (16):
=20=20aoetools: no bashism in aoe-stat
=20=20autofs: remove bashism
=20=20arptables: remove bashism
=20=20ndisc6: add perl to RDEPENDS_ndisc6-misc
=20=20stunnel: add perl to RDEPENDS_stunnel
=20=20proftpd: add perl to RDEPENDS_proftpd
=20=20memcached: add bash to RDEPENDS_memcached
=20=20phpmyadmin: add bash to RDEPENDS_phpmyadmin
=20=20apache2: split apache2-scripts subpkg
=20=20sg3-utils: add bash to RDEPENDS_sg3-utils
=20=20sdparm: split sdparm-scripts subpkg
=20=20bonnie: add perl to RDEPENDS_bonnie-scripts
=20=20rrdtool: use rrdtool rather than PN
=20=20webmin: fix hardcode of python2.3
=20=20talloc: fixes for sstate cache reuse
=20=20meta-perl: fix for eglibc-gconvs

Roy Li (3):
=20=20dialog: fix the redirection of the error information
=20=20zeromq: following ptest formatting
=20=20iscsi-initiator-utils: add recipe file

Roy.Li (1):
=20=20wireshark: not put the CC options into CFLAGS_FOR_BUILD

Todd E Brandt (1):
=20=20Phoronix Test Suite package

Wenzong Fan (2):
=20=20talloc: fix swig dependencies
=20=20imagemagick: do not install magick-baseconfig.h repeatedly

YangHaibo (2):
=20=20pimd: add recipe for pimd-2.1.8
=20=20ssmping: add recipe for ssmping-0.9.1

stephen.arnold42 (1):
=20=20xchat: update recipe with build/configure fixes

zhangxiao (1):
=20=20tftp-hpa: bug fix on empty file put error

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Khem Raj (1):
=20=20angstrom-x11-base-depends.bb: Define PACKAGE_ARCH after packagegroup =
inherit

Koen Kooi (5):
=20=20angstrom-version: prefer over os-release.bb
=20=20systemd 216: merge in OE-core changes
=20=20systemd 216: add support for powerbutton on beagleboard, beaglebone =
and=20=20=20=20=20
=20=20systemd 216: turn on resolved and networkd
=20=20angstrom-x11-base-depends: set PACKAGE_ARCH before inherit

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Denys Dmytriyenko (3):
=20=20packagegroup-*-addons*: add canutils for dra7xx family
=20=20busybox: enable uuencode and uudecode utils
=20=20libdrm: patch modetest for indefinite test execution

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-atmel:

Josh Wu (4):
=20=20u-boot-at91: enable u-boot-2014.07 for all avaliable boards
=20=20u-boot-at91: make at91sam9x5, sama5d3xek, sama5d3_xplained support =
v2014.07
=20=20sama5d3xek: fix FIT image build
=20=20qt5-apps: applicationlauncher: qt demo work for both 800x480, 480x272

Nicolas Ferre (4):
=20=20sama5d4ek: trivial: reorder UBOOT_MACHINE line
=20=20sama5d4ek: use the existing bootloaders.inc file for =
EXTRA_IMAGEDEPENDS
=20=20sama5d3xek: remove not needed EXTRA_IMAGEDEPENDS we use =
bootloaders.inc
=20=20at91bootstrap: update to 3.7 for all supported machines

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
=20=20gstreamer1.0-plugins-imx: Update to version 0.9.9

Otavio Salvador (2):
=20=20u-boot-fslc: Update to e36968a revision
=20=20linux-fslc: Update to bf3b99e revision

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

Alex de Cabo (5):
=20=20linux-congatec: Update Congatec-QMX6 Linux kernel
=20=20linux-congatec: Remove old Linux kernel files
=20=20u-boot-congatec: Update Congatec-QMX6 bootloader
=20=20u-boot-imx: Remove old U-boot files
=20=20cgtqmx6: Update Congatec-QMX6 machine configuration

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-ppc:

Liviu Gheorghisan (1):
=20=20CVE-2014-5077 Kernel/SCTP: fix a NULL pointer dereference

Sona Sarmadi (1):
=20=20linux: sofs - CVE-2014-5471, CVE-2014-5472

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

Darren Hart (1):
=20=20linux-yocto*_3.14: Update SRCREV_meta to avoid rt build failure

Ross Burton (1):
=20=20intel-gpu-tools: remove intel-gen4asm.pc from sysroot

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

Andrei Gherzan (1):
=20=20weston : Switch on genivi-1.2.0

Holger Behrens (1):
=20=20poky-ivi-systemd.conf: remove the X11 distro feature remove

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

Khem Raj (1):
=20=20Merge pull request #6 from koenkooi/master

Koen Kooi (1):
=20=20ixp4xx-npe: fix COMPATIBLE_MACHINE

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

Martin Jansa (2):
=20=20gpsd: rename .bbappend

Simon Busch (3):
=20=20meta-lg: mako: include dosfstools
=20=20meta-lg: base-files: prevent systemd from hardly requiring partitions =
to be=20
=20=20meta-lg: systemd-machine-units: put into correct directory

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

Denys Dmytriyenko (4):
=20=20am33x-cm3: update to version 0x189
=20=20linux-ti-staging: update to 3.14.19 with latest fixes
=20=20u-boot-ti-staging: update with numerous fixes on top of 2014.07
=20=20linux-mainline: update to version 3.14.19

Khem Raj (1):
=20=20am33x-cm3: Add TOOLCHAIN_OPTIONS to redefined CC

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

Nathan Rossi (2):
=20=20zynq7-base.dtsi: Update bindings
=20=20zc70*-zynq7-board.dtsi: Update binding for si570

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Maciej Borzecki (1):
=20=20beaglebone.conf: add IMAGE_BOOT_FILES

Richard Purdie (1):
=20=20poky.conf: Bump version for 1.7 dizzy release

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:

Florian Boor (1):
=20=20bash: Update 3.2 with latest patches (fixes CVE-2014-6271)



