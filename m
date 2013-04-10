Received: from new.bec-systems.com ([74.208.70.121] helo=bec-systems.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1UPvt5-0002o1-Ap; Wed, 10 Apr 2013 16:20:37 +0200
Received: from oh-69-34-21-229.sta.embarqhsd.net ([69.34.21.229]
	helo=happy.bec-systems.com)
	by bec-systems.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cliff.brake@gmail.com>)
	id 1UPvar-0008RQ-Gg; Wed, 10 Apr 2013 10:01:50 -0400
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Date: Wed, 10 Apr 2013 14:03:00 GMT
Message-Id: <1365602580900.c07989a8@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
X-Spam_score: -2.9
X-Spam_score_int: -28
X-Spam_bar: --
Subject: OE Changelog since 2013-03-31 until 2013-04-07
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
X-List-Received-Date: Wed, 10 Apr 2013 14:20:40 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2013-03-31 until 2013-04-07.  Projects included in this =
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

Andrei Dinu (2):
=20=20Removed popup when including a package
=20=20propertydialog adjustments for package.bbclass

Cristiana Voicu (2):
=20=20hob: add tooltip on "clear search" button
=20=20hob: giving focus to the search field loses the table sorting

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Alexandru DAMIAN (2):
=20=20qemu script: explicitly set 32 bit depth
=20=20libproxy: add dependency on glib-2.0

Andreas M=C3=BCller (5):
=20=20seperatebuilddir.inc: remove reference to gtk+-native
=20=20sstate.bbclass: remove reference to gtk+-native
=20=20packagegroup-toolset-native: replace gtk+-native by =
gtk-update-icon-cache-na
=20=20gtk+: don't provide native build
=20=20remove gtk-update-icon-cache-native virtuals

Andrei Dinu (1):
=20=20Add file information to package information window

Bogdan Marinescu (1):
=20=20package_deb.bbclass: fix 'armel' override

Bruce Ashfield (3):
=20=20linux-yocto/3.8: update mips SA_RESTORER fix
=20=20kernel-yocto: use KBRANCH as default build branch
=20=20linux-yocto-rt: integrate 3.8.4-rt2

Carlos Rafael Giani (1):
=20=20gst-ffmpeg: configure-fix patch used wrong test

Chase Maupin (2):
=20=20linux-dtb: Add simple DTB symlinks for devicetree
=20=20linux-dtb: fix whitespace in bash functions

Christopher Larson (1):
=20=20oe.terminal: add tmux classes

Cristian Iorga (3):
=20=20build-appliance-image: fix git proxy access
=20=20connman: added wired setup for systemd
=20=20lsb: distro codename info added

Darren Hart (4):
=20=20base-passwd: Add input group
=20=20udev-extraconf: Add rule adding input devices to input group
=20=20xserver-nodm-init: Add xuser to input group
=20=20linux-yocto-tiny: Add 3.8.4 recipe

Felipe F. Tonello (1):
=20=20qt-mobility: added list of modules to be compiled

Henning Heinold (2):
=20=20scripts/sstate-cache-management.sh: fix return value by adding exit 0
=20=20site/common-uclibc: add predefined configure vars for coreutils

Jeff Polk (1):
=20=20sstate: add -f to mv when moving sstate files into place

Kevin Strasser (1):
=20=20archiver: fix srpm archiving build errors

Laurentiu Palcu (1):
=20=20postinst-intercepts, qemu.bbclass: fix issue on 32 bit hosts

Lukas Bulwahn (1):
=20=20python: adding missing runtime dependency python-io to python-pprint

Marcin Juszkiewicz (1):
=20=20site: add endianness information for libmemcached

Mark Hatle (1):
=20=20base.bbclass: Update the preferred_ml_updates

Martin Jansa (11):
=20=20tcf-agent: Don't download epl-v10.html just for LIC_FILES_CHKSUM =
validation
=20=20openssh: don't add update-rc.d to RDEPENDS
=20=20update-rc.d, systemd: redirect also stderr from type
=20=20util-linux: Use u-a for getopt
=20=20runqemu-internal: use MACHINE_SUBTYPE variable for qemuarm*
=20=20buildhistory: record tag names and show warning when the same tag =
correspond
=20=20qemu: Add 2 patches to fix build with texinfo-5
=20=20gcc: add patch to disable texinfo when texinfo is 5.0 or newer
=20=20systemd: set INHIBIT_UPDATERCD_BBCLASS without sysvinit in features
=20=20dbus: set INHIBIT_UPDATERCD_BBCLASS without sysvinit in features
=20=20curl: backport patch to fix segfaults

Maxin B. John (1):
=20=20local.conf.sample: Add info about -ptest package group

Mihai Prica (1):
=20=20qemu: Enabled SDL when compiling for target architecture

Otavio Salvador (6):
=20=20linux-firmware: Remove 'Makefile' from packages
=20=20linux-firmware: Remove duplicaed license from rtlwifi subdir
=20=20linux-firmware: Package Reaktek and Broadcom licenses
=20=20linux-firmware: Package vt6656, ath6k, ath9k and ar9170
=20=20linux-firmware: Add missing license information for wl12xx
=20=20pointercal: Move override files from 'files' to 'pointercal' directory

Paul Eggleton (3):
=20=20classes/sstate: avoid traceback when no files have been staged
=20=20icon-naming-utils: import version 0.8.90 from meta-oe
=20=20lib/oe/classextend.py: avoid extending any kernel package

Peter Kjellerstedt (2):
=20=20oe-setup-builddir: Allow $OECORENOTESCONF to not exist
=20=20oe-init-build-env: Make it use the correct $OEROOT with zsh

Richard Purdie (5):
=20=20rpm: Ensure rpm depends on rpm-postinsts
=20=20remake: Fix out of tree builds
=20=20scripts/qemuimage-testlib: Dump extra info if the network doesn't =
come up
=20=20qemuimage-testlib-pythonhelper: Fix process mixups
=20=20qemuimage-tests/sanity/boot: Increase timeout

Rogerio Nunes (2):
=20=20alsa-tools: fix build when x11 and gtk+ not available
=20=20gst-plugins-bad: disable librsvg when x11 is disabled

Ross Burton (8):
=20=20libxcb: remove obsolete version 1.1.91
=20=20liberation-fonts: remove 1.06
=20=20utils: add helper to get all non-system packages
=20=20connman_test.sh: show all processes when dumping ps
=20=20qemuimage-testlib: silence some key warnings
=20=20qemuimage-testlib: add function to fetch the remote syslog
=20=20sanity/connman: when connman test fails, dump syslog
=20=20linux-firmware: make the main package depend on all sub-packages

Saul Wold (3):
=20=20rpm-postinsts: Split out run-postinsts
=20=20tinylogin: fix segfault from crypt()
=20=20shadow: add patch to fix crypt: Invalid Argument

Takeshi Hamasaki (1):
=20=20pcmciautils: fix segmentation fault of pccardctl command

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Andreas M=C3=BCller (4):
=20=20exo: inherit perlnative and add liburi-perl-native to DEPENDS
=20=20exo: add native build
=20=20xfce4-closebutton-plugin: initial add
=20=20packagegroup-xfce-extended: add xfce4-closebutton-plugin

Andreas Oberritter (1):
=20=20libyaml: allow native builds

Apelete Seketeli (1):
=20=20ttf-fonts: import ttf-inconsolata recipe from oe-classic

Jackie Huang (1):
=20=20modphp: use libdir instead of baselib to load module

Khem Raj (1):
=20=20libnetfilter-queue: Add missing libmnl to DEPENDS

Koen Kooi (2):
=20=20python-m2crypto: add 0.21.1
=20=20crda: add 1.1.3

Martin Jansa (1):
=20=20systemd.bbclass: set INHIBIT_UPDATERCD_BBCLASS like oe-core does now

Philip Balister (2):
=20=20orc : Add support for sdk generation.
=20=20python-cheetah : Add support for sdk generation.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Khem Raj (1):
=20=20README: Update MAINTAINERS

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Chase Maupin (12):
=20=20linux-ti-staging: use AUTOREV during development
=20=20u-boot-ti-staging: use AUTOREV during development
=20=20ti-tisdk-setup: Add missing script and update SRCREV
=20=20arago-test: make MACHINE specific architecture
=20=20tisdk-uenv: Add ability to package uEnv files for U-Boot
=20=20tisdk-amsdk-host: Add tisdk-uenv package
=20=20ti-tisdk-setup: pull update to create-sdcard script
=20=20tisdk-readme: add README file to prebuilt images directory
=20=20amsdk-sdk-host: add tisdk-readme package
=20=20amsdk-av-files: Add support for AV files for omap-a15
=20=20tisdk-addons: Add parted utility
=20=20ti-tisdk-makefile: make quick-playground conditional

Denys Dmytriyenko (9):
=20=20Revert "scripts: temp workaround for oe-core/scripts/bitbake bug"
=20=20gconf: drop local bbappend disabling gtk+, already in oe-core
=20=20gst-plugins-good: remove the gtk+/examples part that is already in =
oe-core
=20=20meta-toolchain-arago, arago.conf: workaround to hardcode longer paths =
in ELF
=20=20arago-prefs: Set PREFERRED_VERSIONs for Wilink 6 recipes
=20=20arago.conf: add branding support to allow products to tweak =
preferences
=20=20branding-amsdk: add the initial AM-SDK branding policy
=20=20arago-prefs: set default preferences to the latest TI staging kernel =
and u-b
=20=20arago: switch to 4.09.00.01 graphics by default, pin 4.08.00.02 for =
amsdk

Franklin S. Cooper Jr (16):
=20=20wl12xx-firmware: Pull back in old r5.00.18 recipe.
=20=20wl12xx-firmware: Update recipe name.
=20=20ti-compat-bluetooth: Split recipe
=20=20ti-compat-bluetooth: Add back old r5.00.18 compat-bluetooth release =
version
=20=20ti-compat-wireless-wl12xx: Rename recipe
=20=20ti-compat-wireless-wl12xx: Pull in older ti-compat-wireless-wl12xx =
release
=20=20hostap-daemon: Split recipe
=20=20hostap-daemon: Pull in old r5-00-18 recipe
=20=20wifi-direct-launcher: Add script used to launch wifi-direct demos
=20=20wifi direct demos: Update to use new wifi-direct-launcher script
=20=20wpa-supplicant: Split recipe
=20=20wpa-supplicant: Pull back in old r5-00-18 recipe.
=20=20wilink-calibrate: Add Wilink calibration script
=20=20ti-wifi-utils: Split recipe
=20=20ti-wifi-utils: Pull back in old r5.00.18 recipe.
=20=20wpa-supplicant_r5.00.18: Create bbappend

Jason Wessel (2):
=20=20relocate_sdk.py: Fix corruption of sdk binaries
=20=20relocate_sdk.py: allow relocate_sdk.py to work with python 2.4.x

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-beagleboard:

Jason Kridner (1):
=20=20u-boot-denx: turn on BeagleBone LEDs during boot

Koen Kooi (14):
=20=20linux-mainline 3.8: fix regulator for beaglebone black uSD and eMMC
=20=20linux-mainline 3.8: add patch to disable capes during boot
=20=20linux-mainline 3.8: add cape for USER button, teach tilcdc about =
pinmux
=20=20linux-mainline 3.8: fix build when using long build paths
=20=20linux-mainline 3.8: back out headers_install patch
=20=20linux-mainline 3.8: fix thumb2 builds
=20=20u-boot-denx: update to 2013.04-rc1
=20=20Merge pull request #1 from jadonk/led-patch
=20=20u-boot-denx 2013.04-rc1: turn on MMC1 clock, fixes crash when ROM =
doesn't in
=20=20linux-mainline 3.8: add support for more DVI-D capes
=20=20linux-mainline 3.8: fix USB current limit and add support for audio =
cape
=20=20linux-mainline 3.8: add davinci emac optimization
=20=20linux-mainline 3.8: update to 3.8.6
=20=20linux-mainline 3.8: add support for beagleboard

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

Daiane Angolini (3):
=20=20linux-imx (3.0.35): Change mx6sl linux version to 12.10.02
=20=20u-boot-imx (2009.08): Change mx6sl u-boot version to 12.10.02
=20=20xf86-video-imxfb: Fix Xorg driver with newer API

Mahesh Mahadevan (1):
=20=20linux-imx (2.6.35.3): Enable FEC_NAPI in the MX5 defconfig

Otavio Salvador (13):
=20=20xf86-dri-vivante: Upgrade to 1.1.0
=20=20xf86-video-imxfb-vivante: Upgrade to 1.1.0
=20=20xserver-xorg: Add 1.11.4 version as it provides Video ABI 11
=20=20xf86-input-evdev: Mark as machine specific for i.MX6
=20=20xf86-video-imxfb-vivante: Revert patch to update to newer Xorg Video =
API
=20=20imx-base.inc: Use xserver-xorg 1.11.4 version for i.MX6
=20=20Revert "pointercal-xinput: Add pointercal.xinput to mxs"
=20=20gpu-viv-bin-mx6q: Rework package for a single backend use
=20=20xf86-video-imxfb-vivante: Add missing dependency of virtual/xserver
=20=20gst-plugins-gl: Fix dependency definition
=20=20gst-plugins-gl: Avoid leaking memory
=20=20imx6qsabrelite: Move to SabreLITE to meta-fsl-arm-extra
=20=20linux-imx: Cleanup recipe as SabreLITE machine has been moved

Philip Craig (1):
=20=20libfslparser: fix mp3 parser installation

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

John Weber (3):
=20=20linux-wandboard (3.0.35): add recipe for 'official' wandboard kernel
=20=20wandboard-dual: Make linux-wandboard preferred provider
=20=20linux-imx (3.0.35): Remove wandboard from recipe

Otavio Salvador (3):
=20=20linux-boundary: Add recipe for Boundary Devices kernel
=20=20imx6qsabrelite: Add Boundary Devices SabreLITE machine definition
=20=20nitrogen6x: Change machine to use linux-boundary kernel

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-ppc:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-guacamayo:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix-community:

Andreas M=C3=BCller (3):
=20=20u-boot: rename to u-boot-overo
=20=20linux-mainline-3.8: update to 3.8.5
=20=20README: fix typo in email address

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-handheld:

Andrea Adami (7):
=20=20linux-yocto-3.8: remove cruft (to-do about regulators)
=20=20zaurus: remove u-boot remnants from akita/spitz/c7x0 configs
=20=20zaurus: remove obsolete ROOT_FLASH_SIZE
=20=20zaurus: add note about mtdparts of tosa
=20=20zaurus: remove configurations of models aliased by c7x0 and spitz
=20=20zaurus: add README.zaurus, about flashing kernel, JFFS2 and UBIFS =
images
=20=20linux-yocto-tiny-kexecboot_3.2: removed unused, non-working MTD-RW =
patch

Apelete Seketeli (1):
=20=20ben-nanonote: import ben-nanonote machine support

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-igep:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Darren Hart (4):
=20=20n450: Update to linux-yocto_3.8 (3.8.4)
=20=20linux-yocto-rt_3.4: Add 3.4.36-rt50 support to BSPs that only had 3.2
=20=20linux-yocto-rt_3.8: Update all non-ISG BSPs with rt support to =
3.8.4-rt2
=20=20linux-yocto-tiny: Add 3.8 recipe for fri2

Kishore Bodke (2):
=20=20romley: update v3.8 kernel recipe commits to v3.8.4
=20=20crystalforest: update v3.8 kernel recipe commits to v3.8.4

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-java:

Henning Heinold (5):
=20=20add global license file
=20=20recipes-images: define extra dir for images
=20=20recipes-extended: split out recipes which are not needed for =
compiling openj
=20=20xmlpull: import package from oe-classic
=20=20openjdk-7: update to version 2.1.7

Khem Raj (1):
=20=20openjdk: Create a common inc file between openjdk 6 and 7

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

Martin Jansa (7):
=20=20libgles-android-grouper: temporary add dependency on virtual/libx11
=20=20libhybris: remove standalone recipe
=20=20libgles-android-grouper: remove libx11 dependency and bump libhybris
=20=20README: be consistent about branch names

Simon Busch (45):
=20=20meta-samsung: base-files: still use volatiles on tmpfs
=20=20meta-samsung: initscripts: use our own volatile configuration which =
doesn't=20
=20=20meta-samsung: initscripts: don't modify volatiles configuration at all
=20=20meta-android: adb: make shell working with adb utility
=20=20meta-android: libgles-android: bump SRCREV for newer version
=20=20meta-samsung: udev-extraconf: add udev rule to detect correct ofono =
modem dr
=20=20meta-samsung: samsung-rfs-mgr: initial version of the recipe
=20=20meta-asus: initial layer configuration
=20=20meta-asus: add machine configuration for the grouper device
=20=20meta-asus: linux-asus-grouper: initial kernel build recipe
=20=20meta-asus: chroot-script: add chroot script compatible with the =
grouper mach
=20=20meta-asus: initscripts: add grouper specific init script to setup =
rndis on b
=20=20meta-asus: netbase: add basic network configuration (rndis)
=20=20meta-android: bcm4330-firmware: add common recipe for the needed =
firmware bi
=20=20meta-samsung: samsung-tuna-firmware: rework and add RDEPEND on =
bcm4330-firmw
=20=20meta-asus: asus-grouper-firmware: initial version of the firmware =
recipe
=20=20meta-asus: libgles-android-grouper: initial version
=20=20meta-android: bcm4330-firmware: use correct firmware version
=20=20meta-android: bcm4330-firmware: set PACKAGE_ARCH to MACHINE_ARCH and =
bump PR
=20=20meta-asus: libgles-android: change android-binaries to be a git =
checkout
=20=20meta-samsung: libgles-android: change android-binaries to be a git =
checkout
=20=20meta-android: classes: kernel_android: implement class for creation =
of andro
=20=20meta-samsung: linux-samsung-tuna: use kernel_android bbclass
=20=20meta-samsung: linux-samsung-crespo: use kernel_android bbclass
=20=20meta-asus: linux-asus-grouper: use kernel_android bbclass
=20=20meta-fso: libsamsung-ipc: bump SRCREV
=20=20meta-samsung: samsung-rfs-mgr: bump SRCREV
=20=20meta-asus: grouper: correct MACHINE_DISPLAY_WIDTH_PIXELS
=20=20meta-android: invensense: add recipe for the motion processing =
library for i
=20=20android-apn-database: add initial recipe
=20=20meta-android: libhybris: add initial recipe
=20=20meta-samsung: tuna: choose libhybris as provider for egl/libgles2
=20=20meta-android: libhybris: add RDEPENDS on virtual/android-system-image
=20=20meta-android: android-system-image: add base recipe for system image =
install
=20=20meta-samsung: android-system-iamge-tuna: add recipe to provide the =
needed sy
=20=20meta-samsung: set android-system-image-tuna as provider for =
virtual/android-
=20=20meta-android: android-exec: add simple utility to start android =
binaries
=20=20meta-android: android-initscripts: add base recipe for initscripts to =
start=20
=20=20meta-samsung: android-initscripts: add upstart init script to initial =
PVR gr
=20=20meta-asus: android-system-image-grouper: add recipe to provide the =
needed sy
=20=20meta-asus: set android-system-image-grouper as provider for =
virtual/android-
=20=20meta-android: drop libgles-android recipe and all it's incarnations
=20=20meta-android: android-audiosystem: add recipe to be able to use =
Android's me
=20=20meta-android: android-initscripts: make package machine specific
=20=20meta-android: libhybris: bump SRCREV and PE

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

Chase Maupin (2):
=20=20omap5-evm: update U-Boot machine to omap5 uevm
=20=20ti-graphics: Add latest 4.09.00.01 version

Denys Dmytriyenko (3):
=20=20u-boot-ti-staging: update SRCREV for more omap5 changes, bump PR
=20=20omap-a15.inc: also set TI staging preferred provider for u-boot
=20=20linux-ti-staging: update with the latest dss fixes in omap5 dts

Franklin S. Cooper Jr (3):
=20=20libgles-omap3.inc: Add tweaks needed for newer version of the =
Graphics SDK
=20=20omap3-sgx-modules: Add version 4.08.00.02 of the Graphics SDK kernel =
modules
=20=20libgles-omap3: Add version 4.08.00.02 of the Graphics SDK

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

Keith Derrick (1):
=20=20cmake-modules-webos-native=3D13

Patrick Roberts (1):
=20=20Kernel: Add bbappend for drm/fb

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

Elvis Dowson (5):
=20=20recipes-support/db: Update to db_5.1.19.bbappend.
=20=20recipes-core/util-linux: Update to util-linux_2.21.2.bbappend to =
match 'dann
=20=20recipes-core/util-linux: Remove util-linux_2.22.22.bbappend to match =
'danny'
=20=20microblaze: Delete old microblaze architecture and machine =
definitions.
=20=20site/microblaze-common: Replaces manual overrides

Jason Wu (2):
=20=20machine:MB LE: change serial console to ttyS0
=20=20machine:MB BE: change serial console to ttyS0

John Williams (1):
=20=20libffi: Use 3.0.12 release tarball

Nathan Rossi (11):
=20=20Added bbappends to fix gettext build issue.
=20=20gnu-config: Added patch to add "microblazeel" support to config.sub
=20=20ncurses: Added patch to add "microblazeel" support to config.sub
=20=20db: Added patch to add "microblazeel" support to config.sub
=20=20util-linux: Added patch to fix microblaze support
=20=20libffi: Added recipe to use internal libffi git repository
=20=20external-csl: Workaround toolchain layout issues
=20=20external-csl: Workaround toolchain layout issues
=20=20Added 'microblaze' machine and tune configuration.
=20=20Added 'microblazeel' machine and tune configuration.
=20=20tune-microblaze: Reorder PKGARCH suffixes

Sipke Vriend (1):
=20=20tune-microblaze: Refactored

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Cristian Iorga (1):
=20=20poky.conf: added distro codename variable

Darren Hart (2):
=20=20atom-pc: Update to linux-yocto_3.8 (3.8.4)
=20=20poky-tiny: Prefer linux-yocto-tiny_3.8

Emilia Ciobanu (1):
=20=20package_regex.inc: add new regexes

Khem Raj (1):
=20=20poky.conf: Use weaker assignment for PREMIRROR

Maxin B. John (1):
=20=20local.conf.sample: Add info about -ptest package group

Michel Thebeau (1):
=20=20routerstationpro: swap KERNEL_IMAGETYPE and KERNEL_ALT_IMAGETYPE

Richard Purdie (1):
=20=20meta-yocto/conf: Add conf-notes.txt

Ross Burton (1):
=20=20atom-pc: add i965 Mesa driver so GL works on i965 onwards

Tom Zanussi (8):
=20=20yocto-bsp: add KBRANCH for existing kbranch cases
=20=20yocto-bsp: add linux-yocto-3.8-rt to templates
=20=20yocto-bsp: have replace_file() close file before copying
=20=20yocto-bsp: pass in file object to replace_file()
=20=20yocto-bsp: use specific bsp metadata for qemu machines
=20=20yocto-bsp: qemu machine template updates
=20=20yocto-bsp: set SRCREV for arm-based qemu machines
=20=20yocto-bsp: change qemu-based mips BSP default branch

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:




