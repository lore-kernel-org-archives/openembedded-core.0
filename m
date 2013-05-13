Received: from new.bec-systems.com ([74.208.70.121] helo=bec-systems.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1Ubxgb-00056u-NB; Mon, 13 May 2013 20:41:26 +0200
Received: from oh-67-76-203-50.sta.embarqhsd.net ([67.76.203.50]
	helo=happy.bec-systems.com)
	by bec-systems.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cliff.brake@gmail.com>)
	id 1UbxMZ-0007TI-9L; Mon, 13 May 2013 14:20:46 -0400
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Date: Mon, 13 May 2013 18:23:05 GMT
Message-Id: <1368469385189.8b3ca85c@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
X-Spam_score: -0.2
X-Spam_score_int: -1
X-Spam_bar: /
Subject: OE Changelog since 2013-05-05 until 2013-05-12
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
X-List-Received-Date: Mon, 13 May 2013 18:41:26 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2013-05-05 until 2013-05-12.  Projects included in this =
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

Andrei Dinu (1):
=20=20Updated information in tooltips

Cristiana Voicu (4):
=20=20hob: sort alphabetically results in groups of recipes/packages
=20=20hob: "Brought in by" sorting should take into account the (+#) =
information
=20=20hob: clicking on "cancel" should reset table sorting to default
=20=20hob: assure consistency for image size label

Martin Jansa (1):
=20=20git: remove symling before updating mirror tarball

Olof Johansson (1):
=20=20pysh: Say what kind of token isn't implemented

Paul Eggleton (1):
=20=20bin/bitbake: add a check for /dev/shm existing

Richard Purdie (19):
=20=20bin/bitbake: Ensure early errors are shown to the user
=20=20utils: Improve better_exec traceback handling
=20=20utils: Improve better_compile error message
=20=20lib: Clean up various file access syntax
=20=20cooker: Remove deprecated operator
=20=20providers: Remove pointless lambda sort function
=20=20siggen: Add missing error message parameter
=20=20prserv: Drop StandardError usage
=20=20lib: Use modern expcetion syntax
=20=20lib: print is a function in moderm python, covert remaining users
=20=20cooker: Drop unused variables from collect_bbfiles()
=20=20cooker: Separate out collections handling code into its own class
=20=20cooker: Fix get_bbfiles()
=20=20cooker: Remove pointless repeated import
=20=20cooker.py: Drop confusing updateCache calls
=20=20cooker: Drop pointless variables
=20=20cooker: Rename confusing buildDepgraph task to handlePrefProviders
=20=20cooker: Rename status variable to recipecache
=20=20bitbake-layers/tinfoil: Catch up with status -> recpiecache rename

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Andreas M=C3=BCller (2):
=20=20systemd: do not recommend udev-extraconf for udev
=20=20udev: do not recommend udev-extraconf

Bogdan Marinescu (12):
=20=20oprofileui(-server): upgraded to GIT revision f168b8bf
=20=20libmpc: upgraded to 1.0.1
=20=20python-scons: upgraded to 2.3.0
=20=20git: upgrated to 1.8.2.2
=20=20bison: upgraded to 2.7.1
=20=20subversion: upgraded to 1.7.9
=20=20kexec-tools: upgraded to 2.0.4
=20=20autogen: upgraded to 5.17.3
=20=20byacc: upgraded to 20130304
=20=20mpfr: upgraded to 3.1.2
=20=20tcl: upgraded to 8.6.0
=20=20gmp: updated to 5.1.1

Bruce Ashfield (4):
=20=20linux-yocto/3.4: iwlwifi, ext4, brtfs warning and -rt fixes
=20=20kern-tools: anchor and delimit regexs
=20=20linux-yocto/3.4: update to v3.4.43, ltsi-65311d8 and v3.4.42-rt56
=20=20linux-yocto/3.8: udpate to v3.8.11

Cristian Iorga (4):
=20=20iptables: upgrade to 1.4.18
=20=20iproute2: upgrade to 3.9.0
=20=20glib-2.0: upgrade to 2.36.1
=20=20sbc: upgrade to 1.1

Hongxu Jia (2):
=20=20cracklib: fix default dictionary should be generated for target =
endianness
=20=20craklib:fix testnum and teststr failed

Ionut Radu (1):
=20=20pciutils: updated from 3.1.10 to 3.2.

Jonathan Liu (2):
=20=20guile: Update to 2.0.9
=20=20image-vmdk: Fix error recreating symbolic link

Jukka Rissanen (1):
=20=20neard: Split recipe to two parts

Kang Kai (1):
=20=20bitbake.conf: update way to set default ROOT_HOME

Khem Raj (4):
=20=20binutils: Upgrade 2.23.1 -> 2.23.2
=20=20tcmode-default.inc: Pin binutils to 2.23.2
=20=20gcc-configure-target: Add --enable-dependency-tracking to EXTRA_OECONF
=20=20gcc-configure-cross.inc: Remove info generation

Laurentiu Palcu (9):
=20=20archive-*-source.bbclass: handle dependency in anonymous function
=20=20xf86-video-vmware: upgrade to 13.0.1
=20=20xf86-video-intel: upgrade to 2.21.6
=20=20xf86-input-keyboard: upgrade to 1.7.0
=20=20xf86-input-mouse: upgrade to 1.9.0
=20=20xf86-input-synaptics: upgrade to 1.7.0
=20=20xf86-input-evdev: upgrade to 2.8.0
=20=20xproto: upgrade to 7.0.24
=20=20libdrm: upgrade to 2.4.44

Marcin Juszkiewicz (4):
=20=20gdb: AArch64 lacks lttng support
=20=20gdb: tabs -> spaces
=20=20gdb: add 7.6 version
=20=20gdb-cross-canadian: set everything in gdb-cross-canadian.inc

Martin Jansa (3):
=20=20tcp-wrappers: Rename conflicting variable STRINGS in Makefile
=20=20tcp-wrappers: fix indentation
=20=20bitbake.conf: export STRINGS

Matthieu Crapet (1):
=20=20libomxil (0.9.3): drop unecessary dependencies

Mike Crowe (1):
=20=20gdb-cross: gdb-cross requires readline-native

Paul Barker (1):
=20=20qt4: remove trailing slash from prefix

Paul Eggleton (5):
=20=20buildhistory-diff: improve bad command-line argument handling
=20=20classes/buildhistory: track contents of selected files in images
=20=20classes/insane: add check for PN in OVERRIDES
=20=20classes/image: show an error on invalid IMAGE_FEATURES
=20=20classes/core-image: drop apps-console-core IMAGE_FEATURES support

Richard Purdie (21):
=20=20cronie: Convert crontab to a system user
=20=20core-image-minimal-initramfs: Remove odd quote characters
=20=20clases/lib: Use modern exception syntax
=20=20buildstats: Update to ensure files are closed
=20=20classes: Use modern exception raising syntax
=20=20classes/recipes/lib: Fix various python whitespace issues
=20=20sanity.bbclass: Use open(), not file()
=20=20metadata_scm: Replace deprecated operator
=20=20classes/lib: Update to use print as a function call
=20=20meta/lib/oe: Replace StandardError with Exception
=20=20insane: Open file in binary mode
=20=20sanity/patch.py: Remove commands module usage
=20=20image/kernel-module-split/eglibc-ld.inc: Remove has_key() usage
=20=20base.bbclass: Drop unused/obsolete import
=20=20bitbake.conf: Use casting to ensure valid comparision
=20=20classes/lib: Fix getcmdstatus breakage
=20=20useradd: Use modern join syntax
=20=20buildstats: Drop spurious open() call
=20=20class/lib: Fix up various file access methods
=20=20imagetest-qemu: Fix indentation
=20=20eglibc/machine-sdk: Drop SDK_GLIBC_ADDONS

Robert Yang (4):
=20=20bootimg.bbclass: add comment for NOHDD
=20=20boot-directdisk/bootimg/image-vmdk: remove more nostamps for image =
generatio
=20=20python: remove the default optimization
=20=20image-vmdk.bbclass: disable the NOISO =3D "1"

Ross Burton (5):
=20=20qemux86: disable paravirt guest in linux 3.4, causes test failures
=20=20libsoup: upgrade to 2.42.1
=20=20gnome-keyring: remove, nothing uses it in oe-core
=20=20libgnome-keyring: remove, nothing in oe-core uses this anymore
=20=20gnutls: upgrade to 2.12.23

Saul Wold (16):
=20=20packagegroup-core-lsb: Add udev-extraconf for LSB compatibility
=20=20packagegroup-core-x11-sato: Add udev-extraconf to maintain =
compatibility
=20=20qemu: Ensure kernel nfsd module is enabled
=20=20binutils: backport whitespace fix
=20=20dmidecode: fix fetch path to use BP
=20=20powertop: inherit gettext
=20=20rpm: ensure __mkdir_p matches __mkdir
=20=20libgcrypt: Update to 1.5.2
=20=20libcheck: Update to 0.9.10
=20=20tzcode: Update to 2013c
=20=20mklibs: Update to 0.1.35
=20=20msmtp: Update to 1.4.31
=20=20help2man: Update to 1.41.2
=20=20kconfig-frontends: Update to 3.9.0
=20=20libxml2: Update to 2.9.1
=20=20Upstream-Status: Correct Capitalization

Stefan Stanacar (4):
=20=20xserver-xorg: Add xkbcomp to RRECOMMENDS
=20=20scripts/runqemu: add ext4 to the list of extracted extensions
=20=20runqemu-internal: support for ext2 and ext4 not only ext3
=20=20imagetest-qemu.bbclass, qemuimage-testlib: add support for more =
FSTYPES

Tom Zanussi (1):
=20=20kernel.bbclass: make FILES package-specific

Tomas Frydrych (1):
=20=20librsvg: update gdk-pixbuf loader cache when staging native package

Wenzong Fan (1):
=20=20libtool-nativesdk: rename to nativesdk-libtool

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Andreas M=C3=BCller (15):
=20=20libbonobo: fix build with glib 2.36
=20=20libbonobo: remove unreferenced patch
=20=20gnome-vfs: fix build with glib 2.36
=20=20gnome-terminal: move out of nonworking
=20=20gnome-terminal: update to 2.30.2
=20=20poppler: remove unrecognized configure options
=20=20poppler: merge include files into poppler - only poppler requires them
=20=20poppler: update to 0.22.3
=20=20poppler-data: update to 0.4.6 and stylize a bit
=20=20epdfview: move to nonworking
=20=20evince: fix/remove postinst by inheriting gsettings
=20=20dconf: fix/remove postinst by inheriting gsettings
=20=20proftpd: remove postinst - directory can be setup offline in =
do_install
=20=20gnome-panel: let gconf.bblass take care for postinst
=20=20rp-pppoe: move chmod form postinst to offline do_install

Aws Ismail (1):
=20=20Quagga: sync zebra routing table with the kernel one

Koen Kooi (1):
=20=20libgnome: split out schemas needed for gnome-control-center

Mark Hatle (3):
=20=20macchanger: Fix SRC_URI for multilibs
=20=20crda: Fix multilib SRC_URI reference
=20=20rp-pppoe: fix multilib SRC_URI reference

Mihai Prica (3):
=20=20python-feedparser: Changed from distutils to setuptools
=20=20python-sqlalchemy: update to 0.7.9
=20=20mysql-python: Added recipe for mysql-python

Nicolas Dechesne (1):
=20=20smartmontools: import from OE classic

Olivia Yin (2):
=20=20yajl: pass the cmake variable LIB_SUFFIX to handle installation on =
64-bit sy
=20=20lvm2: add configure option --with-usrlibdir to install shared library =
in 64-

Otavio Salvador (1):
=20=20cifs-utils: Add runtime recommendation to CIFS kernel module

Paul Barker (5):
=20=20fluidsynth: fixed license name
=20=20fluidsynth: added dependency on glib
=20=20vlc: moved to meta-multimedia
=20=20vlc: removed unrecognised configure options
=20=20vlc: fix configure failures with ENTERPRISE_DISTRO=3D1

Stefan Herbrechtsmeier (1):
=20=20media-ctl: Use linux-libc-headers instead of linux kernel sources

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Khem Raj (2):
=20=20packagegroup-gnome: Remove gdm-systemd
=20=20angstrom-next: Bump binutils to 2.23.2

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Denys Dmytriyenko (2):
=20=20packagegroup-addons, matrix-demos: revert removal of arm-benchmarks
=20=20packagegroup-amsdk: revert removal of screenshot

Franklin S. Cooper Jr (7):
=20=20ti-tisdk-makefile: Prepare for Linaro transition
=20=20arm-benchmarks: Grab CFLAGS from OE or Rules.make
=20=20am-sysinfo: Grab CFLAGS from OE or Rules.make
=20=20ti-crypto-examples: Grab CFLAGS from OE or Rules.make
=20=20screenshot: Grab CFLAGS from OE or Rules.make
=20=20av-examples: Grab CFLAGS from OE or Rules.make
=20=20arago.conf: Choose the proper toolchain by default depending on =
SOC_FAMILY

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-beagleboard:

Koen Kooi (12):
=20=20linux-mainline 3.8: add patches for IIO and PWM sysfs nodes
=20=20linux-mainline 3.8: attempt to fix AVI infoframes with HDMI on =
beaglebonebla
=20=20linux-mainline 3.8: add support for rs232 cape, improve camera cape =
reliabil
=20=20linux-mainline 3.8: add patch to make camera cape work on BBB
=20=20u-boot-denx: add patch for eMMC resetctrl
=20=20linux-mainline 3.8: add patches to try 1080p on lcdc
=20=20contrib: bone-flash-tool: add ID to image
=20=20contrib: bone-flash-tool: enable drm.debug=3D7 by default
=20=20gadget-init: fix EEPROM parsing in g-ether-load.sh
=20=20contrib: bone-flash-tool: don't wipe valid EEPROM header
=20=20gadget-init: add console on g_multi
=20=20linux-mainline 3.8: update 3.8.13

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

Mahesh Mahadevan (1):
=20=20linux-imx (2.6.35): mxs and mx5: Update to latest from FSL GIT

Otavio Salvador (1):
=20=20u-boot-fslc: Update to patches-2013.04's 20130507 snapshot

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-ppc:

Chunrong Guo (1):
=20=20netbase: remove netbase bbappend

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-guacamayo:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix-community:

Andreas M=C3=BCller (1):
=20=20linux-mainline-3.8: update to 3.8.12

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-handheld:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-igep:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Darren Hart (1):
=20=20gnu-efi: Add parallel make patch for archives

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

Florin Sarbu (1):
=20=20netbase: Update .bbappend to version 5.1

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

Christophe Chapuis (2):
=20=20meta-acer: fix compilation for linux-acer-a500 kernel
=20=20meta-acer: fix kernel cmdline and apply patch to fix compilation for =
gcc 4.7

Martin Jansa (2):

Simon Busch (1):
=20=20meta-android: android-audiosystem: package asound.conf as well

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

Denys Dmytriyenko (2):
=20=20netbase: bump the version to follow oe-core
=20=20linux-ti-staging: add package-specifier for RDEPENDS variable

Franklin S. Cooper Jr (1):
=20=20am33x-cm3: Split init script into its own package

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

Eric Blade (3):
=20=20webos-image: luna-service2=3D149
=20=20webos-image: Add VIRTUAL-RUNTIME_webos-compositor
=20=20webos-image: libpbnjson=3D10

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Cristian Iorga (4):
=20=20upstream_tracking.inc: minicom check update
=20=20maintainers.inc: update sbc pkg maintainer
=20=20maintainers.inc: update neard pkg maintainer
=20=20maintainers.inc: update alsa-utils-alsaconf pkg maintainer

Paul Eggleton (1):
=20=20poky.conf: update SANITY_TESTED_DISTROS

Saul Wold (1):
=20=20poky-lsb: Ensure kernel nfsd module is enabled

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:




