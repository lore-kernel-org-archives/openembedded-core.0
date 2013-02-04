Received: from new.bec-systems.com ([74.208.70.121] helo=bec-systems.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1U2PdZ-0001Yv-QL; Mon, 04 Feb 2013 18:15:24 +0100
Received: from oh-69-34-21-229.sta.embarqhsd.net ([69.34.21.229]
	helo=happy.bec-systems.com)
	by bec-systems.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cliff.brake@gmail.com>)
	id 1U2PCy-0005De-7h; Mon, 04 Feb 2013 11:47:55 -0500
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Date: Mon, 04 Feb 2013 16:59:22 GMT
Message-Id: <1359997162220.89e02b1f@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
X-Spam_score: -2.9
X-Spam_score_int: -28
X-Spam_bar: --
Subject: OE Changelog since 2013-01-27 until 2013-02-03
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
X-List-Received-Date: Mon, 04 Feb 2013 17:15:28 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2013-01-27 until 2013-02-03.  Projects included in this =
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

Bill Traynor (1):
=20=20setup.py: Set the 'url' in setup.py to the OE BitBake page.

Christopher Larson (1):
=20=20tinfoil: support other fds, enable color support

Cristiana Voicu (4):
=20=20bitbake & hob: implement functions to assure consistency for =
configuration f
=20=20hob: small fixes to parsing warnings dialog
=20=20hob: Use a GtkTreeView to present and configure the sstate mirrors
=20=20hob: eliminate the "by recipe" grouping in the packages table

Martin Jansa (3):
=20=20ssh: fix fetcher
=20=20ssh.py: throw ParameterError when someone tries ssh://foo; =
protocol=3Dgit
=20=20ssh.py: add example SRC_URI

Richard Purdie (3):
=20=20utils.py: Add function for processing profile output
=20=20build.py: Dump out performance data of individual tasks
=20=20cache.py: Drop support for BROKEN variable

Robert Yang (1):
=20=20bitbake-layers: print the recipe's depends that crosses a layer =
boundary

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Andreas M=C3=BCller (4):
=20=20buildhistory.bbclass: track also complementary package information
=20=20package.bbclass: remove RRECOMMENDS on base packages for locale =
packages
=20=20systemd: systemd-analyse has moved to base_bindir
=20=20systemd: systemd-analyze remove python runtime dependencies

Andrei Dinu (7):
=20=20openssh : upgrade to 6.1p1
=20=20mtools : upgrade to 4.0.18
=20=20blktool : upgrade to 4-6.1
=20=20libevent : upgrade to 4.0.21
=20=20Sudo : upgrade to 1.8.6p4
=20=20icu : upgrade to 50.1.2
=20=20e2fsprogs : upgrade to 1.42.6

Bogdan Marinescu (3):
=20=20python-smartpm: multilib fixes
=20=20git: updated to 1.8.1.2
=20=20eglibc: don't list the same path twice in RTLDLIST

Bruce Ashfield (1):
=20=20multilib: skip packages that provide virtual/kernel

Chen Qi (1):
=20=20sysvinit & initscripts: use update-rc.d

Constantin Musca (4):
=20=20migrate_localcount.bbclass: use PRAUTOINX instead of PN & PV
=20=20autotools.bbclass: add EXTRACONFFUNCS variable
=20=20multilib.conf: add TARGET_ARCH & TARGET_SYS to MULTILIB_SAVE_VARNAME
=20=20gcc: enable multilib for target gcc

Cristian Iorga (2):
=20=20alsa-utils: upgrade to 1.0.26
=20=20alsa-tools: upgrade to 1.0.26.1

Darren Hart (1):
=20=20qemux86-64: Disable paravirt guest, causes test failure on older =
kernels

Enrico Scholz (1):
=20=20systemd: honor ROOT_HOME

Frans Meulenbroeks (1):
=20=20mtd-utils: split into multiple packages

Hongxu Jia (3):
=20=20gtk-icon-cache.bbclass:fix support postrm at image creation time
=20=20gtk-immodules-cache.bbclass:fix support postrm at image creation time
=20=20dpkg-native:fix dpkg-scanpackages error at deb image creation time on =
Fedora

Ian Reinhart Geiser (1):
=20=20mesa-dri: add extra dri drivers

Kang Kai (1):
=20=20busybox: update test case du-k-works

Khem Raj (9):
=20=20eglibc: Upgrade recipes 2.16 -> 2.17
=20=20eglibc_2.17: Fix Tibetian locale generation error
=20=20eglibc: Backport upstream 2.17 patches
=20=20quota: inherit gettext
=20=20icu: Fix build on uclibc
=20=20systemd: Upgrade to 197
=20=20rpcbind: Dont use nss with uclibc
=20=20systemd: Drop ppc build breakage patch for test-unit-file
=20=20module-base.bbclass: Call make instead of oe_runmake in =
do_make_scripts

Lukas Bulwahn (1):
=20=20insane.bbclass: removing outdated comment

Marcin Juszkiewicz (2):
=20=20xorg-minimal-fonts: depend on font-alias instead of shipping =
fonts.alias
=20=20Flex: use proper m4 binary on target

Mark Asselstine (1):
=20=20kernel: avoid copying unnecessary files during do_install

Marko Lindqvist (1):
=20=20harfbuzz: fix install of version.h

Martin Jansa (5):
=20=20license.bbclass: extract functionality to find license files to =
separate fun
=20=20license.bbclass: package license texts to PN-lic when =
LICENSE_CREATE_PACKAGE
=20=20systemd: bump PE to provide upgrade path from meta-systemd recipe
=20=20license: fix LICENSE_CREATE_PACKAGE to stay disabled by default
=20=20libfm: add dependency on libexif

Ming Liu (1):
=20=20connman-gnome: Add DEPENDS on intltool-native

Otavio Salvador (1):
=20=20mini-x-session: Fix runtime when using without session contents

Phil Staub (1):
=20=20libaio: Fix MIPS system call interface

Radu Moisan (1):
=20=20valgrind: update to 3.8.1

Richard Purdie (18):
=20=20sstate: Move debug comment to more logical place
=20=20insane.bbclass: Fix incorrect getVar call
=20=20directfb: Explictly disable mesa
=20=20package_ipk/deb/rpm: Ensure deploy staging directory is empty before =
rerunni
=20=20rpm: Ensure native binaries are correctly wrapped
=20=20sqlite3: Ensure MLPREFIX is applied to AUTO_LIBNAME_PKGS
=20=20multilib.conf: Use BASELIB to set baselib, not hardcode the value
=20=20package: Rename splitfile functions to something more descriptive
=20=20package.bbclass: Improve kernel module handling
=20=20package.bbclass: Add a shortcut exit from the mkdir function
=20=20package.bbclass: Check FILES once, not once per loop iteration
=20=20package.bbclass: Avoid copying the datastore for FILES handling
=20=20package.bbclass: Move PKG handling code to emit_pkgdata
=20=20package.bbclass: Split out package_fixsymlinks function
=20=20package.bbclass: Tweak PACKAGEFUNCS
=20=20package.bbclass: Improve package_fixsymlinks
=20=20package: Create global package file list and use throughout =
PACKAGEFUNCS
=20=20package.bbclass: Use expanded RDEPENDS in read_shlibdeps

Riku Voipio (1):
=20=20libaio: add aarch64 support

Ross Burton (3):
=20=20libcanberra: remove, migrated to meta-gnome
=20=20metacity: remove, migrated to meta-gnome
=20=20gst-plugins-bad: remove musicbrainz build-dependency

Roy.Li (2):
=20=20QT4: use '-no-neon' if cpu does not support neon
=20=20xinetd: enable tcp-wrappers support

Saul Wold (20):
=20=20libnl: Update to 3.2.19
=20=20rgb: Update to 1.0.5
=20=20sysstat: Update to 10.1.3
=20=20mc: Update to 4.8.7
=20=20man-pages: Update to 3.45
=20=20libidn: Update to 1.26
=20=20cracklib: Update to 2.8.22
=20=20file: Update to 5.12
=20=20dhcp: Update to 4.2.5
=20=20util-linux: Update to 2.22.2
=20=20resolvconf: Update to 1.69
=20=20libcgroup: Update to 0.38
=20=20rootfs_rpm: Escape the backtick to ensure the ls runs on the target
=20=20module.bbclass: Don't add pkg_postinst/pkg_prerm to all packages in =
recipe
=20=20sqlite3: Update to 3.7.15.2
=20=20libnl: Update to 3.2.21
=20=20dhcp: Fix unshipped WARNINGS
=20=20module.bbclass: Allow for modules to be packaged seperate from ${PN}
=20=20gtk-icon-cache: Fix rdepends construction
=20=20qt4: Add space for _appends

Ting Liu (1):
=20=20oprofile: avoid processing files under .pc

Tom Zanussi (2):
=20=20oprofile: add kernel dependency
=20=20oprofile: remove AX_KERNEL_VERSION from acinclude.m4

Xin Ouyang (1):
=20=20libcgroup: fix the QA issue for pam_cgroup.so*

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Andrea Adami (1):
=20=20klibc_2.0.2: apply FIX_V4BX patch for armv4 targets only

Andreas M=C3=BCller (8):
=20=20tumbler: update to 0.1.27
=20=20daemonize: initial add 1.73+
=20=20lxdm: disable screensaver by default when starting X
=20=20thunar: add RRECOMMENDS and RDEPENDS to ensure full functionality
=20=20dhcp: follow oe-core to 4.2.5
=20=20util-linux: follow oe-core to 2.22.2
=20=20systemd: remove core recipes - they migrated to oe-core
=20=20systemd-speed-hacks: remove

David Nystr=C3=B6m (1):
=20=20python-twisted: Fixed non-existing twisted-bin package

Enrico Scholz (1):
=20=20dropbear: read configuration from /etc/default/dropbear

Ian Reinhart Geiser (1):
=20=20krb5: add e2fsprogs dependency

Khem Raj (2):
=20=20i2c-tools: Upgrade to 3.0.3 -> 3.1.0
=20=20ebtables, arptables: add perl as runtime dependency

Koen Kooi (9):
=20=20libebml: add 1.2.2
=20=20libmatroska: add 1.3.0
=20=20mkvtoolnix: add 5.9.0
=20=20x264: add git version
=20=20libav: enable x264 encoder support
=20=20apcupsd: fix QA error and SUMMARY
=20=20python-smbus: add 3.0.3
=20=20fbida: update to 2.09
=20=20nodejs: update 0.6.x to 0.6.21

Marcin Juszkiewicz (2):
=20=20libc-client: create empty libc-client package to satisfy deps of -dev =
one
=20=20python-nose: add 1.2.1

Martin Jansa (12):
=20=20meta-systemd: remove wpa-supplicant bbappend
=20=20meta-systemd: openssh: rename bbappend to match oe-core version 6.1p1
=20=20mm-common: inherit gnomebase instead of gnome
=20=20packagegroup-qte-toolchain-target: exclude from world
=20=20gnome-panel3: exclude from world
=20=20vim: implement gvim, vim-tiny as PACKAGECONFIG
=20=20vim: use new u-a syntax
=20=20gnome-terminal, system-tools-backends, slim, benchfft, syslog-ng: =
move to no
=20=20mplayer2: add faad2 to DEPENDS
=20=20midori: add libunique to DEPENDS
=20=20e-wm: upgrade to 0.17.1
=20=20xchat: add libsexy to DEPENDS

Otavio Salvador (1):
=20=20xf86-video-geode: Update to 2.11.14

Philip Balister (1):
=20=20gnuradio : Use PACKAGECONFIG so users can tweak build options.

Ross Burton (2):
=20=20midori: remove libsexy dependency
=20=20libmusicbrainz: add

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Andreas M=C3=BCller (1):
=20=20don't pin versions for recipes only found once in (core)layer

Khem Raj (2):
=20=20angstrom-preferred-versions.inc: Pin mesa to 9.0.1
=20=20angstrom-next: move to eglibc 2.17

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Chase Maupin (1):
=20=20ti-tisdk-setup: Pull in latest sources

Denys Dmytriyenko (21):
=20=20bison: drop remove-gets.patch bbappend for native, as it got merged =
to oe-co
=20=20README: start migration from denzil to danny, update READMEs =
accordingly
=20=20recipes: task class was renamed to packagegroup, nativesdk changed =
from suff
=20=20kernel.bbclass: drop overlayed copy, use meta-oe version instead
=20=20usbutils: drop overlayed version, as oe-core already has the needed =
fix
=20=20openssh: update bbappend from version 5.9p1 to 6.0p1
=20=20busybox: update bbappend from version 1.19.4 to 1.20.2
=20=20dbus: update bbappend from version 1.4.16 to 1.6.4
=20=20netbase: update bbappend from version 4.47 to 5.0
=20=20freetype: update bbappend from version 2.4.9 to 2.4.10
=20=20libav: update bbappend from version 0.7.4 to 0.8.3
=20=20tiff: update bbappend from version 4.0.1 to 4.0.2, rename directory =
to libti
=20=20curl: update bbappend from version 7.24.0 to 7.26.0
=20=20gnutls: update bbappend from version 2.12.17 to 2.12.20
=20=20qt4-embedded, qt4-tools: update from version 4.8.0 to 4.8.3, =
nativesdk prefi
=20=20busybox: revert udhcpc fix, since it's in oe-core now
=20=20packagegroup-arago-gst: remove gst-ffmpeg, as it's masked by license
=20=20eglibc: overlay older version 2.12 locally to support arago toolchain
=20=20binutils: overlay older version 2.20.1 locally to support arago =
toolchain
=20=20gcc: overlay older version 4.5 locally to support arago toolchain
=20=20tcmode-external-arago: update linux-libc-headers preference for 3.2

Eyal Reizer (4):
=20=20wpa_supplicant: add a script for killing in case running
=20=20wifi-direct-demo: kill the supplicant before starting
=20=20battleship: kill wpa_supplicant before launching
=20=20ti-compat-wireless: remove driver version print

Franklin S. Cooper Jr (27):
=20=20tisdk-image.bbclass: Add additional GPLv3 tables
=20=20tiff: Remove xz and lzma dependency
=20=20gettext: Mimic patch "Make gettext 0.16.1 extend native and nativesdk"
=20=20gnutls: Allow non GPLv3 version of gettext to work
=20=20arago.conf: Use non GPLv3 version of gettext
=20=20arago-amsdk-image: Remove additional GPLv3 components
=20=20linux-am335x: Remove dirty tag patch
=20=20linux-am335x: Add patch to Update SPI flash layout
=20=20task-arago-tisdk-addons: Add canutils
=20=20task-arago-toolchain-tisdk-target: Add =
task-arago-tisdk-addons-sdk-target
=20=20ti-crypto-examples: Install OpenSSL script
=20=20matrix-gui-apps-git: Pull in latest Matrix Apps changes
=20=20matrix-gui-crypto-demos: Switch to C base crypto applications
=20=20busybox: Add rtcwake
=20=20ti-tisdk-setup: Update to include several bug fixes
=20=20task-arago-tisdk-connectivity: Add obex-client to the runtime =
dependencies l
=20=20wl1271-demo_git: Add obex-client to the runtime dependencies list
=20=20ti-wif-utils: Only run calibrate on startup
=20=20dosfstools: Increase FAT partition size and large file support
=20=20oprofile-example: Use updated PACKAGE_STRIP syntax
=20=20linux-am335x_3.2.0-psp05.06.00.00: Limit Smartreflex to PG 1.0 silicon
=20=20linux-am335x-3.2.0-psp05.06.00.00: Fix Suspend and Resume
=20=20matrix-gui-apps-git.inc: Pull in latest power management script
=20=20u-boot_2012.10.psp05.06.00.00 - Freeze PSP 05.06.00.00
=20=20bc: Fix segmentation fault when using -l option
=20=20meta-toolchain-arago: Remove remaining .la files
=20=20recipes: Remove unused recipe and bbappend

Jeff Lance (1):
=20=20qt4-embedded: Add patch to fix QWSLOCK messages

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-beagleboard:

Koen Kooi (2):
=20=20linux-mainline: add 3.8-rc5 version for beaglebone
=20=20linux.inc: first pass at updating for a DT based world

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

Daiane Angolini (2):
=20=20libfslparser: Update to version 3.0.5
=20=20gst-fsl-plugin: Update to version 3.0.5

Otavio Salvador (3):
=20=20linux-linaro: Remove recipes as it is not active upstream
=20=20linux-imx (3.0.35): Upgrade to 1.1.0 BSP release
=20=20gst-fsl-plugin (3.0.5): Fix build failure due missing 'uint' =
definition

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-ppc:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-guacamayo:

Ross Burton (2):
=20=20libxkbcommon: update to the version in oe-core, fixes build without =
host X h
=20=20Revert "libxkbcommon: update to the version in oe-core, fixes build =
without=20

Tomas Frydrych (4):
=20=20libxkbcommon: patched configure not to use host x11 headers
=20=20task-guacamayo-devtools: added connman-tests package
=20=20atom-pc: generate also tar.bz2 when creating images
=20=20Bumped master version to 0.7.0

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix:

Adam YH Lee (1):
=20=20Fixed unintended version change in the layer configuration file.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix-community:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-handheld:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-igep:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Nitin A Kamble (6):
=20=20sugarbay.conf: use the new method for specifying VA codecs
=20=20chiefriver.conf: use the new method for specifying VA codecs
=20=20nuc.conf: use the new method for specifying VA codecs
=20=20fri2.conf: fix boot time kernel errors
=20=20emenlow README: add information about the gma500 driver
=20=20fri2: use EMGD version 1.16 instead of 1.14

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

Andrei Gherzan (5):
=20=20node-startup-controller: Avoid error while reconfigure
=20=20dlt-daemon: Remove User option from systemd services
=20=20layer-management: Fix systemd service - sleep is in /bin
=20=20consolekit: Remove bbappend as gnome-common is not GPLv3
=20=20busybox: Remove a bunch of configs

Florin Sarbu (8):
=20=20Add node state manager
=20=20packagegroup-core-p2.bb: Added node-state-manager as a P2 package
=20=20linux-yocto: Reworked bbappend to work with master poky changes.
=20=20busybox: Update .bbappend to version 1.10
=20=20node-startup-controller: Update package to git version 1.0.2
=20=20linux-yocto: Add missing AF_BUS kernel config for qemux86.     Add =
CONFIG_NE
=20=20dbus: Update .bbappend to version 1.6.8
=20=20packagegroup-core-p2.bb: Add wireless-tools as a P2 component.

Holger Behrens (1):
=20=20excalibur-image.bb: prepare 3.0.3

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-java:

Henning Heinold (2):
=20=20openjdk7: update 2.1 release to 2.1.4
=20=20openjdk6: apply same fix for ucontext for cacao on arm to openjdk6 too

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

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

Murali Karicheri (3):
=20=20keystone: boot-monitor: add initial recipe
=20=20keystone: update kernel and bootloaders recipes for mcsdk alpha7 =
release
=20=20keystone: update defconfig with latest for mcsdk alpha7

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

Eric Blade (1):
=20=20luna-sysmgr: use --exclude-vcs --exclude-backups for tarballs

Janne Kiiski (1):
=20=20vboxguestdrivers: Add recipe

Keith Derrick (6):
=20=20Add script to manage Virtual Box machines
=20=20webos-image: nyx-modules=3D79
=20=20Use default image name in webosvbox script
=20=20Change test for being in build-webos
=20=20Correct help in webosvbox script
=20=20webos-image: add novacomd

Martin Jansa (2):
=20=20webos-image: Remove work around for boot_dd
=20=20pmcertificatemgr, openssl: Use u-a for openssl.cnf

Simon Busch (3):
=20=20pmcertificatemgr: install openssl configuration file
=20=20openssl: add override to install c_rehash utility
=20=20ca-certificates: populate runtime configuration for pmcertificatemgr

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:

Florian Boor (1):
=20=20libupnp: Update to the updated release 1.6.18 fixing several =
vulnerabilities




