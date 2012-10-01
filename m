Received: from new.bec-systems.com ([74.208.70.121] helo=bec-systems.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1TImeR-0004G4-Cp; Mon, 01 Oct 2012 22:31:40 +0200
Received: from oh-69-34-21-229.sta.embarqhsd.net ([69.34.21.229]
	helo=happy.bec-systems.com)
	by bec-systems.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cliff.brake@gmail.com>)
	id 1TImKV-0004sy-9D; Mon, 01 Oct 2012 16:11:06 -0400
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Date: Mon, 01 Oct 2012 20:18:31 GMT
Message-Id: <1349122711269.edca626@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
X-Spam_score: -2.9
X-Spam_score_int: -28
X-Spam_bar: --
Subject: OE Changelog since 2012-09-23 until 2012-09-30
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
X-List-Received-Date: Mon, 01 Oct 2012 20:31:40 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2012-09-23 until 2012-09-30.  Projects included in this =
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
meta-webos: git://github.com/openwebos/meta-webos.git
meta-arago: git://arago-project.org/git/meta-arago.git
meta-ivi: git://git.yoctoproject.org/meta-ivi
meta-systemd: git://git.yoctoproject.org/meta-systemd
meta-guacamayo: git://github.com/Guacamayo/meta-guacamayo.git

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for bitbake:

Bogdan Marinescu (3):
=20=20Add sanity check progress screen
=20=20Multiple user interface fixes in settings
=20=20Fix bad merge of #2162

Constantin Musca (4):
=20=20hob: The title of the packages screen depends on the screen you =
arrive from
=20=20hob/runningbuild: Add missing logging level argument
=20=20hob/builder: When you stop a build, Hob should tell you stopping is =
happenin
=20=20hob/builddetailspage: fix failure_primary_action_button_clicked_cb

Cristian Iorga (1):
=20=20hob: Error reports are done in a clearer way

Cristiana Voicu (7):
=20=20hob/builddetailspage: change tooltips and remove a dialog from "Build =
stoppe
=20=20hob/packageselectionpage:cancel button should redirect to Image conf =
screen
=20=20hob/settings: implement a new tab in settings dialog to show =
SSTATE_MIRRORS
=20=20hob/builddetailspage: change branch field
=20=20hob/recipeselectionpage: recipes should not be shown brought in by =
themselve
=20=20hob/settings: implement a new tab in settings dialog to show =
SSTATE_MIRRORS
=20=20hob/builddetailspage: remove "back" button

Ioana Grigoropol (1):
=20=20hob: Buttons width and height are taken for host

Jason Wessel (4):
=20=20runqueue: Add --no-setscene to skip all setscene tasks
=20=20progress.py: Fix traceback when running goggle ui
=20=20event.py, knotty.py, ncurses.py, runningbuild.py: Add support for =
LogExecTTY
=20=20bitbake: Unbuffer stdout for log files

Paul Eggleton (9):
=20=20hob: don't show error dialog for errors during building
=20=20hob: allow configuring default machine using HOB_MACHINE
=20=20hob: remove confirmation dialog on close
=20=20hob: fix Gtk-WARNINGs due to invalid markup on Back button
=20=20lib/bb/runqueue.py: fix exceptions with -k and failed targets
=20=20fetch2: make fetch failure errors more readable
=20=20fetch2: improve error output for checksum failures
=20=20cooker: adjust layer dependency error messages
=20=20lib/bb/data.py: improve output for expansion errors

Richard Purdie (5):
=20=20fetch2/git: Add missing mkdir
=20=20fetch2/git: Don't use deprecated API
=20=20Add missing file from previous commit
=20=20parse/ConfHandler: Add negative lookahead to spot some quoting =
problems
=20=20knotty: Allow displaying of status when no tasks are active

Robert Yang (1):
=20=20fetch2: add "-d" option to cpio

Ross Burton (1):
=20=20hob: set modal flag on progress dialog

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Andrei Dinu (1):
=20=20eglibc: Fix for dynamic linker broken offset

Bogdan Marinescu (1):
=20=20sanity: Added explicit network error status in SanityCheckFailed event

Bruce Ashfield (3):
=20=20linux-yocto/3.4: Update fri2 and sys940x to emgd-1.14
=20=20linux-yocto/3.4: update kver to v3.4.11
=20=20linux-yocto/3.4: update beagleboard configs

Christian Glindkamp (1):
=20=20perl: Fix nativesdk install path

Christopher Larson (1):
=20=20Add and use 'localedir' variable

Constantin Musca (2):
=20=20gnome-keyring: include unpackaged files with PAM enabled
=20=20sanity.bbclass: bblayers.conf should be updated automatically

Damien Lespiau (2):
=20=20initrd: Spawn an emergency shell when something goes wrong
=20=20initramfs: Make mkdir not fail

Elizabeth Flanagan (4):
=20=20ossp-uuid: LICENSE type corrections.
=20=20license.bbclass: Variable standardization
=20=20bitbake.conf: parse license config
=20=20license.conf/bbclass: Move globals to license.conf

Jason Wessel (3):
=20=20terminal: pass data store all the way through to terminal class
=20=20terminal: Send LogExecTTY event to spawn screen
=20=20cml1.bbclass: Convert tab indentation in python functions into =
four-space

Kang Kai (2):
=20=20lsbtest: update list file
=20=20ltp: add dependency libcap

Khem Raj (5):
=20=20arch-armv7a.inc: Don't disable vectorization
=20=20binutils-2.22: Disable recent gold backports from 2.22 branch
=20=20gcc-common.inc: Consider multilib when renaming libgcc for debian'ness
=20=20flex,bison: Add nativesdk variants
=20=20boost: Support enums in hash

Laurentiu Palcu (2):
=20=20adt-installer: add sudo when relocating symlinks
=20=20SDK: trap any IO errors in the relocate script

Martin Ertsaas (1):
=20=20bash: Make it possible to run bash 3.2.48 instead of 4.2.

Martin Jansa (3):
=20=20qemu-native: fix build on hosts without libX11 installed
=20=20xserver-xorg: use EXTENDPKGV instead of PV in =
RCONFLICTS_${PN}-module-exa
=20=20sstate-cache-management: hide error message when one of possible =
layer locat

Matthew McClintock (7):
=20=20eglibc_2.16.bb: replace patch with updated version that supports e6500
=20=20eglibc_2.16.bb: refresh ppc-sqrt_finite.patch for Freescale targets
=20=20eglibc_2.16.bb: refresh ppc_slow_ieee754_sqrt.patch for Freescale =
targets
=20=20eglibc_2.16.bb: refresh fsl-ppc-no-fsqrt.patch for Freescale targets
=20=20arch-powerpc.inc: add altivec as a valid tune feature
=20=20tune-ppce6500.inc: add e6500 tune files
=20=20flac_1.2.1.bb: use TUNE_FEATURES to enable/disable altivec

Otavio Salvador (3):
=20=20cogl: Add a missing depends on libxdamage
=20=20xserver-xorg: Use rdepends to ensure xserver-xorg-module-exa match =
version
=20=20xserver-xorg: Remove RCONFLICTS against xserver-xorg

Paul Eggleton (4):
=20=20classes/multilib: ensure MLPREFIX is set for image recipes
=20=20classes/multilib: prevent multilib extension of nativesdk recipes
=20=20layer.conf: allow other layers to depend on this version
=20=20gst-plugins-good: make pulseaudio support dependent on DISTRO_FEATURES

Phil Blundell (15):
=20=20util-linux: Ensure that ${sbindir} is respected
=20=20dbus: Remove hardcoded reference to /usr in System V startup script
=20=20autotools: Remove special handling for autoconf* and automake*
=20=20pulseaudio: Ensure openssl is disabled
=20=20sqlite3: enable USE_PREAD
=20=20libcap: respect ${base_sbindir}
=20=20rootfs_ipk: Avoid leaving run-postinsts around if online package =
management=20
=20=20libcap: Fix erroneous path in last commit
=20=20kexec-tools: admit mips as a COMPATIBLE_HOST
=20=20gcc-configure-cross: factor out --enable-threads argument into =
${GCCTHREADS}
=20=20package_ipk: Remove spurious '-i' in grep command for log_check
=20=20iproute2: Use configured values for ${base_sbindir} and ${libdir}
=20=20util-linux: Don't package chkdupexe
=20=20util-linux: Remove static libraries from -dev packages
=20=20eglibc: Remove bogus PACKAGES_DYNAMIC setting

Richard Purdie (9):
=20=20sstate: Fix SSTATE_DUPWHITELIST variable usage
=20=20packagedata/multilib: Fix search patch for multilib builds
=20=20sstate: Remove master manifest usage
=20=20busybox: Fix misplaced quote
=20=20Revert "autotools.bbclass: using relative paths for acpaths"
=20=20tcl: Fix dangerous do_install staging references
=20=20sstate: Relax the duplicate file whitelist for now
=20=20perl: Fix substitution madness
=20=20siteconfig: Clear cache before rebuilding

Robert Yang (2):
=20=20package_rpm.bbclass: no initial_solution in the second build
=20=20package_rpm.bbclass: change the arch's "-" to "_" for platform

Ross Burton (2):
=20=20dbus: disable all X11 when native
=20=20xserver-xorg: merge version-specific .inc into .bb

Saul Wold (2):
=20=20Fix Upstream-Status
=20=20rpm: Add base-files as RDEPENDS

Scott Garman (3):
=20=20runqemu: work with tap device names that end with a colon
=20=20oe-find-native-sysroot: show bitbake errors to user
=20=20runqemu-internal: don't append an empty element to PATH

Tom Zanussi (1):
=20=20initscripts/sysfs.sh: mount debugfs if present

Wenzong Fan (1):
=20=20autotools.bbclass: using relative paths for acpaths

Xin Ouyang (1):
=20=20at: atd remove useless --make-pidfile option.

Zhenhua Luo (1):
=20=20sysvinit-inittab: fix hang issue of series consoles check

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Andrei Gherzan (2):
=20=20zram: Integrate an init script
=20=20zram: Add systemd service for zram

Khem Raj (2):
=20=20blacklist.bbclass: Remove
=20=20uhd,fuse: Fix misplaced quotations

Koen Kooi (1):

Martin Ertsaas (1):
=20=20zsh: Change from 4.3.17 to 5.0.0, which is the latest stable release. =
Also c

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-micro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-slugos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nslu2:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Darren Hart (4):
=20=20emgd: Avoid 'already stripped' warnings
=20=20fri2: Update to Linux 3.4 and EMGD 1.14
=20=20sys940x: Update to Linux 3.4 and EMGD 1.14
=20=20fri2: Update xorg.conf per EMGD 1.14 user guide

Kishore Bodke (3):
=20=20meta-crystalforest: Add Calgary Corpus recipe.
=20=20meta-crystalforest: Add Canterbury Corpus recipe.
=20=20meta-crystalforest: Add Silesia Corpus recipe.

Tom Zanussi (1):
=20=20meta-cedartrail: add machine override to SRC_URI

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-handheld:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-opie:

Khem Raj (1):
=20=20qpf-bitstream-vera-sans-mono_1.10.bb: Fix Typo

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:

Florian Boor (47):
=20=20elfutils: Add new release 0.153
=20=20dropbear: Fix download location
=20=20meta-toolchain: Use=3D "install" instead of "mkdir" for creating =
directories
=20=20socat: depend on readline
=20=20sysvinit: Add runlevel to sysvinit-utils
=20=20task-sdk-extra: Get rid of libsvg-cairo
=20=20wxwidgets: Alter CFLAGS and CXXFLAGS
=20=20mc: workaround to build for MIPS
=20=20lxpanel: Fix conflicting declaration
=20=20boa: Disable parallel builds
=20=20libelf: Enable sdk variant
=20=20mpfr: Enable sdk variant
=20=20gmp: Add some bits to make sdk package
=20=20libmpc: Allow to build SDK package
=20=20task-gpe*: Remove gpe-aerial which is unlikely to be useful now
=20=20powerpc-common: Missing value for rp-pppoe
=20=20openobex: Disable "dump" parameter in order to avoid dumping hex data =
to std
=20=20vlc: drop outdated and unparsable recipe
=20=20fakeroot: Change download loation to a working one
=20=20directfb: Allow native builds
=20=20starling: Work around bitbake issue making a dependency from a =
RRECOMMEND st
=20=20chillispot: replace 1.0RC3 with fetchable 1.0 release
=20=20iproute2: add 2.6.38.1 since 2.6.38 is not fetchable any more
=20=20networkmanager: Add release 0.8.6.0
=20=20network-mananger-applet: Add release 0.8.6.0
=20=20proftpd: Get rid of one patch not used any more
=20=20xf86-video-v4l2: Fix source tree location
=20=20netkit-ftp: Update download locations
=20=20tslib: Allow native builds for 1.0
=20=20libcap: Change URI to a fetchable source file
=20=20gdbserver: Add 7.2a since 7.2 disappeared from the GNU mirrors
=20=20lxpanel: We obviously depend on GTK+
=20=20gdb-cross: Add gdb-cross and gdb-cross-sdk version 7.2a.
=20=20gupnp: Do not override configure 0.13.4
=20=20xf86-video-v4l2: Fix build for all platforms other than armv7a
=20=20qt-4.7.3.inc: Rename all binaries instead of qtdemo only
=20=20qt4-tools-sdk.inc: Replace target tools packages in SDK
=20=20libatomics-ops: Add 7.3+git from Debian
=20=20ucview: Disable parallel make
=20=20python-numpy: Add release 1.6.1
=20=20flac: Apply patch and configuration option to disable Altivec support
=20=20udev: Remove "-e" parameter from depmod call in init script.
=20=20cups: Enable serial backend
=20=20midori: Add Midori 0.4.4 release
=20=20libav: Depend on yasm on some platforms
=20=20octave: Make Octave 3.2.4 build and remove lowered preference
=20=20gst-plugins-bad: Do not build problematic AAC codec building an =
enterprise d

Nils Faerber (1):
=20=20sg3-utils: Fix patch causing build issues on some less common =
architectures.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-bug:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-efikamx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix:

Andreas M=C3=BCller (3):
=20=20linux-omap-3.6: move to rc7
=20=20linux: restructure recipe names to avoid PREFERRED_VERSION mess
=20=20linux-omap-3.5: disable USB suspend

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ettus:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-ppc:

Matthew McClintock (2):
=20=20add u-boot as an extra image dep
=20=20u-boot_git.bb: don't try to built 32-bit u-boot on 64-bit machine

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

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

Franklin S. Cooper Jr (1):
=20=20libgles-omap3.inc: Tweak PLATFORM variable.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Koen Kooi (1):
=20=20angstrom-x11vnc-xinit: also activate using xdg

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-browser:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-mono:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-raspberrypi:

Andrei Gherzan (2):
=20=20rpi-zram-service: Remove recipe as it was moved to meta-oe
=20=20README: Remove BBMASK =3D "rpi-zram-service" step

Tyler Hall (1):
=20=20linux-raspberrypi: Use sstate DEPLOYDIR

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-kde:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Bruce Ashfield (2):
=20=20linux-yocto/meta-yocto/3.4: update machine SRCREVs
=20=20beagleboard: update to 3.4

Chen Qi (1):
=20=20routerstation: Disable virtual terminal by default

Richard Purdie (1):
=20=20poky.conf: We need to clear WARN_QA to avoid the unsafe-references

Tom Zanussi (2):
=20=20yocto-bsp: make vfat feature inclusion conditional on kernel version
=20=20yocto-bsp: fix dmaengine feature inclusion

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

Anupam Kaul (3):
=20=20Add luna-universalsearchmgr to webos
=20=20Add qt4 lib pkgconfig files to webos image
=20=20Add recipe for luna-sysservice oe-core

Herb Kuta (14):
=20=20Don't mix hyphens and underscores in conf and class filenames
=20=20Create task-webos-temp for temporary additions to webos-image
=20=20Fix recipes that set PR incorrectly
=20=20pmstatemachineengine: Fix incorrect WEBOS_GIT_TAG setting
=20=20Correct default WEBOS_TARGET_MACHINE_IMPL setting
=20=20librdx-stub: Fix incorrect package names for -dbg, -dev
=20=20webos_system_bus: Don't make assumptions about the current directory
=20=20luna-service2: Don't inherit from webos_component (yet)
=20=20Fix for no SONAME records in qt4-webos shared libraries
=20=20bash: Don't become the default /bin/sh
=20=20luna-sysmgr: Finish porting recipe to OE-core
=20=20nyx-lib: Add RDEPENDS on nyx-modules
=20=20luna-sysservice: Fix to install service and role files
=20=20qt4-config: Make the .pc files usable by other components

Iyad Qumei (4):
=20=20Add libQtSql to Qt4 packaging.
=20=20Replace standard boot task with one specific to webos.
=20=20Add curl package to webos image.
=20=20Create WebOS image with debug tools.

Keith Derrick (5):
=20=20activitymanager: remove comments from service files
=20=20Update powerd, sleepd, and storaged to latest
=20=20Update luna-service2
=20=20Add nyx-modules to the image at submission 68
=20=20powerd=3D19: launch from correct location

Martin Jansa (3):
=20=20webos_daemon, webos_system_bus: fix RDEPENDS
=20=20luna-sysmgr: fix RDEPENDS
=20=20nyx-lib: fix RDEPENDS

Nitika Korla (1):
=20=20Bumped the foundation-frameworks tag     =
Open-webOS-DCO-1.0-Signed-off-by: N

Roger Stringer (9):
=20=20Use submission 60 for DB8
=20=20Add dependent components to the DEPENDS item
=20=20Pickup latest version of luna-init
=20=20Install necessary localized file and update DEPENDS
=20=20Add recipe file for luna-sysmgr
=20=20Add nyx-modules as a dependency
=20=20Add luna-sysservice and increment tag for luna-prefs
=20=20Fix issue with universal search and add new wallpaper
=20=20Use submission 0.912 of luna-sysmgr

Sapna Todwal (3):
=20=20nyx-modules: Update recipe for cmake-modules-webos conversion
=20=20nyx-modules : Use submission 67
=20=20nyx-modules : Use submission 69

Sravan Sandela (2):
=20=20browserserver: Add libpbnjson as a dependency
=20=20browser-adapter: Disable parallel make to counter random build failure

Steve Lemke (2):
=20=20Add mojolocation and pmnetconfigmanager stubs
=20=20Bump pmnetconnnectionmanager to submission 3

Suresh Arumugam (4):
=20=20Add mojomail services to webos-image
=20=20Pickup latest submission of configurator
=20=20Pick up the latest submission of configurator and mojomail
=20=20Pick up the latest submission of core-apps

Susan Montooth (2):
=20=20Add luna-sysmgr to the image.
=20=20Add luna-sysservice to webos-image

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Denys Dmytriyenko (3):
=20=20arago.conf: disable polkit's systemd config from meta-oe
=20=20tcmode-external-arago: set toolchain versions, so nativesdk is not =
confused
=20=20linux-arago: add fake unified arago and arago-armv{5,7} machines and =
empty k

Franklin S Cooper Jr (1):
=20=20recipes: TSU exemption notice

Franklin S. Cooper Jr (15):
=20=20psplash: Add TI color customization
=20=20ussp-push: Add ussp-push
=20=20gadget-init: Overlay gadget-init recipe.
=20=20obexftp: Add ObexFTP
=20=20board-port-labs: Port board-port-labs from arago
=20=20pinmux-utility: Add pinmux utility for am1808
=20=20parse-ip: Add script to parse ip address
=20=20bluez: Disable hid2hci and add test/agent
=20=20eventdump: Port eventdump tool
=20=20bluez-tools: Port bluez-tools recipe
=20=20openssl: Add SHA and MD5 large file patch
=20=20python-m2crypto: Port python-m2crypto recipe
=20=20crda: Port crda recipe from oe-classic
=20=20dt: Port dt recipe
=20=20openobex: Add arago specific tweaks.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

Adrian Alonso (1):
=20=20layer-management: fix machine search string for imx6 targets

Andrei Gherzan (1):
=20=20ecryptfs-utils: Add missing dependency to openssl

Florin Sarbu (2):
=20=20bash: Add modified do_install_append so that bash binary goes into =
/usr/bin
=20=20Remove extra " from the DLT-daemon and fuse recipes

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-systemd:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-guacamayo:




