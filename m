Received: from co9ehsobe001.messaging.microsoft.com ([207.46.163.24]
	helo=co9outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>)
	id 1TaZ9r-000836-Ls; Mon, 19 Nov 2012 22:45:36 +0100
Received: from mail155-co9-R.bigfish.com (10.236.132.254) by
	CO9EHSOBE038.bigfish.com (10.236.130.101) with Microsoft SMTP Server id
	14.1.225.23; Mon, 19 Nov 2012 20:31:03 +0000
Received: from mail155-co9 (localhost [127.0.0.1])	by
	mail155-co9-R.bigfish.com (Postfix) with ESMTP id 3C47F800F3;
	Mon, 19 Nov 2012 20:31:03 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 14
X-BigFish: VS14(z21eI5136wz98dI9371Ic89bh936eI154dI1432Izz1de0h1202h1d1ah1d2ahzz177df4h17326ah8275bh8275dhz2dh2a8h668h839h8e2h8e3hd25hf0ah10d2h1288h12a5h12a9h12bdh137ah13b6h1441h1537h153bh162dh1631hbe9i15d0l1155h)
Received: from mail155-co9 (localhost.localdomain [127.0.0.1]) by mail155-co9
	(MessageSwitch) id 1353357059978843_32242;
	Mon, 19 Nov 2012 20:30:59 +0000 (UTC)
Received: from CO9EHSMHS004.bigfish.com (unknown [10.236.132.237])	by
	mail155-co9.bigfish.com (Postfix) with ESMTP id EC36E200057;
	Mon, 19 Nov 2012 20:30:59 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO9EHSMHS004.bigfish.com
	(10.236.130.14) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Mon, 19 Nov 2012 20:30:50 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.103]) by
	039-SN1MMR1-005.039d.mgd.msft.net ([::1]) with mapi id 14.02.0318.003;
	Mon, 19 Nov 2012 20:30:49 +0000
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: "cliff.brake@gmail.com" <cliff.brake@gmail.com>
Thread-Topic: [OE-core] OE Changelog since 2012-11-11 until 2012-11-18
Thread-Index: AQHNxpTCSqJF7sLheEyJw/C50ELk9g==
Date: Mon, 19 Nov 2012 20:30:48 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A7954C0@039-SN1MPN1-001.039d.mgd.msft.net>
References: <1353350948045.ae4f520b@Nodemailer>
In-Reply-To: <1353350948045.ae4f520b@Nodemailer>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	"angstrom-distro-devel@linuxtogo.org"
	<angstrom-distro-devel@linuxtogo.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: OE Changelog since 2012-11-11 until 2012-11-18
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 19 Nov 2012 21:45:36 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <E11F343912B181479631446DEABEE744@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 19, 2012 at 12:49 PM,  <cliff.brake@gmail.com> wrote:
> Changelog since 2012-11-11 until 2012-11-18.  Projects included in this r=
eport:
>
> bitbake: git://git.openembedded.org/bitbake
> openembedded-core: git://git.openembedded.org/openembedded-core
> meta-openembedded: git://git.openembedded.org/meta-openembedded
> meta-angstrom: git://github.com/Angstrom-distribution/meta-angstrom.git
> meta-arago: git://arago-project.org/git/meta-arago.git
> meta-beagleboard: git://github.com/beagleboard/meta-beagleboard.git
> meta-browser: git://github.com/OSSystems/meta-browser.git
> meta-bug: git://github.com/buglabs/meta-bug.git
> meta-chicken: git://github.com/OSSystems/meta-chicken
> meta-efikamx: git://github.com/kraj/meta-efikamx.git
> meta-ettus: http://github.com/koenkooi/meta-ettus.git
> meta-fsl-arm: git://git.yoctoproject.org/meta-fsl-arm
> meta-fsl-ppc: git://github.com/Freescale/meta-fsl-arm-extra.git[submodule=
 "meta-fsl-ppc"]

This looks funny.

-M

> meta-guacamayo: git://github.com/Guacamayo/meta-guacamayo.git
> meta-gumstix: git://github.com/gumstix/meta-gumstix.git
> meta-gumstix-community: git://gitorious.org/schnitzeltony-oe-meta/meta-gu=
mstix-community.git
> meta-handheld: git://git.openembedded.org/meta-handheld
> meta-igep: http://github.com/ebutera/meta-igep.git
> meta-intel: git://git.yoctoproject.org/meta-intel
> meta-ivi: git://git.yoctoproject.org/meta-ivi
> meta-java: git://github.com/woglinde/meta-java
> meta-kde: git://gitorious.org/openembedded-core-layers/meta-kde.git
> meta-micro: git://git.openembedded.org/meta-micro
> meta-mono: git://git.yoctoproject.org/meta-mono.git
> meta-netbookpro: git://github.com/tworaz/meta-netbookpro
> meta-nslu2: git://github.com/kraj/meta-nslu2
> meta-opie: git://git.openembedded.org/meta-opie
> meta-qt3: git://git.yoctoproject.org/meta-qt3
> meta-slugos: git://github.com/kraj/meta-slugos
> meta-systemd: git://git.yoctoproject.org/meta-systemd
> meta-raspberrypi: git://github.com/djwillis/meta-raspberrypi.git
> meta-smartphone: http://git.shr-project.org/repo/meta-smartphone.git
> meta-ti: git://git.yoctoproject.org/meta-ti
> meta-webos: git://github.com/openwebos/meta-webos.git
> meta-xilinx: git://git.yoctoproject.org/meta-xilinx
> meta-yocto: git://git.yoctoproject.org/meta-yocto
> openembedded: git://git.openembedded.org/openembedded
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for bitbake:
>
> Christopher Larson (1):
>   knotty: kill duplicated import of 'time'
>
> Cristiana Voicu (1):
>   hob: hob was freezing because it doesn't receives well the log file
>
> Robert Yang (1):
>   print clear message for "bitbake -e ASSUME_PROVIDED"
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for openembedded-core:
>
> Christopher Larson (1):
>   bash: fix mkbuiltins build failure
>
> Constantin Musca (3):
>   puzzles: upgrade to r9660
>   libxslt: upgrade to 1.1.27
>   insane.bbclass: add qa package name check
>
> Denis 'GNUtoo' Carikli (1):
>   boost: Activate zlib and bzip2 because they now work.
>
> Enrico Scholz (2):
>   binutils: fixed --enable-targets option
>   opkg: added alternatives-ln patch
>
> Gilbert Coville (1):
>   pulseaudio: explicitly disable xen, rather than letting it detect
>
> Jessica Zhang (1):
>   Fix the first line typo of adt-installer
>
> Laurentiu Palcu (8):
>   populate_sdk_base.bbclass: use SDK_ARCH instead of SDKMACHINE
>   xf86-video-vesa: upgrade to 2.3.2
>   xf86-video-intel: upgrade to 2.20.12
>   xf86-input-mouse: upgrade to 1.8.1
>   xcb-proto: upgrade to 1.8
>   fontconfig: upgrade to 2.10.1
>   mdadm: upgrade to 3.2.6
>   xf86-input-synaptics: add mtdev dependency
>
> Mark Hatle (4):
>   rpm: Slightly change the way python-rpm is constructed
>   python-smartpm: Add smartpm recipe
>   rpm: Add additional RPMSENSE values to python module
>   python-smartpm: Add basic knowledge of RPMSENSE_MISSINGOK
>
> Martin Jansa (1):
>   qt4: remove -lGLU from QMAKE_LIBS_OPENGL in our linux.conf
>
> Phil Blundell (1):
>   insane: detect and warn about relocations in .text
>
> Richard Purdie (11):
>   libc-common: Ensure sysconfdir exists before installing files to it
>   python.inc: make lsb override more concise
>   sstate: Be consistent about sstate-inputdirs/outputdirs ending with '/'
>   classes: Be consistent about sstate-inputdirs/outputdirs ending with '/=
'
>   utils.bbclass: Fix documentation of create_cmdline_wrapper
>   sstate: Fix various path manipulation issues
>   sstate: Bump version number to deal with layout fixes
>   make-3.82: Add patch for archive expression expansion issues
>   python: Resolve intermediate staging issues
>   sstate: Drop now unneeded python whitelist entries
>   libcgroup/libxkbcommon: Use BPN in SRC_URI
>
> Ross Burton (11):
>   autotools: set _FOR_BUILD variables here
>   meta: remove redundant _FOR_BUILD variables
>   xorg-driver-common: remove AC_CHECK_FILE workaround
>   glib-2.0: remove zip build dependency
>   glib-2.0: upgrade to latest stable, 2.34.1.
>   mesa: remove python2 detection hack
>   libunique: fix compilation with GLib 2.34
>   initrdscripts: fix udevd in the live boot init scripts
>   mesa-demos: fix --with-glut check
>   default-providers: add default provider for make
>   cmake.bbclass: use DEPENDS_prepend instead of +=3D for cmake-native
>
> Saul Wold (6):
>   pulse: fix Bashism in string test
>   mx: Update to 1.4.7
>   kconfig-frontends: Update to 3.6
>   psmisc: Update to 22.20
>   packagegroup-self-hosted: add sftp server
>   less: Update to 451
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-openembedded:
>
> Andrea Adami (2):
>   klibc: refactor runtime deps for shared utils
>   klibc: upgrade from 2.0.1 to 2.0.2
>
> Andreas M=FCller (5):
>   lighttpd: move systemd appends since recipe is in oe-core
>   gvfs: fix build
>   gvfs-gdu-volume-monitor: fix build after oe-core's libexecdir transitio=
n
>   gnome-desktop: copy omf.make from ${STAGING_DATADIR_NATIVE} instead ${S=
TAGIN
>   thunar: add xfce4-panel to dependencies to ensure trash-plugin (tpa) is=
 buil
>
> Bruce Ashfield (1):
>   kernel.bbclass: remove explicit version.h target
>
> Eric BENARD (1):
>   mercurial-native: fix install
>
> Holger Hans Peter Freyther (1):
>   systemd: Make the main systemd files proper CONFFILES
>
> Jack Mitchell (2):
>   hiawatha: update to 8.6
>   hiawatha: disable caching by default
>
> Martin Jansa (1):
>   omgps: add patch to fix build with latest glib from oe-core
>
> Stefan Herbrechtsmeier (1):
>   python-numpy: Move static libraries to -staticdev
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-angstrom:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-arago:
>
> Denys Dmytriyenko (9):
>   external-arago-sdk-toolchain: package up gdb from the toolchain as well
>   task-arago-cross-canadian: add crosssdk gdb to the devkit
>   meta-toolchain-arago: special case for gdb to be built as part of canad=
ian-c
>   external-arago-sdk-toolchain: provide and package gdb conditionally
>   meta-toolchain-arago: improve shell stubs to atomatically source env-se=
tup s
>   arago.conf: abstract setting external Arago toolchain
>   toolchain-external-linaro: add seetings for selecting Linaro toolchain
>   arago-tisdk-image,task-arago-tisdk-addons: move arago-test out of addon=
s
>   arago-headless-tisdk-image: provide a headless version ot TISDK image
>
> Franklin S. Cooper Jr (12):
>   linux-am335x: Update psp 04.06.00.08 recipe
>   linux-am335x_3.2.0-psp05.06.00.00: Disable CONFIG_LOCALVERSION_AUTO opt=
ion
>   arago.conf: Setting PREFERRED_VERSIONS
>   gst-ffmpeg: Select a non GPLv3 license
>   qt4-tools-nativesdk: Select LGPLv2.1 license
>   u-boot: Add PSP version 05.06.00.00 of u-boot
>   u-boot_2012.10-psp05.06.00.00: Fix mmc boot environment settings
>   u-boot_2012.10-psp05.06.00.00: Add NAND environment variables
>   u-boot_2012.10-psp05.06.00.00: Add SPI environment variables
>   u-boot_2012.10-psp05.06.00.00: Add NET environment variables
>   arago.conf: Switch to latest PSP u-boot release
>   meta-toolchain-arago-qte: Fix mkspecs location
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-beagleboard:
>
> Koen Kooi (1):
>   common-bsp: linux-mainline: add recipe for 3.7.0-rc5
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-browser:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-bug:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-chicken:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-efikamx:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-ettus:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-fsl-arm:
>
> Otavio Salvador (1):
>   README: Update to point to the newer mailing list
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-fsl-ppc:
>
> Matthew McClintock (1):
>   u-boot_git.bb: use upstream u-boot for e6500 parts for now
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-guacamayo:
>
> Ross Burton (1):
>   Move the Poky tag to the 1.3 release
>
> Tomas Frydrych (2):
>   Updated Rygel to 0.16.2
>   Move preferred versions out of our layer.conf into the distro conf
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-gumstix:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-gumstix-community:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-handheld:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-igep:
>
> Javier Martinez Canillas (1):
>   igep00x0: add u-boot config option to built with NAND support
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-intel:
>
> Tom Zanussi (1):
>   meta-intel: remove explicit kernel SRCREVs
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-ivi:
>
> Andrei Gherzan (1):
>   linux-yocto: Fix af bus patch to be usable with poky master version
>
> Florin Sarbu (4):
>   eglibc_2.16_bbappend: Use FILESEXTRAPATHS_prepend so that other bbappen=
ds fo
>   README.md: Add reference to meta-openembedded/meta-gnome to be     put =
into
>   keyutils: Added patch to fix CFLAGS when building for     x86 targets.
>   Add opengl to DISTRO_FEATURES through poky-ivi-systemd.conf,     remove=
d ope
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-java:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-kde:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-micro:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-mono:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-netbookpro:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-nslu2:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-opie:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-qt3:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-slugos:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-systemd:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-raspberrypi:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-smartphone:
>
> Lukas M=E4rdian (1):
>   meta-openmoko: gta04: add kernel patch to enable hwrouting
>
> Martin Jansa (11):
>   meta-openmoko: u-boot: bump SRCREV for new multiboot support
>   busybox: enable stat applet
>   shr: drop entries for meta-oe blacklist
>   meta-openmoko: update S after SRCREV bump
>   meta-shr: use new name udev-extraconf instead of udev-extra-rules
>   shr-splash-theme: move allarch inherit to recipes which need it
>   shr-splash-theme: use new update-alternatives syntax
>   shr-wizard: bump PR to rebuild against new E17 alpha3
>   chroot-image: remove BUILDNAME from sstate checksum
>   shr-e-gadgets: bump PR to rebuild against new E17 alpha3
>   chroot-image: exclude DATETIME from IMAGE_NAME vardeps
>
> Simon Busch (7):
>   meta-samsung: linux-samsung-tuna: bump SRCREV and disable wakelock/earl=
ysusp
>   meta-samsung: libgles-android: rework installation process to copy rele=
vant
>   meta-samsung: chroot-script: setup devtmpfs for mounted rootfs as well
>   meta-samsung: linux-samsung-tuna: bump SRCREV and disable CONFIG_DHD_EN=
ABLE_
>   meta-samsung: chroot-script: execute installation script when available
>   meta-samsung: linux-samsung-tuna: bump SRCREV
>   meta-samsung: base-files: don't mount /var/volatile as tmpfs anymore
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-ti:
>
> Chase Maupin (1):
>   conf/machine: Update the FSTYPES for AMSDK machines
>
> Franklin S. Cooper Jr (2):
>   libgles-omap3: Adjust for non X11 distros
>   libgles-omap3: Verify pvrsrvkm module was found
>
> Paul Woegerer (1):
>   linux-omap4-3.1.0: Add sched_process_exec tracing
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-webos:
>
> Keith Derrick (1):
>   webos-image: luna-service2=3D144
>
> Steve Lemke (1):
>   webos-image submission: qt=3D1.02
>
> Teppo Pennanen (1):
>   keyboard-efigs: Add recipe
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-xilinx:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-yocto:
>
> Bogdan Marinescu (1):
>   upstream_tracking.inc: update for 1.4 planning
>
> Cristian Iorga (1):
>   upstream_tracking.inc: update according to YP 1.4
>
> Radu Moisan (2):
>   upstream_tracking: update for 1.4 planning
>   upstream_tracking.inc: Update hdparm
>
> Richard Purdie (1):
>   poky.conf: Enable warning on textrel QA check
>
> Saul Wold (2):
>   maintainers: Update file with missing maintainers
>   upstream_tracking: Update for 1.4 Planning
>
> Stefan Stanacar (1):
>   yocto-bsp: update qemu machine.conf template
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for openembedded:
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=



