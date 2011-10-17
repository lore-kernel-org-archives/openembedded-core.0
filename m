Received: from oh-69-34-21-229.sta.embarqhsd.net ([69.34.21.229]
	helo=happy.bec-systems.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1RFkXK-0001tK-KS; Mon, 17 Oct 2011 12:35:15 +0200
Received: from localhost.localdomain ([127.0.0.1] helo=happy.bec-systems.com)
	by happy.bec-systems.com with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1RFkRg-0007J9-FM; Mon, 17 Oct 2011 06:29:24 -0400
Date: Mon, 17 Oct 2011 06:29:24 -0400
Message-Id: <E1RFkRg-0007J9-FM@happy.bec-systems.com>
X-Mailer: Nodemailer (0.1.13; +http://www.nodemailer.org)
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org
MIME-Version: 1.0
Subject: OE Changelog for 2011-10-10 to 2011-10-17
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
X-List-Received-Date: Mon, 17 Oct 2011 10:35:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Changelog for 2011-10-10 to 2011-10-17.  Projects included in this report:

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

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Bruce Ashfield (1):
=20=20linux-yocto: config cleanup and streamlining

Christopher Larson (2):
=20=20autoconf: no need to hardcode the full path to m4
=20=20autotools: fix multi-word arguments for EXTRA_OECONF

Khem Raj (4):
=20=20farsight2, ldconfig-native, gnutls: There is no GPLv2.1, correct the =
fields
=20=20qemu-0.15: Add recipe and forward port patches from 0.14
=20=20glib-2.0: Extend to provide nativesdk recipe
=20=20qemu.inc: Add glib-2.0-nativesdk to qemu-nativesdk DEPENDS

Klaus Kurzmann (1):
=20=20eglibc-2.14: add patch to fix libdl crash

Koen Kooi (4):
=20=20util-linux 2.19.1: split blkid out into its own subpackage
=20=20git: update to 1.7.7
=20=20linux-firmware: update, merge in OE classic updates, fix packaging
=20=20alsa-utils 0.10.24.2: fix systemd units when there's no asound.state

Martin Jansa (48):
=20=20xserver-xf86(-dri)-lite: rename to xserver-xorg and xserver-xorg-lite
=20=20xserver-xorg: remove old git recipe
=20=20glx-use-tls.inc: add include file to enable glx-tls only when =
TARGET_OS isn'
=20=20xserver-xorg-common: fix LIC_FILES_CHKSUM
=20=20xserver-xorg-common: move SRC_URI closer together
=20=20xserver-xorg-common: Split out some bigger modules and extensions =
from the m
=20=20xserver-xorg-common: improve packaging
=20=20xserver-xorg-common: move shared PROTO_DEPS and LIB_DEPS from =
xserver-xorg.i
=20=20xserver-xorg-common: lower xserver-xf86-config and xkeyboard-config =
dependen
=20=20xserver-xorg-common: move RDEPENDS_${PN} +=3D xorg-minimal-fonts to =
shared .in
=20=20xserver-xorg: remove FILES_${PN} +=3D "${bindir}/Xorg ", now we have =
whole ${b
=20=20xserver-xorg: replace hardcoded --enable-glx-tls with =
glx-use-tls.inc, which
=20=20xserver-xorg: move shared EXTRA_OECONF entries to shared .inc
=20=20xserver-xorg: add new version 1.11.1
=20=20xserver-xorg: remove old 1.10.1 version
=20=20xserver-xorg: remove COMPATIBLE_HOST
=20=20xserver-xorg: drop unused files
=20=20xserver-xorg: move patches to xserver-xf86-dri-lite-1.11.1 and use =
same dire
=20=20xserver-kdrive: drop unused files (same files are in =
xserver-kdrive-1.7.99.2
=20=20xorg-driver-common.inc: use virtual/xserver instead of older =
virtual/xserver
=20=20xorg-driver-common.inc: bump INC_PR to rebuild drivers agains new =
xserver-xo
=20=20libx11: package xcb, merge few changes from meta-oe
=20=20libx11: add new version 1.4.4
=20=20libx11: remove older 1.3.4
=20=20libx11: drop old 1.2.2 git version
=20=20libx11-trim: move files for libx11-trim from libx11-1.3.4 to =
libx11-trim-1.3
=20=20libx11-diet: move old patches used only by libx11-diet-1.3 to =
separate direc
=20=20python-argparse: import from meta-oe, needed for newer glib
=20=20xf86-video-intel_2.16.0: fix buildfix.patch to apply
=20=20glib: upgrade to 2.30.0
=20=20gtk+: upgrade to 2.24.6
=20=20xserver-xorg: drop xorg-minimal-fonts from RDEPENDS
=20=20xserver-xorg: move PE to xserver-xorg-common and bump it
=20=20xorg-driver-common: bump PE for upgrade path for meta-oe users
=20=20mesa-dri-glsl-native: fix LICENSE
=20=20mesa: move common patches which could be used in both mesa-dri and =
mesa-xlib
=20=20mesa-common: add common LIC_FILES_CHKSUM for newer mesa versions
=20=20mesa-common: MesaDemos is now separate recipes, bump PE, introduce =
INC_PR
=20=20mesa-7.11: move shared DEPENDS, SRC_URI, checksums and =
do_configure_prepend=20
=20=20mesa: move shared PROTO_DEPS, LIB_DEPS and DEPENDS to common .inc
=20=20mesa-xlib: move shared options to .inc
=20=20mesa-dri: move shared options to mesa-dri.inc
=20=20mesa-dri: LEAD_SONAME shouldn't be needed now, when we're packaging =
each lib
=20=20mesa-git: move shared parts from mesa-dri_git to mesa-git.inc and add =
mesa-x
=20=20mesa-git: lower D_P a bit more then all mesa-dri
=20=20mesa-git: upgrade from 7.7+git to 7.11+git
=20=20mesa-git: fix LIC_FILES_CHKSUM
=20=20nfs-utils: separate nfs-utils-client and nfs-utils-stats

Noor Ahsan (1):
=20=20bluez4: Add ending quote of FILES_${PN}-dbg

Otavio Salvador (4):
=20=20image-live.bbclass: allow override of initrd image
=20=20initramfs-live-boot: make it more generic and easy to use
=20=20qt4: use 4.7.4 as default preference
=20=20distro_tracking_fields.inc: update qt4 related entries

Richard Purdie (24):
=20=20local.conf.sample: Fix typos and default to no patch resolver
=20=20shared-mime-info: Fix a parallel make race
=20=20eglibc: Drop 2.12
=20=20gcc: Drop old version 4.5.1
=20=20gnome-vfs: This is now unused in OE-Core and deprecated, drop
=20=20qt4: Drop old version 4.7.3
=20=20hal/hal-info: This is unsed in OE-Core and deprecated, drop
=20=20mesa: Update 7.8.2 -> 7.11
=20=20xf86-video-intel: Update 2.15.0 -> 2.16.0
=20=20autotools: Enhance gettext handling to better work with SCM versions =
of code
=20=20flac: Add missing gettext dependency (requires iconv)
=20=20atk: Upgrade 1.32.0 -> 2.2.0
=20=20Import python-setuptools from meta-oe (for glib-2.0)
=20=20eds: Update to work with glib-2.0
=20=20libunique: Update to work with glib-2.0
=20=20pango: Update to work with glib-2.0
=20=20gamin: Fix glib 2.30 deprecation issues
=20=20clutter: Update git recipe to more recent version
=20=20clutter-1.6: update to 1.6.18
=20=20cogl: Add git recipe (required by clutter)
=20=20bitbake.conf Exclude MACHINE from MACHINEOVERRIDE variable =
dependencies
=20=20bitbake.conf: Use TRANSLATED_TARGET_ARCH in OVERRIDES since any =
variable wit
=20=20arch-ia32: Add a generic x86 override (instead of i{3|4|5|6}86 and so =
on)
=20=20mesa-dri: Enable swrast only by default and intel drivers only on IA =
platfor

Samuel Stirtzel (2):
=20=20patch.py: fixed message domain errors
=20=20data.py: fixed message domain errors

Saul Wold (11):
=20=20shadow-native: Bump PR for patch update
=20=20distro_tracking_fields: Updates
=20=20v86d: update to 0.1.10
=20=20libaio: Update to 0.3.109
=20=20libtiff: Update to 3.9.5
=20=20augeas: Update to 0.9.0
=20=20libgcrypt: Update to 1.5.0
=20=20rxvt-unicode: Update to 9.12
=20=20rsync: Update to 3.0.9
=20=20bash: update to 4.2
=20=20qemu.inc: qemu-native also needs glib-2.0 native

Tom Rini (1):
=20=20libnl2: Fix a race on route/pktloc_syntax.h

Wenzong Fan (1):
=20=20qt4-x11-free: Fix broken regexes in qt4-x11-free's recipe.

Xiaofeng Yan (1):
=20=20distro_tracking_fields.inc: Add maintainer for some packages without =
maintai

Zhai Edwin (2):
=20=20libfm: Upgrade to 0.1.16
=20=20pcmanfm: Upgrade to 0.9.9

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Andreas M=C3=BCller (2):
=20=20nautilus: fix compile errors by removing G_DISABLE_DEPRECATED
=20=20nautilus: cleanup package directories

Denis 'GNUtoo' Carikli (1):
=20=20xserver-common 1.34: Add Nexus S support

Denys Dmytriyenko (1):
=20=20ltp-ddt: import initial version 0.0.4 plus fixes

GNUtoo (1):
=20=20xserver-common 1.34: Add Nexus One support

Khem Raj (1):
=20=20binutils-cross: Sync with oe-core

Koen Kooi (19):
=20=20binutils 2.20.1: add -Werror hack to get the target version to build
=20=20task-sdk-target: initial add - meant to be what task-sdk-native is in =
OE cla
=20=20cloud9: add systemd unit
=20=20libmikmod 3.1.12: import from OE classic
=20=20libsdl-mixer 1.2.11: import from OE classic
=20=20guile: fix licensing and gettext inherit
=20=20pixman 0.23.6: add initial version with NEON bilinear patches
=20=20cloud9 0.5.1: fix do_install
=20=20systemd: update to v37
=20=20systemd-speed-hacks: remove some (re)mount tasks that aren't needed =
yet in O
=20=20gnome-vfs 2.24.4: import from OE-core
=20=20contrib: import pw-am.sh and oe-stylize from OE classic
=20=20task-basic: include util-linux-(u)mount, the busybox ones are broken, =
broken
=20=20xfwm4: update to 4.8.2
=20=20xfce4-settings 4.8.2: change default icon theme to 'gnome'
=20=20libdivecomputer: initial add
=20=20subsurface: inital add
=20=20systemd-speed-hacks: disable remountfs removal, images ship =
util-linux-mount
=20=20README: add top level readme, update meta-oe one

Martin Jansa (30):
=20=20xserver-xorg: drop 1.10.2 and use xserver-xf86-lite-1.11.0 from =
oe-core inst
=20=20libx11: drop here, 1.4.4 should be in oe-core
=20=20recipes: use allarch instead of PACKAGE_ARCH =3D all
=20=20pango: upgrade to 1.29.4
=20=20poppler-data: upgrade from 0.4.0 to 0.4.5
=20=20poppler: upgrade from 0.12.3 to 0.18.0
=20=20python-cython: upgrade to 0.15.1 because 0.13 doesn't work with =
python-2.7.2
=20=20python-cython: add patch to fix build error with some distutils =
packages
=20=20pidgin: package purple-2/libymsg.so to libpurple-dev
=20=20e-base: bump EFL_SRCREV
=20=20e-wm: include /usr/lib/enlightenment/modules/wizard/favorites/.order =
in FILE
=20=20e-wm-theme-illume-efenniht, exquisite-theme-illume, =
elementary-theme-efennih
=20=20elementary: fir order of PACKAGES
=20=20epdf: fix build with poppler >=3D 0.16
=20=20elementary, ethumb, libeflvala: bump PR to rebuild against newer =
poppler
=20=20python-efl: use INC_PR
=20=20elfe: bump PR to rebuild against newer poppler
=20=20eeze: add eeze_scanner also to -dbg package
=20=20python-argparse: drop from meta-oe, moved to oe-core with glib
=20=20glib-2.0: drop 2.29.3+git from meta-oe, there should be 2.30.0 in =
oe-core
=20=20gdbus-binding-tool: drop from meta-oe, superseeded by glib-2.30.0 =
where it's
=20=20e-wm-theme-illume-efenniht, elementary-theme-efenniht: break long =
DESCRIPTIO
=20=20xorg-lib: use .inc file from oe-core
=20=20glx-use-tls: moved to oe-core with mesa recipes
=20=20mesa-common: use glx-use-tls.inc from oe-core instead of bbclass
=20=20mesa: drop, there should be mesa-7.11 in oe-core
=20=20atk: rename .bbappend to apply to newer version
=20=20tiff: rename .bbappend to apply to new 3.9.5 version
=20=20libgcrypt: rename .bbappend to apply to new 1.5.0 version
=20=20nfs-utils: drop 1.1.2 from meta-oe there is 1.2.3 in oe-core

Otavio Salvador (1):
=20=20xserver-nodm-init: exit 1 only if systemd is installed and use =
${base_bindir

Simon Busch (1):
=20=20meta-oe: xf86-input-mtev: add intial recipe for a multitouch input =
driver

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Denys Dmytriyenko (2):
=20=20angstrom.inc: don't hard-depend on meta-efl layer
=20=20preferred-versions: update glib-2.0 to 2.30.0 to match oe-core

Koen Kooi (12):
=20=20angstrom core tweaks: fix task-sdk-target build
=20=20systemd-image: add systemd-speed-hacks
=20=20hardware-bringup-image: add systemd-speed-hacks
=20=20anstrom: move to pango 1.28.4
=20=20angstrom: move up to pango 1.29.4, it works a lot better than 1.28.x
=20=20angstrom: use custom fs-perms.txt that doesn't destroy our /var setup
=20=20base-files: bump PR to flush out stale packages generated by =
fs-perms.txt ex
=20=20angstrom gdm xfce hack: hack to make xfce the default session, the =
gnome one
=20=20tweaks: move over to recipes-tweaks
=20=20README: encourage use of github mirror for pull requests
=20=20images: move to recipes-images subdir
=20=20xfce-nm-image: add back autologin hack

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Bruce Ashfield (1):
=20=20linux-yocto: config cleanup and streamlining

Christopher Larson (2):
=20=20autoconf: no need to hardcode the full path to m4
=20=20autotools: fix multi-word arguments for EXTRA_OECONF

Khem Raj (4):
=20=20farsight2, ldconfig-native, gnutls: There is no GPLv2.1, correct the =
fields
=20=20qemu-0.15: Add recipe and forward port patches from 0.14
=20=20glib-2.0: Extend to provide nativesdk recipe
=20=20qemu.inc: Add glib-2.0-nativesdk to qemu-nativesdk DEPENDS

Klaus Kurzmann (1):
=20=20eglibc-2.14: add patch to fix libdl crash

Koen Kooi (4):
=20=20util-linux 2.19.1: split blkid out into its own subpackage
=20=20git: update to 1.7.7
=20=20linux-firmware: update, merge in OE classic updates, fix packaging
=20=20alsa-utils 0.10.24.2: fix systemd units when there's no asound.state

Martin Jansa (49):
=20=20atk: add missing SOB line to remove.G_CONST_RETURN.patch
=20=20xserver-xf86(-dri)-lite: rename to xserver-xorg and xserver-xorg-lite
=20=20xserver-xorg: remove old git recipe
=20=20glx-use-tls.inc: add include file to enable glx-tls only when =
TARGET_OS isn'
=20=20xserver-xorg-common: fix LIC_FILES_CHKSUM
=20=20xserver-xorg-common: move SRC_URI closer together
=20=20xserver-xorg-common: Split out some bigger modules and extensions =
from the m
=20=20xserver-xorg-common: improve packaging
=20=20xserver-xorg-common: move shared PROTO_DEPS and LIB_DEPS from =
xserver-xorg.i
=20=20xserver-xorg-common: lower xserver-xf86-config and xkeyboard-config =
dependen
=20=20xserver-xorg-common: move RDEPENDS_${PN} +=3D xorg-minimal-fonts to =
shared .in
=20=20xserver-xorg: remove FILES_${PN} +=3D "${bindir}/Xorg ", now we have =
whole ${b
=20=20xserver-xorg: replace hardcoded --enable-glx-tls with =
glx-use-tls.inc, which
=20=20xserver-xorg: move shared EXTRA_OECONF entries to shared .inc
=20=20xserver-xorg: add new version 1.11.1
=20=20xserver-xorg: remove old 1.10.1 version
=20=20xserver-xorg: remove COMPATIBLE_HOST
=20=20xserver-xorg: drop unused files
=20=20xserver-xorg: move patches to xserver-xf86-dri-lite-1.11.1 and use =
same dire
=20=20xserver-kdrive: drop unused files (same files are in =
xserver-kdrive-1.7.99.2
=20=20xorg-driver-common.inc: use virtual/xserver instead of older =
virtual/xserver
=20=20xorg-driver-common.inc: bump INC_PR to rebuild drivers agains new =
xserver-xo
=20=20libx11: package xcb, merge few changes from meta-oe
=20=20libx11: add new version 1.4.4
=20=20libx11: remove older 1.3.4
=20=20libx11: drop old 1.2.2 git version
=20=20libx11-trim: move files for libx11-trim from libx11-1.3.4 to =
libx11-trim-1.3
=20=20libx11-diet: move old patches used only by libx11-diet-1.3 to =
separate direc
=20=20python-argparse: import from meta-oe, needed for newer glib
=20=20xf86-video-intel_2.16.0: fix buildfix.patch to apply
=20=20glib: upgrade to 2.30.0
=20=20gtk+: upgrade to 2.24.6
=20=20xserver-xorg: drop xorg-minimal-fonts from RDEPENDS
=20=20xserver-xorg: move PE to xserver-xorg-common and bump it
=20=20xorg-driver-common: bump PE for upgrade path for meta-oe users
=20=20mesa-dri-glsl-native: fix LICENSE
=20=20mesa: move common patches which could be used in both mesa-dri and =
mesa-xlib
=20=20mesa-common: add common LIC_FILES_CHKSUM for newer mesa versions
=20=20mesa-common: MesaDemos is now separate recipes, bump PE, introduce =
INC_PR
=20=20mesa-7.11: move shared DEPENDS, SRC_URI, checksums and =
do_configure_prepend=20
=20=20mesa: move shared PROTO_DEPS, LIB_DEPS and DEPENDS to common .inc
=20=20mesa-xlib: move shared options to .inc
=20=20mesa-dri: move shared options to mesa-dri.inc
=20=20mesa-dri: LEAD_SONAME shouldn't be needed now, when we're packaging =
each lib
=20=20mesa-git: move shared parts from mesa-dri_git to mesa-git.inc and add =
mesa-x
=20=20mesa-git: lower D_P a bit more then all mesa-dri
=20=20mesa-git: upgrade from 7.7+git to 7.11+git
=20=20mesa-git: fix LIC_FILES_CHKSUM
=20=20nfs-utils: separate nfs-utils-client and nfs-utils-stats

Noor Ahsan (1):
=20=20bluez4: Add ending quote of FILES_${PN}-dbg

Otavio Salvador (4):
=20=20image-live.bbclass: allow override of initrd image
=20=20initramfs-live-boot: make it more generic and easy to use
=20=20qt4: use 4.7.4 as default preference
=20=20distro_tracking_fields.inc: update qt4 related entries

Richard Purdie (26):
=20=20shared-mime-info: Fix a parallel make race
=20=20eglibc: Drop 2.12
=20=20gcc: Drop old version 4.5.1
=20=20gnome-vfs: This is now unused in OE-Core and deprecated, drop
=20=20qt4: Drop old version 4.7.3
=20=20hal/hal-info: This is unsed in OE-Core and deprecated, drop
=20=20mesa: Update 7.8.2 -> 7.11
=20=20xf86-video-intel: Update 2.15.0 -> 2.16.0
=20=20meta-yocto: Catch up with xserver and mesa upgrades/rename
=20=20autotools: Enhance gettext handling to better work with SCM versions =
of code
=20=20flac: Add missing gettext dependency (requires iconv)
=20=20atk: Upgrade 1.32.0 -> 2.2.0
=20=20Import python-setuptools from meta-oe (for glib-2.0)
=20=20eds: Update to work with glib-2.0
=20=20libunique: Update to work with glib-2.0
=20=20pango: Update to work with glib-2.0
=20=20gamin: Fix glib 2.30 deprecation issues
=20=20clutter: Update git recipe to more recent version
=20=20clutter-1.6: update to 1.6.18
=20=20cogl: Add git recipe (required by clutter)
=20=20clutter: Update bbappend after oe-core upgrade
=20=20bitbake.conf Exclude MACHINE from MACHINEOVERRIDE variable =
dependencies
=20=20meta-yocto: Sync with mesa/xserver changes and fix machines
=20=20bitbake.conf: Use TRANSLATED_TARGET_ARCH in OVERRIDES since any =
variable wit
=20=20arch-ia32: Add a generic x86 override (instead of i{3|4|5|6}86 and so =
on)
=20=20mesa-dri: Enable swrast only by default and intel drivers only on IA =
platfor

Robert Yang (1):
=20=20Fix typos in local.conf.sample and local.conf.sample.extended

Samuel Stirtzel (2):
=20=20patch.py: fixed message domain errors
=20=20data.py: fixed message domain errors

Saul Wold (11):
=20=20shadow-native: Bump PR for patch update
=20=20distro_tracking_fields: Updates
=20=20v86d: update to 0.1.10
=20=20libaio: Update to 0.3.109
=20=20libtiff: Update to 3.9.5
=20=20augeas: Update to 0.9.0
=20=20libgcrypt: Update to 1.5.0
=20=20rxvt-unicode: Update to 9.12
=20=20rsync: Update to 3.0.9
=20=20bash: update to 4.2
=20=20qemu.inc: qemu-native also needs glib-2.0 native

Scott Rifenbark (4):
=20=20documentation/dev-manual: Fixed five broken links and removed note
=20=20documentation: Cleaned out bad links and replaced with good
=20=20documentation/adt-manual/adt-eclipse.xml: fixed indigo typos
=20=20documentation/adt-manual/adt-eclipse.xml: Added missing section for =
plug-in

Tom Rini (1):
=20=20libnl2: Fix a race on route/pktloc_syntax.h

Wenzong Fan (1):
=20=20qt4-x11-free: Fix broken regexes in qt4-x11-free's recipe.

Xiaofeng Yan (1):
=20=20distro_tracking_fields.inc: Add maintainer for some packages without =
maintai

Zhai Edwin (2):
=20=20libfm: Upgrade to 0.1.16
=20=20pcmanfm: Upgrade to 0.9.9

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-texasinstruments:

Joel A Fernandes (3):
=20=20ti-hw-bringup-image: Add kernel-modules package
=20=20beaglebone-tester: A component-based test framework for BeagleBone
=20=20linux-am335x-joel: Enable g_file_storage kernel module

Koen Kooi (21):
=20=20linux-am335x-joel 3.1rc: disable debug options like lockdep, switch =
to thumb
=20=20u-boot 2011.09: switch to proper 2011.09 tag and add support for TCT =
beaconb
=20=20u-boot 2011.09: add support for loop-through expansion boards on =
beagle and=20
=20=20linux 3.0: add support for loopthrough expansion boards like the =
uLCD-lite
=20=20Matrix 2.0: initial add
=20=20matrix 2.0: first round of fixes
=20=20cloud9-image: add
=20=20u-boot 2011.10rc: update to latest Joel, rebase Jasons patches
=20=20cloud9-image: add vim and procps
=20=20ti-hw-bringup-image: add systemd-speed-hacks
=20=20sdcard_image bblass: all machines load from ext2/ext3 now, remove =
uImage cop
=20=20u-boot 2010rc: switch to Toms latest branch, rediff env patches
=20=20u-boot 2011.10rc: raise bootdelay to 1 for the time being
=20=20task-ti-test: clean up machine specific bits, inherit allarch
=20=20ti-hw-bringup-image: switch to task-ti-test
=20=20matrix: merge changes from =
arago/next/fa8563ae1238c38c779226ebed375c61560c64
=20=20cloud9-image: add beaglebone-tester app
=20=20sdcard_image bbclass: move back to 2GB images, clarify LOOPDEV* usage
=20=20sdcard_image bbclass: default to 4GiB, but use 2GiB for beaglebone
=20=20u-boot: switch beagleboard and beaglebone to RO rootfs at boot
=20=20linux-am335x-joel 3.1: lower gadget power budget, enable usb-test and =
uas

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

Denis 'GNUtoo' Carikli (13):
=20=20meta-shr: emtooth2: add LIC_FILES_CHKSUM and bump SRCREV
=20=20meta-samsung: linux-samsung-crespo: update defconfig and cleanup =
recipe
=20=20meta-htc: linux-nexusone: add defconfig
=20=20meta-openmoko: linux-2.6.39: make bluetooth work for om-gta02
=20=20meta-openmoko: om-gta02: fix bluetooth modules autoload
=20=20meta-htc: add nexusone xorg.conf and bump PRINC
=20=20meta-htc: linux-nexusone: add a ${KERNEL_IMAGE_SYMLINK_NAME}.fastboot =
symlin
=20=20meta-htc: nexusone.conf: add alsa and wifi to =
MACHINE_EXTRA_RRECOMMENDS and=20
=20=20meta-htc: linux-leviathan: cleanup,add defconfig and move to =
linux-htcdream
=20=20meta-smartphone: fsotdld: build the gpsd plugin
=20=20meta-samsung: xf86-input-mtev_git.bbappend: make it MACHINE_ARCH for =
crespo
=20=20meta-samsung: linux-samsung-crespo: bump SRCREV
=20=20meta-samsung: linux-samsung-crespo: bump SRCREV

Martin Jansa (10):
=20=20SHR: potential fix for multimachine builds rebuilding from scratch =
after eve
=20=20meta-openmoko: mesa-dri: add glamo support
=20=20meta-openmoko: linux-2.6.39: apply patch for setting DAI mode while =
pcm is a
=20=20meta-openmoko: om-gta02: drop MACHINE_DRI_MODULES
=20=20libdrm, mesa-dri: add glamo support for whole armv4t
=20=20mesa-dri: move , to end of EXTRA_DRIDRIVERS
=20=20mesa-dri: use DRIDRIVERS_append_armv4t
=20=20meta-fso: fix licensing information for some recipes
=20=20omhacks: bump SRCREV, fix help2man and licensing info
=20=20meta-shr: themes: fix licensing info

Simon Busch (22):
=20=20meta-fso: cornucopia: bump SRCREV
=20=20meta-aurora: aurora-base: bump SRCREV
=20=20meta-samsung: libsamsung-ipc: bump SRCREV
=20=20meta-fso: msmcomm: bump SRCREV
=20=20meta-fso: android-image-utils-native: bump SRCREV
=20=20meta-fso: libsamsung-ipc: moved from meta-samsung in this place
=20=20fsogsmd: package samsung modem plugins and bump PR
=20=20meta-fso: android-image-utils-native: bump SRCREV
=20=20meta-palm: linux-hpveer: port recipe from oe-dev
=20=20meta-smasung: base-files: add additional mount directory and fstab =
file
=20=20meta-samsung: crespo: add 200 megabyte of extra space in our images
=20=20meta-fso: fsogsmd: fix names of packages for lowlevel-samsung-crespo =
plugin
=20=20meta-fso: fsogsmd: add libfsotransport as dependency
=20=20meta-palm: add machine description for hpveer
=20=20meta-fso: cornucopia: bump SRCREV
=20=20meta-samsung: crespo: add kernel-module-bcm4329 as extra runtime =
dependency
=20=20meta-fso: fso-autorev.inc: add libsamsung-ipc
=20=20meta-fso: libsamsung-ipc: bump SRCREV
=20=20meta-fso: cornucopia: bump SRCREV
=20=20meta-shr: libphone-ui: bump SRCREV to fix some unused variable =
compilation e
=20=20meta-samsung: chroot-script: add little script to chroot into another =
rootfs
=20=20meta-samsung: chroot-image: add chroot initramfs image for booting =
into anot

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-micro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-slugos:

Khem Raj (2):
=20=20busybox: Move 1.18.4 -> 1.18.5
=20=20slugos.conf: Change pinned version of binutils and eglibc

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nslu2:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Eric B=C3=A9nard (1):
=20=20meta-emenlow: update qt4 to 4.7.4

Tom Zanussi (23):
=20=20meta-emenlow: restore /usr/lib/dri for xpsb-glx
=20=20meta-emenlow: upgrade clutter .bbappend
=20=20meta-intel: /common xserver-xorg name change
=20=20meta-sugarbay: xserver-xorg rename
=20=20meta-sugarbay: remove meta-intel/common from BBFILES
=20=20meta-crownbay: xserver-xorg renaming updates
=20=20meta-fishriver: xserver-xorg renaming updates
=20=20meta-fri2: xserver-xorg renaming updates
=20=20meta-jasperforest: remove meta-intel/common from BBFILES
=20=20meta-jasperforest: xserver-xorg renaming updates
=20=20meta-jasperforest: remove obsolete xserver-xf86-dri-lite .bbappend
=20=20meta-n450: xserver-xorg renaming updates
=20=20meta-emenlow: update xserver-psb with xorg name change
=20=20meta-emenlow: xserver-xorg renaming updates
=20=20meta-intel: update SRCREVs
=20=20crownbay-noemgd: set boot vga mode
=20=20crownbay: set boot vga mode
=20=20emenlow: set boot vga mode
=20=20jasperforest: set boot vga mode
=20=20fishriver: set boot vga mode
=20=20meta-fishriver: add missing SMP/SCHED_SMT support
=20=20fri2: set boot vga mode
=20=20fri2-noemgd: set boot vga mode

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-handheld:

Martin Jansa (2):
=20=20xserver-xf86-config: add bbappend and spitz xorg.conf
=20=20linux: bump SRCREV for 3.1.0-rc9 and use repo on kernel.org again

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-opie:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:

Marco Cavallini (3):
=20=20kaeilos.conf: added java support
=20=20kaeilos-2010.conf: marked as obsolete
=20=20python-numpy: copied missing files from arm directory

Paul Menzel (1):
=20=20lightmediascanner: Add version 0.4.4




