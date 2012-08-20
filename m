Received: from new.bec-systems.com ([74.208.70.121] helo=bec-systems.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1T3QRg-00023X-FJ; Mon, 20 Aug 2012 13:47:00 +0200
Received: from oh-69-34-21-229.sta.embarqhsd.net ([69.34.21.229]
	helo=happy.bec-systems.com)
	by bec-systems.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cliff.brake@gmail.com>)
	id 1T3Q9z-00026B-Qt; Mon, 20 Aug 2012 07:28:46 -0400
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Date: Mon, 20 Aug 2012 11:34:48 GMT
Message-Id: <1345462488788.b2e12041@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
X-Spam_score: -2.9
X-Spam_score_int: -28
X-Spam_bar: --
Subject: OE Changelog since 2012-08-12 until 2012-08-19
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
X-List-Received-Date: Mon, 20 Aug 2012 11:47:00 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2012-08-12 until 2012-08-19.  Projects included in this =
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

Andrei Gherzan (1):
=20=20bitbake: build.py: Add stampdir argument to cached_mtime_noerror

Richard Purdie (9):
=20=20knotty: Chain the WINCH signal handler in progressbar so any other =
handler i
=20=20bb/ui/uihelper.py: Ensure task current and total numbers are updated =
for set
=20=20build.py: Only execute mkdirhier if stampdir doesn't exist
=20=20knotty2: Handle long lines of text and terminal window size changes
=20=20knotty: Fold knotty2 into knotty and make it the default
=20=20bin/bitbake: Remove knotty2 from the list of valid interfaces
=20=20really remove knotty2
=20=20fetch2/git: Work around git confusion between foo.git and foo =
repositories
=20=20build.py: Correct package to recipe in TaskBase events to use =
consistent ter

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Amy Fong (1):
=20=20openssh: openssh's init fails to restart if sshd is not running

Andreas M=C3=BCller (2):
=20=20webkit-gtk: update to 1.8.2
=20=20wpa-supplicant: fix paths in dbus/systemd *.service files

Andrei Gherzan (7):
=20=20utils.py: Modify and rename distro_features_backfill python function
=20=20bitbake.conf: Use the new form of features_backfill function
=20=20bitbake.conf: Add MACHINE_FEATURES_BACKFILL and append to =
MACHINE_FEATURES
=20=20bitbake.conf: Add rtc to MACHINE_FEATURES_BACKFILL
=20=20task-core-boot: Add busybox-hwclock if MACHINE_FEATURES contains rtc
=20=20busybox: Package hwclock.sh initscript separately
=20=20subversion: Inherit gettext as msgfmt is needed at compile time

Andy Ross (1):
=20=20dbus: Fix pid file in dbus init script

Bj=C3=B6rn Stenberg (1):
=20=20pigz: Update to upstream version 2.2.5

Bruce Ashfield (9):
=20=20kernel.bbclass: remove default module_autoload and module_conf values
=20=20linux-yocto: bump version to 3.4.7
=20=20linux-yocto/3.4: BSP, uprobes, config and cleanups
=20=20linux-yocto: make KBRANCH the exception and not the rule
=20=20linux-yocto/3.4: remove explicit KBRANCH designations
=20=20linux-yocto: explicitly export KMETA to scripts
=20=20kern-tools: fixes (branching,buildall) + cleanups (checkpoint,cleaner)
=20=20linux-yocto-tiny: set default branch
=20=20linux-yocto/3.0: update meta SRCREV

Christopher Larson (1):
=20=20base.bbclass: allow specifying an lsb distro hook via the metadata

Constantin Musca (15):
=20=20libdrm: package update 2.4.35 -> 2.4.37
=20=20pixman: upgrade to 0.27.2
=20=20dri2proto: upgrade to 2.8
=20=20glproto: upgrade to 1.4.16
=20=20pciutils: upgrade to 3.1.10
=20=20dbus: upgrade to 1.6.4
=20=20ofono: upgrade to 1.10
=20=20iproute2: upgrade to 3.5.0
=20=20iptables: upgrade to 1.4.15
=20=20pulseaudio: upgrade to 2.1
=20=20gst-fluendo-mp3: upgrade to 0.10.19
=20=20gst-fluendo-mpegdemux: upgrade to 0.10.71
=20=20connman: upgrade to 1.4
=20=20libxrandr: upgrade to 1.4.0
=20=20randrproto: upgrade to 1.4.0

Damien Lespiau (2):
=20=20mesa: Add a mesa-dri-glsl-native_git recipe
=20=20core: Prefer mesa-dri as virtual/libopengles1/2 provider

Florin Sarbu (1):
=20=20Add MPL version 2.0 license in common-licenses dir as well as adding =
a non-S

Jackie Huang (4):
=20=20tcl: uncomment a line that causing TCL_SRC_DIR point to the workdir.
=20=20gdk-pixbuf: fix the postinstall script failure when no icon is =
installed
=20=20python: Add Upstream-Status entries for bsddb patches, no code changes
=20=20apr-util: fix the rules.mk with path to sysroot instead of the =
workdir of ap

Kenneth Solbjerg (1):
=20=20run-postinsts: Does not run any scripts on debian rootfs

Khem Raj (4):
=20=20chrpath.bbclass: Account for case when ORIGIN is in RPATH
=20=20kernel.bbclass: Preserve generated headers
=20=20unifdef-native: Correct LICENSE
=20=20libpam: Update recipes from 1.1.5 -> 1.1.6

Koen Kooi (2):
=20=20man: fix RDEPENDS and reformat recipe
=20=20man: make man actually work by installing custom man.config

Laurentiu Palcu (3):
=20=20populate_sdk_base.bbclass: fix SDK relocation issues
=20=20package.bbclass: change RPATHs for cross-canadian binaries
=20=20adt-installer: add support for relocatable SDK

Marc Reilly (1):
=20=20avahi: fix packaging of avahi-autoipd

Mark Hatle (3):
=20=20package_rpm.bbclass: Fix attemptonly install failures
=20=20prelink: Update to latest upstream prelink
=20=20pseudo: Fix pseudo-native rebuild when triggered by dep change

Martin Jansa (2):
=20=20bitbake.conf: store cooker logs in subdirectory of LOG_DIR
=20=20layer.conf: add udev-extraconf to SIGGEN_EXCLUDERECIPES_ABISAFE

Matthew McClintock (3):
=20=20distutils.bbclass: fix libdir for 64-bit python modules built with =
distutils
=20=20perf_3.4.bb: update to build against older kernels
=20=20cross-localedef-native_2.16.bb: fix for CentOS 5.X

Mihai Lindner (1):
=20=20sysklogd: removed tabs from syslog.conf

Paul Eggleton (5):
=20=20rpmresolve: add wrapper script to fix paths
=20=20createrepo: add wrapper script to fix paths
=20=20rpmresolve: improve debug output
=20=20classes/chrpath: trigger an error if chrpath fails
=20=20classes/chrpath: improve chrpath failure handling

Peter Seebach (2):
=20=20base.bbclass: Expand PNBLACKLIST across multilibs too
=20=20base.bbclass: Work even when there's no PNBLACKLIST entries

Radek Dostal (1):
=20=20gst-plugins-base: remove avahi from DEPENDS

Radu Moisan (1):
=20=20pango: upgrade to upstream stable 1.30.0

Richard Purdie (3):
=20=20rpmresolve: Ensure we call the rpm relocation code at init
=20=20chrpath.bbclass: Ensure we only process tmpdir in paths which =
actually conta
=20=20utility-tasks: Set T to alternate location during do_clean

Robert Yang (4):
=20=20qemu.inc: disable curl for qemu-nativesdk
=20=20sstate-cache-management.sh: update it for the new layout
=20=20apt-native 0.7.14: remove an extra line from apt.conf
=20=20rootfs_deb: move the lock from WORKDIR  to DEPLOY_DIR_DEB

Ross Burton (11):
=20=20classes: add gsettings.bbclass
=20=20pimlico: Remove
=20=20gtk+: remove 2.12.7
=20=20gtk+ remove 2.16.6
=20=20clutter: DOLT isn't used anymore
=20=20owl-video: patches pushed upstream, so bump srcrev
=20=20libowl-av: patches merged upstream, bump srcrev
=20=20mesa: enable GLES v1 and v2
=20=20mesa-demos: fix GLES2 build
=20=20mesa: respect x11 DISTRO_FEATURE
=20=20mesa: enable EGL, with DRM and X11 platforms

Roy.Li (2):
=20=20qemu: backport patch to fix pl031 RTC
=20=20subversion: two small fixes

Saul Wold (37):
=20=20watchdog: fix SRC_URI _ -> -
=20=20rxvt-unicode: remove setting of LD_LIBRARY_PATH
=20=20rxvt-unicode: cleanup update-alternatives deprecated code
=20=20openssh: cleanup update-alternatives deprecated code
=20=20mini-x-session: cleanup update-alternatives deprecated code
=20=20console-tools: cleanup update-alternatives deprecated code
=20=20kbd: cleanup update-alternatives deprecated code
=20=20tinylogin: cleanup update-alternatives deprecated code
=20=20patch: cleanup update-alternatives deprecated code
=20=20ubootchart: cleanup update-alternatives deprecated code
=20=20bc: cleanup update-alternatives deprecated code
=20=20diffutils: refactor to add a common diffutils.inc
=20=20diffutils: cleanup update-alternatives deprecated code
=20=20findutils: refactor common code to findutils.inc
=20=20findutils: cleanup update-alternatives deprecated code
=20=20powertop: cleanup update-alternatives deprecated code
=20=20mutter: cleanup update-alternatives deprecated code
=20=20matchbox-wm-2: cleanup update-alternatives deprecated code
=20=20matchbox-session: cleanup update-alternatives deprecated code
=20=20metacity: cleanup update-alternatives deprecated code
=20=20pigz: cleanup update-alternatives deprecated code
=20=20msmtp: cleanup update-alternatives deprecated code
=20=20mktemp: cleanup update-alternatives deprecated code
=20=20which: cleanup update-alternatives deprecated code
=20=20less: cleanup update-alternatives deprecated code
=20=20shadow: cleanup update-alternatives deprecated code
=20=20mingetty: cleanup update-alternatives deprecated code
=20=20hdparm: cleanup update-alternatives deprecated code
=20=20gzip: cleanup update-alternatives deprecated code
=20=20procps: cleanup update-alternatives deprecated code
=20=20time: cleanup update-alternatives deprecated code
=20=20wget: cleanup update-alternatives deprecated code
=20=20sed: cleanup update-alternatives deprecated code
=20=20gawk: cleanup update-alternatives deprecated code
=20=20net-tools: cleanup update-alternatives deprecated code
=20=20libsamplerate: depends on libsdnfile
=20=20ncurses: fix file names for update -alternatives

Scott Garman (2):
=20=20runqemu: support booting ramfs-based images
=20=20runqemu: work with yocto-bsp created kernel filenames

Wenzong Fan (2):
=20=20at 3.1.13: get 'at' depends on 'flex-native' explicitly
=20=20sysfsutils: install libs to base_libdir

Xin Ouyang (2):
=20=20gettext-0.18: explicitly disable acl.
=20=20libatomics-ops: update to the latest version 7.2

Yao Zhao (2):
=20=20gstreamer: gst-ffmpeg: fix build issues for libav
=20=20base.bbclass: fix PACKAGECONFIG handling code

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Andrea Adami (3):
=20=20klibc: fix runtime dependencies for shared utils
=20=20initramfs-kexecboot-image: fix dependency chain was: ['ubiattach']
=20=20klibc: upgrade from 2.0 to 2.0.1

Martin Jansa (1):
=20=20midori: add missing libnotify dependency

Matthew McClintock (1):
=20=20strongswan_5.0.0.bb: update recipe packaging to fix QA warnings and =
package=20

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

Nitin A Kamble (1):
=20=20sys940x: fix libva dependency issues

Trevor Woerner (1):
=20=20layer.conf: Clarify BBFILES comments regarding recipe-* directories

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-handheld:

Andrea Adami (1):
=20=20zaurus: fix jffs2 and ubifs images for collie

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-opie:

Paul Eggleton (9):
=20=20snes9x: remove X11-based recipe
=20=20snes9x-sdl-qpe: use FILESEXTRAPATHS instead of FILESPATHPKG
=20=20kaffe: add missing patch from OE-Classic
=20=20libsdl-qpe: add missing patches from OE-Classic
=20=20gnuplot: remove
=20=20opie-taskbar-images: allow re-exec of do_install
=20=20libetpan: remove
=20=20opie-sysinfo: split out machine-specific images
=20=20task-opie-16mb: use 240x320 not 320x240 images

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-bug:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-efikamx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix:

Andreas M=C3=BCller (6):
=20=20linux-omap: Fix USB EHCI (was broken at transition to 3.5)
=20=20linux-firmware: new append so that a later version of firmware =
(sd8686-9.70.
=20=20omap3-sgx-modules: Fix crashes for overo storm COMs
=20=20linux-omap: cleanup
=20=20linux-omap: fix race during install
=20=20OMAPFB: fix framebuffer console colors for resolutions > 16bpp

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ettus:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-ppc:

Matthew McClintock (1):
=20=20boot-format_git.bb: update to latest version

Vladimir Zapolskiy (1):
=20=20u-boot: correct path to config files

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-igep:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-netbookpro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-chicken:

Mario Domenech Goulart (1):
=20=20free-gettext recipe update to version 1.5.1

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-java:

Henning Heinold (3):
=20=20llvm2.8: fix typo in variable append
=20=20llvm: remove perl-native dep, we use inherit perlnative now and =
inherit pyth
=20=20openjdk6: update to icedtea version 1.11.3

Khem Raj (3):
=20=20llvm: Accept ppc64
=20=20openjdk-6: Fix cross compilation for e5500 machines
=20=20icedtea-native: Fix build on ubuntu 12.04 release

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-qt3:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-telephony:

Harald Welte (1):
=20=20libosmocore: update to more recent version including a BSSGP fix

Holger Hans Peter Freyther (2):
=20=20libosmocore: Introduce 0.5.3 and bump the META_TELEPHONY_OSMO_INC
=20=20libosmocore: Build a 0.5.3+ version and force rebuild

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

Andrei Gherzan (1):
=20=20linux.inc: Activate CONFIG_LEGACY_PTYS needed for bootlogd

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-kde:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Bruce Ashfield (1):
=20=20linux-yocto/meta-yocto/3.4: BSP, uprobes, config and cleanups

Damien Lespiau (1):
=20=20core: Prefer mesa-dri as virtual/libopengles1/2 provider

Paul Eggleton (1):
=20=20poky.conf: update distro ID string for Ubuntu 12.04.1 LTS

Ross Burton (1):
=20=20distro: Remove Pimlico from distro-tracking




