Return-Path: <cliff.brake@gmail.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id C2A2C605BB;
	Mon, 30 Nov 2015 15:57:28 +0000 (UTC)
Received: by ioir85 with SMTP id r85so177700874ioi.1;
	Mon, 30 Nov 2015 07:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:mime-version:message-id:from:to:subject:content-type
	:content-transfer-encoding;
	bh=eb8imeFhLTR7g/f145W5hfi3S03gdPXtpz0utQ0DcnQ=;
	b=RiUddDht7bjowyEZ97P4qVdL2HWtmLqgDx1t9U5E1vcL5AFMptIdch75FrhURstvgE
	VNwi8l3lE1+Femr7yfdJZSG9pGqH1cAgHn+GgkPBw/e/Q9K2fiShv9ebnkvq4/JDILB/
	WGdhu53GEqC91gLWOF7rZuOxNmWfZuvATJxs3qIRNbCmPjubSbDzPeGiQIgs3JBwhTrM
	AaeKxxUKCieblgP23Hw2n0qxOr1KsZahIO3rM6oF2fPVseZWiDFzb3DDChHZ5o2G9lc9
	vzPouU/p6FhbOttZYw8m5OKSn6cG1ipr6S8FTsZXBsKP387qI5VrLsTtEa4uC4j8owlz
	nqXg==
X-Received: by 10.107.9.18 with SMTP id j18mr55427463ioi.58.1448899048862;
	Mon, 30 Nov 2015 07:57:28 -0800 (PST)
Received: from [127.0.0.1] (cable2-pool191-cs-134.doycomm.com.
	[66.219.191.134]) by smtp.gmail.com with ESMTPSA id
	ht2sm8160996igb.22.2015.11.30.07.57.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Nov 2015 07:57:26 -0800 (PST)
Date: Mon, 30 Nov 2015 07:57:26 -0800 (PST)
X-Google-Original-Date: Mon, 30 Nov 2015 15:57:24 GMT
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Message-Id: <1448899044434.ddb454ff@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
Subject: OE Changelog since 2015-11-22 until 2015-11-29
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
X-List-Received-Date: Mon, 30 Nov 2015 15:57:29 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2015-11-22 until 2015-11-29.  Projects included in this =
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

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Alejandro Hernandez (1):
=20=20archiver.bbclass: fix previous issue regarding work-shared for =
linux-yocto

Alejandro del Castillo (1):
=20=20opkg: add cache filename length fixes

Andre McCurdy (1):
=20=20boost.inc: remove unused parameter from get_boost_parallel_make()

Armin Kuster (1):
=20=20libxml2: fix CVE-2015-7942 and CVE-2015-8035

Chen Qi (1):
=20=20mktemp: raise the priority to avoid conflicting with coreutils

Christopher Larson (15):
=20=20image_types: improve wks path specification
=20=20qemu.bbclass: correct the fsl ppc QEMU_EXTRAOPTIONS
=20=20qemu.bbclass: fix vardeps of QEMU_OPTIONS
=20=20recipetool.append: don't choke on a trailing ; in a url
=20=20systemd: for valgrind, define VALGRIND=3D1
=20=20systemd: chown hwdb.bin to root:root for do_rootfs
=20=20systemd: drop unneeded $D check in prerm
=20=20sysprof: use packageconfig for the gui
=20=20bluez5: enable sysvinit support
=20=20blkspace: fix ldflags for iowatcher
=20=20tcf-agent: obey LDFLAGS
=20=20latencytop: obey LDFLAGS
=20=20connman: depend on readline
=20=20sysklogd: inhibit updatercd for non-sysvinit
=20=20openjade-native: statically link local libs

Dan McGregor (2):
=20=20systemd: ignore .so filenames in systemd-doc
=20=20systemd: add machine-id to conffiles

Daniel Istrate (2):
=20=20oeqa/selftest/signing: New test for Signing packages in the package =
feeds.
=20=20oeqa/selftest/signing: Added new test for signing sstate.

Daniel McGregor (1):
=20=20systemd: make coredump a PACKAGECONFIG

Enrico Scholz (1):
=20=20waf.bbclass: filter out non -j from PARALLEL_MAKE

Hongxu Jia (3):
=20=20perl: fix spaces in brackets while using CC version
=20=20flex: fix test-bison-yylval and test-bison-yylloc failed
=20=20logrotate: do not move binary logrotate to /usr/bin

Ioan-Adrian Ratiu (1):
=20=20base-files: stage /etc/skel

Jens Rehsack (3):
=20=20kernel: fix race condition between compile_kernelmodules and =
shared_workdir
=20=20autotools: Allow recipe-individual configure scripts
=20=20libusb1: upgrade from 1.0.19 to 1.0.20

Jian Liu (2):
=20=20archiver.bbclass: add bbappend when do_ar_recipe kernel and gcc =
packages
=20=20insane.bbclass: Avoid libdir QA check if =
PACKAGE_DEBUG_SPLIT_STYLE=3D'debug-fi

Joe Slater (1):
=20=20libsecret: add dependency on intltool-native

Juro Bystricky (1):
=20=20gcc-4.9: Fix various _FOR_BUILD and related variables

Jussi Kukkonen (28):
=20=20qemu: Backport malloc-trace disabling
=20=20glib-2.0: Upgrade 2.44.1 -> 2.46.1
=20=20glib-2.0: Enable more tests while cross-compiling
=20=20glib-networking: Upgrade 2.44.0 -> 2.46.1
=20=20atk: Upgrade 2.16.0 -> 2.18.0
=20=20atk-spi2-core: Upgrade 2.16.0 -> 2.18.1
=20=20at-spi2-atk: Upgrade 2.16.0 -> 2.18.1
=20=20libsoup-2.4: Upgrade 2.50.0 -> 2.52.1
=20=20gdk-pixbuf: Upgrade 2.30.8 -> 2.32.1
=20=20pango: Upgrade 1.36.8 -> 1.38.1
=20=20librsvg: Upgrade 2.40.10 -> 2.40.11
=20=20adwaita-icon-theme: Upgrade 3.16.2.1 -> 3.18.0
=20=20gtk+3: Upgrade 3.16.6 -> 3.18.2
=20=20package_regex.inc: Add gtk-icon-utils-native
=20=20gtk-icon-utils-native: Upgrade 3.16.6 -> 3.18.2
=20=20libxi: Upgrade 1.7.4 -> 1.7.5
=20=20pixman: Upgrade 0.32.6 -> 0.32.8
=20=20libxcb: Upgrade 1.11 -> 1.11.1
=20=20libxcb: Remove unused git-version of the recipe
=20=20xserver-xorg: Upgrade 1.17.2 -> 1.18.0
=20=20xorg-driver-input: add xorg configuration to FILES
=20=20xf86-input-evdev: Upgrade 2.9.2 -> 2.10.0
=20=20xf86-input-synaptics: Upgrade 1.8.2 -> 1.8.3
=20=20xf86-video-omap: Upgrade 0.4.3 -> 0.4.4
=20=20xinput: Upgrade 1.6.1 -> 1.6.2
=20=20xkbcomp: Upgrade 1.3.0 -> 1.3.1
=20=20xkeyboard-config: Upgrade 2.15 -> 2.16
=20=20packagegroup-core-directfb: Don't depend on pango-modules

Leonardo Sandoval (1):
=20=20terminal: Open a new window instead of split on older tmux versions =
(<1.9)

Li Wang (1):
=20=20rpcbind: don't use '-w' for starting rpcbind

Mariano Lopez (2):
=20=20rootfs.py: Stop using installed_pkgs.txt
=20=20package_manager.py: Delete installed_pkgs.txt file

Martin Jansa (2):
=20=20rootfs_*.bbclass: don't add BUILDNAME to do_rootfs vardepsexclude
=20=20libunwind: fix build for qemuarm

Maxin B. John (8):
=20=20bbclass: fix spelling mistakes
=20=20rt-tests: upgrade to version 0.96
=20=20python-pycurl: update version to 7.19.5.2
=20=20libsndfile: fix CVE-2014-9756
=20=20ethtool: bump version to 4.2
=20=20harfbuzz: update to 1.0.6
=20=20wireless-tools: remove unused files
=20=20mc: upgrade to 4.8.15

Mike Crowe (1):
=20=20allarch: Force TARGET_*FLAGS variable values

Otavio Salvador (2):
=20=20u-boot: Update to 2015.10 release
=20=20weston: Add PACKAGECONFIG option for colord CMS

Paul Eggleton (2):
=20=20classes/metadata_scm: fix git errors showing up on non-git =
repositories
=20=20classes/license: fix intermittent license collection warning

Richard Purdie (4):
=20=20classes: Ensure pass setVar/setVarFlag strings, not integers
=20=20insane: Don't depend on BB_TASKDEPDATA
=20=20lib/oe/copy_buildsystem: Don't expand BB_TASKDEPDATA
=20=20sstate: Ensure siginfo and sig files are also touched

Robert Yang (3):
=20=20bitbake-prserv-tool: check file name
=20=20gdbm 1.8.3: install libgdbm_compat
=20=20gcc-multilib-config: make aarch64 support multilib

Ross Burton (15):
=20=20ptest-gnome: extend EXTRA_OECONF in all builds, not just target
=20=20sstate: respect GPG_BIN and GPG_HOME
=20=20oeqa/selftest/sstatetests: prettier output for allarch test
=20=20lib/oe/distro_check: don't set empty proxy keys
=20=20libusb1: fix make install race
=20=20glibc: fix Upstream-Status tag
=20=20weston: delete unused patch
=20=20meta: add some missing Upstream-Status tags to patches
=20=20libsdl2: require GLES when building Wayland support
=20=20openssl: sanity check that the bignum module is present
=20=20openssl: use subdir=3D instead of moving files in =
do_configure_prepend()
=20=20gstreamer1.0: fix install race
=20=20systemd: fix Upstream-Status tag
=20=20glib-2.0: build dependency cleanup
=20=20pango: add RPROVIDES for removed packages

Tyler Hall (1):
=20=20classes/cpan-base: fix libdir for nativesdk

Tzu-Jung Lee (2):
=20=20linux-firmware: package Broadcom BCM4339 firmware
=20=20devtool: add sync command

Wenzong Fan (2):
=20=20openssl: fix ptest issues
=20=20mdadm: fix CFLAGS and ptest issues

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Denys Dmytriyenko (2):
=20=20ipc-test-fw: package all files per systest request
=20=20packagegroup-*-console: add util-linux-fsck for universal fsck command

Jacob Stiffler (4):
=20=20tisdk-image.bbclass: Remove wildcard from search for devkit
=20=20meta-toolchain-arago-tisdk: Split common content into inc file
=20=20meta-toolchain-arago-tisdk-server: tisdk devkit without QT
=20=20arago-core-tisdk-image: use meta-toolchain-arago-tisdk-server for =
keystone

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

Fabio Berton (116):
=20=20chicken-egg-salmonella: Add recipe for version 2.7
=20=20chicken-egg-apropos: Add recipe for version 2.2.0
=20=20chicken-egg-clucker: Add recipe for version 0.10
=20=20chicken-egg-hmac: Add recipe for version 7.0.1
=20=20chicken-egg-oauth: Add recipe for version 0.2
=20=20chicken-egg-sha1: Add recipe for version 3.1.0
=20=20chicken-egg-correios: Add recipe for version 0.1
=20=20chicken-egg-couchdb: Add recipe for version 0.3.5
=20=20chicken-egg-efax: Add recipe for version 0.1
=20=20chicken-egg-elliptic-curves: Add recipe for version 1.0.2
=20=20chicken-egg-estraier-client: Add recipe for version 0.3.1
=20=20chicken-egg-expat: Add recipe for version 1.4
=20=20chicken-egg-fastcgi: Add recipe for version 1.1.1
=20=20chicken-egg-imlib2: Add recipe for version 0.17
=20=20chicken-egg-gdbm: Add recipe for version 1.2
=20=20chicken-egg-opengl-glew: Add recipe for version 0.9.2
=20=20chicken-egg-graphs: Add recipe for version 0.4.2
=20=20chicken-egg-henrietta-cache: Add recipe for version 1.1
=20=20chicken-egg-hyde: Add recipe for version 0.21.0
=20=20chicken-egg-isbn: Add recipe for version 0.8
=20=20chicken-egg-ldap-bind: Add recipe for version 0.0.1
=20=20chicken-egg-log5scm: Add recipe for version 1.1.2
=20=20chicken-egg-lowdown: Add recipe for version 0.1.0
=20=20chicken-egg-low-level-macros: Add recipe for version 3.4.2
=20=20chicken-egg-manual-labor: Add recipe for version 0.1.1
=20=20chicken-egg-markdown-svnwiki: Add recipe for version 0.2.1
=20=20chicken-egg-mbox: Add recipe for version 4.0
=20=20chicken-egg-miniml: Add recipe for version 1.11
=20=20chicken-egg-monad: Add recipe for version 4.1
=20=20chicken-egg-msgpack: Add recipe for version 0.2
=20=20chicken-egg-mysql-client: Add recipe for version 0.9
=20=20chicken-egg-unitconv: Add recipe for version 2.7
=20=20chicken-egg-neo4j: Add recipe for version 0.1.3
=20=20chicken-egg-openal: Add recipe for version 0.91
=20=20chicken-egg-protolk: Add recipe for version 0.5
=20=20chicken-egg-refdb: Add recipe for version 1.02
=20=20chicken-egg-salmonella-diff: Add recipe for version 1
=20=20chicken-egg-salmonella-feeds: Add recipe for version 0
=20=20chicken-egg-salmonella-html-report: Add recipe for version 1.6
=20=20chicken-egg-scbib: Add recipe for version 1.5
=20=20chicken-egg-selenium: Add recipe for version 0.6
=20=20chicken-egg-send-grid: Add recipe for version 2.0.1
=20=20chicken-egg-sha2: Add recipe for version 3.1.0
=20=20chicken-egg-sicp: Add recipe for version 0.13.2
=20=20chicken-egg-signal-diagram: Add recipe for version 4.1
=20=20chicken-egg-slatex: Add recipe for version 20090928
=20=20chicken-egg-slime: Add recipe for version 1.2
=20=20chicken-egg-smsmatrix: Add recipe for version 0.1
=20=20chicken-egg-soil: Add recipe for version 1.4.1
=20=20chicken-egg-sp: Add recipe for version 0.3
=20=20chicken-egg-sqlite3: Add recipe for version 3.6.1
=20=20chicken-egg-srfi-102: Add recipe for version 1.0.3
=20=20chicken-egg-thread-utils: Add recipe for version 1.0.3
=20=20chicken-egg-srfi-27: Add recipe for version 3.1.8
=20=20chicken-egg-timed-resource: Add recipe for version 1.0.2
=20=20chicken-egg-striped-zebra: Add recipe for version 0.2
=20=20chicken-egg-sxml-fu: Add recipe for version 0.3.1
=20=20chicken-egg-tiger-hash: Add recipe for version 3.1.0
=20=20chicken-egg-twilio: Add recipe for version 0.2.5
=20=20chicken-egg-udev: Add recipe for version 0.0.1
=20=20chicken-egg-ugarit: Add recipe for version 2.0
=20=20chicken-egg-ugarit-manifest-maker: Add recipe for version 0.1
=20=20chicken-egg-usb: Add recipe for version 0.1.3
=20=20chicken-egg-uuid-ossp: Add recipe for version 1.4.2
=20=20chicken-egg-vandusen: Add recipe for version 0.12
=20=20chicken-egg-yahoo-finance: Add recipe for version 0.2.0
=20=20chicken-egg-yaml: Add recipe for version 0.1.2
=20=20chicken-egg-yelp: Add recipe for version 1.0.4
=20=20chicken-egg-xml-rpc: Add recipe for version 2.0.2
=20=20chicken-egg-zlib: Add recipe for version 0.5.1
=20=20chicken-egg-*: Fix identifiers for LGPL-3.0 license
=20=20chicken-egg-*: Remove LGPL-1 -> LGPL license mapping
=20=20chicken-egg-missbehave: Add missbehave to self-dependent-eggs
=20=20chicken-egg-crc: Add recipe for version 1.0.1
=20=20chicken-egg-f-operator: Fix setup-helper usage
=20=20chicken-egg-expand-full: Fix setup-helper usage
=20=20chicken-egg-kvlists: Add recipe for version 1.0.5
=20=20chicken-egg-moremacros: Fix setup-helper usage
=20=20chicken-egg-mw-core: Add recipe for version 0.2.2
=20=20chicken-egg-mw: Add recipe for version 0.2.1
=20=20chicken-egg-number-limits: Add recipe for version 2.0.0
=20=20chicken-egg-posix-utils: Fix setup-helper usage
=20=20chicken-egg-ripemd: Add recipe for version 1.1.0
=20=20chicken-egg-procedural-macros: Add recipe for version 1.0
=20=20chicken-egg-srfi-40: Add recipe for version 0.3
=20=20chicken-egg-srfi-45: Fix setup-helper usage
=20=20chicken-egg-srfi-60: Add recipe for version 0.2
=20=20chicken-egg-srfi-95: Add recipe for version 1.3
=20=20chicken-egg-srfi-41: Add recipe for version 1.2.3
=20=20chicken-egg-srfi-9-ext: Add recipe for version 1.0.3
=20=20chicken-egg-stack: Add recipe for version 2.1.4
=20=20chicken-egg-sxml-templates: Add recipe for version 0.2.1
=20=20chicken-egg-srfi-29: Add recipe for version 2.3.2
=20=20chicken-egg-hashes: Add recipe for version 1.1.3
=20=20chicken-egg-bloom-filter: Add recipe for version 1.1.6
=20=20chicken-egg-call-with-sqlite3-connection: Add recipe for version 0.1.2
=20=20chicken-egg-directory-utils: Add recipe for version 1.0.3
=20=20chicken-egg-error-utils: Add recipe for version 1.0.3
=20=20chicken-egg-byte-blob-stream: Add recipe for version 1.5
=20=20chicken-egg-formular: Add recipe for version 5.2
=20=20chicken-egg-genturfahi: Add recipe for version 1.0.4
=20=20chicken-egg-awk: Update to version 1.8
=20=20chicken-egg-bencode: Update to version 1.1.0
=20=20chicken-egg-bindings: Update to version 4.0
=20=20chicken-egg-make: Update to version 1.8
=20=20chicken-egg-procedural-macros: Update to version 1.0.1
=20=20chicken-egg-mailbox: Add recipe for version 2.1.5
=20=20chicken-egg-mailbox-threads: Add recipe for version 1.4
=20=20chicken-egg-json-rpc: Add recipe for version 0.1.7.1
=20=20chicken-egg-levenshtein: Add recipe for version 1.0.2
=20=20chicken-egg-coerce: Add recipe for version 2.0.0
=20=20chicken-egg-prcc: Add recipe for version 0.1
=20=20chicken-egg-prometheus: Add recipe for version 2.0.2
=20=20chicken-egg-remote-mailbox: Add recipe for version 2.0.2
=20=20chicken-egg-websockets: Add recipe for version 0.1.6
=20=20chicken-egg-simple-units: Add recipe for version 1.2.5

Mario Domenech Goulart (13):
=20=20gen-egg-recipes: look for .inc files using lowercase egg names
=20=20gen-egg-recipes: fix identifiers for LGPL-3.0 license
=20=20gen-egg-recipes: remove LGPL-1 -> LGPL license mapping
=20=20layer.conf: look for license files in the layer "licenses" directory
=20=20licenses/SRFI: add SRFI license
=20=20gen-egg-recipes: be quiet by default; use --verbose for verbose output
=20=20chicken-egg-xlib-utils: add patch to fix host contamination
=20=20gen-egg-recipes: rewrite "Bremer License" as "Bremer"
=20=20chicken-egg-tk: fix LICENSE
=20=20licenses/Bremer: add license file (PDF) for Bremer License
=20=20chicken_install.bbclass: fix CHICKEN_INCLUDE_PATH for the target
=20=20gen-egg-recipes: update skip-eggs/reasons for platform-dependent eggs
=20=20update-henrietta-cache: make it simpler and more consistent

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-efikamx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ettus:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm:

Carlos Rafael Giani (1):
=20=20gstreamer1.0-plugins-bad: Fix patch for GStreamer 1.6

Chunrong Guo (1):
=20=20u-boot-ls1: The finale u-boot binary is not named as u-boot.bin for =
sdcard/s

Otavio Salvador (4):
=20=20kernel-module-imx-gpu-viv: Add 'galcore' to module autoloading
=20=20linux-fslc-mx6: Fix serial console use with SystemD
=20=20linux-fslc-mx6: Disable 'evbug' module on default config
=20=20linux-fslc-mx6: Disable Tux logo for default config

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

Ian Coolidge (2):
=20=20linux-boundary (3.14.28): Bump SRCREV to 2ffd4a4
=20=20linux-boundary (3.14.28): Sync defconfig with latest =
boundary_defconfig

Oliver Wendt (3):
=20=20u-boot-karo: add recipe for Ka-Ro U-Boot v2015.10-rc2 (based) for =
TX6Q/U/S C
=20=20linux-karo: add recipe for Ka-Ro Linux kernel v3.16 (based) for =
TX6Q/U/S COM
=20=20tx6qus: add machine configuration for TX6Q/U/S COM

Stefan Agner (2):
=20=20u-boot-toradex: update to Toradex V2.5 Beta 2 release
=20=20linux-toradex: update to Toradex V2.5 Beta 2 release

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-ppc:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-guacamayo:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix-community:

Andreas M=C3=BCller (2):
=20=20inux-mainline-3.14: update to 3.14.57
=20=20layer.conf: add LAYERDEPENDS

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

Greg Sikorski (2):
=20=20Enable multi-core build
=20=20Update multi-core switch to use default bitbake config

Ilkka Myller (1):
=20=202015-11-17, Version 5.1.0 (Stable)

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
=20=20pmmc-fw: add initial PMMC firmware binary
=20=20qmss-pdsp-fw: add initial QMSS PDSP firmware
=20=20omap5-evm.conf: bump max_leb_cnt

Eric Ruei (1):
=20=20omap5-sgx-ddk-um-linux: bump SRCREV of ti33x for configuration =
variable Defa

Jacob Stiffler (2):
=20=20ti-ipc-rtos: Fix omap-a15 DEPENDS
=20=20linux-ti-staging: k2g-evm: Add pmmc-fw as dependency

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

Nathan Rossi (14):
=20=20gcc_4.8: Drop appends
=20=20qemu_2.4: Wildcard revision/minor version
=20=20layer.conf: Remove unnecessary early expansion with ':=3D'
=20=20Fix up use of '_append +=3D'
=20=20linux-xlnx_4.0: Update to 'xilinx-v2015.4' release
=20=20ep108-zynqmp: U-Boot config name changed
=20=20zc70*-zynq7: Update U-Boot config
=20=20u-boot-xlnx_2015.04: Fix up configs for ZC70x
=20=20u-boot-xlnx_2015.04: Refactor U-Boot SPL generation
=20=20conf/machine/*-zynq7.conf: Update the configuration of SPL
=20=20u-boot-xlnx-dev: Update the default revision
=20=20u-boot-xlnx-dev: Setup SPL generation
=20=20Fix up UBOOT_BINARY for Zynq and setup SPL to load correctly
=20=20u-boot-xlnx_2015.07: Add recipe for 'xilinx-v2015.4'

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Alejandro Hernandez (1):
=20=20gma500_gfx: Avoid inserting gma500_gfx module for certain devices

Leonardo Sandoval (4):
=20=20yocto-bsp: Avoid duplication of user patches =
({{=3Dmachine}}-user-patches.scc)
=20=20yocto-bsp: Typo on the file extension
=20=20yocto-bsp: Set KTYPE to user selected base branch
=20=20yocto-bsp: Set SRCREV meta/machine revisions to AUTOREV

Maxin B. John (1):
=20=20distro/maintainers.inc: include stress package details

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



