Return-Path: <cliff.brake@gmail.com>
Received: from bec-systems.com (u15414263.onlinehome-server.com
	[74.208.70.121])
	by mail.openembedded.org (Postfix) with ESMTP id 3DF5E6E4AA;
	Mon, 16 Dec 2013 18:20:39 +0000 (UTC)
Received: from oh-67-76-203-50.sta.embarqhsd.net ([67.76.203.50]
	helo=happy.bec-systems.com)
	by bec-systems.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cliff.brake@gmail.com>)
	id 1Vsccu-0007iF-C0; Mon, 16 Dec 2013 13:10:53 -0500
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Date: Mon, 16 Dec 2013 18:20:20 GMT
Message-Id: <1387218020018.22e48502@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
X-Spam_score: -2.9
X-Spam_score_int: -28
X-Spam_bar: --
Subject: OE Changelog since 2013-12-08 until 2013-12-15
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
X-List-Received-Date: Mon, 16 Dec 2013 18:20:40 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2013-12-08 until 2013-12-15.  Projects included in this =
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

Alexandru DAMIAN (11):
=20=20toaster: Analysis API variablehistory update
=20=20toaster: remove Author field in SimpleUI
=20=20toaster: move layer information reading code
=20=20toaster: update build stats reading
=20=20toaster: change package storage model
=20=20toasterui: fix version numbers for no PE specified
=20=20toasterui: do not link non-image targets
=20=20toaster: update to Django 1.5
=20=20toaster: migrate orm models to South
=20=20toaster: add pagination to the Simple UI
=20=20toaster: Add more information for tasks in Simple UI

Cristiana Voicu (1):
=20=20hob: after adding a layer, hob do not parse the configuration

Richard Purdie (3):
=20=20data: Ensure we add the contains keys in a particular order
=20=20process: Add timeout to select call
=20=20data_smart: Fix hash corruption issue

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Alexandra Safta (1):
=20=20udev: Add ptest

Alexandru DAMIAN (3):
=20=20toaster.bbclass: read layer information
=20=20toaster.bbclass: read build stats
=20=20toaster.bbclass: read package and image information

Andreas Oberritter (1):
=20=20xorg-lib-common.inc: use REQUIRED_DISTRO_FEATURES variable

Andrei Gherzan (2):
=20=20libav: Add v9.10
=20=20libav: Use "BP" and "libav" patch directory

Baogen Shang (2):
=20=20libtiff: CVE-2013-4232
=20=20libtiff: CVE-2013-4243

Bruce Ashfield (2):
=20=20linux-yocto-dev: allow static SRCREVs via include
=20=20linux-libc-headers: fix MIPS klibc build error

Chen Qi (7):
=20=20nfs-utils: explicitly rdepend on bash
=20=20libgcrypt: fix compile error with '-O2' in sysroot path
=20=20init-ifupdown: adjust priority of networking to fix system freeze =
problem
=20=20image.bbclass: default USE_DEVFS to '1'
=20=20shadow-native: allow for setting password in clear text
=20=20image.bbclass: fix for zap_root_password
=20=20useradd-example: add example for setting clear text password

Chong Lu (1):
=20=20meta/*: remove unnecessary patches

Corneliu Stoicescu (2):
=20=20oe-selftest: implement add_command_to_tearDown method
=20=20oe-selftest: Add track_for_cleanup method to be used in cleanup tasks

Cristian Iorga (7):
=20=20harfbuzz: upgrade to 0.9.25
=20=20connman: upgrade to 1.20
=20=20iptables: upgrade to 1.4.21
=20=20iproute2: upgrade to 3.12.0
=20=20bluez5: upgrade to 5.12
=20=20rpcbind: upgrade to 0.2.1
=20=20glib-2.0: upgrade to 2.38.2

Herb Kuta (1):
=20=20makedevs: Add trace option and fix permissions on files if they =
already exis

Hongxu Jia (5):
=20=20qemu: add bash and python to qemu's RDEPENDS
=20=20license.bbclass: fix copying license directories failed
=20=20mtools: add ability to compile with nativesdk
=20=20syslinux: add ability to compile with nativesdk
=20=20nativesdk.bbclass: support nativesdk to override with the =
PACKAGES_DYNAMIC s

Jackie Huang (3):
=20=20grub: add explicit dependency on bison-native
=20=20grub-efi: change to generate EFI image in target package
=20=20grub-efi: allow compilation without large model support

Khem Raj (2):
=20=20buildhistory.bbclass: Specify lang in decoding strings
=20=20systemd-systemctl: Add preset capability

Koen Kooi (3):
=20=20distutils bbclass: delete site.py*
=20=20perl: remove sysroot path leakage into packaged files
=20=20cpan_build bbclass: do not install module into /usr/share

Konrad Scherer (1):
=20=20perf: Disable warnings as errors for kernels 3.1+

Li Wang (2):
=20=20xinetd: CVE-2013-4342
=20=20xinetd: add status of init.d command

Lukas Bulwahn (1):
=20=20boost: updating to 1.55.0

Martin Jansa (3):
=20=20makedevs: Respect LDFLAGS
=20=20ltp: set PREFERRED_PROVIDER and rename runtests_noltp.sh script
=20=20ltp: Use patch generated without -M

Matthieu Crapet (1):
=20=20gstreamer1.0-plugins-base: fix missing rprovides

Ming Liu (1):
=20=20libtiff: fix CVE-2013-1960

Paul Eggleton (4):
=20=20classes/module_strip: remove
=20=20external-sourcery-toolchain: remove
=20=20local.conf.sample.extended: add some missed changes for directfb / =
archiver
=20=20shadow: change to use SHA512 password encryption

Qiang Chen (1):
=20=20shadow: remove reference to locale env files from login and su

Richard Purdie (2):
=20=20gcc-crosssdk.inc: Fix missing dependencies (such as libmpc-native)
=20=20nativesdk: Set LIBCOVERRIDE to a value

Ross Burton (9):
=20=20documentation.conf: update for new image testing variables
=20=20libxcb: fix rebuild when MACHINE changes
=20=20freetype: upgrade to 2.5.2
=20=20libmatchbox: fix libpng detection
=20=20libmatchbox: use PACKAGECONFIG
=20=20sato-icon-theme: simplify icon-name-mapping lookup
=20=20site: add xorg_cv_malloc0_returns_null
=20=20xorg-lib: remove explicit --enable-malloc0returnsnull
=20=20lib/oeqa/runtime: systemd failure case improvements

Roy Li (3):
=20=20libidn: enable TLD
=20=20buildhistory.bbclass/image.bbclass: remove obsolete codes
=20=20multilib: Ensure we map the SYSTEMD_PACKAGES variable

Saul Wold (10):
=20=20acl: Update to 2.2.52
=20=20file: Update to 5.16
=20=20libxkbcommon: Update to 0.3.2
=20=20nspr: Update to 4.10.2
=20=20boost: Move files -> boost
=20=20binutils: Add embedspu to standard binutils package
=20=20util-macros: upgrade to 1.18.0
=20=20dpkg: upgrade to 1.17.4
=20=20cracklib: upgrade to 2.9.1
=20=20btrfs-tools: Update to 3.12

Scott Garman (1):
=20=20runqemu: remove core-image-* whitelist

Steffen Sledz (1):
=20=20gdb-7.6.1: fix cygwin check in configure script

Wenzong Fan (1):
=20=20rpcbind: fix init status and exit code

Yue Tao (2):
=20=20acpid: CVE-2011-1159
=20=20icu: CVE-2013-2924

Zhang Xiao (1):
=20=20nfs-utils: separate package as Debain style

yanjun.zhu (1):
=20=20boot-directdisk: add the support of vmdk

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Andreas M=C3=BCller (1):
=20=20connman: follow oe-core to 1.20

Chong Lu (1):
=20=20modphp: enable endian check

Roy Li (1):
=20=20proftpd: use /bin/false as the login shell and add home-dir

stephen.arnold42 (1):
=20=20nginx: new recipe

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Khem Raj (1):
=20=20Fix splash for angstrom-next

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Denys Dmytriyenko (4):
=20=20cryptodev: add cryptodev kernel module and -tests packages
=20=20openssl: add cryptodev support and enable asm-optimized algos for ARM
=20=20packagegroup-arago-tisdk-crypto: enable cryptodev for ti33,ti43 and =
dra7
=20=20packagegroup-*-crypto-sdk-target: fix conflict between cryptodev and =
ocf-lin

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
=20=20linux-imx: Update SRC_URI for new fetcher behavior.

Dan McGregor (1):
=20=20u-boot-fslc: Add branch to SRC_URI and separate recipe files

St=C3=A9phane Cerveau (1):
=20=20gst-fsl-plugin: Activate gstreamer AAC decoder.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

Dan McGregor (1):
=20=20linux-wandboard: Add branch name

Mario Domenech Goulart (2):
=20=20wandboard.inc: add file with common settings for wandboard boards
=20=20wandboard.inc: add touchscreen support

Philip Balister (4):
=20=20u-boot-boundary : Update SRC_URI for new fetcher behavior.
=20=20u-boot-script-boundary : Update SRC_URI for new fetcher behavior.
=20=20linux-boundary : Update SRC_URI for new fetcher behavior.
=20=20linux-wandboard : Use SRCBRANCH instead of GITBRANCH.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-ppc:

Chunrong Guo (3):
=20=20Fix git branch references
=20=20qemu: add gtk options in configure
=20=20lttng-modules: build as 64-bit kernel module on e6500

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

Richard Purdie (1):
=20=20qt-x11-free-native: Ensure LD_LIBRARY_PATH reaches the environment

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-qt5:

Denys Dmytriyenko (3):
=20=20nativesdk-qtbase: add nativesdk version of qtbase necessary for SDK =
tools
=20=20nativesdk-qttools: add nativesdk version of qttools necessary for SDK =
tools
=20=20qttools-native: remove previous license workaround

Martin Jansa (1):
=20=20qtlocation, qtsystems: Fix QT_MODULE_BRANCH

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-slugos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-systemd:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-raspberrypi:

Andrei Gherzan (1):
=20=20Merge "wiringpi: Add new package"

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

Martin Jansa (2):

Simon Busch (1):
=20=20meta-samsung: linux-samsung-tuna: update kernel config and add =
SECOND_RAM_BA

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

Chase Maupin (1):
=20=20am33x-cm3: Add support for ti43x devices

Denys Dmytriyenko (6):
=20=20am437x-evm.conf: update UBI values specific to AM437x NAND
=20=20am33x-cm3: update to v05.00.00.01 version
=20=20linux-ti-staging: update to 3.12.4 with more fixes for release
=20=20u-boot-ti-staging: update with more fixes for release
=20=20linux-ti-staging: update with fixes for audio-display and connectivity
=20=20u-boot-ti-staging: update with omap5 clock fix

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

Alexandr Smoktal (1):
=20=20webos-image: configurator=3D58

Anatolii Sakhnik (2):
=20=20webos-image: luna-sysservice=3D28
=20=20webos-image: sleepd=3D27

DongHeon Jang (1):
=20=20webos-image: mojoservicelauncher=3D81

Iyad Qumei (1):
=20=20leveldb: Switch to using posix_fallocate()

Maksym Sditanov (1):
=20=20leveldb: Fix for qemux86

Martin Jansa (1):
=20=20bash: Use u-a for /bin/bash binary conflicting with busybox

Wonhong Kwon (2):
=20=20webos-image-devel: Add bootchart2=3Dv0.14.5
=20=20webos-image-devel: bootchart2=3Dr1

hwachun.yeo (1):
=20=20cpputest: Add recipe for v3.5

joonghee.han (1):
=20=20sqlcipher: Add recipe for v3.0.0

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

Nathan Rossi (3):
=20=20boards/qemumicroblaze: Added ramdisk boot args to device tree
=20=20qemu: Enabled required patches
=20=20qemu: Add patch to resolve MicroBlaze ethernet issues

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Paul Eggleton (2):
=20=20distro_alias.inc: drop external-*
=20=20local.conf.sample.extended: restore some edits

Richard Purdie (3):
=20=20linux-libc-headers-yocto: Drop old 3.4+git version
=20=20local.conf.extended: Bring into sync with OE-Core
=20=20qemu/local.conf.sample: Add sdl PACKAGECONFIG

Robert Yang (1):
=20=20maintainers.inc: update the the maintainers

Ross Burton (1):
=20=20distro-tracking: remove GMAE package groups

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



