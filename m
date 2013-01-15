Received: from new.bec-systems.com ([74.208.70.121] helo=bec-systems.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1Tv8Be-00071N-2Y; Tue, 15 Jan 2013 16:12:31 +0100
Received: from oh-69-34-21-229.sta.embarqhsd.net ([69.34.21.229]
	helo=happy.bec-systems.com)
	by bec-systems.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cliff.brake@gmail.com>)
	id 1Tv7m8-0007hi-JI; Tue, 15 Jan 2013 09:46:07 -0500
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Date: Tue, 15 Jan 2013 14:56:55 GMT
Message-Id: <1358261815421.7a40b31@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
X-Spam_score: -2.9
X-Spam_score_int: -28
X-Spam_bar: --
Subject: OE Changelog since 2013-01-06 until 2013-01-13
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
X-List-Received-Date: Tue, 15 Jan 2013 15:12:32 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2013-01-06 until 2013-01-13.  Projects included in this =
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

Richard Purdie (1):
=20=20build.py: Fix traceback when there are no dependencies

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Andrei Gherzan (1):
=20=20directfb: Rename __no_instrument_function__ macro to avoid =
conflicting redef

Bogdan Marinescu (11):
=20=20scons: updated to 2.2.0
=20=20tcl: updated to version 8.5.13
=20=20oprofile: updated to 0.9.8
=20=20git: updated to 1.8.0.2
=20=20guile: add explicit dependency to avoid parallel build issue
=20=20python-smartpm: add dependency on python-pprint
=20=20byacc: updated to 20121003
=20=20nasm: updated to 2.10.07
=20=20lsof: updated to 4.87
=20=20lttng-2.0: components updated to version 2.1.0
=20=20bdwgc: updated to version 7.2d

Bruce Ashfield (4):
=20=20linux-yocto/3.4: integrate v3.4.21, v3.4.22, v3.4.23
=20=20linux-yocto/3.4: update to v3.4.24
=20=20linux-libc-headers: make 3.7 the default and remove older libc-header =
recipe
=20=20linux-libc-headers: fix headers install in long path name environments

Chen Qi (2):
=20=20runqemu-internal: add 'debugshell' as a default kernel option
=20=20rootfs_rpm.bbclass: export INSTALL_PLATFORM_EXTRA_RPM

Christopher Larson (3):
=20=20copyleft_compliance: grab the scm mirror tarballs
=20=20copyleft_compliance: force the symlink creation
=20=20buildhistory-diff: prepend to sys.path

Constantin Musca (4):
=20=20sed: upgrade to 4.2.2
=20=20libgdata: remove recipe
=20=20gsettings-desktop-schemas: add missing elements from meta-gnome
=20=20puzzles: upgrade to r9733

Cristian Iorga (3):
=20=20libtelepathy: python-native is now used during build
=20=20telepathy-idle: upgrade to 0.1.14
=20=20telepathy-mission-control: upgrade to 5.14.0

Enrico Scholz (3):
=20=20image.bbclass: quote TARGET_VENDOR
=20=20procps: initialized environment correctly (backported from classic)
=20=20util-linux: moved 'reset' into own subpackage

Eric B=C3=A9nard (1):
=20=20qt4: blacklist untrusted SSL certificates

Florin Sarbu (1):
=20=20alsa-utils: add bash as a dependency of the alsa-utils-alsaconf rpm.

Giuseppe CONDORELLI (2):
=20=20gcc: restore FILESPATH
=20=20libpcre: change BUILD_CPPFLAGS and BUILD_CFLAGS values

Hongxu Jia (2):
=20=20sstate.bbclass:specify function dirs to avoid race
=20=20apt-native: fix the creation of apt.conf.sample

Khem Raj (2):
=20=20ofono: Fix build with eglibc 2.17
=20=20udev: Fix build with eglibc 2.17

Laurentiu Palcu (5):
=20=20relocate_sdk.py: new interpreter string was not '\0' terminated
=20=20xf86-video-intel: upgrade to 2.20.17
=20=20qemu.bbclass: add qemu_run_binary() function
=20=20gtk-immodules-cache.bbclass: allow for offline cache generation
=20=20matchbox-keyboard: use the gtk-immodules-cache.bbclass

Lei Yang (1):
=20=20base-files: Remove the redundant "/"

Lukas Bulwahn (1):
=20=20site/common: deactivate a runtime check for ipv6-support in python =
>=3D2.7.1 t

Marcin Juszkiewicz (7):
=20=20cmake: add AArch64 support
=20=20xserver-xorg: add AArch64 support
=20=20nspr: added gnu-configize for AArch64 support
=20=20ghostscript: add AArch64 support
=20=20libart-lgpl: add AArch64 support
=20=20linux-libc-headers: add 3.7 version
=20=20gmp: add patch from upstream to unbreak AArch64

Marco Cavallini (1):
=20=20kernel.bbclass: kernel_do_install fails with kernel <2.6.30

Marko Lindqvist (24):
=20=20icu: update to upstream version 50.1.1
=20=20prelink: update to git head
=20=20polkit: update SRC_URI and HOMEPAGE
=20=20libxcomposite: update to upstream version 0.4.4
=20=20libtool: remove help2man dependency
=20=20bison: remove help2man dependency
=20=20libtasn1: remove help2man dependency
=20=20gettext: update to upstream version 0.18.2
=20=20gettext-minimal: update files from gettext 0.18.2
=20=20bluez-hcidump: updated to upstream version 2.5
=20=20file: replace obsolete automake macros with working ones
=20=20popt: disable tests
=20=20glib-2.0: replace obsolete automake macros with working ones
=20=20libx11: disable tests
=20=20libpng: replace obsolete automake macros with working ones
=20=20libusb: replace obsolete automake macros with working ones
=20=20pixman: replace obsolete automake macros with working ones
=20=20libid3tag: replace obsolete automake macros with working ones
=20=20libgcrypt: replace obsolete automake macros with working ones
=20=20gnutls: replace obsolete automake macros with working ones
=20=20flac: replace obsolete automake macros with working ones
=20=20pkg-config: replace obsolete automake macros with working ones
=20=20harfbuzz: add recipe, version 0.9.10
=20=20pango: update to upstream version 1.32.5

Martin Jansa (3):
=20=20scripts/sstate-diff-machines.sh: add simple script to compare sstate =
checksu
=20=20scripts/sstate-sysroot-cruft.sh: add simple script to find files in =
sysroots
=20=20perl-rdepends: be more strict in multiline comment

Otavio Salvador (3):
=20=20libnl: Fix building using flex
=20=20perl: Remove bashism from perl-tests.inc
=20=20libnl: Update to 3.2.18

Robert P. J. Day (2):
=20=20package.bbclass: Skip testing "packages" a second time.
=20=20kernel.bbclass: Define MODULE_IMAGE_BASE_NAME for layer convenience.

Ross Burton (6):
=20=20pkgconfig: add -native script that uses the native sysroot instead of =
target
=20=20musicbrainz: handle rebuilds
=20=20mesa: bump to 9.0.1
=20=20directfb: fix build against Mesa 9
=20=20gtk+: version installed gtk-update-icon-cache and use alternatives
=20=20gtk+3: add 3.4.4

Samuel Stirtzel (1):
=20=20boost: Use PARALLEL_MAKE for bjam

Saul Wold (2):
=20=20bash: fix mkbuiltins build failure
=20=20valgrind: update configure for eglibc 2.17

Stan Hu (1):
=20=20wpa-supplicant: Include wpa_supplicant.service file in package for =
dbus to w

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Andreas M=C3=BCller (2):
=20=20openal-soft: initial add 1.15.1
=20=20physfs: initial add 2.0.3

Khem Raj (26):
=20=20arptables: Import recipe from OE-Classic and update to latest
=20=20ebtables: Fix segfault by linking with no-as-needed
=20=20autofs: Add recipes for 5.0.7
=20=20nis: Import recipes from OE classic
=20=20ndisc6: Forward port recipe from OE classic
=20=20net-snmp: Use ${PN} instead of hardcoding net-snmp
=20=20jansson_2.3.1.bb: Fix multilib use BPN in SRC_URI instead of PN
=20=20liblockfile: Upgrade 1.06 -> 1.09
=20=20atftp: Upgrade to latest from git
=20=20tcpdump: Upgrade from 4.1.1 -> 4.3.0
=20=20cppunit: Upgrade recipes from 1.12.1 -> 1.13.1
=20=20luajit: Add recipes
=20=20concurrencykit: Add recipe for latest from git
=20=20tcsh: Add recipes for package
=20=20dmidecode: Forward port from OE-Classic
=20=20libuio: Add recipe for version 0.2.1
=20=20uml-utilities: Forward port recipe from OE classic
=20=20systemd: Fix build when base_libdir is not /lib
=20=20systemd.bbclass: Fixes for living along with multilib
=20=20at: Add systemd unit file
=20=20dhcp: Add systemd unit file for dhclient
=20=20nis: Add support for systemd launch of NIS services
=20=20rpcbind: Add systemd service unit file
=20=20dhclient.service: Rearrange the cmdline for dhclient
=20=20meta-systemd/atftpd: Adjust bbappend to match to recipe upgrade
=20=20obexd: Include unistd.h to get ssize_t definition

Lei Yang (1):
=20=20Add netcat-bsd into meta-networking for meta-virutalization libvirt =
virt-tes

Marcin Juszkiewicz (1):
=20=20libass: add missing dependency on fribidi

Marko Lindqvist (1):
=20=20xmlto: replace obsolete automake macros with working ones

Martin Jansa (4):
=20=20gpm: fix build with eglibc-2.17
=20=20goffice: add patch to use pcre_fullinfo instead of pcre_info
=20=20emacs: add harfbuzz, libicu* to qemu root
=20=20gnome-mplayer: package also nautilus3 extensions

Noor Ahsan (2):
=20=20autofs: Remove systemd related things.
=20=20autofs: Add bbappend to add systemd support.

Philip Balister (1):
=20=20fftw : Update to version 3.3.3.

Ross Burton (11):
=20=20gssdp: add 0.12.2.1 and 0.13.2
=20=20gupnp: add 0.18.4 and 0.19.3
=20=20gupnp-av: add 0.10.3 and 0.11.6
=20=20gupnp-dlna: add 0.9.2
=20=20gupnp-igd: add 0.2.2
=20=20gupnp-tools: add 0.8.1
=20=20media-service-upnp: add 0.4.0
=20=20renderer-service-upnp: add 0.3.0
=20=20media-service-demo: add snapshot from git
=20=20gst123: add package
=20=20python-mako: use setuptools.bbclass, fixing install paths

Roy.Li (1):
=20=20ntp: fix license to kill a warning

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Andreas M=C3=BCller (3):
=20=20base-files: remove ${sysconfdir}/tmpfiles.d/var-run.conf
=20=20base-files: make PRINC work properly for multiple bbappends
=20=20update-rc.d: make PRINC work properly for multiple bbappends

Khem Raj (4):
=20=20angstrom-next: Adapt to nativesdk renaming
=20=20conf/distro/angstrom-next.conf: Pin kernel headers to 3.7
=20=20angstrom-preferred-versions.inc: Move up the pinning of mesa and qt4
=20=20angstrom-core-tweaks.inc: Delete XSERVER definition for qemux86 and =
qemux86-

Koen Kooi (3):
=20=20angstrom: enable opengl for x86
=20=20angstrom: fix java versions
=20=20README: add link to test reports, fix URL typo

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-beagleboard:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-browser:

Khem Raj (1):
=20=20nss: Fix build for 64bit targets

Otavio Salvador (3):
=20=20scripts/firefox-gen-l10n-recipes: Update copyright to 2013
=20=20firefox: Update to 10.0.11esr
=20=20firefox-l10n: Update all languages for 10.0.11esr release

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

Eric B=C3=A9nard (3):
=20=20barebox: fix sdcard partition scheme
=20=20barebox: default to no kernel ipconfig
=20=20mesa-dri: upgrade bbappend to 9.0.1 to follow oe-core

Leonardo Sandoval (1):
=20=20imx-test: Add script to print system clocks

Otavio Salvador (5):
=20=20imx-base.inc: Centralize the preferred kernel for i.MX3X SoCs
=20=20linux-fslc: Update to 3.7.1
=20=20fsl-mm-*-codeclib: Fix packaging of libraries
=20=20xf86-video-imxfb: Port to newer Xorg video API
=20=20imx-base.inc: Set linux-libc-headers to iMX3 SoCs

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-ppc:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-guacamayo:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix:

Adam YH Lee (1):
=20=20Updated Steve's kernel repository location

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix-community:

Andreas M=C3=BCller (1):
=20=20remove linux-libc-headers

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-handheld:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-igep:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Khem Raj (1):
=20=20layer.conf: Use .=3D for adding to BBPATH and +=3D to BBFILES

Richard Purdie (2):
=20=20mesa-dri: Update bbappend to version 9.0.1
=20=20mesa-dri: Fix file extension for bbappend

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

Andrei Gherzan (25):
=20=20layer.conf: Use .=3D for adding to BBPATH and +=3D to BBFILES
=20=20MAINTAINERS: Add info about patch subject
=20=20ofono: Sync version with oe-core
=20=20xserver-xorg: Sync version with oe-core
=20=20node-startup-controller: Use public repository
=20=20base-passwd: Modify patch as home directory of root user is /root
=20=20README.md: Reformat file to use maximum 80 columns
=20=20u-boot: Minor file reformatting
=20=20connman: Minor file reformatting
=20=20nfs-utils: Minor file reformatting
=20=20bluez4: Minor file reformatting
=20=20obexd: Minor file reformatting
=20=20ofono: Minor file reformatting and fix bashism
=20=20portmap: Minor file reformatting
=20=20base-files: Minor file reformatting
=20=20base-passwd: Minor file reformatting
=20=20eglibc: Minor file reformatting
=20=20nebase: Minor file reformatting
=20=20systemd: Minor file reformatting
=20=20dlt-daemon: Minor file reformatting
=20=20shadow-securetty: Minor file reformatting
=20=20mesa-dri: egl and gles are added by default in PACKAGECONFIG
=20=20tiff: Minor file reformatting
=20=20gst-plugins-good: Minor file reformatting
=20=20consolekit: Minor file reformatting

Florin Sarbu (3):
=20=20Remove obsolete file and readme cleanup.
=20=20Add node state manager
=20=20packagegroup-core-p2.bb: Added node-state-manager as a P2 package

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
Changelog for meta-slugos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-systemd:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-raspberrypi:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

Eric Blade (1):
=20=20webos-image: update several packages

Martin Jansa (7):
=20=20npapi-headers: Disable do_compile
=20=20upstart: remove unused FILES-staticdev entry
=20=20webos_enhanced_submissions: Add P_V_${PN} to PV vardeps
=20=20webos-image: webos-connman-adapter=3D1,v1.0.0
=20=20webkit-webos: Add gperf-native dependency
=20=20dropbear: Change from init.d to upstart
=20=20webos_base: Add bbclass with unpackall and patchall tasks

Roger Stringer (1):
=20=20webos-image: update several packages

Steve Lemke (2):
=20=20dhcp: Add upstart script for dhclient
=20=20Redirect console from VirtualBox window to ttyS0

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Constantin Musca (3):
=20=20gthumb: finalize removal
=20=20mutter: finalize mutter removal
=20=20libgdata: finalize recipe removal

Emilia Ciobanu (1):
=20=20Added regex file in meta-yocto/conf/distro/include.

Otavio Salvador (1):
=20=20distro/poky: Add "Debian GNU/Linux 7.0 (wheezy)" as know distribution

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:




