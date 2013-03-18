Received: from new.bec-systems.com ([74.208.70.121] helo=bec-systems.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1UHeqJ-00053O-9u; Mon, 18 Mar 2013 19:31:31 +0100
Received: from oh-69-34-21-229.sta.embarqhsd.net ([69.34.21.229]
	helo=happy.bec-systems.com)
	by bec-systems.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cliff.brake@gmail.com>)
	id 1UHeZO-0004qB-8u; Mon, 18 Mar 2013 14:14:04 -0400
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Date: Mon, 18 Mar 2013 18:14:33 GMT
Message-Id: <1363630473273.b3594224@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
X-Spam_score: -1.0
X-Spam_score_int: -9
X-Spam_bar: -
Subject: OE Changelog since 2013-03-10 until 2013-03-17
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
X-List-Received-Date: Mon, 18 Mar 2013 18:31:32 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2013-03-10 until 2013-03-17.  Projects included in this =
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

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Alexandru DAMIAN (1):
=20=20dpkg depends on ncurses

Andreas Oberritter (3):
=20=20wpa-supplicant: change S to point to the top-level directory
=20=20wpa-supplicant: reorder do_configure
=20=20wpa-supplicant: avoid host contamination by libnl3

Andrei Dinu (1):
=20=20psplash : update to latest SRCREV =
afd4e228c606a9998feae44a3fed4474803240b7

Bruce Ashfield (3):
=20=20linux-yocto/3.4: update to v3.4.34 and LTSI refresh
=20=20linux-yocto/3.8: bump kver to v3.8.1
=20=20linux-yocto/3.8: update EDF configuration

Constantin Musca (1):
=20=20libxi: upgrade to 1.7

Cristian Iorga (4):
=20=20libical: add recipe back in oe-core
=20=20build-appliance-image: upgrade to newer poky revision.
=20=20build-appliance-image: ethernet connection type is now bridged
=20=20build-appliance-image: fix lost net connectivity after restart

Hongxu Jia (1):
=20=20qemu-native:fix do_compile failed on SLED 11.2

Jackie Huang (4):
=20=20libatomics-ops: fix PN -> BPN in do_install for multilibs
=20=20python-imaging: fix PN -> BPN in do_install for multilibs
=20=20ttf-fonts: fix PN -> BPN in do_install for multilibs
=20=20gnupg: fix PN -> BPN in do_install for multilibs

Jeremy Stashluk (1):
=20=20gst-plugins-gl: allow empty packages

Kang Kai (1):
=20=20external-python-tarball: rename output package

Khem Raj (4):
=20=20gcc-4.7: Fix incorrect warning with -Wcast-qual
=20=20libtirpc: Fix build on uclibc
=20=20watchdog: Upgrade 5.12 -> 5.13
=20=20bitbake.conf: Add LICENSE_PATH to sstate whitelist

Laurentiu Palcu (6):
=20=20inputproto: upgrade to 2.3
=20=20xserver-xorg: upgrade to 1.14.0
=20=20xf86-video-intel: upgrade to 2.21.3
=20=20xf86-video-*: delete references to mibstore.h
=20=20gcc-cross-canadian: do not create symlinks to non-existent binaries
=20=20populate_sdk_base: search for perl scripts after symlinks are =
relocated

Martin Jansa (3):
=20=20gst-plugins-package: return few ALLOW_EMPTY settings
=20=20package.bbclass: add debug-without-src PACKAGE_DEBUG_SPLIT_STYLE
=20=20icecc: improve interaction with sstate

Olivier Guiter (1):
=20=20neard: Update reference commit sha1 and install script

Paul Eggleton (1):
=20=20lib/oe/lsb: enable getting distro ID when lsb_release is not installed

Richard Purdie (2):
=20=20package_rpm: Ensure package dependencies have correct version numbers
=20=20package_rpm: Ensure PV manipulations are correct

Robert Yang (1):
=20=20rootfs_xxx.bbclass: fix bitbake -S hashes mismatch error

Ross Burton (12):
=20=20musicbrainz: remove
=20=20connman: explicitly disable systemd if we don't want it enabled
=20=20polkit: explicitly disable systemd if we're using consolekit
=20=20xf86-video-intel: add explicit dependency on udev
=20=20avahi: explicitly disable systemd if we don't want it enabled
=20=20xkeyboard-config: remove long-gone build dependencies
=20=20systemd-compat-units: add missing systemd-systemctl-native dependency
=20=20busybox: enable swapon -p (91 byte increase)
=20=20systemd: busybox's swapon now supports -p
=20=20systemd: remove util-linux-mount dependency
=20=20systemd: set the location of the kill binary
=20=20systemd: remove libsystemd-daemon linkage in libudev

Saul Wold (1):
=20=20util-linux: Update License Information (remove GPLv3 Licnese)

Zhenhua Luo (3):
=20=20binutils: fix ineffectual zero of cache and array bounds issue
=20=20elfutils: Fix size passed to snprintf for invalid sh_name case
=20=20elfutils: fix the num passed to memset in ar.c

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Andreas M=C3=BCller (5):
=20=20midori: update to 0.4.8
=20=20geany: fix build on perl-less machines
=20=20xfce4-eyes-plugin: update to 4.4.2
=20=20xfce4-vala: initial add 4.10.2
=20=20gedit: fix compile

Andreas Oberritter (4):
=20=20swig: avoid host contamination, make build deterministic
=20=20samba: fix install for older samba versions
=20=20layer.conf: add distro-feed-configs to SIGGEN_EXCLUDERECIPES_ABISAFE
=20=20libav: library packages shouldn't rdepend on libav package

Eric BENARD (1):
=20=20net-snmp: EXTENDPV is now EXTENDPKGV

Felipe F. Tonello (2):
=20=20qextserialport: Added 1.2rc recipe
=20=20gsoap: added gsoap 2.8.12 recipe

Khem Raj (4):
=20=20tcsh: Upgrade tcsh_6.17.02.bb -> tcsh_6.18.01.bb
=20=20bridge-utils: Upgrade to 1.5
=20=20tcsh: Depend on ncurses.
=20=20lmsensors: Upgrade 3.3.2 -> lmsensors_3.3.3

Marcin Juszkiewicz (1):
=20=20onig: do not use system headers

Mario Domenech Goulart (1):
=20=20libdvdread: update to version 4.2.0

Martin Jansa (3):
=20=20connman: rename .bbappend to match new version from oe-core
=20=20krb5: Fix .debug packaging warning after debug striping was fixed
=20=20poppler: upgrade to 0.18.4

Otavio Salvador (1):
=20=20polkit: Remove authentication override as it is handled in OE-Core

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Koen Kooi (1):
=20=20layer.conf: add SIGGEN_EXCLUDERECIPES_ABISAFE

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Denys Dmytriyenko (1):
=20=20kernel.bbclass: overlay locally from oe-core/danny for a temp fix

Mark Hatle (1):
=20=20kernel.bbclass: Add missing modules.order and modules.builtins

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-beagleboard:

Koen Kooi (6):
=20=20linux-mainline 3.8: sync with upstream kernel repo
=20=20linux-mainline 3.8: add patch to switch UART to GPIO and back on BBB =
tester
=20=20linux.inc: fix installation of devicetree files
=20=20linux-mainline 3.8: update BBB tester DT with drvvbus helper
=20=20linux-mainline 3.8: update to 3.8.3
=20=20u-boot-denx: match bonelt -> boneblack DT rename

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-browser:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-bug:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-chicken:

Mario Domenech Goulart (9):
=20=20gen-egg-recipes: adapt licenses to match what OpenEmbedded expects
=20=20chicken-egg-iconv: fix license (s/Public Domain/PD/)
=20=20chicken-egg-input-parse: fix license (s/Public Domain/PD/)
=20=20chicken-egg-matchable: fix license (s/Public Domain/PD/)
=20=20chicken-egg-simple-sha1: fix license (s/Public Domain/PD/)
=20=20chicken-egg-ssax: fix license (s/Public Domain/PD/)
=20=20chicken-egg-crypt: fix license (s/Public Domain/PD/)
=20=20chicken-egg-make: fix license (s/LGPL-1/LGPL/)
=20=20chicken: update to version 4.8.0.3

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-efikamx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ettus:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm:

Fabio Estevam (2):
=20=20imx31pdk, imx35pdk: Remove 'kernel26' feature
=20=20imx31pdk, imx35pdk: Use XSERVER from imx-base.inc

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

SARTRE Leo (3):
=20=20u-boot-imx: Add Congatec qmx6 support
=20=20linux-imx-3.0.35: Add Congatec qmx6 support
=20=20cgtqmx6: Add machine definition

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-ppc:

Ting Liu (5):
=20=20udev-extraconf: move rules from udev and netbase
=20=20udev-extraconf: added to the list of MACHINE_EXTRA_RRECOMMENDS
=20=20udev-extraconf: add rule to rename network interfaces for t4/b4
=20=20busybox: remove SDK specific bits
=20=20oprofile: remove useless patches

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-guacamayo:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix-community:

Andreas M=C3=BCller (1):
=20=20linux-mainline-3.8: update to 3.8.3

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-handheld:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-igep:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

Florin Sarbu (6):
=20=20packagegroup-core-p1.bb: Add node-startup-controller, obex-client     =
and ob
=20=20Removed packagegroups for unneeded discovery     and excalibur from =
the mast
=20=20Added foton image recipe file and removed     unneeded discovery and =
excalib
=20=20README.md: Replace excalibur occurences with foton.
=20=20poky-ivi-systemd.conf: Updated DISTRO_VERSION to     4.0 snapshot.
=20=20Remove obsolete custom fstab file.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-java:

Henning Heinold (3):
=20=20README: update about the new versions
=20=20openjdk: add debug folders for cacao and jamvm libjvm.so
=20=20openjdk7: add debug folders for cacao and jamvm libjvm.so

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

Andrei Gherzan (8):
=20=20rpi-default-providers: Remove virtual/libgl provider
=20=20rpi-default-providers: Use userland as provider for egl and gles2
=20=20custom-licenses: Add directory to hold custom licenses
=20=20layer.conf: Set LICENSE_PATH to layers's custom licenses directory
=20=20recipes.txt: Remove file
=20=20userland: Update to 8700279495e266378d36092ccf86424f0ee2539f
=20=20vc-graphics.inc: There is no libgl so get rid of this PROVIDES
=20=20rpi-first-run-wizard: Fix RDEPENDS warning

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

Chase Maupin (5):
=20=20setup-defconfig: move from meta-arago to meta-ti
=20=20linux-ti-staging: use setup-defconfig
=20=20linux-ti-staging: mark dependencies am335x specific
=20=20linux-ti-staging: package all dtb files for ti33x
=20=20linux-ti-staging: fix DTB deploy steps

Denys Dmytriyenko (5):
=20=20hawkboard: remove machine definition, since it's unsupported
=20=20omap3-touchbook: remove machine definition, since it's unsupported
=20=20ti81x: remove platform configs, kernel, u-boot, since ti81x is not =
supported
=20=20linux-ti-staging: update SRCREV and bump MACHINE_KERNEL_PR
=20=20machines: unify all machines to produce tar.gz instead of tar.bz2 by =
default

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

Ed Chejlava (1):
=20=20remove conflicting openssl.cnf file

Eric Blade (2):
=20=20Add fixes for webos_qmake5
=20=20webos_qmake5: export STAGING_INCDIR

Gayathri Srinivasan (1):
=20=20packagegroup-webos-extended: Use VIRTUAL-RUNTIME for rdx components

Janne Hurskainen (1):
=20=20lsb: Add .bbappend to generate desired lsb-release file

Keith Derrick (1):
=20=20webos-image: nyx-lib=3D64,v5.0.0 nyx-modules=3D81,v5.0.0

Martin Jansa (14):
=20=20pmnetconfigmanager-stub: Remove unused recipe
=20=20cmake-modules-webos: Rename to cmake-modules-webos-native
=20=20webos-image: smartkey-hun=3D1.01,v3.0.0
=20=20webos: Move requires and most definitions to .inc file
=20=20webos: Move DISTRO_FEATURES to separate .inc
=20=20webos: Move toolchain related settings to separate .inc
=20=20webos: Move SDK related settings to separate .inc file
=20=20webos: Move repositories URLs to separate .inc
=20=20webos-repositories: Define WEBOS_REPO_NAME
=20=20webos: Use stronger override for opkglibdir
=20=20webos-toolchain: Drop default settings set in defaultsetup.inc
=20=20webos: Disable QA warnings about unsafe cross-partition references
=20=20recipes: Remove protocol=3Dgit parameter
=20=20webos_enhanced_submissions: Replace indirect getVar calls

Mikko Levonmaa (1):
=20=20webos_qmake5: Add bbclass

Pekka Ropo (1):
=20=20nyx-modules: Add support for OSInfo device type module

Sapna Todwal (1):
=20=20webos-image: webos-connman-adapter=3D6

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:




