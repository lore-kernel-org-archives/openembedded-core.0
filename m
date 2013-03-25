Received: from new.bec-systems.com ([74.208.70.121] helo=bec-systems.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1UKDCQ-00031v-72; Mon, 25 Mar 2013 20:36:57 +0100
Received: from oh-69-34-21-229.sta.embarqhsd.net ([69.34.21.229]
	helo=happy.bec-systems.com)
	by bec-systems.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cliff.brake@gmail.com>)
	id 1UKCv5-0000nn-Ou; Mon, 25 Mar 2013 15:19:03 -0400
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Date: Mon, 25 Mar 2013 19:19:44 GMT
Message-Id: <1364239184487.2224077a@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
X-Spam_score: -2.9
X-Spam_score_int: -28
X-Spam_bar: --
Subject: OE Changelog since 2013-03-17 until 2013-03-24
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
X-List-Received-Date: Mon, 25 Mar 2013 19:36:58 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2013-03-17 until 2013-03-24.  Projects included in this =
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

Andrei Dinu (12):
=20=20cache_extra: Add extra variables
=20=20cooker: Use extra cache information
=20=20crumbs/builder: Replaced the function that displayed tooltips
=20=20hig/advancedsettingsdialog: Added information for the information =
dialogs
=20=20hig/propertydialog: new class added for the property windows.
=20=20hig/simplesettingsdialog: added entries for information dialogs
=20=20crumbs/hoblistmodel: added information columns needed for prop dialogs
=20=20hobwidget: added functionality for the information dialogs.
=20=20crumbs/imageconfigurationpage: added information so that it displays =
correct
=20=20crumbs/packageselectionpage: added event for the "All packages" tab
=20=20crumbs/recipeselectionpage: added events for the "Package Groups" =
"All recip
=20=20Adjust spacing on information windows

Cristiana Voicu (3):
=20=20hob: some settings in Hob are not remembered
=20=20hob: Hob custom image build error
=20=20hob: implementation of search functionality in Hob

Martin Jansa (1):
=20=20runqueue: Use taskData.fn_index[depdata] instead of uninitialized dep

Robert Yang (2):
=20=20monitordisk.py: monitor disks based on path
=20=20utils.py: fix BB_ENV_WHITELIST

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Alexandru DAMIAN (1):
=20=20grep: Always use locale.h

Andreas Oberritter (2):
=20=20documentation.conf: remove unused variable QA_LOG
=20=20image_types.bbclass: only create links if the target exists

Chase Maupin (1):
=20=20kernel bbclass: return to original directory in do_deploy

Chen Qi (1):
=20=20rm_work.bbclass: inhibit rm_work per recipe

Christopher Larson (3):
=20=20layer.conf: avoid unnecessary early expansion with :=3D
=20=20package_deb: don't install glibc-localedata-i18n separately
=20=20package_{ipk, deb, rpm}: drop the TARGET_OS conditional

Colin Walters (1):
=20=20cracklib: Generate compiled dict using default dictionary

Cristian Iorga (1):
=20=20linux-firmware: upgrade to git HEAD =
c530a75c1e6a472b0eb9558310b518f0dfcd8860

Darren Hart (6):
=20=20mkefidisk: Always specify a root=3D kernel parameter
=20=20mkefidisk: Cleanup comment length
=20=20mkefidisk: Boot with ro kernel parameter instead of rw
=20=20mkefidisk: Always use rootwait and document kernel parameters used
=20=20mkefidisk: Remove startup.nsh
=20=20mkefidisk: Use msdos partition tables

Emilia Ciobanu (1):
=20=20distrodata.bbclass: added some more git processing

Enrico Scholz (1):
=20=20openssl: build always with -Wa,--noexecstack

Felipe F. Tonello (2):
=20=20qt-mobility: Add bluez dependency if DISTRO_FEATURES has bluetooth
=20=20qt-mobility: Add pulseaudio dependency if DISTRO_FEATURES has =
pulseaudio

Jason Wessel (1):
=20=20syslinux.bbclass: Add a default serial console option and real boot =
menu sup

Jesse Zhang (1):
=20=20Perl packages shouldn't be allarch

Joe Slater (1):
=20=20tzcode & tzdata: update to 2013b versions

Jukka Rissanen (2):
=20=20connman-conf: Move the setup script into /usr/lib/connman
=20=20connman-conf: Avoid appending IPv4 address

Kevin Strasser (2):
=20=20archive-*-source.bbclass: fix scripts_with_logs build error
=20=20archiver: fix archive filtering behavior

Khem Raj (3):
=20=20iptables: Turn ipv6 and libnfnetlink support into PACKAGECONFIG
=20=20libuser: Use abs_srcdir instead of srcdir
=20=20sudo: Compile mksigname and mksiglist for build host

Koen Kooi (2):
=20=20mkefidisk.sh: create a proper ESP
=20=20python: fix on-target use of distutils/setuptools by removing =
references to=20

Laurentiu Palcu (1):
=20=20mesa: rename mesa-dri recipe to just mesa

Marcin Juszkiewicz (2):
=20=20nss-myhostname: add 0.3 version
=20=20coreutils: disable ACL as we do not depend on it

Mark Hatle (3):
=20=20core-image-multilib-example: Location of core-image-sato.bb changed
=20=20vte: Fix conflict between FILES_${PN}-dbg and FILES_vte-dbg
=20=20tcl: Fix the location of the installed headers

Maxin B. John (5):
=20=20lttng-modules: remove the COMPATIBLE_HOST check
=20=20lttng-tools: remove the COMPATIBLE_HOST check
=20=20babeltrace: remove the COMPATIBLE_HOST check
=20=20lttng-ust: remove the COMPATIBLE_HOST check
=20=20harfbuzz: update the license information

Olivier Guiter (1):
=20=20neard: upgrade to 0.10

Otavio Salvador (1):
=20=20linux-firmware: Package Broadcom firmwares

Paul Eggleton (5):
=20=20perl: avoid splitting out .debug directories as packages
=20=20classes/buildhistory: implement history collection for SDKs
=20=20classes/buildhistory: trim trailing spaces in file listings
=20=20packagegroup-core-tools-debug: remove rsync
=20=20packagegroup-core-tools-debug: split out Eclipse packages

Radu Moisan (13):
=20=20rxvt-unicode: Upgrade to v9.17
=20=20gawk: Upgrade to v4.0.2
=20=20ed: Upgrade to v1.7
=20=20u-boo-fw-utils: Upgrade to v2013.01.01
=20=20u-boot-mkimage: Upgrade to v2013.01.01
=20=20u-boot: Upgrade to v2013.01.01
=20=20hdparm: Upgrade to v9.43
=20=20cronie: Upgrade to v1.4.9
=20=20systemtap: Upgrade to v2.1
=20=20liburcu: Upgrade to v0.7.6
=20=20babeltrace: Upgrade to v1.0.3
=20=20apr-util: Upgrade to v1.5.1
=20=20mobile-broadband-provider-info: Upgrade to v20120614

Richard Purdie (62):
=20=20tune-xscale: Drop unneeded optimisation overrides
=20=20gcc-common: Exclude AVAILTUNES from sstate checksums
=20=20mesa-common: Fix confused variable assignment/comment
=20=20bison: Use PATH to locate m4
=20=20image.bbclass: Drop legacy export of IMAGE_BASENAME
=20=20cross-localedef-native: Fix case where ${B} !=3D ${S}
=20=20ncurses: Fix case where ${B} !=3D ${S}
=20=20binconfig: Handle the case where ${B} !=3D ${S}
=20=20psplash: Fix case where ${B} !=3D ${S}
=20=20valgrind: Fix case where ${B} !=3D ${S}
=20=20rsync: Fix case where ${B} !=3D ${S}
=20=20rpm: Fix case where ${B} !=3D ${S}
=20=20sysfsutils: Fix case where ${B} !=3D ${S}
=20=20chrpath: Fix case where ${B} !=3D ${S}
=20=20docbook-utils-native: Fix case where ${B} !=3D ${S}
=20=20e2fsprogs: Fix case where ${B} !=3D ${S}
=20=20sudo: Fix case where ${B} !=3D ${S}
=20=20nasm: Fix case where ${B} !=3D ${S} (partial)
=20=20diffstat: Fix case where ${B} !=3D ${S}
=20=20libfakekey: Update to new revision to fix ${B} !=3D ${S} issues
=20=20icu: Fix case where ${B} !=3D ${S}
=20=20libnewt: Fix ${B} !=3D ${S} (partial)
=20=20lttng-ust: Fix case where ${B} !=3D ${S}
=20=20libsdl: Fix ${B} !=3D ${S} issues
=20=20xcursor-transparent-theme: Refresh patches and ${B} !=3D ${S} fixes
=20=20distcc: Fix case where ${B} !=3D ${S}
=20=20libuucu: Remove the COMPATIBLE_HOST check
=20=20tcltk: Fix for ${B} !=3D ${S}
=20=20package: Add cachedpath optimisation
=20=20zaurusd: Update to new git version
=20=20qemu-testlib: Add python helper and simplify shell
=20=20perf: Fix parsing error
=20=20scripts/qemutestlib: Add better process debugging and fix process =
group issu
=20=20qemuimage-testlib: Fix IP address handling
=20=20qemuimage-testlib: Add delay to work around races in qemu startup
=20=20qemuimage-testlib: Add extra debugging and sanity check
=20=20runqemu: Improve error handling/exit codes
=20=20scripts/runqemu-internal: Fix lock races
=20=20scripts/qemu-testlib: Add more debugging information
=20=20libuser: Fix case where ${B} !=3D ${S}
=20=20pam: Fix case where ${B} !=3D ${S}
=20=20watchdog: Fix case where ${B} !=3D ${S}
=20=20texinfo: Fix case where ${B} !=3D ${S}
=20=20xinted: Fix case where ${B} !=3D ${S}
=20=20dpkg: Fix case where ${B} !=3D ${S}
=20=20python-pygtk: Fix case where ${B} !=3D ${S}
=20=20rpm: Fix case where ${B} !=3D ${S}
=20=20pm-utils: Fix case where ${B} !=3D ${S}
=20=20lzop: Fix case where ${B} !=3D ${S}
=20=20pth: Fix case where ${B} !=3D ${S}
=20=20mtdev: Fix case where ${B} !=3D ${S}
=20=20directfb: Fix case where ${B} !=3D ${S}
=20=20dhcp: Fix case where ${B} !=3D ${S}
=20=20babeltrace: Fix case where ${B} !=3D ${S}
=20=20base-passwd: Fix case where ${B} !=3D ${S}
=20=20apt: Fix case where ${B} !=3D ${S}
=20=20distro: Add separatebuilddir.inc
=20=20sudo: Fix out of tree builds ${B} !=3D ${S}
=20=20libpcre: Fix BUILD_CFLAGS for out of tree support
=20=20package/populate_sdk: Move functions from package_* to populate_sdk_*
=20=20valgrind: Fix out of tree builds
=20=20separatebuilddir.inc: mxsldr should never have been added to this =
list, remo

Robert Yang (4):
=20=20pm-utils: remove duplicated RDEPENDS
=20=20perl-native: remove duplicated LIC_FILES_CHKSUM
=20=20perl: remove the duplicated RDEPENDS
=20=20local.conf.sample.extended: update for disk monitor

Ross Burton (2):
=20=20consolekit: don't inherit gnome
=20=20polkit: remove

Saul Wold (7):
=20=20man-pages: Update to 3.50
=20=20lsbinitscripts: Update to 9.45
=20=20sysstat: Update to 10.1.4
=20=20libenv-perl: Update to 1.04
=20=20pigz: Update to 2.3
=20=20alsa-tools: add patch for mips since it does not have io.h
=20=20cairo: explicity disable lzo

Tom Zanussi (1):
=20=20perf: make PKGV match kernel version

Zhenhua Luo (1):
=20=20fix march sanity check issue

wenzong.fan@windriver.com (1):
=20=20layer.conf: Add LAYERVERSION and LAYERDEPENDS

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Andreas Oberritter (7):
=20=20xfsprogs: fix compile with uclibc
=20=20autofs: fix compile with uclibc
=20=20autofs: update to current patchlevel
=20=20libmusicbrainz: fix subsequent invocations of do_configure
=20=20ca-certificates: support running update-ca-certificates during =
do_rootfs
=20=20layer.conf: add ca-certificates to SIGGEN_EXCLUDERECIPES_ABISAFE
=20=20busybox: move /etc/default/busybox-syslog to ${PN}-syslog

Felipe F. Tonello (1):
=20=20fingerterm: Added 1.0.2 recipe

Jackie Huang (3):
=20=20inetutils: fix PN -> BPN in do_install for multilibs
=20=20phpmyadmin: fix PN->BPN in do_install for multilibs
=20=20netcat: fix PN -> BPN in do_install for multilibs

Jesse Zhang (1):
=20=20pptp-linux: Add dependency to fix parallel build

Joe MacDonald (2):
=20=20autofs: fix QA error when building without systemd
=20=20xl2tpd: dump 1.3.1 in favour of git version

Jukka Rissanen (1):
=20=20wpa_supplicant: Location of systemd services files changed

Khem Raj (3):
=20=20luajit: Fix build with SSTATE enabled
=20=20cronie: Rename the bbappend to match OE-Core
=20=20autofs: Fix build breakage with systemd in DISTRO_FEATURE

Koen Kooi (4):
=20=20python-numpy: add i586 *config.h files
=20=20cifs-utils: add 5.9
=20=20opencv: enable SSE1/2/3 and SSSE3 when finding '-msse3' in =
TARGET_CC_ARCH
=20=20opencv: switch to out-of-tree builds

Marcin Juszkiewicz (1):
=20=20openldap: do not strip during install

Martin Jansa (1):
=20=20xf86-video-glamo: adapt to xserver 1.14 API

Ross Burton (1):
=20=20polkit: add (taken from oe-core)

Stefan Herbrechtsmeier (1):
=20=20libtinyxml: Add native support and use relative paths

Wenzong Fan (1):
=20=20meta-networking: Add LAYERVERSION and LAYERDEPENDS

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Khem Raj (1):
=20=20angstrom-next: Ping libc headers to 3.8 to match OE-Core

Koen Kooi (1):
=20=20angstrom: Disable sysvinit for recipes with systemd support

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Denys Dmytriyenko (6):
=20=20ltp-ddt: use special branch for platforms with older <=3D3.2 kernel
=20=20u-boot 2012.10: replace recipe with bbappend, after moving to meta-ti
=20=20external-arago-sdk-toolchain: fix remaining QA issues
=20=20external-linaro-sdk-toolchain: package SDK pieces of Linaro toolchain
=20=20toolchain-external-linaro.inc: switch to packaging crosssdk components
=20=20README: call out dependent sublayers explicitly

Eyal Reizer (4):
=20=20ti-compat-wireless-wl12xx: modifiy for using r5.sp4.01 release
=20=20wl12xx-firmware: update for fetching r5.sp4.01 firmware
=20=20hostap-daemon: update for version r5.sp4.01
=20=20wpa-supplicant: update for r5.sp4.01 version

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-beagleboard:

Koen Kooi (4):
=20=20linux-mainline 3.8: sync with upstream kernel patch repo
=20=20linux-mainline 3.8: update to 3.8.4
=20=20u-boot-denx 2013.01: update to 2013.01.01
=20=20linux-mainline 3.8: add IIO and DRM patches

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-browser:

Martin Jansa (1):
=20=20libxi: rename bbappend to match new version from oe-core

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

Daiane Angolini (7):
=20=20imx6slevk: Add machine definition
=20=20u-boot (2009.08): Add imx6slevk support
=20=20linux-imx (3.0.35): Rename defconfig used for imx6q boards
=20=20linux-imx (3.0.35): Add imx6slevk support
=20=20imx6dlsabresd: Add machine definition
=20=20u-boot (2009.08): Add imx6dlsabresd support
=20=20linux-imx (3.0.35): Add imx6dlsabresd support

Gary Thomas (1):
=20=20xf86-dri-vivante: Fix build with latest X server

Otavio Salvador (12):
=20=20linux-fslc: Update to 20130318 patches-3.8's snapshot
=20=20u-boot-fslc: Disable I2C for mx28evk to fix SGTL5000
=20=20linux-imx (2.6.35.3): Fix perf build due new Linux headers use
=20=20linux-imx (2.6.35.3): Remove unused patch file
=20=20mesa-dri: Don't build EGL, GL ES and GL ES2 librarioes
=20=20mesa-dri: Drop GIT bbappend as this is not used by default
=20=20firmware-imx: Make the package machine specific
=20=20xf86-video-imxfb: Fix build using 1.14 Xorg server
=20=20xf86-video-imxfb: Add dependency on 'virtual/kernel'
=20=20mesa-dri: Fix wrong assignment for provide list change
=20=20xf86-video-imxfb-vivante: Fix build with latest X server
=20=20mesa: Rename bbappend from mesa-dri to mesa

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

John Weber (4):
=20=20linux-imx (3.0.35): wandboard: fix sdhc platform data
=20=20linux-imx (3.0.35): wandboard: replace brcm80211 driver
=20=20broadcom-nvram-config: add nvram file support
=20=20wandboard-dual: Add broadcom-nvram-support to machine

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-ppc:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-guacamayo:

Christopher Larson (1):
=20=20layer.conf: avoid unnecessary early expansion with :=3D

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix-community:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-handheld:

Andrea Adami (5):
=20=20linux-yocto_3.8: initial commit for Zaurus devices
=20=20linux-yocto-tiny-kexecboot_3.2: match the exact NOR on collie
=20=20linux-yocto-3.4: remove temporary version. Replace with 3.8
=20=20linux-yocto_3.2: match the exact NOR on collie
=20=20linux-yocto-tiny-kexecboot: add patch fixing mtd on SL-C3200

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-igep:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Laurentiu Palcu (1):
=20=20Replace references to mesa-dri with mesa in all files

Richard Purdie (1):
=20=20mesa: Update to match OE-Core mesa rename

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-java:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-kde:

Khem Raj (1):
=20=20cyrus-sasl: Make pkg_postinst/rm package specfic

Samuel Stirtzel (1):
=20=20cyrus-sasl: Remove recipe, it is already contained in meta-networking

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

Khem Raj (1):
=20=20recipes: Turn ALLOW_EMPTY to be package specific

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-qt3:

Christopher Larson (1):
=20=20layer.conf: avoid unnecessary early expansion with :=3D

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

Denys Dmytriyenko (5):
=20=20linux-omap-psp: fix alignment issue of 2.6.37 kernel with gcc-4.7
=20=20linux-omapl138: fix alignment issue of 2.6.37 kernel with gcc-4.7
=20=20linux-ti-staging: update to the latest merge of 3.8.3
=20=20ti33x: switch default preference to ti-staging tree
=20=20linux-ti33x-psp 3.1: remove an older outdated 3.1 kernel recipe for =
ti33x

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

Janne Hurskainen (1):
=20=20webos: Add WEBOS_DISTRO_API_VERSION variable

Keith Derrick (1):
=20=20openssl: Remove RDEPENDS on perl

Martin Jansa (13):
=20=20webos: Remove duplicite INHERIT settings
=20=20recipes: Use OPENWEBOS_GIT_REPO_COMPLETE where possible
=20=20recipes: Use ISIS_PROJECT_GIT_REPO_COMPLETE where possible
=20=20packagegroup-webos-extended: Introduce separate var for some deps
=20=20webos-features: Redefine DISTRO_FEATURES and split it
=20=20webos-features: Remove x11 and argp from DISTRO_FEATURES
=20=20util-linux: Use u-a for getopt
=20=20webos_cmake: Use append instead of +=3D for DEPENDS
=20=20webos_qmake: Use append instead of +=3D for DEPENDS
=20=20packagegroup-core-tools-profile: Remove some dependencies
=20=20webos-image-*: Combine debug and test images to one devel image
=20=20openssl: Remove unused patches directory
=20=20openssl: Fix u-a usage

Mikko Levonmaa (1):
=20=20webos_qmake5: Add WEBOS_INSTALL_BINS Qt variable

Suresh Arumugam (1):
=20=20webos-image: mojoloader=3D9

Tapani Mattila (1):
=20=20webos_certificates: Add bbclass to handle certificates

Yegor Minin (1):
=20=20webosvbox: Look for default image in local dir first

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

Christopher Larson (1):
=20=20layer.conf: avoid unnecessary early expansion with :=3D

Elvis Dowson (11):
=20=20xilinx-kernel.bbclass: Skip locating device tree file if already =
specified.
=20=20external-xilinx-toolchain: Comment out RPROVIDES.
=20=20util-linux: rename file to util-linux_2.22.2.bbappend
=20=20zynq-7: Add support for Xilinx Zynq-7 base definitions.
=20=20zynq-7: Add support for Xilinx ZC702 development platform.
=20=20zynq-7: Add support for Xilinx ZC706 development platform.
=20=20u-boot-xilinx: Add u-boot-xilinx-2012.10
=20=20u-boot-xilinx: Update u-boot-xilinx_git.bb recipe.
=20=20linux-xilinx: Add support for linux-xilinx-3.6.0
=20=20linux-xilinx_git: Update to master-next branch, commit id: =
c0265c7446eeedb19
=20=20linux-libc-headers: Add linux-libc-headers_3.6.bb recipe.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Christopher Larson (1):
=20=20layer.conf: avoid unnecessary early expansion with :=3D

Cristian Iorga (5):
=20=20upstream-tracking: added glib-2.0 no update reason
=20=20upstream-tracking: added polkit no upgrade reason
=20=20upstream-tracking: added bluez no-update reason
=20=20tremor: added no update reason
=20=20upstream-tracking: added dbus no-update reason

Emilia Ciobanu (1):
=20=20package_regex.inc: added new regexes

Laurentiu Palcu (3):
=20=20scripts/lib/bsp: replace mesa-dri with mesa in machine.conf files
=20=20atom-pc.conf: replace mesa-dri with mesa
=20=20(distro-alias|maintainers|package-regex).inc: mesa-dri -> mesa

Michel Thebeau (1):
=20=20routerstationpro: use KERNEL_IMAGE_MAXSIZE to test the image

Paul Eggleton (1):
=20=20packagegroup-core-tools-debug: split out Eclipse packages

Richard Purdie (1):
=20=20poky.conf: Include separatebuilddir.inc

Robert Yang (3):
=20=20maintainers.inc: remove several duplicated lines
=20=20poky-floating-revisions.inc: remove the duplicated =
SRCREV_pn-exmap-console
=20=20local.conf.sample.extended: update for disk monitor

Tom Zanussi (18):
=20=20yocto-bsp: add 3.8/remove 3.2 kernel from templates
=20=20yocto-bsp: update default custom kernel
=20=20scripts/lib/bsp/engine.py: update map_standard_kbranch()
=20=20yocto-bsp: use map_standard_branch()
=20=20scripts/lib/bsp/engine.py: add preempt-rt and tiny to =
map_standard_kbranch()
=20=20yocto-bsp: update machine-standard.scc
=20=20yocto-bsp: update 3.4 .bbappends
=20=20yocto-bsp: update machine-preempt-rt.scc
=20=20yocto-bsp: update linux-yocto-rt_3.4 .bbappends
=20=20yocto-bsp: add support for tiny
=20=20yocto-bsp: add support for linux-yocto-dev
=20=20yocto-bsp: upgrade i386 template with emgd 1.16
=20=20yocto-kernel: add support for kernel feature add/rm/list
=20=20yocto-kernel: add support for listing available kernel features
=20=20yocto-kernel: add support for printing kernel feature descriptions
=20=20yocto-kernel: add support for creating recipe-space kernel features
=20=20yocto-kernel: add support for destroying recipe-space kernel features
=20=20yocto-bsp: add machine-user-features.scc to templates

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:




