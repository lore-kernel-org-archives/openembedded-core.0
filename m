Return-Path: <cliff.brake@gmail.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id B4F8672C22;
	Wed, 21 Jan 2015 14:20:27 +0000 (UTC)
Received: by mail-ig0-f173.google.com with SMTP id a13so22555281igq.0;
	Wed, 21 Jan 2015 06:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:mime-version:message-id:from:to:subject:content-type
	:content-transfer-encoding;
	bh=OVlInsec7sBSqL1oXZHgUqN5XLEyQP7XYgj2DyGXtG8=;
	b=PacF+sKFk3VsD8/O/tRaXr6N3VhmGU52Mxz23dNqVKiy+/Q4kAd374oM1vFxUrZLGr
	mc1241BdJFMlcQWwkbPWCPFFQ59EuH28WYLNlY7Q4JeqG8uhFFLROadP3vzyCnAgZ56S
	jbWiktL79rgp3wXcZ3zKuko6MwNukFt6+qBD4QhSAeO3mpc3K3898oeCU6KfgGOrbLYs
	d7X9dmQwVkf9AInRyVeOR+UfpygginDUQhJMoInHkljm48oEjUlcOLTmFRHsaNe4JWa0
	DeVvcn+UR3uS487L2zyze6Ct/itTJ2vGKuC8LovPxSq2wa9NHF9WFpDq8xPn4vM5lL62
	TdzQ==
X-Received: by 10.50.114.33 with SMTP id jd1mr35341589igb.31.1421850028382;
	Wed, 21 Jan 2015 06:20:28 -0800 (PST)
Received: from [127.0.0.1] (cable2-pool191-cs-105.doycomm.com.
	[66.219.191.105])
	by mx.google.com with ESMTPSA id i19sm5831939igh.6.2015.01.21.06.20.26
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Jan 2015 06:20:27 -0800 (PST)
Date: Wed, 21 Jan 2015 06:20:27 -0800 (PST)
X-Google-Original-Date: Wed, 21 Jan 2015 14:20:25 GMT
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Message-Id: <1421850025998.2793e4df@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
Subject: OE Changelog since 2015-01-11 until 2015-01-18
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
X-List-Received-Date: Wed, 21 Jan 2015 14:20:36 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2015-01-11 until 2015-01-18.  Projects included in this =
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

Alexandru DAMIAN (2):
=20=20toastergui: all builds page lists failed build requests
=20=20toasterui: fix variable data error

An=C3=ADbal Lim=C3=B3n (1):
=20=20bb/fetch2/ssh.py: Fix urldata.localpath use os.path.normpath

Michael Wood (2):
=20=20toaster: Add layer details page feature
=20=20toaster: layerdetails Remove compatibility setting

Richard Purdie (6):
=20=20bitbake: Add pyinotify to lib/
=20=20cooker/cache/parse: Implement pyinofity based reconfigure
=20=20cooker: Fix pyinotify handling of ENOENT issues
=20=20cooker: Improve pyinotify performance
=20=20ConfHandler: Rename oldfn to parentfn to be clearer
=20=20ConfHandler: Clean up bogus imports

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Armin Kuster (1):
=20=20lz4: update to r127

Bruce Ashfield (2):
=20=20kernel: move source and build output to work-shared
=20=20kernel-yocto: remove GUILT_BASE from terminal exports

Chen Qi (3):
=20=20sysstat: upgrade to stable version 11.0.2
=20=20coreutils: upgrade to 8.23
=20=20sysklogd: upgrade to 1.5.1

Darren Hart (2):
=20=20kernel-devsrc: Depend on virtual/kernel:do_compile
=20=20kernel.bbclass: Update cleandirs to remove new kernel staging dirs

Dmitry Eremin-Solenikov (1):
=20=20icecc.bbclass: properly handle disabling of icecc

Hongxu Jia (2):
=20=20directfb: upgrade to 1.7.6
=20=20qt4-embedded: support c++0x stand for directfb

Kai Kang (1):
=20=20openssh: deliver ssh-copy-id

Martin Jansa (1):
=20=20package.bbclass: Fix support for private libs

Maxin B. John (1):
=20=20curl: upgrade to 7.40

Otavio Salvador (2):
=20=20module.bbclass: Add KERNEL_SRC in EXTRA_OEMAKE
=20=20kernel.bbclass: When linux/version.h exists, copy it

Paul Eggleton (4):
=20=20pigz: add Apache-2.0 to LICENSE
=20=20perl: fix LICENSE to be more accurate
=20=20libxml-simple-perl: fix LICENSE to be more accurate
=20=20libxml-parser-perl: fix LICENSE to be more accurate

Peter A. Bigot (1):
=20=20bluez5: upgrade to 5.27

Randy Witt (1):
=20=20xserver-xorg: Always disable systemd-logind.

Richard Purdie (4):
=20=20libxml2: Backport fix for CVE introduced entity issues
=20=20cross-canadian/meta-environment: Allow modification of TARGET_OS to =
be optio
=20=20lib/oe/rootfs.py: Fix reference to abiversion file location
=20=20depmodwrapper-cross: Update to use STAGING_KERNEL_BUILDDIR

Robert P. J. Day (1):
=20=20BAD_RECOMMENDATIONS also works for RPM packaging.

Robert Yang (41):
=20=20guile: fixed installed-vs-shipped error
=20=20parted: parted-ptest RDEPENDS on python
=20=20pax-utils: RDEPENDS on python
=20=20grub 2.0: several fixes
=20=20python-git: upgrade to 0.3.3
=20=20python-gitdb: upgrade to 0.6.1
=20=20gnu-efi: upgrade to 3.0.1
=20=20libical: use BPN in SRC_URI
=20=20cups: remove fakeroot from do_install()
=20=20man: remove fakeroot from do_install()
=20=20portmap: remove obsolete lines
=20=20slang: set CLEANBROKEN
=20=20mkelfimage: set CLEANBROKEN
=20=20quilt: set CLEANBROKEN
=20=20autotools.bbclass: print make clean
=20=20libnl: separate B and S
=20=20nspr: fix B !=3D S
=20=20ghostscript: fix B !=3D S
=20=20bc: separate B and S
=20=20cmake: fix B !=3D S
=20=20cracklib: separate B and S
=20=20flac: separate B and S
=20=20libgcrypt: separate B and S
=20=20gnutls: separate B and S
=20=20bash: separate B and S
=20=20pinentry: separate B and S
=20=20oprofile: separate B and S
=20=20expect: separate B and S
=20=20apr-util: fix B !=3D S
=20=20qemu: fix B !=3D S
=20=20gnome-desktop-testing: separate B and S
=20=20libcroco: separate B and S
=20=20alsa-utils: fix B !=3D S
=20=20python: fix B !=3D S
=20=20connman: fix B !=3D S
=20=20libfm-extra: separate B and S
=20=20libfm: separate B and S
=20=20icon-naming-utils: separate B and S
=20=20rpm: separate B and S
=20=20presentproto: separate B and S
=20=20kexec-tools: separate B and S

Ross Burton (4):
=20=20oprofile: disable documentation
=20=20socat: forcibly disable use of libbsd
=20=20systemd: add missing RDEPENDS
=20=20msmtp: fix configure options

Saul Wold (7):
=20=20usbutils: Add version 008
=20=20security_flags: disable pie support for libaio, blktrace and ltp
=20=20libaio: Upgrade to 0.3.110
=20=20msmtp: Upgrade to 1.6.1
=20=20dtc: Upgrade to 1.4.1 (git based)
=20=20rxvt-unicode: Add Upgraded version 9.21
=20=20glibc: Fix up minimal build with libc-libm

Tom Zanussi (2):
=20=20perf: Add libdw unwind support to perf-libunwind feature
=20=20perf: Disable perf-libunwind

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Andreas M=C3=BCller (1):
=20=20network-manager-applet: remove polkit-gnome dependency and =
un-blacklist reci

Armin Kuster (1):
=20=20libssh: depends fix

Ash Charles (1):
=20=20mpd: ship systemd socket file

Jackie Huang (2):
=20=20vim: add recipe for vim-tiny
=20=20adduser: add new recipe

Martin Jansa (2):
=20=20xfce4-vala: blacklist
=20=20rsyslog: fix build with json-0.12

Qian Lei (1):
=20=20libutempter: Fix compile error

leimaohui (4):
=20=20libqb: add new recipe
=20=20corosync_2.3.4: add new recipe
=20=20dlm: add a new recipe
=20=20crash: add new recipe

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Denys Dmytriyenko (4):
=20=20switch-config: update the revision
=20=20ltp-ddt: set a specific commit ID
=20=20branding-core: disable AUTOREV for the release
=20=20arago.conf: bump distro version

Franklin S. Cooper Jr (7):
=20=20branding-amsdk: Clear AMSDK branding and include Qt 4 for AM335x and =
AM437x
=20=20arago.conf: Allow QT_PROVIDER to be overridden in branding files
=20=20packagegroup-arago-tisdk-graphics: Exclude Weston in a Qt 4 based =
filesystem
=20=20packagegroup-arago-tisdk-qte-sdk-host: Add tstat when Qt 4 is being =
used.
=20=20arago-source-ipk: Add sitara-linux-ti-staging
=20=20sitara-linux-ti-staging: Add append to insure kernel sources are =
packaged
=20=20branding-amsdk: Set preferred provider to point to =
sitara-linux-ti-staging

Sam Nelson (2):
=20=20syslog-ng: Add recipe for syslog-ng from meta-openembedded master
=20=20demo-image-proc: Add recipe for TI Image processing demo for keystone =
2

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-atmel:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-beagleboard:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-browser:

Mario Domenech Goulart (1):
=20=20layer.conf: set LAYERVERSION to "1"

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

Alex Gonzalez (1):
=20=20perf: Only disable perf events for machines using 2.6.35.3.

Chunrong Guo (7):
=20=20apptrk: add recipes for Layerscape1 support
=20=20asf : add recipes for Layerscape1 support
=20=20cst: add recipes for Layerscape1 support
=20=20ls1021aqds.conf : add QE_UCODE
=20=20ls1021atwr.conf : add QE_UCODE
=20=20qemu-fsl: add recipes for Layerscape1 support
=20=20qe-ucode: add recipes for Layerscape1 support

Otavio Salvador (2):
=20=20u-boot-fslc: Update to 3120db4e revision
=20=20imx-test: Ensures kernel is installed before building scripts

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-ppc:

Rich Schmitt (1):
=20=20uio-seville: update to revision 35af73f

Ting Liu (10):
=20=20multilib: use ?=3D to allow overridden in local.conf
=20=20qe-ucode: install if QE_UCODE defined
=20=20add QE_UCODE definition in machine.conf
=20=20auto-resp: add recipe
=20=20cst: upgrade revision to 2d35e98
=20=20u-boot: replace base_contains with python codes
=20=20uspdcp: remove as it is not bsp related
=20=20sysvinit: remove obsolete bbappend
=20=20move all common definitions onto qoriq-base.inc
=20=20remove default setting for ubifs

Zhenhua Luo (1):
=20=20cs4315-firmware: remove recipe

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-guacamayo:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix-community:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-handheld:

Andrea Adami (1):
=20=20linux-yocto(-tiny-kexecboot)_3.17: remove upstreamed patch for collie

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-igep:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Ross Burton (2):
=20=20gst-va-intel: Depend on gstreamer-vaapi-0.10
=20=20gstreamer-vaapi: Remove obsolete 0.4.3 version

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

Alex J Lennon (1):
=20=20mono: Updated to Mono 3.12.0

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

Martin Jansa (1):
=20=20qt5-opengles2-test: exclude from world because of gles2 dependency

Otavio Salvador (1):
=20=20qtmultimedia: Add support to enable/disable PulseAudio and ALSA

Tobias Olausson (1):
=20=20qt3d: change to 'dev' branch

kkelly87 (1):
=20=20qttranslations: adding recipes for qt specific translations

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-slugos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-systemd:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-raspberrypi:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

Martin Jansa (3):
=20=20suspend-blocker: fix build with json-c 0.12

Simon Busch (3):
=20=20meta-android: kernel_android.bbclass: use only first line of find =
output
=20=20meta-hp: initramfs-boot-android: use a second file for rootfs =
detection
=20=20meta-lg: linux-lg-mako: bump SRCREV

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

Franklin S. Cooper Jr (1):
=20=20sitara-linux-ti-staging: Create recipe for Sitara 3.14 kernel tree

Sam Nelson (1):
=20=20cuia: Add recipe for TI unified Instrumentation Architecture in C =
module

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Cristian Iorga (1):
=20=20poky.conf: add support for running mips64 qemu machine

Paul Eggleton (1):
=20=20poky.conf: mark all CentOS 6/7 versions as compatible

Robert Yang (1):
=20=20maintainers.inc: update it

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



