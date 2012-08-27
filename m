Received: from new.bec-systems.com ([74.208.70.121] helo=bec-systems.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1T5zst-00058e-Q6; Mon, 27 Aug 2012 16:01:45 +0200
Received: from oh-69-34-21-229.sta.embarqhsd.net ([69.34.21.229]
	helo=happy.bec-systems.com)
	by bec-systems.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cliff.brake@gmail.com>)
	id 1T5zan-0000s1-G4; Mon, 27 Aug 2012 09:43:04 -0400
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Date: Mon, 27 Aug 2012 13:49:20 GMT
Message-Id: <1346075360473.ec33ead2@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
X-Spam_score: -2.9
X-Spam_score_int: -28
X-Spam_bar: --
Subject: OE Changelog since 2012-08-19 until 2012-08-26
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
X-List-Received-Date: Mon, 27 Aug 2012 14:01:45 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2012-08-19 until 2012-08-26.  Projects included in this =
report:

bitbake: git://git.openembedded.org/bitbake
openembedded-core: git://git.openembedded.org/openembedded-core
meta-openembedded: git://git.openembedded.org/meta-openembedded
meta-smartphone: http://git.shr-project.org/repo/meta-smartphone.git
meta-micro: git://git.openembedded.org/meta-micro
meta-slugos: git://github.com/kraj/meta-slugos
meta-nslu2: git://github.com/kraj/meta-nslu2
meta-intel: git://git.yoctoproject.org/meta-intel
meta-handheld: git://git.openembedded.org/meta-handheld
meta-opie: git://git.openembedded.org/meta-opie
openembedded: git://git.openembedded.org/openembedded
meta-bug: git://github.com/buglabs/meta-bug.git
meta-efikamx: git://github.com/kraj/meta-efikamx.git
meta-gumstix: git://gitorious.org/schnitzeltony-oe-meta/meta-gumstix.git
meta-ettus: http://github.com/koenkooi/meta-ettus.git
meta-fsl-ppc: git://git.yoctoproject.org/meta-fsl-ppc
meta-igep: http://github.com/ebutera/meta-igep.git
meta-netbookpro: git://github.com/tworaz/meta-netbookpro
meta-xilinx: git://git.yoctoproject.org/meta-xilinx
meta-chicken: git://github.com/OSSystems/meta-chicken
meta-java: git://github.com/woglinde/meta-java
meta-qt3: git://git.yoctoproject.org/meta-qt3
meta-telephony: git://gitorious.org/sysmocom-openembedded/meta-telephony.git
meta-ti: git://git.yoctoproject.org/meta-ti
meta-angstrom: git://github.com/Angstrom-distribution/meta-angstrom.git
meta-browser: git://github.com/OSSystems/meta-browser.git
meta-mono: git://git.yoctoproject.org/meta-mono.git
meta-raspberrypi: git://github.com/djwillis/meta-raspberrypi.git
meta-kde: git://gitorious.org/openembedded-core-layers/meta-kde.git
meta-yocto: git://git.yoctoproject.org/meta-yocto

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for bitbake:

Cristian Iorga (1):
=20=20Hob wizard-like reorganization

Konrad Scherer (1):
=20=20ui: Improve error message if bitbake cannot import python curses =
module

Paul Eggleton (5):
=20=20bitbake: hob: create console log directory before writing
=20=20bitbake/cooker: minor refactor of parseConfiguration()
=20=20bitbake-layers: avoid full parse for show-layers subcommand
=20=20bitbake-layers: use parsable title for show-appends
=20=20cooker: fix traceback when using -b with skipped recipe

Richard Purdie (10):
=20=20event/ast: Use better_exec instead of simple_exec
=20=20utils.py: Try harder to extract good traceback information by =
querying the d
=20=20utils.py: Once we've printed errors messages, suppress the backtrace
=20=20cooker: Ensure parsing failures stop the build
=20=20cooker: Add explict handling of BBHandledException for parsing =
failures
=20=20methodpool: Remove unused check_insert_method function
=20=20methodpool: Clean up the parsed module list handling to be slightly =
less ins
=20=20ast: Rename PythonMethodNode define variable to modulename
=20=20ast: Extract text variable in PythonMethodNode
=20=20ast: Store anonymous python function contents in the datstore

Ross Burton (2):
=20=20data-smart: rename the 'content' internal variable to '_content'
=20=20data_smart: skip all interal (underscored) flags in getVarFlags

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Andrei Dinu (2):
=20=20mc: upgrade to 4.8.4
=20=20dhcp : upgrade to 4.2.4-P1

Andy Ross (5):
=20=20insane.bbclass: Fix RPATH warning in the face of funny path strings
=20=20libtool: normalize link paths before considering for RPATH
=20=20ld: -rpath must search under sysroot
=20=20libtool: update rpath normalization to use builtin
=20=20task-core-lsb: Don't pull in eglibc-pic via RDEPENDS

Bruce Ashfield (2):
=20=20kernel-yocto: set master branch to a defined SRCREV
=20=20kernel-yocto: don't require meta branch for custom repos

Christopher Larson (1):
=20=20task-base: pull in the bluez asound module when appropriate

Constantin Musca (9):
=20=20telepathy-glib: update to 0.19.6
=20=20telepathy-idle: upgrade to 0.1.12
=20=20foomatic-filters: upgrade to 4.0.17
=20=20libnfsidmap: upgrade to 0.25
=20=20dbus-glib: upgrade to 0.100
=20=20kconfig-frontends: upgrade to 3.5
=20=20npth: upgrade to 0.91
=20=20wget: upgrade to 1.14
=20=20base-passwd: upgrade to 3.5.26

Jackie Huang (2):
=20=20coreutils: fix to build with acl support
=20=20gdk-pixbuf: call gtk-update-icon-cache with -t in postinstall script

Jason Wessel (1):
=20=20terminal.py: use unique ids for screen sessions

Khem Raj (11):
=20=20eglibc-2.16: Remove build dependency on libgcc_s and libgcc_eh
=20=20eglibc-2.16: Update to top of 2.16 branch
=20=20gcc-cross: Make gcc-cross-initial as the only intermediate gcc stage
=20=20eglibc: Fix eglibc-initial and let eglibc depend on it
=20=20uclibc.inc,uclibc-config.inc: Untabify python snippets
=20=20uclibc: Use gcc-cross-initial as staging compiler
=20=20gcc-crosssdk-initial_4.7.bb: Add --with-native-system-header-dir to =
EXTRA_OE
=20=20gcc-cross-intermediate, gcc-crosssdk-intermediate: Remove
=20=20runqemu: Honor KERNEL and ROOTFS settings from environment
=20=20linux-yocto: Remove parens from COMPATIBLE_MACHINE regexp
=20=20eglibc-2.15: Delete

Liang Li (1):
=20=20kernel.bbclass: fix INC directory for SLANG

Marcin Juszkiewicz (2):
=20=20libcap: fetch from Debian
=20=20subversion: update to 1.7.6

Mark Hatle (1):
=20=20bitbake.conf: add variables to exclude from hash.

Martin Jansa (2):
=20=20kernel.bbclass: Preserve generated headers only if they exist
=20=20gcc: bump PR

Matthew McClintock (2):
=20=20distutils.bblass: change order of args to install step
=20=20kmod-native_git.bb: fix builds for hosts with older libc

Mihai Lindner (1):
=20=20grub-efi: fix Nothing PROVIDES 'grub-efi-x86_64-native'

Paul Eggleton (5):
=20=20classes/sanity: remove texi2html from required host utilities
=20=20classes/package: document do_packages_split arguments
=20=20conf/bitbake.conf: allow cache reuse between bitbake, bitbake-layers =
and hob
=20=20scripts/combo-layer: specify branch when getting current revision
=20=20libiconv: skip recipe if using eglibc

Radu Moisan (3):
=20=20grub: Update to upstream stable 2.00
=20=20grub-efi-native: Update to version 2.00
=20=20busybox: Upgrade to upstream 1.20.2

Richard Purdie (11):
=20=20qemu-0.15: Drop GL passthrough support
=20=20qemu-git: Drop GL passthrough support
=20=20scripts/runqueue-internal: Drop enable-gl option
=20=20qemu: Fix broken accidental path move
=20=20meta/classes: Various python whitespace fixes
=20=20formfactor: Clean up errors on machines without framebuffers
=20=20gmp-4.2.1: Set CC_FOR_BUILD to ensure the host system compiler is =
used, not=20
=20=20xev: Add missing dependencies on libxrandr and xproto
=20=20gcc-4.7: Add fix for libtool rpath problems
=20=20mutter: Explictly disable libcanberra
=20=20distutils/steuptools: Fix files layout and unbreak builds

Robert Yang (2):
=20=20sstate-cache-management.sh: update for the SSTATE_MIRRORS
=20=20package_rpm.bbclass: fix and enhance the incremental rpm generation

Ross Burton (1):
=20=20mesa: clean up PACKAGECONFIG

Saul Wold (7):
=20=20cups: disable pdftops
=20=20external-python-tarball: Blacklist recipe if ipk is not in the =
PACKAGE_CLASS
=20=20iputils: chmod in pkg_postinst are redundant
=20=20build-appliance-image: Update SRCREV to Denzil 1.2.1
=20=20build-appliance-image: Add vmx* files and build zip file
=20=20build-appliance-image: Update SRCREV for beta build
=20=20runqemu: Move the KVM check after the MACHINE/KERNEL Checks

Xin Ouyang (1):
=20=20grub-1.99: Add flex-native to DEPENDS

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Andrea Adami (1):
=20=20initramfs-kexecboot-image: zap LDCONFIGDEPEND

Andreas M=C3=BCller (6):
=20=20systemd-compat-units: ensure /tmp is mounted when starting =
run-postinsts
=20=20pango: remove and use oe-core version 1.30
=20=20pulseaudio: remove bbappend
=20=20wpa-supplicant: add systemd support
=20=20busybox/meta-oe: follow oe-core to 1.20.2
=20=20busybox/meta-systemd: follow oe-core to 1.20.2

Christopher Larson (1):
=20=20ipsec-tools: use a correct LIC_FILES_CHKSUM

Denis 'GNUtoo' Carikli (2):
=20=20gpsd: update to 3.7, drop older 3.5 and git recipe
=20=20meta-systemd: adjust the gpsd bbappend to match the current version.

Khem Raj (2):
=20=20machine_kernel_pr.bbclass: provides MACHINE_KERNEL_PR functionality
=20=20udev-173: Fix SRC_URI to fetch bz2 archive

Koen Kooi (1):
=20=20Merge remote-tracking branch 'meta-oe-contrib/jansa/efl'

Martin Jansa (58):
=20=20meta-efl: unify tabs/spaces usage
=20=20e-base: bump EFL_SRCREV
=20=20ecore: update fix-ecore-fb-initialization.patch for svn recipe
=20=20efl: update PV in svn recipes to sort higher then release
=20=20efl-from-svn-recipes: update to match PV from svn recipes
=20=20terminology: add recipe for terminal emulator
=20=20evas: package cserve2 and its loaders
=20=20efreet: inherit gettext
=20=20e-wm: update LIC_FILES_CHKSUM
=20=20e-wm: packaging: include flags in PN-images, add catch-all =
PN-backgrounds pa
=20=20terminology: add terminology-themes to RDEPENDS
=20=20edbus: add eina to DEPENDS
=20=20eve: drop patch applied upstream
=20=20edbus: add patch to fixup performance_test autotools config and =
disable it
=20=20e-wm: add eio to DEPENDS
=20=20e-base: bump EFL_SRCREV again
=20=20edbus: drop patch applied upstream r74447
=20=20python-edje: add evas to DEPENDS
=20=20e-base: bump EFL_SRCREV
=20=20elementary: add eio to DEPENDS
=20=20meta-efl: evas-generic-loaders: add new recipes to cope with missing =
SVG sup
=20=20evas: add evas-loader-generic + evas-generic-loader-svn to =
RRECOMMENDS in sv
=20=20meta-efl: efl.bbclass: package only ${datadir}/${PE} in ${PN}-tests, =
it was=20
=20=20e-base: bump EFL_SRCREV
=20=20edje: add unpackaged /usr/share/mime/packages/edje.xml to PN
=20=20edbus: option to disable performance-test was renamed and package =
logo.png i
=20=20emotion: add eio dependency
=20=20e-wm: add elementary dependency
=20=20e-wm: add some evas-loaders to RDEPENDS
=20=20evas: use PN instead of BPN?
=20=20e-base: bump EFL_SRCREV
=20=20enjoy: update LIC_FILES_CHKSUM, typos fixed in r74611
=20=20edje: add eio to DEPENDS
=20=20eet: move eet binary to own PN-utils package
=20=20e-base: bump EFL_SRCREV
=20=20e-wm: include unpackaged data/favourites in PN
=20=20ecore: add gnutls to DEPENDS
=20=20e-base: bump EFL_SRCREV
=20=20e-base: bump EFL_SRCREV
=20=20e-wm: illume2 profile was renamed to mobile
=20=20e-base: bump EFL_SRCREV
=20=20elsa: rename to entrance
=20=20meta-systemd: elsa: rename to entrance
=20=20e-base: bump EFL_SRCREV for 1.6.99-alpha
=20=20meta-efl: introduce 1.6.99-alpha releases
=20=20efl-from-svn-recipes: update P_Vs, now all svn recipes have 1.6.99+svn
=20=20python-efl: bump PV and reset PR
=20=20python-efl: introduce recipes for 1.6.99-alpha release and add =
negative D_P=20
=20=20e-base: bump EFL_SRCREV for 1.6.99-beta
=20=20recipes-efl: upgrade to 1.6.99-beta
=20=20expedite: move to efl subdir
=20=20python-efl: upgrade to 1.6.99-beta
=20=20php: drop LD_LIBRARY_PATH settings
=20=20xf86-video-glamo: disable KMS, fix build with KMS disabled
=20=20systemd.bbclass: add option to disable automatic RRECOMMENDS =
pkg-systemd_bas
=20=20xserver-common: add support for tuna
=20=20pixman: update bbappend to match 0.27.2
=20=20connman: rename bbappend to match new 1.4 version from oe-core

Paul Eggleton (1):
=20=20freerdp-extension-xpunlimited: inherit gitpkgv

Ross Burton (3):
=20=20meta-gnome: add libical
=20=20meta-gnome: add evolution-data-server
=20=20meta-gnome: add Pimlico (contacts, dates, tasks)

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

Denis 'GNUtoo' Carikli (1):
=20=20meta-openmoko: linux-gta04: update SRCREV and defconfig.

Martin Jansa (5):
=20=20meta-nokia: linux-nokia900-meego: bump SRCREV to fix build with =
binutils-2.2
=20=20meta-shr: bump PR in recipes depending on fso-gpsd
=20=20meta-openmoko: linux-gta04: upgrade to 3.4.9 and fix build with =
binutils-2.2

Simon Busch (9):
=20=20meta-samsung: linux-samsung-tuna: bump SRCREV
=20=20meta-samsung: base-files: adjust fstab configuration for tuna device
=20=20meta-android: rename android-adb to just adb
=20=20meta-android: adb: add init script for adbd daemon
=20=20meta-samsung: linux-samsung-tuna: don't provide a cmdline with our =
kernel
=20=20meta-samsung: samsung-fb-console: add simple script to enable =
framebuffer co
=20=20initscripts: some minor adjustments for the rndissetup script
=20=20meta-samsung: netbase: only configure rndis0 network interface

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-micro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-slugos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nslu2:

Khem Raj (1):
=20=20linux: Use protocol instead of proto in SRC_URI

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Mihai Lindner (1):
=20=20meta-cedartrail: fixed PREFERRED_VERSION_linux-yocto

Richard Purdie (1):
=20=20ia32-base.inc: Drop glibc --with-tls option, its now the only option =
for gli

Tom Zanussi (1):
=20=20crownbay: fix KBRANCH

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-handheld:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-opie:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-bug:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-efikamx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix:

Andreas M=C3=BCller (1):
=20=20overo.inc: move to linux-omap-3.5

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ettus:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-ppc:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-igep:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-netbookpro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-chicken:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-java:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-qt3:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-telephony:

Holger Hans Peter Freyther (1):
=20=20libgsm_1.0.13: Add necessary " for the variable assignment

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-browser:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-mono:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-raspberrypi:

Andrei Gherzan (6):
=20=20linux: Activate UDEV_GE_141
=20=20raspberrypi.conf: Add "rtc" to MACHINE_FEATURES_BACKFILL_CONSIDERED
=20=20vc-graphics.inc: Set LICENSE to "Proprietary"
=20=20vc-graphics.inc: Package .so file in ${PN}
=20=20vc-graphics.inc: Skip ldflags insane check
=20=20raspberrypi.conf: Weakly assign PREFERRED_PROVIDER_virtual/egl

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-kde:

Samuel Stirtzel (1):
=20=20Fix bbappends for current HEAD

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Darren Hart (1):
=20=20README: Clarify where to send patches

Paul Eggleton (1):
=20=20poky.conf: restore Ubuntu 12.04 LTS to tested distro list

Paul Gortmaker (1):
=20=20routerstationpro: move board off 3.0 and onto the 3.4 kernel

Radu Moisan (1):
=20=20busybox: Update to upstream 1.20.2

Richard Purdie (1):
=20=20atom-pc: Drop glibc --with-tls option, its now the only option for =
glibc

Tom Zanussi (18):
=20=20yocto-bsp: strip '/base' from kernel branches in templates
=20=20yocto-bsp: update default branch names
=20=20yocto-bsp: allow branch display filtering
=20=20yocto-bsp: use branches_base
=20=20yocto-bsp: add standard branch mapping
=20=20yocto-bsp: use standard branch mapping in bsp templates
=20=20yocto-bsp: use rstrip() for assignment lines
=20=20yocto-bsp: remove 'branch' statements in .scc if reusing branch
=20=20yocto-bsp: add some standard policy
=20=20yocto-bsp: add i586 option for i386
=20=20yocto-bsp: use emgd 1.10 for i386 template
=20=20yocto-bsp: generate default properties even if json specified
=20=20yocto-bsp: add 3.4/remove 3.0 kernel from templates
=20=20yocto-bsp: update standard branch mapping
=20=20yocto-bsp: use emgd 1.14 for i386 template
=20=20yocto-bsp: remove YOCTO_KERNEL_EXTERNAL_BRANCH usage
=20=20yocto-bsp: use base branches for qemu 'newbranch' case
=20=20yocto-bsp: add missing xserver-xf86-config .bbappend for qemu




