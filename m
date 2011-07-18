Received: from oh-69-34-21-229.sta.embarqhsd.net ([69.34.21.229]
	helo=happy.bec-systems.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1Qivou-0007by-Lk; Mon, 18 Jul 2011 23:57:45 +0200
Received: from localhost ([127.0.0.1] helo=happy.bec-systems.com)
	by happy.bec-systems.com with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1Qivkw-0005IS-9Y; Mon, 18 Jul 2011 17:53:38 -0400
Date: Mon, 18 Jul 2011 17:53:38 -0400
Message-Id: <E1Qivkw-0005IS-9Y@happy.bec-systems.com>
X-Mailer: Nodemailer (0.1.13; +http://www.nodemailer.org)
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org
MIME-Version: 1.0
Subject: OE Changelog for 2011-07-11 to 2011-07-18
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Jul 2011 21:57:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Changelog for 2011-07-11 to 2011-07-18.  Projects included in this report:

bitbake: git://git.openembedded.org/bitbake
openembedded-core: git://git.openembedded.org/openembedded-core
meta-openembedded: git://git.openembedded.org/meta-openembedded
meta-angstrom: git://git.angstrom-distribution.org/meta-angstrom
meta-yocto: git://git.yoctoproject.org/poky
meta-texasinstruments: =
git://git.angstrom-distribution.org/meta-texasinstruments
meta-smartphone: http://git.shr-project.org/repo/meta-smartphone.git
meta-micro: git://git.openembedded.org/meta-micro
meta-slugos: git://github.com/kraj/meta-slugos
meta-nslu2: git://github.com/kraj/meta-nslu2
meta-intel: git://git.yoctoproject.org/meta-intel
openembedded: git://git.openembedded.org/openembedded

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for bitbake:

Joshua Lock (2):
=20=20ui/crumbs/tasklistmodel: update brought in by column when possible
=20=20ui/crumbs/tasklistmodel: fix automatic removal of orphaned items

Yu Ke (1):
=20=20fetcher2: retry mirror if upstream checksum mismatch

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Andrea Adami (2):
=20=20image_types.bbclass: add support for tar.xz, cpio.xz, cpio.lzma
=20=20kernel.bbclass: handle embedding of initramfs images

Chris Elston (1):
=20=20Add support for BAD_RECOMMENDATIONS to rootfs_ipk

Darren Hart (1):
=20=20bb-matrix: initial scripts to record TIME(1) metrics for BB and PM =
combinati

Joshua Lock (1):
=20=20classes/image_types: add a variable to list available IMAGE_FSTYPE's

Koen Kooi (7):
=20=20pulseaudio: try harder to disable HAL
=20=20pulseaudio 0.9.15: delete, but keep 0.9.22 and 0.9.23
=20=20webkit-gtk: update SRCREV
=20=20pulseaudio: make it work out of the box
=20=20ofono: fix packaging and clean up custom do_install
=20=20connman-gnome: run oe-stylize over recipe
=20=20pulseaudio: enable bluetooth support

Nitin A Kamble (5):
=20=20kernel.bbclass: fix the broken lines
=20=20glibc: fix false failure
=20=20binutils: package unpackaged files
=20=20eglibc: fix installed but not packaged files
=20=20eglibc: fix runtime assertion failure

Otavio Salvador (2):
=20=20libarchive: remove undistributable copyright content from source
=20=20cmake: update to 2.8.5 release

Paul Eggleton (2):
=20=20busybox: fix missing features due to lack of variable expansion
=20=20insane.bbclass: skip rdepends QA checks for kernel / modules

Phil Blundell (3):
=20=20kernel.bbclass, task-base: remove references to obsolete =
bluez-dtl1-workarou
=20=20bluez-dtl1-workaround: deleted
=20=20eglibc: ensure that NSS libs go into the right package when =
${base_libdir} a

Richard Purdie (4):
=20=20sysklogd: Drop ONLINE_PACKAGE_MANAGEMENT as per mailing list =
discussion
=20=20update-rc.d: Switch from a tag to a sepcific revision
=20=20sstate: Improve performance by moving files rather than using copy =
and delet
=20=20python: Fix libdir usage which broke python packaging

Saul Wold (2):
=20=20gcc: Fix packaging correctly
=20=20Patches: Fix Upstream-Status info

Scott Garman (1):
=20=20distro-tracking: add RECIPE_MANUAL_CHECK_DATE for various recipes

Yu Ke (11):
=20=20native.bbclass: generate libdir from libdir_native
=20=20openssl: fix for non /usr/lib libdir case
=20=20python: fix for libdir=3D/usr/lib64 case
=20=20python-native: fix for non /usr/lib libdir case
=20=20perl: fix for non /usr/lib libdir case
=20=20libcap: fix for non /usr/lib libdir case
=20=20rpm: fix for non /usr/lib libdir case
=20=20sato-sdk: add clutter for sato-sdk image
=20=20xserver-kdrive: add patch upstream status info
=20=20sat-solver: fix for non /usr/lib libdir case
=20=20libzypp: fix for non /usr/lib libdir case

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Khem Raj (2):
=20=20icon-naming-utils: inherit allarch
=20=20icon-naming-utils: Inherit perlnative

Koen Kooi (10):
=20=20mm-common: add 0.9.5
=20=20libsigc++: add 2.2.9
=20=20glibmm: add 2.28.2
=20=20cairo: update to 1.10.2
=20=20cairomm: add 1.10.0
=20=20pangomm: add 2.28.2
=20=20gtkmm: add 2.20.0
=20=20pavucontrol: add 0.9.10+git
=20=20jack 0.121.0: import from OE.dev
=20=20midori 0.3.6: fix source checksums

Tom Rini (1):
=20=20icon-naming-utils-native: Fix long path to perl in icon-name-mapping

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Khem Raj (3):
=20=20angstrom-bleeding: Pin eglibc-locale version
=20=20angstrom-uclibc: Use tclibc-uclibc defaults from oe-core
=20=20angstrom-eglibc: Use tclibc-eglibc defaults from oe-core

Koen Kooi (2):
=20=20angstrom: prefer cairo 1.10.2
=20=20angstrom-zeroconf-audio: move to tasks and clean up

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Andrea Adami (3):
=20=20image_types.bbclass: add support for tar.xz, cpio.xz, cpio.lzma
=20=20kernel.bbclass: handle embedding of initramfs images
=20=20kernel.bbclass: remove unintended change of INITRAMFS_TASK

Chris Elston (1):
=20=20Add support for BAD_RECOMMENDATIONS to rootfs_ipk

Darren Hart (2):
=20=20bb-matrix: initial scripts to record TIME(1) metrics for BB and PM =
combinati
=20=20bb-matrix: correct BB and PM number canonicalization

Joshua Lock (4):
=20=20ui/crumbs/tasklistmodel: update brought in by column when possible
=20=20ui/crumbs/tasklistmodel: fix automatic removal of orphaned items
=20=20classes/image_types: add a variable to list available IMAGE_FSTYPE's
=20=20cooker: only return *Found events if something was actually found

Khem Raj (1):
=20=20opkg-utils: Print out License field

Koen Kooi (8):
=20=20pulseaudio: try harder to disable HAL
=20=20pulseaudio 0.9.15: delete, but keep 0.9.22 and 0.9.23
=20=20webkit-gtk: update SRCREV
=20=20pulseaudio: make it work out of the box
=20=20ofono: fix packaging and clean up custom do_install
=20=20connman-gnome: run oe-stylize over recipe
=20=20pulseaudio: enable bluetooth support
=20=20package_ipk: add License field to control file

Mark Hatle (1):
=20=20ncurses: Fix site_config

Nitin A Kamble (5):
=20=20kernel.bbclass: fix the broken lines
=20=20glibc: fix false failure
=20=20binutils: package unpackaged files
=20=20eglibc: fix installed but not packaged files
=20=20eglibc: fix runtime assertion failure

Otavio Salvador (2):
=20=20libarchive: remove undistributable copyright content from source
=20=20cmake: update to 2.8.5 release

Paul Eggleton (2):
=20=20busybox: fix missing features due to lack of variable expansion
=20=20insane.bbclass: skip rdepends QA checks for kernel / modules

Phil Blundell (7):
=20=20kernel.bbclass, task-base: remove references to obsolete =
bluez-dtl1-workarou
=20=20bluez-dtl1-workaround: deleted
=20=20eglibc: ensure that NSS libs go into the right package when =
${base_libdir} a
=20=20openssl: pass ${mandir} explicitly to "make install"
=20=20insane: make GNU_HASH check slightly more robust (avoids false =
negatives wit
=20=20busybox: respect ${LDFLAGS}
=20=20eglibc: fix packaging of thread_db

Richard Purdie (4):
=20=20sysklogd: Drop ONLINE_PACKAGE_MANAGEMENT as per mailing list =
discussion
=20=20update-rc.d: Switch from a tag to a sepcific revision
=20=20sstate: Improve performance by moving files rather than using copy =
and delet
=20=20python: Fix libdir usage which broke python packaging

Robert P. J. Day (1):
=20=20scripts: Rename "adt-install" to "adt-installer" in user help.

Saul Wold (2):
=20=20gcc: Fix packaging correctly
=20=20Patches: Fix Upstream-Status info

Scott Garman (1):
=20=20distro-tracking: add RECIPE_MANUAL_CHECK_DATE for various recipes

Tom Rini (4):
=20=20hicolor-icon-theme: Use ${BPN}-${PV} not ${P} to unbreak nativesdk
=20=20groff: Disable x11 support
=20=20libpcre: Add bzip2, zlib and readline to DEPENDS
=20=20perl: Use SITEINFO variables not functions

Yu Ke (12):
=20=20native.bbclass: generate libdir from libdir_native
=20=20openssl: fix for non /usr/lib libdir case
=20=20python: fix for libdir=3D/usr/lib64 case
=20=20python-native: fix for non /usr/lib libdir case
=20=20perl: fix for non /usr/lib libdir case
=20=20libcap: fix for non /usr/lib libdir case
=20=20rpm: fix for non /usr/lib libdir case
=20=20sato-sdk: add clutter for sato-sdk image
=20=20fetcher2: retry mirror if upstream checksum mismatch
=20=20xserver-kdrive: add patch upstream status info
=20=20sat-solver: fix for non /usr/lib libdir case
=20=20libzypp: fix for non /usr/lib libdir case

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-texasinstruments:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-micro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-slugos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nslu2:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Tom Zanussi (1):
=20=20meta-emenlow: fix glx bug

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:

Marco Cavallini (2):
=20=20kaeilos.conf: changed version identifier
=20=20linux-2.6.28/mh355/defconfig: updated configuration file for mh355 =
kernel




