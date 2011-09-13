Received: from oh-69-34-21-229.sta.embarqhsd.net ([69.34.21.229]
	helo=happy.bec-systems.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1R3VTm-0001B1-On; Tue, 13 Sep 2011 18:04:59 +0200
Received: from localhost.localdomain ([127.0.0.1] helo=happy.bec-systems.com)
	by happy.bec-systems.com with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1R3VOl-0003JM-Aa; Tue, 13 Sep 2011 11:59:47 -0400
Date: Tue, 13 Sep 2011 11:59:47 -0400
Message-Id: <E1R3VOl-0003JM-Aa@happy.bec-systems.com>
X-Mailer: Nodemailer (0.1.13; +http://www.nodemailer.org)
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org
MIME-Version: 1.0
Subject: OE Changelog for 2011-09-5 to 2011-09-12
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
X-List-Received-Date: Tue, 13 Sep 2011 16:04:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Changelog for 2011-09-5 to 2011-09-12.  Projects included in this report:

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
meta-handheld: git://git.openembedded.org/meta-handheld
meta-opie: git://git.openembedded.org/meta-opie
openembedded: git://git.openembedded.org/openembedded

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for bitbake:

Dmitry Eremin-Solenikov (1):
=20=20lib/bb/siggen.py: return a string from noop get_taskhash

Joshua Lock (6):
=20=20hob: use both pre and post files for hob configuration
=20=20hob: reflect defaultsetup being default distro
=20=20hob: add a test to ensure hob is run with the required pre and post =
files
=20=20ui/crumbs/hobprefs: disable 'build toolchain with headers'
=20=20ui/crumbs/runningbuild: mask run_buildstats failure
=20=20hob: disable removal of packages

Paul Eggleton (2):
=20=20hob: clear out temporary file list after deleting
=20=20hob: fix segfault on second build

Richard Purdie (2):
=20=20runqueue: Ensure task environment is correct
=20=20runqueue.py: Ensure fakeroot variables are reflected in the datastore

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Bruce Ashfield (5):
=20=20linux-yocto: generalize kernel config search pattern
=20=20linux-yocto: update to v3.0.4
=20=20linux-yocto: clean configuration for v3.0.4
=20=20linux-yocto: re-enable systemtap
=20=20linux-yocto: re-enable utrace

Denis Carikli (3):
=20=20image_types: Fix ubi images creation
=20=20mtd-utils: update to version to 1.4.6
=20=20busybox: update to 1.8.5

Dexuan Cui (2):
=20=20populate_sdk_deb.bbclass: add the missing parameter - for tar
=20=20package_deb.bbclass: put the stderr into log.do_xxx-attemptonly.xxx

Dmitry Eremin-Solenikov (3):
=20=20image_types.bbclass: use per-image dirs for extX.gz images generation
=20=20qt-demo-init: fix init script
=20=20icu-3.6: fix building with big make -j

Dongxiao Xu (4):
=20=20telepathy-python: avoid duplicated installation of errors.py
=20=20multilib_global.bbclass: handle kernel-module-* for multilib
=20=20multilib: Remove the multilib extension for linux-yocto
=20=20hal: Add virtual/kernel as hal's build dependency

Eric B=C3=A9nard (1):
=20=20resolvconf: switch to 1.59 as 1.58 was removed from debian ftp

Joshua Lock (2):
=20=20scripts/hob: update to match recent hob changes
=20=20scripts/hob: notify the user when the GUI won't launch immediately

Lianhao Lu (1):
=20=20initramfs-live-install: Be consistent with grub.

Mark Hatle (1):
=20=20prelink: Update to latest upstream version

Paul Eggleton (5):
=20=20git: fix sstate relocation for git-native
=20=20core-image.bbclass: zap root password if debug-tweaks not enabled
=20=20sanity.bbclass: re-enable DISTRO check
=20=20meta/recipes.txt: correct Qt capitalisation
=20=20base.bbclass: fix substring matching in COMMERCIAL_LICENSE

Phil Blundell (4):
=20=20pango: use qemu to generate pango.modules during rootfs construction
=20=20useradd.bbclass: use correct value for $D in postinst functions
=20=20avahi: only use gtk if DISTRO_FEATURES includes x11
=20=20shadow: add patch for useradd lossage

Richard Purdie (6):
=20=20glib-networking: Ensure certificates are consistently disabled
=20=20sstate: Avoid contention between sstate packages
=20=20terminal.bbclass: Improve environment handling
=20=20imagetest-qemu/runqueue: Since we no longer support BUILDDIR, use =
TMPDIR
=20=20runqemu-internal: Hide some harmless warning messages
=20=20bitbake.conf: Default to explicitly setting the variable to disable =
pseudo

Saul Wold (8):
=20=20groff: Fix sstate relocation issue
=20=20opensp: Fix sstate relocation issue
=20=20web: Update SRCREV to address ccs_parser_parse_stylesheet arg =
mismatch     [
=20=20cpan.bbclass: fix native perl issue
=20=20gcc: add patch for ice 50099, which caused lttng-ust not to build
=20=20gettext: use included libxml and libcroco
=20=20python-native: add link for python2
=20=20Revert "opensp: Fix sstate relocation issue"

Scott Garman (2):
=20=20runqemu: standardize ability to specify custom qemu/kenel boot options
=20=20runqemu: improve auto-detection of rootfs filenames

Tom Zanussi (2):
=20=20systemtap: upgrade to 1.6
=20=20task-core-tools: add systemtap to qemuarm

Xiaofeng Yan (1):
=20=20qt4e-demo-image: Ensure a shell is present

Zhai Edwin (2):
=20=20xserver-nodm-init: Change hidraw mode to allow normal user access
=20=20site/x86_64: Add entries to fix conf error on x86_64

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Andrea Adami (2):
=20=20klibc_1.5.24: remove nostrip patch and fix packaging of klibc-utils
=20=20klibc: upgrade 1.5.24 to 1.5.25

Eric BENARD (1):
=20=20tzcode-native: switch to 2011i as 2011g is no more fetchable

Joel A Fernandes (11):
=20=20gedit: Imported from OE classic
=20=20gtksourceview: Imported from OE classic
=20=20libgnomecups: Imported from OE Classic
=20=20libgnomeprint: Imported from OE classic
=20=20faad2: Imported from OE classic
=20=20libdvdread: Imported from OE classic
=20=20libdvdcss: Imported from OE classic, vlc depends on it
=20=20vlc: Imported from OE classic
=20=20live555: Imported from OE classic
=20=20xsp: Imported from OE classic
=20=20xpext: Imported from OE classic

Koen Kooi (1):
=20=20vlc: remove hal dependency, fix PR

Noor Ahsan (1):
=20=20python-lxml: Add version 2.2.8 (initial recipe)

lumag (2):
=20=20openssl: fully fix parallel builds
=20=20tcp-wrappers: drop emptying PARALLEL_MAKE

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Koen Kooi (1):
=20=20angstrom-core tweaks: empty COMMERCIAL_LICENSE

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Bruce Ashfield (6):
=20=20linux-yocto/meta-yocto: update SRCREV for v3.0.4
=20=20linux-yocto: generalize kernel config search pattern
=20=20linux-yocto: update to v3.0.4
=20=20linux-yocto: clean configuration for v3.0.4
=20=20linux-yocto: re-enable systemtap
=20=20linux-yocto: re-enable utrace

Darren Hart (2):
=20=20linux-yocto: remove emenlow from meta-yocto bbappend
=20=20beagleboard: document how to enable the hard floating point abi

Denis Carikli (3):
=20=20image_types: Fix ubi images creation
=20=20mtd-utils: update to version to 1.4.6
=20=20busybox: update to 1.8.5

Dexuan Cui (2):
=20=20populate_sdk_deb.bbclass: add the missing parameter - for tar
=20=20package_deb.bbclass: put the stderr into log.do_xxx-attemptonly.xxx

Dmitry Eremin-Solenikov (4):
=20=20lib/bb/siggen.py: return a string from noop get_taskhash
=20=20image_types.bbclass: use per-image dirs for extX.gz images generation
=20=20qt-demo-init: fix init script
=20=20icu-3.6: fix building with big make -j

Dongxiao Xu (4):
=20=20telepathy-python: avoid duplicated installation of errors.py
=20=20multilib_global.bbclass: handle kernel-module-* for multilib
=20=20multilib: Remove the multilib extension for linux-yocto
=20=20hal: Add virtual/kernel as hal's build dependency

Eric B=C3=A9nard (1):
=20=20resolvconf: switch to 1.59 as 1.58 was removed from debian ftp

Joshua Lock (8):
=20=20hob: use both pre and post files for hob configuration
=20=20hob: reflect defaultsetup being default distro
=20=20hob: add a test to ensure hob is run with the required pre and post =
files
=20=20ui/crumbs/hobprefs: disable 'build toolchain with headers'
=20=20ui/crumbs/runningbuild: mask run_buildstats failure
=20=20hob: disable removal of packages
=20=20scripts/hob: update to match recent hob changes
=20=20scripts/hob: notify the user when the GUI won't launch immediately

Lianhao Lu (1):
=20=20initramfs-live-install: Be consistent with grub.

Mark Hatle (1):
=20=20prelink: Update to latest upstream version

Paul Eggleton (7):
=20=20hob: clear out temporary file list after deleting
=20=20hob: fix segfault on second build
=20=20git: fix sstate relocation for git-native
=20=20core-image.bbclass: zap root password if debug-tweaks not enabled
=20=20sanity.bbclass: re-enable DISTRO check
=20=20meta/recipes.txt: correct Qt capitalisation
=20=20base.bbclass: fix substring matching in COMMERCIAL_LICENSE

Phil Blundell (4):
=20=20pango: use qemu to generate pango.modules during rootfs construction
=20=20useradd.bbclass: use correct value for $D in postinst functions
=20=20avahi: only use gtk if DISTRO_FEATURES includes x11
=20=20shadow: add patch for useradd lossage

Richard Purdie (8):
=20=20glib-networking: Ensure certificates are consistently disabled
=20=20sstate: Avoid contention between sstate packages
=20=20runqueue: Ensure task environment is correct
=20=20terminal.bbclass: Improve environment handling
=20=20imagetest-qemu/runqueue: Since we no longer support BUILDDIR, use =
TMPDIR
=20=20runqemu-internal: Hide some harmless warning messages
=20=20bitbake.conf: Default to explicitly setting the variable to disable =
pseudo
=20=20runqueue.py: Ensure fakeroot variables are reflected in the datastore

Saul Wold (8):
=20=20groff: Fix sstate relocation issue
=20=20opensp: Fix sstate relocation issue
=20=20web: Update SRCREV to address ccs_parser_parse_stylesheet arg =
mismatch [YOCT
=20=20cpan.bbclass: fix native perl issue
=20=20gcc: add patch for ice 50099, which caused lttng-ust not to build
=20=20gettext: use included libxml and libcroco
=20=20python-native: add link for python2
=20=20Revert "opensp: Fix sstate relocation issue"

Scott Garman (2):
=20=20runqemu: standardize ability to specify custom qemu/kenel boot options
=20=20runqemu: improve auto-detection of rootfs filenames

Tom Zanussi (2):
=20=20systemtap: upgrade to 1.6
=20=20task-core-tools: add systemtap to qemuarm

Xiaofeng Yan (1):
=20=20qt4e-demo-image: Ensure a shell is present

Zhai Edwin (2):
=20=20xserver-nodm-init: Change hidraw mode to allow normal user access
=20=20site/x86_64: Add entries to fix conf error on x86_64

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-texasinstruments:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

Martin Jansa (6):
=20=20linux-openmoko-2.6.39: drop last ts patch
=20=20meta-zaurus: drop from meta-smartphones
=20=20recipes: be carefull with # comments ending with backslash
=20=20connman: add bbappend and init script ignoring more interfaces
=20=20u-boot: fix included config s/nolo/init/g
=20=20u-boot: fix included config s/atags/atagaddr/g

Simon Busch (11):
=20=20meta-aurora: aurora-version: add LIC_FILES_CHKSUM for license check
=20=20meta-aurora: aurora-image: various fixes and bump PR
=20=20meta-palm: linux-palmpre: switch to devtmpfs enabled kernel and =
update defco
=20=20meta-palmpre: initscripts: add initscript for mounting devtmpfs on =
startup
=20=20meta-aurora: netbase: use usb0 as default and only network interface =
and bum
=20=20meta-aurora: tslib: add git version but with D_P =3D "-1"
=20=20meta-palmpre: tslib: add machine specific configuration files
=20=20meta-palm: tsmd: import from oe-dev
=20=20meta-palm: lvm2: adjust configuration for some machine specific things
=20=20meta-palm: machine: introduce MACHINE_EXTRA_RDEPENDS
=20=20meta-palm: tslib: fix FILESEXTRAPATHS to include right directory and =
bump PR

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-micro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-slugos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nslu2:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Darren Hart (2):
=20=20n450: update linux-yocto SRCREV to 3.0.4
=20=20n450: update linux-yocto PREFERRED_VERSION to 3.0%

Tom Zanussi (3):
=20=20meta-intel: update SRCREVs
=20=20meta-intel: update SRCREVs
=20=20grub2: update license version

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-handheld:

Dmitry Eremin-Solenikov (1):
=20=20nandlogical: correct oobblock/writesize patch

Paul Eggleton (2):
=20=20linux.inc: fix use of LOGO_SIZE in SRC_URI
=20=20linux.inc: set debug level according to oe-core

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-opie:

Paul Eggleton (5):
=20=20qmake_base.bbclass: remove in favour of the one in OE-core
=20=20libdbus-qt2: add new recipe for git version
=20=20libopie2: remove DEFAULT_PREFERENCE of -1 from git version
=20=20libopie2: add libdbus-qt2 dependency for libopiebluez2
=20=20preferred-opie-git-versions.inc: update to more recent git version

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:

Andreas Oberritter (1):
=20=20libdca: fix sed failing on unpack

Paul Menzel (1):
=20=20zeromq: Remove redundant `S =3D "${WORKDIR}/zeromq-${PV}"`

Sylvain 'GarthPS' Par=C3=A9 (1):
=20=20binutils: Update from 2.21 to 2.21.1a




