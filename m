Received: from new.bec-systems.com ([74.208.70.121] helo=bec-systems.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1TkdrD-0007RR-JU; Mon, 17 Dec 2012 17:48:10 +0100
Received: from oh-69-34-21-229.sta.embarqhsd.net ([69.34.21.229]
	helo=happy.bec-systems.com)
	by bec-systems.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cliff.brake@gmail.com>)
	id 1TkdTF-0000Xl-Hy; Mon, 17 Dec 2012 11:23:16 -0500
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Date: Mon, 17 Dec 2012 16:33:08 GMT
Message-Id: <1355761988412.6e7af66f@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
X-Spam_score: -2.9
X-Spam_score_int: -28
X-Spam_bar: --
Subject: OE Changelog since 2012-12-09 until 2012-12-16
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
X-List-Received-Date: Mon, 17 Dec 2012 16:48:12 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2012-12-09 until 2012-12-16.  Projects included in this =
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
=20=20hob/bitbake: custom image is now using the base image
=20=20hob: use base image only if it was set

Eren T=C3=BCrkay (1):
=20=20bitbake.vim: detect *.bbappend files in ftdetect automatically

Mihai Lindner (1):
=20=20knotty: use bb.error instead of print

Richard Purdie (6):
=20=20BBHandler/ast: Simplify/fix EXPORT_FUNCTIONS usage
=20=20BBhandler/data: Fix __inherit_cache duplication
=20=20command: Add missing import traceback
=20=20command: Fix getCmdLineAction bugs
=20=20bin/bitbake, bb/__init__: Move BBDEBUG handling to bin/bitbake
=20=20data_smart/BBHandler: Fix SkipParse exception handling

Robert P. J. Day (1):
=20=20git.py: A bit of tidying up regarding grammar and supported protocols.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Andrei Dinu (1):
=20=20Disabling audio on when running runqemu qemuarm

Andrei Gherzan (1):
=20=20chrpath.bbclass: Normalize rpath only of it doesn't contain ORIGIN =
variable

Andy Ross (1):
=20=20base/license.bbclass: handle multiple INCOMPATIBLE_LICENSEs

Chunrong Guo (1):
=20=20mtd-utils:fix corrupt cleanmarker with flash_erase -j command

Constantin Musca (5):
=20=20multilib.bbclass: fix do_package_qa_multilib
=20=20package.bbclass: prepend MLPREFIX to LOCALEBASEPN
=20=20pixman: upgrade to 0.28.0
=20=20qemu: upgrade to 1.3.0
=20=20libpng: enable nativesdk variant

Cristian Iorga (2):
=20=20build-appliance: provides git proxified acces
=20=20build-appliance: Updated to include bblayers.conf.sample fix

Darren Hart (1):
=20=20bootimg: Use FAT 32 for images larger than 512MB

Fahad Usman (3):
=20=20libpcre: upgrade to 8.32
=20=20libpcre: Improve the recipe
=20=20tar: apply fedora patch for fortify sources sigabort

Kang Kai (1):
=20=20libuser: enable python support

Laurentiu Palcu (4):
=20=20populate_sdk_deb.bbclass: put back INSTALL_PACKAGES_NORMAL_DEB
=20=20x11vnc: bind vnc server to port 5900
=20=20populate_sdk_(deb|ipk|rpm): export NATIVE_ROOT and INTERCEPT_DIR =
variables
=20=20gdk-pixbuf: handle postinstall errors differently

Marcin Juszkiewicz (1):
=20=20eglibc: add AArch64 support

Mark Hatle (3):
=20=20rootfs_rpm.bbclass: Revert to default shell logging behavior
=20=20coreutils_6.9: Update the older coreutils to no longer provide 'su'
=20=20populate_sdk_base: Add perl modules as needing to be relocated

Marko Lindqvist (1):
=20=20eglibc: fix checksums of fetched patches

Martin Jansa (2):
=20=20qt4: upgrade to 4.8.4
=20=20nativesdk-qt4-tools: fix do_configure to be reentrant

Maxin B. John (1):
=20=20Update the SRC_URI in systemtap recipe

Muhammad Shakeel (1):
=20=20libacpi: Remove QA warning: No GNU_HASH in the elf binary

Nitin A Kamble (1):
=20=20create-pull-request: detect trailing white space

Paul Eggleton (1):
=20=20eglibc: remove dependency of eglibc-utils on bash

Richard Purdie (3):
=20=20hob-toolchain: Update for removal of dummy classes
=20=20bitbake.conf/utils: Drop some OVERRIDES from FILESPATH
=20=20gitignore: Add hob-image-*.bb

Robert P. J. Day (1):
=20=20documentation-audit.sh: Add/fix checks for skipped lines.

Ross Burton (19):
=20=20package.bbclass: make do_split_packages handle non-existent root =
directories
=20=20mesa: common packaging cleanup
=20=20mesa: upgrade to 8.0.5
=20=20mesa-dri: upgrade -git version to current master
=20=20telepathy-glib: remove pkgconfig dependency in pkgconfig
=20=20libmatchbox: upgrade to 1.10, drop git
=20=20matchbox-keyboard: fix the build with libpng15
=20=20mesa: package osmesa.pc
=20=20mesa-dri-git: remove patch that doesn't apply to 9.x
=20=20curl: fix out-of-tree builds
=20=20apr: fix out-of-tree builds
=20=20pkgconfig: fix out-of-tree builds
=20=20ossp-uuid: fix out-of-tree builds
=20=20gperf: fix out-of-tree builds
=20=20libgcrypt: fix out-of-tree builds
=20=20base-passwd: fix out-of-tree builds
=20=20font-util: fix out-of-tree builds
=20=20e2fsprogs: fix out-of-tree builds
=20=20libsoup: RRECOMMEND glib-networking

Saul Wold (1):
=20=20chrpath: normalize the paths

Tom Zanussi (1):
=20=20module.bbclass: make sure do_make_scripts() executes after do_patch()

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Andrea Adami (1):
=20=20kexecboot(-klibc): upgrade to b667914

Andreas M=C3=BCller (1):
=20=20lighttpd: follow oe-core to 1.4.32

Koen Kooi (3):
=20=20Revert "qt4: rename bbappends to match new 4.8.4 version from oe-core"
=20=20systemd: update to v196
=20=20Merge remote-tracking branch 'meta-oe-contrib/jansa/pull'

Martin Jansa (100):
=20=20e-base.bbclass: bump EFL_SRCREV for E17 alpha6
=20=20e-base.bbclass: bump EFL_SRCREV for E17 alpha7
=20=20vpnc: import from OE-classic
=20=20fluidsynth: import from OE-Classic
=20=20packagekit: import from OE-Classic
=20=20pyrtm: import from OE-Classic
=20=20usb-modeswitch-data: upgrade to 20121109
=20=20usb-modeswitch: upgrade to 1.2.5
=20=20cheese: rename eds-dbus to evolution-data-server in DEPENDS
=20=20gnome-terminal: add SRC_URI checksums
=20=20libnotify3: add SRC_URI checksum
=20=20gcalctool: add SRC_URI checksums
=20=20libgtkstylus: add SRC_URI checksums
=20=20qconnman: update git repo URL
=20=20edje-viewer: add LIC_FILES_CHKSUM and drop BSD from LICENSE
=20=20uptime: add LIC_FILES_CHKSUM
=20=20forecast: add LIC_FILES_CHKSUM
=20=20cpu: add LIC_FILES_CHKSUM
=20=20diskio: add LIC_FILES_CHKSUM
=20=20exquisite: add LIC_FILES_CHKSUM
=20=20ephoto: update LICENSE and LIC_FILES_CHKSUM
=20=20exalt: fix LICENSE and add LIC_FILES_CHKSUM
=20=20news: fix LICENSE and add LIC_FILES_CHKSUM
=20=20flame: add LIC_FILES_CHKSUM
=20=20rain: add LIC_FILES_CHKSUM
=20=20libeweather: add LIC_FILES_CHKSUM
=20=20epeg: add LIC_FILES_CHKSUM
=20=20xorg-sgml-doctools: add LIC_FILES_CHKSUM
=20=20engrave: add LIC_FILES_CHKSUM
=20=20edb: add LIC_FILES_CHKSUM
=20=20gnome-terminal: add LICENSE version and LIC_FILES_CHKSUM
=20=20notification: remove recipe, notification module is now part of e-wm
=20=20waker: remove recipe, source was removed in r70549
=20=20elementary-alarm: remove recipe, source was removed in r70549
=20=20epdfview: move from meta-efl to meta-gnome
=20=20gnome-vfs: fix QA warnings in packaging
=20=20fuse: remove /dev/fuse in do_install_append
=20=20libbonobo: fix QA warnings in packaging
=20=20gnome/libgnomecanvas: delete, there is newer version in =
libgnome/libgnomecan
=20=20libgnomecanvas: fix QA warnings from packaging
=20=20libgnome: fix QA warnings from packaging
=20=20libbonoboui: fix QA warnings from packaging
=20=20libgnomeui: fix QA warnings from packaging
=20=20pcsc-lite: add bbappend in meta-systemd
=20=20entrance: rename xserver-nodm.service to entrance.service so it does =
not con
=20=20systemd: add PACKAGES_DYNAMIC
=20=20exalt-client: add LIC_FILES_CHKSUM
=20=20systemd: reenable python and add python-systemd-journald
=20=20xf86-input-void: fix SRC_URI checksums
=20=20lightmediascaner: move .a files from PN-dev to PN-staticdev
=20=20tangogps: fix doc instalation
=20=20lightmediascaner: move .a files from PN-dev to PN-staticdev
=20=20gvim: fix unpackaged files QA warning
=20=20libcanberra: package also gtk-3.0 if it gets built
=20=20lua5.1: fix packaging QA warnings
=20=20util-linux: add meta-systemd bbappend for new version which installs =
uuidd.s
=20=20eject: drop 2nd LICENSE field
=20=20eject: use new update-alternatives and add u-a for eject
=20=20libcanberra: skip dev-so QA for PN-gtk
=20=20python-twisted: fix packaging QA warnings
=20=20e-base.bbclass: bump EFL_SRCREV for E17 alpha8
=20=20enjoy: depend on edbus2
=20=20python-efl: fix do_configure_prepend to be reentrant
=20=20samba: remove empty /sbin
=20=20gpm: include /usr/share/emacs/site-lisp in PN
=20=20desktop-file-utils: don't build =
/usr/share/emacs/site-lisp/desktop-entry-mod
=20=20systemd: add target python to depends
=20=20vim-tiny: package /usr/share/vim in PN-data
=20=20efl.bbclass: fix FILES for PN-staticdev
=20=20exalt-client: fix FILES for PN-staticdev
=20=20gnome-disk-utility: disable failing docs generation
=20=20gnome-disk-utility: fix unpackaged files
=20=20gnome-session: disable failing docs generation
=20=20gdm: disable failing docs generation
=20=20cheese: disable scrollkeeper
=20=20gnome-themes: fix path to icon-name-mapping
=20=20cheese: disable help build
=20=20gnome-mplayer: fix unpackaged files warning
=20=20libwmf: fix QA warnings
=20=20gateone: fix unpackaged files
=20=20lmbench: fix unpackaged files
=20=20xdotool: fix unpackaged files
=20=20libxml++: fix unpackaged files
=20=20qwt: fix unpackaged files
=20=20vlc: disable kde-solid
=20=20vlc: add fluidsynth and alsa-lib to DEPENDS for reproducible builds
=20=20openbox: fix PR format and use new update-alternatives syntax
=20=20fluidsynth: upgrade to 1.1.1
=20=20gcalctool: upgrade to 5.32.0
=20=20strongswam: disable systemd support in meta-oe and reenable it in =
meta-syste
=20=20qconnman-e: fix unpackaged files QA warning
=20=20qt4: rename bbappends to match new 4.8.4 version from oe-core
=20=20efl: upgrade to 1.7.3
=20=20e-base: bump EFL_SRCREV for E17 beta1 and EFL 1.7.3
=20=20e-base: bump EFL_SRCREV for E17 gamma
=20=20pixman: drop bbappend with only PRINC left
=20=20gnome-control-center: fix QA issue
=20=20glade3: disable help, fails to build
=20=20iotop: don't fail when site.py* does not exist
=20=20emotion: disable generic-vlc backend

Samuel Stirtzel (1):
=20=20maliit-plugins: Don't build the documentation as it requires Doxygen

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Denys Dmytriyenko (1):
=20=20openssl: rename .bbappend to follow oe-core updated version

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-beagleboard:

Koen Kooi (1):
=20=20linux-mainline 3.7: update to 3.7 final

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-browser:

Andreas M=C3=BCller (1):
=20=20Add bbappend for gnome-settings-daemon to make it build (deteministc) =
when u

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

Andrei Gherzan (6):
=20=20mesa-dri: Sync with version from oe-core
=20=20qt4-embedded: Remove 4.8.1 as it doen't exist in oe-core anymore
=20=20qt4-x11-free: Remove 4.8.1 as it doen't exist in oe-core anymore
=20=20qt4-embedded: Sync with version from oe-core
=20=20qt4-x11-free: Sync with version from oe-core
=20=20xf86-dri-vivante: xf86-video-vivante renamed to =
xf86-video-imxfb-vivante

Otavio Salvador (4):
=20=20image_types_fsl.bbclass: Add support to not use bootloader for iMX
=20=20image_types_fsl.bbclass: Add support to install boot scripts
=20=20linux-imx.inc: Drop support for denzil
=20=20xf86-dri-vivante: Use '.bin' file to ensure EULA is comply

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

Otavio Salvador (4):
=20=20u-boot-boundary: Add U-Boot recipe for Boundary Devices version
=20=20u-boot-script-boundary: Add recipe to deploy the boot scripts
=20=20nitrogen6x: Add machine definition
=20=20README: Update to suggest 'danny' branch

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-ppc:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-guacamayo:

Tomas Frydrych (1):
=20=20rygel: update to 0.16.3

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix-community:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-handheld:

Andrea Adami (8):
=20=20linux-yocto_3.4: move MTD common options to zaurus-hardware.cfg
=20=20linux-yocto_3.4: remove superseded patch for collie and fix do_patch
=20=20linux-yocto_3.4: use a single copy of the locomo keymap patch
=20=20linux-yocto_3.4: move CONFIG_MMU=3Dy to zaurus-hardware.cfg
=20=20linux-yocto_3.4: move CONFIG_ARCH_PXA=3Dy to zaurus-pxa-common.cfg
=20=20linux-yocto_3.4: move CONFIG_PXA_SHARPSL=3Dy to zaurus-pxa-common.cfg
=20=20linux-yocto_3.4: reuse spitz.cfg for akita
=20=20linux-yocto_3.4.bbappend: restrict DEFAULT_PREFERENCE to Zaurus only

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-igep:

Javier Martinez Canillas (1):
=20=20linux: igep00x0: enable twl4030 SoC audio support

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Nitin A Kamble (11):
=20=20crownbay: linux-yocto_3.4.bbappend cleanup SRC_URI
=20=20meta-nuc: new BSP layer for Intel NUC systems
=20=20meta-nuc: provide machine configuration for nuc BSP
=20=20meta-nuc: provide a formfactor for the nuc BSP
=20=20meta-nuc: add kernel recipe for nuc BSP
=20=20meta-nuc: provide a working xorg.conf for the nuc BSP
=20=20meta-nuc: provide a working alsa config for the nuc BSP
=20=20meta-nuc: disable serial port config
=20=20meta-nuc: init script for configuring HDMI audio
=20=20common/linux-firmware: add support for Centrino Advanced-N 6235 =
wireless
=20=20meta-nuc: include wifi chip microcode package in nuc.conf

Richard Purdie (1):
=20=20common/mesa-dri: Change version to match OE-Core upgrade

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

Florin Sarbu (4):
=20=20Removed qemu 2012.04 as we rely now on qemu from poky.     Updated =
README.md
=20=20audiomanager: Updated the .git recipe to latest sha     =
(e33f72e932661784aff
=20=20Added the glx xorg extension to XSERVER variable.     Moved the =
XSERVER vari
=20=20poky-ivi-systemd.conf: Added the video driver conditionally,     =
depending o

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

Martin Jansa (4):
=20=20linux-samsung-tuna: bump SRCREV to fix build with binutils-2.23

Simon Busch (8):
=20=20meta-android: add chroot-script/chroot-image recipes
=20=20meta-samsung: libgles-android: rework recipe to ship everythind =
needed on it
=20=20meta-samsung: use older kernel version which is based on upstream =
AOSP one
=20=20meta-samsung: linux-samsung-tuna: bump SRCREV for some branch =
restructuring
=20=20meta-samsung: samsung-tuna-firmware: handle license of proprietary =
binaries=20
=20=20meta-samsung: samsung-tuna-firmware: distribute firmware for ducati =
subsyste
=20=20meta-samsung: libgles-android: refactor our general things into =
meta-android
=20=20meta-fso: libsamsung-ipc: bump SRCREV and change license to GPLv2+

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

Eric Blade (2):
=20=20webos-image: keyboard-efigs=3D1.01, luna-sysmgr=3D1.03, =
luna-webkit-api=3D1.00
=20=20luna-sysmgr: Add keyboard-efigs to RDEPENDS_${PN}

Herb Kuta (1):
=20=20webkit-webos: Remove "unusual" use of SRCREV

Iyad Qumei (1):
=20=20nodejs: Add missing build dependency on python-native

Kimmo Leppala (1):
=20=20luna-sysmgr-common: Add recipe

Timo Aarnipuro (1):
=20=20curl: Add c-ares support

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

Elvis Dowson (6):
=20=20xilinx-boot: Update to work with Xilinx XPS 14.3
=20=20xilinx-boot: Minor updates to comments in the class file.
=20=20xilinx-boot: Automatically locate bitstream.
=20=20virtex-5-ml507-powerpc-440: Add new machine configuration file.
=20=20linux-xilinx-3.3: Refactor recipe to use virtex-5 SOC_FAMILY.
=20=20linux-xilinx: Refactor recipe to use virtex-5 SOC_FAMILY.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Constantin Musca (1):
=20=20poky-tiny.conf: blacklist inappropriate image options

Ross Burton (1):
=20=20beagleboard: use xf86-video-omapfb

Tom Zanussi (12):
=20=20yocto-bsp: add custom kernel support
=20=20yocto-bsp: add 'custom' choice to kernels()
=20=20yocto-bsp: update existing templates for linux-yocto-custom
=20=20yocto-bsp: add 'edit-git-repo' input line
=20=20yocto-bsp: add 'edit-file' input line
=20=20yocto-bsp: add replace_file()
=20=20yocto-kernel: create open_user_file() wrapper function
=20=20yocto-kernel: don't list comments in config and patch listings
=20=20yocto-kernel: remove assumption that kernel has a version
=20=20yocto-kernel: handle SRC_URIs in .bb files
=20=20yocto-bsp: remove patch-related SRC_URI processing
=20=20yocto-kernel: add support for PRs of the form rN to pr_inc()

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:

chase maupin (69):
=20=20gnutls: update LICENSE setting to GPLv3 and LGPLv2.1
=20=20libtasn1: update LICENSE setting to GPLv3 and LGPLv2.1
=20=20libtasn1: inherit lib_package to split GPLv3 packages
=20=20bonnie: Update LICENSE field version to GPLv2
=20=20canutils: Update LICENSE field version GPLv2
=20=20debianutils: Update LICENSE field version GPLv2
=20=20gtk+: Update LICENSE field version for 2.20.1 to LGPLv2
=20=20gnome-keyring: Update LICENSE field version to GPLv2
=20=20gnome-vfs: Update LICENSE field version to GPLv2
=20=20hicolor-icon-theme: Update LICENSE field version to GPLv2
=20=20hostap-daemon: Update LICENSE field version to GPLv2
=20=20liba52: Update LICENSE field version to GPLv2
=20=20atk: Update LICENSE field version to GPLv2
=20=20audiofile: Update LICENSE field version to GPLv2 and LGPLv2
=20=20avahi: Update LICENSE field version to GPLv2 and LGPLv2.1
=20=20cairo: Update LICENSE field version to MPL-1 and LGPLv2.1
=20=20libcap2: Update LICENSE field version to GPLv2 or BSD
=20=20libcroco: Update LICENSE field version to LGPLv2 and LGPLv2.1
=20=20esound: Update LICENSE field version to LGPLv2
=20=20faac: Update LICENSE field version to LGPLv2
=20=20faad2: Update LICENSE field version to GPLv2
=20=20flac: Update LICENSE field version to GPLv2 and LGPLv2.1
=20=20libgcrypt: Update LICENSE field version to GPLv2 and LGPLv2.1
=20=20gdbm: Update LICENSE field version to GPLv2
=20=20libgpg-error: Update LICENSE field version to GPLv2 and LGPLv2.1
=20=20libical: Update LICENSE field version to LGPLv2.1 or MPL-1
=20=20libid3tag: Update LICENSE field version to GPLv2
=20=20libidl: Update LICENSE field version to LGPLv2
=20=20libmad: Update LICENSE field version to GPLv2
=20=20libmodplug: Update LICENSE field version to PD
=20=20lame: Update LICENSE field version to LGPLv2
=20=20mpeg2dec: Update LICENSE field version to GPLv2
=20=20mysql5: Update LICENSE field version to GPLv2
=20=20libnl: Update LICENSE field version to LGPLv2.1
=20=20libproxy: Update LICENSE field version to LGPLv2.1
=20=20librsvg: Update LICENSE field version to LGPLv2
=20=20libsamplerate0: Update LICENSE field version to GPLv2
=20=20schroedinger: Update LICENSE field version to GPLv2 and LPGLv2
=20=20libsdl: Update LICENSE field version to LGPLv2.1
=20=20libsidplay: Update LICENSE field version to GPLv2
=20=20libsndfile1: Update LICENSE field version to LGPLv2.1
=20=20libsocketcan: Update LICENSE field version to LGPLv2.1
=20=20libsoup-2.4: Update LICENSE field version to LGPLv2
=20=20libvisual: Update LICENSE field version to LGPLv2.1
=20=20x264: Update LICENSE field version to GPLv2
=20=20libxv: Update LICENSE field version to MIT-style
=20=20lmbench: Update LICENSE field version to GPLv2
=20=20makedevs: Update LICENSE field version to GPLv2
=20=20nfs-utils: Update LICENSE field version to GPLv2
=20=20orbit2: Update LICENSE field version to GPLv2
=20=20pango: Update LICENSE field version to LGPLv2
=20=20shared-mime-info: Update LICENSE field version to GPLv2
=20=20wireless-tools: Update LICENSE field version to GPLv2 and LGPLv2.1
=20=20gnome-common: Update LICENSE field version to GPLv3
=20=20cups: Update LICENSE field version to GPLv2 and LGPLv2
=20=20gnome-mime-data: Update LICENSE field version to GPLv2
=20=20gtk-doc: Update LICENSE field version to LGPLv2
=20=20intltool: Update LICENSE field version to GPLv2
=20=20libart-lgpl: Update LICENSE field version to LGPLv2
=20=20libdiscid: Update LICENSE field version to LGPLv2.1
=20=20libglade: Update LICENSE field version to LGPLv2
=20=20libmikmod: Update LICENSE field version to LGPLv2.1
=20=20libmusicbrainz: Update LICENSE field version to LGPLv2.1
=20=20neon: Update LICENSE field version to LGPLv2
=20=20libnfnetlink: Update LICENSE field version to GPLv2
=20=20python-pycairo: Update LICENSE field version to LGPLv2.1
=20=20python-pygobject: Update LICENSE field version to LGPLv2.1
=20=20python-pygtk: Update LICENSE field version to LGPLv2.1
=20=20time: Update LICENSE field version to GPLv2




