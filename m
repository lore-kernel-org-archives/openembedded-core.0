Received: from oh-69-34-21-229.sta.embarqhsd.net ([69.34.21.229]
	helo=happy.bec-systems.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1Qm7Vn-00067E-TR; Wed, 27 Jul 2011 19:03:12 +0200
Received: from localhost ([127.0.0.1] helo=happy.bec-systems.com)
	by happy.bec-systems.com with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1Qm7Rf-00034P-N5; Wed, 27 Jul 2011 12:58:55 -0400
Date: Wed, 27 Jul 2011 12:58:55 -0400
Message-Id: <E1Qm7Rf-00034P-N5@happy.bec-systems.com>
X-Mailer: Nodemailer (0.1.13; +http://www.nodemailer.org)
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org
MIME-Version: 1.0
Subject: OE Changelog for 2011-07-18 to 2011-07-25
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Jul 2011 17:03:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Changelog for 2011-07-18 to 2011-07-25.  Projects included in this report:

bitbake: git://git.openembedded.org/bitbake
openembedded-core: git://git.openembedded.org/openembedded-core
meta-openembedded: git://git.openembedded.org/meta-openembedded
meta-angstrom: git://git.angstrom-distribution.org/meta-angstrom
meta-yocto: git://git.yoctoproject.org/poky
meta-texasinstruments: =
git://git.angstrom-distribution.org/meta-texasinstruments
meta-smartphone: http://git.shr-project.org/repo/meta-smartphone.git
meta-micro: git://git.openembedded.org/meta-micro
meta-slugos: git://github.com/kraj/meta-slugos
meta-nslu2: git://github.com/kraj/meta-nslu2
meta-intel: git://git.yoctoproject.org/meta-intel
openembedded: git://git.openembedded.org/openembedded

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for bitbake:

Chris Larson (1):
=20=20event: fix the event display order when exiting early

Christopher Larson (1):
=20=20cache: fix remnant broken 'info' reference from recent cache changes

Joshua Lock (15):
=20=20ui/crumbs/hobprefs: add missing import
=20=20ui/crumbs/tasklistmodel: fix saving recipes
=20=20ui/hob: add more guidance to the stop dialog
=20=20ui/crumbs/configurator: write new lines after new entries
=20=20ui/hob: don't crash if PARALLEL_MAKE doesn't include a space
=20=20ui/crumbs/tasklistmodel: ignore tasks and images when marking =
dependencies
=20=20hob: refer to tasks as Package Collections
=20=20ui/crumbs/tasklistmodel: don't show native and cross recipes
=20=20ui/hob: clear the search entry when resetting
=20=20ui/hob: if the user clicks Stop a second time only offer 'Force Stop'
=20=20hob: only add new layer's to the UI
=20=20ui/crumbs/hobprefs: set higher arbitrary limit on threads & =
parallelism
=20=20ui/crumbs/hobprefs: tweak the package format tooltip
=20=20hob: rework image output type setting
=20=20bitbake|cooker: save a copy of the environment when BitBake is started

Liping Ke (1):
=20=20Remove unused target tree data for Hob

Paul Eggleton (8):
=20=20bitbake/ast: include class name when arguments given in variant
=20=20bitbake/cache: allow class names with arguments to be specified
=20=20add note to -b option indicating no dependency handling
=20=20bitbake/cooker: show a warning when -b is specified
=20=20adjust comments/messages for default server change
=20=20bitbake-layers: check for errors before parsing
=20=20bitbake-layers: add command help
=20=20bitbake-layers: remove unneeded do_EOF

Richard Purdie (4):
=20=20parse/ConfHandler: Fix multiline variable corruption
=20=20Merge remote-tracking branch 'origin/master'
=20=20bitbake/utils: Add contains helper function from lib.oe.utils
=20=20Update version to 1.13.3

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Andreas Mueller (2):
=20=20gdk-pixbuf: Fix QA issues and clean minor formatting
=20=20gdk-pixbuf(-native): Fix build by disabling introspection

Bruce Ashfield (5):
=20=20linux-yocto/meta: update meta SRCREV for routerstation pro
=20=20linux-yocto: update LICENSE to GPLv2
=20=20kernel: copy defconfig to {B} vs {S}
=20=20linux-yocto: kernel-3.0 support recipe
=20=20kern-tools: update SRCREV

Darren Hart (2):
=20=20send-pull-request: default to --supress-cc=3Dall
=20=20ofono: fix test block syntax error

Dexuan Cui (2):
=20=20tcf-agent: upgrade to the latest stable revision 0.0+svnr1855
=20=20distro_tracking_fields.inc: update the info for tcf-agent

Dongxiao Xu (3):
=20=20alsa-tools: Fix recipe build error.
=20=20xcb-proto: add multilib support.
=20=20pciutils: Change the hardcoded /usr/lib to support multilib.

Ihar Hrachyshka (1):
=20=20Fixed concurrency problem for ZIP packed recipes.

Ilya Yanok (7):
=20=20gcc_4.5.1: fix arm_bswapsi2.patch
=20=20gcc_4.5.1: add pr43810.patch
=20=20gcc_4.5.1: add pr44290.patch
=20=20gcc_4.5.1: add pr44606.patch
=20=20gcc_4.5.1: add pr45094.patch
=20=20gcc_4.5.1: add pr45052.patch
=20=20gcc_4.5.1: add pr45886.patch

Joshua Lock (2):
=20=20scripts/hob: wrapper script to run hob gui with a UI specific config =
file
=20=20pseudo: fix uninitialised variable in realpath_fix.patch

Khem Raj (24):
=20=20oe-buildenv-internal: Replace POKYMODE POKYLIBC with TCMODE and TCLIBC
=20=20bitbake.conf: Change TERM default fallback to XTERM instead of =
GNOME_TERM
=20=20default-distrovars: Add largefile and argp to DISTRO_FEATURES
=20=20acl,attr: Fix build failures when NLS is disabled on uclibc
=20=20classes/gettext: Do not disable nls for non target recipes
=20=20libxdamage,libxft,libxrandr: Add missing dependency on virtual/libx11
=20=20tzcode,tzdata: Update tzdata to 2011h
=20=20task-core-x11-sato: Add empty NETWORK_MANAGER for uclibc
=20=20uclibc_0.9.32: Implement sync_file_range2.
=20=20oprofile: Fix build when query_module is not there
=20=20powertop: Add lintl to linker commandline on uclibc
=20=20pimlico/dates: Fix build on uclibc
=20=20binutils: Fix build when compiling target binutils recipe with gcc 4.6
=20=20clutter-box2d: Replace use of finite macro with C99 compliant =
isfinite()
=20=20sysprof: Define NT_GNU_BUILD_ID if undefined
=20=20task-core-tools: Exclude systemtap for uclibc
=20=20site/x86_64-linux-uclibc: Cache lf_cv_sane_realloc
=20=20libiconv: Fix build failure on 1.13.1
=20=20mesa-xlib, mesa-dri: Probe for newlocale() before using it.
=20=20task-core-tools.bb: Exclude lttng-ust for x86_64/uclibc
=20=20uclibc: Add patch header for sync_file_range2.patch
=20=20strace: Define own sigmask macro if not defined already in signal.h
=20=20util-linux: Replace sigsetmask with posix compliant functions
=20=20tclibc-uclibc: Fix TARGET_OS for powerpc

Koen Kooi (3):
=20=20gcc-package-target: don't fail if the .la files we try to delete are =
not the
=20=20gnome-keyring 2.32.1: fix PAM support and make it conditional on =
DISTRO_FEAT
=20=20consolekit 0.4.5: fix PAM installation dir

Kumar Gala (18):
=20=20gcc: Add gcc configure for PowerPC e500v2/SPE embedded floating point =
ABI
=20=20tclibc-*libc: Utilize TARGET_FPU for gnuspe setting
=20=20tune-ppce500v2: Add a tune file for PowerPC e500v2 cores
=20=20openssl: Add handling for linux-gnuspe-powerpc
=20=20flac: fix build issues with e500v2 (gnuspe) toolchain
=20=20tune-ppce500mc: Add a tune file for PowerPC e500mc core
=20=20.gitignore: Update build ignores to have wildcard
=20=20insane.bbclass: Recognise powerpc64
=20=20libc: Add handling of powerpc64
=20=20kernel-arch: Add handling of powerpc64
=20=20libart-lgpl: Add missing config file - allows builds on PowerPC 64
=20=20openssl: Add handling for building on linux-powerpc64
=20=20site/powerpc: Pull all powerpc config options into powerpc32-linux
=20=20site/powerpc64: Update power64-linux to include powerpc-linux
=20=20site/powerpc32-linux: Update with ac_cv_sizeof_* from eglibc
=20=20site/powerpc64-linux: Start initial site config
=20=20site/powerpc*-linux: refactor needed options that are common
=20=20gcc-4.6: Fix packaging of native toolchains

Martin Jansa (4):
=20=20tcmode-default: set preferred version also for (e)glibc-locale
=20=20eglibc-package: don't fail without localedef/gconv
=20=20python: save Makefile.sysroot in do_compile
=20=20python: add patch to fix cross compilation on host with linux-3.0

Matthew McClintock (2):
=20=20Add endianess macros used by previous endian-ness_handling.patch
=20=20Make intltool use perlnative instead of perl on host

Mei Lei (3):
=20=20lsbsetup_1.0.bb: Change the hardcoded /usr/lib to support multilib
=20=20dhcp: Fix libdir issue for multilib
=20=20perl-dynloader.patch: Fix multilib issue for perl

Nitin A Kamble (3):
=20=20glib-2.0: fix a compilation issue due to dtrace
=20=20python: fix security vulnerability
=20=20fix Upstream-Status line for few patches

Paul Eggleton (4):
=20=20kernel.bbclass: minor whitespace fixes
=20=20classes: remove obsolete classes
=20=20classes: remove classes that don't belong in oe-core
=20=20scripts/contrib: add build time regression test script

Phil Blundell (6):
=20=20gcc-4.6: update to 4.6.1 release
=20=20libcap: pass prefix to "make install"
=20=20sanity, base: remove gcc3 check since qemu doesn't need it any more
=20=20uclibc: improve packaging granularity
=20=20libgcc: correct mode on libgcc_s.so.1 to ensure it gets stripped
=20=20insane: improve diagnostic for redundant rpath

Richard Purdie (8):
=20=20libiconv: Fix SRC_URI checksums for 1.13.1 version
=20=20bitbake.conf/cross.bbclass: Add ability to dynamically change library =
locati
=20=20conf/machine/tune: Overhaul tune include file variables
=20=20conf/machine/include: Set TUNE_CCARGS instead of TARGET_CC_ARCH
=20=20bitbake.conf/classes: Variable cleanup
=20=20sanity: Increase bitbake minium version to 1.13.3 for =
bb.utils.contains() fu
=20=20conf/machine/include: Start to fill out architecture specific tune =
include f
=20=20Move architecture specific TARGET_OS mangling into tune files

Saul Wold (9):
=20=20libiconv: add version 1.13.1
=20=20distro tracking: Updates
=20=20eglibc: Tighten LICENSE Fields
=20=20clutter-box2d: fix isfinite.patch
=20=20gettext: Add depends to gettext to avoid host contamination
=20=20default-versions: Update pulseaudio as arm no longer needs a seperate =
backpo
=20=20openjade-native: Add SYSROOT_PREPROCESS_FUNC
=20=20docbook-sgml-dtd-native: Add SYSROOT_PREPROCESS_FUNC
=20=20docbook-dsssl-stylesheets-native: Add SYSROOT_PREPROCESS_FUNC

Scott Garman (5):
=20=20man: add Upstream-Status field to paches
=20=20unfs-server: add Upstream-Status field to patches
=20=20libpng: upgrade to v1.2.46
=20=20distro-tracking: update libpng
=20=20runqemu: report error if TMPDIR cannot be determined

Tom Rini (14):
=20=20metacity: Add gnome-doc-utils to DEPENDS
=20=20gnome-doc-utils: Package up python site packages, bump PR
=20=20iptuils: Add sgmlspl-native to DEPENDS
=20=20btrfs-tools: Add util-linux to DEPENDS
=20=20bitbake.conf, sanity.bbclass: Drop mercurial-native
=20=20help2man-native: Add 1.38.2
=20=20autotools.bbclass: Add help2man-native to the main DEPENDS tree
=20=20python-native: Mangle scripts to use /usr/bin/env python, bump PR
=20=20gnome-doc-utils: Use /usr/bin/env python in xml2po, bump PR
=20=20perl-native: Add a perl-native wrapper in the normal bindir
=20=20cpan.bbclass: Perform more mangling for perl path
=20=20icon-naming-utils-native: Fix long path to perl in icon-name-mapping
=20=20siteinfo.bbclass: Port over oe.dev logic for site files
=20=20local.conf.sample: Add a note about ASSUME_PROVIDED for help2man

Yu Ke (1):
=20=20perl: revise the RRECOMMENDS_perl-modules for multilib case

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Koen Kooi (7):
=20=20connman: update to 0.76
=20=20bluez4: update to 4.95, fix packaging
=20=20libgtop: add 2.28.2
=20=20gnome-system-monitor: add 2.28.2
=20=20siteinfo bbclass: remove, it has been synced back to oe-core
=20=20slim 1.3.2: fix build and packaging
=20=20e-wm svn: add missing eina dependency

Martin Jansa (12):
=20=20vala-dbus-binding-tool: inherit perlnative
=20=20pidgin: inherit perlnative
=20=20tangogps: add misssing dependency bluez4
=20=20bluez4: add missing dependency usbpath
=20=20vala-terminal: inherit perlnative
=20=20libgnome-keyring: inherit perlnative
=20=20gconf: inherit perlnative
=20=20connman: remove if_alg.h test from configure
=20=20tangogps: fix build with curl-7.21.8 and newer
=20=20foxtrotgps: fix build with curl-7.21.8 and newer
=20=20xf86-video-glamo: bump SRCREV, remove upstream applied patch
=20=20e-base: bump EFL_SRCREV

Tom Rini (2):
=20=20guile: Move 'configure-fix.patch' to guile-1.8.7 dir
=20=20mercurial-native: Add 1.9 version

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Koen Kooi (5):
=20=20angstrom: prefer connman 0.76
=20=20angstrom-task-gnome: add gnome-system-monitor and ofono
=20=20base-files: tweak issue and issue.net
=20=20sane-srcrevs: remove stale entries
=20=20angstrom.inc: cleanup

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Andreas Mueller (2):
=20=20gdk-pixbuf: Fix QA issues and clean minor formatting
=20=20gdk-pixbuf(-native): Fix build by disabling introspection

Bruce Ashfield (7):
=20=20linux-yocto/meta: update meta SRCREV for routerstation pro
=20=20linux-yocto/meta-yocto: update SRCREVS
=20=20linux-yocto: update mpc8315erdb SRCREV
=20=20linux-yocto: update LICENSE to GPLv2
=20=20kernel: copy defconfig to {B} vs {S}
=20=20linux-yocto: kernel-3.0 support recipe
=20=20kern-tools: update SRCREV

Chris Larson (1):
=20=20event: fix the event display order when exiting early

Christopher Larson (1):
=20=20cache: fix remnant broken 'info' reference from recent cache changes

Darren Hart (2):
=20=20send-pull-request: default to --supress-cc=3Dall
=20=20ofono: fix test block syntax error

Dexuan Cui (2):
=20=20tcf-agent: upgrade to the latest stable revision 0.0+svnr1855
=20=20distro_tracking_fields.inc: update the info for tcf-agent

Dongxiao Xu (3):
=20=20alsa-tools: Fix recipe build error.
=20=20xcb-proto: add multilib support.
=20=20pciutils: Change the hardcoded /usr/lib to support multilib.

Ihar Hrachyshka (1):
=20=20Fixed concurrency problem for ZIP packed recipes.

Ilya Yanok (7):
=20=20gcc_4.5.1: fix arm_bswapsi2.patch
=20=20gcc_4.5.1: add pr43810.patch
=20=20gcc_4.5.1: add pr44290.patch
=20=20gcc_4.5.1: add pr44606.patch
=20=20gcc_4.5.1: add pr45094.patch
=20=20gcc_4.5.1: add pr45052.patch
=20=20gcc_4.5.1: add pr45886.patch

Joshua Lock (17):
=20=20scripts/hob: wrapper script to run hob gui with a UI specific config =
file
=20=20pseudo: fix uninitialised variable in realpath_fix.patch
=20=20ui/crumbs/hobprefs: add missing import
=20=20ui/crumbs/tasklistmodel: fix saving recipes
=20=20ui/hob: add more guidance to the stop dialog
=20=20ui/crumbs/configurator: write new lines after new entries
=20=20ui/hob: don't crash if PARALLEL_MAKE doesn't include a space
=20=20ui/crumbs/tasklistmodel: ignore tasks and images when marking =
dependencies
=20=20hob: refer to tasks as Package Collections
=20=20ui/crumbs/tasklistmodel: don't show native and cross recipes
=20=20ui/hob: clear the search entry when resetting
=20=20ui/hob: if the user clicks Stop a second time only offer 'Force Stop'
=20=20hob: only add new layer's to the UI
=20=20ui/crumbs/hobprefs: set higher arbitrary limit on threads & =
parallelism
=20=20ui/crumbs/hobprefs: tweak the package format tooltip
=20=20hob: rework image output type setting
=20=20bitbake|cooker: save a copy of the environment when BitBake is started

Khem Raj (24):
=20=20oe-buildenv-internal: Replace POKYMODE POKYLIBC with TCMODE and TCLIBC
=20=20bitbake.conf: Change TERM default fallback to XTERM instead of =
GNOME_TERM
=20=20default-distrovars: Add largefile and argp to DISTRO_FEATURES
=20=20acl,attr: Fix build failures when NLS is disabled on uclibc
=20=20classes/gettext: Do not disable nls for non target recipes
=20=20libxdamage,libxft,libxrandr: Add missing dependency on virtual/libx11
=20=20tzcode,tzdata: Update tzdata to 2011h
=20=20task-core-x11-sato: Add empty NETWORK_MANAGER for uclibc
=20=20uclibc_0.9.32: Implement sync_file_range2.
=20=20oprofile: Fix build when query_module is not there
=20=20powertop: Add lintl to linker commandline on uclibc
=20=20pimlico/dates: Fix build on uclibc
=20=20binutils: Fix build when compiling target binutils recipe with gcc 4.6
=20=20clutter-box2d: Replace use of finite macro with C99 compliant =
isfinite()
=20=20sysprof: Define NT_GNU_BUILD_ID if undefined
=20=20task-core-tools: Exclude systemtap for uclibc
=20=20site/x86_64-linux-uclibc: Cache lf_cv_sane_realloc
=20=20libiconv: Fix build failure on 1.13.1
=20=20mesa-xlib, mesa-dri: Probe for newlocale() before using it.
=20=20task-core-tools.bb: Exclude lttng-ust for x86_64/uclibc
=20=20uclibc: Add patch header for sync_file_range2.patch
=20=20strace: Define own sigmask macro if not defined already in signal.h
=20=20util-linux: Replace sigsetmask with posix compliant functions
=20=20tclibc-uclibc: Fix TARGET_OS for powerpc

Koen Kooi (3):
=20=20gcc-package-target: don't fail if the .la files we try to delete are =
not the
=20=20gnome-keyring 2.32.1: fix PAM support and make it conditional on =
DISTRO_FEAT
=20=20consolekit 0.4.5: fix PAM installation dir

Kumar Gala (19):
=20=20gcc: Add gcc configure for PowerPC e500v2/SPE embedded floating point =
ABI
=20=20tclibc-*libc: Utilize TARGET_FPU for gnuspe setting
=20=20tune-ppce500v2: Add a tune file for PowerPC e500v2 cores
=20=20openssl: Add handling for linux-gnuspe-powerpc
=20=20flac: fix build issues with e500v2 (gnuspe) toolchain
=20=20tune-ppce500mc: Add a tune file for PowerPC e500mc core
=20=20.gitignore: Update build ignores to have wildcard
=20=20insane.bbclass: Recognise powerpc64
=20=20libc: Add handling of powerpc64
=20=20kernel-arch: Add handling of powerpc64
=20=20libart-lgpl: Add missing config file - allows builds on PowerPC 64
=20=20openssl: Add handling for building on linux-powerpc64
=20=20site/powerpc: Pull all powerpc config options into powerpc32-linux
=20=20site/powerpc64: Update power64-linux to include powerpc-linux
=20=20site/powerpc32-linux: Update with ac_cv_sizeof_* from eglibc
=20=20site/powerpc64-linux: Start initial site config
=20=20site/powerpc*-linux: refactor needed options that are common
=20=20mpc8315e-rdb: Set TARGET_FPU correct
=20=20gcc-4.6: Fix packaging of native toolchains

Liping Ke (1):
=20=20Remove unused target tree data for Hob

Martin Jansa (4):
=20=20tcmode-default: set preferred version also for (e)glibc-locale
=20=20eglibc-package: don't fail without localedef/gconv
=20=20python: save Makefile.sysroot in do_compile
=20=20python: add patch to fix cross compilation on host with linux-3.0

Matthew McClintock (2):
=20=20Add endianess macros used by previous endian-ness_handling.patch
=20=20Make intltool use perlnative instead of perl on host

Mei Lei (3):
=20=20lsbsetup_1.0.bb: Change the hardcoded /usr/lib to support multilib
=20=20dhcp: Fix libdir issue for multilib
=20=20perl-dynloader.patch: Fix multilib issue for perl

Nitin A Kamble (3):
=20=20glib-2.0: fix a compilation issue due to dtrace
=20=20python: fix security vulnerability
=20=20fix Upstream-Status line for few patches

Paul Eggleton (13):
=20=20kernel.bbclass: minor whitespace fixes
=20=20classes: remove obsolete classes
=20=20classes: remove classes that don't belong in oe-core
=20=20scripts/contrib: add build time regression test script
=20=20README.hardware: update MPC8315E-RDB instructions
=20=20bitbake/ast: include class name when arguments given in variant
=20=20bitbake/cache: allow class names with arguments to be specified
=20=20add note to -b option indicating no dependency handling
=20=20bitbake/cooker: show a warning when -b is specified
=20=20adjust comments/messages for default server change
=20=20bitbake-layers: check for errors before parsing
=20=20bitbake-layers: add command help
=20=20bitbake-layers: remove unneeded do_EOF

Phil Blundell (6):
=20=20gcc-4.6: update to 4.6.1 release
=20=20libcap: pass prefix to "make install"
=20=20sanity, base: remove gcc3 check since qemu doesn't need it any more
=20=20uclibc: improve packaging granularity
=20=20libgcc: correct mode on libgcc_s.so.1 to ensure it gets stripped
=20=20insane: improve diagnostic for redundant rpath

Richard Purdie (14):
=20=20meta-yocto/conf/local.conf.sample: Update SSTATE_MIRRORS comment to =
remove p
=20=20libiconv: Fix SRC_URI checksums for 1.13.1 version
=20=20parse/ConfHandler: Fix multiline variable corruption
=20=20Sync patches with DOS line endings that became corrupted
=20=20bitbake/utils: Add contains helper function from lib.oe.utils
=20=20bitbake.conf/cross.bbclass: Add ability to dynamically change library =
locati
=20=20conf/machine/tune: Overhaul tune include file variables
=20=20conf/machine/include: Set TUNE_CCARGS instead of TARGET_CC_ARCH
=20=20meta-yocto: Sync with TARGET_ARCH removal changes
=20=20Update version to 1.13.3
=20=20bitbake.conf/classes: Variable cleanup
=20=20sanity: Increase bitbake minium version to 1.13.3 for =
bb.utils.contains() fu
=20=20conf/machine/include: Start to fill out architecture specific tune =
include f
=20=20Move architecture specific TARGET_OS mangling into tune files

Saul Wold (9):
=20=20libiconv: add version 1.13.1
=20=20distro tracking: Updates
=20=20eglibc: Tighten LICENSE Fields
=20=20clutter-box2d: fix isfinite.patch
=20=20gettext: Add depends to gettext to avoid host contamination
=20=20default-versions: Update pulseaudio as arm no longer needs a seperate =
backpo
=20=20openjade-native: Add SYSROOT_PREPROCESS_FUNC
=20=20docbook-sgml-dtd-native: Add SYSROOT_PREPROCESS_FUNC
=20=20docbook-dsssl-stylesheets-native: Add SYSROOT_PREPROCESS_FUNC

Scott Garman (5):
=20=20man: add Upstream-Status field to paches
=20=20unfs-server: add Upstream-Status field to patches
=20=20libpng: upgrade to v1.2.46
=20=20distro-tracking: update libpng
=20=20runqemu: report error if TMPDIR cannot be determined

Scott Rifenbark (56):
=20=20documentation/kernel-manual/kernel-how-to.xml: Edits to "Tree =
Construction"=20
=20=20documentation/kernel-manual/kernel-how-to.xml: Edits to "Build =
Strategy" (Fr
=20=20documentation/kernel-manual/kernel-how-to.xml: Partial - Re-write of =
BSP cre
=20=20documentation/kernel-manual/kernel-how-to.xml: partial - more edits =
to BSP p
=20=20documentation/kernel-manual/kernel-how-to.xml: Partial - more general =
edits=20
=20=20documentation/adt-manual/kernel-how-to.xml: Changed Bitbake to =
BitBake (From
=20=20documentation/adt-manual/adt-prepare.xml: Changed Bitbake to BitBake =
(From y
=20=20documentation/poky-ref-manual/extendpoky.xml: Changed bitbake to =
BitBake (Fr
=20=20documentation/kernel-manual/kernel-concepts.xml: Changed git to Git =
as neede
=20=20documentation/kernel-manual/kernel-doc-intro.xml: Changed git to Git =
as need
=20=20documentation/kernel-manual/kernel-how-to.xml: changed git to Git as =
needed=20
=20=20documentation/kernel-manual/kernel-how-to.xml: Command line example =
fixes
=20=20documentation/kernel-manual/kernel-how-to.xml: Added 'git' for a push =
exampl
=20=20documentation/kernel-manual/kernel-how-to.xml: Updated the create BSP =
sectio
=20=20documentation/kernel-manual/kernel-concepts.xml: Fixed typo (From =
yocto-docs
=20=20documentation/kernel-manual/kernel-concepts.xml: Added references to =
Git Doc
=20=20documentation/kernel-manual/kernel-concepts.xml: General rewrite of =
Kernel t
=20=20documentation/kernel-manual/kernel-how-to.xml: Defined audience for =
chapter
=20=20documentation/kernel-manual/kernel-how-to.xml: Tree Construction =
section fur
=20=20documentation/bsp-guide/bsp.xml: Scrubbed "Poky" out of the manual. =
(From yo
=20=20documentation/bsp-guide/bsp.xml: updated path for yocto kernels
=20=20documentation/bsp-guide/bsp.xml: Changed 'GIT' to 'Git' (From =
yocto-docs rev
=20=20documentation/bsp-guide/bsp.xml: Added a note stating no example =
here. (From
=20=20documentation/yocto-project-qs/yocto-project-qs.xml: changed build =
command
=20=20documentation/dev-manual: Added top-level directory for Dev Manual. =
(From yo
=20=20documentation/dev-manual/style.css: Added title page figure. (From =
yocto-doc
=20=20documentation/dev-manual/dev-man.xml: Initial file created. (From =
yocto-docs
=20=20documentation/dev-manual/figures/dev-title.png: Initial file created. =
(From=20
=20=20documentation/dev-manual/dev-man-intro.xml: Initial chapter.
=20=20documentation/dev-manual/dev-man-start.xml: Initial chapter creation. =
(From=20
=20=20documentation/dev-manual/dev-man-newbie.xml: Initial chapter =
creation. (From
=20=20documentation/dev-manual/dev-man-cases.xml: Initial chapter creation. =
(From=20
=20=20documentation/Makefile: Added support for YP Dev Manual.
=20=20documentation/documentation/yocto-project-qs/yocto-project-qs.xml: =
link typo
=20=20documentation/yocto-project-qs/yocto-project-qs.xml: wording change.
=20=20documentation/yocto-project-qs/yocto-project-qs.xml: gmae -> sdk
=20=20documentation/dev-manual: Deleted files with bad names
=20=20documentation/dev-manual/dev-manual-cases.xml: initial file with new =
name.
=20=20documentation/dev-manual/dev-manual-customization.xsl: Initial file =
with new
=20=20documentation/dev-manual/dev-manual-intro.xml: Initial file with new =
name.
=20=20documenation/dev-manual/dev-manual-newbie.xml: Initial file with new =
name.
=20=20documentation/dev-manual/dev-manual-start.xml: Initial file with new =
name.
=20=20documentation/dev-manual/dev-manual.xml: Initial file with new name.
=20=20documentation/dev-manual/dev-manual-intro.xml: Initial content added.
=20=20documentation/dev-manual/dev-manual-start.xml: Initial content added
=20=20documentation/dev-manual/dev-manual-newbie.xml: Initial content added.
=20=20documentation/dev-manual/dev-manual-model.xml: Initial chapter
=20=20documentation/dev-manual/dev-manual.xml: Added chapter
=20=20documentation/dev-manual/dev-manual-model.xml: Added placeholder =
sections. (
=20=20documentation/dev-manual/dev-manual.xml: re-ordered the chapters for =
the mak
=20=20documentation/dev-manual/dev-manual-cases.xml: Initial content added.
=20=20documentation/yocto-project-qs/yocto-project-qs.xml: fixed zypper =
syntax
=20=20documentation/yocto-project-qs/yocto-project-qs.xml: Various Robert =
P. J. Da
=20=20documentation/dev-manual/dev-manual-cases.xml: Docbook formatting =
completed.
=20=20documentation/dev-manual/dev-manual-newbie.xml: bad links corrected. =
(From y
=20=20documentation/dev-manual/dev-manual-start.xml: Bad links fixed.

Tom Rini (14):
=20=20metacity: Add gnome-doc-utils to DEPENDS
=20=20gnome-doc-utils: Package up python site packages, bump PR
=20=20iptuils: Add sgmlspl-native to DEPENDS
=20=20btrfs-tools: Add util-linux to DEPENDS
=20=20bitbake.conf, sanity.bbclass: Drop mercurial-native
=20=20help2man-native: Add 1.38.2
=20=20autotools.bbclass: Add help2man-native to the main DEPENDS tree
=20=20local.conf.sample: Add a note about ASSUME_PROVIDED for help2man
=20=20python-native: Mangle scripts to use /usr/bin/env python, bump PR
=20=20gnome-doc-utils: Use /usr/bin/env python in xml2po, bump PR
=20=20perl-native: Add a perl-native wrapper in the normal bindir
=20=20cpan.bbclass: Perform more mangling for perl path
=20=20icon-naming-utils-native: Fix long path to perl in icon-name-mapping
=20=20siteinfo.bbclass: Port over oe.dev logic for site files

Yu Ke (1):
=20=20perl: revise the RRECOMMENDS_perl-modules for multilib case

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-texasinstruments:

Chase Maupin (1):
=20=20u-boot: add missing patch for am37x-evm

Enrico Butera (1):
=20=20linux-omap 2.6.39: fix rootfs over nfs

Koen Kooi (18):
=20=20linux-omap 2.6.39: add MUSB patch to improve mass storage performance
=20=20u-boot git: add am3517-evm support
=20=20x-loader git: update to 1.5.1
=20=20linux-omap-psp 2.6.32: fix am3517-evm build
=20=20signgp: add util needed for old x-loader versions
=20=20x-load: add 1.46-psp
=20=20add machine config for am3517-evm
=20=20linux-omap 2.6.39: remove multi-kernel features, it does more harm =
that good
=20=20linux 3.0: initial recipe that will track 3.0rc till 3.0 final
=20=20linux.inc: enable parallel make for modules as well
=20=20multi-kernel: parallel_make fix has moved to linux.inc
=20=20linux 3.0: updates
=20=20linux 3.0: add support for RTC on zippy/zippy2 boards
=20=20linux 3.0: enable 1GHz for beagle and add 2 MADC patches from =
sakomans tree
=20=20linux 3.0: bump SRCREV to v3.0 final
=20=20machine files: start removing TARGET_ARCH
=20=20remove tune files and use oe-core ones
=20=20linux 3.0: add support for OMAP3 720MHz devices

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

Martin Jansa (6):
=20=20meta-fso: sync SRCREVs with oe.dev
=20=20linux-nokia900-meego: update defconfig to build at least =
kernel-module-tun
=20=20SHR: add DISTRO_FEATURES_LIBC from oe-core to our DISTRO_FEATURES
=20=20SHR: add PREFERRED_PROVIDER_libcanberra-alsa
=20=20meta-openmoko: weak assign to IMAGE_FSTYPES, to make it easier to =
override f
=20=20SHR: return ASSUME_PROVIDED for virtual/libiconv-native accidentaly =
removed=20

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-micro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-slugos:

Khem Raj (1):
=20=20slugos: Prefer 2.21.1 for binutils

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nslu2:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:

Joel A Fernandes (1):
=20=20beagleboard-test-scripts: BeagleBoard userbutton detection for =
flashing

Khem Raj (1):
=20=20gcc: Package libstdc++ gdb python helpers into dev package

Koen Kooi (1):
=20=20pulseaudio: make it work out of the box     * reuse 'audio' group as =
access=20

Martin Jansa (3):
=20=20navit_svn: return trailing space to SRC_URI
=20=20linux-nokia900-meego: update defconfig to build at least =
kernel-module-tun
=20=20cornucopia: bump SRCREV

Simon Busch (5):
=20=20libmsmhll: add the hci link layer implementation library fo msmcomm
=20=20msmcommd: add libmsmhll as dependency and bump PR
=20=20msmcomm: bump SRCREV for latest updates
=20=20linux-palmpre: bump SRCREV for latest updates
=20=20linux-palmpre: update defconfig and bump MACHINE_KERNEL_PR

chase maupin (1):
=20=20nodejs: Add patch to compile with GCC 4.3.3




