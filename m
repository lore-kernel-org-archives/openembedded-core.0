Return-Path: <cliff.brake@gmail.com>
Received: from bec-systems.com (u15414263.onlinehome-server.com
	[74.208.70.121])
	by mail.openembedded.org (Postfix) with ESMTP id 860B76BE03;
	Tue,  3 Sep 2013 14:47:06 +0000 (UTC)
Received: from oh-67-76-203-50.sta.embarqhsd.net ([67.76.203.50]
	helo=happy.bec-systems.com)
	by bec-systems.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cliff.brake@gmail.com>)
	id 1VGrmX-0007WN-OI; Tue, 03 Sep 2013 10:40:47 -0400
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Date: Tue, 03 Sep 2013 14:46:46 GMT
Message-Id: <1378219606482.df17b03f@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
X-Spam_score: -2.9
X-Spam_score_int: -28
X-Spam_bar: --
Subject: OE Changelog since 2013-08-25 until 2013-09-01
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
X-List-Received-Date: Tue, 03 Sep 2013 14:47:06 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2013-08-25 until 2013-09-01.  Projects included in this =
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

Alexandru DAMIAN (1):
=20=20server/xmlrpc: stop server on client exit

Christopher Larson (2):
=20=20data_smart: use a split/filter/rejoin for _remove
=20=20data_smart: allow removal of multiple words at once with _remove

Cristiana Voicu (3):
=20=20bitbake/event.py: UIhandler filter should work without a mask
=20=20hob: add event handlers filtering in Hob
=20=20hob: fixes for image combo box

Jason Wessel (2):
=20=20serv.py: Fix hang when spawned dynamically with bitbake
=20=20serv.py: Fix regression from 972bc43e6d5b

Richard Purdie (17):
=20=20process: Improve exit handling and hangs
=20=20server/xmlrpc/prserv: Add sane timeout to default xmlrpc server
=20=20bitbake: Add ui event handlers filtering
=20=20data_smart: Add _remove operator
=20=20command.py: Call updateCache for all states !=3D running
=20=20prserv/db: Threading fixes
=20=20prserv/serv: Multithread the server
=20=20cookerdata: Set TOPDIR when using bblayers.conf
=20=20cookerdata: Allow bblayers.conf to be found using BBPATH
=20=20server/xmlrpc: Increase timeout to 60s
=20=20prserv: Allow 'table is locked' matching for retry loop
=20=20server/process, server/xmlrpc, runqueue: Use select.select() on fds, =
not tim
=20=20serv/db: Fix looping upon database locked issues
=20=20serv/db: Take an excluside lock on the database
=20=20serv/db: Don't use BEGIN/COMMIT
=20=20build: Fix profile file names
=20=20prserv/serv: Settle on two threads for optimal performance

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Alexandru Georgescu (1):
=20=20lib/oeqa/runtime: add basic test for x32 images

Alexandru Palalau (4):
=20=20lib/oeqa/runtime: add new logrotate test
=20=20lib/oeqa/runtime: add new skeletoninit test
=20=20lib/oeqa/runtime: add new PAM support test
=20=20lib/oeqa/runtime: add new scp test

Andrea Adami (2):
=20=20image_types.bbclass: use mkfs.cramfs instead of makecramfs
=20=20util-linux: package mkfs.cramfs and fsck.cramfs

Bruce Ashfield (12):
=20=20kern-tools: usability, bug fixes and no guilt
=20=20guilt: update to latest git version
=20=20linux-libc-headers: update to v3.10
=20=20linux-libc-headers: ptrace.h: remove ptrace_peeksiginfo_args
=20=20gst-plugins-good: fix 3.10 libc-headers build failure
=20=20linux-yocto: introduce v3.10
=20=20bc: add bc-native
=20=20kern-tools: fix patch series to git tree validation
=20=20linux-yocto: add bc-native dependency, and move to linux-yocto.inc
=20=20linux-yocto-rt: add qemumips and qemuppc to COMPATIBLE_MACHINES
=20=20linux-yocto/3.10: fix ssh login and restore CC_OPTIMIZE_FOR_SIZE
=20=20linux-yocto/3.4: v3.4.59, mohonpeak

Chen Qi (6):
=20=20checkroot.sh: check for conflicting configurations
=20=20read-only-rootfs-hook.sh: check before bind mounting /var/lib
=20=20busybox: configure system user id to range from 100 to 999
=20=20runqemu-internal: don't bring down preconfigured tap interface
=20=20runqemu-internal: provide more info if a preconfigured tap is used
=20=20runqemu-ifdown: clean up the remaining iptables rules

Christopher Larson (5):
=20=20ca-certificates: add recipe (version 20130610)
=20=20nativesdk-ca-certificates: prepopulate ca-certificates.crt
=20=20oe.types: add 'path' type
=20=20gtk+3: only set GTKIMMODULES_PACKAGES if we have immodules
=20=20gtk+3: pull forward the gtk+2 hardcoded libtool patch

Chunrong Guo (1):
=20=20gcc-4.8: fix ICE of cross-compile for PowerPC e500v2 targets

Cornel Stoicescu (2):
=20=20lib/oeqa/runtime: add test for perl
=20=20lib/oeqa/runtime: add a test for ldd

Cristian Iorga (2):
=20=20connman: upgrade to 1.17
=20=20build-appliance-image: upgrade to commit =
5745e45b18e5099e94b4d5a73bc97dc6d4c

Hongxu Jia (1):
=20=20list-packageconfig-flags.py: fix searching bitbake module failed

Jackie Huang (8):
=20=20sysklogd: add init.d/syslog status command for LSB compliance
=20=20nfs-utils: add init.d/nfsserver status command for LSB compliance
=20=20dbus: add init.d/dbus-1 status command for LSB compliance
=20=20sysvinit: add init.d/bootlogd status command for LSB compliance
=20=20at: add init.d/atd status command for LSB compliance
=20=20openssh: add init.d/sshd status command for LSB compliance
=20=20remove the unnecessary protocol parameters
=20=20multilib.bbclass: Expand the WHITELISTs with multilib prefix

Joe Slater (3):
=20=20cronie: add PACKAGECONFIG data
=20=20libpam: add PACKAGECONFIG data concerning audit
=20=20dpkg: fix configuration issue for mips64

Jonathan Liu (3):
=20=20opkg: add missing initialization of conf->exclude_list
=20=20mesa: add missing elfutils dependency for r600 PACKAGECONFIG
=20=20systemd: use /bin/mkdir instead of host mkdir path

Kai Kang (1):
=20=20alsa-lib: fix function definitions error for mips

Khem Raj (3):
=20=20glib-2.0: Specify libiconv when building on uclibc
=20=20kmod: Upgrade to version 14
=20=20systemd: Upgrade to 206

Laszlo Papp (1):
=20=20u-boot: update to 2013.07

Marko Lindqvist (3):
=20=20gtk-engines: fix build with automake-1.13
=20=20ccache: update to upstream version 3.1.9
=20=20gettext: update to upstream version 0.18.3.1

Mihai Lindner (4):
=20=20lib/oeqa/utils: new file: httpserver.py useful for serving files over =
HTTP t
=20=20lib/oeqa/utils: qemurunner: save host IP address
=20=20lib/oeqa/utils: decorators: return the decorated method
=20=20lib/oeqa/runtime: smart: add new smart tests

Mihai Prica (13):
=20=20harfbuzz: upgrade to v0.9.19
=20=20connman-gnome: fix DHCP segfault
=20=20lib/oeqa/runtime: add adjust date and time test
=20=20lib/oeqa/runtime: add vncserver for target test
=20=20lib/oeqa/utils: targetbuild: Add helper class for building packages =
on targe
=20=20lib/oeqa/runtime: add iptables, cvs and sudoku projects build tests =
on targe
=20=20vala: add version 0.16 from meta-oe
=20=20vala.bbclass: add class from meta-oe
=20=20libnotify: add version 0.6.0 from meta-gnome
=20=20python-docutils: add version 0.11 from meta-oe
=20=20midori: add version 0.5.5 from meta-gnome
=20=20packagegroup-self-hosted: integrate midori
=20=20builder: register html links and files with Midori

Paul Eggleton (4):
=20=20xserver-nodm-init: improvements from meta-oe
=20=20gpgme: update to 1.4.3
=20=20busybox: enable shared memory logging for systemd
=20=20busybox: set default log buffer size to 64 at compile time

Peter A. Bigot (2):
=20=20oe-setup-rpmrepo: add native sysroot so nativepython can be found by =
env
=20=20bluez4: fix network Connect parameter validation

Richard Purdie (8):
=20=20Add memory resident bitbake script
=20=20linux-libc-headers: Reinstate =
scripts-Makefile.headersinst-install-headers-f
=20=20classes: Remove references to _remove in function names since this =
may becom
=20=20python-2.7-manifest: Add missing python-ctypes dependency to =
python-multipro
=20=20perf: Ensure we general PIC code to avoid build failures
=20=20gcc-4.8.inc: Allow lto to be configurable
=20=20buildtools-tarball: Add python-pkgutil
=20=20web-webkit: Drop, we have midori now

Riku Voipio (1):
=20=20eglibc: fix directory cleanup for 2.17

Robert Yang (6):
=20=20e2fsprogs: the max length of debugfs argument is too short
=20=20e2fsprogs: let debugfs do sparse copy
=20=20e2fsprogs: only update the icache for ext2_inode
=20=20e2fsprogs: properly set up extent header in do_write
=20=20e2fsprogs: add populate-extfs.sh
=20=20image_types.bbclass: replace genext2fs with populate-extfs.sh

Ross Burton (1):
=20=20runqemu-ifup: when tunctl can't be found, say what package builds it

Roy.Li (2):
=20=20libsamplerate0: add PACKAGECONFIG for fftw
=20=20btrfs-tools: Add dependency on lzo acl e2fsprogs

Saul Wold (5):
=20=20pulseaudio: Fix up configure options and use gtk+3
=20=20midori: use BPN instead of PN
=20=20packagegroup-self-hosted: Add missing python code
=20=20perl: Backport 2 CVE Patches
=20=20python: Backport 2 CVE from upstream

Stefan Stanacar (13):
=20=20lib/oeqa/runtime: rpm: add install and erase tests
=20=20lib/oeqa: make it possible to restart the target
=20=20lib/oeqa: change behaviour for unskippable tests
=20=20classess/testimage: change default test suites
=20=20lib/oeqa/runtime: multilib: fix typo
=20=20lib/oeqa/runtime: smart: add checks for smart output
=20=20lib/oeqa/runtime: remove some unnecessary checks from setUpModule
=20=20classes/testimage: increase default boot timeout
=20=20classes/testimage: add support for finding tests in other layers
=20=20lib/oeqa: move skeletoninit.py where it belongs
=20=20lib/oeqa/utils: qemurunner: fix when runqemu errors out
=20=20lib/oeqa/runtime: syslog: fix test for logger in case of systemd
=20=20lib/oeqa/runtime: ping: fix ping false fail

Tom Zanussi (3):
=20=20lttng-modules: Update to 2.2.1 based release
=20=20lttng-tools: Update to version 2.2.3
=20=20lttng-ust: Update to version 2.2.1

Xufeng Zhang (1):
=20=20openssl: avoid NULL pointer dereference in three places

Zhang Xiao (1):
=20=20libnfsidmap: Add and modify idmapd.conf

Zhangle Yang (1):
=20=20stat: fix the wrong return code

liangcao (1):
=20=20SPDX:real-time license scanning and SPDX output.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Marko Lindqvist (2):
=20=20ImageMagick: update to upstream version 6.8.6-8
=20=20imagemagick: enable freetype delegate

Martin Jansa (1):
=20=20connman: rename .bbappend to match new version from oe-core

Paul Eggleton (4):
=20=20apache2: update to 2.4.6
=20=20modphp: update to 5.5.2
=20=20phpmyadmin: update to 4.0.5
=20=20mysql5: replace with mariadb 5.1.67 and tweak

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Khem Raj (1):
=20=20angstrom-next: Bump linux libc headers to 3.10

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Denys Dmytriyenko (13):
=20=20arago-prefs: set default preferences for am437x-evm
=20=20toolchain-linaro.inc: set default tunes for am437x-evm
=20=20linux-ti-staging: enable LOCALVERSION and AUTOREV
=20=20u-boot-ti-staging: enable LOCALVERSION and AUTOREV
=20=20packagegroups: update for AM437x EVM
=20=20images: update for AM437x EVM
=20=20amsdk-av-files: make compatible with ti43x
=20=20parse-ip: make compatible with ti43x
=20=20packagegroup-arago-test: disable ltp-ddt for now due to lack of am43x
=20=20packagegroup-tisdk-amsdk: disable gadget-init for ti43x due to =
missing requi
=20=20packagegroup-amsdk-sdk-host: remove pinmux from am43x build
=20=20arago.conf: bump wget connection timeout to 5 min
=20=20packagegroup-tisdk-addons*: enable canutils for am437x

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

Alexandre Belloni (3):
=20=20barebox: Add a recipe to support mainline 2013.08.0
=20=20imx-boolets: Add barebox support
=20=20image_types_fsl: mxs: Add support for a barebox bootstream

Andy Voltz (3):
=20=20kernel-module-mcc: Add package
=20=20libmcc: Add package
=20=20mqxboot: Add package

Eric Nelson (1):
=20=20qt4-x11: Allow use of Qt Media Player in multi-headed system

Erik Bot=C3=B6 (1):
=20=20qtbase: Add qtbase_5.1.0.bbappend

Lauren Post (1):
=20=20gpu-viv-g2d: Add version 3.5.7-1.0.0

Otavio Salvador (8):
=20=20gpu-viv-bin-mx6q.inc: Fix soname of libGL library
=20=20gpu-viv-bin-mx6q.inc: Fix soname of libEGL library
=20=20gpu-viv-bin-mx6q: Add DirectFB backend package
=20=20gpu-viv-bin-mx6q (3.5.7-1.0.0-alpha.2): Add Hard and Soft Float-Point =
releas
=20=20linux-imx (3.0.35): Add support to Vivante 4.6.9p12 GPU code
=20=20xf86-video-imxfb-vivante: Upgrade to 3.5.7-1.0.0-alpha.2
=20=20xserver-xorg: Remove backport of 1.11.4
=20=20imx-base.inc: Set default tune of i.MX6 to use Hard Float-Point

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

Alexandre Belloni (4):
=20=20barebox 2013.08.0: Add support for the cfa10036
=20=20imx-bootlets: Add a recipe for barebox and cfa-10036 support
=20=20linux-cfa: Add a kernel recipe supporting Crystalfontz boards
=20=20cfa10036: Add cfa10036 machine configuration

Eric Nelson (1):
=20=20u-boot-boundary: Update to 2013-07 release

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-ppc:

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

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Nitin A Kamble (4):
=20=20emenlow: mention required opengl distro feature in the README
=20=20crownbay: mention required opengl distro feature in the README
=20=20fri2: mention required opengl distro feature in the README
=20=20sys940x: mention required opengl distro feature in the README

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

Holger Behrens (3):
=20=20poky-ivi-systemd.conf: using 3.10 kernel by default
=20=20README.md: fixed typo, documented known-to-work poky revision
=20=20linux-yocto: moving on to version 3.10

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

Paul Eggleton (10):
=20=20qte: fix compiler error with gcc 4.7+
=20=20qte: fix for compilation with libpng 1.5+
=20=20classes/qmake: fix for changes to qmake_base in OE-Core
=20=20preferred-opie-git-versions.inc: update to latest git version
=20=20opie-theme: fix parse warnings
=20=20zsafe: tidy up recipe
=20=20opie-image: add to IMAGE_FEATURES instead of setting it
=20=20opie-taskbar: fix re-execution of do_configure
=20=20opie-image: add package-management to IMAGE_FEATURES
=20=20README: mention which meta-openembedded layers are needed

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-qt3:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-qt5:

Abhijit Potnis (1):
=20=20qtwebkit-examples: Add module

Simon Busch (1):
=20=20qtbase: upgrade patches for proper cmake support of native binaries =
at build

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

Denys Dmytriyenko (6):
=20=20linux-ti-staging: add the latest integration tree in prep for 3.12 =
release
=20=20u-boot-ti-staging: add the latest integration tree in prep for =
2013.10 relea
=20=20ti43x: add new SOC family for Sitara AM43xx Cortex-A9 processors
=20=20am437x-evm: add machine config for Sitara AM437x EVM
=20=20linux-ti-staging/linux-ti-glsdk: adjust DTB handling to new syntax
=20=20ti43x: disable sgx for now

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

Anatolii Sakhnik (1):
=20=20webos-image: luna-service2=3D152, serviceinstaller=3D2, =
librolegen=3D19

Herb Kuta (2):
=20=20webos_prebuilt_binaries: Add a bbclass for prebuilt binaries
=20=20webos_machine_impl_dep: Set PACKAGE_ARCH to MACHINE_ARCH

Keith Derrick (5):
=20=20webos-image: nyx-lib=3D67,v5.2.0 nyx-modules=3D90,v5.2.0 =
nyx-utils=3D10,1.0.0~rc4
=20=20webos-image: cmake-modules-webos-native=3D16,v1.0.0~rc5
=20=20webos-image: nyx-utils=3D11,v1.0.0
=20=20webos-image: novacomd=3D124
=20=20pmlogdaemon: Install LS2 role files

Mark Bessey (1):
=20=20webos-image: nodejs-module-webos-sysbus=3D29

Martin Jansa (2):
=20=20webos-preferred-versions: Fix entry for libsoup-2.4
=20=20webos_machine_impl_dep: Allow WEBOS_TARGET_MACHINE_IMPL overrides

Roger Stringer (1):
=20=20webos-image: db8=3D80

Sangwoo Kang (2):
=20=20webos-image: pmklogd=3D12, pmlogdaemon=3D108
=20=20packagegroup-webos-extended: Add VIRTUAL-RUNTIME_novacomd

Simon Busch (1):
=20=20connman=3Dwebos3

Wonhong Kwon (1):
=20=20webos-image.bbclass: Support read-only rootfs when using Upstart 1.8

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

Elvis Dowson (2):
=20=20qemuzynq: Add qemu-native and qemu-helper-native extra image =
dependencies.
=20=20qemumicroblaze: Add qemu-native and qemu-helper-native extra image =
dependenc

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Bruce Ashfield (2):
=20=20yocto-bsp: add 3.10 bbappend and update routerstationpro's preferred =
version
=20=20meta-yocto: change default kernel to 3.10

Darren Hart (7):
=20=20meta-yocto-bsp/genericx86: Update kernel, branch, KMACHINE, and SRCREV
=20=20meta-yocto-bsp: Purge atom-pc in favor of genericx86
=20=20local.conf.sample: Replace atom-pc with genericx86
=20=20README.hardware: Replace atom-pc with genericx86
=20=20meta-yocto-bsp: Add genericx86-64 machine
=20=20atom-pc: Purge straggling configuration files
=20=20local.conf.sample: Add genericx86-64 machine to machine list

Elizabeth Flanagan (1):
=20=20layer.conf: Bumping LAYERVERSION_yoctobsp to account for atom-pc

Richard Purdie (1):
=20=20recipes: Ensure that we only apply poky changes when poky is selected

Saul Wold (1):
=20=20mpc8315e-rdb: Set PREFFERED_VERSION to a version thats known working

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



