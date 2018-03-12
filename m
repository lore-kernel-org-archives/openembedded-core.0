Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 14E3971A0F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2018 08:38:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w2C8cTge017227
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2018 01:38:30 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.197) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Mon, 12 Mar 2018 01:37:50 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 12 Mar 2018 16:38:50 +0800
Message-ID: <cover.1520841539.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/3] systemd & systemd-boot: upgrade to 237
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
X-List-Received-Date: Mon, 12 Mar 2018 08:38:30 -0000
Content-Type: text/plain

Changes in V2:
* Rebase against latest master to resolve conflicts


The following changes since commit 5350ee317740751f2417c1794dd39d3880347dbf:

  yocto-uninative: Upgrade to 1.8 version with glibc 2.27 (2018-03-11 06:27:02 -0700)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/systemd-237
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/systemd-237

Chen Qi (3):
  systemd: upgrade to 237
  systemd: fix build failure for qemux86 and qemuppc with musl
  systemd-boot: upgrade to 237

 .../{systemd-boot_234.bb => systemd-boot_237.bb}   |  31 ++-
 meta/recipes-core/systemd/systemd.inc              |   2 +-
 ...01-Also-check-i386-i586-and-i686-for-ia32.patch |  28 +++
 ...efi_cc-and-efi_ld-correctly-when-cross-co.patch |  62 +++++
 ...ck-protector-flags-to-workaround-musl-bui.patch |  33 +++
 ...v-when-secure-versions-are-not-available.patch} |  21 +-
 ...te-presets-after-generators-have-run-6526.patch |  69 ------
 ...any-initialization-steps-when-running-in-.patch | 163 -------------
 ...update-header-file-to-detect-memfd_create.patch |  28 ---
 ...t-install-dependency-links-at-install-tim.patch |  81 +++++++
 ...c-Check-if-memfd_create-is-already-define.patch |  27 ---
 .../systemd/0003-fileio-include-sys-mman.h.patch   |  26 --
 ...pper-instead-of-looking-for-relative-opti.patch |  64 +++++
 ...004-implment-systemd-sysv-install-for-OE.patch} |   8 +-
 ...t-install-dependency-links-at-install-tim.patch |  74 ------
 ...patch => 0005-rules-whitelist-hd-devices.patch} |   9 +-
 ...6-Make-root-s-home-directory-configurable.patch |  78 ++++++
 ...vert-rules-remove-firmware-loading-rules.patch} |   8 +-
 ...-check-for-missing-canonicalize_file_name.patch |  63 -----
 ...pper-instead-of-looking-for-relative-opti.patch |  40 ---
 .../systemd/0008-Do-not-enable-nss-tests.patch     |  35 ---
 ...remove-userspace-firmware-loading-suppor.patch} | 204 +++++++++-------
 ...=> 0009-remove-duplicate-include-uchar.h.patch} |  14 +-
 .../0010-check-for-uchar.h-in-meson.build.patch    |  45 ++++
 ...nes-Build-conditionally-when-HAVE_MYHOSTN.patch |  38 ---
 ...l-don-t-fail-if-libc-doesn-t-support-IDN.patch} |  26 +-
 ...es-watch-metadata-changes-in-ide-devices.patch} |   8 +-
 ...3-Make-root-s-home-directory-configurable.patch | 155 ------------
 ...lback-parse_printf_format-implementation.patch} |  86 ++++---
 ...sic-missing.h-check-for-missing-strndupa.patch} |  96 ++++----
 ...f-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch} |  30 +--
 ...ssing.h-check-for-missing-__compar_fn_t-.patch} |  18 +-
 ...patch => 0017-Include-netinet-if_ether.h.patch} |  55 +++--
 ...-check-for-missing-canonicalize_file_name.patch |  47 ++++
 .../0018-check-for-uchar.h-in-configure.patch      |  44 ----
 ...le-nss-tests-if-nss-systemd-is-not-enable.patch |  29 +++
 ...xdecoct.c-Include-missing.h-for-strndupa.patch} |  15 +-
 ...c-Disable-tests-for-missing-typedefs-in-.patch} |  39 ++-
 ...=> 0022-don-t-use-glibc-specific-qsort_r.patch} |  26 +-
 ...ss-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch} |  22 +-
 ...n_t-is-glibc-specific-use-raw-signature-.patch} |  14 +-
 ...ATH_WTMPX-and-_PATH_UTMPX-if-not-defined.patch} |  16 +-
 ...> 0026-Use-uintmax_t-for-handling-rlim_t.patch} |  22 +-
 .../0027-remove-nobody-user-group-checking.patch   |  63 +++++
 .../0028-add-missing-FTW_-macros-for-musl.patch    |  50 ++++
 ...nes-Build-conditionally-when-ENABLE_MYHOS.patch |  43 ++++
 ...-of-__register_atfork-for-non-glibc-build.patch |  45 ++++
 ...-ULONG_LONG_MAX-definition-in-case-of-mus.patch |  30 +++
 meta/recipes-core/systemd/systemd/run-ptest        |   6 -
 .../systemd/{systemd_234.bb => systemd_237.bb}     | 270 +++++++++------------
 50 files changed, 1211 insertions(+), 1295 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot_234.bb => systemd-boot_237.bb} (58%)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-Also-check-i386-i586-and-i686-for-ia32.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0001-Fix-to-run-efi_cc-and-efi_ld-correctly-when-cross-co.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0001-Remove-fstack-protector-flags-to-workaround-musl-bui.patch
 rename meta/recipes-core/systemd/systemd/{0004-Use-getenv-when-secure-versions-are-not-available.patch => 0001-Use-getenv-when-secure-versions-are-not-available.patch} (53%)
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-core-evaluate-presets-after-generators-have-run-6526.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-main-skip-many-initialization-steps-when-running-in-.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-meson-update-header-file-to-detect-memfd_create.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0002-configure.ac-Check-if-memfd_create-is-already-define.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0003-fileio-include-sys-mman.h.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0003-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch
 rename meta/recipes-core/systemd/systemd/{0010-implment-systemd-sysv-install-for-OE.patch => 0004-implment-systemd-sysv-install-for-OE.patch} (89%)
 delete mode 100644 meta/recipes-core/systemd/systemd/0005-binfmt-Don-t-install-dependency-links-at-install-tim.patch
 rename meta/recipes-core/systemd/systemd/{0012-rules-whitelist-hd-devices.patch => 0005-rules-whitelist-hd-devices.patch} (89%)
 create mode 100644 meta/recipes-core/systemd/systemd/0006-Make-root-s-home-directory-configurable.patch
 rename meta/recipes-core/systemd/systemd/{0014-Revert-rules-remove-firmware-loading-rules.patch => 0007-Revert-rules-remove-firmware-loading-rules.patch} (81%)
 delete mode 100644 meta/recipes-core/systemd/systemd/0007-check-for-missing-canonicalize_file_name.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0007-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0008-Do-not-enable-nss-tests.patch
 rename meta/recipes-core/systemd/systemd/{0015-Revert-udev-remove-userspace-firmware-loading-suppor.patch => 0008-Revert-udev-remove-userspace-firmware-loading-suppor.patch} (63%)
 rename meta/recipes-core/systemd/systemd/{0017-remove-duplicate-include-uchar.h.patch => 0009-remove-duplicate-include-uchar.h.patch} (78%)
 create mode 100644 meta/recipes-core/systemd/systemd/0010-check-for-uchar.h-in-meson.build.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0011-nss-mymachines-Build-conditionally-when-HAVE_MYHOSTN.patch
 rename meta/recipes-core/systemd/systemd/{0019-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch => 0011-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch} (58%)
 rename meta/recipes-core/systemd/systemd/{0020-rules-watch-metadata-changes-in-ide-devices.patch => 0012-rules-watch-metadata-changes-in-ide-devices.patch} (90%)
 delete mode 100644 meta/recipes-core/systemd/systemd/0013-Make-root-s-home-directory-configurable.patch
 rename meta/recipes-core/systemd/systemd/{0001-add-fallback-parse_printf_format-implementation.patch => 0013-add-fallback-parse_printf_format-implementation.patch} (88%)
 rename meta/recipes-core/systemd/systemd/{0002-src-basic-missing.h-check-for-missing-strndupa.patch => 0014-src-basic-missing.h-check-for-missing-strndupa.patch} (47%)
 rename meta/recipes-core/systemd/systemd/{0003-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch => 0015-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch} (88%)
 rename meta/recipes-core/systemd/systemd/{0004-src-basic-missing.h-check-for-missing-__compar_fn_t-.patch => 0016-src-basic-missing.h-check-for-missing-__compar_fn_t-.patch} (77%)
 rename meta/recipes-core/systemd/systemd/{0006-Include-netinet-if_ether.h.patch => 0017-Include-netinet-if_ether.h.patch} (67%)
 create mode 100644 meta/recipes-core/systemd/systemd/0018-check-for-missing-canonicalize_file_name.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0018-check-for-uchar.h-in-configure.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0019-Do-not-enable-nss-tests-if-nss-systemd-is-not-enable.patch
 rename meta/recipes-core/systemd/systemd/{0009-test-hexdecoct.c-Include-missing.h-form-strndupa.patch => 0020-test-hexdecoct.c-Include-missing.h-for-strndupa.patch} (68%)
 rename meta/recipes-core/systemd/systemd/{0010-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch => 0021-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch} (49%)
 rename meta/recipes-core/systemd/systemd/{0011-don-t-use-glibc-specific-qsort_r.patch => 0022-don-t-use-glibc-specific-qsort_r.patch} (88%)
 rename meta/recipes-core/systemd/systemd/{0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch => 0023-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch} (90%)
 rename meta/recipes-core/systemd/systemd/{0013-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch => 0024-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch} (77%)
 rename meta/recipes-core/systemd/systemd/{0001-Define-_PATH_WTMPX-and-_PATH_UTMPX-if-not-defined.patch => 0025-Define-_PATH_WTMPX-and-_PATH_UTMPX-if-not-defined.patch} (80%)
 rename meta/recipes-core/systemd/systemd/{0001-Use-uintmax_t-for-handling-rlim_t.patch => 0026-Use-uintmax_t-for-handling-rlim_t.patch} (89%)
 create mode 100644 meta/recipes-core/systemd/systemd/0027-remove-nobody-user-group-checking.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0028-add-missing-FTW_-macros-for-musl.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0029-nss-mymachines-Build-conditionally-when-ENABLE_MYHOS.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0030-fix-missing-of-__register_atfork-for-non-glibc-build.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0031-fix-missing-ULONG_LONG_MAX-definition-in-case-of-mus.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/run-ptest
 rename meta/recipes-core/systemd/{systemd_234.bb => systemd_237.bb} (71%)

-- 
1.9.1


