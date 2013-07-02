Return-Path: <cliff.brake@gmail.com>
Received: from bec-systems.com (new.bec-systems.com [74.208.70.121])
	by mail.openembedded.org (Postfix) with ESMTP id 03B816ABBB;
	Tue,  2 Jul 2013 02:28:47 +0000 (UTC)
Received: from oh-67-76-203-50.sta.embarqhsd.net ([67.76.203.50]
	helo=happy.bec-systems.com)
	by bec-systems.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cliff.brake@gmail.com>)
	id 1UtqGb-0005Jo-FR; Mon, 01 Jul 2013 22:24:37 -0400
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Date: Tue, 02 Jul 2013 02:28:30 GMT
Message-Id: <1372732110508.5c7c5c0f@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
X-Spam_score: -2.9
X-Spam_score_int: -28
X-Spam_bar: --
Subject: OE Changelog since 2013-06-23 until 2013-06-30
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
X-List-Received-Date: Tue, 02 Jul 2013 02:28:48 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2013-06-23 until 2013-06-30.  Projects included in this =
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

Cristiana Voicu (1):
=20=20bitbake: adding a new comment should be placed on a new line

Li Wang (1):
=20=20bitbake: python funcname can not include special character @

Richard Purdie (1):
=20=20cookerdata: Improve message if BBPATH is unset and bblayers.conf not =
found

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Adrian Dudau (1):
=20=20dbus-ptest: Install missing files

Alex Olson (1):
=20=20udev: only use devtmpfs for udev

Bj=C3=B6rn Stenberg (3):
=20=20bash ptest: Sed away the Makefile dependency to remove error messages.
=20=20busybox: Add ptest
=20=20bzip2: Add ptest

Bruce Ashfield (4):
=20=20linux-yocto/3.4: allow kernel feature _appends to be overriden
=20=20linux-yocto/3.8: add USB screen configuration and net sched options
=20=20linux-yocto/3.4: ltsi: sync to LTSI commit 5f05247ed
=20=20linux-yocto-dev: bump version to 3.10+

Chen Qi (12):
=20=20busybox: remove the postinst part of the recipe
=20=20busybox: add support for CONFIG_FEATURE_INDIVIDUAL
=20=20busybox: add a config fragment to enable login utilities
=20=20busybox: enable to list suid and non-suid app configs
=20=20busybox: add the ability to split the busybox binary
=20=20packagegroup-core-boot: use busybox as the default login manager
=20=20packagegroup-core-basic: set the default login manager
=20=20mingetty: lower the ALTERNATIVE_PRIORITY
=20=20tinylogin: remove recipe
=20=20udev-cache: fix to use udev-cache correctly
=20=20initrdscripts: unionfs cleanup
=20=20init-live.sh: try to make a union mount when possible

Enrico Scholz (1):
=20=20image_types.bbclass: set 'filetype' ext4 feature

Hongxu Jia (5):
=20=20init-live.sh: fix automount failed occasionally
=20=20lsbtest: sync test suite packages version
=20=20adt_installer_internal: fix perl modules relocated failed on older =
distribut
=20=20adt_installer_internal:fix perl lib version mismatch
=20=20adt_installer_internal:add sudo when permission deny on installation =
directo

Jackie Huang (1):
=20=20libproxy_0.4.7 do_unpack failed of qemuppc_world

Jesse Zhang (3):
=20=20rt-tests: fix error check in hackbench
=20=20ltp: update to new release
=20=20gst-ffmpeg: fix libav config error for ppc

Jonathan Liu (1):
=20=20libx11: enable Xcms by default

Kai Kang (6):
=20=20openjade-native: fix build failure
=20=20python-pygobject: disable parallel install
=20=20python-pygtk: fix parallel compile issue
=20=20cleanup-workdir: fix typo
=20=20qt4*.bbclass: disable build qt on mips64 with 64 bits userspace
=20=20Disable build qt related packagegroups on mips64 with 64 bits =
userspace

Khem Raj (2):
=20=20libbsd: Add recipes for libbsd - utility functions from BSD systems
=20=20gcc-4.8: Fix ICE on ppc/spe targets

Laurentiu Palcu (1):
=20=20populate_sdk_base, adt_installer: abort install if path contains =
spaces

Lukas Bulwahn (2):
=20=20python-argparse: adding runtime dependency on python-codecs
=20=20python-multiprocessing: adding runtime dependencies

Mark Hatle (6):
=20=20systemtap: Systemtap can not be build w -O0 optimization
=20=20gcc: When cross compiling a target gcc, target flags may be used on =
the host
=20=20buildtools-tarball: Change the way the SDK is sanitized
=20=20make: Fix second part of bug Savannah 30612
=20=20buildtools-tarball: Add nativesdk-make
=20=20sanity.bbclass: Check for the known broken version of make

Martin Jansa (1):
=20=20boost: Limit PARALLEL_MAKE by -j 64

Mikhail Durnev (2):
=20=20shadow-native: Add --root option in groupmems
=20=20useradd.bbclass: Add members to a group

Otavio Salvador (1):
=20=20alsa-tools: Pass ACLOCAL_FLAGS so aclocal uses the right params

Paul Eggleton (1):
=20=20classes/insane: remove la2 check which no longer exists from ERROR_QA

Randy Witt (1):
=20=20systemctl: Support all unit types in the directives.

Richard Purdie (8):
=20=20Sync with PRINC removal from meta-intel
=20=20sanity.bbclass: Drop horrible obsolete minversion hack
=20=20sanity.bbclass: Various improvements
=20=20linux-firmware: Package some iwlwifi firmware separately
=20=20sanity.bbclass: Add check for @ character in build directory name
=20=20sanity.bbclass: Fix COREBASE sanity tests
=20=20package: Ensure we iterate all the pool objects
=20=20packagedata: Show error when trying to change PE/PV/PR from =
runtime/pkgdata

Ross Burton (14):
=20=20weston-init: fix a typo in a user-visible message
=20=20weston: add patches to make weston-launch work
=20=20mesa: remove a redundant do_install tweak
=20=20weston: move mtdev dependency to the DRM backend, where it belongs
=20=20cogl: add Wayland support
=20=20clutter: add Wayland support
=20=20core-image-weston: add clutter examples
=20=20libpam: fix whitespace in shell function
=20=20libpam: check if PAM is enabled when building
=20=20gst-plugins-bad: use correct option when enabling librsvg
=20=20gst-plugins-bad: tremor was moved from here to -base
=20=20gst-plugins-base: element selection rationalisation
=20=20gst-plugins-bad: element selection rationalisation
=20=20gdk-pixbuf: add a wrapper for gdk-pixbuf-pixdata

Roy.Li (3):
=20=20qt-mobility: remove /usr/lib from ld rpath-link option
=20=20base-files: create /usr/lib/locale dir
=20=20autotools.bbclass: force copy Makefile.in.in to ${S}/po/

Saul Wold (3):
=20=20chrpath: Fix SRC_URI to correct location
=20=20systemd: Ensure that we mount devtmpfs
=20=20tcmode-default: Set GCC 4.8 as default

Wenzong Fan (2):
=20=20logrotate: fix for CVE-2011-1548
=20=20ghostscript: upgrade to 9.07

Zhenhua Luo (1):
=20=20groff: correct the install path of man.local

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Andrea Adami (1):
=20=20cramfs_1.1: fix fetch error of cramfs-native

Diego Rondini (1):
=20=20glmark2: Add recipe for glmark2

Fahad Usman (1):
=20=20tracker: add new recipe

Holger Hans Peter Freyther (1):
=20=20gpsd: Mark the configuration file as a CONFFILES

Jack Mitchell (1):
=20=20Hiawatha: update to 9.2

Khem Raj (4):
=20=20libzip: Upgrade 1.13 -> 1.14
=20=20netcat-openbsd: Update to 1.105
=20=20proj: Update to 4.8.0
=20=20ruby: Upgrade from 1.9.3-p194 -> 1.9.3-p429

Marc Ferland (1):
=20=20lmsensors: fix fancontrol init script

Martin Jansa (1):
=20=20webkit-efl: Update patch to fix undefined hasTagName reference

Paul Barker (8):
=20=20lzip: add mirror for older versions
=20=20openmotif: update SRC_URI
=20=20mplayer2: replace ENTERPRISE_DISTRO with PACKAGECONFIG options
=20=20libsdl-mixer: replace ENTERPRISE_DISTRO with PACKAGECONFIG options
=20=20libav: remove unnecessary dependency on liba52
=20=20vlc: replace ENTERPRISE_DISTRO with PACKAGECONFIG options
=20=20mpd: replace ENTERPRISE_DISTRO with PACKAGECONFIG options
=20=20enjoy: replace ENTERPRISE_DISTRO with PACKAGECONFIG options

Paul Eggleton (2):
=20=20pinpoint: fix and update
=20=20clutter-box2d: fix for recent clutter changes in OE-Core

Philip Balister (1):
=20=20gnuradio: Update to 3.6.5. Also fix for docs, packaging, and grc =
RDEPENDS.

Roy.Li (1):
=20=20cyrus-sasl: Avoid to call AC_TRY_RUN

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Khem Raj (4):
=20=20angstrom-next: Use qemu 1.5.0
=20=20psplash: Correct the SRC_URI
=20=20bigbuckbunny: Add LIC_FILES_CHKSUM and use right version of CC-BY
=20=20images: Repace tinylogin with busybox

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Denys Dmytriyenko (2):
=20=20arago-core-tisdk-image: handle secondary bootloader for omapl138
=20=20tisdk-image: add handling for SPL/UART version of the bootloader, if =
exists

Franklin S. Cooper Jr (6):
=20=20av-examples: Pull in updated commit to fix the CCS project file.
=20=20am-sysinfo: Pull in updated commit to fix the CCS project file.
=20=20arm-benchmarks: Pull in updated commit to fix the CCS project file.
=20=20ti-crypto-examples: Pull in updated commit to fix the CCS project =
file.
=20=20ti-crypto-examples: Remove unneeded variable
=20=20oprofile-example: Pull in Makefile and CCS project changes

Siddharth Heroor (2):
=20=20meta-arago-distro: recipes-kernel - Overlay Arago info
=20=20glsdk: add the initial GLSDK branding policy

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-beagleboard:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-browser:

Khem Raj (2):
=20=20chromium: Remove older recipes
=20=20libxi_1.7.1.bbappend: Remove

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

Andrei Gherzan (1):
=20=20gpu-viv-bin-mx6q.inc: Add linked libraries to libGAL to DEPENDS

Daiane Angolini (1):
=20=20amd-gpu-mx51.inc: install dev symbolic link

Thomas Senyk (2):
=20=20gpu-viv-bin-mx6q: Add -lEGL and -lGAL to glesv2.pc and glesv1_cm.pc
=20=20gpu-viv-bin-mx6q: fixing pkg-config files for non-x11 builds.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-ppc:

Chunrong Guo (4):
=20=20add p1023rdb support
=20=20Add P1025TWR support
=20=20Add BSC9131RDB support
=20=20Add BSC9132QDS support

Khem Raj (1):
=20=20recipes: make meta-fsl-ppc play with other layers

Zhenhua Luo (10):
=20=20qemu: upgrade to the version of sdk-1.4
=20=20udev-extraconf: unify the name of PCIe Ethernet port for DPAA targets
=20=20udev-extraconf: fix the name conflict of macless and PCIe Ethernet =
port in s
=20=20flib: upgrade to the SHA of sdk-1.4
=20=20asf: add recipe
=20=20cst: add recipe
=20=20mux-server: add recipe
=20=20qoriq-debug: add recipe
=20=20skmm: add recipe
=20=20web-sysmon: add recipe

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-guacamayo:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix-community:

Andreas M=C3=BCller (1):
=20=20linux-omap-3.5: make kernel bootable for builds based on gcc-4.8

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-handheld:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-igep:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Khem Raj (1):
=20=20recipes: Mark x86 specific recipes so

Richard Purdie (3):
=20=20meta-intel: Drop PRINC usage
=20=20meta-tlk/psplash: Drop uneeded DEPENDS
=20=20common/linux-firmware: Drop bbappend since changes were merged into =
the core

Ross Burton (3):
=20=20intel-gpu-tools: add new package
=20=20lms8: handle different host setups
=20=20meta-nuc: don't install lms8 as NUC doesn't support AMT

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

Holger Behrens (1):
=20=20packagegroup-core-boot-genivi: use busybox as the default login =
manager

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

Khem Raj (1):
=20=20apex-env: Add LIC_FILES_CHKSUM

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-opie:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-qt3:

Hongxu Jia (1):
=20=20qt-x11-free: add missing DEPENDS on libglu for LSB Library Check

Paul Eggleton (1):
=20=20README: include standard layer information

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-qt5:

Martin Jansa (1):
=20=20qtwebkit: Disable debug info by default

Philip Craig (1):
=20=20qtbase: disable fontconfig support by default

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

Denys Dmytriyenko (1):
=20=20u-boot: add support for SPL UART variant

Siddharth Heroor (1):
=20=20recipes-kernel: Add GLSDK specific kernel tree for omap-a15

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

Minjung Kim (1):
=20=20linux-yocto: enable an AC-97 audio controller driver

Roger Stringer (1):
=20=20db8=3D74

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Paul Eggleton (2):
=20=20poky.conf: remove la2 check which no longer exists from ERROR_QA
=20=20poky.conf: fix WARN_QA and ERROR_QA settings

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



