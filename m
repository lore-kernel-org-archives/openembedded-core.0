Return-Path: <cliff.brake@gmail.com>
Received: from mail-ie0-f180.google.com (mail-ie0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id D618F6F55B;
	Mon,  3 Mar 2014 22:16:45 +0000 (UTC)
Received: by mail-ie0-f180.google.com with SMTP id as1so2267477iec.39
	for <multiple recipients>; Mon, 03 Mar 2014 14:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:from:to:subject:content-type
	:content-transfer-encoding;
	bh=QUDTC0EhHiChLGpKFEQrXiSNsMCbW8qB/CvTM/hleMU=;
	b=q87XeI/zucQFDvmwObgLKnszFrgIHYdFAjymadQmqBfvxrcPgr8Tjb8f0xS94N2Wpj
	0zWf6Nw7TKHZ577rtjTGrPlS37T/OdeiQYuGVsbw4tMpOtcvgEhMjiX/E4sD/0Vk3Iok
	11GkFUbhfSNN/iyN9Ud1H4tzhFyZd9q6004Y4bnjZgGOivjzX+IWZ1qLA3DupCizdHlD
	1JhF7f/UALbYTm6Jy2xAR2GidnHOOQEzekpj/EveewNBhUHXGLxpOx/4D0e9AvBK765H
	keCaVxZFx8XXFBwwqaSLM4f6vazHI8BQkyj5SufVMc7kB0fSsTdZDhfaRLHE4+0eunjy
	o3DQ==
X-Received: by 10.42.228.131 with SMTP id je3mr4438742icb.59.1393885006251;
	Mon, 03 Mar 2014 14:16:46 -0800 (PST)
Received: from happy.bec-systems.com (cable-pool6-cs-200.doycomm.com.
	[66.219.185.200])
	by mx.google.com with ESMTPSA id y9sm43297492igl.7.2014.03.03.14.16.44
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Mar 2014 14:16:45 -0800 (PST)
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Date: Mon, 03 Mar 2014 14:16:45 -0800 (PST)
Message-Id: <1393885004039.23815e7f@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
Subject: OE Changelog since 2014-02-23 until 2014-03-02
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
X-List-Received-Date: Mon, 03 Mar 2014 22:16:48 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2014-02-23 until 2014-03-02.  Projects included in this =
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

Cristiana Voicu (4):
=20=20hob: replace the use of hob-toolchain with populate_sdk task
=20=20hob: create a base hob image used to create custom images
=20=20hob: remove the code that adds hob layer to bblayers
=20=20hob: append bbfiles to bblayers.conf instead of local.conf

Jacob Kroon (1):
=20=20ast: Fix support for anonymous methods in wildcard .bbappend files

Martin Jansa (1):
=20=20runqueue: Catch ValueError from pickle.loads

Paul Eggleton (4):
=20=20fetch2: fix fetching git submodules with git 1.7.9.x or older
=20=20bitbake-selftest: enable specifying tests to run on command line
=20=20tests: add missing import
=20=20tests: add test for gitsm fetcher

Richard Purdie (9):
=20=20fetch2: Fix mirror repo tarball creation
=20=20fetch/git: Separate out an ls-remote function
=20=20fetch/perforce: Drop usage of old style *COMMAND variable and =
MKTEMPDIRCMD
=20=20fetch/svk: Drop usage of old style *COMMAND variable and MKTEMPDIRCMD
=20=20wget: Drop usage of old style *COMMAND variables
=20=20fetch/wget: Start to clean up command construction
=20=20fetch/wget: Separate out download and checkstatus functions
=20=20codeparser: Fix var_execs to append to execs, not references
=20=20fetch2: Drop svk fetcher

Stefan Stanacar (1):
=20=20build: filter out expanded empty strings for lockfiles flag

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Alexandru Palalau (1):
=20=20libnotify: don't use gnome.bbclass

Alexandru-Cezar Sardan (1):
=20=20gcc: Enable SPE & AltiVec generation on powepc*linux target.

Bruce Ashfield (5):
=20=20kernel-yocto: always checkout machine branch when existing =
validate_branches
=20=20linux-yocto/3.10: update to v3.10.32
=20=20linux-yocto/3.4: update to v3.4.82 and latest LTSI
=20=20linux-yocto/3.10: integrate latest LTSI changes
=20=20linux-yocto-dev: bump to v3.14-rc4

Corneliu Stoicescu (2):
=20=20oe-selftest: Fix for test_rm_old_image
=20=20oe-selftest: Fix test_sstate_cache_management_script*

Cristian Iorga (4):
=20=20bluez5: upgrade to 5.15
=20=20telepathy-glib: upgrade to 0.23.2
=20=20telepathy-mission-control: upgrade to 5.16.1
=20=20wpa-supplicant: upgrade to 2.1

Cristiana Voicu (3):
=20=20curl: upgrade to 7.35.0
=20=20pango: upgrade to 1.36.2
=20=20meta-hob: remove hob-toolchain since this is not needed anymore

Donn Seeley (1):
=20=20dpkg: fix a link problem for dpkg-native on CentOS 5.8

Hongxu Jia (2):
=20=20qt-mobility: fix metaobjectbuilder build errors
=20=20python-native: remove unused and duplicated sitecustomize.py

Jackie Huang (1):
=20=20mailx: fix the path to sendmail interface

Jonathan Liu (1):
=20=20package_manager.py: correctly handle empty opkg-query-helper.py output

Khem Raj (1):
=20=20python3: Fix race condition at high parallelism factor

Laurentiu Palcu (2):
=20=20package_manager.py: create index files for all backends in =
PACKAGE_CLASSES
=20=20adt_installer: fix issue with x86_64

Maxin B. John (1):
=20=20python: Backport CVE-2013-1752 fix from upstream

Otavio Salvador (1):
=20=20uboot-config.bbclass: Skip the package if no valid configuration is =
found

Paul Eggleton (10):
=20=20classes/sstate: fix taints being undone on execution of sstate tasks
=20=20classes/package_tar: fix conflicts with package_deb / package_ipk
=20=20classes/utility-tasks: make do_listtasks a little more friendly
=20=20documentation.conf: add a few missing task descriptions
=20=20openssh: upgrade to 6.5p1
=20=20ethtool: upgrade to 3.13
=20=20cmake: upgrade to 2.8.12.2
=20=20augeas: upgrade to 1.2.0
=20=20chrpath: upgrade to 0.16
=20=20dropbear: upgrade to 2014.63

Richard Purdie (18):
=20=20lib/oe/rootfs: Fix LDCONFIGDEPEND check
=20=20package: Drop do_package_write task
=20=20sstate: Drop 'SafeDep' code from setscene validation function
=20=20distro/defaultsetup: Add seperatebuildddir.inc
=20=20security-flags: Deal with powerpc build issues
=20=20security-flags: Avoid lttng-tools issue on arm
=20=20base: Remove pointless createCopy/update_data calls
=20=20libnotify: Fix separate build dir support
=20=20webkit-gtk: Fix separate builddir support
=20=20dpkg: Fix dpkg-native dependency on target xz
=20=20python3: Fix QA warning
=20=20python3: Fix make race
=20=20autotools-brokensep: Mark recipes with broken separate build dir =
support
=20=20hob-image: Drop as no longer needed by bitbake
=20=20meta-hob: Drop as no longer needed
=20=20dpkg: Use bzip2-replacement-native
=20=20oeqa/runtime/dmesg: Ignore DMA timeout errors
=20=20ltp: Work around parallel make race

Robert Yang (4):
=20=20lz4: fix CC
=20=20grub: exclude .pc from POTFILES.in (fix build on CentOS 5.8)
=20=20dpkg-compiler.m4: remove -Wvla (fix build on CentOS 5.8)
=20=20weston: fix build without wayland in distro_features

Ross Burton (1):
=20=20ncurses: use ln -r to generate relative symlink

Roy Li (1):
=20=20dbus: proper error handler should be given after =
send_negotiate_unix_fd fail

Saul Wold (10):
=20=20sqlite3: Update to 3080301
=20=20sqlite: rename to match upstream versioning
=20=20runqemu: Use readlink instead of realpath
=20=20security_flags: disable PIE flags for cups builds
=20=20initrdscripts: Add rootimage option
=20=20base-files: sed installed file instead of original
=20=20base-passwd: sed installed file instead of original
=20=20systemd: sed installed file instead of original
=20=20core-image-minimal-initramfs: Use PACKAGE_INSTALL instead of =
IMAGE_INSTALL
=20=20man-pages: Update to 3.60

Stefan Stanacar (2):
=20=20oeqa/targetcontrol: properly get the host ip
=20=20oeqa/targetcontrol: make BaseTarget an abstract class

S=C3=A9bastien Mennetrier (1):
=20=20libomxil: Fix link issue for gst-omx

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Andrea Adami (1):
=20=20klcc-cross: force rebuild for each MACHINE of the same arch

Diego Sueiro (1):
=20=20libao: Add PACKAGECONFIG for esound support

Khem Raj (2):
=20=20python-cloudeebus: DEPEND on python-distribute instead of =
python-setuptools
=20=20ltp-ddt: Fix build with newer kernels

Koen Kooi (1):
=20=20mariadb: move linker fix to .inc

Martin Jansa (24):
=20=20efl: upgrade from separate recipes to shared efl-1.8.5
=20=20efl: Adjust packaging to match more with old 1.7 separate recipes
=20=20python-efl: upgrade from separate recipes to shared python-efl-1.8.1
=20=20python-efl: update packaging to match old packages
=20=20elementary: upgrade to 1.8.4
=20=20elementary: Add PACKAGECONFIG for ewebkit and disable it by default
=20=20terminology: upgrade to 0.4.0
=20=20evas-generic-loaders: upgrade to 1.8.1
=20=20emotion-generic-players: add recipe for 1.8.1
=20=20e-wm: Drop evas-.*-loader.* from RDEPENDS
=20=20e-wm: Add recipe for 0.18.2
=20=20enjoy: switch from svn to newer git and update dependency from edbus2 =
to eld
=20=20edbus: remove old edbus(1) svn recipe
=20=20webkit-efl: Add recipe with snapshot from r159807
=20=20eve: bump SRCREV and update dependency from edbus2 to eldbus
=20=20libeflvala: Fix build of tests
=20=20elfe: Replace svn with git version
=20=20packagegroup-efl-sdk: Update SDK-EFL for shared source tree efl
=20=20expedite: Replace old svn recipe with git version
=20=20e-tasks: Fix building against old e_dbus
=20=20rage, emprint, news: Move to nonworking
=20=20screenshot: Move to nonworking because depends on emprint
=20=20vlc: Add PACKAGECONFIG for jack
=20=20vlc: Fix build with flac-1.3.0

Matthieu CRAPET (2):
=20=20xmlstarlet: add new recipe for version 1.5.0
=20=20recipes: convert remaining SUMMARY/DESCRIPTION cosmetic issues

Roy Li (1):
=20=20quagga: close the stdout/stderr as in other daemons

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Koen Kooi (9):
=20=20angstrom-version: add -is and -ds to lsb_release
=20=20images: fix IMAGE_PREPROCESS_CMD
=20=20development-xfce-image: XFCE based image with development tools inside
=20=20development-xfce-image: add bash
=20=20efl-nodm-image: include formfactor
=20=20efl-nodm-image: add xterm
=20=20xfce-nm-image: fix gdm install
=20=20Angstrom: switch armv7a to thumb2 mode
=20=20contrib: feed sorter: sync with v2013.12

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Denys Dmytriyenko (2):
=20=20packagegroup-*-tisdk-addons: mmc-utils requires >=3D3.8 kernel
=20=20arago-source-ipk, packagegroup-*-crypto-sdk-host: enable cryptodev =
sources

Franklin S. Cooper Jr (3):
=20=20busybox: Add TFTP Blocksize option
=20=20matrix-gui-apps-git.inc: Update commitid to pull in multimedia demo =
fix
=20=20dual-camera-demo: Update dual camera demo with bug fixes

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

Alexandre Belloni (1):
=20=20image_types_fsl.bbclass: fix barebox bootstream generation

Andy Voltz (2):
=20=20libmcc: bump to version 1.04
=20=20kernel-module-mcc: bump to version 1.04

Anthony Felice (2):
=20=20twr-vf65gs10: update kernel to latest ts-2.13 release
=20=20twr-vf65gs10: Add myself as a maintainer

Otavio Salvador (6):
=20=20mesa: Update to follow OE-Core changes
=20=20xserver-xorg: Backport 1.14.4 version
=20=20mqxboot: Add minor changes to get recipe in better shape
=20=20libmcc: Add minor changes to get recipe in better shape
=20=20kernel-module-mcc: Add minor changes to get recipe in better shape
=20=20image_types_fsl.bbclass: Fix imx-bootlets build with new image code

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

Christopher Larson (1):
=20=20layer.conf: define LAYERDEPENDS to match actual deps

John Weber (2):
=20=20linux-wandboard (3.10.17): Bump SRCREV to 95f32b7
=20=20linux-wandboard (3.10.17): defconfig changes

Otavio Salvador (4):
=20=20cfa10036.inc: Use dummy version of imx-test
=20=20m28evk: Use dummy version of imx-test
=20=20m53evk: Use dummy version of imx-test
=20=20m53evk: Force override of XSERVER setting

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

Florin Sarbu (5):
=20=20itzam/C: Added package as a dependency     of =
persistence-client-library
=20=20Add new P2 AC package called     persistence-client-library
=20=20node-state-manager: Upgrade to version 2.0.0     and move from P2 AC =
to P1 A
=20=20itzamc: Correct LICENSE field
=20=20node-startup-controller: Removed the conditional addition of     =
node-startu

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-java:

Henning Heinold (1):
=20=20Merge pull request #55 from koenkooi/hotspot

Khem Raj (2):
=20=20openjdk-7-25b30: Forward port ppc patches
=20=20libmatthew: Remove the dummy jar symlink

Koen Kooi (2):
=20=20openjdk-7-release-25b30.inc: move nio patch to main section.
=20=20openjdk-7-release-25b30.inc: add patch to fix hotstop build

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-kde:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-micro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-mono:

Alex J Lennon (9):
=20=20libgdiplus: Fix build error relating to missing freetype/tttables.h, =
and upd
=20=20mono: Update Mono to 3.2.8
=20=20mono-xsp: Removed extraneous occurrence of mono-xsp in PACKAGES
=20=20gtk-sharp: Updated to GTK# 2.12.21
=20=20monotools-server: Fixed build
=20=20mono-helloworld: Simple console and windows forms applications to =
provide an
=20=20gtk-sharp, libgdiplus mono-helloworld, mono: Removed extraneous PR =
variables
=20=20mono-xsp: Updated to 2.10
=20=20mono-basic: Add VisualBasic.NET support with mono-basic v2.10

Khem Raj (1):
=20=20mono-xsp: Fix parse warnings

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

Giulian Gon=C3=A7alves Vivan (1):
=20=20qsiv: add the qsiv 1.1 example app

Jacob Kroon (1):
=20=20nativesdk-qtbase-tools: disable Debian-style package renaming

Otavio Salvador (6):
=20=20qmake5_paths.bbclass: Use Qt version path for headers
=20=20mallit-framework-qt5: Don't set OE_QMAKE_PATH_HEADERS
=20=20mallit-plugins-qt5: Don't set OE_QMAKE_PATH_HEADERS
=20=20populate_sdk_qt5.bbclass: Fix symlink location for QtCreator use
=20=20packagegroup-qt5-qtcreator-debug: Add package group
=20=20populate_sdk_qt5.bbclass: Add support for qtcreator-debug

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-slugos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-systemd:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-raspberrypi:

Andrei Gherzan (4):
=20=20omxplayer: Update to current remote HEAD
=20=20Merge changes =
I1eecd332,I635b2f2b,Iad457c26,Iace03974,I4358434c,Ib15942c4,I7
=20=20mesa: Replace ugly fix for gles/egl
=20=20sdcard_image-rpi: Make rpi-sdimg image dependent on ext3

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

Denys Dmytriyenko (3):
=20=20linux-ti-staging: ARM_SCU patch got merged, add PREEMPT_VOLUNTARY =
patch, res
=20=20linux-ti-staging: latest performance, connectivity, audio and PM fixes
=20=20linux-ti-staging: rebase patch to disable SMP to apply cleanly

Sam Nelson (1):
=20=20linux-keystone: Update latest tag

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

Anatolii Sakhnik (1):
=20=20webos-image: filecache=3D63

Gayathri Srinivasan (1):
=20=20webos-image: pmlogdaemon=3D118 pmklogd=3D17

Igor (2):
=20=20webos-image: db8=3D126
=20=20webos-image: db8=3D128

Maksym Sditanov (1):
=20=20webos-image: db8=3D127

Martin Jansa (2):
=20=20webos-repositories.inc: Add WEBOS_GIT_TAG variable
=20=20webos.inc: Always include webos-enh-sub-autorev-error in ERROR_QA

Nikolay Orliuk (1):
=20=20webos-image: luna-sysservice=3D37

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Bruce Ashfield (2):
=20=20bsps: update to 3.10.28
=20=20bsps: update H/W reference boards to v3.10.32

Paul Eggleton (1):
=20=20poky.conf: add CentOS 6.5 to SANITY_TESTED_DISTROS

Richard Purdie (1):
=20=20poky: Drop seperatebuilddir.inc, its included in the core now

Stefan Stanacar (1):
=20=20poky-lsb.conf: fix the include path for security_flags

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



