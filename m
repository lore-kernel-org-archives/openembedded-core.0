Return-Path: <cliff.brake@gmail.com>
Received: from mail-ie0-f176.google.com (mail-ie0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id B8A996E614;
	Sat, 21 Feb 2015 14:54:49 +0000 (UTC)
Received: by iecrp18 with SMTP id rp18so14252483iec.9;
	Sat, 21 Feb 2015 06:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:mime-version:message-id:from:to:subject:content-type
	:content-transfer-encoding;
	bh=LQb6lTiHpc8iJa/ZXp8oTYFL9QsyeWSUyDIcpS6m1k4=;
	b=XL7v0HBwXISe9RFr87fWOQCBf91pJxIRHB/CAQQG4+M5PhfTfvulzPiTIq2QXfs6nw
	/2bJoUyAb/qNflFVtW3rlLQ/Ex2wCGNgXv2K1t+UzkHFd2hHQ+pwf74HWsDQuE1JO0hX
	fuSmJhXes6gsjV4lN+dfsnHk+lEN2bhXxY/TqyOBnx5uWswkFwQXltvU0qshuShenIPT
	tvtNWSDxOmLxFyHYG+T7WAMjnpY2tYHq1FjnvPvLlnvg123GLHT5vojfcxlg3Ybj7r/S
	98bSPvXxe6E7g/mYGs4Pgl5qXoeX1DOxgeT94H7rQMsKLsP1JRxUUeOgiHTVdfSE37xs
	e1ag==
X-Received: by 10.107.133.220 with SMTP id p89mr3481600ioi.63.1424530490274;
	Sat, 21 Feb 2015 06:54:50 -0800 (PST)
Received: from [127.0.0.1] (cable2-pool191-cs-105.doycomm.com.
	[66.219.191.105]) by mx.google.com with ESMTPSA id
	130sm13349658ioz.10.2015.02.21.06.54.48
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 21 Feb 2015 06:54:49 -0800 (PST)
Date: Sat, 21 Feb 2015 06:54:49 -0800 (PST)
X-Google-Original-Date: Sat, 21 Feb 2015 14:54:47 GMT
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Message-Id: <1424530487461.21201ffa@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
Subject: OE Changelog since 2015-02-08 until 2015-02-15
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
X-List-Received-Date: Sat, 21 Feb 2015 14:54:52 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2015-02-08 until 2015-02-15.  Projects included in this =
report:

bitbake: git://git.openembedded.org/bitbake
openembedded-core: git://git.openembedded.org/openembedded-core
meta-openembedded: git://git.openembedded.org/meta-openembedded
meta-angstrom: git://github.com/Angstrom-distribution/meta-angstrom.git
meta-arago: git://arago-project.org/git/meta-arago.git
meta-atmel: https://github.com/linux4sam/meta-atmel.git
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

Alexandru DAMIAN (6):
=20=20toastergui: fix loadconf error message
=20=20toaster: enable server-side caches and debug-panel
=20=20toastergui: improvements in layer selection logic
=20=20toaster: enhancements for the startup sequence
=20=20toaster: improve logging facilities for toaster
=20=20toaster: display Toaster mode and version in debug mode

Belen Barros Pena (7):
=20=20toastergui: remove time link for failed build requests
=20=20toasterui: use text() instead of html()
=20=20toaster: correct typo in toaster script
=20=20toastergui: set column heading to 'Revision'
=20=20toastergui: add the word 'compatible' to 'all' pages
=20=20toastergui: add download task log icon to recipe details page
=20=20toastergui: links outside Toaster should open in a new window

Michael Wood (14):
=20=20toaster: machines Fix undefined variables
=20=20toaster: Add add/select functionality to machines page
=20=20toaster: machines Make sure we don't overwrite the pagesize
=20=20toaster: All machines add a column to link back to machine conf
=20=20toaster: All machines Update layer notifications
=20=20toaster: layerdetails Don't remove alert from dom on dismissal
=20=20toaster: All machines Add layer name order by functions
=20=20toaster: All machines Add filtering based on layer in project
=20=20toaster: models Allow the machine's layer name to be searched
=20=20toaster: All Machines fix reset search link
=20=20toaster: all Machines exclude de-prioritised layer source items
=20=20toaster: All machines reset order_by if removing that column
=20=20toaster: All machines show results count if filtering or searching
=20=20toaster: All machines Fix filter counts

Scott Rifenbark (4):
=20=20Makefile: Updated the script to not create PDF version by default
=20=20bitbake-user-manual: Added five new repo variables and links.
=20=20bitbake-user-manual: Added some links to some new variables.
=20=20bitbake-user-manual: Removed errant writer note line.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Alexandre Belloni (8):
=20=20wic: allow creation of partitions not in table
=20=20wic: add rawcopy source plugin
=20=20wic: allow to configure extra space per partition
=20=20wic: allow to configure overhead factor per partition
=20=20wic: remove useless calls to __write_fstab
=20=20wic: fix empty btrfs partitions
=20=20wic: properly label filesystems
=20=20wic: add GPT support

Andre McCurdy (3):
=20=20mesa: update --with-llvm-shared-libs configure option
=20=20mesa: update 10.4.3 -> 10.4.4
=20=20icu: remove obsolete aclocal.m4 workaround (fixed upstream since =
v52.1)

Andreas M=C3=BCller (3):
=20=20u-boot.inc: unbreak
=20=20gpgme: fix configuration by setting proper parameters instead of =
patching
=20=20libassuan: add native build

An=C3=ADbal Lim=C3=B3n (2):
=20=20xserver-xorg: Update to 1.16.3
=20=20xserver-xorg: Improvments in systemd-logind disable

Armin Kuster (1):
=20=20btrfs-tools: update to 3.18.2

Belen Barros Pena (1):
=20=20toasterconf: update Toaster configuration file

Bruce Ashfield (1):
=20=20kern-tools: fix patch application error (preempt-rt)

Cristian Iorga (4):
=20=20harfbuzz: upgrade to 0.9.38
=20=20connman: upgrade to 1.28
=20=20gst-plugins-*, gstreamer1.0-plugins-*: fix main package binary =
components
=20=20ofono: upgrade to 1.16

Denys Dmytriyenko (1):
=20=20u-boot: update to version 2015.01

Kai Kang (1):
=20=20libnewt-python: remove make var LIBNEWTSH

Khem Raj (1):
=20=20gcc: Upgrade 4.9.1 -> 4.9.2

Lucian Musat (2):
=20=20oeqa/smart: Added some new test cases
=20=20oeqa/ptest: Removed buildhistory as requirement for ptest

Marco Trillo (1):
=20=20gst-fluendo-mpegdemux: update to 0.10.85

Maxin B. John (1):
=20=20openssl: upgrade to 1.0.1k

Nathan Rossi (3):
=20=20qemu: Update PACKAGECONFIG[xen] and add xen to defaults
=20=20openssl: Add mapping for microblaze architecture
=20=20libaio: Backport generic arch detection patch

Paul Eggleton (7):
=20=20oe-pkgdata-util: improve command-line usage
=20=20oe-pkgdata-util: make find-path show a proper error if no package =
found
=20=20oe-pkgdata-util: fix read-value to handle data with colons in the =
value
=20=20oe-pkgdata-util: allow reverse package name lookups
=20=20oe-pkgdata-util: add list-pkgs subcommand
=20=20oe-pkgdata-util: add list-pkg-files subcommand
=20=20oe-pkgdata-util: add some QA tests

Paul Gortmaker (4):
=20=20procps: disable fancy new top output mode
=20=20base-files/profile: change EDITOR to not be busybox specific
=20=20git: expand recipe to take advantage of pre-gen'd manpages
=20=20git: add basic tab completion support

Peter A. Bigot (1):
=20=20bluez5: upgrade to 5.28

Randy Witt (1):
=20=20build-compare: Add the build-compare_git.bb recipe.

Ricardo Neri (2):
=20=20rootfs.py: ignore "NOTE:" when catching warnings
=20=20runqemu: Add option for BIOS binary filename

Ricardo Ribalda Delgado (1):
=20=20cryptodev-module: Fix build on kernel v3.19

Richard Purdie (12):
=20=20libtool: Fix option parsing performance regression
=20=20autotools/siteinfo: Avoid races over siteinfo files
=20=20gcc-target: Don't install target gcc libdir files
=20=20kexec-tools: 2.0.8 -> 2.0.9
=20=20subversion: 1.8.10 -> 1.8.11
=20=20lttng-ust: 2.5.2 -> 2.6.0
=20=20libpciaccess 0.13.2 -> 0.13.3
=20=20lttng-tools: 2.5.3 -> 2.6.0
=20=20python-scons: 2.3.2 -> 2.3.4
=20=20python-pycurl: 7.19.5 -> 7.19.5.1
=20=20gst-plugins-base: Fix mulitlib packaging
=20=20e2fsprogs: Extend to add nativesdk for syslinux

Rob Woolley (1):
=20=20dhcp-client: Ignore partial checksums

Robert Yang (19):
=20=20Revert "libtool: avoid running automake/autoconf --version"
=20=20libtool: don't execute automake and autoconf on every invocation
=20=20rt-tests: fix gzip command
=20=20gcc-sanitizers: check gcc-build-internal before link
=20=20neard: do not ship version.h
=20=20btrfs-tools: remove nodocs.patch
=20=20bind: fix and enable parallel build
=20=20tcp-wrappers: fix and enable parallel build
=20=20at: fix and enable parallel build
=20=20mtools: fix and enable parallel build
=20=20pth: fix and enable parallel build
=20=20openssl: fix and enable parallel build
=20=20blktrace: fix and enable parallel build
=20=20ghostscript: fix and enable parallel build
=20=20pcmciautils: fix and enable parallel build
=20=20vala.bbclass: enable PARALLEL_MAKE
=20=20meta: enable parallel build for several recipes
=20=20coreutils 6.9: fix unknown-configure-option
=20=20syslinux: support ext2/3/4 device

Ross Burton (4):
=20=20gstreamer1.0-plugins-base: move data to the right subpackage
=20=20gstreamer1.0-plugins-good: ship equaliser presets in right package
=20=20gst-plugins-good: ship equaliser presets in right package
=20=20gstreamer-plugins: don't ship files in ${PN}

Saul Wold (3):
=20=20image_types: Error out if BTRFS image is too small
=20=20lib/oe/lsb.py: Fix up for dash
=20=20image: add new items to IMAGE_FEATURES[validitems] list

Tomas Novotny (1):
=20=20qmake_base.bbclass: fix hardcoded paths in a generated qt.conf

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Andre McCurdy (1):
=20=20zram: remove bash dependency from init script

Andreas M=C3=BCller (1):
=20=20samba: add mirrors

Armin Kuster (1):
=20=20libcap-ng: add package

Ash Charles (5):
=20=20cpufrequtils: Don't preserve host user permissions
=20=20polkit-group-rule: Add polkitd user and group
=20=20xfce4-wavelan-plugin: Specify BSD license
=20=20xfce4-xkb-plugin: Specify GPLv2 license
=20=20xfce4-diskperf-plugin: Specify BSD license

Bian Naimeng (3):
=20=20postfix: instead ${exec_prefix}/libexec/${PN} by ${libexecdir}
=20=20snmpd: instead option -LS by -Ls
=20=20php: update to 5.5.21 to fix some bugs

Chong.Lu@windriver.com (2):
=20=20syslog-ng: Add a PACKAGECONFIG for syslog-ng-libs
=20=20samba: disable service by default

Dan McGregor (4):
=20=20xserver-nodm-init: only enable for runlevel 5
=20=20lxdm: RDEPEND on libsvg-gtk
=20=20gdm: Only start in runlevel 5
=20=20dracut: recipe cleanup

Darren Hart (1):
=20=20fb-tests: Prepend fb- to the binaries

Gary Thomas (1):
=20=20rng-tools: Fixes for latest OE layouts

Holger Hans Peter Freyther (1):
=20=20libspatialite: Upgrade to version 4.2.0

Jackie Huang (3):
=20=20php: Look for libraries in ${baselib} rather than lib
=20=20rsyslog: add packageconfig for imfile module
=20=20rsyslog: don't call init script in logrotate conf file

Joe Slater (2):
=20=20geoip-perl: change local tarfile name
=20=20rsnapshot: specify where perl is on the target

Kang Kai (1):
=20=20quagga: fix typo in systemd service file

Li xin (3):
=20=20netkit-telnet: add new recipe
=20=20nana: add new recipe
=20=20opensc: add new recipe

Martin Jansa (2):
=20=20recipes: add x11 to required DISTRO_FEATURES
=20=20libpostproc: drop, moved to oe-core

MiLo (2):
=20=20python-twisted: Fix dependencies of twisted modules
=20=20python-twisted: Create a separate source code package and bin package

Paul Eggleton (2):
=20=20tmux: remove sed-native from DEPENDS
=20=20python-django: add version 1.6.10

Peter Bigot (1):
=20=20gnokii: refine selector for bluez4 package config

Philip Balister (1):
=20=20python-lxml: Use pkgconfig to find libxml2 instead of binconfig.

Robert Yang (4):
=20=20dnssec-conf: depends libxslt-native
=20=20nuttcp: fix HOMEPAGE and SRC_URI
=20=20cherokee: add PACKAGECONFIG for geoip
=20=20openldap: fix for new libtool

Ross Burton (2):
=20=20debianutils: remove, this is in oe-core now
=20=20gnome-settings-daemon: add PACKAGECONFIG for smartcard support

Roy Li (5):
=20=20postfix: start the postfix daemon by default when init is systemd
=20=20proftpd: add systemd support
=20=20mariadb: mariadb-server depends on mariadb-client
=20=20mariadb: make it be able to work with SELinux
=20=20openldap: add systemd support

Saul Wold (2):
=20=20python-pip: update to 1.5.6
=20=20python-django-south: add version 1.0.2

YangHaibo (1):
=20=20tclap: add ALLOW_EMPTY in bb file

Zhenhua Luo (1):
=20=20python-pip: add python-distribute in RDEPENDS

leimaohui (1):
=20=20mozjs_17.0.0: Fix build error in powerpc(e500v2)

mike.looijmans@topic.nl (1):
=20=20iperf3: Add native support

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Denys Dmytriyenko (2):
=20=20arago-image, packagegroup-arago-base-tisdk: move psplash to =
IMAGE_FEATURES,=20
=20=20gst-plugins-*-mm-accel: sync up on customizations between gst plugins

Franklin S. Cooper Jr (11):
=20=20sourceipk: When preserving git repository optionally create local =
branch
=20=20branding-amsdk: Add "local" branch name and commit message used by =
sourceipk
=20=20ti-tisdk-setup: Update commit to pull in various improvements
=20=20gadget-init: Remove COMPATIBLE_MACHINE
=20=20packagegroup-arago-tisdk-amsdk: Remove gadget-init
=20=20matrix-gui: Add back change foreground virtual terminal call when =
using Qt 4
=20=20quick-playground: Update Matrix description page
=20=20matrix-gui-apps: Update latest commit to pull in Matrix apps =
description cha
=20=20packagegroup-arago-tisdk-matrix: Remove dual camera and image-gallery
=20=20packagegroup-arago-tisdk-amsdk-sdk-host: Remove pinmux tool and oe =
layer set
=20=20ti-tisdk-makefile: Insure linux-dtb also use the new DEFCONFIG =
variable.

Jacob Stiffler (1):
=20=20perl-native: Fix for when shebang is too many characters.

Sam Nelson (3):
=20=20packagegroup-arago-console: Make Alsa packages depend on 'alsa' =
MACHINE_FEAT
=20=20packagegroup-arago-base: Make Alsa packages depend on 'alsa' =
MACHINE_FEATURE
=20=20packagegroup-arago-tisdk-addons: Keep switch-config only for ti33x, =
ti43x &=20

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-atmel:

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
=20=20linux-fslc: Add VFAT support for mxs defconfig

Gary Thomas (2):
=20=20fsl-alsa-plugin: Ensure kernel source is available
=20=20gst-fsl-plugin: Ensure kernel source is available

Jacob Kroon (1):
=20=20imx-gpu-viv: Don't package X11 specific tools in non-X11 =
configurations

Nikolay Dimitrov (1):
=20=20linux-imx: Disable imx6sl-specific code when imx6sl SOC support is =
disabled

Otavio Salvador (1):
=20=20linux-fslc.inc: Avoid duplication on assignments

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

Alex de Cabo (1):
=20=20linux-congatec: Update to version 3.10.53

Alfonso Tam=C3=A9s (1):
=20=20linux-wandboard: Update kernel to 3.10.53-1.1.0_ga

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-ppc:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-guacamayo:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix-community:

Andreas M=C3=BCller (4):
=20=20linux.inc: make kernel build again after work-shared changes
=20=20linux-mainline: update to 3.14.33
=20=20xserver-xf86-config: replace fbdev by modesetting
=20=20let all egl/gl/gles use mesa - running man is just an Imagination of =
EGL/GLE

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-handheld:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-igep:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

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

Carlos Rafael Giani (1):
=20=20qtwebengine: Enable ffmpegsumo for HTML5 video

Otavio Salvador (7):
=20=20qt5.inc: Fix packaging of architecture independent data
=20=20qtwebengine: Add a missing build dependency on libcap
=20=20qtwebengine: Add missing runtime dependencies for examples
=20=20qtmultimedia: Fix floating dependency gst-plugins-bad
=20=20qtmultimedia: Use 'qtCompileTest' mechanism for GStreamer
=20=20qtmultimedia: Use 'bb.utils.contains' function
=20=20qtmultimedia: Easy use of GStreamer 1.0 support

Stephan Binner (1):
=20=20qtwebchannel: Add recipes for 5.4.0 and Git

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-slugos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-systemd:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-raspberrypi:

Andrei Gherzan (2):
=20=20README: As users asked - bitbucket mirror
=20=20MOVE REPOSITORY

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

Martin Jansa (1):

Simon Busch (1):
=20=20meta-hp: linux-hp-tenderloin: remove v4l2 support

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

Denys Dmytriyenko (3):
=20=20keystone: stop backfilling rtc
=20=20multi-kernel: improve deploying additional files and sstate handling
=20=20linux-ti-staging: update to 3.14.33 with A&D, connectivity, platform =
and rpm

Karthik Ramanan (1):
=20=20vpe-tests: Add DEPENDS for the recipe

Sam Nelson (3):
=20=20common-csl-ip: Update to version 2.1.0.6
=20=20ti-ipc: Correct error in ti ipc lad daemon startup script
=20=20libp11: Add recipe for libp11

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

Nathan Rossi (3):
=20=20gcc: Consolidate 4.8 bbappends into the new gcc-source recipe
=20=20coreutils: MicroBlaze specific define no longer required
=20=20libaio: Remove MicroBlaze specific patch

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

An=C3=ADbal Lim=C3=B3n (2):
=20=20upstream_tracking.inc: Remove entries that now isn\'t needed
=20=20package_regex.inc: Cleanup and organize

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



