Return-Path: <cliff.brake@gmail.com>
Received: from bec-systems.com (u15414263.onlinehome-server.com
	[74.208.70.121])
	by mail.openembedded.org (Postfix) with ESMTP id 8A5156AB7D;
	Mon, 26 Aug 2013 19:21:59 +0000 (UTC)
Received: from oh-67-76-203-50.sta.embarqhsd.net ([67.76.203.50]
	helo=happy.bec-systems.com)
	by bec-systems.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cliff.brake@gmail.com>)
	id 1VE2GK-0005uE-Ne; Mon, 26 Aug 2013 15:15:49 -0400
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Date: Mon, 26 Aug 2013 19:21:33 GMT
Message-Id: <1377544893728.30297646@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
X-Spam_score: -2.9
X-Spam_score_int: -28
X-Spam_bar: --
Subject: OE Changelog since 2013-08-18 until 2013-08-25
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
X-List-Received-Date: Mon, 26 Aug 2013 19:22:00 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2013-08-18 until 2013-08-25.  Projects included in this =
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

Andrei Dinu (1):
=20=20propertydialog.py : Scrollable windows for long tooltips

Cristiana Voicu (1):
=20=20hob: changes to image combo box from image configuration page

Martin Jansa (1):
=20=20parse: Return IOError when including file with absolute path

Nicolas Dechesne (1):
=20=20build.py: create symlink for run.do_xxx scripts

Peter Seebach (1):
=20=20build.py: Provide useful diagnostics when exiting.

Richard Purdie (2):
=20=20event/msg: Add primitive server side UI log record filtering
=20=20prserv/serv: Fix pid file removal

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Andrei Gherzan (2):
=20=20eglibc.inc: Remove quotation marks from OPTION_EGLIBC_NSSWITCH_FIXED_*
=20=20eglibc-options.inc: Fix string options

Bruce Ashfield (2):
=20=20linux-yocto-3.8/meta: update drm and intel power management settings
=20=20linux-yocto-3.8/meta: enable ALTIVEC for qemuppc

Chen Qi (4):
=20=20useradd.bbclass: add missing functions to preinst
=20=20init-install.sh: improve hard drive searching process
=20=20init-install.sh: fix to handle the boot partition correctly
=20=20initscripts: remove obsolete device_table.txt

Chunrong Guo (1):
=20=20genext2fs: fix memory corruption on powerpc

Cristian Iorga (6):
=20=20builder: register directories with pcmanfm
=20=20default-providers: Set the preferred provider for bluez
=20=20packagegroup-self-hosted: Add the sato icon theme
=20=20recipes-graphics/builder: fix wrong user name
=20=20packagegroup-self-hosted: pcmanfm and xdg-utils integration
=20=20xdg-utils: add runtime dependency on xprop

Florin Sarbu (1):
=20=20busybox.inc: Avoid error when SYSLOG is not enabled

Jackie Huang (1):
=20=20texinfo: handle correctly @enumerate specification greater than 10

Joe Slater (2):
=20=20coreutils: add PACKAGECONFIG info for acl support
=20=20coreutils: allow for acl support

Jonathan Liu (3):
=20=20xf86-video-intel: remove duplicate xf86driproto from DEPENDS
=20=20xf86-video-vesa: remove duplicate xf86driproto from DEPENDS
=20=20mesa: enable additional drivers for gallium-llvm x86/x86-64

Kai Kang (3):
=20=20bc: add patch to fix segmentation fault
=20=20libx11: upgrade to 1.6.1
=20=20libx11-diet: upgrade to 1.6.1

Khem Raj (4):
=20=20tune-ppc7400.inc: Add tune file
=20=20qemuppc: Change default tune to 74xx
=20=20uclibc: Upgrade to latest on git
=20=20eglibc: Update SRC_URI and fix unpackaged empty dir

Lauren Post (2):
=20=20directfb: Upgrade to 1.6.3
=20=20directfb: add fusion patch for hangs

Mark Hatle (12):
=20=20prelink: update to latest cross-prelink
=20=20image.bbclass: Add basic support for PACKAGE_EXCLUDE
=20=20python-smartpm: Add support for excluding package from the install
=20=20package_rpm.bbclass:  Add support for PACKAGE_EXCLUDE to RPM installs
=20=20python-smartpm: Add support to disable installing recommends
=20=20package_rpm.bbclass: NO_RECOMMENDATIONS support
=20=20package_deb.bbclass: Use the WORKDIR not SYSROOT for temp files
=20=20package_deb: Add support for NO_RECOMMENDATIONS and PACKAGE_EXCLUDE
=20=20opkg: Add --no-install-recommends option.
=20=20package_ipk: Add support for NO_RECOMMENDATIONS
=20=20opkg: Add support for excluding packages from the install
=20=20package_ipk: Add support for PACKAGE_EXCLUDE

Marko Lindqvist (9):
=20=20glib-2.0: use trim_version() to get the source directory
=20=20pixman: update to upstream version 0.30.2
=20=20curl: update to upstream version 7.32.0
=20=20glib-2.0: update to upstream version 2.36.4
=20=20gtk+: update to upstream version 2.24.20
=20=20gettext: update to upstream version 0.18.3
=20=20texinfo: correct dont-depend-on-help2man.patch
=20=20libsdl2: add recipe
=20=20boost: fix build when PARALLEL_MAKE is not set

Otavio Salvador (3):
=20=20default-distrovars.inc: Add 'DISTRO_FEATURES_DEFAULT' variable
=20=20linux-dtb.inc: Fix dtb generation for kernels newer than 3.8
=20=20distro_features_check.bbclass: Allow checking of required/conflicting =
featur

Paul Eggleton (2):
=20=20tslib: update to 1.1
=20=20gst-plugins-good: fix orc enabling via PACKAGECONFIG

Richard Purdie (31):
=20=20mkfontscale: This no longer needs a full libx11, xproto suffices
=20=20package.bbclass: Fix handling of symlinks in debug packages
=20=20crosssdk: Construct target_exec_prefix from prefix_nativesdk
=20=20populate_sdk_base: Allow sdk tar options to be overridden
=20=20gettext: Improve USE_NLS handling for =
nativesdk/crosssdk/cross-canadian
=20=20libiconv: Extend to nativesdk and support non-linux targets
=20=20gcc-cross-canadian-4.8: Enable PARALLEL_MAKE
=20=20gcc-package-sdk.inc: Use relative symlinks in libexec dir
=20=20gcc-package-sdk.inc: Allow executable extension to be overridden
=20=20gcc-configure-sdk.inc: Don't build target-libgcc
=20=20gcc: Drop gcc-cross4.inc, its pointless now
=20=20gcc-cross-canadian-4.8: Allow elfutils to be a configurable dependency
=20=20gcc-cross-canadian-4.8: Add missing dependency on nativesdk-zlib
=20=20gcc-cross-canadian: Merge 4.7 and 4.8 recipes into common include
=20=20Revert "nativesdk: inherit relocatable"
=20=20bitbake.conf/classes/gcc: Don't hardcode -nativesdk
=20=20gcc-cross: Fold common configuration into gcc-cross.inc
=20=20gcc-cross-initial: Fold common configuration into =
gcc-cross-initial.inc
=20=20gcc-runtime: Fold common configuration into gcc-configure-runtime.inc
=20=20libgcc: Move common code to libgcc.inc
=20=20gcc-target: Combine gcc-target-configure.inc, gcc-target-package.inc =
and oth
=20=20gcc-*-cross.inc: Fold common configuration into gcc-cross.inc
=20=20gcc-*-runtime.inc: Fold configuration into gcc-runtime.inc
=20=20gcc-cross-canadian: Fold configure-sdk and package-sdk into the main =
.inc
=20=20gcc-cross.inc: Clean up after merge
=20=20gcc-common.inc: Drop unused LIBGCCS_VAR variable
=20=20bitbake.conf: Work around dev symlink problems on darwin
=20=20Drop darwin8/darwin9 usage
=20=20chrpath: Add support for relocating darwin binaries
=20=20gcc-4.8: Add two patches to deal with cross-canadian build failures
=20=20sstate: Fix the relative symlink replacement code

Roy.Li (1):
=20=20shadow: backport a patch to make newgrp work

Saul Wold (4):
=20=20cronie: fix out of tree build
=20=20libsdl: Backport xData32 patch for x11 update
=20=20valgrind: Backport patch for eglibc 2.18
=20=20gnupg: Update to 2.0.21

Yang Shi (2):
=20=20Revert "hello-mod: Ensure the produced package name begins with =
kernel-modul
=20=20hello-mod: Add comment for kernel module package naming

Yevhen Kyriukha (1):
=20=20connman: fix systemd support for connman-* packages.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Ciprian Ciubotariu (1):
=20=20libmicrohttpd: bump to version 0.9.27

Jonathan Liu (1):
=20=20llvm: include /usr/lib/libLLVM-*.so in lib package

Marko Lindqvist (2):
=20=20libsdl-image: correct license name to Zlib
=20=20libsdl-mixer: correct license name to Zlib

Paul Eggleton (1):
=20=20tslib: remove

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Graeme Gregory (1):
=20=20angstrom-next: add versions to build for aarch64

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Carlos Hernandez (1):
=20=20busybox: Enable timeout command

Denys Dmytriyenko (3):
=20=20arago-prefs: set old machines to use linux-libc-headers-2.6.37.2 for =
now
=20=20conf/distro: update some pinnings to the current versions
=20=20packagegroup-*-connectivity: disable ti-wifi-utils due to libnl too

Franklin S. Cooper Jr (4):
=20=20branding-amsdk: Set linux-libc-headers to 3.2
=20=20arago-prefs.inc: Set linux-libc-header version to 3.2 for beagleboard
=20=20arago.conf: Separate work directories by linux-libc-headers version
=20=20meta-toolchain-arago: Add in linux-libc-headers version to variable

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-beagleboard:

Koen Kooi (1):
=20=20bone101: bacon cape updates and new demos

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

Eric Nelson (1):
=20=20qt4-embedded: Allow use of Qt Media Player in multi-headed system

Otavio Salvador (4):
=20=20gpu-viv-bin-mx6q.inc: Fix libopencl-mx6 runtime dependency
=20=20linux-imx (3.5.7): Add 3.5.7-1.0.0 alpha kernel
=20=20Rework machines to use dtb file in KERNEL_DEVICETREE variable
=20=20linux-fslc: Update to 3.10 based kernel

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

Otavio Salvador (2):
=20=20m53evk: Remove duplicated setting of U-Boot preferred provider
=20=20Rework machines to use dtb file in KERNEL_DEVICETREE variable

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-ppc:

Ting Liu (1):
=20=20rework machines to use dtb file in KERNEL_DEVICETREE variable

Zhenhua Luo (1):
=20=20coreutils: fix the segfault issue of dd on e500v2 targets

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

Darren Hart (1):
=20=20gummiboot: Update to current HEAD (35+)

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

Florin Sarbu (10):
=20=20procps: Remove from meta-ivi
=20=20fuse: Gemini specification states fuse is now a P2.
=20=20Create gemini-image recipe file.
=20=20packagegroup-core-boot-genivi.bb: Add systemd as init manager.
=20=20poky-ivi-systemd.conf: Correct DISTRO_FEATURES_BACKFILL_CONSIDERED =
for sysvi
=20=20Remove ofono bbapend.
=20=20poky-ivi-systemd.conf: Add pam to DISTRO_FEATURES
=20=20poky-ivi-systemd.conf: Bump DISTRO_VERSION to 5.0
=20=20vexpressa9.conf: Remove machine specific kernel variable.
=20=20README.md: Replace foton info with gemini.

Muhammad Shakeel (1):
=20=20fuse: Remove traditional sysvinit based init script

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
=20=20qt5-5.1.0: Drop negative D_P

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-slugos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-systemd:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-raspberrypi:

Andrei Gherzan (12):
=20=20README: Add info about extra apps / omxplayer
=20=20linux-raspberrypi: Update to 2013-08-20 rpi-3.6.y's and rpi-3.2.27's =
snapsho
=20=20userland: Update to 2013-08-20 master's snapshot
=20=20rpi-config: Update to 2013-08-20 master's snapshot
=20=20rpi-gpio: Update to v0.5.3a
=20=20rpio: Integrate v0.10.0
=20=20mesa: Use libgl from mesa for raspberrypi
=20=20bcm2835: Update to v1.9
=20=20omxplayer: Update to 2013-08-20 master's snapshot
=20=20firmware: Update to 2013-08-20 master's snapshot
=20=20vc-graphics: Remove some useless new lines
=20=20base-files: Remove profile and fstab

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

Martin Jansa (3):
=20=20tslib: rename .bbappend to match new version from oe-core
=20=20meta-shr-distro: drop P_V_tslib, default version is new enough now

Simon Busch (3):
=20=20meta-android: abootimg: add recipe
=20=20meta-android: chroot-script: drop unneeded five seconds sleep
=20=20meta-samsung: linux-samsung-tuna: bump SRCREV to fix runtime problems =
with g

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

Denys Dmytriyenko (1):
=20=20boot-monitor: use commit ID instead of tag, update to latest release

Ian Reinhart Geiser (2):
=20=20formfactor: Fix filespath usage
=20=20xserver-xf86-config: Fix filespath usage

Valentin Cobelea (1):
=20=20recipes-ti: fix warning "variable key FILES_${PN}-dev replaces =
original key"

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

Ed Chejlava (1):
=20=20webos-image: app-services=3D4

Herb Kuta (1):
=20=20Revert "recipes: Replace PR_append with EXTENDPRAUTO_append"

Jonathan Liu (1):
=20=20buildhistory: record removals in buildhistory directory

Mark Bessey (1):
=20=20webos-image: nodejs-module-webos-sysbus=3D28

Martin Jansa (16):
=20=20librolegen: Fix incorrect WEBOS_GIT_TAG value
=20=20mojoservice-frameworks: Fix WEBOS_GIT_TAG
=20=20foundation-frameworks: Fix WEBOS_GIT_TAG
=20=20buildhistory: Change default BUILDHISTORY_DIR to TOPDIR
=20=20buildhistory: use package_qa_handle_error for version-going-backwards
=20=20webos.inc: Prepend scripts directory to PATH
=20=20webos-image: luna-applauncher=3D2,v4.0.0
=20=20webos-image: loadable-frameworks=3D2,v1.0.1
=20=20qt4-webos: Inherit webos_enhanced_submissions
=20=20nodejs: Remove second nodejs recipe and blacklist cloud9
=20=20buildhistory: Record size of installed package not compressed archive
=20=20buildstats-summary: Import from meta-mentor
=20=20webos.inc: Fix KERNEL_IMAGE_BASE_NAME, add MODULE_IMAGE_BASE_NAME
=20=20nyx-utils: Define PREFERRED_VERSION
=20=20isis-project: Inherit webos_enhanced_submissions
=20=20recipes: Replace PR_append with EXTENDPRAUTO_append

Nikolay Orliuk (1):
=20=20base-files: Add bbappend to mount /var/db/temp at tmpfs

Paul Eggleton (3):
=20=20buildhistory: track contents of selected files in images
=20=20buildhistory: split SDK data by IMAGE_NAME
=20=20buildhistory: fix error when no packages are installed

Roger Stringer (1):
=20=20webos-image: DB8=3D79, activitymanager=3D112

Ross Burton (1):
=20=20buildhistory: add a note when committing to buildhistory

seongho.kim (2):
=20=20xulrunner: Add recipe for v3.6.27
=20=20alljoyn: Build a versioned liballjoyn; install additional headers

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

Philip Balister (1):
=20=20linux : Use overrides to prevent global application of =
SRC_URI_appends.

Sipke Vriend (3):
=20=20docs: Correct and add some documentation
=20=20recipes-kernel: Move DTB generation to meta-xilinx
=20=20recipes-kernel:linux-yocto: Move common items to include file.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Cristiana Voicu (1):
=20=20upstream_tracking: add NO_UPDATE_REASON for gawk and pango

Elizabeth Flanagan (1):
=20=20SDK_NAME: Change to include image name and tune arch

Otavio Salvador (1):
=20=20poky.conf: Don't force the addition of extra DISTRO_FEATURES

Ross Burton (5):
=20=20genericx86: add v86d to machine recommends so Vesa framebuffer works
=20=20genericx86: disable USB autosuspend
=20=20poky.conf: add Debian 7.1 to SANITY_TESTED_DISTROS
=20=20linux-yocto: remove genericx86 support from 3.4
=20=20linux-yocto: switch genericx86 to use common-pc

Saul Wold (2):
=20=20maintainers: give guilt-native to Bruce
=20=20upstream_tracking: Update last check dates

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



