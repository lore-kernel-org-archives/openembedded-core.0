Return-Path: <cliff.brake@gmail.com>
Received: from mail-qg0-f47.google.com (mail-qg0-f47.google.com
	[209.85.192.47])
	by mail.openembedded.org (Postfix) with ESMTP id 7C8AB6FFF2;
	Wed, 13 Jan 2016 16:46:20 +0000 (UTC)
Received: by mail-qg0-f47.google.com with SMTP id 6so380111384qgy.1;
	Wed, 13 Jan 2016 08:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:mime-version:message-id:from:to:subject:content-type
	:content-transfer-encoding;
	bh=JjXRpqwjQpMn97HRM7utEbQDy01PLsn5VYDXgCWcnik=;
	b=gtGLjdnqQSC7EM6o/fCJySGst1rcStUi4BQxyBoXq1Foxv8NJJaI2Qee1wr1l9s0V+
	512vJVrfbO09RmX+uRvvBId8YbidZuypBuPGIxrXQy2ryuCyd08v+w/WFZqDcVDcD8lc
	1uXxfS2T5vgeEpxc970gxif+9lOGZFNfG7Iiwa4s+R150IyMG1JfJo5CuSCLknGK8weQ
	HhzHCUGhlUehPIBkxyF6JgfvL2zK5yvMmiqO9XpTfsRj6TExYFCBxd5guCyAUlB9v7aG
	nfFAB04/tB8vLDdHq10W+OJY7EFjSX7EA3S6G6t/Zj/rY5QSiN+1VvCg3gY5EEEgzmdl
	USqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:mime-version:message-id:from:to:subject
	:content-type:content-transfer-encoding;
	bh=JjXRpqwjQpMn97HRM7utEbQDy01PLsn5VYDXgCWcnik=;
	b=HmTQeVlGqQeAVyFW7OVu63MdcauNPD+E14a/6tRx1g59EjHAnVECmuSNP0yRYeC/gh
	VhFwMJSRWGk+Wqu09ARGFyqVKIpvVnWwZmJIrlux6witTwvnFtovlTm4WfYDjPMd5Di6
	L43N/Sud/SVcPtmQMkLmAQwgm3I+Gfj1oGRBuCjrlO0GPuCOEUPGqR7nLEUeAYIVuceJ
	evybQ7feXtUkT0U03CiVmaUeka0SS92MQzQza3li6JA0+4k6BRHkCNd4q+PFfwGBPFE9
	4rygH9n7ew5w9905JqoyG/31aNjz7B+Gs5LKRBOk2re2NRT/86w4Bm41KfHQrl73zrVF
	Cj5g==
X-Gm-Message-State: ALoCoQlX+yC4Cy4+ho0K2AYsiJYrCr4K3qEpAbpRbx5bVw1FqbB7GqxBDMm6vhjXKawJPmnA2RniBh7GBr9MzuL4uwkR+cFfDQ==
X-Received: by 10.140.170.212 with SMTP id q203mr56216875qhq.32.1452703580816; 
	Wed, 13 Jan 2016 08:46:20 -0800 (PST)
Received: from [127.0.0.1] (cable2-pool191-cs-134.doycomm.com.
	[66.219.191.134])
	by smtp.gmail.com with ESMTPSA id f66sm806871qkb.5.2016.01.13.08.46.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 13 Jan 2016 08:46:19 -0800 (PST)
Date: Wed, 13 Jan 2016 08:46:19 -0800 (PST)
X-Google-Original-Date: Wed, 13 Jan 2016 16:46:17 GMT
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Message-Id: <1452703577846.b22a4935@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
Subject: OE Changelog since 2016-01-03 until 2016-01-10
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
X-List-Received-Date: Wed, 13 Jan 2016 16:46:20 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2016-01-03 until 2016-01-10.  Projects included in this =
report:

bitbake: git://git.openembedded.org/bitbake
openembedded-core: git://git.openembedded.org/openembedded-core
meta-openembedded: git://git.openembedded.org/meta-openembedded
meta-angstrom: git://github.com/Angstrom-distribution/meta-angstrom.git
meta-arago: git://arago-project.org/git/meta-arago.git
meta-atmel: https://github.com/linux4sam/meta-atmel.git
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
https://github.com/schnitzeltony/meta-gumstix-community.git
meta-handheld: git://git.openembedded.org/meta-handheld
meta-igep: http://github.com/ebutera/meta-igep.git
meta-intel: git://git.yoctoproject.org/meta-intel
meta-ivi: git://git.yoctoproject.org/meta-ivi
meta-java: git://github.com/woglinde/meta-java
meta-jetson-tk1: https://github.com/cubicool/meta-jetson-tk1.git
meta-kde: git://gitorious.org/openembedded-core-layers/meta-kde.git
meta-micro: git://git.openembedded.org/meta-micro
meta-mono: git://git.yoctoproject.org/meta-mono.git
meta-netbookpro: git://github.com/tworaz/meta-netbookpro
meta-nodejs: https://github.com/imyller/meta-nodejs.git
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

Ed Bartosh (14):
=20=20cooker: add state.get_name method
=20=20uievent: add error to registerEventHandler return
=20=20uievent: get rid of EventHandler attribute
=20=20uievent: refactor retry loop
=20=20xmplrpc: split connect method
=20=20main: kill server without queue setup
=20=20taskdata: refactor get_providermap
=20=20cooker: add providermap to dep_tree
=20=20buildinfohelper: use providermap
=20=20toaster: add Provider model
=20=20buildinfohelper: add provides info to the db
=20=20toaster: show list of provides for the recipe
=20=20toaster: show 'satisfied via' text for build deps
=20=20toaster: show 'satisfied via' text for reverse deps

Juro Bystricky (1):
=20=20fetch2/__init__.py: Add support for 7-Zip

Michael Wood (1):
=20=20toaster: settings Add uid to the toaster cache dir

Richard Purdie (10):
=20=20codeparser: Add support for correct linenumbers
=20=20data: Pass lineno/filename data from build_dependencies
=20=20cooker: Drop useless parsing exception
=20=20data: Drop misleading ExpansionError exception
=20=20siggen: Change exception note into a warning
=20=20utils: Remove double compile from better_compile
=20=20ast: Add filename/lineno to mapped functions
=20=20knotty: Use non-interactive mode as fallback for dumb terminals
=20=20fetch/git: Change to use clearer ssh url syntax for broken servers
=20=20main/runqueue: Add --setscene-only option to bitbake

Robert Yang (1):
=20=20fetch2/local.py: avoid using PREMIRROR

Ross Burton (2):
=20=20cooker: use in instead of count
=20=20cooker: fix findFilesMatchingInDir documentation

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Alejandro Joya (4):
=20=20base-utils:flexible dependency for command utilities
=20=20core-image-minimal-initramfs: replace base-utils
=20=20initramfs-framework_1.0:replace busybox for variable.
=20=20packagegroup-core-boot:replace busybox to variable

Alexander Kanavin (2):
=20=20qt4: remove recipes and classes
=20=20packagegroup-core-lsb: treat qt4 packages same as qt3 packages

Andre McCurdy (1):
=20=20security_flags.inc: disable -fstack-protector-XXX for valgrind

Awais Belal (1):
=20=20grub2: Fix CVE-2015-8370

Daniel Istrate (5):
=20=20selftest: moved tc test_buildhistory_does_not_change_signatures
=20=20oe-selftest: Improved --list-classes when determining test names
=20=20oe-selftest: New option --list-tests
=20=20selftest: Added testcase decorators for 2 tests
=20=20scripts/oe-selftest: Allow to run tests on random/all MACHINEs

Humberto Ibarra (1):
=20=20scripts/oe-selftest: Remove extra coverage data added to unittests

Ioan-Adrian Ratiu (3):
=20=20x11vnc: move recipe to meta-oe
=20=20x11vnc: move recipe to meta-oe
=20=20x11vnc: remove all references to moved package

Jens Rehsack (1):
=20=20udev-extraconf: introduce multiple blacklist files for more complex =
setups

Joseph A. Lutz (1):
=20=20readline: move inputrc into readline

Kai Kang (2):
=20=20bash: fix buildpaths qa check error
=20=20gccmakedep: fix buildpaths qa check

Khem Raj (1):
=20=20valgrind: Define __UCLIBC__ for uclibc based systems

Lukas Bulwahn (1):
=20=20boost: ensure boost to remain an empty metapackage

Mariano Lopez (1):
=20=20image_types.bbclass: Rebuild when WICVARS change

Martin Jansa (17):
=20=20sstate-sysroot-cruft.sh: Extend the whitelist
=20=20pulseaudio: add PACKAGECONFIG for lirc
=20=20sanity.bbclass: add more information to error message about =
TUNE_PKGARCH mis
=20=20tune-cortexr4.inc: fix PACKAGE_EXTRA_ARCHS
=20=20arch-armv7a: add missing space before ?=3D
=20=20arch-armv7a, tune-cortexa*: improve comment VFP -> HF
=20=20arch-armv7a, tune-cortexa*: improve indentation
=20=20arm/arch-arm*, tune-cortexa*, tune-thunderx.inc, =
powerpac/arch-powerpc64.inc
=20=20arch-armv[456]*.inc: improve indentation like armv7a
=20=20arch-armv5.inc: drop duplicate ARMPKGSFX_DSP and =
PACKAGE_EXTRA_ARCHS_tune-ar
=20=20arch-armv7a.inc: Fix PACKAGE_EXTRA_ARCHS for tune-armv7atb-vfpv3, =
tune-armv7
=20=20arch-armv7a.inc: add vfpv4 support also to softfp and big endiand =
tunes
=20=20feature-arm-{neon,vfp}.inc: refactor and fix issues
=20=20feature-arm-vfp.inc: Further simplify with TUNE_CCARGS_MFLOAT
=20=20cortexa{7,15,17}: add VFPv4 tunes
=20=20arch-armv7ve: add tune include for armv7ve and use it from cortexa7 =
and cort
=20=20tune-*: use mcpu instead of mtune for ARM tunes

Maxin B. John (3):
=20=20packagegroup-core-x11-sato: enable pcmanfm on mips
=20=20iptables: upgrade to 1.6.0
=20=20libjpeg: Replace libjpeg with libjpeg-turbo

Noor Ahsan (1):
=20=20wic: rawcopy: Copy source file to build folder

Paul Eggleton (1):
=20=20classes/buildhistory: actually use KiB in extensible SDK sizes files

Phil Blundell (1):
=20=20openjade: Fix build if not installing libtool .la files

Richard Purdie (5):
=20=20orc: Add missing PACKAGES_DYNAMIC
=20=20image: Remove pointless rootfs lock
=20=20image/rootfs-postcommands: Separate out post rootfs commands to =
separate cla
=20=20image: Condense do_rootfs function/flags
=20=20image: Really remove lockfiles flag

Robert Yang (1):
=20=20python3: fix installed-vs-shipped when 64bit + multilib

Ross Burton (7):
=20=20uclibc: disable parallel builds
=20=20meta/conf/layer.conf: bump layer version due to Qt4 removal
=20=20gcc-sanitizers: link directly against sysroot libstc++
=20=20systemd: add more compression and importd PACKAGECONFIGs
=20=20systemd: enable compatibility libraries by default
=20=20oeqa/selftest/recipetool: update for libjpeg-turbo migration
=20=20testimage: remove VNC test, x11vnc isn't in oe-core anymore

Trevor Woerner (2):
=20=20mkefidisk.sh: add startup script for automated boot
=20=20mkefidisk.sh: add boot log on console

Zhixiong Chi (1):
=20=20expat: CVE-2015-1283

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Andre McCurdy (6):
=20=20mpg123: add textrel to INSANE_SKIP
=20=20BSD-0-Clause: remove license file now included in oe-core
=20=20OML: move license file from meta-oe to meta-webserver
=20=20opencv: sort PACKAGECONFIG options
=20=20opencv: limit ARM_INSTRUCTION_SET =3D "arm" over-ride to armv4/armv5
=20=20opencv: support machines based on oe-core tune-corei7.inc

Andrea Adami (1):
=20=20kexec-tools-klibc: add explicit SRC_URI

Andreas M=C3=BCller (3):
=20=20xfce4-sensors-plugin: initial add 1.2.6
=20=20packagegroup-xfce-extended: add xfce4-sensors-plugin
=20=20libsdl2-ttf: initial add 2.0.12

Armin Kuster (1):
=20=20wireshark: package update to 2.0.1

Chris Patterson (3):
=20=20strongswan: add additional PACKAGECONFIG flags
=20=20strongswan: add configure patch fix for systemd
=20=20strongswan: install strongswan-swanctl systemd service by default.

Hongxu Jia (1):
=20=20postfix.inc: fix start postfix failed while hostname is numeric

Jagadeesh Krishnanjanappa (1):
=20=20iscsitarget: resolve build error if CONFIG_IPV6 config is not enabled

Jens Rehsack (8):
=20=20talloc: rename to libtalloc and cleanup dependency mess
=20=20samba: fix typo distinguishing between plain sysv init and lsb init
=20=20libldb: allow chosing ldap dependency instead of hard requiring it
=20=20libtevent: rework dependencies for deterministic build
=20=20samba: make cyrus-sasl optional
=20=20samba: split packages similar to samba3
=20=20samba: move RDEPENDS of perl from samba to samba-pidl
=20=20waf-samba: enable parallel builds

Jose Alarcon (3):
=20=20contrib: ensure that oe-stylize.py works with python versions < 3.0
=20=20contrib: add missing common OE variables
=20=20contrib: print oldline within single quotes

Kai Kang (8):
=20=20python-pexpect: drop old version recipe
=20=20python-tornado: move old version recipe from meta-oe to meta-python
=20=20crash: 7.1.2 -> 7.1.3
=20=20iperf3: fix build-deps qa warning
=20=20mime-construct: update runtime dependencies
=20=20mime-construct: move from meta-networking to meta-perl
=20=20xl2tpd: fix warnings with gcc 5
=20=20libtalloc: fix SRC_URI

Koen Kooi (2):
=20=20xf86-video-nouveau: update to 1.0.12
=20=20xf86-video-ati: update to 7.6.1

Li xin (13):
=20=20python-vcversioner: Error Fix for recipes depend on =
python-vcversioner.
=20=20dfu-util: 0.7 -> 0.8
=20=20lua: 5.3.1 -> 5.3.2
=20=20mailcap: 2.1.44 -> 2.1.45
=20=20sblim-sfcb: 1.4.8 -> 1.4.9
=20=20openwsman: 2.6.0 -> 2.6.2
=20=20zabbix: 2.4.5 -> 2.4.7
=20=20libp11: 0.2.8 -> 0.3.0
=20=20postgresql: 9.4.4 -> 9.4.5
=20=20dialog: 1.2-20150528 -> 1.2-20150920
=20=20lemon: 3.5.4 -> 3.7.3
=20=20python-simplejson: 2.2.1 -> 3.8.1
=20=20engine-pkcs11: 0.1.8 -> 0.2.0

Mariano Lopez (1):
=20=20hostapd: Fix source and build directory

Martin Jansa (7):
=20=20linux-yocto-tiny-kexecboot: upgrade to 4.1
=20=20ctdb: add dependency on libldb
=20=20freerdp: backport patch to fix build with newer gstreamer
=20=20libetpan, claws*: blacklist because of gnutls upgrade
=20=20pidgin*: blacklist because of gnutls upgrade
=20=20iksemel: blacklist because of gnutls upgrade
=20=20rsyslog: blacklist because of gnutls upgrade

Qi.Chen@windriver.com (1):
=20=20quagga: fix segment fault when stopping ospf6d

Rafa=C3=ABl Carr=C3=A9 (4):
=20=20VLC: PACKAGECONFIG for new dependency on libvncserver
=20=20VLC: depend on jpeg rather than libjpeg-turbo
=20=20net-snmp: apply patch for cross-compilation
=20=20net-snmp: apply patch for cross-compilation

Roy Li (2):
=20=20net-snmp: fix the replacement in net-snmp-config
=20=20mime-construct: Perform more mangling for perl path

Trevor Woerner (1):
=20=20nodejs: cleanup and update

Wenzong Fan (1):
=20=20samba: add PACKAGECONFIG for valgrind

Yi Zhao (2):
=20=20libvncserver: fix PN -> BPN for multilib
=20=20polkit-gnome: remove unrecognized configure options

fan.xin (1):
=20=20apache2: Upgrade 2.4.16 -> 2.4.18

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-atmel:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-beagleboard:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-browser:

Trevor Woerner (5):
=20=20chromium.inc: fix typos
=20=20chromium_40.0.2214.91.bb: improve PACKAGECONFIG info
=20=20chromium: API keys update
=20=20chromium: update run script for early run
=20=20chromium: add kiosk-mode PACKAGECONFIG

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

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-ppc:

Ting Liu (2):
=20=20cryptodev: set PREFERRED_VERSION to 1.7
=20=20udev-rules-qoriq: put patches to universe location

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-guacamayo:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix-community:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-handheld:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-igep:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Saul Wold (7):
=20=20xf86-input-synaptics: Remove un-needed recipe
=20=20xf86-input-evdev: Remove un-needed recipe
=20=20intel-microcode: Update to the 20151106 version
=20=20iucode-tool: Update to 1.5
=20=20intel-gpu-tools: Upgrade to 1.13
=20=20xf86-video-ast: Upgrade to 1.1.5
=20=20linux-yocto: Update to 4.1.15

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-java:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-jetson-tk1:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-kde:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-micro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-mono:

Adam Lussier (1):
=20=20mono: prevent host user contamination

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-netbookpro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nodejs:

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

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Alexander Kanavin (1):
=20=20meta-yocto: drop qt4 references

Bruce Ashfield (2):
=20=20yocto-bsp: remove 3.14 and 3.19 bbappends
=20=20poky-lsb/poky-tiny: update preferred kernel to 4.1

Humberto Ibarra (1):
=20=20scripts/yocto-layer: Avoids duplication of "meta-" prefix

Ross Burton (2):
=20=20conf/local.conf.sample: comment out ASSUME_PROVIDED=3Dlibsdl-native
=20=20maintainers.inc: remove x11vnc

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



