Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id C630D77CD0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 May 2017 11:15:11 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id v15so83285471wmv.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 May 2017 04:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=6lnUvoo56vlVP6r4BE4dumgSqRv7JGoOae78PSerFjc=;
	b=I0s8j8LmUEJoeOwDe1fQI75/3PV0q5mLjgkVkmHZAS8vCbItuaUFM1y+7u5sNLgm5M
	pGuVFQS9vY0oZG9wOAKfR9ssFzRrQ8Z9954dWFlwD6TyPGc/ncW/mihl4IUWyqvf8WEU
	trkeFrBUAWtgpo0rQInb6jgTGeWYA0J07/QyHdV5MEd9HUVgxI13Ycn5Iikd2ZlHhlbi
	ZtDRoVc1mRNOlIuPjbg4oC0Lki6eSzx2df4sfeCwGsHPAmRYvk1rdz34CVOeBeYwk0bp
	8jLIz0eNmU4Vh5F4a0O+czSr6mB1z5avhbpP0lIXX9GOYlZuChPAwTuKDX8JLKZlumQy
	X8Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=6lnUvoo56vlVP6r4BE4dumgSqRv7JGoOae78PSerFjc=;
	b=oLjMzp0JSO4+iXQzDOoIDOvEj5d8sZFcPUltIJj+gPyfl855BT4p22ADXetAKzSGCJ
	QuUeyY4kuH/8U+kXpD8TkIXZR9OWcicTKa2wcOLDcv7heJLjNKmKL6s3yWQIFrlPXq0v
	PxR1ov6M8pxwg2rrgWR7TGA7a03yNO84uRyYnP7Zvc7BjjYsGFrvSoSM7URKeXO6FgRI
	WVs1CPUha5KMmRlB2+ZEJLey5QAkk2f36pa6e5qSq1opQfHYEOsoPevS5B7qSGsGQ2qc
	Q6xRS/vcvd5tXqX8h1Q4NT/YGyryap9MIE3bzI0HMNWHjibwJXtcJNysMokwRkB28Zb4
	pMwQ==
X-Gm-Message-State: AODbwcBlzDRgf+H44oa7LDuTq+1DajgYqycSAvnvQk9JLwmTM7R3fO+t
	YWuR/UZeP5YYGBvNSXY=
X-Received: by 10.28.27.75 with SMTP id b72mr16876788wmb.34.1495192511716;
	Fri, 19 May 2017 04:15:11 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	c17sm1560037wre.35.2017.05.19.04.15.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 19 May 2017 04:15:11 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 May 2017 12:15:09 +0100
Message-Id: <cover.1495192467.git.ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH 00/47] Consolidated pull
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
X-List-Received-Date: Fri, 19 May 2017 11:15:12 -0000

Another batch of patches that have been building up during the freeze that has
been build-tested on the autobuilder and is all green.

Ross

The following changes since commit ef506f58da3a95fba2696df749b2b81f9c118847:

  cve-check-tool: backport a patch to make CVE checking work (2017-05-18 14:01:48 +0100)

are available in the git repository at:

  ssh://git@git.yoctoproject.org/poky-contrib ross/mut

for you to fetch changes up to e3a58876bda9631af1fb7a1f98cb5d0fdfff715c:

  glew: Compile with -D_GNU_SOURCE (2017-05-19 11:55:21 +0100)

----------------------------------------------------------------
Alexander Kanavin (10):
      kconfig-frontends: update to 4.10.0.1
      ffmpeg: update to 3.3
      mpg123: update to 1.24.0
      sysprof: update to 3.24.1
      gdbm: update to 1.13
      gnome-desktop3: update to 3.24.2
      ed: update to 1.14.2
      db: fix upstream version check
      dnf: fix upstream version check
      vulkan: fix upstream version check

Andreas J. Reichel (2):
      wic: Use argparse instead of optparse
      wic: Add missing text to usage and help strings

Carlos Rafael Giani (1):
      mpeg2dec: upgrade to version 0.5.1

Cody P Schafer (1):
      cmake.bbclass: use `cmake --build` to build & install

Ed Bartosh (19):
      selftest: fix test_unsupported_subcommand test case
      systemd-boot: create output dir if it doesn't exist
      efi: add efi_bootfs_populate API
      image_types_wic: add do_populate_bootfs task
      image_types_wic: merged 2 tasks
      oe-selftest: add wic tests for generic EFI
      grub-efi: fixed default value of GRUB_ROOT
      image_types_wic: schedule prepare_wic_build correctly
      filemap: fix skip logic
      filemap: add parameter 'length' to sparse_copy
      bootimg-pcbios: make boot image file unique
      wic: add wic_init_parser_ls
      wic: add help and usage content for 'wic ls'
      wic: add 'wic ls' command
      engine: implement listing wic images
      selftest: add new test case test_wic_ls
      isoimage-isohybrid: don't use TRANSLATED_TARGET_ARCH
      Revert "create-pull-request: add "-t in-reply-to" option"
      create-pull-request: support format-patch options

Huang Qiyu (1):
      libsndfile1: 1.0.27 -> 1.0.28

Jackie Huang (1):
      icu: Use LARGE_BUFFER_MAX_SIZE for cmd

Khem Raj (2):
      grub: Update to 2.02
      glew: Compile with -D_GNU_SOURCE

Marek Vasut (1):
      automake: Backport perl 5.22 fix

Markus Lehtonen (5):
      oeqa.utils.git: use --verify in rev_parse()
      oe-build-perf-report: use correct x-axis max value in html charts
      oe-build-perf-report: two verbosity levels for --list
      oe-build-perf-report: implement --dump-buildstats
      scripts/buildstats-diff: support optimized rusage values

Maxin B. John (1):
      connman: upgrade to 1.34

Paul Eggleton (2):
      recipetool: create: skip values extracted from spec files containing macros
      recipetool: create: extract name of package from a repository

Ross Burton (1):
      kconfig-frontends: fix build race

 meta-selftest/wic/test_generic_efi.wks.in          |   9 +
 meta/classes/cmake.bbclass                         |   9 +-
 meta/classes/grub-efi.bbclass                      |  14 +-
 meta/classes/image_types_wic.bbclass               |  87 +++++--
 meta/classes/systemd-boot.bbclass                  |   8 +
 meta/lib/oeqa/selftest/wic.py                      |  59 ++++-
 meta/lib/oeqa/utils/git.py                         |   2 +-
 ...-mfpmath-sse-as-well-when-SSE-is-disabled.patch |   0
 ...nforce-no-pie-if-the-compiler-supports-it.patch |  45 ----
 ...E-2015-8370-Grub2-user-pass-vulnerability.patch |  53 -----
 ...ct-_llseek-code-and-require-long-filesyst.patch |  81 -------
 ...Use-AC_HEADER_MAJOR-to-find-device-macros.patch |  92 --------
 ...ettext-gettext.c-main_context-secondary_c.patch |  39 ----
 ...ern-efi-mm.c-grub_efi_finish_boot_service.patch |  79 -------
 ...1-grub.d-10_linux.in-add-oe-s-kernel-name.patch |   0
 ..._dhcp_vendor-Add-missing-const-qualifiers.patch |  33 ---
 ...ern-efi-mm.c-grub_efi_get_memory_map-Neve.patch |  43 ----
 .../{grub => files}/autogen.sh-exclude-pc.patch    |   0
 .../grub/files/check-if-liblzma-is-disabled.patch  |  33 ---
 .../grub/files/fix-endianness-problem.patch        |  44 ----
 .../grub/files/fix-issue-with-flex-2.5.37.patch    |  21 --
 meta/recipes-bsp/grub/files/fix-texinfo.patch      |  32 ---
 .../grub/files/grub-2.00-add-oe-kernel.patch       |  53 -----
 .../grub-2.00-fix-enable_execute_stack-check.patch |  27 ---
 .../grub/files/grub-2.00-fpmath-sse-387-fix.patch  |  24 --
 ...allow-a-compilation-without-mcmodel-large.patch | 131 -----------
 .../grub/files/grub-efi-fix-with-glibc-2.20.patch  |  32 ---
 meta/recipes-bsp/grub/files/grub-install.in.patch  |  20 --
 .../grub/files/grub-no-unused-result.patch         |  19 --
 .../grub/files/grub2-fix-initrd-size-bug.patch     |  48 ----
 ...rub2-remove-sparc64-setup-from-x86-builds.patch |  44 ----
 meta/recipes-bsp/grub/files/remove-gets.patch      |  20 --
 .../grub/{grub-efi_2.00.bb => grub-efi_2.02.bb}    |   9 +-
 meta/recipes-bsp/grub/grub2.inc                    |  50 ++--
 .../grub/{grub_2.00.bb => grub_2.02.bb}            |   6 -
 meta/recipes-bsp/grub/grub_git.bb                  |  45 ----
 meta/recipes-connectivity/connman/connman.inc      |   5 +-
 ...x-compile-on-musl-with-kernel-4.9-headers.patch |  37 ++-
 ...ll-nftables-fix-build-with-libnftnl-1.0.7.patch |  72 ++++++
 ...ts-Fix-bad-file-descriptor-initialisation.patch | 102 ---------
 .../connman/{connman_1.33.bb => connman_1.34.bb}   |   6 +-
 ...0001-automake-port-to-Perl-5.22-and-later.patch |  32 +++
 meta/recipes-devtools/automake/automake_1.15.bb    |   1 +
 meta/recipes-devtools/dnf/dnf_git.bb               |   1 +
 .../files/0001-Fix-installation-of-.pc-files.patch |  28 +++
 ...Switch-utils-kconfig-diff-to-use-Python-3.patch |  26 +++
 .../kconfig-frontends/files/missing-mkdir.patch    |  33 +++
 ...s_3.12.0.0.bb => kconfig-frontends_4.10.0.1.bb} |   9 +-
 .../ed/{ed_1.14.1.bb => ed_1.14.2.bb}              |   6 +-
 ...desktop3_3.22.2.bb => gnome-desktop3_3.24.2.bb} |   4 +-
 meta/recipes-graphics/glew/glew_2.0.0.bb           |   1 +
 meta/recipes-graphics/vulkan/vulkan_1.0.39.1.bb    |   1 +
 .../{sysprof_3.22.3.bb => sysprof_3.24.1.bb}       |  10 +-
 .../ffmpeg/{ffmpeg_3.2.4.bb => ffmpeg_3.3.bb}      |   7 +-
 ...libsndfile1_1.0.27.bb => libsndfile1_1.0.28.bb} |   4 +-
 .../altivec_h_needed.patch                         |   8 +-
 .../{mpeg2dec_0.4.1.bb => mpeg2dec_0.5.1.bb}       |  14 +-
 .../mpg123/{mpg123_1.23.8.bb => mpg123_1.24.0.bb}  |   5 +-
 meta/recipes-support/db/db_5.3.28.bb               |   4 +
 meta/recipes-support/gdbm/files/ptest.patch        |  40 ++--
 .../gdbm/{gdbm_1.12.bb => gdbm_1.13.bb}            |   4 +-
 .../icu/icu/icu-pkgdata-large-cmd.patch            |  28 ++-
 scripts/buildstats-diff                            |  20 +-
 scripts/create-pull-request                        |  26 +--
 scripts/lib/recipetool/create.py                   |  11 +-
 scripts/lib/recipetool/create_buildsys.py          |   4 +
 scripts/lib/wic/engine.py                          |  97 +++++++-
 scripts/lib/wic/filemap.py                         |  26 ++-
 scripts/lib/wic/help.py                            |  90 +++++++-
 scripts/lib/wic/plugins/source/bootimg-pcbios.py   |   2 +-
 .../lib/wic/plugins/source/isoimage-isohybrid.py   |   6 +-
 scripts/oe-build-perf-report                       |  96 ++++++--
 scripts/wic                                        | 253 ++++++++++++++-------
 73 files changed, 995 insertions(+), 1435 deletions(-)
 create mode 100644 meta-selftest/wic/test_generic_efi.wks.in
 rename meta/recipes-bsp/grub/{grub-git => files}/0001-Disable-mfpmath-sse-as-well-when-SSE-is-disabled.patch (100%)
 delete mode 100644 meta/recipes-bsp/grub/files/0001-Enforce-no-pie-if-the-compiler-supports-it.patch
 delete mode 100644 meta/recipes-bsp/grub/files/0001-Fix-CVE-2015-8370-Grub2-user-pass-vulnerability.patch
 delete mode 100644 meta/recipes-bsp/grub/files/0001-Remove-direct-_llseek-code-and-require-long-filesyst.patch
 delete mode 100644 meta/recipes-bsp/grub/files/0001-build-Use-AC_HEADER_MAJOR-to-find-device-macros.patch
 delete mode 100644 meta/recipes-bsp/grub/files/0001-grub-core-gettext-gettext.c-main_context-secondary_c.patch
 delete mode 100644 meta/recipes-bsp/grub/files/0001-grub-core-kern-efi-mm.c-grub_efi_finish_boot_service.patch
 rename meta/recipes-bsp/grub/{grub-git => files}/0001-grub.d-10_linux.in-add-oe-s-kernel-name.patch (100%)
 delete mode 100644 meta/recipes-bsp/grub/files/0001-parse_dhcp_vendor-Add-missing-const-qualifiers.patch
 delete mode 100644 meta/recipes-bsp/grub/files/0002-grub-core-kern-efi-mm.c-grub_efi_get_memory_map-Neve.patch
 rename meta/recipes-bsp/grub/{grub => files}/autogen.sh-exclude-pc.patch (100%)
 delete mode 100644 meta/recipes-bsp/grub/files/check-if-liblzma-is-disabled.patch
 delete mode 100644 meta/recipes-bsp/grub/files/fix-endianness-problem.patch
 delete mode 100644 meta/recipes-bsp/grub/files/fix-issue-with-flex-2.5.37.patch
 delete mode 100644 meta/recipes-bsp/grub/files/fix-texinfo.patch
 delete mode 100644 meta/recipes-bsp/grub/files/grub-2.00-add-oe-kernel.patch
 delete mode 100644 meta/recipes-bsp/grub/files/grub-2.00-fix-enable_execute_stack-check.patch
 delete mode 100644 meta/recipes-bsp/grub/files/grub-2.00-fpmath-sse-387-fix.patch
 delete mode 100644 meta/recipes-bsp/grub/files/grub-efi-allow-a-compilation-without-mcmodel-large.patch
 delete mode 100644 meta/recipes-bsp/grub/files/grub-efi-fix-with-glibc-2.20.patch
 delete mode 100644 meta/recipes-bsp/grub/files/grub-install.in.patch
 delete mode 100644 meta/recipes-bsp/grub/files/grub-no-unused-result.patch
 delete mode 100644 meta/recipes-bsp/grub/files/grub2-fix-initrd-size-bug.patch
 delete mode 100644 meta/recipes-bsp/grub/files/grub2-remove-sparc64-setup-from-x86-builds.patch
 delete mode 100644 meta/recipes-bsp/grub/files/remove-gets.patch
 rename meta/recipes-bsp/grub/{grub-efi_2.00.bb => grub-efi_2.02.bb} (88%)
 rename meta/recipes-bsp/grub/{grub_2.00.bb => grub_2.02.bb} (56%)
 delete mode 100644 meta/recipes-bsp/grub/grub_git.bb
 create mode 100644 meta/recipes-connectivity/connman/connman/0001-firewall-nftables-fix-build-with-libnftnl-1.0.7.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman/0003-stats-Fix-bad-file-descriptor-initialisation.patch
 rename meta/recipes-connectivity/connman/{connman_1.33.bb => connman_1.34.bb} (70%)
 create mode 100644 meta/recipes-devtools/automake/automake/0001-automake-port-to-Perl-5.22-and-later.patch
 create mode 100644 meta/recipes-devtools/kconfig-frontends/files/0001-Fix-installation-of-.pc-files.patch
 create mode 100644 meta/recipes-devtools/kconfig-frontends/files/0001-Switch-utils-kconfig-diff-to-use-Python-3.patch
 create mode 100644 meta/recipes-devtools/kconfig-frontends/files/missing-mkdir.patch
 rename meta/recipes-devtools/kconfig-frontends/{kconfig-frontends_3.12.0.0.bb => kconfig-frontends_4.10.0.1.bb} (78%)
 rename meta/recipes-extended/ed/{ed_1.14.1.bb => ed_1.14.2.bb} (79%)
 rename meta/recipes-gnome/gnome-desktop/{gnome-desktop3_3.22.2.bb => gnome-desktop3_3.24.2.bb} (85%)
 rename meta/recipes-kernel/sysprof/{sysprof_3.22.3.bb => sysprof_3.24.1.bb} (73%)
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_3.2.4.bb => ffmpeg_3.3.bb} (95%)
 rename meta/recipes-multimedia/libsndfile/{libsndfile1_1.0.27.bb => libsndfile1_1.0.28.bb} (82%)
 rename meta/recipes-multimedia/mpeg2dec/{mpeg2dec-0.4.1 => files}/altivec_h_needed.patch (86%)
 rename meta/recipes-multimedia/mpeg2dec/{mpeg2dec_0.4.1.bb => mpeg2dec_0.5.1.bb} (79%)
 rename meta/recipes-multimedia/mpg123/{mpg123_1.23.8.bb => mpg123_1.24.0.bb} (93%)
 rename meta/recipes-support/gdbm/{gdbm_1.12.bb => gdbm_1.13.bb} (88%)

Alexander Kanavin (10):
  kconfig-frontends: update to 4.10.0.1
  ffmpeg: update to 3.3
  mpg123: update to 1.24.0
  sysprof: update to 3.24.1
  gdbm: update to 1.13
  gnome-desktop3: update to 3.24.2
  ed: update to 1.14.2
  db: fix upstream version check
  dnf: fix upstream version check
  vulkan: fix upstream version check

Andreas J. Reichel (2):
  wic: Use argparse instead of optparse
  wic: Add missing text to usage and help strings

Carlos Rafael Giani (1):
  mpeg2dec: upgrade to version 0.5.1

Cody P Schafer (1):
  cmake.bbclass: use `cmake --build` to build & install

Ed Bartosh (19):
  selftest: fix test_unsupported_subcommand test case
  systemd-boot: create output dir if it doesn't exist
  efi: add efi_bootfs_populate API
  image_types_wic: add do_populate_bootfs task
  image_types_wic: merged 2 tasks
  oe-selftest: add wic tests for generic EFI
  grub-efi: fixed default value of GRUB_ROOT
  image_types_wic: schedule prepare_wic_build correctly
  filemap: fix skip logic
  filemap: add parameter 'length' to sparse_copy
  bootimg-pcbios: make boot image file unique
  wic: add wic_init_parser_ls
  wic: add help and usage content for 'wic ls'
  wic: add 'wic ls' command
  engine: implement listing wic images
  selftest: add new test case test_wic_ls
  isoimage-isohybrid: don't use TRANSLATED_TARGET_ARCH
  Revert "create-pull-request: add "-t in-reply-to" option"
  create-pull-request: support format-patch options

Huang Qiyu (1):
  libsndfile1: 1.0.27 -> 1.0.28

Jackie Huang (1):
  icu: Use LARGE_BUFFER_MAX_SIZE for cmd

Khem Raj (2):
  grub: Update to 2.02
  glew: Compile with -D_GNU_SOURCE

Marek Vasut (1):
  automake: Backport perl 5.22 fix

Markus Lehtonen (5):
  oeqa.utils.git: use --verify in rev_parse()
  oe-build-perf-report: use correct x-axis max value in html charts
  oe-build-perf-report: two verbosity levels for --list
  oe-build-perf-report: implement --dump-buildstats
  scripts/buildstats-diff: support optimized rusage values

Maxin B. John (1):
  connman: upgrade to 1.34

Paul Eggleton (2):
  recipetool: create: skip values extracted from spec files containing
    macros
  recipetool: create: extract name of package from a repository

Ross Burton (1):
  kconfig-frontends: fix build race

 meta-selftest/wic/test_generic_efi.wks.in          |   9 +
 meta/classes/cmake.bbclass                         |   9 +-
 meta/classes/grub-efi.bbclass                      |  14 +-
 meta/classes/image_types_wic.bbclass               |  87 +++++--
 meta/classes/systemd-boot.bbclass                  |   8 +
 meta/lib/oeqa/selftest/wic.py                      |  59 ++++-
 meta/lib/oeqa/utils/git.py                         |   2 +-
 ...-mfpmath-sse-as-well-when-SSE-is-disabled.patch |   0
 ...nforce-no-pie-if-the-compiler-supports-it.patch |  45 ----
 ...E-2015-8370-Grub2-user-pass-vulnerability.patch |  53 -----
 ...ct-_llseek-code-and-require-long-filesyst.patch |  81 -------
 ...Use-AC_HEADER_MAJOR-to-find-device-macros.patch |  92 --------
 ...ettext-gettext.c-main_context-secondary_c.patch |  39 ----
 ...ern-efi-mm.c-grub_efi_finish_boot_service.patch |  79 -------
 ...1-grub.d-10_linux.in-add-oe-s-kernel-name.patch |   0
 ..._dhcp_vendor-Add-missing-const-qualifiers.patch |  33 ---
 ...ern-efi-mm.c-grub_efi_get_memory_map-Neve.patch |  43 ----
 .../{grub => files}/autogen.sh-exclude-pc.patch    |   0
 .../grub/files/check-if-liblzma-is-disabled.patch  |  33 ---
 .../grub/files/fix-endianness-problem.patch        |  44 ----
 .../grub/files/fix-issue-with-flex-2.5.37.patch    |  21 --
 meta/recipes-bsp/grub/files/fix-texinfo.patch      |  32 ---
 .../grub/files/grub-2.00-add-oe-kernel.patch       |  53 -----
 .../grub-2.00-fix-enable_execute_stack-check.patch |  27 ---
 .../grub/files/grub-2.00-fpmath-sse-387-fix.patch  |  24 --
 ...allow-a-compilation-without-mcmodel-large.patch | 131 -----------
 .../grub/files/grub-efi-fix-with-glibc-2.20.patch  |  32 ---
 meta/recipes-bsp/grub/files/grub-install.in.patch  |  20 --
 .../grub/files/grub-no-unused-result.patch         |  19 --
 .../grub/files/grub2-fix-initrd-size-bug.patch     |  48 ----
 ...rub2-remove-sparc64-setup-from-x86-builds.patch |  44 ----
 meta/recipes-bsp/grub/files/remove-gets.patch      |  20 --
 .../grub/{grub-efi_2.00.bb => grub-efi_2.02.bb}    |   9 +-
 meta/recipes-bsp/grub/grub2.inc                    |  50 ++--
 .../grub/{grub_2.00.bb => grub_2.02.bb}            |   6 -
 meta/recipes-bsp/grub/grub_git.bb                  |  45 ----
 meta/recipes-connectivity/connman/connman.inc      |   5 +-
 ...x-compile-on-musl-with-kernel-4.9-headers.patch |  37 ++-
 ...ll-nftables-fix-build-with-libnftnl-1.0.7.patch |  72 ++++++
 ...ts-Fix-bad-file-descriptor-initialisation.patch | 102 ---------
 .../connman/{connman_1.33.bb => connman_1.34.bb}   |   6 +-
 ...0001-automake-port-to-Perl-5.22-and-later.patch |  32 +++
 meta/recipes-devtools/automake/automake_1.15.bb    |   1 +
 meta/recipes-devtools/dnf/dnf_git.bb               |   1 +
 .../files/0001-Fix-installation-of-.pc-files.patch |  28 +++
 ...Switch-utils-kconfig-diff-to-use-Python-3.patch |  26 +++
 .../kconfig-frontends/files/missing-mkdir.patch    |  33 +++
 ...s_3.12.0.0.bb => kconfig-frontends_4.10.0.1.bb} |   9 +-
 .../ed/{ed_1.14.1.bb => ed_1.14.2.bb}              |   6 +-
 ...desktop3_3.22.2.bb => gnome-desktop3_3.24.2.bb} |   4 +-
 meta/recipes-graphics/glew/glew_2.0.0.bb           |   1 +
 meta/recipes-graphics/vulkan/vulkan_1.0.39.1.bb    |   1 +
 .../{sysprof_3.22.3.bb => sysprof_3.24.1.bb}       |  10 +-
 .../ffmpeg/{ffmpeg_3.2.4.bb => ffmpeg_3.3.bb}      |   7 +-
 ...libsndfile1_1.0.27.bb => libsndfile1_1.0.28.bb} |   4 +-
 .../altivec_h_needed.patch                         |   8 +-
 .../{mpeg2dec_0.4.1.bb => mpeg2dec_0.5.1.bb}       |  14 +-
 .../mpg123/{mpg123_1.23.8.bb => mpg123_1.24.0.bb}  |   5 +-
 meta/recipes-support/db/db_5.3.28.bb               |   4 +
 meta/recipes-support/gdbm/files/ptest.patch        |  40 ++--
 .../gdbm/{gdbm_1.12.bb => gdbm_1.13.bb}            |   4 +-
 .../icu/icu/icu-pkgdata-large-cmd.patch            |  28 ++-
 scripts/buildstats-diff                            |  20 +-
 scripts/create-pull-request                        |  26 +--
 scripts/lib/recipetool/create.py                   |  11 +-
 scripts/lib/recipetool/create_buildsys.py          |   4 +
 scripts/lib/wic/engine.py                          |  97 +++++++-
 scripts/lib/wic/filemap.py                         |  26 ++-
 scripts/lib/wic/help.py                            |  90 +++++++-
 scripts/lib/wic/plugins/source/bootimg-pcbios.py   |   2 +-
 .../lib/wic/plugins/source/isoimage-isohybrid.py   |   6 +-
 scripts/oe-build-perf-report                       |  96 ++++++--
 scripts/wic                                        | 253 ++++++++++++++-------
 73 files changed, 995 insertions(+), 1435 deletions(-)
 create mode 100644 meta-selftest/wic/test_generic_efi.wks.in
 rename meta/recipes-bsp/grub/{grub-git => files}/0001-Disable-mfpmath-sse-as-well-when-SSE-is-disabled.patch (100%)
 delete mode 100644 meta/recipes-bsp/grub/files/0001-Enforce-no-pie-if-the-compiler-supports-it.patch
 delete mode 100644 meta/recipes-bsp/grub/files/0001-Fix-CVE-2015-8370-Grub2-user-pass-vulnerability.patch
 delete mode 100644 meta/recipes-bsp/grub/files/0001-Remove-direct-_llseek-code-and-require-long-filesyst.patch
 delete mode 100644 meta/recipes-bsp/grub/files/0001-build-Use-AC_HEADER_MAJOR-to-find-device-macros.patch
 delete mode 100644 meta/recipes-bsp/grub/files/0001-grub-core-gettext-gettext.c-main_context-secondary_c.patch
 delete mode 100644 meta/recipes-bsp/grub/files/0001-grub-core-kern-efi-mm.c-grub_efi_finish_boot_service.patch
 rename meta/recipes-bsp/grub/{grub-git => files}/0001-grub.d-10_linux.in-add-oe-s-kernel-name.patch (100%)
 delete mode 100644 meta/recipes-bsp/grub/files/0001-parse_dhcp_vendor-Add-missing-const-qualifiers.patch
 delete mode 100644 meta/recipes-bsp/grub/files/0002-grub-core-kern-efi-mm.c-grub_efi_get_memory_map-Neve.patch
 rename meta/recipes-bsp/grub/{grub => files}/autogen.sh-exclude-pc.patch (100%)
 delete mode 100644 meta/recipes-bsp/grub/files/check-if-liblzma-is-disabled.patch
 delete mode 100644 meta/recipes-bsp/grub/files/fix-endianness-problem.patch
 delete mode 100644 meta/recipes-bsp/grub/files/fix-issue-with-flex-2.5.37.patch
 delete mode 100644 meta/recipes-bsp/grub/files/fix-texinfo.patch
 delete mode 100644 meta/recipes-bsp/grub/files/grub-2.00-add-oe-kernel.patch
 delete mode 100644 meta/recipes-bsp/grub/files/grub-2.00-fix-enable_execute_stack-check.patch
 delete mode 100644 meta/recipes-bsp/grub/files/grub-2.00-fpmath-sse-387-fix.patch
 delete mode 100644 meta/recipes-bsp/grub/files/grub-efi-allow-a-compilation-without-mcmodel-large.patch
 delete mode 100644 meta/recipes-bsp/grub/files/grub-efi-fix-with-glibc-2.20.patch
 delete mode 100644 meta/recipes-bsp/grub/files/grub-install.in.patch
 delete mode 100644 meta/recipes-bsp/grub/files/grub-no-unused-result.patch
 delete mode 100644 meta/recipes-bsp/grub/files/grub2-fix-initrd-size-bug.patch
 delete mode 100644 meta/recipes-bsp/grub/files/grub2-remove-sparc64-setup-from-x86-builds.patch
 delete mode 100644 meta/recipes-bsp/grub/files/remove-gets.patch
 rename meta/recipes-bsp/grub/{grub-efi_2.00.bb => grub-efi_2.02.bb} (88%)
 rename meta/recipes-bsp/grub/{grub_2.00.bb => grub_2.02.bb} (56%)
 delete mode 100644 meta/recipes-bsp/grub/grub_git.bb
 create mode 100644 meta/recipes-connectivity/connman/connman/0001-firewall-nftables-fix-build-with-libnftnl-1.0.7.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman/0003-stats-Fix-bad-file-descriptor-initialisation.patch
 rename meta/recipes-connectivity/connman/{connman_1.33.bb => connman_1.34.bb} (70%)
 create mode 100644 meta/recipes-devtools/automake/automake/0001-automake-port-to-Perl-5.22-and-later.patch
 create mode 100644 meta/recipes-devtools/kconfig-frontends/files/0001-Fix-installation-of-.pc-files.patch
 create mode 100644 meta/recipes-devtools/kconfig-frontends/files/0001-Switch-utils-kconfig-diff-to-use-Python-3.patch
 create mode 100644 meta/recipes-devtools/kconfig-frontends/files/missing-mkdir.patch
 rename meta/recipes-devtools/kconfig-frontends/{kconfig-frontends_3.12.0.0.bb => kconfig-frontends_4.10.0.1.bb} (78%)
 rename meta/recipes-extended/ed/{ed_1.14.1.bb => ed_1.14.2.bb} (79%)
 rename meta/recipes-gnome/gnome-desktop/{gnome-desktop3_3.22.2.bb => gnome-desktop3_3.24.2.bb} (85%)
 rename meta/recipes-kernel/sysprof/{sysprof_3.22.3.bb => sysprof_3.24.1.bb} (73%)
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_3.2.4.bb => ffmpeg_3.3.bb} (95%)
 rename meta/recipes-multimedia/libsndfile/{libsndfile1_1.0.27.bb => libsndfile1_1.0.28.bb} (82%)
 rename meta/recipes-multimedia/mpeg2dec/{mpeg2dec-0.4.1 => files}/altivec_h_needed.patch (86%)
 rename meta/recipes-multimedia/mpeg2dec/{mpeg2dec_0.4.1.bb => mpeg2dec_0.5.1.bb} (79%)
 rename meta/recipes-multimedia/mpg123/{mpg123_1.23.8.bb => mpg123_1.24.0.bb} (93%)
 rename meta/recipes-support/gdbm/{gdbm_1.12.bb => gdbm_1.13.bb} (88%)

-- 
2.8.1


