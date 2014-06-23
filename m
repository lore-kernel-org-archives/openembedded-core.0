Return-Path: <cliff.brake@gmail.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id DEF8265FC8;
	Mon, 23 Jun 2014 19:18:17 +0000 (UTC)
Received: by mail-ig0-f171.google.com with SMTP id h18so3433004igc.16
	for <multiple recipients>; Mon, 23 Jun 2014 12:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:mime-version:message-id:from:to:subject:content-type
	:content-transfer-encoding;
	bh=Vf1mTZC1oRxBR6gtnVZY3VKGjODD9CkNK2QGD7HAc5M=;
	b=aTIG02M1bCbcSO+oLfy8bSUKi/S9Sct1FMDa/pVDy43zATyJ0wAvNWDx31R6XGb/6K
	TTtca0C4a9/OZFIWuHpBdQyiJyStRk1vlWeaFWECUtkhktJzwk9Ip0ukD4DrIEEejgWA
	qqPXS2NbhgM3a0t8OD0LOndTluTR+Dx4jom0xbxpsrX8sGVOxg4lMx3srBAjHiNNFQrD
	AkPl436PXEhwU7g84WeGj32AyYidhYH9x1ZOE5G85dev78I76N8ovTt2ewfsN0R7/AxT
	Q+Viw/D7d0cDTEi6ZA4x+ainY7FXKZ7CVddeW2MyHh7OrhUnyuB8vcCjgYoJAt45Ryz7
	14Kw==
X-Received: by 10.50.80.50 with SMTP id o18mr29664250igx.40.1403551098132;
	Mon, 23 Jun 2014 12:18:18 -0700 (PDT)
Received: from [127.0.0.1] (cable-pool6-cs-200.doycomm.com. [66.219.185.200])
	by mx.google.com with ESMTPSA id
	u10sm35008583igz.21.2014.06.23.12.18.16 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Jun 2014 12:18:17 -0700 (PDT)
Date: Mon, 23 Jun 2014 12:18:17 -0700 (PDT)
X-Google-Original-Date: Mon, 23 Jun 2014 19:18:16 GMT
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Message-Id: <1403551096053.b14524be@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
Subject: OE Changelog since 2014-06-15 until 2014-06-22
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
X-List-Received-Date: Mon, 23 Jun 2014 19:18:19 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2014-06-15 until 2014-06-22.  Projects included in this =
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

Belen Barros (1):
=20=20toaster: Fix spacing and layout in no image files notification

Farrell Wymore (2):
=20=20toaster: refactor the target page
=20=20toaster: display message if no images are generated

Ionut Chisanovici (1):
=20=20toaster: Add performance testing script

Richard Purdie (1):
=20=20build.py: Ensure shared work siginfo files are written to the correct =
locati

Robert P. J. Day (1):
=20=20bitbake-user-manual-fetching.xml: Grammar, typo, and tweaks.

Scott Rifenbark (5):
=20=20bitbake-user-manual-fetching.xml: Added new Git Submodule Fetcher =
section.
=20=20bitbake-user-manual-fetching.xml: Edits to the Git Submodule fetcher =
section
=20=20bitbake-user-manual-customization.xsl: Removed stale TOC variable.
=20=20bitbake-user-manual: Added permalink support.
=20=20bitbake-user-manual-style.css: Removed dead .PNG file

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Andre McCurdy (1):
=20=20directfb: fix-compilation-with-zlib.patch merged upstream

Armin Kuster (2):
=20=20tzdata: update to version 2014e
=20=20tzcode: update to verison 2014e

Bruce Ashfield (6):
=20=20linux-yocto/3.10: update to v3.10.41
=20=20linux-yocto/3.14: update to v3.14.5
=20=20linux-yocto/3.4: update to v3.4.91
=20=20linux-yocto/3.14: enable mpc8315e NAND and Yaffs2 gcc 4.9 fix
=20=20linux-yocto/3.10: update to v3.10.43
=20=20lttng-modules: update to 2.4.1-stable latest

Chong Lu (1):
=20=20kexec-tools: fix warning about patch could not be found

Cristian Iorga (2):
=20=20connman: upgrade to 1.24
=20=20wpa-supplicant: upgrade to 2.2

Guillem Jover (2):
=20=20dpkg: Security Advisory - CVE-2014-0471
=20=20dpkg: Security Advisory - CVE-2014-3127

Henning Heinold (1):
=20=20perf: add slang to the dependencies

Hongxu Jia (6):
=20=20archiver: create dir 'B' explicitly while WORKDIR changed
=20=20libnewt/libnewt-python: upgrade to 0.52.17
=20=20directfb: upgrade to 1.7.4
=20=20qmmp: upgrade to 0.7.7
=20=20ghostscript: upgrade to 9.14
=20=20ghostscript: fix sizeof(GX_COLOR_INDEX_TYPE) not equal to =
ARCH_SIZEOF_GX_COL

Koen Kooi (2):
=20=20hwlatdetect 0.85: fix variable ordering
=20=20hwlatdetect: fix PV

Paul Barker (1):
=20=20package_ipk.bbclass: Support hierarchical feed

Paul Gortmaker (1):
=20=20gawk: ensure cross compiling doesn't try to remove host files

Richard Purdie (6):
=20=20binconfig-disabled: Add class and use
=20=20kernel-module-split: Add support for KERNEL_MODULE_AUTOLOAD and =
KERNEL_MODUL
=20=20gcc-configure-common: Address problems with gengtype
=20=20kernel-module-split: Fix KERNEL_MODULE_AUTOLOAD handling
=20=20sstate: Fix shared work preconfigure task handling
=20=20sstatesig: Add try/except around the stat calls

Robert Yang (5):
=20=20systemd: check IFLA_VLAN_PROTOCOL
=20=20image-vmdk.bbclass: set timeout to 1 second
=20=20dbus-native: dbus-native: do_compile failed on selinux.c on CentOS =
5.10
=20=20cups: enable cups-str4402.patch
=20=20dbus: don't override EXTRA_OECONF

Ross Burton (1):
=20=20wget: use GnuTLS instead of OpenSSL

Roy Li (2):
=20=20relocate_sdk: Skip to do relocation if the file size is less than 64 =
byte
=20=20Revert "populate_sdk: verify executable or dynamically linked library"

Saul Wold (1):
=20=20local.conf.sample: Add sdl to nativesdk qemu PACKAGECONFIG

Yue Tao (2):
=20=20libpam: Security Advisory - CVE-2014-2583
=20=20libtiff: Security Advisory - CVE-2012-4564

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Alex Lennon (1):
=20=20gnome-menus3: Add support for 3.x.x

Anders Darander (2):
=20=20webmin: allow override of webmin login and password
=20=20webmin: split out webmin themes

Armin Kuster (1):
=20=20libnet: fix build issue with package upgrade

Ash Charles (1):
=20=20eject: copy po subdirectory for out-of-tree build

Balasubramanian, Aparna (1):
=20=20rng-tools: Update rng-tools version to 4

Chong.Lu@windriver.com (5):
=20=20samba: Security Advisory - CVE-2013-4496
=20=20samba: fix parsing linemarkers in preprocessor output
=20=20samba: fix two CVEs CVE-2013-0213 CVE-2013-0214
=20=20samba: Security Advisory - CVE-2013-4124
=20=20samba: Security Advisory - CVE-2013-4475

Denys Dmytriyenko (1):
=20=20fbset: the package doesn't use autotools at all

Fathi Boudra (1):
=20=20pm-qa: update to 0.4.11 release

Jack Mitchell (1):
=20=20sthttpd: improve init scripts to use config file

Joe MacDonald (1):
=20=20claanup: remove garbage file

Koen Kooi (3):
=20=20acpica: pass target cflags
=20=20swig: use pkg-config for pcre detection.
=20=20apache2(-native): use pkg-config for pcre detection

Marko Lindqvist (2):
=20=20libsdl-image: Fix build with separate builddir
=20=20libsdl-ttf: Fix build with separate builddir

Martin Jansa (38):
=20=20tracker: move from meta-oe to meta-gnome
=20=20libsocketcan: Fix build with B!=3DS
=20=20libgsf, gnumeric, wv, abiword, goffice: Blacklist because of broken =
libgsf a
=20=20gnome-power-manager: Fix build with B!=3DS
=20=20apcupsd: Blacklist because of broken with B!=3DS
=20=20xf86-input-mtev: Blacklist because of broken with B!=3DS
=20=20zsh: Blacklist because of broken with B!=3DS
=20=20zenity: Blacklist because of broken with B!=3DS
=20=20krb5: Blacklist because of broken with B!=3DS
=20=20nautilus: Blacklist because of broken with B!=3DS
=20=20openmotif: Blacklist because of broken with B!=3DS
=20=20coriander: Blacklist because libsdl2-config was removed
=20=20curlpp: Blacklist because it's broken since gcc upgrade to 4.9
=20=20xchat: Blacklist because of broken with B!=3DS
=20=20qconnman, qconnman-e: Blacklist because of broken with B!=3DS
=20=20libwmf: Blacklist because freetype-config was removed
=20=20libftdi, soft66: Blacklist, because of libftdi is broken without =
libusb-conf
=20=20libusbg: Blacklist, because of B!=3DS
=20=20libgnomekbd, gnome-control-center, gnome-settings-daemon: Blacklist =
because=20
=20=20libgnomekbd: delete older 2.26.0 version
=20=20tumbler, ristretto: Blacklist because freetype2-config used by =
tumbler was r
=20=20vala-terminal: Blacklist because of broken with B!=3DS
=20=20omgps: Blacklist because it's broken since gcc upgrade to 4.9
=20=20sylpheed: Blacklist because of broken with B!=3DS
=20=20fim: Blacklist because of broken with B!=3DS
=20=20renderer-service-upnp: Blacklist because of broken with B!=3DS
=20=20imlib2, mcnavi: Blacklist because of broken imlib2 after =
freetype2-config wa
=20=20tesseract-lang: Drop runtime dependency on TUNE_PKGARCH tesseract
=20=20maliit-framework, maliit-plugins: Blacklist because of broken build =
with B!=3D
=20=20networkmanager, network-manager-applet, xfce4-power-manager, =
packagegroup-xf
=20=20terminology: upgrade to 0.5.1
=20=20efl, elementary: upgrade to 1.10.0
=20=20efl: add PACKAGECONFIG for c++11 and disable it by default
=20=20python-efl: upgrade to 1.10.0
=20=20efl: use luajit by default
=20=20lua: Remove lua5.1
=20=20packagegroup-efl-sdk: Use luajit instead of lua5.1
=20=20python-cython: upgrade to 2.20.2 and fix packaging QA issue

Matthieu CRAPET (1):
=20=20id3lib: fix autoheader warning due to missing AC_DEFINE template

Nick Lewis (1):
=20=20libxml++: fix ptest target paths

Paul Eggleton (4):
=20=20lcdproc: fix do_install for S!=3DB
=20=20pv: upgrade to 1.5.3
=20=20pv: fix metadata fields
=20=20aufs-util: add new recipe

Richard Purdie (12):
=20=20recipes: add missing dependency on intltool-native
=20=20recipes: add missing pkgconfig class inherits
=20=20recipes: add missing gtk-doc class dependencies
=20=20libmtp: add missing dependency on virtual/libiconv
=20=20enca: add missing dependency on virtual/libiconv
=20=20polkit-gnome: add missing dependency on gnome-common
=20=20glade3: add missing dependency on gnome-common and libxml2
=20=20gtkextra: add missing dependency on gobject-introspection-stub
=20=20mkvtoolnix: fix build with B!=3DS
=20=20xpext: fix build with B!=3DS
=20=20libetpan: fix build with B!=3DS
=20=20talloc: fix build with B!=3DS

Robert Yang (13):
=20=20openflow: inherit autotools-brokensep
=20=20znc: inherit autotools-brokensep
=20=20proftpd: inherit autotools-brokensep
=20=20cyrus-sasl: inherit autotools-brokensep
=20=20rp-pppoe: inherit autotools-brokensep
=20=20autofs: inherit autotools-brokensep
=20=20netcf: inherit autotools-brokensep
=20=20conntrack-tools: inherit autotools-brokensep
=20=20tftp-hpa: inherit autotools-brokensep
=20=20vblade: inherit autotools-brokensep
=20=20tcpreplay: inherit autotools-brokensep
=20=20curlpp: inherit autotools-brokensep
=20=20iftop: inherit autotools-brokensep

Roy Li (3):
=20=20dovecot: add the dependency for a C file
=20=20rsyslog: use pkgconfig to check libgcrypt
=20=20dialog: inherit brokensep and use pkg-config to detect ncurses

Steffen Sledz (1):
=20=20live555: fix fetch problem

Tom Rini (1):
=20=20unionfs-fuse: A FUSE based implementation of UnionFS

Yao Xinpan (1):
=20=20add recipe cim-schema, cim-schema-docs and license file DMTF.

Yue Tao (1):
=20=20quagga: Security Advisory - CVE-2012-1820

Zhang Xiao (1):
=20=20tftp-hpa: bug fix on separated CR and LF

dv@pseudoterminal.org (1):
=20=20e-wm: Add patch to fix crash caused by type error

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Franklin S. Cooper Jr (2):
=20=20dual-camera-demo: Grab latest commit and update Matrix files =
installation
=20=20ptpd: Add latest version of ptpd 2.3.0

Maupin, Chase (7):
=20=20yavta: append yavta recipe to update to latest
=20=20packagegroup-arago-test: Add yavta to tests package
=20=20branding-amsdk: set u-boot preferred provider
=20=20branding-glsdk: set u-boot preferred provider
=20=20arago-prefs: set default u-boot for keystone to u-boot-ti-staging
=20=20arago-prefs: Use mainline u-boot by default
=20=20u-boot: set mainline u-boot to AUTOREV

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

Thomas Elste (1):
=20=20libdrm: Add ite instruction to mx6 ARM patch

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

Andrea Adami (3):
=20=20linux-yocto_3.14: zaurus: remove unused filesystems to reduce kernel =
size
=20=20zaurus collie: remove hardcoded mem=3D64M
=20=20linux-yocto: refresh collie-LH28F640BF patch

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-igep:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

Erik Bot=C3=B6 (1):
=20=20common-api-c++-*: Don't build with -fvisibility-inlines-hidden

Holger Behrens (6):
=20=20connman: rename bbappend file to match current version
=20=20dbus: rename bbappend file to match current version
=20=20qt4-embedded: rename bbappend file to match current version
=20=20weston: make version 1.4.0 available to meta-ivi
=20=20ivi-image: prefer weston version 1.4.%
=20=20README.md: update poky revision

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-java:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-kde:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-micro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-mono:

Alex J Lennon (2):
=20=20mono-xsp: Inherit autotools-brokensep to fix build
=20=20monotools-server: Inherit autotools-brokensep to fix build

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

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

Denys Dmytriyenko (1):
=20=20am180x-evm: don't request ubi FS w/o setting MKUBIFS and UBINIZE vars

Hao Zhang (1):
=20=20keystone: config: fix K2L boot monitor build target name error

Maupin, Chase (2):
=20=20u-boot: Add mainline u-boot version 2014.07-rc3
=20=20u-boot: remove old mainline versions

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

Martin Jansa (1):
=20=20webos.inc: Show branch, revision and description of TOPDIR

Sangwoo Kang (1):
=20=20webos-image: nyx-utils=3D16,v1.1.1

Susan Montooth (1):
=20=20webos.inc: Add build timestamp to build-id.txt

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

Nathan Rossi (1):
=20=20external-xilinx-toolchain: Enforce default hash style

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Bruce Ashfield (1):
=20=20meta-yocto-bsps: update 3.14 SRCREVs

Corneliu Stoicescu (3):
=20=20beaglebonetarget.py: Add support for get_extra_files() classmethod
=20=20controllers/beaglebonetarget.py: enable dynamical determination of =
rootfs ty
=20=20controllers/edgeroutertarget.py: enable dynamical determination of =
rootfs ty

Hongxu Jia (1):
=20=20maintainers: Update directfb/ghostscript/libnewt/qmmp ownership

Kevin Hao (3):
=20=20mpc8315e-rdb: bump to linux-yocto 3.14
=20=20mpc8315e-rdb: add the jffs2 image support
=20=20mpc8315e-rdb: add the example about booting from jffs2 root

Paul Barker (1):
=20=20package_ipk.bbclass: Support hierarchical feed

Richard Purdie (1):
=20=20poky.conf: Add gitsm PREMIRRORS

Saul Wold (1):
=20=20local.conf.sample: Add sdl to nativesdk qemu PACKAGECONFIG

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



