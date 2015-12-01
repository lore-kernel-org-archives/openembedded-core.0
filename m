Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id D268E6B6F5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Dec 2015 15:23:52 +0000 (UTC)
Received: by wmec201 with SMTP id c201so210653020wme.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Dec 2015 07:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=SXoYrHaJfXjSUT0jePqfUHOvjlA/aXdRirzxS9alaa0=;
	b=ZbTPqV7rT1SAPSJpp643qrR6r4/LfZS/Cs9/B1HZG3K5sn12uuJinpuiWnw65Issaa
	rlGSbX7vg11xbIijGRWspXxXgjUeUy+rolS6NcP6tdbn/aMz7mBzE7K+HQJRKaxXgfMS
	ccyxDZAWYsA68e35i4IwZgBWxHiDC5uPcn30b0syeXQmJUzGiiOwn080GbLRjT4iNBGi
	Z9rQcmwUXfe4YGKDklin52Y3x68kj9yddHGSkfRF247NIbZHQ2OmiNkZ2Bd69HUEDy1t
	vCcN88ivajt902wXeTnLar3Dgyt2ERHJan413HuDMl/HDd9keFOXHPwk2iGgNQ66PR2F
	uUkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-type:content-transfer-encoding;
	bh=SXoYrHaJfXjSUT0jePqfUHOvjlA/aXdRirzxS9alaa0=;
	b=j+WCtUySGSuI7qupVGi6VbETZjp5yt2s8Gh4hvAJI4vYQkU7Y41nzuAI0ap6p6CMvo
	Q/W46pcbAXHb7WlKtkPCxxPC4F+bE6meB9a1NeFOs9YBmEMqEOOB9lBo/AoFsAAJ6Q9A
	ihULFj76v2QIXnzQSNwDIlPRGqOtVqX3e0MjcQ5pKoBrmmsrc4aDYC10udy8j4B7wUY0
	abymTfPxsmXb14cnhXYq0vpNLahNA5g2I20UuBYMRfh6CNfpkV51YwUbxcqAK4G/ifLv
	XOnuCEsDKTti9sRzXiMtUEV9arSzJEs3cmEkLHcYl1iiXLOhKUT1oSDTHIl9DWNAEVgn
	r99A==
X-Gm-Message-State: ALoCoQnpDenB8NceSzzar4fRe2nVk2d7f1xUmQbG7EeJioCX6+y/VT/XKNZpKUNCIsU6cvtqt/wh
X-Received: by 10.194.88.200 with SMTP id bi8mr32461379wjb.178.1448983432743; 
	Tue, 01 Dec 2015 07:23:52 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	u185sm26655475wmu.19.2015.12.01.07.23.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 01 Dec 2015 07:23:41 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Dec 2015 15:23:39 +0000
Message-Id: <cover.1448983081.git.ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCH 000/135] Consolidated pull
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
X-List-Received-Date: Tue, 01 Dec 2015 15:23:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

Another consolidated pull after testing.  All green on the AB.

Ross


The following changes since commit 03f15e51998a3ef65a5b68cb7cbf724f4388c289:

  sstate: Ensure siginfo and sig files are also touched (2015-11-25 08:09:00 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ross/mut

for you to fetch changes up to 8af29599123b31f07aecc48d975c96c090c9396c:

  libsdl: remove redundant configure_tweak patch (2015-12-01 14:44:08 +0000)

----------------------------------------------------------------
Alejandro Hernandez (2):
      python3: Upgrade from 3.4.3 to 3.5
      python3: fix building nativesdk-python3

Andre McCurdy (15):
      directfb.inc: force bfd linker for armv7a
      libxml2: remove legacy LDFLAGS += "-ldl" workaround
      sqlite3: update 3.9.0 -> 3.9.2
      harfbuzz: update 1.0.6 -> 1.1.0
      busybox_git: Enable getopt applet
      busybox.inc: don't export EXTRA_OEMAKE
      busybox: move EXTRA_OEMAKE etc into busybox.inc
      busybox.inc: don't set .config CROSS_COMPILER_PREFIX
      busybox.inc: fix CONFIG_EXTRA_CFLAGS configmangle
      busybox.inc: set CC=${CC} via make command line
      busybox.inc: remove '-e MAKEFLAGS=' from EXTRA_OEMAKE
      busybox: re-order defconfig to align with busybox 1.24.1
      busybox: update 1.23.2 -> 1.24.1
      busybox: disable support for mounting NFS file systems on Linux < 2.6.23
      busybox: enable resize applet

Andrew Shadura (1):
      dbus: merge .bb and .inc

Aníbal Limón (2):
      dev-manual: Fix errata in new kvm-vhost.
      classes/sstate.bbclass: checkhashes modify to take into account siginfo.

Bhuvanchandra DV (1):
      linux-firmware: rtl8192cx: Add latest available firmware

Bogdan-Alexandru Voiculescu (1):
      uClibc: enable utmp for shadow compatibility

Bruce Ashfield (4):
      linux-yocto/4.1: update to v4.1.13
      linux-yocto/4.1: fsl-mpc8315e-rdb: Enable EEPROM
      linux-yocto-rt/4.1: update to -rt15
      linux-yocto/4.1: Bluetooth:Fix the connection fail of 6lowpan over BT LE

Dariusz Pelowski (1):
      lib/oe/terminal: use C locale when determining version

Ed Bartosh (1):
      wic: exec_native_cmd: implement support for pseudo

Fan Xin (1):
      wpa-supplicant: upgrade to 2.5

George Nita (1):
      toolchain-shar-extract.sh: Ensure it's ran in clean environment

Haris Okanovic (1):
      populate_sdk_base: Add sysroot symlink check

Jean-Francois Dagenais (1):
      toolchain-shar-relocate: don't assume last state of env_setup_script is good

Juro Bystricky (1):
      psplash: update to latest git version

Jussi Kukkonen (4):
      mesa: Make gl libraries RRECOMMEND mesa-megadriver
      pulseaudio: Fix HDMI profile selection
      gcr: Require x11 DISTRO_FEATURE
      gudev: Add from meta-oe

Khem Raj (2):
      runqemu-internal: Replace wacom-tablet with tablet for usbdevice
      ruby-native: Depend on openssl-native

Leonardo Sandoval (1):
      oe-selftest: Enable code coverage on unit tests

Li Xin (1):
      glibc: Backported a patch to fix glibc's bug(18589)

Li Zhou (1):
      rpcbind: Security Advisory - rpcbind - CVE-2015-7236

Mariano Lopez (6):
      license.bbclass: Write recipeinfo file in license folder
      license.bbclass: Split license create manifest
      license.bbclass: Added get_boot_dependencies function
      license.bbclass: Added function get_deployed_dependencies
      license.bbclass: Add function get_deployed_files
      license.bbclass: Create image license manifest

Mark Hatle (1):
      populate_sdk_ext.bbclass: Be more permissive on the name of the buildtools

Martin Jansa (8):
      package_manager.py: define info_dir and status_file when OPKGLIBDIR isn't the default
      meta/conf/machine: use ' inside quoted values
      icu: force arm mode
      guile, mailx, gcc, opensp, gstreamer1.0-libav, libunwind: disable thumb where it fails for qemuarm
      gstreamer1.0-plugins-base: add PACKAGECONFIG for libvisual
      gst-plugins-bad: improve FILES variables
      gstreamer1.0-plugins-bad: fix dependencies for uvch264 PACKAGECONFIG
      gstreamer1.0-plugins-good: fix PACKAGECONFIG for gudev and add one for v4l2 and libv4l2

Maxin B. John (12):
      iproute2: update to 4.3.0
      apr-util: add missing RDEPENDS for ptest
      libpcap: update to 1.7.4
      orc: update to 0.4.24
      libpng: update to 1.6.19
      libpng12: update to 1.2.54
      libtasn1: upgrade to 4.7
      libunistring: upgrade to version 0.9.6
      ofono: upgrade to version 1.17
      pkgconfig: upgrade to version 0.29
      ncurses: update SRC_URI
      iw: upgrade to version 4.3

Mike Crowe (2):
      image.py: Avoid creating empty .env file in _write_wic_env
      image.py: avoid mkdir race when building multiple images

Ming Liu (1):
      initscripts: hide the error in case system is not writeable

Nathan Lynch (1):
      lttng-tools: add libgcc to RDEPENDS

Ng, Mei Yeen (2):
      init-install-efi: fix script for gummiboot loader
      init-install-efi: fix script for eMMC installation

Otavio Salvador (5):
      lttng-modules: Upgrade to 2.7 release
      lttng-ust: Upgrade to 2.7 release
      lttng-tools: Drop unused patch
      lttng-tools: Upgrade to 2.7 release
      xf86-video-vmware: Add vmwgfx PACKAGECONFIG option

Patrick Ohly (1):
      buildhistory.bbclass: support extending the content of the build history

Paul Eggleton (25):
      classes/populate_sdk_ext: tidy up preparation log file writing
      classes/populate_sdk_ext: make it clear when SDK installation has failed
      classes/populate_sdk_ext: tweak reporting of workspace exclusion
      classes/populate_sdk_ext: fail if SDK_ARCH != BUILD_ARCH
      scripts/gen-lockedsig-cache: improve output
      toolchain-shar-extract.sh: do not allow $ in paths for ext SDK
      devtool: upgrade: fix removing other recipes from workspace on reset
      devtool: upgrade: fix updating PV and SRCREV
      devtool: upgrade: remove erroneous error when not renaming recipe
      devtool: upgrade: fetch remote repository before checking out new revision
      devtool: upgrade: provide a means to update the source branch
      lib/oe/patch: improve extraction of patch header
      devtool: disable creating workspace for extract and search subcommands
      devtool: package: use DEPLOY_DIR_<pkgtype> to get deploy directory
      devtool: drop unused plugin_init() functions
      devtool: search: print SUMMARY value
      devtool: ensure we change back to the original dir on error
      lib/oe/recipeutils: check in validate_pn() for names instead of filenames
      devtool: build: use bbappend to set PARALLEL_MAKE
      devtool: build: enable showing default task in help
      devtool: clarify help text
      lib/oe/recipeutils: refactor patch_recipe_file() to use edit_metadata()
      recipetool: add setvar subcommand
      recipetool: make plugin registration function name consistent with devtool
      nativesdk-buildtools-perl-dummy: fix rebuilding when SDKMACHINE changes

Peter Seebach (1):
      glibc/0029-fix-getmnt-empty-lines.patch: fix getmntent()

Petter Mabäcker (3):
      create-pull-request: handle empty ODIR
      readline: prepare for readline6.3 upstream patches
      readline: apply missing upstream patches

Ricardo Ribalda Delgado (1):
      python-git: Add missing dependency

Robert Yang (5):
      boot-directdisk.bbclass: remove HDDIMG before create
      db: fix race issue for libdb-6.0.la
      apr: fix LTFLAGS to make it work with ccache
      rpm: fix for N32 MIPS64
      lsb: fix installed-vs-shipped for mips

Ross Burton (12):
      base: decode SRC_URI before adding implicit fetch dependencies
      base: add automatic dependency on lzip-native for .lz SRC_URI
      oeqa/qemurunner: pass nographic to runqemu if DISPLAY isn't set
      sanity: don't enforce DISPLAY for testimage
      oeqa/runtime/multilib: refactor ELF class extraction
      oeqa/sshcontrol: don't source profile
      pango: use ptest-gnome
      pkgconfig: merge .bb and .inc
      openssl: enable parallel make
      libxml2: merge pointless bb/inc split
      libxml2: upgrade to 2.9.3
      libsdl: remove redundant configure_tweak patch

Roy Li (2):
      iproute2: install bridge tool by default
      openssh: redesign ssh-agent.sh regression test case

Saul Wold (1):
      sysvinit-inittab: Add wrapper script to verify console exists

Tzu-Jung Lee (1):
      devtool: include do_patch in SRCTREECOVEREDTASKS

Wenzong Fan (2):
      subversion: fix CVE-2015-3184
      subversion: fix CVE-2015-3187

Yi Zhao (1):
      libsdl2: add missing dependency on libxkbcommon for PACKAGECONFIG[wayland]

 documentation/dev-manual/dev-manual-qemu.xml       |    8 +-
 meta/classes/base.bbclass                          |   71 +-
 meta/classes/boot-directdisk.bbclass               |    2 +
 meta/classes/buildhistory.bbclass                  |   13 +-
 meta/classes/distutils3-base.bbclass               |    2 +-
 meta/classes/distutils3-native-base.bbclass        |    2 +-
 meta/classes/license.bbclass                       |  208 +-
 meta/classes/populate_sdk_base.bbclass             |   53 +-
 meta/classes/populate_sdk_ext.bbclass              |   15 +-
 meta/classes/python3native.bbclass                 |    2 +-
 meta/classes/sanity.bbclass                        |    8 -
 meta/classes/sstate.bbclass                        |    7 +-
 meta/conf/machine/include/arm/arch-arm.inc         |    4 +-
 meta/conf/machine/include/arm/arch-arm64.inc       |   14 +-
 meta/conf/machine/include/arm/arch-armv4.inc       |   10 +-
 meta/conf/machine/include/arm/arch-armv5-dsp.inc   |    2 +-
 meta/conf/machine/include/arm/arch-armv5.inc       |    6 +-
 meta/conf/machine/include/arm/arch-armv6.inc       |    4 +-
 meta/conf/machine/include/arm/arch-armv7a.inc      |    4 +-
 meta/conf/machine/include/arm/feature-arm-neon.inc |    4 +-
 meta/conf/machine/include/arm/feature-arm-vfp.inc  |   16 +-
 meta/conf/machine/include/mips/arch-mips.inc       |   24 +-
 meta/conf/machine/include/powerpc/arch-powerpc.inc |   10 +-
 .../machine/include/powerpc/arch-powerpc64.inc     |    4 +-
 meta/conf/machine/include/sh/arch-sh.inc           |    2 +-
 meta/conf/machine/include/tune-arm1136jf-s.inc     |    2 +-
 meta/conf/machine/include/tune-arm920t.inc         |    2 +-
 meta/conf/machine/include/tune-arm926ejs.inc       |    2 +-
 meta/conf/machine/include/tune-arm9tdmi.inc        |    2 +-
 meta/conf/machine/include/tune-c3.inc              |    2 +-
 meta/conf/machine/include/tune-core2.inc           |    2 +-
 meta/conf/machine/include/tune-corei7.inc          |    2 +-
 meta/conf/machine/include/tune-cortexa15.inc       |    2 +-
 meta/conf/machine/include/tune-cortexa17.inc       |    2 +-
 meta/conf/machine/include/tune-cortexa5.inc        |    2 +-
 meta/conf/machine/include/tune-cortexa7.inc        |    2 +-
 meta/conf/machine/include/tune-cortexa8.inc        |    2 +-
 meta/conf/machine/include/tune-cortexa9.inc        |    2 +-
 meta/conf/machine/include/tune-cortexm1.inc        |    2 +-
 meta/conf/machine/include/tune-cortexm3.inc        |    4 +-
 meta/conf/machine/include/tune-cortexr4.inc        |    4 +-
 meta/conf/machine/include/tune-ep9312.inc          |    2 +-
 meta/conf/machine/include/tune-i586-nlp.inc        |    2 +-
 meta/conf/machine/include/tune-i586.inc            |    2 +-
 meta/conf/machine/include/tune-iwmmxt.inc          |    2 +-
 meta/conf/machine/include/tune-mips32.inc          |    2 +-
 meta/conf/machine/include/tune-mips32r2.inc        |    2 +-
 meta/conf/machine/include/tune-octeon.inc          |    4 +-
 meta/conf/machine/include/tune-power5.inc          |    6 +-
 meta/conf/machine/include/tune-power6.inc          |    6 +-
 meta/conf/machine/include/tune-power7.inc          |    6 +-
 meta/conf/machine/include/tune-ppc476.inc          |    4 +-
 meta/conf/machine/include/tune-ppc603e.inc         |    4 +-
 meta/conf/machine/include/tune-ppc7400.inc         |    4 +-
 meta/conf/machine/include/tune-ppce300c2.inc       |    2 +-
 meta/conf/machine/include/tune-ppce300c3.inc       |    6 +-
 meta/conf/machine/include/tune-ppce500.inc         |    8 +-
 meta/conf/machine/include/tune-ppce500mc.inc       |    4 +-
 meta/conf/machine/include/tune-ppce500v2.inc       |    8 +-
 meta/conf/machine/include/tune-ppce5500.inc        |    4 +-
 meta/conf/machine/include/tune-ppce6500.inc        |    6 +-
 meta/conf/machine/include/tune-sh3.inc             |    2 +-
 meta/conf/machine/include/tune-sh4.inc             |    4 +-
 meta/conf/machine/include/tune-strongarm1100.inc   |    2 +-
 meta/conf/machine/include/tune-thunderx.inc        |    2 +-
 meta/conf/machine/include/tune-xscale.inc          |    2 +-
 meta/conf/machine/include/x86/arch-x86.inc         |   20 +-
 meta/files/toolchain-shar-extract.sh               |    6 +-
 meta/files/toolchain-shar-relocate.sh              |    2 +
 meta/lib/oe/copy_buildsystem.py                    |    5 +-
 meta/lib/oe/image.py                               |    9 +-
 meta/lib/oe/package_manager.py                     |   19 +
 meta/lib/oe/patch.py                               |   58 +-
 meta/lib/oe/recipeutils.py                         |  162 +-
 meta/lib/oe/terminal.py                            |    4 +-
 meta/lib/oeqa/runtime/multilib.py                  |   32 +-
 meta/lib/oeqa/selftest/devtool.py                  |    8 +-
 meta/lib/oeqa/utils/qemurunner.py                  |   12 +-
 meta/lib/oeqa/utils/sshcontrol.py                  |    3 +-
 meta/recipes-connectivity/iproute2/iproute2.inc    |    2 +-
 .../{iproute2_4.1.1.bb => iproute2_4.3.0.bb}       |    4 +-
 ....sh-don-t-use-git-describe-for-versioning.patch |   20 +-
 .../iw/iw/separate-objdir.patch                    |   36 +-
 .../iw/{iw_4.1.bb => iw_4.3.bb}                    |    4 +-
 meta/recipes-connectivity/libpcap/libpcap.inc      |    2 +-
 .../libpcap/{libpcap_1.6.2.bb => libpcap_1.7.4.bb} |    4 +-
 ...cktrace-Disable-for-non-glibc-C-libraries.patch |   40 -
 meta/recipes-connectivity/ofono/ofono_1.16.bb      |   12 -
 meta/recipes-connectivity/ofono/ofono_1.17.bb      |   11 +
 .../recipes-connectivity/openssh/openssh/run-ptest |   37 +
 .../recipes-connectivity/openssl/openssl_1.0.2d.bb |    3 -
 ...integer-underflow-in-WMM-Action-frame-par.patch |   45 -
 ...r-Fix-payload-length-validation-for-Commi.patch |   77 -
 ...e-SSID-element-length-before-copying-it-C.patch |   47 -
 ...Fix-HTTP-chunked-transfer-encoding-parser.patch |   53 -
 ...ver-Fix-payload-length-validation-for-Com.patch |   70 -
 ...r-Fix-Total-Length-parsing-for-fragment-r.patch |   56 -
 ...ver-Fix-Total-Length-parsing-for-fragment.patch |   54 -
 ...eer-Fix-asymmetric-fragmentation-behavior.patch |   36 -
 ...wpa-supplicant_2.4.bb => wpa-supplicant_2.5.bb} |   20 +-
 meta/recipes-core/busybox/busybox.inc              |   16 +-
 .../busybox/0001-Switch-to-POSIX-utmpx-API.patch   |  388 ----
 .../busybox/busybox/0001-chown-fix-help-text.patch |   34 -
 ...ix-double-free-fatal-error-in-INET_sprint.patch |   67 -
 meta/recipes-core/busybox/busybox/defconfig        |   63 +-
 meta/recipes-core/busybox/busybox/resize.cfg       |    2 +
 .../{busybox_1.23.2.bb => busybox_1.24.1.bb}       |   16 +-
 meta/recipes-core/busybox/busybox_git.bb           |   18 +-
 meta/recipes-core/dbus/dbus.inc                    |  170 --
 meta/recipes-core/dbus/dbus_1.8.20.bb              |  171 +-
 .../glibc/0029-fix-getmntent-empty-lines.patch     |   40 +
 ...ove-incorrect-STRDIFF-based-optimization-.patch |  323 +++
 meta/recipes-core/glibc/glibc_2.22.bb              |    2 +
 .../initrdscripts/files/init-install-efi.sh        |    9 +-
 .../initscripts/initscripts-1.0/save-rtc.sh        |    2 +-
 ...19-Enforce-the-reader-to-run-in-constant-.patch |  181 --
 ...ine-pthread-definitions-for-glibc-complia.patch |   32 -
 .../72a46a519ce7326d9a00f0b6a7f2a8e958cd1675.patch |   30 -
 .../libxml/libxml2/CVE-2015-7942.patch             |   55 -
 .../libxml/libxml2/CVE-2015-8035.patch             |   41 -
 meta/recipes-core/libxml/libxml2/ansidecl.patch    |   22 +-
 .../libxml/libxml2/libxml2-CVE-2014-0191-fix.patch |   37 -
 meta/recipes-core/libxml/libxml2_2.9.2.bb          |   11 -
 .../libxml/{libxml2.inc => libxml2_2.9.3.bb}       |   27 +-
 .../meta/nativesdk-buildtools-perl-dummy.bb        |   11 +-
 meta/recipes-core/ncurses/ncurses.inc              |    2 +-
 meta/recipes-core/ncurses/ncurses_5.9.bb           |    6 +-
 ...Convert-psplash_fb_plot_pixel-to-a-static.patch |   53 -
 meta/recipes-core/psplash/psplash_git.bb           |    3 +-
 .../readline/{files => readline-6.3}/norpath.patch |    0
 .../readline-6.3/readline-cve-2014-2524.patch      |   43 -
 .../readline-6.3/readline-dispatch-multikey.patch  |   32 -
 meta/recipes-core/readline/readline.inc            |    5 +-
 meta/recipes-core/readline/readline_6.3.bb         |   30 +-
 .../sysvinit/sysvinit-inittab/start_getty          |    5 +
 .../sysvinit/sysvinit-inittab_2.88dsf.bb           |   11 +-
 meta/recipes-core/uclibc/uclibc-git/uClibc.distro  |    2 +
 meta/recipes-devtools/gcc/gcc_4.9.bb               |    5 +-
 meta/recipes-devtools/guile/guile_2.0.11.bb        |    4 +
 meta/recipes-devtools/opensp/opensp_1.5.2.bb       |    4 +
 .../orc/{orc_0.4.23.bb => orc_0.4.24.bb}           |    4 +-
 meta/recipes-devtools/pkgconfig/pkgconfig.inc      |   49 -
 meta/recipes-devtools/pkgconfig/pkgconfig_git.bb   |   55 +-
 ...on-3.4-manifest.inc => python-3.5-manifest.inc} |  126 +-
 meta/recipes-devtools/python/python-git_1.0.1.bb   |    2 +-
 ...on3-native_3.4.3.bb => python3-native_3.5.0.bb} |    7 +-
 meta/recipes-devtools/python/python3-pip_6.1.1.bb  |    8 +-
 .../python/python3/000-cross-compile.patch         |   36 +-
 .../python3/020-dont-compile-python-files.patch    |   19 +-
 .../python/python3/04-default-is-optimized.patch   |   38 +-
 .../recipes-devtools/python/python3/makerace.patch |   28 -
 .../python/python3/python-3.3-multilib.patch       |  140 +-
 .../python/python3/use_packed_importlib.patch      |   31 +
 .../python/{python3_3.4.3.bb => python3_3.5.0.bb}  |    9 +-
 .../rpm/rpm/rpm-rpmfc.c-fix-for-N32-MIPS64.patch   |   34 +
 meta/recipes-devtools/rpm/rpm_5.4+cvs.bb           |    1 +
 meta/recipes-devtools/rpm/rpm_5.4.14.bb            |    1 +
 meta/recipes-devtools/ruby/ruby.inc                |    2 +-
 .../subversion-CVE-2015-3184.patch                 | 2094 ++++++++++++++++++++
 .../subversion-CVE-2015-3187.patch                 |  346 ++++
 .../subversion/subversion_1.8.13.bb                |    2 +
 meta/recipes-extended/lsb/lsb_4.1.bb               |    1 +
 meta/recipes-extended/mailx/mailx_12.5-5.bb        |    5 +
 .../rpcbind/rpcbind/cve-2015-7236.patch            |   83 +
 meta/recipes-extended/rpcbind/rpcbind_0.2.3.bb     |    1 +
 meta/recipes-gnome/gcr/gcr_3.16.0.bb               |    4 +-
 meta/recipes-gnome/libgudev/libgudev_230.bb        |   15 +
 meta/recipes-graphics/directfb/directfb.inc        |    3 +
 .../{harfbuzz_1.0.6.bb => harfbuzz_1.1.0.bb}       |    4 +-
 .../libsdl/libsdl-1.2.15/configure_tweak.patch     | 1111 -----------
 meta/recipes-graphics/libsdl/libsdl_1.2.15.bb      |    1 -
 meta/recipes-graphics/libsdl2/libsdl2_2.0.3.bb     |    2 +-
 meta/recipes-graphics/mesa/mesa.inc                |    4 +-
 meta/recipes-graphics/pango/pango.inc              |   13 +-
 .../xorg-driver/xf86-video-vmware_13.1.0.bb        |    3 +-
 .../linux-firmware/linux-firmware_git.bb           |    4 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb    |    6 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb  |    6 +-
 meta/recipes-kernel/linux/linux-yocto_4.1.bb       |   20 +-
 meta/recipes-kernel/lttng/lttng-modules_git.bb     |    8 +-
 ...-sessiond-disable-match-app-event-by-name.patch |   58 -
 .../lttng/lttng-tools/extern-decls.patch           |  442 -----
 ...ng-tools-Fix-live-timer-calculation-error.patch |   42 -
 .../recipes-kernel/lttng/lttng-tools/runtest.patch |   52 -
 .../lttng/lttng-tools/stop-using-SIGUNUSED.patch   |   51 +
 .../{lttng-tools_2.6.0.bb => lttng-tools_git.bb}   |   16 +-
 ...ttng-ust-Fix-live-timer-calculation-error.patch |   42 -
 meta/recipes-kernel/lttng/lttng-ust_git.bb         |   10 +-
 .../{libpng12_1.2.53.bb => libpng12_1.2.54.bb}     |    8 +-
 .../gstreamer/gstreamer1.0-libav_1.6.1.bb          |    3 +
 .../gstreamer/gstreamer1.0-plugins-bad.inc         |   10 +-
 .../gstreamer/gstreamer1.0-plugins-base.inc        |    4 +-
 .../gstreamer/gstreamer1.0-plugins-good.inc        |    8 +-
 .../libpng/{libpng_1.6.17.bb => libpng_1.6.19.bb}  |   10 +-
 .../0001-card-add-pa_card_profile.ports.patch      |  245 +++
 ...oth-fail-if-user-requested-profile-doesn-.patch |   60 +
 ...-move-profile-selection-after-pa_card_new.patch |  363 ++++
 ...vailability-for-some-unavailable-profiles.patch |   75 +
 .../pulseaudio/pulseaudio_6.0.bb                   |    4 +
 meta/recipes-support/apr/apr-util_1.5.4.bb         |    2 +
 ...n-fix-LTFLAGS-to-make-it-work-with-ccache.patch |   36 +
 meta/recipes-support/apr/apr_1.5.2.bb              |    1 +
 ...Makefile-let-libdb-6.0.la-depend-os_map.l.patch |   32 +
 meta/recipes-support/db/db_6.0.30.bb               |    1 +
 .../gnutls/{libtasn1_4.5.bb => libtasn1_4.7.bb}    |    4 +-
 meta/recipes-support/icu/icu_55.1.bb               |    4 +
 ...libunistring_0.9.5.bb => libunistring_0.9.6.bb} |    4 +-
 meta/recipes-support/libunwind/libunwind_1.1.bb    |    4 +
 .../sqlite/{sqlite3_3.9.0.bb => sqlite3_3.9.2.bb}  |    5 +-
 ...te-manifest-3.4.py => generate-manifest-3.5.py} |    2 +-
 scripts/create-pull-request                        |    8 +
 scripts/devtool                                    |    7 +-
 scripts/gen-lockedsig-cache                        |   13 +-
 scripts/lib/devtool/__init__.py                    |   26 +-
 scripts/lib/devtool/build.py                       |   54 +-
 scripts/lib/devtool/package.py                     |   24 +-
 scripts/lib/devtool/sdk.py                         |    4 -
 scripts/lib/devtool/search.py                      |   79 +-
 scripts/lib/devtool/standard.py                    |   34 +-
 scripts/lib/devtool/upgrade.py                     |   98 +-
 scripts/lib/recipetool/append.py                   |    2 +-
 scripts/lib/recipetool/create.py                   |    2 +-
 scripts/lib/recipetool/newappend.py                |    7 +-
 scripts/lib/recipetool/setvar.py                   |   75 +
 .../lib/wic/kickstart/custom_commands/partition.py |    6 +-
 scripts/lib/wic/utils/oe/misc.py                   |   18 +-
 scripts/oe-selftest                                |   61 +
 scripts/recipetool                                 |   10 +-
 scripts/runqemu-internal                           |    4 +-
 229 files changed, 5564 insertions(+), 4465 deletions(-)
 rename meta/recipes-connectivity/iproute2/{iproute2_4.1.1.bb => iproute2_4.3.0.bb} (68%)
 rename meta/recipes-connectivity/iw/{iw_4.1.bb => iw_4.3.bb} (86%)
 rename meta/recipes-connectivity/libpcap/{libpcap_1.6.2.bb => libpcap_1.7.4.bb} (82%)
 delete mode 100644 meta/recipes-connectivity/ofono/ofono/0001-backtrace-Disable-for-non-glibc-C-libraries.patch
 delete mode 100644 meta/recipes-connectivity/ofono/ofono_1.16.bb
 create mode 100644 meta/recipes-connectivity/ofono/ofono_1.17.bb
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-AP-WMM-Fix-integer-underflow-in-WMM-Action-frame-par.patch
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-EAP-pwd-peer-Fix-payload-length-validation-for-Commi.patch
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-P2P-Validate-SSID-element-length-before-copying-it-C.patch
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-WPS-Fix-HTTP-chunked-transfer-encoding-parser.patch
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0002-EAP-pwd-server-Fix-payload-length-validation-for-Com.patch
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0003-EAP-pwd-peer-Fix-Total-Length-parsing-for-fragment-r.patch
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0004-EAP-pwd-server-Fix-Total-Length-parsing-for-fragment.patch
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0005-EAP-pwd-peer-Fix-asymmetric-fragmentation-behavior.patch
 rename meta/recipes-connectivity/wpa-supplicant/{wpa-supplicant_2.4.bb => wpa-supplicant_2.5.bb} (77%)
 delete mode 100644 meta/recipes-core/busybox/busybox/0001-Switch-to-POSIX-utmpx-API.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/0001-chown-fix-help-text.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/0001-ifconfig-fix-double-free-fatal-error-in-INET_sprint.patch
 create mode 100644 meta/recipes-core/busybox/busybox/resize.cfg
 rename meta/recipes-core/busybox/{busybox_1.23.2.bb => busybox_1.24.1.bb} (70%)
 delete mode 100644 meta/recipes-core/dbus/dbus.inc
 create mode 100644 meta/recipes-core/glibc/glibc/0029-fix-getmntent-empty-lines.patch
 create mode 100644 meta/recipes-core/glibc/glibc/strcoll-Remove-incorrect-STRDIFF-based-optimization-.patch
 delete mode 100644 meta/recipes-core/libxml/libxml2/0001-CVE-2015-1819-Enforce-the-reader-to-run-in-constant-.patch
 delete mode 100644 meta/recipes-core/libxml/libxml2/0001-threads-Define-pthread-definitions-for-glibc-complia.patch
 delete mode 100644 meta/recipes-core/libxml/libxml2/72a46a519ce7326d9a00f0b6a7f2a8e958cd1675.patch
 delete mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-7942.patch
 delete mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-8035.patch
 delete mode 100644 meta/recipes-core/libxml/libxml2/libxml2-CVE-2014-0191-fix.patch
 delete mode 100644 meta/recipes-core/libxml/libxml2_2.9.2.bb
 rename meta/recipes-core/libxml/{libxml2.inc => libxml2_2.9.3.bb} (83%)
 delete mode 100644 meta/recipes-core/psplash/files/0001-psplash-fb-Convert-psplash_fb_plot_pixel-to-a-static.patch
 rename meta/recipes-core/readline/{files => readline-6.3}/norpath.patch (100%)
 delete mode 100644 meta/recipes-core/readline/readline-6.3/readline-cve-2014-2524.patch
 delete mode 100644 meta/recipes-core/readline/readline-6.3/readline-dispatch-multikey.patch
 create mode 100644 meta/recipes-core/sysvinit/sysvinit-inittab/start_getty
 rename meta/recipes-devtools/orc/{orc_0.4.23.bb => orc_0.4.24.bb} (83%)
 delete mode 100644 meta/recipes-devtools/pkgconfig/pkgconfig.inc
 rename meta/recipes-devtools/python/{python-3.4-manifest.inc => python-3.5-manifest.inc} (51%)
 rename meta/recipes-devtools/python/{python3-native_3.4.3.bb => python3-native_3.5.0.bb} (92%)
 delete mode 100644 meta/recipes-devtools/python/python3/makerace.patch
 create mode 100644 meta/recipes-devtools/python/python3/use_packed_importlib.patch
 rename meta/recipes-devtools/python/{python3_3.4.3.bb => python3_3.5.0.bb} (97%)
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-rpmfc.c-fix-for-N32-MIPS64.patch
 create mode 100644 meta/recipes-devtools/subversion/subversion-1.8.13/subversion-CVE-2015-3184.patch
 create mode 100644 meta/recipes-devtools/subversion/subversion-1.8.13/subversion-CVE-2015-3187.patch
 create mode 100644 meta/recipes-extended/rpcbind/rpcbind/cve-2015-7236.patch
 create mode 100644 meta/recipes-gnome/libgudev/libgudev_230.bb
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_1.0.6.bb => harfbuzz_1.1.0.bb} (88%)
 delete mode 100644 meta/recipes-graphics/libsdl/libsdl-1.2.15/configure_tweak.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-tools/0001-Fix-sessiond-disable-match-app-event-by-name.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-tools/extern-decls.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-tools/lttng-tools-Fix-live-timer-calculation-error.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-tools/runtest.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools/stop-using-SIGUNUSED.patch
 rename meta/recipes-kernel/lttng/{lttng-tools_2.6.0.bb => lttng-tools_git.bb} (85%)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-ust/lttng-ust-Fix-live-timer-calculation-error.patch
 rename meta/recipes-lsb4/libpng/{libpng12_1.2.53.bb => libpng12_1.2.54.bb} (70%)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.17.bb => libpng_1.6.19.bb} (62%)
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0001-card-add-pa_card_profile.ports.patch
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0002-alsa-bluetooth-fail-if-user-requested-profile-doesn-.patch
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0003-card-move-profile-selection-after-pa_card_new.patch
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0004-alsa-set-availability-for-some-unavailable-profiles.patch
 create mode 100644 meta/recipes-support/apr/apr/configure.in-fix-LTFLAGS-to-make-it-work-with-ccache.patch
 create mode 100644 meta/recipes-support/db/db/Makefile-let-libdb-6.0.la-depend-os_map.l.patch
 rename meta/recipes-support/gnutls/{libtasn1_4.5.bb => libtasn1_4.7.bb} (81%)
 rename meta/recipes-support/libunistring/{libunistring_0.9.5.bb => libunistring_0.9.6.bb} (90%)
 rename meta/recipes-support/sqlite/{sqlite3_3.9.0.bb => sqlite3_3.9.2.bb} (81%)
 rename scripts/contrib/python/{generate-manifest-3.4.py => generate-manifest-3.5.py} (99%)
 create mode 100644 scripts/lib/recipetool/setvar.py

Alejandro Hernandez (2):
  python3: Upgrade from 3.4.3 to 3.5
  python3: fix building nativesdk-python3

Andre McCurdy (15):
  directfb.inc: force bfd linker for armv7a
  libxml2: remove legacy LDFLAGS += "-ldl" workaround
  sqlite3: update 3.9.0 -> 3.9.2
  harfbuzz: update 1.0.6 -> 1.1.0
  busybox_git: Enable getopt applet
  busybox.inc: don't export EXTRA_OEMAKE
  busybox: move EXTRA_OEMAKE etc into busybox.inc
  busybox.inc: don't set .config CROSS_COMPILER_PREFIX
  busybox.inc: fix CONFIG_EXTRA_CFLAGS configmangle
  busybox.inc: set CC=${CC} via make command line
  busybox.inc: remove '-e MAKEFLAGS=' from EXTRA_OEMAKE
  busybox: re-order defconfig to align with busybox 1.24.1
  busybox: update 1.23.2 -> 1.24.1
  busybox: disable support for mounting NFS file systems on Linux <
    2.6.23
  busybox: enable resize applet

Andrew Shadura (1):
  dbus: merge .bb and .inc

Aníbal Limón (2):
  dev-manual: Fix errata in new kvm-vhost.
  classes/sstate.bbclass: checkhashes modify to take into account
    siginfo.

Bhuvanchandra DV (1):
  linux-firmware: rtl8192cx: Add latest available firmware

Bogdan-Alexandru Voiculescu (1):
  uClibc: enable utmp for shadow compatibility

Bruce Ashfield (4):
  linux-yocto/4.1: update to v4.1.13
  linux-yocto/4.1: fsl-mpc8315e-rdb: Enable EEPROM
  linux-yocto-rt/4.1: update to -rt15
  linux-yocto/4.1: Bluetooth:Fix the connection fail of 6lowpan over BT
    LE

Dariusz Pelowski (1):
  lib/oe/terminal: use C locale when determining version

Ed Bartosh (1):
  wic: exec_native_cmd: implement support for pseudo

Fan Xin (1):
  wpa-supplicant: upgrade to 2.5

George Nita (1):
  toolchain-shar-extract.sh: Ensure it's ran in clean environment

Haris Okanovic (1):
  populate_sdk_base: Add sysroot symlink check

Jean-Francois Dagenais (1):
  toolchain-shar-relocate: don't assume last state of env_setup_script
    is good

Juro Bystricky (1):
  psplash: update to latest git version

Jussi Kukkonen (4):
  mesa: Make gl libraries RRECOMMEND mesa-megadriver
  pulseaudio: Fix HDMI profile selection
  gcr: Require x11 DISTRO_FEATURE
  gudev: Add from meta-oe

Khem Raj (2):
  runqemu-internal: Replace wacom-tablet with tablet for usbdevice
  ruby-native: Depend on openssl-native

Leonardo Sandoval (1):
  oe-selftest: Enable code coverage on unit tests

Li Xin (1):
  glibc: Backported a patch to fix glibc's bug(18589)

Li Zhou (1):
  rpcbind: Security Advisory - rpcbind - CVE-2015-7236

Mariano Lopez (6):
  license.bbclass: Write recipeinfo file in license folder
  license.bbclass: Split license create manifest
  license.bbclass: Added get_boot_dependencies function
  license.bbclass: Added function get_deployed_dependencies
  license.bbclass: Add function get_deployed_files
  license.bbclass: Create image license manifest

Mark Hatle (1):
  populate_sdk_ext.bbclass: Be more permissive on the name of the
    buildtools

Martin Jansa (8):
  package_manager.py: define info_dir and status_file when OPKGLIBDIR
    isn't the default
  meta/conf/machine: use ' inside quoted values
  icu: force arm mode
  guile, mailx, gcc, opensp, gstreamer1.0-libav, libunwind: disable
    thumb where it fails for qemuarm
  gstreamer1.0-plugins-base: add PACKAGECONFIG for libvisual
  gst-plugins-bad: improve FILES variables
  gstreamer1.0-plugins-bad: fix dependencies for uvch264 PACKAGECONFIG
  gstreamer1.0-plugins-good: fix PACKAGECONFIG for gudev and add one for
    v4l2 and libv4l2

Maxin B. John (12):
  iproute2: update to 4.3.0
  apr-util: add missing RDEPENDS for ptest
  libpcap: update to 1.7.4
  orc: update to 0.4.24
  libpng: update to 1.6.19
  libpng12: update to 1.2.54
  libtasn1: upgrade to 4.7
  libunistring: upgrade to version 0.9.6
  ofono: upgrade to version 1.17
  pkgconfig: upgrade to version 0.29
  ncurses: update SRC_URI
  iw: upgrade to version 4.3

Mike Crowe (2):
  image.py: Avoid creating empty .env file in _write_wic_env
  image.py: avoid mkdir race when building multiple images

Ming Liu (1):
  initscripts: hide the error in case system is not writeable

Nathan Lynch (1):
  lttng-tools: add libgcc to RDEPENDS

Ng, Mei Yeen (2):
  init-install-efi: fix script for gummiboot loader
  init-install-efi: fix script for eMMC installation

Otavio Salvador (5):
  lttng-modules: Upgrade to 2.7 release
  lttng-ust: Upgrade to 2.7 release
  lttng-tools: Drop unused patch
  lttng-tools: Upgrade to 2.7 release
  xf86-video-vmware: Add vmwgfx PACKAGECONFIG option

Patrick Ohly (1):
  buildhistory.bbclass: support extending the content of the build
    history

Paul Eggleton (25):
  classes/populate_sdk_ext: tidy up preparation log file writing
  classes/populate_sdk_ext: make it clear when SDK installation has
    failed
  classes/populate_sdk_ext: tweak reporting of workspace exclusion
  classes/populate_sdk_ext: fail if SDK_ARCH != BUILD_ARCH
  scripts/gen-lockedsig-cache: improve output
  toolchain-shar-extract.sh: do not allow $ in paths for ext SDK
  devtool: upgrade: fix removing other recipes from workspace on reset
  devtool: upgrade: fix updating PV and SRCREV
  devtool: upgrade: remove erroneous error when not renaming recipe
  devtool: upgrade: fetch remote repository before checking out new
    revision
  devtool: upgrade: provide a means to update the source branch
  lib/oe/patch: improve extraction of patch header
  devtool: disable creating workspace for extract and search subcommands
  devtool: package: use DEPLOY_DIR_<pkgtype> to get deploy directory
  devtool: drop unused plugin_init() functions
  devtool: search: print SUMMARY value
  devtool: ensure we change back to the original dir on error
  lib/oe/recipeutils: check in validate_pn() for names instead of
    filenames
  devtool: build: use bbappend to set PARALLEL_MAKE
  devtool: build: enable showing default task in help
  devtool: clarify help text
  lib/oe/recipeutils: refactor patch_recipe_file() to use
    edit_metadata()
  recipetool: add setvar subcommand
  recipetool: make plugin registration function name consistent with
    devtool
  nativesdk-buildtools-perl-dummy: fix rebuilding when SDKMACHINE
    changes

Peter Seebach (1):
  glibc/0029-fix-getmnt-empty-lines.patch: fix getmntent()

Petter Mabäcker (3):
  create-pull-request: handle empty ODIR
  readline: prepare for readline6.3 upstream patches
  readline: apply missing upstream patches

Ricardo Ribalda Delgado (1):
  python-git: Add missing dependency

Robert Yang (5):
  boot-directdisk.bbclass: remove HDDIMG before create
  db: fix race issue for libdb-6.0.la
  apr: fix LTFLAGS to make it work with ccache
  rpm: fix for N32 MIPS64
  lsb: fix installed-vs-shipped for mips

Ross Burton (12):
  base: decode SRC_URI before adding implicit fetch dependencies
  base: add automatic dependency on lzip-native for .lz SRC_URI
  oeqa/qemurunner: pass nographic to runqemu if DISPLAY isn't set
  sanity: don't enforce DISPLAY for testimage
  oeqa/runtime/multilib: refactor ELF class extraction
  oeqa/sshcontrol: don't source profile
  pango: use ptest-gnome
  pkgconfig: merge .bb and .inc
  openssl: enable parallel make
  libxml2: merge pointless bb/inc split
  libxml2: upgrade to 2.9.3
  libsdl: remove redundant configure_tweak patch

Roy Li (2):
  iproute2: install bridge tool by default
  openssh: redesign ssh-agent.sh regression test case

Saul Wold (1):
  sysvinit-inittab: Add wrapper script to verify console exists

Tzu-Jung Lee (1):
  devtool: include do_patch in SRCTREECOVEREDTASKS

Wenzong Fan (2):
  subversion: fix CVE-2015-3184
  subversion: fix CVE-2015-3187

Yi Zhao (1):
  libsdl2: add missing dependency on libxkbcommon for
    PACKAGECONFIG[wayland]

 documentation/dev-manual/dev-manual-qemu.xml       |    8 +-
 meta/classes/base.bbclass                          |   71 +-
 meta/classes/boot-directdisk.bbclass               |    2 +
 meta/classes/buildhistory.bbclass                  |   13 +-
 meta/classes/distutils3-base.bbclass               |    2 +-
 meta/classes/distutils3-native-base.bbclass        |    2 +-
 meta/classes/license.bbclass                       |  208 +-
 meta/classes/populate_sdk_base.bbclass             |   53 +-
 meta/classes/populate_sdk_ext.bbclass              |   15 +-
 meta/classes/python3native.bbclass                 |    2 +-
 meta/classes/sanity.bbclass                        |    8 -
 meta/classes/sstate.bbclass                        |    7 +-
 meta/conf/machine/include/arm/arch-arm.inc         |    4 +-
 meta/conf/machine/include/arm/arch-arm64.inc       |   14 +-
 meta/conf/machine/include/arm/arch-armv4.inc       |   10 +-
 meta/conf/machine/include/arm/arch-armv5-dsp.inc   |    2 +-
 meta/conf/machine/include/arm/arch-armv5.inc       |    6 +-
 meta/conf/machine/include/arm/arch-armv6.inc       |    4 +-
 meta/conf/machine/include/arm/arch-armv7a.inc      |    4 +-
 meta/conf/machine/include/arm/feature-arm-neon.inc |    4 +-
 meta/conf/machine/include/arm/feature-arm-vfp.inc  |   16 +-
 meta/conf/machine/include/mips/arch-mips.inc       |   24 +-
 meta/conf/machine/include/powerpc/arch-powerpc.inc |   10 +-
 .../machine/include/powerpc/arch-powerpc64.inc     |    4 +-
 meta/conf/machine/include/sh/arch-sh.inc           |    2 +-
 meta/conf/machine/include/tune-arm1136jf-s.inc     |    2 +-
 meta/conf/machine/include/tune-arm920t.inc         |    2 +-
 meta/conf/machine/include/tune-arm926ejs.inc       |    2 +-
 meta/conf/machine/include/tune-arm9tdmi.inc        |    2 +-
 meta/conf/machine/include/tune-c3.inc              |    2 +-
 meta/conf/machine/include/tune-core2.inc           |    2 +-
 meta/conf/machine/include/tune-corei7.inc          |    2 +-
 meta/conf/machine/include/tune-cortexa15.inc       |    2 +-
 meta/conf/machine/include/tune-cortexa17.inc       |    2 +-
 meta/conf/machine/include/tune-cortexa5.inc        |    2 +-
 meta/conf/machine/include/tune-cortexa7.inc        |    2 +-
 meta/conf/machine/include/tune-cortexa8.inc        |    2 +-
 meta/conf/machine/include/tune-cortexa9.inc        |    2 +-
 meta/conf/machine/include/tune-cortexm1.inc        |    2 +-
 meta/conf/machine/include/tune-cortexm3.inc        |    4 +-
 meta/conf/machine/include/tune-cortexr4.inc        |    4 +-
 meta/conf/machine/include/tune-ep9312.inc          |    2 +-
 meta/conf/machine/include/tune-i586-nlp.inc        |    2 +-
 meta/conf/machine/include/tune-i586.inc            |    2 +-
 meta/conf/machine/include/tune-iwmmxt.inc          |    2 +-
 meta/conf/machine/include/tune-mips32.inc          |    2 +-
 meta/conf/machine/include/tune-mips32r2.inc        |    2 +-
 meta/conf/machine/include/tune-octeon.inc          |    4 +-
 meta/conf/machine/include/tune-power5.inc          |    6 +-
 meta/conf/machine/include/tune-power6.inc          |    6 +-
 meta/conf/machine/include/tune-power7.inc          |    6 +-
 meta/conf/machine/include/tune-ppc476.inc          |    4 +-
 meta/conf/machine/include/tune-ppc603e.inc         |    4 +-
 meta/conf/machine/include/tune-ppc7400.inc         |    4 +-
 meta/conf/machine/include/tune-ppce300c2.inc       |    2 +-
 meta/conf/machine/include/tune-ppce300c3.inc       |    6 +-
 meta/conf/machine/include/tune-ppce500.inc         |    8 +-
 meta/conf/machine/include/tune-ppce500mc.inc       |    4 +-
 meta/conf/machine/include/tune-ppce500v2.inc       |    8 +-
 meta/conf/machine/include/tune-ppce5500.inc        |    4 +-
 meta/conf/machine/include/tune-ppce6500.inc        |    6 +-
 meta/conf/machine/include/tune-sh3.inc             |    2 +-
 meta/conf/machine/include/tune-sh4.inc             |    4 +-
 meta/conf/machine/include/tune-strongarm1100.inc   |    2 +-
 meta/conf/machine/include/tune-thunderx.inc        |    2 +-
 meta/conf/machine/include/tune-xscale.inc          |    2 +-
 meta/conf/machine/include/x86/arch-x86.inc         |   20 +-
 meta/files/toolchain-shar-extract.sh               |    6 +-
 meta/files/toolchain-shar-relocate.sh              |    2 +
 meta/lib/oe/copy_buildsystem.py                    |    5 +-
 meta/lib/oe/image.py                               |    9 +-
 meta/lib/oe/package_manager.py                     |   19 +
 meta/lib/oe/patch.py                               |   58 +-
 meta/lib/oe/recipeutils.py                         |  162 +-
 meta/lib/oe/terminal.py                            |    4 +-
 meta/lib/oeqa/runtime/multilib.py                  |   32 +-
 meta/lib/oeqa/selftest/devtool.py                  |    8 +-
 meta/lib/oeqa/utils/qemurunner.py                  |   12 +-
 meta/lib/oeqa/utils/sshcontrol.py                  |    3 +-
 meta/recipes-connectivity/iproute2/iproute2.inc    |    2 +-
 .../{iproute2_4.1.1.bb => iproute2_4.3.0.bb}       |    4 +-
 ....sh-don-t-use-git-describe-for-versioning.patch |   20 +-
 .../iw/iw/separate-objdir.patch                    |   36 +-
 .../iw/{iw_4.1.bb => iw_4.3.bb}                    |    4 +-
 meta/recipes-connectivity/libpcap/libpcap.inc      |    2 +-
 .../libpcap/{libpcap_1.6.2.bb => libpcap_1.7.4.bb} |    4 +-
 ...cktrace-Disable-for-non-glibc-C-libraries.patch |   40 -
 .../ofono/{ofono_1.16.bb => ofono_1.17.bb}         |    5 +-
 .../recipes-connectivity/openssh/openssh/run-ptest |   37 +
 .../recipes-connectivity/openssl/openssl_1.0.2d.bb |    3 -
 ...integer-underflow-in-WMM-Action-frame-par.patch |   45 -
 ...r-Fix-payload-length-validation-for-Commi.patch |   77 -
 ...e-SSID-element-length-before-copying-it-C.patch |   47 -
 ...Fix-HTTP-chunked-transfer-encoding-parser.patch |   53 -
 ...ver-Fix-payload-length-validation-for-Com.patch |   70 -
 ...r-Fix-Total-Length-parsing-for-fragment-r.patch |   56 -
 ...ver-Fix-Total-Length-parsing-for-fragment.patch |   54 -
 ...eer-Fix-asymmetric-fragmentation-behavior.patch |   36 -
 ...wpa-supplicant_2.4.bb => wpa-supplicant_2.5.bb} |   20 +-
 meta/recipes-core/busybox/busybox.inc              |   16 +-
 .../busybox/0001-Switch-to-POSIX-utmpx-API.patch   |  388 ----
 .../busybox/busybox/0001-chown-fix-help-text.patch |   34 -
 ...ix-double-free-fatal-error-in-INET_sprint.patch |   67 -
 meta/recipes-core/busybox/busybox/defconfig        |   63 +-
 meta/recipes-core/busybox/busybox/resize.cfg       |    2 +
 .../{busybox_1.23.2.bb => busybox_1.24.1.bb}       |   16 +-
 meta/recipes-core/busybox/busybox_git.bb           |   18 +-
 meta/recipes-core/dbus/dbus.inc                    |  170 --
 meta/recipes-core/dbus/dbus_1.8.20.bb              |  171 +-
 .../glibc/0029-fix-getmntent-empty-lines.patch     |   40 +
 ...ove-incorrect-STRDIFF-based-optimization-.patch |  323 +++
 meta/recipes-core/glibc/glibc_2.22.bb              |    2 +
 .../initrdscripts/files/init-install-efi.sh        |    9 +-
 .../initscripts/initscripts-1.0/save-rtc.sh        |    2 +-
 ...19-Enforce-the-reader-to-run-in-constant-.patch |  181 --
 ...ine-pthread-definitions-for-glibc-complia.patch |   32 -
 .../72a46a519ce7326d9a00f0b6a7f2a8e958cd1675.patch |   30 -
 .../libxml/libxml2/CVE-2015-7942.patch             |   55 -
 .../libxml/libxml2/CVE-2015-8035.patch             |   41 -
 meta/recipes-core/libxml/libxml2/ansidecl.patch    |   22 +-
 .../libxml/libxml2/libxml2-CVE-2014-0191-fix.patch |   37 -
 meta/recipes-core/libxml/libxml2_2.9.2.bb          |   11 -
 .../libxml/{libxml2.inc => libxml2_2.9.3.bb}       |   27 +-
 .../meta/nativesdk-buildtools-perl-dummy.bb        |   11 +-
 meta/recipes-core/ncurses/ncurses.inc              |    2 +-
 meta/recipes-core/ncurses/ncurses_5.9.bb           |    6 +-
 ...Convert-psplash_fb_plot_pixel-to-a-static.patch |   53 -
 meta/recipes-core/psplash/psplash_git.bb           |    3 +-
 .../readline/{files => readline-6.3}/norpath.patch |    0
 .../readline-6.3/readline-cve-2014-2524.patch      |   43 -
 .../readline-6.3/readline-dispatch-multikey.patch  |   32 -
 meta/recipes-core/readline/readline.inc            |    5 +-
 meta/recipes-core/readline/readline_6.3.bb         |   30 +-
 .../sysvinit/sysvinit-inittab/start_getty          |    5 +
 .../sysvinit/sysvinit-inittab_2.88dsf.bb           |   11 +-
 meta/recipes-core/uclibc/uclibc-git/uClibc.distro  |    2 +
 meta/recipes-devtools/gcc/gcc_4.9.bb               |    5 +-
 meta/recipes-devtools/guile/guile_2.0.11.bb        |    4 +
 meta/recipes-devtools/opensp/opensp_1.5.2.bb       |    4 +
 .../orc/{orc_0.4.23.bb => orc_0.4.24.bb}           |    4 +-
 meta/recipes-devtools/pkgconfig/pkgconfig.inc      |   49 -
 meta/recipes-devtools/pkgconfig/pkgconfig_git.bb   |   55 +-
 ...on-3.4-manifest.inc => python-3.5-manifest.inc} |  126 +-
 meta/recipes-devtools/python/python-git_1.0.1.bb   |    2 +-
 ...on3-native_3.4.3.bb => python3-native_3.5.0.bb} |    7 +-
 meta/recipes-devtools/python/python3-pip_6.1.1.bb  |    8 +-
 .../python/python3/000-cross-compile.patch         |   36 +-
 .../python3/020-dont-compile-python-files.patch    |   19 +-
 .../python/python3/04-default-is-optimized.patch   |   38 +-
 .../recipes-devtools/python/python3/makerace.patch |   28 -
 .../python/python3/python-3.3-multilib.patch       |  140 +-
 .../python/python3/use_packed_importlib.patch      |   31 +
 .../python/{python3_3.4.3.bb => python3_3.5.0.bb}  |    9 +-
 .../rpm/rpm/rpm-rpmfc.c-fix-for-N32-MIPS64.patch   |   34 +
 meta/recipes-devtools/rpm/rpm_5.4+cvs.bb           |    1 +
 meta/recipes-devtools/rpm/rpm_5.4.14.bb            |    1 +
 meta/recipes-devtools/ruby/ruby.inc                |    2 +-
 .../subversion-CVE-2015-3184.patch                 | 2094 ++++++++++++++++++++
 .../subversion-CVE-2015-3187.patch                 |  346 ++++
 .../subversion/subversion_1.8.13.bb                |    2 +
 meta/recipes-extended/lsb/lsb_4.1.bb               |    1 +
 meta/recipes-extended/mailx/mailx_12.5-5.bb        |    5 +
 .../rpcbind/rpcbind/cve-2015-7236.patch            |   83 +
 meta/recipes-extended/rpcbind/rpcbind_0.2.3.bb     |    1 +
 meta/recipes-gnome/gcr/gcr_3.16.0.bb               |    4 +-
 meta/recipes-gnome/libgudev/libgudev_230.bb        |   15 +
 meta/recipes-graphics/directfb/directfb.inc        |    3 +
 .../{harfbuzz_1.0.6.bb => harfbuzz_1.1.0.bb}       |    4 +-
 .../libsdl/libsdl-1.2.15/configure_tweak.patch     | 1111 -----------
 meta/recipes-graphics/libsdl/libsdl_1.2.15.bb      |    1 -
 meta/recipes-graphics/libsdl2/libsdl2_2.0.3.bb     |    2 +-
 meta/recipes-graphics/mesa/mesa.inc                |    4 +-
 meta/recipes-graphics/pango/pango.inc              |   13 +-
 .../xorg-driver/xf86-video-vmware_13.1.0.bb        |    3 +-
 .../linux-firmware/linux-firmware_git.bb           |    4 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb    |    6 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb  |    6 +-
 meta/recipes-kernel/linux/linux-yocto_4.1.bb       |   20 +-
 meta/recipes-kernel/lttng/lttng-modules_git.bb     |    8 +-
 ...-sessiond-disable-match-app-event-by-name.patch |   58 -
 .../lttng/lttng-tools/extern-decls.patch           |  442 -----
 ...ng-tools-Fix-live-timer-calculation-error.patch |   42 -
 .../recipes-kernel/lttng/lttng-tools/runtest.patch |   52 -
 .../lttng/lttng-tools/stop-using-SIGUNUSED.patch   |   51 +
 .../{lttng-tools_2.6.0.bb => lttng-tools_git.bb}   |   16 +-
 ...ttng-ust-Fix-live-timer-calculation-error.patch |   42 -
 meta/recipes-kernel/lttng/lttng-ust_git.bb         |   10 +-
 .../{libpng12_1.2.53.bb => libpng12_1.2.54.bb}     |    8 +-
 .../gstreamer/gstreamer1.0-libav_1.6.1.bb          |    3 +
 .../gstreamer/gstreamer1.0-plugins-bad.inc         |   10 +-
 .../gstreamer/gstreamer1.0-plugins-base.inc        |    4 +-
 .../gstreamer/gstreamer1.0-plugins-good.inc        |    8 +-
 .../libpng/{libpng_1.6.17.bb => libpng_1.6.19.bb}  |   10 +-
 .../0001-card-add-pa_card_profile.ports.patch      |  245 +++
 ...oth-fail-if-user-requested-profile-doesn-.patch |   60 +
 ...-move-profile-selection-after-pa_card_new.patch |  363 ++++
 ...vailability-for-some-unavailable-profiles.patch |   75 +
 .../pulseaudio/pulseaudio_6.0.bb                   |    4 +
 meta/recipes-support/apr/apr-util_1.5.4.bb         |    2 +
 ...n-fix-LTFLAGS-to-make-it-work-with-ccache.patch |   36 +
 meta/recipes-support/apr/apr_1.5.2.bb              |    1 +
 ...Makefile-let-libdb-6.0.la-depend-os_map.l.patch |   32 +
 meta/recipes-support/db/db_6.0.30.bb               |    1 +
 .../gnutls/{libtasn1_4.5.bb => libtasn1_4.7.bb}    |    4 +-
 meta/recipes-support/icu/icu_55.1.bb               |    4 +
 ...libunistring_0.9.5.bb => libunistring_0.9.6.bb} |    4 +-
 meta/recipes-support/libunwind/libunwind_1.1.bb    |    4 +
 .../sqlite/{sqlite3_3.9.0.bb => sqlite3_3.9.2.bb}  |    5 +-
 ...te-manifest-3.4.py => generate-manifest-3.5.py} |    2 +-
 scripts/create-pull-request                        |    8 +
 scripts/devtool                                    |    7 +-
 scripts/gen-lockedsig-cache                        |   13 +-
 scripts/lib/devtool/__init__.py                    |   26 +-
 scripts/lib/devtool/build.py                       |   54 +-
 scripts/lib/devtool/package.py                     |   24 +-
 scripts/lib/devtool/sdk.py                         |    4 -
 scripts/lib/devtool/search.py                      |   79 +-
 scripts/lib/devtool/standard.py                    |   34 +-
 scripts/lib/devtool/upgrade.py                     |   98 +-
 scripts/lib/recipetool/append.py                   |    2 +-
 scripts/lib/recipetool/create.py                   |    2 +-
 scripts/lib/recipetool/newappend.py                |    7 +-
 scripts/lib/recipetool/setvar.py                   |   75 +
 .../lib/wic/kickstart/custom_commands/partition.py |    6 +-
 scripts/lib/wic/utils/oe/misc.py                   |   18 +-
 scripts/oe-selftest                                |   61 +
 scripts/recipetool                                 |   10 +-
 scripts/runqemu-internal                           |    4 +-
 228 files changed, 5555 insertions(+), 4456 deletions(-)
 rename meta/recipes-connectivity/iproute2/{iproute2_4.1.1.bb => iproute2_4.3.0.bb} (68%)
 rename meta/recipes-connectivity/iw/{iw_4.1.bb => iw_4.3.bb} (86%)
 rename meta/recipes-connectivity/libpcap/{libpcap_1.6.2.bb => libpcap_1.7.4.bb} (82%)
 delete mode 100644 meta/recipes-connectivity/ofono/ofono/0001-backtrace-Disable-for-non-glibc-C-libraries.patch
 rename meta/recipes-connectivity/ofono/{ofono_1.16.bb => ofono_1.17.bb} (49%)
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-AP-WMM-Fix-integer-underflow-in-WMM-Action-frame-par.patch
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-EAP-pwd-peer-Fix-payload-length-validation-for-Commi.patch
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-P2P-Validate-SSID-element-length-before-copying-it-C.patch
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-WPS-Fix-HTTP-chunked-transfer-encoding-parser.patch
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0002-EAP-pwd-server-Fix-payload-length-validation-for-Com.patch
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0003-EAP-pwd-peer-Fix-Total-Length-parsing-for-fragment-r.patch
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0004-EAP-pwd-server-Fix-Total-Length-parsing-for-fragment.patch
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0005-EAP-pwd-peer-Fix-asymmetric-fragmentation-behavior.patch
 rename meta/recipes-connectivity/wpa-supplicant/{wpa-supplicant_2.4.bb => wpa-supplicant_2.5.bb} (77%)
 delete mode 100644 meta/recipes-core/busybox/busybox/0001-Switch-to-POSIX-utmpx-API.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/0001-chown-fix-help-text.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/0001-ifconfig-fix-double-free-fatal-error-in-INET_sprint.patch
 create mode 100644 meta/recipes-core/busybox/busybox/resize.cfg
 rename meta/recipes-core/busybox/{busybox_1.23.2.bb => busybox_1.24.1.bb} (70%)
 delete mode 100644 meta/recipes-core/dbus/dbus.inc
 create mode 100644 meta/recipes-core/glibc/glibc/0029-fix-getmntent-empty-lines.patch
 create mode 100644 meta/recipes-core/glibc/glibc/strcoll-Remove-incorrect-STRDIFF-based-optimization-.patch
 delete mode 100644 meta/recipes-core/libxml/libxml2/0001-CVE-2015-1819-Enforce-the-reader-to-run-in-constant-.patch
 delete mode 100644 meta/recipes-core/libxml/libxml2/0001-threads-Define-pthread-definitions-for-glibc-complia.patch
 delete mode 100644 meta/recipes-core/libxml/libxml2/72a46a519ce7326d9a00f0b6a7f2a8e958cd1675.patch
 delete mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-7942.patch
 delete mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-8035.patch
 delete mode 100644 meta/recipes-core/libxml/libxml2/libxml2-CVE-2014-0191-fix.patch
 delete mode 100644 meta/recipes-core/libxml/libxml2_2.9.2.bb
 rename meta/recipes-core/libxml/{libxml2.inc => libxml2_2.9.3.bb} (83%)
 delete mode 100644 meta/recipes-core/psplash/files/0001-psplash-fb-Convert-psplash_fb_plot_pixel-to-a-static.patch
 rename meta/recipes-core/readline/{files => readline-6.3}/norpath.patch (100%)
 delete mode 100644 meta/recipes-core/readline/readline-6.3/readline-cve-2014-2524.patch
 delete mode 100644 meta/recipes-core/readline/readline-6.3/readline-dispatch-multikey.patch
 create mode 100644 meta/recipes-core/sysvinit/sysvinit-inittab/start_getty
 rename meta/recipes-devtools/orc/{orc_0.4.23.bb => orc_0.4.24.bb} (83%)
 delete mode 100644 meta/recipes-devtools/pkgconfig/pkgconfig.inc
 rename meta/recipes-devtools/python/{python-3.4-manifest.inc => python-3.5-manifest.inc} (51%)
 rename meta/recipes-devtools/python/{python3-native_3.4.3.bb => python3-native_3.5.0.bb} (92%)
 delete mode 100644 meta/recipes-devtools/python/python3/makerace.patch
 create mode 100644 meta/recipes-devtools/python/python3/use_packed_importlib.patch
 rename meta/recipes-devtools/python/{python3_3.4.3.bb => python3_3.5.0.bb} (97%)
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-rpmfc.c-fix-for-N32-MIPS64.patch
 create mode 100644 meta/recipes-devtools/subversion/subversion-1.8.13/subversion-CVE-2015-3184.patch
 create mode 100644 meta/recipes-devtools/subversion/subversion-1.8.13/subversion-CVE-2015-3187.patch
 create mode 100644 meta/recipes-extended/rpcbind/rpcbind/cve-2015-7236.patch
 create mode 100644 meta/recipes-gnome/libgudev/libgudev_230.bb
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_1.0.6.bb => harfbuzz_1.1.0.bb} (88%)
 delete mode 100644 meta/recipes-graphics/libsdl/libsdl-1.2.15/configure_tweak.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-tools/0001-Fix-sessiond-disable-match-app-event-by-name.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-tools/extern-decls.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-tools/lttng-tools-Fix-live-timer-calculation-error.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-tools/runtest.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools/stop-using-SIGUNUSED.patch
 rename meta/recipes-kernel/lttng/{lttng-tools_2.6.0.bb => lttng-tools_git.bb} (85%)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-ust/lttng-ust-Fix-live-timer-calculation-error.patch
 rename meta/recipes-lsb4/libpng/{libpng12_1.2.53.bb => libpng12_1.2.54.bb} (70%)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.17.bb => libpng_1.6.19.bb} (62%)
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0001-card-add-pa_card_profile.ports.patch
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0002-alsa-bluetooth-fail-if-user-requested-profile-doesn-.patch
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0003-card-move-profile-selection-after-pa_card_new.patch
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0004-alsa-set-availability-for-some-unavailable-profiles.patch
 create mode 100644 meta/recipes-support/apr/apr/configure.in-fix-LTFLAGS-to-make-it-work-with-ccache.patch
 create mode 100644 meta/recipes-support/db/db/Makefile-let-libdb-6.0.la-depend-os_map.l.patch
 rename meta/recipes-support/gnutls/{libtasn1_4.5.bb => libtasn1_4.7.bb} (81%)
 rename meta/recipes-support/libunistring/{libunistring_0.9.5.bb => libunistring_0.9.6.bb} (90%)
 rename meta/recipes-support/sqlite/{sqlite3_3.9.0.bb => sqlite3_3.9.2.bb} (81%)
 rename scripts/contrib/python/{generate-manifest-3.4.py => generate-manifest-3.5.py} (99%)
 create mode 100644 scripts/lib/recipetool/setvar.py

-- 
2.1.4


