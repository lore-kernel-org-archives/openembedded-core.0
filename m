Received: from new.bec-systems.com ([74.208.70.121] helo=bec-systems.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1UeUZJ-0001OI-Pp; Mon, 20 May 2013 20:12:29 +0200
Received: from oh-67-76-203-50.sta.embarqhsd.net ([67.76.203.50]
	helo=happy.bec-systems.com)
	by bec-systems.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cliff.brake@gmail.com>)
	id 1UeUEl-0002Q1-Ia; Mon, 20 May 2013 13:51:16 -0400
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Date: Mon, 20 May 2013 17:53:43 GMT
Message-Id: <1369072423574.57d13ca5@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
X-Spam_score: -2.9
X-Spam_score_int: -28
X-Spam_bar: --
Subject: OE Changelog since 2013-05-12 until 2013-05-19
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
X-List-Received-Date: Mon, 20 May 2013 18:12:49 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2013-05-12 until 2013-05-19.  Projects included in this =
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

Bogdan Marinescu (1):
=20=20hob: fix for XMLRPC mode

Richard Purdie (6):
=20=20cooker/bitbake-layers/tinfoil: Fix recipecache typo
=20=20bin/bitbake: Fix queue import for pyhton 2 and 3
=20=20tests/fetch: Allow to work on python 2.6
=20=20fetch2/utils: Clean up imports
=20=20test/fetch: Split the network tests from the rest of the fetcher tests
=20=20test/fetch: Allow the conditional network tests to work under python =
2.6

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Bogdan Marinescu (1):
=20=20scripts/hob: enable additional arguments

Bruce Ashfield (3):
=20=20kern-tools: refresh and make dash compliant
=20=20linux-yocto: add qemumips64 compatibility
=20=20linux-yocto/3.8: set qemumips64 SRCREVs

Cristian Iorga (1):
=20=20python-pygobject-native: fix build dependency on python-native

Ionut Radu (6):
=20=20libxi: updated from 1.7 to 1.7.1
=20=20json-glib: updated from 0.15.2 to 0.16.0
=20=20libfontenc: Updated from 1.1.1 to 1.1.2
=20=20ethtool: Updated from 3.8 to 3.9
=20=20pixman: Update from 0.29.2 to 0.29.4
=20=20gpgme: Updated from 1.4.0 to 1.4.1

Jonathan Liu (3):
=20=20syslinux: Update to 4.06
=20=20boot-directdisk: Scope HDDDIR and HDDIMG variables to avoid conflicts
=20=20xf86-video-modesetting: upgrade to 0.7.0

Jukka Rissanen (5):
=20=20connman: Add VPN support
=20=20connman: Add OpenVPN support
=20=20connman: Add vpnc support
=20=20connman: Add L2TP support
=20=20connman: Add PPTP support

Khem Raj (4):
=20=20image.bbclass: Add package-management image feature to validitems
=20=20runqemu: Replace use of ifconfig with ip
=20=20binutils: Add broadcom XLP support
=20=20machine/qemumips64: Add machine definition

Laurentiu Palcu (1):
=20=20systemd: make udev-hwdb postinstall run on host

Martin Jansa (1):
=20=20bitbake.conf: define empty EXTRA_IMAGE_FEATURES before using them

Mike Looijmans (1):
=20=20busybox-mdev: Startup at level S03 instead of S06

Peter Seebach (1):
=20=20sanity.bbclass: Attach the missing value to a format string.

Richard Purdie (1):
=20=20package.bbclass: Fix sources contents

Robert Yang (2):
=20=20cachedpath.py: global name 'error' is not defined
=20=20bbclass: bb.fatal() clean up

Ross Burton (3):
=20=20glib-2.0: drop dependency on python-argparse
=20=20gtk+3: disable Xinerama support
=20=20libcroco: allow native builds

Saul Wold (3):
=20=20pkgconfig: Update to 0.28
=20=20rpm-postinst: remove un-needed RDEPENDS on base-files
=20=20Revert "initramfs-live-install*: fix the "install" boot option"

Stefan Herbrechtsmeier (1):
=20=20tcf-agent: Use common two-digit sequence numbers for init script links

Stefan Stanacar (4):
=20=20connman: replace hardcoded path in init script and systemd service
=20=20qemuimage-testlib: add support for extra arguments passed to runqemu
=20=20qemuimage-testlib: pass optional timeout to ssh function
=20=20qemuimage-testlib: change default directory for target tests

Zongchun Yu (1):
=20=20toolchain-scripts.bbclass:Add CROSS_COMPILE variable to =
environment-setup fi

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Andrea Adami (4):
=20=20initramfs-kexecboot(-klibc)-image: Drop legacy export of =
IMAGE_BASENAME
=20=20kexecboot(-klibc): remove runtime dependency on kexec(-klibc)
=20=20klibc: fix KLIBCARCH for x86-64, powerpc and powerpc64
=20=20kexec-tools-klibc_2.0.2: refactor and extend patches for building

Andreas M=C3=BCller (19):
=20=20proftpd: pack missing files
=20=20gnome-terminal: add gnome-common-schemas to RRECOMMENDS
=20=20poppler: fix config option --disable-poppler-qt to =
--disable-poppler-qt4
=20=20poppler: fix build for soft FPU machines
=20=20maliit-framework: fix build with glib 2.36
=20=20thunar: update to 1.6.3
=20=20thunar-plugin.bbclass: initial add
=20=20thunar-archive-plugin: initial add 0.3.1
=20=20xarchiver: align libexecdir so that thunar-archive-plugin finds tap =
files
=20=20thunar-media-tags-plugin: initial add 0.2.1
=20=20packagegroup-xfce-extended: add thunar plugins
=20=20xfwm4: update to 4.10.1
=20=20xfce4-terminal: update to 0.6.2
=20=20xfce4-panel: update to 4.10.1
=20=20garcon: update to 0.2.1
=20=20garcon: do not display settings in menu which are in settings-manager
=20=20libxfce4util: update to 4.10.0
=20=20xfce4-session: update to 4.10.1
=20=20xfce4-appfinder: update to 4.10.1

Jonathan Liu (1):
=20=20dmidecode: remove

Jukka Rissanen (2):
=20=20vpnc: Runtime dependency to perl was missing
=20=20vpnc: Set RDEPENDS to perl-module-io-file instead of perl

Khem Raj (2):
=20=20LuaJIT: Upgrade 2.0.0 -> 2.0.1
=20=20gnome-bluetooth: Fix build erorrs found with gcc 4.8

Koen Kooi (2):
=20=20read-edid: add 2.0.0
=20=20pv: add pipe viewer, version 1.4.6

Martin Jansa (1):
=20=20python-numpy: fix formating

Otavio Salvador (1):
=20=20samba: Add usershare directory to the package

Paul Eggleton (7):
=20=20apache2: update to 2.4.4
=20=20apache2: drop unneeded workaround for apr/apr-util config script issue
=20=20modphp: update to 5.4.15
=20=20modphp: fix text relocation QA warning
=20=20modphp: fix re-exec of do_install
=20=20phpmyadmin: update to 3.5.8.1
=20=20phpmyadmin: remove dependency on bash

Philip Balister (1):
=20=20python-numpy : Add support for x86-64 builds.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Khem Raj (4):
=20=20angstrom: Define PREFERRED_PROVIDER for eglibc
=20=20angstrom-next: Flip the switch to gcc 4.8
=20=20angstrom-java: Refresh pinned recipes
=20=20angstrom-jalimo: Remove pinned versions

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Denys Dmytriyenko (2):
=20=20arago-prefs: fix override for am180x-evm to use ltp-ddt-legacy
=20=20ltp-ddt: handle new realtime test cases

Franklin S. Cooper Jr (14):
=20=20ltp-ddt-legacy-1.0: Add ltp-ddt recipe that supports 3.2 or older =
kernels
=20=20ltp-ddt-legacy: Duplicate ltp-ddt append
=20=20confs: Use ltp-ddt-legacy recipe for several machines
=20=20linux-am335x: Update variables for sourceipk
=20=20meta-arago conf files: Use updated recipe names
=20=20branding-amsdk: Update to latest versions for u-boot and graphics sdk
=20=20packagegroup-arago-tisdk-*: Add back removed packages
=20=20packagegroup-arago-tisdk-amsdk-sdk-host: Conditionally include =
tisdk-readme
=20=20packagegroup-arago-tisdk-amsdk-sdk-host: Only include uEnv.txt when =
needed
=20=20wpa-gui-e: Fix "was not declared in this scope" compiler error
=20=20battleship: Fix "error: 'sleep' was not declared in this scope
=20=20qt-stat: Pull in fix for "taking address of temporary"
=20=20Revert "packagegroup-*-connectivity: disable battleship and wpa-gui-e =
for no
=20=20Revert "packagegroup-*-matrix: disable battleship demos for now"

Nelson, Sam (1):
=20=20arago-console: Adding pciutils package

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-beagleboard:

Koen Kooi (5):
=20=20linux-mainline 3.8: update 3.8.13
=20=20linux-mainline 3.8: drop patch that breaks PRU support
=20=20gdaget-init: package serial getty file
=20=20linux-mainline 3.8: add cape resources and PRU capes

Robert Nelson (1):
=20=20gadget-init: bypass broken MAC calculation when device tree =
mac-address is p

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-browser:

Andreas M=C3=BCller (1):
=20=20chromium: fix build with glib >=3D 2.35

Khem Raj (2):
=20=20nss: Build on mips64
=20=20libxi: Match the bbappend to OE-Core

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

Otavio Salvador (2):
=20=20xf86-input-evdev: Follow OE-Core upgrade to 2.8.0
=20=20linux-fslc: Update to 3.8.13 stable release

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

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

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-igep:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Khem Raj (1):
=20=20tiny-init: Drop the bbappend

Kishore Bodke (1):
=20=20romley: Update maintainer info

Nitin A Kamble (5):
=20=20xf86-input-synaptics_1.6.3: keep older version for EMGD based BSPs
=20=20crownbay: specify preferred version of the xf86-input-synaptics recipe
=20=20emenlow: specify preferred version of the xf86-input-synaptics recipe
=20=20fri2: specify preferred version of the xf86-input-synaptics recipe
=20=20sys940x: specify preferred version of the xf86-input-synaptics recipe

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

Andrei Gherzan (1):
=20=20ivi-image.inc: Don't run remove_packaging_data_files

Florin Sarbu (1):
=20=20pulseaudio: Add pulseaudio-server rpm to packagegroup-core-p2.bb     =
instead

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

Martin Jansa (4):
=20=20meta-shr: refresh randr-support patch for xserver-xorg
=20=20android-system-image: append BUILDDATE to filenames

Simon Busch (3):
=20=20meta-android: android-system-compat: create package for different =
android co
=20=20meta-samsung: tuna: drop alsa-ucm-conf-tuna from =
MACHINE_EXTRA_RDEPENDS
=20=20meta-android: android-audiosystem: build and package test application =
too

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

Ameya Palande (1):
=20=20webos-image: pmloglib=3D27,v3.0.0

Eric Blade (1):
=20=20webos-image: pmloglib=3D26

Roger Stringer (1):
=20=20Add LevelDB as build dependency for DB8

Sangwoo Kang (2):
=20=20packagegroup-webos-test: Add netperf
=20=20packagegroup-webos-test: Add iftop

Seungkyun Kim (3):
=20=20webos-image-devel: valgrind=3Dv3.8.1
=20=20webos-image-devel: add htop package
=20=20webos-image-devel: add nmon package

Susan Montooth (1):
=20=20webos.conf: Correct maintainer email

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Khem Raj (1):
=20=20poky.conf: Adjust DISTRO vars post 1.4 release

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:




