Return-Path: <cliff.brake@gmail.com>
Received: from bec-systems.com (u15414263.onlinehome-server.com
	[74.208.70.121])
	by mail.openembedded.org (Postfix) with ESMTP id B51EA6DF50;
	Tue, 10 Dec 2013 02:13:25 +0000 (UTC)
Received: from oh-67-76-203-50.sta.embarqhsd.net ([67.76.203.50]
	helo=happy.bec-systems.com)
	by bec-systems.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cliff.brake@gmail.com>)
	id 1VqCfn-0005SM-AH; Mon, 09 Dec 2013 21:03:52 -0500
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Date: Tue, 10 Dec 2013 02:13:05 GMT
Message-Id: <1386641585915.8a6952ff@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
X-Spam_score: -0.2
X-Spam_score_int: -1
X-Spam_bar: /
Subject: OE Changelog since 2013-12-01 until 2013-12-08
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
X-List-Received-Date: Tue, 10 Dec 2013 02:13:27 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2013-12-01 until 2013-12-08.  Projects included in this =
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

Cristiana Voicu (2):
=20=20hob: changes to INHERIT var should use "append" operation
=20=20toaster: exclude "set in documentation.conf" from variable history

Jason Wessel (3):
=20=20bitbake: Add --status-only option
=20=20bitbake, xmlrpc.py: Implement memory resident auto port =
configuration/restar
=20=20bitbake.lock: Add host:port to bitbake.lock for memres server

Paul Eggleton (4):
=20=20hob: fix rotating progress icon animation
=20=20lib/bb/ui: handle PKGSIZE change to bytes
=20=20hob: name package files list variables appropriately
=20=20hob: fix package property dialog for changes to FILES_INFO

Richard Purdie (6):
=20=20imagedetailspage: Fix crash with more than 15 layers
=20=20codeparser/data_smart: Optimise parsing speed
=20=20hob: Use BASEDATASTORE_TRACKING feature
=20=20cooker/command/hob: Cleanup configuration init/reset functions and =
commands
=20=20fetch2/git: Add sanity check to ensure we really did fetch the =
correct revis
=20=20fetch2/git: Ensure check is made in the correct directory

Valentin Popa (1):
=20=20Hob: check if warnings are related to package build

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Alexandru Palalau (1):
=20=20lib/oeqa/selftest: buildoptions.py: add simple image build tests

Andreas Oberritter (1):
=20=20cogl-1.0: explicitly disable cairo

Andrei Gherzan (1):
=20=20libav: Update to v0.8.9

Bruce Ashfield (1):
=20=20linux-yocto/*: restore branch designations

Chen Qi (2):
=20=20subversion: fix build problem when sysroot contains '-D' or '-I'
=20=20init-live.sh: remove the '-c /dev/console' for switch_root

Christopher Larson (6):
=20=20quota: apply patch to obey tcp-wrappers config
=20=20python, python-native: fix PARALLEL_MAKEINST failure
=20=20cairo: add/use packageconfig for valgrind support
=20=20qemu: handle CLOEXEC/NONBLOCK if unavailable on host
=20=20pulseaudio: fix RDEPENDS traversal for consolekit
=20=20update-rc.d: process symlinks recursively

Corneliu Stoicescu (3):
=20=20meta-selftest: create a new test layer to be used by oe-selftest =
script
=20=20lib/oeqa/selftest: add test modules for expected bitbake output and =
bitbake-
=20=20lib/oeqa/selftest: add tests for PR service

Cristiana Voicu (1):
=20=20babeltrace: correct PV variable

David Nystr=C3=B6m (2):
=20=20rpm: Fixed Q&A Errors in netivesdk-rpm
=20=20nativesdk-packagegroup-sdk-host: Added nativesdk-smartpm

Enrico Scholz (1):
=20=20qt4: fixed dependency on icu

Jason Wessel (2):
=20=20oe-init-build-env: Allow startup with and without memres
=20=20oe-init-build-env-memres: Add auto port functionality

Koen Kooi (1):
=20=20linux-dummy: catch up with image.bbclass changes

Martin Jansa (3):
=20=20icecc.bbclass: Fix whitespace, improve comment
=20=20cpan-base: Add vardepvalue to get_perl_version function
=20=20icecc-create-env-native: Drop FILESPATH, document PATCHTOOL

Mike Looijmans (1):
=20=20python: Add missing RDEPENDS for python-unittest

Nathan Rossi (1):
=20=20attr: Add patch tracking details

Nicolas Dechesne (1):
=20=20image-mklibs: ensure sysroot is correctly set when calling gcc

Paul Eggleton (19):
=20=20classes/icecc: fix typos in header comments
=20=20classes/package: fix FILES_INFO serialisation in pkgdata
=20=20classes/package: record PKGSIZE as total file size in pkgdata
=20=20classes/package: write PE and PKGE out to pkgdata
=20=20classes/buildhistory: drop cruft from old SRCREV tracking =
implementation
=20=20classes/buildhistory: add additional variables to image information
=20=20classes/buildhistory: improve collection of package info
=20=20classes/buildhistory: reduce parsing time
=20=20classes/buildhistory: do git garbage collection after committing
=20=20squashfs-tools: drop FILESPATHPKG
=20=20squashfs-tools: set SUMMARY instead of DESCRIPTION
=20=20alsa-utils-alsaconf: tidy up path setting
=20=20eee-acpi-scripts: tidy up recipe
=20=20dropbear: set SUMMARY instead of DESCRIPTION
=20=20Don't set DESCRIPTION to the same value as SUMMARY
=20=20gpgme: remove pth handling
=20=20openssh: remove unrecognised configure option
=20=20libarchive: add SUMMARY and fix HOMEPAGE
=20=20classes/buildhistory: fix reading of package-specific values from =
pkgdata

Richard Purdie (12):
=20=20eglibc-initial.inc: Drop duplicate include
=20=20gcc-cross-canadian: Fix fortran build
=20=20libxkbfile: Remove obsolete configure option
=20=20leafpad: Fix configure flags
=20=20gst-plugins-good: Fix configure option
=20=20eglibc-options: Rewrite so it benefits from bitbake's contains =
handling
=20=20classes/recipes: More optimal DISTRO_FEATURES references
=20=20gcc: Allow fortran to build successfully in 4.8
=20=20bitbake.conf/native.bbclass: Use FC instead of F77 for fortran
=20=20prelink: Set the branch name correctly for the revision we're using
=20=20matchbox-keyboard: Use the branchname the revision is on
=20=20mx/lttng-*: Fix git branch references

Ross Burton (13):
=20=20ptest: ensure do_install_ptest_base task runs in fakeroot context
=20=20gstreamer1.0-plugins-bad: respect directfb DISTRO_FEATURE
=20=20gstreamer1.0-plugins-bad: add PACKAGECONFIG for librsvg
=20=20pango: upgrade to 1.36.1
=20=20libxft: fix Freetype header inclusion
=20=20pixman: upgrade to 0.32.4
=20=20xserver: remove unrecognised options
=20=20freetype: upgrade to 2.5.1
=20=20gmae: remove GMAE toolchain and packagegroups
=20=20lib/oeqa/runtime: print connman status if connman failed to start
=20=20lib/oeqa/runtime: output more logging from systemd when services have =
failed
=20=20fstests: update to git master
=20=20python-imaging: fix compilation with Freetype 2.5.1

Saul Wold (2):
=20=20security_flags: Add entry for openssl
=20=20tcl: fix tclConfig.sh to point to the correct private headers

Stefan Stanacar (6):
=20=20scripts/oe-selftest: script to run builds as unittest against bitbake =
or var
=20=20lib/oeqa: use the new manifest file for determining if a package is =
installe
=20=20testimage: use the new targetcontrol.py module for running tests
=20=20lib/oeqa: targetcontrol.py: add abstraction for running tests on =
different t
=20=20lib/oeqa/selftest/base, scripts/oe-selftest: fix wrong remove path =
and do a=20
=20=20lib/oeqa/selftest: buildoptions: small fixes for some tests

Tudor Florea (1):
=20=20kmod: avoid parallel-tests

Yue Tao (1):
=20=20python: do not replace ccache in the middle of a path

yzhu1 (1):
=20=20populate_sdk: verify executable or dynamically linked library

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Christopher Larson (2):
=20=20ruby: find gems relative to its own location
=20=20lmbench: fix the CONFIG path in lmbench-run

Jackie Huang (2):
=20=20inetutils: use new update-alternatives syntax
=20=20inetutils: add --with-libreadline-prefix to avoid host contamination

Joe MacDonald (1):
=20=20inetutils: correct QA issue (unrecognized configure option)

Martin Jansa (5):
=20=20gateone: Drop allarch
=20=20zram: Drop allarch
=20=20mime-support: Drop allarch
=20=20usb-modeswitch-data: Exclude SIGGEN dependency on usb-modeswitch
=20=20xserver-common: Rename Xsession.d files to end with .sh extension

Nick D'Ademo (3):
=20=20v4l-utils: use correct udev dir location when multilib is enabled
=20=20tk: make multilib build compatible and fix library install
=20=20opencv: bump SRCREV and make recipe multilib build compatible

Zhenhua Luo (1):
=20=20python-numpy: add support for powerpc architecture

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Khem Raj (1):
=20=20Fix splash for angstrom-next

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Carlos Hernandez (1):
=20=20linaro-pm-qa-utils: Remove hardcoded relative paths

Chase Maupin (1):
=20=20ltp-ddt: add RDEPENDS for linaro-pm-qa-utils

Denys Dmytriyenko (1):
=20=20nativesdk-qtbase: switch back the proper qmake binary

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

Mats K=C3=A4rrman (1):
=20=20linux-imx: Build fails on missing dependency on lzop-native

Otavio Salvador (1):
=20=20libdrm: Follow update of OE-Core to 2.4.49

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

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

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

Florin Sarbu (3):
=20=20dlt-daemon: Add version 2.9.1
=20=20Add quota support in kernel for all 3 supported machines.
=20=20node-state-manager: Fix systemd service     so that it depends on the =
existi

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

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-slugos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-systemd:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-raspberrypi:

Andrei Gherzan (1):
=20=20Merge "rpi-default-providers: Use jpeg as default provider"

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

Denys Dmytriyenko (2):
=20=20libgles-omap3, omap3-sgx-modules: swap around DEFAULT_PREFERENCE =
setting
=20=20linux-ti-staging: update to 3.12.2 plus fixes in connectivity, pm, =
rpmsg etc

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

Alekseyev Oleksandr (3):
=20=20meta-webos: luna-service2=3D168 powerd=3D24
=20=20webos-image: luna-prefs=3D5
=20=20webos-image: luna-sysservice=3D25

Alexandr Smoktal (1):
=20=20webos-image: powerd=3D25

Ed Chejlava (1):
=20=20webos-image: nyx-utils=3D14,v1.0.1

Hongjeon Ha (1):
=20=20webos-image: pmlogdaemon=3D115 pmloglib=3D48

Keith Derrick (1):
=20=20webos-image: pmcertificatemgr=3D29

Maksym Sditanov (3):
=20=20meta-webos: db8=3D103 configurator=3D57
=20=20webos-image: leveldb=3Dv1.14.0
=20=20base-files: Increase tmpfs maximum size for /var/db/temp

Martin Jansa (7):
=20=20webos.inc: Fix perf signature changing when perl was or wasn't built
=20=20webos-preferred-providers: Remove update-rc.d from images
=20=20qt4-webos, webkit(-supplemental), keyboard-efigs: Hide QA warnings
=20=20webos-{init,shutdown}scripts: Change PACKAGE_ARCH to MACHINE_ARCH
=20=20webos.inc: Set PACKAGE_ARCH to MACHINE_ARCH even for packagegroups
=20=20icecc: Import improved version from oe-core master and always inherit
=20=20pmcertificatemgr: Add missing dependency on glib-2.0

Nikolay Orliuk (1):
=20=20webos-image: luna-sysservice=3D26

Premalatha MVS (1):
=20=20webos-image: activitymanager=3D122

Sapna Todwal (1):
=20=20webos-image: sleepd=3D26

Seongho Kim (1):
=20=20webos-image: alljoyn=3Dv3.4.3

Seonho Park (1):
=20=20base-files: Create /var/preferences

Simon Busch (1):
=20=20webos-image: webos-connman-adapter=3Dr2

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Richard Purdie (2):
=20=20meta-yocto-bsp: Drop gmae bbappends to match OE-Core
=20=20linux-libc-headers-yocto: Drop old 3.4+git version

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



