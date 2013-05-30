Return-Path: <cliff.brake@gmail.com>
Received: from bec-systems.com (new.bec-systems.com [74.208.70.121])
	by mail.openembedded.org (Postfix) with ESMTP id A99B3608CA;
	Thu, 30 May 2013 15:18:44 +0000 (UTC)
Received: from oh-67-76-203-50.sta.embarqhsd.net ([67.76.203.50]
	helo=happy.bec-systems.com)
	by bec-systems.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cliff.brake@gmail.com>)
	id 1Ui4ZZ-0006Zn-Kt; Thu, 30 May 2013 11:15:34 -0400
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Date: Thu, 30 May 2013 15:18:21 GMT
Message-Id: <1369927101636.4c0f9df2@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
X-Spam_score: -2.9
X-Spam_score_int: -28
X-Spam_bar: --
Subject: OE Changelog since 2013-05-19 until 2013-05-26
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
X-List-Received-Date: Thu, 30 May 2013 15:18:45 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2013-05-19 until 2013-05-26.  Projects included in this =
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

Cristiana Voicu (2):
=20=20hob: apply a fade out animation when deselecting from tables
=20=20hob: Table sorting criteria should not change after deselecting =
recipes/pack

Paul Eggleton (4):
=20=20bitbake-layers: fix for move of calc_bbfile_priority within cooker
=20=20tinfoil: fix for changes to cooker config structure
=20=20cookerdata: rename _parse to parse_config_file
=20=20bitbake-layers: fix show-appends and flatten for recent cooker changes

Richard Purdie (20):
=20=20data: Ensure dependencies of subfunctions are accounted for
=20=20fetch2/git: Clean up sortable_revision
=20=20fetch2: Shorten long srcrevs
=20=20bin/bitbake: Improve exception handling
=20=20bitbake: Create cookerdata splitting config from cooker and =
bin/bitbake
=20=20cooker: Move commandline parsing back into the UI/cookerdata
=20=20cooker: Split configuration parsing code into cookerdata
=20=20bitbake/cookerdata: Explicitly specify cooker configuration options
=20=20runqueue.py: Ensure export flag is set for fakeroot environment =
variables
=20=20command: Fix function module reference after code rearrangement
=20=20methodpool: Conflicting methodnames should be a fatal error
=20=20methodpool: Retire it, remove global method scope
=20=20cooker.py: Remove global scope class event handlers
=20=20event: Drop Handled/NotHandled status return values
=20=20cooker/cookerdata/utils: Improve context management
=20=20cooker/cookerdata/event: Improve class handlers management
=20=20fetch2: Fix missing assignment
=20=20cooker/cookerdata: Improve configuration object handling
=20=20build: Avoid empty promises
=20=20cooker/cookerdata: Fix up event handling for hob

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Andreas M=C3=BCller (3):
=20=20qt: fix warning -Wunused-local-typedefs introduced by gcc 4.8
=20=20glib-2.0: update to 2.36.2
=20=20glib-networking: update to 2.36.2

Andrei Dinu (3):
=20=20nfs-utils : upgrade to 1.2.8
=20=20cdrtools-native : upgrade to 3.00
=20=20SLiRP support in runqemu

Chen Qi (5):
=20=20bind: use /var/run/named instead of /var/run/bind/run
=20=20image.bbclass: add postinst_enable_logging
=20=20dpkg: modify the run-postinst script to enable postinst logging
=20=20opkg: modify the run-postinst script to enable postinst logging
=20=20rpm-postinsts.bb: enable postinst logging

Cristian Iorga (1):
=20=20connman: upgrade to 1.14

Ionut Radu (1):
=20=20qemu: Updated from 1.4.0 to 1.4.1

Jack Mitchell (1):
=20=20sqlite3: update to 3.7.17

Jesse Zhang (1):
=20=20perl-tests: convert to ptest

Joe Slater (1):
=20=20zlib: put shared libraries in base_libdir

Jonathan Liu (6):
=20=20opkg: remove unnecessary extra leading slash in run-postinsts
=20=20util-linux: Update to 2.23
=20=20busybox: backport sulogin empty root password fix
=20=20dbus: remove /var/run from package as it is created on startup
=20=20populate-volatile.sh: remove repeated leading slashes in TNAME
=20=20systemd: update to 204

Kang Kai (1):
=20=20sudo: set CFLAGS for build mksigname and mksiglist

Khem Raj (1):
=20=20systemd: forward port uclibc patches to 204

Laurentiu Palcu (1):
=20=20runqemu: fix networking issues

Martin Jansa (1):
=20=20kernel: Remove unnecessary cd and rm, fix MODULE_TARBALL_SYMLINK_NAME =
creati

Mike Crowe (1):
=20=20kernel.bbclass: Add dependency on binutils

Ming Liu (1):
=20=20rm_work.bbclass: ignore failure for removing pseudo folder

Nitin A Kamble (1):
=20=20dropbear: a fix for hang in dropbearkey, built for x32

Otavio Salvador (1):
=20=20linux-firmware: Split 'ar3k' in a linux-firmware-ar3k package

Phil Blundell (1):
=20=20cross: Clear do_populate_sysroot[stamp-extra-info] so that stamps are =
not MA

Richard Purdie (5):
=20=20update-alternatives: Drop deprecated code, update to show error =
message
=20=20task.bbclass: Drop deprecated class
=20=20scripts/bitbake: Handle the case where git isn't installed cleanly
=20=20buildhistory: Sync with bitbake changes
=20=20sanity.bbclass: Drop dubious print

Riku Voipio (1):
=20=20xserver-xorg: enable xvfb

Robert Yang (1):
=20=20image_types.bbclass: remove the old images

Ross Burton (6):
=20=20pixbufcache: update the loader cache when installing natively
=20=20gdk-pixbuf: remove native loader cache generation, use the class
=20=20librsvg: add more PACKAGECONFIG options
=20=20librsvg: clean up native depends
=20=20librsvg: small cleanups
=20=20librsvg: add sstate dependencies so that the SVG loader works at =
staging tim

Saul Wold (10):
=20=20gnupg: Update to 2.0.20
=20=20desktop-file-utils: Update to 0.21
=20=20mklibs: Update to 0.1.37
=20=20libnl: Update to 3.2.22
=20=20mc: Update to 4.8.8
=20=20cmake: Update to 2.8.11
=20=20resolvconf: Update to 1.72
=20=20patch: diable xattr as default
=20=20wget: disable uuid by default
=20=20binutils: the cat should always succeed when building config.cache

Tomas Frydrych (11):
=20=20clutter.bbclass: helper class for clutter and friends
=20=20cogl: Replace with 1.14.0 version
=20=20clutter: Replace with 1.14.4 version
=20=20clutter-gst: Replace with 1.6.0 version
=20=20clutter-gtk: Replace with 1.4.2 version
=20=20mx: Update to improved naming scheme
=20=20packagegroup-core-clutter: use clutter-1.0 packages
=20=20cogl: further improvements
=20=20clutter.bbclass: removed unused function
=20=20clutter: further improvements
=20=20clutter-gst: removed no longer required configure fragment

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Andreas M=C3=BCller (11):
=20=20mm-common: update to 0.9.6
=20=20libsigc++-2.0: update to 2.2.11
=20=20glibmm: merge glibmm.inc into recipe - and stylize a bit
=20=20glibmm: update to 2.36.2
=20=20pangomm: update to 2.34.0
=20=20gtkmm: merge gtkmm.inc into recipe - and cleanup a bit
=20=20atkmm: initial add 2.22.7
=20=20gtkmm: update to 2.24.3
=20=20gtkhtml2: fix build with glib 2.36
=20=20evince: fix build with gcc 4.8
=20=20gnome-system-monitor: fix build after gtkmm update

Khem Raj (1):
=20=20pangomm: Add missing dependency on pango

Paul Eggleton (1):
=20=20collectd: fix build failure with libnotify in sysroot

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Khem Raj (1):
=20=20angstrom-next: Pin version of binutils-native

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-beagleboard:

Koen Kooi (1):
=20=20linux-mainline-3.8: hdmi fixes

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

Javier Viguera (1):
=20=20gst-fsl-plugin: fix segfault due to not found library

Mahesh Mahadevan (1):
=20=20linux-imx (2.6.35): mxs and mx5: Update to latest from FSL GIT

Otavio Salvador (1):
=20=20cogl: Remove 'bbappend' as Clutter recipes are being reworked

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

Otavio Salvador (2):
=20=20u-boot-imx: Remove Wandboard patch as it is now supported by mainline
=20=20m28evk: Add DENX M28EVK board support

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-ppc:

Khem Raj (1):
=20=20hypervisor: Compile only for fsl machines

Zhenhua Luo (2):
=20=20eth-config: use pattern match for xml files installation
=20=20linux-qoriq-sdk: append SDK version to kernel version

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-guacamayo:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix-community:

Andreas M=C3=BCller (2):
=20=20linux-omap-3.5: fix buffer overflow security hole

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-handheld:

Khem Raj (1):
=20=20ezxd: Add LIC_FILES_CHKSUM to recipe and -fPIC to CFLAGS

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-igep:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Kishore Bodke (1):
=20=20crystalforest: Update Maintainer info

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

Andrei Gherzan (2):
=20=20layer-management: Add missing dependency on libxdamage
=20=20layer-management: Remove useless imx6 specific code

Florin Sarbu (1):
=20=20nfs-utils: Update .bbappend to version 1.2.8

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
=20=20devio: Add recipe

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

Martin Jansa (6):
=20=20packagegroup-shr-feed: drop epdfview
=20=20kernel_android: Remove unnecessary cd and rm
=20=20systemd-machine-units: Fix SYSTEMD_SERVICE to have _${PN} suffix

Simon Busch (14):
=20=20meta-asus: linux-asus-grouper: enable =
CONFIG_ANDROID_BINDER_IPC/CONFIG_ANDRO
=20=20meta-asus/samsung: android-system-image: use phablet images and =
install addi
=20=20meta-samsung: linux-samsung-tuna: enable support for namespaces
=20=20meta-samsung: udev-extraconf: add rule to symlink radio firmware =
partition t
=20=20meta-samsung: android-system-image-tuna: update to latest
=20=20meta-asus: android-system-image-grouper: update to latest
=20=20meta-samsung: base-files: add additional directories and mount points =
for ri
=20=20meta-android: base-files: add necessary environment settings to =
execute andr
=20=20meta-android: drop android-exec as functionality is now added to =
shell profi
=20=20meta-samsung: android-initscripts: fix pvrinit to work without =
android-exec
=20=20meta-samsung: linux-samsung-tuna: enable wifi P2P support
=20=20meta-android: android-system-image-tuna: don't run do_package_shlibs =
to remo
=20=20meta-android: base-files: don't export build time variables
=20=20meta-android: android-audiosystem: don't provide asound.conf

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

Eric Blade (1):
=20=20webos-image: libpbnjson=3D11

Janne Hurskainen (1):
=20=20webos-image: nyx-modules=3D88

Keith Derrick (1):
=20=20webos-image: luna-service2 =3D 150

Martin Jansa (4):
=20=20webos_qmake5: Remove unneeded code
=20=20webos_qmake5: Use OE_QMAKE_PATH_* variables
=20=20webos_qmake5: export MACHINE variable from MACHINE_ARCH recipes
=20=20packagegroup-webos-test: Remove netperf

Roger Stringer (2):
=20=20webos-image: db8=3D67
=20=20db8=3D68

Suresh Arumugam (1):
=20=20Add WEBOS_PACKAGESET variable for System Apps

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

Nathan Rossi (3):
=20=20tune-microblaze: Add negative CCARGS definitions
=20=20meta-kc705: kc705-trd: Update configuration to match exact hardware
=20=20linux-xlnx: Fix DEPENDS for microblaze targets

Sipke Vriend (5):
=20=20Documentation correstions. Add zc702 README.
=20=20Remove rootfs symlink generation.
=20=20microblaze: Change version tune format.
=20=20microblaze: Add v9.0 tune.
=20=20microblaze: Set FPU_TARGET and add sanity checking

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Robert Yang (1):
=20=20image_types.bbclass: remove the old images

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



