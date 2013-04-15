Received: from new.bec-systems.com ([74.208.70.121] helo=bec-systems.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1URlt4-0003JW-Ly; Mon, 15 Apr 2013 18:04:27 +0200
Received: from oh-69-34-21-229.sta.embarqhsd.net ([69.34.21.229]
	helo=happy.bec-systems.com)
	by bec-systems.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cliff.brake@gmail.com>)
	id 1URlab-000106-5s; Mon, 15 Apr 2013 11:45:08 -0400
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Date: Mon, 15 Apr 2013 15:46:31 GMT
Message-Id: <1366040791003.e0947bfe@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
X-Spam_score: -2.9
X-Spam_score_int: -28
X-Spam_bar: --
Subject: OE Changelog since 2013-04-07 until 2013-04-14
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
X-List-Received-Date: Mon, 15 Apr 2013 16:04:30 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2013-04-07 until 2013-04-14.  Projects included in this =
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

Cristian Iorga (1):
=20=20bitbake:hob: use a socks proxy mechanism for git

Ioana Grigoropol (1):
=20=20hob:Only display scrolled list of images if needed

Mark Hatle (1):
=20=20data.py: Add a warning when expandKeys overwrites an existing key

Richard Purdie (2):
=20=20Update to version 1.18.0
=20=20Update to version 1.19.0 for master

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Alexandru DAMIAN (2):
=20=20bluez4: add readline dependency
=20=20qemu script: explicitly set 32 bit depth for x86-64

Bj=C3=B6rn Stenberg (1):
=20=20ptest bug fixes

Bogdan Marinescu (1):
=20=20smart: disable CHANNELSDIR

Bruce Ashfield (9):
=20=20linux/yocto: update AUTOFS configuration
=20=20linux-yocto/3.8: fix atom-pc config audit warnings
=20=20linux-yocto/3.8: atom-pc: Update atom-pc-preempt-rt.scc to reuse =
config from
=20=20kern-tools: fix excluded configuration processing
=20=20linux-yocto/3.8: aufs, config processing, tiny, mips boot fixes
=20=20linux-yocto/3.8: qemumips graphical boot
=20=20linux-yocto/3.8: qemumips boot fixes and netfilter kernel features
=20=20kern-tools: fix conditional configuration items
=20=20kern-tools: fix non-local patch/config location

Erik Bot=C3=B6 (2):
=20=20systemd: Fix path to systemd-analyze so it end up in the right =
package.
=20=20systemd: Fix path to systemd-analyze so it end up in the right =
package.

Henning Heinold (1):
=20=20qemu: define fdt_t types in libfdt_env.h from qemu

Holger Hans Peter Freyther (1):
=20=20systemd: Set the default firmware path to enable firmware loading in =
udev

Hongxu Jia (2):
=20=20package_rpm.bbclass: fix build multilib image failed when PR Server =
enabled
=20=20package_rpm.bbclass: fix build multilib image failed when PR Server =
enabled

Ioana Grigoropol (1):
=20=20tcf-agent: Use kill instead of killproc to stop agent

Kang Kai (2):
=20=20libpng12: rename libpng_1.2.50 to libpng12
=20=20libpng12: remove prefer version and add it to lsb packagegroup

Khem Raj (1):
=20=20kernel.bbclass: Optionally create lib dir during deploy

Laurentiu Palcu (6):
=20=20image.bbclass: fix postinstall intercepts fallback
=20=20gtk-update-icon-cache-native: create wrapper script
=20=20rpm: fix RDEPENDS
=20=20postinst-intercepts, qemu.bbclass: fix segfaults in postinstalls
=20=20dpkg, opkg, rpm-postinst: fix overwriting the run-postinstall script
=20=20opkg.inc: don't hardcode /var/lib/opkg

Mark Hatle (1):
=20=20hello-mod: Ensure the produced package name begins with kernel-module-

Martin Jansa (4):
=20=20layer.conf: add systemd-serialgetty to SIGGEN_EXCLUDERECIPES_ABISAFE
=20=20tinylogin: Fix mix of tabs and spaces for SRC_URI indentation
=20=20icecc: Allow to use this bbclass together with external toolchains
=20=20icecc: Allow to use this bbclass together with external toolchains

Michel Thebeau (2):
=20=20kernel.bbclass: do_sizecheck: update path to build image and do not =
delete
=20=20kernel.bbclass: do_strip: allow recipes to strip the kernel

Nathan Rossi (1):
=20=20insane.bbclass: Updated MicroBlaze machine definitions

Otavio Salvador (1):
=20=20base.bbclass: Fix matching of MACHINEOVERRIDES in COMPATIBLE_MACHINE

Paul Eggleton (11):
=20=20scripts/oe-pkgdata-util: find complementary packages for split =
packages
=20=20classes/buildhistory: fix interaction with rm_work
=20=20meta/recipes.txt: add recipes-lsb4
=20=20meta-*/conf/layer.conf: tweak BBFILES comment
=20=20classes/license: remove outdated comment
=20=20rpm-postinsts: don't create broken postinst script
=20=20rpm-postinsts: avoid errors during boot with read-only-rootfs enabled
=20=20initscripts: fix read-only-rootfs-hook.sh to avoid using unionfs
=20=20initscripts: fix read-only-rootfs-hook.sh to start earlier
=20=20dpkg, opkg, rpm-postinsts: avoid repackaging when changing =
IMAGE_FEATURES
=20=20classes/sanity: fix handling of bblayers.conf updating

Peter Kjellerstedt (2):
=20=20oe-buildenv-internal: Only add to $PATH if needed
=20=20oe-buildenv-internal: Only add to $PATH if needed

Radu Moisan (3):
=20=20openssl: Upgrade to v1.0.1e
=20=20udev: Move udevd back to /sbin
=20=20systemd: use update-alternatives.bbclass

Richard Purdie (9):
=20=20qemu: Add backported patch to address random segfaults
=20=20qemuimagetest/scenario: Move dmesg to end of test run
=20=20initrdscripts: Add udev sbin based libexec path
=20=20qemu: Fix typo in patch header
=20=20oprofile: Add Upstream-Status and description to patch
=20=20gdk-pixbuf: Fix libpng determinism issues
=20=20multilib.conf: Workaround opkg multilib issues
=20=20package/image.bbclass: Fix multilib rprovides

Ross Burton (12):
=20=20systemd.bbclass: restart service in postinst, not start
=20=20update-rc.d: correctly look up the initscript params with overrides
=20=20pulseaudio: remove spurious cd in do_compile_prepend
=20=20sudo: handle glibc 2.17 crypt semantics
=20=20systemd: use ${BPN} instead of ${PN} in FILES
=20=20util-linux: use $PN in SYSTEMD_PACKAGES
=20=20xmodmap: fix compile with gcc 4.8
=20=20sudo: update crypt.patch to use backport from upstream
=20=20wayland: only build the scanner in wayland-native
=20=20mesa-demos: fix build with non-Mesa GL stacks
=20=20systemd: move the binaries to /sbin/systemd
=20=20initrdscripts: look for new systemd-udevd location

Saul Wold (5):
=20=20alsa-tools: Fix sys/io.h patch
=20=20udev: fix init script for the location of udevd
=20=20busybox: fail on no media
=20=20udev: Update initscript to check for devtmpfs
=20=20udev-extraconf: Add -o silent to auto mount for mount.util-linux

Tom Zanussi (1):
=20=20gst-ffmpeg: fix --disable-yasm

Zhenhua Luo (1):
=20=20wayland: add necessary dependencies to fix build error

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Andreas M=C3=BCller (6):
=20=20exo: create a package for exo-csource - it is not required on target
=20=20exo: remove gnome-mount wrapper
=20=20xfce4-datetime-plugin: update to 0.6.2
=20=20xfdesktop: update to 4.10.2
=20=20midori: update to 0.5.0
=20=20pngcheck initial add 2.3.0

Apelete Seketeli (1):
=20=20ttf-inconsolata: add LIC_FILES_CHKSUM variable

Jason Kridner (1):
=20=20cloud9: add EnvironmentFile

Khem Raj (2):
=20=20Delete systemd class.
=20=20meta-systemd: Append ${PN} to SYSTEMD_SERVICE

Koen Kooi (3):
=20=20nodejs: add 0.8.18
=20=20cloud9: add autorestart on crash
=20=20cloud9 bbappend: add EnvironmentFile

Marcin Juszkiewicz (1):
=20=20libvpx: do not hardcode -mfloat-api=3Dsoftfp for ARM builds

Martin Jansa (13):
=20=20meta-efl: upgrade efl to 1.7.6, e-wm to 0.17.2, terminology to 0.3.0
=20=20evas: upgrade to 1.7.6.1 and drop applied patch
=20=20e-wm: upgrade to 1.17.2.1 which correctly sets relname
=20=20Revert "cloud9: add EnvironmentFile"
=20=20icon-slicer: remove gtk+-native dependency from native build
=20=20nodejs: remove older 0.6.21
=20=20meta-systemd: drop default SYSTEMD_PACKAGES =3D "${PN}"
=20=20meta-systemd: move cronie to oe-core subdirectory
=20=20meta-systemd: bump PRINC in all .bbappends
=20=20meta-systemd: Add not only RPROVIDES, but also RREPLACES/RCONFLICTS
=20=20live555: Add MIRROR for older versions
=20=20evas-1.7.6.1: Update checksums, tarball was repackaged upstream :/
=20=20python-vobject: fix LICENSE format

Nicolas Dechesne (1):
=20=20gupnp: remove dependency on gnome-icon-theme

Paul Barker (2):
=20=20fbset: Replace deprecated update-alternatives syntax
=20=20gd: Add mirror for when libgd.org is down

Paul Eggleton (3):
=20=20icon-naming-utils: remove
=20=20libmad: remove
=20=20packagegroup-qte-toolchain-target: remove bbappend content

Philip Balister (2):
=20=20uhd : Update to version 3.5.2.
=20=20gnuradio : Update to version 3.6.4.1.

Samuel Stirtzel (2):
=20=20maliit-framework: fix for Qt applications
=20=20maliit-framework: enable autostart

dv@pseudoterminal.org (1):
=20=20add recipe for mpg123, a decoder for MPEG-1 layer 1, 2, and 3

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Denys Dmytriyenko (3):
=20=20arago.conf: double hardcoded devkit path, 128 is not enough sometimes
=20=20arago.conf: split extending sdk path name into 2 levels
=20=20arago.conf: qt-tools/qconf has a max path limit of 256+12

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-beagleboard:

Koen Kooi (12):
=20=20linux-mainline 3.8: more patches for factory beaglebone tester
=20=20linux-mainline 3.8: fix build in with overly long paths
=20=20dtc: add bbappend to update to latest git and add DT overlay support
=20=20contrib: bone-flash-tool: add fs tweaks
=20=20u-boot-denx 2013.04-rc1: add patch to fix screen rolling when the ARM =
is loa
=20=20u-boot-denx 2013.04-rc1: use 400MHz DDR3 timings on BeagleBoneBlack
=20=20linux-mainline 3.8: add pwm-test patches and sync tester DT
=20=20linux-mainline 3.8: really fix tester
=20=20linux-mainline 3.8: fix hexy OLED and add dtbo files for PWMs
=20=20contrib: bone-flash-tool: add wallpaper branding
=20=20u-boot-denx 2013.04-rc1: fix beaglebone DDR3 timings and update to =
latest u-
=20=20u-boot: set DDR3 clock back to 303MHz for boneblack

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-browser:

Koen Kooi (1):
=20=20chromium 24.0.1312.52: add launch helper and .desktop file

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

Daiane Angolini (7):
=20=20imx-test: Include version 2.6.35.3-1.1.0 support
=20=20libfslcodec: Add .inc file in order to reuse code
=20=20libfslcodec: Add version 3.0.6
=20=20libfslparser: Add .inc file in order to reuse code
=20=20libfslparser: Add version 3.0.6
=20=20gst-fsl-plugin: Add 3.0.6 version
=20=20imx28evk: Set MACHINE_GSTREAMER_PLUGIN as gst-fsl-plugin

Otavio Salvador (10):
=20=20Merge "imx6qsabrelite: Move to SabreLITE to meta-fsl-arm-extra"
=20=20Merge "linux-imx: Cleanup recipe as SabreLITE machine has been moved"
=20=20xf86-video-imxfb-vivante: Fix missing link to libGAL.so
=20=20imx23evk: Add mx23 to SoC family
=20=20imx28evk: Add mx28 to SoC family
=20=20u-boot-fslc: Update to 20130409 patches-2013.04's snapshot
=20=20mxs-base.inc: Add U-Boot common definitions
=20=20imx23evk: Use U-Boot by default
=20=20imx6slevk: Use U-Boot mainline
=20=20imx-base.inc: Remove preferred version override for i.MX6DL

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

Otavio Salvador (7):
=20=20imx233-olinuxino: Enable USB HID support
=20=20imx233-olinuxino: Add mx23 to the SoC family
=20=20imx233-olinuxino.inc: Use U-Boot by default
=20=20wandboard: Add 'wandboard' as SoC family and restrict kernel =
compatibility
=20=20wandboard-dual: Use U-Boot mainline
=20=20wandboard-dual: Remove the device-tree entry as it is not available
=20=20wandboard-solo: Add machine configuration

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-ppc:

Chunrong Guo (1):
=20=20linux-qoriq-sdk: enable CONFIG_DEVTMPFS_MOUNT to ensure /dev can be =
mounted=20

Ting Liu (1):
=20=20lio-utils: remove v4.0 as v4.1 has been added in meta-oe

Zhenhua Luo (1):
=20=20Remove unnecessary variables from machine conf

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-guacamayo:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix-community:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-handheld:

Apelete Seketeli (1):
=20=20linux-jlime-ben-nanonote: fix GCC-4.6 build errors

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-igep:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Kishore Bodke (1):
=20=20crystalforest: Fix build issues for openssl-qat-module

Laurentiu Palcu (3):
=20=20libva-intel-driver: upgrade to 1.0.19
=20=20libva: upgrade to 1.1.0
=20=20emgd-driver-bin: add pkgconfig files

Nitin A Kamble (6):
=20=20libva: update from 1.1.0 to 1.1.1
=20=20libva: resurrect 1.0.16 recipe for EMGD based BSPs
=20=20crownbay: specify a working libva version
=20=20emenlow: specify a working libva version
=20=20fri2: specify a working libva version
=20=20sys940x: specify a working libva version

Tom Zanussi (3):
=20=20libva: disable wayland
=20=20mesa-demos: fix build errors
=20=20Revert "mesa-demos: fix build errors"

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

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-slugos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-systemd:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-raspberrypi:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

Martin Jansa (20):
=20=20libhybris: remove RDEPENDS on android-system-image
=20=20shr-wizard, shr-e-gadgets: bump PR to rebuild against E17 0.17.2
=20=20midori: Rename bbappend to match new version from meta-xfce
=20=20meta-smartphone: Skip stripping and ldflags QA test
=20=20recipes: move systemd services to PN
=20=20packagegroup-shr-systemd: drop runtime dependency on PN-systemd
=20=20systemd-machine-units: fix service installation
=20=20shr-specs: add version 3.0 to CC-BY-SA
=20=20systemd-compat-units: unmask crond
=20=20frameworkd: add config for qemu machines
=20=20fsodeviced: add config for AuthenticAMD (qemux86*) machines
=20=20systemd: fix upgrade path in packages using systemd
=20=20packagegroup-shr-systemd: drop, now systemd services are in PN
=20=20android-system-image, android-system-image: limit COMPATIBLE_MACHINE
=20=20bcm4330-firmware: Fix COMPATIBLE_MACHINE typo
=20=20asus-grouper-firmware: Fix COMPATIBLE_MACHINE typo

Simon Busch (1):
=20=20meta-samsung: use git repositories instead of github tag archives

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

Martin Jansa (19):
=20=20gzip: Remove superfluous patch=3D1
=20=20dhcp: Use webos_upstartconfdir variable
=20=20dropbear: Use webos_upstartconfdir variable
=20=20upstart: Drop unused autoconf_version.patch
=20=20browser-adapter: Drop unused bigscreen.patch
=20=20webos-features: Add extra variables to select init system
=20=20webos_enhanced_submissions: Include webos-repositories.inc
=20=20luna-prefs: Inherit webos_machine_dep
=20=20webos_cmake: Add weak assignments for WEBOS_TARGET_*
=20=20webos_cmake: Remove dependency on MACHINE variable
=20=20db8: Remove dependency on luna-prefs
=20=20webos-connman-adapter: Inherit webos_machine_dep
=20=20nyx-lib: Move runtime dependency to packagegroup
=20=20lsb: Add weak assignment to WEBOS_TARGET_CORE_OS
=20=20upstart: Move MACHINE specific configuration to upstart-getty
=20=20upstart: Use webos_upstartconfdir variable
=20=20qt4-webos: explicitly disable opengl for x86
=20=20cjson: Inherit webos_public_repo
=20=20webos_public_repo: Require webos-repositories.inc

Pekka Ropo (1):
=20=20webos-image: nyx-lib=3D65,v5.1.0 nyx-modules=3D84,v5.1.0

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Michel Thebeau (1):
=20=20routerstationpro: strip the output kernel of .comment section

Paul Eggleton (4):
=20=20yocto-layer / yocto-bsp: tweak layer.conf comment
=20=20meta-yocto*/conf/layer.conf: tweak BBFILES comments
=20=20README.hardware: bring up-to-date
=20=20classes/poky-sanity: fix handling of bblayers.conf updating

Trevor Woerner (1):
=20=20poky.conf: update SANITY_TESTED_DISTROS

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:




