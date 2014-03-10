Return-Path: <cliff.brake@gmail.com>
Received: from mail-ie0-f171.google.com (mail-ie0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 97A6C6F736;
	Mon, 10 Mar 2014 15:50:23 +0000 (UTC)
Received: by mail-ie0-f171.google.com with SMTP id ar20so7491692iec.2
	for <multiple recipients>; Mon, 10 Mar 2014 08:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:from:to:subject:content-type
	:content-transfer-encoding;
	bh=ugz4S7l2Tp2YeI+L254TuliG7WGNKNjxs0iooUXj/bA=;
	b=rWqiIuwMot359KyUmx9ZzA3YANjzUdLhEuGmgK7GSOdUB2s0x8JpeGpSxCPp4H1UHl
	mK2iOPqPJac03IT4C7of5Whgh07rOZomzTxtpBJvp/tbNnSNPaxLr5Ql3YYEi/UbAqQy
	H0hXZfgXsyE3+APGvfIK4QQ8L4gK9L+c9zRpxHAK3lcIbD4A9qrL3XzKpprL/QYP1Fa7
	//GIJV4PmIN86kMSltwwVzQ1cd8fFhMZQMrau/pSweHhpjNmMrdMg4aMsl8LZKtHsTvm
	E3iZZ19OO0Vz1vts6pIZvltESMjwj38wumqeH+tRIikCf33W6ghpq/ixdvI6w1e+yZ8M
	/4Og==
X-Received: by 10.50.25.67 with SMTP id a3mr18419530igg.28.1394466624123;
	Mon, 10 Mar 2014 08:50:24 -0700 (PDT)
Received: from happy.bec-systems.com (cable-pool6-cs-200.doycomm.com.
	[66.219.185.200])
	by mx.google.com with ESMTPSA id hs6sm37257334igb.2.2014.03.10.08.50.22
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Mar 2014 08:50:22 -0700 (PDT)
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Date: Mon, 10 Mar 2014 08:50:22 -0700 (PDT)
Message-Id: <1394466621532.c808a9d3@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
Subject: OE Changelog since 2014-03-02 until 2014-03-09
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
X-List-Received-Date: Mon, 10 Mar 2014 15:50:24 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2014-03-02 until 2014-03-09.  Projects included in this =
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

Paul Eggleton (1):
=20=20data: add vardepvalueexclude varflag

Richard Purdie (9):
=20=20fetch/git: Separate out an ls-remote function
=20=20fetch/perforce: Drop usage of old style *COMMAND variable and =
MKTEMPDIRCMD
=20=20fetch/svk: Drop usage of old style *COMMAND variable and MKTEMPDIRCMD
=20=20wget: Drop usage of old style *COMMAND variables
=20=20fetch/wget: Start to clean up command construction
=20=20fetch/wget: Separate out download and checkstatus functions
=20=20codeparser: Fix var_execs to append to execs, not references
=20=20fetch2: Drop svk fetcher
=20=20runqueue: Fix typo

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Alexandru Palalau (1):
=20=20oe-selftest: add test for image manifest file creation

Alexandru-Cezar Sardan (1):
=20=20libgcc: make sure symlinks are created in a valid directory

Belen Barros Pena (1):
=20=20documentation.conf: sync with the Yocto Project reference manual

Chen Qi (1):
=20=20python-numpy: fix build for qemumips and qemuppc

Christopher Larson (1):
=20=20kernel-yocto: fix diffconfig/kernel_configme breakage

Corneliu Stoicescu (2):
=20=20oe-selftest: optimize code in _sstatetests_noauto.py module
=20=20oe-selftest: force some values in local.conf for =
_sstatetests_noauto.py

Cristian Iorga (1):
=20=20build-appliance-image: upgraded to commit =
54c2e993ec129563c7ae9f3fdee74ab60d

David Nystr=C3=B6m (2):
=20=20do_rootfs: Added PACKAGE_FEED_URIS functionality
=20=20do_rootfs: Add PACKAGE_FEED_URIS as a vardep

Hongxu Jia (10):
=20=20python-native: remove unused and duplicated sitecustomize.py
=20=20bash: upgrade to 4.3
=20=20bash: update build-tests.patch
=20=20ppp: upgrade to 2.4.6
=20=20ppp: drop enable-ipv6.patch
=20=20ppp: drop if_pppol2tp.h patches
=20=20readline: upgrade to 6.3
=20=20readline: update configure-fix.patch
=20=20readline: drop =
readline-only-enable-meta-key-for-a-single-call-read.patch
=20=20dhcp-client: fix invoke dhclient-script failed on Read-only file =
system

Jackie Huang (2):
=20=20rpcbind: add rpc user and run rpcbind daemon with rpc user
=20=20nfs-utils: run rpc.statd as rpcuser:rpcuser instead of rpcuser:root

Jonathan Liu (2):
=20=20image.bbclass: add BAD_RECOMMENDATIONS/NO_RECOMMENDATIONS rootfs =
vardeps
=20=20consolekit: fix console-kit-log-system-start.service startup

Karl Hiramoto (2):
=20=20gnutls: CVE-2014-0092 correct return codes
=20=20gnutls: Fixed bug that prevented the rejection of v1 intermediate CA =
certifi

Khem Raj (1):
=20=20Upgrade to systemd-stable v208

Laurentiu Palcu (6):
=20=20Revert "lib/oe/package_manager.py: RpmPM: fix issue with multilib =
builds"
=20=20package_manager.py: RpmPM: don't add smart channel if already added
=20=20image.py, rootfs.py, package_manager.py: redirect stderr to stdout =
when call
=20=20package_manager.py: make list_installed() list pkg dependencies too
=20=20run-postinsts: use it for opkg/dpkg too
=20=20opkg/dpkg: remove the postinstalls

Mark Asselstine (1):
=20=20mc: Add 'inherit pkgconfig'

Martin Jansa (7):
=20=20sstate-cache-management: improve shown numbers of removed files
=20=20sstate-cache-management.sh: Allow to remove old .siginfo and .done =
files for
=20=20sstate-cache-management.sh: Don't use echo -n
=20=20base: Show PRINC value in the warning message
=20=20recipes: bump PRs
=20=20pango: Fix postinst by adding missing qemu-native dependency
=20=20package.py: use subprocess.Popen for rpmdeps call

Matt Fleming (1):
=20=20kernel-yocto: Disable ANSI escape codes from git branch

Nitin A Kamble (1):
=20=20insane: Special case kernel modules for x32 targets

Olof Johansson (1):
=20=20sanity.bbclass: support wildcards in SANITY_TESTED_DISTROS

Otavio Salvador (1):
=20=20PR bumps to remove PRINC use in meta-fsl-arm

Paul Barker (1):
=20=20opkg-utils: Update to latest git master

Paul Eggleton (11):
=20=20gnutls: fix failure during do_compile
=20=20core-image-basic / packagegroup-core-basic: rename to *-full-cmdline
=20=20classes/image: support package-management in IMAGE_FEATURES
=20=20Rename PACKAGE_GROUP variable to FEATURE_PACKAGES
=20=20layer.conf: update LAYERVERSION_core for core-image-full-cmdline
=20=20zaurusd: remove
=20=20js: remove
=20=20bitbake.conf: add new vardepvalueexclude varflag to =
BB_SIGNATURE_EXCLUDE_FLA
=20=20classes/buildhistory: fix task signatures changing
=20=20documentation.conf: drop obsolete variables
=20=20classes/uboot-config: ignore doc varflag

Richard Purdie (14):
=20=20oeqa/runtime/dmesg: Ignore DMA timeout errors
=20=20ltp: Work around parallel make race
=20=20Revert "ncurses: use ln -r to generate relative symlink"
=20=20bzip: Add extra files as a specific task
=20=20openjade: Fix configure assumptions about file moves
=20=20autotools: Limit aclocal files to those in dependencies
=20=20alsa-tools/autotools: Ensure that aclocal files can be present with =
AUTOTOOL
=20=20oprofile: Partially fix separate builddir support
=20=20bitbake.conf: Drop -fpermissive
=20=20sstate: Ensure SSTATEPOSTINSTFUNCS is accounted for in signatures
=20=20gstreamer: Fix valgrind header detection
=20=20base.bbclass: Deprecate the PRINC logic
=20=20wayland: Add target sysroot scanner m4 macro
=20=20gstreamer: Fix valgrind determism problem in the same way as =
gstreamer 0.10

Robert Yang (17):
=20=20e2fsprogs: mke2fs: add the ability to copy files from a given =
directory
=20=20e2fsprogs: mke2fs: copy files recursively
=20=20e2fsprogs: mke2fs: create special file
=20=20e2fsprogs: mke2fs: create symlink
=20=20e2fsprogs: mke2fs: copy regular file
=20=20e2fsprogs: mke2fs: create directory
=20=20e2fsprogs: mke2fs: set owner/mode/time for the inode
=20=20e2fsprogs: mke2fs: add an option: -d root-directory
=20=20e2fsprogs: mke2fs: handle hardlinks
=20=20e2fsprogs: debugfs: use the functions in misc/create_inode.c
=20=20e2fsprogs: mke2fs: update the manual for the -d option
=20=20e2fsprogs: enable the "-d" related patches
=20=20image_types.bbclass: use mke2fs -d to create the ext2/3/4 image
=20=20e2fsprogs: populate-extfs.sh: remove it
=20=20grub 2.00: add oe's kernel name to the conf file
=20=20grub git: add oe's kernel name to the conf file
=20=20grub-efi: add oe's kernel name to the conf file

Ross Burton (7):
=20=20mtdev: upgrade to 1.1.5
=20=20lib/oe: drop custom implementation of oe.path.relative
=20=20gcc-cross: don't use oe.path.relative
=20=20perf: don't use oe.path.relative
=20=20insane: check packages for absolute symlinks to the tmpdir
=20=20scripts: add lnr (link relative)
=20=20ncurses: use lnr instead of python code

Saul Wold (3):
=20=20parted: add patch to handle deprecated readline function
=20=20security_flags: Update to correctly link X modules
=20=20grub-efi: use autotools-brokensep

Stefan Stanacar (1):
=20=20testimage: add task level lock

Tom Zanussi (7):
=20=20lttng-modules: Add version 2.4.0
=20=20lttng-tools: Add version 2.4.0
=20=20lttng-ust: Add version 2.4.0
=20=20lttng-modules: Exclude arm
=20=20lttng-modules: Fix 3.14 bio tracepoints
=20=20lttng-ust: Disable doc/examples in the build
=20=20gcc: Add upstream fix for gcc bug 58595

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Martin Jansa (6):
=20=20recipes: bump PRs and remove PRINCs
=20=20openssh: Rename .bbappend to match new version from oe-core
=20=20wpa-supplicant: Rename .bbappend to match new version from oe-core
=20=20ode: Explicitly disable double-precision with PACKAGECONFIG
=20=20ode: upgrade to 0.13
=20=20systemd: Rename .bbappend to match any version

Matthieu CRAPET (1):
=20=20vim: add (custom) license file

Paul Eggleton (3):
=20=20apache2: update to 2.4.7
=20=20modphp: upgrade to 5.5.9
=20=20phpmyadmin: update to 4.1.8

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Aravind Batni (2):
=20=20ti-csl: new recipe providing CSL for TI-KeyStone2 devices
=20=20ti-rm: provides ti resouce manager recipe for KeyStone devices

Sam Nelson (2):
=20=20linuxptp: Add recipe for linux ptp
=20=20openntpd: Add recipe for building OpenNTPD

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

Anthony Felice (1):
=20=20linux-timesys: Remove twr-vf65gs10 specific patches from SRC_URI

Daiane Angolini (1):
=20=20linux-imx (3.0.35): Allow use with 3.10.17-1.0.0 GPU

Javier Viguera (1):
=20=20qt4-x11-free: workaround QT/EGL mismatch for MX6

Lauren Post (10):
=20=20u-boot-imx: Upgrade for 3.10.17-1.0.0_beta release
=20=20linux-imx: Upgrade to 3.10.17-1.0.0_beta version
=20=20xf86-video-imxfb-vivante: Upgrade to 3.10.17-1.0.0_beta version
=20=20gpu-viv-bin-mx6q: Upgrade to 3.10.17-1.0.0_beta version
=20=20gpu-viv-g2d: Update to 3.10.17-1.0.0_beta
=20=20imx6slevk: Add new device tree imx6sl-evk-csi.dtb
=20=20imx6dlsabreauto.conf: Add ecspi and flexcan1 device tree support
=20=20imx6qsabreauto.conf: Add ecspi and flexcan1 device tree support
=20=20imx6qsabreauto.conf: Add sata uboot config support
=20=20imx-kobs: Upgrade to 3.10.17-1.0.0 version

Otavio Salvador (26):
=20=20imx-base.inc: Drop EXTRA_IMAGEDEPENDS setting
=20=20xf86-video-imxfb-vivante: Fix HDMI preferred mode selection
=20=20gpu-viv-g2d: Fix packaging
=20=20imx-uuc: Add 0.4 recipe
=20=20packagegroup-fsl-mfgtool: Provide the required packages
=20=20u-boot-mfgtool.inc: Build a Manufactoring Tool variant
=20=20u-boot-imx-mfgtool: Add 2013.04 version
=20=20linux-mfgtool.inc: Build a Manufactoring Tool variant
=20=20linux-imx-mfgtool: Add 3.10.17 version
=20=20imx6slevk: Add U-Boot Manufacturing Tool config
=20=20imx6dlsabreauto: Add U-Boot Manufacturing Tool config
=20=20imx6dlsabresd: Add U-Boot Manufacturing Tool config
=20=20imx6qsabreauto: Add U-Boot Manufacturing Tool config
=20=20imx6qsabresd: Add U-Boot Manufacturing Tool config
=20=20imx6solosabreauto: Add U-Boot Manufacturing Tool config
=20=20imx6solosabresd: Add U-Boot Manufacturing Tool config
=20=20mfgtool-initramfs-image.bbclass: Abstracts the MfgTool's initramfs =
needs
=20=20fsl-image-mfgtool-initramfs: Add image
=20=20libfslparser: Change the compatibility filter to allow MX23 use
=20=20libfslcodec: Change the compatibility filter to allow MX23 use
=20=20imx-test: Don't install clocks.sh in MX6 as it uses 3.10 kernel
=20=20imx-test: Unify package used by MX23, MX28, MX5 and MX6
=20=20linux-imx: Bump PR so version does not go backwards
=20=20imx-bootlets: Bump PR so version does not go backwards
=20=20u-boot-imx: Bump PR so version does not go backwards
=20=20PRINC removal from recipes

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

Anthony Felice (5):
=20=20u-boot-timesys: Add version 2011.12
=20=20linux-timesys: Add customized kernel
=20=20pcl052: Add machine config
=20=20linux-timesys: Add customized kernel
=20=20pcm052: Add machine config

Eric Nelson (2):
=20=20u-boot-boundary: update to v2014.01
=20=20u-boot-script-boundary: update to match v2014.01 release

Otavio Salvador (6):
=20=20linux-cubox-i: Add Vivante GPU 4.6.9p13 support
=20=20linux-boundary (3.0.35): Add Vivante GPU 4.6.9p13 support
=20=20cubox-i: Stop including imx6sabresd-common
=20=20linux-imx: Stop using PRINC
=20=20imx-bootlets: Stop using PRINC
=20=20u-boot-imx: Stop using PRINC

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

Dmitry Eremin-Solenikov (1):
=20=20zaurusd: enable support for collie

Martin Jansa (1):
=20=20recipes: remove PRINCs

Paul Eggleton (1):
=20=20zaurusd: sync recipe with OE-Core

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-igep:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Richard Purdie (1):
=20=20libva: Disable seperate build directories

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-java:

Henning Heinold (2):
=20=20openjdk6: update icedtea 1.12 to version 1.12.8
=20=20openjdk-common.inc: fix qemu usage

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-kde:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-micro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-mono:

Alex J Lennon (4):
=20=20mono-native: Modify build to eliminate dependency on on host system =
mscorlib
=20=20fsharp: Add support for F# programming language v3.1
=20=20dbus-sharp, dbus-sharp-glib: Added C# managed implementation of D-Bus =
and GL
=20=20recipes-mono: Cleanups to FILES_${PN} packaging

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-netbookpro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nslu2:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-opie:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-qt3:

Paul Eggleton (1):
=20=20core-image-lsb-qt3: fix for rename of packagegroup-core-basic

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-qt5:

Andreas M=C3=BCller (1):
=20=20qtbase.inc: set virtual/mesa and virtual/egl as dependency in =
PACKAGECONFIG[

Andreas Oberritter (3):
=20=20qtbase/qtwebkit: drop ICU variable
=20=20qtdeclarative: drop qtsvg dependency, add packageconfig for =
qtxmlpatterns
=20=20qtwebkit: add packageconfig for gstreamer, qtlocation and qtsensors

Jonathan Liu (4):
=20=20qttools: add missing DEPENDS
=20=20cmake: rename .bbappend to match new version from OE-core
=20=20qtbase: fix mmsize argument parsing for linuxfb plugin
=20=20qtbase: prevent artifacts on raster windows using eglfs plugin

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-slugos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-systemd:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-raspberrypi:

Andrei Gherzan (2):
=20=20omxplayer: Don't hardcode datadir
=20=20Merge "sdcard_image-rpi: make rpi-sdimg image dependent on rootfs =
type"

Jonathan Liu (1):
=20=20sdcard_image-rpi: make rpi-sdimg image dependent on rootfs type

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

Martin Jansa (18):
=20=20enjoy: rename .bbappend to match new version
=20=20libphone-ui-shr: Replace deprecated elementary APIs
=20=20shr-e-gadgets: Use new eldbus instead of old e_dbus
=20=20defaulttunes.inc: update SUPPORTED_EXTRA_ARCHS to include archs =
without thum
=20=20zhone: Fix build with new efl
=20=20e-wm-theme-illume-neo: Bump SRCREV to fix build with new more strict =
edje_cc
=20=20fso-sounds: Add version to LICENSE CC-BY-SA-3.0
=20=20mokomaze: update LICENSE format and remove work around for old ode
=20=20recipes: bump PRs and remove PRINCs
=20=20systemd: Rename .bbappend to match new version from oe-core
=20=20packagegroup-shr: Temporary remove eve for armv[45]
=20=20meta-lg/README: fix prefix and branch names
=20=20meta-lg/README: update branch names
=20=20meta-lg/README: fix repo URI for shr branches
=20=20meta-lg/README: update branch names

Simon Busch (11):
=20=20meta-lg: add layer configuration
=20=20meta-lg: conf: machine: add configuration for mako device
=20=20meta-lg: linux-lg-mako: add kernel recipe for mako machine
=20=20meta-lg: initramfs-boot-android: add necessary override for mako =
device
=20=20meta-lg: android-system-image-mako: add initial recipe
=20=20meta-lg: android-system: add override with extra android rootfs =
configuratio
=20=20meta-lg: base-files: add fstab configuration for mako machine
=20=20meta-android: phablet-headers: bump SRCREV
=20=20meta-android: android-system: disable some more android services
=20=20meta-asus: linux-asus-grouper: update defconfig
=20=20meta-samsung: linux-samsung-tuna: update defconfig

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

Denys Dmytriyenko (2):
=20=20linux-ti-staging: update with musb, QSPI and touchscreen fixes
=20=20u-boot-ti-staging: update with QSPI fixes

Sam Nelson (1):
=20=20ti-ipc: Add recipe for ti-ipc version 3.0.x

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

Andrii Motsok (1):
=20=20webos-image: uriparser=3Dv0.8.0

Dmytro Bozhko (1):
=20=20webos-image: nodejs=3Dv0.10.25

Igor (1):
=20=20webos-image: db8=3D130

Iyad Qumei (3):
=20=20webos-image: icecc-create-env=3D1.0.1
=20=20webos-image: exclude components from icecc build
=20=20webos-image: Modify ROOTFS_READ_ONLY global variable handling

Martin Jansa (2):
=20=20icecc-create-env-native: Drop FILESPATH, document PATCHTOOL
=20=20Revert "sstatesig: Allow to cross target-native/cross/nativesdk =
boundary"

Sapna Todwal (1):
=20=20webos-image: luna-prefs=3Dr11

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Paul Eggleton (2):
=20=20poky-tiny.conf: update for rename of core-image-basic
=20=20meta-yocto/conf/distro/include/*: update image/packagegroup entries

Valentin Popa (1):
=20=20gnutls: update regex

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



