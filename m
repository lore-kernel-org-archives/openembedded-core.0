Return-Path: <cliff.brake@gmail.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id 0B247766E1;
	Wed, 12 Aug 2015 13:44:57 +0000 (UTC)
Received: by igbjg10 with SMTP id jg10so42995598igb.0;
	Wed, 12 Aug 2015 06:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:mime-version:message-id:from:to:subject:content-type
	:content-transfer-encoding;
	bh=5cxWc60bK9hQvh+SVyqtagrEOjeZUys3c2/7j0AdeQ0=;
	b=IT0NbCp0q1xNXhkcj9uy7OunCPM7KFaCHH+cx+V5LnFiYNlwJibeSdXadlcAbGiHDX
	jU/99/miHKF0GR2MXTO/oSs8Ta3DydIIjLSaHVGHX2ZXoVsa2Zjya8c0QTn/CFryenXT
	2eTHxgVC5Eaub2N1oSxr9/Y9WSz+8e8JOmesc11Qm342wcJokd6AI9PXYYIBL6os3hKW
	cW7qNVqmXWvDjX7UejuoGZ94hkI5/FVbBt/S4WisE2fMscfY0Erv/eGbDEiSiKH6CJ51
	TMRslScT7Sv9b5E01htw28Vop7XdzKWNVxQaNBIQwRL5WRsNtc40/69Tnzm38vXIkDrm
	EhDg==
X-Received: by 10.50.73.170 with SMTP id m10mr24894485igv.60.1439387097896;
	Wed, 12 Aug 2015 06:44:57 -0700 (PDT)
Received: from [127.0.0.1] (cable-pool5-cs-161.doycomm.com. [66.219.182.161])
	by smtp.gmail.com with ESMTPSA id
	q79sm3892122ioi.0.2015.08.12.06.44.56
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Aug 2015 06:44:57 -0700 (PDT)
Date: Wed, 12 Aug 2015 06:44:57 -0700 (PDT)
X-Google-Original-Date: Wed, 12 Aug 2015 13:44:56 GMT
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Message-Id: <1439387096100.f0a13c95@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
Subject: OE Changelog since 2015-08-02 until 2015-08-09
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
X-List-Received-Date: Wed, 12 Aug 2015 13:44:58 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2015-08-02 until 2015-08-09.  Projects included in this =
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

Belen Barros Pena (6):
=20=20toastergui: spacing and top nav style change
=20=20toastergui: breadcrumb fixes
=20=20toastergui: change link styles in alert-info
=20=20toastergui: remove project name from layer change notification
=20=20toastergui: fix spacing in the import layers page
=20=20toastergui: add action to empty "most built" recipes

Mariano Lopez (1):
=20=20runqueue.py: Add provides to taskdepdata

Michael Wood (19):
=20=20toaster: orm Add util function to return the url to layerversion
=20=20toaster: orm Add util functions to return common querysets
=20=20toastergui: tables Use util functions for the common querysets
=20=20toastergui: widgets Add a typeahead widget
=20=20toastergui: Add typeaheads layers, machines, projects, recipes
=20=20toastergui: Switch to using the new toaster typeahead widget
=20=20toastergui: libtoaster Throw an exception no url is specified
=20=20toasterui: views Remove unused xhr_typeahead view definition
=20=20toastergui: views Standardise the fields project layer response
=20=20toastergui: tests Fix and more comprehensive typeahead unittest
=20=20toastergui: libtoaster: typeahead resiliency for slow server
=20=20toastergui: libtoaster typeahead Add in results highlighter
=20=20toastergui: Fix toastertable table header reference
=20=20toastergui: Move layerdetails view definition to the views.py
=20=20toastermain: Add a longer default database timeout
=20=20toastergui: Machine select button url parameters change
=20=20toastergui: Move click disabled check after table ready event
=20=20toastergui: Fix typo on layers in project filter condition
=20=20toastergui: layerBtn Fix build trigger mechanism

Richard Purdie (1):
=20=20cooker: Resolve file monitoring race issues when using memres bitbake

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Alejandro Hernandez (1):
=20=20qemurunner: Improves checking for server and target IPs on qemus =
parameters

Alexander Kanavin (1):
=20=20stress: update checksums to match upstream tarball

Ed Bartosh (7):
=20=20create-pull-request: cd to relative directory
=20=20wic: improved usage text
=20=20wic: Improve 'wic help overview' content
=20=20wic: Report recipe name for native commands
=20=20wic: code cleanup: remove unused code
=20=20wic: code cleanup: pylint misc.py
=20=20wic: release 0.2.0

Fan Xin (1):
=20=20wpa-supplicant: Fix CVE-2015-4141, CVE-2015-4143, CVE-2015-4144, =
CVE-2015-41

Patrick Ohly (2):
=20=20combo-layer: enhance output in action_pull
=20=20combo-layer: fix action_pull for unknown branch

Paul Gortmaker (1):
=20=20xf86-video-intel: fix yocto/oe-core wreckage from libdrm upgrade

Richard Purdie (5):
=20=20builder: Fix multilib compile failure
=20=20weston: Fix parallel make race
=20=20runqemu: Add error handling for unexpected tap devices
=20=20runqemu: Handle device names like tapX@NONE
=20=20oeqa/qemurunner: Improve runqemu log output debug

Topi Kuutela (1):
=20=20security_flags.inc: disable -pie and -fpie from Python3 compilation.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Joe Slater (2):
=20=20ypbind-mt: add dependency but keep as broken
=20=20znc: add SRCREV_FORMAT variable

Li xin (9):
=20=20crda: upgrade 3.13 -> 3.18
=20=20dovecot: upgrade 2.2.10 -> 2.2.18
=20=20ntp: upgrade 4.2.8p2 -> 4.2.8p3
=20=20radvd: upgrade 1.14 -> 2.11
=20=20openvpn: upgrade 2.3.6 -> 2.3.7
=20=20quagga: upgrade 0.99.23 -> 0.99.24.1
=20=20stunnel: upgrade 5.17 -> 5.21
=20=20opensaf: upgrade 4.5.0 -> 4.6.0
=20=20netcf: upgrade 0.2.3 -> 0.2.8

Roy Li (3):
=20=20strongswan: upgrade to 5.3.2
=20=20tcpslice: fix do_install
=20=20net-snmp: fix mib representation of timeout values

Zongchun Yu (1):
=20=20netperf: fix the broken download url

leimaohui (1):
=20=20vsftpd: upgrade 3.0.2->3.0.3

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Andreas Dannenberg (1):
=20=20arago-gpl-notice: Fix spelling mistake in user-facing GPL notice

Denys Dmytriyenko (8):
=20=20arago.conf: add tar.gz.md5 image type to store image checksums
=20=20packagegroup-*-multimedia-sdk-target: mark as machine-specific now
=20=20dhcp: workaround "debugedit: canonicalization unexpectedly shrank by =
one cha
=20=20vtun: fix build when B !=3D S
=20=20external-linaro-toolchain: workaround static libgomp
=20=20HACK: strongswan: disable config patch as 5.2 changed format
=20=20HACK: packagegroup-*: disable Keystone specific LLDs and deps for IPC
=20=20image, packagegroup: remove wireless-compat as it's gone now

Jacob Stiffler (12):
=20=20amsdk-av-files: Update to version 1.4
=20=20arago-source-ipk: Enable omapdrm-pvr sourceipk.
=20=20matrix-gui-apps-git: Bump SRCREV for latest additions.
=20=20matrix-gui-multimedia-demos: Add H265 decode demo.
=20=20matrix-gui-3d-demos: Extend for omap-a15 SOC
=20=20matrix-gui-browser: Bump SRCREV
=20=20gstreamer1.0-plugins-hevc: Add GStreamer HEVC/H265 decoder plugin
=20=20ti-tisdk-makefile: Only use AMSDK defconfig if BRAND is AMSDK
=20=20gstreamer1.0-plugins-vpe: Add modprobe config for ti-vip and ti-vpe
=20=20packagegroup-arago-tisdk-multimedia*: Add hevc-arm-decoder
=20=20packagegroup-arago-tisdk-amsdk-sdk-host: Add tisdk-uenv for ti43x
=20=20packagegroup-arago-tisdk-matrix: Add PM demos for omap-a15

Yaniv Mahani (1):
=20=20Wilink8 : Update to latest version

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-atmel:

Ludovic Desroches (3):
=20=20kernel defconfig: sama5d2: update to add ISC
=20=20at91bootstrap: add recipe for 3.8-alpha4
=20=20atmel-wireless-firmware: add recipe for v11

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

Lauren Post (12):
=20=20imx-gpu-viv: Change compatible machine to mx6 with GPU
=20=20imx-base: Changes for i.MX 6Ultra Lite
=20=20xserver-xf86-config: Add i.MX6UL xorg.conf
=20=20imx-kobs: Upgrade to 5.1 version
=20=20imx-lib: Upgrade to 5.1 and add i.MX 6UltraLite support
=20=20imx-test: Upgrade to 5.1 version and add 6UL support
=20=20imx-vpu: Upgrade to 5.4.31 version
=20=20u-boot-imx: Upgrade to 2015.04 version
=20=20linux-imx: Upgrade to 3.14.38-6UL7D_beta
=20=20imx7dsabresd: Add sim imx7d-sdb-sim device trees
=20=20imx7dsabresd: Add touch imx7d-sdb-touch device tree
=20=20imx6ulevk: Create i.MX 6 UltraLite EVK machine

Otavio Salvador (6):
=20=20packagegroup-core-directfb: Change override for i.MX6 SoCs with GPU
=20=20imx-base.inc: Use specific version of DirectFB just for i.MX6 SoCs =
with GPU
=20=20directfb: Stop using a packagegroup to fix Vivante GPU runtime =
dependency
=20=20mesa: Remove virtual/libopenvg from providers list
=20=20Drop Freescale official Linux kernel for i.MX23, i.MX28 and i.MX5 SoC =
famili
=20=20u-boot-fslc: Update to 3f0c535 revision

Yuqing Zhu (4):
=20=20libfslcodec: Upgrade to 4.0.6 version
=20=20libfslparser: Upgrade to 4.0.6 version
=20=20gst1.0-fsl-plugin: Upgrade to 4.0.6 version
=20=20gstreamer1.0-plugins-base: Add gstplaybin related patch

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

Ng Wei Tee (1):
=20=20meta-valleyisland: Add linux-firmware to valleyisland BSPs

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

Alex J Lennon (2):
=20=20mono: add support for 4.0.3.20
=20=20README: update testing of 4.0.3.20 on qemux86

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-netbookpro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nodejs:

Ilkka Myller (1):
=20=202015-08-04 io.js v3.0.0 Release

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

Herrie (3):
=20=20linux-hp-tenderloin: Update for new kernel with bluetooth enabled
=20=20linux-hp-tenderloin: Update kernel version as well
=20=20Fix the checksums

Martin Jansa (6):
=20=20meta-palm: lvm2: rename bbappend to match any version
=20=20xserver-xorg: rename bbappend to match new version from oe-core

Nikolay Nizov (1):
=20=20meta-hp: tenderloin: initial recipe for bluetooth-utilities

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

Denys Dmytriyenko (5):
=20=20linux-ti-staging 3.14: update to 3.14.49
=20=20linux-ti-staging 4.1: update to 4.1.4
=20=20u-boot-ti-staging: update with Keystone2 fixes
=20=20linux-ti-staging, keystone.inc: update, add keystone support to =
staging kern
=20=20am335x-evm: bump max_leb_cnt to fit larger FS

Jacob Stiffler (2):
=20=20ti-sysbios: Update version to 6.41.04.54
=20=20ti-cgt6x: Upgrade to version 8.0.3

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



