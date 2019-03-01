Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C316E79CC0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Mar 2019 08:42:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x218gYON003536
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Mar 2019 00:42:34 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.435.0; Fri, 1 Mar 2019 00:42:33 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 1 Mar 2019 16:52:11 +0800
Message-ID: <cover.1551430235.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/3] Upgrade systemd to 241
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
X-List-Received-Date: Fri, 01 Mar 2019 08:42:33 -0000
Content-Type: text/plain


The following changes since commit 4d275d97b6c572fe11668ac16d2c77c018340c7c:

  perl: apply a native-only patch only to -native (2019-02-28 17:49:40 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/systemd-241
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/systemd-241

Chen Qi (3):
  systemd: upgrade to 241
  systemd-conf: add version info in recipe name
  systemd-boot: upgrade to 241

 .../{systemd-boot_239.bb => systemd-boot_241.bb}   |  10 +-
 .../{systemd-conf.bb => systemd-conf_241.bb}       |   0
 meta/recipes-core/systemd/systemd.inc              |   2 +-
 ...ck-protector-flags-to-workaround-musl-bui.patch |  33 --
 ...t-meson-print-EFI-CC-configuration-nicely.patch |  33 ++
 ...vert-meson-use-an-array-option-for-efi-cc.patch |  77 +++
 ...tl.d-request-ECN-on-both-in-and-outgoing-.patch |  36 --
 ...nv-when-secure-versions-are-not-available.patch |  21 +-
 ...t-install-dependency-links-at-install-tim.patch |  22 +-
 ...sive-let-s-rework-the-recursive-logic-to-.patch | 219 ---------
 ...eserializing-state-always-use-read_line-L.patch | 250 ----------
 ...sure-we-have-enough-space-for-the-DHCP6-o.patch |  39 --
 ...01-do-not-disable-buffer-in-writing-files.patch | 523 +++++++++++++++++++++
 ...arse_uid-when-unmounting-user-runtime-dir.patch | 110 -----
 .../0001-meson-rename-Ddebug-to-Ddebug-extra.patch |  45 --
 ...bus-make-BUS_DEFAULT_TIMEOUT-configurable.patch | 175 -------
 ...l-Don-t-pass-null-directive-argument-to-s.patch |  31 --
 ...ync-changes-type-of-drift_freq-to-int64_t.patch |  49 --
 ...Fix-use-after-free-case-in-load_from_path.patch |  43 --
 .../0002-don-t-use-glibc-specific-qsort_r.patch    | 231 +++++----
 ...pper-instead-of-looking-for-relative-opti.patch |  14 +-
 ...fn_t-is-glibc-specific-use-raw-signature-.patch |  40 --
 ...0003-implment-systemd-sysv-install-for-OE.patch |   8 +-
 ...e.h-add-__compare_fn_t-and-comparison_fn_.patch |  61 +++
 ...llback-parse_printf_format-implementation.patch |  33 +-
 .../systemd/0004-rules-whitelist-hd-devices.patch  |  18 +-
 ...5-Make-root-s-home-directory-configurable.patch |  70 ---
 ...user-util-properly-protect-use-of-gshadow.patch |  38 --
 ...es-watch-metadata-changes-in-ide-devices.patch} |  18 +-
 ...sic-missing.h-check-for-missing-strndupa.patch} |  90 ++--
 ...patch => 0006-Include-netinet-if_ether.h.patch} |  28 +-
 .../0006-remove-nobody-user-group-checking.patch   |  63 ---
 ...if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not.patch} |  49 +-
 ...le-nss-tests-if-nss-systemd-is-not-enable.patch |  29 --
 ...=> 0008-add-missing-FTW_-macros-for-musl.patch} |  29 +-
 ...nes-Build-conditionally-when-ENABLE_MYHOS.patch |  43 --
 ...l-don-t-fail-if-libc-doesn-t-support-IDN.patch} |  10 +-
 ...of-__register_atfork-for-non-glibc-build.patch} |  16 +-
 ...> 0011-Use-uintmax_t-for-handling-rlim_t.patch} |  59 ++-
 ...issing.h-check-for-missing-__compar_fn_t-.patch |  48 --
 ...-ULONG_LONG_MAX-definition-in-case-of-mus.patch |  27 ++
 ...xdecoct.c-Include-missing.h-for-strndupa.patch} |   8 +-
 ...-ULONG_LONG_MAX-definition-in-case-of-mus.patch |  30 --
 ...c-Disable-tests-for-missing-typedefs-in-.patch} |  12 +-
 ...ss-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch} |  10 +-
 ...-compatible-basename-for-non-glibc-syste.patch} |   8 +-
 ...le-buffering-when-writing-to-oom_score_a.patch} |  10 +-
 ...XSI-compliant-strerror_r-from-GNU-specif.patch} |  12 +-
 ...t_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch} |  29 +-
 ...ing_type.h-add-__compar_d_fn_t-definition.patch |  30 ++
 ...id-redefinition-of-prctl_mm_map-structure.patch |  47 ++
 ...se-if-instead-of-ifdef-for-ENABLE_GSHADOW.patch |  28 --
 ...etect-whether-struct-statx-is-defined-in-.patch | 109 -----
 ...clude-sys-wait.h-to-avoid-compile-failure.patch |  33 ++
 ...onf-fixes-for-the-compatibility-interface.patch |  58 ---
 .../0023-socket-util.h-include-string.h.patch      |  30 ++
 ...-not-store-the-iovec-entry-for-process-co.patch | 208 --------
 .../systemd/0024-test-json.c-define-M_PIl.patch    |  33 ++
 ...rnald-set-a-limit-on-the-number-of-fields.patch | 139 ------
 ...nal-fix-out-of-bounds-read-CVE-2018-16866.patch |  49 --
 .../systemd/systemd/CVE-2019-6454.patch            | 210 ---------
 ...e-receive-an-invalid-dbus-message-ignore-.patch |  61 ---
 .../systemd/{systemd_239.bb => systemd_241.bb}     |  79 ++--
 63 files changed, 1294 insertions(+), 2679 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot_239.bb => systemd-boot_241.bb} (85%)
 rename meta/recipes-core/systemd/{systemd-conf.bb => systemd-conf_241.bb} (100%)
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-Remove-fstack-protector-flags-to-workaround-musl-bui.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0001-Revert-meson-print-EFI-CC-configuration-nicely.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0001-Revert-meson-use-an-array-option-for-efi-cc.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-Revert-sysctl.d-request-ECN-on-both-in-and-outgoing-.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-chown-recursive-let-s-rework-the-recursive-logic-to-.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-core-when-deserializing-state-always-use-read_line-L.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-dhcp6-make-sure-we-have-enough-space-for-the-DHCP6-o.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0001-do-not-disable-buffer-in-writing-files.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-login-use-parse_uid-when-unmounting-user-runtime-dir.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-meson-rename-Ddebug-to-Ddebug-extra.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-sd-bus-make-BUS_DEFAULT_TIMEOUT-configurable.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-sysctl-Don-t-pass-null-directive-argument-to-s.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-timesync-changes-type-of-drift_freq-to-int64_t.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0002-core-Fix-use-after-free-case-in-load_from_path.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0003-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0005-Make-root-s-home-directory-configurable.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0005-basic-user-util-properly-protect-use-of-gshadow.patch
 rename meta/recipes-core/systemd/systemd/{0007-rules-watch-metadata-changes-in-ide-devices.patch => 0005-rules-watch-metadata-changes-in-ide-devices.patch} (78%)
 rename meta/recipes-core/systemd/systemd/{0006-src-basic-missing.h-check-for-missing-strndupa.patch => 0005-src-basic-missing.h-check-for-missing-strndupa.patch} (65%)
 rename meta/recipes-core/systemd/systemd/{0007-Include-netinet-if_ether.h.patch => 0006-Include-netinet-if_ether.h.patch} (85%)
 delete mode 100644 meta/recipes-core/systemd/systemd/0006-remove-nobody-user-group-checking.patch
 rename meta/recipes-core/systemd/systemd/{0008-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch => 0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not.patch} (81%)
 delete mode 100644 meta/recipes-core/systemd/systemd/0008-Do-not-enable-nss-tests-if-nss-systemd-is-not-enable.patch
 rename meta/recipes-core/systemd/systemd/{0009-add-missing-FTW_-macros-for-musl.patch => 0008-add-missing-FTW_-macros-for-musl.patch} (50%)
 delete mode 100644 meta/recipes-core/systemd/systemd/0009-nss-mymachines-Build-conditionally-when-ENABLE_MYHOS.patch
 rename meta/recipes-core/systemd/systemd/{0010-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch => 0009-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch} (80%)
 rename meta/recipes-core/systemd/systemd/{0012-fix-missing-of-__register_atfork-for-non-glibc-build.patch => 0010-fix-missing-of-__register_atfork-for-non-glibc-build.patch} (75%)
 rename meta/recipes-core/systemd/systemd/{0013-Use-uintmax_t-for-handling-rlim_t.patch => 0011-Use-uintmax_t-for-handling-rlim_t.patch} (62%)
 delete mode 100644 meta/recipes-core/systemd/systemd/0011-src-basic-missing.h-check-for-missing-__compar_fn_t-.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0012-fix-missing-ULONG_LONG_MAX-definition-in-case-of-mus.patch
 rename meta/recipes-core/systemd/systemd/{0015-test-hexdecoct.c-Include-missing.h-for-strndupa.patch => 0013-test-hexdecoct.c-Include-missing.h-for-strndupa.patch} (78%)
 delete mode 100644 meta/recipes-core/systemd/systemd/0014-fix-missing-ULONG_LONG_MAX-definition-in-case-of-mus.patch
 rename meta/recipes-core/systemd/systemd/{0016-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch => 0014-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch} (78%)
 rename meta/recipes-core/systemd/systemd/{0017-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch => 0015-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch} (95%)
 rename meta/recipes-core/systemd/systemd/{0018-Define-glibc-compatible-basename-for-non-glibc-syste.patch => 0016-Define-glibc-compatible-basename-for-non-glibc-syste.patch} (82%)
 rename meta/recipes-core/systemd/systemd/{0019-Do-not-disable-buffering-when-writing-to-oom_score_a.patch => 0017-Do-not-disable-buffering-when-writing-to-oom_score_a.patch} (82%)
 rename meta/recipes-core/systemd/systemd/{0020-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch => 0018-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch} (87%)
 rename meta/recipes-core/systemd/systemd/{0021-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch => 0019-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch} (49%)
 create mode 100644 meta/recipes-core/systemd/systemd/0020-missing_type.h-add-__compar_d_fn_t-definition.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0021-avoid-redefinition-of-prctl_mm_map-structure.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0022-Use-if-instead-of-ifdef-for-ENABLE_GSHADOW.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0022-build-sys-Detect-whether-struct-statx-is-defined-in-.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0022-include-sys-wait.h-to-avoid-compile-failure.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0023-resolvconf-fixes-for-the-compatibility-interface.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0023-socket-util.h-include-string.h.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0024-journald-do-not-store-the-iovec-entry-for-process-co.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0024-test-json.c-define-M_PIl.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0025-journald-set-a-limit-on-the-number-of-fields.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0026-journal-fix-out-of-bounds-read-CVE-2018-16866.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/CVE-2019-6454.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/sd-bus-if-we-receive-an-invalid-dbus-message-ignore-.patch
 rename meta/recipes-core/systemd/{systemd_239.bb => systemd_241.bb} (89%)

-- 
1.9.1


