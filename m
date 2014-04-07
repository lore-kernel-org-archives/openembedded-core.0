Return-Path: <cliff.brake@gmail.com>
Received: from mail-ie0-f180.google.com (mail-ie0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id D0B906F8AB;
	Mon,  7 Apr 2014 17:49:09 +0000 (UTC)
Received: by mail-ie0-f180.google.com with SMTP id as1so6572921iec.11
	for <multiple recipients>; Mon, 07 Apr 2014 10:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:from:to:subject:content-type
	:content-transfer-encoding;
	bh=nT4xWrWLSvmGai1k8025qZoBKpfBIhfmK7np0LFrIiY=;
	b=hyc8qEGjizp8HJUa9sLfdcKOXGn4J6JEjfFzd5J/XJXsKfEfigJwhuE2zBCF/3ymgZ
	Smh8NfVkkqZ1LA0Rubwyv7ZsgkB0sVrFwuyEKPpu9XjTpLriqmdDgrIZJpxAm8ZDH++g
	WSFexfgJvqVv8UC/e0JBlQAFJWok9vbABhySgr+o84yzl+Bo8YPNsyvqrxn3i+JYOQi+
	q9hp8MqBvLpAAthaEsusMWdeeeoHGibP7VmHXkgHH3DLRLA08siRXJYxRqE065uK1Tn+
	xpfYL6N+OBfkx0PC087RIvJ+Q/2/Wk8DVJEWOwRlRS7Nv25W+TNYeDhWj4xIXQ7IzDA6
	RMTg==
X-Received: by 10.50.118.69 with SMTP id kk5mr21384582igb.10.1396892950830;
	Mon, 07 Apr 2014 10:49:10 -0700 (PDT)
Received: from happy.bec-systems.com (cable-pool6-cs-200.doycomm.com.
	[66.219.185.200])
	by mx.google.com with ESMTPSA id z5sm31177358igl.13.2014.04.07.10.49.09
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 07 Apr 2014 10:49:10 -0700 (PDT)
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Date: Mon, 07 Apr 2014 10:49:10 -0700 (PDT)
Message-Id: <1396892948909.79c2f6c7@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
Subject: OE Changelog since 2014-03-30 until 2014-04-06
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
X-List-Received-Date: Mon, 07 Apr 2014 17:49:11 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2014-03-30 until 2014-04-06.  Projects included in this =
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

Alexandru DAMIAN (5):
=20=20toaster: update saving sstate task data
=20=20toaster: fix timezone detection
=20=20bitbake: cooker: mark setFeatures command as read-only
=20=20toasterui: avoid variable name conflict
=20=20toasterui: save warnings from non-build context

Belen Barros Pena (14):
=20=20toaster: Show "No builds found" in the builds table
=20=20toaster: Remove trailing spaces from 'name'
=20=20toaster: Small tweaks to the packages included interface
=20=20toaster: Fix the fade out animation
=20=20toaster: Increase animation duration
=20=20toaster: Match search results form to no results form
=20=20toaster: Update help text in format_vpackage_namehelp tag
=20=20toaster: Update API
=20=20toaster: Remove html validation errors in tasks.html
=20=20toaster: Changes to help text
=20=20toaster: Fix "Recent builds" links
=20=20toaster: Fix the empty packages alert
=20=20toaster: Make tables happy in Chrome
=20=20toaster: Fixes to the build dashboard

Cristiana Voicu (2):
=20=20toaster: use deploy_dir var to obtain the license.manifest path
=20=20hob: adding INHERIT +=3D " testimage " affects image recipes list

Dave Lerner (1):
=20=20toaster: unbuilt package dependency formats

David Reyna (4):
=20=20toaster: disable configvar sorts for value and files
=20=20toaster: secondary sort key as table's default order
=20=20toaster: link task order to right tasks page
=20=20toaster: catch IndexError error in dictionary lookups

Farrell Wymore (2):
=20=20toaster: correct package count
=20=20toaster: added covered task list

Marius Avram (2):
=20=20hob: fix customization of empty image recipe
=20=20cooker: Overwrite IMAGE_BASENAME to default in custom image

Paul Eggleton (2):
=20=20toaster: fix help texts not showing for most tasks
=20=20toaster: fix mis-detection of targets as images

Ravi Chintakunta (1):
=20=20toaster: Display task description

Richard Purdie (3):
=20=20runqueue: Fix sstate task dependency problems
=20=20runqueue: Address issues with incomplete sstate sets
=20=20fetch2: Fix bug in file checksum generation

Scott Rifenbark (1):
=20=20user-manual-metadata.xml: Added new section on mapping functions.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Alexandru DAMIAN (1):
=20=20sstate.bbclass: update missed sstate event

Alexandru-Cezar Sardan (2):
=20=20gcc: changed multilib options handling
=20=20gcc: enable multilib setup for powerpc64 arch

Baogen Shang (1):
=20=20openssl: Fix pod2man des.pod error on Ubuntu 12.04

Bruce Ashfield (6):
=20=20linux-yocto/3.10: fix qemuarm build failure
=20=20linux-yocto/3.14: introduce versioned recipes
=20=20linux-libc-headers: make compression format configurable
=20=20linux-libc-headers: add 3.14 libc headers
=20=20libc-headers: set TC default to 3.14
=20=20linux-libc-headers: remove 3.10 recipe

Chong Lu (1):
=20=20python: fix build error with Readline 6.3

Chunrong Guo (1):
=20=20coreutils: fix search paths for libstdbuf.so

Corneliu Stoicescu (1):
=20=20selftest/sstatetests.py: Added 'populate_lic' to ignore_patterns

Cristian Iorga (1):
=20=20core-image-lsb: enforce pam as a needed distro feature

Cristiana Voicu (1):
=20=20toaster.bbclass: the license.manifest is located in DEPLOY_DIR

David Vincent (1):
=20=20SDK default deploy directory

Drew Moseley (2):
=20=20busybox: Use CCLD
=20=20busybox: Specify '-nostdlib' when linking to a .o file.

Jeff Polk (1):
=20=20qemu: Add addition environment space to boot loader qemu-system-mips

Jiang Lu (1):
=20=20Qemu:Arm:versatilepb: Add memory size checking

Joe Slater (1):
=20=20openssh: build without libbsd

Jonathan Liu (3):
=20=20dbus: backport fix for bus activation under systemd session
=20=20dbus: backport memory leak patch for error when listing services
=20=20systemd: backport patch to avoid assertion failures

Kai Kang (1):
=20=20xorg: Fix for CVE-2013-6424

Martin Jansa (6):
=20=20cmake: Add ugly hack from meta-qt5 to prevent cmake trying to detect =
qt5
=20=20ed: remove infodir
=20=20gcc-target: remove infodir
=20=20send-error-report: show response
=20=20Revert "qt-mobility: remove /usr/lib from ld rpath-link option"
=20=20test-dependencies.sh: Redirect stderr

Mats K=C3=A4rrman (2):
=20=20eglibc_2.19: Make ppc e300c3 benefit from 603e sqrt optimizations
=20=20Make ppce300c3 tune hard-float by default

Matthieu Crapet (2):
=20=20libomxil-0.9.3: fix configure unrecognised option
=20=20rootfs.py: introduce USE_DEVFS check

Mike Crowe (2):
=20=20cmake-native: Stop building ccmake
=20=20cmake: Remove dependency on ncurses

Ming Liu (1):
=20=20libpam: fix multilib packaging issue for pam-plugins

Otavio Salvador (2):
=20=20packagegroup-core-tools-testapps: Move GLTOOLS to X11GLTOOLS
=20=20alsa-tools: Fix build without x11

Paul Barker (1):
=20=20libarchive: Add PACKAGECONFIG for lzo

Paul Eggleton (1):
=20=20classes/sanity: check if SDKMACHINE setting has taken effect

Richard Purdie (6):
=20=20sstatesig: Anchor inherits class tests
=20=20Revert "zisofs-tools-native: Add missing dependency on zlib-native"
=20=20image/image-prelink/image-mklibs/sanity: Drop pointless =
EXPORT_FUNCTIONS
=20=20sstate: Fix an error handling the taskname
=20=20sstate: Remove name sstate parameter
=20=20siteconfig: Unbreak after sstate changes some time ago

Robert Yang (4):
=20=20kmod: fix O_CLOEXEC not supported on old kernel
=20=20gtk+3: set proper FLAGS for native
=20=20util-linux: fix parallel build issue
=20=20useradd_base.bbclass: avoid the traffic crowding

Ross Burton (2):
=20=20gdk-pixbuf: add an option so that loader errors are fatal
=20=20gdk-pixbuf: pass GDK_PIXBUF_FATAL_LOADER where relevant

Roy Li (1):
=20=20sysvinit: fix the bootlogd init script header

Saul Wold (1):
=20=20image.bbclass: add function to disable SSH DNS Lookup for Qemu

Stefan Stanacar (5):
=20=20initrdscripts: add install scripts with a second rootfs
=20=20recipes-extended: add master image for testing purposes
=20=20lib/oeqa: add a test target controller for EFI targets
=20=20qemux86-64: re-enable paravirt guest, bring it in sync with qemux86
=20=20sanity: testimage needs DISPLAY set only for qemu targets

Ting Liu (1):
=20=20wayland-native: disable unused macro checks to fix build issue on =
Centos5.x

Tom Zanussi (1):
=20=20systemtap: Move to current HEAD

yanjun.zhu (1):
=20=20pseudo-1.5.1: keep install command directory mode

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Andrea Adami (2):
=20=20linux-yocto-tiny-kexecboot: remove ${PR} remnant
=20=20klibc: restylize a bit the recipes

Jackie Huang (1):
=20=20inetutils: add -dbg packages for tftpd, telnetd and rshd

Javier Viguera (1):
=20=20stunnel: fix SRC_URI

Joe Slater (1):
=20=20modphp: add phpize to scan for absolute paths

Robert Yang (1):
=20=20cherokee: only install configured.py once

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

Daiane Angolini (1):
=20=20imx6dlsabreauto: Add myself as maintainer

Mario Domenech Goulart (4):
=20=20linux-mfgtool.inc: typo fix (s/must to be/must be/)
=20=20linux-timesys: add SUMMARY
=20=20linux-imx.inc: move SUMMARY and DESCRIPTION from .inc to .bb's
=20=20linux-fslc: move SUMMARY and DESCRIPTION from .inc to .bb

Otavio Salvador (6):
=20=20u-boot-fslc: Update to v2014.01 based release
=20=20directfb, directfb-examples: Backport 1.6 release
=20=20gpu-viv-bin-mx6q: Rework depends for easy reading
=20=20gpu-viv-bin-mx6q: Drop libgl-mx6-dev runtime depends on libgl-mesa-dev
=20=20cairo: Enable 'directfb' when using DirectFB backend
=20=20cairo: Do not change cairo-native PACKAGECONFIG

Prabhu Sundararaj (1):
=20=20weston: Add i.MX6 GPU support

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

Eric Nelson (1):
=20=20linux-boundary: Add DEPENDS on lzop

Mario Domenech Goulart (2):
=20=20linux-cfa.inc: typo fix (s/SECTion/SECTION/)
=20=20linux-timesys: remove DESCRIPTION from .bbappend

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-ppc:

Chunrong Guo (2):
=20=20u-boot: add git revision to the local version
=20=20linux-qoriq-sdk: add git revision to the local version

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-guacamayo:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix-community:

Andreas M=C3=BCller (11):
=20=20card-*-write.sh: workaround umount busy errors
=20=20linux-omap-3.11: initial add
=20=20overo.conf: set linux-omap-3.11 as default provider
=20=20overo.conf: add multiple video drivers for X for test purpose
=20=20u-boot-variables: drop a note for change in mmc rescan at latest =
u-boot
=20=20card scripts: prepare kernel zImage
=20=20linux.inc: use oe-core's devicetree blob creation
=20=20linux-omap-3.11 / TODO: drop note for ehci-omap
=20=20linux-omap-3.11: fix ehci-usb start when unplugged
=20=20linux-omap-3.11/TODO: add a wifi reminder
=20=20linux-omap-3.11: make wifi/libertas work

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-handheld:

Andrea Adami (2):
=20=20linux-yocto-tiny-kexecboot: refer to the patches in linux-yocto
=20=20linux-yocto: initial commit of version 3.14

Linus Walleij (1):
=20=20h3600: add new patches, update config

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-igep:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Nitin A Kamble (26):
=20=20emenlow: Update linux-yocto 3.10 SRCREV (3.10.25)
=20=20crownbay: Update linux-yocto 3.10 SRCREV (3.10.34-LTSI)
=20=20fri2: Update linux-yocto 3.10 SRCREV (3.10.34-LTSI)
=20=20common: Update linux-yocto 3.10 SRCREV (3.10.34-LTSI)
=20=20nuc: Update linux-yocto 3.10 SRCREV (3.10.34-LTSI)
=20=20Make LINUX_VERSION machine specific
=20=20linux-yocto_3.14: common recipe for meta-intel BSPs
=20=20crownbay-noemgd: linux-yocto_3.14 recipe
=20=20emenlow-noemgd: linux-yocto_3.14 recipe
=20=20fri2-noemgd: linux-yocto_3.14 recipe
=20=20nuc: linux-yocto_3.14 recipe
=20=20crownbay-noemgd: change the default kernel to v3.14
=20=20emenlow-noemgd: change the default kernel to v3.14
=20=20fri2-noemgd: change the default kernel to v3.14
=20=20jasperforest: change the default kernel to v3.14
=20=20nuc: change the default kernel to v3.14
=20=20sugarbay: change the default kernel to v3.14
=20=20intel-core2-32: change the default kernel to v3.14
=20=20intel-corei7-64: change the default kernel to v3.14
=20=20common/linux-yocto_3.10: update SRCREVS to 3.10.35-ltsi
=20=20crownbay: linux-yocto_3.10: update SRCREVS to 3.10.35-ltsi
=20=20emenlow: linux-yocto_3.10: update SRCREVS to 3.10.35-ltsi
=20=20fri2: linux-yocto_3.10: update SRCREVS to 3.10.35-ltsi
=20=20common/linux-yocto_3.10: update SRCREVS to 3.10.35-ltsi
=20=20common kernels: fix typos in overrides
=20=20nuc: use common kernels

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

Erik Bot=C3=B6 (1):
=20=20dlt-daemon: Fix build with systemd >=3D 209.

Florin Sarbu (23):
=20=20Promote ofono to P1 Abstract Component
=20=20node-state-manager: Promote to P1 SC from P1 AC
=20=20common-api-c++-dbus: Update to version 2.1.4     common-api-c++: =
Update to v
=20=20Change priority from P1 SC to P2 SC for quota and sqlite
=20=20Remove obex.
=20=20bluez5_5.15.bbappend: Change SRC_URI
=20=20pulseaudio_5.0.bbappend: Make pulseaudio configure with bluez5
=20=20connman: Add .bbappend for building with bluez5
=20=20libpcap: Add .bbappend for building with bluez5
=20=20ofono: Add .bbappend for building ofono against     bluez5 instead of =
bluez4
=20=20packagegroup-abstract-component-p1.bb: Replace bluez4 with bluez5
=20=20weston: Change SRC_URI to a weston fork.
=20=20Add new package wayland-ivi-extension.
=20=20Removed obsolete bluez4 bbappend
=20=20Add CONFIG_BT for the supported machines' kernel config
=20=20packagegroup-abstract-component-p1.bb: Add weston and =
wayland-ivi-extension
=20=20Removed x11 from DISTRO_FEATURES and from     P1 placeholder =
component files
=20=20Add horizon-image
=20=20conf-notes.txt: Add reference to horizon-image
=20=20horizon-image: Fix typo in recipe name
=20=20poky-ivi-systemd.conf: Remove duplicate inclusion     of =
conf/distro/include
=20=20Add new P2 AC component node-health-monitor
=20=20Change vexpressa9 qemu settings

Khan, Yasir (1):
=20=20AudioManager: Remove Restart option from service

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

Khem Raj (1):
=20=20Merge pull request #5 from koenkooi/master

Koen Kooi (2):
=20=20ixp4xx.inc: prefer tar.xz or tar.gz images
=20=20linux-ixp4xx 2.6.37: make EHCI a builtin

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

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

Anatolii Sakhnik (1):
=20=20webos-image: luna-service2=3D182

Iyad Qumei (1):
=20=20icecc: Exclude various components from building with icecc

Martin Jansa (4):
=20=20webos_enhanced_submissions: Make it easier to use AUTOREV
=20=20package.bbclass: Import fix for newer tar 1.27
=20=20archive*.bbclass: Fix removing SRC_URI entries from WORKDIR
=20=20buildstats-summary: Show number of packagedata tasks

Oleg Yablokov (1):
=20=20webos-image: db8=3D134

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

Nathan Rossi (1):
=20=20linux-yocto: Add recipe for linux-yocto 3.14

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Bruce Ashfield (5):
=20=20yocto-bsps: remove linux-yocto 3.8 bbappend
=20=20meta-yocto-bsp: populate 3.14 bbappend
=20=20poky: set qemu BSPs preferred version to 3.14
=20=20yocto-bsps: update reference BSPs to v3.10.34
=20=20yocto-bsps: edgerouter: explicitly set preferred version

Cristian Iorga (1):
=20=20poky.conf: added Poky 1.6 as tested distro

Denys Dmytriyenko (2):
=20=20beaglebone: add OE machine definition for use with linux-yocto kernels
=20=20beaglebone: fix typo in the U-Boot config name

Paul Eggleton (4):
=20=20routerstationpro: drop
=20=20local.conf.sample: drop routerstationpro in favour of edgerouter
=20=20README.hardware: drop routerstationpro in favour of edgerouter
=20=20README.hardware: tweak edgerouter instructions

Richard Purdie (4):
=20=20beaglebone: Switch to linux-yocto 3.14
=20=20local.conf.sample: Update for beagleboard -> beaglebone
=20=20Drop beagleboard, replaced by beaglebone
=20=20meta-yocto-bsp: Bump layer version after the BSP changes

Valentin Popa (1):
=20=20poky-tiny: enable LFS for uclibc

Yang Wei (2):
=20=20yocto-bsps: Add a new BSP to support edgerouter
=20=20poky: add edgerouter information to README.hardware

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



