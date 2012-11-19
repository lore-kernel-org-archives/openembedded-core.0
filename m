Received: from new.bec-systems.com ([74.208.70.121] helo=bec-systems.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1TaWcq-0003Zt-Cx; Mon, 19 Nov 2012 20:03:20 +0100
Received: from oh-69-34-21-229.sta.embarqhsd.net ([69.34.21.229]
	helo=happy.bec-systems.com)
	by bec-systems.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cliff.brake@gmail.com>)
	id 1TaWGM-0004a3-W9; Mon, 19 Nov 2012 13:40:09 -0500
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Date: Mon, 19 Nov 2012 18:49:08 GMT
Message-Id: <1353350948045.ae4f520b@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
X-Spam_score: -2.9
X-Spam_score_int: -28
X-Spam_bar: --
Subject: OE Changelog since 2012-11-11 until 2012-11-18
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
X-List-Received-Date: Mon, 19 Nov 2012 19:03:21 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2012-11-11 until 2012-11-18.  Projects included in this =
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
meta-fsl-ppc: git://github.com/Freescale/meta-fsl-arm-extra.git[submodule =
"meta-fsl-ppc"]
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
=20=20knotty: kill duplicated import of 'time'

Cristiana Voicu (1):
=20=20hob: hob was freezing because it doesn't receives well the log file

Robert Yang (1):
=20=20print clear message for "bitbake -e ASSUME_PROVIDED"

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Christopher Larson (1):
=20=20bash: fix mkbuiltins build failure

Constantin Musca (3):
=20=20puzzles: upgrade to r9660
=20=20libxslt: upgrade to 1.1.27
=20=20insane.bbclass: add qa package name check

Denis 'GNUtoo' Carikli (1):
=20=20boost: Activate zlib and bzip2 because they now work.

Enrico Scholz (2):
=20=20binutils: fixed --enable-targets option
=20=20opkg: added alternatives-ln patch

Gilbert Coville (1):
=20=20pulseaudio: explicitly disable xen, rather than letting it detect

Jessica Zhang (1):
=20=20Fix the first line typo of adt-installer

Laurentiu Palcu (8):
=20=20populate_sdk_base.bbclass: use SDK_ARCH instead of SDKMACHINE
=20=20xf86-video-vesa: upgrade to 2.3.2
=20=20xf86-video-intel: upgrade to 2.20.12
=20=20xf86-input-mouse: upgrade to 1.8.1
=20=20xcb-proto: upgrade to 1.8
=20=20fontconfig: upgrade to 2.10.1
=20=20mdadm: upgrade to 3.2.6
=20=20xf86-input-synaptics: add mtdev dependency

Mark Hatle (4):
=20=20rpm: Slightly change the way python-rpm is constructed
=20=20python-smartpm: Add smartpm recipe
=20=20rpm: Add additional RPMSENSE values to python module
=20=20python-smartpm: Add basic knowledge of RPMSENSE_MISSINGOK

Martin Jansa (1):
=20=20qt4: remove -lGLU from QMAKE_LIBS_OPENGL in our linux.conf

Phil Blundell (1):
=20=20insane: detect and warn about relocations in .text

Richard Purdie (11):
=20=20libc-common: Ensure sysconfdir exists before installing files to it
=20=20python.inc: make lsb override more concise
=20=20sstate: Be consistent about sstate-inputdirs/outputdirs ending with =
'/'
=20=20classes: Be consistent about sstate-inputdirs/outputdirs ending with =
'/'
=20=20utils.bbclass: Fix documentation of create_cmdline_wrapper
=20=20sstate: Fix various path manipulation issues
=20=20sstate: Bump version number to deal with layout fixes
=20=20make-3.82: Add patch for archive expression expansion issues
=20=20python: Resolve intermediate staging issues
=20=20sstate: Drop now unneeded python whitelist entries
=20=20libcgroup/libxkbcommon: Use BPN in SRC_URI

Ross Burton (11):
=20=20autotools: set _FOR_BUILD variables here
=20=20meta: remove redundant _FOR_BUILD variables
=20=20xorg-driver-common: remove AC_CHECK_FILE workaround
=20=20glib-2.0: remove zip build dependency
=20=20glib-2.0: upgrade to latest stable, 2.34.1.
=20=20mesa: remove python2 detection hack
=20=20libunique: fix compilation with GLib 2.34
=20=20initrdscripts: fix udevd in the live boot init scripts
=20=20mesa-demos: fix --with-glut check
=20=20default-providers: add default provider for make
=20=20cmake.bbclass: use DEPENDS_prepend instead of +=3D for cmake-native

Saul Wold (6):
=20=20pulse: fix Bashism in string test
=20=20mx: Update to 1.4.7
=20=20kconfig-frontends: Update to 3.6
=20=20psmisc: Update to 22.20
=20=20packagegroup-self-hosted: add sftp server
=20=20less: Update to 451

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Andrea Adami (2):
=20=20klibc: refactor runtime deps for shared utils
=20=20klibc: upgrade from 2.0.1 to 2.0.2

Andreas M=C3=BCller (5):
=20=20lighttpd: move systemd appends since recipe is in oe-core
=20=20gvfs: fix build
=20=20gvfs-gdu-volume-monitor: fix build after oe-core's libexecdir =
transition
=20=20gnome-desktop: copy omf.make from ${STAGING_DATADIR_NATIVE} instead =
${STAGIN
=20=20thunar: add xfce4-panel to dependencies to ensure trash-plugin (tpa) =
is buil

Bruce Ashfield (1):
=20=20kernel.bbclass: remove explicit version.h target

Eric BENARD (1):
=20=20mercurial-native: fix install

Holger Hans Peter Freyther (1):
=20=20systemd: Make the main systemd files proper CONFFILES

Jack Mitchell (2):
=20=20hiawatha: update to 8.6
=20=20hiawatha: disable caching by default

Martin Jansa (1):
=20=20omgps: add patch to fix build with latest glib from oe-core

Stefan Herbrechtsmeier (1):
=20=20python-numpy: Move static libraries to -staticdev

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Denys Dmytriyenko (9):
=20=20external-arago-sdk-toolchain: package up gdb from the toolchain as =
well
=20=20task-arago-cross-canadian: add crosssdk gdb to the devkit
=20=20meta-toolchain-arago: special case for gdb to be built as part of =
canadian-c
=20=20external-arago-sdk-toolchain: provide and package gdb conditionally
=20=20meta-toolchain-arago: improve shell stubs to atomatically source =
env-setup s
=20=20arago.conf: abstract setting external Arago toolchain
=20=20toolchain-external-linaro: add seetings for selecting Linaro toolchain
=20=20arago-tisdk-image,task-arago-tisdk-addons: move arago-test out of =
addons
=20=20arago-headless-tisdk-image: provide a headless version ot TISDK image

Franklin S. Cooper Jr (12):
=20=20linux-am335x: Update psp 04.06.00.08 recipe
=20=20linux-am335x_3.2.0-psp05.06.00.00: Disable CONFIG_LOCALVERSION_AUTO =
option
=20=20arago.conf: Setting PREFERRED_VERSIONS
=20=20gst-ffmpeg: Select a non GPLv3 license
=20=20qt4-tools-nativesdk: Select LGPLv2.1 license
=20=20u-boot: Add PSP version 05.06.00.00 of u-boot
=20=20u-boot_2012.10-psp05.06.00.00: Fix mmc boot environment settings
=20=20u-boot_2012.10-psp05.06.00.00: Add NAND environment variables
=20=20u-boot_2012.10-psp05.06.00.00: Add SPI environment variables
=20=20u-boot_2012.10-psp05.06.00.00: Add NET environment variables
=20=20arago.conf: Switch to latest PSP u-boot release
=20=20meta-toolchain-arago-qte: Fix mkspecs location

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-beagleboard:

Koen Kooi (1):
=20=20common-bsp: linux-mainline: add recipe for 3.7.0-rc5

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

Otavio Salvador (1):
=20=20README: Update to point to the newer mailing list

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-ppc:

Matthew McClintock (1):
=20=20u-boot_git.bb: use upstream u-boot for e6500 parts for now

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-guacamayo:

Ross Burton (1):
=20=20Move the Poky tag to the 1.3 release

Tomas Frydrych (2):
=20=20Updated Rygel to 0.16.2
=20=20Move preferred versions out of our layer.conf into the distro conf

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix-community:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-handheld:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-igep:

Javier Martinez Canillas (1):
=20=20igep00x0: add u-boot config option to built with NAND support

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Tom Zanussi (1):
=20=20meta-intel: remove explicit kernel SRCREVs

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

Andrei Gherzan (1):
=20=20linux-yocto: Fix af bus patch to be usable with poky master version

Florin Sarbu (4):
=20=20eglibc_2.16_bbappend: Use FILESEXTRAPATHS_prepend so that other =
bbappends fo
=20=20README.md: Add reference to meta-openembedded/meta-gnome to be     =
put into=20
=20=20keyutils: Added patch to fix CFLAGS when building for     x86 targets.
=20=20Add opengl to DISTRO_FEATURES through poky-ivi-systemd.conf,     =
removed ope

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

Lukas M=C3=A4rdian (1):
=20=20meta-openmoko: gta04: add kernel patch to enable hwrouting

Martin Jansa (11):
=20=20meta-openmoko: u-boot: bump SRCREV for new multiboot support
=20=20busybox: enable stat applet
=20=20shr: drop entries for meta-oe blacklist
=20=20meta-openmoko: update S after SRCREV bump
=20=20meta-shr: use new name udev-extraconf instead of udev-extra-rules
=20=20shr-splash-theme: move allarch inherit to recipes which need it
=20=20shr-splash-theme: use new update-alternatives syntax
=20=20shr-wizard: bump PR to rebuild against new E17 alpha3
=20=20chroot-image: remove BUILDNAME from sstate checksum
=20=20shr-e-gadgets: bump PR to rebuild against new E17 alpha3
=20=20chroot-image: exclude DATETIME from IMAGE_NAME vardeps

Simon Busch (7):
=20=20meta-samsung: linux-samsung-tuna: bump SRCREV and disable =
wakelock/earlysusp
=20=20meta-samsung: libgles-android: rework installation process to copy =
relevant=20
=20=20meta-samsung: chroot-script: setup devtmpfs for mounted rootfs as well
=20=20meta-samsung: linux-samsung-tuna: bump SRCREV and disable =
CONFIG_DHD_ENABLE_
=20=20meta-samsung: chroot-script: execute installation script when =
available
=20=20meta-samsung: linux-samsung-tuna: bump SRCREV
=20=20meta-samsung: base-files: don't mount /var/volatile as tmpfs anymore

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

Chase Maupin (1):
=20=20conf/machine: Update the FSTYPES for AMSDK machines

Franklin S. Cooper Jr (2):
=20=20libgles-omap3: Adjust for non X11 distros
=20=20libgles-omap3: Verify pvrsrvkm module was found

Paul Woegerer (1):
=20=20linux-omap4-3.1.0: Add sched_process_exec tracing

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

Keith Derrick (1):
=20=20webos-image: luna-service2=3D144

Steve Lemke (1):
=20=20webos-image submission: qt=3D1.02

Teppo Pennanen (1):
=20=20keyboard-efigs: Add recipe

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Bogdan Marinescu (1):
=20=20upstream_tracking.inc: update for 1.4 planning

Cristian Iorga (1):
=20=20upstream_tracking.inc: update according to YP 1.4

Radu Moisan (2):
=20=20upstream_tracking: update for 1.4 planning
=20=20upstream_tracking.inc: Update hdparm

Richard Purdie (1):
=20=20poky.conf: Enable warning on textrel QA check

Saul Wold (2):
=20=20maintainers: Update file with missing maintainers
=20=20upstream_tracking: Update for 1.4 Planning

Stefan Stanacar (1):
=20=20yocto-bsp: update qemu machine.conf template

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:




