Received: from new.bec-systems.com ([74.208.70.121] helo=bec-systems.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1UWuCx-00079M-Vr; Mon, 29 Apr 2013 21:58:04 +0200
Received: from oh-67-76-203-50.sta.embarqhsd.net ([67.76.203.50]
	helo=happy.bec-systems.com)
	by bec-systems.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cliff.brake@gmail.com>)
	id 1UWttJ-0004zT-81; Mon, 29 Apr 2013 15:37:39 -0400
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Date: Mon, 29 Apr 2013 19:39:31 GMT
Message-Id: <1367264371222.99105f3e@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
X-Spam_score: -2.9
X-Spam_score_int: -28
X-Spam_bar: --
Subject: OE Changelog since 2013-04-21 until 2013-04-28
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
X-List-Received-Date: Mon, 29 Apr 2013 19:58:06 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2013-04-21 until 2013-04-28.  Projects included in this =
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

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Andrei Dinu (2):
=20=20pax-utils : upgrade to 0.7
=20=20openssh : upgrade to 6.2p1

Chase Maupin (1):
=20=20u-boot: Add UBOOT_LOCALVERSION to control version string

Chen Qi (1):
=20=20udev: create /var/volatile/tmp to avoid dead link

Christopher Larson (2):
=20=20package.bbclass: add LICENSE_EXCLUSION to vardeps
=20=20package.bbclass: ensure license excluded files aren't packaged

Darren Hart (1):
=20=20linux-firmware: Look for RTL license in the right directory

Elvis Dowson (1):
=20=20gcc-4.8: Refactor gcc-4.8.0 patch files.

Emilia Ciobanu (1):
=20=20connman-gnome: Replace broken png files

George Kiagiadakis (1):
=20=20pulseaudio: install alsa mixer data files

Khem Raj (2):
=20=20gcc-4.8: Add recipes
=20=20gcc-4.8: Fix GCC ICE on arm

Koen Kooi (3):
=20=20libpng: update to 1.6.1
=20=20grub-efi-native: fix build on modern distributions without gets()
=20=20gnome-icon-theme: add missing icon-cache inherit

Laurentiu Palcu (4):
=20=20fontcache.bbclass: do not exit with 1 after installing intercept hook
=20=20gtk-icon-cache.bbclass: do not exit 1 after installing intercept hook
=20=20pixbufcache.bbclass: do not exit 1 after installing intercept hook
=20=20image.bbclass: change the logic when intercepts fail

Lukas Bulwahn (1):
=20=20python-setuptools: Improving the runtime dependencies

Marcin Juszkiewicz (2):
=20=20powertop: add 2.3
=20=20elfutils: split libraries into separate packages

Maxin B. John (1):
=20=20lttng: updated lttng-ust to 2.1.2

Otavio Salvador (1):
=20=20udev-extraconf: Avoid mounting unknown filesystems

Paul Barker (2):
=20=20common-licenses: fill in AGPL-3.0
=20=20common-licenses: remove HTMLisms from OFL-1.1

Phil Blundell (3):
=20=20openssl: Disable parallel make
=20=20icu: Remove unnecessary FULL_OPTIMIZATION_arm setting
=20=20kernel-arch: Always use ld.bfd to link the kernel

Ross Burton (5):
=20=20cairo: drop transform patch, it's been rejected upstream
=20=20png: fix over-zealous warnings about transforms
=20=20gconf: silence some spurious errors
=20=20matchbox-session-sato: install GConf values directly instead of using =
schema
=20=20glib-2.0: disable tests for native builds, and respect ptest for LSB

Ting Liu (1):
=20=20ltp: upgrade to 20130109 release

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Andreas M=C3=BCller (4):
=20=20xfce4-xkb-plugin: Update to latest git
=20=20lxdm: fix postinst-code
=20=20networkmanager: update to 0.9.8.0
=20=20network-manager-applet: update to 0.9.8.0

Jack Mitchell (2):
=20=20Hiawatha: update to 9.0, add systemd support
=20=20php: add sqlite3 and mysql PACKAGECONFIG options

Koen Kooi (1):
=20=20xfce4-mixer: add missing dep on libunique

Marcin Juszkiewicz (4):
=20=20php: update to 5.4.14
=20=20openldap: do not link to ICU
=20=20libmemcached: add 1.0.15 and 1.0.7 versions
=20=20memcached: add 1.4.15

Martin Jansa (8):
=20=20llvm2.9: Import from meta-java
=20=20llvm2.9: fix build with gcc-4.7
=20=20llvm2.9: try to fix thumb build and disable it after failure
=20=20llvm2.9: remove X86 from LLVM_TARGETS_TO_BUILD
=20=20README: add me to maintainers in some layers
=20=20meta-gnome: add README file
=20=20README: add -M to git send-email example
=20=20meta-ruby: Fix subject-prefix

Otavio Salvador (1):
=20=20p910nd: Fix the lock directory use

Paul Barker (8):
=20=20live555: change MIRROR for older versions
=20=20vim: use example vimrc from vim runtime files
=20=20vim: use correct license file
=20=20vim: update to 7.3.905
=20=20python-tornado: fix license name
=20=20ttf-arphic-uming: remove whitespace from license
=20=20ttf-inconsolata: fix license name
=20=20gateone: fix license name

Paul Eggleton (2):
=20=20net-snmp: move to meta-networking and tweak
=20=20collectd: add recipe for 5.2.2

Ross Burton (2):
=20=20gnome-keyring: add (from oe-core)
=20=20libgnome-keyring: add (from oe-core)

Wayne Warren (2):
=20=20qtserialport: Adds initial recipe.
=20=20qtserialport-e: Various fixes per openembedded-devel list comments.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Denys Dmytriyenko (5):
=20=20arago-prefs.inc: add selection between wilink versions
=20=20u-boot-am33x: follow version updates in meta-ti
=20=20linux-am335x: follow version updates in meta-ti
=20=20linux-ti-staging: lock on to ti2013.04.00 release
=20=20u-boot-ti-staging: lock on to ti2013.04.00 release

Eyal Reizer (8):
=20=20wlconf: configuration utility for wilink8 wireless driver
=20=20wl18xx-firmware: install Wilink8 wlan firmware files
=20=20hostap-daemon-wl18xx: hostap-daemon for ti wilink8 release
=20=20wpa-supplicant-wl18xx: build ti 2.0-devel version for wilink8
=20=20ti-wifi-utils-wl18xx: build the calibrator tool for wilin8
=20=20ti-compat-wireless-wl18xx: build Wilink8 drivers from TI-OpenLink
=20=20bt-firmware: update for including the wl18xx bt firmware
=20=20connectivity packagegroup: add wlconf for wilink8

Franklin S. Cooper Jr (7):
=20=20recipes: Fix append +=3D syntax
=20=20recipes: Split Matrix multimedia demos
=20=20crypto demos: Switch back to script based crypto demos for non am335x =
platfo
=20=20u-boot-am3517: Update u-boot recipe for am3517
=20=20meta-toolchain-arago-qte: Add OE_QMAKE_STRIP environment variable
=20=20am33x-cm3: Remove append from meta-arago
=20=20board-port-labs: Update to the latest version

Jeff Lance (1):
=20=20matrix-gui-2.0: Fix pidfile generation

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-beagleboard:

Koen Kooi (8):
=20=20extras: add layer
=20=20extras: gadget-init: import from meta-ti
=20=20extras: bone101: import from meta-ti
=20=20extras: bonescript: import from meta-ti
=20=20extras: beaglebone-getting-started: import from meta-ti
=20=20README.md: add meta-beagleboard-extras
=20=20Merge pull request #2 from RobertCNelson/beaglebone_raw_initrd
=20=20linux-mainline 3.8: update to 3.8.10

Robert Nelson (1):
=20=20u-boot: add patch to enable CONFIG_SUPPORT_RAW_INITRD

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

Fabio Estevam (6):
=20=20linux (3.0.35): Update 1.1.0 branch to top of tree
=20=20linux (3.0.35): Use 'branch' instead of 'tag'
=20=20linux (3.0.35): Include thermal sensor update on branh 1.1.0
=20=20README: Improve the 'Contributing' section
=20=20mxs-base.inc: Use 'linux-fslc' by default on mx23
=20=20linux-imx (2.6.35): Only use 2.6.35 1.1.0 for mx28

Otavio Salvador (7):
=20=20u-boot-fslc: Update to 2013.04 release
=20=20linux-fslc: Update to patches-3.8's snapshot from 20130420
=20=20xserver-xorg: Do not remove Xorg native DRI module
=20=20xf86-dri-vivante: Add rdepends for GLX, DRI and DRI2 Xorg's extensions
=20=20gpu-viv-bin-mx6q: Package DRI module
=20=20xf86-video-imxfb-vivante: Add rdepends on libvivante-dri-mx6
=20=20u-boot-fslc: Update to patches-2013.04's 20130425 snapshot

S. Fricke (1):
=20=20image_types_fsl.bbclass: Add support for kernel image types

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-ppc:

Zhenhua Luo (1):
=20=20Update README

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-guacamayo:

Ross Burton (2):
=20=20upstream/yocto: update to 1.3.1
=20=20alsa-plugins: package the unpackaged files

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix-community:

Andreas M=C3=BCller (2):
=20=20remove linux versions which were never used or did not work properly
=20=20linux-mainline-3.8: update to 3.8.8

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-handheld:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-igep:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Darren Hart (2):
=20=20linux-firmware: Correct rtl license file location
=20=20fri2: Disable MSI interrupts for the HDA device

Nitin A Kamble (1):
=20=20emgd-driver-bin: do not provide gl.pc

Richard Purdie (1):
=20=20meta-jasperforest: Fix BBFILES

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-java:

Martin Jansa (1):
=20=20llvm: Drop from meta-java, it was moved to meta-oe

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

Apelete Seketeli (1):
=20=20uicmoc: fix compile issue with GCC-4.7

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

Martin Jansa (17):
=20=20tuna: include tune-cortexa9
=20=20android-audiosystem: temporary inhibit debug split, debugedit is =
failing
=20=20meta-shr: switch to default OEBasicHash
=20=20Revert "tuna: include tune-cortexa9"
=20=20tuna: fix extra space in TUNE_CCARGS
=20=20shr: change feeds to shr-next for some next release
=20=20shr: fix DISTRO_VERSION
=20=20libhybris: incompatible with x86-64
=20=20android-audiosystem: current version works only with arm
=20=20samsung-rfs-mgr: exclude from world and add missing dependency
=20=20aurora-daemon: temporary inhibit debug split, debugedit is failing
=20=20aurora-daemon: use newer u-a syntax
=20=20phoneui-shr-theme: rename config file in do_install

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

Denys Dmytriyenko (3):
=20=20linux-ti-staging: update to ti2013.04.00 release
=20=20u-boot-ti-staging: update to ti2013.04.00 release
=20=20linux-am335x-psp: fix typo in the filename to use underscore

Franklin S. Cooper Jr (5):
=20=20linux-omap-psp: Update commit
=20=20linux-am335x: Update to latest 3.2 kernel release
=20=20u-boot-am33x: Update u-boot recipe to 2013.01.01
=20=20u-boot: Add am3517 u-boot recipe
=20=20am33x-cm3: Update to latest cm3 release

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

Iyad Qumei (1):
=20=20python: add various python modules

Martin Jansa (5):
=20=20Update format of Copyright headers to be consistent
=20=20webos: Add webos-recipe-blacklist and blacklist mesa-dri
=20=20openssl: Fix failing do_rootfs
=20=20webos_cmake: Fix sstate issue in OECMAKE_BUILDPATH
=20=20webkit-webos: Drop invalid test for gold and add -g1

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Michel Thebeau (1):
=20=20routerstationpro: move board off 3.4 and onto the 3.8 kernel

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:




