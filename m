Return-Path: <cliff.brake@gmail.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id 0138175EEA;
	Tue,  4 Aug 2015 13:49:06 +0000 (UTC)
Received: by igr7 with SMTP id 7so74763316igr.0;
	Tue, 04 Aug 2015 06:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:mime-version:message-id:from:to:subject:content-type
	:content-transfer-encoding;
	bh=BJ5MXlw8e4rlX9JgphdCMGnSrunF+bIAhpodtLzoiKs=;
	b=mMt4zqs1GoqR4EHLRptsNM1YBLcx43SqQ/NFRRDeCpKBeoKuRumI2OCl2QaB6WzAaE
	5IM5PywKWTLP9qpAGweoYKYXthnxY0AfVZxt040/ZgWTBIP09IBT8ad9qxac7ik+G0pU
	xLHTGljLFCafy5b0cO3UBFi6qBHTXGDaqFEB7283TT43NbRdXx8YWU4GCKraDhE7tKN7
	oRdLjoAlAzVY2XBIb2EzDfyQYEsUzqpHYXiZzz+ign5kTLk6Vcixz/h8XALCgH/AGBgJ
	g1uVRollxcqzr4O7jSEC0uE1l9faB76okjunH8gq2+MvYR+327ZLsokWznSC3B7Uhdxu
	/X2w==
X-Received: by 10.50.143.43 with SMTP id sb11mr27868805igb.69.1438696145867;
	Tue, 04 Aug 2015 06:49:05 -0700 (PDT)
Received: from [127.0.0.1] (cable-pool5-cs-161.doycomm.com. [66.219.182.161])
	by smtp.gmail.com with ESMTPSA id
	j3sm1094921ige.0.2015.08.04.06.49.03
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Aug 2015 06:49:04 -0700 (PDT)
Date: Tue, 04 Aug 2015 06:49:04 -0700 (PDT)
X-Google-Original-Date: Tue, 04 Aug 2015 13:49:02 GMT
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Message-Id: <1438696142844.690bc64f@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
Subject: OE Changelog since 2015-07-26 until 2015-08-02
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
X-List-Received-Date: Tue, 04 Aug 2015 13:49:10 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2015-07-26 until 2015-08-02.  Projects included in this =
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

Alexander Kanavin (1):
=20=20wget.py: fix incorrect regexes

Alexandru DAMIAN (11):
=20=20toaster: tts: fix pylint warnings
=20=20toaster: tts: clean up HTML5 compatible url list
=20=20toaster tests: gitignore and use absolute path for log file
=20=20toaster: tts: improve debugging information
=20=20toaster: tts: improve logging in urlcheck.py
=20=20toaster: tts: fix startup and cleanup for managed mode
=20=20toaster: tts: delete pyc files before the tests start
=20=20toaster: tts: delete the database only if created
=20=20toaster: tts: make sure to import data
=20=20toaster: tts: execute tests in numeric order
=20=20toaster: toastergui: run pylint on the toaster files

Andre McCurdy (1):
=20=20build: Exit scripts with result of last shell function

Christopher Larson (2):
=20=20bb.cookerdata: don't show traceback for ParseError/ExpansionError
=20=20bb.parse: properly error out on filesystem errors

Ed Bartosh (5):
=20=20bitbake: toaster: Wait for toaster gui to come
=20=20bitbake: toaster: Fix usage of wrong variables
=20=20bitbake: toaster: get rid of _createdirpath function
=20=20bitbake: toaster: Uncomment logging messages
=20=20bitbake: toaster: Add is_image field to the Recipe model

Juro Bystricky (1):
=20=20bitbake-user-manual-fetching.xml: note about URLs with semi-colons

Michael Wood (23):
=20=20toastergui: Implement new top navigation design
=20=20toastergui: Implement new project navigation
=20=20toastergui: base Fix html indentation
=20=20toastergui: importlayer Add format type to JSON calls
=20=20toastergui: Remove erroneous CSS property
=20=20toastergui: Standardise the layer object property layerdetailurl
=20=20toastergui: libtoaster Add show change notification function
=20=20toastergui: tables Add name field to layers table
=20=20toastergui: http api Add guard against incomplete change requests
=20=20toastergui: css Add new rules for new project page
=20=20toastergui: Add new project page and navigation
=20=20toastergui: css Remove redundant css rules
=20=20toastergui: libtoaster Make sure we always pass format=3Djson
=20=20toastergui: libtoaster: Add guard against missing name property
=20=20toastergui: Fix Duplicate layer importlayer api calls
=20=20toastergui: base Use removeAttr / attr
=20=20toastergui: Change build button popover to a build-button
=20=20bitbake: toastergui: newbuildbutton Fix typo on project save function
=20=20toastergui: newbuildbutton Fix removed elements
=20=20toastergui: layerBtn use libtoaster for change notification
=20=20toastergui: project page Add inline project name change feature
=20=20toastergui: Remove angularJS and projectapp based on angular
=20=20bitbake: toastergui: Toastertables don't replace dash in cache key

Richard Purdie (1):
=20=20cooker: properly fix bitbake.lock handling

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Alejandro Hernandez (1):
=20=20opkg: solve inconsistency of using different lists directories

Alexander Kanavin (12):
=20=20libproxy: update SRC_URI to not use Google Code
=20=20adt-installer: update SRC_URI to not use Google Code
=20=20ossp-uuid: update SRC_URI to not use Google Code
=20=20eglinfo: change version from 1.0 to 1.0.0 to match the upstream git =
tag
=20=20libmad: use ftp instead of sourceforge for consistency with libid3tag
=20=20pseudo: fix upstream SRC_URI to enable upstream version check
=20=20syslinux: drop v6.xx/ from directory path in SRC_URI
=20=20shared-mime-info: reorder SRC_URI lines to fix upstream version check
=20=20stress: use developer's website for SRC_URI
=20=20guilt-native: set PV in the recipe to allow upstream version check
=20=20distrodata.bbclass: do not skip -native recipes in checkpkg task
=20=20distrodata.bbclass: drop the manual upstream version check logic

Alexander Kanevskiy (1):
=20=20combo-layer: fix AttributeError traceback.

Andre McCurdy (7):
=20=20busybox: remove CONFIG_FEATURE_VI_OPTIMIZE_CURSOR from defconfig
=20=20busybox: re-order defconfig to align with busybox 1.23.2
=20=20busybox: refresh defconfig for busybox v1.23.2
=20=20busybox: disable sha3sum in defconfig
=20=20busybox: disable fatattr in defconfig
=20=20busybox: support mount via label for btrfs and squashfs
=20=20busybox: enable support for sha1sum and sha256sum applets

Andr=C3=A9 Draszik (6):
=20=20rsync: use ${sysconfdir} instead of hardcoding /etc
=20=20opkg: read config file from ${sysconfdir} instead of /etc
=20=20initscripts: urandom: respect ${localstatedir} instead of hardcoding =
/var
=20=20run-postinsts: use ${localstatedir} instead of hardcoding /var/lib
=20=20opkg-utils: use ${bindir} instead of hardcoding /usr/bin
=20=20arch-armv7a.inc, feature-arm-vfp.inc: add tunes for vfpv3 and vfpv3d16

An=C3=ADbal Lim=C3=B3n (1):
=20=20license_class: Fix choose_lic_set into incompatible license

Beth Flanagan (1):
=20=20base.bbclass: Note when including pn with INCOMPATIBLE_LICENSES

Bruce Ashfield (1):
=20=20perf: add liblzma depdenency

Chen Qi (1):
=20=20dbus: upgrade to 1.8.20

Christopher Larson (13):
=20=20recipetool: catch BBHandledException from parsing
=20=20recipetool.append: add extralines arg to appendsrc
=20=20recipetool: also load plugins from BBPATH
=20=20recipetool: parse global args early
=20=20devtool: also load plugins from BBPATH
=20=20oe-selftest: obey oeqa.selftest.__path__
=20=20oe-selftest: add libdirs from BBPATH to sys.path
=20=20oeqa/recipetool: refactor / split out RecipetoolBase
=20=20oeqa/recipetool: add tests for appendsrcfile(s)
=20=20oeqa/recipetool: allow templayerdir override
=20=20populate_sdk_ext: use lnr, not ln -sr, for portability
=20=20devtool: add --bbpath argument
=20=20populate_sdk_ext: pass BBPATH to devtool --bbpath

Costin Constantin (2):
=20=20oeqa/sstatetests.py: add decorator to =
test_sstate_nativelsbstring_same_hash
=20=20oeqa/sstatetests.py: add annotator to test_sstate_32_64_same_hash =
[YOCTO #60

Cristian Iorga (3):
=20=20harfbuzz: upgrade to 1.0.1
=20=20linux-firmware: upgrade to commit =
75cc3ef8ba6712fd72c073b17a790282136cc743
=20=20qemu: upgrade to 2.4.0-rc3

Dmitry Eremin-Solenikov (4):
=20=20arch-mips.inc: don't override TRANSLATED_TARGET_ARCH
=20=20packagegroups-cross-canadian: don't override TRANSLATED_TARGET_ARCH
=20=20cross.bbclass: override MULTIMACH_TARGET_SYS
=20=20glibc: don't override TUNE_CCARGS for MIPS

Dominic Sacr=C3=A9 (5):
=20=20opkg-utils: fix bashism in opkg-build
=20=20python3: detect libraries in STAGING_LIBDIR
=20=20python3: remove package python3-robotparser
=20=20python3: remove 2to3 symlink from package python3-2to3
=20=20python3: delete patches that don't get applied anywhere

Ed Bartosh (2):
=20=20toaster.bbclass: Fix ValueError
=20=20create-pull-request: Implement -d option

Gary Thomas (1):
=20=20libepoxy: Don't try to use python3 during configuration

Jackie Huang (1):
=20=20guile: Add earlyclobber constraint to the SMULL outputs.

Joe Slater (1):
=20=20nss: advance to version 3.19.1

Kai Kang (2):
=20=20lighttpd: 1.4.35 -> 1.4.36
=20=20smartpm: set noprogress for pycurl

Kevin Hao (1):
=20=20u-boot: fix extern inline build errors for gcc 5

Khem Raj (1):
=20=20gcc5: Upgrade from 5.1 to 5.2

Leonardo Sandoval (1):
=20=20init-install-efi.sh: Check if an installation device is present

Li Zhou (1):
=20=20tzdata: Add marking for config files in recipe

Lucian Musat (1):
=20=20lsbtest: sync test suite packages version

Pascal Bach (1):
=20=20nativesdk-qt4-tools: depend on nativesdk-qt4-tools only if =
DISTRO_FEATURES i

Paul Eggleton (11):
=20=20oe-selftest: add scripts/lib and bitbake/lib to path
=20=20oeqa/targetcontrol: create test directory before copying rootfs image
=20=20oeqa/utils/qemurunner: fix logging
=20=20oeqa/utils/qemurunner: avoid blocking on stty when running under =
oe-selftest
=20=20oeqa/utils/qemurunner: fix error handling if runqemu exits with an =
error
=20=20oeqa/targetcontrol: write QemuRunner log output to a file
=20=20oeqa/selftest/imagefeatures: fix RPM4 test
=20=20oeqa/selftest/imagefeatures: remove gummiboot tests
=20=20oeqa/selftest/devtool: use new runqemu function
=20=20devtool: use tinfoil shutdown method
=20=20oe-selftest: devtool: fix teardown warning in =
test_devtool_update_recipe_app

Richard Purdie (31):
=20=20sed: Make locale depenencies glibc specific
=20=20oeqa/selftest/imagefeatures: Use QemuTarget code
=20=20oeqa/selftest/imagefeatures: fix SSH without password tests
=20=20targetcontrol: Improve logs by outputting qemu boot log in case of =
failure
=20=20qemurunner: Show last 25 line of log, not 5
=20=20security-flags: Disable PIE for coreutils, elfutils, gcc, iptables
=20=20oeqa/qemurunner: Fix AttributeError: QemuRunner instance has no =
attribute 's
=20=20toolchain-scripts: For non-glibc, pass compiler options to ensure the =
correc
=20=20cross-canadian: Put links in place for uclibc and musl
=20=20lib/oe/classextend: Fix nativesdk double name mapping
=20=20binutils: Add nativesdk support
=20=20gcc: Add support for nativesdk-gcc
=20=20toolchain-scripts: Extend to cover nativesdk compiler tools (e.g. =
nativesdk-
=20=20pixbufcache: Use sceneQueueComplete event to simplify usage
=20=20sshcontrol: Use os.environ.copy() instead of copy.copy()
=20=20testimage: testsdk fixes/improvements
=20=20utils: Handle MLPREFIX in all_multilib_tune_values()
=20=20packagegroup-cross-canadian: Make the code more readable
=20=20gcc: Add patch to handle on target multilibs better
=20=20gcc-cross-canadian: Add symlink to real-ld alongside other symlinks
=20=20gcc-multilib-config: Tweak naming of options to match gcc's =
expectations
=20=20libgcc: Fix symlink handling in cross-arch multilib cases
=20=20cross-canadian: Add symlinks for multilib cases
=20=20multilib_global: Fix PREFERRED_VERSION mapping for gcc-cross-canadian
=20=20cross-canadian/gcc: Various mips64 fixes
=20=20gcc-multilib-config: Adapt mips for mips64 and different gcc versions
=20=20oeqa/commands: Increase qemu boot timeout to match testimage.bbclass
=20=20libmpc: 1.0.2 -> 1.0.3
=20=20mpfr: 3.1.2 -> 3.1.3
=20=20kexec-tools: 2.0.9 -> 2.0.10
=20=20python-scons: 2.3.4 -> 2.3.6

Robert Yang (17):
=20=20gcc-target 5.1: fix for libcc1
=20=20qemu_git.bb: remove it
=20=20qemu: add PACKAGECONFIG for gnutls
=20=20git: 2.4.4 -> 2.4.6
=20=20libuser: 0.61 -> 0.62
=20=20less: 478 -> 479
=20=20cracklib: 2.9.4 -> 2.9.5
=20=20gnupg: 2.1.5 -> 2.1.6
=20=20help2man-native: 1.46.4 -> 1.47.1
=20=20man-pages: 4.00 -> 4.01
=20=20pax-utils: 1.0.3 -> 1.0.5
=20=20base.bbclass: move invalid PACKAGECONFIG checking to insane.bbclass
=20=20base.bbclass/blacklist.bbclass: remove doc item when d.getVarFlags()
=20=20useradd_base.bbclass: print PN when bbnote/bbwarn/bbfatal
=20=20useradd_base.bbclass: do not warn when the user exists
=20=20builder: fix USERADD_PARAM
=20=20rootfs.py: fix PRE/POSTPROCESS_COMMANDS for rpm and deb

Ross Burton (1):
=20=20sudo: upgrade to 1.8.14p3

Roy Li (3):
=20=20bind: upgrade to 9.10.2-P2
=20=20elfutils: fix stack usage warning
=20=20alsa-utils: assume the alsa storing is success if machine has no =
sound card

Wenzong Fan (1):
=20=20perl: fix build failure if building dir has the "blib" string

Zhixiong Chi (1):
=20=20dhcp: fix installed not shipped warning for lib32

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Andreas Baak (2):
=20=20libgphoto2: update to 2.5.8
=20=20gphoto2: Adds recipe for gphoto2 2.5.8

Andreas M=C3=BCller (5):
=20=20xfce4-notifyd: update to 0.2.4
=20=20libwnck3: update to 3.14
=20=20libwnck: update to 2.31 / avoid conflicts with libwnck3
=20=20xfce4-hotcorner-plugin: initial add 0.0.2
=20=20packagegroup-xfce-extended: add xfce4-hotcorner-plugin

Armin Kuster (2):
=20=20libxklavier: fix compile error.
=20=20mozjs: fix lib soname issue

Bian Naimeng (1):
=20=20sblim-sfcc: add new recipe

Dominic Sacr=C3=A9 (1):
=20=20fio: Add PACKAGECONFIG for numa, re-enable ARM build

Joe MacDonald (2):
=20=20ypbind: remove bashisms from initscript
=20=20opensaf: add optional openhpi support

Joe Slater (1):
=20=20postgresql: advance from 9.4.2 to 9.4.4

Jonathan Liu (1):
=20=20nodejs: update to 0.12.7

Kang Kai (6):
=20=20crash: upgrade from 7.0.9 to 7.1.2
=20=20liblockfile: add patch of version 1.09-6 from debian
=20=20lvm2: upgrade from 2.02.97 to 2.02.125
=20=20dracut: upgrade from 038 to 043
=20=20efibootmgr: add recipe
=20=20multipath-tools: upgrade git rev

Li xin (13):
=20=20bdftopcf: upgrade 1.0.4 -> 1.0.5
=20=20corosync: upgrade 2.3.4 -> 2.3.5
=20=20iw: upgrade 3.15 -> 4.1
=20=20libconfig: upgrade 1.4.9 -> 1.5
=20=20libcap-ng: upgrade 0.7.4 -> 0.7.7
=20=20libedit: upgrade 20130712-3.1 -> 20150325-3.1
=20=20numactl: upgrade 2.0.9 -> 2.0.10
=20=20opensc: upgrade 0.14.0 -> 0.15.0
=20=20openldap: upgrade 2.4.40 -> 2.4.41
=20=20lua: upgrade 5.2.2 -> 5.3.1
=20=20lmsensors: upgrade 3.3.5 -> 3.4.0
=20=20libxaw: upgrade 1.0.10 -> 1.0.13
=20=20multipath-tools: bug fix

Maciej Borzecki (4):
=20=20python-daemonize: add recipe
=20=20python-paho-mqtt: add recipe
=20=20python-sparts: add recipe
=20=20python-pyudev: add missing dependency on python-contextlib

Martin Jansa (1):
=20=20xorriso: inherit distro_features_check

Otavio Salvador (4):
=20=20opencv: Only enable 'libav' support if commercial license is =
whitelisted
=20=20opencv: Add 'libv4l' PACKAGECONFIG
=20=20glmark2: Convert recipe to fetch from Git
=20=20glmark2: Remove X11 exclusiveness

Richard Purdie (2):
=20=20gst-ffmpeg: Add explict getVar expansion parameter
=20=20postgresql: Add explict getVar expansion parameter

Roy Li (2):
=20=20znc: upgrade to 1.6.0
=20=20hostapd: consider sysroot when search header files

S. Lockwood-Childs (2):
=20=20libimobiledevice: remove runtime configure check
=20=20ifuse: remove blacklist due to libimobiledevice

Tudor Florea (1):
=20=20fuse: fix for CVE-2015-3202 Privilege Escalation

Wenzong Fan (1):
=20=20libxml-libxml-perl: update from 2.0116 to 2.0121

Zhixiong Chi (1):
=20=20lvm2: fix shared object file dlopen failed

leimaohui (2):
=20=20openwsman: add new recipe
=20=20sblim-cmpi-devel: add new recipe

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Koen Kooi (1):
=20=20angstrom.inc: enable cgroups in kernels that use linux.inc

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Denys Dmytriyenko (8):
=20=20gstreamer1.0-plugins-ti: fix build when B !=3D S
=20=20external-linaro-toolchain: start updating for 2015.05 release
=20=20HACK: disable cryptodev modules for now, until fixed against 4.1
=20=20HACK: disable multimedia builds until IPC gets merged to 4.1
=20=20HACK: disable CMEM and DSP tools until IPC gets merged to 4.1
=20=20HACK: disable remaining smaller pieces due to breakage with 4.1/IPC
=20=20arago-prefs: switch over to 4.1 kernel and 2015.07 u-boot
=20=20HACK: disable SGX modules on am3/am4 for now until fixed against 4.1

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-atmel:

Koen Kooi (2):
=20=20u-boot: rename u-boot.inc to avoid shadowing the OE-core file
=20=20u-boot-at91 git: change u-boot include name

Nicolas Ferre (7):
=20=20image: atmel xplained: add audio mpg123
=20=20kernel defconfig: sama5d2: update to add qspi and classD
=20=20at91bootstrap: add a recipie for 3.8-alpha3
=20=20README: fix the branch name in the build procedure
=20=20README: add the new sama5d2 SoC family

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

Carlos Rafael Giani (1):
=20=20gstreamer1.0-plugins-imx: Update to version 0.11.1

Lauren Post (23):
=20=20mesa: Support for mx6 without GPUs
=20=20mesa-demos: Fix so patches only install for SoC with GPU
=20=20imx-base: Add mx7 support to U-Boot, MACHINE filter and DEFAULT_TUNE
=20=20image_types_fsl: Add support for mx7 image generation
=20=20firmware-imx: Upgrade to 5.0 version
=20=20imx-kobs: Upgrade to 5.0 version
=20=20imx-lib: Upgrade to 5.0 version
=20=20imx-test: Upgrade to 5.0 version
=20=20imx-vpu: Upgrade to 5.4.30 version
=20=20gst1.0-fsl-plugins: Upgrade to 4.0.5 version
=20=20alsa-state: Add mx7 support with wm8960 audio
=20=20fsl-alsa-plugins: Add mx7 to COMPATIBLE_MACHINE
=20=20linux-imx: Upgrade to 3.14.38-6QP_beta release
=20=20u-boox-imx: Upgrade to 3.14.28-6QP_beta release
=20=20imx6sxsabresd: Add imx6sx-sdb-ldo.dtb device tree
=20=20imx-gpu-viv: Upgrade to 5.0.11.p6.3 version
=20=20xf86-video-imxfb-vivante: Upgrade to 5.0.11.p6.3
=20=20xserver-xf86-config: Add support for PXP Frame Buffer displays
=20=20EULA: Update to 2015.06 v8 version
=20=20SCR: Update to 3.14.38-6QP_beta Software Content Register
=20=20imx7dsabresd: Create i.MX 7Dual SABRE Smart Device machine
=20=20imx6qpsabreauto: Create i.MX 6 QuadPlus SABRE Auto machine
=20=20gst1.0-fsl-plugin: Add Gstreamer Recorder support

Otavio Salvador (10):
=20=20packagegroup-fsl-mfgtool: Add e2fsprogs-e2fsck in extfs feature
=20=20packagegroup-fsl-mfgtool: Add f2fs feature
=20=20mfgtool-initramfs-image.bbclass: Add f2fs feature option
=20=20opencv: Remove v4l support for all i.MX6
=20=20mesa: Avoid Vivante GPU headers conflict for gl.h and glext.h
=20=20mesa: Fix override of x11 GLX support for i.MX6
=20=20glmark2: Handle PACKAGECONFIG for X11 and Wayland
=20=20qtbase: Fix indentation of recipe
=20=20imx6qpsabreauto: Override virtual/kernel for linux-imx
=20=20mesa-demos: Support for mx6 without GPUs

Tom Hochstein (1):
=20=20xf86-video-imxfb-vivante: Fix gcc 5.2 build break

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-ppc:

Ting Liu (5):
=20=20openssl-1.0.1i: s/inline/static/ to fix gcc5.2 issue
=20=20u-boot-qoriq: correct PV
=20=20u-boot-qoriq: Add linux/compiler-gcc5.h to fix builds with gcc5
=20=20u-boot-qoriq: add -fgnu89-inline option for gcc5
=20=20cryptodev: set CLEANBROKEN

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

Anuj Mittal (4):
=20=20meta-isg: fix build of dpdk_qat example app
=20=20meta-crystalforest: add virtual/qat provider
=20=20meta-crystalforest: zlib-qat depends on virtual/qat
=20=20meta-isg: make dpdk_qat dependent on virtual/qat

Bruce Ashfield (1):
=20=20bsps: update meta SRCREVs

Ong Boon Leong (1):
=20=20meta-crystalforest: add in clarity around how to pick the right QAT =
version

WU CHIA CHUAN (3):
=20=20meta-isg: dpdk: tidy up dpdk.inc & removed unnecessary patches
=20=20meta-isg: dpdk: fix issue in build configuration variables
=20=20meta-isg: dpdk v2.0.0: add patch to handle ip_fragmentation =
application

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

Alex J Lennon (16):
=20=20mono, mono-native: Patch test threadpool-exception5
=20=20README: Update with testing on qemuarm, 3.12.1/4.0.3.19
=20=20README: Update with testing on qemux86, 3.12.1
=20=20gtk-sharp: Move needed .so's from -dev
=20=20mono-helloworld: Update to v1.2 to add gtk-sharp demo
=20=20FAQ: update with Mono versions / mono-helloworld details
=20=20mono_git: Correct missing dependency on mono-native_git
=20=20mono-git: Refactor in line with 4.xx support
=20=20README: Update maintainer list
=20=20README: add notes on GTK# example testing under qemux86/qemuarm
=20=20README: Remove comment about Mono not running without X
=20=20mono-helloworld,mono-helloworld-xbuild: correct archive checksums
=20=20mono-helloworld: use uploaded archive from github so checksums won't =
change
=20=20mono-helloworld-xbuild: use autotools-brokensep
=20=20mono-xsp: revert #ca50056e which moved XSP classes to =
Mono.WebServer.dll
=20=20monotools-server: link against xsp4.exe

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-netbookpro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nodejs:

Ilkka Myller (1):
=20=202015-07-28 io.js v2.5.0 Release

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nslu2:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-opie:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-qt3:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-qt5:

Jonathan Liu (1):
=20=20libconnman-qt5: update to 1.0.91

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

Denys Dmytriyenko (8):
=20=20linux-ti-staging 4.1: update to latest 4.1.3 and more staging work
=20=20linux-ti-staging 3.14: update to 3.14.48 stable
=20=20linux-ti-staging 4.1: update with latest feature merges
=20=20u-boot-ti-staging: update to the latest 2015.07
=20=20bltsville: fix build when B !=3D S
=20=20am33x-cm3: move into cm3-pm-firmware folder
=20=20amx3-cm3: add new PM firmware for 4.1 kernel
=20=20linux-ti-staging: update with recent merges, switch to new PM firmware

Karthik Ramanan (1):
=20=20ipumm-fw: Update download path and checksum

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Alexander Kanavin (3):
=20=20distro_alias.inc: drop reference to Google Code
=20=20package_regex.inc: updates to fix upstream version checks for multple =
packag
=20=20upstream_tracking.inc: remove outdated information

An=C3=ADbal Lim=C3=B3n (1):
=20=20distro/maintainers.inc: Fix parsing error due to lack of " at end.

Paul Eggleton (1):
=20=20oe-selftest: restore gummiboot tests

Ross Burton (2):
=20=20distro/maintainers.inc: remove Saul Wold from maintainership
=20=20distro/maintainers.inc: maintainer updates

Trevor Woerner (1):
=20=20poky: Fix SANITY_TESTED_DISTROS lsb name for openSUSE 13.2

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



