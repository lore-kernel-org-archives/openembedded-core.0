Return-Path: <cliff.brake@gmail.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id F21857318C;
	Thu, 17 Dec 2015 14:43:32 +0000 (UTC)
Received: by mail-ig0-f174.google.com with SMTP id to4so13399507igc.0;
	Thu, 17 Dec 2015 06:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:mime-version:message-id:from:to:subject:content-type
	:content-transfer-encoding;
	bh=W1t6kbjzd/INsHweWWMaAefgzgs+cXh9kXKoPSWUn4o=;
	b=zLmsUcWNNopW6+8De/gxlpX8acsmGpy+xZcy+KtIDMYPviXcEvGxOsMTHuVnwgZi/l
	vs9PsCMnB10dyIOw/fPEf88fFRdtRP89UGSArTCblnT1IsEZmw2khglslybcY5HF98he
	RoqnjUg/OgDQfa0iz/8GpzPgh2XMG6uiaihamfB2EgAhLPR8ZUq2xA/ef5nmPuY3/INR
	RodorqVRE4LU50T/c8qX1L16uGSrQ8aKN/mYqePfRFjfGZTet6L5jO+/Aro1Fx/+y/fX
	SiDW47xTs2bCOsv5K8VCh/jwi7a+Bzv03B1s+PJD+nvoLW6EbsqiiwGEx2XiWi0k0tGb
	peKg==
X-Received: by 10.50.79.163 with SMTP id k3mr3797133igx.7.1450363413119;
	Thu, 17 Dec 2015 06:43:33 -0800 (PST)
Received: from [127.0.0.1] (cable2-pool191-cs-134.doycomm.com.
	[66.219.191.134]) by smtp.gmail.com with ESMTPSA id
	k198sm4629554ioe.38.2015.12.17.06.43.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 17 Dec 2015 06:43:30 -0800 (PST)
Date: Thu, 17 Dec 2015 06:43:30 -0800 (PST)
X-Google-Original-Date: Thu, 17 Dec 2015 14:43:29 GMT
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Message-Id: <1450363409034.73245c13@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
Subject: OE Changelog since 2015-12-06 until 2015-12-13
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
X-List-Received-Date: Thu, 17 Dec 2015 14:43:33 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2015-12-06 until 2015-12-13.  Projects included in this =
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

Alexander Kanavin (2):
=20=20wget.py: parse only <a> tags
=20=20bitbake: rename REGEX, REGEX_URI, and GITTAGREGEX.

Ed Bartosh (27):
=20=20toaster: don't allow to run toaster as a script
=20=20toaster: implement get-dburl command
=20=20toaster: set DATABASE_URL in toaster script
=20=20toaster: run bitbake the same way
=20=20toaster: remove unused variable
=20=20toaster: check for toaster configuration later
=20=20toaster: use parent of the build dir
=20=20toaster: make runbuilds to loop
=20=20toaster: start 'manage.py runbuilds' in the script
=20=20toaster: update brbe and project attributes
=20=20toaster: implement stop_bitbake function
=20=20toaster: implement start_bitbake function
=20=20toaster: implement 'toaster restart-bitbake'
=20=20toaster: remove _setupBE function
=20=20toaster: reimplemented startBBServer method
=20=20toaster: remove stopBBServer API
=20=20toaster: do not terminate bb server
=20=20toaster: remove usage of BUILD_MODE variable
=20=20toaster: do not create duplicate HelpText objects
=20=20toaster: implement BitbakeController.getVariable
=20=20toaster: set varibales on bitbake server
=20=20toaster: remove writeConfFile API
=20=20toaster: stop using toaster-pre.conf
=20=20toaster: remove SDKMACHINE from project variables
=20=20toaster: get rid of complicated heuristics
=20=20toaster: unset environment variables
=20=20toaster: return back 'New project' button

Michael Wood (8):
=20=20toaster: projectpage Make sure build targets are space separated
=20=20toaster: tablejs Make sure click handlers consume click event
=20=20toaster: machines table Fix missing layers information needed for =
filter
=20=20toaster: CustomImageRecipe add search_allowed_fields to this model
=20=20toaster: tables Add default_orderby field where it was missing or =
unset
=20=20toaster: tables Fix invalid field name on NewCustomImagesTable
=20=20toaster: toastergui tests Add generic test for ToasterTables widget
=20=20toaster: buildinfohelper Broaden the toaster created recipe data case

Mihail Stanciu (2):
=20=20toaster: tests Automated build-mode backend tests
=20=20toaster: tests Update UI tests to work with 2.0 changes

Paul Eggleton (2):
=20=20lib/bb/utils: fix error in edit_metadata() when deleting first line
=20=20lib/bb/utils: improve edit_bblayers_conf() handling of bblayers.conf =
formatt

Richard Purdie (1):
=20=20knotty: Enforce terminal line limit to stop crazy scrolling

brian avery (2):
=20=20toaster: change toasterconf.json logic to use TEMPLATECONF, like =
oe-setup-bu
=20=20toaster: toasterui Add ParseStarted/ParseProgress events to mask

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Alexander Kanavin (17):
=20=20package_regex.inc: deprecate the file
=20=20package_regex.inc: split entries with odd-even versioning into their =
own rec
=20=20package_regex.inc: split GITTAGREGEX entries into recipe files
=20=20package_regex.inc: split Debian-related entries into their own recipes
=20=20package_regex.inc: split PyPi related entries to their own recipes
=20=20package_regex.inc: split sourceforge related entries to their own =
recipes
=20=20package_regex.inc: split entries which blacklist specific versions to =
their=20
=20=20package_regex.inc: split the rest of the entries to their recipes
=20=20weston-init: add a native systemd unit file
=20=20openssl: update to 1.0.2e
=20=20python-setuptools: update to 18.7.1
=20=20nspr: update to 4.11
=20=20mobile-broadband-provider-info: update to current commit
=20=20mirrors: replace references to archive.apache.org
=20=20json-c: add manual upstream version check
=20=20subversion: update to 1.9.2
=20=20slang: update upstream URI to (official) jedsoft.org

Andre McCurdy (10):
=20=20waf.bbclass: remove unused parameter from get_waf_parallel_make()
=20=20harfbuzz: update 1.1.0 -> 1.1.2
=20=20busybox: backport upstream fixes for unzip
=20=20libpng: update 1.6.19 -> 1.6.20 (CVE-2015-8126)
=20=20kernel.bbclass: drop unnecessary 'eval' from kernel_do_configure()
=20=20linux-libc-headers.inc: remove '-e MAKEFLAGS=3D' from EXTRA_OEMAKE
=20=20linux-libc-headers: update default KORG_ARCHIVE_COMPRESSION bz2 -> xz
=20=20dropbear: update 2015.70 -> 2015.71
=20=20dropbear.inc: drop legacy CFLAGS and LD tweaks
=20=20valgrind: import Debian link_tool patch for MIPS

Armin Kuster (1):
=20=20linux-firmware: update to latest revision bbe4917

Benjamin Esquivel (2):
=20=20oeqa/systemd: journalctl helper function
=20=20oeqa/systemd: get runtest target boot time and log

Bob Ham (1):
=20=20systemd.bbclass: Allow enabling of parameterised services

Bruce Ashfield (1):
=20=20linux-yocto/4.1: Fix kernel oops on qemuarm boot

Chen Qi (1):
=20=20cpio: fix test case of symlink-bad-length

Cristian Iorga (1):
=20=20bluez5: upgrade to 5.36

Daniel Istrate (1):
=20=20scripts: oe-selftest Added new features.

Dmitry Eremin-Solenikov (2):
=20=20gcc-5.2: import patch fixing compilation in thumb mode
=20=20gcc-4.9: import patch fixing compilation in thumb mode

Fabrice Coulon (1):
=20=20gstreamer1.0: Convert tests and valgrind config opts to PACKAGECONFIGs

Fan Xin (2):
=20=20libpcre: upgrade to 8.38
=20=20sudo: upgrade to 1.8.15

Fang Jia (1):
=20=20toolchain-scripts.bbclass: unset command_not_found_handle

Haris Okanovic (1):
=20=20sdk.py / OpkgSdk: remove_packaging_data() after install

Hongxu Jia (1):
=20=20bash: fix testcase run-coproc/run-execscript/run-test/run-heredoc =
failed

Jackie Huang (1):
=20=20python: Fix cross compiling issue

Joe Slater (1):
=20=20ghostscript: add dependency for pnglibconf.h

Joshua Lock (1):
=20=20cracklib: fix for base_libdir =3D=3D libdir

Juro Bystricky (3):
=20=20oe-buildenv-internal: preserve existing BB_ENV_EXTRAWHITE
=20=20insane: in libdir test allow libraries in libexecdir
=20=20buildtools-tarball.bb: 32bit tools need pseudo 32bit library

Jussi Kukkonen (10):
=20=20cogl-1.0: Upgrade 1.20.0 -> 1.22.0
=20=20clutter-1.0: Upgrade 1.24.2
=20=20clutter-gst-3.0: Upgrade 3.0.8 -> 3.0.14
=20=20clutter-gtk-1.0: Upgrade 1.6.2 -> 1.6.6
=20=20gnome-common: Upgrade 3.14.0 -> 3.18.0
=20=20gsettings-desktop-schemas: Upgrade 2.16.1 -> 3.18.1
=20=20xdg-utils: Upgrade to 1.1.1
=20=20shared-mime-info: Upgrade 1.4 -> 1.5
=20=20libcroco: Upgrade 0.6.8 -> 0.6.9
=20=20dropbear: Upgrade 2015.68 -> 2015.70

Khem Raj (13):
=20=20gcc: Add support for building musl configuration
=20=20autoconf: Add musl support
=20=20gdb: Fix build with musl
=20=20mtd-utils: Backport and create patches to support musl
=20=20squashfs-tools: Define FNM_EXTMATCH if not defined
=20=20mtools: Use proper glibc override to add glibc packages to =
recommendations
=20=20musl: Add recipe
=20=20sysvinit: Fix build with musl
=20=20gettext: Delete libintl.h and charset.alias
=20=20busybox: Add config for musl
=20=20openssl: Add musl configuration support
=20=20libpam: Fix build with musl
=20=20attr: Add patch to account for use of internal glibc header

Leonardo Sandoval (1):
=20=20lib/oe/package_manager: Introducing =
PACKAGE_FEED_BASE_PATHS/PACKAGE_FEED_ARC

Lukas Bulwahn (1):
=20=20boost: adjust hard-coded path after python3 upgrade

Marek Vasut (3):
=20=20ghostscript: Add NIOS2 support
=20=20libbsd: Upgrade to 0.8.0
=20=20cmake: Add nios2 support

Mariano Lopez (7):
=20=20wic: Prepare wicboot to allow custom bootloader config
=20=20wic/utils/misc.py: Added function to search for files in canned-wks
=20=20wic: Allow to use a custom config for bootloaders
=20=20wic/help.py: Document the new option "configfile"
=20=20directdisk-bootloader-config.wks: Add example for custom bootloader =
config
=20=20selftest/wic.py: Add test for custom bootloader config
=20=20rootfs.py: Change logic to unistall packages

Mark Hatle (1):
=20=20rpm: Enable MIPS64 N32 transactions

Markus Lehtonen (2):
=20=20devtool: extract: copy kernel config to srctree
=20=20devtool: extract: update SRCTREECOVEREDTASKS for kernel

Martin Jansa (1):
=20=20texinfo: don't create dependency on INHERIT variable

Matt Madison (1):
=20=20wic: insert local Python paths at front

Maxin B. John (1):
=20=20xvideo-tests: move to the latest release

Mike Crowe (5):
=20=20libav: Remove deprecated --disable-avserver
=20=20libav: Add PACKAGECONFIG options: avdevice, avfilter, avplay, gpl
=20=20libav: Correctly handle prefix=3D""
=20=20icu: Upgrade 55.1 -> 56.1
=20=20gstreamer1.0: Split bash completion information into separate package

Otavio Salvador (1):
=20=20lttng-tools: Revert wrong enforcement of Python 3.0 use

Paul Eggleton (4):
=20=20toolchain-shar-extract.sh: proper fix for additional env setup scripts
=20=20toolchain-shar-extract.sh: ensure cleaned environment will work for =
ext SDK
=20=20nativesdk-buildtools-perl-dummy: properly set PACKAGE_ARCH
=20=20toolchain-shar-extract.sh: fix ~ not working in path

Richard Purdie (3):
=20=20base: Improve handling of switching virtual/x providers
=20=20build-appliance-image: Update to master head revision
=20=20site/common-linux: Add some macros to avoid sleeps during configure

Robert Yang (2):
=20=20qt4-4.8.7: fix build for mips n32
=20=20rpm: fix file conflicts for MIPS64 N32

Ross Burton (10):
=20=20scripts/oe-pkgdata-util: sort the packages in list-pkg-files
=20=20sudo: handle libexecdir !=3D libdir/PN.
=20=20glibc: fix libdir/libexecdir path confusion
=20=20neard: fix libdir/libexecdir confusion
=20=20gstreamer: really fix the helper install race
=20=20libpcre: drop UPSTREAM_CHECK_ variables
=20=20base: check for existing prefix when expanding names in PACKAGECONFIG
=20=20libsdl: expand PACKAGECONFIG and enable native builds
=20=20sudo: remove libdir INSANE_SKIP
=20=20attr: add attr dependency to attr-ptest

Tudor Florea (1):
=20=20util-linux: Add ptest

Vladimir Zapolskiy (1):
=20=20package_ipk: allow to specify OPKG_ARGS in local.conf

Wills Wang (1):
=20=20initramfs-framework: create directory /var/run

Yuanjie Huang (1):
=20=20gcc-cross-initial: make dependency on gnu-config-native and =
autoconf-native=20

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Denys Dmytriyenko (3):
=20=20arago.conf: bump version
=20=20ltp-ddt: update to the latest rev
=20=20branding-core: disable AUTOREV for the release

Gou, Hongmei (1):
=20=20opencv: add version 3.0

Jacob Stiffler (1):
=20=20opencl-monitor: Firmware is only applicable to dra7xx

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-atmel:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-beagleboard:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-browser:

Andre McCurdy (3):
=20=20cef3: use PARALLEL_MAKE to control build parallelism
=20=20chromium: use PARALLEL_MAKE to control build parallelism
=20=20ninja-native: remove from meta-browser (moved to meta-oe)

Fabio Berton (2):
=20=20firefox: Update to version 38.4.0esr
=20=20firefox-l10n-*: Update to version 38.4.0esr

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-bug:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-chicken:

Fabio Berton (9):
=20=20gen-egg-recipes: Fix typo in self-dependent-eggs
=20=20chicken-egg-hexgrid: Add hexgrid to skip-eggs list
=20=20chicken-egg-datatypes: Add datatypes to skip-eggs list
=20=20chicken-egg-chicken-doc: Add chicken-doc to self-dependent-eggs
=20=20all-chicken-egg-recipes: Add exif and ezxdisp to =
ALL_CHICKEN_EGG_RECIPES
=20=20gen-egg-recipes: Remove working eggs from skip-eggs list
=20=20chicken-egg-chicken-doc: Update to version 0.4.7
=20=20chicken-egg-mdcd: Add recipe for version 0.5
=20=20chicken-egg-procedural-macros: Update to version 1.0.3

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-efikamx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ettus:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm:

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

Saul Wold (4):
=20=20linux-yocto: Update to 4.1.13
=20=20gstreamer-vaapi: Update to 0.6.1
=20=20libva-intel-driver: Update to 1.6.1
=20=20libva: Update to 1.6.1

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

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-netbookpro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nodejs:

Pascal Bach (2):
=20=202015-12-10, Version 4.2.3 'Argon' (LTS) Release
=20=202015-12-10, Version 5.2.0 (Stable)

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

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

Denys Dmytriyenko (3):
=20=20layer.conf: add ti-rpc-rtos to ABI safe list
=20=20u-boot-ti-staging: update to the latest rev
=20=20layer.conf: add mpm-transport to safe ABI list

Sam Nelson (1):
=20=20ti-ipc: Update to new version 3.41.0.7_eng

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Beth Flanagan (1):
=20=20poky.conf: Bump for 2.1 development

Saul Wold (1):
=20=20linux-yocto: Update genericx86* BSPs to v4.1.13

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



