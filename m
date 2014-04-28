Return-Path: <cliff.brake@gmail.com>
Received: from mail-ie0-f175.google.com (mail-ie0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 5D96D610D8;
	Mon, 28 Apr 2014 19:17:15 +0000 (UTC)
Received: by mail-ie0-f175.google.com with SMTP id rl12so896214iec.20
	for <multiple recipients>; Mon, 28 Apr 2014 12:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:from:to:subject:content-type
	:content-transfer-encoding;
	bh=tYU3Hwbro/ESvCQItMiDTRempP1aN75W4VGElBagVaM=;
	b=cByfhevMbGkz5nfZfQDIjGgSL3h8FsnDIB6LEf1R5ANndYklUqd7k/hh/kc7XBOa87
	f0qkMDob9p20a0XG/110E5dQ8KZwhxw1pqoKQV+putQXbg2RQQ5Rye9itlk8+YqU/Ydu
	7QJq9yU+pRp6koIb3fpQL5qBLmjtlVzqhd6l/lgfkLLsfTtVe07kdqzFqXKJttezOaxJ
	EIDYy/ba2nYasux0Q75clujXwpUFqHUHx4ccB3123Ts+F9Ck6N27YNu2aQdUCwF7ZTd4
	x8q12jFXKKK7rqL7milvD4JCDRm71qMZ3/07Q5RqoWst5MofhG+dPm/VqGrlU9A8X63h
	E7RA==
X-Received: by 10.50.122.67 with SMTP id lq3mr23461060igb.8.1398712636550;
	Mon, 28 Apr 2014 12:17:16 -0700 (PDT)
Received: from happy.bec-systems.com (cable-pool6-cs-200.doycomm.com.
	[66.219.185.200])
	by mx.google.com with ESMTPSA id p9sm28212115igj.16.2014.04.28.12.17.13
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Apr 2014 12:17:15 -0700 (PDT)
X-Google-Original-Date: Mon, 28 Apr 2014 19:17:12 GMT
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Date: Mon, 28 Apr 2014 12:17:15 -0700 (PDT)
Message-Id: <1398712632933.16cc96ac@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
Subject: OE Changelog since 2014-04-20 until 2014-04-27
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
X-List-Received-Date: Mon, 28 Apr 2014 19:17:18 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2014-04-20 until 2014-04-27.  Projects included in this =
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

Belen Barros Pena (2):
=20=20bitbake: toaster: Fix total number of tasks in build dashboard
=20=20bitbake: toaster: Fix Empty tasks filter

Jacob Kroon (2):
=20=20fetch2: Cleanup file checksum generation
=20=20bitbake-diffsigs: Fix runtime error when no arguments are given

Richard Purdie (6):
=20=20runqueue: Fix handling of zero priority task
=20=20runqueue: Fix task weighting algorithm
=20=20runqueue: Do not write out stamp files in dry_run mode
=20=20parse/ast: Optimise data finalisation
=20=20bitbake-worker: Drop BBHASH variables
=20=20fetch2/git: Stop git from triggering fsync() calls

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Adrian Calianu (1):
=20=20oprofileui-server_git: add avahi-daemon to RDEPENDS list

Andreas M=C3=BCller (2):
=20=20shadow: fix building systemd with useradd-staticids.bbclass enabled
=20=20make menuconfig work for recent xfce environment

Andreas Oberritter (1):
=20=20recipe_sanity.bbclass: avoid error when running 'bitbake -e'

Bruce Ashfield (1):
=20=20linux-yocto/3.14: aufs, edgerouter config and -rt

Chen Qi (5):
=20=20cronie: add systemd support
=20=20bind: add systemd support
=20=20ppp: add systemd support
=20=20tcf-agent: add systemd support
=20=20bind: add support for read-only rootfs

Chong Lu (1):
=20=20dbus: fix a hard dependency about dbus-ptest

Chunrong Guo (2):
=20=20lttng-modules: update to 2.4.1 version
=20=20bumps to remove PRINC use in meta-fsl-ppc

Cristian Iorga (4):
=20=20connman: upgrade to 1.23
=20=20bluez5: upgrade to 5.18
=20=20harfbuzz: upgrade to 0.9.27
=20=20iproute2: upgrade to 3.14

Cristiana Voicu (7):
=20=20pango: upgrade to 1.36.3
=20=20curl: upgrade to 7.36.0
=20=20atk: upgrade to 2.12.0
=20=20at-spi2-atk: upgrade to 2.12.0
=20=20at-spi2-core: upgrade to 2.12.0
=20=20mtd-utils: upgrade to 1.5.1+gitAUTOINC+12158de
=20=20kmod: upgrade to v17 via git

Denys Dmytriyenko (5):
=20=20cryptodev-linux: move to recipes-kernel to be shared with module and =
tests
=20=20cryptodev-linux: create common .inc file to be shared by module and =
tests
=20=20cryptodev-module: recipe for out-of-tree cryptodev device driver
=20=20cryptodev-tests: recipe for cryptodev test suite based on OpenSSL
=20=20udev-extraconf: update mount.sh to use /run/media instead of /media

Hongxu Jia (1):
=20=20apr: remove the use of ${SHELL} to avoid bash/dash confliction

Jacob Kroon (1):
=20=20console-tools: Remove floating runtime dependency on flex

Joe Slater (2):
=20=20pixbufcache: add error exit in pixbufcache_sstate_postinst
=20=20apr: do not try to use sctp.h

Khem Raj (2):
=20=20libav: Add libsdl to DEPENDS only when x11 is enabled
=20=20uclibc: Add libgcc-initial to DEPENDS

Koen Kooi (2):
=20=20grub git: workaround debugedit problems
=20=20liberror-perl: add 0.17022

Martin Jansa (3):
=20=20libnotify: add dbus-glib dependency
=20=20icecc: don't create unnecessary 'ice' dirs in sysroots when disabled
=20=20gsettings-desktop-schemas: add missing dependency on intltool-native

Matthieu Crapet (2):
=20=20openssh-sshd: host contamination fix
=20=20files/device_table-minimal.txt: cleanup

Maxin B. John (2):
=20=20libpng: bump to 1.6.10
=20=20openssh: enable ptest support

Mike Crowe (1):
=20=20native.bbclass: Override TARGET_ flags too

Mike Looijmans (1):
=20=20PR bumps to remove PRINC use in meta-openpli

Ming Liu (1):
=20=20kernel: don't populate source symbolic link

Otavio Salvador (2):
=20=20Globally replace oe.utils.contains to bb.utils.contains
=20=20Globally replace 'base_contains' calls with 'bb.utils.contains'

Paul Barker (1):
=20=20opkg: Upgrade to v0.2.2

Philip Tricca (1):
=20=20grub-efi: Use a variable to specify built-in grub modules.

Richard Purdie (11):
=20=20build-appliance-image: Update to  head revision
=20=20autotools: Enable separate builddir by default
=20=20build-appliance-image: Update to  head revision
=20=20utils: Add hardlinkdir shell function
=20=20gcc: Convert to use hardlinkdir
=20=20libgcc: Spit out common code into libgcc-common.inc
=20=20gcc-cross: Improve handling of unwind.h
=20=20gcc-cross-initial: Separate out libgcc-initial
=20=20initscripts: Fix PR reversal
=20=20default-distrovars.inc: Add libgcc-initial to the GPLv3 whitelist =
(same as l
=20=20cross: Drop package tasks

Robert Yang (4):
=20=20file: upgrade from 5.16 to 5.17
=20=20wget: upgrade from 1.14 to 1.15
=20=20automake: upgrade from 1.14 to 1.14.1
=20=20mklibs-native: upgrade from 0.1.38 to 0.1.39

Saul Wold (11):
=20=20help2man update to 1.44.1
=20=20cups: update to 1.7.2
=20=20lsbinitscripts: update to 9.53
=20=20man-pages: update to 3.64
=20=20msmtp: update to 1.4.32
=20=20libxkbcommon: update to 0.4.1
=20=20util-macros: update to 1.19.0
=20=20sqlite3: Update to 3080403
=20=20libnl: update to 3.2.24
=20=20report-error: Add posting in the public note
=20=20Upstream-Status Cleanups

Stefan Stanacar (2):
=20=20selftest: DiskMonTest: use a high value for free space
=20=20scripts/send-error-report: simple hack to use proxy from the =
enviroment

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Changhyeok Bae (1):
=20=20quagga: Add mirror site

Chong Lu (3):
=20=20vim: add dependency and selinux and acl support control
=20=20vim: don't check acl header if acl support disabled
=20=20vim: add knob whether elf.h are checked

Christian Zieth=C3=A9n (1):
=20=20dnsmasq: update to 2.68

Jackie Huang (2):
=20=20gd: update to version 2.1.0
=20=20gnome-themes: enables the path to the icon-name-mapping to be =
specified

Javier Viguera (1):
=20=20stunnel: fix configure ssl parameter

Kai Kang (3):
=20=20ndisc6: allow the package can be empty
=20=20quagga: fix QA warning
=20=20quagga: fix CVE-2013-6051

Koen Kooi (1):
=20=20dovecot: add libcap dependency

Krzysztof Sywula (1):
=20=20dejagnu: recipe taken from openembedded

Lauren Post (1):
=20=20glcompbench: Create 2012.08 version

Martin Jansa (1):
=20=20gd: fix --with-freetype option

Philip Balister (1):
=20=20ntp : Add cap to default PACKAGECONFIG options.

Robert Yang (1):
=20=20gd: fix the subdir-objects error

Stephen Arnold (1):
=20=20gnuplot: added upstream license file and updated recipe to match

Tim Orling (1):
=20=20gnuplot: upgrade to 4.6.5

Wenzong Fan (2):
=20=20ntp: fix hardcode to /usr/bin/perl
=20=20radvd.init: fix path to radvd.conf sample

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Khem Raj (2):
=20=20angstrom-next.conf: Pin kernel headers to 3.14
=20=20ranpwd: Fix building out of tree

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Denys Dmytriyenko (11):
=20=20sourceipk: swap data and control sections, as dpkg-deb is stricter now
=20=20packagegroup-arago-tisdk-addons: disable u-boot-fw-utils for ti43x
=20=20arago.conf: minor cleanup, version bump
=20=20u-boot-ti-staging: remove UBOOT_LOCALVERSION handling, now upstream
=20=20qtbase: move setting PACKAGECONFIG flags to arago.conf
=20=20wpa-gui-e: fix recipe permissions
=20=20base-files: remove symlinking of /run vs. /var/run not needed in Dora
=20=20icu: replace overlayed recipe with bbappend for 1 patch
=20=20iperf: update the license from NewBSD to the proper BSD-3-Clause
=20=20linux-ti-staging: disable AUTOREV
=20=20README: correct branch names for dora dependencies

Franklin S. Cooper Jr (1):
=20=20matrix-gui-apps-git: Pull latest commit that fixes audio demos on =
EPOS evm

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

Mario Domenech Goulart (3):
=20=20scripts/get-maintainer: support multiple machine directories on the =
command=20
=20=20scripts/get-maintainer: use `exit' instead of `return'
=20=20scripts/get-maintainer: add --dump command line option

Otavio Salvador (4):
=20=20Use generic bbappend files
=20=20Stop using mx6s SoC family
=20=20imx-base.inc: Drop mx6d SoC family
=20=20gst-fsl-plugin: Fix depends on libfslvpuwrapper in i.MX6SL

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

Alexandre Belloni (2):
=20=20linux-cfa: remove useless debug
=20=20linux-cfa: bump revision

Otavio Salvador (1):
=20=20Stop using mx6s SoC family

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-ppc:

Otavio Salvador (1):
=20=20Use generic bbappend files

Ting Liu (1):
=20=20Freescale-EULA: fix awq weird character

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-guacamayo:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix-community:

Andreas M=C3=BCller (1):
=20=20linux-mainline-3.2: drop - it is unmaintained for very long time

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-handheld:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-igep:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

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

Alex J Lennon (8):
=20=20native recipes: Corrected native recipes to have dependencies on =
native reci
=20=20mono-helloworld: Added recipes and README notes to show building with =
xbuild
=20=20mono-helloworld: Remove old version
=20=20FAQ: Created FAQ file
=20=20FAQ: Added question on including Mono in an image
=20=20FAQ: Typo
=20=20mono: Fixed packaging error in mono-3.4.0 recipe which meant that =
/etc/mono/
=20=20README: Updated to include successful testing of Mono 3.4.0 on ARM =
hardfp pl

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

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

Denys Dmytriyenko (4):
=20=20licenses: add standard TI licenses
=20=20am33x-cm3, ti-msp430: update license from TI-BSD to BSD-3-Clause
=20=20recipes: use proper TI-TSPA license name instead of TSPA
=20=20am437x-evm: increase LEB count to fit full rootfs

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

Andrii Motsok (1):
=20=20webos-image: smartkey-hun=3D15

Iyad Qumei (3):
=20=20icecc: Exclude binutils from building with icecc
=20=20icecc: Exclude linux-libc-headers from building with icecc
=20=20icecc: Exclude nss from building with icecc

Martin Jansa (1):
=20=20icecc: Disable icecc a bit sooner

Oleg Yablokov (2):
=20=20webos-image: db8=3D137
=20=20webos-image: db8=3D138

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Beth Flanagan (1):
=20=20distro_alias.inc: update/sort alias information.

Bruce Ashfield (2):
=20=20yocto-bsps: update references to v3.4.85
=20=20meta-bsps: update to v3.10.35

Otavio Salvador (1):
=20=20Globally replace 'base_contains' calls with 'bb.utils.contains'

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



