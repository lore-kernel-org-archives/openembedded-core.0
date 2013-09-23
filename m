Return-Path: <cliff.brake@gmail.com>
Received: from bec-systems.com (u15414263.onlinehome-server.com
	[74.208.70.121])
	by mail.openembedded.org (Postfix) with ESMTP id 3EE5D6102E;
	Mon, 23 Sep 2013 21:39:51 +0000 (UTC)
Received: from oh-67-76-203-50.sta.embarqhsd.net ([67.76.203.50]
	helo=happy.bec-systems.com)
	by bec-systems.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cliff.brake@gmail.com>)
	id 1VODkF-0004Fs-7f; Mon, 23 Sep 2013 17:32:48 -0400
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Date: Mon, 23 Sep 2013 21:39:28 GMT
Message-Id: <1379972368886.5421d0bd@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
X-Spam_score: -0.2
X-Spam_score_int: -1
X-Spam_bar: /
Subject: OE Changelog since 2013-09-15 until 2013-09-22
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 23 Sep 2013 21:39:52 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2013-09-15 until 2013-09-22.  Projects included in this =
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
meta-qt5: git://github.com/meta-qt5/meta-qt5.git
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

Alexandru DAMIAN (10):
=20=20runqueue: add runQueueTaskSkipped event
=20=20cooker: Avoid duplication for taskdata creation
=20=20data_smart: Add explict None checks
=20=20bitbake: cooker,xmlrpc,servers: implement CookerFeatures
=20=20bitbake: cooker,runqueue: send the task dependency tree
=20=20bitbake: build, runqueue: adds info to the *runQueue* events
=20=20bitbake: cooker: get extra information from recipe cache
=20=20bitbake: cooker, command: add a command to return global data
=20=20bitbake: event: adding generic event for metadata usage
=20=20bitbake: runqueue: add task hash to Queue events

Cristiana Voicu (1):
=20=20hob: populate "Save image" dialog when saving changes to a custom =
image reci

Richard Purdie (22):
=20=20build: Add logfile to add TaskBase events
=20=20cooker: Allow profiling of the parser in profile mode
=20=20data: Be explicit in data_db check
=20=20siggen: Use lookup cache exclusively
=20=20data_smart: Improve variable expansion regexp
=20=20data_smart: use the expand_cache in VariableParse
=20=20data: Use direct iteration, not keys()
=20=20data: Cache an list of export variables
=20=20data_smart: Allow expansion of flags in getVarFlags
=20=20data_smart: Allow flags to use the expand cache
=20=20data_smart: Cache the fact a variable accesses another even if its =
unset
=20=20data: Optimise build_dependencies a little
=20=20data: Optimise flag lookup in build_dependencies
=20=20data: Optimise flag exclusion list handling
=20=20bb.fatal: Raise a BBHandledException instead of exiting
=20=20Revert "bb.fatal: Raise a BBHandledException instead of exiting"
=20=20cooker: return a copy checkPackages
=20=20data_smart: Fix variable reference issues
=20=20build: Add BB_TASK_NICE_LEVEL to task code
=20=20bin/bitbake: Improve --help text
=20=20data_smart: Variable references don't contain newlines, spaces or tabs
=20=20tests/data: Whitespace in key names is a really bad idea

Scott Rifenbark (1):
=20=20usermanual.xml: Two new sections added to BitBake "Description"

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Anders Darander (1):
=20=20u-boot-fw-utils: reinstate target recipe for fw_printenv

Bruce Ashfield (3):
=20=20linux-yocto/3.8: add haswell-wc board config and branch
=20=20linux-yocto/3.10: mips configuration changes
=20=20linux-yocto/3.10: fix long perf compile times

Chen Qi (1):
=20=20rpm: fix typo in PACKAGECONFIG

Eric B=C3=A9nard (1):
=20=20qt-mobility: fix build without X11

Hans Beckerus (1):
=20=20libtool: fix resolve of lt_sysroot

Hongxu Jia (5):
=20=20LSB 4.1 Library Check: fix unable to find library libqt-mt.so.3
=20=20python: fix failures of LSB python-runtime tests
=20=20busybox: move su to /bin for lsb command check test
=20=20shadow: move su to /bin for lsb command check test
=20=20util-linux: move su to /bin for lsb command check test

Jackie Huang (2):
=20=20libunistring: remove the test to convert euc-jp in configure
=20=20findutils_4.2.31: backport fixes for doc build errors

Jason Wessel (2):
=20=20bootimage.bbclass: Move fat image creation into a function
=20=20cdrtools-native: Update from 3.00 to 3.01a17

Jukka Rissanen (1):
=20=20connman: Try to figure out NFS root interface if using DHCP

Laurentiu Palcu (1):
=20=20runqemu: set qemuarm memory size back to 128MB

Li Zhijian (2):
=20=20kbd: Fix coding sytle
=20=20kbd: Allow resizecons on x86_64

Martin Jansa (1):
=20=20gcc-4.8: temporary disable thumb

Ming Liu (1):
=20=20openssh: use volatiles for managing /var/run/sshd

Nitin A Kamble (1):
=20=20udev: avoid autosuspend of USB input devices

Otavio Salvador (7):
=20=20perf: Ensure we use CFLAGS and LDFLAGS settings from kernel build =
system
=20=20u-boot-fw-utils: Skip package if UBOOT_MACHINE is unset
=20=20perf: Add LDFLAGS to allow build of old kernels without patching
=20=20core-image-x11: Ensure x11 distro feature is enabled
=20=20uboot-config.bbclass: Use an annonymous python function
=20=20u-boot, u-boot-fw-utils, u-boot-fw-utils-cross: Use uboot-config class
=20=20uboot-config.bbclass: Handle UBOOT_MACHINE setting

Paul Eggleton (8):
=20=20cmake-native: fix dependencies
=20=20classes/testimage: remove odd characters in comments
=20=20classes/testimage-auto: add class to allow automatically running =
image tests
=20=20classes/sanity: test for DISPLAY being set with testimage class
=20=20conf/local.conf.sample: update for new testimage class
=20=20classes/imagetest-qemu: remove old image testing class
=20=20avahi: bump INC_PR to avoid do_configure failure in existing workdir
=20=20glib-2.0: fix broken python script header on machines using buildtools

Randy MacLeod (2):
=20=20vala: add bison-native depends for vala-native
=20=20pseudo: force NO32LIB to true for nativesdk

Richard Purdie (7):
=20=20autotools: Remove .la files if rebuilding non out of tree software
=20=20utils: Update bb.which reference and other syntax cleanup
=20=20linux-libc-headers: Fix comment typo spotted by Mark Hatle
=20=20qemu: Fix broken patch
=20=20btrfs-tools: Fix parallel make issue
=20=20gzipnative: Ensure dependencies apply to do_unpack and do_populate_lic
=20=20gcc-target: Fix libatomic dependency tracking issues

Robert Yang (3):
=20=20coreutils: set acpaths to avoid "Argument list too long" error
=20=20linux-libc-headers: do_install: fix "Argument list too long" error
=20=20python-smartpm: truncate the filename to meet NAME_MAX

Ross Burton (19):
=20=20libxml2: remove patch for CVE-2012-2871
=20=20webkit-gtk: remove compile-three-times hack
=20=20transfig-native: remove, nothing depends on it
=20=20imake: remove
=20=20Revert "initrdscripts: look for new systemd-udevd location"
=20=20mesa-gl: add GL-only Mesa recipe
=20=20xserver-xorg: change mesa dependency to virtual/mesa
=20=20weston: change mesa dependency to virtual/mesa
=20=20avahi: fix and enable out-of-tree builds
=20=20mesa: add virtual/mesa provider
=20=20qemu: add option to disable X grabs
=20=20qemurunner: disable grabs in automated testing
=20=20bblayers.conf.sample: use ##OEROOT## instead of ##COREBASE##
=20=20bitbake.conf: define WORKDIR in terms of BASE_WORKDIR
=20=20insane: don't abort if workdir is not TMPDIR/work
=20=20wipe-sysroot: delete pkgdata stamps
=20=20x11vnc: respect zeroconf DISTRO_FEATURE to enable Avahi support
=20=20libpam: only use pam_systemd.so if systemd is enabled
=20=20oprofileui-server: use two digit initscript sequene

Roy Li (1):
=20=20pciutils: remove pcimodules

Saul Wold (1):
=20=20oeqa/runtime/smart: Increase timeout to 1500 test

Stefan Stanacar (2):
=20=20lib/oeqa/utils: sshcontrol: log how long the last command take
=20=20lib/oeqa/runtime: cleanup and improve output readability for some =
tests

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Andrea Adami (4):
=20=20kexecboot_cfg: fix against unwanted appendings to boot.cfg
=20=20linux-yocto-tiny-kexecboot: repair after changes in kernel.bbclass
=20=20linux-yocto-tiny-kexecboot: move from 3.8 to 3.10
=20=20linux-yocto-tiny-kexecboot: exclude all packaging tasks

Andreas M=C3=BCller (10):
=20=20ntp: disable automatic panic shutdown for ntpd
=20=20libcanberra: add PACKAGES_DYNAMIC so we use the splitted packages
=20=20libcanberra: remove r0 - it is of no use
=20=20libcanberra: handle alsa and pulsaudio by PACKAGECONFIG - defaults =
based upo
=20=20libxfce4ui: update to git head
=20=20xfwm4: move to git repo
=20=20xfce4-weather-plugin: update to 0.8.3
=20=20xfce4-equake-plugin: initial add 1.3.3
=20=20packagegroup-xfce-extended: add xfce4-equake-plugin
=20=20xfce4-settings: move to schnitzeltony's git repo to get new datetime =
setter

Chunrong Guo (1):
=20=20tclap: update SRC_URI

Jack Mitchell (1):
=20=20libsoc: new recipe

Jason Kridner (1):
=20=20cloud9: update repository for sass.js

Javier Viguera (1):
=20=20cherokee: fix SRC_URI

Khem Raj (2):
=20=20uml-utilities: Fix build errors exposed with multilib
=20=20proxy-libintl: Do not act as gettext provider

Martin Jansa (45):
=20=20xbmc: Add libmad dependency
=20=20packagekit: Add PACKAGECONFIG for service-packs
=20=20orage: Add PACKAGECONFIG for notify and dependency on popt
=20=20xfce4-clipman-plugin: Add PACKAGECONFIG for unique
=20=20xfce4-places-plugin: Add PACKAGECONFIG for notify
=20=20xfce4-settings: Add PACKAGECONFIG for notify
=20=20xfdesktop: Add PACKAGECONFIG for notify
=20=20gnome-desktop: Add startup-notification dependency
=20=20gnome-control-center: Add libxscrnsaver dependency
=20=20gnome-settings-daemon: add PACKAGECONFIG for pulseaudio
=20=20libgsf: Add PACKAGECONFIG for gdk-pixbuf
=20=20imagemagick: Add PACKAGECONFIG for jp2
=20=20libxklavier: Add libxi dependency
=20=20claws-mail: Add PACKAGECONFIG for enchant, dbus, ldap and =
startup-notificati
=20=20abiword: Add PACKAGECONFIG for collab-backends and spell
=20=20mkvtoolnix: Add PACKAGECONFIG for flac
=20=20uhd: Add PACKAGECONFIG for orc
=20=20entrance: Add PACKAGECONFIG for consolekit
=20=20expedite: Add PACKAGECONFIG for sdl
=20=20metacity: Add dependency on libgtop
=20=20libgtop: Add dependency on libxau
=20=20libetpan: Add dependency on curl
=20=20fluidsynth: Add PACKAGECONFIG for sndfile, jack, pulseaudio, =
portaudio and r
=20=20xchat: Add PACKAGECONFIG for dbus and openssl
=20=20libwnck(3): Add dependency on libxres
=20=20e-wm: Add PACKAGECONFIG for pam
=20=20sox: Add PACKAGECONFIG for mad, id3tag and lame
=20=20upower: Add PACKAGECONFIG for idevice
=20=20udisks: Add PACKAGECONFIG for parted
=20=20imlib2: Add PACKAGECONFIG for gif, tiff, id3 and bzip2
=20=20openmotif: Add PACKAGECONFIG for jpeg and png
=20=20openbox: Add PACKAGECONFIG for imlib2, xrandr, xinerama, xcursor, =
startup-no
=20=20v4l-utils: Add libx11 dependency
=20=20networkmanager: Add PACKAGECONFIG for concheck
=20=20proftpd: Add PACKAGECONFIG for curses
=20=20gnuplot: Add PACKAGECONFIG for cairo
=20=20gvfs: Add PACKAGECONFIG for fuse and disable it by default
=20=20gvfs: Add PACKAGECONFIG for archive, obexftp, cdda
=20=20gnome-vfs: Add PACKAGECONFIG for fam
=20=20libmemcached: Add PACKAGECONFIG for sasl
=20=20gegl: Add PACKAGECONFIG for jasper, avformat
=20=20edb: Add PACKAGECONFIG for ncurses
=20=20lightmediascanner: Add PACKAGECONFIG for ogg
=20=20collectd: Add PACKAGECONFIG for undeterministic dependencies
=20=20cherokee: Add PACKAGECONFIG for ffmpeg and ldap

Paul Barker (1):
=20=20vim: upgrade to v7.4.27 and refactor

Ross Burton (2):
=20=20numlockx: remove spurious imake dependency
=20=20dleyna: switch to git clones instead of generated tarballs

Roy Li (1):
=20=20apache2: create configuration file for systemd-tmpfiles

Roy.Li (1):
=20=20apache2: add apxs to SSTATE_SCAN_FILES

Shakeel, Muhammad (4):
=20=20tracker: Do not use hardcoded paths in systemd service files
=20=20openssh: Remove systemd support which is merged in oe-core
=20=20lighttpd: Remove systemd support which is merged in oe-core
=20=20rpcbind: Remove systemd support which is merged in oe-core

jc@vtkloud.com (1):
=20=20libao: add version 1.1.0

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Franklin S. Cooper Jr (2):
=20=20packagegroup-arago-base-tisdk: Remove unnecessary bootloader binaries =
from f
=20=20ti-compat-wireless: Update sourceipk function name

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-beagleboard:

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

Daiane Angolini (1):
=20=20imx-test: Install vpu config and media files

Eric BENARD (1):
=20=20barebox: fix warning

Otavio Salvador (3):
=20=20linux-imx (3.0.35): Update to 4.1.0 based branch
=20=20linux-fslc: Update to a318c1dd revision
=20=20linux-imx (3.0.35): Add defconfig file for i.MX6 Solo SoCs

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

Eric BENARD (1):
=20=20barebox: add cfa10036 to COMPATIBLE_MACHINE

Eric Nelson (1):
=20=20linux-boundary (3.0.35): update to match Freescale's 4.1.1 release

Fabio Estevam (1):
=20=20conf: Allow wandboards to boot a mainline kernel

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-ppc:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-guacamayo:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix-community:

Andreas M=C3=BCller (1):
=20=20overo.conf: set mesa-gl the preferred provider for virtual/libgl

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-handheld:

Andrea Adami (3):
=20=20linux-yocto: initial commit of version 3.10
=20=20linux-yocto-tiny-kexecboot: move from 3.8 to 3.10
=20=20linux-yocto_3.8: remove in favor of version 3.10

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-igep:

Enric Balletbo i Serra (2):
=20=20machine/igep0033: Add MACHINE_EXTRA_RRECOMMENDS and =
EXTRA_IMAGEDEPENDS.
=20=20u-boot: Update in order to fix memory issues.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Nitin A Kamble (7):
=20=20crownbay.conf: include meta-intel-emgd.inc
=20=20emenlow.conf: include meta-intel-emgd.inc
=20=20fri2.conf: include meta-intel-emgd.inc
=20=20sys940x.conf: include meta-intel-emgd.inc
=20=20emgd-driver-bin: add PROVIDES line for virtual opengl components
=20=20libva: use virtual providers of the gl components
=20=20meta-intel-emgd.inc: specify preferred providers for gl components

Richard Purdie (1):
=20=20Separate packagedir for GL components of EMGD BSPs

Ross Burton (9):
=20=20nuc: remove xserver-xf86-config
=20=20chiefriver: remove xserver-xf86-config
=20=20jasperforest: remove xserver-xf86-config
=20=20sugarbay: remove xserver-xf86-config
=20=20n450: remove xserver-xf86-config
=20=20crownbay: enable input device hotplug in xserver-xf86-config
=20=20emenlow:: enable input device hotplug in xserver-xf86-config
=20=20fri2: enable input device hotplug in xserver-xf86-config
=20=20sys940x: enable input device hotplug in xserver-xf86-config

Tom Zanussi (1):
=20=20meta-crownbay: move crownbay-noemgd to linux-yocto-3.10

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

Holger Behrens (1):
=20=20u-boot: follow upstream to 2013.07

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
Changelog for meta-qt5:

Tasslehoff Kjappfot (1):
=20=20qtquickcontrols: Add module for 5.1.0 and git versions

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-slugos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-systemd:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-raspberrypi:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

Martin Jansa (3):
=20=20systemd-machine-units: Fix rndissetup.sh, rndissetup.service =
installation

Simon Busch (7):
=20=20meta-android: abootimg: add native variant
=20=20meta-android: kernel_android.bbclass: use abootimg instead of =
mkbootimg
=20=20meta-android: android-tools: add make_ext4fs
=20=20meta-android: classes: add bbclass to generate a fastboot flashable =
image
=20=20meta-samsung: conf: machine: tuna: add board specific system =
partition size
=20=20meta-asus: conf: machine: grouper: add board specific system =
partition size
=20=20meta-acer: conf: machine: a500: add board specific system partition =
size

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

Denys Dmytriyenko (1):
=20=20ligles-omap3, omap3-sgx-modules: correct checksum assignment

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

Alexandr Smoktal (1):
=20=20webos-image.bbclass: Fix function for luna-service2 privileged =
binaries perm

Anatolii Sakhnik (2):
=20=20webos-image.bbclass: Print warnings for LS2 service permission =
problems
=20=20webos-image: libpbnjson=3D20,v2.1.0

Ed Chejlava (1):
=20=20webos-image: activitymanager=3D113 filecache=3D57 pmklogd=3D13 =
powerd=3D21 sleepd=3D17

Keith Derrick (1):
=20=20webos-image:pmlogdaemon=3D110,pmlogctl=3D17,nyx-lib=3D68

Martin Jansa (6):
=20=20webos.inc: Invent WEBOS_DISTRO_PRERELEASE
=20=20webos-image: nyx-modules=3D91-r10
=20=20libnih: Use BBCLASSEXTEND and fix sstate signature
=20=20update_build_changes.sh: Create target directories if needed
=20=20buildhistory.bbclass: Rename build-id to build-id.txt and add more =
info
=20=20webos.inc: Fix missing checks in WARN_QA

Mykola Kryvonos (1):
=20=20webos-image.bbclass: Add luna-service2-disable-security IMAGE_FEATURE

Roger Stringer (6):
=20=20webos-image: db8=3D82
=20=20webos-image: db8=3D83,v3.0.0
=20=20webos-image: luna-sysservice=3D11
=20=20webos-image: luna-sysservice=3D13
=20=20webos-image: db8=3D84
=20=20webos-image: smartkey-hun=3D9

wonkyo.seo (1):
=20=20libnsbmp: Add recipe for v0.1.0

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

Nathan Rossi (4):
=20=20machine/boards/common: Created MicroBlaze 3.10 defconfig
=20=20linux-dtb.inc: Fix-up PACKAGES variable for QA issues
=20=20linux-xlnx.inc: Remove use of "linux-yocto"
=20=20qemuzynq.dts: Fix issue preventing proper boot of qemuzynq

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Elizabeth Flanagan (1):
=20=20meta-yocto/layer.conf: Bump LAYERVERSION_yocto

Paul Eggleton (1):
=20=20conf/local.conf.sample: update for new testimage class

Ross Burton (2):
=20=20distro: remove anjuta-remote-run from distro_alias and maintainers
=20=20bblayers.conf.sample: use ##OEROOT## instead of ##COREBASE##

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



