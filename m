Received: from new.bec-systems.com ([74.208.70.121] helo=bec-systems.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1TQJSs-0007TK-Ua; Mon, 22 Oct 2012 16:58:51 +0200
Received: from oh-69-34-21-229.sta.embarqhsd.net ([69.34.21.229]
	helo=happy.bec-systems.com)
	by bec-systems.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cliff.brake@gmail.com>)
	id 1TQJ7s-0002nk-6J; Mon, 22 Oct 2012 10:37:11 -0400
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Date: Mon, 22 Oct 2012 14:45:16 GMT
Message-Id: <1350917116136.5b893d6e@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
X-Spam_score: -2.9
X-Spam_score_int: -28
X-Spam_bar: --
Subject: OE Changelog since 2012-10-14 until 2012-10-21
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
X-List-Received-Date: Mon, 22 Oct 2012 14:58:51 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2012-10-14 until 2012-10-21.  Projects included in this =
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
meta-arago: git://arago-project.org/git/meta-arago.git
meta-ivi: git://git.yoctoproject.org/meta-ivi
meta-systemd: git://git.yoctoproject.org/meta-systemd
meta-guacamayo: git://github.com/Guacamayo/meta-guacamayo.git
meta-beagleboard: git://github.com/beagleboard/meta-beagleboard.git

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for bitbake:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Andrei Dinu (1):
=20=20gypsy: removed gypsy from meta/recipes-connectivity

Andy Ross (1):
=20=20sysklogd: fix update-rc.d handling

Bogdan Marinescu (1):
=20=20sanity.bbclass: trigger network tests explicitly

Bruce Ashfield (1):
=20=20kernel.bbclass: remove explicit version.h target

Colin Walters (1):
=20=20Add packagegroup-core-buildessential

Constantin Musca (1):
=20=20libnss-mdns: fix mDNS resolving speed

Daniel Stone (2):
=20=20libdrm: Bump git recipe to latest 2.4.39+ revision
=20=20libdrm: Add --disable-cairo-tests switch and update to upstream patch

Evade Flow (2):
=20=20Move 'tag=3D' to SRCREV in btrfs-tools recipe
=20=20Move 'tag=3D' to SRCREV in mtd-utils recipe

Joe Slater (1):
=20=20chkconfig: pass CFLAGS to Makefile

Marcin Juszkiewicz (9):
=20=20siteinfo.bbclass: add AArch64 support
=20=20kernel-arch.bblass: add AArch64 support
=20=20insane.bbclass: add AArch64 support
=20=20openssl: add AArch64 support
=20=20util-linux: add AArch64 support
=20=20packagegroups: disable kexec, valgrind, lttng, systemtap on AArch64
=20=20pcmanfm: mark AArch64 as compatible
=20=20gnu-config: update to 2012.08.14 to get support for AArch64 =
architecture
=20=20packagegroup-self-hosted: recommend kernel modules instead of =
depending on t

Martin Jansa (4):
=20=20qt4: use extra variable for more QT_CONFIG_FLAGS fragments
=20=20PACKAGES_DYNAMIC: use regexp not glob
=20=20PACKAGES_DYNAMIC: use +=3D instead of =3D in most cases
=20=20kernel.bbclass: add kernel-modules to PACKAGES

Otavio Salvador (1):
=20=20buildhistory.bbclass: Fix hostname print for 'No changes' case

Paul Eggleton (1):
=20=20local.conf.sample: add PATH to SSTATE_MIRRORS comments

Phil Blundell (11):
=20=20cpan_build: Unify directory layout for native and target builds
=20=20gettext: Remove spurious-looking dependencies on libxml2-native
=20=20kernel.bbclass, module.bbclass: Make update-modules optional
=20=20module.bbclass: Move do_make_scripts() to module-base
=20=20strace: Don't package strace-graph
=20=20recipe_sanity: Don't bother checking LICENSE
=20=20gtk-doc.bbclass: Run gtkdocize in ${S} not ${B}
=20=20insane: Rationalise phdrs-based QA checks
=20=20insane: Don't try to run objdump on symlinks
=20=20lib/oe/qa: Trap exceptions when running objdump
=20=20gconf: Avoid error when trying to delete files that don't exist

Richard Purdie (22):
=20=20libc-package: Drop bogus replacement operation
=20=20package: Recommend virtual-locale-*, don't depend on it
=20=20pkgconfig: Drop automatic pkgconfig RDEPENDS
=20=20libtool: Ensure the paths to sed are not hardcoded
=20=20scipts/combo-layer: Fix check_rev_branch() for cases where the =
revision is o
=20=20sstate: Use -m option to tar when unpacking sstate
=20=20qemu: Explicitly disable bluez, its not in DEPENDS
=20=20console-tools: Clean up recipe
=20=20gettext: Add config.rpath and Makefile.in.in to gettext-minimal-native
=20=20kexec-tools: Add dependency on xz
=20=20diffutils: Remove rather bizzare gettext macros
=20=20texi2html: Add check for directory existence
=20=20scripts/cp-noerror: Copy the code from shutils.copytree, update not =
to error
=20=20scripts/cp-noerror: Try and use hardlinks if possible
=20=20autotools: Fix race over aclocal macro directory
=20=20autotools.bbclass: Fix gettext macro versions issues
=20=20autotools: Use STAGING_DATADIR_NATIVE for config.rpath
=20=20grep: Fix gplv2 version to work with recent gettext
=20=20sed: Fix gplv2 version to work with recent gettext
=20=20diffutils: Fix gplv2 version to work with recent gettext
=20=20bison: Fix gplv2 version to work with recent gettext
=20=20console-tools: Fix build issues with make 3.82

Robert Yang (1):
=20=20perl: fix dependecies

Ross Burton (17):
=20=20xf86-input-evdev: bump to latest release
=20=20xf86-video-fbdev: bump to 0.4.3
=20=20xf86-input-keyboard: upgrade to 1.6.2
=20=20xserver-xorg: upgrade to 1.11.4
=20=20xf86-video-intel: bump to latest release
=20=20mesa: remove mesa-dri dependency in mesa-dri-dev
=20=20mesa: remove libegl-dbg, put all debugging into mesa-dri-dbg
=20=20xorg: remove XTrap
=20=20xserver-xorg: use INC_PR in PR
=20=20xorg: remove all traces of XPrint
=20=20libxfont: remove spurious dependency on fontcacheproto
=20=20xorg: remove fontcache support
=20=20xorg: remove xf86rushproto
=20=20xorg-proto: remove evieext
=20=20pulseaudio: add missing switch-on-port-available dependency to the =
server
=20=20ia32-base.inc: don't depend on mesa-dri
=20=20sstate: when warnings about sysroot overwrites, say what the recipe =
was

Saul Wold (9):
=20=20insane.conf: add new libexec test
=20=20qemu: add libexecdir to configure call
=20=20lttng-tools: skip new libexec insane test
=20=20bitbake.conf: change libexecdir to ${libdir}/${BPN}
=20=20build-appliance: ensure zip file is linked locally
=20=20perf: set the perfexecdir
=20=20qemu: don't ignore libexecdir in configure
=20=20sato-icon-theme: update mapping program location
=20=20gnome-icon-theme: update mapping program location

Thomas Kristensen (1):
=20=20populate_sdk_base.bbclass: Make it possible to override the =
create_shar meth

Vladimir Zapolskiy (1):
=20=20lttng: support more compatible hosts

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Andreas M=C3=BCller (2):
=20=20glade3: initial add 3.8.2
=20=20libxfce4ui: add glade package

Jack Mitchell (1):
=20=20hiawatha: add initial 8.5 recipe and associated files

Marcin Juszkiewicz (1):
=20=20mysql: start at runlevel 5 not S

Martin Jansa (5):
=20=20PACKAGES_DYNAMIC: use regexp not glob
=20=20mcnavi: remove myslq_config include path work around
=20=20ecore: drop libxputil from DEPENDS
=20=20libxaw: drop libxp and printproto from DEPENDS
=20=20mcnavi: move from meta-oe to meta-efl

Otavio Salvador (1):
=20=20xbmc: Fix serveral build errors and install missing dependencies

Paul Eggleton (7):
=20=20modphp: fix rpath QA issue
=20=20modphp: make LICENSE more accurate
=20=20libc-client: correct LICENSE
=20=20rrdtool: add pango to DEPENDS
=20=20libnice: tidy up meta variables
=20=20iso-codes: set SUMMARY
=20=20modphp: call gnu-configize in do_configure

Philip Balister (2):
=20=20fuse : Update to version 2.9.2.
=20=20sshfs-fuse : Import recipe from Openembedded Classic.

Samuel Stirtzel (1):
=20=20Maliit: Add initial recipes

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

Denis 'GNUtoo' Carikli (2):
=20=20meta-openmoko: linux-gta04: bump SRCREV.
=20=20meta-shr: Distro(shr.conf): enable alsa.

Martin Jansa (10):
=20=20Merge remote-tracking branch =
'remotes/shr/gnutoo/shr-alsa-distro-feature' in
=20=20packagegroup-base: bump PRINC to pick alsa from DISTRO_FEATURES
=20=20shr-settings: bump SRCREV for fix from [SHR #2069]
=20=20meta-shr: rename xserver-xorg bbappend to match new version
=20=20shr: prefer qt 4.8.3
=20=20numptyphysics: use cp instead of mv to make do_configure reentrant

Simon Busch (2):
=20=20meta-samsung: linux-samsung-tuna: use new 3.0.46 based version
=20=20alsa-ucm-conf: use public repository instead of old private one

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-micro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-slugos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nslu2:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Kishore Bodke (1):
=20=20meta-crystalforest: Update SRCREV for meta.

Nitin A Kamble (6):
=20=20chiefriver: update kernel repo srcrevs
=20=20crownbay: update kernel repo srcrevs
=20=20emenlow: update kernel repo srcrevs
=20=20jasperforest: update kernel repo srcrevs
=20=20sugarbay: update kernel repo srcrevs
=20=20mesa-dri.bbappend: avoid buildtime warnings

Paul Eggleton (1):
=20=20ffmpeg: set LICENSE_FLAGS

Rahul Saxena (3):
=20=20meta-cedartrail: Update README with product name and state Gfx =
acceleration=20
=20=20meta-cedartrail: Fix package naming issue
=20=20meta-cedartrail: Add development packages to pvr driver recipe

Ross Burton (2):
=20=20cedartrail: add missing gst-va-intel-vaapi machine feature
=20=20gstreamer-vaapi: upgrade to 0.3.8, and remove ffmpeg dependencies

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-handheld:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-opie:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-bug:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-efikamx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ettus:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-ppc:

Matthew McClintock (1):
=20=20hypervisor_git.bb: initial add of embedded-hv to public layer

Zhenhua Luo (1):
=20=20hypervisor: add missing space character for PACKAGES_prepend

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

Henning Heinold (2):
=20=20jamvm: update git version
=20=20openjdk: update to version 1.11.5

Jan Luebbe (1):
=20=20classpath: avoid picking up gmp.h from the host

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-qt3:

Richard Purdie (1):
=20=20qt-x11-free-native: Improve LICENSE field to specify versions

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-telephony:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

Franklin S. Cooper Jr (1):
=20=20linux-am335x-3.2.0-psp04.06.00.08: Add PSP v04.06.00.08 of the Linux =
kernel

Herv=C3=A9 Fache (1):
=20=20linux-omap4: update to 3.4 from GLP 1.6.6 release

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-browser:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-mono:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-raspberrypi:

Andrei Gherzan (4):
=20=20libav: Align recipe version with meta-oe
=20=20README: Minor tweaks
=20=20libav: Remove patch and recipe as new version of libav works ok
=20=20sdcard_image-rpi: Use the partition table as described in comments

Julian Scheel (5):
=20=20rpi-config: update git revision.
=20=20rpi-config: Add variable for overscan configuration.
=20=20rpi-config: Add variables for overclocking options.
=20=20README: Describe overscan option
=20=20README: Describe overclocking options

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-kde:

Samuel Stirtzel (1):
=20=20kde_exports: Clean up bbclass

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Paul Eggleton (1):
=20=20local.conf.sample: add PATH to SSTATE_MIRRORS comments

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

Herb Kuta (8):
=20=20Split off qmake and friends into a new qmake-webos-native
=20=20pmlogdaemon: Add unshipped file to package
=20=20Correct misconception as to when to inherit pkgconfig
=20=20pmlogdaemon: Add unshipped file to package
=20=20Make various improvements to recipes for Core OS components
=20=20Make various improvements to recipes for service stub components
=20=20Make various improvements to recipes for Core Apps components
=20=20Make various improvements to recipes for Framework components

Keith Derrick (1):
=20=20fbprogress(r1): correct errors in recipe

Kimmo Leppala (1):
=20=20Smartkey-hun: Add service files to package

Mikko Levonmaa (1):
=20=20Removed device specific hard coding from the qt4 recipe

Roger Stringer (1):
=20=20Increment luna-sysmgr to latest tag 0.930

Susan Montooth (2):
=20=20fbprogress: replace RDEPENDS with RDEPENDS_${PN}
=20=20ptmalloc3: set PR

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Denys Dmytriyenko (9):
=20=20arago.conf: set distro name and version
=20=20external-arago-sdk-toolchain: add recipe to package SDK bits of the =
toolchai
=20=20task-arago-cross-canadian: add task for Canadian cross toolchain =
pieces in S
=20=20task-arago-sdk-host-nativesdk: add task for host SDK tools
=20=20tcmode-external-arago: prefer external toolchain for packaging SDK
=20=20meta-toolchain-arago: add base recipe to produce a TI SDK 'devkit'
=20=20arago.conf: put in knobs for setting SDK name, path and dir structure
=20=20arago.conf: also build 32bit Pseudo on 64bit machines
=20=20arago.conf: remove the workaround for STAGING_KERNEL_DIR

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

Andrei Gherzan (74):
=20=20usr-merge: Remove class as drop usr-merge
=20=20usbutils: Remove bbappend as we dropped usr-merge
=20=20openssl: Remove bbappend as we dropped usr-merge
=20=20ncurses: Remove bbappend as we dropped usr-merge
=20=20tinylogin: Remove bbappend as we dropped usr-merge
=20=20bash: Remove bbappend as we dropped usr-merge
=20=20e2fsprogs: Remove bbappend as we dropped usr-merge
=20=20kmod: Remove bbappend as we dropped usr-merge
=20=20shadow: Remove bbappend as we dropped usr-merge
=20=20libgcc: Remove bbappend as we dropped usr-merge
=20=20libpam: Remove bbappend as we dropped usr-merge
=20=20util-linux: Remove bbappend as we dropped usr-merge
=20=20nfs-utils: Remove patch needed for the dropped usr-merge mechanism
=20=20alsa-utils: Remove bbappend as we dropped usr-merge
=20=20busybox: Modify bbappend as we dropped usr-merge
=20=20eglibc-locale: Remove bbappend as we dropped usr-merge
=20=20eglibc: Modify bbappend as we dropped usr-merge and drop patch
=20=20base-files: Modify bbappend as we dropped usr-merge
=20=20discovery-image: Drop usr-merge
=20=20ivi-image: Drop usr-merge
=20=20cassini-image: Remove image
=20=20discovery-image: Use ivi-image.inc and PV =3D 2.0.2
=20=20excalibur-image: Remove LICENSE as it is included in ivi-image.inc
=20=20packagegroup-discovery-core-p1: Remove AudioManager as we have it in =
core-p1
=20=20packagegroup-excalibur-core-p1: Remove AudioManager as we have it in =
core-p1
=20=20systemd: Add bbappend to compile systemd without xz
=20=20vexpressa9.conf: Set jpeg preferred provider
=20=20packagegroup-discovery-core-p1.bb: Fix DESCRIPTION
=20=20pulseaudio: Modify bbappend to drop usr-merge
=20=20pulseaudio: Refactor bbappend and remove patch
=20=20ofono: Use systemd_unitdir
=20=20bluez4: Use systemd class from meta-oe/meta-systemd
=20=20connman: Drop systemd related stuff as we use bbappend from =
meta-systemd
=20=20ofono: Use systemd class from meta-oe/meta-systemd
=20=20portmap: Move systemd service and modify description
=20=20portmap: Modify bbappend to drop usr-merge and related patch
=20=20portmap: Use systemd class from meta-oe/meta-systemd
=20=20wpa-supplicant: Move systemd service in directory
=20=20wpa-supplicant: Drop service and bbappend as we use bbappend from =
meta-syste
=20=20busybox: hwclock is already packaged in a different package
=20=20coreutils: Drop bbappend as we dropped usr-merge
=20=20dbus: Use default systemd_unitdir
=20=20netbase: Remove v4.47 as we use the poky version
=20=20netbase: Add bbappend to drop init scripts
=20=20shadow-securetty: Refactor bbapend and add PRINC
=20=20tcp-wrappers: Remove bbappend as we dropped usr-merge
=20=20layer-management: Refactor recipe, fix service and use systemd class
=20=20openssh: Remove bbappend and other files as we those from meta-systemd
=20=20pango: Remove recipe and use yocto version
=20=20pango: Add bbappend to remove gnome-common dependency if non-GPLv3
=20=20xserver-xf86-config: Remove recipe and use the one from poky
=20=20xserver-xorg: Use systemd class from meta-oe/meta-systemd
=20=20xserver-xorg: Remove workarounds as fixes are merged in poky
=20=20linux-yocto: Remove PERFDEPENDS
=20=20linux-yocto: Minor tweaks
=20=20tiff: Remove xz dependency if non-GPLv3
=20=20gst-plugins-base: Remove bbappend
=20=20gst-plugins-good: Remove dependencies in a clean way
=20=20acl: Remove bbappend as we dropped usr-merge
=20=20attr: Remove bbappend as we dropped usr-merge
=20=20consolekit: Replace recipe with append
=20=20ecryptfs-utils: Use systemd class from meta-oe/meta-systemd
=20=20fuse: Remove recipe in the favor the one from meta-oe
=20=20libcap: Remove bbappend as we dropped usr-merge
=20=20libusb1: Remove bbappend as we dropped usr-merge
=20=20libusb-compat: Remove bbappend as we dropped usr-merge
=20=20base-files: Remove bbappend - we don't need a custom fstab right now
=20=20Remove yocto-ivi-perms.txt and reference to it
=20=20README.md: Update README with meta-oe changes
=20=20Drop dev/dbg from packagegroups as those are added in packagegroup =
class
=20=20Convert recipes names to lowercase
=20=20xserver-xorg: Align bbappend version with poky
=20=20README.md: Fix poky SHA
=20=20base-files: Add custom fstab to remove /var/volatile mountpoint

Florin Sarbu (3):
=20=20README.md: Small additions to correct meta-openembedded dependency =
and add e
=20=20README.md: sha changes
=20=20README.md: sha update

Holger Behrens (2):
=20=20excalibur-image: prepare 3.0.0
=20=20poky-ivi-systemd.conf: update DISTRO_VERSION

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-systemd:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-guacamayo:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-beagleboard:




