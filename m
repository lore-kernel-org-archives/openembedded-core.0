Received: from new.bec-systems.com ([74.208.70.121] helo=bec-systems.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1TiTEB-00009I-F9; Tue, 11 Dec 2012 18:02:45 +0100
Received: from oh-69-34-21-229.sta.embarqhsd.net ([69.34.21.229]
	helo=happy.bec-systems.com)
	by bec-systems.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cliff.brake@gmail.com>)
	id 1TiSqX-0001dT-BL; Tue, 11 Dec 2012 11:38:20 -0500
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Date: Tue, 11 Dec 2012 16:48:00 GMT
Message-Id: <1355244480760.a7b0a2b3@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
X-Spam_score: -2.9
X-Spam_score_int: -28
X-Spam_bar: --
Subject: OE Changelog since 2012-12-02 until 2012-12-09
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
X-List-Received-Date: Tue, 11 Dec 2012 17:02:45 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2012-12-02 until 2012-12-09.  Projects included in this =
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

Cristiana Voicu (1):
=20=20hob: modified how the existence of a variable is checked

Richard Purdie (6):
=20=20build.py: Preserve sigdata files in the stamps directory
=20=20data_smart: Improve get_hash to account for overrides and key =
expansion
=20=20uievent: Fix an init race
=20=20xmlrpc: Unbreak the transport by adding a missing logfile name
=20=20BBHandler: Ensure parser state engine is correctly reset for new =
parsing
=20=20Revert "BBHandler: Ensure parser state engine is correctly reset for =
new par

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Amy Fong (1):
=20=20rsync doesn't create hardlinks for certain files

Andreas M=C3=BCller (1):
=20=20gtk+: do not prelight GtkButton in touchscreen mode

Andrei Dinu (1):
=20=20Added regex functionality to distrodata.bbclass

Bruce Ashfield (5):
=20=20linux-yocto/3.4: move PREEMPT_NONE to beagleboard standard kernel only
=20=20kernel-yocto: checkout known branch before leaving =
do_validate_branches
=20=20linux-yocto/3.4: merge v3.4.19, v3.4.20
=20=20linux-yocto/3.4: emenlow: switch from psb to emgd graphics
=20=20linux-yocto/3.4: inform the fetcher if the meta branch changes

Chen Qi (7):
=20=20ghostscript: make ghostscript work with long building path
=20=20qt4-native: make qt4-native work with long building path
=20=20libksba: add pkgconfig support
=20=20ICU: add pkgconfig support
=20=20pth: add pkgconfig support
=20=20libassuan: add pkgconfig support
=20=20qt4-native & ghostscript: update upstream status for their patches

Constantin Musca (10):
=20=20ethtool: upgrade to 3.6
=20=20libxcb: upgrade to 1.9
=20=20libxslt: upgrade to 1.1.28
=20=20lighttpd: upgrade to 1.4.32
=20=20puzzles: upgrade to r9712
=20=20libconvert-asn1-perl: upgrade to 0.26
=20=20nasm: upgrade to 2.10.05
=20=20prs: use the PRServer to replace the BB_URI_LOCALCOUNT functionality
=20=20liburcu: upgrade to 0.7.4
=20=20babeltrace: upgrade to 1.0.0

Elizabeth Flanagan (1):
=20=20license.bbclass: Including locale packages

Enrico Scholz (1):
=20=20sstate.bbclass: fixed file-conflict check

Eric B=C3=A9nard (1):
=20=20subversion: update to 1.7.7

Gary Thomas (1):
=20=20gstreamer: Fix plugin builds

Holger Freyther (1):
=20=20classes/binconfig.bbclass: Allow packages to add sed expressions

Hongxu Jia (2):
=20=20slang: explicity disable invoking onig module
=20=20populate_sdk_base:tarball installer:add sudo prompt

Jack Mitchell (1):
=20=20latencytop: add missing signed-off-by and re-add upstream status

Jackie Huang (2):
=20=20eglibc: Move compile with optimization handling to common code
=20=20rt-tests: added missing dependencies in Makefile

Jason Wessel (1):
=20=20populate_sdk_base.bbclass: make failure to find ld-linux.so a hard =
error

Kang Kai (1):
=20=20chkconfig: add link files install_initd and remove_initd

Khem Raj (5):
=20=20binutils-2.23.1: Add recipes
=20=20oprofile: Include config.h before bfd.h
=20=20tcmode-default.inc: Use binutils 2.23.1
=20=20binutils_2.23.1.bb: Correct typo in enable-targets configure option
=20=20util-linux: Package systemd files correctly

Laurentiu Palcu (9):
=20=20populate_sdk_base: tarball installer: SDK overwrite warning
=20=20populate_sdk_base: mkdir was missing $SUDO_EXEC prefix
=20=20populate_sdk_base: fix directory creation as normal user
=20=20image.bbclass: run postinst scripts once, at rootfs time
=20=20rootfs generation: export two new variables to postinst scriptlets
=20=20gtk-icon-cache: run the icon generation at rootfs time
=20=20gdk-pixbuf: generate the pixbuf loader's cache ar rootfs time
=20=20gconf.bbclass: run postinstalls at rootfs time
=20=20populate_sdk_base, adt_installer_internal: fix issue on older =
distributions

Mario Domenech Goulart (1):
=20=20pulseaudio: explicitly set --with-database=3Dsimple

Mark Hatle (12):
=20=20cpio: Split RMT from cpio
=20=20tar: Split RMT from tar
=20=20package_rpm.bbclass: Add the runtime dependencies to the pre/post =
scriptlets
=20=20rpm: Move rpmdb_loadcvt from base to dev package
=20=20rpm: Fix rpm relocation macro usage
=20=20rpm: Fixup platform matching code
=20=20rpm: Fix Upstream-Status fields
=20=20python-smartpm: Fix incorrect comparison arguments
=20=20package_deb: Dependencies with a ( or ) in them are invalid in debs
=20=20pkgconfig: Add a manual dependency of pkgconfig(pkg-config)
=20=20license.bbclass: Avoid grep error message
=20=20update-alternatives.bbclass: Add missing runtime dependency

Marko Lindqvist (18):
=20=20cairo: update to upstream version 1.12.8
=20=20libpng: update to upstream version 1.2.50
=20=20ccache: update to upstream version 3.1.8
=20=20pango: update to upstream version 1.30.1
=20=20xorg-app: fix license segment md5sum boundary
=20=20pong-clock: fix license segment md5sum boundary
=20=20uclibc: fix license segment md5sum boundary
=20=20coreutils: fix license segment md5sum boundary
=20=20gmp: fix license segment md5sum boundary
=20=20libdaemon: fix license segment md5sum boundary
=20=20xcb: fix license segment md5sum boundary
=20=20ltp: fix license segment md5sum boundary
=20=20glib-2.0: fix license segment md5sum boundary
=20=20net-tools: fix license segment md5sum boundary
=20=20glib-2.0: update to upstream version 2.34.3
=20=20readline: apply upstream patches
=20=20grep: update to upstream version 2.14
=20=20libpng: fix license segment md5sum boundary

Martin Jansa (16):
=20=20rootfs_ipk, package_ipk: drop --force-overwrite
=20=20libcgroup: fix INSANE_SKIP
=20=20tune-cortexa*, tune-xscale: fix ARMPKGARCH
=20=20tune-*: add PACKAGE_EXTRA_ARCHS entries starting with specific =
ARMPKGARCH
=20=20arch-armv5: fix missing thumb TUNE_FEATURE in armv5t-vfp and =
following tunes
=20=20arch-armv[457]*: fix PACKAGE_EXTRA_ARCHS for bigendian TUNEs
=20=20arch-arm*: unify appending to TUNE_FEATURES
=20=20arch-armv4.inc: add --fix-v4bx to TARGET_LD_KERNEL_ARCH only for =
armv4 and s
=20=20tune-cortexa*: add another TUNE which allows to enable cortexa* =
together wit
=20=20packagegroup-core-basic: use VIRTUAL-RUNTIME_initscripts and =
VIRTUAL-RUNTIME
=20=20distutils: remove empty datadir/share after it's content is moved to =
datadir
=20=20util-linux: use u-a for eject
=20=20sstate.bbclass: fix detection of owners matching sstate files
=20=20at: change initscript dependency from build time to runtime
=20=20python-smartpm: don't try to remove /usr/share/share twice
=20=20git: fix unpackaged python files

Mihai Prica (3):
=20=20libnl: upgrade to 3.2.14
=20=20wpa-supplicant: configured to work with libnl 3.2.14
=20=20libpcap: PR bump because of PU for libnl

Ming Liu (2):
=20=20rootfs_rpm.bbclass: normalize arch output of list_installed_packages
=20=20rootfs_rpm.bbclass: fix a regression introduced by =
list_installed_packages c

Muhammad Shakeel (4):
=20=20qa.py: Modify the env for the child process only
=20=20qa.py: Toolchain path should not be hardcoded to execute objdump
=20=20libaio: Remove QA warning: No GNU_HASH in the elf binary
=20=20zip: Remove QA warnings: No GNU_HASH in the elf binary

Otavio Salvador (2):
=20=20initramfs-framework: init: Stop mount warnings during boot
=20=20initramfs-framework: udev: Handle alternative binary paths

Paul Eggleton (14):
=20=20meta/lib/oe/sstatesig: fix locating stamp files
=20=20fotowall: tidy up
=20=20qmmp: remove qmake2 from inherit
=20=20rpm: enable _openall_before_chroot by default
=20=20createrepo: implement support for recommends
=20=20python-smartpm: add support for recommends
=20=20python-smartpm: style fixes
=20=20python-smartpm: fix package metadata not being read from rpm-md feeds
=20=20python-smartpm: don't create /var/tmp on every rpm database open
=20=20python-smartpm: support nolinktos and noparentdirs rpm options
=20=20python-smartpm: allow setting arbitrary macros in smart config
=20=20shadow: add runtime dependency on base-passwd
=20=20quicky: tidy up inherit
=20=20buildhistory_analysis: fix broken list length checks

Richard Purdie (6):
=20=20populate_sdk_base: Fix typo
=20=20sstate: fix typo
=20=20bootimg: Remove now unnecessary dummy inherit usage
=20=20image/populate_sdk: Simplify imagetest inclusion and drop dummy class =
file
=20=20rootfs_ipk/package_ipk: Simplify opkg commandline option variables
=20=20base.bbclass: Remove implicit dependency on license.bbclass

Ross Burton (5):
=20=20guile: fix bashism in script
=20=20guile: touch compiled modules on sstate install
=20=20xserver-xorg: restore packaging for the DRI/DRI2/DBE extensions
=20=20libxkbcommon: make the build do something
=20=20gst-meta-base: pull in X11 plugins when using X11

Roy.Li (1):
=20=20site/common-linux: move ac_cv_o_nonblock_inherited to =
site/common-linux

Saul Wold (12):
=20=20cmake: Update to 2.8.10.1
=20=20sysvinit: Update ALTERNATIVES List for utmpdump
=20=20build-appliance-image: Allow SRCREV to be overriden
=20=20util-linux: Update to 2.22.1
=20=20ocf-linux: Update to 20120127
=20=20less: Update to 456
=20=20msmtp: Update to 1.4.30
=20=20libusb: Update to 1.0.9
=20=20libusb-compat: Update to 0.1.4
=20=20util-linux: rebase remove-lscpu patch
=20=20sstate: fetch .siginfo files from SSTATE_MIRROR
=20=20sstate: fix typo

V=C3=ADctor Enr=C3=ADquez (1):
=20=20arch-armv6: add tunes without vfp enabled

Xin Ouyang (1):
=20=20libxml-sax-base-perl: add recipe for libxml-sax-perl

Zhenhua Luo (2):
=20=20libxml2: add --with-fexceptions in configure flags to support =
exception hand
=20=20libxml2: update PR to contain INC_PR to reflect the update of inc file

yanjun.zhu (2):
=20=20squashfs: fix for CVE-2012-4024
=20=20libproxy: Fix for CVE-2012-4504

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Andrea Adami (1):
=20=20linux-yocto-tiny-kexecboot: add version 3.4

Andreas M=C3=BCller (4):
=20=20babl: update to 0.1.10
=20=20gegl: update to 0.2.0
=20=20gimp: update to 2.8.2
=20=20libgphoto2: refix build

Eric BENARD (3):
=20=20php: upgrade to 5.3.19
=20=20php: enable gettext and sqlite
=20=20php: enable php-fpm

Jack Mitchell (1):
=20=20hiawatha: add new patch to fix xslt implementation

Marcin Juszkiewicz (11):
=20=20php: add apache configuration for php-fpm
=20=20xfsprogs: updated to 3.1.8, added gnu-configize
=20=20zsh: added gnu-configize to do_configure()
=20=20openmotif: remove due to lack of libxp in repository
=20=20mplayer2: move lame into ENTERPRISE_DISTRO check
=20=20packagegroup-cli-tools: remove mdbus2, mterm2, mkdump, mioctl
=20=20devilspie2: move to meta-gnome (libwnck is there)
=20=20fbreader: move to meta-gpe due to libgpewidget dependency
=20=20midori: move to meta-gnome due to libnotify
=20=20obexd: move to meta-gnome due to libical dependency
=20=20python-phoneutils: drop due to lack of libphone-utils

Mario Domenech Goulart (7):
=20=20freerdp: disable man pages generation
=20=20freerdp: update to the latest commit (2012-11-20) in the stable-1.0 =
branch
=20=20openbox: separate package for configuration files (openbox-config)
=20=20xinput-calibrator: update to 2012 Aug 2nd's git snapshot
=20=20xinput-calibrator: update meta-systemd's bbappend to 2012 Aug 2nd's =
git snap
=20=20samba: split winbind into winbind and libwinbind
=20=20xinput-calibrator: remove hardcoded path from =
xinput_calibrator.desktop

Martin Jansa (1):
=20=20qt4: rename bbappends to match new 4.8.4 version from oe-core

Otavio Salvador (1):
=20=20freerdp-extension-xpunlimited: Remove the recipe as it is uncompatible

Paul Eggleton (13):
=20=20meta-systemd: ntp: update for server config improvements
=20=20proftpd: fix do_install failure after libexecdir change
=20=20netcat: add from OE-Classic
=20=20libnfnetlink: move to meta-networking and update to 1.0.1
=20=20libmnl: add new recipe for version 1.0.3
=20=20libnetfilter-conntrack: add from OE-Classic and update
=20=20libnetfilter-cttimeout: add new recipe for version 1.0.0
=20=20libnetfilter-cthelper: add new recipe for version 1.0.0
=20=20libnetfilter-queue: add new recipe for version 1.0.2
=20=20conntrack-tools: add from OE-Classic, update and tidy up
=20=20ebtables: add from OE-Classic, update and tidy up
=20=20pure-ftpd: add new recipe for 1.0.36
=20=20pptp-linux: add from OE-Classic, update and tidy up

Ross Burton (2):
=20=20meta-oe: add python-mako, a templating library
=20=20guile: remove from meta-oe, there is newer version in oe-core

Samuel Stirtzel (3):
=20=20maliit-framework: Clean up recipe and use gtk-immodules-cache.bbclass
=20=20maliit-plugins: Clean up recipe and add missing RDEPENDS
=20=20maliit-framework: Don't build the SDK

Zhenhua Luo (1):
=20=20cramfs: download source tarball from http server instead of cvs server

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Denys Dmytriyenko (4):
=20=20usbutils: yank out bash dependency due to GPLv3
=20=20arago-headless-tisdk-image: add full gdb into the image
=20=20meta-toolchain-arago: remove all .la files in the devkit
=20=20arago.conf: bump the version

Franklin S. Cooper Jr (13):
=20=20usbutils: avoid dependency on bash
=20=20meta-toolchain-arago-tisdk: Add Arago SDK specific toolchain recipe
=20=20arago-amsdk-image: Change the meta toolchain recipe used
=20=20arago-qt4.inc: Introduce arago-qt4.inc file
=20=20qt4-embedded: Use new arago-qt4.inc file
=20=20qt4-embedded-gles: Add append to include arago-qt4.inc
=20=20arago-qt4.inc: Add maximize window patch for weatherinfo and =
imageviewer
=20=20netbase: Add arago custom init
=20=20tisdk-image: Change the filename of the toolchain sdk that should be =
used
=20=20ti-tisdk-setup: Update targetNFS filesystem
=20=20busybox: Fix NFS issues
=20=20busybox: Enable more features in head application
=20=20ti-tisdk-makefile: Use ARMPKGARCH variable

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

Alex Gonzalez (1):
=20=20fsl-eula-unpack: Avoid unbound local exception.

Otavio Salvador (3):
=20=20linux-imx (3.0.35): Update SRCREV as perf fix has been merged
=20=20libfslcodec: Fix packaging so libraries are in ${libdir}
=20=20libfslparser: Drop the package split as gst-fsl-plugin dlopen them

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-ppc:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-guacamayo:

Tomas Frydrych (5):
=20=20preferred-versions.conf: remove the BBMASK
=20=20Fix BBMASK in various guacamayo machine confs
=20=20bblayers.conf.sample: include the new meta-guacamayo-bsp layer
=20=20Create link to meta-guacamayo-bsp in the layers dir
=20=20BBMASK meta-ti/recipes-misc/images

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix-community:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-handheld:

Andrea Adami (2):
=20=20linux-yocto-tiny-kexecboot_3.2: move it to its specific directory
=20=20linux-yocto_3.4: initial commit for Zaurus

Marko Katic (1):
=20=20kexecboot-handhelds.inc: Add explicit support for 16 bit displays.

Paul Eggleton (1):
=20=20kexecboot-handhelds.inc: fix typo in previous commit

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-igep:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Darren Hart (1):
=20=20fri2: README update

Kishore Bodke (4):
=20=20crystalforest: Remove Corpus recipes
=20=20crystalforest: Remove the custom Image recipes
=20=20meta-intel/common:  Add Corpus recipes to common
=20=20crystalforest: Enable BSP specific feature set

Nitin A Kamble (17):
=20=20meta-intel.inc: fix xorg packaging issue for emgd BSPs
=20=20emenlow: use emgd instead of psb for graphics driver
=20=20eMenlow README: add a link to the platform webpage
=20=20emgd-driver-bin: avoid rebuilding issue of the recipe
=20=20eMenlow README: add text to specify the licensing need of EMGD
=20=20BSP README.sources: update the URL of the source tarball
=20=20fri2 README: add a web link to the Intel embedded platforms
=20=20emgd-driver-bin: avoid text relocation warnings
=20=20meta-emenlow: remove checksums.ini
=20=20emenlow.conf: specify a kernel boot param for emgd
=20=20crownbay README: add web links to the supported platforms
=20=20sugarbay README: add web links to the supported platforms
=20=20chiefriver README: add web links to the supported platforms
=20=20jasperforest README: add web links to the supported platforms
=20=20eMenlow README: add a web link to the Intel embedded platforms
=20=20n450 README: add web links to the supported platforms
=20=20sys940x README: add a web link to the Intel embedded platforms

Rahul Saxena (3):
=20=20meta-cedartrail: add web links for supported platforms to README
=20=20meta-crystalforest: add web links for supported platforms to README & =
Add co
=20=20meta-romley: add web links for supported platforms to README & Add =
code name

Ross Burton (1):
=20=20xf86-video-mga: add missing EXA runtime dependency, cleanup depends

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

Andrei Gherzan (6):
=20=20qemu: Remove glflags.patch
=20=20tiff: Sync with version from oe-core
=20=20xserver-xorg: Sync with version from oe-core
=20=20qt4: Sync with version from oe-core
=20=20README.md: Add dependency to meta-networking
=20=20pango: Remove bbappend as upstream removed its dependency to =
gnome-common

Florin Sarbu (2):
=20=20README.md: update with info related to building for qemux86 too.
=20=20layer-management: Update to version 0.9.9

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-java:

Henning Heinold (4):
=20=20openjdk7: correct path to bootstrap jdk
=20=20openjdk7: disable shark until it is working again
=20=20log4j1.2: correct license field
=20=20rhino: update to version 1.7r4

woglinde (1):
=20=20Merge pull request #32 from kraj/master

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

Denis 'GNUtoo' Carikli (2):
=20=20meta-openmoko: linux-gta04: remove root=3D kernel parameter again.
=20=20libphone-ui, libphone-ui-config: update to the last SRCREV.

Lukas M=C3=A4rdian (1):
=20=20shr-feed: add back valacompass, sensmon

Martin Jansa (46):
=20=20distro-feed-configs: add more feeds for more specific tunes
=20=20msmcommd: depend on libfsoframework
=20=20defaulttunes.inc: add info about needed rebuild
=20=20msmcomm-base: limit COMPATIBLE_MACHINE to palmpre* machines
=20=20python-phoneutils: return from meta-oe
=20=20packagegroup-fso2-compliance: RRECOMMEND mdbus2, mterm2, mkdump, =
mioctl whic
=20=20meta-shr: move theme recipes to separate directory
=20=20gpe-theme-neo: import from OE-Classic
=20=20qi: fix s3c2410 build
=20=20meta-shr: preferred-shr-versions: remove P_V for libmikmod, =
emacs-x11, subve
=20=20meta-shr: preferred-shr-versions: remove P_V for dbus, will upgrade =
it to 1.
=20=20meta-shr: preferred-shr-versions: remove P_V for openssl, 0.9.8 was =
removed=20
=20=20meta-shr: preferred-shr-versions: remove P_V for qt4*, 4.8.1 was =
removed fro
=20=20epiano: drop, no longer available on SRC_URI
=20=20fso-alsa-data: add LIC_FILES_CHKSUM
=20=20dbus-hlid: add LICENSE version and LIC_FILES_CHKSUM
=20=20gsmd2: add LICENSE version and LIC_FILES_CHKSUM
=20=20libframeworkd-glib: add LICENSE version and LIC_FILES_CHKSUM
=20=20menu-freesmartphone: add LIC_FILES_CHKSUM
=20=20multicat: add LIC_FILES_CHKSUM
=20=20pycd: add LIC_FILES_CHKSUM
=20=20omext: fix LICENSE and add LIC_FILES_CHKSUM"
=20=20openmoko-gps: add LICENSE version and LIC_FILES_CHKSUM
=20=20rtmom: add LICENSE version and LIC_FILES_CHKSUM
=20=20sensmon: add LICENSE version and LIC_FILES_CHKSUM
=20=20ventura: fix LICENSE version and LIC_FILES_CHKSUM
=20=20shr-installer: add LICENSE version and LIC_FILES_CHKSUM
=20=20shr-launcher: fix LICENSE version and LIC_FILES_CHKSUM
=20=20libfreesmartphone-glib: add LIC_FILES_CHKSUM
=20=20shr-themes: bump SRCREV for all themes from shr-themes.git
=20=20shr-themes: bump SRCREV for all themes from shr-themes.git
=20=20gtk-theme-neo, icon-theme-neo: add LICENSE and LIC_FILES_CHKSUM
=20=20libpersistence: bump SRCREV, add LICENSE version and LIC_FILES_CHKSUM
=20=20neolight: fix packaging QA warning
=20=20multicat: use more common S
=20=20illume-theme-freesmartphone: add LIC_FILES_CHKSUM
=20=20fsosystemd: fix SRC_URI checksums
=20=20fso-boot: remove deprecated by fsosystemd
=20=20samsung-modem-mgr: add dbus and glib to DEPENDS
=20=20neolight: /usr/share/share removal is now done in distutils bbclass
=20=20tsmd: fix do_install_append paths
=20=20illume-theme-freesmartphone: fix LICENSE and LIC_FILES_CHKSUM format
=20=20rtmom: call python without PATH
=20=20rtmom: move rtmom.conf.example back to PN

V=C3=ADctor Enr=C3=ADquez (2):
=20=20Patch for improving geeksphone-one kernel recipe
=20=20Add xorg.conf for geeksphone one

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

Denys Dmytriyenko (1):
=20=20linux-keystone: update from version 3.6-rc6 to 3.6.6

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

Eric Blade (1):
=20=20webos-image: luna-sysmgr=3D1.01, luna-sysmgr-ipc-messages=3D1.01

Herb Kuta (3):
=20=20Invent conf/distro/include/webos-filesystem-paths.inc
=20=20Convert to use new filesystem path variables
=20=20webos-component-head.inc: Remove extraneous SRCREV settings

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

Elvis Dowson (1):

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Ross Burton (1):
=20=20mesa: remove atom-pc specific overrides

Saul Wold (1):
=20=20maintainers: Tweak ownership of recipes

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:




