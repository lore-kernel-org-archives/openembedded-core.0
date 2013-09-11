Return-Path: <cliff.brake@gmail.com>
Received: from bec-systems.com (unknown [74.208.70.121])
	by mail.openembedded.org (Postfix) with ESMTP id 5C87560071;
	Wed, 11 Sep 2013 17:55:11 +0000 (UTC)
Received: from oh-67-76-203-50.sta.embarqhsd.net ([67.76.203.50]
	helo=happy.bec-systems.com)
	by bec-systems.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cliff.brake@gmail.com>)
	id 1VJoWe-0004Zh-38; Wed, 11 Sep 2013 13:48:34 -0400
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Date: Wed, 11 Sep 2013 17:54:47 GMT
Message-Id: <1378922087564.a105c79a@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
X-Spam_score: -2.9
X-Spam_score_int: -28
X-Spam_bar: --
Subject: OE Changelog since 2013-09-01 until 2013-09-08
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
X-List-Received-Date: Wed, 11 Sep 2013 17:55:12 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2013-09-01 until 2013-09-08.  Projects included in this =
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

Christopher Larson (1):
=20=20contrib/vim: merge changes from vim-bitbake repo

Cristiana Voicu (4):
=20=20bitbake/cooker: fix some calls of cookerdata.findConfigFile method
=20=20hob: remove PACKAGE_INSTALL variable setting from hob
=20=20hob: limit the description size when a custom image is saved
=20=20hob: remove custom image from the images list when not needed

Khem Raj (1):
=20=20newbb.vim: Use 'git config' instead of git-config

Paul Eggleton (1):
=20=20bitbake-worker: ensure BUILDNAME is available during execution

Peter Kjellerstedt (1):
=20=20bitbake: Ensure ${DATE} and ${TIME} are consistent

Richard Purdie (4):
=20=20runqueue: Fix scenequeue to pass file descriptors, not a float
=20=20data_smart: Move getVar expand cache handing to fix _remove operations
=20=20knotty: Reduce refresh of footer
=20=20prserv: Ensure data is committed

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Bian Naimeng (2):
=20=20acpid: install events directory at default.
=20=20acpid: print message if rule directory is inexist

Bruce Ashfield (6):
=20=20linux-yocto/3.10: fix YAFFS2 build issues
=20=20linux-yocto/3.10: update to v3.10.10
=20=20qemumips: fix keyboard entry in graphical boots
=20=20linux-yocto/3.10: update meta SRCREV for beagleboard config changes
=20=20kernel-yocto: improve error checking on non-git repos
=20=20kern-tools: support no author patches

Chen Qi (2):
=20=20busybox-syslog: add configuration file /etc/syslog.conf
=20=20sysklogd: lower the ALTERNATIVE_PRIORITY in case of systemd

Darren Hart (1):
=20=20linux-firmware: Update SRCREV, pull in iwlwifi-7260 support

Jason Wessel (1):
=20=20kernel.bbclass, image.bbclass: Implement kernel INITRAMFS dependency =
and bun

Jonathan Liu (1):
=20=20resolvconf: specify configuration for systemd-tmpfiles --update

Jukka Rissanen (1):
=20=20connman: Ignore the NFS root network interface in init script

Khem Raj (1):
=20=20package.bbclass: skip already-stripped QA test if asked for

Laurentiu Palcu (1):
=20=20run-postinsts: move script execution from S98 to S99 in rcS.d

Lukas Bulwahn (1):
=20=20boost: adding serialization to BOOST_LIBS

Mark Hatle (1):
=20=20package_rpm.bbclass: Fix no_recommendations and package_exclude

Mihai Lindner (3):
=20=20oeqa/oetest: oeRuntimeTest: enable long messages
=20=20oeqa/utils/sshcontrol: tweak ssh options
=20=20oeqa/runtime/scp: replace dd call

Mihai Prica (3):
=20=20scripts/runqemu: Fix MACHINE regex
=20=20bluez5: Install the bluetooth library
=20=20bluez5: Rename tests package to testtools

Olof Johansson (1):
=20=20flex: Only use create_wrapper for native and nativesdk

Otavio Salvador (3):
=20=20core-image-directfb: Use 'distro_features_check' class
=20=20core-image-weston: Ensure wayland distro feature is enabled
=20=20uboot-config.bbclass: Allow choose of U-Boot config for machine

Paul Eggleton (1):
=20=20runqemu: set memory size to 256M for most qemu machines

Peter A. Bigot (4):
=20=20pseudo: fix memory leak and missed privilege drop
=20=20chkconfig: remove linuxstdbase symlinks
=20=20linux-firmware: correct name of Marvell license file
=20=20linux-firmware: package Marvell SD8787 firmware

Richard Purdie (9):
=20=20elfutils: Drop do_autoreconf patches
=20=20package.bbclass: Fix darwin shlib handling
=20=20bitbake.conf: Add SDKPKGSUFFIX to hash whitelist
=20=20local.conf.sample.extended: Add an example of how to enable fortran
=20=20gcc-runtime: Add packaging for libgfortran (and also tweak others)
=20=20devshell: Don't corrupt the fakeroot variables
=20=20lib/oeqa/qemurunner: Use a timeout in select() call
=20=20ghostscript: Add missing dependency to resolve parallel make issue
=20=20cmake: set system name correctly

Robert Yang (1):
=20=20glib-2.0: fix a host contamination issue

Ross Burton (5):
=20=20wipe-sysroot: fix removals
=20=20pulseaudio: disable GTK+ by default
=20=20waf.bbclass: add waf build system class
=20=20eglinfo: add recipes for x11 and fb backends
=20=20systemd: split out systemd-binfmt as a separate package

Roy.Li (2):
=20=20distcc: add init.d/distcc status command for LSB compliance
=20=20irda-utils: add init.d/irattach status command for LSB compliance

Stefan Stanacar (2):
=20=20lib/oeqa/runtime: smart: serve repo on host ip only and increase =
timeout
=20=20lib/oeqa/runtime: add basic scanelf test

Thomas Fitzsimmons (1):
=20=20useradd: Handle users from a package being used in others

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Andrea Adami (4):
=20=20klibc_2.0.2: refactor recipe to respect exec_prefix
=20=20klcc-cross_2.0.2: refactor recipe to respect exec_prefix
=20=20kexec-tools-klibc: fix includes now that klibc respects exec_prefix
=20=20cramfs: remove, we use mkfs.cramfs from util-linux

Andreas M=C3=BCller (1):
=20=20ntp: enable systemd-timedated control for ntp.service

Eren T=C3=BCrkay (2):
=20=20omgps: add libcap dependency
=20=20mpg123: add PACKAGECONFIG for pulseaudio and alsa

Fathi Boudra (3):
=20=20acpica: fix parallel build
=20=20acpica: fix recipe to be OE compliant with spacing
=20=20acpica: bump to version 20130823

Jackie Huang (1):
=20=20remove the unnecessary protocol parameters

Joe MacDonald (1):
=20=20quagga: fix info-related QA warning

Jonathan Liu (2):
=20=20xf86-video-ati: new recipe
=20=20xf86-video-nouveau: new recipe

Khem Raj (3):
=20=20gcc-4.6: Update to match gcc restructing in OE-Core
=20=20atftp, libuio: Update the SRC_URI to match upstream sf.net change
=20=20inetutils: Remove empty usr/lib

Laszlo Papp (1):
=20=20stunnel: Add 4.56 version

Martin Jansa (5):
=20=20systemd: Rename .bbappend to match new version from oe-core
=20=20qcanobserver: Move to nonworking
=20=20mariadb-native: Add mysql5-native to PROVIDES
=20=20webkit-efl: Add dependency on gst-plugins-base
=20=20libmikmod: upgrade to 3.2.0

Paul Eggleton (7):
=20=20vala: remove
=20=20midori: remove
=20=20classes/vala: remove
=20=20python-docutils: remove
=20=20libnotify: remove
=20=20ca-certificates: remove
=20=20busybox: remove bbappend

Roy.Li (2):
=20=20tftp-hpa: add error check for disk filled up
=20=20atftp: port a patch from OpenSUSE to fix "Sorcerer's Apprentice =
Syndrome"(SA

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Denys Dmytriyenko (3):
=20=20arago-prefs: set up remaining preferred providers for libgles packages
=20=20remove-net-rules: _remove is a new keyword now, sanitize the function =
name
=20=20packagegroup-arago-*: fix up the rest of machine-specific =
packagegroups

Franklin S. Cooper Jr (6):
=20=20gst-plugins-bad: Use new PACKAGECONFIG feature
=20=20sourceipk: Add ability to preserve Git repository
=20=20board-port-labs-linux: Create new recipe using new sourceipk.bbclass =
feature
=20=20board-port-labs-u-boot: Create new recipe using new sourceipk.bbclass =
featur
=20=20packagegroup-arago-tisdk-amsdk-sdk-host: Use new board-port-labs =
recipe
=20=20board-port-labs: Remove old board-port-labs recipe

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-beagleboard:

Koen Kooi (5):
=20=20linux-mainline 3.8: backport sync(2) fix from 3.11
=20=20linux-mainline 3.8: enable more HID options
=20=20linux-mainline 3.8: backport USB timeout fix
=20=20linux-mainline 3.8: disable USB suspend for beaglebone
=20=20Merge pull request #12 from =
RobertCNelson/g-ether-really-fix-mac-address-rea

Robert Nelson (1):
=20=20g-ether-load: fix mac address read

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

Otavio Salvador (7):
=20=20gpu-viv-bin-mx6q.inc: If Wayland and X11 are enabled, default to X11
=20=20xf86-video-imxfb-vivante: Remove unused patches
=20=20packagegroup-core-directfb: Add Vivante GPU support
=20=20linux-fslc: Update to 3.11 based kernel
=20=20u-boot-fslc: Update to 2013.10-rc2
=20=20linux-fslc: Update to 10b70ef revision
=20=20pointercal-xinput: Move from meta-fsl-demos

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

Alexandre Belloni (8):
=20=20linux-cfa: always use cfa10036 as MACHINE for the kernel link
=20=20cfa10036: split configuration
=20=20Add a machine configuration for cfa-10037
=20=20Add a machine configuration for cfa-10049
=20=20Add a machine configuration for cfa-10055
=20=20Add a machine configuration for cfa-10056
=20=20Add a machine configuration for cfa-10057
=20=20Add a machine configuration for cfa-10058

Otavio Salvador (1):
=20=20linux-imx (3.0.35): Change GPU_VIV to be built-in

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-ppc:

chunrong guo (1):
=20=20Revert "e500v2: workaround for ICE of gcc-4.8.x"

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-guacamayo:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix-community:

Andreas M=C3=BCller (1):
=20=20u-boot-overo: move to 2013.07

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-handheld:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-igep:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Nitin A Kamble (13):
=20=20emgd-driver-bin: mark opengl as a required distro feature
=20=20sugarbay: mention required opengl distro feature in the README
=20=20chiefriver: mention required opengl distro feature in the README
=20=20nuc: mention required opengl distro feature in the README
=20=20chiefriver: linux-yocto_3.10 recipe extension
=20=20chiefriver: move BSP to the v3.10 kernel
=20=20jasperforest: linux-yocto_3.10 recipe extension
=20=20jasperforest: move BSP to the v3.10 kernel
=20=20nuc: linux-yocto_3.10 recipe extension
=20=20nuc: move BSP to the v3.10 kernel
=20=20sugarbay: linux-yocto_3.10 recipe extension
=20=20sugarbay: move BSP to the v3.10 kernel
=20=20xf86-video-intel: remove from meta-intel

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
Changelog for meta-qt5:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-slugos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-systemd:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-raspberrypi:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

Martin Jansa (6):
=20=20midori: rename .bbappend to match new version from meta-oe
=20=20vagalume: Add PACKAGECONFIG for notify
=20=20openmoocow: Add dependency on libsdl
=20=20numptyphysics: Add dependency on dbus
=20=20systemd: Rename .bbappend to match new version from oe-core

Sebastian Krzyszkowiak (3):
=20=20meta-shr: opimd-utils: bump SRCREV
=20=20meta-fso: frameworkd: bump SRCREV and drop patches
=20=20meta-shr: libphone-ui, libphone-ui-shr: bump SRCREVs for volume =
sliders fix

Simon Busch (2):
=20=20meta-android: libhybris: bump SRCREV
=20=20meta-android: chroot-image: add support for interactive debugging =
with adb

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

Denys Dmytriyenko (5):
=20=20libgles-omap3: fix some conflicts between X11 and Raw versions
=20=20ompa3-sgx-modules-x11: fix some build failures with latest versions
=20=20libgles-omap3-x11: do not fail if pvr-init is not yet installed
=20=20libgles-omap3: introduce INC_PR
=20=20libgles-omap3, omap3-sgx-modules: remove old 4.03.00.02 version

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

Anatolii Sakhnik (1):
=20=20webos-image: libpbnjson=3D19

Hongjeon Ha (1):
=20=20webos-image: pmloglib=3D38

Suresh Arumugam (1):
=20=20webos-image: Add core-apps and services into System Apps package set

Susan Montooth (1):
=20=20pmlogdaemon: Add missing dependency on luna-service2

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

Nathan Rossi (7):
=20=20external-xilinx-toolchain: Created recipe
=20=20external-xilinx-toolchain: Fix Parsing error
=20=20linux-machine-config.inc: Refactored useful python functions
=20=20u-boot-extra.inc: Refactored to use xilinx-utils functions
=20=20u-boot-xlnx: Add uEnv.txt support
=20=20zedboard-zynq7: Fix DTS Network PHY node
=20=20zynq-7-base.dtsi: Fix-up register mapping

Sipke Vriend (4):
=20=20recipes-bsp:u-boot-xlnx: Delete 2012.10 u-boot recipe.
=20=20recipes-bsp:u-boot-xlnx: Move patch files out of include file.
=20=20recipes-bsp:u-boot: Add u-boot-xlnx_2013.07 and bleeding edge recipe.
=20=20recipes-kernel:linux-xlnx Add recipe for linux-xlnx 3.10 and =
corresponding=20=20

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Bruce Ashfield (1):
=20=20meta-yocto-bsp: update h/w reference boards SRCREVs

Darren Hart (1):
=20=20genericx86: Create a genericx86-common.inc base for the x86 BSPs

Kevin Hao (1):
=20=20mpc8315e-rdb: update to the 3.10 kernel

Liming Wang (3):
=20=20beagleboard: upgrade u-boot to the latest version
=20=20mpc8315e-rdb: Set PREFFERED_VERSION to 2013.07
=20=20beagleboard: upgrade the kernel to 3.10.x

Paul Eggleton (1):
=20=20poky.conf: add version-going-backwards to ERROR_QA

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



