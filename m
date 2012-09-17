Received: from new.bec-systems.com ([74.208.70.121] helo=bec-systems.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1TDf0l-0005vj-UX; Mon, 17 Sep 2012 19:21:32 +0200
Received: from oh-69-34-21-229.sta.embarqhsd.net ([69.34.21.229]
	helo=happy.bec-systems.com)
	by bec-systems.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cliff.brake@gmail.com>)
	id 1TDeha-0005hn-7a; Mon, 17 Sep 2012 13:01:45 -0400
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Date: Mon, 17 Sep 2012 17:08:42 GMT
Message-Id: <1347901722794.76a1fb86@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
X-Spam_score: -2.9
X-Spam_score_int: -28
X-Spam_bar: --
Subject: OE Changelog since 2012-09-09 until 2012-09-16
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Sep 2012 17:21:32 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2012-09-09 until 2012-09-16.  Projects included in this =
report:

bitbake: git://git.openembedded.org/bitbake
openembedded-core: git://git.openembedded.org/openembedded-core
meta-openembedded: git://git.openembedded.org/meta-openembedded
meta-smartphone: http://git.shr-project.org/repo/meta-smartphone.git
meta-micro: git://git.openembedded.org/meta-micro
meta-slugos: git://github.com/kraj/meta-slugos
meta-nslu2: git://github.com/kraj/meta-nslu2
meta-intel: git://git.yoctoproject.org/meta-intel
meta-handheld: git://git.openembedded.org/meta-handheld
meta-opie: git://git.openembedded.org/meta-opie
openembedded: git://git.openembedded.org/openembedded
meta-bug: git://github.com/buglabs/meta-bug.git
meta-efikamx: git://github.com/kraj/meta-efikamx.git
meta-gumstix: git://gitorious.org/schnitzeltony-oe-meta/meta-gumstix.git
meta-ettus: http://github.com/koenkooi/meta-ettus.git
meta-fsl-ppc: git://git.yoctoproject.org/meta-fsl-ppc
meta-igep: http://github.com/ebutera/meta-igep.git
meta-netbookpro: git://github.com/tworaz/meta-netbookpro
meta-xilinx: git://git.yoctoproject.org/meta-xilinx
meta-chicken: git://github.com/OSSystems/meta-chicken
meta-java: git://github.com/woglinde/meta-java
meta-qt3: git://git.yoctoproject.org/meta-qt3
meta-telephony: git://gitorious.org/sysmocom-openembedded/meta-telephony.git
meta-ti: git://git.yoctoproject.org/meta-ti
meta-angstrom: git://github.com/Angstrom-distribution/meta-angstrom.git
meta-browser: git://github.com/OSSystems/meta-browser.git
meta-mono: git://git.yoctoproject.org/meta-mono.git
meta-raspberrypi: git://github.com/djwillis/meta-raspberrypi.git
meta-kde: git://gitorious.org/openembedded-core-layers/meta-kde.git
meta-yocto: git://git.yoctoproject.org/meta-yocto
meta-webos: git://github.com/openwebos/meta-webos.git
meta-arago: git://arago-project.org/git/meta-arago.git
meta-ivi: git://git.yoctoproject.org/meta-ivi
meta-systemd: git://git.yoctoproject.org/meta-systemd
meta-guacamayo: git://github.com/Guacamayo/meta-guacamayo.git

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for bitbake:

Constantin Musca (1):
=20=20hob/builddetailspage: Add tooltips to the build failed notification

Cristiana Voicu (3):
=20=20hob/imageconfigurationpage: remove or_label reference
=20=20hob/packageselectionpage: restore selected packages
=20=20hob/imagedetailspage: change "FileCreated" label to "Files created"

Jessica Zhang (1):
=20=20Fixed hob proxy tab tooltip text per review suggestions [YOCTO #2499]

Paul Eggleton (10):
=20=20fetch2: fix malformed URL causing a useless traceback
=20=20cooker: fix handling of exceptions during exception handling
=20=20hob: use correct semantics for dealing with pkgdata
=20=20hob: ensure error message text is properly escaped
=20=20hob: rename task -> packagegroup in recipe selection
=20=20hob: don't reorder layers list
=20=20lib/bb/command.py: ensure setVariable only sets values as strings
=20=20hob: sort base image drop-down list
=20=20hob: format error messages properly
=20=20lib/bb/event: improve handling of event queue on exit

Richard Purdie (2):
=20=20tinfoil: Add file inadvertently not committed
=20=20cooker: Fix priority for virtual recipes

Valentin Popa (1):
=20=20Implement 'settings' dialog as designed

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Andreas M=C3=BCller (2):
=20=20pixman: merge meta-oe append into oe-core
=20=20gst-plugins-good: fix compile error with recent linux-libc-headers

Andrei Dinu (1):
=20=20libffi upgrade to 3.0.11

Andrei Gherzan (2):
=20=20image_types.bbclass: Round up ROOTFS_SIZE after base_size check
=20=20taglib: Update to v1.8

Bruce Ashfield (6):
=20=20linux-yocto/3.4: v3.4.10 and uprobes/kprobes configuration updates
=20=20linux-yocto*: append to KERNEL_FEATURES instead of assigning
=20=20linux-yocto/3.4: add x32 configuration fragment
=20=20kernel-yocto: fix kernel configuration audit for custom yocto kernels
=20=20linux-yocto: virtio and KVM guest configuration
=20=20linux-yocto/3.4: make uprobes select perf events

Constantin Musca (7):
=20=20autoconf: use --warning=3Dcross only if supported
=20=20boost: upgrade to 1.51.0
=20=20glew: upgrade to 1.9.0
=20=20libexif: upgrade to 0.6.21
=20=20sysstat: upgrade to 10.1.1
=20=20patch.bbclass: Use one TMPDIR per patching process
=20=20patch.bbclass: increase security

Darren Hart (3):
=20=20rt-tests: Update to 0.84, use the kernel.org git repository
=20=20rt-tests: Add hwlatdetect package
=20=20rt: Add hwlatdetect to rt images

Franklin S. Cooper Jr (1):
=20=20u-boot: Use fw_env.config if available.

Jack Mitchell (2):
=20=20git: define NO_PYTHON=3D1 to stop git requiring python as a dependancy
=20=20local.conf.sample: change valgrind support architecture comment

Jackie Huang (2):
=20=20libgnome-keyring: add missing DEPENDS on intltool-native
=20=20quota 4.00: add DEPENDS gettext-native

Kang Kai (9):
=20=20ltp: update
=20=20lsb: update version
=20=20libclass-isa-perl: add it
=20=20perl: package modules Pod-Html and Tie-Hash-NamedCapture
=20=20libpod-plainer-perl: add it
=20=20libdumpvalue-perl: add it
=20=20libenv-perl: add it
=20=20libfile-checktree-perl: add it
=20=20libi18n-collate-perl: add it

Khem Raj (13):
=20=20arch-armv4.inc: On armv4 add --fix-v4bx to linker flags for kernel
=20=20eglibc-2.16: Add kconfig infrastructure
=20=20eglibc: Enable kconfig for option management
=20=20kconfig-frontends: Create symlinks for conf and mconf
=20=20machines/x86: Drop redundant glibc configure knobs
=20=20qemu: Update from 0.15 to 1.2
=20=20qemu-git: Move to tip of git past 1.2 release
=20=20runqemu-internal: New qemu calls it qemu-system-i386 for x86
=20=20gcc-4.7: Fix build for armv4/EABI and ppc/Os
=20=20gcc-4.7: Backport libgcc fixes to appease the new build sequence
=20=20uclibc: Revert systemd regressing patch from upsteam uclibc and uprev =
SRCREV
=20=20runqemu: Explicitly specify MACHINE when calling bitbake
=20=20binutils-2.22: Backport PR fixes from 2.22 branch

Laurentiu Palcu (1):
=20=20nativesdk-qemu: fix SDK relocation issue

Mark Asselstine (1):
=20=20base-files: provide a mechanism to skip creation of the hostname file

Mark Hatle (3):
=20=20image.bbclass: Enable the complementary install to be called w/ =
globbing par
=20=20package_rpm.bbclass: Avoid unnecessary installs in complementary pass
=20=20qt4: Update qt4.inc to remove staticdev deps in -dbg packages

Martin Ertsaas (1):
=20=20gettext: Make gettext 0.16.1 extend native and nativesdk.

Martin Jansa (2):
=20=20pixman: ignore NEON, IWMMXT, LOONGSON_MMI variables for class-native
=20=20eglibc-initial-2.16: add kconfig-frontends-native to depends

Matthew McClintock (2):
=20=20sysvinit-inittab_2.88dsf.bb: only run serial checks at boot if we =
have items
=20=20valgrind_3.7.0.bb: fix missing leading space on _append

Paul Eggleton (7):
=20=20lib/oe/sstatesig.py: add signature data query function
=20=20classes/packageinfo: use better method to check if package exists
=20=20classes/sanity: skip tune checks if machine is invalid
=20=20classes/sanity: remove obsolete code
=20=20gst-fluendo-mpegdemux: add LICENSE_FLAGS
=20=20scripts/combo-layer: use last_revision if specified in init
=20=20scripts/combo-layer: ensure we validate branch/revision on init

Peter Seebach (1):
=20=20pseudo_1.4.1.bb: update to pseudo 1.4.1, fixing 32-bit host problems

Phil Blundell (4):
=20=20perl-native: PROVIDE libmodule-build-perl-native for consistency with =
non-na
=20=20shadow: Fix various invalid assumptions about directory layout
=20=20shadow-native: Ensure that ${sbindir} and ${base_sbindir} are =
respected
=20=20eglibc: Restore ${PN} to before ${PN}-dev in PACKAGES

Richard Purdie (5):
=20=20sstate: Append to EXTRASSTATEMAPS and add comment
=20=20autotools.bbclass: Add functionality to force a clean of ${B} when =
reconfigu
=20=20libgpg-error: Use the source file for the licence checksum
=20=20opkg: Fix package dependency issue for preinsts
=20=20bitbake.conf: Assign SRCPV so that it will be tracked correcting in =
the ssta

Robert Yang (3):
=20=20package_rpm.bbclass: fix the arch (replace "-" with "_")
=20=20bin_package.bbclass: binary package recipe class
=20=20package_rpm.bbclass: fix incremental rpm image generation

Ross Burton (28):
=20=20xserver-xorg-lite: remove
=20=20xserver-xorg: make DRI/GLX options respect opengl distro feature
=20=20packagegroup-core-x11-xserver: remove redundant PACKAGES statement
=20=20webkit-gtk: work around Make bug by re-running make
=20=20telepathy-idle: fix parallel build
=20=20libx11: use INC_PR
=20=20libx11-diet: you can't disable XCB anymore, so don't try
=20=20libx11-diet: you can't disable UDC, because it's always disabled
=20=20xorg-lib: move options to disable documentation to xorg-lib-common
=20=20libx11: move xcms disabling to PACKAGECONFIG in libx11.inc
=20=20libx11: move keysymdefdir option to .inc
=20=20libx11: remove redundant license data
=20=20libx11: merge patches into a single directory
=20=20libx11: refresh dependencies, and centralise into libx11.inc
=20=20libx11: make bigfont an optional (disabled by default) packageconfig =
option
=20=20libx11-diet: remove statements that are redundant
=20=20default-providers: default to libx11, not -trim
=20=20libx11: drop makekeys_crosscompile.patch, effectively merged upstream
=20=20libx11: makekeys can be cross-compiled now, so don't hack around
=20=20libx11-diet: remove un-needed chunk from stubs patch
=20=20libx11: revise keysymdef patch based on submission upstream
=20=20mesa-xlib: remove, it serves no useful purpose
=20=20mesa-dri: remove DEFAULT_PREFERENCE, this is the preferred now
=20=20libx11-trim: remove, it's the same as libx11 now
=20=20connman: remove trailing whitespace
=20=20librsvg: --disable-gnome-vfs doesn't exist anymore, remove
=20=20librsvg: remove spurious popt dependency
=20=20libx11: update patch to a backport from upstream git

Saul Wold (5):
=20=20distrodata: replace Tab with Space
=20=20core-image: allow root login when debug-tweaks is enabled
=20=20Add package wget and perl modules.
=20=20oprofileui: Add Icons to oprofileui-viewer package
=20=20kernelshark: add missing ${D}

Veerabrahmam vr (4):
=20=20qemuimagetest: basic function to check bash exists
=20=20qemuimagetest: add basic function to check enough disk space
=20=20qemuimagetest: add basic function to check syslogd
=20=20qemuimagetest: modifying the scenario file as per new test cases

Vladimir Zapolskiy (6):
=20=20classes/license: define LICENSE_MANIFEST variable
=20=20classes/license: check license manifest for double records
=20=20classes/license: remove redundant nested if statements
=20=20classes/license: account LICENSE_${pkg} values in manifest
=20=20classes/license: correct license info in lisense.manifest
=20=20classes/license: place all found licenses on one line

Zhenhua Luo (1):
=20=20valgrind: fix debug info reading error when do memcheck on ppc targets

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Denis 'GNUtoo' Carikli (1):
=20=20meta-efl: enjoy: fix scrolling

Martin Jansa (8):
=20=20foxtrotgps: upgrade to 1.1.1 and fix build with new automake
=20=20libjpeg: use nasm-native also for target DEPENDS, it's needed for =
targets wi
=20=20pixman: drop patches, merged to oe-core
=20=20evas: move EVAS_CPU_TWEAKS to target EXTRA_OECONF
=20=20libwmf: fix DEPENDS_virtclass-native
=20=20sip-native: inherit qmake2 instead of qt4x11
=20=20mcnavi: add also target edje to DEPENDS
=20=20mcnavi: fix do_configure_prepend to be reentrant

Sander van Grieken (1):
=20=20dnsmasq: add systemd service scripts for dnsmasq

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

Martin Jansa (1):

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-micro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-slugos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nslu2:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Kishore Bodke (1):
=20=20meta-crystalforest: Add Maintainer.

Rahul Saxena (2):
=20=20meta-cedartrail: Add video acceleration
=20=20meta-cedartrail: Update PVR graphics driver to version 1.0.3

Tom Zanussi (4):
=20=20meta-intel: make video acceleration choice dependent on LICENSE_FLAGS
=20=20meta-intel: restore emgd 1.10
=20=20meta-intel: have fri2 and sys940x prefer emgd-1.10
=20=20meta-intel: move emgd-driver-bin_1.14 to xorg-driver/

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-handheld:

Andrea Adami (3):
=20=20linux-yocto: use LZMA for Zaurus collie
=20=20zaurus.inc: fix xserver/mesa virtual providers
=20=20linux-yocto: slob breaks usb networking, use slab

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-opie:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-bug:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-efikamx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix:

Andreas M=C3=BCller (3):
=20=20card-kernel-write.sh: new helper script to write only kernel+modules =
to SDCa
=20=20linux-omap: ADS7846 dejitter / unthrottle
=20=20linux-omap-3.5 / mmc: add sdio interrupt support

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ettus:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-ppc:

Matthew McClintock (11):
=20=20p1022ds.conf: change to use non-lite version of xserver, lite version =
has be
=20=20fsl.conf: using our kernel tree for nativesdk is wrong, remove it
=20=20lxc_0.8.0-rc1.bb: initial add of recipe
=20=20remove use of tags in SRCREV and replace with actual SHAs
=20=20linux-qoriq-sdk.inc: add var to configure build for 64-bit kernel on =
32-bit=20
=20=20add new e6500 based machines (b4860qds and t4240qds)
=20=20Revert "busybox: add fsl customized defconfig"
=20=20boot-format_git.bb: update GPL license to GPLv2 (no actually change =
in licen
=20=20u-boot_git.bb: hack in support for building 32-bit u-boot with 64-bit =
machin
=20=20e6500.inc: force biarch gcc for kernel build
=20=20u-boot_git.bb: u-boot depends on libgcc

Stuart Yoder (1):
=20=20meta-fsl-ppc: lxc: add patch to fix 64-bit lib mount issue

Ting Liu (3):
=20=20add additional u-boot and dts for mpc85xx
=20=20busybox: add fsl customized defconfig
=20=20busybox: add fsl customized defconfig

Zhenhua Luo (2):
=20=20add "CentOS release 5.5 (Final)" into SANITY_TESTED_DISTROS
=20=20add nand u-boot in the default build list for p2041rdb

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-igep:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-netbookpro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-chicken:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-java:

Henning Heinold (1):
=20=20openjdk-6: update to version 1.11.4

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-qt3:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-telephony:

Holger Hans Peter Freyther (2):
=20=20libosmocore: Upgrade to newer version with libosmovty improvements
=20=20openbsc: Improve the init scripts, do not write counters

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

Khem Raj (1):
=20=20recipes: Use 'packagegroup' instead of 'task'

Koen Kooi (9):
=20=20linux-ti33x-psp 3.2: LCD7 A3 support, eMMC cape support, camera cape =
improve
=20=20linux-ti33x-psp 3.2: update to 3.2.25
=20=20linux-ti335x-psp 3.2: mux orientation detect for camera sensor to =
gpio inste
=20=20linux-ti33x-psp 3.2: update to 3.2.28 and add motorcape support
=20=20linux-mainline: update to 3.2.28
=20=20linux-ti33x-psp 3.2: update beaglebone defconfig
=20=20beaglebone-tester: ship testaudio, fix depends
=20=20beaglebone tester: bump SRCREV for FTDI test
=20=20beaglebone-tester: FTDI eeprom test, v2

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Andreas M=C3=BCller (1):
=20=20images: successor of task-xserver is packagegroup-core-x11-xserver

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-browser:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-mono:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-raspberrypi:

Andrei Gherzan (2):
=20=20sdcard_image-rpi: Align SD partition and optimize final SD image
=20=20sdcard_image-rpi: Fix SDIMG_SIZE

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-kde:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Andrei Dinu (2):
=20=20Manual updates to upstream_tracking.inc
=20=20Update to upstream_tracking.inc

Jack Mitchell (1):
=20=20local.conf.sample: change valgrind support architecture comment

Kang Kai (1):
=20=20upstream_tracking: update lsb and ltp

Ross Burton (3):
=20=20distro-tracking: remove libx11-trim
=20=20distro-tracking; remove references to xserver-xorg-lite
=20=20scripts: change default ARM BSP to use xserver-xorg, not -lite

Saul Wold (2):
=20=20poky-tiny: Enable x86-64 to build eglibc correctly
=20=20upstream_tracking: Fix format issues

Tom Zanussi (1):
=20=20yocto-bsp: remove packagegroup-core-tools-profile.bbappend

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

Herb Kuta (9):
=20=20Fix packages names to have the correct PV field
=20=20filecache.bb: Correct dependency names and value of S
=20=20Rename subdirectory containing db8.bb from mojodb to db8
=20=20Improve webos_cmake.bbclass
=20=20webos-image submission: nodejs=3D34,#0.4.12-0webos3
=20=20Fix where webos_system_bus.bbclass installs files
=20=20webos-image submission: nodejs-module-webos-*=3D(various),#2.0.0
=20=20webos-image submission: mojoservicelauncher=3D71,#2.0.0
=20=20enyo-1.0.bb: Inherit from webos_enhanced_submissions

Iyad Qumei (12):
=20=20Implement foundation for adding webkit support.
=20=20Adjust webos image content.
=20=20Merge pull request #10 from ssandela/master
=20=20Manual pull of kimmoleppala-owo-submission_version_fix.
=20=20Merge pull request #9 from timoaarnipuro-owo/lvm2
=20=20Include luna-prefs component to webos-image.
=20=20Upgrade cmake-modules submission id. Cleanup Openwebos content.
=20=20Manually merging pull reques:Open-webOS-DCO-1.0-Signed-off-by: Herb =
Kuta her
=20=20Add db8 recipes to webos-image.     Open-webOS-DCO-1.0-Signed-off-by: =
Iyad Q
=20=20Correct ENYOJS_GIT_REPO link.     Open-webOS-DCO-1.0-Signed-off-by: =
Iyad Qum

Kimmo Leppala (1):
=20=20Update luna-prefs submission

Nitika Korla (1):
=20=20Add receipe for core-apps

Sravan Sandela (1):
=20=20Clean up other packages from this pull request, as they are not     =
needed t

Steve Lemke (2):
=20=20Add bb files for javascript frameworks
=20=20Add javascript framework component info

Suresh Arumugam (1):
=20=20Recipe for App-Services

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Denys Dmytriyenko (1):
=20=20arago.conf: pin down udev version from oe-core, instead of one from =
meta-oe

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-systemd:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-guacamayo:

Ross Burton (3):
=20=20connman: upgrade to 1.5, drop patch, sync with oe-core
=20=20tracker: remove GTK+ dependency
=20=20gst-plugins-good: hack to remove GTK+ dependency

Tomas Frydrych (17):
=20=20guacamayo-session-audioplayer: dump environment for debugging
=20=20linux-raspberrpi bbappend: autoload bcm sound module
=20=20raspberrypi.conf: reduce SD image size to 1GB
=20=20guacamayo-session: move common code into guacamayo-session-common
=20=20guacamayo-session-common: add .this-is-root marker to the root of the =
rootfs
=20=20xserver-nodm-init.bbappend: create .this-is-root marker before session
=20=20tracker: avoid indexing our rootfs if it appears under /media
=20=20task-guacamayo-core: add linux-firmware
=20=20connman: increase the connman password timeout
=20=20connman bbappend: turn wifi on by default
=20=20recipe for guacamayo-cli
=20=20Added guacamayo-cli to the audioplayer session
=20=20Update README.raspberrypi
=20=20pandaboard.conf: added appropriate BBMASK
=20=20s/${GUACABASE}/${COREBASE}/
=20=20pulseaudio: rpi specific config
=20=20Updated README.raspberrypi




