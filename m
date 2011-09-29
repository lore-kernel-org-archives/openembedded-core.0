Received: from oh-69-34-21-229.sta.embarqhsd.net ([69.34.21.229]
	helo=happy.bec-systems.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1R9NK7-000571-EN; Thu, 29 Sep 2011 22:35:16 +0200
Received: from localhost.localdomain ([127.0.0.1] helo=happy.bec-systems.com)
	by happy.bec-systems.com with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1R9NEn-0006wJ-Jp; Thu, 29 Sep 2011 16:29:45 -0400
Date: Thu, 29 Sep 2011 16:29:45 -0400
Message-Id: <E1R9NEn-0006wJ-Jp@happy.bec-systems.com>
X-Mailer: Nodemailer (0.1.13; +http://www.nodemailer.org)
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org
MIME-Version: 1.0
Subject: OE Changelog for 2011-09-19 to 2011-09-26
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
X-List-Received-Date: Thu, 29 Sep 2011 20:35:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Changelog for 2011-09-19 to 2011-09-26.  Projects included in this report:

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

Joshua Lock (9):
=20=20ui/crumbs/hobprefs: re-enable reloading of data after prefs changes
=20=20hob: fix build again when building packages only
=20=20hob: enable package only builds even if an image has been built
=20=20ui/crumbs/runningbuild: fix log messages right-click menu
=20=20hob: fix opening of image output dir on image build completion
=20=20ui/crumbs/hobeventhandler: move remaining getVariable calls to init
=20=20ui/crumbs/hobeventhandler: fix variable name typo
=20=20hob: fix building with current selections after reparse
=20=20hob: store recipe path at load time

Julian Pidancet (1):
=20=20Fix mercurial fetcher in fetch2

Paul Eggleton (1):
=20=20bitbake/lib/bb/msg.py: fix setting debug and verbosity levels

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Anders Darander (3):
=20=20libzypp: git repo moved to github
=20=20sat-solver: git repo moved to github
=20=20zypper: git repo moved to github

Bruce Ashfield (3):
=20=20linux-yocto: simplify kernel configuration check expression
=20=20linux-yocto: add blktrace feature
=20=20linux-yocto: kernel configuration cleanups

Daniel Lazzari (2):
=20=20Fix alsa-utils package dependencies
=20=20alsa-lib: Don't use versioned symbols on uclibc builds as it causes =
strange=20

Darren Hart (1):
=20=20intltool: add libxml-parser-perl-native dependency to -native version

Dexuan Cui (2):
=20=20deb packages support: switch from /var/dpkg to /var/lib/dpkg
=20=20qemu-config: use pkg_postinst to generate the proper shutdown.desktop

Dmitry Eremin-Solenikov (18):
=20=20icecc-create-env: rename to -native
=20=20icecc.bbclass: fix handling of nativesdk and cross-canadian packages
=20=20insane.bbclass: don't warn on .so files in -nativesdk packages
=20=20avahi: include dbus interfaces definitions into daemon package
=20=20libgpg-error: drop common-lisp files
=20=20gtk+: packaging fixups
=20=20polkit: fixup packaging
=20=20gettext: shut up unshipped files warning
=20=20libxml2: reinclude a -staticdev package
=20=20glib-2.0: include glib-gettextize stuff
=20=20e2fsprogs: include devtools scripts
=20=20gcc: include plugin-related headers into packaged SDK
=20=20eglibc: fix packaging of some of nativesdk packages
=20=20bitbake.conf: change ccache path to use MULTIMACH_HOST_SYS
=20=20icecc-create-env-native: provide the script right in the tree
=20=20gcc: fix possible problems with nscd compilation during =
eglibc-nativesdk bui
=20=20gconf-dbus: packaging fixup
=20=20libffi: really populate -dev package

Dongxiao Xu (5):
=20=20rpm: add multilib prefix for archs under deploy/rpm
=20=20multilib: install MULTILIB_IMAGE_INSTALL
=20=20libpng: avoid dangling link in libpng package
=20=20rootfs_rpm: two step installation
=20=20libglade: fix the python environment settings

Khem Raj (3):
=20=20eglibc-2.12: Fix build on powerpc/603e
=20=20tcp-wrappers: Bump PR to make meta-oe merge
=20=20gnome-doc-utils: Prepend PKG_CONFIG_SYSROOT_DIR to the path returned =
from PK

Koen Kooi (2):
=20=20procps 3.2.8: remove initscript
=20=20bluez4: split gstreamer plugin into a seperate recipe

Mark Hatle (12):
=20=20Fix RPM dependencies
=20=20Add a run-time dependency that eglibc support GNU_HASH
=20=20busybox: Enhance to add dynamic per-file provides
=20=20multilib_global.bbclass: Fix non-multilib package provides
=20=20Update python dependencies to be simply to "python"
=20=20usbutils: Move the pkgconfig file(s) to the -dev package
=20=20perl: Fix a few perl binaries to use target interpreter paths
=20=20sudo: Fix PAM dependencies
=20=20task-core-lsb: Remove perl-dev
=20=20python: Fix cgi.py runtime issue
=20=20cups: Fix recipe to use the correct cups directories
=20=20foomatic-filters: Disable filter checking

Marko Kati=C4=87 (1):
=20=20bluez4: Replace deprecated configure switch

Otavio Salvador (3):
=20=20xserver-xf86-common.inc: use ${datadir} instead of /usr/share
=20=20xserver-xf86-dri-lite.inc: use ${datadir} instead of /usr/share
=20=20xserver-xf86-lite.inc: use ${datadir} instead of /usr/share

Paul Eggleton (1):
=20=20scripts/combo-layer: fix still overzealous regex in default hook =
script

Richard Purdie (18):
=20=20debian.bbclass: Fix hardcoded "lib" reference
=20=20libpng: Add RPROVIDES for backwards compatibiliy with previous libpng =
packag
=20=20glib-2.0: Fix python paths in scripts to use target paths
=20=20glib-2.0: Drop old 2.27.5 development version
=20=20Revert "eglibc: fix packaging of some of nativesdk packages"
=20=20diffstat: Fix a build failure when using libdir=3D/usr/lib64
=20=20diffstat: Add missing file from previous commit
=20=20multilib.bbclass: Partially fix multlib image targets
=20=20populate_sdk_rpm: add pkgconfig(pkg-config) to the list
=20=20gnome-desktop: Ensure we're deterministic about startup-notification =
depende
=20=20gtk+: Explicitly disable xinerama since we don't have it as a DEPENDS
=20=20cairo: Disable bfd symbol loopup since we don't list it in DEPENDS
=20=20libsndfile1: Disable external codec librbaries since we don't list in =
DEPEND
=20=20neon: Add libproxy to DEPENDS to ensure determinstic builds
=20=20autotools.bbclass: Set the dynamic linker search path for libtool =
correctly
=20=20base.bbclass: Drop legacy code that is no longer useful/used
=20=20sstate: No need to spew out a debug message per file, summarise =
instead
=20=20libtool: Fix an issue where unnecessary rpaths were being injected

Saul Wold (7):
=20=20distrodata: fix distro_check code
=20=20avahi: Refactor recipe to move UI to avahi-ui
=20=20oprofileui: Change avahi to avahi-ui depends
=20=20distro tracking: Update Distro Aliases
=20=20gnome-desktop: Fix python path in scripts to use target path
=20=20populate_sdk_rpm: add items to the INSTALL_PROVIDESNAME_RPM list
=20=20attr/acl: add SSTATEPOSTINSTFUNC

Zhai Edwin (2):
=20=20qemugl: Use local variable rather than "push" to save register
=20=20matchbox: Upgrade SRCREV to reflect recent accpeted patches by =
upstream

lumag (1):
=20=20gcc: include libgcov.a into libgcc-dev package

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Andreas M=C3=BCller (14):
=20=20gvfs: Fix paths in subpacks gvfsd-ftp / gvfsd-sftp / gvfsd-trash
=20=20xfce4-dev-tools: add native support
=20=20garcon: DEPENDS xfce4-dev-tools -> xfce4-dev-tools-native
=20=20libxfce4util: DEPENDS xfce4-dev-tools -> xfce4-dev-tools-native
=20=20xfce-utils: add openssh-misc to RDEPENDS_${PN}
=20=20xfce4-session: Bump to version 4.8.2
=20=20garcon: Bump to version 0.1.9
=20=20libxfce4util: Bump to version 4.8.2
=20=20gtk-xfce-engine: Bump to version 2.9.0 & minor cleanup
=20=20xfdesktop: Bump to version 4.8.3 & recreate patch
=20=20xfce4-notifyd: Add initial recipe with version 0.2.2
=20=20task-xfce-base: add xfce4-notifyd
=20=20thunar: Bump to version 1.2.3
=20=20xfce4-panel: Bump to version 4.8.6

Imran Mehmood (1):
=20=20twm: Add version 1.0.6 (initial recipe)

Joel A Fernandes (1):
=20=20libmad: Imported from OE-classic

Khem Raj (1):
=20=20gcc-4.5: Fix cross-gcc build for 64 bit targets

Koen Kooi (7):
=20=20systemd: bump SRCREV for automount fixes
=20=20gtksourceview2: update to 2.10.5
=20=20gedit: update to 2.30.4
=20=20openssl 1.0.0e: fix up link patch and make 1.0.0e the default openssl
=20=20systemd: add kernel time and summary into svg plot
=20=20task-xfce-base: bump PR
=20=20systemd: bump to v36

lumag (1):
=20=20openssl: fixup the openssl-fix-link patch

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Koen Kooi (3):
=20=20base-files: simply fstab
=20=20angstrom-task-gnome: add gedit and clearlooks-enabler
=20=20angstrom preferred versions: add more QT entries

lumag (1):
=20=20angstrom: do also pin -nativesdk packages

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Anders Darander (3):
=20=20libzypp: git repo moved to github
=20=20sat-solver: git repo moved to github
=20=20zypper: git repo moved to github

Bruce Ashfield (3):
=20=20linux-yocto: simplify kernel configuration check expression
=20=20linux-yocto: add blktrace feature
=20=20linux-yocto: kernel configuration cleanups

Christopher Larson (1):
=20=20taskdata: fix string formatting of an error message

Daniel Lazzari (2):
=20=20Fix alsa-utils package dependencies
=20=20alsa-lib: Don't use versioned symbols on uclibc builds as it causes =
strange=20

Darren Hart (1):
=20=20intltool: add libxml-parser-perl-native dependency to -native version

Dexuan Cui (2):
=20=20deb packages support: switch from /var/dpkg to /var/lib/dpkg
=20=20qemu-config: use pkg_postinst to generate the proper shutdown.desktop

Dmitry Eremin-Solenikov (13):
=20=20icecc-create-env: rename to -native
=20=20icecc.bbclass: fix handling of nativesdk and cross-canadian packages
=20=20insane.bbclass: don't warn on .so files in -nativesdk packages
=20=20avahi: include dbus interfaces definitions into daemon package
=20=20libgpg-error: drop common-lisp files
=20=20gtk+: packaging fixups
=20=20polkit: fixup packaging
=20=20gettext: shut up unshipped files warning
=20=20libxml2: reinclude a -staticdev package
=20=20glib-2.0: include glib-gettextize stuff
=20=20e2fsprogs: include devtools scripts
=20=20gcc: include plugin-related headers into packaged SDK
=20=20eglibc: fix packaging of some of nativesdk packages

Dongxiao Xu (5):
=20=20rpm: add multilib prefix for archs under deploy/rpm
=20=20multilib: install MULTILIB_IMAGE_INSTALL
=20=20libpng: avoid dangling link in libpng package
=20=20rootfs_rpm: two step installation
=20=20libglade: fix the python environment settings

Joshua Lock (10):
=20=20fetch2/wget: make checkstatus() quieter
=20=20ui/crumbs/hobprefs: re-enable reloading of data after prefs changes
=20=20hob: fix build again when building packages only
=20=20hob: enable package only builds even if an image has been built
=20=20ui/crumbs/runningbuild: fix log messages right-click menu
=20=20hob: fix opening of image output dir on image build completion
=20=20ui/crumbs/hobeventhandler: move remaining getVariable calls to init
=20=20ui/crumbs/hobeventhandler: fix variable name typo
=20=20hob: fix building with current selections after reparse
=20=20hob: store recipe path at load time

Julian Pidancet (1):
=20=20Fix mercurial fetcher in fetch2

Khem Raj (2):
=20=20eglibc-2.12: Fix build on powerpc/603e
=20=20tcp-wrappers: Bump PR to make meta-oe merge

Koen Kooi (2):
=20=20procps 3.2.8: remove initscript
=20=20bluez4: split gstreamer plugin into a seperate recipe

Mark Hatle (12):
=20=20Fix RPM dependencies
=20=20Add a run-time dependency that eglibc support GNU_HASH
=20=20busybox: Enhance to add dynamic per-file provides
=20=20multilib_global.bbclass: Fix non-multilib package provides
=20=20Update python dependencies to be simply to "python"
=20=20usbutils: Move the pkgconfig file(s) to the -dev package
=20=20perl: Fix a few perl binaries to use target interpreter paths
=20=20sudo: Fix PAM dependencies
=20=20task-core-lsb: Remove perl-dev
=20=20python: Fix cgi.py runtime issue
=20=20cups: Fix recipe to use the correct cups directories
=20=20foomatic-filters: Disable filter checking

Marko Kati=C4=87 (1):
=20=20bluez4: Replace deprecated configure switch

Martin Jansa (2):
=20=20fetch2/git: fix logger.debug
=20=20fetch2/git: be more carefull in _contains_ref when checking git log =
output

Otavio Salvador (3):
=20=20xserver-xf86-common.inc: use ${datadir} instead of /usr/share
=20=20xserver-xf86-dri-lite.inc: use ${datadir} instead of /usr/share
=20=20xserver-xf86-lite.inc: use ${datadir} instead of /usr/share

Paul Eggleton (6):
=20=20libgcrypt: add libcap to DEPENDS
=20=20libgnome-keyring: add libgcrypt to DEPENDS
=20=20freetype: disable bzip2 compressed font support
=20=20fetch2/git: fix subpath destination directory
=20=20scripts/combo-layer: fix still overzealous regex in default hook =
script
=20=20bitbake/lib/bb/msg.py: fix setting debug and verbosity levels

Richard Purdie (18):
=20=20debian.bbclass: Fix hardcoded "lib" reference
=20=20libpng: Add RPROVIDES for backwards compatibiliy with previous libpng =
packag
=20=20glib-2.0: Fix python paths in scripts to use target paths
=20=20glib-2.0: Drop old 2.27.5 development version
=20=20Revert "eglibc: fix packaging of some of nativesdk packages"
=20=20diffstat: Fix a build failure when using libdir=3D/usr/lib64
=20=20diffstat: Add missing file from previous commit
=20=20multilib.bbclass: Partially fix multlib image targets
=20=20populate_sdk_rpm: add pkgconfig(pkg-config) to the list
=20=20gnome-desktop: Ensure we're deterministic about startup-notification =
depende
=20=20gtk+: Explicitly disable xinerama since we don't have it as a DEPENDS
=20=20cairo: Disable bfd symbol loopup since we don't list it in DEPENDS
=20=20libsndfile1: Disable external codec librbaries since we don't list in =
DEPEND
=20=20neon: Add libproxy to DEPENDS to ensure determinstic builds
=20=20autotools.bbclass: Set the dynamic linker search path for libtool =
correctly
=20=20base.bbclass: Drop legacy code that is no longer useful/used
=20=20sstate: No need to spew out a debug message per file, summarise =
instead
=20=20libtool: Fix an issue where unnecessary rpaths were being injected

Saul Wold (7):
=20=20distrodata: fix distro_check code
=20=20avahi: Refactor recipe to move UI to avahi-ui
=20=20oprofileui: Change avahi to avahi-ui depends
=20=20distro tracking: Update Distro Aliases
=20=20gnome-desktop: Fix python path in scripts to use target path
=20=20populate_sdk_rpm: add items to the INSTALL_PROVIDESNAME_RPM list
=20=20attr/acl: add SSTATEPOSTINSTFUNC

Scott Rifenbark (34):
=20=20documentation/dev-manual/dev-manual-newbie.xml: re-write change submit
=20=20documentation/poky-ref-manual/resources.xml: re-wrote Contributions
=20=20documentation/adt-manual/adt-eclipse.xml: minor edits
=20=20documentation/adt-manual/adt-prepare.xml: writer notes and section =
format
=20=20documentation/adt-manual/adt-eclipse.xml: writer note and re-wording
=20=20documentation/adt-manual/adt-eclipse.xml: Fixed the section =
formatting.
=20=20documentation/dev-manual/dev-manual-newbie.xml: new terms
=20=20documentation/adt-manual/adt-prepare.xml: removed terms
=20=20documentation/adt-manual/adt-prepare.xml: toolchain enhancements
=20=20documentation/adt-manual/adt-prepare.xml: Title correction
=20=20documentation/adt-manual/adt-prepare.xml: applied Jessica Zhang =
revisions
=20=20documentation/adt-manual/adt-prepare.xml: fixed broken cross-link.
=20=20documentation/adt-manual/adt-eclipse.xml: various minor clean ups.
=20=20documentation/yocto-project-qs/yocto-project-qs.xml: General edits
=20=20documentation/yocto-project-qs/yocto-project-qs.xml: Fixed text for =
filesyst
=20=20documentation/dev-manual/dev-manual-intro.xml: re-wrote the intro =
paragraphs
=20=20documentation/dev-manual/dev-manual-intro.xml: minor edits.
=20=20documentation/dev-manual/dev-manual-start.xml: formats and =
re-wordings.
=20=20documentation/poky-ref-manual/resources.xml: Updates to mailing lists.
=20=20documentation/dev-manual/dev-manual-newbie.xml: edits and =
enhancements.
=20=20documentation/dev-manual/dev-manual-newbie.xml: addes link to commit =
page
=20=20documentation/dev-manual/dev-manual-kernel-appendix.xml: Robert =
Berger feedb
=20=20documentation/dev-manual/dev-manual-newbie.xml: note for maintainer
=20=20documentation/dev-manual: model changes and updated figure
=20=20documentation/dev-manual/dev-manual-kernel-appendix.xml: added line =
break
=20=20documentation/dev-manual/dev-manual-model.xml: Edits and start of app =
sectio
=20=20documentation/dev-manual: Added TM to first Eclipse in chapters.
=20=20documentation/dev-manual/figures/app-dev-flow.png: Updated app flow =
image
=20=20documentation/dev-manual/dev-manual-model.xml: edit pass
=20=20documentation/adt-manual/adt-command.xml: Note about running configure
=20=20documenation/poky-ref-manual/ref-variables.xml: debug-tweaks qualified
=20=20documentation/poky-ref-manual/ref-classes.xml: fixed insane.bbclass =
added ot
=20=20documentation/poky-ref-manual/ref-variables.xml: added =
BAD_RECOMMENDATIONS
=20=20documentation/poky-ref-manual/ref-classes.xml: documented =
useradd.bbclass

Zhai Edwin (2):
=20=20qemugl: Use local variable rather than "push" to save register
=20=20matchbox: Upgrade SRCREV to reflect recent accpeted patches by =
upstream

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-texasinstruments:

Jason Kridner (5):
=20=20u-boot: added version 2011.09
=20=20meta-ti: linux-3.0: beagle: defconfig: enable CONFIG_OMAP_MUX
=20=20meta-ti: linux-3.0: beagle: defconfig: add TSC2007
=20=20meta-ti: linux-3.0: beagle: defconfig: add some gadget drivers
=20=20meta-ti: x-load: add config header support for BeagleBoard

Joel A Fernandes (1):
=20=20sdcard_image: Helper class to create SD Card images

Koen Kooi (1):
=20=20ti-msp430-chronos: import from OE classic

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

Martin Jansa (9):
=20=20linux-openmoko-2.6.39: fix touchscreen patch
=20=20linux-openmoko-2.6.39: enable LIS302DL module
=20=20meta-nokia: fix g_nokia loading again
=20=20gpsd: remove gpsd-udev from RECOMMENDS
=20=20SHR: remove blacklist entries no longer needed and blacklist external =
toolch
=20=20task-shr-minimal: drop libphone-ui and libphone-ui-shr as they should =
be pul
=20=20SHR: prefer tslib from git (from meta-aurora)
=20=20meta-shr, meta-aurora: drop files no longer needed
=20=20meta-aurora,meta-shr,meta-fso: update README

Simon Busch (19):
=20=20meta-aurora: aurora-image: turn on debug features as default for now
=20=20meta-aurora: task-base: port over fix from meta-shr to exclude gsmd =
and it's
=20=20meta-palm: initscripts: add specific version of the umountfs script
=20=20meta-samsung: crespo machine: prefer zImage as kernel image type
=20=20meta-aurora: aurora-image: include fso2-compliance task
=20=20msmcomm: bump SRCREV to latest version
=20=20aurora: remove blacklist entries no longer needed and blacklist =
external too
=20=20meta-aurora: import aurora-theme and aurora-systemmanager from oe-dev
=20=20meta-aurora: remove aurora distro configuration; we will now use SHR =
as base
=20=20meta-aurora: mention meta-shr as dependency
=20=20meta-shr: initscripts: respect following prepends after we touched =
FILESEXTR
=20=20meta-palm: linux-palmpre: bump SRCREV for latest version
=20=20meta-aurora: import more aurora specific recipes from oe-dev
=20=20meta-aurora: aurora: bump SRCREV for latest changes
=20=20meta-aurora: aurora-image: add relevant aurora and qt parts of the =
image
=20=20meta-palm: qt4-embedded: add specific qte.sh profile script for the =
palmpre=20
=20=20meta-aurora: aurora-image: do not include full qt suite but just some =
parts=20
=20=20meta-palm: tslib: add machine specific configuration options for =
palmpre mac
=20=20meta-aurora: aurora-image: add missing aurora-systemmanager to image

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-micro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-slugos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nslu2:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Tom Zanussi (2):
=20=20meta-intel: update SRCREVs
=20=20meta-emenlow: switch to linux-yocto 3.0 kernel

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-handheld:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-opie:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:

Nicu Pavel (2):
=20=20Add linux kernel recipe for picoSAM9G45 board[1]
=20=20Add machine configuration for picoSAM9G45 board[1].

Philip Balister (1):
=20=20uhd : Update SRCREV to head of master branch.

Steffen Sledz (1):
=20=20rsyslog: change path for config includes to /etc/rsyslog.d

Tristan Lelong (1):
=20=20libroxml: Add version 2.1.1 (initial recipe)




