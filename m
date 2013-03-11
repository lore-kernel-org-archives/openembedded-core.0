Received: from new.bec-systems.com ([74.208.70.121] helo=bec-systems.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1UF5GG-0003Th-6Y; Mon, 11 Mar 2013 17:07:42 +0100
Received: from oh-69-34-21-229.sta.embarqhsd.net ([69.34.21.229]
	helo=happy.bec-systems.com)
	by bec-systems.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cliff.brake@gmail.com>)
	id 1UF4zi-0002Yv-6W; Mon, 11 Mar 2013 11:50:37 -0400
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Date: Mon, 11 Mar 2013 15:50:51 GMT
Message-Id: <1363017051257.cab1597b@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
X-Spam_score: -0.2
X-Spam_score_int: -1
X-Spam_bar: /
Subject: OE Changelog since 2013-03-03 until 2013-03-10
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
X-List-Received-Date: Mon, 11 Mar 2013 16:07:47 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2013-03-03 until 2013-03-10.  Projects included in this =
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

Martin Jansa (1):
=20=20siggen: add quotes around variable values to see whitespace

Richard Purdie (2):
=20=20Revert "cooker: now that we use a Pool, raise the exceptions"
=20=20Revert "cooker: parse using bb.compat.Pool"

Robert Yang (1):
=20=20bitbake-layers: fix duplicated help info

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Andreas Oberritter (4):
=20=20qt4.inc: package keyboard drivers
=20=20libpcap: fix description variable
=20=20strace: fix kernel release string parsing
=20=20libsoup-2.4: make libsoup-gnome optional

Andrei Dinu (2):
=20=20libpng : update to 1.60.0
=20=20sudo : upgrade to 1.8.6p7

Bj=C3=B6rn Stenberg (4):
=20=20ptest: Move ptest checks from recipes to ptest.bbclass
=20=20dbus: Use new _ptest functions
=20=20glib: Use new _ptest functions
=20=20bash: Use new _ptest functions

Bogdan Marinescu (5):
=20=20lttng: updated lttng-ust and lttng-modules to 2.1.1
=20=20gmp: updated to 5.1.0a
=20=20libtimedate-perl: updated to 2.30
=20=20git: updated to 1.8.1.4
=20=20gmp: fix missing PR after update to 5.1.0a

Chase Maupin (1):
=20=20soc-family: fix SOC_FAMILY override order

Chen Qi (5):
=20=20populate-volatile.sh: add ROOT_DIR variable to support running at =
rootfs tim
=20=20populate-volatile.sh: improve the handling of link config items
=20=20populate-volatile.sh: remove trailing whitespaces
=20=20image.bbclass: add a hook funtion to support readonly rootfs
=20=20core-image.bbclass: support read-only rootfs

Constantin Musca (8):
=20=20apt: upgrade to 0.9.7.7
=20=20gpgme: upgrade to 1.4.0
=20=20ethtool: upgrade to 3.8
=20=20puzzles: upgrade to 9765
=20=20buildhistory.bbclass: add support for SRCREV logging
=20=20libgpg-error: upgrade to 1.11
=20=20package_deb.bbclass: set DPKG_ARCH_arm to "armel"
=20=20apt-native: fix checksums

Cristian Iorga (2):
=20=20connman: upgrade to 1.12
=20=20connman: Wired inteface provisioned via qemu

Denys Dmytriyenko (2):
=20=20tune-cortexa15: add tunes for ARM Cortex-A15
=20=20tune-cortexa7: add tunes for ARM Cortex-A7

Emilia Ciobanu (1):
=20=20btrfs-tools: added PV to git package recipe

Hongxu Jia (1):
=20=20sanity.bbclass:check if necessary to add march to BUILD_CFLAGS

Jackie Huang (1):
=20=20apr: add libtool to SSTATE_SCAN_FILES

Jeffrey C Honig (1):
=20=20Resolve sysvinit and util-linux conflicting man pages.

Kang Kai (3):
=20=20opkg: save output of postinst scripts when image first boot
=20=20dpkg: save output of postinstall scripts when image firstboot
=20=20rpm: save output of postinstall scripts when image first boot

Khem Raj (2):
=20=20iproute2: Fix build failure on ppc
=20=20qemu: Upgrade to 1.4.0 release

Koen Kooi (1):
=20=20mkefidisk.sh: Cope with translations and modelnames with 'Disk' in it.

Laurentiu Palcu (2):
=20=20sstate.bbclass: consider postinstall dependencies too
=20=20adt-installer: remove patches and .pc directories from the shipped =
tarball

Leonardo Sandoval (1):
=20=20sstate.bbclass: Enclose sstate search parameter with quotes

Martin Donnelly (1):
=20=20shadow: add build dependency on shadow-native

Martin Jansa (4):
=20=20kernel: extract functions for kernel modules to separate bbclass
=20=20avahi: move systemd support where it belongs
=20=20kernel-module-split: append space to RDEPENDS
=20=20tune-cortexa*: Fix TUNE_FEATURES and PACKAGE_EXTRA_ARCHS for thf-neon

Matthew McClintock (4):
=20=20gcc-common.inc: handle case where tune is not defined
=20=20libpfm4_4.3.0.bb: use compatible host to limit arches
=20=20oprofile: update patch for powerpc64
=20=20kernel-arch.bbclass: don't pass extra args to KERNEL_{CC, LD, AR}

Olivier Guiter (1):
=20=20Near Field communication recipe for neard 0.9

Paul Eggleton (1):
=20=20dropbear: update patch upstream status

Richard Purdie (13):
=20=20package_rpm.bbclass: Optimise per file dependency handling
=20=20recipes: Fix ALLOW_EMPTY with no package specified
=20=20buildhistory: Allow the version backwards check to be disabled
=20=20documentation: Fix P entry
=20=20sstate: Add gtk-update-icon-cache-native to postinst recipes list
=20=20populate_sdk_base/image: Fix races for variable mappings
=20=20alsa-utils: Remove bogus comment
=20=20package.bbclass: Fix do_package variable dependencies
=20=20package.bbclass: Ensure all .so files get stripped
=20=20packagegroup: Set ALLOW_EMPTY on a per package basis
=20=20insane.bbclass: Add ALLOW_EMPTY to list of package specific variables
=20=20slang: Fix .debug packaging warning after debug striping was fixed
=20=20gtk-doc: Fix B verses S issues

Robert Yang (3):
=20=20avahi: fix installed but not shipped warning
=20=20bitbake.conf: add STAMPS_DIR for constructing STAMP
=20=20bitbake-whatchanged: print what is about to happen

Ross Burton (13):
=20=20gtk-update-icon-cache-native: add
=20=20default-providers: add default virtual provider for =
gtk-update-icon-cache
=20=20gtk+: mark as provider of virtual/gtk-update-icon-cache-native
=20=20gtk-icon-cache: use virtual/gtk-update-icon-cache-native instead of =
gtk+-nat
=20=20systemd: make gcrypt support (for signing the journal) optional
=20=20systemd: remove unused cached configure variables
=20=20systemd: remove --with-distro option, it's not used
=20=20systemd: set the location of the kill binary
=20=20pulseaudio: rationalise existing configuration using PACKAGECONFIG
=20=20pulseaudio: respect the systemd DISTRO_FEATURE
=20=20consolekit: make policykit an option, and disable by default
=20=20gconf: make polkit an option, and disable by default
=20=20base.bbclass: don't backfill features that already exist

Ting Liu (1):
=20=20iproute2: Fix build failure on ppc64

Tom Zanussi (4):
=20=20sysprof: upgrade to 1.2.0
=20=20perf: disable PARALLEL_MAKE
=20=20perf: rename perf.inc to perf-features.inc
=20=20perf: rename perf_3.4 to perf

yanjun.zhu (1):
=20=20Python: Fix for CVE-2012-2135

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Jack Mitchell (1):
=20=20hiawatha: update to 8.8.1

Jackie Huang (1):
=20=20modphp5: use ${baselib} instead of hardcoded "lib"

Martin Jansa (3):
=20=20meta-systemd: restore wpa-supplicant bbappend
=20=20meta-efl: set ALLOW_EMPTY only for PN
=20=20gpsd: fix udev rules file

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Koen Kooi (1):
=20=20task-angstrom-e: fix ALLOW_EMPTY declaration

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Franklin S. Cooper Jr (9):
=20=20arago-source-ipk.conf: Adjust sourceipk for omap3 kernels
=20=20linux-omap-psp_2.6.37: Add Arago specific appends
=20=20u-boot_2010.12-psp03.21.00.04.sdk: Set sourceipk variables
=20=20u-boot_2012.04.01: Set variables for sourceipk
=20=20linux_3.3.7: Set sourceipk variables
=20=20arago.conf: Set PREFERRED_PROVIDER and VERSION for omap3 devices
=20=20arago.conf: Enable white list gst-ffmpeg
=20=20arago-source-ipk.conf: Remove linux-stable and use linux
=20=20package-group-arago-gst: Add back gst-ffmpeg

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-beagleboard:

Koen Kooi (5):
=20=20u-boot: add 2013.01 u-boot based on denx' upstream
=20=20beaglebone/ti33x: prefer u-boot-denx recipe over generic u-boot recipe
=20=20beaglebone: add kernel-devicetree-overlays to =
MACHINE_ESSENTIAL_EXTRA_RDEPEN
=20=20linux-mainline 3.8: update to 3.8.2
=20=20linux-mainline 3.8: fix MUSB patches to apply

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-browser:

Andreas M=C3=BCller (1):
=20=20nspr: follow oe-core to 4.9.5

Eric B=C3=A9nard (1):
=20=20chromium: fix DEPENDS

Laurentiu Palcu (1):
=20=20chromium: add support for x86-64

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
=20=20linux-imx (2.6.35): mxs: Update to 1.1.0 BSP release

Eric BENARD (1):
=20=20imx-test: fix ALLOW_EMPTY error

John Weber (1):
=20=20imx-base: add imx6dl mapping for firmware

Otavio Salvador (5):
=20=20linux-fslc: Update to 3.8.2 stable release
=20=20image_types_fsl.bbclass: Fix deploy of mxsboot-sdcard image
=20=20u-boot-fslc: mx28: Align DDR2 init with FSL bootlets source
=20=20linux-imx (2.6.35.3): Enable cpufreq support for i.MX28 EVK
=20=20linux-fslc: Ensure we have the GIT hash in kernel version

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-ppc:

Chunrong Guo (2):
=20=20remove images folder
=20=20lio-utils: add tcm_start.sh and lio_start.sh to rootfs

Ting Liu (4):
=20=20remove lm_sensor as it is already in meta-oe
=20=20qemu: configure properly check if -lrt is needed
=20=20sysvinit: remove SDK specific bits
=20=20procps: remove customized sysctl.conf which is SDK specific

Zhenhua Luo (2):
=20=20Remove DSTRO string from PR due to meta-fsl-ppc is not distro specific
=20=20Revert "Remove recipes-append folder which are SDK specific"

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-guacamayo:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix-community:

Andreas M=C3=BCller (1):
=20=20linux-mainline-3.8: update to 3.8.2

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-handheld:

Andrea Adami (3):
=20=20linux-yocto-tiny-kexecboot_3.2: set CONFIG_CRAMFS=3Dy for Zaurus
=20=20linux-yocto(-tiny-kexecboot)_3.2: Zaurus collie MTD fixes
=20=20zaurus.inc: reflect packaging changes of mtd-utils

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-igep:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Darren Hart (1):
=20=20netbase: Use machine override for netbase genmac dependency

Nitin A Kamble (28):
=20=20sys940x: use EMGD version 1.16 instead of 1.14
=20=20remove the older 1.14 version emgd-driver-bin recipe
=20=20sugarbay: linux-yocto-dev recipe extension
=20=20jasperforest: linux-yocto-dev recipe extension
=20=20nuc: linux-yocto-dev recipe extension
=20=20chiefriver: linux-yocto-dev recipe extension
=20=20emenlow: linux-yocto-dev recipe extension
=20=20fri2: linux-yocto-dev recipe extension
=20=20crownbay: linux-yocto-dev recipe extension
=20=20sys940x: linux-yocto-dev recipe extension
=20=20chiefriver: linux-yocto_3.8 recipe extension
=20=20crownbay: linux-yocto_3.8 recipe extension
=20=20emenlow: linux-yocto_3.8 recipe extension
=20=20fri2: linux-yocto_3.8 recipe extension
=20=20nuc: linux-yocto_3.8 recipe extension
=20=20sugarbay: linux-yocto_3.8 recipe extension
=20=20sys940x: linux-yocto_3.8 recipe extension
=20=20jasperforest: linux-yocto_3.8 recipe extension
=20=20chiefriver: move BSP to the v3.8 kernel
=20=20crownbay crownbay-noemgd: move BSPs to the v3.8 kernel
=20=20emenlow emenlow-noemgd: move BSPs to the v3.8 kernel
=20=20fri2 fri2-noemgd: move BSPs to the v3.8 kernel
=20=20jasperforest: move BSP to the v3.8 kernel
=20=20nuc: move BSP to the v3.8 kernel
=20=20sugarbay: move BSP to the v3.8 kernel
=20=20sys940x sys940x-noemgd: move BSPs to the v3.8 kernel
=20=20gst-va-intel: avoid warning regarding ALLOW_EMPTY
=20=20fri2-noemgd: use fbdev X driver

Richard Purdie (1):
=20=20meta-tlk: Update bbappend to 3.8

Tom Zanussi (1):
=20=20va-intel: set ALLOW_EMPTY on a per-package basis

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

Florin Sarbu (8):
=20=20pulseaudio: Update .bbappend to match poky 3.0 version
=20=20linux-yocto_3.0.bbappend: Removed this obsolete .bbappend
=20=20Add obex recipe from meta-openembedded
=20=20fuse: Add recipe from meta-openembedded
=20=20libical: Add recipe from meta-openembedded
=20=20connman: Update .bbappend to version 1.12
=20=20Remove ALLOW_EMPTY from packagegroups files.
=20=20README.md: Remove reference to meta-openembedded,     which is not =
used anym

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-java:

Henning Heinold (3):
=20=20openjdk6: update 1.11 release to 1.11.9
=20=20openjdk7: get icedtea version from recipe name like openjdk6
=20=20images: add a java test images which includes jre-versions 6 and 7

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-kde:

Koen Kooi (3):
=20=20packagegroup-kde-apps: remove multiline comment
=20=20ark, gwenview: fix RDEPENDS
=20=20README: update contributor list

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

Koen Kooi (1):
=20=20various: fix pkg_postinst/rm to be package specfic

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-qt3:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-slugos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-systemd:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-raspberrypi:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

Martin Jansa (2):
=20=20meta-fso, meta-shr: set ALLOW_EMPTY only for PN

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

Denys Dmytriyenko (12):
=20=20linux-ti-staging: add recipe for tracking TI latest staging tree
=20=20u-boot 2012.10: add the latest SDK 05.06 version from meta-arago
=20=20u-boot: add latest mainline release 2013.01.01
=20=20linux-omap: replace use of FILESPATHPKG with FILESEXTRAPATHS
=20=20multi-kernel: match oe-core for MODULE_IMAGE_BASE_NAME, set it =
conditionally
=20=20tune-cortexa{15,7}: update tunes files with recent changes in oe-core
=20=20linux-omapl138: correct recipe's DESCRIPTION
=20=20omap3, am37x, am3517, beagleboard: unify and cleanup configs
=20=20ti33x, am335x, beaglebone: unify and cleanup configs
=20=20omap4, pandaboard: unify and cleanup configs
=20=20keystone: unify and cleanup configs
=20=20am180x: cleanup machine config, remove common SoC settings

Robert P. J. Day (1):
=20=20u-boot: unify denx.de SRC_URIs to match all others

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

Ed Chejlava (1):
=20=20let <new>-initscripts replace webos-initscripts

Herb Kuta (1):
=20=20webos-preferred-versions: Keep the lists in alphabetical order

Maksym Sditanov (1):
=20=20Fix db8 recipe when it compiles with tests

Steve Lemke (2):
=20=20Enable overriding of default (emulator) resolution
=20=20Fix overriding of default (emulator) resolution

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

Elvis Dowson (1):
=20=20linux-xilinx-3.3: Refactor the recipe to reorganize the location of =
FILESPAT

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Constantin Musca (1):
=20=20upstream_tracking: update no-upgrade reasons

Ross Burton (1):
=20=20xserver-xf86-config: atom-pc doesn't need a xorg.conf

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:




