Return-Path: <cliff.brake@gmail.com>
X-Greylist: delayed 408 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 28 May 2014 15:26:38 UTC
Received: from mail-ig0-f171.google.com (unknown [209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id D594B6B3AB;
	Wed, 28 May 2014 15:26:38 +0000 (UTC)
Received: by mail-ig0-f171.google.com with SMTP id c1so2542003igq.16
	for <multiple recipients>; Wed, 28 May 2014 08:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:mime-version:message-id:from:to:subject:content-type
	:content-transfer-encoding;
	bh=ivK+7YPvlO/XWb8RUTUe9ckI6cU0DqqCICFuLTUkaUA=;
	b=GNFsvXr5L8bSkgPVZRxNo6DR+huDi+FW3ghCCCZYljVZFr7rm3Cq7ibfeyGidCJY/0
	ks/6SGd/9PbSFiAxpK/5DIRI/VFbeRuZIsIj81U6apN/rMbvUENdEFDHvTjQyIeSSBNB
	i56+QM64k0MmZ1VhyCnvs0iJ22q64Q6K+sB9fywPk3jX5Ut6nxo5zeh4lvgC1s6f3zHd
	xTK4/Fn9JmBA75jmvksByfmOOHkscfoiU98rqYC15bt1XuUvv00NBVN0eFwl2rCvvi/k
	jHpQu+oC6SC5kDOenSpLkau9lT/oU2nUhCc/W45Y5/nloUVbhXBLT/2+3TLd6FRLWAIL
	637A==
X-Received: by 10.50.111.161 with SMTP id ij1mr2068203igb.12.1401290390612;
	Wed, 28 May 2014 08:19:50 -0700 (PDT)
Received: from happy.bec-systems.com (cable-pool6-cs-200.doycomm.com.
	[66.219.185.200]) by mx.google.com with ESMTPSA id
	qh3sm16470209igb.17.2014.05.28.08.19.48 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 May 2014 08:19:49 -0700 (PDT)
Date: Wed, 28 May 2014 08:19:49 -0700 (PDT)
X-Google-Original-Date: Wed, 28 May 2014 15:19:48 GMT
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Message-Id: <1401290388097.f8436bef@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
Subject: OE Changelog since 2014-05-18 until 2014-05-25
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
X-List-Received-Date: Wed, 28 May 2014 15:26:40 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2014-05-18 until 2014-05-25.  Projects included in this =
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

Chris Morgan (1):
=20=20fetch2/gitsm: Documentation improvements for gitsm:// fetcher

David Reyna (1):
=20=20toaster: reduce redundant foreign key lookups

Farrell Wymore (1):
=20=20toaster: sort columns properly after edit columns

Ionut Chisanovici (1):
=20=20toaster: toaster oe-selftest support

Richard Purdie (1):
=20=20data_smart: Fix an unusual variable reference bug

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Chen Qi (4):
=20=20udev-extraconf: fix the misuse of /run/media
=20=20init-live.sh: list block devices correctly
=20=20initrdscripts: fix for /run/media
=20=20runqemu-internal: add "console=3DttyS0" to ramfs image kernel =
parameters

Chong Lu (6):
=20=20syslinux-native: fix parallel building issue
=20=20libpcre: Update to 8.35 version
=20=20quilt: Update to 0.63 version
=20=20flex: Update to 2.5.39 version
=20=20byacc: Update to 20140422 version
=20=20guile: Update to 2.0.11 version

Cristian Iorga (2):
=20=20harfbuzz: upgrade to 0.9.28
=20=20bluez5: upgrade to 5.19

Cristiana Voicu (1):
=20=20packagegroup-core-lsb: fix warning text

Jo=C3=A3o Henrique Ferreira de Freitas (2):
=20=20wic: add support to look in all layers and get .wks file
=20=20wic: add support to look in all layers and get plugins

Li Wang (2):
=20=20nss: CVE-2014-1492
=20=20nss: CVE-2013-1740

Martin Jansa (1):
=20=20lttng-modules: Fix build with older kernels for 2.3.3 as 2.4.0

Paul Eggleton (2):
=20=20libav: upgrade 0.8.x version to 0.8.11
=20=20libav: upgrade 9.x version to 9.13

Peter Seebach (1):
=20=20pseudo: handle fchmodat better, mask out unwanted write bits

Philip Balister (1):
=20=20python-native : Add patch to fix configure error with gcc 4.8.

Richard Purdie (1):
=20=20taglib: Force a disable of the floating dependency on boost

Robert Yang (1):
=20=20initramfs-live-install: avoid using grub.d/40_custom

Ross Burton (2):
=20=20pango: enable ptest
=20=20perl: stop perl-modules recommending perl-ptest

Roy Li (2):
=20=20lttng-tools: fix alignment issue
=20=20babeltrace: fix alignment issue

Saul Wold (2):
=20=20libusb1: disable floating dependency on udev
=20=20cups: fix for cups not building without avahi

Sebastian Wiegand (2):
=20=20distro_features_check.bbclass: fix wrong indentation
=20=20distro_features_check.bbclass: fix searching whole list

Tim Orling (4):
=20=20mirrors.bbclass: add ${CPAN_MIRROR} option
=20=20bitbake.conf: add default ${CPAN_MIRROR}
=20=20wayland: upgrade to 1.5.0
=20=20weston: upgrade to 1.5.0

Valentin Popa (2):
=20=20dri3proto: add it to oe-core
=20=20libxshmfence: add it to oe-core

Yue Tao (22):
=20=20Screen: fix for Security Advisory CVE-2009-1214
=20=20screen: fix for Security Advisory CVE-2009-1215
=20=20subversion: fix for Security Advisory CVE-2013-1849
=20=20subversion: fix for Security Advisory CVE-2013-4505
=20=20subversion: fix for Security Advisory CVE-2013-4131
=20=20subversion: fix for Security Advisory CVE-2013-1845
=20=20subversion: fix for Security Advisory CVE-2013-1847 and CVE-2013-1846
=20=20subversion: fix for Security Advisory CVE-2013-4277
=20=20tiff: fix for Security Advisory CVE-2013-4231
=20=20openssl: fix for CVE-2010-5298
=20=20gst-ffmpeg: fix for Security Advisory CVE-2014-2263
=20=20gst-ffmpeg: fix for Security Advisory CVE-2013-0865
=20=20gst-ffmpeg: fix for Security Advisory CVE-2014-2099
=20=20gst-ffmpeg: fix for Security Advisory CVE-2013-0868
=20=20gst-ffmpeg: fix for Security Advisory CVE-2013-0845
=20=20gst-ffmpeg: fix for Security Advisory CVE-2013-0852
=20=20gst-ffmpeg: fix for Security Advisory CVE-2013-0858
=20=20gst-ffmpeg: fix for Security Advisory CVE-2013-0851
=20=20gst-ffmpeg: fix for Security Advisory CVE-2013-0854
=20=20gst-ffmpeg: fix for Security Advisory CVE-2013-0856
=20=20gst-ffmpeg: fix for Security Advisory CVE-2013-0850
=20=20gst-ffmpeg: fix for Security Advisory CVE-2013-0849

yanjun.zhu (1):
=20=20perl: fix for CVE-2010-4777

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

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

Carlos Rafael Giani (1):
=20=20gstreamer1.0-plugins-imx: Update to version 0.9.6

Maciej Borzecki (1):
=20=20linux-imx (3.10.17): enable CONFIG_FHANDLE

Otavio Salvador (2):
=20=20qtmultimedia: Add support for i.MX6
=20=20imx-uuc: Update to 0.5

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

Gary Thomas (1):
=20=20linux-boundary: Enable CONFIG_FHANDLE on nitrogen6x

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-ppc:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-guacamayo:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix-community:

Andreas M=C3=BCller (1):
=20=20linux-omap-3.5: avoid errors building modules with -O0

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-handheld:

Andrea Adami (8):
=20=20gcw0: initial commit of machine config
=20=20gcw0: initial commit of custom kernel 3.12
=20=20gcw0: initial commit of formfactor machconfig
=20=20zaurus.inc: add xinput-calibrator to XSERVER
=20=20linux-yocto*: explicitly declare KCONFIG_MODE
=20=20linux-yocto_3.14: add patches and defconfig for ipaq h1940
=20=20h1940: prefer linux-yocto kernel
=20=20linux-yocto-dev: remove development 3.14 kernel recipe

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-igep:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Chan Wei Sern (4):
=20=20crystalforest: Update README with device note and MAINTAINER
=20=20romley: Update README with device note and MAINTAINER
=20=20common: Update linux-yocto-3.10 meta branch SRCREV
=20=20meta-valleyisland: Add linux-yocto 3.10 recipe

Chang Rebecca Swee Fun (4):
=20=20meta-isg: update MAINTAINERS file
=20=20valleyisland: README added device notes and updated BIOS version
=20=20mohonpeak: Update README with device notes
=20=20haswell-wc: Update README with device notes

Darren Hart (5):
=20=20intel-common: Add linux-yocto 3.14-rt recipe
=20=20intel-common: Remove SRCREVs from linux-yocto-dev
=20=20crownbay: Drop linux-yocto-dev bbappend
=20=20fri2: Drop linux-yocto-dev bbappend
=20=20emenlow: Remove SRCREVs from linux-yocto-dev, drop emgd for -dev

Nitin A Kamble (10):
=20=20fri2: update SRCREVs for linux-yocto-rt_3.10 recipe
=20=20common: update the SRCREVs for the linux-yocto-rt_3.10 recipe
=20=20emenlow: fix typos in the linux-yocto-rt_3.10 recipe
=20=20crownbay: update SRCREVs for the linux-yocto_3.10 recipe
=20=20emenlow: update SRCREVs for the linux-yocto_3.10 recipe
=20=20fri2: update SRCREVs for the linux-yocto_3.10 recipe
=20=20common: update SRCREVs for linux-yocto-rt_3.14 recipe
=20=20common: update SRCREVs of the linux-yocto-rt_3.14.bbappend recipe
=20=20common: update SRCREVs for the linux-yocto_3.14 recipe
=20=20emenlow: update SRCREVs for the linux-yocto_3.14 recipe

Ross Burton (5):
=20=20canterbury-corpus: don't skip all QA tests
=20=20canterbury-corpus: rationalise unpack logic
=20=20canterbury-corpus: make packages allarch
=20=20calgary-corpus: clean up unpack logic
=20=20calgary-corpus: inherit allarch

Tom Zanussi (2):
=20=20intel-common: Update linux-yocto 3.14-rt meta SRCREVs
=20=20intel-common: Update linux-yocto 3.14-rt machine SRCREVs

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

Alex J Lennon (5):
=20=20README: Added link to .NET recipe build walkthrough on the Yocto wiki
=20=20image-full-mono: Remove mono-addins from image as it is already =
present in m
=20=20mono: Add missing RDEPENDS on libgdiplus
=20=20mono-helloworld: Added missing RDEPENDS on mono
=20=20mono-helloworld-xbuild: Cleanup do_install()

Chris Morgan (1):
=20=20Switch from autotools to autotools-brokensep to handle Mono's =
autogen.sh req

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

Andreas M=C3=BCller (2):
=20=20xserver-xf86-config_0.1: remove PRINC
=20=20formfactor: : remove PRINC

Denys Dmytriyenko (3):
=20=20omap5-sgx-ddk-um-linux: remove version 1.9.0.10 as replaced by =
1.9.0.12
=20=20linux-ti-staging: bump to 3.12.20 stable release
=20=20linux-ti-staging: fix _append/_prepend logic in prev changes

Hao Zhang (4):
=20=20keystone: u-boot: rename tci6638 to k2hk evm config
=20=20keystone: machine config: change machine config name from =
keystone-evm to k2
=20=20keystone: k2l-evm conf: add k2l-evm machine config
=20=20keystone: k2e-evm config: add k2e-evm machine config

Karthik Ramanan (1):
=20=20vis: Add radio application firmware

Maupin, Chase (7):
=20=20ti-ipc: Consolidate include file and old recipe
=20=20ti-ipc: Consolidate IPC recipes with include file
=20=20dra7xx-evm: Add sgx to MACHINE_FEATURES
=20=20linux-ti-staging: Remove old 3.8 version
=20=20linux-ti-staging: Make files directory version specific
=20=20setup-defconfig: allow use of in-kernel config fragments
=20=20linux-ti-staging: Add version 3.15 of TI integration kernel

Mrinmayee Hingolikar (5):
=20=20ti-ipc: Add version 3.21.00.07
=20=20ipumm-fw: Add MM accelerator firmware recipe
=20=20dspdce-fw: Add DSP firmware recipe
=20=20bltsville: Add TI BLTsville library
=20=20omap5-sgx-ddk-um-linux: Add version 1.9.0.12

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

Alexandr Smoktal (1):
=20=20webos-image: luna-service2=3D191,v3.9.0

Andrii Motsok (1):
=20=20openssl: fix security vulnerability CVE-2014-0198

Andrii Zora (1):
=20=20webos-image: libpbnjson=3D35,v2.7.0

Dmytro Bozhko (1):
=20=20webos-image: shadow=3Dwebos1

Gayathri Srinivasan (1):
=20=20webos-image: pmlogdaemon=3D119

Iurii Artemenko (2):
=20=20webos-image: lighttpd=3Dv1.4.32-0webos1
=20=20webos-image: libtiff=3Dv4.0.3-0webos1

Jeongseok Kim (1):
=20=20webos-image: glib-2.0=3Dwebos2

Kyrylo Kropivyanskiy (3):
=20=20webos-image: libjpeg-turbo=3Dv8d+1.2.1-0webos1
=20=20webos-image: libpng=3Dv1.6.0-0webos1
=20=20webos-image: dbus=3Dv1.6.8-0webos1

Maksym Sditanov (1):
=20=20webos-image: db8=3D140

Martin Jansa (1):
=20=20webos_version: Split by ';branch=3D' a bit sooner

Martin Unsal (1):
=20=20lttng-ust: Workaround for gcc-cross issue

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

Nathan Rossi (13):
=20=20binutils: Updated patches against binutils for microblaze
=20=20coreutils: Fix build for microblaze
=20=20zynq7-base.dtsi: Merge gem dts properties
=20=20zynq7-mainline-gem.dtsi: Remove
=20=20linux-xlnx_3.14: Add 3.14 kernel
=20=20zynq7-base.dtsi: Update for 3.14 kernel
=20=20u-boot-xlnx_2014.01: Add 2014.01 u-boot
=20=20machine-xilinx-default.inc: Update default versions
=20=20BOOT.tftp: Update
=20=20linux-xlnx-dev: Update recipe
=20=20zynq/defconfig_3.10.cfg: The macb driver is non-functional in 3.10
=20=20u-boot-xlnx: Remove older versions
=20=20linux-xlnx: Remove 3.8 kernel

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Bruce Ashfield (1):
=20=20README: add maintainers section for hardware reference boards

Cristian Iorga (1):
=20=20maintainers.inc: js package removed

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



