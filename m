Received: from new.bec-systems.com ([74.208.70.121] helo=bec-systems.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1TB4Ty-00066r-Ml; Mon, 10 Sep 2012 15:56:59 +0200
Received: from oh-69-34-21-229.sta.embarqhsd.net ([69.34.21.229]
	helo=happy.bec-systems.com)
	by bec-systems.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cliff.brake@gmail.com>)
	id 1TB3nQ-0003Uq-UB; Mon, 10 Sep 2012 09:13:03 -0400
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Date: Mon, 10 Sep 2012 13:19:47 GMT
Message-Id: <1347283187579.9283ad1@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
X-Spam_score: -1.0
X-Spam_score_int: -9
X-Spam_bar: -
Subject: OE Changelog since 2012-09-02 until 2012-09-09
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
X-List-Received-Date: Mon, 10 Sep 2012 13:56:59 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2012-09-02 until 2012-09-09.  Projects included in this =
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

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for bitbake:

Bogdan Marinescu (1):
=20=20crumbs/hig: Save toolchain in settings

Cristiana Voicu (7):
=20=20hob/packageselectionpage: Correctly restore previously selected =
packages
=20=20hob/packageselectionpage: Add tooltips to 'Included' and 'All =
packages' tab=20
=20=20hob/imageconfigurationpage: Set secondary action for "Edit image" =
button
=20=20hob/recipe&packageselectionpage: Change "Back" button to "Cancel" =
button
=20=20hob/imagedetailspage: "Image ready" icon appers only after the image =
was gen
=20=20hob: The 'run image' and 'deploy image' dialogs text and alignment =
correctio
=20=20hob: print message when DISPLAY is not set

Ioana Grigoropol (1):
=20=20hobwidget: Button theme is taken from host, fix

Kang Kai (2):
=20=20hob2: remove the hard-coded images map
=20=20hob2: remove class hcc

Liming An (1):
=20=20Hob: change view of 'recipes' and 'packages' tables as ui design

Paul Eggleton (6):
=20=20tinfoil: create simple interface for bitbake-based utilities
=20=20lib/bb/siggen: replace tabs with spaces
=20=20lib/bb/siggen.py: insert a colon between class and recipe name
=20=20lib/bb/siggen.py: make signature dump/compare functions return a list
=20=20bitbake-diffsigs: allow specifying task & follow deps recursively
=20=20fetch2: replace double slashes in paths in encodeurl()

Robert Yang (1):
=20=20fetch2: unpack rpm, ipk and deb binary package

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Bruce Ashfield (9):
=20=20kern-tools: fix forced branching
=20=20linux-yocto: fix unapplied patch error message
=20=20linux-yocto: check for bad SRCREV before branch checks
=20=20kern-tools: fix non-inheriting branch names
=20=20linux-yocto/3.4: v3.4.9, unionfs, perf and configuration changes
=20=20linux-yocto/3.2/3.4: arm: Fix linking errors with binutils 2.23
=20=20linux-yocto-rt: update to 3.4.9-rt17
=20=20linux-yocto-rt: 3.4.9-rt17 remaining changes
=20=20conf/tune: add tune-ppce300c3

Constantin Musca (9):
=20=20automake: upgrade to 1.12.3
=20=20gypsy: upgrade to 0.9
=20=20libdrm: upgrade to 2.4.39
=20=20lsof: upgrade to 4.86
=20=20man-pages: upgrade to 3.42
=20=20telepathy-glib: upgrade to 0.19.8
=20=20freetype: upgrade to 2.4.10
=20=20puzzles: upgrade to r9594
=20=20iproute2: upgrade to 3.5.1

Elizabeth Flanagan (1):
=20=20adt-installer: Allow changing YOCTOADT_REPO

Jack Mitchell (1):
=20=20scripts/cleanup-workdir: change autoconf-nativesdk to =
nativesdk-autoconf

Kang Kai (4):
=20=20wget: disable iri/idn support
=20=20msmtp: disable libidn support
=20=20ghostscript: disable libidn support
=20=20image_types.bbclass: add variable for Hob

Khem Raj (2):
=20=20uclibc-0.9.33: Update to latest on 0.9.33 branch
=20=20tclibc-uclibc, tclibc-eglibc: Prefer nativesdk-eglibc to provide =
libintl

Martin Ertsaas (1):
=20=20rsync: Add md5sum and sha256sum for the rsync_2.6.9

Martin Jansa (11):
=20=20sstate-cache-management.sh: fix regexp in checksum grep
=20=20sstate-cache-management.sh: fix regexp in AVAILTUNES grep
=20=20sstate-cache-management.sh: look in meta* above oe-core dir when =
looking for
=20=20sstate-cache-management.sh: don't hardcode available machines only to =
qemu*
=20=20sstate-cache-management.sh: add option to enable debug output
=20=20sstate-cache-management.sh: fix remove_duplicated when multiple archs =
were b
=20=20bitbake.conf: FETCHCMD_svn add --non-interactive --trust-server-cert
=20=20udev-extraconf: Merge with udev-extra-rules from meta-oe
=20=20udev-extraconf: change LICENSE to MIT
=20=20packagegroup-core-x11: split machine specific parts to separate =
recipe packa
=20=20pulseaudio: fix pulseaudio-server RDEPENDS

Paul Eggleton (43):
=20=20classes/core-image: remove SSHSERVER_IMAGE_FEATURES
=20=20classes/core-image: remove *_IMAGE_FEATURES variables
=20=20classes/core-image: remove erroneous nfs-server comment
=20=20Rename task to packagegroup
=20=20packagegroup-base: remove some useless items
=20=20classes/packagegroup: Use package group nomenclature
=20=20packagegroup-core-nfs: remove broken glibc-utils reference
=20=20classes/packagegroup: add ability to disable complementary packages
=20=20packagegroup-*: change to inherit from packagegroup.bbclass
=20=20packagegroup-core-x11: move out Sato applications
=20=20core-image-core: rename to core-image-x11
=20=20packagegroup-core-x11*: adjust X11 package groups
=20=20packagegroup-qt4e: tidy up and rename
=20=20packagegroup-core-gtk-directfb: remove superfluous -base package
=20=20packagegroup-base: remove openswan from packagegroup-base-ipsec
=20=20packagegroup-core-gtk-directfb: remove dropbear
=20=20classes/packagegroup: disable superfluous tasks
=20=20packagegroup-*: drop LIC_FILES_CHKSUM
=20=20packagegroup-core-clutter: remove empty -apps/-tests tasks
=20=20packagegroup-core-qt: rename -demos to -demoapps
=20=20packagegroup-core-console: remove
=20=20connman: add runtime dependency on dbus
=20=20ofono: add runtime dependency on dbus
=20=20packagegroup-*: set reasonable SUMMARY/DESCRIPTION
=20=20packagegroup-core-basic: tidy up
=20=20packagegroup-core-lsb: rework
=20=20core-image-basic: tidy up
=20=20packagegroup-*: add RPROVIDES for backwards compatibility
=20=20qemu-config: relicense as MIT
=20=20oprofileui: split server to separate recipe to avoid X11 dependency
=20=20qemu-config: split out anjuta-remote-run
=20=20oprofileui-server: move initscript from qemu-config
=20=20qemu-config: split out shutdown icon to its own recipe
=20=20qemu-config: split out export of root via NFS to its own recipe
=20=20qemu-config: turn into distcc-config and a package group
=20=20packagegroup-core-standalone-gmae-sdk-target: allow dbg package
=20=20packagegroup-*: add RREPLACES/RCONFLICTS
=20=20classes/qmake_base: support linux-gnuspe/linux-uclibcspe TARGET_OS
=20=20packagegroup-(base|core-basic): add RREPLACES/RCONFLICTS
=20=20build-appliance-image: fix for packagegroup-apps-console removal
=20=20packagegroup-core-x11: add upgrade path from meta-oe task-x11*
=20=20classes/core-image: improve comments listing IMAGE_FEATURES
=20=20classes/mirrors: remove bogus gnutls mirror

Radu Moisan (3):
=20=20pango: Add missing sign-off-by and upstream-status
=20=20grub: added upstream-status
=20=20busybox: Add sign-off-by and upstream-status

Richard Purdie (4):
=20=20udev: Remove files moved to udev-extraconf
=20=20build-appliance-image: Update to latest poky master
=20=20sanity.bbclass: Move back to running at ConfigParsed time
=20=20gcc-cross-initial: Reinstate limits.h generation fix

Ross Burton (6):
=20=20xserver-xorg: remove HAL option, nothing uses HAL anymore
=20=20gsettings.bbclass: fix whitespace
=20=20xserver-xorg-common: add RREPLACES on xserver-xorg to -module-exa
=20=20gssdp: build examples which require GTK+ only if we have X11
=20=20pulseaudio: remove ConsoleKit dependency
=20=20gst-plugins-good: disable (uninstalled) examples

Saul Wold (3):
=20=20build-appliance: add zip-native, which is needed to build the final =
zip bund
=20=20python-pygtk: Upgrade to 2.24
=20=20matchbox-session: Should have high ALTERNATIE_PRIORITY than =
mini-x-session

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Jack Mitchell (1):
=20=20libplist: add upstream patch to fix parallel make issue

Khem Raj (1):
=20=20systemd: Upgrade to 189

Martin Jansa (12):
=20=20e-base: bump EFL_SRCREV to 1.7.0 release and update PV in svn recipes
=20=20terminology: add version 0.1.0, negative D_P to svn and bump PE
=20=20recipes-efl: upgrade from 1.7.0-beta to 1.7.0
=20=20e-wm: update RRECOMMENDS_-config-mobile
=20=20task-x11-illume: update default ECONFIG
=20=20python-efl: upgrade svn recipes to 1.7.0+svn
=20=20python-efl: upgrade recipes to 1.7.0
=20=20xf86-video-glamo: add xserver-xorg-module-exa to RDEPENDS
=20=20task*: rename to packagegroup to match oe-core
=20=20packagegroup: add RPROVIDES/RREPLACES/RCONFLICTS and bump PR to get =
some upg
=20=20task-x11*: remove in favor of packagegroup-core-x11* variants from =
oe-core
=20=20task-x11-illume: rename to packagegroup-x11-illume

Sander van Grieken (3):
=20=20avahi: use systemd.bbclass for avahi-systemd
=20=20ifuse: add recipe to expose files on Apple devices via fuse
=20=20libimobiledevice: add recipe for Apple products protocol support

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

Martin Jansa (14):
=20=20shr-settings: bump SRCREV
=20=20shr-settings: add ELM_PROFILE also to default elementary.sh
=20=20task*: rename to packagegroup to match oe-core
=20=20packagegroup: add RPROVIDES/RREPLACES/RCONFLICTS and bump PR to get =
some upg
=20=20aurora-image: update IMAGE_INSTALL to use packagegroup-core-x11-* =
from oe-co
=20=20meta-shr, meta-samsung: remove packagegroup-x11-server, =
packagegroup-x11 bba
=20=20packagegroup-shr-minimal: task-x11-illume is renamed only in =
jansa/test bran
=20=20Revert: meta-shr, meta-samsung: remove packagegroup-x11-server, =
packagegroup
=20=20Revert "aurora-image: update IMAGE_INSTALL to use =
packagegroup-core-x11-* fr
=20=20Revert "packagegroup-shr-minimal: task-x11-illume is renamed only in =
jansa/t
=20=20Revert "Revert: meta-shr, meta-samsung: remove =
packagegroup-x11-server, pack
=20=20Revert "Revert "aurora-image: update IMAGE_INSTALL to use =
packagegroup-core-
=20=20aurora-image: fix IMAGE_INSTALL =
s/packagegroup-core-x11-server/packagegroup-
=20=20foxtrotgps: drop bbappend

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-micro:

Phil Blundell (4):
=20=20busybox, eglibc: update versions for .bbappend     util-linux: delete =
.bbapp
=20=20eglibc: fix sundry packaging issues
=20=20micro-x11: new, like micro but with X11 enabled
=20=20sane-feed: fix typo causing parse error with recent bitbake

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-slugos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nslu2:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Paul Eggleton (1):
=20=20README: add info explaining meta-tlk layer purpose

Saul Wold (3):
=20=20linux-yocto: Update linux-yocto for 3.2 and 3.4
=20=20base-files: add /etc/motd with TLK info
=20=20psplash: Add TLK info to psplash image

Tom Zanussi (2):
=20=20meta-intel: remove task-core-tools-profile.bbappend
=20=20meta-emenlow: rename recipes-gnome bbappends

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-handheld:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-opie:

Khem Raj (1):
=20=20task-opie: Adjust for nativesdk renaming

Paul Eggleton (1):
=20=20task-opie-toolchain-host-nativesdk: fix for task -> packagegroup =
rename

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-bug:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-efikamx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix:

Andreas M=C3=BCller (15):
=20=20omap3-sgx-modules: FILESEXTRAPATHS -> FILESEXTRAPATHS_prepend
=20=20linux-omap-3.6: Do not register ADS7846 if not present
=20=20overo-storm.conf: remove - there is no need for extra configuration
=20=20linux-3.0: remove
=20=20linux configuration: restructure
=20=20linux: put PV in linux-recipes to fix building wrong recipes
=20=20linux-sakoman: rename variables / set correct version
=20=20linux: take also linux-mainline under control of =
linux-versions-overo.inc +=20
=20=20linux-libc-headers: make dynamic version switching optional
=20=20linux-omap-3.6: move rc4 to fix ADS7876 always pendown
=20=20overo.conf: reenable xf86-input-tslib
=20=20linux-3.5: move back to governor performance / storm max freq. 800MHz
=20=20script-and-docs/u-boot-variables: add video params for dvi/lcd43
=20=20linux-3.6: smsc911x return ENODEV if no device found
=20=20linux-3.5: ads7846/smsc911x return ENODEV if no device found

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ettus:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-ppc:

Khem Raj (1):
=20=20fsl-image-lsb-sdk: Remove deprecated IMAGE_FEATURE apps-console-core

Matthew McClintock (4):
=20=20update bbappends to only apply on our distro, as a precursor to =
moving to it
=20=20add fslmachine overrides
=20=20qemu: set preferred version for QEMU
=20=20add kernel patch to fix parallel build failures

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

Paul Eggleton (2):
=20=20task-core-qt3: rename to packagegroup-core-qt3 and tidy up
=20=20core-image-lsb-qt3: fix for apps-console-core removal

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-telephony:

Holger Hans Peter Freyther (5):
=20=20libdbi: Add checksums for version 0.8.3
=20=20libdbi-drivers: Add checksums for version 0.8.3
=20=20libdbi-drivers: Package the *.a into a new -staticdev package
=20=20libdbi-drivers: Introduce INC_PR for this recipe
=20=20openggsn: Package the *.a into a new -staticdev package

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Khem Raj (1):
=20=20angstrom: Adjust for task -> packagegroup rename

Koen Kooi (1):
=20=20README: update layer section

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-browser:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-mono:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-raspberrypi:

Andrei Gherzan (2):
=20=20poky-raspberrypi.conf: Remove distro file
=20=20README: Instruct users to add BBMASK as distro file was removed

Aurelian Zanoschi (1):
=20=20bcm2835: Integrate version 1.8

Jack Mitchell (1):
=20=20rpi-basic-image: Add new basic image with SSH server

Sander van Grieken (1):
=20=20sdcard_image-rpi.bbclass: Add sysctl.d config to set =
vm.min_free_kbytes to 8

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-kde:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Bruce Ashfield (2):
=20=20linux-yocto/meta-yocto: update SRCREVs to 3.4.9, unionfs, perf and cfg
=20=20mpc8315e-rdb: switch to ppce300c3 tuning

Paul Eggleton (1):
=20=20meta-yocto: fix for task rename

Radu Moisan (1):
=20=20upstream_tracking.inc: Updates for upstream/check date

Richard Purdie (1):
=20=20meta-yocto: Split into distro and bsp components

Ross Burton (1):
=20=20beagleboard: change to xserver-xorg, not -lite

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

Iyad Qumei (11):
=20=20Merge pull request #11 from timoaarnipuro-owo/db
=20=20Merge pull request #2 from ka6sox/master
=20=20Merge pull request #6 from kimmoleppala-owo/luna-sysmgr-ipc-recipe
=20=20Fixing build problems introduced by commit =
241dce90ab79a2a6df9ec9a5b62efbaa2
=20=20Include luna-sysmgr-ipc in webos-image.
=20=20Add webkit component definitions to webos-image.
=20=20Merge pull request #15 from iyadq/master
=20=20Merge pull request #12 from teppopennanen-owo/master
=20=20resolve pull conflict.
=20=20Merge pull request #16 from RS102839/master
=20=20Fix build issues with luna-sysmgr-ipc and -messages.

Kimmo Leppala (1):
=20=20Added luna-sysmgr-ipc recipe.

Roger Stringer (2):
=20=20Remove unneeded dependency on mjson
=20=20Expand .gitignore to exclude common Eclipse project files

Teppo Pennanen (2):
=20=20Added missing dependencies for luna-prefs recipe.
=20=20Added recipes for libpbnjson and serviceinstaller

Timo Aarnipuro (2):
=20=20Add version 4.8 of Berkeley DB package
=20=20webos-preferred_versions: Use db 4.8




