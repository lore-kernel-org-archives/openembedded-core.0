Return-Path: <cliff.brake@gmail.com>
Received: from mail-ie0-f176.google.com (mail-ie0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 10D8665C7B;
	Tue,  2 Sep 2014 19:43:33 +0000 (UTC)
Received: by mail-ie0-f176.google.com with SMTP id x19so8031237ier.7
	for <multiple recipients>; Tue, 02 Sep 2014 12:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:mime-version:message-id:from:to:subject:content-type
	:content-transfer-encoding;
	bh=gLrCcvMWO+JTefU3OJDEp/GfoLS0cJpWR9VDIjAutac=;
	b=FKtrw2DLC94w//g4xK0Dz30Dgz5Qm48Dn8+V/4n5bf76KucY0pa0yEJS2Y4aendAMJ
	rnd3hGiiIMHYZSAATOn3Ryt/TM6o9L/dHmgVv+TZJzf8+/P6IXxyx9wwRMMAkTq8K0aE
	lSarw+9sgPUDc6ck0OlysuY8VLO47aNk83YJD7zN5MY9LUoXuUJwIDXA/YfKcBSg0a7T
	XL2TW0HioYhNIdZe/WzbaTt0Ib8YIYC5bUkrRreo4RKwCyoThRCysBY8dyyrADuI9cAx
	mr+J6eCO3lD2hBKpYMDMHsWouIMmI6ymlmB7RxoD4u2S5jvJ4GeQNwuvHjk/1e2Md1B4
	p4ug==
X-Received: by 10.42.103.143 with SMTP id m15mr14224558ico.50.1409687014828;
	Tue, 02 Sep 2014 12:43:34 -0700 (PDT)
Received: from [127.0.0.1] (cable2-pool191-cs-105.doycomm.com.
	[66.219.191.105])
	by mx.google.com with ESMTPSA id g3sm42429425igc.2.2014.09.02.12.43.32
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 02 Sep 2014 12:43:33 -0700 (PDT)
Date: Tue, 02 Sep 2014 12:43:33 -0700 (PDT)
X-Google-Original-Date: Tue, 02 Sep 2014 19:43:32 GMT
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Message-Id: <1409687012264.762be5cf@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
Subject: OE Changelog since 2014-08-24 until 2014-08-31
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
X-List-Received-Date: Tue, 02 Sep 2014 19:43:37 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2014-08-24 until 2014-08-31.  Projects included in this =
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

Alexandru DAMIAN (11):
=20=20toasterui: refactor log saving and save out-of-build errors
=20=20toaster: fix application discovery in settings.py
=20=20toaster: update orm models for layerindex compatibility
=20=20toaster: enable admin interface on select models
=20=20toaster: create project section navigation structure
=20=20toaster: add all layers page
=20=20toaster: update checksettings command for auto-detection
=20=20toaster: update the bldcontrol to the new orm models
=20=20toatergui:  update pages to match project models
=20=20buildinfohelper: BuildRequest project file update soft linked
=20=20toaster: create Build methods for calculating progress and ETA

Richard Purdie (5):
=20=20runqueue: Fix setscene tasks not running
=20=20fetch2/hg: Fix username/password handling
=20=20utils: Improve profile log processing
=20=20bitbake-worker: Extra profiling data dump
=20=20build/data: Write out more complete python run files

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Armin Kuster (3):
=20=20IBM Power5 v2: Add new tune file for PPC power5 cpu
=20=20IBM power6 v2: Add new tune file for PPC power6
=20=20IBM power7 v2: Add new tune file for PPC power7

Carlos Rafael Giani (5):
=20=20gstreamer1.0-plugins-bad: add opencv haar cascade XML files to package
=20=20gstreamer1.0-omx: Add DEPENDS on gstreamer1.0-plugins-bad
=20=20gstreamer1.0-plugins-bad: Add DEPENDS on libpng
=20=20gstreamer1.0-plugins-bad: Fix GL/GLES configuration
=20=20gstreamer1.0-plugins-bad: Add DEPENDS on jpeg

Chong Lu (1):
=20=20lttng-tools: fix ptest execution failure

Christopher Larson (3):
=20=20sanity: handle both \n and \\n in mirror vars
=20=20sanity: fix support for regex schemes in mirrors check
=20=20sanity: refactor mirrors checks to be more pythonic

Ciobanu Roxana (1):
=20=20xf86-input-synaptics: upgrade to 1.8.0

Corneliu Stoicescu (4):
=20=20classes/populate_sdk_base.bbclass: add a manifest for target sdk
=20=20classes/testimage.bbclass: add more fields to the sdk TestContext
=20=20oeqa/oetest.py: enable sdk tests to use hasFeature and hasPackage =
methods.
=20=20oeqa/sdk/buildsudoku.py: add setUpModule method to run only when gtk+ =
in ins

Cristian Iorga (4):
=20=20connman: upgrade to 1.25
=20=20harfbuzz: upgrade to 0.9.35
=20=20bluez5: upgrade to 5.22
=20=20ofono: upgrade to 1.15

Fahad Usman (4):
=20=20logrotate: obey our flags
=20=20logrotate: add packageconfigs
=20=20buildtools-tarball: include nativesdk-ca-certificates
=20=20buildtools-tarball: export GIT_SSL_CAINFO

Jackie Huang (1):
=20=20qemu: add PACKAGECONFIG for numa

Jate Sujjavanich (1):
=20=20useradd: Add setscene dep on pseudo-native

Joe Slater (1):
=20=20archiver.bbclass: add revision to git tarfile name

Khem Raj (5):
=20=20native/nativesdk: Clear MACHINEOVERRIDES
=20=20openssl: Re-add linux-uclibc tuple
=20=20uclibc: Upgrade to tip of master
=20=20uclibc: Support systemd builds
=20=20systemd: Support building on uclibc

Li Wang (1):
=20=20nss: CVE-2014-1544

Lucian Musat (1):
=20=20oeqa/runtime: Automatic test for parsing the logs on a machine and =
search fo

Martin Jansa (1):
=20=20buildhistory: Restore parsing time optimalization

Max Eliaser (5):
=20=20xorg-drivers: xf86-video-cirrus: add a recipe for the Cirrus Logic =
X.Org dri
=20=20qemux86: xorg.conf: allow X.Org driver to be selected automatically.
=20=20qemux86: support X11 when QEMU is emulating a different GPU than =
vmware
=20=20qemux86-64: xorg.conf: allow X.Org driver to be selected =
automatically.
=20=20qemux86-64: support X11 when QEMU is emulating a different GPU than =
vmware

Ming Liu (1):
=20=20linux-dummy: bundle_initramfs should not be nostamp any more

Muzaffar Mahmood (1):
=20=20libtiff: fix CVE-2013-1961

Otavio Salvador (2):
=20=20libxml2: Explicitly enable zlib support
=20=20packagegroup-core-directfb: Set PACKAGE_ARCH to MACHINE_ARCH

Paul Barker (1):
=20=20psmisc: Update patch status

Peter Kjellerstedt (2):
=20=20lib/oe/utils: Make multiprocess_exec() return anything
=20=20package: Correct two typos in a comment

Richard Purdie (7):
=20=20bitbake.conf: Drop unused MKTEMP* variables
=20=20sstate: Add extra intercept functions
=20=20patchelf: Add patchelf recipe
=20=20populate_sdk_base: Remap TOOLCHAIN_HOST_TASK variable
=20=20oeqa/pasrselogs: Improve the machine/string whitelist
=20=20testimage: Add parselogs to the default tests for sato images
=20=20oeqa: xorg log test is being replaced by parselogs so remove

Robert Yang (11):
=20=20perl-native: fixed bad interpreter error
=20=20cpan.bbclass: matches more lines
=20=20ltp: fix RDEPENDS
=20=20meta: fix RDEPNEDS for the test related pkgs
=20=20valgrind/oprofile/systemd: no bashism in run-ptest
=20=20run-ptest: fix bashism
=20=20lsbtest: no bashism in LSB_Test.sh
=20=20sed: add sed to RDEPENDS sed-ptest
=20=20bootchart2: no bashism in bootchartd.in
=20=20python3-distribute: fix interpreter
=20=20qemu-native: depends on libxext-native when enable sdl

Roxana Ciobanu (4):
=20=20xf86-input-mouse: upgrade to 1.9.1
=20=20xkeyboard-config: upgrade to 2.12
=20=20hicolor-icon-theme: Upgrade to 0.13
=20=20ethtool: upgrade to 3.15

Shrikant Bobade (1):
=20=20autogen-native: inherit pkgconfig to fix a build failure

Tim Orling (1):
=20=20classes/cpan_build.bbclass: add EXTRA_CPAN_BUILD_FLAGS

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Chen Qi (2):
=20=20mariadb: add systemd unit file
=20=20apache2: add systemd unit file

Eduardo Silva (1):
=20=20monkey: new v1.5.3 release.

Hongxu Jia (1):
=20=20mariadb: change the group of /var/lib/mysql from 'nogroup' to 'mysql'.

Jackie Huang (1):
=20=20python-cython: add RDEPENDS on some required python modules

Kang Kai (1):
=20=20mariadb: upgrade from 5.5.38 to 39

Koen Kooi (4):
=20=20mkvtoolnix: update to 7.1.0+git
=20=20mkvtoolnix: enable parallel make
=20=20dracut: add 'getopt' to RDEPENDS
=20=20dracut: update to 038

Martin Jansa (3):
=20=20packagegroup*: set PACKAGE_ARCH before packagegroup inherit
=20=20e-wm: add efreet, evas-generic-loader-svg runtime recommendation
=20=20e-wm: add git recipe with latest revision

Otavio Salvador (1):
=20=20php: Fix native build due mistakenly linking against host's iconv

Sven Ebenfeld (1):
=20=20md5deep: Add recipe for md5deep package version 4.4

Tim Orling (2):
=20=20python-pyparted: fix rdeps for native
=20=20python-snakefood: add 1.4

Yasir Khan (1):
=20=20lmbench: add lmbench-exception LICENSE

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Koen Kooi (5):
=20=20angstrom-packagegroup-boot: switch PACKAGE_ARCH and inherit order
=20=20sysvinit bbappend: fix FILESEXTRAPATHS usage
=20=20angstrom-gpe-task-base: switch PACKAGE_ARCH and inherit order
=20=20angstrom-gpe-packagegroup-apps: switch PACKAGE_ARCH and inherit order
=20=20angstrom-x11-base-depends: switch PACKAGE_ARCH and inherit order

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Denys Dmytriyenko (4):
=20=20tslib: fix "unable to login" issue
=20=20images, packagegroups: don't build Qt for Keystone devices
=20=20cryptodev-module: fix autoloading issue with dashed module name
=20=20packagegroup-*-graphics: add weston packages globally

Franklin S. Cooper Jr (20):
=20=20libevdev: Add libdevdev which is a dependency for libinput
=20=20libinput: Add new library which is a optional dependency for Weston
=20=20weston: Pull in Weston 1.5.0 from oe-core master
=20=20wayland: Pull in wayland 1.5.0 from oe-core master
=20=20wayland/weston: Switch from tarball to git
=20=20weston: Move distro specific changes to meta-arago-distro
=20=20weston: Update commit used for weston 1.5.0
=20=20wayland: Updated commit for Wayland 1.5.0
=20=20arago-core-tisdk-image: Set DTB_FILTER for am57xx-evm
=20=20packagegroup-arago-qte: Add QtQuick when using Qt 5
=20=20matrix-gui-apps-git: Pull in new Matrix apps
=20=20packagegroup-arago-tisdk-matrix: Add new PM Governor HTML App
=20=20matrix-gui-submenus: Add Qt 5 submenu
=20=20matrix-gui: Update commit to remove border for HTML Matrix Apps
=20=20packagegroup-arago-tisdk-matrix: Switch between Qt 4 and Qt 5 Matrix =
Apps
=20=20packagegroup-arago-tisdk-matrix: Add PM governor Matrix App
=20=20packagegroup-arago-tisdk-matrix: Remove Wifi Matrix Apps
=20=20ti-tisdk-setup: Use AM57xx specific u-boot env script file
=20=20arago-core-tisdk-image: Work around SOC_FAMILY issue
=20=20matrix-gui-qt5-demos: Add Qt5 Matrix demos

Karthik Ramanan (1):
=20=20kmscube: Fixed incorrect DEPENDS

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
=20=20chromium: Add bbappend for GPU specific modifications and VPU support

Jacob Kroon (3):
=20=20glmark2: Move .bbappend to openembedded-layer collection
=20=20linux-imx-rt: Upgrade to 3.10.17-1.0.1
=20=20linux-imx-rt: Use 'performance' as default cpufreq governor

Khem Raj (1):
=20=20xf86-video-imxfb: Fix build with glibc 2.20

Otavio Salvador (3):
=20=20packagegroup-*: set PACKAGE_ARCH before packagegroup inherit
=20=20u-boot-fslc: Update to a824e89 revision
=20=20cairo: Drop 'class-target' use

Wang Zidan (2):
=20=20libfslcodec: Upgrade from version 3.0.11 to 4.0.1
=20=20libfslparser: Upgrade from version 3.0.11 to 4.0.1

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

Christoph Settgast (1):
=20=20linux-boundary (3.10.17): update to 62ef71f

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

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-igep:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Chan Wei Sern (1):
=20=20meta-crystalforest: Merge machine conf

Chang Rebecca Swee Fun (1):
=20=20meta-crystalforest: Update README with new build settings

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

Andrei Gherzan (1):
=20=20ofono: Use wildcard for bbappend

Holger Behrens (3):
=20=20packagegroup: Move PACKAGE_ARCH before inherit packagegroup
=20=20fuse: fix QA Issue unknown-configure-option
=20=20README.md: update to Intrepid

Yasir-Khan (1):
=20=20libitzam: correct LICENSE field

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
Changelog for meta-qt5:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-slugos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-systemd:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-raspberrypi:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

Martin Jansa (1):

Simon Busch (1):
=20=20meta-android: android-system: stop lxc container the hard way

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

Denys Dmytriyenko (1):
=20=20machine: clean up MACHINE_FEATURES for omap5, dra7, am57

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

Nathan Rossi (1):
=20=20u-boot-xlnx: Rename "_git" to "-dev" for master-next tracking recipe

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



