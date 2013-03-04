Received: from new.bec-systems.com ([74.208.70.121] helo=bec-systems.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1UCcs7-0007Pj-13; Mon, 04 Mar 2013 22:24:36 +0100
Received: from oh-69-34-21-229.sta.embarqhsd.net ([69.34.21.229]
	helo=happy.bec-systems.com)
	by bec-systems.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cliff.brake@gmail.com>)
	id 1UCcbx-00021x-2x; Mon, 04 Mar 2013 16:07:55 -0500
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Date: Mon, 04 Mar 2013 21:07:56 GMT
Message-Id: <1362431276730.62853ab6@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
X-Spam_score: -2.9
X-Spam_score_int: -28
X-Spam_bar: --
Subject: OE Changelog since 2013-02-24 until 2013-03-03
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
X-List-Received-Date: Mon, 04 Mar 2013 21:24:37 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2013-02-24 until 2013-03-03.  Projects included in this =
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

Christopher Larson (1):
=20=20cooker: now that we use a Pool, raise the exceptions

Robert Yang (1):
=20=20perforce.py: fix the perforce fetcher

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Andrei Dinu (3):
=20=20e2fsprogs : upgrade to 1.42.7
=20=20dbus-glib : upgrade to 1.100.2
=20=20sudo : upgrade to 1.8.6p6

Bruce Ashfield (8):
=20=20kernel-yocto: respect SRC_URI modified branch selection
=20=20kernel-yocto: allow building from fetcher source dir
=20=20linux-yocto/3.4: remove cedartrail machine
=20=20v86d: compile against userspace safe kernel headers
=20=20kern-tools: import configuration, controls and audit updates
=20=20linux-libc-headers: update to v3.8
=20=20linux-yocto: introduce 3.8 kernel recipe
=20=20linux-yocto: remove 3.0 linux-yocto recipes

Chen Qi (1):
=20=20matchbox-session-sato: do not rdepend on initscripts

Constantin Musca (2):
=20=20augeas: change SRC_URI
=20=20libassuan: upgrade to 2.1.0

Cristian Iorga (4):
=20=20iproute2: upgraded to 3.8.0
=20=20connman: enable connman client
=20=20packagegroup-core-tools-testapps: connman-client added
=20=20minicom: upgrade to 2.6.2

Emilia Ciobanu (2):
=20=20distrodata: added some corner cases for svn and git repos
=20=20remake: added PV to git package recipe

Hongxu Jia (7):
=20=20sstate-cache-management.sh: fix remove duplicate failed when multiple =
archs
=20=20sstate-cache-management.sh:fix the incorrect usage of option `-d'
=20=20sstate-cache-management.sh: don't hardcode available sstate_suffixes
=20=20populate_sdk_base.bbclass:fix toolchain relocation issues
=20=20perl-nativesdk:fix toolchain relocation issues
=20=20package_deb.bbclass:fix the arch (replace "_" with "-") in deb =
package contr
=20=20package_deb.bbclass:fix meta-toolchain-sdk fail on do_populate_sdk

Jason Wessel (1):
=20=20qemu.inc: Non deterministic compile of qemu

Javier Viguera (1):
=20=20base-files: fix 'dash' expanding '\n'

Jeffrey C Honig (1):
=20=20Help ncurses-native find terminfo on RHEL 6

Jessica Zhang (1):
=20=20Add kernel arch variable in SDK environment variable list for =
supporting bui

Kang Kai (5):
=20=20lsbtest: sync test suite packages version
=20=20rootfs_deb: remove run-postinsts from ROOTFS_PKGMANAGE
=20=20rootfs_rpm: move run-postinsts scripts to rpm recipe
=20=20package_rpm.bbclass: name postinst files with package name
=20=20package_rpm.bbclass: add more description for pre/post scriptlets

Khem Raj (2):
=20=20binutils: Fix build with newer texinfo 5.0+
=20=20binutils: Delete recipes for 2.22

Kyle Farnsworth (1):
=20=20insane.bbclass: Merge linux-gnu entries in machine dictionary and add =
sh4 ma

Laurentiu Palcu (2):
=20=20gconf: add patch to remove '+' from invalid characters list
=20=20eglibc: fix ldd RTLDLIST

Mark Hatle (3):
=20=20kernel.bbclass: Add missing modules.order and modules.builtins
=20=20module.bbclass: Create a new depmodwrapper to assist cross-installs
=20=20package_rpm.bbclass: Fix translate_smart_to_oe arch comparison

Martin Donnelly (1):
=20=20shadow: remove grpconv argc check

Martin Jansa (8):
=20=20systemd.bbclass: fix bb.error
=20=20sanity: use lsb distro_identifier
=20=20rm_work: remove package and packages-split dirs
=20=20zip: explictly disable bzip2 support
=20=20sanity.bbclass: always use oe.lsb.distro_identifier method
=20=20bitbake.conf: move PERSISTENT_DIR outside TMPDIR
=20=20eglibc: move RPROVIDES to eglibc-package
=20=20chkconfig-alternatives-native: just append to PROVIDES

MiLo (1):
=20=20util-linux: Add package for libmount

Michael Thalmeier (1):
=20=20python-argparse: add RDEPENDS on python-textutils

Ming Liu (1):
=20=20parted: fix several integer overflows

Muhammad Shakeel (2):
=20=20archiver class: Use tasks with sstate instead of pre/post funcs
=20=20archive-*-source.bbclass: Handle all package classes

Otavio Salvador (1):
=20=20qt4-embedded: Enable Linux Input support

Peter Seebach (2):
=20=20siteinfo/insane: More n32 fixups
=20=20Update pseudo to 1.5.1

Rich Dubielzig (1):
=20=20Add scratch directory for NFS upcall state storage

Richard Purdie (3):
=20=20meta-skeleton: Add example multilib usages
=20=20depmodwrapper-cross: Mark as machine specific
=20=20qemuimage-tests/dmesg: Add exception for error message on qemuarm =
with 3.8 k

Robert Yang (1):
=20=20lttng-ust: cannot find -llttng-ust-tracepoint

Ross Burton (4):
=20=20dbus: set correct address when using --address=3Dsystemd:
=20=20systemd: systemd uses libkmod instead of modprobe, remove dependencies
=20=20weston: add dependency on xkeyboard-config
=20=20weston: recommend some reasonable fonts so the terminal works

Saul Wold (15):
=20=20sqlite: rename version to match upstream versioning change
=20=20mini-x-session: Fix starting of x-session
=20=20nspr: Update to 4.9.5
=20=20socat: Update to 1.7.2.1
=20=20boost: Update to 1.53.0
=20=20man-pages: Update to 3.47
=20=20lsbinitscripts: Update to 9.44
=20=20file: Update to 5.13
=20=20resolvconf: Update to 1.70
=20=20kconfig-frontends: Update to 3.8
=20=20gconf: update to 3.2.6
=20=20connman: add header to define in6_addr
=20=20iproute2: don't use the kernel header tree
=20=20pulseaudio: add config option to ensure valgrind is excluded
=20=20cups: remove old patch files

Tom Zanussi (2):
=20=20systemtap: add python and bash dependencies
=20=20perf: add bash dependency

Wolfgang Denk (1):
=20=20Add KERNEL_EXTRA_ARGS parameter

farrah rashid (1):
=20=20tcp-wrappers: add socklen_t.patch

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Andreas M=C3=BCller (1):
=20=20geany: fix compile by removing extra check for c++ compiler

Chunrong Guo (1):
=20=20lmbench: update config script

Felipe F. Tonello (1):
=20=20macchanger: added 1.5.0 recipe

Jackie Huang (1):
=20=20ebtables: move ebtables-save to sbindir to avoid QA issue

Martin Jansa (1):
=20=20lmbench: use spaces for indentation

Ross Burton (3):
=20=20gthumb: add, taken from oe-core
=20=20clutter-box2d: add, from oe-core
=20=20libgdata: add, from oe-core

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Franklin S. Cooper Jr (16):
=20=20arago.conf: Add sgx MACHINE_FEATURES support
=20=20arago-tisdk-amsdk-sdk-host: Use generic name for sources
=20=20ti-pru-sw-app-loader: Port ti-pru-sw-app-loader from Arago
=20=20ti-pru-sw-edma-library: Port recipe from Arago
=20=20ti-pru-sw-examples: Port PRU SW example from Arago
=20=20packagegroup-arago-tisdk-matrix: Add PRU Matrix demos for am180x-evm
=20=20arago-source-ipk: Enable CREATE_SRCIPK for linux-omapl138-psp recipe
=20=20linux-omapl138-psp_2.6.37: Add sourceipk variables
=20=20arago.conf: Use SDK supported kernel for am180x-evm
=20=20arago.conf: Use SDK support u-boot for am180x-evm
=20=20matrix-gui-apps-git.inc: Add additional Graphics demos
=20=20matrix-gui-3d-demos: Split out Graphics demos
=20=20arm-benchmarks: Package sources for the right architecture.
=20=20nativesdk-packagegroup-arago-sdk-host: Fix No module named distutils
=20=20libav: Remove AC3 and DTS
=20=20linux-am335x: "Add Remove check for GP-only device type in RNG =
driver" patch

Jeff Lance (1):
=20=20arm-benchmarks: Move makefiles into ARCH directory

Michael Tadyshak (1):
=20=20pinmux-utility: Add new Pinmux Utility

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-beagleboard:

Koen Kooi (4):
=20=20linux.inc: package devicetree overlays as well
=20=20linux-mainline 3.8: update to 3.8 final
=20=20linux-mainline 3.8: switch beaglebone to performance governer
=20=20linux-mainline 3.8: fix w1-gpio and cape unloading support

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

Fabio Estevam (2):
=20=20linux-fslc: mxs/defconfig: Select CONFIG_MMC_UNSAFE_RESUME
=20=20linux-fslc (3.8): mxs: Make USB host functional again

Jeremy Stashluk (2):
=20=20gst-fsl-plugin: install pkgconfig file with -dev package
=20=20gst-plugins-gl: machine specific patches

Otavio Salvador (3):
=20=20linux-fslc: Update to 3.8
=20=20amd-gpu-x11-bin-mx51: Use FIXME to mark changes to be done
=20=20imx35pdk: Drop wrong executable attribute

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

John Weber (3):
=20=20linux (3.0.35): Add support for Wandboard-Dual
=20=20u-boot (2009.08): Add support for Wandboard-Dual
=20=20wandboard-dual: Add machine definition

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-ppc:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-guacamayo:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix-community:

Andreas M=C3=BCller (16):
=20=20linux-versions-overo.inc: linux-mainline-3.8 move to stable branch
=20=20linux-mainline-3.8: add OMAP USB Host cleanup series
=20=20linux-mainline-3.8: defconfig alignment
=20=20card-kernel-write.sh: make script work for renamed module tarballs
=20=20linux-omap-3.5/-mainline-3.8: proper handling of missing network =
cable at bo
=20=20linux-mainline-3.8: add AVS (Smartreflex) support
=20=20linux-mainline-3.8: Add 720/800MHz OPP support
=20=20linux-mainline-3.8: disable USB suspend
=20=20linux-mainline-3.8: enable TWL4030 power off
=20=20linux-mainline-3.8: do not soft-reset EHCI USB PHY - it causes 1s =
boot delay
=20=20linux-omap-3.5: do not soft-reset EHCI USB PHY - it causes 1s boot =
delay
=20=20linux-mainline-3.8: remove patch applied mainline
=20=20linux-mainline-3.8: update to 3.8.1
=20=20linux-mainline-3.8: defconfig remove unused SMC91X / PWM backlight
=20=20linux-mainline-3.8: don't set Host as OTG default
=20=20linux-mainline-3.8: add generic TWL reset / madc sequence

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-handheld:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-igep:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Alexandru DAMIAN (1):
=20=20mesa-dri: update preferred version

Kishore Bodke (1):
=20=20romley: add Ivy Bridge support

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

Khem Raj (2):
=20=20layer.conf: Use .=3D for adding to BBPATH and +=3D to BBFILES
=20=20monotools-server: Remove multiline comment

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-netbookpro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nslu2:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-opie:

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

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

Denys Dmytriyenko (1):
=20=20Revert "linux-omap3: Add supported kernel recipe for am37x-evm and =
am3517-ev

Franklin S. Cooper Jr (3):
=20=20linux-omap3: Add supported kernel recipe for am37x-evm and am3517-evm
=20=20linux: Add kernel version 3.3.7 for beagleboard
=20=20machine configs: Add SGX to MACHINE_FEATURES

Hao Zhang (1):
=20=20keystone-evm config: add ubifs support

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

Martin Jansa (3):
=20=20leveldb: Move patch to right directory
=20=20webos: Add Ubuntu 12.10, remove 11.04 from SANITY_TESTED_DISTROS
=20=20webos-image: keyboard-efigs=3D2

Sapna Todwal (1):
=20=20webos-image: webos-connman-adapter=3D5

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Bruce Ashfield (1):
=20=20meta-yocto/linux-yocto: update qemu BSPs to 3.8 kernel

Cristian Iorga (1):
=20=20upstream_tracking.inc: Coonectivity and multimedia packages updates

Elizabeth Flanagan (1):
=20=20poky.conf: Bumping DISTRO/SDK values

Martin Jansa (2):
=20=20poky.conf: update SANITY_TESTED_DISTROS
=20=20poky.conf: update SANITY_TESTED_DISTROS for openSUSE

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:




