Received: from oh-69-34-21-229.sta.embarqhsd.net ([69.34.21.229]
	helo=happy.bec-systems.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1QyRJQ-0003Kf-BP; Tue, 30 Aug 2011 18:37:21 +0200
Received: from localhost ([127.0.0.1] helo=happy.bec-systems.com)
	by happy.bec-systems.com with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1QyREf-0008Tl-4g; Tue, 30 Aug 2011 12:32:25 -0400
Date: Tue, 30 Aug 2011 12:32:25 -0400
Message-Id: <E1QyREf-0008Tl-4g@happy.bec-systems.com>
X-Mailer: Nodemailer (0.1.13; +http://www.nodemailer.org)
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org
MIME-Version: 1.0
Subject: OE Changelog for 2011-08-22 to 2011-08-29
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
X-List-Received-Date: Tue, 30 Aug 2011 16:37:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Changelog for 2011-08-22 to 2011-08-29.  Projects included in this report:

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

Dongxiao Xu (1):
=20=20data_smart.py: make use of expand cache in getVar()

Joshua Lock (17):
=20=20bb/ui/crumbs/runningbuild: reduce number of messages after recent msg =
change
=20=20bb/ui/crumbs/runningbuild: hide the progress bar on cache load =
complete
=20=20bb/ui/crumbs/tasklistmodel: more robust checking for substrings
=20=20bb/ui/crumbs/tasklistmodel: remove useless items from dependency list
=20=20bb/ui/crumbs/tasklistmodel: store all binb, not just the first
=20=20hob: don't try and build if user selects Bake with no selections made
=20=20bb/ui/crumbs/tasklistmodel: track the PN for each entry in the model
=20=20bb/ui/hob: fix package only build
=20=20bb/ui/crumbs/hobeventhandler: fix return values of *_image_output_type
=20=20bb/ui/crumbs/hobprefs: fix setting IMAGE_FSYTPES
=20=20bb/ui/hob: warn and prevent image build if no IMAGE_FSTYPE is set
=20=20bb/fetch2/git: add checkstatus command
=20=20hob: don't set PARALLEL_MAKE and BB_NUMBER_THREADS based on cpu count
=20=20bb/ui/crumbs/tasklistmodel: fix find_reverse_depends method
=20=20hob: disable some menu entries whilst build is in progress
=20=20ui/crumbs/tasklistmodel: don't add same item to binb column more than =
once
=20=20ui/crumbs/runningbuild: add a 'Copy' item to the messages right-click =
menu

Richard Purdie (2):
=20=20fetch2/git: Add rsync as a valid git protocol
=20=20usermanual: The git fetcher defaults to the git protocol (or file)

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Bruce Ashfield (9):
=20=20linux-yocto: move more default values into linux-yocto.inc
=20=20linux-yocto: update SRCREVs for 3.0.3
=20=20kern-tools: allow flexible branch points
=20=20linux-yocto-rt: update qemuppc support and streamline variables
=20=20linux-yocto: update meta SRCREVs for beagleboard config changes
=20=20linux-yocto: update machines and default configuration
=20=20linux-yocto/2.6.37: apmd + get time of day fixes
=20=20linux-yocto: update meta SRCREV to sync version strings
=20=20linux-yocto-rt: qemumips: fix boot panic

Chris Larson (4):
=20=20libpcre: the generated libtool uses HOST_SYS
=20=20rpm: be certain we don't prefix our binaries
=20=20image_types_uboot: add uboot mkimage fs types
=20=20terminal: fix issue with unset exportable env vars

Darren Hart (2):
=20=20tune: add missing closing quote to arch-armv7a.inc for AVAILTUNES
=20=20tune: Add hard floating point variants of cortexa8 tunes

Dmitry Eremin-Solenikov (1):
=20=20opkg-utils: ignore packages disapperaring filelist generation

Dongxiao Xu (7):
=20=20procps: Fix lib path to support multilib
=20=20package.bbclass: Fix recrdeptask of image type recipes
=20=20base-passwd: Use BPN in FILES paths
=20=20bitbake.conf: Use BPN in FILES paths
=20=20multilib.bbclass: Fix renaming logic for "FILES_", "RDEPENDS_", etc
=20=20multilib.bbclass: add "pkg_postinst" and "pkg_postrm" as renaming =
elements
=20=20multilib.bbclass: add renaming for INITSCRIPT related variables

Jessica Zhang (1):
=20=20[YOCTO #1396] Fix adt-installer for consistent naming for powerpc and =
add al

Jiajun Xu (2):
=20=20libsdl: do not inherit nativesdk
=20=20task-core-x11-sato: add libsdl into sato image

Jingdong Lu (1):
=20=20initrdscripts: fix init-live.sh for hddimg and livecd

Joshua Lock (2):
=20=20libtasn1: update SRC_URI
=20=20classes/sanity: enhance the network connectivity test

Kang Kai (3):
=20=20bitbake.conf: set includedir_nativesdk
=20=20qt4-tools-nativesdk: remove gcc standard paths
=20=20cmake-nativesdk: remove gcc standard paths

Khem Raj (1):
=20=20recipes: Delete patch=3D1, its default and replace pnum with =
striplevel

Koen Kooi (1):
=20=20libc-package bbclass: fix binary localedata dependency code

Kumar Gala (2):
=20=20gcc-4.6: Drop gcc-poison-parameters.patch as its not need
=20=20gcc-4.5.1: Drop gcc-poison-parameters.patch, replace with bug fix =
patch

Lianhao Lu (3):
=20=20adt-installer: Removed the hard coded repo url.
=20=20toolchain-script.bbclass: Collected cached site config in runtime.
=20=20meta-toolchain/environment: Collected site config files in runtime.

Liming Wang (2):
=20=20script/runqemu: change boot command line for qemuppc
=20=20scripts/runqemu: disable unfs boot mode for qemuppc

Martin Jansa (2):
=20=20utils.bbclass: skip empty paths when handling FILESEXTRAPATHS
=20=20eglibc: fix gconv packaging after =
5486cac29db6e67051fff7637a0abc9aeab661e5

Mike Crowe (2):
=20=20kernel.bbclass: support kernel image type of vmlinux.gz
=20=20kernel.bbclass: Find the kernel consistently.

Otavio Salvador (4):
=20=20Use OECORE_DISTRO_VERSION instead of POKY_DISTRO_VERSION
=20=20kernel.bbclass: save kernel image name into $kerneldir
=20=20scripts/runqemu: add support to pass bootparams to kernel
=20=20scripts/combo-layer: fix configuration file handling

Paul Eggleton (4):
=20=20base.bbclass: clarify COMMERCIAL_LICENSE skip reason
=20=20scripts/combo-layer: fix overzealous regex in default hook script
=20=20image.bbclass, kernel.bbclass: remove non-standard -n option from cp =
command
=20=20binutils: update to 2.21.1a

Phil Blundell (2):
=20=20mips32: add mips32el tuning
=20=20pango: make x11 support conditional on DISTRO_FEATURES

Robert Yang (1):
=20=20bitbake meta-toolchain with gcc 4.5.1 failed

Saul Wold (1):
=20=20at: fix RDEPENDS -> RDEPENDS_${PN}

Wenzong Fan (2):
=20=20cronie: Updates to cronie
=20=20libpam: Setting suid bit for unix_chkpwd

Xiaofeng Yan (1):
=20=20qt4e-demo-image: Fix bug 999

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Koen Kooi (3):
=20=20Merge remote branch 'meta-oe-contrib/jansa/meta-oe'
=20=20systemd: update to v34
=20=20connman: update to 0.77

Martin Jansa (3):
=20=20e-base: bump EFL_SRCREV
=20=20elementary: add new elementary-accessibility package and improve =
packaging
=20=20xterm: import from oe.dev

Otavio Salvador (3):
=20=20freerdp: bump SRCREV to gather major RemoteFX improvements
=20=20kernel.bbclass: fix spacing to reduce delta between oe-core and =
meta-oe
=20=20kernel.bbclass: save kernel image name into $kerneldir

Sebastian Krzyszkowiak (1):
=20=20edje: include epp in edje-utils package. Fixes edje_cc

pespin (1):
=20=20elfe: Add LIC_FILES_CHKSUM to recipe

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Bruce Ashfield (12):
=20=20linux-yocto: move more default values into linux-yocto.inc
=20=20linux-yocto: update SRCREVs for 3.0.3
=20=20kern-tools: allow flexible branch points
=20=20linux-yocto-rt: update qemuppc support and streamline variables
=20=20meta-yocto: atom-pc/mpc8315e-rdb change preferred version to 3.0
=20=20linux-yocto/meta-yocto: update SRCREVs for 3.0.3 and consolidated =
fixes
=20=20meta-yocto: make qemu machines prefer linux-yocto_3.0
=20=20linux-yocto: update meta SRCREVs for beagleboard config changes
=20=20linux-yocto: update machines and default configuration
=20=20linux-yocto/2.6.37: apmd + get time of day fixes
=20=20linux-yocto: update meta SRCREV to sync version strings
=20=20linux-yocto-rt: qemumips: fix boot panic

Chris Larson (4):
=20=20libpcre: the generated libtool uses HOST_SYS
=20=20rpm: be certain we don't prefix our binaries
=20=20image_types_uboot: add uboot mkimage fs types
=20=20terminal: fix issue with unset exportable env vars

Darren Hart (2):
=20=20tune: add missing closing quote to arch-armv7a.inc for AVAILTUNES
=20=20tune: Add hard floating point variants of cortexa8 tunes

Dmitry Eremin-Solenikov (1):
=20=20opkg-utils: ignore packages disapperaring filelist generation

Dongxiao Xu (8):
=20=20procps: Fix lib path to support multilib
=20=20package.bbclass: Fix recrdeptask of image type recipes
=20=20base-passwd: Use BPN in FILES paths
=20=20bitbake.conf: Use BPN in FILES paths
=20=20multilib.bbclass: Fix renaming logic for "FILES_", "RDEPENDS_", etc
=20=20multilib.bbclass: add "pkg_postinst" and "pkg_postrm" as renaming =
elements
=20=20multilib.bbclass: add renaming for INITSCRIPT related variables
=20=20data_smart.py: make use of expand cache in getVar()

Jessica Zhang (1):
=20=20Fix adt-installer for consistent naming for powerpc and add all arch =
templat

Jiajun Xu (2):
=20=20libsdl: do not inherit nativesdk
=20=20task-core-x11-sato: add libsdl into sato image

Jingdong Lu (2):
=20=20mpc8315e-rdb: add kernel modules to rootfs
=20=20initrdscripts: fix init-live.sh for hddimg and livecd

Joshua Lock (19):
=20=20bb/ui/crumbs/runningbuild: reduce number of messages after recent msg =
change
=20=20bb/ui/crumbs/runningbuild: hide the progress bar on cache load =
complete
=20=20bb/ui/crumbs/tasklistmodel: more robust checking for substrings
=20=20bb/ui/crumbs/tasklistmodel: remove useless items from dependency list
=20=20bb/ui/crumbs/tasklistmodel: store all binb, not just the first
=20=20hob: don't try and build if user selects Bake with no selections made
=20=20bb/ui/crumbs/tasklistmodel: track the PN for each entry in the model
=20=20bb/ui/hob: fix package only build
=20=20bb/ui/crumbs/hobeventhandler: fix return values of *_image_output_type
=20=20bb/ui/crumbs/hobprefs: fix setting IMAGE_FSYTPES
=20=20bb/ui/hob: warn and prevent image build if no IMAGE_FSTYPE is set
=20=20libtasn1: update SRC_URI
=20=20bb/fetch2/git: add checkstatus command
=20=20hob: don't set PARALLEL_MAKE and BB_NUMBER_THREADS based on cpu count
=20=20bb/ui/crumbs/tasklistmodel: fix find_reverse_depends method
=20=20hob: disable some menu entries whilst build is in progress
=20=20classes/sanity: enhance the network connectivity test
=20=20ui/crumbs/tasklistmodel: don't add same item to binb column more than =
once
=20=20ui/crumbs/runningbuild: add a 'Copy' item to the messages right-click =
menu

Kang Kai (3):
=20=20bitbake.conf: set includedir_nativesdk
=20=20qt4-tools-nativesdk: remove gcc standard paths
=20=20cmake-nativesdk: remove gcc standard paths

Khem Raj (1):
=20=20recipes: Delete patch=3D1, its default and replace pnum with =
striplevel

Koen Kooi (1):
=20=20libc-package bbclass: fix binary localedata dependency code

Kumar Gala (2):
=20=20gcc-4.6: Drop gcc-poison-parameters.patch as its not need
=20=20gcc-4.5.1: Drop gcc-poison-parameters.patch, replace with bug fix =
patch

Lianhao Lu (3):
=20=20adt-installer: Removed the hard coded repo url.
=20=20toolchain-script.bbclass: Collected cached site config in runtime.
=20=20meta-toolchain/environment: Collected site config files in runtime.

Liming Wang (2):
=20=20script/runqemu: change boot command line for qemuppc
=20=20scripts/runqemu: disable unfs boot mode for qemuppc

Martin Jansa (2):
=20=20utils.bbclass: skip empty paths when handling FILESEXTRAPATHS
=20=20eglibc: fix gconv packaging after =
5486cac29db6e67051fff7637a0abc9aeab661e5

Mike Crowe (2):
=20=20kernel.bbclass: support kernel image type of vmlinux.gz
=20=20kernel.bbclass: Find the kernel consistently.

Otavio Salvador (4):
=20=20Use OECORE_DISTRO_VERSION instead of POKY_DISTRO_VERSION
=20=20kernel.bbclass: save kernel image name into $kerneldir
=20=20scripts/runqemu: add support to pass bootparams to kernel
=20=20scripts/combo-layer: fix configuration file handling

Paul Eggleton (16):
=20=20base.bbclass: clarify COMMERCIAL_LICENSE skip reason
=20=20scripts/combo-layer: fix overzealous regex in default hook script
=20=20image.bbclass, kernel.bbclass: remove non-standard -n option from cp =
command
=20=20documentation: correct QT to Qt
=20=20documentation: manpage -> help output
=20=20documentation: typo, spelling & minor grammar fixes
=20=20documentation: SITEINFO_ENDIANESS -> SITEINFO_ENDIANNESS
=20=20documentation: improve LIC_FILES_CHKSUM documentation
=20=20documentation: ensure all examples have LIC_FILES_CHKSUM
=20=20documentation: update TERMCMD/TERMCMDRUN documentation
=20=20documentation: update for directdisk/live image changes
=20=20documentation: update BBFILE_* variable documentation
=20=20documentation: set titles for all documents
=20=20documentation: update documentation for SRCREV variable
=20=20documentation: clarify specifying a specific package with -e
=20=20binutils: update to 2.21.1a

Phil Blundell (2):
=20=20mips32: add mips32el tuning
=20=20pango: make x11 support conditional on DISTRO_FEATURES

Richard Purdie (2):
=20=20fetch2/git: Add rsync as a valid git protocol
=20=20usermanual: The git fetcher defaults to the git protocol (or file)

Robert Yang (1):
=20=20bitbake meta-toolchain with gcc 4.5.1 failed

Saul Wold (1):
=20=20at: fix RDEPENDS -> RDEPENDS_${PN}

Scott Rifenbark (43):
=20=20documentation/adt-manual/adt-package.xml: Fixed typo and long commands
=20=20documentation/kernel-manual/kernel-how-to.xml: command indentation =
fixed.
=20=20documentation/yocto-project-qs/yocto-project-qs.xml: changed to 1.1.
=20=20documentation/adt-manual/adt-command.xml: fixed double dash display.
=20=20documentation/adt-manual/adt-eclipse.xml: Fixed double dash display.
=20=20documentation/adt-manual/adt-prepare.xml: changed 1.0 to 1.1
=20=20documentation/yocto-project-qs/yocto-project-qs.xml: fixed double dash
=20=20documentation/poky-ref-manual/usingpoky.xml: Fixed double dash =
display.
=20=20documentation/dev-manual: Incorporated Joshua Lock's review comments.
=20=20documentation/poky-ref-manual/figures/poky-title.png: Changed Title
=20=20documentation/poky-ref-manual/development.xml: Updated software dev =
intro
=20=20documentation/dev-manual/dev-manual-newbie.xml: Updated term list.
=20=20documentation/poky-ref-manual/development.xml: re-write of software =
dev sect
=20=20documentation/dev-manual/figures: Figure updates
=20=20documentation/poky-ref-manual/usingpoky.xml: YOCTO #1001 - new =
section added
=20=20documentation/poky-ref-manual/usingpoky.xml: re-write for Yocto
=20=20documentation/poky-ref-manual: Changed top-level titles
=20=20documentation/poky-ref-manual/resources.xml: Changed title
=20=20documentation/poky-ref-manual/introduction.xml: re-write for YP
=20=20documentation/poky-ref-manual/usingpoky.xml: small edits to list and =
title
=20=20documentation/poky-ref-manual/development.xml: updates for YP terms
=20=20documentation/poky-ref-manual/development.xml: Garman's partial =
review comme
=20=20documentation/poky-ref-manual/extendpoky.xml: scrubbed for Poky
=20=20documentation/poky-ref-manual/figures/ss-sato.png: deleted figure.
=20=20documentation/Makefile: Removed sato image from tarfile list in =
poky-ref-man
=20=20documentation/bsp-guide/bsp.xml: General updates
=20=20documentation/poky-ref-manual: Removed figures from file structure.
=20=20documentation/poky-ref-manual/ref-structure.xml: Scrubbed for Poky =
and edits
=20=20documentation/poky-ref-manual/ref-bitbake.xml: scrubbed for Poky
=20=20documentation/poky-ref-manual/ref-classes.xml: Scrubbed for Poky
=20=20documentation/poky-ref-manual/ref-images.xml: Reformats of the =
Docbook code.
=20=20documentation/poky-ref-manual/ref-features.xml: Cleaned up list =
formatting.
=20=20documentation/poky-ref-manual/ref-variables.xml: partial edits.
=20=20documentation/poky-ref-manual/ref-variables.xml: Scrubbed for Poky
=20=20documentation/poky-ref-manual/ref-variables.xml: Fixed default format
=20=20documentation/poky-ref-manual/introduction.xml: Title changed.
=20=20documentation/poky-ref-manual/ref-varlocality.xml: Reformatted
=20=20documentation/poky-ref-manual/ref-variables.xml: Fixed links
=20=20documentation/yocto-project-qs/yocto-project-qs.xml: Fixed manual =
references
=20=20documentation: Changes to Paul Eggleton's edits for various manuals.
=20=20documentation/poky-ref-manual/faq.xml: Edits to scrub for Poky
=20=20documentation/poky-ref-manual/faq.xml: Edits to scrub for Poky
=20=20docuementation/poky-ref-manual/ref-structure.xml: Changed SRCDATE =
reference

Wenzong Fan (2):
=20=20cronie: Updates to cronie
=20=20libpam: Setting suid bit for unix_chkpwd

Xiaofeng Yan (1):
=20=20qt4e-demo-image: Fix bug 999

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-texasinstruments:

Koen Kooi (5):
=20=20linux 3.0: fix uLCD poweron for beagleboard
=20=20linux 3.1: update to rc3
=20=20linux 3.0: make userpace governor the default on beagle
=20=20u-boot git: add omapl138 support
=20=20README: change pull request location

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

GNUtoo (1):
=20=20netbase: make usb0 comes up in /etc/network/interfaces

Lukas-David Gorris (2):
=20=20meta-smartphone/meta-htc: add htcleo
=20=20linux-qsd8.inc: remove xf86-input-evtouch (unbuildable and not needed)

Martin Jansa (16):
=20=20netbase: removed PACKAGE_ARCH switch after talking with GNUtoo
=20=20meta-nokia, meta-openmoko: s/-/_/g in kernel modules for =
module_autoload dir
=20=20meta-nokia: add few more autoloaded modules per dos1 request
=20=20meta-nokia: add few less autoloaded modules per dos1 request
=20=20meta-nokia: add omap3-isp autoload
=20=20SHR: use shadow as login_manager
=20=20cornucopia: bump SRCREV
=20=20msmcomm: bump SRCREV
=20=20mioctl: remove extra '.git' from SRC_URI
=20=20linux-openmoko.inc: drop creating latest link (it was missing =
DATETIME anywa
=20=20linux-2.6.39: fix SRC_URI
=20=20shr-wizard: remove empty line from volatiles-98-appshadow
=20=20cornucopia: bump SRCREV
=20=20cornucopia: bump SRCREV
=20=20linux-2.6.39: add snd modules to om-gta0[12] defconfigs
=20=20linux-openmoko: fix build with jack

Sebastian Krzyszkowiak (2):
=20=20fsodeviced: RDEPEND on accelerometer-lis302 on Nokia N900
=20=20cornucopia: bump SRCREV

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-micro:

Phil Blundell (2):
=20=20micro: override DISTRO_FEATURES rather than appending to it; clear =
COMMERCIA
=20=20micro: don't use gold on mips

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-slugos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nslu2:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Bruce Ashfield (1):
=20=20meta-tlk: initial creation

Tom Zanussi (11):
=20=20meta-crownbay: switch to linux-yocto 3.0 kernel
=20=20meta-crownbay: new recipe for emgd 1.8 driver binaries
=20=20meta-crownbay: select emgd 1.8
=20=20meta-crownbay: xorg.conf changes
=20=20meta-fri2: add EMGD 1.8 capabilities to fri2
=20=20meta-intel: move emgd-driver-bin_1.8 to common
=20=20meta-fri2: add common/recipes-graphics to BBFILES
=20=20meta-intel: update meta-crownbay kernel SRCREVs
=20=20meta-crownbay: update README
=20=20meta-fri2: update README
=20=20meta-intel: update meta-emenlow kernel SRCREVs

Yu Ke (1):
=20=20emenlow xpsb-glx: add package libglu to fix lsb image build warning

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:

Paul Menzel (6):
=20=20lmbench-3.0-a9: Fix typo in patch file (s/bave/behave/)
=20=20lmbench: Order header fields according to style guide [1]
=20=20lmbench: Add `HOMEPAGE =3D "http://lmbench.sourceforge.net/"`
=20=20lmbench: Remove redundant `S =3D "${WORKDIR}/lmbench-${PV}"`
=20=20lmbench: Remove obsolete BitKeeper stuff
=20=20lmbench: Remove versions 2.0.4 and 2.5

Philip Balister (2):
=20=20glib-2.0: explicitly disable dtrace and systemtap for native variant
=20=20openjade: fix build with GCC 4.6




