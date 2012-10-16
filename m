Received: from new.bec-systems.com ([74.208.70.121] helo=bec-systems.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1TO8pl-0006WE-7K; Tue, 16 Oct 2012 17:13:29 +0200
Received: from oh-69-34-21-229.sta.embarqhsd.net ([69.34.21.229]
	helo=happy.bec-systems.com)
	by bec-systems.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cliff.brake@gmail.com>)
	id 1TO8V3-00067v-N5; Tue, 16 Oct 2012 10:52:08 -0400
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Date: Tue, 16 Oct 2012 15:00:02 GMT
Message-Id: <1350399602155.59852322@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
X-Spam_score: -2.9
X-Spam_score_int: -28
X-Spam_bar: --
Subject: OE Changelog since 2012-10-07 until 2012-10-14
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
X-List-Received-Date: Tue, 16 Oct 2012 15:13:29 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2012-10-07 until 2012-10-14.  Projects included in this =
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

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for bitbake:

Andrei Dinu (1):
=20=20hob-toolchain: task-core-standalone-sdk-target renamed to =
packagegroup-core-

Constantin Musca (1):
=20=20hob/hobeventhandler: Describe the runCommand failure exception

Cristiana Voicu (1):
=20=20hob/imageconfigurationpage: a 'hob-image' appears listed in the base =
image c

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Bruce Ashfield (3):
=20=20linux-yocto/3.4: fix kconfig warnings and unnecessary options
=20=20linux-yocto/3.4: tiny: Add qemu KMACHINE to common-pc-tiny.scc
=20=20linux-yocto/3.4: perf: parallel build and tools fixes

Darren Hart (1):
=20=20linux-yocto-tiny: Add tiny recipe for the 3.4 linux-yocto kernel

Flanagan, Elizabeth (1):
=20=20bzip license: bzip2 not bzip.

Martin Jansa (1):
=20=20sstate-cache-management: hide error message when one of possible =
layer locat

Richard Purdie (6):
=20=20qemu: When applying qemu-mips workaround, check the file exists first
=20=20sstate: Also add datadir/sgl to sstate whitelist to avoid openjade =
warning
=20=20gcc-cross-canadian: Fix gettext dependency
=20=20pkgconfig: Drop the RREPLACES for pkgconfig-dev
=20=20gdbm: Resolve host contamination issue
=20=20gitignore: Add meta-hob, drop meta-demoapps

Saul Wold (2):
=20=20nfs-export-root: add explict no_subtree-check to suppress warning
=20=20eglibc: force make to use /bin/bash

Tom Zanussi (1):
=20=20perl: add archlib_exp variable used to generate ARCHLIB_EXP in =
config.h

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Andrea Galbusera (1):
=20=20libconfig: port from classic and update

Khem Raj (1):
=20=20systemd.bbclass: Dont check for multilib and change for nativesdk =
renaming

Koen Kooi (1):
=20=20Revert "systemd.bbclass: Dont check for multilib and change for =
nativesdk re

Marcin Juszkiewicz (15):
=20=20lzip: update to 1.13
=20=20orrery: added missing dependency on gtk+
=20=20lvm2: added missing dependency on udev
=20=20ttf-gentium: added license stuff
=20=20ttf-hunkyfonts: added license stuff
=20=20ttf-mplus: added license stuff
=20=20ttf-wqy-zenhei: added license stuff
=20=20ttf-ubuntu-font-family: added license stuff and updated to 0.80 =
version
=20=20libedit: update to latest version
=20=20ca-certificates: update to 20120623 version
=20=20modemmanager: do not include glib private headers
=20=20soft66: added missing AM_PROG_AR
=20=20swig: update gnu-config files
=20=20libdivecomputer: added missing AM_PROG_AR
=20=20net-snmp: add pciutils to dependencies

Martin Ertsaas (1):
=20=20libftid: Change to use GPLv2 intead of GPLv2-RLE.

Otavio Salvador (5):
=20=20owfs: Update to 2.8p20 version
=20=20yajl: Update to 2.0.4 version
=20=20libpostproc: Add git version
=20=20libav: Update git version to 2012-10-04 snapshot
=20=20libav: Change the PACKAGES_DYNAMIC expression to be more restrict

Paul Eggleton (9):
=20=20pinpoint: add new recipe
=20=20mysql: fix include path reported by mysql_config
=20=20cherokee: bump PR to enable mysql support
=20=20apache2: fix configuration
=20=20modphp: fix default php.ini & add PACKAGECONFIG
=20=20phpmyadmin: add new recipe
=20=20lcdproc: add recipe from OE-Classic and update/clean up
=20=20apache2: work around bug in apr-1-config/apu-1-config scripts
=20=20apache2: reorganise packaging definitions

jackie huang (1):
=20=20iw: update to 3.6

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-micro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-slugos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nslu2:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Darren Hart (1):
=20=20Fix use of PRINC in meta-intel BSPs

Nitin A Kamble (9):
=20=20crownbay.conf: add kernel parameters for EMGD video acceleration
=20=20crownbay: uprev v3.4 kernel commit ids
=20=20xf86-video-intel: Bring 2.20.0 version to match released graphics =
stack
=20=20meta-crownbay: specify the 8.0.4 version as preferred version of =
mesa-dri
=20=20emgd-driver_bin: Remove 1.10 in favor of 1.14
=20=20meta-fishriver: retire BSP
=20=20meta-intel: update maintainers of various BSPs
=20=20emgd-driver-bin: note all the EMGD licenses
=20=20emgd-driver-bin: add custom-licenses dir for emgd recipe Licenses

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

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-telephony:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

Franklin S. Cooper Jr (2):
=20=20u-boot_2011.09-psp04.06.00.08: Add PSP v04.06.00.08 of u-boot
=20=20recipes: Fix ti-eula-unpack issue. Tweak sgx modules and libgles =
recipes.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Khem Raj (1):
=20=20omap3-mkcard: Remove hardlink and add LIC_FILES_CHKSUM

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-browser:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-mono:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-raspberrypi:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-kde:

Samuel Stirtzel (1):
=20=20Update task->packagegroup

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Bruce Ashfield (2):
=20=20linux-yocto-bsps: update hardware reference BSPs to v3.4.11
=20=20linux-yocto-bsps/3.4: perf: parallel build and tools fixes

Darren Hart (1):
=20=20poky-tiny: Update the default kernel to linux-yocto-tiny_3.4

Saul Wold (1):
=20=20distro_alias: Update for Internal BOM tracking

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

Eric Blade (1):
=20=20Set default OS name/version number in luna-prefs [OWEBOS-2604]

Roger Stringer (1):
=20=20Update versions for luna-sysmgr, qt and luna-sysmgr-ipc-messages

Sapna Todwal (2):
=20=20webos-image submission: nyx-lib=3D60, nyx-modules=3D71
=20=20webos-image submission: nyx-modules=3D72

Simon Busch (1):
=20=20webkit-webos: correct naming of ISIS_PROJECT_DOWNLOAD variable

Teppo Pennanen (1):
=20=20qt4-webos: Add -no-rpath option to qemuarm build

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Denys Dmytriyenko (4):
=20=20arago.conf: workaround for kernel staging dir, until meta-oe fixes it
=20=20arago.conf: enable stack and buffer overflow protection by default
=20=20Revert "openssl: fix the missing find.pl breakage"
=20=20Revert "openjade-native: fix the Getopts in msggen.pl breakage"

Franklin S Cooper Jr (3):
=20=20task-arago-gst-sdk-target: Add task to install gstreamer related dev =
package
=20=20task-arago-tisdk-multimedia: Port multimedia task from arago to =
meta-arago
=20=20task-arago-tisdk-matrix: Add task to install Matrix related sources

Franklin S. Cooper Jr (6):
=20=20matrix-lighttpd: Fix PATH environment variable
=20=20task-arago-gst: Add gst-plugins-ugly
=20=20gst-plugins-bad: Remove gtk+ dependencys
=20=20gst-plugins-bad: Add patch to fix depth value in gstfbdevsink
=20=20gst-plugins-bad: Add faad as a dependency
=20=20pulseaudio: Remove console-kit from pulseaudio-module-server

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-systemd:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-guacamayo:

Ross Burton (24):
=20=20yocto: bump to poky 1.3 beta tag
=20=20Remove package.bbclass, the version in 1.3 isn't broken with meta-ti
=20=20Remove gsettings.bbclass, it's in 1.3
=20=20Fix whitespace in Python functions
=20=20Use gobject-introspection-stub instead of -native
=20=20Use protocol instead of proto in SRC_URI
=20=20tzdata: remove, integrated into 1.3
=20=20linux-yocto-2.6.37: remove, unused
=20=20netbase: update for version bump
=20=20pulseaudio: upgrade for version bump
=20=20glib-2.0: remove, 1.3 has this
=20=20fuse: upgrade to 2.9.1 from meta-oe
=20=20psplash: update to match 1.3
=20=20task-guacamayo: remove dbus-x11, this is fixed in 1.3
=20=20tracker: the empty writeback-modules doesn't get installed, so don't =
remove=20
=20=20gssdp: make GTK+ dependency dependent on X11 feature
=20=20pulseaudio: hack to remove spurious ConsoleKit dependency
=20=20Add layers/meta-yocto-bsp symlink
=20=20mesa: remove 7.11, move MACHINE_ARCH to bbappend
=20=20pulseaudio: remove consolekit module from -server, we don't need it
=20=20Update poky to 1.3_M4
=20=20Bump poky to 1.3_M5
=20=20guacamayo-image: drop apps-console-core, add splash
=20=20bblayers.conf.sample: update for oe-core 1.3

Tomas Frydrych (45):
=20=20libgles-omap3.bbappend: use copy rather than move when packaging init =
script
=20=20Mask out meta-yocto-bsp from arm machines
=20=20gstreamer-ti.bbappend: package static libs in staticdev package
=20=20guacamayo.conf: set up QA warnings and errors
=20=20libgles-omap3: package static libs in -staticdev
=20=20fix gles
=20=20media-explorer: fix removal of spurious plugin directory
=20=20guacamayo-mex-plugins: delete unpackaged la files
=20=20gst-ffmpeg.bbappend: For RPi revert back to the configure options =
from Denzi
=20=20meta-raspberrypi: updated to current master
=20=20raspberrypi.conf: mask out the psplash bbappend
=20=20removed rpi-zram-service bbappend
=20=20mesa-dri: upgrade to 8.0.4
=20=20raspberrypi.conf: mask out mesa-dri
=20=20clutter-1.12: bump version to the official 1.12 tag
=20=20task-gucamayo-mex-*: added cogl tests to the -tests package
=20=20packagegroup-core-tools-debug.bbappend
=20=20cogl-1.10: fix configuration for arm targets
=20=20cogl-1.12: fix configuration for arm targets
=20=20raspberrypi.conf: s/virtual\/gles2/virtual/\/libgles2
=20=20guacamayo-session-egl: for G_SLICE=3Dalways-malloc on RPi
=20=20guacamayo-image-mex: specify RPI startup type
=20=20linux-yocto.bbappend: move up to 3.4
=20=20atom machines: use 3.4 kernel
=20=20atom machine confs: wrap Yocto atom-pc
=20=20atom machines: put the guacamayo-x11/egl machine feature back
=20=20atom machines: use shared include file
=20=20atk: upgrade to 2.6.0
=20=20libxkbcommon: update to 3d672fcfea6b823db4793b9ad1c3aadc4b547a08
=20=20Use cogl/clutter-1.12
=20=20mx: update to more recent release
=20=20clutter-gst-1.10: make it depend on clutter-1.12
=20=20clutter-gst-1.10: bump version
=20=20Remove cogl/clutter 1.10
=20=20clutter-gst: rename 1.10 to 1.6
=20=20Use clutter-gst-1.6 instead of 1.10
=20=20clutter-gst-2.0: conflict with 1.6
=20=20clutter-gst-1.6: fix compilation with cogl-1.12
=20=20cogl-1.12: fix package version
=20=20guacamayo-session-x11: don't rely on rygel to keep session alive
=20=20pulseaudio: RDEDPEND on modules that the default config requires
=20=20lirc-modules: fix for 3.4 kernel
=20=20cogl-1.12: update beagleboard patch
=20=20rygel: fix plugin packaging
=20=20sqlite: upgrade to 3.7.14.01 since 3.7.130.00 in Yocto crashes




