Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f176.google.com (mail-wr0-f176.google.com
	[209.85.128.176])
	by mail.openembedded.org (Postfix) with ESMTP id 171606FF73
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Jul 2017 23:47:00 +0000 (UTC)
Received: by mail-wr0-f176.google.com with SMTP id w4so14725146wrb.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Jul 2017 16:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=EPdFdjEBu4ovuLQeYzDEIg4b4J1RHniV3Kx9nRP9U5s=;
	b=Y7VEd6viY1iQOuygjNPDPNPP083cCTq0t2wV5dJKzfh/iVW33hS+8FwwCwJQ9VpJFB
	P8uqae6WGzmFUAj8z6VPMRItu2Pv6c3NWYmPx51FcEEkeVGK7MsDAoDETo5kUoE/8NLn
	8dgdMHvu9m5/4iVJKu5QkOeIsP8DtfkdbiE0KGe+ZPDLTrfbcRZm2Ef01iz+lXXPIuAC
	Nnvw8uhCBiLf91dXM0uAEvMGuTKbyLdD1totAn9BmxPlBHeTICFt886zU0lSPRr/FyxN
	jtoaxxXNzr59zTANVQYIOHJ/agFVs6blJ7cHCcM5hhe2V8UgbSsC/EVxY9j/KFfoiHX3
	wzag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=EPdFdjEBu4ovuLQeYzDEIg4b4J1RHniV3Kx9nRP9U5s=;
	b=fjbc1YW8aT2X/uXZshboPqs2TvNtdksEFUAbNPcRp1o9pArtAS6gu9Kc1qkCfmXdgM
	kRfk6REhREEJxgXypuz3EpfBHEzB0Z3FopZpuBM4VuYnlT/6FcMVocYhsA+U6NhUpin+
	Iq3iMWzFr/b/ioRGAWgreG/KH+NP8u5mT1bDPdWMUU9haGk4y4Wiuw0D8cXoh6jiUc6U
	hebJRFav4aVkokRCHuM46p0eK5K5md5+h+Xn9LDk0hFOJIECP30mTfuS8hLRzZyIfSdO
	aCGd6ZHoPXQnLMWQNvjx1jilknNH6gpq1fSPYvmd981sTq4Cm0RTvYRdP4ktRTN+Iyk6
	/3mA==
X-Gm-Message-State: AIVw113IjThX5V4y/OoemxYEGDY+88DALid+TAwDZ/lsCAGezQp38+or
	uv2C4fNevuViEnVh5CI=
X-Received: by 10.223.156.25 with SMTP id f25mr7868662wrc.14.1500248820790;
	Sun, 16 Jul 2017 16:47:00 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	z108sm22054896wrb.41.2017.07.16.16.46.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 16 Jul 2017 16:46:59 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Jul 2017 00:46:56 +0100
Message-Id: <cover.1500248731.git.ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 00/66] Consolidated pull
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
X-List-Received-Date: Sun, 16 Jul 2017 23:47:03 -0000

Hi,

A nice 66 series consolidated pull to start the freeze week with.

All green on the ABs, but note that this depends on a meta-mingw patch that I've
submitted and is in meta-mingw:master-next.

Ross

The following changes since commit 81498aac9560fbeaeb58eaada32ce80e0ea51628:

  yocto-project-qs: Updated Next Steps list (2017-07-12 00:28:16 +0100)

are available in the git repository at:

  ssh://git@git.yoctoproject.org/poky-contrib ross/mut

for you to fetch changes up to 24dc9bd180f629fda91fc5bd9e89bd57a0ff0707:

  webkitgtk: Upgrade to 2.16.5 (2017-07-17 00:40:14 +0100)

----------------------------------------------------------------
Bruce Ashfield (6):
      kernel-yocto: propagate configuration errors to bbclass
      kernel-yocto/meta: smp configuration changes
      linux-yocto/4.1: update to v4.1.42
      linux-yocto/4.4: update to v4.4.76
      linux-yocto/4.9: update to v4.9.36
      linux-yocto-dev: bump to 4.12+

California Sullivan (1):
      gnu-efi: Upgrade package to 3.0.6 and refresh patches

Carlos Alberto Lopez Perez (1):
      webkitgtk: Upgrade to 2.16.5

Changhyeok Bae (1):
      ethtool: Upgrade to 4.11

Dengke Du (2):
      dropbear: reduce local pending patches
      chrpath: reduce local pending patches

Denys Dmytriyenko (1):
      wayland-protocols: upgrade to 1.9

Ed Bartosh (13):
      runqemu: reworked exception handling
      runqemu: check exit code of 'ls -t'
      live-vm-common: add MKDOSFS_EXTRAOPTS variable
      wic: get rid of using wic-tools
      wic: isoimage: do not remove temp directory
      wic: build wic-tools only if wic is run manually
      wic: isoimage-isohybrid: check result of glob()
      wic-tools: don't create wic-tools.env
      image_types_wic: set default WKS_FILE_DEPENDS
      wic: isoimage-isohybrid: use grub-efi from deploy dir
      selftest: fixed 5 wic test cases
      imagefeatures: add test_image_fstypes test case
      image_types: fix squashfs-lzo and squashfs-xz builds

Fan Xin (1):
      apr: 1.5.2 -> 1.6.2

Hongxu Jia (1):
      dhcp: fix shutdown not work by SIGTERM while bind9 enable threads

Joshua Lock (4):
      poky: add Ubuntu 17.04 Zesty Zapus to SANITY_TESTED_DISTROS
      x86-base: build only hddimg, rather than iso and hddimg, for x86 machines
      mpc8315e-rdb: add wic.bmap to IMAGE_FSTYPES
      image_types: remove Hob convenience variable

Jussi Kukkonen (8):
      acpitests: Remove as unmaintained
      vulkan-demos: Add recipe
      selftest: Add vulkan-demos to checkpkg exceptions
      mesa: Avoid installing khrplatfrom.h when not needed
      mesa-gl: Clean recipe
      matchbox-desktop: Upgrade to 2.2
      python3-pygobject: Don't use gnome-common
      gnome-desktop: Don't use gnome-common

Kai Kang (1):
      bind: 9.10.3-P3 -> 9.10.5-P3

Khem Raj (2):
      gcc-cross: Fix linker and fortran symlinks
      gcc-7.1: Update the libsanitize stack_t patch to upstreamed version

Lans Zhang (2):
      gpg_sign.py: fix overwriting the RPM macro __gpg in a wrong way
      sign_rpm: support signing files in RPM payload

Maxin B. John (2):
      libx11: fix build error
      libxt: fix build failure

Otavio Salvador (1):
      libarchive: Upgrade to 3.3.2 release

Patrick Ohly (3):
      distrooverrides.bbclass: fix default configuration
      util-linux: fix "su -" and package su separately
      base-files: ignore "mesg n" error messages

Robert Yang (4):
      automake: 1.15 -> 1.15.1
      debianutils: 4.8.1 -> 4.8.1.1
      git: 2.11.1 -> 2.13.2
      libbsd: 0.8.3 -> 0.8.5

Ross Burton (9):
      ccache: don't export CCACHE_DISABLE globally
      bitbake.conf: add CCACHE_NOHASHDIR to hash whitelist
      ccache: let ccache create CCACHE_DIR, reducing hash changes
      lib/oe/sstatesig: exclude ccache-native from signature hashes
      classes/sanity: check for case-sensitive file systems
      valgrind: fix link failure with gold
      valgrind: fix ptest compilation for PowerPC
      mesa: fix build race on src/intel/vulkan
      libgcrypt: upgrade to 1.7.7

Shen Joon Tan (1):
      distro_alias.inc: update unmap packages to other distro

Soren Brinkmann (1):
      valgrind: Update 3.12.0 -> 3.13.0

Stanley Cheong Kwan, Phoong (1):
      recipetool: git reformat URI mangling & parameter stripped

 meta-poky/conf/distro/poky.conf                    |    1 +
 meta-selftest/files/distrodata/checkpkg_exceptions |    1 +
 meta-yocto-bsp/conf/machine/mpc8315e-rdb.conf      |    2 +-
 meta/classes/ccache.bbclass                        |    4 -
 meta/classes/distrooverrides.bbclass               |    4 +-
 meta/classes/image-live.bbclass                    |    4 +-
 meta/classes/image-vm.bbclass                      |    2 +-
 meta/classes/image_types.bbclass                   |    7 +-
 meta/classes/image_types_wic.bbclass               |   11 +-
 meta/classes/kernel-yocto.bbclass                  |    3 +-
 meta/classes/live-vm-common.bbclass                |    2 +
 meta/classes/sanity.bbclass                        |   12 +
 meta/classes/sign_rpm.bbclass                      |   20 +-
 meta/conf/bitbake.conf                             |    5 +-
 meta/conf/distro/include/distro_alias.inc          |    7 +
 meta/conf/machine/include/x86-base.inc             |    2 +-
 meta/lib/oe/gpg_sign.py                            |    9 +-
 meta/lib/oe/sstatesig.py                           |    2 +-
 meta/lib/oeqa/selftest/cases/imagefeatures.py      |   28 +
 meta/lib/oeqa/selftest/cases/wic.py                |   23 +-
 ...plicit-fall-through-so-Wextra-will-work-i.patch |   34 -
 .../gnu-efi/gnu-efi/gcc46-compatibility.patch      |   24 +-
 .../gnu-efi/gnu-efi/parallel-make-archives.patch   |   54 +-
 .../gnu-efi/{gnu-efi_3.0.5.bb => gnu-efi_3.0.6.bb} |    5 +-
 ...0001-build-use-pkg-config-to-find-libxml2.patch |   10 +-
 .../bind/bind/CVE-2016-1285.patch                  |  154 ---
 .../bind/bind/CVE-2016-1286_1.patch                |   79 --
 .../bind/bind/CVE-2016-1286_2.patch                |  317 ------
 .../bind/bind/CVE-2016-2088.patch                  |  247 -----
 .../bind/bind/CVE-2016-2775.patch                  |   90 --
 .../bind/bind/CVE-2016-2776.patch                  |  123 ---
 .../bind/bind/CVE-2016-6170.patch                  | 1090 --------------------
 .../bind/bind/CVE-2016-8864.patch                  |  219 ----
 .../bind/bind/bind-confgen-build-unix.o-once.patch |   10 +-
 .../bind/bind/mips1-not-support-opcode.diff        |  104 --
 .../use-python3-and-fix-install-lib-path.patch     |   36 +
 .../bind/{bind_9.10.3-P3.bb => bind_9.10.5-P3.bb}  |   25 +-
 ...all-to-isc_app_ctxstart-to-not-get-signal.patch |   81 ++
 meta/recipes-connectivity/dhcp/dhcp_4.3.5.bb       |    1 +
 .../base-files/base-files/share/dot.profile        |    3 +-
 .../dropbear/dropbear/0003-configure.patch         |   13 +-
 .../fix-libtomcrypt-libtommath-ordering.patch      |   11 +-
 meta/recipes-core/meta/wic-tools.bb                |   10 +-
 meta/recipes-core/util-linux/util-linux.inc        |   13 +-
 ...0001-automake-port-to-Perl-5.22-and-later.patch |   32 -
 .../{automake_1.15.bb => automake_1.15.1.bb}       |    5 +-
 .../chrpath/chrpath/standarddoc.patch              |   25 +-
 ...r-Use-stack_t-instead-of-struct-sigaltsta.patch |  135 +--
 meta/recipes-devtools/gcc/gcc-cross.inc            |   10 +-
 meta/recipes-devtools/git/git.inc                  |    1 -
 meta/recipes-devtools/git/git_2.11.1.bb            |   11 -
 meta/recipes-devtools/git/git_2.13.2.bb            |   11 +
 ...onfigure.ac-Don-t-use-gnome-common-macros.patch |   33 +
 .../python/python3-pygobject_3.24.1.bb             |    3 +-
 .../valgrind/0001-fix-build-for-musl-targets.patch |   69 --
 .../valgrind/0004-Fix-out-of-tree-builds.patch     |   34 +-
 .../valgrind/valgrind/link-gz-tests.patch          |   27 +
 .../valgrind/valgrind/ppc-headers.patch            |   87 ++
 .../{valgrind_3.12.0.bb => valgrind_3.13.0.bb}     |   15 +-
 .../acpica/acpitests/aapits-linux.patch            |  336 ------
 .../acpica/acpitests/aapits-makefile.patch         |   34 -
 meta/recipes-extended/acpica/acpitests_20140828.bb |   36 -
 .../ethtool/{ethtool_4.8.bb => ethtool_4.11.bb}    |    6 +-
 .../{libarchive_3.3.1.bb => libarchive_3.3.2.bb}   |    4 +-
 ...figure.ac-Remove-gnome-common-macro-calls.patch |   33 +
 .../gnome-desktop/gnome-desktop3_3.24.2.bb         |    6 +-
 ...ly-install-khrplatform.h-with-EGL-or-GLES.patch |   52 +
 .../recipes-graphics/mesa/files/vulkan-mkdir.patch |   37 +
 meta/recipes-graphics/mesa/mesa-gl_17.1.4.bb       |    4 -
 meta/recipes-graphics/mesa/mesa_17.1.4.bb          |    2 +
 ...ild-demos-with-questionably-licensed-data.patch |   91 ++
 .../vulkan-demos/0001-Fix-build-on-x86.patch       |   41 +
 ...stalling-demos-support-out-of-tree-builds.patch |   85 ++
 meta/recipes-graphics/vulkan/vulkan-demos_git.bb   |   36 +
 ...d-protocols_1.8.bb => wayland-protocols_1.9.bb} |    4 +-
 meta/recipes-graphics/xorg-lib/libx11_1.6.5.bb     |    3 +
 ...il-don-t-link-makestrs-with-target-cflags.patch |   33 +
 meta/recipes-graphics/xorg-lib/libxt_1.1.5.bb      |    4 +-
 meta/recipes-kernel/linux/linux-yocto-dev.bb       |    2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb    |    6 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb   |    2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb    |    6 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb    |    6 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb  |    6 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb  |    6 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb  |    6 +-
 meta/recipes-kernel/linux/linux-yocto_4.1.bb       |   20 +-
 meta/recipes-kernel/linux/linux-yocto_4.10.bb      |    2 +-
 meta/recipes-kernel/linux/linux-yocto_4.4.bb       |   20 +-
 meta/recipes-kernel/linux/linux-yocto_4.9.bb       |   20 +-
 ...hbox-desktop_2.1.bb => matchbox-desktop_2.2.bb} |    6 +-
 .../{webkitgtk_2.16.3.bb => webkitgtk_2.16.5.bb}   |   10 +-
 .../apr/{apr_1.5.2.bb => apr_1.6.2.bb}             |    4 +-
 ...debianutils_4.8.1.bb => debianutils_4.8.1.1.bb} |    7 +-
 .../libbsd/libbsd/0002-Remove-funopen.patch        |   21 +-
 ...3-Fix-build-breaks-due-to-missing-a.out.h.patch |  130 ---
 .../libbsd/{libbsd_0.8.3.bb => libbsd_0.8.5.bb}    |    7 +-
 meta/recipes-support/libgcrypt/libgcrypt_1.7.6.bb  |    4 -
 meta/recipes-support/libgcrypt/libgcrypt_1.7.7.bb  |    4 +
 scripts/lib/recipetool/create.py                   |   35 +-
 scripts/lib/wic/misc.py                            |    9 +-
 scripts/lib/wic/plugins/source/bootimg-pcbios.py   |    5 +-
 .../lib/wic/plugins/source/isoimage-isohybrid.py   |   88 +-
 scripts/runqemu                                    |  118 +--
 scripts/wic                                        |   14 +-
 106 files changed, 1221 insertions(+), 3592 deletions(-)
 delete mode 100644 meta/recipes-bsp/gnu-efi/gnu-efi/0001-Mark-our-explicit-fall-through-so-Wextra-will-work-i.patch
 rename meta/recipes-bsp/gnu-efi/{gnu-efi_3.0.5.bb => gnu-efi_3.0.6.bb} (92%)
 delete mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-1285.patch
 delete mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-1286_1.patch
 delete mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-1286_2.patch
 delete mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-2088.patch
 delete mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-2775.patch
 delete mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-2776.patch
 delete mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-6170.patch
 delete mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-8864.patch
 delete mode 100644 meta/recipes-connectivity/bind/bind/mips1-not-support-opcode.diff
 create mode 100644 meta/recipes-connectivity/bind/bind/use-python3-and-fix-install-lib-path.patch
 rename meta/recipes-connectivity/bind/{bind_9.10.3-P3.bb => bind_9.10.5-P3.bb} (85%)
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp/Moved-the-call-to-isc_app_ctxstart-to-not-get-signal.patch
 delete mode 100644 meta/recipes-devtools/automake/automake/0001-automake-port-to-Perl-5.22-and-later.patch
 rename meta/recipes-devtools/automake/{automake_1.15.bb => automake_1.15.1.bb} (84%)
 delete mode 100644 meta/recipes-devtools/git/git_2.11.1.bb
 create mode 100644 meta/recipes-devtools/git/git_2.13.2.bb
 create mode 100644 meta/recipes-devtools/python/python3-pygobject/0001-configure.ac-Don-t-use-gnome-common-macros.patch
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-fix-build-for-musl-targets.patch
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/link-gz-tests.patch
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/ppc-headers.patch
 rename meta/recipes-devtools/valgrind/{valgrind_3.12.0.bb => valgrind_3.13.0.bb} (92%)
 delete mode 100644 meta/recipes-extended/acpica/acpitests/aapits-linux.patch
 delete mode 100644 meta/recipes-extended/acpica/acpitests/aapits-makefile.patch
 delete mode 100644 meta/recipes-extended/acpica/acpitests_20140828.bb
 rename meta/recipes-extended/ethtool/{ethtool_4.8.bb => ethtool_4.11.bb} (81%)
 rename meta/recipes-extended/libarchive/{libarchive_3.3.1.bb => libarchive_3.3.2.bb} (93%)
 create mode 100644 meta/recipes-gnome/gnome-desktop/gnome-desktop/0001-configure.ac-Remove-gnome-common-macro-calls.patch
 create mode 100644 meta/recipes-graphics/mesa/files/0001-mapi-Only-install-khrplatform.h-with-EGL-or-GLES.patch
 create mode 100644 meta/recipes-graphics/mesa/files/vulkan-mkdir.patch
 create mode 100644 meta/recipes-graphics/vulkan/vulkan-demos/0001-Don-t-build-demos-with-questionably-licensed-data.patch
 create mode 100644 meta/recipes-graphics/vulkan/vulkan-demos/0001-Fix-build-on-x86.patch
 create mode 100644 meta/recipes-graphics/vulkan/vulkan-demos/0001-Support-installing-demos-support-out-of-tree-builds.patch
 create mode 100644 meta/recipes-graphics/vulkan/vulkan-demos_git.bb
 rename meta/recipes-graphics/wayland/{wayland-protocols_1.8.bb => wayland-protocols_1.9.bb} (85%)
 create mode 100644 meta/recipes-graphics/xorg-lib/libxt/0001-libXt-util-don-t-link-makestrs-with-target-cflags.patch
 rename meta/recipes-sato/matchbox-desktop/{matchbox-desktop_2.1.bb => matchbox-desktop_2.2.bb} (87%)
 rename meta/recipes-sato/webkit/{webkitgtk_2.16.3.bb => webkitgtk_2.16.5.bb} (94%)
 rename meta/recipes-support/apr/{apr_1.5.2.bb => apr_1.6.2.bb} (96%)
 rename meta/recipes-support/debianutils/{debianutils_4.8.1.bb => debianutils_4.8.1.1.bb} (86%)
 delete mode 100644 meta/recipes-support/libbsd/libbsd/0003-Fix-build-breaks-due-to-missing-a.out.h.patch
 rename meta/recipes-support/libbsd/{libbsd_0.8.3.bb => libbsd_0.8.5.bb} (85%)
 delete mode 100644 meta/recipes-support/libgcrypt/libgcrypt_1.7.6.bb
 create mode 100644 meta/recipes-support/libgcrypt/libgcrypt_1.7.7.bb

Bruce Ashfield (6):
  kernel-yocto: propagate configuration errors to bbclass
  kernel-yocto/meta: smp configuration changes
  linux-yocto/4.1: update to v4.1.42
  linux-yocto/4.4: update to v4.4.76
  linux-yocto/4.9: update to v4.9.36
  linux-yocto-dev: bump to 4.12+

California Sullivan (1):
  gnu-efi: Upgrade package to 3.0.6 and refresh patches

Carlos Alberto Lopez Perez (1):
  webkitgtk: Upgrade to 2.16.5

Changhyeok Bae (1):
  ethtool: Upgrade to 4.11

Dengke Du (2):
  dropbear: reduce local pending patches
  chrpath: reduce local pending patches

Denys Dmytriyenko (1):
  wayland-protocols: upgrade to 1.9

Ed Bartosh (13):
  runqemu: reworked exception handling
  runqemu: check exit code of 'ls -t'
  live-vm-common: add MKDOSFS_EXTRAOPTS variable
  wic: get rid of using wic-tools
  wic: isoimage: do not remove temp directory
  wic: build wic-tools only if wic is run manually
  wic: isoimage-isohybrid: check result of glob()
  wic-tools: don't create wic-tools.env
  image_types_wic: set default WKS_FILE_DEPENDS
  wic: isoimage-isohybrid: use grub-efi from deploy dir
  selftest: fixed 5 wic test cases
  imagefeatures: add test_image_fstypes test case
  image_types: fix squashfs-lzo and squashfs-xz builds

Fan Xin (1):
  apr: 1.5.2 -> 1.6.2

Hongxu Jia (1):
  dhcp: fix shutdown not work by SIGTERM while bind9 enable threads

Joshua Lock (4):
  poky: add Ubuntu 17.04 Zesty Zapus to SANITY_TESTED_DISTROS
  x86-base: build only hddimg, rather than iso and hddimg, for x86
    machines
  mpc8315e-rdb: add wic.bmap to IMAGE_FSTYPES
  image_types: remove Hob convenience variable

Jussi Kukkonen (8):
  acpitests: Remove as unmaintained
  vulkan-demos: Add recipe
  selftest: Add vulkan-demos to checkpkg exceptions
  mesa: Avoid installing khrplatfrom.h when not needed
  mesa-gl: Clean recipe
  matchbox-desktop: Upgrade to 2.2
  python3-pygobject: Don't use gnome-common
  gnome-desktop: Don't use gnome-common

Kai Kang (1):
  bind: 9.10.3-P3 -> 9.10.5-P3

Khem Raj (2):
  gcc-cross: Fix linker and fortran symlinks
  gcc-7.1: Update the libsanitize stack_t patch to upstreamed version

Lans Zhang (2):
  gpg_sign.py: fix overwriting the RPM macro __gpg in a wrong way
  sign_rpm: support signing files in RPM payload

Maxin B. John (2):
  libx11: fix build error
  libxt: fix build failure

Otavio Salvador (1):
  libarchive: Upgrade to 3.3.2 release

Patrick Ohly (3):
  distrooverrides.bbclass: fix default configuration
  util-linux: fix "su -" and package su separately
  base-files: ignore "mesg n" error messages

Robert Yang (4):
  automake: 1.15 -> 1.15.1
  debianutils: 4.8.1 -> 4.8.1.1
  git: 2.11.1 -> 2.13.2
  libbsd: 0.8.3 -> 0.8.5

Ross Burton (9):
  ccache: don't export CCACHE_DISABLE globally
  bitbake.conf: add CCACHE_NOHASHDIR to hash whitelist
  ccache: let ccache create CCACHE_DIR, reducing hash changes
  lib/oe/sstatesig: exclude ccache-native from signature hashes
  classes/sanity: check for case-sensitive file systems
  valgrind: fix link failure with gold
  valgrind: fix ptest compilation for PowerPC
  mesa: fix build race on src/intel/vulkan
  libgcrypt: upgrade to 1.7.7

Shen Joon Tan (1):
  distro_alias.inc: update unmap packages to other distro

Soren Brinkmann (1):
  valgrind: Update 3.12.0 -> 3.13.0

Stanley Cheong Kwan, Phoong (1):
  recipetool: git reformat URI mangling & parameter stripped

 meta-poky/conf/distro/poky.conf                    |    1 +
 meta-selftest/files/distrodata/checkpkg_exceptions |    1 +
 meta-yocto-bsp/conf/machine/mpc8315e-rdb.conf      |    2 +-
 meta/classes/ccache.bbclass                        |    4 -
 meta/classes/distrooverrides.bbclass               |    4 +-
 meta/classes/image-live.bbclass                    |    4 +-
 meta/classes/image-vm.bbclass                      |    2 +-
 meta/classes/image_types.bbclass                   |    7 +-
 meta/classes/image_types_wic.bbclass               |   11 +-
 meta/classes/kernel-yocto.bbclass                  |    3 +-
 meta/classes/live-vm-common.bbclass                |    2 +
 meta/classes/sanity.bbclass                        |   12 +
 meta/classes/sign_rpm.bbclass                      |   20 +-
 meta/conf/bitbake.conf                             |    5 +-
 meta/conf/distro/include/distro_alias.inc          |    7 +
 meta/conf/machine/include/x86-base.inc             |    2 +-
 meta/lib/oe/gpg_sign.py                            |    9 +-
 meta/lib/oe/sstatesig.py                           |    2 +-
 meta/lib/oeqa/selftest/cases/imagefeatures.py      |   28 +
 meta/lib/oeqa/selftest/cases/wic.py                |   23 +-
 ...plicit-fall-through-so-Wextra-will-work-i.patch |   34 -
 .../gnu-efi/gnu-efi/gcc46-compatibility.patch      |   24 +-
 .../gnu-efi/gnu-efi/parallel-make-archives.patch   |   54 +-
 .../gnu-efi/{gnu-efi_3.0.5.bb => gnu-efi_3.0.6.bb} |    5 +-
 ...0001-build-use-pkg-config-to-find-libxml2.patch |   10 +-
 .../bind/bind/CVE-2016-1285.patch                  |  154 ---
 .../bind/bind/CVE-2016-1286_1.patch                |   79 --
 .../bind/bind/CVE-2016-1286_2.patch                |  317 ------
 .../bind/bind/CVE-2016-2088.patch                  |  247 -----
 .../bind/bind/CVE-2016-2775.patch                  |   90 --
 .../bind/bind/CVE-2016-2776.patch                  |  123 ---
 .../bind/bind/CVE-2016-6170.patch                  | 1090 --------------------
 .../bind/bind/CVE-2016-8864.patch                  |  219 ----
 .../bind/bind/bind-confgen-build-unix.o-once.patch |   10 +-
 .../bind/bind/mips1-not-support-opcode.diff        |  104 --
 .../use-python3-and-fix-install-lib-path.patch     |   36 +
 .../bind/{bind_9.10.3-P3.bb => bind_9.10.5-P3.bb}  |   25 +-
 ...all-to-isc_app_ctxstart-to-not-get-signal.patch |   81 ++
 meta/recipes-connectivity/dhcp/dhcp_4.3.5.bb       |    1 +
 .../base-files/base-files/share/dot.profile        |    3 +-
 .../dropbear/dropbear/0003-configure.patch         |   13 +-
 .../fix-libtomcrypt-libtommath-ordering.patch      |   11 +-
 meta/recipes-core/meta/wic-tools.bb                |   10 +-
 meta/recipes-core/util-linux/util-linux.inc        |   13 +-
 ...0001-automake-port-to-Perl-5.22-and-later.patch |   32 -
 .../{automake_1.15.bb => automake_1.15.1.bb}       |    5 +-
 .../chrpath/chrpath/standarddoc.patch              |   25 +-
 ...r-Use-stack_t-instead-of-struct-sigaltsta.patch |  135 +--
 meta/recipes-devtools/gcc/gcc-cross.inc            |   10 +-
 meta/recipes-devtools/git/git.inc                  |    1 -
 meta/recipes-devtools/git/git_2.11.1.bb            |   11 -
 meta/recipes-devtools/git/git_2.13.2.bb            |   11 +
 ...onfigure.ac-Don-t-use-gnome-common-macros.patch |   33 +
 .../python/python3-pygobject_3.24.1.bb             |    3 +-
 .../valgrind/0001-fix-build-for-musl-targets.patch |   69 --
 .../valgrind/0004-Fix-out-of-tree-builds.patch     |   34 +-
 .../valgrind/valgrind/link-gz-tests.patch          |   27 +
 .../valgrind/valgrind/ppc-headers.patch            |   87 ++
 .../{valgrind_3.12.0.bb => valgrind_3.13.0.bb}     |   15 +-
 .../acpica/acpitests/aapits-linux.patch            |  336 ------
 .../acpica/acpitests/aapits-makefile.patch         |   34 -
 meta/recipes-extended/acpica/acpitests_20140828.bb |   36 -
 .../ethtool/{ethtool_4.8.bb => ethtool_4.11.bb}    |    6 +-
 .../{libarchive_3.3.1.bb => libarchive_3.3.2.bb}   |    4 +-
 ...figure.ac-Remove-gnome-common-macro-calls.patch |   33 +
 .../gnome-desktop/gnome-desktop3_3.24.2.bb         |    6 +-
 ...ly-install-khrplatform.h-with-EGL-or-GLES.patch |   52 +
 .../recipes-graphics/mesa/files/vulkan-mkdir.patch |   37 +
 meta/recipes-graphics/mesa/mesa-gl_17.1.4.bb       |    4 -
 meta/recipes-graphics/mesa/mesa_17.1.4.bb          |    2 +
 ...ild-demos-with-questionably-licensed-data.patch |   91 ++
 .../vulkan-demos/0001-Fix-build-on-x86.patch       |   41 +
 ...stalling-demos-support-out-of-tree-builds.patch |   85 ++
 meta/recipes-graphics/vulkan/vulkan-demos_git.bb   |   36 +
 ...d-protocols_1.8.bb => wayland-protocols_1.9.bb} |    4 +-
 meta/recipes-graphics/xorg-lib/libx11_1.6.5.bb     |    3 +
 ...il-don-t-link-makestrs-with-target-cflags.patch |   33 +
 meta/recipes-graphics/xorg-lib/libxt_1.1.5.bb      |    4 +-
 meta/recipes-kernel/linux/linux-yocto-dev.bb       |    2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb    |    6 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb   |    2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb    |    6 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb    |    6 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb  |    6 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb  |    6 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb  |    6 +-
 meta/recipes-kernel/linux/linux-yocto_4.1.bb       |   20 +-
 meta/recipes-kernel/linux/linux-yocto_4.10.bb      |    2 +-
 meta/recipes-kernel/linux/linux-yocto_4.4.bb       |   20 +-
 meta/recipes-kernel/linux/linux-yocto_4.9.bb       |   20 +-
 ...hbox-desktop_2.1.bb => matchbox-desktop_2.2.bb} |    6 +-
 .../{webkitgtk_2.16.3.bb => webkitgtk_2.16.5.bb}   |   10 +-
 .../apr/{apr_1.5.2.bb => apr_1.6.2.bb}             |    4 +-
 ...debianutils_4.8.1.bb => debianutils_4.8.1.1.bb} |    7 +-
 .../libbsd/libbsd/0002-Remove-funopen.patch        |   21 +-
 ...3-Fix-build-breaks-due-to-missing-a.out.h.patch |  130 ---
 .../libbsd/{libbsd_0.8.3.bb => libbsd_0.8.5.bb}    |    7 +-
 meta/recipes-support/libgcrypt/libgcrypt_1.7.6.bb  |    4 -
 meta/recipes-support/libgcrypt/libgcrypt_1.7.7.bb  |    4 +
 scripts/lib/recipetool/create.py                   |   35 +-
 scripts/lib/wic/misc.py                            |    9 +-
 scripts/lib/wic/plugins/source/bootimg-pcbios.py   |    5 +-
 .../lib/wic/plugins/source/isoimage-isohybrid.py   |   88 +-
 scripts/runqemu                                    |  118 +--
 scripts/wic                                        |   14 +-
 106 files changed, 1221 insertions(+), 3592 deletions(-)
 delete mode 100644 meta/recipes-bsp/gnu-efi/gnu-efi/0001-Mark-our-explicit-fall-through-so-Wextra-will-work-i.patch
 rename meta/recipes-bsp/gnu-efi/{gnu-efi_3.0.5.bb => gnu-efi_3.0.6.bb} (92%)
 delete mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-1285.patch
 delete mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-1286_1.patch
 delete mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-1286_2.patch
 delete mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-2088.patch
 delete mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-2775.patch
 delete mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-2776.patch
 delete mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-6170.patch
 delete mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-8864.patch
 delete mode 100644 meta/recipes-connectivity/bind/bind/mips1-not-support-opcode.diff
 create mode 100644 meta/recipes-connectivity/bind/bind/use-python3-and-fix-install-lib-path.patch
 rename meta/recipes-connectivity/bind/{bind_9.10.3-P3.bb => bind_9.10.5-P3.bb} (85%)
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp/Moved-the-call-to-isc_app_ctxstart-to-not-get-signal.patch
 delete mode 100644 meta/recipes-devtools/automake/automake/0001-automake-port-to-Perl-5.22-and-later.patch
 rename meta/recipes-devtools/automake/{automake_1.15.bb => automake_1.15.1.bb} (84%)
 delete mode 100644 meta/recipes-devtools/git/git_2.11.1.bb
 create mode 100644 meta/recipes-devtools/git/git_2.13.2.bb
 create mode 100644 meta/recipes-devtools/python/python3-pygobject/0001-configure.ac-Don-t-use-gnome-common-macros.patch
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-fix-build-for-musl-targets.patch
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/link-gz-tests.patch
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/ppc-headers.patch
 rename meta/recipes-devtools/valgrind/{valgrind_3.12.0.bb => valgrind_3.13.0.bb} (92%)
 delete mode 100644 meta/recipes-extended/acpica/acpitests/aapits-linux.patch
 delete mode 100644 meta/recipes-extended/acpica/acpitests/aapits-makefile.patch
 delete mode 100644 meta/recipes-extended/acpica/acpitests_20140828.bb
 rename meta/recipes-extended/ethtool/{ethtool_4.8.bb => ethtool_4.11.bb} (81%)
 rename meta/recipes-extended/libarchive/{libarchive_3.3.1.bb => libarchive_3.3.2.bb} (93%)
 create mode 100644 meta/recipes-gnome/gnome-desktop/gnome-desktop/0001-configure.ac-Remove-gnome-common-macro-calls.patch
 create mode 100644 meta/recipes-graphics/mesa/files/0001-mapi-Only-install-khrplatform.h-with-EGL-or-GLES.patch
 create mode 100644 meta/recipes-graphics/mesa/files/vulkan-mkdir.patch
 create mode 100644 meta/recipes-graphics/vulkan/vulkan-demos/0001-Don-t-build-demos-with-questionably-licensed-data.patch
 create mode 100644 meta/recipes-graphics/vulkan/vulkan-demos/0001-Fix-build-on-x86.patch
 create mode 100644 meta/recipes-graphics/vulkan/vulkan-demos/0001-Support-installing-demos-support-out-of-tree-builds.patch
 create mode 100644 meta/recipes-graphics/vulkan/vulkan-demos_git.bb
 rename meta/recipes-graphics/wayland/{wayland-protocols_1.8.bb => wayland-protocols_1.9.bb} (85%)
 create mode 100644 meta/recipes-graphics/xorg-lib/libxt/0001-libXt-util-don-t-link-makestrs-with-target-cflags.patch
 rename meta/recipes-sato/matchbox-desktop/{matchbox-desktop_2.1.bb => matchbox-desktop_2.2.bb} (87%)
 rename meta/recipes-sato/webkit/{webkitgtk_2.16.3.bb => webkitgtk_2.16.5.bb} (94%)
 rename meta/recipes-support/apr/{apr_1.5.2.bb => apr_1.6.2.bb} (96%)
 rename meta/recipes-support/debianutils/{debianutils_4.8.1.bb => debianutils_4.8.1.1.bb} (86%)
 delete mode 100644 meta/recipes-support/libbsd/libbsd/0003-Fix-build-breaks-due-to-missing-a.out.h.patch
 rename meta/recipes-support/libbsd/{libbsd_0.8.3.bb => libbsd_0.8.5.bb} (85%)
 delete mode 100644 meta/recipes-support/libgcrypt/libgcrypt_1.7.6.bb
 create mode 100644 meta/recipes-support/libgcrypt/libgcrypt_1.7.7.bb

-- 
2.11.0


