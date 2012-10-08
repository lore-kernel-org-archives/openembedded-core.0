Received: from new.bec-systems.com ([74.208.70.121] helo=bec-systems.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1TLF0L-0008BR-73; Mon, 08 Oct 2012 17:12:26 +0200
Received: from oh-69-34-21-229.sta.embarqhsd.net ([69.34.21.229]
	helo=happy.bec-systems.com)
	by bec-systems.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cliff.brake@gmail.com>)
	id 1TLEg3-0002Np-Ef; Mon, 08 Oct 2012 10:51:30 -0400
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Date: Mon, 08 Oct 2012 14:59:08 GMT
Message-Id: <1349708348431.7dc8d6fb@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
X-Spam_score: -2.9
X-Spam_score_int: -28
X-Spam_bar: --
Subject: OE Changelog since 2012-09-30 until 2012-10-07
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
X-List-Received-Date: Mon, 08 Oct 2012 15:12:26 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2012-09-30 until 2012-10-07.  Projects included in this =
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
meta-webos: git://github.com/openwebos/meta-webos.git
meta-arago: git://arago-project.org/git/meta-arago.git
meta-ivi: git://git.yoctoproject.org/meta-ivi
meta-systemd: git://git.yoctoproject.org/meta-systemd
meta-guacamayo: git://github.com/Guacamayo/meta-guacamayo.git

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for bitbake:

Bogdan Marinescu (1):
=20=20hob: Further improvements to hob dialogs

Constantin Musca (4):
=20=20hob: Fix 'User selected' tag functionality
=20=20hob/hobpages: Generate the title label every time
=20=20hob/imagedetailspage: disable the deploy tool for qemu machines
=20=20hob/hobeventhandler: Throw an exception if runCommand fails

Cristian Iorga (1):
=20=20hob: Improved behavior for error reporting window

Cristiana Voicu (2):
=20=20hob/settings: Change the 'Delete' button behaviour in the shared =
state setti
=20=20hob/settings: alignment and spacing fixes on "Shared state" tab

Ioana Grigoropol (2):
=20=20hob/image_details: Remove kernel info from details
=20=20hob/image_details/run_image: Kernel must be set

Mark Hatle (2):
=20=20utils.py: Check for duplicate dependency entries
=20=20utils.py: Allow explode_dep_versions comparisons to have arbitrary =
whitespac

Paul Eggleton (1):
=20=20fetch2: raise an exception if user specifies protocol=3Dgit with =
http://

Richard Purdie (4):
=20=20utils: Add explode_dep_versions2 to replace explode_dep_versions
=20=20tests/utils: Add test for explode_dep_versions2
=20=20Update version to 1.16.0
=20=20providers.py: Fix PREFERRED_VERSION containing epochs

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Bogdan Marinescu (1):
=20=20sanity.bbclass: Fix invalid test for network error

Cristian Iorga (1):
=20=20qemu: Fixed running QEMU with virtio error reporting

Daniel Stone (1):
=20=20libdrm: Remove Cairo dependency

Darren Hart (1):
=20=20linux-yocto-custom: Clarify defconfig usage

Elizabeth Flanagan (1):
=20=20bzip2 and busybox: Incorrect LICENSE

Flanagan, Elizabeth (1):
=20=20common-licenses: Adding bzip

Khem Raj (1):
=20=20toolchain-scripts.bbclass: Export M4

Laurentiu Palcu (2):
=20=20qemu: add wrapper for qemu-mips binary
=20=20cross-canadian.bbclass: add native chrpath dependency

Mark Hatle (9):
=20=20libxcb: Update DEPENDS to avoid duplicate entries
=20=20rpm-native: Fix 'uuid_rc_t' undeclared error when compiling
=20=20rpm: Fix file contention issue
=20=20rpm: Add rpm patch to fix git_strerror issues
=20=20rpm: Implement workaround for DB_BUFFER_SMALL error
=20=20Cleanup: fix PN =3D=3D BPN cases
=20=20multilib: Move redefinition of STAGING_DIR_KERNEL
=20=20package_deb/ipk: Remap < and > to << and >>
=20=20package_rpm.bbclass: Fix an issue where complementary installs fail

Martin Jansa (11):
=20=20opkg: fix version constraints in conflicts, depends, replaces
=20=20qt4-tools-nativesdk.inc: rename to nativesdk-qt4-tools.inc
=20=20qt4: use releases.qt-project.org instead of get.qt.nokia.com
=20=20qt4: rename qt-4.8.1 to qt4-4.8.1 to match other .inc and .bb
=20=20qt4.inc: move more options to separate variables
=20=20qt-mobility: move qt-mobility patches to separate dir
=20=20qt4: move patches from files to qt4-4.8.1
=20=20qt4: drop patches not used in any recipe
=20=20qt4: replace all local patches with git patches with headers
=20=20qt4: PR bumps
=20=20qt4: add 4.8.3 version with negative D_P

Matthew McClintock (2):
=20=20libx11.inc: fix build issues for older CentOS distros
=20=20binutils.inc: add vardep on multiarch DISTRO_FEATURE

Mike Crowe (1):
=20=20bitbake.conf: Add CCACHE_DISABLE to BS_HASHBASE_WHITELIST

Otavio Salvador (1):
=20=20oe-buildenv-internal: Add BB_NO_NETWORK to BB_ENV_EXTRAWHITE

Paul Eggleton (4):
=20=20gst-ffmpeg: add LICENSE_FLAGS
=20=20buildhistory_analysis: update to use explode_dep_versions2()
=20=20rpmresolve: fix reporting of multiple matches error
=20=20build-appliance-image: Fix spacing in DESCRIPTION

Phil Blundell (4):
=20=20opkg: Don't call sync() when installing into an offline root
=20=20opkg-native: remove spurious dependency on curl-native
=20=20libart-lgpl: add art_config.h for mipsel
=20=20e2fsprogs: Don't install findfs

Richard Purdie (17):
=20=20gdk-pixbuf: Ensure gdk-pixbuf-native dependencies are correct with =
linuxstdb
=20=20sanity.conf: Require bitbake 1.16.0 (stable series) prior to release =
(and fo
=20=20insane.bbclass: Remove copy and paste confusion when using OVERRIDES
=20=20classes: Update to use corrected bb.utils.explode_dep_versions2 API
=20=20opkg: Drop nogpg version since the main version now has nogpg too
=20=20opkg: Convert select-higher-version option to prefer-arch-to-version
=20=20scripts/oe-buildenv-internal: Ensure we detect the SDK/ADT and error =
out
=20=20bitbake.conf: Add chrpath-native to ASSUME_PROVIDED
=20=20gzip: The native version should provide gzip-replacement-native
=20=20chrpath: We should provide chrpath-replacement-native and install =
into a nat
=20=20nativesdk.bbclass: Ensure we have chrpath >=3D0.14
=20=20busybox: Add missing INITSCRIPT_NAME_${PN}-hwclock
=20=20qt4: Avoid circular dependencies with multilib
=20=20package.bbclass: Fix regression in -dbg packages introduced by =
explode_dep_v
=20=20libdrm: Explicitly disable the cairo dependency
=20=20sstate: Normalise paths before comparing with the whitelist
=20=20sstate: Add extra entries to the sstate duplicate files whitelist

Ross Burton (7):
=20=20galago: remove
=20=20libpcap: add dependency on libnl
=20=20Revert "initrd: Spawn an emergency shell when something goes wrong"
=20=20xf86-video-intel: drop libxvmc dependency
=20=20wpa-supplicant: don't break the DBus service file
=20=20sato-icon-theme: use gtk-icon-cache helper class
=20=20shutdown-desktop: ensure the postinst script succeeds

Saul Wold (2):
=20=20distrodata: Update distrocheck functions
=20=20pulseaudio: ensure X11 and consolekit are disabled

Scott Garman (3):
=20=20runqemu-export-rootfs: use consistent whitespace
=20=20runqemu-export-rootfs: improve rpcbind error detection
=20=20runqemu: allow multiple unfs instances to run simultaneously

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Andrei Gherzan (1):
=20=20talloc: Fix swig interface install path

Gary Thomas (1):
=20=20media-ctl: Update to latest upstream to fix build with latest =
autotools

Koen Kooi (1):
=20=20Merge remote-tracking branch =
'meta-oe-contrib/paule/meta-webserver-add'

Martin Jansa (8):
=20=20re2c: import from oe-classic
=20=20azy: add LIC_FILES_CHKSUM
=20=20azy: fix do_configure
=20=20elmdentica: add LIC_FILES_CHKSUM
=20=20foxtrotgps: rename configure.in only if it still exists
=20=20portaudio: update SRC_URI
=20=20qt4: add bbappends also for 4.8.3 version
=20=20python-pyqt: upgrade to 4.9.5

Otavio Salvador (12):
=20=20lockdev: Add recipe based on upcoming 1.0.4 version
=20=20libcec: Update to 1.9.0 version
=20=20libtinyxml: Add recipe for 2.6.2
=20=20libav: Convert to use dynamic packages to split libraries
=20=20libav: Drop 0.6.5 version
=20=20libav: Update to 0.8.3 version
=20=20mpd: bump PR due libav update
=20=20sox: bump PR due libav update
=20=20gst-ffmpeg: bump PR due libav update
=20=20mplayer2: bump PR due libav update
=20=20vlc: bump PR due libav update
=20=20opencv: bump PR due libav update

Paul Eggleton (5):
=20=20zeroconf: add from OE-Core
=20=20Add meta-webserver layer
=20=20apache2: add from OE-Classic, update to version 2.4.2 and fix
=20=20modphp: add from OE-Classic, update to 5.3.14 and fix
=20=20xdebug: add new recipe

jackie huang (1):
=20=20ptpd: update to 2.2.0

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

Martin Jansa (6):
=20=20linux-gta04: bump SRCREV_init to latest
=20=20android-image-utils: inherit deploy
=20=20rm_old_work: add work around for gcc shared workdir

Simon Busch (16):
=20=20meta-samsung: alsa-ucm-conf-tuna: add ALSA ucm configurations for the =
tuna m
=20=20meta-samsung: tuna: add alsa-ucm-conf-tuna to MACHINE_EXTRA_RDEPENDS
=20=20meta-samsung: tuna: add ext4 to IMAGE_FSTYPES
=20=20meta-samsung: samsung-tuna-firmware: drop unneeded SMC PA key file =
from firm
=20=20meta-samsung: libgles-omap4: update to install some more necessary =
files
=20=20meta-samsung: udev-extraconf: add udev rule to ignore HDMI audio =
device in p
=20=20meta-samsung: samsung-modem-mgr: bump SRCREV for latest version
=20=20meta-android: add recipe for libhybris a solution to allow use of =
bionic bas
=20=20libgles-android: properitary opengl es implementation from android
=20=20conf: machine: tuna: choose libhybris as provider for egl/gles2
=20=20meta-samsung: libgles-android: fix DEPENDS usage syntax
=20=20meta-samsung: libgles-android: install needed things into the right =
place
=20=20meta-samsung: libgles-android: provide init script to initialize =
powervr chi
=20=20meta-samsung: libgles-android: merge libhybris into so we don't have =
depende
=20=20libgles-android: add RREPLACES_${PN} lines to get an upgrade path =
from libhy
=20=20meta-samsung: libgles-android: use newer version of libhybris

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-micro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-slugos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nslu2:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Kishore Bodke (1):
=20=20meta-crystalforest: Create a custom build Image recipe.

Mihai Lindner (2):
=20=20meta-tlk: fix ignored SRC_URI appends
=20=20meta-tlk: fix included file name

Nitin A Kamble (5):
=20=20sugarbay: uprev v3.4 kernel commit ids
=20=20chiefriver: uprev v3.4 kernel commit ids
=20=20emenlow: uprev v3.4 kernel commit ids
=20=20fishriver: uprev v3.4 kernel commit ids
=20=20jasperforest: uprev v3.4 kernel commit ids

Ross Burton (3):
=20=20meta-emenlow: add missing exa dependency
=20=20meta-emenlow: don't set virtual/libx11 provider
=20=20meta-cedartrail: add missing dependency on EXA module to X driver

Tom Zanussi (5):
=20=20meta-intel: use FILESEXTRAPATHS for xserver-xf86-config bbappends
=20=20gst-va-intel: incude gst-ffmpeg only if 'commercial' is whitelisted
=20=20meta-crownbay: add 3.4 rt support
=20=20meta-crownbay: remove -rt smp options from recipe-space
=20=20meta-crownbay: remove 3.0 kernel support

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-handheld:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-opie:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-bug:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-efikamx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ettus:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-ppc:

Khem Raj (1):
=20=20machines: Recommend u-boot using MACHINE_EXTRA_RRECOMMENDS

Matthew McClintock (1):
=20=20linux-qoriq-sdk.inc: skip arch QA since kernel might not match for =
64-bit ke

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-igep:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-netbookpro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-chicken:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-java:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-qt3:

Richard Purdie (1):
=20=20qt3: Avoid circular dependencies with multilib

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-telephony:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Koen Kooi (2):
=20=20gst-plugins: enable ORC
=20=20gst-plugins-bad: disable directfb, it doesn't build

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-browser:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-mono:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-raspberrypi:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-kde:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Constantin Musca (1):
=20=20poky-sanity.bbclass: bblayers.conf should be updated automatically

Paul Eggleton (1):
=20=20poky.conf: supported distro warning update

Richard Purdie (2):
=20=20poky.conf: Clarify DISTRO_NAME to be less confusing
=20=20poky.conf: Remove git proxy configuration check url

Ross Burton (1):
=20=20distro-tracking: remove mesa-xlib

Saul Wold (2):
=20=20distro_alias: Update for 1.3 BOM Creation
=20=20poky.conf: fix Poky release info to include release number

Tom Zanussi (2):
=20=20yocto-bsp: use FILESEXTRAPATHS for xserver-xf86-config bbappends
=20=20yocto-bsp: remove 'test' options from user-config.cfg

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

Eric Blade (3):
=20=20add missing etc/prefs, service files for system / service configs
=20=20fix broken library mapping from prior
=20=20Update PR for luna-prefs

Herb Kuta (7):
=20=20Correct Open webOS release name to be 1.0
=20=20Remove unsupported architectures from conf/distro/webos.conf
=20=20Fix for empty SONAME record in webkit-webos shared library
=20=20Remove unused MACHINE-s webosarm and webosx86
=20=20Remove assignments to unused variable OPENWEBOS_TARGET
=20=20Remove unused conf/distro/webos-main.conf
=20=20Remove unneeded conf/*.sample files

Kimmo Leppala (1):
=20=20Add smartkey-hun recipe & Install hunspell headers

Roger Stringer (2):
=20=20Modify font and wallpaper install process
=20=20Increment tag for DB8 to fix qemuarm build issue

Sapna Todwal (1):
=20=20Upgrade cmake-modules-webos to RC4 submission 12

Simon Busch (2):
=20=20libtinyxml: correct naming of zlib license to match correct license =
provider
=20=20libtinyxml: add -fPIC to CXXFLAGS to avoid compilation errors

Sravan Sandela (1):
=20=20webos-image submission: browserserver=3D0.7, webkit-webos=3D0.54

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Chase Maupin (1):
=20=20bluez4: Update append version to 4.101

Denys Dmytriyenko (5):
=20=20distro: provide TCLIBC configuration for external-arago-toolchain
=20=20python-m2crypto: fix wrong checksums and failing patches
=20=20curl: switch configuration from GnuTLS to OpenSSL
=20=20distro: cover possible console options for 'arago' unified machines
=20=20recipes: RDEPENDS is package-specific var, so add _${PN}

Franklin S. Cooper Jr (17):
=20=20softap-udhcpd-config: Add udhcpd config option
=20=20softap-udhcpd-config: Add Arago specific tweaks
=20=20hostap-daemon: Port TI customized hostap-daemon recipe
=20=20wpa-supplicant: Port TI customized version of wpa-supplicant
=20=20wpa-gui-e: Port wpa-gui-e recipe from oe-classic
=20=20ti-wifi-utils: Port ti-wifi-utils from arago
=20=20recipes: Add license to Wifi and Bluetooth demo applications license
=20=20wl1271-demo: Port wl1271-demo recipe
=20=20oppserver: Port oppserver recipe
=20=20wpa-supplicant: Add TSU exemption
=20=20wpa-gui-e: Add arago specific tweaks
=20=20matrix: Update port
=20=20matrix-gui-ethernet-demos: Add Matrix ethernet demos
=20=20arago: Add wlan related preferred versions
=20=20gconf: Remove gtk dependency
=20=20gst-plugins-good: Remove gtk dependency
=20=20arago: Mask meta-oe lighttpd bbappend

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

Andrei Gherzan (4):
=20=20ecryptfs-utils: Add missing dependency to openssl
=20=20layer-management: Remove useless LDPRELOAD and add a sleep to wait =
for X
=20=20xorg-xserver: Let service be stopped and tweak description
=20=20layer-management: Use dbus type and BusName in systemd service

Florin Sarbu (2):
=20=20Remove extra " from the DLT-daemon and fuse recipes
=20=20node-startup-controller: Added version 1.0.1

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-systemd:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-guacamayo:

Tomas Frydrych (1):
=20=20ca-certificates: updated to 20120623




