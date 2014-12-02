Return-Path: <cliff.brake@gmail.com>
Received: from mail-ie0-f173.google.com (mail-ie0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id D25AD60030;
	Tue,  2 Dec 2014 20:30:50 +0000 (UTC)
Received: by mail-ie0-f173.google.com with SMTP id y20so12446239ier.32
	for <multiple recipients>; Tue, 02 Dec 2014 12:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:mime-version:message-id:from:to:subject:content-type
	:content-transfer-encoding;
	bh=YmdH/5JGfr9bJStSwfDvfn4Dfq9xQtD6YitZjyGzqug=;
	b=D3msI8VEdf2avPQSWGGWtptSQP9JhESq5ybnaGI8Q6y61PY9mp3ELg8q006d53Eauz
	f1fEdw4vAaXIeRQwbVBDGoirTO2rpjKDv8GXQxDOL2/NrwU9wzwUcEFI3kg/oAgk6VXy
	2DgKvlSF3g2EjT8duLLOYBZ02uanTN+m3FScGnXRmSbooZhlwhU0YOiNzwUh4hYCb1z9
	bhV4TLhSjdxXMP1zfBTlZz5kDwDEO19i5OFtZGu769b6n4v2ZvaPRniNnClPkUNT0Z1d
	ebnkVA3wMYW3kXhM6ebv20aa6y8N1KhtxkXGIvySfnbdP/rgPoCRFChJAa7JAKQi8stG
	f1vQ==
X-Received: by 10.42.255.72 with SMTP id nh8mr4210504icb.1.1417552250716;
	Tue, 02 Dec 2014 12:30:50 -0800 (PST)
Received: from [127.0.0.1] (cable2-pool191-cs-105.doycomm.com.
	[66.219.191.105]) by mx.google.com with ESMTPSA id
	i184sm11605299ioi.33.2014.12.02.12.30.49 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 02 Dec 2014 12:30:49 -0800 (PST)
Date: Tue, 02 Dec 2014 12:30:49 -0800 (PST)
X-Google-Original-Date: Tue, 02 Dec 2014 20:30:48 GMT
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Message-Id: <1417552248899.fbadde46@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
Subject: OE Changelog since 2014-11-23 until 2014-11-30
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
X-List-Received-Date: Tue, 02 Dec 2014 20:30:57 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2014-11-23 until 2014-11-30.  Projects included in this =
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

Alexandru DAMIAN (8):
=20=20toaster: use http proxies to fetch data
=20=20toastergui: update layer search criteria
=20=20toastergui: do not show project info in interactive mode
=20=20toaster: display Toaster exceptions and other fixes
=20=20toasterui: fix layer identification for managed builds
=20=20toaster: fix loadconf path calculation
=20=20toastergui: new project page
=20=20toasterui: Compatibility patch for daisy and dizzy

An=C3=ADbal Lim=C3=B3n (10):
=20=20fetch/wget: latest_versionstring create _init_regex method for have =
one plac
=20=20fetch/wget: _init_regexes rename variables to be more consistent and =
move di
=20=20fetch/wget: Improve REGEX_URI handling
=20=20fetch/wget: latest_versionstring add package_custom_regex_comp
=20=20fetch/wget: latest_versionstring improvments in searching
=20=20fetch/wget: latest_versionstring remove unnecessary usage for name in =
versio
=20=20fetch/wget: latest_versionstring add support for search in RAW html =
lines
=20=20fetch/wget: latest_versionstring remove newuri set because is =
previous set
=20=20tests/fetch: Update wget latest_versionstring cups case
=20=20fetch/wget: latest_versionstring clean improvments minor

Belen Barros Pena (5):
=20=20toaster: fix errors and warnings display
=20=20toaster: make 'latest builds' section consistent across pages
=20=20toaster: fix padding of build notifications
=20=20toaster: release name consistency
=20=20toaster: remove the word 'project' from layers and machine

Michael Wood (1):
=20=20toaster: base Only show New Build button when there are > 0 projects

Richard Purdie (1):
=20=20cooker: Allow featureset in error state

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Alejandro Hernandez (5):
=20=20nfs-utils: Upgrade to 1.3.1
=20=20cronie: Upgrade to 1.4.12
=20=20gnome-common: Upgrade to 3.14.0
=20=20gnome-desktop: removed gnome-desktop recipe
=20=20cronie: Added default crontab

Alexandru DAMIAN (1):
=20=20toaster.bbclass: use the openembedded-core name

An=C3=ADbal Lim=C3=B3n (1):
=20=20distrodata_class: checkpkg make usage of latest_versionstring methods =
in bit

Belen Barros Pena (1):
=20=20toaster: naming and description changes

Chen Qi (1):
=20=20procps: install symlink under /etc/sysctl.d in case of systemd

Cristian Iorga (3):
=20=20netbase: upgrade to 5.3
=20=20libpcap: upgrade to 1.6.2
=20=20iproute2: upgrade to 3.17.0

Hongxu Jia (1):
=20=20elfutils: upgrade to 0.160

Jackie Huang (1):
=20=20python3: several fixes for cross compiling

Lucian Musat (1):
=20=20oeqa/runtime: Added some new filters for the log parser Including =
custom fil

Paul Barker (3):
=20=20opkg: Upgrade to v0.2.4
=20=20opkg: Update patch status
=20=20opkg-utils: Update SRCREV

Peter A. Bigot (7):
=20=20pseudo: support --without-passwd-fallback configuration option
=20=20pseudo: support multiple search directories in PSEUDO_PASSWD
=20=20image.bbclass: search both rootfs and native staging for passwd files
=20=20pseudo: default --without-passwd-fallback
=20=20pseudo: provide fallback passwd and group files
=20=20bitbake.conf: pseudo fall back to last-resort passwd files
=20=20useradd.bbclass: set PSEUDO_PASSWD consistent with root directory

Richard Purdie (2):
=20=20qemu: Add missing wacom HID descriptor
=20=20gcc-4.8: Drop unused patch

Ross Burton (1):
=20=20gdk-pixbuf: use ptest-gnome

Roy Li (1):
=20=20gst-ffmpeg: fixes for CVE-2014-8548 and CVE-2014-8541

Shiqun Lin (3):
=20=20bash: clean host path in bashbug
=20=20e2fsprogs: clean host path in compile_et, mk_cmds
=20=20bind: clean host path in isc-config.sh

Wenzong Fan (1):
=20=20serf: 1.3.6 -> 1.3.8

Wolfgang Denk (1):
=20=20perl: fix PERL5LIB settings

Yue Tao (1):
=20=20libpam: Stop a QA WARNING when building multlib version

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Andreas M=C3=BCller (2):
=20=20gparted: initial add 0.20.0
=20=20glibmm: add perl to RDEPENDS_{PN}-dev

Bian Naimeng (1):
=20=20dash: Port from openembedded and upgrade to 0.5.8

Chong.Lu@windriver.com (2):
=20=20samba: add winbind.service to winbind package
=20=20samba: fix error messages when startup samba service

Chris Morgan (1):
=20=20dfu-util: Point to gitorious.org repository as gnumonks.org is down

Derek Straka (5):
=20=20python-flufl-enum: add recipe for 4.0.1
=20=20python-backports-ssl: add recipe for 3.4.0.2
=20=20python-certifi: add recipe for 14.05.14
=20=20python-tornado: add recipe for 4.0.2
=20=20python-ujson: add recipe for 1.33

Fathi Boudra (1):
=20=20fwts: update to 14.09.00 release

Jackie Huang (13):
=20=20rrdtool: inherit cpan-base to help build perl modules
=20=20rrdtool: add missing dependency on groff-native
=20=20hostapd: several fixes for init script
=20=20mariadb: Check valgrind headers only if WITH_VALGRIND is set
=20=20meta-oe: Add LAYERVERSION and LAYERDEPENDS
=20=20meta-perl: Add LAYERVERSION and LAYERDEPENDS
=20=20meta-python: Add LAYERVERSION and LAYERDEPENDS
=20=20meta-ruby: Add LAYERVERSION and LAYERDEPENDS
=20=20toolchain-layer: Add LAYERVERSION and LAYERDEPENDS
=20=20meta-efl: Add LAYERVERSION and LAYERDEPENDS
=20=20meta-filesystems: Add LAYERVERSION and LAYERDEPENDS
=20=20meta-gnome: Add LAYERVERSION and LAYERDEPENDS
=20=20meta-gpe: Add LAYERVERSION and LAYERDEPENDS

Joe MacDonald (1):
=20=20meta-networking: update LAYERDEPENDS

Kang Kai (3):
=20=20mariadb: Update from version 5.5.39 to 5.5.40
=20=20mariadb: re-package configure files
=20=20mariadb: add dependency libevent

Li xin (6):
=20=20pam_passwdqc: new recipe
=20=20smem: add new recipe
=20=20setxkbmap: upgrade to 1.3.0
=20=20iceauth: upgrade to 1.0.6
=20=20nicstat: add new recipe
=20=20rarpd: add new recipe

Liu Jian (1):
=20=20lvm2: add lvm.con to CONFFILES

Martin Jansa (3):
=20=20cronie: rename .bbappend to match all versions
=20=20acpitests: Blacklist failing recipe
=20=20iotop: Drop python-distutils from RDEPENDS

Qian Lei (14):
=20=20tomoyo-tools: Add new recipes
=20=20xlsatoms: Add new recipe
=20=20xlsclients: Add new recipe
=20=20xrefresh: Add new recipe
=20=20xsetmode: Add new recipe
=20=20xsetroot: Add new recipe
=20=20xstdcmap: Add new recipe
=20=20xwud: Add new recipe
=20=20xrdb: Update to 1.1.0
=20=20xgamma: Add new recipes
=20=20xkbevd: Add new recipe
=20=20xkbprint: Add new recipe
=20=20indent: Add new recipe
=20=20umip: add new recipe

Ross Burton (3):
=20=20gssdp: use GNOME_MIRROR in SRC_URI
=20=20gupnp: use GNOME_MIRROR in SRC_URI
=20=20gupnp-av: use GNOME_MIRROR in SRC_URI

Wenzong Fan (1):
=20=20krb5: fix CVE-2014-5351

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

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

Otavio Salvador (9):
=20=20core-image-chicken: Stop including core-image-base.bb
=20=20scripts/gen-egg-list: Avoid duplicates when listing the eggs
=20=20chicken_install.bbclass: Use BPN to identify the egg name
=20=20chicken-egg-dbus: Fix SRC_URI to point to the right path
=20=20conf/layer.conf: Change layer collection for 'chicken'
=20=20chicken: Stop using autotools class
=20=20chicken_install.bbclass: Stop running do_configure and do_compile
=20=20chicken-egg-sxpath: Add version 0.2
=20=20scripts/gen-egg-recipes: Add sxpath egg

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-efikamx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ettus:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm:

Lauren Post (1):
=20=20chromium-imx: Update chromium-imx to support SOC without VPU

Neena Busireddy (1):
=20=20gstreamer1.0-plugins-bad: Correct CFLAGS for wayland backend

Otavio Salvador (4):
=20=20weston: Remove "Desktop-shell-Don-t-assume-there-is-a-pointer.patch"
=20=20gstreamer1.0-plugins-bad: Remove useless overrides
=20=20imx-base: Include gstreamer1.0-plugins-imx for i.MX6Q and i.MX6DL
=20=20piglit: Add a dependency over virtual/egl

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

Alex de Cabo (2):
=20=20u-boot-congatec: Upgrade to cgt_imx_v2013.04_3.10.17_1.0.2
=20=20linux-congatec: Upgrade to cgt_imx_3.10.17_1.0.2

Daiane Angolini (1):
=20=20linux-*: Rework LOCALVERSION depending on SRCBRANCH

Eric Nelson (4):
=20=20u-boot-boundary/u-boot-script-boundary: update to 86bfe2c (v2014.07)
=20=20linux-boundary: Add support for kernel 3.10.31_1.1.0_beta
=20=20nitrogen6x*, imx6qsabrelite: default to kernel 3.10.31
=20=20linux-boundary: deprecate 3.0.35, 3.10.17 kernels for Yocto 1.8

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

Chang Rebecca Swee Fun (1):
=20=20valleyisland: update README with latest information

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

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

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-slugos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-systemd:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-raspberrypi:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

Martin Jansa (1):
=20=20ffalarms, iliwi, sensmon, valacompass: Blacklist apps broken by vala =
upgrade

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Alexandru DAMIAN (1):
=20=20toasterconf: fix localpath values

An=C3=ADbal Lim=C3=B3n (1):
=20=20package_regex.inc: Update REGEX'es in order to find upstream versions =
correc

Robert Yang (1):
=20=20maintainers.inc: update maintainers

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



