Return-Path: <cliff.brake@gmail.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id A0ACD607A5;
	Wed, 15 Jul 2015 15:57:36 +0000 (UTC)
Received: by iggp10 with SMTP id p10so124598697igg.0;
	Wed, 15 Jul 2015 08:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:mime-version:message-id:from:to:subject:content-type
	:content-transfer-encoding;
	bh=hm/Axj3ex3CdN6VlCvwkibqjX8GGDeu29bmRDGONnLM=;
	b=HALOGI68H9xZYHaOsDqY3GOs0aZ/LoEl10w+aZxoU+PpY29tfz5OBg5fh5ew55CbpW
	/Y6Nc/KXBQdVvni8U6ogdCbuf9T6ZwFRFWwKJJuuMv7f3DsDD5Gg6NtDdGAzxm8QSHz2
	m41OENKPQsHJnAyTEE99hiC0rZIbAo1wtKy3kQRptVWaZFOuMU7OxqrbXA1N8UJ4KQym
	Fnn6dL4PbrLGfsTcCTc/X7jN1/wIqzH8iRX0UMXYNLF3T4b3pkXS2f/tTkxOxppEynA4
	ArHBrEP7T0WXnYfdj80OieGbqJfrMfocBkbhDnRa6vQ91vKWdSblhwWOyWMPrE6b6Svt
	1YJg==
X-Received: by 10.50.59.242 with SMTP id c18mr26861736igr.66.1436975855862;
	Wed, 15 Jul 2015 08:57:35 -0700 (PDT)
Received: from [127.0.0.1] (cable-pool5-cs-161.doycomm.com. [66.219.182.161])
	by smtp.gmail.com with ESMTPSA id
	l62sm3021574iol.36.2015.07.15.08.57.34
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Jul 2015 08:57:35 -0700 (PDT)
Date: Wed, 15 Jul 2015 08:57:35 -0700 (PDT)
X-Google-Original-Date: Wed, 15 Jul 2015 15:57:33 GMT
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Message-Id: <1436975853777.60097fca@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
Subject: OE Changelog since 2015-07-05 until 2015-07-12
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
X-List-Received-Date: Wed, 15 Jul 2015 15:57:40 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2015-07-05 until 2015-07-12.  Projects included in this =
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

An=C3=ADbal Lim=C3=B3n (2):
=20=20fetch2/__init__.py: Add FetchConnectionCache class
=20=20fetch2: Add fetch parameter to checkstatus

Felipe F. Tonello (1):
=20=20fetch2: Checkout to correct ref begore init and update submodules

Leonardo Sandoval (3):
=20=20cooker.py: Lock/Unlock members function into BBCooker
=20=20command.py: Unlock function included into CommandsSync class
=20=20knotty.py: Make sure bitbake.lock is unlocked before exiting

Richard Purdie (1):
=20=20cooker: Improve DATE/TIME handling

Ross Burton (1):
=20=20main: add skeleton documentation for the recipe:do_task syntax

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Alejandro Hernandez (1):
=20=20opkg-build: Ignore tar error due to hardlinks issue when creating ipk =
files

Andre McCurdy (16):
=20=20distrodata.bbclass: fix typo, Upsteam -> Upstream
=20=20dpkg: fix typo in tar-error-code.patch, Upsteam -> Upstream
=20=20base-passwd: fix typo in add_shutdown.patch
=20=20glibc: fix typo in add_resource_h_to_wait_h.patch
=20=20dosfstools: fix typo in nofat32_autoselect.patch
=20=20flex: fix typo in do_not_create_pdf_doc.patch
=20=20pkgconfig: fix typo in fix-glib-configure-libtool-usage.patch
=20=20python-numpy: fix typo in no-host-paths.patch
=20=20rpm: fix typo in rpm-realpath.patch
=20=20rpm: fix typo in rpm-reloc-macros.patch
=20=20valgrind: fix typo in valgrind-remove-rpath.patch
=20=20texinfo: fix typo in dont-depend-on-help2man.patch
=20=20libffi: fix typo in fix-libffi.la-location.patch
=20=20gcc: update i586 TARGET_ARCH tests to also handle i686
=20=20lsb: update i586 TARGET_ARCH tests to also handle i686
=20=20libav: update i586 TARGET_ARCH test to also handle i686

Chen Qi (3):
=20=20lsbinitscripts: avoid exit 1 in functions script
=20=20nfs-utils: fix to start nfs-server correctly in systemd
=20=20coreutils: upgrade to 8.24

Christopher Larson (1):
=20=20multilib_global: expand multilib pref values properly

Daniel Istrate (5):
=20=20oeqa/selftest: Add methods to manipulate bblayers.conf in base.py
=20=20oeqa/selftest: Added @testcase decorators to oeselftest testcases.
=20=20scripts/oe-selftest: Added mechanism for including/removing =
bblayers.inc
=20=20oeqa/selftest: Added new testsuite for image features.
=20=20oeqa/selftest: Added 2 testcases and updated setup for other two in =
imagefea

Ed Bartosh (1):
=20=20wic: Set default set of bitbake variables

Jan Wetter (1):
=20=20openssl: upgrade to 1.0.2d

Joe Slater (1):
=20=20security_flags: eliminate FORTIFY_SOURCE for debug builds

Jose Lamego (1):
=20=20subversion_1.8.13.bb: Regex modified to allow '-D' in paths

Joshua Lock (1):
=20=20systemd: fix immediate unmount of mountpoints not in fstab

Kai Kang (5):
=20=20valgrind: build with altivec only if it supported
=20=20Update alternatives of man pages
=20=20qemu: fix CVE-2015-3209
=20=20initscripts: add /sbin/sushell for systemd service debug-shell
=20=20systemd: add PACKAGECONFIG selinux

Khem Raj (1):
=20=20perl: Undefine finitel for musl

Li xin (2):
=20=20dhcp: modify dhcpd.service to make it start successfully and add =
systemd ser
=20=20mesa-demos: rename clear

Mariano Lopez (1):
=20=20report-error.bbclass: Added file syncronization.

Martin Jansa (1):
=20=20squashfs-tools: upgrade to newer revision from git

Nicolas Guyomard (1):
=20=20grub-efi: Allow to use file name different from grub.cfg in GRUBCFG

Pushpal Sidhu (1):
=20=20image_types.bbclass: add support for multiple ubi sizes

Puustinen, Ismo (1):
=20=20combo-layer: modified to generate better commit messages.

Richard Purdie (6):
=20=20oeqa/bbtests: Fix race over DL_DIR and SSTATE_DIR
=20=20oeqa/bbtests: Fix to ensure DL_DIR is set
=20=20oeqa/sstatetests: Add test for comparing 32 and 64 bit sstate =
checksums
=20=20pseudo: Exclude SITEINFO_BITS from checksums
=20=20bitbake.conf: Add BUILD_ARCH and SSTATE_PKGARCH to HASHBASE whitelist
=20=20libtool: Fix regression from previous commit

Robert Yang (4):
=20=20file: fix long-options
=20=20less: 471 -> 478
=20=20elfutils: 0.162 -> 0.163
=20=20python-smartpm: 1.4.1 -> 1.5

Ross Burton (3):
=20=20libdrm: remove git recipe, merge inc
=20=20ca-certificates: remove Debianism in run-parts invocation
=20=20report-error: expand all variables

Roy Li (1):
=20=20bootchart2: add runtime dependency

Saul Wold (1):
=20=20core-image-kernel-dev: Define a correct subset of TEST_SUITES to run =
for thi

Thomas Perrot (2):
=20=20systemd-serialgetty: Set S to prevent QA warning
=20=20volatile-binds: Set S to prevent QA warning

Yuanjie Huang (3):
=20=20ldconfig-native: Add 64-bit flag for ELF64 entries
=20=20mklibs-native: two fixes
=20=20gdb: Fix detection of 64-bit PPC inferior in gdbserver

Yue Tao (3):
=20=20image_types_uboot: remove the middle file
=20=20man: replace ',' with '#'
=20=20ltp: Add inhibit of split

Zhixiong Chi (1):
=20=20rpm: check if the argument(rootpath) exists or be writable

yzhu1 (1):
=20=20rpm: disable external key server

zjh (2):
=20=20testimage: Support full TC path such oeqa.runtime.pnp.get_memory_size =
in TES
=20=20testimage: Add support for test suites manifest files

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Armin Kuster (1):
=20=20wireshark: update to 1.12.6

Joe Slater (1):
=20=20drbd ufw linux-atm: correct certain packaging error

Kang Kai (1):
=20=20postfix: update daemon_directory in main.cf_2.0

Li xin (1):
=20=20quagga: bug fix

Roy Li (1):
=20=20proftpd: upgrade to 1.3.5a

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Denys Dmytriyenko (59):
=20=20gcc: remove local overlay of 4.7 recipes
=20=20external-arago-toolchain: remove old gcc-4.5 based arago toolchain
=20=20libnl: remove old local copies of 2.0 and 3.2.24 versions
=20=20opkg: fix accepted upstream, remove locally
=20=20perl-native: upstreamed
=20=20udev-extraconf: fix accepted upstream, remove locally
=20=20ti-csl: available in meta-ti as common-csl-ip
=20=20ti-rm: available in meta-ti as rm-lld
=20=20leveldb: available from meta-oe now, remove locally
=20=20php: update to latest version, drop upstreamed fixes
=20=20crda: remove older version
=20=20powertop: remove upstreamed local fix
=20=20v4l-utils: remove local updates to the older version
=20=20curl: remove local configuration of older version, uses PACKAGECONFIG =
now
=20=20qt4: update bbappends from 4.8.5 to 4.8.6
=20=20packagegroup: now setting PACKAGE_ARCH must be before inherit =
packagegroup
=20=20arm-benchmarks: changes are version-agnostic, rename bbappend =
accordingly
=20=20stream: changes are version-agnostic, rename bbappend accordingly
=20=20openssh: changes are version-agnostic, rename bbappend accordingly
=20=20base-files: changes are version-agnostic, rename bbappend accordingly
=20=20busybox: changes are version-agnostic, rename bbappend accordingly
=20=20dbus: changes are version-agnostic, rename bbappend accordingly
=20=20dropbear: changes are version-agnostic, rename bbappend accordingly
=20=20udev: changes are version-agnostic, rename bbappend accordingly
=20=20bash: changes are version-agnostic, rename bbappend accordingly
=20=20shadow-securetty: changes are version-agnostic, rename bbappend =
accordingly
=20=20init-ifupdown: changes are version-agnostic, rename bbappend =
accordingly
=20=20freetype: changes are version-agnostic, rename bbappend accordingly
=20=20tslib: changes are version-agnostic, rename bbappend accordingly
=20=20gnutls: changes are version-agnostic, rename bbappend accordingly
=20=20boost: changes are version-agnostic, rename bbappend accordingly
=20=20pulseaudio: changes are version-agnostic, rename bbappend accordingly
=20=20thttpd: changes are version-agnostic, rename bbappend accordingly
=20=20lmbench: changes are version-agnostic, rename bbappend accordingly, =
mandir w
=20=20openobex: make bbappend version-agnostic, fix build when B !=3D S
=20=20libnl: install netlink-private headers
=20=20libdrm: update bbappend and patch to the new 2.4.59 version
=20=20oprofile: update to the latest 1.0.0 version
=20=20libav: update to the latest 9.16 version
=20=20gstreamer: update from 1.2.3 to 1.4.5, disable local patches for now
=20=20strongswan: move from extras to distro
=20=20obexd: move from extras to distro, fix build when B !=3D S
=20=20thttpd: fix build issue for B !=3D S
=20=20copy-defconfig: fix when B !=3D S
=20=20iperf: fix build when B !=3D S
=20=20ltp-ddt: fix build when B !=3D S
=20=20openntpd, matrix-gui, omapconf: fix LICENSE field
=20=20ti-wifi-utils: pass CC to fix build issue with new toolchain
=20=20arago-prefs, toolchain*: update toolchain component versions
=20=20external-linaro-toolchain-cross: recipe to stage unwind.h required =
for targe
=20=20external-linaro-toolchain: workaround static stdc++, fix conflicting =
uapi .i
=20=20packagegroup-*-standalone-sdk-target: libstdc++-dev should pull =
libstdc++ au
=20=20HACK: packagegroup-*-console: disable ltrace for now, breaks with =
latest too
=20=20HACK: packagegroup-*-connectivity*: disable ti-compat-wireless, as it =
breaks
=20=20external-linaro-toolchain: package prebuilt ldconfig to libc
=20=20arago.conf: bump distro version
=20=20external-linaro-sdk-toolchain: adjust for dropping short compiler =
binaries
=20=20toolchain-linaro: use linaro versions for nativesdk, as sources are =
shared w
=20=20tisdk-image.bbclass: update to accomodate 64 bit SDK and stricter .sh =
filter

Jacob Stiffler (3):
=20=20dual-camera-demo: Bump SRCREV
=20=20hevc-arm-decoder: Add HEVC (H.265) decoder library and unit test.
=20=20tisdk-uenv: Add uEnv.txt specific to am437x-evm.

Karthik Ramanan (3):
=20=20glsdk-example-apps: Feature additions and bug fixes
=20=201/2] gstreamer1.0-plugins-ducati: Update with bug fixes
=20=202/2] gstreamer1.0-plugins-vpe: Update for bug fixes

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-atmel:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-beagleboard:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-browser:

Gary Thomas (1):
=20=20chromium: List all PACKAGECONFIG settings to avoid warning

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

Fabio Estevam (4):
=20=20linux-fslc: Bump revision to 4eb30aed4
=20=20u-boot-fslc: Bump revision to 5d9ffd22
=20=20linux-fslc: Update to a Linux kernel 4.1-based fork
=20=20linux-imx-3.14.28: Fix reporter's name

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

Daiane Angolini (1):
=20=20imx6sl-warp: Set EXTRA_IMAGEDEPENDS to u-boot

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

Anuj Mittal (4):
=20=20meta-crystalforest: qat recipe for riverforest
=20=20meta-crystalforest: rename zlib-qat recipe
=20=20meta-crystalforest: zlib-qat: simplify do_install
=20=20meta-crystalforest: zlib-qat: remove extra cflags

Ong Boon Leong (10):
=20=20meta-isg: dpdk: improve software installation task
=20=20meta-isg: dpdk: introduce ARCHDIR variable to dpdk.inc
=20=20meta-isg: dpdk: add external kernel module build handling for =
tmp/work-share
=20=20meta-isg: dpdk v1.8.0: add makefile patches to support split kernel =
output
=20=20meta-isg: dpdk v1.8: add patches for qat, vhost and libvirt =
PACKAGECONFIG
=20=20meta-isg: dpdk: fix GCC compiler LDFLAG and CFLAG issue
=20=20meta-isg: dpdk v1.8: add app makefile patch to enable sysroot setting
=20=20meta-isg: dpdk v1.8: introduce target machine selection for DPDK.
=20=20meta-isg: dpdk: intro recipe for DPDK v1.8.0
=20=20meta-isg: dpdk: rearrange common meta-data from dpdk_1.8.0.bb into =
dpdk.inc

Saul Wold (2):
=20=20intel-quark: Introduce new BSP for Quark/X1000 SOC
=20=20linux-yocto-dev: Enable the intel-quark BSP

WU CHIA CHUAN (4):
=20=20meta-isg: dpdk: move the do_install hostapp directory from dpdk.inc =
to dpdk_
=20=20meta-isg: dpdk: renaming patches which are common to DPDK v1.8 and =
DPDK v2.0
=20=20meta-isg: dpdk v2.0.0: add patch to handle vhost and ip_fragmentation =
applic
=20=20meta-isg: dpdk v2.0.0: initial DPDK v2.0.0 enabling recipe

venkatasubramanian pattu (3):
=20=20meta-crystalforest: Zlib QAT_MEM MM Module
=20=20meta-isg: Making meta-isg as a layer
=20=20meta-isg: Add include file for DPDK

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

Richard Tollerton (1):
=20=20mono-4.xx.inc: disable parallel make

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-netbookpro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nodejs:

Ilkka Myller (8):
=20=202015.07.03, Version 0.12.6 (Stable)
=20=202015.07.03, Version 0.12.6 (Stable)
=20=202015-07-04 io.js v2.3.3 Release
=20=202015-07-04 io.js v1.8.3 Release     Maintenance release
=20=20Fixed iojs 2.3.3 src checksum
=20=202015-07-09 io.js v2.3.4 Release
=20=202015.07.09, Version 0.10.40 (Maintenance)
=20=202015.07.09, Version 0.12.7 (Stable)

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
=20=20linux-ti-staging: update to 3.14.47 stable
=20=20linux-ti-staging: add version 4.1.1
=20=20u-boot-ti-staging: add version 2015.07-rc3
=20=20libdrm.inc: overlay recently removed .inc used by our custom version

Karthik Ramanan (2):
=20=20omapdrm-pvr: Bug fixes and updates to the driver
=20=20omap5-sgx-ddk-um-linux: Bug fixes for memory leak

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Tanu Kaskinen (1):
=20=20maintainers.inc: reassign audio recipe maintainership

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



