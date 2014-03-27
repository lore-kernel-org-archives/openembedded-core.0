Return-Path: <cliff.brake@gmail.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 2C2EC6EE8A;
	Thu, 27 Mar 2014 17:06:09 +0000 (UTC)
Received: by mail-ig0-f171.google.com with SMTP id hl1so1841488igb.16
	for <multiple recipients>; Thu, 27 Mar 2014 10:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:from:to:subject:content-type
	:content-transfer-encoding;
	bh=K0M0l6fMo2ELXJrTba69AQUMGCoJsvw3IpPyzKTCybE=;
	b=OEEs7zyw3tQIFeTqJkhFS1uJIbAwDPznqINlcAtQcHRuO+ICkmqV1/AamzacVHYCfK
	w4QnhgWcfQk9XlT7ESCd9R7SIrvQqFjOQ7Hs6uJh1oRiWYkgQ616Rji9gfmfa2xNPyGM
	DLDJPoAfsQoaVOJgHrUvdw8+O1iwh/fvCs+803pKyC1z5VH0jMjwQKR9nwcNNOYs/Sgj
	rGKoYL4a3YiCdYnGyyWqSkQfiTdnm8+B7HnbJwl7BGAlsrFLBsC1vQJHRNvqlImzx3GX
	ZI/dHkEKyngLai1KS6BMDZS1xk5WqX7nSKJtPZ1DsAdXhxOeeOv1EE5UGhVDBFFAl5ts
	WUWA==
X-Received: by 10.50.122.8 with SMTP id lo8mr32888876igb.31.1395939970524;
	Thu, 27 Mar 2014 10:06:10 -0700 (PDT)
Received: from happy.bec-systems.com (cable-pool6-cs-200.doycomm.com.
	[66.219.185.200])
	by mx.google.com with ESMTPSA id on9sm6018259igb.11.2014.03.27.10.06.09
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Mar 2014 10:06:09 -0700 (PDT)
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Date: Thu, 27 Mar 2014 10:06:09 -0700 (PDT)
Message-Id: <1395939968629.46790603@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
Subject: OE Changelog since 2014-03-16 until 2014-03-23
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
X-List-Received-Date: Thu, 27 Mar 2014 17:06:10 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2014-03-16 until 2014-03-23.  Projects included in this =
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

Alexandru DAMIAN (2):
=20=20toaster: measure task duration with server-side timestamps
=20=20toaster: fix task elapsed time calculation

Belen Barros Pena (11):
=20=20toaster: Not using task_color tag for execution heading
=20=20toaster: Fix Recipe sorting in tasks table
=20=20toaster: Don't show clear search button if text input field is empty
=20=20toaster: Remove the data-toggle attribute
=20=20toaster: Sort layers in alphabetical order
=20=20toaster: Add link to the Toaster manual
=20=20toaster: Remove trailing spaces from 'name'
=20=20toaster: Change "Package version" to "Version"
=20=20toaster: Remove extra space in the breadcrumb
=20=20toaster: Set display of "Cache attempt" column
=20=20toaster: Amend failed tasks behaviour

Dave Lerner (2):
=20=20toaster: add jquery treetable plugin
=20=20toaster: image information views

David Reyna (1):
=20=20toaster: filter out setscene tasks in recipe details

Farrell Wymore (1):
=20=20toaster: added file types to the Outputs column in the build page

Marius Avram (1):
=20=20ConfHandlerr: Use full path in variable history

Richard Purdie (7):
=20=20runqueue: Don't error if we never setup workers
=20=20runqueue: More carefully handle the sigchld handler
=20=20runqueue: Ensure handler does not recurse
=20=20runqueue: Really fix sigchld handling
=20=20runqueue: Don't catch all child return codes
=20=20runqueue: Revert child signal handler for now
=20=20runqueue: Remove use of waitpid on worker processes

Valentin Popa (1):
=20=20hob: sync after image deploy

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Alexandru DAMIAN (1):
=20=20sstate: list missing files for toaster

Alexandru Palalau (5):
=20=20gnome-desktop: removed gconf inheritance
=20=20gst-plugins-gl: removed gconf inheritance
=20=20gnome-mime-data: removed gconf and gtk-icon-cache inheritance
=20=20gsettings-desktop-schemas: removed unneeded class inheritance
=20=20gnome-doc-utils: removed gconf inheritance

Andrey Belous (1):
=20=20tclibc-uclibc: Changing assignment to conditional variable assignment

Bruce Ashfield (1):
=20=20perf: add libexec and traceevent to packages

Chen Qi (4):
=20=20sudo: upgrade to 1.8.9p5
=20=20grep: upgrade from 2.16 to 2.18
=20=20gettext: upgrade from 0.18.3.1 to 0.18.3.2
=20=20expect: fix do_install failure on SLED 11.2

Chong Lu (1):
=20=20tar: add knob whether acl.h are checked

Christopher Larson (2):
=20=20lib/oe: turn oe into a namespace package
=20=20gettext-0.16.1: kill target m4 macros from sysroot

Cosmin Paraschiv (1):
=20=20gcc-runtime: Build libatomic

Cristian Iorga (2):
=20=20packagegroup-core-tools-testapp: added 3G tools
=20=20packagegroup-core-tools-testapps: added connman tools and tests

Cristiana Voicu (1):
=20=20toaster.bbclass: read the data needed for license manifest path

Darren Hart (1):
=20=20linux-yocto-custom: Use SRCREV_machine

Fathi Boudra (1):
=20=20kernel-arch.bbclass: add arm64 support to U-Boot architecture map

Jonathan Liu (2):
=20=20base-files: use /dev/root in /etc/fstab for systemd support
=20=20busybox: disable fsck.minix and mkfs.minix

Kai Kang (4):
=20=20qmmp: update to 0.7.5
=20=20directfb: update to 1.7.1
=20=20directfb-examples: update to 1.7.0
=20=20alsa-tools: update to version 1.0.27

Khem Raj (8):
=20=20uclibc: Implement clock_adjtime()
=20=20uclibc: Remove iconv.h
=20=20gnutls: Link in pthread explicitly for uclibc
=20=20glib-2.0: Fix localedir expectations for uclibc
=20=20util-linux: scanf_cv_alloc_modifier changed from 'as' -> 'ms'
=20=20intltool: Define DATADIRNAME=3Dshare for uclibc based systems
=20=20Upgrade to systemd 211+
=20=20pulseaudio: Upgrade 4.0 -> 5.0

Koen Kooi (1):
=20=20libsdl: add missing libglu dependency for openGL

Laurentiu Palcu (4):
=20=20package_manager.py: create separate class for installed packages =
listing
=20=20rootfs.py, sdk.py: adjust/create the wrappers for creating installed =
package
=20=20image.bbclass, license.bbclass: adjust the name of =
list_installed_packages()
=20=20buildhistory.bbclass: create proper dependency files for SDK

Mark Hatle (1):
=20=20useradd{-static}: Ignore useradds on nativesdk

Martin Jansa (1):
=20=20pulseaudio: Make it compatible with systemd-209

Matthieu Crapet (2):
=20=20fontcache.bbclass: add fontconfig-utils runtime dependency
=20=20linux-dummy: provide kernel-modules (empty) package

Mike Crowe (1):
=20=20boost: Pass CFLAGS, CXXFLAGS and LDFLAGS correctly into boost.build

Otavio Salvador (2):
=20=20scripts/cleanup-workdir: Fix a comment typo
=20=20cairo: Add 'egl' and 'glesv2' PACKAGECONFIG options

Paul Eggleton (9):
=20=20x264: add perlnative to inherit
=20=20python: add python-mmap to python-multiprocessing RDEPENDS
=20=20generate-manifest-*.py: set SUMMARY instead of DESCRIPTION
=20=20generate-manifest-2.7.py: sync with python-2.7-manifest.inc
=20=20generate-manifest-3.3.py: sync descriptions with 2.7 version
=20=20python3: sync module dependencies from 2.7
=20=20classes/image: disable pam nullok_secure with debug-tweaks
=20=20classes/kernel: move module postinst commands to kernel-base
=20=20classes/image: ignore modules.* changing during multilib image =
construction

Prabhu Sundararaj (2):
=20=20gsettings-desktop-schemas: Updated to 3.10.1.bb
=20=20cogl-1.0 : Update to 1.16.2 release

Ricardo Neri (1):
=20=20runqemu: Add option for custom BIOS directory

Ricardo Ribalda Delgado (2):
=20=20apt-native: Install apt-ftparchive
=20=20package_manager: Use apt-ftparchive for deb packages

Richard Purdie (2):
=20=20autotools: Exclude variables from autotools_copy_aclocals
=20=20pixbufcache: Fix librsvg-native build

Robert Yang (10):
=20=20docbook-sgml-dtd-native: remove catalog file when do_clean
=20=20sgml-common-native: fix the generation of sgml-docbook.cat
=20=20genext2fs: remove it
=20=20e2fsprogs: return error when failed to populate fs
=20=20image_types.bbclass: use 4096 instead of 8192 bytes-per-inode
=20=20classes/archive*.bbclass: remove archive-*-source.bbclass
=20=20archiver.bbclass: refactor it
=20=20package_rpm.bbclass: archive the source to srpm package
=20=20archiver.bbclass: move a few code to copyleft_compliance.bbclass
=20=20local.conf.sample.extended: update for the archiver

Ross Burton (1):
=20=20gtk-engines: removed gnome inheritance

Saul Wold (1):
=20=20openssh: Update init file to add ED25519 Key generation

Simone Agresta (2):
=20=20alsa-tools: fix build when x11 and gtk+ not available
=20=20alsa-tools: fix build when x11 and gtk+ not available

Trevor Woerner (1):
=20=20core-image-minimal: allow user to set size

Valentin Popa (2):
=20=20make: add 'inherit pkgconfig'
=20=20mips64-linux: set ac_cv_sizeof_ssize_t

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Andreas Oberritter (1):
=20=20libconnman-qt: update to 1.0.50+git80ac184

Khem Raj (1):
=20=20luajit: Upgrade to 2.0.1 -> 2.0.2

Lauren Post (1):
=20=20iperf: Upgrade to version 2.0.5

Martin Jansa (2):
=20=20polkit: make it compatible with systemd-209
=20=20networkmanager: make it compatible with systemd-209

Matthieu CRAPET (1):
=20=20bash-completion: update to version 2.1

Mike Looijmans (1):
=20=20musicbrainz: Build with B=3DS

Paul Eggleton (2):
=20=20modphp: update to 5.5.10
=20=20phpmyadmin: update to 4.1.9

Tim Orling (2):
=20=20xbmc: branch name is case sensitive
=20=20vlc: update to 2.1.2

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Denys Dmytriyenko (4):
=20=20libjpeg-turbo: remove unneeded bbappend, SRC_URI overwrite won't fetch
=20=20cryptodev: may still conflict with ocf-linux, add RREPLACES
=20=20arago: set target toolchain preferences at distro level
=20=20arago.conf: bump the version

Eyal Reizer (1):
=20=20bt-firmware: Add support for am437x

Franklin S. Cooper Jr (6):
=20=20arago-source-ipk: Move cryptodev sources to extra-drivers directory
=20=20tisdk-install: Add SDK_PATH_TARGET varaible
=20=20ti-tisdk-makefile: Define SDK_PATH_TARGET
=20=20cryptodev: Add patch to make cryptodev cross compile friendly.
=20=20ti-tisdk-makefile: Add Makefile stub for cryptodev
=20=20wl18xx-firmware: Only install binaries via Makefile

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-beagleboard:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-browser:

Khem Raj (1):
=20=20chromium: Upgrade 29 -> 35

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

Otavio Salvador (5):
=20=20gpu-viv-bin-mx6q: Depends on 'wayland' when needed
=20=20clutter-1.0, cogl-1.0: Use Framebuffer API for Wayland
=20=20image_types_fsl.bbclass: Avoid wrong dependency for no bootloader
=20=20mxsldr: Use 'autotools-brokensep' as out of tree build is not =
supported
=20=20xf86-video-imxfb-vivante: Use 'autotools-brokensep' as out of tree =
build is=20

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

Anthony Felice (4):
=20=20linux-timesys (3.0.15): Bump SRCREV_pcl052 to 5e9d9a5
=20=20u-boot-timesys: Add branch for quartz machine
=20=20linux-timesys: Add customized kernel for quartz machine
=20=20quartz: Add machine config

Otavio Salvador (1):
=20=20imx6qsabrelite: Add the machine in the MACHINEOVERRIDES

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-ppc:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-guacamayo:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix-community:

Andreas M=C3=BCller (3):
=20=20u-boot-overo: add zImage support
=20=20u-boot-variables: add notes for kernel zImage
=20=20u-boot-variables: add drm settings

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-handheld:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-igep:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Darren Hart (2):
=20=20intel-core*: Set kernel provider with conditional assignment
=20=20linux-yocto-rt: Add missing 3.10 rt bbappends

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

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-netbookpro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nslu2:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-opie:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-qt3:

Paul Eggleton (1):
=20=20qt-x11-free: apply Fedora patch to support freetype 2.5.1+

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

Alekseyev Oleksandr (1):
=20=20webos-image: luna-service2=3D178

Herb Kuta (1):
=20=20webos.inc: Invent WEBOS_DISTRO_VERSION_CODENAME

Iyad Qumei (1):
=20=20icecc.bbclass: exclude icecc variables from signature

Sergey Olendarenko (1):
=20=20webos-image: gtest=3Dv1.7.0

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Robert Yang (1):
=20=20local.conf.sample.extended: update for the archiver

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



