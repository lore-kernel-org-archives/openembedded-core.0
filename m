Return-Path: <cliff.brake@gmail.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id 4483E731CD;
	Tue,  1 Mar 2016 19:18:25 +0000 (UTC)
Received: by mail-qg0-f43.google.com with SMTP id b67so150458208qgb.1;
	Tue, 01 Mar 2016 11:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:mime-version:message-id:from:to:subject
	:content-transfer-encoding;
	bh=MxRVfkPCNY2DHGYPwCHfOEP5OF7ksq67+ZQSy3wOYYQ=;
	b=Hgy633NU3PWKb4CAzoGqxNXN2bCIAS/+G9vyZEzLQYn2PAT/slqDRSqaXWqQJeVJrM
	GH+lmvSAg33CWpbeEKvWZp5XrqovHnJ0cGUUMaRQeQfcbDwi7agoTDX1UouaUn5GJnkD
	kNyyZ7uly4IHCME6bPqbY1xML60ys1zbPzCg6GUatmtBlfwHjyFuTPj+2odyCfjw/dd8
	SYMJh+FQ+V71yQHwF0cQ7B8Gx9sYskhewWepayJDwSuK8FU7Hnsl0T39F7ACHKuUM+sw
	GxXwiQ3uxB54BbD2pXne7L+SSHz9FC3vmmPay+IEkRESIHvMKUVn1K7GEg/vFQQFCI2p
	p6Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:mime-version:message-id:from:to:subject
	:content-transfer-encoding;
	bh=MxRVfkPCNY2DHGYPwCHfOEP5OF7ksq67+ZQSy3wOYYQ=;
	b=gVZxchqUG8WOTggxASvR1XJMQJmMa7FmTGYsbH9lhbNb76BlvTjpWJJaNrSpksGLrK
	ra+4fd75+28RieW2j9Lao8ODFxUJOKHFDAYZhir4UPdz/gOPRTBIjDEmxdHOP/azmGdg
	lBGJPAuiMFDpqMoCEKrlVZUK/oLJ5xtmdiUWvUQBQHNQ9s4VaX4Jt7BFxipBwoXhAeXj
	yMYrHCkf3aj/LNOJAexrJV5vv4ZTs1BOntlM0kAnkkfRDeLTU779xd9ocRX/i6eYuGAi
	56JSzyaWkGl+PgWX2LhP2Md+1+DV39zH737xW/zC+JJfgPCN//DzZ7+K0jL3qW1yQvT0
	3ENg==
X-Gm-Message-State: AD7BkJKKTmLtjK1V8hCGvQpyQvRcsgV3XdErbv3HInm5XAc42GliVeUAODxOpPYUYWuxyQ==
X-Received: by 10.140.101.238 with SMTP id u101mr28704211qge.33.1456859906174; 
	Tue, 01 Mar 2016 11:18:26 -0800 (PST)
Received: from [127.0.0.1] (cable2-pool191-cs-134.doycomm.com.
	[66.219.191.134]) by smtp.gmail.com with ESMTPSA id
	w190sm13407267qhw.29.2016.03.01.11.18.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 Mar 2016 11:18:23 -0800 (PST)
Date: Tue, 01 Mar 2016 11:18:23 -0800 (PST)
X-Google-Original-Date: Tue, 01 Mar 2016 19:18:19 GMT
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Message-Id: <1456859899050.4da616a1@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
Subject: OE Changelog since 2016-02-21 until 2016-02-28
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
X-List-Received-Date: Tue, 01 Mar 2016 19:18:28 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2016-02-21 until 2016-02-28.  Projects included in this =
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

Belen Barros Pena (12):
=20=20toaster: comment out project release change
=20=20toaster: fix custom image name form
=20=20toaster: apply error class to name field
=20=20toaster: disable add layer button on click
=20=20toaster: reduce max height of modal dialogs
=20=20toaster: link to configuration in all breadcrumbs
=20=20toaster: make 'configuration' the first tab
=20=20toaster: adjust the search field width
=20=20toaster: add missing link to image recipe details
=20=20toaster: custom breadcrumb for the default project
=20=20toaster: rename 'run again' button
=20=20toaster: change 'delete layer' to 'remove layer'

Brendan Le Foll (2):
=20=20utils.py: Add sha1_file call
=20=20fetch2/npm: Add npm fetcher

Dave Lerner (2):
=20=20toaster: remove custom images from Image Recipes
=20=20toaster: fix banner after customimage package add

Elliot Smith (1):
=20=20toaster: show suffix for image files and basename for artifact files

Haris Okanovic (1):
=20=20prserv: Add dump_db()

Richard Purdie (7):
=20=20fetch2/npm: Add mirroring support for npm fetcher
=20=20fetch2/wget: Set localfile for directories
=20=20fetch2/__init__: Fix decodeurl to better handle urls without paths
=20=20fetch2/__init__.py: Error if lockfile path invalid
=20=20fetch2: Skip lockfiles and donestamps for local files
=20=20providers: Fix PREFERRED_VERSION lookup for '_' in PN
=20=20fetch2/npm: Enable fetcher

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Alex Franco (2):
=20=20testimage.bbclass: add generic, image test suites
=20=20testimage.bbclass: reuse generic test suites

Alexander Kanavin (19):
=20=20epiphany: update to 3.18.4
=20=20libfm: update to 1.2.4
=20=20pcmanfm: update to 1.2.4
=20=20nspr: update to 4.12
=20=20ffmpeg: update to 3.0
=20=20libsolv: update to 0.6.19
=20=20ccache: update to 3.2.4
=20=20clutter-gst-3.0: update to 3.0.16
=20=20gnupg: update to 2.1.11
=20=20git: update to 2.7.2
=20=20gtk-icon-utils-native: update to 3.18.8
=20=20gtk+3: update to 3.18.8
=20=20libdrm: update to 2.4.67
=20=20ncurses: update to revision 20160213
=20=20nettle: update to 3.2
=20=20pax-utils: update to 1.1.5
=20=20python-git: update to 1.0.2
=20=20vala: update to 0.30.1
=20=20shared-mime-info: update to 1.6

Andre McCurdy (19):
=20=20gstreamer1.0_git: update 1.7.1 -> 1.7.2
=20=20gstreamer1.0-plugins-base_git: update 1.7.1 -> 1.7.2
=20=20gstreamer1.0-plugins-good_git: update 1.7.1 -> 1.7.2
=20=20gstreamer1.0-plugins-bad_git: update 1.7.1 -> 1.7.2
=20=20gstreamer1.0-plugins-ugly_git: update 1.7.1 -> 1.7.2
=20=20gstreamer1.0-libav_git: update 1.7.1 -> 1.7.2
=20=20harfbuzz: update 1.2.0 -> 1.2.1
=20=20harfbuzz: add explicit dependency on fontconfig
=20=20glibc.inc: improve optimisation level sanity checking
=20=20boost.inc: limit ARM_INSTRUCTION_SET over-rides to armv4/armv5
=20=20gstreamer1.0-libav_git: add --ranlib option to =
LIBAV_EXTRA_CONFIGURE_COMMON_
=20=20gstreamer1.0-libav: move LIBAV_EXTRA_CONFIGURE_COMMON_ARG into .inc
=20=20gstreamer1.0.inc: add explicit PACKAGECONFIG init
=20=20gstreamer1.0-plugins-XXX: move inherit gettext into common .inc file
=20=20boost.inc: enable more verbose build logs
=20=20boost.inc: fix BJAM_OPTS --build-dir option
=20=20gstreamer1.0-plugins-XXX: control orc PACKAGECONFIG via GSTREAMER_ORC
=20=20dosfstools_2.11: fix build following removal of -e from EXTRA_OEMAKE
=20=20gstreamer1.0-plugins-bad.inc: enable webp PACKAGECONFIG by default

Andreas M=C3=BCller (1):
=20=20mesa: add missing space to RRECOMMENDS append

An=C3=ADbal Lim=C3=B3n (4):
=20=20classes/testsdk: Move code for avoid PATHs to oeqa.utils
=20=20classes/testsdk: Move the removal of bitbake PATH to eSDK context only
=20=20classes/testsdk: Pass tcname to SDK and SDKExt contexts
=20=20oeqa/sdkext: Add sdk_update.SDKUpdateTest class.

Brendan Le Foll (1):
=20=20npm.bbclass: Add npm class to match fetcher

Christopher Larson (1):
=20=20wic: don't throw away our created swap partition

Costin Constantin (1):
=20=20oe-selftest: Add support for lib/oeqa/selftest subdirectories

Cristina Agurida (1):
=20=20oeqa/parselogs: Updated whitelist

Daniel Istrate (1):
=20=20oeqa/selftest/signing: Added test for locked signatures

Dengke Du (1):
=20=20strace: fix ptest execution

Francisco Pedraza (2):
=20=20oeqa/utils: added new network module
=20=20oeqa/selftest/prservice: Added new TC: check pr-server starts and =
stop corre

Hongxu Jia (5):
=20=20depmodwrapper-cross: nopackages to avoid QA [buildpaths] issue
=20=20gcc: use relative path for configure script
=20=20bison/gettext: add --with-bisonlocaledir to assign BISON_LOCALEDIR
=20=20btrfs-tools: fix symlink creation multiple times
=20=20git: fix installed-vs-shipped QA Issue

Humberto Ibarra (2):
=20=20scripts/oe-selftest: Add filtering to the coverage data gathered by =
oe-selft
=20=20scripts/oe-selftest: Use site.USER_SITE to run coverage configuration =
code f

Ioan-Adrian Ratiu (2):
=20=20apr-util: fix loadable module packaging
=20=20apr-util: add ldap crypto and sqlite3 to PACKAGECONFIG

Jonathan Liu (2):
=20=20rootfs-postcommands: fix ssh_allow_empty_password checking
=20=20ffmpeg: add bzlib, lzma and xv PACKAGECONFIGs

Joshua Lock (3):
=20=20rpm: fix building rpm 5 with internal beecrypt
=20=20rsync: add native variant
=20=20os-release: sanitise VERSION_ID field

Juro Bystricky (1):
=20=20buildstats.bbclass: Don't assume /proc/<pid>/io present

Khem Raj (9):
=20=20security_flags: Disable ssp when compiling uclibc
=20=20uclibc: Do not use immediate expansion operator
=20=20systemd: Upgrade to 229
=20=20musl: Upgrade to 1.1.14
=20=20clutter-1.0: Fix confgure test errors found by clang
=20=20musl: Upgrade to 1.1.14
=20=20mesa: Fix build on musl
=20=20musl: Add linux-libc-headers to deps
=20=20gettext: Delete libintl.la file from install

Markus Lehtonen (2):
=20=20devtool: sync: update kernel config
=20=20devtool: update-recipe: create config fragment

Martin Borg (1):
=20=20automake: set test-driver path relative to top_builddir

Martin Donnelly (1):
=20=20perf: add sysroot handling to subcmd

Martin Jansa (1):
=20=20fontconfig: Don't add font directories from host

Maxin B. John (4):
=20=20alsa-lib: topology: Add missing include sys/stat.h
=20=20harfbuzz: update to version 1.2.0
=20=20libdrm: fix build with uclibc
=20=20uclibc support for rng-tools

Paul Eggleton (14):
=20=20devtool: add: tweak auto-determining name failure message
=20=20devtool: modify: fix source tree default name when mapping virtuals
=20=20devtool: upgrade: make source tree path optional
=20=20devtool: upgrade: drop superfluous call to validate_pn
=20=20devtool: upgrade: fix version argument checking
=20=20devtool: upgrade: fix moving version-specific files directory
=20=20devtool: upgrade: fix renaming of recipe if PV is not in name
=20=20devtool: upgrade: fix constructing new branch from tarball releases
=20=20devtool: upgrade: fix several issues with extraction of new source
=20=20devtool: upgrade: eliminate unnecessary datastore copy
=20=20devtool: upgrade: drop PR on upgrade
=20=20devtool: upgrade: print new recipe name
=20=20oe-selftest: devtool: rework devtool upgrade test
=20=20oe-selftest: devtool: add an additional test for devtool upgrade

Philip Tricca (1):
=20=20sysvinit-inittab: Move start_getty scrip to base_bindir.

Randy Witt (2):
=20=20signing-keys: Make signing keys the only publisher of keys
=20=20populate_sdk_ext: Add images to SDK_INSTALL_TARGETS

Richard Purdie (8):
=20=20libsdl2: Fix patch after upgrade
=20=20image: Run do_rootfs_wicenv after do_image
=20=20sanity: Improve configuration upgrade capabilities (support =
meta-yocto -> po
=20=20adt-installer: Drop since its replaced by the extensible SDK
=20=20base: Add nodejs-native dependency for npm:// urls
=20=20mirrors/own-mirrors/sanity: Updates after npm fetcher addition
=20=20pseudo: Increase number of retries
=20=20bblayers.conf.sample: Fix missing layer version bump

Richard Tollerton (1):
=20=20tune-cortexa9.inc: add vfpv3 tunes

Robert Yang (2):
=20=20image-live/boot-directdisk.bbclass: remove AUTO_SYSLINUXCFG
=20=20boot-directdisk.bbclass: drop IS_VM chechking

Ross Burton (10):
=20=20findutils: upgrade to 4.6.0
=20=20bitbake.conf: add findutils-native to ASSUME_PROVIDED
=20=20oeqa/selftest/buildoptions: build -minimal instead of -sato images
=20=20package: check inherit instead of PN to decide if a recipe is a =
packagegroup
=20=20lib/oe/qa: add explicit exception for 'file isn't an ELF'
=20=20uninative: use check_output instead of Popen directly
=20=20uninative.bbclass: if the loader can't be found disable instead of =
failing
=20=20gtk-doc-stub: don't inherit autotools
=20=20gconf: remove redundant dependencies
=20=20uninative-tarball: respect SDKMACHINE when building

Tomas Novotny (1):
=20=20systemctl: handle RequiredBy dependencies

Tudor Florea (3):
=20=20liburcu: add support for aarch64_be
=20=20lttng-ust: add support for aarch64_be
=20=20core-tools-profile: add lttng tools for aarch64

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Alejandro Joya (1):
=20=20toybox: upgrade to 0.7.0

Alexander Kanavin (2):
=20=20libgdata: update to 0.16.1
=20=20tracker: fix packaging issues

Anders Darander (1):
=20=20python-werkzeug: add required RDEPENDS

Andrea Adami (6):
=20=20linux-yocto-tiny-kexecboot: upgrade to 4.4
=20=20klibc_2.0.4: update to 4d1997d - Fix build for qemux86
=20=20klibc_2.0.4: Silence QA Error about non-symlink so [dev-elf]
=20=20klibc_2.0.4: Silence Warning about klibc-xxx-so already stripped
=20=20klibc: fix sh deps ver (PR is needed after PV)
=20=20linux-yocto-tiny-kexecboot: disable do_shared_workdir task

Andreas M=C3=BCller (13):
=20=20lxdm: update to 0.5.3
=20=20xfce4-whiskermenu-plugin: update to 1.5.2
=20=20source-han-sans-cn-fonts: initial add 1.004
=20=20source-han-sans-jp-fonts: initial add 1.004
=20=20source-han-sans-kr-fonts: initial add 1.004
=20=20source-han-sans-tw-fonts: initial add 1.004
=20=20libsdl2-image: update to 2.0.1
=20=20libsdl-ttf: update to 2.0.11
=20=20libsdl2-ttf: update to 2.0.14
=20=20libsdl2-mixer: initial add 2.0.1
=20=20xfce4-panel: make date/time plugins handle timezone changes properly
=20=20xfce4-xkb-plugin: update to 0.7.1
=20=20ne10: fix parsing

Armin Kuster (4):
=20=20ntp: update 4.2.8p6
=20=20krb5: Fix build warning
=20=20xdelta3: Package update to 3.0.11
=20=20lssci: Add package

Baptiste DURAND (1):
=20=20minidlna: 1.1.4 -> 1.1.5

Carlos Rafael Giani (2):
=20=20libopus: upgrade to version 1.1.2
=20=20ne10: add recipe

Derek Straka (16):
=20=20Update pypi classes to avoid setuptools inherit to be more flexible
=20=20Update python3 recipes to use the updated pypi class
=20=20Update python recipes to use the updated pypi class
=20=20Update python recipes to use the common pypi package
=20=20nginx: update to 1.9.11
=20=20python-ujson: update to 0.35
=20=20python-flufl-enum: update to 4.1
=20=20python-enum34: update to 1.1.2
=20=20python-feedparser: update to 5.2.1
=20=20python-prettytable: fix fetch issues in divergent pypi url pattern
=20=20python-mccabe: update to 0.4.0
=20=20python-pyflakes: update to 1.0.0
=20=20python-mock: update to 1.3.0
=20=20python-monotonic: update to 0.6
=20=20python-msgpack: update to 0.4.7
=20=20python-pyserial: update to 3.0.1

Diego Rondini (1):
=20=20webmin: adjust mysql module default config

Fabio Berton (3):
=20=20lldpd: Update to version 0.9.0
=20=20fio: Remove --disable-static from EXTRA_OECONF
=20=20testfloat: Add recipe for version 3a

Jackie Huang (1):
=20=20libsmi: fix the test dump files

Joe MacDonald (4):
=20=20samba: Fix build when static libs disabled
=20=20libldb: Fix build when static libs disabled
=20=20dnrd: blacklist
=20=20iscsitarget: blacklist

Maciej Borzecki (2):
=20=20lua: use PV for generating Version in lua.pc
=20=20lua: update Libs in lua.pc

Martin Jansa (30):
=20=20dovecot: Blacklist
=20=20curlpp: Blacklist
=20=20znc: Blacklist
=20=20squid: Blacklist
=20=20snort: Blacklist
=20=20libmms: upgrade to 0.6.4
=20=20llvm: move BugpointPasses.so and LLVMHello.so to separate packages
=20=20gtk-theme-torturer: Blacklist
=20=20gnome-themes: Blacklist
=20=20fakeroot: Blacklist
=20=20cunit: Blacklist
=20=20mpich: Blacklist
=20=20xerces-c: Blacklist
=20=20tesseract: Blacklist
=20=20wayland-fits: Blacklist
=20=20libtinyxml2: drop trailing continuation character in do_compile
=20=20gtkmathview, abiword: Blacklist
=20=20source-han-sans-*-fonts: exclude fontconfig dependency with =
SIGGEN_EXCLUDE_S
=20=20xfce4-vala: unbreak by telling configure new vala API version
=20=20libnice, farsight2, pidgin: Blacklist because libnice's nice.pc
=20=20msr-tools: Explicitly set EXTRA_OEMAKE as required
=20=20concurrencykit: drop trailing continuation character in do_configure
=20=20zsh: fold .inc into .bb
=20=20freerdp: fold .inc into .bb
=20=20uim: fix packaging issues
=20=20zsh: Explicitly set EXTRA_OEMAKE as required
=20=20geis: add missing dependency on virtual/libx11 libxext libxi libxcb =
dbus fra
=20=20efivar: blacklist until nvme_ioctl.h issues are resolved
=20=20efibootmgr: blacklist, depends on blacklisted efivar
=20=20freerdp: Fix QA warning when no binaries are built

Mike Crowe (8):
=20=20vpnc: Explicitly set EXTRA_OEMAKE as required
=20=20pimd: Explicitly set EXTRA_OEMAKE as required
=20=20pptp-linux: Explicitly set EXTRA_OEMAKE as required
=20=20vsftpd: Explicitly set EXTRA_OEMAKE as required
=20=20vlan: Explicitly set EXTRA_OEMAKE as required
=20=20libmatroska: Explicitly set EXTRA_OEMAKE as required
=20=20system-setup-keyboard: Explicitly set EXTRA_OEMAKE as required
=20=20wmiconfig: Explicitly set EXTRA_OEMAKE as required

Mingli Yu (2):
=20=20netkit-telnet: Add to generate telnetlogin.
=20=20netkit-rsh: add two patches and some fixes.

Otavio Salvador (1):
=20=20dt: Add 18.32 recipe

Philip Balister (5):
=20=20libsodium: Update to version 1.0.8.
=20=20Convert the DESCRIPTION tag to a SUMMARY tag for short summaries.
=20=20zeromq: Update to 4.1.4.
=20=20cppzmq: Bump rev.
=20=20log4cpp: Fix build system path in pkgconfig file QA failure.

Qi.Chen@windriver.com (1):
=20=20yaffs2-utils: set EXTRA_OEMAKE as required

Rafa=C3=ABl Carr=C3=A9 (2):
=20=20vlc: make x11 DISTRO_FEATURE optional (enabled by default)
=20=20vlc: make sdl optional (enabled by default)

Richard Purdie (10):
=20=20libtevent: Fix build when static libs disabled
=20=20libtdb: Fix build when static libs disabled
=20=20libtalloc: Fix build when static libs disabled
=20=20gthumb: Fix to work with disabled static libs
=20=20mongodb: Fix to work with disabled static libs
=20=20poppler-data: Fix to work with changed makeflags
=20=20monkey: Fix to work with disabled static libs
=20=20xmlstarlet: Disable PARALLEL_MAKE
=20=20soci: Fix build when static libs disabled
=20=20nginx: Fix build when static libs disabled

S. Lockwood-Childs (1):
=20=20python-tornado-redis: add recipe

Stephano Cetola (1):
=20=20fix missing packageconfig for samba with sysvinit

Stephen Arnold (1):
=20=20net-snmp: fix cross-compile breakage, add libnl pkgconfig option

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Denys Dmytriyenko (3):
=20=20external-linaro-toolchain: strip libraries and binaries normally
=20=20u-boot-fw-utils: add HS support
=20=20ltp-ddt: fix handling of HS platforms

Gou, Hongmei (1):
=20=20arago-source-ipk: add SRCIPK for vlib-c66x

Jacob Stiffler (10):
=20=20openmpacc: Add clacc, the OpenMP-Acc compiler
=20=20openmpacc: Add OpenMP-Acc library
=20=20openmpacc-examples: Add the OpenMP-Acc examples
=20=20arago-source-ipk: Enable openmpacc-examples source ipk
=20=20packagegroup-arago-tisdk-addons*: Integrate openmpacc into the SDK
=20=20nativesdk-packagegroup-arago-sdk-host: Add clacc to the devkit
=20=20ti-tisdk-makefile: Add openmpacc-examples target
=20=20mtd-utils: Extend to include the nativesdk class
=20=20nativesdk-packagegroup-arago-sdk-host: Include ubifs utils
=20=20ti-tisdk-makefile: Add new AM5 DTBs

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-atmel:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-beagleboard:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-browser:

Jason Plum (2):
=20=20Firefox: firefox 38.6.1esr
=20=20Fix checksums missed in Firefox 38.6.1esr update.

Otavio Salvador (2):
=20=20Merge pull request #5 from WarheadsSE/firefox-38.6.1esr
=20=20Merge pull request #6 from =
WarheadsSE/firefox-l10n-38.6.1esr-license-checksu

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

Javier Viguera (2):
=20=20gst1.0-fsl-plugin: remove not needed patch
=20=20gst1.0-fsl-plugin: add STAGING_KERNEL_BUILDDIR to the include dirs =
list

Neena Busireddy (1):
=20=20weston: Fix issues with 1.9 version

Otavio Salvador (1):
=20=20linux-fslc-imx: Upgrade to the 3.14.52-1.1.0 GA based fork

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

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-igep:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

California Sullivan (3):
=20=20linux-yocto: add bbappends for 4.4 kernels
=20=20machine: update PREFERRED_VERSION to 4.4 for intel-core* and =
intel-quark
=20=20machine: move PREFERRED_VERSION/PREFERRED_PROVIDER to meta-intel.inc

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

Alex J Lennon (2):
=20=20mono: add support for 4.3.2.467
=20=20README: update testing of 4.3.2.467 on qemux86

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-netbookpro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nodejs:

Ilkka Myller (1):
=20=202016-02-23, Version 5.7.0 (Stable)

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nslu2:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-opie:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-qt3:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-qt5:

Martin Jansa (1):
=20=20libconnman-qt5: Blacklist because of connman-qt5.pc

Paul Eggleton (1):
=20=20recipetool: add support for Qt5 to meta-qt5

Samuli Piippo (1):
=20=20qtbase: add runtime dependency to xkeyboard-config

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

Denys Dmytriyenko (5):
=20=20linux-ti-staging: update with platform merge, new AM5 DTBs
=20=20u-boot-ti-staging: add support for DRA7 and AM4 secure devices
=20=20prueth-fw: add firmware images for PRU Ethernet on AM57xx
=20=20linux-ti-staging: rdepends on prueth-fw
=20=20linux-ti-staging: update with latest fixes, set dra7xx-hs-evm DTBs

Gou, Hongmei (1):
=20=20vlib-c66x: add version 3.2.1.0

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

Manjukumar Matha (1):
=20=20linux-xlnx_4.4: Xilinx linux v4.4 release

Nathan Rossi (1):
=20=20external-xilinx-toolchain.bb: Fix usage of getVar()

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Alejandro Hernandez (1):
=20=20genericx86-common: Update PREFERRED_VERSION_linux-yocto to 4.4

Richard Purdie (1):
=20=20meta-yocto: Rename to meta-poky to better match its purpose

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



