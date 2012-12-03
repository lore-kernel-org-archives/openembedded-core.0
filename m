Received: from new.bec-systems.com ([74.208.70.121] helo=bec-systems.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1TfeOF-0003Ll-3T; Mon, 03 Dec 2012 23:21:27 +0100
Received: from oh-69-34-21-229.sta.embarqhsd.net ([69.34.21.229]
	helo=happy.bec-systems.com)
	by bec-systems.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cliff.brake@gmail.com>)
	id 1Tfe0x-00040V-0G; Mon, 03 Dec 2012 16:57:29 -0500
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Date: Mon, 03 Dec 2012 22:06:51 GMT
Message-Id: <1354572411445.26ea9c29@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
X-Spam_score: -2.9
X-Spam_score_int: -28
X-Spam_bar: --
Subject: OE Changelog since 2012-11-25 until 2012-12-02
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
X-List-Received-Date: Mon, 03 Dec 2012 22:21:27 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2012-11-25 until 2012-12-02.  Projects included in this =
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
=20=20fetch2/wget: Fix for mixed-up wget commands

Cristiana Voicu (2):
=20=20hob: make some layers non removable
=20=20hob: when BBLAYERS_NON_REMOVABLE is not set hob shows an error

Richard Purdie (3):
=20=20Update version to 1.17.0
=20=20fetch2/local: Fix bug introduced by expression ambiguity
=20=20build/siggen.py: Avoid removing too many stamps when cleaning

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Cristian Iorga (1):
=20=20build-appliance-image: Updated to wget mixed-up commands fix

Cristiana Voicu (1):
=20=20bblayers.conf: Add a new variable to prevent certain layers to be =
removed

Laurentiu Palcu (1):
=20=20rootfs_ipk.bbclass: add missing --force_postinstall option

Li Wang (1):
=20=20openssh: CVE-2011-4327

Marko Lindqvist (1):
=20=20automake: update to upstream version 1.12.5

Martin Jansa (4):
=20=20arm/arch-arm*: define ARMPKGARCH_tune-* for default tunes
=20=20arch-arm: define different ARMPKGARCH when different CCARGS are used
=20=20tune-*: define more generic DEFAULTTUNE to share feed between machines
=20=20gstreamer, gst-plugins*: fix localdata

Noor Ahsan (1):
=20=20sysprof: Fixes undefined  reference to `rmb'

Richard Purdie (8):
=20=20sanity.conf: Increase minimum bitbake version requirement to 1.17.0 =
for FILE
=20=20bitbake.conf: Drop obsolete FILESDIR setting
=20=20bitbake.conf: Simplify FILESPATH
=20=20base.bbclass: Drop P and PN from FILESPATH
=20=20allarch: Allow class to be included but overridden
=20=20packagegroup/allarch: Convert to use allarch class
=20=20bitbake.conf: Change build output message to list BUILD_SYS, =
TARGET_SYS and=20
=20=20local.conf.sample: Enable disk space monitoring by default

Ross Burton (1):
=20=20autogen: use pkg-config directly instead of guile-config

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Andreas M=C3=BCller (1):
=20=20lxdm: bugfixes by updating to latest git

Andrei Dinu (1):
=20=20gypsy: added to meta-oe/recipes-navigation

Eric BENARD (2):
=20=20gammu: import from OE-classic and upgrade to 1.32.0
=20=20libdbi: import from OE-classic and update to latest 0.8.4

Eric B=C3=A9nard (4):
=20=20apache2: upgrade to 2.4.3
=20=20modphp: upgrade to 5.3.19
=20=20modphp: enable bz2, zip and mbstring
=20=20hiawatha: add CONFFILES and a php example

Joe MacDonald (1):
=20=20netperf: Correct license flags

Koen Kooi (2):
=20=20kernel bbclass: delete
=20=20gphoto2: fix gettext build error

Marc Ferland (1):
=20=20rrdtool: Remove hard-coded include in configure.ac

Martin Jansa (27):
=20=20evolution-data-server: fix build with libxml2-2.9.0
=20=20systemd-systemctl-native: fix FILESPATH to find systemctl
=20=20dhcp: rename bbappend to match new version from oe-core and move to =
oe-core=20
=20=20samba: update waf-as-source.patch to apply
=20=20xserver-nodm-init: replace 'WantedBy=3Dgraphical.target' by =
'Alias=3Ddisplay-man
=20=20xf86-video-glamo: adapt to xserver-0.13 video API
=20=20efl: upgrade to bugfix release 1.7.1
=20=20efl: EFL_SRCREV bump past 1.7.1 release and update PV in svn recipes
=20=20eve: add edbus to DEPENDS, but use older SRCREV which depends on =
edbus1 not=20
=20=20elementary-theme-efenniht: update path to shared images
=20=20efl-from-svn-recipes.inc: update to match new version
=20=20evas: add tiff to DEPENDS
=20=20ecore: disable some X extensions for native recipe and add libxfixes =
to targ
=20=20efl: update svn recipes to use 1.7 branch
=20=20e-base: bump EFL_SRCREV for E17 alpha2
=20=20e-base: bump EFL_SRCREV for E17 alpha3
=20=20e-wm: update path to icon_icon_theme.png, add some unpackaged files =
and xcb=20
=20=20e-wm: add work around for illume2 issues from r78978
=20=20e-wm-theme-b-and-w: add recipe for old default theme b_and_w
=20=20e-base.bbclass: bump EFL_SRCREV for E17 alpha4
=20=20edje: backport patch to fix e-wm build
=20=20edbus2: add recipe for new edbus implementation needed for eve and =
later efl
=20=20eve: bump SRCREV back to EFL_SRCREV and add edbus2 dependency
=20=20efl: upgrade to 1.7.2
=20=20e-wm: add setxkbmap to RDEPENDS
=20=20e-wm: fix file permissions on sysactions.conf
=20=20e-base.bbclass: bump EFL_SRCREV for E17 alpha5

Paul Eggleton (14):
=20=20ntp: cleanup recipes and fix SSL support
=20=20ntp: make servers configurable and default to none configured
=20=20tftp-hpa: add from OE-Classic, update and tidy up
=20=20tunctl: add from OE-Classic and tweak
=20=20quagga: add from OE-Classic, update and tidy-up
=20=20radvd: add from OE-Classic, update and tidy up
=20=20vblade: add from OE-Classic, update and tidy up
=20=20xl2tpd: add from OE-Classic, update and tidy up
=20=20proftpd: add from meta-baryon
=20=20mtr: add from OE-Classic, update and tidy up
=20=20libcgroup: remove
=20=20socat: remove
=20=20ptpd: remove
=20=20netperf: remove

Philip Balister (1):
=20=20python-cheetah : Drop RDEPENDS from native build.

Stefan Herbrechtsmeier (1):
=20=20opencv: update to 2.4.3 and fix some issues

chunrong guo (1):
=20=20inetutils : Update to 1.9.1

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Bruce Ashfield (1):
=20=20kernel.bbclass: remove explicit version.h target

Chase Maupin (2):
=20=20tisdk-image: class for making TI SDK images
=20=20arago-amsdk-image: Add TI AMSDK image recipe

Denys Dmytriyenko (6):
=20=20libjpeg-turbo: switch SRC_URI from https to http, some people =
reported probl
=20=20kernel.bbclass: overlay latest denzil version in distro part of =
meta-arago
=20=20meta-toolchain-arago: simplify stub creation, move python setup to gdb
=20=20meta-toolchain-arago: fix previous change for non-Arago toolchains
=20=20task-arago-qte-toolchain-target: depend on arago standalone task, not =
core
=20=20kernel.bbclass: sync up with meta-oe, bring in MACHINE_KERNEL_PR

Franklin S. Cooper Jr (13):
=20=20arago-amsdk-image: Add additional tasks and image
=20=20task-arago-tisdk-matrix: Remove wifi and bluetooth demos
=20=20matrix-gui-apps-git: Correct .desktop filenames
=20=20matrix-gui-clocks: Remove ${PN} package and fix RDEPENDS
=20=20board-port-labs: Tweak recipe
=20=20task-arago-tisdk-amsdk: Add a new SDK related task
=20=20arago-amsdk-image: Add task-arago-tisdk-amsdk-sdk-host
=20=20arago-tisdk-image: Add task-arago-tisdk-amsdk
=20=20wif-direct-demo: Remove unnecessary ${PN} from package list
=20=20arago-tisdk-image: Rename recipe to tisdk-rootfs-image
=20=20am-sysinfo: Update am-sysinfo to pulled in makefile fix
=20=20task-arago-toolchain-tisdk-target: Add =
task-arago-toolchain-tisdk-target
=20=20u-boot_2012.10-psp05.06.00.00: Remove environment variables patches

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-beagleboard:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-browser:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-bug:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-chicken:

Mario Domenech Goulart (2):
=20=20chicken: update to version 4.8.0
=20=20chicken: add types.db to chicken-dev

Otavio Salvador (1):
=20=20chicken_install.bbclass: Pass sysroot information while linking

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-efikamx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ettus:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm:

Alexandre Belloni (2):
=20=20gpu-viv-bin-mx6q.inc: fix indentation
=20=20gpu-viv-bin-mx6q.inc: remove warning about driver being stripped

Daiane Angolini (7):
=20=20libfslcodec: Add support for libfslcodec 3.0.1
=20=20libfslparser: Add libfslparser 3.0.1 support
=20=20libfslvpuwrap: Add libfslvpuwrap 1.0.17 support
=20=20gst-fsl-plugin.inc: Allow use of different source package
=20=20gst-fsl-plugin: Move fsl-mm-codeclib dependencies to 2.0.3 recipe
=20=20gst-fsl-plugin: Add gst-fsl-plugin 3.0.1 support
=20=20imx-base.inc: Allow mx6 to use accelerated codecs

Otavio Salvador (7):
=20=20fsl-mm-codeclib.inc: Drop duplicated files definition
=20=20mxsldr: Add recipe
=20=20amd-gpu-x11-bin-mx51: Use a python function to populate INSANE_SKIP
=20=20meta-toolchain: Include elftosb and mxsldr in toolchain
=20=20imx-lib: Set PACKAGE_ARCH to MACHINE_ARCH
=20=20imx-lib: Fix build system to allow override of CC and AR commands
=20=20linux-imx (3.0.35): Add Boundary Devices changes for imx6qsabrelite

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-ppc:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-guacamayo:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix:

Adam YH Lee (6):
=20=20Revert "Added a/ b/ prefixes to the file name"     Cleaning up =
commits which
=20=20Revert "Aaaah please work!"     Cleaning up commits which shouldn't =
have gon
=20=20Revert "Oops, gave it a wrong file name =3D("     Cleaning up commits =
which sh
=20=20Revert "Updated master"     Cleaning up commits which shouldn't have =
gone in
=20=20Revert "Removed white spaces from the patch file"     Cleaning up =
commits wh
=20=20Revert "Added rfkill patch to work in non-git environment"     =
Cleaning up c

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix-community:

Andreas M=C3=BCller (1):
=20=20linux-*: meta-oe's kernel.bbclass is gone ensure proper PRBump

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-handheld:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-igep:

Enrico Butera (1):
=20=20Merge pull request #12 from martinezjavier/master-next

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Alexandre Belloni (1):
=20=20emgd-driver-bin: add more necessary soft links

Nitin A Kamble (1):
=20=20emgd-driver-bin: add further needed soft links

Richard Purdie (1):
=20=20emenlow/qt: Drop emenlow qt bbappend since GL support is now the =
default

Ross Burton (1):
=20=20xf86-video-mga: upgrade and fix build

Tom Zanussi (1):
=20=20meta-intel.inc: remove xaa from matrox XSERVER variable

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

Andrei Gherzan (4):
=20=20tiff: Sync with version from oe-core
=20=20xserver-xorg: Sync with version from oe-core
=20=20qt4: Sync with version from oe-core
=20=20README.md: Add dependency to meta-networking

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-java:

Henning Heinold (2):
=20=20openjdk7: use right make command so addtional jvms are getting =
installed
=20=20openjdk7: bring back additional vms

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-kde:

Samuel Stirtzel (1):
=20=20Update qt4 bbappoends

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

Andrei Gherzan (16):
=20=20linux-libc-headers-raspberrypi: Add headers for raspberrypi kernel
=20=20rpi-default-providers: Use linux-libc-headers-raspberrypi
=20=20raspberrypi.conf: Remove RPI_GPU_FIRMWARE definition
=20=20rpi-default-versions: Remove preferred version of udev
=20=20firmware: Update to 537c78b113d06e37e2cca90a0b3d3f39a129ee23
=20=20bcm2835-bootfiles: Deploy .dat files too
=20=20linux-raspberrypi: Cleanup recipe
=20=20linux-raspberrypi: Update to 10182a3bc434b27740f81c2b836a1af943060241
=20=20linux.inc: Refactor inc file
=20=20rpi-config: Update to 62bf3e9db62f547eb1a2a352dde957d2f94bd216
=20=20rpi-config: Add variables to set memory split for 256/512 models
=20=20README: Replace old RPI_GPU_FIRMWARE with GPU_MEM variables
=20=20sdcard_image-rpi: Remove RPI_GPU_FIRMWARE and add/remove files to =
boot parti
=20=20userland: Initial integration
=20=20tune-*: define more generic DEFAULTTUNE to share feed between machines
=20=20arch-arm: define different ARMPKGARCH when different CCARGS are used

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

Denys Dmytriyenko (3):
=20=20keystone-evm.conf: enable cpio images by default
=20=20keystone-evm: update serial port and virtual terminal settings
=20=20keystone: bump MACHINE_KERNEL_PR for previous changes

Nicolas Dechesne (3):
=20=20Revert "libdrm: enable omap experimental api support"
=20=20Revert "xf86-video-omap: add new recipe for OMAP4/5 X11 video driver"
=20=20conf/machine: omap4: update configs after xorg upgrade

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

Herb Kuta (1):
=20=20qt4-webos: Fail if S isn't set correctly

Keith Derrick (1):
=20=20webos-image: luna-service2=3D145,v3.2.0,r9

Kimmo Leppala (1):
=20=20webappmanager: Add recipe

Martin Jansa (1):
=20=20webos.conf: use weak assignment for IMAGE_FSTYPES otherwise it =
overwrites BS

Timo Aarnipuro (2):
=20=20c-ares: Upgrade to version 1.9.1
=20=20c-ares: Remove monotonic clock hack

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Cristiana Voicu (1):
=20=20bblayers.conf: Add a new variable to prevent certain layers to be =
removed

Mihai Lindner (1):
=20=20upstream_tracking.inc: ltp and connman

Richard Purdie (1):
=20=20local.conf.sample: Enable disk space monitoring by default

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:




