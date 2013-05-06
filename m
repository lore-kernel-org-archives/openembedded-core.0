Received: from new.bec-systems.com ([74.208.70.121] helo=bec-systems.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1UZNo0-0007Wk-TI; Mon, 06 May 2013 17:58:31 +0200
Received: from oh-67-76-203-50.sta.embarqhsd.net ([67.76.203.50]
	helo=happy.bec-systems.com)
	by bec-systems.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cliff.brake@gmail.com>)
	id 1UZNUJ-0000KQ-F1; Mon, 06 May 2013 11:38:08 -0400
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Date: Mon, 06 May 2013 15:40:11 GMT
Message-Id: <1367854811006.7d696b7c@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
X-Spam_score: -2.9
X-Spam_score_int: -28
X-Spam_bar: --
Subject: OE Changelog since 2013-04-28 until 2013-05-05
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
X-List-Received-Date: Mon, 06 May 2013 15:58:35 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2013-04-28 until 2013-05-05.  Projects included in this =
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
=20=20bitbake: remove stack trace depth limitation

Laurentiu Palcu (1):
=20=20data_smart.py: add some internal bitbake variables to configuration =
hash

Martin Donnelly (1):
=20=20goggle: fix invalid error check

Richard Purdie (1):
=20=20prserv/cooker: Handle PRService errors cleanly

Vanveerdeghem, Simon (1):
=20=20fetch2/svn: Do not save authentication

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Bogdan Marinescu (1):
=20=20rpm: change arch scoring items

Cristian Iorga (1):
=20=20netbase: upgrade to 5.1

Darren Hart (4):
=20=20mkefidisk: Attempt to automatically unmount target device
=20=20mkefidisk: Unmount after partitioning
=20=20dmidecode: Add dmidecode to dev tools
=20=20grub-efi-native: Cleanup whitespace

Enrico Scholz (1):
=20=20systemd-systemctl: parse unit files more correctly

Eric B=C3=A9nard (2):
=20=20apt: update to 0.9.7.8
=20=20dropbear: update to 2013.58

Jack Mitchell (2):
=20=20connman: update to 1.13
=20=20connman: add PACKAGECONFIG options

Jessica Zhang (1):
=20=20Make toolchain output name using SDK_VERSION instead of =
DISTRO_VERSION to be

Josh Cartwright (1):
=20=20gcc-4.7: fix gcc ICE when building with gcc-4.8

Jukka Rissanen (1):
=20=20neard: Rename the recipe as we are already in 0.10

Laurentiu Palcu (8):
=20=20qemuwrapper: use fallback in case the ELF binary is wrong
=20=20pango: fix postinstall when using multilib
=20=20Revert "qemu.bbclass: Use the correct qemu binary in multilib cases"
=20=20scripts/postinst-intercepts: create separete hooks for multilib
=20=20Pass the mlprefix to postinst_intercept script
=20=20menu-cache: Fix segmentation fault
=20=20adt-installer: do not dereference symlinks when relocating
=20=20archive-*-source.bbclass: have do_dumpdata_create_diff_gz task run =
before do

Marcin Juszkiewicz (1):
=20=20cpan.bbclass: use '|' as sed separator for entry with paths

Martin Jansa (3):
=20=20conf/machine: use .=3D instead of +=3D in TUNE_CCARGS
=20=20tune-thumb.inc: Remove, replaced by arm/feature-arm-thumb.inc
=20=20buildhistory: change default BUILDHISTORY_DIR to TOPDIR

Otavio Salvador (1):
=20=20mesa-demos: Use PACKAGECONFIG to enable/disable features

Paul Eggleton (27):
=20=20connman-conf: add SUMMARY and DESCRIPTION
=20=20eglibc: add common HOMEPAGE and SUMMARY for eglibc-locale
=20=20gettext-minimal-native: add SUMMARY and DESCRIPTION
=20=20build-appliance-image: add SUMMARY, HOMEPAGE and improve DESCRIPTION
=20=20libcgroup: add SUMMARY and better DESCRIPTION
=20=20readline: add SUMMARY
=20=20external-sourcery-toolchain: add SUMMARY
=20=20icon-naming-utils: add SUMMARY and DESCRIPTION
=20=20mtools: use same SUMMARY as newer version of mtools recipe
=20=20which: use the same meta fields for both versions
=20=20libxml-simple-perl: add SUMMARY, DESCRIPTION and HOMEPAGE
=20=20python-smartpm: fix HOMEPAGE and adjust DESCRIPTION
=20=20gnome-doc-utils: add SUMMARY and DESCRIPTION
=20=20packagegroup-core-x11-xserver: set SUMMARY instead of SUMMARY_${PN}
=20=20rgb: add SUMMARY and DESCRIPTION
=20=20xeyes: add SUMMARY and DESCRIPTION
=20=20gst-openmax: add SUMMARY, DESCRIPTION and HOMEPAGE
=20=20hwlatdetect: add SUMMARY and DESCRIPTION
=20=20ptest-runner: add SUMMARY, DESCRIPTION and HOMEPAGE
=20=20core-image-directfb: add SUMMARY
=20=20gpgme: add short SUMMARY
=20=20sysvinit-inittab: ensure unique label for SERIAL_CONSOLES entries
=20=20bitbake.conf: set SERIAL_CONSOLES from SERIAL_CONSOLE by default
=20=20sysvinit-inittab: remove specific handling of SERIAL_CONSOLE
=20=20shadow-securetty: change to handle SERIAL_CONSOLES
=20=20systemd-serialgetty: change to handle SERIAL_CONSOLES
=20=20classes/image: allow complementary package globs to be extended

Phil Blundell (15):
=20=20libxslt: Avoid regenerating manpage during "make install"
=20=20sstate: Set umask to 002 before packaging runs
=20=20gdb-cross: Adjust ${datadir} to avoid file conflicts in sysroot
=20=20eglibc: Avoid "installed but not shipped" warning for ld.so.conf
=20=20bitbake.conf: Don't add ${PN} to RRECOMMENDS_${PN}-dbg
=20=20gdb: Disable hard-coding of library rpaths
=20=20gettext: Make ncurses dependency conditional on =
PACKAGECONFIG[msgcat-curses]
=20=20libpcre: Make readline dependency conditional on =
PACKAGECONFIG[pcretest-read
=20=20glib: Add --disable-man to configure arguments
=20=20alsa-utils: Move alsaconf to its own recipe
=20=20xkeyboard-config: Remove xkbcomp from RDEPENDS_${PN}
=20=20qt4: Fix sundry erroneous assumptions about ${prefix}
=20=20image.bbclass: Don't mark do_rootfs and do_build as nostamp
=20=20gcc-runtime: Avoid error when trying to remove nonexistent directories
=20=20fs-perms.txt: Don't tinker with file modes in /usr/src/debug

Richard Purdie (3):
=20=20qemuimage-testlib-pythonhelper: Make the process detection more strict
=20=20dpkg: Ensure target packages don't reference perlnative
=20=20path.py: Deal with race issue

Robert Yang (1):
=20=20sstate.bbclass: make hard links for staging files

Ross Burton (4):
=20=20webkit-gtk: remove gnome-keyring dependency
=20=20matchbox-panel-2: bump srcrev to fix compile warnings
=20=20neard: re-order recipe so the statement order is logical
=20=20neard: add systemd unit file

Saul Wold (19):
=20=20less: Update to 458
=20=20lsbinitscripts: Update to 9.46
=20=20sysstat: Update to 10.1.5
=20=20sqlite: Update to 3071602
=20=20dhcp: Update to 4.2.5-P1
=20=20resolvconf: Update to 1.71
=20=20dpkg: Update to 1.16.10
=20=20file: Update to 5.14
=20=20libffi: Update to 3.0.13
=20=20nspr: Update to 4.9.6
=20=20libgcrypt: Update to 1.5.1
=20=20pkgconfig: Move patches in prep for 0.28 update
=20=20libxkbcommon: Update to 0.3.0
=20=20glew: fix generation of glew.pc needed by mesa-demos
=20=20mesa-demos: Update to 8.1.0
=20=20glib-2.0: Update to 2.36
=20=20glib-networking: Update to 2.36
=20=20build-appliance: Add version info
=20=20libpcap: Fix up patches

Stefan Stanacar (3):
=20=20scripts/contrib/build-perf-test.sh: use the same identation everywhere
=20=20scripts/contrib/build-perf-test.sh: skip network sanity tests
=20=20scripts/contrib/build-perf-test.sh: change the global results format

Tomas Frydrych (3):
=20=20sudo: disable SSP for auxiliary build tools mksiglist and mksigname
=20=20image_types: fix default location of kernel when generating elf images
=20=20ia32-base.inc: remove inapropriate grub dependency

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Andreas M=C3=BCller (14):
=20=20xfce4-session: remove unconditional consolekit RDEPENDS and use =
PACKAGECONFI
=20=20zenity: fix build
=20=20libgnomecanvas: update 2.30.3 to fix build
=20=20gnome-power-manager: fix configure
=20=20gnome-power-manager: fix compile
=20=20libgnome: fix compile
=20=20dhcp: do not start dhclient by default on boot
=20=20gvfs: slightly update to 1.10.1 and backport patches to build with =
glib 2.36
=20=20gnome-disk-utility: backport property DeviceAutomountHint
=20=20orbit2: update to 2.14.17 to fix build with glib 2.36
=20=20geany: update to 1.23 to fix build with glib 2.36
=20=20gdm: fix postinst-code to unbreak first boot issues
=20=20gdm: avoid displaying system users in greeter's list
=20=20gdm: cosmetics

Jack Mitchell (5):
=20=20hiawatha: update to 9.1
=20=20php: remove obsolete CFLAGS
=20=20php: remove unnecessary LIBS export
=20=20php: remove unneeded THREADS export
=20=20php: move INSTALL_ROOT over to EXTRA_OEMAKE

Khem Raj (2):
=20=20nuttcp_7.2.1.bb: Add new recipe
=20=20ntp: Move sntp before ntp-utils in packaging order

Koen Kooi (3):
=20=20dropbear@.service: don't kill screen/tmux processes on disconnect
=20=20xbmc: add patch to make 'ld-is-gold' work with configure
=20=20xbmc: convert to PACKAGECONFIG and fix runtime dependencies

Lukas Bulwahn (1):
=20=20python-dateutil: update to 1.5

Marcin Juszkiewicz (1):
=20=20modphp: update to 5.4.14

Martin Jansa (12):
=20=20llvm2.9: add LLVM_EXTRA_ARCH to enable X86 unless building for x86
=20=20compat-wireless: exclude from world
=20=20libnotify3, nautilus3: exclude from world
=20=20meta-multimedia/README: add dependency on meta-ruby
=20=20e-wm-0.17.2.1: Update checksums, tarball was repackaged upstream :/
=20=20openssh: rename bbappend to match new version from oe-core
=20=20dropbear: rename bbappend to match new version from oe-core
=20=20dhcp: rename bbappend to match new version from oe-core
=20=20connman: rename bbappend to match new version from oe-core
=20=20connman: Fix .bbappend name
=20=20README: show github mirror URL in layer dependencies
=20=20xbmc: append +gitr${SRCPV} to PV not PR

Paul Eggleton (3):
=20=20apache2: fix multilib builds
=20=20strongswan: move to meta-networking
=20=20sthttpd: add recipe

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Denys Dmytriyenko (5):
=20=20ti-tisdk-setup: update to the latest to pull fixes
=20=20arago.conf: lower the path length slightly, so it fits in qt4-tools =
limits
=20=20ti-tisdk-setup: pull latest rev again for one more fix
=20=20arago.conf: set default toolchain to Linaro, bump distro/SDK version

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-beagleboard:

Koen Kooi (3):
=20=20linux.inc: redo dtb packaging to make upgrades work again
=20=20linux-mainline 3.8: update to 3.8.11
=20=20linux-mainline 3.8: camera and hdmi audio improvements

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-browser:

Laurentiu Palcu (1):
=20=20nss: change shebang line for smime script

Martin Jansa (1):
=20=20nspr: rename bbappend to match new version from oe-core

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

Daiane Angolini (11):
=20=20imx23evk: Fix machine name, include vendor name
=20=20imx28evk: Fix machine name, include vendor name
=20=20imx31pdk: Fix name and description, add SOC
=20=20imx35pdk: Fix machine name and description, include SOC
=20=20imx51evk: Fix machine name, include SOC
=20=20imx53ard: Fix machine name, include SOC
=20=20imx53qsb: Fix machine name and description, include SOC
=20=20imx6dlsabresd: include vendor name and SOC
=20=20imx6qsabreauto: : include vendor name and SOC
=20=20imx6qsabresd: include vendor name and SOC
=20=20imx6slevk: Fix machine name and description, include SOC

Javier Viguera (1):
=20=20gst-fsl-plugin: add fsl-mm-mp3enc and fsl-mm-flv dependences

Mahesh Mahadevan (1):
=20=20linux-imx (2.6.35): mxs and mx5: Update to latest from FSL GIT

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

Otavio Salvador (1):
=20=20netbase: Remove persistency MAC script

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-ppc:

Zhenhua Luo (1):
=20=20fmc: deploy header and library into sysroot

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-guacamayo:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix-community:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-handheld:

Andrea Adami (1):
=20=20linux-yocto_3.8: remove spi-pxa2xx-fix-mem.patch

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-igep:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

Andrei Gherzan (1):
=20=20connman: Sync recipe version with oe-core

Florin Sarbu (5):
=20=20xserver-xorg: Update bbappend to version 1.14.0
=20=20layer-management: Update to version 1.0
=20=20packagegroup-core-boot-genivi.bb: Add util-linux-mount so     that we =
have i
=20=20poky-ivi-systemd.conf: Replace mesa-dri-driver-swrast     with the =
new rpm g
=20=20packagegroup-core-boot-genivi.bb: Explicitly add kmod to rootfs

Holger Behrens (1):
=20=20packagegroup-core-p1: remove nfs-utils as it isn't a P1

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-java:

Henning Heinold (2):
=20=20openjdk6: update version 1.12 to 1.12.5
=20=20openjdk7: update version 2.1 to 2.1.8

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

Eric B=C3=A9nard (1):
=20=20Use right license name for GPLv2

Jan Schmidt (1):
=20=20sdcard_image-rpi: Use the size of the generated rootfs

Paul Barker (1):
=20=20netbase: Remove bbappend and files

Seth Bollinger (2):
=20=20sdcard_image-rpi.bbclass: Copy startup files required for 16MB GPU =
operation
=20=20sdcard_image-rpi.bbclass: Fix error in conditional test

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

Martin Jansa (9):
=20=20meta-asus: replace netbase bbappend with init-ifupdown
=20=20linux-asus-grouper: bump SRCREV to fix build with gold
=20=20libframeworkd-glib: bump SRCREV to fix build with glib-2.35+ and newer
=20=20libphone-ui-shr: bump SRCREV to fix build with glib-2.35+ and newer
=20=20phoneuid: bump SRCREV to fix build with glib-2.35+ and newer

Simon Busch (3):
=20=20meta-android: android-system-image: add support for symbols debug =
symbols
=20=20meta-samsung: android-system-image-tuna: install system symbols
=20=20meta-asus: android-system-image-grouper: install system symbols

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

Eric Blade (1):
=20=20webos-image: libpbnjson=3D9

Iyad Qumei (1):
=20=20webos-image-devel: add bootchart package

Janne Hurskainen (1):
=20=20webos-image: nyx-modules=3D87, webos-shutdownscripts=3D36,v2.1.0

Sapna Todwal (1):
=20=20webos-image: connman=3Dv1.12, webos-connman-adapter=3D9

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Michel Thebeau (1):
=20=20kernel 3.8: routerstationpro: use KERNEL_IMAGE_MAXSIZE to test the =
image

Saul Wold (1):
=20=20distro_alias: update alias information.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:




