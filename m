Return-Path: <cliff.brake@gmail.com>
Received: from bec-systems.com (u15414263.onlinehome-server.com
	[74.208.70.121])
	by mail.openembedded.org (Postfix) with ESMTP id 4BAE36D3DE;
	Mon, 18 Nov 2013 15:57:12 +0000 (UTC)
Received: from oh-67-76-203-50.sta.embarqhsd.net ([67.76.203.50]
	helo=happy.bec-systems.com)
	by bec-systems.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cliff.brake@gmail.com>)
	id 1ViR3h-0000ql-37; Mon, 18 Nov 2013 10:48:26 -0500
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Date: Mon, 18 Nov 2013 15:56:57 GMT
Message-Id: <1384790217561.64470dd@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
X-Spam_score: -2.9
X-Spam_score_int: -28
X-Spam_bar: --
Subject: OE Changelog since 2013-11-10 until 2013-11-17
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
X-List-Received-Date: Mon, 18 Nov 2013 15:57:12 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2013-11-10 until 2013-11-17.  Projects included in this =
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
=20=20toaster: fix tasks showing as NoExec
=20=20toaster: remove author field
=20=20toasterui: mark failed sceneQueue tasks as failed
=20=20toaster: fix path to buildstats file
=20=20cooker, toaster: variable definition tracking

Cristiana Voicu (5):
=20=20toaster: convert build_package size to bytes to keep consistence
=20=20cooker: replace "w" file opening mode with "a" mode
=20=20hob: refresh tables when the user is redirected to Edit packages
=20=20hob/hoblistmodel: check if vals of packages/recipes names are not None
=20=20toaster: task with outcome 2 (sstate), should have sstate_result!=3D0

Paul Eggleton (1):
=20=20cooker: warn if user specifies a target listed in ASSUME_PROVIDED

Trevor Woerner (1):
=20=20newbb.vim: fix spelling

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Bruce Ashfield (5):
=20=20linux-yocto/3.10: meta: ARM: OMAP3: Add USB PHY driver for Beagleboard
=20=20linux-yocto-rt/3.10: fix ntp merge issue
=20=20linux-yocto/3.10: meta: ARM: OMAP3: Add USB PHY driver for Beagleboard
=20=20kernel.bbclass: test for hardlinks before installing
=20=20kernel.bbclass: fix hardlink test

Enrico Scholz (1):
=20=20vala: cleanup DEPENDS

Jackie Huang (2):
=20=20packagegroup-core-basic: define VIRTUAL-RUNTIME_syslog
=20=20autogen-native: remove the unnecessary RDEPENDS

Jeffrey C Honig (1):
=20=20perl: perl-ptest.inc polutes package dependencies when ptest not =
enabled

Khem Raj (2):
=20=20systemd: Upgrade 206 -> 208
=20=20Revert "glib-2.0: Specify libiconv when building on uclibc"

Lei Liu (3):
=20=20image-mklibs: Fix grep pattern when mklibs collects executables in =
rootfs
=20=20mklibs: add dependency on dpkg-native
=20=20gcc-common: Enable building multiarch mips gcc

Ming Liu (1):
=20=20qemu: use PACKAGECONFIG to address xfsprogs dependency

Paul Eggleton (16):
=20=20cmake: upgrade to 2.8.12.1
=20=20nfs-utils: upgrade to 1.2.9
=20=20ethtool: upgrade to 3.12.1
=20=20openssh: upgrade to 6.4p1
=20=20classes/image-empty: remove
=20=20scripts/create-recipe: fix handling of --help
=20=20classes/insane: improve LIC_FILES_CHKSUM messages
=20=20bitbake.conf: remove BOOTSTRAP_EXTRA_* variable defaults
=20=20classes/sanity: validate SDKMACHINE value
=20=20bitbake.conf: remove CPU_FEATURES defaults
=20=20gtk-immodules-cache: fix error message to use correct names
=20=20classes/license: fix comments
=20=20systemd: fix comments
=20=20classes/pkg_distribute: remove
=20=20classes/pkg_metainfo: remove
=20=20classes/license: use "1" to set boolean variables

Phil Blundell (2):
=20=20insane, license: Trap MalformedUrl exceptions when parsing =
LIC_FILES_CHKSUM
=20=20binutils: Add gnu-config-native to DEPENDS

Richard Purdie (6):
=20=20kernel: Use hardlinks during do_install for speed
=20=20lib/oe/path: Fix performance issue got copyhardlinktree()
=20=20lib/oe/path: Fixup handling of .* files in top level paths for =
copyhardlinkt
=20=20kernel: Use hardlinks for do_populate_sysroot for speed
=20=20bitbake.conf: Default DISTRO to nodistro
=20=20staging: Use hardlinking for sysroot_stage_dir

Robert Yang (1):
=20=20e2fsprogs: fix tests/f_extent_oobounds

Ross Burton (6):
=20=20glib-2.0: move more logic to the .inc
=20=20syslinux: add APPEND to dependency list
=20=20freetype: upgrade to 2.5.0.1
=20=20clutter-gtk-1.0: upgrade to 1.4.4
=20=20weston-init: use /run instead of /var/run
=20=20core-image-weston: add SSH and hwcodecs to the image

Roy Li (1):
=20=20elfutils: remove eu-objdump if it does not work

Steve Sakoman (1):
=20=20wpa-supplicant: enable CONFIG_CTRL_IFACE_DBUS_NEW

Tobias Henkel (8):
=20=20icecc: Log reason in error cases
=20=20icecc: Reduce verbosity with empty PARALLEL_MAKE
=20=20icecc: Add blacklist vars to BB_HASHBASE_WHITELIST
=20=20icecc: Add dummy python version of set_icecc_env
=20=20icecc: Enable icecc also for install step
=20=20icecc: Support shell evaluation of KERNEL_CC
=20=20icecc: Add package whitelist
=20=20icecc: Fix race condition when packaging toolchain

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Eric B=C3=A9nard (1):
=20=20cherokee: use cherokee-project.de mirror

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Khem Raj (1):
=20=20arm-defaults.inc: Tweak DEFAULTTUNE with anonymous pything instead of =
overri

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Chase Maupin (4):
=20=20input-utils: Add the input-utils package recipe
=20=20arago-test: Add input-utils to test packages
=20=20linaro-pm-qa-utils: Add utils used by Linaro PM scripts
=20=20arago-test: add linaro-pm-qa-utils to test packages

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-beagleboard:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-browser:

Khem Raj (1):
=20=20nspr: match bbappend with recipe PV in OE-core

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

Javier Viguera (1):
=20=20imx-bootlets: Fix removal of symbolic link in do_deploy

Lauren Post (9):
=20=20u-boot-imx (2013.04): Update 3.10.9-1.0.0 alpha
=20=20linux-imx: Upgrade 3.5.7-1.0.0_alpha to 3.10.9-1.0.0_alpha kernel
=20=20imxdlsabreauto.conf: Add gpmi-weim DTS
=20=20imx6dlsabresd.conf: Add in ldo and hdcp DTS
=20=20imx6qsabreauto.conf: Add gpmi-weim DTS
=20=20imx6qsabresd.conf: Add ldo and hdcp DTS
=20=20imx6slevk.conf: Add ldo device tree
=20=20imx6solosabresd.conf: Add ldo device tree
=20=20fsl-alsa-plugins: Update for 3.10 uapi headers

Otavio Salvador (5):
=20=20fsl-default-providers.inc: Make virtual/kernel assigment delayed
=20=20linux-imx.inc: Drop extra sysroot staging
=20=20linux-fslc: Update to revision 928c8b1
=20=20linux-imx.inc: Remove imx-test specific hack
=20=20gst-fsl-plugin.inc: Add libgstfsl-0.10.so in ${PN}-libgstfsl

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

Mario Domenech Goulart (1):
=20=20linux-wandboard_3.0.35: update to d35902c7

Otavio Salvador (2):
=20=20m28evk: Do not enable GStreamer plugin
=20=20m53evk: Do not enable GStreamer plugin

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

Andrea Adami (12):
=20=20linux-yocto: collie: add platform data for IrDA
=20=20linux-yocto: collie: readd bootblock partition
=20=20linux-yocto-dev: add ipaq h1940 3.12-rc5 patchset
=20=20machine: h1940: switch temporarly to linux-yocto-dev (3.12-rc5)
=20=20linux_3.1: remove, no more machines using it (h1940 is up to 3.12)
=20=20linux-yocto-dev: remove upstreamed sharpsl_param patch
=20=20linux-yocto: collie: add sa1100 framebuffer clock fixup
=20=20linux-yocto: collie: MTD: disable erase suspend on write
=20=20linux-yocto: collie: add pcmcia clock fixes for sa1100
=20=20linux-yocto: collie: add fix for locomo driver
=20=20linux-yocto: collie: properly readd cfi_probe
=20=20linux-yocto-tiny-kexecboot: collie: resync patches with =
linux-yocto_3.10

Linus Walleij (3):
=20=20h3600: add rebased microcontroller patches
=20=20h3600: update defconfig
=20=20h3600: build .tar.gz images too

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-igep:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Nitin A Kamble (8):
=20=20chiefriver: linux-yocto-3.10: update kernel srcrevs
=20=20crownbay: linux-yocto-3.10: update kernel srcrevs
=20=20emenlow: linux-yocto-3.10: update kernel srcrevs
=20=20fri2: linux-yocto-3.10: update kernel srcrevs
=20=20jasperforest: linux-yocto-3.10: update kernel srcrevs
=20=20nuc: linux-yocto-3.10: update kernel srcrevs
=20=20sugarbay: linux-yocto-3.10: update kernel srcrevs
=20=20sys940x: linux-yocto-3.10: update kernel srcrevs

Ong Boon Leong (3):
=20=20meta-crystalforest: update linux-yocto_3.10 SRCREV
=20=20meta-romley: update linux-yocto_3.10 SRCREV
=20=20meta-haswell-wc: update linux-yocto_3.10 SRCREV

Ross Burton (4):
=20=20mesa: remove, mesa-gl is used with EMGD now
=20=20libva-intel-driver: upgrade to 1.2.1
=20=20gstreamer-vaapi: add 0.5.6
=20=20emgd-driver-bin: add missing GLchar typedef to gl2.h

Tom Zanussi (4):
=20=20crownbay: Remove mesa PREFERRED_VERSION
=20=20fri2: Remove mesa PREFERRED_VERSION
=20=20emenlow: Remove mesa PREFERRED_VERSION
=20=20sys940x: Remove mesa PREFERRED_VERSION

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

Holger Behrens (2):
=20=20xserver-xorg: upgrade to 1.14.4
=20=20libical: use recipe added back to oe-core

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

Martin Jansa (1):
=20=20cmake: Rename .bbappend to match new version from oe-core

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-slugos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-systemd:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-raspberrypi:

Alexandru Niculita (5):
=20=20Refactor kernel recipes to reduce code duplication
=20=20Remove tabs from recipe
=20=20Make Linux 3.6 the default for Raspberry Pi
=20=20Add kernel 3.8 and 3.11 for Raspberry Pi
=20=20bcm2835: Update to version 1.32

Andrei Gherzan (13):
=20=20mesa: Modify version to match the one from oe-core
=20=20mesa: Remove egl and gles only for raspberrypi machine
=20=20Merge "mesa: Remove egl and gles only for raspberrypi machine"
=20=20Merge "sdcard_image-rpi.bbclass: Allow optional compression"
=20=20README: Add info
=20=20Merge "README: Add info"
=20=20Merge "README: Fix IMAGE_FSTYPES example"
=20=20Merge "raspberrypi.conf: is not a usb gadget"
=20=20linux-raspberrypi: Update available versions to HEAD
=20=20linux-raspberrypi: Add version 3.10.18 and 3.12.0
=20=20rpi-default-providers: Use 3.10.X as default kernel
=20=20firmware.inc: Update to HEAD on 2013-11-13
=20=20userland: Update to HEAD on 2013-11-13

Dan McGregor (1):
=20=20raspberrypi.conf: is not a usb gadget

Paul Barker (2):
=20=20sdcard_image-rpi.bbclass: Allow optional compression
=20=20README: Fix IMAGE_FSTYPES example

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

Denys Dmytriyenko (1):
=20=20layer.conf: revert previous prepending to BBPATH change

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

DongHeon Jang (1):
=20=20webos-image: activitymanager=3D118

Ed Chejlava (1):
=20=20webos-image: upstart=3D1.10

Gayathri Srinivasan (1):
=20=20webos-image: pmklogd=3D15-r3

Herb Kuta (2):
=20=20base-files: Create pre-installed catalog apps directory
=20=20webos-filesystem-paths: Add locations of fonts and SmartKey data

Hongjeon Ha (3):
=20=20webos-image: pmloglib=3D44
=20=20webos-image: pmlogdaemon=3D113
=20=20webos-image: pmloglib=3D45

Iyad Qumei (2):
=20=20packagegroup-webos-extended: Drop WEBOS_MISSING_FROM_RDEPENDS
=20=20packagegroups-webos-{extended,test}: Move binutils to developer image

Keith Derrick (1):
=20=20webos-image: luna-service2=3D161

Mark Bessey (1):
=20=20webos-image: mojoservicelauncher=3D79

Martin Jansa (2):
=20=20base-files: Create webos_cryptofsdir
=20=20webos-image: parted=3D0

Nikolay Orliuk (1):
=20=20webos-image: Install all tzdata packages

Susan Montooth (1):
=20=20Revert "webos-image: pmloglib=3D44"

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

Sipke Vriend (1):
=20=20recipes-devtools:qemu Update qemu recipe version to match upstream.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Bruce Ashfield (1):
=20=20meta-yocto-bsp: update SRCREVs for 3.10.17 and beagleboard fixes

Olof Johansson (1):
=20=20poky.conf: add Debian 7.2 to SANITY_TESTED_DISTROS

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



