Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8AEF578A2C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jul 2018 07:27:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w657Rh0d031898
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 5 Jul 2018 00:27:43 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Thu, 5 Jul 2018 00:27:42 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 5 Jul 2018 15:31:01 +0800
Message-ID: <cover.1530775716.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/2] upgrade systemd and systemd-boot to 239
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
X-List-Received-Date: Thu, 05 Jul 2018 07:27:43 -0000
Content-Type: text/plain

The following changes since commit 611013a23a0082faa4fda2cd2529668965586a76:

  mesa: add lost Upstream-Status tag (2018-07-05 00:22:08 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/systemd-239
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/systemd-239

Chen Qi (2):
  systemd: upgrade to 239
  systemd-boot: upgrade to 239

 .../{systemd-boot_237.bb => systemd-boot_239.bb}   |   5 +-
 meta/recipes-core/systemd/systemd.inc              |   2 +-
 ...01-Also-check-i386-i586-and-i686-for-ia32.patch |  28 --
 ...rt_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch |  34 --
 ...ck-protector-flags-to-workaround-musl-bui.patch |  28 +-
 ...nv-when-secure-versions-are-not-available.patch |  10 +-
 ...-install-dependency-links-at-install-tim.patch} |  22 +-
 ....c-Change-the-default-device-timeout-to-2.patch |  19 +-
 ...=> 0002-don-t-use-glibc-specific-qsort_r.patch} | 108 +++++-
 ...per-instead-of-looking-for-relative-opti.patch} |  16 +-
 ...n_t-is-glibc-specific-use-raw-signature-.patch} |  25 +-
 ...003-implment-systemd-sysv-install-for-OE.patch} |  10 +-
 ...lback-parse_printf_format-implementation.patch} |  49 +--
 ...patch => 0004-rules-whitelist-hd-devices.patch} |   8 +-
 ...-Make-root-s-home-directory-configurable.patch} |  34 +-
 ...clude-gshadow-only-if-ENABLE_GSHADOW-is-1.patch |  29 ++
 ...> 0006-remove-nobody-user-group-checking.patch} |  40 +--
 ...sic-missing.h-check-for-missing-strndupa.patch} |  66 ++--
 ...patch => 0007-Include-netinet-if_ether.h.patch} |  51 +--
 ...evert-rules-remove-firmware-loading-rules.patch |  28 --
 ...es-watch-metadata-changes-in-ide-devices.patch} |   6 +-
 ...e-nss-tests-if-nss-systemd-is-not-enable.patch} |  16 +-
 ...-remove-userspace-firmware-loading-suppor.patch | 377 ---------------------
 ...f-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch} |  86 +++--
 ...=> 0009-add-missing-FTW_-macros-for-musl.patch} |  12 +-
 ...es-Build-conditionally-when-ENABLE_MYHOS.patch} |  10 +-
 .../0009-remove-duplicate-include-uchar.h.patch    |  41 ---
 .../0010-check-for-uchar.h-in-meson.build.patch    |  45 ---
 ...l-don-t-fail-if-libc-doesn-t-support-IDN.patch} |  17 +-
 ...ssing.h-check-for-missing-__compar_fn_t-.patch} |  23 +-
 ...of-__register_atfork-for-non-glibc-build.patch} |  18 +-
 ...> 0013-Use-uintmax_t-for-handling-rlim_t.patch} |  33 +-
 ...ULONG_LONG_MAX-definition-in-case-of-mus.patch} |  12 +-
 ...xdecoct.c-Include-missing.h-for-strndupa.patch} |  12 +-
 ...c-Disable-tests-for-missing-typedefs-in-.patch} |  14 +-
 ...ss-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch} |  20 +-
 ...-compatible-basename-for-non-glibc-syste.patch} |  11 +-
 ...-check-for-missing-canonicalize_file_name.patch |  47 ---
 ...ble-buffering-when-writing-to-oom_score_a.patch |  39 +++
 ...PATH_WTMPX-and-_PATH_UTMPX-if-not-defined.patch |  43 ---
 meta/recipes-core/systemd/systemd/0032-memfd.patch | 272 ---------------
 ...cros-rename-noreturn-into-_noreturn_-8456.patch | 203 -----------
 ...truncation-compile-failure-by-typecasting.patch | 173 ----------
 ...ix-build-with-gcc8-Werror-format-truncati.patch |  53 ---
 meta/recipes-core/systemd/systemd/libmount.patch   |  75 ----
 .../systemd/{systemd_237.bb => systemd_239.bb}     | 124 +++----
 46 files changed, 561 insertions(+), 1833 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot_237.bb => systemd-boot_239.bb} (91%)
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-Also-check-i386-i586-and-i686-for-ia32.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch
 rename meta/recipes-core/systemd/systemd/{0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch => 0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch} (83%)
 rename meta/recipes-core/systemd/systemd/{0022-don-t-use-glibc-specific-qsort_r.patch => 0002-don-t-use-glibc-specific-qsort_r.patch} (52%)
 rename meta/recipes-core/systemd/systemd/{0003-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch => 0002-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch} (83%)
 rename meta/recipes-core/systemd/systemd/{0024-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch => 0003-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch} (47%)
 rename meta/recipes-core/systemd/systemd/{0004-implment-systemd-sysv-install-for-OE.patch => 0003-implment-systemd-sysv-install-for-OE.patch} (86%)
 rename meta/recipes-core/systemd/systemd/{0013-add-fallback-parse_printf_format-implementation.patch => 0004-add-fallback-parse_printf_format-implementation.patch} (93%)
 rename meta/recipes-core/systemd/systemd/{0005-rules-whitelist-hd-devices.patch => 0004-rules-whitelist-hd-devices.patch} (89%)
 rename meta/recipes-core/systemd/systemd/{0006-Make-root-s-home-directory-configurable.patch => 0005-Make-root-s-home-directory-configurable.patch} (70%)
 create mode 100644 meta/recipes-core/systemd/systemd/0005-include-gshadow-only-if-ENABLE_GSHADOW-is-1.patch
 rename meta/recipes-core/systemd/systemd/{0027-remove-nobody-user-group-checking.patch => 0006-remove-nobody-user-group-checking.patch} (40%)
 rename meta/recipes-core/systemd/systemd/{0014-src-basic-missing.h-check-for-missing-strndupa.patch => 0006-src-basic-missing.h-check-for-missing-strndupa.patch} (73%)
 rename meta/recipes-core/systemd/systemd/{0017-Include-netinet-if_ether.h.patch => 0007-Include-netinet-if_ether.h.patch} (68%)
 delete mode 100644 meta/recipes-core/systemd/systemd/0007-Revert-rules-remove-firmware-loading-rules.patch
 rename meta/recipes-core/systemd/systemd/{0012-rules-watch-metadata-changes-in-ide-devices.patch => 0007-rules-watch-metadata-changes-in-ide-devices.patch} (92%)
 rename meta/recipes-core/systemd/systemd/{0019-Do-not-enable-nss-tests-if-nss-systemd-is-not-enable.patch => 0008-Do-not-enable-nss-tests-if-nss-systemd-is-not-enable.patch} (60%)
 delete mode 100644 meta/recipes-core/systemd/systemd/0008-Revert-udev-remove-userspace-firmware-loading-suppor.patch
 rename meta/recipes-core/systemd/systemd/{0015-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch => 0008-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch} (67%)
 rename meta/recipes-core/systemd/systemd/{0028-add-missing-FTW_-macros-for-musl.patch => 0009-add-missing-FTW_-macros-for-musl.patch} (79%)
 rename meta/recipes-core/systemd/systemd/{0029-nss-mymachines-Build-conditionally-when-ENABLE_MYHOS.patch => 0009-nss-mymachines-Build-conditionally-when-ENABLE_MYHOS.patch} (84%)
 delete mode 100644 meta/recipes-core/systemd/systemd/0009-remove-duplicate-include-uchar.h.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0010-check-for-uchar.h-in-meson.build.patch
 rename meta/recipes-core/systemd/systemd/{0011-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch => 0010-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch} (68%)
 rename meta/recipes-core/systemd/systemd/{0016-src-basic-missing.h-check-for-missing-__compar_fn_t-.patch => 0011-src-basic-missing.h-check-for-missing-__compar_fn_t-.patch} (63%)
 rename meta/recipes-core/systemd/systemd/{0030-fix-missing-of-__register_atfork-for-non-glibc-build.patch => 0012-fix-missing-of-__register_atfork-for-non-glibc-build.patch} (75%)
 rename meta/recipes-core/systemd/systemd/{0026-Use-uintmax_t-for-handling-rlim_t.patch => 0013-Use-uintmax_t-for-handling-rlim_t.patch} (77%)
 rename meta/recipes-core/systemd/systemd/{0031-fix-missing-ULONG_LONG_MAX-definition-in-case-of-mus.patch => 0014-fix-missing-ULONG_LONG_MAX-definition-in-case-of-mus.patch} (66%)
 rename meta/recipes-core/systemd/systemd/{0020-test-hexdecoct.c-Include-missing.h-for-strndupa.patch => 0015-test-hexdecoct.c-Include-missing.h-for-strndupa.patch} (70%)
 rename meta/recipes-core/systemd/systemd/{0021-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch => 0016-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch} (73%)
 rename meta/recipes-core/systemd/systemd/{0023-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch => 0017-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch} (89%)
 rename meta/recipes-core/systemd/systemd/{0035-Define-glibc-compatible-basename-for-non-glibc-syste.patch => 0018-Define-glibc-compatible-basename-for-non-glibc-syste.patch} (78%)
 delete mode 100644 meta/recipes-core/systemd/systemd/0018-check-for-missing-canonicalize_file_name.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0019-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0025-Define-_PATH_WTMPX-and-_PATH_UTMPX-if-not-defined.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0032-memfd.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0033-basic-macros-rename-noreturn-into-_noreturn_-8456.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0034-Fix-format-truncation-compile-failure-by-typecasting.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0036-time-util-fix-build-with-gcc8-Werror-format-truncati.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/libmount.patch
 rename meta/recipes-core/systemd/{systemd_237.bb => systemd_239.bb} (86%)

-- 
1.9.1


