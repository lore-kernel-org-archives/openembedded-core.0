Return-Path: <cliff.brake@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 486F460043;
	Wed, 29 Jun 2016 12:32:22 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id r68so6645749qka.3;
	Wed, 29 Jun 2016 05:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:mime-version:message-id:from:to:subject
	:content-transfer-encoding;
	bh=TvTBZRmqV7lVVB1Gd5zkmV24WaB86xm8j4cBQHvnRhg=;
	b=Cr+yJzQ0clPtS4hBDWLNOv4Pj9JjsljwU5Wx7IUiJhQVgby5HgD/jtEiiz4iHQ7mJI
	phkAM+fbSlprrfQd9Tjjy0zr949aWaB3Dmhdt35FNR/wEz8T4cHeuU9N7id5/shT15FM
	g2IJCOL0iMGIubDqEO25GQQjrv3+y+0ik133bShz/voCfAwjiBzCs4AsRTCsgIBgDucN
	vekapkZkodhrifWw3UJR64u8Pv9F05Pn9dkqj/kNICjBRRCjbQ1KW7SlNNoDLiYjrBNd
	fZtF4GfXdbIIeZ5Bpo7Xg9eQsw0SXJQlKeHtkrgGl8G1o51zmoQ4Uuku0AmXBuoqT2gI
	UzYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:mime-version:message-id:from:to:subject
	:content-transfer-encoding;
	bh=TvTBZRmqV7lVVB1Gd5zkmV24WaB86xm8j4cBQHvnRhg=;
	b=W7wvOlp+K4UG+sRDNH99aw1OlzCdRYiHZLYFG1OfmWAwRUAb/TxSb430lQQOYkMetW
	OQJcCNbrCUv436LI4PVNLPht3HzYy2IEHxbK13csQ4av89n4TpIdMj4aTU0dujT2Gx4Z
	AAhj3UBr4gSXbkP59JtEQL8/EZVnLgdMGcVgKo2QddGAr6pP74oFrWCD24GqIrT6XJku
	0o8IjaRmUPCoAKaRgoNIkzefZD7qVJidW2WDnVyPelgd36c8/hYq1D4oTCzfz72lPYDr
	XNKuagwm00oobxoA2n3DA9H9EQTeZKXFjwjEHP6sgCnb55VLo+KXcfmPMZEUJ/3q266S
	6KZA==
X-Gm-Message-State: ALyK8tLJ0paNYPVhB0tQ+kHuau5U2vQZ4zHF/tfZPz+vXgvTsh/xA7jnOHlSusIJRQEKXQ==
X-Received: by 10.55.88.65 with SMTP id m62mr10624325qkb.0.1467203542317;
	Wed, 29 Jun 2016 05:32:22 -0700 (PDT)
Received: from [127.0.0.1] (cable-pool5-cs-73.doycomm.com. [66.219.182.73])
	by smtp.gmail.com with ESMTPSA id o52sm1756650qta.8.2016.06.29.05.32.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 Jun 2016 05:32:21 -0700 (PDT)
Date: Wed, 29 Jun 2016 05:32:21 -0700 (PDT)
X-Google-Original-Date: Wed, 29 Jun 2016 12:32:20 GMT
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Message-Id: <1467203540883.e5110777@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
Subject: OE Changelog since 2016-06-19 until 2016-06-26
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
X-List-Received-Date: Wed, 29 Jun 2016 12:32:24 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2016-06-19 until 2016-06-26.  Projects included in this =
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
meta-java: git://git.yoctoproject.org/meta-java
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

Ed Bartosh (5):
=20=20cooker: move EventLogWriteHandler to the top module level
=20=20cooker: encode event objects to base64
=20=20cooker: don't remove event file
=20=20cooker: replace EventLogWriteHandler with namedtuple
=20=20cooker: clean up EvertWriter

Jussi Kukkonen (1):
=20=20depexp.py: port to gtk+3

Robert Yang (1):
=20=20lib/bb/build.py: remove task flag in deltask()

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Alejandro del Castillo (1):
=20=20opkg: upgrade to v0.3.2

Alexander Kanavin (6):
=20=20e2fsprogs: remove the extra dot from the recipe filename
=20=20security_flags.inc: add SECURITY_NO_PIE_CFLAGS to libgcc and =
gcc-sanitizers
=20=20security_flags.inc: add python3-pycairo and libnewt-python to no-pie =
excepti
=20=20mpg123: add a recipe from meta-oe
=20=20gstreamer1.0-plugins-ugly: disable mad, enable mpg123
=20=20libmad: remove recipe

Andre McCurdy (1):
=20=20binutils: configure with --enable-deterministic-archives

Armin Kuster (2):
=20=20tzcode: update to 2016e
=20=20tzdata: update to 2016e

Bruce Ashfield (5):
=20=20linux-yocto/4.1: tpm2, pinctrl, powercap and watchdog backports
=20=20linux-yocto/4.1: SPI, MFD, alsa and perf backports
=20=20linux-yocto/4.1: driver, mmc and power backports
=20=20linux-yocto/4.1: pstate backports
=20=20linux-yocto/4.4: sensor driver backports

Chen Qi (2):
=20=20package_manager.py: specify tmpdir for opkg
=20=20dbus/dbus-test: upgrade to 1.10.8

Christopher Clark (5):
=20=20linux-firmware: fix typo in LICENSE line for iwlwifi-6000g2b-5
=20=20linux-firmware: add LICENSE line for iwlwifi-license package
=20=20linux-firmware: fix typo in RDEPENDS line for iwlwifi-6000g2b-5
=20=20linux-firmware: add iwlwifi virtual package of all iwlwifi firmwares
=20=20linux-firmware: add iwlwifi-misc package for remaining iwlwifi =
firmware

Jussi Kukkonen (1):
=20=20qemu: Use Gtk+3, add configure patch to find vte

Khem Raj (1):
=20=20gstreamer1.0-plugins-bad: Upgrade to 1.8.1

Matthew Campbell (1):
=20=20openssh: fix init script restart with read-only-rootfs

Otavio Salvador (2):
=20=20initramfs-framework: mdev: Add a runtime dependency on busybox-mdev
=20=20initramfs-framework: base: Ensures /run/lock is available

Richard Purdie (4):
=20=20package_manager: Fix multilib package arch ordering issues
=20=20build-appliance-image: Update to master head revision
=20=20e2fsprogs: Manually bump PR due to PV change (work around sstate =
confusion)
=20=20build-appliance-image: Update to master head revision

Ross Burton (10):
=20=20xcb-proto: use python3 instead of python2
=20=20oeqa: fix hasPackage, add hasPackageMatch
=20=20autotools: ensure Makefile exists in do_compile
=20=20sysprof: fix pkgconfig packaging
=20=20packagegroups: use new gst-player package name
=20=20bitbake.conf: don't set CCACHE_DIR to $HOME by default
=20=20oeqa/targetbuild: fix folder name estimate logic
=20=20oeqa/targetbuild: add extra_cmds argument to run_configure
=20=20oeqa/targetbuild: use os.path.join instead of string concatenation
=20=20puzzles: fix Samba conflict, clean up recipe

Saul Wold (2):
=20=20rootfs_rpm: Increase rootfs size
=20=20linux-firmware: add iwlwifi-8000C-19 version

Yi Zhao (1):
=20=20expat: CVE-2016-0718

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Christopher Larson (2):
=20=20vboxguestdrivers: obey LDFLAGS
=20=20libebml: don't rely on make -e, obey LDFLAGS

Derek Straka (10):
=20=20libgphoto2: correct compatibility issues with libjpeg-turbo-1.5.0
=20=20iperf: resolve issues with gcc6
=20=20tvheadend: add a patch to fix issues with gcc 6 and drop the =
-Wno-error=3Dmisl
=20=20geis: add a patch to fix incorrect indentation issues and remove =
-Wno-error=3D
=20=20crash: update to version 7.1.5
=20=20libqmi: update to version 1.14.2
=20=20faac: address gcc-6 narrowing errors via an explicit cast
=20=20poppler: fix ambiguity on math functions related to gcc-6
=20=20evince: fix build errors with gcc-6
=20=20epdf, evince, tracker, gimp, tumbler: Remove blacklist caused by =
poppler bui

Frederico Cadete (2):
=20=20efl e-module.inc: fix fetching in multi-lib configs
=20=20gtest: fix installation in multilib

Gary Thomas (1):
=20=20v4lutils: Update to latest upstream

Hongxu Jia (3):
=20=20python-pygobject: fix do_configure failed
=20=20python-cloudeebus: fix do_compile failure
=20=20Revert "python-pygobject, python-cloudeebus, python-dbusmock: =
Blacklist beca

Jussi Kukkonen (3):
=20=20gtk-engines: Move from oe-core
=20=20vte9: Add old vte into meta-oe
=20=20gnome-terminal, toscoterm, vala-terminal, xfce4-terminal: use vte9

Martin Jansa (1):
=20=20gnome-disk-utility: blacklist because of avahi-ui

Pascal Bach (1):
=20=20p7zip: update to version 15.14.1

Philip Balister (1):
=20=20python-pyephem_3.7.6.0.bb: Add new recipe.

Soren Brinkmann (1):
=20=20analyze-suspend: Bump to latest Git version

Wenzong Fan (1):
=20=20krb5: add systemd support

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Denys Dmytriyenko (8):
=20=20glsdk-example-apps: add dependency for wayland and weston
=20=20u-boot-fw-utils: add AM57x HS platform
=20=20yavta: fix got upstreamed to meta-oe, remove locally
=20=20v4l-utils: update to 1.10.1 version
=20=20k2-initramfs: update to latest with fresh FW images
=20=20arago.conf: bump distro version
=20=20glsdk-example-apps: now depends on libdce
=20=20arago.conf: libinput is the default now, drop PACKAGECONFIG

Karthik Ramanan (3):
=20=20packagegroup-arago-test: Remove vpe-tests
=20=20glsdk-example-apps: Add new utility for remote core query
=20=20weston: Add minor fix for soc performance monitor

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

Fabio Berton (3):
=20=20chicken-egg-imperative-command-line-a: Update to version 0.5.0
=20=20chicken-egg-rb-tree: Update to version 5.2
=20=20gen-egg-recipes: Add nuklear to skip-eggs list

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-efikamx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ettus:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm:

Lauren Post (3):
=20=20imx-base: Remove XSERVER_DRIVER_mx6ul - default case will work
=20=20imx-base: Specific 7d for MACHINE_SOCARCH_SUFFIX
=20=20imx-base: Add MACHINE_SOCARCH_FILTER for mx6ul and mx7d

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-ppc:

Camelia Groza (1):
=20=20ceetm: update to a237e09

Chunrong Guo (3):
=20=20fmlib: update to 43fa98f
=20=20rcw: update to 1af724b
=20=20fm-ucode: update to 7ebea453

Cristian Stoica (2):
=20=20cryptodev-qoriq: upgrade to 1.8 plus fsl patches
=20=20openssl-qoriq: upgrade to 1.0.2h plus fsl patches

Ting Liu (60):
=20=20b4420: disable virtual terminal support
=20=20b4860: disable virtual terminal support
=20=20c293pcie: disable virtual terminal support
=20=20p2041rdb: disable virtual terminal support
=20=20p3041ds: disable virtual terminal support
=20=20p4080ds: disable virtual terminal support
=20=20p5020: disable virtual terminal support
=20=20p5040: disable virtual terminal support
=20=20t1023: disable virtual terminal support
=20=20t1024: disable virtual terminal support
=20=20t104x: disable virtual terminal support
=20=20t2080: disable virtual terminal support
=20=20t4160: disable virtual terminal support
=20=20t4240: disable virtual terminal support
=20=20linux-qoriq: merge .inc and .bb
=20=20linux-qoriq: upgrade to 4.1
=20=20linux-qoriq: fix vmpic_msi_feature not used error
=20=20b4420: update dtb path
=20=20b4860: update dtb path
=20=20c293pcie: update dtb path
=20=20p2041rdb: update dtb path
=20=20p3041ds: update dtb path
=20=20p4080ds: update dtb path
=20=20p5020: update dtb path
=20=20p5040: update dtb path
=20=20t1024: update dtb path
=20=20t104x: update dtb path
=20=20t2080: update dtb path
=20=20t4160: update dtb path
=20=20t4240: update dtb path
=20=20rename qoriq-base.inc to qoriq-ppc.inc
=20=20qoriq-ppc.inc: abstract common bit to qoriq.inc
=20=20adjust MACHINEOVERRIDES ordering
=20=20qemu: upgrade to v2.4 plus fsl patches
=20=20apptrk: update to 873f44c
=20=20ar: update to 9a74743
=20=20cst: update to d1c6c28
=20=20eth-config: update to c1a4b3a
=20=20flib: update to 08e2aeb
=20=20hv-cfg: update to 348748b
=20=20ipc: update to 74d6627
=20=20hypervisor: update to f23ac6d
=20=20uio-seville: update to 0f31fbc
=20=20qe-ucode: update to a95f42ae
=20=20skmm-ep: update to bbf1ba0
=20=20skmm-host: update to d5912eb
=20=20usdpaa: update to 940d8f7
=20=20dpa-offload: update to fed08b0
=20=20usdpaa-apps: update to 835cbce
=20=20fsl-pme: add recipe
=20=20hyperrelay: add recipe
=20=20pme-tools: add recipe
=20=20cantest: add recipe
=20=20pkc-firmware: update to 21a6b5b
=20=20pkc-host: update to 21a6b5b
=20=20cryptodev: rename to cryptodev-qoriq
=20=20openssl: rename to openssl-qoriq
=20=20qemu: rename to qemu-qoriq
=20=20remove not supported e500v2 machines
=20=20u-boot-qoriq: upgrade to 2016.01

Zhenhua Luo (5):
=20=20t1023: update dtb path
=20=20asf: update to a8bbba6
=20=20cryptodev: add missing patch
=20=20openssl-qoriq: correct the find.pl path
=20=20cst: add bash in RDEPENDS_cst

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

Jianxun Zhang (1):
=20=20formfactor: detect USB HID keyboard and touch screen

Saul Wold (1):
=20=20linux-firmware: remove firmware that is now in OE-Core

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

Clement Dransart (1):
=20=20audiomanager: fix lib installation path for multilib

Yong-iL Joh (2):

tolkien-joh (1):
=20=20Merge pull request #1 from pkonopel/add-capicxx-perf

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-java:

Maxin B. John (1):
=20=20replace base_contains by bb.utils.contains

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

Ilkka Myller (4):
=20=202016-06-23 Version 0.10.46 (Maintenance) Release
=20=202016-06-23 Version 0.12.15 (Maintenance) Release
=20=202016-06-23, Version 5.12.0 (Stable)
=20=202016-06-23, Version 4.4.6 'Argon' (LTS)

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

Denys Dmytriyenko (8):
=20=20linux-ti-staging: update to 4.4.13, use new defconfig builder
=20=20u-boot-ti-staging: update to ti2016.02-rc1 tag
=20=20am57xx-hs-evm: add AM5 HS platform config
=20=20amx3-cm3: update to the latest for am3 ddr fixes
=20=20netcp-pa-fw: update to version 3.0.1.17
=20=20u-boot-ti-staging: add support for AM57xx HS platform
=20=20u-boot-ti-staging: update to ti2016.02-rc2 tag
=20=20linux-ti-staging: update to ti2016.02-rc2 tag, update DTBs

Jason Reeder (1):
=20=20pru-icss: add new device support and bump SRCREV

Karthik Ramanan (3):
=20=20libdce: add API for query remote proc information
=20=20ipumm: Update SRCREV for adding new API
=20=20dspdce-fw: Update SRCREV for adding new API

Sam Nelson (6):
=20=20ti-ipc: Update to new patch version 3.43.01.02
=20=20uio-module-drv: Update to new version 2.1.0.0
=20=20mpm-transport: Update to new version 2.0.1.2
=20=20uio-test-pruss: Add recipe to build uio pruss test firmware
=20=20uio-module-drv-test: Updates to fix issues with Keystone platforms
=20=20ti-ipc: Update comment on IPC tag

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

Alistair Francis (1):
=20=20qemuzynmp: Add the qemuzynqmp machine

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Alexander Kanavin (2):
=20=20maintainers.inc: reassign vala recipe
=20=20maintainers.inc: remove libmad, add mpg123

Ed Bartosh (1):
=20=20toasterconf: exclude releases Toaster can't build

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



