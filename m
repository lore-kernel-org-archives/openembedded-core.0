Return-Path: <cliff.brake@gmail.com>
Received: from mail-ie0-f179.google.com (mail-ie0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 7E77C65CA7;
	Thu, 11 Sep 2014 14:07:16 +0000 (UTC)
Received: by mail-ie0-f179.google.com with SMTP id rl12so8131080iec.10
	for <multiple recipients>; Thu, 11 Sep 2014 07:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:mime-version:message-id:from:to:subject:content-type
	:content-transfer-encoding;
	bh=Wn3iS+SNqgcWyCrtVidxemnZpHP2RAlD7yCvca/g4o4=;
	b=XqxkYHw6C/B9/9PIK5XLVaER5QyZjZZ+sfMcnSOBZVArMGbXnic7D7z2+nFAM8+BRH
	W2gbapJzFYPCU6XCm1VwJBvrVnNK9DJKssuFlwGThLLa2R8eEO4Kp/FLOcNO1dVYA91Y
	OjZRLBmuYTd6CRONVOiGa+dpsoGM6DLOFZek+LjZROrDMw36bCc9/XjEBtCaEjSktaK/
	o0HFeUODL7A2ODnjafWizAkidgiQ6hNSZ63z2X9MOT3PKCDf8thbg56VksMcb6jbA9GE
	6i+DcRx+NOhkrNJL8LNb6SBHBvnLlrtQFw80uGLVV44t4h7+teKI8MfTYY20DzbvDHbK
	DUSA==
X-Received: by 10.50.61.234 with SMTP id t10mr2686741igr.10.1410444436741;
	Thu, 11 Sep 2014 07:07:16 -0700 (PDT)
Received: from [127.0.0.1] (cable2-pool191-cs-105.doycomm.com.
	[66.219.191.105])
	by mx.google.com with ESMTPSA id an1sm4829621igc.8.2014.09.11.07.07.15
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Sep 2014 07:07:15 -0700 (PDT)
Date: Thu, 11 Sep 2014 07:07:15 -0700 (PDT)
X-Google-Original-Date: Thu, 11 Sep 2014 14:07:14 GMT
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Message-Id: <1410444434368.18a40b56@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
Subject: OE Changelog since 2014-08-31 until 2014-09-07
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
X-List-Received-Date: Thu, 11 Sep 2014 14:07:19 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2014-08-31 until 2014-09-07.  Projects included in this =
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

Alexandru DAMIAN (6):
=20=20toaster: add project pages for machines, targets, layers
=20=20toastergui: added pages for project details
=20=20toaster: rename bldviewer projecttags custom tagset
=20=20toaster: bitbake server listen on all interface
=20=20toaster: enable SSH-based remote build support
=20=20toaster: do not save objects in session

Dan McGregor (1):
=20=20knotty: ignore interrupted system calls

Marius Avram (2):
=20=20toaster: use cookies for count and sorting in templates tables
=20=20toaster: fix some code spacing issues

Paul Eggleton (1):
=20=20tinfoil: add a means of enabling variable history tracking

Richard Purdie (1):
=20=20process: Ensure abnormal exits set an error level

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Armin Kuster (3):
=20=20tzdata: update to 2014g
=20=20tzcode: update to 2014g
=20=20lz4: update to version 122

Bruce Ashfield (20):
=20=20linux-libc-headers: update to 3.16
=20=20kernel-yocto: remove redundant SRCREV check
=20=20kernel-yocto: use cat-file instead of git-show
=20=20kernel-yocto: move SRCREV validation to patching phase
=20=20kernel-yocto: remove containing branch check
=20=20kernel-yocto: remove SRC_URI kbranch validation
=20=20kernel-yocto: remove branch existence checking in do_validate_branches
=20=20kernel-yocto: remove KBRANCH_DEFAULT
=20=20kernel-yocto: simplify branch SRCREV validation
=20=20kernel-yocto: use show-ref instead of branch -a
=20=20kernel-yocto: clean overly complex branch checkout
=20=20kernel-yocto: allow custom non-meta, SRCREV format builds
=20=20kernel-yocto: remove KBRANCH_DEFAULT
=20=20kernel-yocto: convert echo statements to bb* equivalents
=20=20kern-tools: allow meta branch and meta data directory to differ
=20=20linux-yocto/3.14: vhost, vxland, openvswitch and block/bfq updates
=20=20linux-yocto/3.14: update to v3.14.17
=20=20linux-yocto/3.4: remove 3.4 name recipes
=20=20kernel-yocto: replace --is-ancestor with basic git porcelain commands
=20=20linux-yocto: ensure that recipe specific defaults take precedence

Chen Qi (25):
=20=20systemd: add PACKAGECONFIG for 'elfutils'
=20=20systemd: upgrade to 216
=20=20systemd: add PACKAGECONFIG for 'journal-upload'
=20=20systemd: make runlevel work in non-runlevel targets
=20=20update-rc.d: fix logic in populate_packages_updatercd
=20=20alsa-state: fix pkg_postinst and set INHIBIT_UPDATERCD_BBCLASS
=20=20keymaps: fix for systemd
=20=20systemd: add kbd-keymaps to RRECOMMENDS of systemd-vconsole-setup
=20=20v86d: set INHIBIT_UPDATERCD_BBCLASS if 'sysvinit' not in =
DISTRO_FEATURES
=20=20systemd: add support for executing scripts under /etc/rcS.d
=20=20dhcp: add systemd service files
=20=20acpid: upgrade to 2.0.22 and add systemd support
=20=20cups: add systemd support
=20=20rpcbind: avoid entering failed status after stopping daemon
=20=20at: remove dependency on initscripts
=20=20at: inherit update-rc.d to handle sysv init script
=20=20keymaps: remove dependency on initscripts
=20=20packagegroup-core-boot: conditionally rdepend on =
VIRTUAL-RUNTIME_initscripts
=20=20initscripts: mask several init scripts
=20=20keymaps: mask keymap when necessary
=20=20v86d: mask fbsetup when necessary
=20=20psplash: mask psplash in case of systemd
=20=20modutils-initscripts: mask modutils in case of systemd
=20=20run-postinsts.service: remove redundant line
=20=20systemd: enable forwarding messages to syslog daemon

Cristian Iorga (14):
=20=20gstreamer1.0: upgrade to 1.4.1
=20=20gstreamer1.0-libav: upgrade to 1.4.1
=20=20gstreamer1.0-plugins-base: upgrade to 1.4.1
=20=20gstreamer1.0-plugins-good: upgrade to 1.4.1
=20=20gstreamer1.0-plugins-bad: upgrade to 1.4.1
=20=20gstreamer1.0-rtsp-server: upgrade to 1.4.1
=20=20gstreamer1.0-plugins-ugly: upgrade to 1.4.1
=20=20libtirpc: upgrade to 0.2.5
=20=20alsa-lib: upgrade to 1.0.28
=20=20alsa-tools: upgrade to 1.0.28
=20=20alsa-utils: upgrade to 1.0.28
=20=20iproute2: upgrade to 3.16.0
=20=20libpcap: upgrade to 1.6.1
=20=20libical: upgrade to 1.0.0

Dan McGregor (2):
=20=20rpcbind: Make user's home directory /
=20=20xserver-nodm-init: Only start in runlevel 5

Ed Bartosh (1):
=20=20package_manager.py: enable smart non-interactive mode

Fabrice Coulon (1):
=20=20useradd-staticids.bbclass: Fix for Bug 6633

Hongxu Jia (1):
=20=20classes/compress_doc.bbclass: compress man/info pages

In Long (1):
=20=20cups: make cups daemon start correctly

Jackie Huang (2):
=20=20ghostscript: Don't build-depend on libgcrypt for the local cups
=20=20perl: add explicit configs for Time-HiRes

Khem Raj (11):
=20=20glibc: Migrate eglibc 2.19 -> glibc 2.20
=20=20distro: TCLIBC now defines glibc instead of eglibc
=20=20conf: Account for eglibc->glibc move
=20=20image-swab.bbclass: Account for eglibc -> glibc move
=20=20oeqa: sstatetests should now look for glibc-initial
=20=20recipes: Remove references to eglibc
=20=20bitbake.conf: Use 2.6.32 for oldest supported kernel
=20=20xf86-input-synaptics/xf86-input-vmmouse: Fix build with glibc 2.20
=20=20xf86-video-intel/xf86-video-omapfb: Fix build with glibc 2.20
=20=20grub: Replace _BSD_SOURCE macro with _DEFAULT_SOURCE
=20=20python-numpy: Fix build for mips64

Mikhail Durnev (2):
=20=20systemtap: Fixed probe syscall.sendfile failure
=20=20systemtap: Cross compilation fix

Otavio Salvador (2):
=20=20libpam: Fix runtime providers
=20=20libpam: Fix multilib packaging

Richard Purdie (4):
=20=20package_rpm: Add custom extension support for spec generation.
=20=20package_rpm: Add builddir macro to define source directory
=20=20package_manager: Add rpm v4 support
=20=20scripts/contrib/build-perf-test: Update eglibc -> glibc

Robert Yang (6):
=20=20libpam: remove MLPREFIX from PN
=20=20native.bbclass: deltask package_qa
=20=20perf.bb: fix multilib build
=20=20piglit: add bash to RDEPENDS_piglit
=20=20qemu-native: only depends on libxext-native when x11
=20=20rpmresolve: ignore null requires

Ronan Le Martret (1):
=20=20package_rpm: Add optional improved directory handling

Saul Wold (5):
=20=20less: Upgrade to 466
=20=20man-pages: Upgrade to 3.71
=20=20libxkbcommon: Upgrade to 0.4.3
=20=20libassuan: Upgrade to 2.1.2
=20=20at: Upgrade to 3.1.15

Wenzong Fan (1):
=20=20pango / ptest: clean CFLAGS for host binary

Yi Zhao (1):
=20=20scripts/create-recipe: minor fixes

Zidan Wang (1):
=20=20alsa-lib: libasound should runtime depends on alsa-conf

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Martin Jansa (1):
=20=20at: rename bbappend to match any version from oe-core

Peter Bigot (5):
=20=20ntp: re-enable server debugging and control by PACKAGECONFIG
=20=20gpsd: update to 3.10
=20=20pps-tools: add recipe
=20=20gpsd: add deterministic support for KPPS interface
=20=20ntp: add deterministic support for KPPS interface

Tim Orling (1):
=20=20libmodule-pluggable-perl: add 5.1

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Denys Dmytriyenko (7):
=20=20packagegroup-*-connectivity: re-enable compat-wireless, modules =
disabled in=20
=20=20arago.conf: prevent pulling mesa/mesa-gl into the build
=20=20packagegroup-arago-test: add perf package for performance analysis
=20=20recipes: HACK: disable parallel make for out-of-tree modules due to =
fixdep r
=20=20Revert "recipes: HACK: disable parallel make for out-of-tree modules =
due to=20
=20=20ltp-ddt: do_make_scripts should be a separate task with own lock file
=20=20libinput: depend on mtdev (multi-touch library)

Franklin S. Cooper Jr (4):
=20=20arago.conf: Disable TSLIB in Qt 5
=20=20qtwayland: Add Touch issue fix
=20=20packagegroup-arago-*: Conditionally include tslib
=20=20qtbase: Remove references of TSLIB

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-atmel:

Alexey Torkhov (2):
=20=20Update defconfig
=20=20Update at91sam9x5ek.conf

Nicolas Ferre (2):
=20=20Merge pull request #30 from atorkhov/patch-1
=20=20Merge pull request #31 from atorkhov/patch-3

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-beagleboard:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-browser:

Carlos Rafael Giani (2):
=20=20chromium: Disable fatal linker warnings related to SQLite
=20=20chromium: Upgrade to version 37.0.2062.94

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
=20=20chromium: Update bbappend to version 37.0.2062.94

Christopher Larson (1):
=20=20imx-{lib,vpu}: obey CFLAGS, LDFLAGS

Otavio Salvador (8):
=20=20fsl-kernel-localversion: Easy LOCALVERSION handling
=20=20linux-imx.inc: Use the new fsl-kernel-localversion class
=20=20fsl-u-boot-localversion: Easy LOCALVERSION handling
=20=20u-boot-fslc: Use the new fsl-u-boot-localversion class
=20=20u-boot-imx: Use the new fsl-u-boot-localversion class
=20=20linux-mfgtool.inc: Fix dynamic packages handling
=20=20imx-base.inc: Add virtual/libopenvg to MACHINE_{ARCH,SOCARCH}_FILTER
=20=20gpu-viv-bin-mx6q: Fix libOpenVG link when building for mx6sl

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

Carlos Rafael Giani (1):
=20=20linux-cubox-i: upgrade to 3.14.14 version

Christoph Settgast (1):
=20=20linux-boundary (3.10.17): update to 62ef71f

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

Josep Puigdemont (1):
=20=20linux-yocto: Use _append when overrides are used

Nitin A Kamble (4):
=20=20meta-intel BSPs: include meta-intel.inc
=20=20iucode-tool: a new recipe for loading Intel CPU microcode
=20=20intel-microcode: a recipe for Intel microcode datafile
=20=20meta-intel BSPs: enable microcode loading support for images

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

Florin Sarbu (7):
=20=20libpcap: Update bbappend to version 1.6.1
=20=20qtwayland: Use branch 5.4
=20=20qtbase: Add libegl as a build dep for Koelsch board
=20=20linux: Enable CGROUPS support for MACHINE koelsch
=20=20browser-poc: Add recipe and add it to rootfs
=20=20ivi-image-demo: Conditionally add to rootfs the wayland-wsegl package =
for th
=20=20README.md: Add sha's of dependent layers.

Holger Behrens (6):
=20=20local.conf.sample: remove Qemu configuration
=20=20linux-yocto/3.4: remove 3.4 bbappend
=20=20glibc: follow eglibc 2.19 -> glibc 2.20 migration
=20=20automotive-message-broker: upgrade to 0.11.811
=20=20meta-ivi-demo: add a local.conf template
=20=20local.conf.sample: fix nothing provides 'libxext-native' error

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

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

Denys Dmytriyenko (5):
=20=20linux-ti-staging: update to the latest rev and add wlan config
=20=20linux-ti-staging 3.12: update to the latest stable 3.12.27 version
=20=20linux-mainline 3.14: update to the latest stable 3.14.17 version
=20=20linux-ti-staging: merge audio/display changes, drop local SGX-related =
patche
=20=20linux-ti-staging: fix breakage in rpmsg/rproc caused by the merge

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Armin Kuster (2):
=20=20upstream_tracking: add lz4 version and date info for package
=20=20nettle: Add name to maintainers list

Bruce Ashfield (2):
=20=20yocto-bsps: remove 3.4 bbappend
=20=20yocto-bsps: update SRCREVs to linux-yocto latest

Khem Raj (1):
=20=20conf: Account for eglibc->glibc move

Richard Purdie (2):
=20=20poky-tiny: Set native DISTRO_FEATURES
=20=20poky-tiny: Fix qemu build failure

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



