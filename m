Return-Path: <cliff.brake@gmail.com>
Received: from mail-ie0-f181.google.com (mail-ie0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 11AAF70200;
	Mon, 28 Jul 2014 13:41:22 +0000 (UTC)
Received: by mail-ie0-f181.google.com with SMTP id rp18so6632792iec.40
	for <multiple recipients>; Mon, 28 Jul 2014 06:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:mime-version:message-id:from:to:subject:content-type
	:content-transfer-encoding;
	bh=K9Bl72mmA8PACm68oudpgpLPBOdk5bnY7GBjUr1qzGw=;
	b=jUYa0RfmesAjdplGSazGO0ZLcG1KlACxrmsqCboU/3D490jK9+P1XJnlwVsX/6rp/d
	zwUdnclOupH/duausJq+siNifox0hJYRU0SAdarQdc85Oq5rP1H4BnZEFMgnFk3piLOK
	mIkVDYSZ0Bmp45AGfbbudm39/Bkuaa77vaxW9WhgpCCITSuc8w9AXkeOn3/xiqUXlc9F
	s1lWzH1Dc33ez49L9RVkmVwQOs+9CESoh5kHTFcmr9cPbC1R7zP2TwLJ69Ak0BadXEVT
	Kk6JPETbCMYpTVBD+NttpDyNmzF7GGDGxS5OH83nmlqZoBc6nYett46iyuE2N1Rk0kpm
	cxPg==
X-Received: by 10.50.36.106 with SMTP id p10mr33059978igj.9.1406554884138;
	Mon, 28 Jul 2014 06:41:24 -0700 (PDT)
Received: from [127.0.0.1] (cable-pool6-cs-200.doycomm.com. [66.219.185.200])
	by mx.google.com with ESMTPSA id
	w1sm20372933igl.20.2014.07.28.06.41.22 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Jul 2014 06:41:23 -0700 (PDT)
Date: Mon, 28 Jul 2014 06:41:23 -0700 (PDT)
X-Google-Original-Date: Mon, 28 Jul 2014 13:41:21 GMT
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Message-Id: <1406554881852.0b531834@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
Subject: OE Changelog since 2014-07-20 until 2014-07-27
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
X-List-Received-Date: Mon, 28 Jul 2014 13:41:28 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2014-07-20 until 2014-07-27.  Projects included in this =
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

Alexandru DAMIAN (7):
=20=20toaster: add fields for sourcedir and builddir paths
=20=20toaster: improved Project models
=20=20toaster: move bldcontrol initial_data fixture to code
=20=20toaster: add project main edit page
=20=20toaster: properly set layers when running a build
=20=20toaster-requirements.txt: document requirements for the python =
environment
=20=20toasterui: fixing event.data clash

Dennis Meier (1):
=20=20fetch2: Add module for ClearCase (ccrc://)

Richard Purdie (4):
=20=20command/runqueue: Fix shutdown logic
=20=20cache: Don't reload the cache file since we already have this data in =
memory
=20=20cache: Optimise invalid cache file handling
=20=20codeparser cache improvements

Robert P. J. Day (7):
=20=20bitbake-user-manual-intro.xml: Minor edits to start of intro chapter
=20=20bitbake-user-manual-intro.xml: More edits to the intro chapter.
=20=20bitbake-user-manual-execution.xml: Minor edits to execution chapter.
=20=20bitbake-user-manual-metadata.xml: Adding some flag examples.
=20=20bitbake-user-manual-metadata.xml: Added second conditional metadata =
example.
=20=20bitbake-user-manual-metadata.xml: Removed fakeroot from list
=20=20"per-package" should say "per-recipe"

Robert Yang (3):
=20=20bitbake-user-manual-metadata.xml: Replaced "populate_staging"
=20=20bitbake: update help message for dump-signatures
=20=20bitbake: remove choices for dump-signatures

Scott Rifenbark (6):
=20=20bitmake-user-manual-fetching.xml: Added transportuser parameter for =
SVN
=20=20bitbake-user-manual-metadata.xml: Edits to some operators
=20=20bitbake-user-manual-metadata.xml: Fixed whitespace
=20=20bitbake-user-manual-metadata.xml: KERNEL_FEATURES example updated.
=20=20bitbake-user-manual-metadata.xml: fixed some example whitespace issues
=20=20Updated the the example 'bitbake -h' output to match the actual     =
output,=20

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Alejandro del Castillo (1):
=20=20util-linux: break out new package util-linux-hwclock

Ben Shelton (2):
=20=20busybox: mdev: Ensure /dev/initctl exists after tmpfs mount
=20=20initscripts: fix bashism in bootmisc.sh

Bill Pittman (1):
=20=20busybox: mdev: Use mdev.seq

Bruce Ashfield (8):
=20=20linux-yocto/3.14: vexpress and MVM firmware support
=20=20lttng-modules: update to 2.5.0
=20=20lttng-modules: re-enable ARM builds
=20=20linux-yocto: x86_64: expand kernel stack to 16K
=20=20linux-yocto-dev: bump to v3.16+
=20=20kernel: don't copy .so.dbg files into kernel source install
=20=20linux-yocto/3.14: libata and generic CPU modalias handling
=20=20kern-tools: adjust to full history meta-data

Chen Qi (2):
=20=20shadow: fix the behavior of su
=20=20systemd: change dependency relationships

Chong Lu (1):
=20=20adt-installer: fix sed input file error

Daniel BORNAZ (1):
=20=20python: fix _json module arbitrary process memory read vulnerability

Darren Hart (3):
=20=20mkefidisk.sh: Remove initrd entry for gummiboot
=20=20mkefidisk.sh: Fix redirection to 1
=20=20mkefidisk.sh: Add signal handling

Drew Moseley (3):
=20=20libomxil-0.9.3: Remove versioning for .so files.
=20=20Revert "libomxil-0.9.3: Remove versioning for .so files."
=20=20libomxil-0.9.3: Remove versioning for bellagio .so files.

Gratian Crisan (1):
=20=20busybox: mdev: Make /dev/shm world-writable

Hongxu Jia (3):
=20=20perl: fix rebuid failed while ${CC} changed
=20=20gcc-4.9.inc: fix parallel building failure
=20=20insane: add checking to standardize how .bbappend files do =
FILESEXTRAPATHS

Jackie Huang (4):
=20=20pulseaudio: add missing dependency on libcap
=20=20gst-plugins-good: add missing dependency on libcap
=20=20gstreamer1.0-plugins-good: add missing dependency on libcap
=20=20alsa-lib: remove non PN based -dev packages

Jukka Rissanen (1):
=20=20connman: Fix PPTP VPN plugin QA issue

Koen Kooi (1):
=20=20wget: fix build error with gnutls

Lucian Musat (3):
=20=20oeqa: Refactor test skipping decorators to use the unittest result =
object
=20=20oeqa/runtime: Added skipModule import for test modules that use it.
=20=20oeqa/rutime: Added testcase decorators for automated runtime tests. =
Also add

Maciej Borzecki (3):
=20=20wic: --fsoptions handling
=20=20wic: squashfs partition support
=20=20wic: do not overwrite autogenerated /etc/fstab with original too early

Martin Jansa (1):
=20=20kernel-module-split.bbclass: Allow autoloading multiple modules or =
modules w

Matthieu Crapet (1):
=20=20autotools.bbclass: Enhance sed regexp to avoid extra subshell

Mike Crowe (1):
=20=20allarch: Generate same package for MIPS and non-MIPS targets

Otavio Salvador (3):
=20=20alsa-tools: Disable use of GTK+ when not using X11
=20=20cogl-1.0: Add libcogl-path package
=20=20directfb-examples: Fix building with new autoconf

Richard Purdie (17):
=20=20shadow: Add PACKAGECONFIG for acl/attr
=20=20wget: Remove unneeded DEPENDS line
=20=20sanity: Check for setgid/setuid TMPDIR
=20=20toolchain-script: Really fix CANADIANEXTRAOE issues
=20=20insane: Add build depends check
=20=20populate_sdk_base: Extend TOOLCHAIN_TARGET_TASK to include multilib =
variants
=20=20cross-canadian: Copy target_ definitions from cross.bbclass
=20=20lib/oe/classextend: Avoid early expansion of PR values
=20=20gcc-multilib: Simply/fix MULTILIB_OPTIONS handling
=20=20qemu: Use PACKAGECONFIG for libusb to avoid floating dependency
=20=20binutils-cross-canadian: Explicitly DEPEND on nativesdk-flex, we =
require it=20
=20=20autotools: Improve configure dependency code for finding m4 files
=20=20lib/oeqa: Fix accidental revert of code
=20=20insane: Use a warning for FILEEXTRAPATHS issues for now
=20=20populate_sdk_base: Include do_rootfs depends for do_populate_sdk
=20=20apt-native: Add missing DEPENDS on db-native and curl-native
=20=20populate_sdk_deb: Fix non x86_64 SDK builds

Richard Tollerton (6):
=20=20sysvinit: bootlogd: Honor VERBOSE
=20=20sysvinit: bootlogd: Don't run savelog if it's not installed
=20=20sysvinit: bootlogd: ensure /var/log/boot is created in volatiles
=20=20squashfs-tools: Add nativesdk in BBCLASSEXTEND
=20=20base-files: Don't export TZ if /etc/TZ exists
=20=20util-linux: break out new package util-linux-findfs

Ross Burton (19):
=20=20fontsproto: upgrade to 2.1.3
=20=20libxfont: upgrade to 1.5.0
=20=20inputproto: upgrade to 2.3.1
=20=20at-spi2-atk: upgrade to 2.12.1
=20=20gnome-common: upgrade to 3.12.0
=20=20libice: upgrade to 1.0.9
=20=20gdk-pixbuf: upgrade to 2.30.8
=20=20xf86-video-vmware: update to 13.0.2
=20=20xcb-util-wm: upgrade to 0.4.1
=20=20libxft: upgrade to 2.3.2
=20=20pango: upgrade to 1.36.5
=20=20libice: fix non-deterministic libbsd dependency
=20=20libxi: upgrade to 1.7.4
=20=20libevdev: add new recipe (needed by xf86-input-evdev)
=20=20xf86-video-evdev: upgrade to 2.9.0
=20=20shared-mime-info: upgrade to 1.3
=20=20ptest-gnome: add ptest helper for GNOME packages
=20=20glib-2.0: use ptest-gnome
=20=20debian.bbclass: inherit package

Roxana Ciobanu (2):
=20=20image.bbclass/rootfs.py: add variables to rootfs[vardeps]
=20=20bitbake.conf: move BB_NUMBER_THREADS and PARALLEL_MAKE to bitbake.conf

Saul Wold (2):
=20=20cups: Upgrade to 1.7.4
=20=20curl: Upgrade to 7.37.1

Stefan Agner (1):
=20=20shadow-securetty: add freescale lpuart

Ting Liu (2):
=20=20perf: remove CFLAGS override
=20=20serf: specify LIBDIR to avoid install issue

Tom Zanussi (3):
=20=20wic: Fix bad directory name in bootimg-efi
=20=20wic: Add help entry for wic kickstart
=20=20wic: Remove fstype from mkefidisk canned wks

Tudor Florea (1):
=20=20buildtools-tarball: Add wget to buildtools-tarball

Wang Zidan (6):
=20=20gst-plugins-good: fix integer overrun for mulawdec
=20=20gstreamer: fix a bug for gstbaseparse
=20=20gstreamer1.0-libav: avoid using non-growable pool for videodec
=20=20gstreamer1.0: pass rate of input segment to output segment in =
gstbaseparse.
=20=20gstreamer1.0-plugins-base: do not change eos event to gap event if no =
data h
=20=20gstreamer1.0-plugins-base: get caps from src pad when query caps in =
gsttagde

Xufeng Zhang (1):
=20=20nspr: Fix for CVE-2014-1545

Yong Zhang (1):
=20=20net-tools: ifconfig interface:0 del <IP> will remove the aliased IP =
on IA64

Yue Tao (1):
=20=20gst-ffmpeg: Add CVE patches

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Anders Darander (1):
=20=20webmin: drop allarch

Andrea Adami (1):
=20=20klibc: upgrade to released 2.0.4

Chunrong Guo (1):
=20=20libhugetlbfs: arm 32bit support

Darren Hart (2):
=20=20i2c-tools: Remove i2c-tools, it's now in oe-core
=20=20mercurial: Update mercurial to 3.0.1

Jackie Huang (4):
=20=20postfix: add new recipe
=20=20memstat: add new recipe
=20=20syslog-ng: move back from nonworking
=20=20syslog-ng: uprev to 3.5.4.1

Jacob Kroon (5):
=20=20ccid: Fix floating runtime dependency on flex
=20=20gnokii: Fix floating runtime dependencies
=20=20liboauth: Add missing OpenSSL build dependency
=20=20gammu: Add missing glib-2.0 and udev build dependencies
=20=20glade3: Add PACKAGECONFIG for Gnome support

Jukka Rissanen (1):
=20=20usb-modeswitch: Do not try to use autotools

Koen Kooi (2):
=20=20libhugetlbfs: fix versioning
=20=20libhugetlbfs: fix packaging

Lukas Bulwahn (1):
=20=20libeigen: remove obsolete setting for default out-of-tree build

Martin Jansa (35):
=20=20claws-mail: Fix build with B!=3DS
=20=20efl, elementary: upgrade to 1.10.1
=20=20claws-mail: Add missing libgcrypt dependency
=20=20libsdl-ttf: fix build without freetype-config
=20=20xfconf: inherit gtk-doc
=20=20mcnavi: add missing dependency on intltool-native
=20=20navit, usbpath: add missing pkgconfig inherit
=20=20xfconf: add dependency on xfce4-dev-tools-native
=20=20libnice: create ${S}/m4 directory before gtkdocize is called
=20=20pidgin: add missing dependency on intltool-native
=20=20foxtrotgps: add dependency on intltool-native
=20=20efl, elementary: upgrade to 1.10.2
=20=20libxfce4ui: fix order of inherits
=20=20exo: add missing inherit gtk-doc
=20=20dfu-util-0.4: add foreign to AM_INIT_AUTOMAKE
=20=20gdal: use autotools-brokensep
=20=20gmtk: add missing dependency on intltool-native
=20=20webkit-efl: Fix type-limits warning
=20=20xwd: add missing dependency on libxkbfile
=20=20rtorrent: add ncurses dependency
=20=20ser2net: change file used in LIC_FILES_CHKSUM
=20=20libebml: upgrade to 1.3.0 required by mkvtoolnix
=20=20libmatroska: upgrade to 1.4.0
=20=20mkvtoolnix: inherit autotools-brokensep
=20=20pidgin: upgrade to 2.10.9 and fold pidgin.inc into it
=20=20llvm: set INSANE_SKIP only for one explicit package
=20=20zeroc-ice: blacklist, because it's not compatible with default db-6* =
version
=20=20lksctp-tools: blacklist because it fails to link against =
sctp_connectx symbo
=20=20python-efl: add git version
=20=20libmatroska: upgrade to 1.4.1 required by mkvtoolnix-7.0.0
=20=20mkvtoolnix: upgrade to 7.0.0
=20=20xwd: move require line first
=20=20snort: add missing pkgconfig inherit
=20=20snort: add openssl PACKAGECONFIG
=20=20snort: move files from 'files' to 'snort' for faster lookup

Matthieu CRAPET (1):
=20=20xmlstarlet: fix S!=3DB failure

Philip Balister (1):
=20=20postgresql : Fix build using pkg-config for libxml-2.0.

Richard Purdie (39):
=20=20mozjs: Add missing zlib dependency
=20=20smbnetfs: Add missing pkgconfig inherit
=20=20gupnp-av: Upgrade to 0.12.6, drop previous versions
=20=20gupnp: Upgrade to 0.20.12, drop previous versions
=20=20gssdp: Upgrade to 0.14.8, drop previous versions
=20=20owfs: Disable separate build since its broken
=20=20hexedit: Disable separate build since its broken
=20=20fltk: Disable separate build since its broken
=20=20libsdl-ttf: Update configure.patch
=20=20fluidsync: Fix build
=20=20libgc: Drop, its bdwgc in OE-Core
=20=20re2c: Fix for modern automake
=20=20onig: Use "foreign" automake strictness
=20=20libol: Use "foreign" automake strictness
=20=20usbpath: Use "foreign" automake strictness
=20=20pidgin-otr: Add missing intltool-native DEPENDS
=20=20dejagnu: Use "foreign" automake strictness
=20=20hplip: Use "foreign" automake strictness and autotools-brokensep
=20=20claws-plugin-gtkhtml2: Use "foreign" automake strictness and =
autotools-broke
=20=20claws-plugin-rssyl: Use "foreign" automake strictness and =
autotools-brokense
=20=20fbgrab: use autotools-brokensep (its not really autotools)
=20=20orrery: use autotools-brokensep
=20=20libsdl-image: Use "foreign" automake strictness
=20=20lcdproc: Remove floating dependency on libhid
=20=20libxfce4ui: Add missing gtk-doc inherit
=20=20ipsec-tools: Use "foreign" automake strictness
=20=20memcached: Use "foreign" automake strictness
=20=20smbfsnet: Use "foreign" automake strictness
=20=20engrave: Use autotools-brokensep to avoid build failures
=20=20efl: Use automake foreign for =
cpu/elmdentica/enjoy/ephoto/exalt-client/flame
=20=20subsurface: Fix libxml and libm build failures
=20=20rp-pppoe: Use "foreign" automake strictness
=20=20mtr: Use "foreign" automake strictness
=20=20gegl: Use pkg-config for SDL
=20=20ode: Use "foreign" automake strictness
=20=20flite: Use autotools-brokensep
=20=20wvstreams: Add missing dbus/readline DEPENDS and use =
autotools-brokensep
=20=20libotr: Fix B!=3DS build failures
=20=20syslog-ng: Various fixes

Richard Tollerton (1):
=20=20openvpn: update and enable iproute2 support

Ross Burton (1):
=20=20daemonize: fix out of tree builds and configure

Roy Li (10):
=20=20tnftp: add tnftp recipes file
=20=20Uprev tcpdump to 4.5.1
=20=20libee: add recipe
=20=20liblognorm: add recipe
=20=20numctl: add recipe
=20=20libtext-iconv-perl: add recipe
=20=20libnet-libidn-perl: add recipe
=20=20libxml-libxml-perl: add recipe
=20=20sdparm: add recipe file
=20=20webmin: make reconfigure webmin be able to work

Tim Orling (8):
=20=20libpostproc: fix S!=3DB failure
=20=20meta-python: create layer
=20=20meta-python: move recipes from meta-oe
=20=20vlc.inc: cleanup configure, inherit pkgconfig
=20=20vlc: use AM_PATH_LIBGCRYPT instead of libgcrypt-config
=20=20vlc: modules/gui/qt4/Modules.am not B!=3DS friendly
=20=20imagemagick: add some PACKAGECONFIG, fix unrecognized --without-jp2 =
option
=20=20vlc: add PACKAGECONFIG for postproc, patch for postproc header check

Ting Liu (3):
=20=20libhugetlbfs: use ARCH ppc/ppc64 for powerpc/powerpc64
=20=20libhugetlbfs: not build obj32 for powerpc64
=20=20luajit: remove fsl ppc specfic patch

Wenzong Fan (1):
=20=20vsftpd: fix install warning

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Koen Kooi (6):
=20=20angstrom-next: use gummiboot as default EFI provider
=20=20angstrom-next: set feed URI to 'next' instead of 'core'
=20=20angstrom-next: move ARM to gcc 4.9
=20=20systemd: add v215+git
=20=20various: drop all PRINCs
=20=20contrib: angstrom feed sorter: update archs and machines to update    =
 curre

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Denys Dmytriyenko (1):
=20=20arago-prefs: update preference for new 2014.07 u-boot version

Franklin S. Cooper Jr (1):
=20=20arago-source-ipk: Update u-boot sources folder created by sourceipk

Yaniv Machani (5):
=20=20wpa-supplicant-wl18xx: Update recipe to ol_r8.a9.14 version.
=20=20hostap-daemon-wl18xx: Update recipe to ol_r8.a9.14 version
=20=20wl18xx : update to ol_r8.a9.14
=20=20Wl18xx : recipes update - tag changed to ol_r8.a9.14
=20=20wl18xx-target-scripts : Add new WiFi related scripts

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

Jacob Kroon (3):
=20=20gpu-viv-bin-mx6q: Don't package wayland libraries in non-wayland =
builds
=20=20gpu-viv-bin-mx6q: Fix file ownership in packages
=20=20gpu-viv-bin-mx6q: Use symlink in libgl-mx6 package

Lauren Post (1):
=20=20pointercal.xinput: Remove stray character

Otavio Salvador (3):
=20=20linux-imx (2.6.35.3): Update to the b3912bb revision
=20=20u-boot-fslc: Update to 2014.07-based release
=20=20weston: Don't apply i.MX6-specific patches unconditionally

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

Christoph Settgast (1):
=20=20u-boot-script-boundary: Fix build for imx6qsabrelite

Eric Nelson (2):
=20=20nitrogen6x: set KERNEL_IMAGETYPE to uImage
=20=20nitrogen6x-lite: set KERNEL_IMAGETYPE to uImage

Jacob Kroon (1):
=20=20u-boot-imx: Fix FILESEXTRAPATHS_prepend

John Weber (4):
=20=20broadcom-nvram-config: separate recipes to different chipsets
=20=20linux-wandboard (3.10.17): Update SRCREV to 13697f2 and update =
defconfig
=20=20linux-firmware: add bbappend to modify firmware file names
=20=20linux-wandboard (3.0.35): remove recipe and associated files

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-ppc:

Chunrong Guo (1):
=20=20u-boot-qoriq: rename to match verion 2014.01

Hongxu Jia (2):
=20=20cryptodev-fsl: add missing colon for FILESEXTRAPATHS
=20=20openssl_1.0.1g.bbappend: add missing colon for FILESEXTRAPATHS

Ting Liu (10):
=20=20enable multilib for e5500-64b/e6500/e6500-64b
=20=20remove obsolete patches
=20=20luajit: add bbappend to hold ppc specific patch
=20=20init-ifupdown: use customized interfaces for qoriq-ppc
=20=20merge-files: add recipe
=20=20procps: disabling reverse-path filtering
=20=20skmm-ep: add two missing header files
=20=20set BB_DANGLINGAPPENDS_WARNONLY as true
=20=20README: add dependency on meta-openembedded
=20=20libedit/tclap: remove

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-guacamayo:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix-community:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-handheld:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-igep:

Enrico Butera (1):
=20=20README: update email

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Corneliu Stoicescu (1):
=20=20nuc: add 'efi' to MACHINE_FEATURES

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

Holger Behrens (3):
=20=20shadow-securetty: rename bbappend file to match current version
=20=20meta-ivi-demo: Create layer
=20=20ivi-image-demo: Introduce ivi-image-demo recipe

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

Paul Eggleton (4):
=20=20qte: add dependency on alsa-lib
=20=20obexftp: remove
=20=20libdbus-qt2: add inherit pkgconfig
=20=20Remove references to QPL in LICENSE

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-qt3:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-qt5:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-slugos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-systemd:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-raspberrypi:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

Martin Jansa (16):
=20=20recipes: add missing pkgconfig inherit
=20=20vagalume: add missing dependency on intltool-native
=20=20phonefsod: add pkgconfig inherit
=20=20vagalume: add pkgconfig inherit
=20=20meta-fso: add dependency on meta-python
=20=20shr-theme: bump SRCREV to fix build with automake without implicit =
foreign
=20=20numptyphysics: add foreign to AM_INIT_AUTOMAKE
=20=20aurora-deamon: add missing pkgconfig inherit
=20=20e-wm-config-illume2-shr: bump SRCREV to fix build with automake =
without impl
=20=20mokomaze: add intltool-native dependency
=20=20fso-gpsd: add missing pkgconfig inherit
=20=20valacompass: add missing pkgconfig inherit
=20=20sensmon: add missing pkgconfig inherit
=20=20vagalume: add PACKAGECONFIG for libproxy
=20=20BSPs: replace module_autoload with KERNEL_MODULE_AUTOLOAD where =
possible

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

Denys Dmytriyenko (1):
=20=20u-boot: update to 2014.07 release version

Franklin S. Cooper Jr (1):
=20=20am57xx-evm.conf: Use correct TTY port

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

Nathan Rossi (1):
=20=20common/linux/zynq/defconfig_3.14.cfg: Add configs for USB

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Richard Purdie (1):
=20=20poky.conf: Catch up with qemu-config rename -> =
packagegroup-core-device-deve

Roxana Ciobanu (1):
=20=20bitbake.conf: move BB_NUMBER_THREADS and PARALLEL_MAKE to bitbake.conf

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



