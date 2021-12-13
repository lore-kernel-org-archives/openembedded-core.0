Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDCB7C433EF
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 03:11:09 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web11.6645.1639365067899627345
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Dec 2021 19:11:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@intel.com header.s=intel
 header.b=fODRk4ps;
 spf=pass (domain: intel.com, ip: 134.134.136.24,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639365067; x=1670901067;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=kw8XbxEclB101gH5jmU1hcaWkm42vXedWtMj+Fj8lUQ=;
  b=fODRk4psFLN71Hc/j7DTGge8UyVvYOYTejF0+mMcB+2ze3CsvetA3/1h
   7mIRQp2ZYubt4NCW72wU5PwYO7T3hUUCyzDYhz29UYdU1RlNEV9nLnD8S
   VEWOIMcL0AESRaN6tBgr/c2TCDsfV1xT2KN9jhUufCtQSwdFTXKGCJTyz
   9RJp7eHv9agka7xL32pmJ/LIeHHuELLffD4aypx8LHhGxj+WsBQ6+coet
   geh+BxqWZBPKhYWtXVmSn5s2ubYm9xqavakKW8c0rJFGjosSKz0gMLURs
   loB9h2sylQy6utIoUb65MFveavcF1pT+ScH4kWAdPvSnRx5EegA2JXihR
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10196"; a="238467860"
X-IronPort-AV: E=Sophos;i="5.88,201,1635231600";
   d="scan'208";a="238467860"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2021 19:11:06 -0800
X-IronPort-AV: E=Sophos;i="5.88,201,1635231600";
   d="scan'208";a="660655483"
Received: from echan1-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.213.132.97])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2021 19:11:04 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 00/33] Pull request
Date: Mon, 13 Dec 2021 11:10:59 +0800
Message-Id: <cover.1639364975.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Dec 2021 03:11:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159589

Please merge these changes.

Thanks,

Anuj

The following changes since commit 70384dd958c57d1da924a66cffa35f80eb60d4b0:

  build-appliance-image: Update to honister head revision (2021-11-25 22:00:48 +0000)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib stable/honister-next

Alexander Kanavin (4):
  systemd: update 249.3 -> 249.4
  systemd: update 249.4 -> 249.5
  systemd: upgrade 249.5 -> 249.6
  systemd: update 249.6 -> 249.7

Alexandre Belloni (1):
  maintainers.inc: fix up rust-cross entry

Bruce Ashfield (2):
  linux-yocto/5.14: update to v5.14.18
  linux-yocto/5.10: update to v5.10.79

Dhruva Gole (1):
  scripts/checklayer/common.py: Fixed a minor grammatical error

Joshua Watt (2):
  classes/meson: Add optional rust definitions
  classes/crate-fetch: Ensure crate fetcher is available

Khem Raj (1):
  boost: Fix build on arches with no atomics

Li Wang (1):
  libtool: change the default AR_FLAGS from "cru" to "cr"

Martin Jansa (1):
  boost: allow searching for python310

Mingli Yu (1):
  wic: use shutil.which

Pavel Zhukov (2):
  go: upgrade 1.16.8 -> 1.16.10
  patch.py: Initialize git repo before patching

Pgowda (2):
  rust-cross: Fix directory not deleted for race glibc vs. musl
  rust-cross: Replace TARGET_ARCH with TUNE_PKGARCH

Quentin Schulz (1):
  README.OE-Core.md: update URLs

Richard Purdie (5):
  buildhistory: Fix srcrevs output
  glibc: Fix i586/c3 support
  oeqa/utils/dump: Fix typo
  oeqa/parselogs: Fix quoting
  libtool: Update patchset to match those submitted upstream

Ross Burton (5):
  gmp: fix CVE-2021-43618
  vim: fix CVE-2021-3927 and CVE-2021-3928
  vim: fix CVE-2021-3968 and CVE-2021-3973
  recipetool: handle GitLab URLs like we do GitHub
  recipetool: extend curl detection when creating recipes

Schmidt, Adriaan (1):
  wic: support rootdev identified by partition label

Vyacheslav Yurkov (1):
  rootfs-postcommands: update systemd_create_users

wangmy (2):
  libdrm: upgrade 2.4.107 -> 2.4.108
  libdrm: upgrade 2.4.108 -> 2.4.109

 README.OE-Core.md                             |  10 +-
 meta/classes/buildhistory.bbclass             |  30 ++--
 meta/classes/crate-fetch.bbclass              |  21 ++-
 meta/classes/meson.bbclass                    |  11 +-
 meta/classes/rootfs-postcommands.bbclass      |   2 +-
 meta/conf/distro/include/maintainers.inc      |   2 +-
 meta/lib/oe/patch.py                          |  16 +-
 meta/lib/oeqa/runtime/cases/parselogs.py      |  14 +-
 meta/lib/oeqa/selftest/cases/bbtests.py       |  15 ++
 meta/lib/oeqa/utils/dump.py                   |   2 +-
 meta/recipes-core/glibc/glibc_2.34.bb         |   2 +-
 ...md-boot_249.3.bb => systemd-boot_249.7.bb} |   0
 meta/recipes-core/systemd/systemd.inc         |   2 +-
 ...002-don-t-use-glibc-specific-qsort_r.patch |   2 +-
 ...dd-__compare_fn_t-and-comparison_fn_.patch |   2 +-
 ...k-parse_printf_format-implementation.patch |   8 +-
 ...missing.h-check-for-missing-strndupa.patch |  24 +--
 .../0006-Include-netinet-if_ether.h.patch     |  15 +-
 ...OB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch |   2 +-
 ...008-add-missing-FTW_-macros-for-musl.patch |   3 +-
 ..._register_atfork-for-non-glibc-build.patch |   4 +-
 ...10-Use-uintmax_t-for-handling-rlim_t.patch |   6 +-
 ...sable-tests-for-missing-typedefs-in-.patch |   4 +-
 ...T_SYMLINK_NOFOLLOW-flag-to-faccessat.patch |   2 +-
 ...patible-basename-for-non-glibc-syste.patch |   2 +-
 ...uffering-when-writing-to-oom_score_a.patch |   4 +-
 ...compliant-strerror_r-from-GNU-specif.patch |   2 +-
 ...S_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch |   2 +-
 ...ype.h-add-__compar_d_fn_t-definition.patch |   2 +-
 ...definition-of-prctl_mm_map-structure.patch |   2 +-
 .../systemd/0019-Handle-missing-LOCK_EX.patch |   2 +-
 ...ible-pointer-type-struct-sockaddr_un.patch |   8 +-
 .../0021-test-json.c-define-M_PIl.patch       |   2 +-
 ...-not-disable-buffer-in-writing-files.patch |   8 +-
 .../0025-Handle-__cpu_mask-usage.patch        |   4 +-
 .../systemd/0026-Handle-missing-gshadow.patch |   2 +-
 ...l.h-Define-MIPS-ABI-defines-for-musl.patch |   2 +-
 .../{systemd_249.3.bb => systemd_249.7.bb}    |   0
 .../go/{go-1.16.8.inc => go-1.16.10.inc}      |   4 +-
 ..._1.16.8.bb => go-binary-native_1.16.10.bb} |   4 +-
 ...1.16.8.bb => go-cross-canadian_1.16.10.bb} |   0
 ...go-cross_1.16.8.bb => go-cross_1.16.10.bb} |   0
 ...sssdk_1.16.8.bb => go-crosssdk_1.16.10.bb} |   0
 ...-native_1.16.8.bb => go-native_1.16.10.bb} |   0
 ...untime_1.16.8.bb => go-runtime_1.16.10.bb} |   0
 .../go/{go_1.16.8.bb => go_1.16.10.bb}        |   0
 .../libtool/libtool-2.4.6.inc                 |  27 ++--
 ...-trailing-slashes-on-install-command.patch |  35 ++++
 ...-the-with-sysroot-option-to-avoid-c.patch} |  13 +-
 ...Add-missing-sysroot-to-library-path.patch} |  10 +-
 ...root-paths-being-encoded-into-RPATH.patch} |  16 +-
 ...ncode-RATHS-which-match-default-lin.patch} |  37 +++--
 ...ol.m4-Handle-as-a-sysroot-correctly.patch} |  18 ++-
 ...ool-Fix-support-for-NIOS2-processor.patch} |   9 +-
 ...-static-libs-for-internal-compiler-.patch} |  13 +-
 ...sure-autoheader-run-before-autoconf.patch} |  10 +-
 ...sure-autoheader-run-before-automake.patch} |   9 +-
 ...prefix-map-compiler-options-correct.patch} |   6 +-
 ...producibility-stop-encoding-hostnam.patch} |  12 +-
 ...AGS-use-cr-instead-of-cru-by-default.patch | 133 +++++++++++++++
 .../libtool/libtool/fixinstall.patch          |   6 +-
 .../libool.m4-add-ARFLAGS-variable.patch      |  77 +++++++++
 .../libtool/libtool/norm-rpath.patch          |  38 -----
 .../libtool/libtool/trailingslash.patch       |  35 ----
 meta/recipes-devtools/rust/rust-cross.inc     |   2 +-
 .../{libdrm_2.4.107.bb => libdrm_2.4.109.bb}  |   2 +-
 .../linux/linux-yocto-rt_5.10.bb              |   6 +-
 .../linux/linux-yocto-rt_5.14.bb              |   6 +-
 .../linux/linux-yocto-tiny_5.10.bb            |   8 +-
 .../linux/linux-yocto-tiny_5.14.bb            |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb |  24 +--
 meta/recipes-kernel/linux/linux-yocto_5.14.bb |  26 +--
 ....cmake-allow-searching-for-python310.patch |  50 ++++++
 ...th_no_atomic_int-on-the-command-line.patch |  53 ++++++
 ...oft-failure-in-bernoulli_details_hpp.patch | 151 ++++++++++++++++++
 meta/recipes-support/boost/boost_1.77.0.bb    |   3 +
 .../gmp/gmp/cve-2021-43618.patch              |  27 ++++
 meta/recipes-support/gmp/gmp_6.2.1.bb         |   1 +
 ...1-reading-character-past-end-of-line.patch |  62 +++++++
 ...eading-uninitialized-memory-when-giv.patch |  63 ++++++++
 ...rash-when-using-CTRL-W-f-without-fin.patch |  92 +++++++++++
 meta/recipes-support/vim/vim.inc              |   6 +
 scripts/lib/checklayer/cases/common.py        |   2 +-
 scripts/lib/recipetool/create.py              |   2 +-
 scripts/lib/recipetool/create_buildsys.py     |   3 +-
 scripts/lib/wic/engine.py                     |   6 +-
 scripts/lib/wic/misc.py                       |   4 +-
 scripts/lib/wic/plugins/imager/direct.py      |   2 +
 scripts/wic                                   |   4 +-
 89 files changed, 1063 insertions(+), 303 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot_249.3.bb => systemd-boot_249.7.bb} (100%)
 rename meta/recipes-core/systemd/{systemd_249.3.bb => systemd_249.7.bb} (100%)
 rename meta/recipes-devtools/go/{go-1.16.8.inc => go-1.16.10.inc} (90%)
 rename meta/recipes-devtools/go/{go-binary-native_1.16.8.bb => go-binary-native_1.16.10.bb} (83%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.16.8.bb => go-cross-canadian_1.16.10.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.16.8.bb => go-cross_1.16.10.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.16.8.bb => go-crosssdk_1.16.10.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.16.8.bb => go-native_1.16.10.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.16.8.bb => go-runtime_1.16.10.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.16.8.bb => go_1.16.10.bb} (100%)
 create mode 100644 meta/recipes-devtools/libtool/libtool/0001-ltmain.in-Handle-trailing-slashes-on-install-command.patch
 rename meta/recipes-devtools/libtool/libtool/{rename-with-sysroot.patch => 0002-libtool.m4-Rename-the-with-sysroot-option-to-avoid-c.patch} (90%)
 rename meta/recipes-devtools/libtool/libtool/{use-sysroot-in-libpath.patch => 0003-ltmain.in-Add-missing-sysroot-to-library-path.patch} (63%)
 rename meta/recipes-devtools/libtool/libtool/{fix-final-rpath.patch => 0004-ltmain.sh-Fix-sysroot-paths-being-encoded-into-RPATH.patch} (74%)
 rename meta/recipes-devtools/libtool/libtool/{fix-rpath.patch => 0005-ltmain.in-Don-t-encode-RATHS-which-match-default-lin.patch} (57%)
 rename meta/recipes-devtools/libtool/libtool/{fix-resolve-lt-sysroot.patch => 0006-libtool.m4-Handle-as-a-sysroot-correctly.patch} (60%)
 rename meta/recipes-devtools/libtool/libtool/{0001-libtool-Fix-support-for-NIOS2-processor.patch => 0007-libtool-Fix-support-for-NIOS2-processor.patch} (90%)
 rename meta/recipes-devtools/libtool/libtool/{0001-libtool-Check-for-static-libs-for-internal-compiler-.patch => 0008-libtool-Check-for-static-libs-for-internal-compiler-.patch} (71%)
 rename meta/recipes-devtools/libtool/libtool/{0001-Makefile.am-make-sure-autoheader-run-before-autoconf.patch => 0009-Makefile.am-make-sure-autoheader-run-before-autoconf.patch} (79%)
 rename meta/recipes-devtools/libtool/libtool/{0001-Makefile.am-make-sure-autoheader-run-before-automake.patch => 0010-Makefile.am-make-sure-autoheader-run-before-automake.patch} (75%)
 rename meta/recipes-devtools/libtool/libtool/{lto-prefix.patch => 0011-ltmain.in-Handle-prefix-map-compiler-options-correct.patch} (82%)
 rename meta/recipes-devtools/libtool/libtool/{debian-no_hostname.patch => 0012-libtool.m4-For-reproducibility-stop-encoding-hostnam.patch} (55%)
 mode change 100755 => 100644
 create mode 100644 meta/recipes-devtools/libtool/libtool/ARFLAGS-use-cr-instead-of-cru-by-default.patch
 create mode 100644 meta/recipes-devtools/libtool/libtool/libool.m4-add-ARFLAGS-variable.patch
 delete mode 100644 meta/recipes-devtools/libtool/libtool/norm-rpath.patch
 delete mode 100644 meta/recipes-devtools/libtool/libtool/trailingslash.patch
 rename meta/recipes-graphics/drm/{libdrm_2.4.107.bb => libdrm_2.4.109.bb} (97%)
 create mode 100644 meta/recipes-support/boost/boost/0001-BoostConfig.cmake-allow-searching-for-python310.patch
 create mode 100644 meta/recipes-support/boost/boost/0002-math-allow-definition-of-boost_math_no_atomic_int-on-the-command-line.patch
 create mode 100644 meta/recipes-support/boost/boost/0003-math-make-no-atomics-a-soft-failure-in-bernoulli_details_hpp.patch
 create mode 100644 meta/recipes-support/gmp/gmp/cve-2021-43618.patch
 create mode 100644 meta/recipes-support/vim/files/0001-patch-8.2.3581-reading-character-past-end-of-line.patch
 create mode 100644 meta/recipes-support/vim/files/0002-patch-8.2.3582-reading-uninitialized-memory-when-giv.patch
 create mode 100644 meta/recipes-support/vim/files/0002-patch-8.2.3611-crash-when-using-CTRL-W-f-without-fin.patch

-- 
2.33.1


