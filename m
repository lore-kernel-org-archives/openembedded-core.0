Return-Path: <cliff.brake@gmail.com>
Received: from bec-systems.com (u15414263.onlinehome-server.com
	[74.208.70.121])
	by mail.openembedded.org (Postfix) with ESMTP id 0074A60593;
	Mon,  5 Aug 2013 16:06:37 +0000 (UTC)
Received: from oh-67-76-203-50.sta.embarqhsd.net ([67.76.203.50]
	helo=happy.bec-systems.com)
	by bec-systems.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cliff.brake@gmail.com>)
	id 1V6NDX-0004XQ-4X; Mon, 05 Aug 2013 12:01:15 -0400
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Date: Mon, 05 Aug 2013 16:06:17 GMT
Message-Id: <1375718777583.96afc79f@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
X-Spam_score: -2.9
X-Spam_score_int: -28
X-Spam_bar: --
Subject: OE Changelog since 2013-07-28 until 2013-08-04
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
X-List-Received-Date: Mon, 05 Aug 2013 16:06:38 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2013-07-28 until 2013-08-04.  Projects included in this =
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

Andr=C3=A9 Draszik (1):
=20=20fetch2: fix unpack of .xz files

Cristiana Voicu (2):
=20=20hob: changed the split of SSTATE_MIRRORS variable
=20=20hob: sstatemirror is standard also for file://.* regex

Petter Mab=C3=A4cker (1):
=20=20bitbake: runqueue: add warning if invalidating invalid task

Robert Yang (1):
=20=20providers.py: print a debug message for dynamic pacakge

Valentin Popa (1):
=20=20bitbake-worker: import needed signal module

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Andre McCurdy (1):
=20=20lib/oe/terminal.py: add support for MATE desktop terminals

Andrei Dinu (1):
=20=20libpng : upgrade to 1.6.3

Chen Qi (1):
=20=20opkg.inc: remove the obsolete REDIRECT_CMD

Colin Walters (1):
=20=20util-linux: Update for swapoff being a separate binary

Cristian Iorga (3):
=20=20iproute2: upgrade to v3.10.0
=20=20alsa-lib: upgrade to v1.0.27.2
=20=20alsa-utils: upgrade to 1.0.27.2

Emilia Ciobanu (4):
=20=20docbook-sgml-dtd-3.1-native: fix recipe name
=20=20docbook-sgml-dtd-4.1-native: fix recipe name
=20=20distrodata.bbclass: Remove whitespaces
=20=20distrodata.bbclass: Include PRSPV variable in upstream version =
checking

Eric Nelson (1):
=20=20gst-plugins-gl: add explicit dependency on libpng

Hongxu Jia (3):
=20=20util-linux: use u-a for su
=20=20shadow: use u-a for su
=20=20busybox: move /bin/su to /usr/bin/su to match util-linux and shadow

Ionut Radu (1):
=20=20apt: Upgrade from 0.9.8.2 to 0.9.9.4

Jackie Huang (2):
=20=20dbus: remove build host test in configure script
=20=20matchbox-wm: correct the SRC_URI and add checksums

Joe MacDonald (1):
=20=20oe-find-native-sysroot: minor optimization

Jonathan Liu (1):
=20=20syslinux: update to 4.07

Jukka Rissanen (4):
=20=20bluez5: Only install .conf files if found
=20=20ofono: Add systemd support
=20=20ofono: Move bluetooth enabling to .inc file
=20=20ofono: Enable test scripts by default

Khem Raj (1):
=20=20gcc-4.8: Fix meta-fsl-arm iperf build issue

Laurentiu Palcu (14):
=20=20csl-versions.inc: instruct user to check local.conf
=20=20adt_installer: allow specifying relative target sysroot paths
=20=20xf86-video-intel: upgrade to 2.21.13
=20=20git: upgrade to 1.8.3.4
=20=20nasm: upgrade to 2.10.09
=20=20powertop: upgrade to 2.4
=20=20libdrm: upgrade to 2.4.46
=20=20libpciaccess: upgrade to 0.13.2
=20=20xrandr: upgrade to 1.4.1
=20=20xf86-input-evdev: upgrade to 2.8.1
=20=20xhost: upgrade to 1.0.6
=20=20makedepend: upgrade to 1.0.5
=20=20flex: upgrade to 2.5.37
=20=20grub_2.00: fix compilation when using flex 2.5.37

Martin Jansa (1):
=20=20mesa: inherit gettext

Ming Liu (2):
=20=20openssl: Fix multilib header conflict - opensslconf.h
=20=20libpam: deny all services for the OTHER entries

Muhammad Shakeel (3):
=20=20systemd: Remove init.d dir if systemd unit file is present and =
sysvinit not=20
=20=20busybox: Add syslog-init alternative only if SysV in enabled
=20=20avahi: Remove unnecessary runtime dependency on sysvinit-pidof

Paul Barker (1):
=20=20opkg: Bump SRCREV as patch has been applied upstream

Paul Eggleton (3):
=20=20classes/sanity: check for suid root command evility
=20=20classes/sanity: fix some grammatical errors in messages
=20=20grub: disable floating ncurses dependency for GPLv2 version

Peter Seebach (1):
=20=20pseudo: Always try to build 32-bit libpseudo when NO32LIBS is set to 0

Richard Tollerton (1):
=20=20shadow: Fix build when DISTRO_FEATURES contains pam, libc-crypt

Rogerio Nunes (1):
=20=20packagegroup-core-tools-testapps: isolate x11 dependent tools

Ross Burton (4):
=20=20v86d: mark as compatible with all x86, not just qemux86
=20=20bluez5: Add obex-profiles as a PACKAGECONFIG, package obexd separately
=20=20qemu: remove unused SDL variable
=20=20u-boot: state the MACHINE when skipping u-boot

Saul Wold (8):
=20=20texinfo: Update to 5.1
=20=20dpkg: upgrade to 1.17.1
=20=20dpkg: Drop INC_PR as it's unused
=20=20glew: upgrade to 1.10.0
=20=20libgcrypt: upgrade to 1.5.3
=20=20resolvconf: upgrade to 1.74
=20=20xorg-cf-files: upgrade to 1.0.5
=20=20grep: Add patch for texinfo 5.1

Stefan Stanacar (4):
=20=20oeqa/utils/sshcontrol: increase and log timeout in output
=20=20oeqa/utils/qemurunner: add comment and header
=20=20oeqa/utils/qemurunner: tweak console bootparam and ip command
=20=20oeqa/runtime/xorg: use the right ps command for xorg test

Wenzong Fan (1):
=20=20ccache: allow CCACHE_DIR to be overriden

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Colin Walters (1):
=20=20cyrus-sasl: Add patches from Debian to fix linking

Joe MacDonald (1):
=20=20cyrus-sasl: relocate files to package name dir

Jonathan Liu (1):
=20=20qwt: install Qt Designer plugins to correct directory

Martin Jansa (32):
=20=20rrdtool: add PACKAGECONFIG for dbi
=20=20loudmouth: add dependency on libidn
=20=20cifs-utils: add PACKAGECONFIG for libcap
=20=20atftp: add PACKAGECONFIG for pcre, readline, tcp-wrapper
=20=20fbida: add dependency on curl libungif tiff
=20=20mbuffer: add PACKAGECONFIG for md5
=20=20inetutils: add PACKAGECONFIG for ftp and uucpd
=20=20jasper: add PACKAGECONFIG for jpeg
=20=20joe: add PACKAGECONFIG for joe
=20=20krb5: add PACKAGECONFIG for openssl and libedit
=20=20libass: add PACKAGECONFIG for harfbuzz
=20=20links: add PACKAGECONFIG for bzip2, lzma
=20=20quagga: add PACKAGECONFIG for capabilities
=20=20sox: add PACKAGECONFIG for magic and wavpack
=20=20usbmuxd: add PACKAGECONFIG for plist
=20=20usbmuxd: fix unpackaged files
=20=20libav: add PACKAGECONFIG for bzip2 and jack
=20=20libnice: add PACKAGECONFIG for gupnp
=20=20farsight2: add PACKAGECONFIG for gupnp
=20=20x264: explicitly disable swscale
=20=20mkvtoolnix: inherit gettext and export RUBYLIB
=20=20libftdi: add PACKAGECONFIG for cpp-wrapper
=20=20libgphoto2: add PACKAGECONFIG for serial
=20=20ntfs-3g-ntfsprogs: add packageconfig for uuid
=20=20openldap: add dependency on util-linux
=20=20samba: add packageconfig for fam
=20=20smbnetfs: add packageconfig for gnome-keyring
=20=20ruby: add dependency on db gdbm readline
=20=20cifs-utils: inherit pkgconfig
=20=20e-base: add module.so to PRIVATE_LIBS
=20=20connman: Rename bbappend to match new version from oe-core
=20=20ntp: allow to run pkg_postinst_ntpdate in do_rootfs

Mihai Prica (2):
=20=20ebtables: Load ebtables kernel module
=20=20postgresql: upgrade to 9.2.4

Paul Barker (1):
=20=20vim: upgrade to v7.3.1314

Paul Eggleton (3):
=20=20webmin: add from meta-baryon
=20=20xinput-calibrator: remove
=20=20pointercal-xinput: remove

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Khem Raj (1):
=20=20packagegroup-target-sdk: Add packagegroup for On device C/C++ SDK

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Carlos Hernandez (1):
=20=20packagegroup-arago-test: Add memtester

Franklin S. Cooper Jr (5):
=20=20ti-tisdk-setup: Add Beaglebone Black support
=20=20matrix-gui-apps-git: Update crypto .desktop to correct description =
page path
=20=20board-port-labs: Pull in updated board-port-labs for SDK 6.0
=20=20matrix-gui-apps-git: Pull in updated clock demo
=20=20packagegroup-arago-tisdk-matrix: Clock app doesnt work on older =
boards.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-beagleboard:

Koen Kooi (4):
=20=20linux-mainline 3.8: add support for continuous ADC sampling
=20=20bone101: remove references to GateOne SSH client
=20=20bone101: fix dead links
=20=20linux-mainline 3.8: fix mmc1 cd

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-browser:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-bug:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-chicken:

Mario Domenech Goulart (26):
=20=20chicken: update to version 4.8.0.4
=20=20chicken-egg-awful: update to version 0.39
=20=20chicken-egg-crypt: update to version 0.4.1
=20=20chicken-egg-channel: update to version 0.0.3
=20=20chicken-egg-easyffi: update to version 1.99.7
=20=20chicken-egg-html-utils: update to version 0.9
=20=20chicken-egg-http-session: update to version 2.8
=20=20chicken-egg-intarweb: update to version 1.1
=20=20chicken-egg-json: update to version 1.5
=20=20chicken-egg-make: update to version 1.7
=20=20chicken-egg-matchable: update to version 3.3
=20=20chicken-egg-openssl: update to version 1.6.3
=20=20chicken-egg-sendfile: update to version 1.7.24
=20=20chicken-egg-setup-helper: update to version 1.5.3
=20=20chicken-egg-simple-sha1: update to version 0.4
=20=20chicken-egg-spiffy-request-vars: update to version 0.17
=20=20chicken-egg-spiffy: update to version 5.0
=20=20chicken-egg-ssax: update to version 5.0.7
=20=20chicken-egg-sxml-transforms: add recipe for version 1.4.1
=20=20chicken-egg-dbus: update to version 0.92
=20=20gen-egg-recipes: add medea to the list of recipes to be generated
=20=20chicken-egg-comparse: add recipe for version 0.0.5
=20=20chicken-egg-latch: add recipe for version 0.2
=20=20chicken-egg-medea: add recipe for version 0.1.3
=20=20chicken-egg-trie: add recipe for version 0.0.1
=20=20chicken-egg-lazy-seq: add recipe for version 0.0.5

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-efikamx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ettus:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm:

Andy Voltz (2):
=20=20linux-timesys: Add Timesys-based kernel for VF600 based machines
=20=20twr-vf65gs10: Add machine support for Vybrid Tower VF65GS10

Eric BENARD (2):
=20=20layer.conf: handle dynamic layer configuration
=20=20qt5: add mx5 and mx6 support

Lauren Post (2):
=20=20imx-lib: Update to version 3.5.7-1.0.0
=20=20alsa-state: Add default asound.conf for i.MX6 SoCs

Otavio Salvador (8):
=20=20image_types_fsl.bbclass: Add vf60 SoC family support
=20=20gpu-viv-bin-mx6q.inc: Ensure DRI module is add for Wayland + X11 case
=20=20fsl-alsa-plugins: Add 1.0.25 version
=20=20imx-base.inc: Add fsl-alsa-plugins to i.MX6 recommended packages
=20=20libfslcodec: Update to 3.0.8 version
=20=20libfslparser: Update to 3.0.8 version
=20=20libfslvpuwrap: Update to 1.0.38 version
=20=20gst-fsl-plugin: Update to 3.0.8 version

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-ppc:

Ting Liu (1):
=20=20add license file for TestFloat

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

Darren Hart (3):
=20=20gnu-efi: Update to 3.0u
=20=20gummiboot: Add gummiboot recipe
=20=20gnuefi: Add missing parallel-make-archives patch

Nitin A Kamble (6):
=20=20sugarbay: correct the KERNEL_FEATURE variable name
=20=20crownbay: correct the KERNEL_FEATURE variable name
=20=20emenlow: correct the KERNEL_FEATURE variable name
=20=20fri2: correct the KERNEL_FEATURE variable name
=20=20fri2-noemgd: fix the KERNEL_FEATURE variable override
=20=20emgd-driver-bin-1.18: fix for xorg-abi-video error

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

Holger Behrens (3):
=20=20connman: obsolete, as systemd support now part of oe-core
=20=20pulseaudio: follow oe-core upgrade to version 4.0
=20=20meta-ivi: point to new mailing list and bug tracker

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

Simon Busch (1):
=20=20classes: cmake_qt5: export all qt5 related paths to cmake

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-slugos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-systemd:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-raspberrypi:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

Martin Jansa (2):
=20=20consolekit: drop .bbappend with PRINC only

Simon Busch (7):
=20=20meta-samsung: systemd-machine-units: add pvrinit service =
configuration for t
=20=20meta-android: android-system-image: don't provide adbd anymore
=20=20android-system: add as replacement for android-initscripts with =
systemd supp
=20=20android-tools: add as replacement to adb recipe
=20=20meta-samsung: systemd-machine-units: only exclude rndissetup when no =
adb in=20
=20=20meta-android: systemd: add android firmware paths as search paths
=20=20meta-acer: a500: drop adb from MACHINE_EXTRA_RDEPENDS; it's now part =
of andr

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

Denys Dmytriyenko (1):
=20=20mesa: update bbappend to the latest version from oe-core

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

Anatolii Sakhnik (1):
=20=20webos-image: libpbnjson=3D18

Ed Chejlava (1):
=20=20webos-image: adding Upstart 1.8 files only

Heegoo Han (1):
=20=20gtest: Add recipe for v1.6.0

Iyad Qumei (5):
=20=20upstart: Add ROOTFS_READ_ONLY variable
=20=20webos-image.bbclass: Optionally prepare rootfs to be read-only
=20=20dropbear: Persist generated keys across software updates
=20=20opkg: Put lock file in correct location
=20=20packagegroup-webos-extended: Include dhcp-client only for the emulator

Martin Jansa (6):
=20=20webos-recipe-blacklist: Blacklist broken upstream recipes
=20=20xkeyboard-config: Add missing dependency on util-macros
=20=20leveldb: Explicitly disable gperftools dependency
=20=20qt4-webos: Explicitly disable sqlite, openvg and enable openssl
=20=20buildhistory: Move WEBOS_BOM_data.pkl to TMPDIR
=20=20buildhistory: Use bb.utils.mkdirhier instead of os.makedirs

Minjung Kim (2):
=20=20vboxguestdrivers: add mount.vboxsf utility
=20=20linux-yocto: add uinput device driver

Roger Stringer (1):
=20=20meta-webos image: smartkey-hun=3D7

Wonhong Kwon (1):
=20=20alljoyn: add a Upstart 1.8 script

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

Nathan Rossi (11):
=20=20linux-xlnx: linux-machine-config.inc: Fixed dependency issues
=20=20linux-xlnx: Split out common platform definitions
=20=20linux-xlnx: Split up MicroBlaze kernel config
=20=20linux-xlnx: Clean up Zynq defconfig use
=20=20linux-yocto: Fix compatiblity with base layer machines
=20=20Refactored MACHINE_* usage
=20=20layer.conf: Change layer priority to match other BSP layers
=20=20machine-xilinx-default.inc: Refactored all non-tune configuration
=20=20linux-xlnx: Remove untested, Linux 3.6 version
=20=20meta-*: Remove deprecated sublayers

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Emilia Ciobanu (1):
=20=20package_regex.inc: Add/Update REGEX and PRSPV variable

Ionut Radu (1):
=20=20maintainers.inc: reshuffle maintainers

Laszlo Papp (1):
=20=20layer.conf: make the yocto layer dependent on oe-core

Ross Burton (5):
=20=20genericx86: add new BSP
=20=20local.conf.sample: add genericx86 reference
=20=20genericx86: add fbdev, modesettings and vesa Xorg drivers
=20=20genericx86: disable rootless X
=20=20genericx86: ship all the driver firmware by default

Saul Wold (1):
=20=20poky-lsb: Enable GCC Security flags by default for LSB builds

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



