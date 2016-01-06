Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id B142C601A5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jan 2016 16:07:49 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id b14so82302396wmb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jan 2016 08:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=Q3t13b2otzGf40t5oXnl037NYk/rJIX/HHv+fcHnG4U=;
	b=laSQxOmbbjAK3zyTUFKev8BxNM8IBNACDy4LRPHNQVGjqQDHClwy/BUpHpXEK8oFyb
	HLsobrSbXOzcnfP6t3DvL5z1WOmo1NYa9s7ELH0wdcyY3J1vGb/hueS6ahjNqCN/dLVn
	Sb3gx4xotOKPTlyLLpd+h63Yscd1sbBBlOqFpKO9O68AelUliw/jvBh0egcHyfB4+CSR
	FUEQTe7VVzZJMhMkWBWp2NuPCSUqTu6iM+kFzRk6bEfrMRsem0kl3Jx7PyJQgz8Givfu
	KS5FyM+3F/Qkh7XbtRZlallu2E8Qo0GnZOxStnGixXbtTGFq1IANVunbfIdJ56YWGd8p
	wzQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-type:content-transfer-encoding;
	bh=Q3t13b2otzGf40t5oXnl037NYk/rJIX/HHv+fcHnG4U=;
	b=Y+O14a5shubjnFVIAg+i11y1oQICSjSjWKGcnDm/+kgmupuMK5sh9ye0Q+aBv9X/1b
	UEFA9MY4wPFlvp/PaGowgwNM5+iCZWhMybFLytJ+3qgGI1php5NKbMN1IXZLF2zYqmMO
	wSrzVxBDeLUcU+e7PSUU7hg8AlhyCoe9BSYUB5HeOPB1lmYVP1NFGGEYscAGJOFvcDpO
	DRfwEDxn+f/RLy3qyI6CyrkIAiS81ulEP5jhWZ7cEvP/RaH1TMv2whTJOKnVqxFDcbbA
	Y7ViolnL/DictJPaknvWyf8kWyncgzp47lFdDl2LRHi1ncymeUgKpA6BwqmvLDntP7G1
	5HTA==
X-Gm-Message-State: ALoCoQlUKykNM78UbeiXOvzrsdfms4qod23/aAanY3hrosqgApqGxMsy2VPJioc+Ye9vr43BnhOVLVVBgjyjLEMqN7XJscpTUQ==
X-Received: by 10.28.217.83 with SMTP id q80mr10599311wmg.15.1452096470254;
	Wed, 06 Jan 2016 08:07:50 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id a63sm9371661wmc.5.2016.01.06.08.07.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 06 Jan 2016 08:07:48 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Jan 2016 16:07:43 +0000
Message-Id: <cover.1452096306.git.ross.burton@intel.com>
X-Mailer: git-send-email 2.6.4
MIME-Version: 1.0
Subject: [PATCH 00/63] Consolidated pull
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
X-List-Received-Date: Wed, 06 Jan 2016 16:07:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

Highlights include ARM tune rationalisation from LG, no more meta-qt4, moving
from libjpeg to libjpeg-turbo, no more x11vnc.

Ross

The following changes since commit 4bfe2be707bcdbd2379b3fb775d95fcc826307ee:

  bitbake: ast: Add filename/lineno to mapped functions (2016-01-05 23:02:52 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ross/mut

for you to fetch changes up to 2e5279267bf5d74c8ef2fabb3f061280e49e551a:

  boost: ensure boost to remain an empty metapackage (2016-01-06 15:26:33 +0000)

----------------------------------------------------------------
Alexander Kanavin (3):
      qt4: remove recipes and classes
      packagegroup-core-lsb: treat qt4 packages same as qt3 packages
      meta-yocto: drop qt4 references

Andre McCurdy (1):
      security_flags.inc: disable -fstack-protector-XXX for valgrind

Aníbal Limón (1):
      dev-manual: Fix errata in new kvm-vhost.

Awais Belal (1):
      grub2: Fix CVE-2015-8370

Bruce Ashfield (2):
      yocto-bsp: remove 3.14 and 3.19 bbappends
      poky-lsb/poky-tiny: update preferred kernel to 4.1

Daniel Istrate (5):
      selftest: moved tc test_buildhistory_does_not_change_signatures
      oe-selftest: Improved --list-classes when determining test names
      oe-selftest: New option --list-tests
      selftest: Added testcase decorators for 2 tests
      scripts/oe-selftest: Allow to run tests on random/all MACHINEs

Ed Bartosh (1):
      native: fix incorrect addition of -native suffix

Humberto Ibarra (2):
      scripts/yocto-layer: Avoids duplication of "meta-" prefix
      scripts/oe-selftest: Remove extra coverage data added to unittests

Ioan-Adrian Ratiu (3):
      x11vnc: move recipe to meta-oe
      x11vnc: move recipe to meta-oe
      x11vnc: remove all references to moved package

Joseph A. Lutz (1):
      readline: move inputrc into readline

Kai Kang (2):
      bash: fix buildpaths qa check error
      gccmakedep: fix buildpaths qa check

Khem Raj (1):
      valgrind: Define __UCLIBC__ for uclibc based systems

Lukas Bulwahn (1):
      boost: ensure boost to remain an empty metapackage

Mariano Lopez (1):
      image_types.bbclass: Rebuild when WICVARS change

Martin Jansa (17):
      sstate-sysroot-cruft.sh: Extend the whitelist
      pulseaudio: add PACKAGECONFIG for lirc
      sanity.bbclass: add more information to error message about TUNE_PKGARCH missing in PACKAGE_ARCHS
      tune-cortexr4.inc: fix PACKAGE_EXTRA_ARCHS
      arch-armv7a: add missing space before ?=
      arch-armv7a, tune-cortexa*: improve comment VFP -> HF
      arch-armv7a, tune-cortexa*: improve indentation
      arm/arch-arm*, tune-cortexa*, tune-thunderx.inc, powerpac/arch-powerpc64.inc: Use normal assignment
      arch-armv[456]*.inc: improve indentation like armv7a
      arch-armv5.inc: drop duplicate ARMPKGSFX_DSP and PACKAGE_EXTRA_ARCHS_tune-armv5tehf-vfp
      arch-armv7a.inc: Fix PACKAGE_EXTRA_ARCHS for tune-armv7atb-vfpv3, tune-armv7atb-vfpv3d16, cortexa7thf-neon-vfpv4
      arch-armv7a.inc: add vfpv4 support also to softfp and big endiand tunes
      feature-arm-{neon,vfp}.inc: refactor and fix issues
      feature-arm-vfp.inc: Further simplify with TUNE_CCARGS_MFLOAT
      cortexa{7,15,17}: add VFPv4 tunes
      arch-armv7ve: add tune include for armv7ve and use it from cortexa7 and cortexa15
      tune-*: use mcpu instead of mtune for ARM tunes

Maxin B. John (3):
      packagegroup-core-x11-sato: enable pcmanfm on mips
      iptables: upgrade to 1.6.0
      libjpeg: Replace libjpeg with libjpeg-turbo

Noor Ahsan (1):
      wic: rawcopy: Copy source file to build folder

Paul Eggleton (1):
      classes/buildhistory: actually use KiB in extensible SDK sizes files

Phil Blundell (1):
      openjade: Fix build if not installing libtool .la files

Robert Yang (1):
      python3: fix installed-vs-shipped when 64bit + multilib

Ross Burton (10):
      cooker: use in instead of count
      cooker: fix findFilesMatchingInDir documentation
      conf/local.conf.sample: comment out ASSUME_PROVIDED=libsdl-native
      meta/conf/layer.conf: bump layer version due to Qt4 removal
      gcc-sanitizers: link directly against sysroot libstc++
      systemd: add more compression and importd PACKAGECONFIGs
      systemd: enable compatibility libraries by default
      oeqa/selftest/recipetool: update for libjpeg-turbo migration
      maintainers.inc: remove x11vnc
      testimage: remove VNC test, x11vnc isn't in oe-core anymore

Trevor Woerner (2):
      mkefidisk.sh: add startup script for automated boot
      mkefidisk.sh: add boot log on console

Zhixiong Chi (1):
      expat: CVE-2015-1283

fli (1):
      package_manager.py: extract target arch from TARGET_SYS

 bitbake/lib/bb/cooker.py                           |   9 +-
 documentation/dev-manual/dev-manual-qemu.xml       |   8 +-
 meta-yocto/conf/distro/include/maintainers.inc     |  16 -
 meta-yocto/conf/distro/poky-lsb.conf               |   2 +-
 meta-yocto/conf/distro/poky-tiny.conf              |   3 +-
 meta-yocto/conf/local.conf.sample                  |   7 +-
 meta-yocto/conf/local.conf.sample.extended         |   3 +-
 meta/classes/buildhistory.bbclass                  |   3 +-
 meta/classes/core-image.bbclass                    |   2 -
 meta/classes/image_types.bbclass                   |   3 +-
 meta/classes/native.bbclass                        |   4 +-
 meta/classes/qmake2.bbclass                        |  27 --
 meta/classes/qmake_base.bbclass                    | 119 -----
 meta/classes/qt4e.bbclass                          |  21 -
 meta/classes/qt4x11.bbclass                        |  14 -
 meta/classes/sanity.bbclass                        |   3 +-
 meta/classes/testimage.bbclass                     |   6 +-
 meta/conf/distro/include/default-distrovars.inc    |   2 -
 meta/conf/distro/include/distro_alias.inc          |  21 -
 meta/conf/distro/include/security_flags.inc        |   2 +-
 meta/conf/documentation.conf                       |   1 -
 meta/conf/layer.conf                               |   2 +-
 meta/conf/machine/include/arm/arch-arm.inc         |   3 +-
 meta/conf/machine/include/arm/arch-arm64.inc       |   6 +-
 meta/conf/machine/include/arm/arch-armv4.inc       |  16 +-
 meta/conf/machine/include/arm/arch-armv5-dsp.inc   |  56 +--
 meta/conf/machine/include/arm/arch-armv5.inc       |  61 ++-
 meta/conf/machine/include/arm/arch-armv6.inc       |  64 +--
 meta/conf/machine/include/arm/arch-armv7a.inc      | 230 +++++-----
 meta/conf/machine/include/arm/arch-armv7ve.inc     | 141 ++++++
 meta/conf/machine/include/arm/feature-arm-neon.inc |  19 +-
 .../conf/machine/include/arm/feature-arm-thumb.inc |   1 +
 meta/conf/machine/include/arm/feature-arm-vfp.inc  |  23 +-
 .../machine/include/powerpc/arch-powerpc64.inc     |   2 +-
 meta/conf/machine/include/tune-arm1136jf-s.inc     |   2 +-
 meta/conf/machine/include/tune-arm920t.inc         |   2 +-
 meta/conf/machine/include/tune-arm926ejs.inc       |   2 +-
 meta/conf/machine/include/tune-arm9tdmi.inc        |   2 +-
 meta/conf/machine/include/tune-cortexa15.inc       |  72 +--
 meta/conf/machine/include/tune-cortexa17.inc       |  68 +--
 meta/conf/machine/include/tune-cortexa5.inc        |  52 +--
 meta/conf/machine/include/tune-cortexa7.inc        |  74 ++--
 meta/conf/machine/include/tune-cortexa8.inc        |  52 +--
 meta/conf/machine/include/tune-cortexa9.inc        |  52 +--
 meta/conf/machine/include/tune-cortexm1.inc        |   2 +-
 meta/conf/machine/include/tune-cortexm3.inc        |   2 +-
 meta/conf/machine/include/tune-cortexr4.inc        |   4 +-
 meta/conf/machine/include/tune-ep9312.inc          |   2 +-
 meta/conf/machine/include/tune-iwmmxt.inc          |   2 +-
 meta/conf/machine/include/tune-strongarm1100.inc   |   2 +-
 meta/conf/machine/include/tune-thunderx.inc        |   4 +-
 meta/conf/machine/include/tune-xscale.inc          |   2 +-
 meta/lib/oe/package_manager.py                     |  10 +
 meta/lib/oeqa/runtime/vnc.py                       |  20 -
 meta/lib/oeqa/selftest/base.py                     |  64 ++-
 meta/lib/oeqa/selftest/buildhistory.py             |  64 +--
 meta/lib/oeqa/selftest/buildoptions.py             |  64 +++
 meta/lib/oeqa/selftest/devtool.py                  |   1 +
 meta/lib/oeqa/selftest/recipetool.py               |   3 +-
 ...E-2015-8370-Grub2-user-pass-vulnerability.patch |  52 +++
 meta/recipes-bsp/grub/grub2.inc                    |   1 +
 meta/recipes-core/base-files/base-files_3.0.14.bb  |   4 +-
 .../expat/expat-2.1.0/expat-CVE-2015-1283.patch    |  62 +++
 meta/recipes-core/expat/expat.inc                  |   4 +-
 meta/recipes-core/jpeg/jpeg_9a.bb                  |  29 --
 .../base-files => readline/files}/inputrc          |   0
 meta/recipes-core/readline/readline.inc            |   6 +
 meta/recipes-core/systemd/systemd_228.bb           |  10 +-
 meta/recipes-devtools/gcc/gcc-sanitizers.inc       |   9 +-
 .../openjade/openjade-1.3.2/no-libtool.patch       |  20 +
 .../openjade/openjade-native_1.3.2.bb              |   3 +-
 .../python/python3/configure.ac-fix-LIBPL.patch    |  30 ++
 meta/recipes-devtools/python/python3_3.5.0.bb      |   1 +
 meta/recipes-devtools/valgrind/valgrind_3.10.1.bb  |   2 +
 meta/recipes-extended/bash/bash.inc                |   6 +-
 ...Add-option-to-enable-disable-libnfnetlink.patch |  50 +--
 .../iptables/0001-fix-build-with-musl.patch        |  69 +--
 .../{iptables_1.4.21.bb => iptables_1.6.0.bb}      |   9 +-
 .../packagegroups/packagegroup-core-lsb.bb         |  12 +-
 .../jpeg/libjpeg-turbo_8d+1.4.2.bb                 |  39 ++
 .../recipes-graphics/x11vnc/files/endian-fix.patch |  24 -
 .../x11vnc/files/starting-fix.patch                |  25 --
 meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb      |  28 --
 .../recipes-graphics/xorg-util/gccmakedep_1.0.3.bb |   6 +-
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |   1 +
 meta/recipes-qt/images/qt4e-demo-image.bb          |  14 -
 meta/recipes-qt/meta/meta-toolchain-qt.bb          |   5 -
 meta/recipes-qt/meta/meta-toolchain-qt.inc         |  35 --
 meta/recipes-qt/meta/meta-toolchain-qte.bb         |   6 -
 .../nativesdk-packagegroup-qt-toolchain-host.bb    |   3 -
 .../nativesdk-packagegroup-qt-toolchain-host.inc   |   6 -
 .../nativesdk-packagegroup-qte-toolchain-host.bb   |   3 -
 .../packagegroups/packagegroup-core-qt.bb          |  22 -
 .../packagegroups/packagegroup-core-qt4e.bb        |  52 ---
 .../packagegroup-qt-toolchain-target.bb            |  15 -
 .../packagegroup-qt-toolchain-target.inc           |  39 --
 .../packagegroup-qte-toolchain-target.bb           |   7 -
 .../ExportWizard-depends-on-ui_wizard.patch        |  18 -
 meta/recipes-qt/qt-apps/fotowall_0.9.bb            |  29 --
 meta/recipes-qt/qt-apps/qmmp/no-host-paths.patch   |  26 --
 meta/recipes-qt/qt-apps/qmmp_0.8.6.bb              |  72 ---
 meta/recipes-qt/qt-apps/quicky_0.4.bb              |  21 -
 meta/recipes-qt/qt-demo/qt-demo-init/qtdemo-init   |  55 ---
 meta/recipes-qt/qt-demo/qt-demo-init_0.1.bb        |  19 -
 .../qt4-graphics-system/qt4-graphics-system_1.0.bb |  25 --
 meta/recipes-qt/qt4/nativesdk-qt4-tools.inc        | 128 ------
 meta/recipes-qt/qt4/nativesdk-qt4-tools_4.8.7.bb   |   6 -
 meta/recipes-qt/qt4/qt4-4.8.7.inc                  |  72 ---
 ...o-allow-to-set-qt.conf-from-the-outside-u.patch |  43 --
 ...tty_qws-fix-build-with-old-kernel-headers.patch |  50 ---
 ...003-webkit2-set-OUTPUT_DIR-value-if-empty.patch |  34 --
 ...make-is-already-built-in-qt4-tools-native.patch |  29 --
 ...e-set-LFLAGS-to-pick-up-zlib-from-staging.patch |  28 --
 ...se-OE_QMAKE_-values-to-specify-Qt-utility.patch |  38 --
 ...-const-usage-that-causes-compile-failure-.patch |  34 --
 ...llow-building-a-separate-qmake-for-the-ta.patch |  29 --
 ...e-fix-source-file-references-in-qmake.pri.patch |  52 ---
 ...ack-to-not-use-the-pg_config-of-the-host-.patch |  46 --
 .../qt4-4.8.7/0011-freetype-host-includes.patch    |  29 --
 .../qt4/qt4-4.8.7/0012-Add-2bpp-support.patch      | 318 -------------
 .../0013-configure-add-crossarch-option.patch      |  51 ---
 ...tions-fix-phony-translation-linking-error.patch |  41 --
 ...-configure-add-nostrip-for-debug-packages.patch |  32 --
 .../qt4-4.8.7/0016-configure-eval-QMAKE_CXX.patch  |  37 --
 ...nsure-we-identify-the-compiler-as-g-in-co.patch |  46 --
 ...ure-make-pulseaudio-a-configurable-option.patch |  46 --
 ...xes-for-gcc-4.7.0-particularly-on-qemux86.patch |  63 ---
 ...ake-qt4-native-work-with-long-building-pa.patch |  95 ----
 ...ls.pro-disable-qmeegographicssystemhelper.patch |  28 --
 .../0030-aarch64_arm64_qatomic_support.patch       | 491 ---------------------
 .../qt4/qt4-4.8.7/0031-aarch64_arm64_mkspecs.patch | 124 ------
 .../qt4/qt4-4.8.7/0032-aarch64_add_header.patch    |  18 -
 ...figure-support-c-0x-standard-for-directfd.patch |  40 --
 .../0034-Fix-kmap2qmap-build-with-clang.patch      |  34 --
 .../Fix-QWSLock-invalid-argument-logs.patch        |  98 ----
 .../qt4/qt4-4.8.7/add_check_for_aarch64_32.patch   |  55 ---
 meta/recipes-qt/qt4/qt4-4.8.7/g++.conf             |  40 --
 meta/recipes-qt/qt4/qt4-4.8.7/linux.conf           |  66 ---
 meta/recipes-qt/qt4/qt4-4.8.7/qte.sh               |   7 -
 meta/recipes-qt/qt4/qt4-embedded.inc               |  74 ----
 meta/recipes-qt/qt4/qt4-embedded_4.8.7.bb          |   9 -
 meta/recipes-qt/qt4/qt4-native.inc                 | 116 -----
 meta/recipes-qt/qt4/qt4-native_4.8.7.bb            |   6 -
 meta/recipes-qt/qt4/qt4-x11-free.inc               |  38 --
 meta/recipes-qt/qt4/qt4-x11-free_4.8.7.bb          |   9 -
 meta/recipes-qt/qt4/qt4.inc                        | 392 ----------------
 meta/recipes-qt/qt4/qt4_arch.inc                   |  22 -
 meta/recipes-sato/images/core-image-sato-sdk.bb    |   6 +-
 .../packagegroups/packagegroup-core-x11-sato.bb    |   4 -
 meta/recipes-support/boost/boost.inc               |   1 +
 meta/recipes.txt                                   |   1 -
 scripts/contrib/mkefidisk.sh                       |   7 +-
 .../linux/linux-yocto-rt_3.14.bbappend             |  33 --
 .../linux/linux-yocto-tiny_3.14.bbappend           |  33 --
 .../linux/linux-yocto-tiny_3.19.bbappend           |  33 --
 .../recipes-kernel/linux/linux-yocto_3.14.bbappend |  32 --
 .../recipes-kernel/linux/linux-yocto_3.19.bbappend |  32 --
 .../linux/linux-yocto-rt_3.14.bbappend             |  33 --
 .../linux/linux-yocto-tiny_3.14.bbappend           |  33 --
 .../linux/linux-yocto-tiny_3.19.bbappend           |  33 --
 .../recipes-kernel/linux/linux-yocto_3.14.bbappend |  32 --
 .../recipes-kernel/linux/linux-yocto_3.19.bbappend |  32 --
 .../linux/linux-yocto-rt_3.14.bbappend             |  33 --
 .../linux/linux-yocto-tiny_3.14.bbappend           |  33 --
 .../linux/linux-yocto-tiny_3.19.bbappend           |  33 --
 .../recipes-kernel/linux/linux-yocto_3.14.bbappend |  32 --
 .../recipes-kernel/linux/linux-yocto_3.19.bbappend |  32 --
 .../linux/linux-yocto-rt_3.14.bbappend             |  33 --
 .../linux/linux-yocto-tiny_3.14.bbappend           |  33 --
 .../linux/linux-yocto-tiny_3.19.bbappend           |  33 --
 .../recipes-kernel/linux/linux-yocto_3.14.bbappend |  32 --
 .../recipes-kernel/linux/linux-yocto_3.19.bbappend |  32 --
 .../linux/linux-yocto-rt_3.14.bbappend             |  33 --
 .../linux/linux-yocto-tiny_3.14.bbappend           |  33 --
 .../linux/linux-yocto-tiny_3.19.bbappend           |  33 --
 .../recipes-kernel/linux/linux-yocto_3.14.bbappend |  32 --
 .../recipes-kernel/linux/linux-yocto_3.19.bbappend |  32 --
 .../linux/linux-yocto-rt_3.14.bbappend             |  62 ---
 .../linux/linux-yocto-tiny_3.14.bbappend           |  62 ---
 .../linux/linux-yocto-tiny_3.19.bbappend           |  62 ---
 .../recipes-kernel/linux/linux-yocto_3.14.bbappend |  61 ---
 .../recipes-kernel/linux/linux-yocto_3.19.bbappend |  61 ---
 .../linux/linux-yocto-rt_3.14.bbappend             |  33 --
 .../linux/linux-yocto-tiny_3.14.bbappend           |  33 --
 .../linux/linux-yocto-tiny_3.19.bbappend           |  33 --
 .../recipes-kernel/linux/linux-yocto_3.14.bbappend |  32 --
 .../recipes-kernel/linux/linux-yocto_3.19.bbappend |  32 --
 scripts/lib/wic/plugins/source/rawcopy.py          |   7 +-
 scripts/oe-selftest                                | 230 ++++++----
 scripts/sstate-sysroot-cruft.sh                    |  18 +-
 scripts/yocto-layer                                |   6 +-
 191 files changed, 1245 insertions(+), 5833 deletions(-)
 delete mode 100644 meta/classes/qmake2.bbclass
 delete mode 100644 meta/classes/qmake_base.bbclass
 delete mode 100644 meta/classes/qt4e.bbclass
 delete mode 100644 meta/classes/qt4x11.bbclass
 create mode 100644 meta/conf/machine/include/arm/arch-armv7ve.inc
 delete mode 100644 meta/lib/oeqa/runtime/vnc.py
 create mode 100644 meta/recipes-bsp/grub/files/0001-Fix-CVE-2015-8370-Grub2-user-pass-vulnerability.patch
 create mode 100644 meta/recipes-core/expat/expat-2.1.0/expat-CVE-2015-1283.patch
 delete mode 100644 meta/recipes-core/jpeg/jpeg_9a.bb
 rename meta/recipes-core/{base-files/base-files => readline/files}/inputrc (100%)
 create mode 100644 meta/recipes-devtools/openjade/openjade-1.3.2/no-libtool.patch
 create mode 100644 meta/recipes-devtools/python/python3/configure.ac-fix-LIBPL.patch
 rename meta/recipes-extended/iptables/{iptables_1.4.21.bb => iptables_1.6.0.bb} (84%)
 create mode 100644 meta/recipes-graphics/jpeg/libjpeg-turbo_8d+1.4.2.bb
 delete mode 100644 meta/recipes-graphics/x11vnc/files/endian-fix.patch
 delete mode 100644 meta/recipes-graphics/x11vnc/files/starting-fix.patch
 delete mode 100644 meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb
 delete mode 100644 meta/recipes-qt/images/qt4e-demo-image.bb
 delete mode 100644 meta/recipes-qt/meta/meta-toolchain-qt.bb
 delete mode 100644 meta/recipes-qt/meta/meta-toolchain-qt.inc
 delete mode 100644 meta/recipes-qt/meta/meta-toolchain-qte.bb
 delete mode 100644 meta/recipes-qt/packagegroups/nativesdk-packagegroup-qt-toolchain-host.bb
 delete mode 100644 meta/recipes-qt/packagegroups/nativesdk-packagegroup-qt-toolchain-host.inc
 delete mode 100644 meta/recipes-qt/packagegroups/nativesdk-packagegroup-qte-toolchain-host.bb
 delete mode 100644 meta/recipes-qt/packagegroups/packagegroup-core-qt.bb
 delete mode 100644 meta/recipes-qt/packagegroups/packagegroup-core-qt4e.bb
 delete mode 100644 meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.bb
 delete mode 100644 meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.inc
 delete mode 100644 meta/recipes-qt/packagegroups/packagegroup-qte-toolchain-target.bb
 delete mode 100644 meta/recipes-qt/qt-apps/fotowall/ExportWizard-depends-on-ui_wizard.patch
 delete mode 100644 meta/recipes-qt/qt-apps/fotowall_0.9.bb
 delete mode 100644 meta/recipes-qt/qt-apps/qmmp/no-host-paths.patch
 delete mode 100644 meta/recipes-qt/qt-apps/qmmp_0.8.6.bb
 delete mode 100644 meta/recipes-qt/qt-apps/quicky_0.4.bb
 delete mode 100644 meta/recipes-qt/qt-demo/qt-demo-init/qtdemo-init
 delete mode 100644 meta/recipes-qt/qt-demo/qt-demo-init_0.1.bb
 delete mode 100644 meta/recipes-qt/qt4-graphics-system/qt4-graphics-system_1.0.bb
 delete mode 100644 meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
 delete mode 100644 meta/recipes-qt/qt4/nativesdk-qt4-tools_4.8.7.bb
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7.inc
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0001-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0002-qkbdtty_qws-fix-build-with-old-kernel-headers.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0003-webkit2-set-OUTPUT_DIR-value-if-empty.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0004-configure-qmake-is-already-built-in-qt4-tools-native.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0005-configure-set-LFLAGS-to-pick-up-zlib-from-staging.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0006-configure-Use-OE_QMAKE_-values-to-specify-Qt-utility.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0007-dbus-Remove-const-usage-that-causes-compile-failure-.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0008-qmake.pro-Allow-building-a-separate-qmake-for-the-ta.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0009-qmake-fix-source-file-references-in-qmake.pri.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0010-configure-Hack-to-not-use-the-pg_config-of-the-host-.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0011-freetype-host-includes.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0012-Add-2bpp-support.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0013-configure-add-crossarch-option.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0014-translations-fix-phony-translation-linking-error.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0015-configure-add-nostrip-for-debug-packages.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0016-configure-eval-QMAKE_CXX.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0017-configure-ensure-we-identify-the-compiler-as-g-in-co.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0018-configure-make-pulseaudio-a-configurable-option.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0019-Fixes-for-gcc-4.7.0-particularly-on-qemux86.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0021-configure-make-qt4-native-work-with-long-building-pa.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0027-tools.pro-disable-qmeegographicssystemhelper.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0030-aarch64_arm64_qatomic_support.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0031-aarch64_arm64_mkspecs.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0032-aarch64_add_header.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0033-configure-support-c-0x-standard-for-directfd.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0034-Fix-kmap2qmap-build-with-clang.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/Fix-QWSLock-invalid-argument-logs.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/add_check_for_aarch64_32.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/g++.conf
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/linux.conf
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/qte.sh
 delete mode 100644 meta/recipes-qt/qt4/qt4-embedded.inc
 delete mode 100644 meta/recipes-qt/qt4/qt4-embedded_4.8.7.bb
 delete mode 100644 meta/recipes-qt/qt4/qt4-native.inc
 delete mode 100644 meta/recipes-qt/qt4/qt4-native_4.8.7.bb
 delete mode 100644 meta/recipes-qt/qt4/qt4-x11-free.inc
 delete mode 100644 meta/recipes-qt/qt4/qt4-x11-free_4.8.7.bb
 delete mode 100644 meta/recipes-qt/qt4/qt4.inc
 delete mode 100644 meta/recipes-qt/qt4/qt4_arch.inc
 delete mode 100644 scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/linux-yocto-rt_3.14.bbappend
 delete mode 100644 scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/linux-yocto-tiny_3.14.bbappend
 delete mode 100644 scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/linux-yocto-tiny_3.19.bbappend
 delete mode 100644 scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/linux-yocto_3.14.bbappend
 delete mode 100644 scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/linux-yocto_3.19.bbappend
 delete mode 100644 scripts/lib/bsp/substrate/target/arch/i386/recipes-kernel/linux/linux-yocto-rt_3.14.bbappend
 delete mode 100644 scripts/lib/bsp/substrate/target/arch/i386/recipes-kernel/linux/linux-yocto-tiny_3.14.bbappend
 delete mode 100644 scripts/lib/bsp/substrate/target/arch/i386/recipes-kernel/linux/linux-yocto-tiny_3.19.bbappend
 delete mode 100644 scripts/lib/bsp/substrate/target/arch/i386/recipes-kernel/linux/linux-yocto_3.14.bbappend
 delete mode 100644 scripts/lib/bsp/substrate/target/arch/i386/recipes-kernel/linux/linux-yocto_3.19.bbappend
 delete mode 100644 scripts/lib/bsp/substrate/target/arch/mips/recipes-kernel/linux/linux-yocto-rt_3.14.bbappend
 delete mode 100644 scripts/lib/bsp/substrate/target/arch/mips/recipes-kernel/linux/linux-yocto-tiny_3.14.bbappend
 delete mode 100644 scripts/lib/bsp/substrate/target/arch/mips/recipes-kernel/linux/linux-yocto-tiny_3.19.bbappend
 delete mode 100644 scripts/lib/bsp/substrate/target/arch/mips/recipes-kernel/linux/linux-yocto_3.14.bbappend
 delete mode 100644 scripts/lib/bsp/substrate/target/arch/mips/recipes-kernel/linux/linux-yocto_3.19.bbappend
 delete mode 100644 scripts/lib/bsp/substrate/target/arch/mips64/recipes-kernel/linux/linux-yocto-rt_3.14.bbappend
 delete mode 100644 scripts/lib/bsp/substrate/target/arch/mips64/recipes-kernel/linux/linux-yocto-tiny_3.14.bbappend
 delete mode 100644 scripts/lib/bsp/substrate/target/arch/mips64/recipes-kernel/linux/linux-yocto-tiny_3.19.bbappend
 delete mode 100644 scripts/lib/bsp/substrate/target/arch/mips64/recipes-kernel/linux/linux-yocto_3.14.bbappend
 delete mode 100644 scripts/lib/bsp/substrate/target/arch/mips64/recipes-kernel/linux/linux-yocto_3.19.bbappend
 delete mode 100644 scripts/lib/bsp/substrate/target/arch/powerpc/recipes-kernel/linux/linux-yocto-rt_3.14.bbappend
 delete mode 100644 scripts/lib/bsp/substrate/target/arch/powerpc/recipes-kernel/linux/linux-yocto-tiny_3.14.bbappend
 delete mode 100644 scripts/lib/bsp/substrate/target/arch/powerpc/recipes-kernel/linux/linux-yocto-tiny_3.19.bbappend
 delete mode 100644 scripts/lib/bsp/substrate/target/arch/powerpc/recipes-kernel/linux/linux-yocto_3.14.bbappend
 delete mode 100644 scripts/lib/bsp/substrate/target/arch/powerpc/recipes-kernel/linux/linux-yocto_3.19.bbappend
 delete mode 100644 scripts/lib/bsp/substrate/target/arch/qemu/recipes-kernel/linux/linux-yocto-rt_3.14.bbappend
 delete mode 100644 scripts/lib/bsp/substrate/target/arch/qemu/recipes-kernel/linux/linux-yocto-tiny_3.14.bbappend
 delete mode 100644 scripts/lib/bsp/substrate/target/arch/qemu/recipes-kernel/linux/linux-yocto-tiny_3.19.bbappend
 delete mode 100644 scripts/lib/bsp/substrate/target/arch/qemu/recipes-kernel/linux/linux-yocto_3.14.bbappend
 delete mode 100644 scripts/lib/bsp/substrate/target/arch/qemu/recipes-kernel/linux/linux-yocto_3.19.bbappend
 delete mode 100644 scripts/lib/bsp/substrate/target/arch/x86_64/recipes-kernel/linux/linux-yocto-rt_3.14.bbappend
 delete mode 100644 scripts/lib/bsp/substrate/target/arch/x86_64/recipes-kernel/linux/linux-yocto-tiny_3.14.bbappend
 delete mode 100644 scripts/lib/bsp/substrate/target/arch/x86_64/recipes-kernel/linux/linux-yocto-tiny_3.19.bbappend
 delete mode 100644 scripts/lib/bsp/substrate/target/arch/x86_64/recipes-kernel/linux/linux-yocto_3.14.bbappend
 delete mode 100644 scripts/lib/bsp/substrate/target/arch/x86_64/recipes-kernel/linux/linux-yocto_3.19.bbappend

Alexander Kanavin (3):
  qt4: remove recipes and classes
  packagegroup-core-lsb: treat qt4 packages same as qt3 packages
  meta-yocto: drop qt4 references

Andre McCurdy (1):
  security_flags.inc: disable -fstack-protector-XXX for valgrind

Aníbal Limón (1):
  dev-manual: Fix errata in new kvm-vhost.

Awais Belal (1):
  grub2: Fix CVE-2015-8370

Bruce Ashfield (2):
  yocto-bsp: remove 3.14 and 3.19 bbappends
  poky-lsb/poky-tiny: update preferred kernel to 4.1

Daniel Istrate (5):
  selftest: moved tc test_buildhistory_does_not_change_signatures
  oe-selftest: Improved --list-classes when determining test names
  oe-selftest: New option --list-tests
  selftest: Added testcase decorators for 2 tests
  scripts/oe-selftest: Allow to run tests on random/all MACHINEs

Ed Bartosh (1):
  native: fix incorrect addition of -native suffix

Humberto Ibarra (2):
  scripts/yocto-layer: Avoids duplication of "meta-" prefix
  scripts/oe-selftest: Remove extra coverage data added to unittests

Ioan-Adrian Ratiu (3):
  x11vnc: move recipe to meta-oe
  x11vnc: move recipe to meta-oe
  x11vnc: remove all references to moved package

Joseph A. Lutz (1):
  readline: move inputrc into readline

Kai Kang (2):
  bash: fix buildpaths qa check error
  gccmakedep: fix buildpaths qa check

Khem Raj (1):
  valgrind: Define __UCLIBC__ for uclibc based systems

Lukas Bulwahn (1):
  boost: ensure boost to remain an empty metapackage

Mariano Lopez (1):
  image_types.bbclass: Rebuild when WICVARS change

Martin Jansa (17):
  sstate-sysroot-cruft.sh: Extend the whitelist
  pulseaudio: add PACKAGECONFIG for lirc
  sanity.bbclass: add more information to error message about
    TUNE_PKGARCH missing in PACKAGE_ARCHS
  tune-cortexr4.inc: fix PACKAGE_EXTRA_ARCHS
  arch-armv7a: add missing space before ?=
  arch-armv7a, tune-cortexa*: improve comment VFP -> HF
  arch-armv7a, tune-cortexa*: improve indentation
  arm/arch-arm*, tune-cortexa*, tune-thunderx.inc,
    powerpac/arch-powerpc64.inc: Use normal assignment
  arch-armv[456]*.inc: improve indentation like armv7a
  arch-armv5.inc: drop duplicate ARMPKGSFX_DSP and
    PACKAGE_EXTRA_ARCHS_tune-armv5tehf-vfp
  arch-armv7a.inc: Fix PACKAGE_EXTRA_ARCHS for tune-armv7atb-vfpv3,
    tune-armv7atb-vfpv3d16, cortexa7thf-neon-vfpv4
  arch-armv7a.inc: add vfpv4 support also to softfp and big endiand
    tunes
  feature-arm-{neon,vfp}.inc: refactor and fix issues
  feature-arm-vfp.inc: Further simplify with TUNE_CCARGS_MFLOAT
  cortexa{7,15,17}: add VFPv4 tunes
  arch-armv7ve: add tune include for armv7ve and use it from cortexa7
    and cortexa15
  tune-*: use mcpu instead of mtune for ARM tunes

Maxin B. John (3):
  packagegroup-core-x11-sato: enable pcmanfm on mips
  iptables: upgrade to 1.6.0
  libjpeg: Replace libjpeg with libjpeg-turbo

Noor Ahsan (1):
  wic: rawcopy: Copy source file to build folder

Paul Eggleton (1):
  classes/buildhistory: actually use KiB in extensible SDK sizes files

Phil Blundell (1):
  openjade: Fix build if not installing libtool .la files

Robert Yang (1):
  python3: fix installed-vs-shipped when 64bit + multilib

Ross Burton (10):
  cooker: use in instead of count
  cooker: fix findFilesMatchingInDir documentation
  conf/local.conf.sample: comment out ASSUME_PROVIDED=libsdl-native
  meta/conf/layer.conf: bump layer version due to Qt4 removal
  gcc-sanitizers: link directly against sysroot libstc++
  systemd: add more compression and importd PACKAGECONFIGs
  systemd: enable compatibility libraries by default
  oeqa/selftest/recipetool: update for libjpeg-turbo migration
  maintainers.inc: remove x11vnc
  testimage: remove VNC test, x11vnc isn't in oe-core anymore

Trevor Woerner (2):
  mkefidisk.sh: add startup script for automated boot
  mkefidisk.sh: add boot log on console

Zhixiong Chi (1):
  expat: CVE-2015-1283

fli (1):
  package_manager.py: extract target arch from TARGET_SYS

 bitbake/lib/bb/cooker.py                           |   9 +-
 documentation/dev-manual/dev-manual-qemu.xml       |   8 +-
 meta-yocto/conf/distro/include/maintainers.inc     |  16 -
 meta-yocto/conf/distro/poky-lsb.conf               |   2 +-
 meta-yocto/conf/distro/poky-tiny.conf              |   3 +-
 meta-yocto/conf/local.conf.sample                  |   7 +-
 meta-yocto/conf/local.conf.sample.extended         |   3 +-
 meta/classes/buildhistory.bbclass                  |   3 +-
 meta/classes/core-image.bbclass                    |   2 -
 meta/classes/image_types.bbclass                   |   3 +-
 meta/classes/native.bbclass                        |   4 +-
 meta/classes/qmake2.bbclass                        |  27 --
 meta/classes/qmake_base.bbclass                    | 119 -----
 meta/classes/qt4e.bbclass                          |  21 -
 meta/classes/qt4x11.bbclass                        |  14 -
 meta/classes/sanity.bbclass                        |   3 +-
 meta/classes/testimage.bbclass                     |   6 +-
 meta/conf/distro/include/default-distrovars.inc    |   2 -
 meta/conf/distro/include/distro_alias.inc          |  21 -
 meta/conf/distro/include/security_flags.inc        |   2 +-
 meta/conf/documentation.conf                       |   1 -
 meta/conf/layer.conf                               |   2 +-
 meta/conf/machine/include/arm/arch-arm.inc         |   3 +-
 meta/conf/machine/include/arm/arch-arm64.inc       |   6 +-
 meta/conf/machine/include/arm/arch-armv4.inc       |  16 +-
 meta/conf/machine/include/arm/arch-armv5-dsp.inc   |  56 +--
 meta/conf/machine/include/arm/arch-armv5.inc       |  61 ++-
 meta/conf/machine/include/arm/arch-armv6.inc       |  64 +--
 meta/conf/machine/include/arm/arch-armv7a.inc      | 230 +++++-----
 meta/conf/machine/include/arm/arch-armv7ve.inc     | 141 ++++++
 meta/conf/machine/include/arm/feature-arm-neon.inc |  19 +-
 .../conf/machine/include/arm/feature-arm-thumb.inc |   1 +
 meta/conf/machine/include/arm/feature-arm-vfp.inc  |  23 +-
 .../machine/include/powerpc/arch-powerpc64.inc     |   2 +-
 meta/conf/machine/include/tune-arm1136jf-s.inc     |   2 +-
 meta/conf/machine/include/tune-arm920t.inc         |   2 +-
 meta/conf/machine/include/tune-arm926ejs.inc       |   2 +-
 meta/conf/machine/include/tune-arm9tdmi.inc        |   2 +-
 meta/conf/machine/include/tune-cortexa15.inc       |  72 +--
 meta/conf/machine/include/tune-cortexa17.inc       |  68 +--
 meta/conf/machine/include/tune-cortexa5.inc        |  52 +--
 meta/conf/machine/include/tune-cortexa7.inc        |  74 ++--
 meta/conf/machine/include/tune-cortexa8.inc        |  52 +--
 meta/conf/machine/include/tune-cortexa9.inc        |  52 +--
 meta/conf/machine/include/tune-cortexm1.inc        |   2 +-
 meta/conf/machine/include/tune-cortexm3.inc        |   2 +-
 meta/conf/machine/include/tune-cortexr4.inc        |   4 +-
 meta/conf/machine/include/tune-ep9312.inc          |   2 +-
 meta/conf/machine/include/tune-iwmmxt.inc          |   2 +-
 meta/conf/machine/include/tune-strongarm1100.inc   |   2 +-
 meta/conf/machine/include/tune-thunderx.inc        |   4 +-
 meta/conf/machine/include/tune-xscale.inc          |   2 +-
 meta/lib/oe/package_manager.py                     |  10 +
 meta/lib/oeqa/runtime/vnc.py                       |  20 -
 meta/lib/oeqa/selftest/base.py                     |  64 ++-
 meta/lib/oeqa/selftest/buildhistory.py             |  64 +--
 meta/lib/oeqa/selftest/buildoptions.py             |  64 +++
 meta/lib/oeqa/selftest/devtool.py                  |   1 +
 meta/lib/oeqa/selftest/recipetool.py               |   3 +-
 ...E-2015-8370-Grub2-user-pass-vulnerability.patch |  52 +++
 meta/recipes-bsp/grub/grub2.inc                    |   1 +
 meta/recipes-core/base-files/base-files_3.0.14.bb  |   4 +-
 .../expat/expat-2.1.0/expat-CVE-2015-1283.patch    |  62 +++
 meta/recipes-core/expat/expat.inc                  |   4 +-
 meta/recipes-core/jpeg/jpeg_9a.bb                  |  29 --
 .../base-files => readline/files}/inputrc          |   0
 meta/recipes-core/readline/readline.inc            |   6 +
 meta/recipes-core/systemd/systemd_228.bb           |  10 +-
 meta/recipes-devtools/gcc/gcc-sanitizers.inc       |   9 +-
 .../openjade/openjade-1.3.2/no-libtool.patch       |  20 +
 .../openjade/openjade-native_1.3.2.bb              |   3 +-
 .../python/python3/configure.ac-fix-LIBPL.patch    |  30 ++
 meta/recipes-devtools/python/python3_3.5.0.bb      |   1 +
 meta/recipes-devtools/valgrind/valgrind_3.10.1.bb  |   2 +
 meta/recipes-extended/bash/bash.inc                |   6 +-
 ...Add-option-to-enable-disable-libnfnetlink.patch |  50 +--
 .../iptables/0001-fix-build-with-musl.patch        |  69 +--
 .../{iptables_1.4.21.bb => iptables_1.6.0.bb}      |   9 +-
 .../packagegroups/packagegroup-core-lsb.bb         |  12 +-
 .../jpeg/libjpeg-turbo_8d+1.4.2.bb                 |  39 ++
 .../recipes-graphics/x11vnc/files/endian-fix.patch |  24 -
 .../x11vnc/files/starting-fix.patch                |  25 --
 meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb      |  28 --
 .../recipes-graphics/xorg-util/gccmakedep_1.0.3.bb |   6 +-
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |   1 +
 meta/recipes-qt/images/qt4e-demo-image.bb          |  14 -
 meta/recipes-qt/meta/meta-toolchain-qt.bb          |   5 -
 meta/recipes-qt/meta/meta-toolchain-qt.inc         |  35 --
 meta/recipes-qt/meta/meta-toolchain-qte.bb         |   6 -
 .../nativesdk-packagegroup-qt-toolchain-host.bb    |   3 -
 .../nativesdk-packagegroup-qt-toolchain-host.inc   |   6 -
 .../nativesdk-packagegroup-qte-toolchain-host.bb   |   3 -
 .../packagegroups/packagegroup-core-qt.bb          |  22 -
 .../packagegroups/packagegroup-core-qt4e.bb        |  52 ---
 .../packagegroup-qt-toolchain-target.bb            |  15 -
 .../packagegroup-qt-toolchain-target.inc           |  39 --
 .../packagegroup-qte-toolchain-target.bb           |   7 -
 .../ExportWizard-depends-on-ui_wizard.patch        |  18 -
 meta/recipes-qt/qt-apps/fotowall_0.9.bb            |  29 --
 meta/recipes-qt/qt-apps/qmmp/no-host-paths.patch   |  26 --
 meta/recipes-qt/qt-apps/qmmp_0.8.6.bb              |  72 ---
 meta/recipes-qt/qt-apps/quicky_0.4.bb              |  21 -
 meta/recipes-qt/qt-demo/qt-demo-init/qtdemo-init   |  55 ---
 meta/recipes-qt/qt-demo/qt-demo-init_0.1.bb        |  19 -
 .../qt4-graphics-system/qt4-graphics-system_1.0.bb |  25 --
 meta/recipes-qt/qt4/nativesdk-qt4-tools.inc        | 128 ------
 meta/recipes-qt/qt4/nativesdk-qt4-tools_4.8.7.bb   |   6 -
 meta/recipes-qt/qt4/qt4-4.8.7.inc                  |  72 ---
 ...o-allow-to-set-qt.conf-from-the-outside-u.patch |  43 --
 ...tty_qws-fix-build-with-old-kernel-headers.patch |  50 ---
 ...003-webkit2-set-OUTPUT_DIR-value-if-empty.patch |  34 --
 ...make-is-already-built-in-qt4-tools-native.patch |  29 --
 ...e-set-LFLAGS-to-pick-up-zlib-from-staging.patch |  28 --
 ...se-OE_QMAKE_-values-to-specify-Qt-utility.patch |  38 --
 ...-const-usage-that-causes-compile-failure-.patch |  34 --
 ...llow-building-a-separate-qmake-for-the-ta.patch |  29 --
 ...e-fix-source-file-references-in-qmake.pri.patch |  52 ---
 ...ack-to-not-use-the-pg_config-of-the-host-.patch |  46 --
 .../qt4-4.8.7/0011-freetype-host-includes.patch    |  29 --
 .../qt4/qt4-4.8.7/0012-Add-2bpp-support.patch      | 318 -------------
 .../0013-configure-add-crossarch-option.patch      |  51 ---
 ...tions-fix-phony-translation-linking-error.patch |  41 --
 ...-configure-add-nostrip-for-debug-packages.patch |  32 --
 .../qt4-4.8.7/0016-configure-eval-QMAKE_CXX.patch  |  37 --
 ...nsure-we-identify-the-compiler-as-g-in-co.patch |  46 --
 ...ure-make-pulseaudio-a-configurable-option.patch |  46 --
 ...xes-for-gcc-4.7.0-particularly-on-qemux86.patch |  63 ---
 ...ake-qt4-native-work-with-long-building-pa.patch |  95 ----
 ...ls.pro-disable-qmeegographicssystemhelper.patch |  28 --
 .../0030-aarch64_arm64_qatomic_support.patch       | 491 ---------------------
 .../qt4/qt4-4.8.7/0031-aarch64_arm64_mkspecs.patch | 124 ------
 .../qt4/qt4-4.8.7/0032-aarch64_add_header.patch    |  18 -
 ...figure-support-c-0x-standard-for-directfd.patch |  40 --
 .../0034-Fix-kmap2qmap-build-with-clang.patch      |  34 --
 .../Fix-QWSLock-invalid-argument-logs.patch        |  98 ----
 .../qt4/qt4-4.8.7/add_check_for_aarch64_32.patch   |  55 ---
 meta/recipes-qt/qt4/qt4-4.8.7/g++.conf             |  40 --
 meta/recipes-qt/qt4/qt4-4.8.7/linux.conf           |  66 ---
 meta/recipes-qt/qt4/qt4-4.8.7/qte.sh               |   7 -
 meta/recipes-qt/qt4/qt4-embedded.inc               |  74 ----
 meta/recipes-qt/qt4/qt4-embedded_4.8.7.bb          |   9 -
 meta/recipes-qt/qt4/qt4-native.inc                 | 116 -----
 meta/recipes-qt/qt4/qt4-native_4.8.7.bb            |   6 -
 meta/recipes-qt/qt4/qt4-x11-free.inc               |  38 --
 meta/recipes-qt/qt4/qt4-x11-free_4.8.7.bb          |   9 -
 meta/recipes-qt/qt4/qt4.inc                        | 392 ----------------
 meta/recipes-qt/qt4/qt4_arch.inc                   |  22 -
 meta/recipes-sato/images/core-image-sato-sdk.bb    |   6 +-
 .../packagegroups/packagegroup-core-x11-sato.bb    |   4 -
 meta/recipes-support/boost/boost.inc               |   1 +
 meta/recipes.txt                                   |   1 -
 scripts/contrib/mkefidisk.sh                       |   7 +-
 .../linux/linux-yocto-rt_3.14.bbappend             |  33 --
 .../linux/linux-yocto-tiny_3.14.bbappend           |  33 --
 .../linux/linux-yocto-tiny_3.19.bbappend           |  33 --
 .../recipes-kernel/linux/linux-yocto_3.14.bbappend |  32 --
 .../recipes-kernel/linux/linux-yocto_3.19.bbappend |  32 --
 .../linux/linux-yocto-rt_3.14.bbappend             |  33 --
 .../linux/linux-yocto-tiny_3.14.bbappend           |  33 --
 .../linux/linux-yocto-tiny_3.19.bbappend           |  33 --
 .../recipes-kernel/linux/linux-yocto_3.14.bbappend |  32 --
 .../recipes-kernel/linux/linux-yocto_3.19.bbappend |  32 --
 .../linux/linux-yocto-rt_3.14.bbappend             |  33 --
 .../linux/linux-yocto-tiny_3.14.bbappend           |  33 --
 .../linux/linux-yocto-tiny_3.19.bbappend           |  33 --
 .../recipes-kernel/linux/linux-yocto_3.14.bbappend |  32 --
 .../recipes-kernel/linux/linux-yocto_3.19.bbappend |  32 --
 .../linux/linux-yocto-rt_3.14.bbappend             |  33 --
 .../linux/linux-yocto-tiny_3.14.bbappend           |  33 --
 .../linux/linux-yocto-tiny_3.19.bbappend           |  33 --
 .../recipes-kernel/linux/linux-yocto_3.14.bbappend |  32 --
 .../recipes-kernel/linux/linux-yocto_3.19.bbappend |  32 --
 .../linux/linux-yocto-rt_3.14.bbappend             |  33 --
 .../linux/linux-yocto-tiny_3.14.bbappend           |  33 --
 .../linux/linux-yocto-tiny_3.19.bbappend           |  33 --
 .../recipes-kernel/linux/linux-yocto_3.14.bbappend |  32 --
 .../recipes-kernel/linux/linux-yocto_3.19.bbappend |  32 --
 .../linux/linux-yocto-rt_3.14.bbappend             |  62 ---
 .../linux/linux-yocto-tiny_3.14.bbappend           |  62 ---
 .../linux/linux-yocto-tiny_3.19.bbappend           |  62 ---
 .../recipes-kernel/linux/linux-yocto_3.14.bbappend |  61 ---
 .../recipes-kernel/linux/linux-yocto_3.19.bbappend |  61 ---
 .../linux/linux-yocto-rt_3.14.bbappend             |  33 --
 .../linux/linux-yocto-tiny_3.14.bbappend           |  33 --
 .../linux/linux-yocto-tiny_3.19.bbappend           |  33 --
 .../recipes-kernel/linux/linux-yocto_3.14.bbappend |  32 --
 .../recipes-kernel/linux/linux-yocto_3.19.bbappend |  32 --
 scripts/lib/wic/plugins/source/rawcopy.py          |   7 +-
 scripts/oe-selftest                                | 230 ++++++----
 scripts/sstate-sysroot-cruft.sh                    |  18 +-
 scripts/yocto-layer                                |   6 +-
 191 files changed, 1245 insertions(+), 5833 deletions(-)
 delete mode 100644 meta/classes/qmake2.bbclass
 delete mode 100644 meta/classes/qmake_base.bbclass
 delete mode 100644 meta/classes/qt4e.bbclass
 delete mode 100644 meta/classes/qt4x11.bbclass
 create mode 100644 meta/conf/machine/include/arm/arch-armv7ve.inc
 delete mode 100644 meta/lib/oeqa/runtime/vnc.py
 create mode 100644 meta/recipes-bsp/grub/files/0001-Fix-CVE-2015-8370-Grub2-user-pass-vulnerability.patch
 create mode 100644 meta/recipes-core/expat/expat-2.1.0/expat-CVE-2015-1283.patch
 delete mode 100644 meta/recipes-core/jpeg/jpeg_9a.bb
 rename meta/recipes-core/{base-files/base-files => readline/files}/inputrc (100%)
 create mode 100644 meta/recipes-devtools/openjade/openjade-1.3.2/no-libtool.patch
 create mode 100644 meta/recipes-devtools/python/python3/configure.ac-fix-LIBPL.patch
 rename meta/recipes-extended/iptables/{iptables_1.4.21.bb => iptables_1.6.0.bb} (84%)
 create mode 100644 meta/recipes-graphics/jpeg/libjpeg-turbo_8d+1.4.2.bb
 delete mode 100644 meta/recipes-graphics/x11vnc/files/endian-fix.patch
 delete mode 100644 meta/recipes-graphics/x11vnc/files/starting-fix.patch
 delete mode 100644 meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb
 delete mode 100644 meta/recipes-qt/images/qt4e-demo-image.bb
 delete mode 100644 meta/recipes-qt/meta/meta-toolchain-qt.bb
 delete mode 100644 meta/recipes-qt/meta/meta-toolchain-qt.inc
 delete mode 100644 meta/recipes-qt/meta/meta-toolchain-qte.bb
 delete mode 100644 meta/recipes-qt/packagegroups/nativesdk-packagegroup-qt-toolchain-host.bb
 delete mode 100644 meta/recipes-qt/packagegroups/nativesdk-packagegroup-qt-toolchain-host.inc
 delete mode 100644 meta/recipes-qt/packagegroups/nativesdk-packagegroup-qte-toolchain-host.bb
 delete mode 100644 meta/recipes-qt/packagegroups/packagegroup-core-qt.bb
 delete mode 100644 meta/recipes-qt/packagegroups/packagegroup-core-qt4e.bb
 delete mode 100644 meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.bb
 delete mode 100644 meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.inc
 delete mode 100644 meta/recipes-qt/packagegroups/packagegroup-qte-toolchain-target.bb
 delete mode 100644 meta/recipes-qt/qt-apps/fotowall/ExportWizard-depends-on-ui_wizard.patch
 delete mode 100644 meta/recipes-qt/qt-apps/fotowall_0.9.bb
 delete mode 100644 meta/recipes-qt/qt-apps/qmmp/no-host-paths.patch
 delete mode 100644 meta/recipes-qt/qt-apps/qmmp_0.8.6.bb
 delete mode 100644 meta/recipes-qt/qt-apps/quicky_0.4.bb
 delete mode 100644 meta/recipes-qt/qt-demo/qt-demo-init/qtdemo-init
 delete mode 100644 meta/recipes-qt/qt-demo/qt-demo-init_0.1.bb
 delete mode 100644 meta/recipes-qt/qt4-graphics-system/qt4-graphics-system_1.0.bb
 delete mode 100644 meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
 delete mode 100644 meta/recipes-qt/qt4/nativesdk-qt4-tools_4.8.7.bb
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7.inc
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0001-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0002-qkbdtty_qws-fix-build-with-old-kernel-headers.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0003-webkit2-set-OUTPUT_DIR-value-if-empty.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0004-configure-qmake-is-already-built-in-qt4-tools-native.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0005-configure-set-LFLAGS-to-pick-up-zlib-from-staging.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0006-configure-Use-OE_QMAKE_-values-to-specify-Qt-utility.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0007-dbus-Remove-const-usage-that-causes-compile-failure-.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0008-qmake.pro-Allow-building-a-separate-qmake-for-the-ta.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0009-qmake-fix-source-file-references-in-qmake.pri.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0010-configure-Hack-to-not-use-the-pg_config-of-the-host-.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0011-freetype-host-includes.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0012-Add-2bpp-support.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0013-configure-add-crossarch-option.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0014-translations-fix-phony-translation-linking-error.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0015-configure-add-nostrip-for-debug-packages.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0016-configure-eval-QMAKE_CXX.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0017-configure-ensure-we-identify-the-compiler-as-g-in-co.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0018-configure-make-pulseaudio-a-configurable-option.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0019-Fixes-for-gcc-4.7.0-particularly-on-qemux86.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0021-configure-make-qt4-native-work-with-long-building-pa.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0027-tools.pro-disable-qmeegographicssystemhelper.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0030-aarch64_arm64_qatomic_support.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0031-aarch64_arm64_mkspecs.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0032-aarch64_add_header.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0033-configure-support-c-0x-standard-for-directfd.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0034-Fix-kmap2qmap-build-with-clang.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/Fix-QWSLock-invalid-argument-logs.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/add_check_for_aarch64_32.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/g++.conf
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/linux.conf
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/qte.sh
 delete mode 100644 meta/recipes-qt/qt4/qt4-embedded.inc
 delete mode 100644 meta/recipes-qt/qt4/qt4-embedded_4.8.7.bb
 delete mode 100644 meta/recipes-qt/qt4/qt4-native.inc
 delete mode 100644 meta/recipes-qt/qt4/qt4-native_4.8.7.bb
 delete mode 100644 meta/recipes-qt/qt4/qt4-x11-free.inc
 delete mode 100644 meta/recipes-qt/qt4/qt4-x11-free_4.8.7.bb
 delete mode 100644 meta/recipes-qt/qt4/qt4.inc
 delete mode 100644 meta/recipes-qt/qt4/qt4_arch.inc
 delete mode 100644 scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/linux-yocto-rt_3.14.bbappend
 delete mode 100644 scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/linux-yocto-tiny_3.14.bbappend
 delete mode 100644 scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/linux-yocto-tiny_3.19.bbappend
 delete mode 100644 scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/linux-yocto_3.14.bbappend
 delete mode 100644 scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/linux-yocto_3.19.bbappend
 delete mode 100644 scripts/lib/bsp/substrate/target/arch/i386/recipes-kernel/linux/linux-yocto-rt_3.14.bbappend
 delete mode 100644 scripts/lib/bsp/substrate/target/arch/i386/recipes-kernel/linux/linux-yocto-tiny_3.14.bbappend
 delete mode 100644 scripts/lib/bsp/substrate/target/arch/i386/recipes-kernel/linux/linux-yocto-tiny_3.19.bbappend
 delete mode 100644 scripts/lib/bsp/substrate/target/arch/i386/recipes-kernel/linux/linux-yocto_3.14.bbappend
 delete mode 100644 scripts/lib/bsp/substrate/target/arch/i386/recipes-kernel/linux/linux-yocto_3.19.bbappend
 delete mode 100644 scripts/lib/bsp/substrate/target/arch/mips/recipes-kernel/linux/linux-yocto-rt_3.14.bbappend
 delete mode 100644 scripts/lib/bsp/substrate/target/arch/mips/recipes-kernel/linux/linux-yocto-tiny_3.14.bbappend
 delete mode 100644 scripts/lib/bsp/substrate/target/arch/mips/recipes-kernel/linux/linux-yocto-tiny_3.19.bbappend
 delete mode 100644 scripts/lib/bsp/substrate/target/arch/mips/recipes-kernel/linux/linux-yocto_3.14.bbappend
 delete mode 100644 scripts/lib/bsp/substrate/target/arch/mips/recipes-kernel/linux/linux-yocto_3.19.bbappend
 delete mode 100644 scripts/lib/bsp/substrate/target/arch/mips64/recipes-kernel/linux/linux-yocto-rt_3.14.bbappend
 delete mode 100644 scripts/lib/bsp/substrate/target/arch/mips64/recipes-kernel/linux/linux-yocto-tiny_3.14.bbappend
 delete mode 100644 scripts/lib/bsp/substrate/target/arch/mips64/recipes-kernel/linux/linux-yocto-tiny_3.19.bbappend
 delete mode 100644 scripts/lib/bsp/substrate/target/arch/mips64/recipes-kernel/linux/linux-yocto_3.14.bbappend
 delete mode 100644 scripts/lib/bsp/substrate/target/arch/mips64/recipes-kernel/linux/linux-yocto_3.19.bbappend
 delete mode 100644 scripts/lib/bsp/substrate/target/arch/powerpc/recipes-kernel/linux/linux-yocto-rt_3.14.bbappend
 delete mode 100644 scripts/lib/bsp/substrate/target/arch/powerpc/recipes-kernel/linux/linux-yocto-tiny_3.14.bbappend
 delete mode 100644 scripts/lib/bsp/substrate/target/arch/powerpc/recipes-kernel/linux/linux-yocto-tiny_3.19.bbappend
 delete mode 100644 scripts/lib/bsp/substrate/target/arch/powerpc/recipes-kernel/linux/linux-yocto_3.14.bbappend
 delete mode 100644 scripts/lib/bsp/substrate/target/arch/powerpc/recipes-kernel/linux/linux-yocto_3.19.bbappend
 delete mode 100644 scripts/lib/bsp/substrate/target/arch/qemu/recipes-kernel/linux/linux-yocto-rt_3.14.bbappend
 delete mode 100644 scripts/lib/bsp/substrate/target/arch/qemu/recipes-kernel/linux/linux-yocto-tiny_3.14.bbappend
 delete mode 100644 scripts/lib/bsp/substrate/target/arch/qemu/recipes-kernel/linux/linux-yocto-tiny_3.19.bbappend
 delete mode 100644 scripts/lib/bsp/substrate/target/arch/qemu/recipes-kernel/linux/linux-yocto_3.14.bbappend
 delete mode 100644 scripts/lib/bsp/substrate/target/arch/qemu/recipes-kernel/linux/linux-yocto_3.19.bbappend
 delete mode 100644 scripts/lib/bsp/substrate/target/arch/x86_64/recipes-kernel/linux/linux-yocto-rt_3.14.bbappend
 delete mode 100644 scripts/lib/bsp/substrate/target/arch/x86_64/recipes-kernel/linux/linux-yocto-tiny_3.14.bbappend
 delete mode 100644 scripts/lib/bsp/substrate/target/arch/x86_64/recipes-kernel/linux/linux-yocto-tiny_3.19.bbappend
 delete mode 100644 scripts/lib/bsp/substrate/target/arch/x86_64/recipes-kernel/linux/linux-yocto_3.14.bbappend
 delete mode 100644 scripts/lib/bsp/substrate/target/arch/x86_64/recipes-kernel/linux/linux-yocto_3.19.bbappend

-- 
2.6.4


