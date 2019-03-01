Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8798C7CD52
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Mar 2019 08:43:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x218gkE5025484
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Mar 2019 00:42:56 -0800
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.435.0; Fri, 1 Mar 2019 00:42:35 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 1 Mar 2019 16:52:12 +0800
Message-ID: <d5064f5e9b916a0aeb27f6a0a12b2d7ffc2c87d7.1551430235.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1551430235.git.Qi.Chen@windriver.com>
References: <cover.1551430235.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] systemd: upgrade to 241
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
X-List-Received-Date: Fri, 01 Mar 2019 08:43:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

PATCH REBASED:
==============
0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
0004-rules-whitelist-hd-devices.patch
0007-rules-watch-metadata-changes-in-ide-devices.patch
0001-Use-getenv-when-secure-versions-are-not-available.patch
0002-don-t-use-glibc-specific-qsort_r.patch
0004-add-fallback-parse_printf_format-implementation.patch
0006-src-basic-missing.h-check-for-missing-strndupa.patch
0007-Include-netinet-if_ether.h.patch
0008-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
0009-add-missing-FTW_-macros-for-musl.patch
0012-fix-missing-of-__register_atfork-for-non-glibc-build.patch
0013-Use-uintmax_t-for-handling-rlim_t.patch
0014-fix-missing-ULONG_LONG_MAX-definition-in-case-of-mus.patch
0021-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch

PATCH DROPPED:
==============
0005-Make-root-s-home-directory-configurable.patch
  systemd has its hardcoded assumption about /home and /, and it also respects
  $HOME environment var, so this patch is somehow useless. This patch was originally
  added but in fact had no real runtime effect except messing up some hardcoded assumptions,
  and it was accidently manipulated during systemd upgrade. We have in fact not
  used the orignal patch for more than two releases and things were working out
  well.
0006-remove-nobody-user-group-checking.patch
  The issue has been fixed upstream by the following commit.
    "check nobody user/group validity only when not cross compiling"
0008-Do-not-enable-nss-tests-if-nss-systemd-is-not-enable.patch
0009-nss-mymachines-Build-conditionally-when-ENABLE_MYHOS.patch
  The issue has been fixed upstream by the following commit.
    "meson: allow building resolved and machined without nss modules"
0001-login-use-parse_uid-when-unmounting-user-runtime-dir.patch
0001-sd-bus-make-BUS_DEFAULT_TIMEOUT-configurable.patch
  Backport
0022-build-sys-Detect-whether-struct-statx-is-defined-in-.patch
  Merged
0023-resolvconf-fixes-for-the-compatibility-interface.patch
0001-core-when-deserializing-state-always-use-read_line-L.patch
0001-chown-recursive-let-s-rework-the-recursive-logic-to-.patch
0001-dhcp6-make-sure-we-have-enough-space-for-the-DHCP6-o.patch
0001-Revert-sysctl.d-request-ECN-on-both-in-and-outgoing-.patch
0001-timesync-changes-type-of-drift_freq-to-int64_t.patch
  Backport
0001-sysctl-Don-t-pass-null-directive-argument-to-s.patch
0002-core-Fix-use-after-free-case-in-load_from_path.patch
  Merged
0001-meson-rename-Ddebug-to-Ddebug-extra.patch
0024-journald-do-not-store-the-iovec-entry-for-process-co.patch
0025-journald-set-a-limit-on-the-number-of-fields.patch
0026-journal-fix-out-of-bounds-read-CVE-2018-16866.patch
CVE-2019-6454.patch
sd-bus-if-we-receive-an-invalid-dbus-message-ignore-.patch
0005-basic-user-util-properly-protect-use-of-gshadow.patch
0022-Use-if-instead-of-ifdef-for-ENABLE_GSHADOW.patch
  Backport
0001-Remove-fstack-protector-flags-to-workaround-musl-bui.patch
  No build failure for qemux86/qemuppc + musl

PATCH ADDED:
============
0020-missing_type.h-add-__compar_d_fn_t-definition.patch
0021-avoid-redefinition-of-prctl_mm_map-structure.patch
0022-include-sys-wait.h-to-avoid-compile-failure.patch
0023-socket-util.h-include-string.h.patch
0024-test-json.c-define-M_PIl.patch
0001-do-not-disable-buffer-in-writing-files.patch

PATCH OTHERS:
=============
0003-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch
0011-src-basic-missing.h-check-for-missing-__compar_fn_t-.patch
are combined into one patch:
0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch

Add two more PACKAGECONFIG, nss-mymachines and nss-resolve  which are introduced
by the following commit.
  meson: allow building resolved and machined without nss modules

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/systemd/systemd.inc              |   2 +-
 ...ck-protector-flags-to-workaround-musl-bui.patch |  33 --
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
 59 files changed, 1178 insertions(+), 2675 deletions(-)
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-Remove-fstack-protector-flags-to-workaround-musl-bui.patch
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

diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 736e0a0..8ca3ece 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -14,7 +14,7 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "de7436b02badc82200dc127ff190b8155769b8e7"
+SRCREV = "e62a7fea757f259eb330da5b6d3ab4ede46400a2"
 
 SRC_URI = "git://github.com/systemd/systemd.git;protocol=git"
 
diff --git a/meta/recipes-core/systemd/systemd/0001-Remove-fstack-protector-flags-to-workaround-musl-bui.patch b/meta/recipes-core/systemd/systemd/0001-Remove-fstack-protector-flags-to-workaround-musl-bui.patch
deleted file mode 100644
index d745800..0000000
--- a/meta/recipes-core/systemd/systemd/0001-Remove-fstack-protector-flags-to-workaround-musl-bui.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 9e3816bcaa36e1a11647ca0cf4f8044449c77fe0 Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Mon, 2 Jul 2018 15:28:22 +0800
-Subject: [PATCH] Remove fstack-protector flags to workaround musl build
-
-Remove fstack-protector and fstack-protector-strong flags to fix
-the following build failure for qemux86 and qemuppc with musl.
-
-  undefined reference to `__stack_chk_fail_local'
-
-Upstream-Status: Inappropriate [musl Specific]
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- meson.build | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index f432ea072..a734a295c 100644
---- a/meson.build
-+++ b/meson.build
-@@ -333,8 +333,6 @@ possible_cc_flags = [
-         '-fdiagnostics-show-option',
-         '-fno-strict-aliasing',
-         '-fvisibility=hidden',
--        '-fstack-protector',
--        '-fstack-protector-strong',
-         '--param=ssp-buffer-size=4',
- ]
- 
--- 
-2.11.0
-
diff --git a/meta/recipes-core/systemd/systemd/0001-Revert-sysctl.d-request-ECN-on-both-in-and-outgoing-.patch b/meta/recipes-core/systemd/systemd/0001-Revert-sysctl.d-request-ECN-on-both-in-and-outgoing-.patch
deleted file mode 100644
index 7fd6d01..0000000
--- a/meta/recipes-core/systemd/systemd/0001-Revert-sysctl.d-request-ECN-on-both-in-and-outgoing-.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 1e190dfd5bb95036f937ef1dc46f43eb0a146612 Mon Sep 17 00:00:00 2001
-From: Thomas Hindoe Paaboel Andersen <phomes@gmail.com>
-Date: Fri, 17 Aug 2018 21:31:05 +0200
-Subject: [PATCH] Revert "sysctl.d: request ECN on both in and outgoing
- connections"
-
-Turning on ECN still causes slow or broken network on linux. Our tcp
-is not yet ready for wide spread use of ECN.
-
-This reverts commit 919472741dba6ad0a3f6c2b76d390a02d0e2fdc3.
-
-https://github.com/systemd/systemd/issues/9748
-
-Upstream-Status: Backport
-Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
----
- sysctl.d/50-default.conf | 3 ---
- 1 file changed, 3 deletions(-)
-
-diff --git a/sysctl.d/50-default.conf b/sysctl.d/50-default.conf
-index b67ae87ca6b7..e263cf06284a 100644
---- a/sysctl.d/50-default.conf
-+++ b/sysctl.d/50-default.conf
-@@ -33,9 +33,6 @@ net.ipv4.conf.all.promote_secondaries = 1
- # Fair Queue CoDel packet scheduler to fight bufferbloat
- net.core.default_qdisc = fq_codel
- 
--# Request Explicit Congestion Notification (ECN) on both in and outgoing connections
--net.ipv4.tcp_ecn = 1
--
- # Enable hard and soft link protection
- fs.protected_hardlinks = 1
- fs.protected_symlinks = 1
--- 
-2.7.4
-
diff --git a/meta/recipes-core/systemd/systemd/0001-Use-getenv-when-secure-versions-are-not-available.patch b/meta/recipes-core/systemd/systemd/0001-Use-getenv-when-secure-versions-are-not-available.patch
index 03f6ead..3797975 100644
--- a/meta/recipes-core/systemd/systemd/0001-Use-getenv-when-secure-versions-are-not-available.patch
+++ b/meta/recipes-core/systemd/systemd/0001-Use-getenv-when-secure-versions-are-not-available.patch
@@ -1,7 +1,7 @@
-From 6dd136512896979feb6883a16226d640a7e5ca74 Mon Sep 17 00:00:00 2001
+From b8055a61b5df6b43b8d3117936587b874b0a339b Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
-Date: Fri, 23 Feb 2018 10:04:48 +0800
-Subject: [PATCH 01/19] Use getenv when secure versions are not available
+Date: Mon, 25 Feb 2019 11:01:18 +0800
+Subject: [PATCH 01/24] Use getenv when secure versions are not available
 
 musl doesnt implement secure version, so we default
 to it if configure does not detect a secure implementation
@@ -12,14 +12,14 @@ Upstream-Status: Denied
 
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 ---
- src/basic/missing.h | 2 +-
+ src/basic/missing_stdlib.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/src/basic/missing.h b/src/basic/missing.h
-index 71a07d057..0e33abb9f 100644
---- a/src/basic/missing.h
-+++ b/src/basic/missing.h
-@@ -592,7 +592,7 @@ struct btrfs_ioctl_quota_ctl_args {
+diff --git a/src/basic/missing_stdlib.h b/src/basic/missing_stdlib.h
+index 188a8d4..c0ffe86 100644
+--- a/src/basic/missing_stdlib.h
++++ b/src/basic/missing_stdlib.h
+@@ -8,6 +8,6 @@
  #  if HAVE___SECURE_GETENV
  #    define secure_getenv __secure_getenv
  #  else
@@ -27,7 +27,6 @@ index 71a07d057..0e33abb9f 100644
 +#    define secure_getenv getenv
  #  endif
  #endif
- 
 -- 
-2.11.0
+2.7.4
 
diff --git a/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch b/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
index e24e7f8..00670ca 100644
--- a/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
+++ b/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
@@ -1,7 +1,7 @@
-From 87dd61be2e28e78ce4f9f173794812e6c2d904d1 Mon Sep 17 00:00:00 2001
+From 98254e4798e79d52ac6b562616cd244120f6e239 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
-Date: Wed, 27 Jun 2018 16:01:22 +0800
-Subject: [PATCH 1/9] binfmt: Don't install dependency links at install time 
+Date: Thu, 21 Feb 2019 16:23:24 +0800
+Subject: [PATCH 1/5] binfmt: Don't install dependency links at install time 
  for the binfmt services
 
 use [Install] blocks so that they get created when the service is enabled
@@ -23,10 +23,10 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  3 files changed, 9 insertions(+), 4 deletions(-)
 
 diff --git a/units/meson.build b/units/meson.build
-index e4ac6ced6..698734e44 100644
+index d695084..7b1f14a 100644
 --- a/units/meson.build
 +++ b/units/meson.build
-@@ -46,8 +46,7 @@ units = [
+@@ -47,8 +47,7 @@ units = [
          ['poweroff.target',                     '',
           'runlevel0.target'],
          ['printer.target',                      ''],
@@ -36,18 +36,18 @@ index e4ac6ced6..698734e44 100644
          ['proc-sys-fs-binfmt_misc.mount',       'ENABLE_BINFMT'],
          ['reboot.target',                       '',
           'runlevel6.target ctrl-alt-del.target'],
-@@ -130,8 +129,7 @@ in_units = [
+@@ -134,8 +133,7 @@ in_units = [
          ['systemd-ask-password-console.service', ''],
          ['systemd-ask-password-wall.service',    ''],
          ['systemd-backlight@.service',           'ENABLE_BACKLIGHT'],
 -        ['systemd-binfmt.service',               'ENABLE_BINFMT',
 -         'sysinit.target.wants/'],
 +        ['systemd-binfmt.service',               'ENABLE_BINFMT'],
+         ['systemd-bless-boot.service',           'ENABLE_EFI HAVE_BLKID'],
+         ['systemd-boot-check-no-failures.service', ''],
          ['systemd-coredump@.service',            'ENABLE_COREDUMP'],
-         ['systemd-exit.service',                 ''],
-         ['systemd-firstboot.service',            'ENABLE_FIRSTBOOT',
 diff --git a/units/proc-sys-fs-binfmt_misc.automount b/units/proc-sys-fs-binfmt_misc.automount
-index 30a6bc991..4231f3b70 100644
+index 30a6bc9..4231f3b 100644
 --- a/units/proc-sys-fs-binfmt_misc.automount
 +++ b/units/proc-sys-fs-binfmt_misc.automount
 @@ -18,3 +18,6 @@ ConditionPathIsReadWrite=/proc/sys/
@@ -58,7 +58,7 @@ index 30a6bc991..4231f3b70 100644
 +[Install]
 +WantedBy=sysinit.target
 diff --git a/units/systemd-binfmt.service.in b/units/systemd-binfmt.service.in
-index e940c7c9a..6be7f5cc9 100644
+index e940c7c..6be7f5c 100644
 --- a/units/systemd-binfmt.service.in
 +++ b/units/systemd-binfmt.service.in
 @@ -14,6 +14,7 @@ Documentation=https://www.kernel.org/doc/html/latest/admin-guide/binfmt-misc.htm
@@ -77,5 +77,5 @@ index e940c7c9a..6be7f5cc9 100644
 +[Install]
 +WantedBy=sysinit.target
 -- 
-2.11.0
+2.7.4
 
diff --git a/meta/recipes-core/systemd/systemd/0001-chown-recursive-let-s-rework-the-recursive-logic-to-.patch b/meta/recipes-core/systemd/systemd/0001-chown-recursive-let-s-rework-the-recursive-logic-to-.patch
deleted file mode 100644
index 9d350eb..0000000
--- a/meta/recipes-core/systemd/systemd/0001-chown-recursive-let-s-rework-the-recursive-logic-to-.patch
+++ /dev/null
@@ -1,219 +0,0 @@
-From 2da8ba3f507345d0401ea9d7191fa16ffa560ebc Mon Sep 17 00:00:00 2001
-From: Lennart Poettering <lennart@poettering.net>
-Date: Fri, 19 Oct 2018 11:26:59 +0200
-Subject: [PATCH] chown-recursive: let's rework the recursive logic to use
- O_PATH
-
-That way we can pin a specific inode and analyze it and manipulate it
-without it being swapped out beneath our hands.
-
-Fixes a vulnerability originally found by Jann Horn from Google.
-
-CVE-2018-15687
-LP: #1796692
-https://bugzilla.redhat.com/show_bug.cgi?id=1639076
-
-(cherry picked from commit 5de6cce58b3e8b79239b6e83653459d91af6e57c)
-
-CVE: CVE-2018-15687
-Upstream-Status: Backport
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- src/core/chown-recursive.c | 146 ++++++++++++++++++++++-----------------------
- 1 file changed, 70 insertions(+), 76 deletions(-)
-
-diff --git a/src/core/chown-recursive.c b/src/core/chown-recursive.c
-index c479450..27c6448 100644
---- a/src/core/chown-recursive.c
-+++ b/src/core/chown-recursive.c
-@@ -1,17 +1,19 @@
- /* SPDX-License-Identifier: LGPL-2.1+ */
- 
--#include <sys/types.h>
--#include <sys/stat.h>
- #include <fcntl.h>
-+#include <sys/stat.h>
-+#include <sys/types.h>
- 
--#include "user-util.h"
--#include "macro.h"
--#include "fd-util.h"
--#include "dirent-util.h"
- #include "chown-recursive.h"
-+#include "dirent-util.h"
-+#include "fd-util.h"
-+#include "macro.h"
-+#include "stdio-util.h"
-+#include "strv.h"
-+#include "user-util.h"
- 
--static int chown_one(int fd, const char *name, const struct stat *st, uid_t uid, gid_t gid) {
--        int r;
-+static int chown_one(int fd, const struct stat *st, uid_t uid, gid_t gid) {
-+        char procfs_path[STRLEN("/proc/self/fd/") + DECIMAL_STR_MAX(int) + 1];
- 
-         assert(fd >= 0);
-         assert(st);
-@@ -20,90 +22,82 @@ static int chown_one(int fd, const char *name, const struct stat *st, uid_t uid,
-             (!gid_is_valid(gid) || st->st_gid == gid))
-                 return 0;
- 
--        if (name)
--                r = fchownat(fd, name, uid, gid, AT_SYMLINK_NOFOLLOW);
--        else
--                r = fchown(fd, uid, gid);
--        if (r < 0)
--                return -errno;
-+        /* We change ownership through the /proc/self/fd/%i path, so that we have a stable reference that works with
-+         * O_PATH. (Note: fchown() and fchmod() do not work with O_PATH, the kernel refuses that. */
-+        xsprintf(procfs_path, "/proc/self/fd/%i", fd);
- 
--        /* The linux kernel alters the mode in some cases of chown(). Let's undo this. */
--        if (name) {
--                if (!S_ISLNK(st->st_mode))
--                        r = fchmodat(fd, name, st->st_mode, 0);
--                else /* There's currently no AT_SYMLINK_NOFOLLOW for fchmodat() */
--                        r = 0;
--        } else
--                r = fchmod(fd, st->st_mode);
--        if (r < 0)
-+        if (chown(procfs_path, uid, gid) < 0)
-                 return -errno;
- 
-+        /* The linux kernel alters the mode in some cases of chown(). Let's undo this. We do this only for non-symlinks
-+         * however. That's because for symlinks the access mode is ignored anyway and because on some kernels/file
-+         * systems trying to change the access mode will succeed but has no effect while on others it actively
-+         * fails. */
-+        if (!S_ISLNK(st->st_mode))
-+                if (chmod(procfs_path, st->st_mode & 07777) < 0)
-+                        return -errno;
-+
-         return 1;
- }
- 
- static int chown_recursive_internal(int fd, const struct stat *st, uid_t uid, gid_t gid) {
-+        _cleanup_closedir_ DIR *d = NULL;
-         bool changed = false;
-+        struct dirent *de;
-         int r;
- 
-         assert(fd >= 0);
-         assert(st);
- 
--        if (S_ISDIR(st->st_mode)) {
--                _cleanup_closedir_ DIR *d = NULL;
--                struct dirent *de;
--
--                d = fdopendir(fd);
--                if (!d) {
--                        r = -errno;
--                        goto finish;
--                }
--                fd = -1;
--
--                FOREACH_DIRENT_ALL(de, d, r = -errno; goto finish) {
--                        struct stat fst;
--
--                        if (dot_or_dot_dot(de->d_name))
--                                continue;
--
--                        if (fstatat(dirfd(d), de->d_name, &fst, AT_SYMLINK_NOFOLLOW) < 0) {
--                                r = -errno;
--                                goto finish;
--                        }
--
--                        if (S_ISDIR(fst.st_mode)) {
--                                int subdir_fd;
--
--                                subdir_fd = openat(dirfd(d), de->d_name, O_RDONLY|O_NONBLOCK|O_DIRECTORY|O_CLOEXEC|O_NOFOLLOW|O_NOATIME);
--                                if (subdir_fd < 0) {
--                                        r = -errno;
--                                        goto finish;
--                                }
--
--                                r = chown_recursive_internal(subdir_fd, &fst, uid, gid);
--                                if (r < 0)
--                                        goto finish;
--                                if (r > 0)
--                                        changed = true;
--                        } else {
--                                r = chown_one(dirfd(d), de->d_name, &fst, uid, gid);
--                                if (r < 0)
--                                        goto finish;
--                                if (r > 0)
--                                        changed = true;
--                        }
-+        d = fdopendir(fd);
-+        if (!d) {
-+                safe_close(fd);
-+                return -errno;
-+        }
-+
-+        FOREACH_DIRENT_ALL(de, d, return -errno) {
-+                _cleanup_close_ int path_fd = -1;
-+                struct stat fst;
-+
-+                if (dot_or_dot_dot(de->d_name))
-+                        continue;
-+
-+                /* Let's pin the child inode we want to fix now with an O_PATH fd, so that it cannot be swapped out
-+                 * while we manipulate it. */
-+                path_fd = openat(dirfd(d), de->d_name, O_PATH|O_CLOEXEC|O_NOFOLLOW);
-+                if (path_fd < 0)
-+                        return -errno;
-+
-+                if (fstat(path_fd, &fst) < 0)
-+                        return -errno;
-+
-+                if (S_ISDIR(fst.st_mode)) {
-+                        int subdir_fd;
-+
-+                        /* Convert it to a "real" (i.e. non-O_PATH) fd now */
-+                        subdir_fd = fd_reopen(path_fd, O_RDONLY|O_CLOEXEC|O_NOATIME);
-+                        if (subdir_fd < 0)
-+                                return subdir_fd;
-+
-+                        r = chown_recursive_internal(subdir_fd, &fst, uid, gid); /* takes possession of subdir_fd even on failure */
-+                        if (r < 0)
-+                                return r;
-+                        if (r > 0)
-+                                changed = true;
-+                } else {
-+                        r = chown_one(path_fd, &fst, uid, gid);
-+                        if (r < 0)
-+                                return r;
-+                        if (r > 0)
-+                                changed = true;
-                 }
-+        }
- 
--                r = chown_one(dirfd(d), NULL, st, uid, gid);
--        } else
--                r = chown_one(fd, NULL, st, uid, gid);
-+        r = chown_one(dirfd(d), st, uid, gid);
-         if (r < 0)
--                goto finish;
-+                return r;
- 
--        r = r > 0 || changed;
--
--finish:
--        safe_close(fd);
--        return r;
-+        return r > 0 || changed;
- }
- 
- int path_chown_recursive(const char *path, uid_t uid, gid_t gid) {
-@@ -111,7 +105,7 @@ int path_chown_recursive(const char *path, uid_t uid, gid_t gid) {
-         struct stat st;
-         int r;
- 
--        fd = open(path, O_RDONLY|O_NONBLOCK|O_DIRECTORY|O_CLOEXEC|O_NOFOLLOW|O_NOATIME);
-+        fd = open(path, O_RDONLY|O_DIRECTORY|O_CLOEXEC|O_NOFOLLOW|O_NOATIME);
-         if (fd < 0)
-                 return -errno;
- 
--- 
-2.7.4
-
diff --git a/meta/recipes-core/systemd/systemd/0001-core-when-deserializing-state-always-use-read_line-L.patch b/meta/recipes-core/systemd/systemd/0001-core-when-deserializing-state-always-use-read_line-L.patch
deleted file mode 100644
index 215d680..0000000
--- a/meta/recipes-core/systemd/systemd/0001-core-when-deserializing-state-always-use-read_line-L.patch
+++ /dev/null
@@ -1,250 +0,0 @@
-From 1a05ff4948d778280ec155a9abe69d3360bfddd9 Mon Sep 17 00:00:00 2001
-From: Lennart Poettering <lennart@poettering.net>
-Date: Wed, 17 Oct 2018 18:36:24 +0200
-Subject: [PATCH] =?UTF-8?q?core:=20when=20deserializing=20state=20always?=
- =?UTF-8?q?=20use=20read=5Fline(=E2=80=A6,=20LONG=5FLINE=5FMAX,=20?=
- =?UTF-8?q?=E2=80=A6)?=
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-This should be much better than fgets(), as we can read substantially
-longer lines and overly long lines result in proper errors.
-
-Fixes a vulnerability discovered by Jann Horn at Google.
-
-CVE-2018-15686
-LP: #1796402
-https://bugzilla.redhat.com/show_bug.cgi?id=1639071
-
-(cherry picked from commit 8948b3415d762245ebf5e19d80b97d4d8cc208c1)
-
-CVE: CVE-2018-15686
-Upstream-Status: Backport
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- src/core/job.c     | 19 +++++++++++--------
- src/core/manager.c | 44 ++++++++++++++++++++------------------------
- src/core/unit.c    | 34 ++++++++++++++++++----------------
- src/core/unit.h    |  2 +-
- 4 files changed, 50 insertions(+), 49 deletions(-)
-
-diff --git a/src/core/job.c b/src/core/job.c
-index 734756b..8552ffb 100644
---- a/src/core/job.c
-+++ b/src/core/job.c
-@@ -10,6 +10,7 @@
- #include "dbus-job.h"
- #include "dbus.h"
- #include "escape.h"
-+#include "fileio.h"
- #include "job.h"
- #include "log.h"
- #include "macro.h"
-@@ -1091,24 +1092,26 @@ int job_serialize(Job *j, FILE *f) {
- }
- 
- int job_deserialize(Job *j, FILE *f) {
-+        int r;
-+
-         assert(j);
-         assert(f);
- 
-         for (;;) {
--                char line[LINE_MAX], *l, *v;
-+                _cleanup_free_ char *line = NULL;
-+                char *l, *v;
-                 size_t k;
- 
--                if (!fgets(line, sizeof(line), f)) {
--                        if (feof(f))
--                                return 0;
--                        return -errno;
--                }
-+                r = read_line(f, LONG_LINE_MAX, &line);
-+                if (r < 0)
-+                        return log_error_errno(r, "Failed to read serialization line: %m");
-+                if (r == 0)
-+                        return 0;
- 
--                char_array_0(line);
-                 l = strstrip(line);
- 
-                 /* End marker */
--                if (l[0] == 0)
-+                if (isempty(l))
-                         return 0;
- 
-                 k = strcspn(l, "=");
-diff --git a/src/core/manager.c b/src/core/manager.c
-index 3a7f0c4..a5780c9 100644
---- a/src/core/manager.c
-+++ b/src/core/manager.c
-@@ -3171,22 +3171,19 @@ int manager_deserialize(Manager *m, FILE *f, FDSet *fds) {
-         m->n_reloading++;
- 
-         for (;;) {
--                char line[LINE_MAX];
-+                _cleanup_free_ char *line = NULL;
-                 const char *val, *l;
- 
--                if (!fgets(line, sizeof(line), f)) {
--                        if (feof(f))
--                                r = 0;
--                        else
--                                r = -errno;
--
-+                r = read_line(f, LONG_LINE_MAX, &line);
-+                if (r < 0) {
-+                        log_error_errno(r, "Failed to read serialization line: %m");
-                         goto finish;
-                 }
-+                if (r == 0)
-+                        break;
- 
--                char_array_0(line);
-                 l = strstrip(line);
--
--                if (l[0] == 0)
-+                if (isempty(l)) /* end marker */
-                         break;
- 
-                 if ((val = startswith(l, "current-job-id="))) {
-@@ -3353,29 +3350,31 @@ int manager_deserialize(Manager *m, FILE *f, FDSet *fds) {
-         }
- 
-         for (;;) {
--                Unit *u;
--                char name[UNIT_NAME_MAX+2];
-+                _cleanup_free_ char *line = NULL;
-                 const char* unit_name;
-+                Unit *u;
- 
-                 /* Start marker */
--                if (!fgets(name, sizeof(name), f)) {
--                        if (feof(f))
--                                r = 0;
--                        else
--                                r = -errno;
--
-+                r = read_line(f, LONG_LINE_MAX, &line);
-+                if (r < 0) {
-+                        log_error_errno(r, "Failed to read serialization line: %m");
-                         goto finish;
-                 }
-+                if (r == 0)
-+                        break;
- 
--                char_array_0(name);
--                unit_name = strstrip(name);
-+                unit_name = strstrip(line);
- 
-                 r = manager_load_unit(m, unit_name, NULL, NULL, &u);
-                 if (r < 0) {
-                         log_notice_errno(r, "Failed to load unit \"%s\", skipping deserialization: %m", unit_name);
-                         if (r == -ENOMEM)
-                                 goto finish;
--                        unit_deserialize_skip(f);
-+
-+                        r = unit_deserialize_skip(f);
-+                        if (r < 0)
-+                                goto finish;
-+
-                         continue;
-                 }
- 
-@@ -3388,9 +3387,6 @@ int manager_deserialize(Manager *m, FILE *f, FDSet *fds) {
-         }
- 
- finish:
--        if (ferror(f))
--                r = -EIO;
--
-         assert(m->n_reloading > 0);
-         m->n_reloading--;
- 
-diff --git a/src/core/unit.c b/src/core/unit.c
-index 7da963a..e98c9c4 100644
---- a/src/core/unit.c
-+++ b/src/core/unit.c
-@@ -3380,21 +3380,19 @@ int unit_deserialize(Unit *u, FILE *f, FDSet *fds) {
-         assert(fds);
- 
-         for (;;) {
--                char line[LINE_MAX], *l, *v;
-+                _cleanup_free_ char *line = NULL;
-                 CGroupIPAccountingMetric m;
-+                char *l, *v;
-                 size_t k;
- 
--                if (!fgets(line, sizeof(line), f)) {
--                        if (feof(f))
--                                return 0;
--                        return -errno;
--                }
-+                r = read_line(f, LONG_LINE_MAX, &line);
-+                if (r < 0)
-+                        return log_error_errno(r, "Failed to read serialization line: %m");
-+                if (r == 0) /* eof */
-+                        break;
- 
--                char_array_0(line);
-                 l = strstrip(line);
--
--                /* End marker */
--                if (isempty(l))
-+                if (isempty(l)) /* End marker */
-                         break;
- 
-                 k = strcspn(l, "=");
-@@ -3671,23 +3669,27 @@ int unit_deserialize(Unit *u, FILE *f, FDSet *fds) {
-         return 0;
- }
- 
--void unit_deserialize_skip(FILE *f) {
-+int unit_deserialize_skip(FILE *f) {
-+        int r;
-         assert(f);
- 
-         /* Skip serialized data for this unit. We don't know what it is. */
- 
-         for (;;) {
--                char line[LINE_MAX], *l;
-+                _cleanup_free_ char *line = NULL;
-+                char *l;
- 
--                if (!fgets(line, sizeof line, f))
--                        return;
-+                r = read_line(f, LONG_LINE_MAX, &line);
-+                if (r < 0)
-+                        return log_error_errno(r, "Failed to read serialization line: %m");
-+                if (r == 0)
-+                        return 0;
- 
--                char_array_0(line);
-                 l = strstrip(line);
- 
-                 /* End marker */
-                 if (isempty(l))
--                        return;
-+                        return 1;
-         }
- }
- 
-diff --git a/src/core/unit.h b/src/core/unit.h
-index 06321bb..51c7aaa 100644
---- a/src/core/unit.h
-+++ b/src/core/unit.h
-@@ -684,7 +684,7 @@ bool unit_can_serialize(Unit *u) _pure_;
- 
- int unit_serialize(Unit *u, FILE *f, FDSet *fds, bool serialize_jobs);
- int unit_deserialize(Unit *u, FILE *f, FDSet *fds);
--void unit_deserialize_skip(FILE *f);
-+int unit_deserialize_skip(FILE *f);
- 
- int unit_serialize_item(Unit *u, FILE *f, const char *key, const char *value);
- int unit_serialize_item_escaped(Unit *u, FILE *f, const char *key, const char *value);
--- 
-2.7.4
-
diff --git a/meta/recipes-core/systemd/systemd/0001-dhcp6-make-sure-we-have-enough-space-for-the-DHCP6-o.patch b/meta/recipes-core/systemd/systemd/0001-dhcp6-make-sure-we-have-enough-space-for-the-DHCP6-o.patch
deleted file mode 100644
index 0c912f2..0000000
--- a/meta/recipes-core/systemd/systemd/0001-dhcp6-make-sure-we-have-enough-space-for-the-DHCP6-o.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From a2622b8398ba026faf481f5eddeb53231d9de4a7 Mon Sep 17 00:00:00 2001
-From: Lennart Poettering <lennart@poettering.net>
-Date: Fri, 19 Oct 2018 12:12:33 +0200
-Subject: [PATCH] dhcp6: make sure we have enough space for the DHCP6 option
- header
-
-Fixes a vulnerability originally discovered by Felix Wilhelm from
-Google.
-
-CVE-2018-15688
-LP: #1795921
-https://bugzilla.redhat.com/show_bug.cgi?id=1639067
-
-(cherry picked from commit 4dac5eaba4e419b29c97da38a8b1f82336c2c892)
-
-CVE: CVE-2018-15688
-Upstream-Status: Backport
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- src/libsystemd-network/dhcp6-option.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/libsystemd-network/dhcp6-option.c b/src/libsystemd-network/dhcp6-option.c
-index c4b402b..dcbaad0 100644
---- a/src/libsystemd-network/dhcp6-option.c
-+++ b/src/libsystemd-network/dhcp6-option.c
-@@ -103,7 +103,7 @@ int dhcp6_option_append_ia(uint8_t **buf, size_t *buflen, DHCP6IA *ia) {
-                 return -EINVAL;
-         }
- 
--        if (*buflen < len)
-+        if (*buflen < offsetof(DHCP6Option, data) + len)
-                 return -ENOBUFS;
- 
-         ia_hdr = *buf;
--- 
-2.7.4
-
diff --git a/meta/recipes-core/systemd/systemd/0001-do-not-disable-buffer-in-writing-files.patch b/meta/recipes-core/systemd/systemd/0001-do-not-disable-buffer-in-writing-files.patch
new file mode 100644
index 0000000..a6857b1
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-do-not-disable-buffer-in-writing-files.patch
@@ -0,0 +1,523 @@
+From 85e3c3046562ec24fc2f09ebfd08bf9f168091d5 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Fri, 1 Mar 2019 15:22:15 +0800
+Subject: [PATCH] do not disable buffer in writing files
+
+Do not disable buffer in writing files, otherwise we get
+failure at boot for musl like below.
+
+  [!!!!!!] Failed to allocate manager object.
+
+And there will be other failures, critical or not critical.
+This is specific to musl.
+
+Upstream-Status: Inappropriate [musl]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/basic/cgroup-util.c                 | 14 +++++++-------
+ src/basic/procfs-util.c                 |  4 ++--
+ src/basic/smack-util.c                  |  2 +-
+ src/basic/util.c                        |  2 +-
+ src/binfmt/binfmt.c                     |  6 +++---
+ src/core/main.c                         |  4 ++--
+ src/core/smack-setup.c                  |  8 ++++----
+ src/hibernate-resume/hibernate-resume.c |  2 +-
+ src/libsystemd/sd-device/sd-device.c    |  2 +-
+ src/login/logind-dbus.c                 |  2 +-
+ src/network/networkd-ipv6-proxy-ndp.c   |  2 +-
+ src/network/networkd-link.c             | 18 +++++++++---------
+ src/nspawn/nspawn-cgroup.c              |  2 +-
+ src/nspawn/nspawn.c                     |  6 +++---
+ src/sleep/sleep.c                       | 12 ++++++------
+ src/udev/udevadm-trigger.c              |  2 +-
+ src/udev/udevd.c                        |  6 +++---
+ src/vconsole/vconsole-setup.c           |  2 +-
+ 18 files changed, 48 insertions(+), 48 deletions(-)
+
+diff --git a/src/basic/cgroup-util.c b/src/basic/cgroup-util.c
+index 8ce7ccb..b633226 100644
+--- a/src/basic/cgroup-util.c
++++ b/src/basic/cgroup-util.c
+@@ -818,7 +818,7 @@ int cg_attach(const char *controller, const char *path, pid_t pid) {
+ 
+         xsprintf(c, PID_FMT "\n", pid);
+ 
+-        r = write_string_file(fs, c, WRITE_STRING_FILE_DISABLE_BUFFER);
++        r = write_string_file(fs, c, 0);
+         if (r < 0)
+                 return r;
+ 
+@@ -1100,7 +1100,7 @@ int cg_install_release_agent(const char *controller, const char *agent) {
+ 
+         sc = strstrip(contents);
+         if (isempty(sc)) {
+-                r = write_string_file(fs, agent, WRITE_STRING_FILE_DISABLE_BUFFER);
++                r = write_string_file(fs, agent, 0);
+                 if (r < 0)
+                         return r;
+         } else if (!path_equal(sc, agent))
+@@ -1118,7 +1118,7 @@ int cg_install_release_agent(const char *controller, const char *agent) {
+ 
+         sc = strstrip(contents);
+         if (streq(sc, "0")) {
+-                r = write_string_file(fs, "1", WRITE_STRING_FILE_DISABLE_BUFFER);
++                r = write_string_file(fs, "1", 0);
+                 if (r < 0)
+                         return r;
+ 
+@@ -1145,7 +1145,7 @@ int cg_uninstall_release_agent(const char *controller) {
+         if (r < 0)
+                 return r;
+ 
+-        r = write_string_file(fs, "0", WRITE_STRING_FILE_DISABLE_BUFFER);
++        r = write_string_file(fs, "0", 0);
+         if (r < 0)
+                 return r;
+ 
+@@ -1155,7 +1155,7 @@ int cg_uninstall_release_agent(const char *controller) {
+         if (r < 0)
+                 return r;
+ 
+-        r = write_string_file(fs, "", WRITE_STRING_FILE_DISABLE_BUFFER);
++        r = write_string_file(fs, "", 0);
+         if (r < 0)
+                 return r;
+ 
+@@ -2012,7 +2012,7 @@ int cg_set_attribute(const char *controller, const char *path, const char *attri
+         if (r < 0)
+                 return r;
+ 
+-        return write_string_file(p, value, WRITE_STRING_FILE_DISABLE_BUFFER);
++        return write_string_file(p, value, 0);
+ }
+ 
+ int cg_get_attribute(const char *controller, const char *path, const char *attribute, char **ret) {
+@@ -2660,7 +2660,7 @@ int cg_enable_everywhere(
+                                         return log_debug_errno(errno, "Failed to open cgroup.subtree_control file of %s: %m", p);
+                         }
+ 
+-                        r = write_string_stream(f, s, WRITE_STRING_FILE_DISABLE_BUFFER);
++                        r = write_string_stream(f, s, 0);
+                         if (r < 0) {
+                                 log_debug_errno(r, "Failed to %s controller %s for %s (%s): %m",
+                                                 FLAGS_SET(mask, bit) ? "enable" : "disable", n, p, fs);
+diff --git a/src/basic/procfs-util.c b/src/basic/procfs-util.c
+index 42ce53d..5751253 100644
+--- a/src/basic/procfs-util.c
++++ b/src/basic/procfs-util.c
+@@ -86,13 +86,13 @@ int procfs_tasks_set_limit(uint64_t limit) {
+          * decrease it, as threads-max is the much more relevant sysctl. */
+         if (limit > pid_max-1) {
+                 sprintf(buffer, "%" PRIu64, limit+1); /* Add one, since PID 0 is not a valid PID */
+-                r = write_string_file("/proc/sys/kernel/pid_max", buffer, WRITE_STRING_FILE_DISABLE_BUFFER);
++                r = write_string_file("/proc/sys/kernel/pid_max", buffer, 0);
+                 if (r < 0)
+                         return r;
+         }
+ 
+         sprintf(buffer, "%" PRIu64, limit);
+-        r = write_string_file("/proc/sys/kernel/threads-max", buffer, WRITE_STRING_FILE_DISABLE_BUFFER);
++        r = write_string_file("/proc/sys/kernel/threads-max", buffer, 0);
+         if (r < 0) {
+                 uint64_t threads_max;
+ 
+diff --git a/src/basic/smack-util.c b/src/basic/smack-util.c
+index 123d00e..e7ea78f 100644
+--- a/src/basic/smack-util.c
++++ b/src/basic/smack-util.c
+@@ -115,7 +115,7 @@ int mac_smack_apply_pid(pid_t pid, const char *label) {
+                 return 0;
+ 
+         p = procfs_file_alloca(pid, "attr/current");
+-        r = write_string_file(p, label, WRITE_STRING_FILE_DISABLE_BUFFER);
++        r = write_string_file(p, label, 0);
+         if (r < 0)
+                 return r;
+ 
+diff --git a/src/basic/util.c b/src/basic/util.c
+index e577c93..3c64f91 100644
+--- a/src/basic/util.c
++++ b/src/basic/util.c
+@@ -631,7 +631,7 @@ void disable_coredumps(void) {
+         if (detect_container() > 0)
+                 return;
+ 
+-        r = write_string_file("/proc/sys/kernel/core_pattern", "|/bin/false", WRITE_STRING_FILE_DISABLE_BUFFER);
++        r = write_string_file("/proc/sys/kernel/core_pattern", "|/bin/false", 0);
+         if (r < 0)
+                 log_debug_errno(r, "Failed to turn off coredumps, ignoring: %m");
+ }
+diff --git a/src/binfmt/binfmt.c b/src/binfmt/binfmt.c
+index af31f09..eec5738 100644
+--- a/src/binfmt/binfmt.c
++++ b/src/binfmt/binfmt.c
+@@ -47,7 +47,7 @@ static int delete_rule(const char *rule) {
+         if (!fn)
+                 return log_oom();
+ 
+-        return write_string_file(fn, "-1", WRITE_STRING_FILE_DISABLE_BUFFER);
++        return write_string_file(fn, "-1", 0);
+ }
+ 
+ static int apply_rule(const char *rule) {
+@@ -55,7 +55,7 @@ static int apply_rule(const char *rule) {
+ 
+         (void) delete_rule(rule);
+ 
+-        r = write_string_file("/proc/sys/fs/binfmt_misc/register", rule, WRITE_STRING_FILE_DISABLE_BUFFER);
++        r = write_string_file("/proc/sys/fs/binfmt_misc/register", rule, 0);
+         if (r < 0)
+                 return log_error_errno(r, "Failed to add binary format: %m");
+ 
+@@ -212,7 +212,7 @@ static int run(int argc, char *argv[]) {
+                 }
+ 
+                 /* Flush out all rules */
+-                write_string_file("/proc/sys/fs/binfmt_misc/status", "-1", WRITE_STRING_FILE_DISABLE_BUFFER);
++                write_string_file("/proc/sys/fs/binfmt_misc/status", "-1", 0);
+ 
+                 STRV_FOREACH(f, files) {
+                         k = apply_file(*f, true);
+diff --git a/src/core/main.c b/src/core/main.c
+index 561f956..db6f113 100644
+--- a/src/core/main.c
++++ b/src/core/main.c
+@@ -1468,7 +1468,7 @@ static int bump_unix_max_dgram_qlen(void) {
+         if (v >= DEFAULT_UNIX_MAX_DGRAM_QLEN)
+                 return 0;
+ 
+-        r = write_string_filef("/proc/sys/net/unix/max_dgram_qlen", WRITE_STRING_FILE_DISABLE_BUFFER, "%lu", DEFAULT_UNIX_MAX_DGRAM_QLEN);
++        r = write_string_filef("/proc/sys/net/unix/max_dgram_qlen", 0, "%lu", DEFAULT_UNIX_MAX_DGRAM_QLEN);
+         if (r < 0)
+                 return log_full_errno(IN_SET(r, -EROFS, -EPERM, -EACCES) ? LOG_DEBUG : LOG_WARNING, r,
+                                       "Failed to bump AF_UNIX datagram queue length, ignoring: %m");
+@@ -1683,7 +1683,7 @@ static void initialize_core_pattern(bool skip_setup) {
+         if (getpid_cached() != 1)
+                 return;
+ 
+-        r = write_string_file("/proc/sys/kernel/core_pattern", arg_early_core_pattern, WRITE_STRING_FILE_DISABLE_BUFFER);
++        r = write_string_file("/proc/sys/kernel/core_pattern", arg_early_core_pattern, 0);
+         if (r < 0)
+                 log_warning_errno(r, "Failed to write '%s' to /proc/sys/kernel/core_pattern, ignoring: %m", arg_early_core_pattern);
+ }
+diff --git a/src/core/smack-setup.c b/src/core/smack-setup.c
+index 49b37ae..c96eedc 100644
+--- a/src/core/smack-setup.c
++++ b/src/core/smack-setup.c
+@@ -350,17 +350,17 @@ int mac_smack_setup(bool *loaded_policy) {
+         }
+ 
+ #ifdef SMACK_RUN_LABEL
+-        r = write_string_file("/proc/self/attr/current", SMACK_RUN_LABEL, WRITE_STRING_FILE_DISABLE_BUFFER);
++        r = write_string_file("/proc/self/attr/current", SMACK_RUN_LABEL, 0);
+         if (r < 0)
+                 log_warning_errno(r, "Failed to set SMACK label \"" SMACK_RUN_LABEL "\" on self: %m");
+-        r = write_string_file("/sys/fs/smackfs/ambient", SMACK_RUN_LABEL, WRITE_STRING_FILE_DISABLE_BUFFER);
++        r = write_string_file("/sys/fs/smackfs/ambient", SMACK_RUN_LABEL, 0);
+         if (r < 0)
+                 log_warning_errno(r, "Failed to set SMACK ambient label \"" SMACK_RUN_LABEL "\": %m");
+         r = write_string_file("/sys/fs/smackfs/netlabel",
+-                              "0.0.0.0/0 " SMACK_RUN_LABEL, WRITE_STRING_FILE_DISABLE_BUFFER);
++                              "0.0.0.0/0 " SMACK_RUN_LABEL, 0);
+         if (r < 0)
+                 log_warning_errno(r, "Failed to set SMACK netlabel rule \"0.0.0.0/0 " SMACK_RUN_LABEL "\": %m");
+-        r = write_string_file("/sys/fs/smackfs/netlabel", "127.0.0.1 -CIPSO", WRITE_STRING_FILE_DISABLE_BUFFER);
++        r = write_string_file("/sys/fs/smackfs/netlabel", "127.0.0.1 -CIPSO", 0);
+         if (r < 0)
+                 log_warning_errno(r, "Failed to set SMACK netlabel rule \"127.0.0.1 -CIPSO\": %m");
+ #endif
+diff --git a/src/hibernate-resume/hibernate-resume.c b/src/hibernate-resume/hibernate-resume.c
+index 17e7cd1..87a7667 100644
+--- a/src/hibernate-resume/hibernate-resume.c
++++ b/src/hibernate-resume/hibernate-resume.c
+@@ -45,7 +45,7 @@ int main(int argc, char *argv[]) {
+                 return EXIT_FAILURE;
+         }
+ 
+-        r = write_string_file("/sys/power/resume", major_minor, WRITE_STRING_FILE_DISABLE_BUFFER);
++        r = write_string_file("/sys/power/resume", major_minor, 0);
+         if (r < 0) {
+                 log_error_errno(r, "Failed to write '%s' to /sys/power/resume: %m", major_minor);
+                 return EXIT_FAILURE;
+diff --git a/src/libsystemd/sd-device/sd-device.c b/src/libsystemd/sd-device/sd-device.c
+index 2a69f2e..9d55340 100644
+--- a/src/libsystemd/sd-device/sd-device.c
++++ b/src/libsystemd/sd-device/sd-device.c
+@@ -1836,7 +1836,7 @@ _public_ int sd_device_set_sysattr_value(sd_device *device, const char *sysattr,
+         if (!value)
+                 return -ENOMEM;
+ 
+-        r = write_string_file(path, value, WRITE_STRING_FILE_DISABLE_BUFFER | WRITE_STRING_FILE_NOFOLLOW);
++        r = write_string_file(path, value, 0 | WRITE_STRING_FILE_NOFOLLOW);
+         if (r < 0) {
+                 if (r == -ELOOP)
+                         return -EINVAL;
+diff --git a/src/login/logind-dbus.c b/src/login/logind-dbus.c
+index 8ab498f..d27ef9c 100644
+--- a/src/login/logind-dbus.c
++++ b/src/login/logind-dbus.c
+@@ -1231,7 +1231,7 @@ static int trigger_device(Manager *m, sd_device *d) {
+                 if (!t)
+                         return -ENOMEM;
+ 
+-                (void) write_string_file(t, "change", WRITE_STRING_FILE_DISABLE_BUFFER);
++                (void) write_string_file(t, "change", 0);
+         }
+ 
+         return 0;
+diff --git a/src/network/networkd-ipv6-proxy-ndp.c b/src/network/networkd-ipv6-proxy-ndp.c
+index f594b27..c283cc3 100644
+--- a/src/network/networkd-ipv6-proxy-ndp.c
++++ b/src/network/networkd-ipv6-proxy-ndp.c
+@@ -43,7 +43,7 @@ static int ipv6_proxy_ndp_set(Link *link) {
+         v = ipv6_proxy_ndp_is_needed(link);
+         p = strjoina("/proc/sys/net/ipv6/conf/", link->ifname, "/proxy_ndp");
+ 
+-        r = write_string_file(p, one_zero(v), WRITE_STRING_FILE_VERIFY_ON_FAILURE | WRITE_STRING_FILE_DISABLE_BUFFER);
++        r = write_string_file(p, one_zero(v), WRITE_STRING_FILE_VERIFY_ON_FAILURE | 0);
+         if (r < 0)
+                 log_link_warning_errno(link, r, "Cannot configure proxy NDP for interface: %m");
+ 
+diff --git a/src/network/networkd-link.c b/src/network/networkd-link.c
+index 22392d7..e0ed551 100644
+--- a/src/network/networkd-link.c
++++ b/src/network/networkd-link.c
+@@ -274,7 +274,7 @@ static int link_enable_ipv6(Link *link) {
+ 
+         p = strjoina("/proc/sys/net/ipv6/conf/", link->ifname, "/disable_ipv6");
+ 
+-        r = write_string_file(p, one_zero(disabled), WRITE_STRING_FILE_VERIFY_ON_FAILURE | WRITE_STRING_FILE_DISABLE_BUFFER);
++        r = write_string_file(p, one_zero(disabled), WRITE_STRING_FILE_VERIFY_ON_FAILURE | 0);
+         if (r < 0)
+                 log_link_warning_errno(link, r, "Cannot %s IPv6 for interface %s: %m",
+                                        enable_disable(!disabled), link->ifname);
+@@ -1272,7 +1272,7 @@ static int link_set_proxy_arp(Link *link) {
+ 
+         p = strjoina("/proc/sys/net/ipv4/conf/", link->ifname, "/proxy_arp");
+ 
+-        r = write_string_file(p, one_zero(link->network->proxy_arp), WRITE_STRING_FILE_VERIFY_ON_FAILURE | WRITE_STRING_FILE_DISABLE_BUFFER);
++        r = write_string_file(p, one_zero(link->network->proxy_arp), WRITE_STRING_FILE_VERIFY_ON_FAILURE | 0);
+         if (r < 0)
+                 log_link_warning_errno(link, r, "Cannot configure proxy ARP for interface: %m");
+ 
+@@ -2541,7 +2541,7 @@ static int link_set_ipv4_forward(Link *link) {
+          * primarily to keep IPv4 and IPv6 packet forwarding behaviour
+          * somewhat in sync (see below). */
+ 
+-        r = write_string_file("/proc/sys/net/ipv4/ip_forward", "1", WRITE_STRING_FILE_VERIFY_ON_FAILURE | WRITE_STRING_FILE_DISABLE_BUFFER);
++        r = write_string_file("/proc/sys/net/ipv4/ip_forward", "1", WRITE_STRING_FILE_VERIFY_ON_FAILURE | 0);
+         if (r < 0)
+                 log_link_warning_errno(link, r, "Cannot turn on IPv4 packet forwarding, ignoring: %m");
+ 
+@@ -2563,7 +2563,7 @@ static int link_set_ipv6_forward(Link *link) {
+          * same behaviour there and also propagate the setting from
+          * one to all, to keep things simple (see above). */
+ 
+-        r = write_string_file("/proc/sys/net/ipv6/conf/all/forwarding", "1", WRITE_STRING_FILE_VERIFY_ON_FAILURE | WRITE_STRING_FILE_DISABLE_BUFFER);
++        r = write_string_file("/proc/sys/net/ipv6/conf/all/forwarding", "1", WRITE_STRING_FILE_VERIFY_ON_FAILURE | 0);
+         if (r < 0)
+                 log_link_warning_errno(link, r, "Cannot configure IPv6 packet forwarding, ignoring: %m");
+ 
+@@ -2583,7 +2583,7 @@ static int link_set_ipv6_privacy_extensions(Link *link) {
+         p = strjoina("/proc/sys/net/ipv6/conf/", link->ifname, "/use_tempaddr");
+         xsprintf(buf, "%u", (unsigned) link->network->ipv6_privacy_extensions);
+ 
+-        r = write_string_file(p, buf, WRITE_STRING_FILE_VERIFY_ON_FAILURE | WRITE_STRING_FILE_DISABLE_BUFFER);
++        r = write_string_file(p, buf, WRITE_STRING_FILE_VERIFY_ON_FAILURE | 0);
+         if (r < 0)
+                 log_link_warning_errno(link, r, "Cannot configure IPv6 privacy extension for interface: %m");
+ 
+@@ -2607,7 +2607,7 @@ static int link_set_ipv6_accept_ra(Link *link) {
+         p = strjoina("/proc/sys/net/ipv6/conf/", link->ifname, "/accept_ra");
+ 
+         /* We handle router advertisements ourselves, tell the kernel to GTFO */
+-        r = write_string_file(p, "0", WRITE_STRING_FILE_VERIFY_ON_FAILURE | WRITE_STRING_FILE_DISABLE_BUFFER);
++        r = write_string_file(p, "0", WRITE_STRING_FILE_VERIFY_ON_FAILURE | 0);
+         if (r < 0)
+                 log_link_warning_errno(link, r, "Cannot disable kernel IPv6 accept_ra for interface: %m");
+ 
+@@ -2635,7 +2635,7 @@ static int link_set_ipv6_dad_transmits(Link *link) {
+         p = strjoina("/proc/sys/net/ipv6/conf/", link->ifname, "/dad_transmits");
+         xsprintf(buf, "%i", link->network->ipv6_dad_transmits);
+ 
+-        r = write_string_file(p, buf, WRITE_STRING_FILE_VERIFY_ON_FAILURE | WRITE_STRING_FILE_DISABLE_BUFFER);
++        r = write_string_file(p, buf, WRITE_STRING_FILE_VERIFY_ON_FAILURE | 0);
+         if (r < 0)
+                 log_link_warning_errno(link, r, "Cannot set IPv6 dad transmits for interface: %m");
+ 
+@@ -2663,7 +2663,7 @@ static int link_set_ipv6_hop_limit(Link *link) {
+         p = strjoina("/proc/sys/net/ipv6/conf/", link->ifname, "/hop_limit");
+         xsprintf(buf, "%i", link->network->ipv6_hop_limit);
+ 
+-        r = write_string_file(p, buf, WRITE_STRING_FILE_VERIFY_ON_FAILURE | WRITE_STRING_FILE_DISABLE_BUFFER);
++        r = write_string_file(p, buf, WRITE_STRING_FILE_VERIFY_ON_FAILURE | 0);
+         if (r < 0)
+                 log_link_warning_errno(link, r, "Cannot set IPv6 hop limit for interface: %m");
+ 
+@@ -2689,7 +2689,7 @@ static int link_set_ipv6_mtu(Link *link) {
+ 
+         xsprintf(buf, "%" PRIu32, link->network->ipv6_mtu);
+ 
+-        r = write_string_file(p, buf, WRITE_STRING_FILE_DISABLE_BUFFER);
++        r = write_string_file(p, buf, 0);
+         if (r < 0)
+                 log_link_warning_errno(link, r, "Cannot set IPv6 MTU for interface: %m");
+ 
+diff --git a/src/nspawn/nspawn-cgroup.c b/src/nspawn/nspawn-cgroup.c
+index 97fa092..b841f51 100644
+--- a/src/nspawn/nspawn-cgroup.c
++++ b/src/nspawn/nspawn-cgroup.c
+@@ -123,7 +123,7 @@ int sync_cgroup(pid_t pid, CGroupUnified unified_requested, uid_t uid_shift) {
+         (void) mkdir_parents(fn, 0755);
+ 
+         sprintf(pid_string, PID_FMT, pid);
+-        r = write_string_file(fn, pid_string, WRITE_STRING_FILE_DISABLE_BUFFER);
++        r = write_string_file(fn, pid_string, 0);
+         if (r < 0) {
+                 log_error_errno(r, "Failed to move process: %m");
+                 goto finish;
+diff --git a/src/nspawn/nspawn.c b/src/nspawn/nspawn.c
+index e0c2d71..213790c 100644
+--- a/src/nspawn/nspawn.c
++++ b/src/nspawn/nspawn.c
+@@ -2117,7 +2117,7 @@ static int reset_audit_loginuid(void) {
+         if (streq(p, "4294967295"))
+                 return 0;
+ 
+-        r = write_string_file("/proc/self/loginuid", "4294967295", WRITE_STRING_FILE_DISABLE_BUFFER);
++        r = write_string_file("/proc/self/loginuid", "4294967295", 0);
+         if (r < 0) {
+                 log_error_errno(r,
+                                 "Failed to reset audit login UID. This probably means that your kernel is too\n"
+@@ -3195,13 +3195,13 @@ static int setup_uid_map(pid_t pid) {
+ 
+         xsprintf(uid_map, "/proc/" PID_FMT "/uid_map", pid);
+         xsprintf(line, UID_FMT " " UID_FMT " " UID_FMT "\n", 0, arg_uid_shift, arg_uid_range);
+-        r = write_string_file(uid_map, line, WRITE_STRING_FILE_DISABLE_BUFFER);
++        r = write_string_file(uid_map, line, 0);
+         if (r < 0)
+                 return log_error_errno(r, "Failed to write UID map: %m");
+ 
+         /* We always assign the same UID and GID ranges */
+         xsprintf(uid_map, "/proc/" PID_FMT "/gid_map", pid);
+-        r = write_string_file(uid_map, line, WRITE_STRING_FILE_DISABLE_BUFFER);
++        r = write_string_file(uid_map, line, 0);
+         if (r < 0)
+                 return log_error_errno(r, "Failed to write GID map: %m");
+ 
+diff --git a/src/sleep/sleep.c b/src/sleep/sleep.c
+index 5b7984a..bf818aa 100644
+--- a/src/sleep/sleep.c
++++ b/src/sleep/sleep.c
+@@ -43,7 +43,7 @@ static int write_hibernate_location_info(void) {
+ 
+         /* if it's a swap partition, we just write the disk to /sys/power/resume */
+         if (streq(type, "partition")) {
+-                r = write_string_file("/sys/power/resume", device, WRITE_STRING_FILE_DISABLE_BUFFER);
++                r = write_string_file("/sys/power/resume", device, 0);
+                 if (r < 0)
+                         return log_debug_errno(r, "Faileed to write partitoin device to /sys/power/resume: %m");
+ 
+@@ -79,12 +79,12 @@ static int write_hibernate_location_info(void) {
+ 
+         offset = fiemap->fm_extents[0].fe_physical / page_size();
+         xsprintf(offset_str, "%" PRIu64, offset);
+-        r = write_string_file("/sys/power/resume_offset", offset_str, WRITE_STRING_FILE_DISABLE_BUFFER);
++        r = write_string_file("/sys/power/resume_offset", offset_str, 0);
+         if (r < 0)
+                 return log_debug_errno(r, "Failed to write offset '%s': %m", offset_str);
+ 
+         xsprintf(device_str, "%lx", (unsigned long)stb.st_dev);
+-        r = write_string_file("/sys/power/resume", device_str, WRITE_STRING_FILE_DISABLE_BUFFER);
++        r = write_string_file("/sys/power/resume", device_str, 0);
+         if (r < 0)
+                 return log_debug_errno(r, "Failed to write device '%s': %m", device_str);
+ 
+@@ -98,7 +98,7 @@ static int write_mode(char **modes) {
+         STRV_FOREACH(mode, modes) {
+                 int k;
+ 
+-                k = write_string_file("/sys/power/disk", *mode, WRITE_STRING_FILE_DISABLE_BUFFER);
++                k = write_string_file("/sys/power/disk", *mode, 0);
+                 if (k >= 0)
+                         return 0;
+ 
+@@ -117,7 +117,7 @@ static int write_state(FILE **f, char **states) {
+         STRV_FOREACH(state, states) {
+                 int k;
+ 
+-                k = write_string_stream(*f, *state, WRITE_STRING_FILE_DISABLE_BUFFER);
++                k = write_string_stream(*f, *state, 0);
+                 if (k >= 0)
+                         return 0;
+                 log_debug_errno(k, "Failed to write '%s' to /sys/power/state: %m", *state);
+@@ -212,7 +212,7 @@ static int rtc_write_wake_alarm(uint64_t sec) {
+ 
+         xsprintf(buf, "%" PRIu64, sec);
+ 
+-        r = write_string_file("/sys/class/rtc/rtc0/wakealarm", buf, WRITE_STRING_FILE_DISABLE_BUFFER);
++        r = write_string_file("/sys/class/rtc/rtc0/wakealarm", buf, 0);
+         if (r < 0)
+                 return log_error_errno(r, "Failed to write '%s' to /sys/class/rtc/rtc0/wakealarm: %m", buf);
+ 
+diff --git a/src/udev/udevadm-trigger.c b/src/udev/udevadm-trigger.c
+index 9532946..2e576bb 100644
+--- a/src/udev/udevadm-trigger.c
++++ b/src/udev/udevadm-trigger.c
+@@ -42,7 +42,7 @@ static int exec_list(sd_device_enumerator *e, const char *action, Set *settle_se
+                 if (!filename)
+                         return log_oom();
+ 
+-                r = write_string_file(filename, action, WRITE_STRING_FILE_DISABLE_BUFFER);
++                r = write_string_file(filename, action, 0);
+                 if (r < 0) {
+                         log_debug_errno(r, "Failed to write '%s' to '%s', ignoring: %m", action, filename);
+                         continue;
+diff --git a/src/udev/udevd.c b/src/udev/udevd.c
+index 0303f36..687d009 100644
+--- a/src/udev/udevd.c
++++ b/src/udev/udevd.c
+@@ -1218,7 +1218,7 @@ static int synthesize_change(sd_device *dev) {
+                  */
+                 log_debug("Device '%s' is closed, synthesising 'change'", devname);
+                 strscpyl(filename, sizeof(filename), syspath, "/uevent", NULL);
+-                write_string_file(filename, "change", WRITE_STRING_FILE_DISABLE_BUFFER);
++                write_string_file(filename, "change", 0);
+ 
+                 FOREACH_DEVICE(e, d) {
+                         const char *t, *n, *s;
+@@ -1233,7 +1233,7 @@ static int synthesize_change(sd_device *dev) {
+ 
+                         log_debug("Device '%s' is closed, synthesising partition '%s' 'change'", devname, n);
+                         strscpyl(filename, sizeof(filename), s, "/uevent", NULL);
+-                        write_string_file(filename, "change", WRITE_STRING_FILE_DISABLE_BUFFER);
++                        write_string_file(filename, "change", 0);
+                 }
+ 
+                 return 0;
+@@ -1241,7 +1241,7 @@ static int synthesize_change(sd_device *dev) {
+ 
+         log_debug("Device %s is closed, synthesising 'change'", devname);
+         strscpyl(filename, sizeof(filename), syspath, "/uevent", NULL);
+-        write_string_file(filename, "change", WRITE_STRING_FILE_DISABLE_BUFFER);
++        write_string_file(filename, "change", 0);
+ 
+         return 0;
+ }
+diff --git a/src/vconsole/vconsole-setup.c b/src/vconsole/vconsole-setup.c
+index ebdeba3..aa879e6 100644
+--- a/src/vconsole/vconsole-setup.c
++++ b/src/vconsole/vconsole-setup.c
+@@ -114,7 +114,7 @@ static int toggle_utf8(const char *name, int fd, bool utf8) {
+ static int toggle_utf8_sysfs(bool utf8) {
+         int r;
+ 
+-        r = write_string_file("/sys/module/vt/parameters/default_utf8", one_zero(utf8), WRITE_STRING_FILE_DISABLE_BUFFER);
++        r = write_string_file("/sys/module/vt/parameters/default_utf8", one_zero(utf8), 0);
+         if (r < 0)
+                 return log_warning_errno(r, "Failed to %s sysfs UTF-8 flag: %m", enable_disable(utf8));
+ 
+-- 
+2.7.4
+
diff --git a/meta/recipes-core/systemd/systemd/0001-login-use-parse_uid-when-unmounting-user-runtime-dir.patch b/meta/recipes-core/systemd/systemd/0001-login-use-parse_uid-when-unmounting-user-runtime-dir.patch
deleted file mode 100644
index ba08e34..0000000
--- a/meta/recipes-core/systemd/systemd/0001-login-use-parse_uid-when-unmounting-user-runtime-dir.patch
+++ /dev/null
@@ -1,110 +0,0 @@
-From 86d18f3b09ec984ef3732567af992adb2dc77a8a Mon Sep 17 00:00:00 2001
-From: Yu Watanabe <watanabe.yu+github@gmail.com>
-Date: Mon, 9 Jul 2018 14:05:20 +0900
-Subject: [PATCH] login: use parse_uid() when unmounting user runtime directory
-
-When unmounting user runtime directory, only UID is necessary,
-and the corresponding user may not exist anymore.
-This makes first try to parse the input by parse_uid(), and only if it
-fails, prase the input by get_user_creds().
-
-Fixes #9541.
-
-Upstream-Status: Backport
----
- src/login/user-runtime-dir.c | 57 ++++++++++++++++++++++++++++----------------
- 1 file changed, 36 insertions(+), 21 deletions(-)
-
-diff --git a/src/login/user-runtime-dir.c b/src/login/user-runtime-dir.c
-index 1bb26c99e..de4061c75 100644
---- a/src/login/user-runtime-dir.c
-+++ b/src/login/user-runtime-dir.c
-@@ -111,8 +111,22 @@ static int user_remove_runtime_path(const char *runtime_path) {
-         return r;
- }
- 
--static int do_mount(const char *runtime_path, uid_t uid, gid_t gid) {
-+static int do_mount(const char *user) {
-+        char runtime_path[sizeof("/run/user") + DECIMAL_STR_MAX(uid_t)];
-         size_t runtime_dir_size;
-+        uid_t uid;
-+        gid_t gid;
-+        int r;
-+
-+        r = get_user_creds(&user, &uid, &gid, NULL, NULL);
-+        if (r < 0)
-+                return log_error_errno(r,
-+                                       r == -ESRCH ? "No such user \"%s\"" :
-+                                       r == -ENOMSG ? "UID \"%s\" is invalid or has an invalid main group"
-+                                                    : "Failed to look up user \"%s\": %m",
-+                                       user);
-+
-+        xsprintf(runtime_path, "/run/user/" UID_FMT, uid);
- 
-         assert_se(gather_configuration(&runtime_dir_size) == 0);
- 
-@@ -120,16 +134,30 @@ static int do_mount(const char *runtime_path, uid_t uid, gid_t gid) {
-         return user_mkdir_runtime_path(runtime_path, uid, gid, runtime_dir_size);
- }
- 
--static int do_umount(const char *runtime_path) {
-+static int do_umount(const char *user) {
-+        char runtime_path[sizeof("/run/user") + DECIMAL_STR_MAX(uid_t)];
-+        uid_t uid;
-+        int r;
-+
-+        /* The user may be already removed. So, first try to parse the string by parse_uid(),
-+         * and if it fails, fallback to get_user_creds().*/
-+        if (parse_uid(user, &uid) < 0) {
-+                r = get_user_creds(&user, &uid, NULL, NULL, NULL);
-+                if (r < 0)
-+                        return log_error_errno(r,
-+                                               r == -ESRCH ? "No such user \"%s\"" :
-+                                               r == -ENOMSG ? "UID \"%s\" is invalid or has an invalid main group"
-+                                                            : "Failed to look up user \"%s\": %m",
-+                                               user);
-+        }
-+
-+        xsprintf(runtime_path, "/run/user/" UID_FMT, uid);
-+
-         log_debug("Will remove %s", runtime_path);
-         return user_remove_runtime_path(runtime_path);
- }
- 
- int main(int argc, char *argv[]) {
--        const char *user;
--        uid_t uid;
--        gid_t gid;
--        char runtime_path[sizeof("/run/user") + DECIMAL_STR_MAX(uid_t)];
-         int r;
- 
-         log_parse_environment();
-@@ -146,23 +174,10 @@ int main(int argc, char *argv[]) {
- 
-         umask(0022);
- 
--        user = argv[2];
--        r = get_user_creds(&user, &uid, &gid, NULL, NULL);
--        if (r < 0) {
--                log_error_errno(r,
--                                r == -ESRCH ? "No such user \"%s\"" :
--                                r == -ENOMSG ? "UID \"%s\" is invalid or has an invalid main group"
--                                             : "Failed to look up user \"%s\": %m",
--                                user);
--                return EXIT_FAILURE;
--        }
--
--        xsprintf(runtime_path, "/run/user/" UID_FMT, uid);
--
-         if (streq(argv[1], "start"))
--                r = do_mount(runtime_path, uid, gid);
-+                r = do_mount(argv[2]);
-         else if (streq(argv[1], "stop"))
--                r = do_umount(runtime_path);
-+                r = do_umount(argv[2]);
-         else
-                 assert_not_reached("Unknown verb!");
- 
--- 
-2.11.0
-
diff --git a/meta/recipes-core/systemd/systemd/0001-meson-rename-Ddebug-to-Ddebug-extra.patch b/meta/recipes-core/systemd/systemd/0001-meson-rename-Ddebug-to-Ddebug-extra.patch
deleted file mode 100644
index d6d305c..0000000
--- a/meta/recipes-core/systemd/systemd/0001-meson-rename-Ddebug-to-Ddebug-extra.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 8f6b442a78d0b485f044742ad90b2e8271b4e68e Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
-Date: Sun, 19 Aug 2018 19:11:30 +0200
-Subject: [PATCH] meson: rename -Ddebug to -Ddebug-extra
-
-Meson added -Doptimization and -Ddebug options, which obviously causes
-a conflict with our -Ddebug options. Let's rename it.
-
-Fixes #9883.
-Upstream-Status: Backport
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- meson.build       | 2 +-
- meson_options.txt | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index f79ac4b12..2209c935a 100644
---- a/meson.build
-+++ b/meson.build
-@@ -763,7 +763,7 @@ substs.set('DEBUGTTY', get_option('debug-tty'))
- 
- enable_debug_hashmap = false
- enable_debug_mmap_cache = false
--foreach name : get_option('debug')
-+foreach name : get_option('debug-extra')
-         if name == 'hashmap'
-                 enable_debug_hashmap = true
-         elif name == 'mmap-cache'
-diff --git a/meson_options.txt b/meson_options.txt
-index e3140c8c1..7b1f61bf4 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -45,7 +45,7 @@ option('debug-shell', type : 'string', value : '/bin/sh',
-        description : 'path to debug shell binary')
- option('debug-tty', type : 'string', value : '/dev/tty9',
-        description : 'specify the tty device for debug shell')
--option('debug', type : 'array', choices : ['hashmap', 'mmap-cache'], value : [],
-+option('debug-extra', type : 'array', choices : ['hashmap', 'mmap-cache'], value : [],
-        description : 'enable extra debugging')
- option('memory-accounting-default', type : 'boolean',
-        description : 'enable MemoryAccounting= by default')
--- 
-2.17.1
-
diff --git a/meta/recipes-core/systemd/systemd/0001-sd-bus-make-BUS_DEFAULT_TIMEOUT-configurable.patch b/meta/recipes-core/systemd/systemd/0001-sd-bus-make-BUS_DEFAULT_TIMEOUT-configurable.patch
deleted file mode 100644
index 45c9b5b..0000000
--- a/meta/recipes-core/systemd/systemd/0001-sd-bus-make-BUS_DEFAULT_TIMEOUT-configurable.patch
+++ /dev/null
@@ -1,175 +0,0 @@
-From 5b75a72ee968c9666b5f2ea313720b6c383cb4c2 Mon Sep 17 00:00:00 2001
-From: Yu Watanabe <watanabe.yu+github@gmail.com>
-Date: Fri, 13 Jul 2018 17:38:47 +0900
-Subject: [PATCH] sd-bus: make BUS_DEFAULT_TIMEOUT configurable
-
-This adds sd_bus_{get,set}_method_call_timeout().
-If the timeout is not set or set to 0, then the timeout value is
-parsed from $SYSTEMD_BUS_TIMEOUT= environment variable. If the
-environment variable is not set, then built-in timeout is used.
----
- doc/ENVIRONMENT.md                   |  5 +++++
- src/libsystemd/libsystemd.sym        |  5 +++++
- src/libsystemd/sd-bus/bus-internal.h |  9 ++++----
- src/libsystemd/sd-bus/bus-message.c  |  7 +++++--
- src/libsystemd/sd-bus/sd-bus.c       | 40 ++++++++++++++++++++++++++++++++++--
- src/systemd/sd-bus.h                 |  3 +++
- 6 files changed, 61 insertions(+), 8 deletions(-)
-
-Upstream-Status: Backport
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
-
-diff --git a/doc/ENVIRONMENT.md b/doc/ENVIRONMENT.md
-index 85d26fe28c..641a03d5d7 100644
---- a/doc/ENVIRONMENT.md
-+++ b/doc/ENVIRONMENT.md
-@@ -37,6 +37,11 @@ All tools:
-   useful for debugging, in order to test generators and other code against
-   specific kernel command lines.
- 
-+* `$SYSTEMD_BUS_TIMEOUT=SECS` — specifies the maximum time to wait for method call
-+  completion. If no time unit is specified, assumes seconds. The usual other units
-+  are understood, too (us, ms, s, min, h, d, w, month, y). If it is not set or set
-+  to 0, then the built-in default is used.
-+
- systemctl:
- 
- * `$SYSTEMCTL_FORCE_BUS=1` — if set, do not connect to PID1's private D-Bus
-diff --git a/src/libsystemd/libsystemd.sym b/src/libsystemd/libsystemd.sym
-index 1eec17db50..006dbc9c3f 100644
---- a/src/libsystemd/libsystemd.sym
-+++ b/src/libsystemd/libsystemd.sym
-@@ -570,3 +570,8 @@ global:
-         sd_event_source_set_destroy_callback;
-         sd_event_source_get_destroy_callback;
- } LIBSYSTEMD_238;
-+
-+LIBSYSTEMD_240 {
-+        sd_bus_set_method_call_timeout;
-+        sd_bus_get_method_call_timeout;
-+} LIBSYSTEMD_239;
-diff --git a/src/libsystemd/sd-bus/bus-internal.h b/src/libsystemd/sd-bus/bus-internal.h
-index 2087ef8eeb..4864b1e911 100644
---- a/src/libsystemd/sd-bus/bus-internal.h
-+++ b/src/libsystemd/sd-bus/bus-internal.h
-@@ -319,6 +319,9 @@ struct sd_bus {
- 
-         int *inotify_watches;
-         size_t n_inotify_watches;
-+
-+        /* zero means use value specified by $SYSTEMD_BUS_TIMEOUT= environment variable or built-in default */
-+        usec_t method_call_timeout;
- };
- 
- /* For method calls we time-out at 25s, like in the D-Bus reference implementation */
-@@ -336,8 +339,7 @@ struct sd_bus {
- 
- #define BUS_CONTAINER_DEPTH 128
- 
--/* Defined by the specification as maximum size of an array in
-- * bytes */
-+/* Defined by the specification as maximum size of an array in bytes */
- #define BUS_ARRAY_MAX_SIZE 67108864
- 
- #define BUS_FDS_MAX 1024
-@@ -388,8 +390,7 @@ void bus_close_io_fds(sd_bus *b);
-              _slash = streq((prefix), "/") ? NULL : strrchr((prefix), '/'))
- 
- /* If we are invoking callbacks of a bus object, ensure unreffing the
-- * bus from the callback doesn't destroy the object we are working
-- * on */
-+ * bus from the callback doesn't destroy the object we are working on */
- #define BUS_DONT_DESTROY(bus) \
-         _cleanup_(sd_bus_unrefp) _unused_ sd_bus *_dont_destroy_##bus = sd_bus_ref(bus)
- 
-diff --git a/src/libsystemd/sd-bus/bus-message.c b/src/libsystemd/sd-bus/bus-message.c
-index 8d92bc2002..dffe70a665 100644
---- a/src/libsystemd/sd-bus/bus-message.c
-+++ b/src/libsystemd/sd-bus/bus-message.c
-@@ -5809,8 +5809,11 @@ int bus_message_remarshal(sd_bus *bus, sd_bus_message **m) {
-                 return r;
- 
-         timeout = (*m)->timeout;
--        if (timeout == 0 && !((*m)->header->flags & BUS_MESSAGE_NO_REPLY_EXPECTED))
--                timeout = BUS_DEFAULT_TIMEOUT;
-+        if (timeout == 0 && !((*m)->header->flags & BUS_MESSAGE_NO_REPLY_EXPECTED)) {
-+                r = sd_bus_get_method_call_timeout(bus, &timeout);
-+                if (r < 0)
-+                        return r;
-+        }
- 
-         r = sd_bus_message_seal(n, BUS_MESSAGE_COOKIE(*m), timeout);
-         if (r < 0)
-diff --git a/src/libsystemd/sd-bus/sd-bus.c b/src/libsystemd/sd-bus/sd-bus.c
-index 089b51a6d9..945490ebf7 100644
---- a/src/libsystemd/sd-bus/sd-bus.c
-+++ b/src/libsystemd/sd-bus/sd-bus.c
-@@ -1611,8 +1611,11 @@ static int bus_seal_message(sd_bus *b, sd_bus_message *m, usec_t timeout) {
-                 return 0;
-         }
- 
--        if (timeout == 0)
--                timeout = BUS_DEFAULT_TIMEOUT;
-+        if (timeout == 0) {
-+                r = sd_bus_get_method_call_timeout(b, &timeout);
-+                if (r < 0)
-+                        return r;
-+        }
- 
-         if (!m->sender && b->patch_sender) {
-                 r = sd_bus_message_set_sender(m, b->patch_sender);
-@@ -4075,3 +4078,36 @@ _public_ int sd_bus_get_n_queued_write(sd_bus *bus, uint64_t *ret) {
-         *ret = bus->wqueue_size;
-         return 0;
- }
-+
-+_public_ int sd_bus_set_method_call_timeout(sd_bus *bus, uint64_t usec) {
-+        assert_return(bus, -EINVAL);
-+        assert_return(bus = bus_resolve(bus), -ENOPKG);
-+
-+        bus->method_call_timeout = usec;
-+        return 0;
-+}
-+
-+_public_ int sd_bus_get_method_call_timeout(sd_bus *bus, uint64_t *ret) {
-+        const char *e;
-+        usec_t usec;
-+
-+        assert_return(bus, -EINVAL);
-+        assert_return(bus = bus_resolve(bus), -ENOPKG);
-+        assert_return(ret, -EINVAL);
-+
-+        if (bus->method_call_timeout != 0) {
-+                *ret = bus->method_call_timeout;
-+                return 0;
-+        }
-+
-+        e = secure_getenv("SYSTEMD_BUS_TIMEOUT");
-+        if (e && parse_sec(e, &usec) >= 0 && usec != 0) {
-+                /* Save the parsed value to avoid multiple parsing. To change the timeout value,
-+                 * use sd_bus_set_method_call_timeout() instead of setenv(). */
-+                *ret = bus->method_call_timeout = usec;
-+                return 0;
-+        }
-+
-+        *ret = bus->method_call_timeout = BUS_DEFAULT_TIMEOUT;
-+        return 0;
-+}
-diff --git a/src/systemd/sd-bus.h b/src/systemd/sd-bus.h
-index 54c4b1ca83..c9fd254834 100644
---- a/src/systemd/sd-bus.h
-+++ b/src/systemd/sd-bus.h
-@@ -206,6 +206,9 @@ sd_event *sd_bus_get_event(sd_bus *bus);
- int sd_bus_get_n_queued_read(sd_bus *bus, uint64_t *ret);
- int sd_bus_get_n_queued_write(sd_bus *bus, uint64_t *ret);
- 
-+int sd_bus_set_method_call_timeout(sd_bus *bus, uint64_t usec);
-+int sd_bus_get_method_call_timeout(sd_bus *bus, uint64_t *ret);
-+
- int sd_bus_add_filter(sd_bus *bus, sd_bus_slot **slot, sd_bus_message_handler_t callback, void *userdata);
- int sd_bus_add_match(sd_bus *bus, sd_bus_slot **slot, const char *match, sd_bus_message_handler_t callback, void *userdata);
- int sd_bus_add_match_async(sd_bus *bus, sd_bus_slot **slot, const char *match, sd_bus_message_handler_t callback, sd_bus_message_handler_t install_callback, void *userdata);
--- 
-2.11.0
-
diff --git a/meta/recipes-core/systemd/systemd/0001-sysctl-Don-t-pass-null-directive-argument-to-s.patch b/meta/recipes-core/systemd/systemd/0001-sysctl-Don-t-pass-null-directive-argument-to-s.patch
deleted file mode 100644
index 0538c7b..0000000
--- a/meta/recipes-core/systemd/systemd/0001-sysctl-Don-t-pass-null-directive-argument-to-s.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From bfc4183ea995f1c211385d066cdb1fe9ce89f621 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 16 Dec 2018 20:53:38 -0800
-Subject: [PATCH 1/2] sysctl: Don't pass null directive argument to '%s'
-
-value pointer here is always NULL but  subsequent use of that pointer
-with a %s format will always be NULL, printing p instead would be a
-valid string
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Submitted [https://github.com/systemd/systemd/pull/11179]
- src/sysctl/sysctl.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/sysctl/sysctl.c b/src/sysctl/sysctl.c
-index 1cfe51018..c67d79032 100644
---- a/src/sysctl/sysctl.c
-+++ b/src/sysctl/sysctl.c
-@@ -115,7 +115,7 @@ static int parse_file(OrderedHashmap *sysctl_options, const char *path, bool ign
- 
-                 value = strchr(p, '=');
-                 if (!value) {
--                        log_error("Line is not an assignment at '%s:%u': %s", path, c, value);
-+                        log_error("Line is not an assignment at '%s:%u': %s", path, c, p);
- 
-                         if (r == 0)
-                                 r = -EINVAL;
--- 
-2.20.1
-
diff --git a/meta/recipes-core/systemd/systemd/0001-timesync-changes-type-of-drift_freq-to-int64_t.patch b/meta/recipes-core/systemd/systemd/0001-timesync-changes-type-of-drift_freq-to-int64_t.patch
deleted file mode 100644
index 8d395c2..0000000
--- a/meta/recipes-core/systemd/systemd/0001-timesync-changes-type-of-drift_freq-to-int64_t.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-Backport patch to fix systemd build failure on x32.
-
-Upstream-Status: Backport [https://github.com/systemd/systemd/commit/75ca162]
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
-From 75ca1621db4647a4d62d7873cd6715e28fe0f9fa Mon Sep 17 00:00:00 2001
-From: Yu Watanabe <watanabe.yu+github@gmail.com>
-Date: Sat, 23 Jun 2018 09:41:55 +0900
-Subject: [PATCH] timesync: changes type of drift_freq to int64_t
-
-drift_freq is used for storing timex.freq, and is a 64bit integer.
-To support x32 ABI, this changes the type of drift_freq to int64_t.
-
-Fixes #9387.
----
- src/timesync/timesyncd-manager.c | 2 +-
- src/timesync/timesyncd-manager.h | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/timesync/timesyncd-manager.c b/src/timesync/timesyncd-manager.c
-index 2b731af9e..404a2b189 100644
---- a/src/timesync/timesyncd-manager.c
-+++ b/src/timesync/timesyncd-manager.c
-@@ -604,7 +604,7 @@ static int manager_receive_response(sd_event_source *source, int fd, uint32_t re
-         m->dest_time = *recv_time;
-         m->spike = spike;
- 
--        log_debug("interval/delta/delay/jitter/drift " USEC_FMT "s/%+.3fs/%.3fs/%.3fs/%+"PRI_TIMEX"ppm%s",
-+        log_debug("interval/delta/delay/jitter/drift " USEC_FMT "s/%+.3fs/%.3fs/%.3fs/%+"PRIi64"ppm%s",
-                   m->poll_interval_usec / USEC_PER_SEC, offset, delay, m->samples_jitter, m->drift_freq / 65536,
-                   spike ? " (ignored)" : "");
- 
-diff --git a/src/timesync/timesyncd-manager.h b/src/timesync/timesyncd-manager.h
-index d8d97cc1e..18347416d 100644
---- a/src/timesync/timesyncd-manager.h
-+++ b/src/timesync/timesyncd-manager.h
-@@ -79,7 +79,7 @@ struct Manager {
-         /* last change */
-         bool jumped;
-         bool sync;
--        long drift_freq;
-+        int64_t drift_freq;
- 
-         /* watch for time changes */
-         sd_event_source *event_clock_watch;
--- 
-2.17.0
-
diff --git a/meta/recipes-core/systemd/systemd/0002-core-Fix-use-after-free-case-in-load_from_path.patch b/meta/recipes-core/systemd/systemd/0002-core-Fix-use-after-free-case-in-load_from_path.patch
deleted file mode 100644
index 4da96e2..0000000
--- a/meta/recipes-core/systemd/systemd/0002-core-Fix-use-after-free-case-in-load_from_path.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From cb67aebd63d9f0077cbf3e769f0b223c5bba20ac Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 16 Dec 2018 20:58:35 -0800
-Subject: [PATCH 2/2] core: Fix use after free case in load_from_path()
-
-ensure that mfree() on filename is called after the logging function
-which uses the string pointed by filename
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Submitted [https://github.com/systemd/systemd/pull/11179]
- src/core/load-fragment.c | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/src/core/load-fragment.c b/src/core/load-fragment.c
-index fc5644f48..da585786e 100644
---- a/src/core/load-fragment.c
-+++ b/src/core/load-fragment.c
-@@ -4531,7 +4531,6 @@ static int load_from_path(Unit *u, const char *path) {
-                                 r = open_follow(&filename, &f, symlink_names, &id);
-                         if (r >= 0)
-                                 break;
--                        filename = mfree(filename);
- 
-                         /* ENOENT means that the file is missing or is a dangling symlink.
-                          * ENOTDIR means that one of paths we expect to be is a directory
-@@ -4540,9 +4539,12 @@ static int load_from_path(Unit *u, const char *path) {
-                          */
-                         if (r == -EACCES)
-                                 log_debug_errno(r, "Cannot access \"%s\": %m", filename);
--                        else if (!IN_SET(r, -ENOENT, -ENOTDIR))
-+                        else if (!IN_SET(r, -ENOENT, -ENOTDIR)) {
-+                                filename = mfree(filename);
-                                 return r;
-+                        }
- 
-+                        filename = mfree(filename);
-                         /* Empty the symlink names for the next run */
-                         set_clear_free(symlink_names);
-                 }
--- 
-2.20.1
-
diff --git a/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch b/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch
index 8e0d669..36e0699 100644
--- a/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch
+++ b/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch
@@ -1,31 +1,100 @@
-From d74a4de6daea5a511c2b5636bbb552c15b3a4ad9 Mon Sep 17 00:00:00 2001
-From: Emil Renner Berthing <systemd@esmil.dk>
-Date: Thu, 18 Sep 2014 15:24:56 +0200
-Subject: [PATCH] don't use glibc-specific qsort_r
+From 1eb84534dea05d41afed1d898cba212ad7d310dd Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Mon, 25 Feb 2019 13:41:41 +0800
+Subject: [PATCH 02/24] don't use glibc-specific qsort_r
 
 Upstream-Status: Inappropriate [musl specific]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+[Rebased for v241]
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 ---
- src/basic/format-table.c | 27 ++++++++++++++++-----------
- src/basic/util.h         |  7 -------
- src/hwdb/hwdb.c          | 18 +++++++++++-------
- src/udev/udevadm-hwdb.c  | 16 ++++++++++------
- 4 files changed, 37 insertions(+), 31 deletions(-)
+ src/basic/util.h                   | 14 --------------
+ src/libsystemd/sd-hwdb/hwdb-util.c | 19 ++++++++++++++-----
+ src/shared/format-table.c          | 36 ++++++++++++++++++++++++------------
+ 3 files changed, 38 insertions(+), 31 deletions(-)
 
-diff --git a/src/basic/format-table.c b/src/basic/format-table.c
-index 94e796d1ca..9b3f35c29a 100644
---- a/src/basic/format-table.c
-+++ b/src/basic/format-table.c
-@@ -745,29 +745,29 @@ static int cell_data_compare(TableData *a, size_t index_a, TableData *b, size_t
+diff --git a/src/basic/util.h b/src/basic/util.h
+index dc33d66..9f6a6ce 100644
+--- a/src/basic/util.h
++++ b/src/basic/util.h
+@@ -116,20 +116,6 @@ static inline void qsort_safe(void *base, size_t nmemb, size_t size, __compar_fn
+                 qsort_safe((p), (n), sizeof((p)[0]), (__compar_fn_t) _func_); \
+         })
+ 
+-static inline void qsort_r_safe(void *base, size_t nmemb, size_t size, __compar_d_fn_t compar, void *userdata) {
+-        if (nmemb <= 1)
+-                return;
+-
+-        assert(base);
+-        qsort_r(base, nmemb, size, compar, userdata);
+-}
+-
+-#define typesafe_qsort_r(p, n, func, userdata)                          \
+-        ({                                                              \
+-                int (*_func_)(const typeof(p[0])*, const typeof(p[0])*, typeof(userdata)) = func; \
+-                qsort_r_safe((p), (n), sizeof((p)[0]), (__compar_d_fn_t) _func_, userdata); \
+-        })
+-
+ /* Normal memcpy requires src to be nonnull. We do nothing if n is 0. */
+ static inline void memcpy_safe(void *dst, const void *src, size_t n) {
+         if (n == 0)
+diff --git a/src/libsystemd/sd-hwdb/hwdb-util.c b/src/libsystemd/sd-hwdb/hwdb-util.c
+index f852967..b570ce1 100644
+--- a/src/libsystemd/sd-hwdb/hwdb-util.c
++++ b/src/libsystemd/sd-hwdb/hwdb-util.c
+@@ -126,9 +126,13 @@ static void trie_free(struct trie *trie) {
+ 
+ DEFINE_TRIVIAL_CLEANUP_FUNC(struct trie*, trie_free);
+ 
+-static int trie_values_cmp(const struct trie_value_entry *a, const struct trie_value_entry *b, struct trie *trie) {
+-        return strcmp(trie->strings->buf + a->key_off,
+-                      trie->strings->buf + b->key_off);
++static struct trie *trie_node_add_value_trie;
++static int trie_values_cmp(const void *v1, const void *v2) {
++        const struct trie_value_entry *a = v1;
++        const struct trie_value_entry *b = v2;
++
++        return strcmp(trie_node_add_value_trie->strings->buf + a->key_off,
++                      trie_node_add_value_trie->strings->buf + b->key_off);
+ }
+ 
+ static int trie_node_add_value(struct trie *trie, struct trie_node *node,
+@@ -156,7 +160,10 @@ static int trie_node_add_value(struct trie *trie, struct trie_node *node,
+                         .value_off = v,
+                 };
+ 
+-                val = typesafe_bsearch_r(&search, node->values, node->values_count, trie_values_cmp, trie);
++                trie_node_add_value_trie = trie;
++                val = bsearch(&search, node->values, node->values_count, sizeof(struct trie_value_entry), trie_values_cmp);
++                trie_node_add_value_trie = NULL;
++
+                 if (val) {
+                         /* At this point we have 2 identical properties on the same match-string.
+                          * Since we process files in order, we just replace the previous value. */
+@@ -182,7 +189,9 @@ static int trie_node_add_value(struct trie *trie, struct trie_node *node,
+                 .line_number = line_number,
+         };
+         node->values_count++;
+-        typesafe_qsort_r(node->values, node->values_count, trie_values_cmp, trie);
++        trie_node_add_value_trie = trie;
++        qsort(node->values, node->values_count, sizeof(struct trie_value_entry), trie_values_cmp);
++        trie_node_add_value_trie = NULL;
          return 0;
  }
  
--static int table_data_compare(const void *x, const void *y, void *userdata) {
+diff --git a/src/shared/format-table.c b/src/shared/format-table.c
+index 7d52980..75dbfe1 100644
+--- a/src/shared/format-table.c
++++ b/src/shared/format-table.c
+@@ -848,31 +848,33 @@ static int cell_data_compare(TableData *a, size_t index_a, TableData *b, size_t
+         return CMP(index_a, index_b);
+ }
+ 
+-static int table_data_compare(const size_t *a, const size_t *b, Table *t) {
 +static Table *user_table;
 +static int table_data_compare(const void *x, const void *y) {
-         const size_t *a = x, *b = y;
--        Table *t = userdata;
++        const size_t *a = x, *b=y;
          size_t i;
          int r;
  
@@ -57,11 +126,16 @@ index 94e796d1ca..9b3f35c29a 100644
  
                  r = cell_data_compare(d, *a, dd, *b);
                  if (r != 0)
-@@ -960,7 +960,12 @@ int table_print(Table *t, FILE *f) {
+-                        return t->reverse_map && t->reverse_map[t->sort_map[i]] ? -r : r;
++                        return user_table->reverse_map && user_table->reverse_map[user_table->sort_map[i]] ? -r : r;
+         }
+ 
+         /* Order identical lines by the order there were originally added in */
+@@ -1105,7 +1107,12 @@ int table_print(Table *t, FILE *f) {
                  for (i = 0; i < n_rows; i++)
                          sorted[i] = i * t->n_columns;
  
--                qsort_r_safe(sorted, n_rows, sizeof(size_t), table_data_compare, t);
+-                typesafe_qsort_r(sorted, n_rows, table_data_compare, t);
 +                if (n_rows <= 1)
 +                        return 0;
 +                assert(sorted);
@@ -71,113 +145,20 @@ index 94e796d1ca..9b3f35c29a 100644
          }
  
          if (t->display_map)
-diff --git a/src/basic/util.h b/src/basic/util.h
-index 9699d228f9..40eaf518cb 100644
---- a/src/basic/util.h
-+++ b/src/basic/util.h
-@@ -105,13 +105,6 @@ static inline void qsort_safe(void *base, size_t nmemb, size_t size, comparison_
-                 qsort_safe((p), (n), sizeof((p)[0]), (__compar_fn_t) _func_); \
-         })
- 
--static inline void qsort_r_safe(void *base, size_t nmemb, size_t size, int (*compar)(const void*, const void*, void*), void *userdata) {
--        if (nmemb <= 1)
--                return;
--
--        assert(base);
--        qsort_r(base, nmemb, size, compar, userdata);
--}
- 
- /**
-  * Normal memcpy requires src to be nonnull. We do nothing if n is 0.
-diff --git a/src/hwdb/hwdb.c b/src/hwdb/hwdb.c
-index 317cad8a67..701d59a1eb 100644
---- a/src/hwdb/hwdb.c
-+++ b/src/hwdb/hwdb.c
-@@ -135,13 +135,12 @@ static void trie_free(struct trie *trie) {
- 
- DEFINE_TRIVIAL_CLEANUP_FUNC(struct trie*, trie_free);
- 
--static int trie_values_cmp(const void *v1, const void *v2, void *arg) {
-+static struct trie *trie_node_add_value_trie;
-+static int trie_values_cmp(const void *v1, const void *v2) {
-         const struct trie_value_entry *val1 = v1;
-         const struct trie_value_entry *val2 = v2;
--        struct trie *trie = arg;
--
--        return strcmp(trie->strings->buf + val1->key_off,
--                      trie->strings->buf + val2->key_off);
-+        return strcmp(trie_node_add_value_trie->strings->buf + val1->key_off,
-+                      trie_node_add_value_trie->strings->buf + val2->key_off);
- }
- 
- static int trie_node_add_value(struct trie *trie, struct trie_node *node,
-@@ -166,7 +165,10 @@ static int trie_node_add_value(struct trie *trie, struct trie_node *node,
-                         .value_off = v,
-                 };
- 
--                val = xbsearch_r(&search, node->values, node->values_count, sizeof(struct trie_value_entry), trie_values_cmp, trie);
-+                trie_node_add_value_trie = trie;
-+                val = bsearch(&search, node->values, node->values_count, sizeof(struct trie_value_entry), trie_values_cmp);
-+                trie_node_add_value_trie = NULL;
-+
-                 if (val) {
-                         /* At this point we have 2 identical properties on the same match-string.
-                          * Since we process files in order, we just replace the previous value.
-@@ -191,7 +193,9 @@ static int trie_node_add_value(struct trie *trie, struct trie_node *node,
-         node->values[node->values_count].file_priority = file_priority;
-         node->values[node->values_count].line_number = line_number;
-         node->values_count++;
--        qsort_r(node->values, node->values_count, sizeof(struct trie_value_entry), trie_values_cmp, trie);
-+        trie_node_add_value_trie = trie;
-+        qsort(node->values, node->values_count, sizeof(struct trie_value_entry), trie_values_cmp);
-+        trie_node_add_value_trie = NULL;
-         return 0;
- }
- 
-diff --git a/src/udev/udevadm-hwdb.c b/src/udev/udevadm-hwdb.c
-index 02408a4285..491d367d12 100644
---- a/src/udev/udevadm-hwdb.c
-+++ b/src/udev/udevadm-hwdb.c
-@@ -114,13 +114,13 @@ static void trie_node_cleanup(struct trie_node *node) {
-         free(node);
- }
- 
--static int trie_values_cmp(const void *v1, const void *v2, void *arg) {
-+static struct trie *trie_node_add_value_trie;
-+static int trie_values_cmp(const void *v1, const void *v2) {
-         const struct trie_value_entry *val1 = v1;
-         const struct trie_value_entry *val2 = v2;
--        struct trie *trie = arg;
- 
--        return strcmp(trie->strings->buf + val1->key_off,
--                      trie->strings->buf + val2->key_off);
-+        return strcmp(trie_node_add_value_trie->strings->buf + val1->key_off,
-+                      trie_node_add_value_trie->strings->buf + val2->key_off);
- }
- 
- static int trie_node_add_value(struct trie *trie, struct trie_node *node,
-@@ -141,7 +141,9 @@ static int trie_node_add_value(struct trie *trie, struct trie_node *node,
-                         .value_off = v,
-                 };
+@@ -1532,7 +1539,12 @@ int table_to_json(Table *t, JsonVariant **ret) {
+                 for (i = 0; i < n_rows; i++)
+                         sorted[i] = i * t->n_columns;
  
--                val = xbsearch_r(&search, node->values, node->values_count, sizeof(struct trie_value_entry), trie_values_cmp, trie);
-+                trie_node_add_value_trie = trie;
-+                val = bsearch(&search, node->values, node->values_count, sizeof(struct trie_value_entry), trie_values_cmp);
-+                trie_node_add_value_trie = NULL;
-                 if (val) {
-                         /* replace existing earlier key with new value */
-                         val->value_off = v;
-@@ -158,7 +160,9 @@ static int trie_node_add_value(struct trie *trie, struct trie_node *node,
-         node->values[node->values_count].key_off = k;
-         node->values[node->values_count].value_off = v;
-         node->values_count++;
--        qsort_r(node->values, node->values_count, sizeof(struct trie_value_entry), trie_values_cmp, trie);
-+        trie_node_add_value_trie = trie;
-+        qsort(node->values, node->values_count, sizeof(struct trie_value_entry), trie_values_cmp);
-+        trie_node_add_value_trie = NULL;
-         return 0;
- }
+-                typesafe_qsort_r(sorted, n_rows, table_data_compare, t);
++                if (n_rows <= 1)
++                        return 0;
++                assert(sorted);
++                user_table = t;
++                qsort(sorted, n_rows, sizeof(size_t), table_data_compare);
++                user_table = NULL;
+         }
  
+         if (t->display_map)
 -- 
-2.18.0
+2.7.4
 
diff --git a/meta/recipes-core/systemd/systemd/0002-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch b/meta/recipes-core/systemd/systemd/0002-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch
index 1d7f523..df5506c 100644
--- a/meta/recipes-core/systemd/systemd/0002-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch
+++ b/meta/recipes-core/systemd/systemd/0002-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch
@@ -1,7 +1,7 @@
-From 6e62be87a2722fbe531310a1b052c1301bdf06fb Mon Sep 17 00:00:00 2001
+From bdbafe18c3bf99b3b691cd52b9ccff60f313892d Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Wed, 27 Jun 2018 16:09:24 +0800
-Subject: [PATCH 2/9] use lnr wrapper instead of looking for --relative option
+Subject: [PATCH 2/5] use lnr wrapper instead of looking for --relative option
  for ln
 
 Remove file manually to avoid the 'File Exists' error when creating
@@ -18,10 +18,10 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  3 files changed, 8 insertions(+), 6 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index 04331dd41..6d5edcb4e 100644
+index 56c98b9..3386546 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -558,10 +558,6 @@ endforeach
+@@ -630,10 +630,6 @@ endforeach
  
  conf.set_quoted('TELINIT', get_option('telinit-path'))
  
@@ -33,7 +33,7 @@ index 04331dd41..6d5edcb4e 100644
  
  gperf = find_program('gperf')
 diff --git a/tools/meson-make-symlink.sh b/tools/meson-make-symlink.sh
-index 501cd43d4..f4e4ac9ac 100755
+index 501cd43..f4e4ac9 100755
 --- a/tools/meson-make-symlink.sh
 +++ b/tools/meson-make-symlink.sh
 @@ -8,5 +8,6 @@ mkdir -vp "$(dirname "${DESTDIR:-}$2")"
@@ -45,7 +45,7 @@ index 501cd43d4..f4e4ac9ac 100755
 +        lnr "${DESTDIR:-}$1" "${DESTDIR:-}$2"
  fi
 diff --git a/units/meson-add-wants.sh b/units/meson-add-wants.sh
-index 70f7172ae..a42666aac 100755
+index e2b2603..210d604 100755
 --- a/units/meson-add-wants.sh
 +++ b/units/meson-add-wants.sh
 @@ -25,4 +25,9 @@ case "$target" in
@@ -60,5 +60,5 @@ index 70f7172ae..a42666aac 100755
 +        lnr "$unitpath" "$dir"
 +fi
 -- 
-2.11.0
+2.7.4
 
diff --git a/meta/recipes-core/systemd/systemd/0003-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch b/meta/recipes-core/systemd/systemd/0003-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch
deleted file mode 100644
index 115fb33..0000000
--- a/meta/recipes-core/systemd/systemd/0003-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From e965e748c7030df0709e63128db2f023540a06ba Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 12 Sep 2015 18:53:31 +0000
-Subject: [PATCH 03/19] comparison_fn_t is glibc specific, use raw signature in
- function pointer
-
-make it work with musl where comparison_fn_t is not provided
-
-Upstream-Status: Inappropriate [musl specific]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/basic/util.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/basic/util.h b/src/basic/util.h
-index 40eaf518c..c58392397 100644
---- a/src/basic/util.h
-+++ b/src/basic/util.h
-@@ -77,7 +77,7 @@ void *xbsearch_r(const void *key, const void *base, size_t nmemb, size_t size,
-  * that only if nmemb > 0.
-  */
- static inline void* bsearch_safe(const void *key, const void *base,
--                                 size_t nmemb, size_t size, comparison_fn_t compar) {
-+                                 size_t nmemb, size_t size, int (*compar)(const void *, const void *)) {
-         if (nmemb <= 0)
-                 return NULL;
- 
-@@ -89,7 +89,7 @@ static inline void* bsearch_safe(const void *key, const void *base,
-  * Normal qsort requires base to be nonnull. Here were require
-  * that only if nmemb > 0.
-  */
--static inline void qsort_safe(void *base, size_t nmemb, size_t size, comparison_fn_t compar) {
-+static inline void qsort_safe(void *base, size_t nmemb, size_t size, int (*compar)(const void *, const void *)) {
-         if (nmemb <= 1)
-                 return;
- 
--- 
-2.11.0
-
diff --git a/meta/recipes-core/systemd/systemd/0003-implment-systemd-sysv-install-for-OE.patch b/meta/recipes-core/systemd/systemd/0003-implment-systemd-sysv-install-for-OE.patch
index 6c595ae..6695d56 100644
--- a/meta/recipes-core/systemd/systemd/0003-implment-systemd-sysv-install-for-OE.patch
+++ b/meta/recipes-core/systemd/systemd/0003-implment-systemd-sysv-install-for-OE.patch
@@ -1,7 +1,7 @@
-From 0fcb6e646401205e17cc6c129441a49023c62cef Mon Sep 17 00:00:00 2001
+From 47864989388bcd04d647ecf618ad7e260399dbb6 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 5 Sep 2015 06:31:47 +0000
-Subject: [PATCH 3/9] implment systemd-sysv-install for OE
+Subject: [PATCH 3/5] implment systemd-sysv-install for OE
 
 Use update-rc.d for enabling/disabling and status command
 to check the status of the sysv service
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/src/systemctl/systemd-sysv-install.SKELETON b/src/systemctl/systemd-sysv-install.SKELETON
-index 8c16cf999..9f078a121 100755
+index 8c16cf9..9f078a1 100755
 --- a/src/systemctl/systemd-sysv-install.SKELETON
 +++ b/src/systemctl/systemd-sysv-install.SKELETON
 @@ -32,17 +32,17 @@ case "$1" in
@@ -39,5 +39,5 @@ index 8c16cf999..9f078a121 100755
      *)
          usage ;;
 -- 
-2.11.0
+2.7.4
 
diff --git a/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch b/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch
new file mode 100644
index 0000000..5246b4b
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch
@@ -0,0 +1,61 @@
+From a9421d55102fc84f77f7c21a2479fcd00652b896 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Mon, 25 Feb 2019 13:55:12 +0800
+Subject: [PATCH 03/24] missing_type.h: add __compare_fn_t and comparison_fn_t
+
+Make it work with musl where comparison_fn_t and __compare_fn_t
+is not provided.
+
+Upstream-Status: Inappropriate [musl specific]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/basic/missing_type.h | 9 +++++++++
+ src/basic/util.h         | 1 +
+ src/journal/catalog.c    | 1 +
+ 3 files changed, 11 insertions(+)
+
+diff --git a/src/basic/missing_type.h b/src/basic/missing_type.h
+index bf8a6ca..c487e65 100644
+--- a/src/basic/missing_type.h
++++ b/src/basic/missing_type.h
+@@ -10,3 +10,12 @@
+ #if !HAVE_CHAR16_T
+ #define char16_t uint16_t
+ #endif
++
++#ifndef __GLIBC__
++typedef int (*comparison_fn_t)(const void *, const void *);
++#endif
++
++#ifndef __COMPAR_FN_T
++#define __COMPAR_FN_T
++typedef int (*__compar_fn_t)(const void *, const void *);
++#endif
+diff --git a/src/basic/util.h b/src/basic/util.h
+index 9f6a6ce..2c5dc32 100644
+--- a/src/basic/util.h
++++ b/src/basic/util.h
+@@ -26,6 +26,7 @@
+ #include "format-util.h"
+ #include "macro.h"
+ #include "time-util.h"
++#include "missing.h"
+ 
+ size_t page_size(void) _pure_;
+ #define PAGE_ALIGN(l) ALIGN_TO((l), page_size())
+diff --git a/src/journal/catalog.c b/src/journal/catalog.c
+index 4062f12..034e00c 100644
+--- a/src/journal/catalog.c
++++ b/src/journal/catalog.c
+@@ -26,6 +26,7 @@
+ #include "strv.h"
+ #include "tmpfile-util.h"
+ #include "util.h"
++#include "missing.h"
+ 
+ const char * const catalog_file_dirs[] = {
+         "/usr/local/lib/systemd/catalog/",
+-- 
+2.7.4
+
diff --git a/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch b/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch
index 7652a2d..bb738e2 100644
--- a/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch
+++ b/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch
@@ -1,7 +1,7 @@
-From 582af7ec13131dfcc620ed81de7b211914c4cb03 Mon Sep 17 00:00:00 2001
+From 7bcf3b166694090497a0acd2c5299e4e04fcc9b6 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
-Date: Fri, 29 Jun 2018 13:43:49 +0800
-Subject: [PATCH 04/19] add fallback parse_printf_format implementation
+Date: Mon, 25 Feb 2019 14:04:21 +0800
+Subject: [PATCH 04/24] add fallback parse_printf_format implementation
 
 Upstream-Status: Inappropriate [musl specific]
 
@@ -20,25 +20,25 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  create mode 100644 src/basic/parse-printf-format.h
 
 diff --git a/meson.build b/meson.build
-index e045b9224..8c16bc979 100644
+index 3386546..44b24ee 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -598,6 +598,7 @@ foreach header : ['crypt.h',
-                   'linux/btrfs.h',
+@@ -667,6 +667,7 @@ foreach header : ['crypt.h',
                    'linux/memfd.h',
                    'linux/vm_sockets.h',
+                   'linux/can/vxcan.h',
 +                  'printf.h',
                    'sys/auxv.h',
                    'valgrind/memcheck.h',
                    'valgrind/valgrind.h',
 diff --git a/src/basic/meson.build b/src/basic/meson.build
-index 31625b178..0c27528e7 100644
+index e5852f3..2192a0c 100644
 --- a/src/basic/meson.build
 +++ b/src/basic/meson.build
-@@ -302,6 +302,11 @@ foreach item : [['af',     af_list_txt,     'af',         ''],
+@@ -284,6 +284,11 @@ foreach item : [['af',     af_list_txt,     'af',         ''],
  endforeach
  
- basic_sources += [missing_h] + generated_gperf_headers
+ basic_sources += generated_gperf_headers
 +
 +if conf.get('HAVE_PRINTF_H') != 1
 +        basic_sources += [files('parse-printf-format.c')]
@@ -49,7 +49,7 @@ index 31625b178..0c27528e7 100644
          'gcrypt-util.h')
 diff --git a/src/basic/parse-printf-format.c b/src/basic/parse-printf-format.c
 new file mode 100644
-index 000000000..49437e544
+index 0000000..49437e5
 --- /dev/null
 +++ b/src/basic/parse-printf-format.c
 @@ -0,0 +1,273 @@
@@ -328,7 +328,7 @@ index 000000000..49437e544
 +}
 diff --git a/src/basic/parse-printf-format.h b/src/basic/parse-printf-format.h
 new file mode 100644
-index 000000000..47be7522d
+index 0000000..47be752
 --- /dev/null
 +++ b/src/basic/parse-printf-format.h
 @@ -0,0 +1,57 @@
@@ -390,10 +390,10 @@ index 000000000..47be7522d
 +
 +#endif /* HAVE_PRINTF_H */
 diff --git a/src/basic/stdio-util.h b/src/basic/stdio-util.h
-index 73c03274c..30192cd71 100644
+index dc67b6e..cf8d514 100644
 --- a/src/basic/stdio-util.h
 +++ b/src/basic/stdio-util.h
-@@ -1,12 +1,12 @@
+@@ -1,13 +1,13 @@
  /* SPDX-License-Identifier: LGPL-2.1+ */
  #pragma once
  
@@ -403,12 +403,13 @@ index 73c03274c..30192cd71 100644
  #include <sys/types.h>
  
  #include "macro.h"
+ #include "util.h"
 +#include "parse-printf-format.h"
  
  #define snprintf_ok(buf, len, fmt, ...) \
          ((size_t) snprintf(buf, len, fmt, __VA_ARGS__) < (len))
 diff --git a/src/journal/journal-send.c b/src/journal/journal-send.c
-index a0621524a..65bcbcd2e 100644
+index 8618454..3fea912 100644
 --- a/src/journal/journal-send.c
 +++ b/src/journal/journal-send.c
 @@ -2,7 +2,6 @@
@@ -420,13 +421,13 @@ index a0621524a..65bcbcd2e 100644
  #include <sys/socket.h>
  #include <sys/un.h>
 @@ -21,6 +20,7 @@
- #include "stdio-util.h"
  #include "string-util.h"
+ #include "tmpfile-util.h"
  #include "util.h"
 +#include "parse-printf-format.h"
  
  #define SNDBUF_SIZE (8*1024*1024)
  
 -- 
-2.11.0
+2.7.4
 
diff --git a/meta/recipes-core/systemd/systemd/0004-rules-whitelist-hd-devices.patch b/meta/recipes-core/systemd/systemd/0004-rules-whitelist-hd-devices.patch
index 7e37cbc..738f8eb 100644
--- a/meta/recipes-core/systemd/systemd/0004-rules-whitelist-hd-devices.patch
+++ b/meta/recipes-core/systemd/systemd/0004-rules-whitelist-hd-devices.patch
@@ -1,7 +1,7 @@
-From 5d8128f3832fd11fd046d1d1ad86c4ee7bc1dff0 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 9 Nov 2016 19:41:13 -0800
-Subject: [PATCH 4/9] rules: whitelist hd* devices
+From dc0a6a9fe4da9738efaba942233ad39da625a918 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Thu, 21 Feb 2019 16:28:21 +0800
+Subject: [PATCH 4/5] rules: whitelist hd* devices
 
 qemu by default emulates IDE and the linux-yocto kernel(s) use
 CONFIG_IDE instead of the more modern libsata, so disks appear as
@@ -11,23 +11,25 @@ Upstream-Status: Denied [https://github.com/systemd/systemd/pull/1276]
 
 Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+[rebased for systemd 241]
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 ---
  rules/60-persistent-storage.rules | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/rules/60-persistent-storage.rules b/rules/60-persistent-storage.rules
-index 8ddb7577c..811e948ad 100644
+index 1d8880e..e53c8ea 100644
 --- a/rules/60-persistent-storage.rules
 +++ b/rules/60-persistent-storage.rules
 @@ -7,7 +7,7 @@ ACTION=="remove", GOTO="persistent_storage_end"
  ENV{UDEV_DISABLE_PERSISTENT_STORAGE_RULES_FLAG}=="1", GOTO="persistent_storage_end"
  
  SUBSYSTEM!="block", GOTO="persistent_storage_end"
--KERNEL!="loop*|mmcblk*[0-9]|msblk*[0-9]|mspblk*[0-9]|nvme*|sd*|sr*|vd*|xvd*|bcache*|cciss*|dasd*|ubd*|scm*|pmem*|nbd*", GOTO="persistent_storage_end"
-+KERNEL!="loop*|mmcblk*[0-9]|msblk*[0-9]|mspblk*[0-9]|nvme*|sd*|sr*|vd*|xvd*|bcache*|cciss*|dasd*|ubd*|scm*|pmem*|nbd*|hd*", GOTO="persistent_storage_end"
+-KERNEL!="loop*|mmcblk*[0-9]|msblk*[0-9]|mspblk*[0-9]|nvme*|sd*|sr*|vd*|xvd*|bcache*|cciss*|dasd*|ubd*|scm*|pmem*|nbd*|zd*", GOTO="persistent_storage_end"
++KERNEL!="loop*|mmcblk*[0-9]|msblk*[0-9]|mspblk*[0-9]|nvme*|sd*|sr*|vd*|xvd*|bcache*|cciss*|dasd*|ubd*|scm*|pmem*|nbd*|zd*|hd*", GOTO="persistent_storage_end"
  
  # ignore partitions that span the entire disk
  TEST=="whole_disk", GOTO="persistent_storage_end"
 -- 
-2.11.0
+2.7.4
 
diff --git a/meta/recipes-core/systemd/systemd/0005-Make-root-s-home-directory-configurable.patch b/meta/recipes-core/systemd/systemd/0005-Make-root-s-home-directory-configurable.patch
deleted file mode 100644
index c137087..0000000
--- a/meta/recipes-core/systemd/systemd/0005-Make-root-s-home-directory-configurable.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From 8b82663aeeedf9ca58e3b97116b4c4da5229e0f5 Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Wed, 27 Jun 2018 16:46:45 +0800
-Subject: [PATCH 5/9] Make root's home directory configurable
-
-OpenEmbedded has a configurable home directory for root. Allow
-systemd to be built using its idea of what root's home directory
-should be.
-
-Upstream-Status: Denied
-Upstream wants to have a unified hierarchy where everyone is
-using the same root folder.
-https://github.com/systemd/systemd/issues/541
-
-Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- meson.build       | 7 +++++++
- meson_options.txt | 2 ++
- 2 files changed, 9 insertions(+)
-
-diff --git a/meson.build b/meson.build
-index 6d5edcb4e..323146fe1 100644
---- a/meson.build
-+++ b/meson.build
-@@ -89,6 +89,11 @@ if rootlibdir == ''
-         rootlibdir = join_paths(rootprefixdir, libdir.split('/')[-1])
- endif
- 
-+roothomedir = get_option('roothomedir')
-+if roothomedir == ''
-+        roothomedir = '/root'
-+endif
-+
- # Dirs of external packages
- pkgconfigdatadir = join_paths(datadir, 'pkgconfig')
- pkgconfiglibdir = join_paths(libdir, 'pkgconfig')
-@@ -210,6 +215,7 @@ conf.set_quoted('UDEVLIBEXECDIR',                             udevlibexecdir)
- conf.set_quoted('POLKIT_AGENT_BINARY_PATH',                   join_paths(bindir, 'pkttyagent'))
- conf.set_quoted('LIBDIR',                                     libdir)
- conf.set_quoted('ROOTLIBDIR',                                 rootlibdir)
-+conf.set_quoted('ROOTHOMEDIR',                                roothomedir)
- conf.set_quoted('ROOTLIBEXECDIR',                             rootlibexecdir)
- conf.set_quoted('BOOTLIBDIR',                                 bootlibdir)
- conf.set_quoted('SYSTEMD_PULL_PATH',                          join_paths(rootlibexecdir, 'systemd-pull'))
-@@ -228,6 +234,7 @@ substs.set('prefix',                                          prefixdir)
- substs.set('exec_prefix',                                     prefixdir)
- substs.set('libdir',                                          libdir)
- substs.set('rootlibdir',                                      rootlibdir)
-+substs.set('roothomedir',                                     roothomedir)
- substs.set('includedir',                                      includedir)
- substs.set('pkgsysconfdir',                                   pkgsysconfdir)
- substs.set('bindir',                                          bindir)
-diff --git a/meson_options.txt b/meson_options.txt
-index 16c1f2b2f..aa9a33368 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -9,6 +9,8 @@ option('rootlibdir', type : 'string',
-        description : '''[/usr]/lib/x86_64-linux-gnu or such''')
- option('rootprefix', type : 'string',
-        description : '''override the root prefix''')
-+option('roothomedir', type : 'string',
-+       description : '''override the root home directory''')
- option('link-udev-shared', type : 'boolean',
-        description : 'link systemd-udev and its helpers to libsystemd-shared.so')
- option('link-systemctl-shared', type: 'boolean',
--- 
-2.11.0
-
diff --git a/meta/recipes-core/systemd/systemd/0005-basic-user-util-properly-protect-use-of-gshadow.patch b/meta/recipes-core/systemd/systemd/0005-basic-user-util-properly-protect-use-of-gshadow.patch
deleted file mode 100644
index 518c05b..0000000
--- a/meta/recipes-core/systemd/systemd/0005-basic-user-util-properly-protect-use-of-gshadow.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 66a5b5ce9b991327d594f7b635de16999ca54093 Mon Sep 17 00:00:00 2001
-From: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Date: Wed, 21 Nov 2018 18:09:04 +0100
-Subject: basic/user-util: properly protect use of gshadow
-
-Commit 100d5f6ee6 (user-util: add new wrappers for [...] database
-files), ammended by commit 4f07ffa8f5 (Use #if instead of #ifdef for
-ENABLE_GSHADOW) moved code from sysuser to basic/user-util.
-
-In doing so, the combination of both commits properly propagated the
-ENABLE_GSHADOW conditions around the function manipulating gshadow, but
-they forgot to protect the inclusion of the gshadow.h header.
-
-Fix that to be able to build on C libraries that do not provide gshadow
-(e.g. uClibc-ng, where it does not exist.)
-
-Upstream-Status: Backport [https://github.com/systemd/systemd/commit/66a5b5ce9b991327d594f7b635de16999ca54093]
----
- src/basic/user-util.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/basic/user-util.h b/src/basic/user-util.h
-index b6de0e423..cc899ee76 100644
---- a/src/basic/user-util.h
-+++ b/src/basic/user-util.h
-@@ -2,7 +2,9 @@
- #pragma once
- 
- #include <grp.h>
-+#if ENABLE_GSHADOW
- #include <gshadow.h>
-+#endif
- #include <pwd.h>
- #include <shadow.h>
- #include <stdbool.h>
--- 
-2.18.1
-
diff --git a/meta/recipes-core/systemd/systemd/0007-rules-watch-metadata-changes-in-ide-devices.patch b/meta/recipes-core/systemd/systemd/0005-rules-watch-metadata-changes-in-ide-devices.patch
similarity index 78%
rename from meta/recipes-core/systemd/systemd/0007-rules-watch-metadata-changes-in-ide-devices.patch
rename to meta/recipes-core/systemd/systemd/0005-rules-watch-metadata-changes-in-ide-devices.patch
index a5f65e6..2123052 100644
--- a/meta/recipes-core/systemd/systemd/0007-rules-watch-metadata-changes-in-ide-devices.patch
+++ b/meta/recipes-core/systemd/systemd/0005-rules-watch-metadata-changes-in-ide-devices.patch
@@ -1,7 +1,7 @@
-From 9302b72e5e69512aaa7106197b00c55baeb35b3c Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Fri, 17 Nov 2017 09:46:00 +0800
-Subject: [PATCH 7/9] rules: watch metadata changes in ide devices
+From d1bccc721dd8f43fee29c5df0e9b78345e69f4b6 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Thu, 21 Feb 2019 16:38:38 +0800
+Subject: [PATCH 5/5] rules: watch metadata changes in ide devices
 
 Formatting IDE storage does not trigger "change" uevents. As a result
 clients using udev API don't get any updates afterwards and get outdated
@@ -24,20 +24,22 @@ CONFIG_IDE instead of the more modern libsata, so disks appear as
 is deprecated.
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+[rebased for systemd 241]
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 ---
  rules/60-block.rules | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/rules/60-block.rules b/rules/60-block.rules
-index 343fc06f8..b5237dac4 100644
+index a1458e9..3ba4b6b4 100644
 --- a/rules/60-block.rules
 +++ b/rules/60-block.rules
 @@ -8,4 +8,4 @@ ACTION=="add", SUBSYSTEM=="module", KERNEL=="block", ATTR{parameters/events_dfl_
  ACTION=="change", SUBSYSTEM=="scsi", ENV{DEVTYPE}=="scsi_device", TEST=="block", ATTR{block/*/uevent}="change"
  
  # watch metadata changes, caused by tools closing the device node which was opened for writing
--ACTION!="remove", SUBSYSTEM=="block", KERNEL=="loop*|nvme*|sd*|vd*|xvd*|pmem*|mmcblk*", OPTIONS+="watch"
-+ACTION!="remove", SUBSYSTEM=="block", KERNEL=="loop*|nvme*|sd*|vd*|xvd*|pmem*|mmcblk*|hd*", OPTIONS+="watch"
+-ACTION!="remove", SUBSYSTEM=="block", KERNEL=="loop*|nvme*|sd*|vd*|xvd*|pmem*|mmcblk*|dasd*", OPTIONS+="watch"
++ACTION!="remove", SUBSYSTEM=="block", KERNEL=="loop*|nvme*|sd*|vd*|xvd*|pmem*|mmcblk*|dasd*|hd*", OPTIONS+="watch"
 -- 
-2.11.0
+2.7.4
 
diff --git a/meta/recipes-core/systemd/systemd/0006-src-basic-missing.h-check-for-missing-strndupa.patch b/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
similarity index 65%
rename from meta/recipes-core/systemd/systemd/0006-src-basic-missing.h-check-for-missing-strndupa.patch
rename to meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
index 107a794..f20897b 100644
--- a/meta/recipes-core/systemd/systemd/0006-src-basic-missing.h-check-for-missing-strndupa.patch
+++ b/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
@@ -1,7 +1,7 @@
-From 03fd19fc87573276e0d359260c8fe591f5f0216a Mon Sep 17 00:00:00 2001
+From 399fd3eda3045636a70da438a0fd1406cc332ed1 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
-Date: Fri, 29 Jun 2018 16:34:50 +0800
-Subject: [PATCH 06/19] src/basic/missing.h: check for missing strndupa
+Date: Mon, 25 Feb 2019 14:18:21 +0800
+Subject: [PATCH 05/24] src/basic/missing.h: check for missing strndupa
 
 include missing.h  for definition of strndupa
 
@@ -10,20 +10,20 @@ Upstream-Status: Inappropriate [musl specific]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 ---
- meson.build             |  1 +
- src/basic/missing.h     | 11 +++++++++++
- src/basic/mkdir.c       |  1 +
- src/basic/pager.c       |  1 +
- src/basic/parse-util.c  |  1 +
- src/basic/procfs-util.c |  1 +
- src/shared/uid-range.c  |  1 +
- 7 files changed, 17 insertions(+)
+ meson.build                |  1 +
+ src/basic/missing_stdlib.h | 12 ++++++++++++
+ src/basic/mkdir.c          |  1 +
+ src/basic/parse-util.c     |  1 +
+ src/basic/procfs-util.c    |  1 +
+ src/shared/pager.c         |  1 +
+ src/shared/uid-range.c     |  1 +
+ 7 files changed, 18 insertions(+)
 
 diff --git a/meson.build b/meson.build
-index 8c16bc979..a734a295c 100644
+index 44b24ee..70fb218 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -503,6 +503,7 @@ foreach ident : [
+@@ -558,6 +558,7 @@ foreach ident : [
                                   #include <unistd.h>'''],
          ['explicit_bzero' ,   '''#include <string.h>'''],
          ['reallocarray',      '''#include <malloc.h>'''],
@@ -31,14 +31,16 @@ index 8c16bc979..a734a295c 100644
  ]
  
          have = cc.has_function(ident[0], prefix : ident[1], args : '-D_GNU_SOURCE')
-diff --git a/src/basic/missing.h b/src/basic/missing.h
-index 0e33abb9f..02397f1b6 100644
---- a/src/basic/missing.h
-+++ b/src/basic/missing.h
-@@ -1184,6 +1184,17 @@ struct input_mask {
- typedef int32_t key_serial_t;
+diff --git a/src/basic/missing_stdlib.h b/src/basic/missing_stdlib.h
+index c0ffe86..d50274b 100644
+--- a/src/basic/missing_stdlib.h
++++ b/src/basic/missing_stdlib.h
+@@ -11,3 +11,15 @@
+ #    define secure_getenv getenv
+ #  endif
  #endif
- 
++
++/* string.h */
 +#if ! HAVE_STRNDUPA
 +#define strndupa(s, n) \
 +  ({ \
@@ -49,12 +51,8 @@ index 0e33abb9f..02397f1b6 100644
 +    (char *)memcpy(__new, __old, __len); \
 +  })
 +#endif
-+
- #ifndef KEYCTL_JOIN_SESSION_KEYRING
- #define KEYCTL_JOIN_SESSION_KEYRING 1
- #endif
 diff --git a/src/basic/mkdir.c b/src/basic/mkdir.c
-index 6ab1b4422..77c3e0863 100644
+index 4bb65d5..3038ab9 100644
 --- a/src/basic/mkdir.c
 +++ b/src/basic/mkdir.c
 @@ -13,6 +13,7 @@
@@ -65,32 +63,20 @@ index 6ab1b4422..77c3e0863 100644
  
  int mkdir_safe_internal(const char *path, mode_t mode, uid_t uid, gid_t gid, MkdirFlags flags, mkdir_func_t _mkdir) {
          struct stat st;
-diff --git a/src/basic/pager.c b/src/basic/pager.c
-index f24126111..8223bff02 100644
---- a/src/basic/pager.c
-+++ b/src/basic/pager.c
-@@ -21,6 +21,7 @@
- #include "string-util.h"
- #include "strv.h"
- #include "terminal-util.h"
-+#include "missing.h"
- 
- static pid_t pager_pid = 0;
- 
 diff --git a/src/basic/parse-util.c b/src/basic/parse-util.c
-index 6becf8587..52576f536 100644
+index 87724af..d9c53bc 100644
 --- a/src/basic/parse-util.c
 +++ b/src/basic/parse-util.c
-@@ -17,6 +17,7 @@
- #include "parse-util.h"
+@@ -19,6 +19,7 @@
  #include "process-util.h"
+ #include "stat-util.h"
  #include "string-util.h"
 +#include "missing.h"
  
  int parse_boolean(const char *v) {
-         assert(v);
+         if (!v)
 diff --git a/src/basic/procfs-util.c b/src/basic/procfs-util.c
-index a159e344b..ebc427d6b 100644
+index 7aaf95b..42ce53d 100644
 --- a/src/basic/procfs-util.c
 +++ b/src/basic/procfs-util.c
 @@ -11,6 +11,7 @@
@@ -101,18 +87,30 @@ index a159e344b..ebc427d6b 100644
  
  int procfs_tasks_get_limit(uint64_t *ret) {
          _cleanup_free_ char *value = NULL;
+diff --git a/src/shared/pager.c b/src/shared/pager.c
+index bf2597e..fa9e321 100644
+--- a/src/shared/pager.c
++++ b/src/shared/pager.c
+@@ -24,6 +24,7 @@
+ #include "string-util.h"
+ #include "strv.h"
+ #include "terminal-util.h"
++#include "missing.h"
+ 
+ static pid_t pager_pid = 0;
+ 
 diff --git a/src/shared/uid-range.c b/src/shared/uid-range.c
-index 434ce6ff4..37093ab7b 100644
+index 5fa7bd2..9c63b9e 100644
 --- a/src/shared/uid-range.c
 +++ b/src/shared/uid-range.c
-@@ -8,6 +8,7 @@
- #include "macro.h"
+@@ -9,6 +9,7 @@
  #include "uid-range.h"
  #include "user-util.h"
+ #include "util.h"
 +#include "missing.h"
  
  static bool uid_range_intersect(UidRange *range, uid_t start, uid_t nr) {
          assert(range);
 -- 
-2.11.0
+2.7.4
 
diff --git a/meta/recipes-core/systemd/systemd/0007-Include-netinet-if_ether.h.patch b/meta/recipes-core/systemd/systemd/0006-Include-netinet-if_ether.h.patch
similarity index 85%
rename from meta/recipes-core/systemd/systemd/0007-Include-netinet-if_ether.h.patch
rename to meta/recipes-core/systemd/systemd/0006-Include-netinet-if_ether.h.patch
index 2df8cf9..b41f6c7 100644
--- a/meta/recipes-core/systemd/systemd/0007-Include-netinet-if_ether.h.patch
+++ b/meta/recipes-core/systemd/systemd/0006-Include-netinet-if_ether.h.patch
@@ -1,7 +1,7 @@
-From aab90d0dfa934d33879eaec1a878e93b201d33f1 Mon Sep 17 00:00:00 2001
+From 67a988ae82c776d11be76de7180d50ea027ac442 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
-Date: Fri, 29 Jun 2018 16:44:43 +0800
-Subject: [PATCH 07/19] Include netinet/if_ether.h
+Date: Mon, 25 Feb 2019 14:24:20 +0800
+Subject: [PATCH 06/24] Include netinet/if_ether.h
 
 Fixes
 /path/to/systemd/recipe-sysroot/usr/include/netinet/if_ether.h:101:8: error: redefinition of 'struct ethhdr'
@@ -22,7 +22,7 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  6 files changed, 6 insertions(+)
 
 diff --git a/src/libsystemd/sd-netlink/netlink-types.c b/src/libsystemd/sd-netlink/netlink-types.c
-index c93fe9cb4..2013d06e1 100644
+index 9dcd3f2..e23ff4c 100644
 --- a/src/libsystemd/sd-netlink/netlink-types.c
 +++ b/src/libsystemd/sd-netlink/netlink-types.c
 @@ -3,6 +3,7 @@
@@ -34,7 +34,7 @@ index c93fe9cb4..2013d06e1 100644
  #include <linux/rtnetlink.h>
  #include <linux/genetlink.h>
 diff --git a/src/network/netdev/tuntap.c b/src/network/netdev/tuntap.c
-index 21fb7ab06..0afe5170c 100644
+index 951138d..1ad499d 100644
 --- a/src/network/netdev/tuntap.c
 +++ b/src/network/netdev/tuntap.c
 @@ -2,6 +2,7 @@
@@ -46,7 +46,7 @@ index 21fb7ab06..0afe5170c 100644
  #include <net/if.h>
  #include <netinet/if_ether.h>
 diff --git a/src/network/networkd-brvlan.c b/src/network/networkd-brvlan.c
-index 8e8a618e2..52d523a67 100644
+index 8377623..132af60 100644
 --- a/src/network/networkd-brvlan.c
 +++ b/src/network/networkd-brvlan.c
 @@ -4,6 +4,7 @@
@@ -58,7 +58,7 @@ index 8e8a618e2..52d523a67 100644
  #include <stdbool.h>
  
 diff --git a/src/udev/net/ethtool-util.c b/src/udev/net/ethtool-util.c
-index 4bb4216ac..5f7383483 100644
+index 0dcec03..3695b10 100644
 --- a/src/udev/net/ethtool-util.c
 +++ b/src/udev/net/ethtool-util.c
 @@ -1,5 +1,6 @@
@@ -69,28 +69,28 @@ index 4bb4216ac..5f7383483 100644
  #include <sys/ioctl.h>
  #include <linux/ethtool.h>
 diff --git a/src/udev/net/ethtool-util.h b/src/udev/net/ethtool-util.h
-index 064bf4d2b..ee0d4fb2a 100644
+index 618b26b..ebfe82a 100644
 --- a/src/udev/net/ethtool-util.h
 +++ b/src/udev/net/ethtool-util.h
-@@ -3,6 +3,7 @@
- 
+@@ -2,6 +2,7 @@
+ #pragma once
  
  #include <macro.h>
 +#include <netinet/if_ether.h>
  #include <linux/ethtool.h>
  
- #include "missing.h"
+ #include "conf-parser.h"
 diff --git a/src/udev/udev-builtin-net_setup_link.c b/src/udev/udev-builtin-net_setup_link.c
-index 8bed6399a..a3a96959b 100644
+index a845dfa..177289a 100644
 --- a/src/udev/udev-builtin-net_setup_link.c
 +++ b/src/udev/udev-builtin-net_setup_link.c
 @@ -1,5 +1,6 @@
  /* SPDX-License-Identifier: LGPL-2.1+ */
  
 +#include <netinet/if_ether.h>
+ #include "device-util.h"
  #include "alloc-util.h"
  #include "link-config.h"
- #include "log.h"
 -- 
-2.11.0
+2.7.4
 
diff --git a/meta/recipes-core/systemd/systemd/0006-remove-nobody-user-group-checking.patch b/meta/recipes-core/systemd/systemd/0006-remove-nobody-user-group-checking.patch
deleted file mode 100644
index eb6eb8b..0000000
--- a/meta/recipes-core/systemd/systemd/0006-remove-nobody-user-group-checking.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 5199ae5dec9b8a9c9e20477d5090f1732735fbe2 Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Thu, 28 Jun 2018 09:38:12 +0800
-Subject: [PATCH 6/9] remove nobody user/group checking
-
-Upstream-Status: Inappropriate [OE Specific]
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- meson.build | 37 -------------------------------------
- 1 file changed, 37 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index 323146fe1..3bb087fef 100644
---- a/meson.build
-+++ b/meson.build
-@@ -681,43 +681,6 @@ substs.set('containeruidbasemax', container_uid_base_max)
- nobody_user = get_option('nobody-user')
- nobody_group = get_option('nobody-group')
- 
--getent_result = run_command('getent', 'passwd', '65534')
--if getent_result.returncode() == 0
--        name = getent_result.stdout().split(':')[0]
--        if name != nobody_user
--                warning('\n' +
--                        'The local user with the UID 65534 does not match the configured user name "@0@" of the nobody user (its name is @1@).\n'.format(nobody_user, name) +
--                        'Your build will result in an user table setup that is incompatible with the local system.')
--        endif
--endif
--id_result = run_command('id', '-u', nobody_user)
--if id_result.returncode() == 0
--        id = id_result.stdout().to_int()
--        if id != 65534
--                warning('\n' +
--                        'The local user with the configured user name "@0@" of the nobody user does not have UID 65534 (it has @1@).\n'.format(nobody_user, id) +
--                        'Your build will result in an user table setup that is incompatible with the local system.')
--        endif
--endif
--
--getent_result = run_command('getent', 'group', '65534')
--if getent_result.returncode() == 0
--        name = getent_result.stdout().split(':')[0]
--        if name != nobody_group
--                warning('\n' +
--                        'The local group with the GID 65534 does not match the configured group name "@0@" of the nobody group (its name is @1@).\n'.format(nobody_group, name) +
--                        'Your build will result in an group table setup that is incompatible with the local system.')
--        endif
--endif
--id_result = run_command('id', '-g', nobody_group)
--if id_result.returncode() == 0
--        id = id_result.stdout().to_int()
--        if id != 65534
--                warning('\n' +
--                        'The local group with the configured group name "@0@" of the nobody group does not have UID 65534 (it has @1@).\n'.format(nobody_group, id) +
--                        'Your build will result in an group table setup that is incompatible with the local system.')
--        endif
--endif
- if nobody_user != nobody_group and not (nobody_user == 'nobody' and nobody_group == 'nogroup')
-         warning('\n' +
-                 'The configured user name "@0@" and group name "@0@" of the nobody user/group are not equivalent.\n'.format(nobody_user, nobody_group) +
--- 
-2.11.0
-
diff --git a/meta/recipes-core/systemd/systemd/0008-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch b/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not.patch
similarity index 81%
rename from meta/recipes-core/systemd/systemd/0008-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
rename to meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not.patch
index bee5fb6..765e476 100644
--- a/meta/recipes-core/systemd/systemd/0008-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
+++ b/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not.patch
@@ -1,7 +1,7 @@
-From 848e711d719a6d987bc7d14183e1c7b1f1c91c56 Mon Sep 17 00:00:00 2001
+From f8a239b182158ca0a537ba053cb0e6bad9c3a2fb Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
-Date: Fri, 29 Jun 2018 17:10:29 +0800
-Subject: [PATCH 08/19] don't fail if GLOB_BRACE and GLOB_ALTDIRFUNC is not
+Date: Mon, 25 Feb 2019 14:56:21 +0800
+Subject: [PATCH 07/24] don't fail if GLOB_BRACE and GLOB_ALTDIRFUNC is not 
  defined
 
 If the standard library doesn't provide brace
@@ -16,13 +16,13 @@ Upstream-Status: Inappropriate [musl specific]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 ---
- src/basic/glob-util.c     | 13 +++++++++++--
- src/test/test-glob-util.c | 15 +++++++++++++++
- src/tmpfiles/tmpfiles.c   | 10 ++++++++++
- 3 files changed, 36 insertions(+), 2 deletions(-)
+ src/basic/glob-util.c     | 12 +++++++++++-
+ src/test/test-glob-util.c | 17 +++++++++++++++--
+ src/tmpfiles/tmpfiles.c   |  9 +++++++++
+ 3 files changed, 35 insertions(+), 3 deletions(-)
 
 diff --git a/src/basic/glob-util.c b/src/basic/glob-util.c
-index 9fac676f2..8adb9559e 100644
+index 9fac676..962d8b9 100644
 --- a/src/basic/glob-util.c
 +++ b/src/basic/glob-util.c
 @@ -10,6 +10,11 @@
@@ -45,12 +45,12 @@ index 9fac676f2..8adb9559e 100644
          /* We want to set GLOB_ALTDIRFUNC ourselves, don't allow it to be set. */
          assert(!(flags & GLOB_ALTDIRFUNC));
  
-@@ -31,10 +37,13 @@ int safe_glob(const char *path, int flags, glob_t *pglob) {
+@@ -31,10 +37,14 @@ int safe_glob(const char *path, int flags, glob_t *pglob) {
                  pglob->gl_lstat = lstat;
          if (!pglob->gl_stat)
                  pglob->gl_stat = stat;
--
 +#endif
+ 
          errno = 0;
 +#ifdef GLOB_ALTDIRFUNC
          k = glob(path, flags | GLOB_ALTDIRFUNC, NULL, pglob);
@@ -62,13 +62,13 @@ index 9fac676f2..8adb9559e 100644
                  return -ENOENT;
          if (k == GLOB_NOSPACE)
 diff --git a/src/test/test-glob-util.c b/src/test/test-glob-util.c
-index d78d6223c..f5943b26d 100644
+index b4f4144..955b3ba 100644
 --- a/src/test/test-glob-util.c
 +++ b/src/test/test-glob-util.c
 @@ -12,6 +12,11 @@
- #include "glob-util.h"
  #include "macro.h"
  #include "rm-rf.h"
+ #include "tmpfile-util.h"
 +/* Don't fail if the standard library
 + * doesn't provide brace expansion */
 +#ifndef GLOB_BRACE
@@ -77,9 +77,11 @@ index d78d6223c..f5943b26d 100644
  
  static void test_glob_exists(void) {
          char name[] = "/tmp/test-glob_exists.XXXXXX";
-@@ -40,11 +45,13 @@ static void test_glob_no_dot(void) {
+@@ -38,25 +43,33 @@ static void closedir_wrapper(void* v) {
+ static void test_glob_no_dot(void) {
+         char template[] = "/tmp/test-glob-util.XXXXXXX";
          const char *fn;
- 
+-
          _cleanup_globfree_ glob_t g = {
 +#ifdef GLOB_ALTDIRFUNC
                  .gl_closedir = closedir_wrapper,
@@ -89,9 +91,9 @@ index d78d6223c..f5943b26d 100644
                  .gl_stat = stat,
 +#endif
          };
- 
+-
          int r;
-@@ -52,11 +59,19 @@ static void test_glob_no_dot(void) {
+ 
          assert_se(mkdtemp(template));
  
          fn = strjoina(template, "/*");
@@ -112,23 +114,22 @@ index d78d6223c..f5943b26d 100644
  
          (void) rm_rf(template, REMOVE_ROOT|REMOVE_PHYSICAL);
 diff --git a/src/tmpfiles/tmpfiles.c b/src/tmpfiles/tmpfiles.c
-index 927de35f3..5f0283da5 100644
+index b66765b..11dbbf4 100644
 --- a/src/tmpfiles/tmpfiles.c
 +++ b/src/tmpfiles/tmpfiles.c
-@@ -60,6 +60,12 @@
+@@ -60,6 +60,11 @@
+ #include "umask-util.h"
  #include "user-util.h"
  #include "util.h"
- 
 +/* Don't fail if the standard library
 + * doesn't provide brace expansion */
 +#ifndef GLOB_BRACE
 +#define GLOB_BRACE 0
 +#endif
-+
+ 
  /* This reads all files listed in /etc/tmpfiles.d/?*.conf and creates
   * them in the file system. This is intended to be used to create
-  * properly owned directories beneath /tmp, /var/tmp, /run, which are
-@@ -1345,7 +1351,9 @@ finish:
+@@ -1853,7 +1858,9 @@ finish:
  
  static int glob_item(Item *i, action_t action) {
          _cleanup_globfree_ glob_t g = {
@@ -138,7 +139,7 @@ index 927de35f3..5f0283da5 100644
          };
          int r = 0, k;
          char **fn;
-@@ -1365,7 +1373,9 @@ static int glob_item(Item *i, action_t action) {
+@@ -1873,7 +1880,9 @@ static int glob_item(Item *i, action_t action) {
  
  static int glob_item_recursively(Item *i, fdaction_t action) {
          _cleanup_globfree_ glob_t g = {
@@ -149,5 +150,5 @@ index 927de35f3..5f0283da5 100644
          int r = 0, k;
          char **fn;
 -- 
-2.11.0
+2.7.4
 
diff --git a/meta/recipes-core/systemd/systemd/0008-Do-not-enable-nss-tests-if-nss-systemd-is-not-enable.patch b/meta/recipes-core/systemd/systemd/0008-Do-not-enable-nss-tests-if-nss-systemd-is-not-enable.patch
deleted file mode 100644
index abecdc7..0000000
--- a/meta/recipes-core/systemd/systemd/0008-Do-not-enable-nss-tests-if-nss-systemd-is-not-enable.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From b6ba596fd1313a162cdc2eb88161dcf24d19ede7 Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Thu, 28 Jun 2018 10:10:02 +0800
-Subject: [PATCH 8/9] Do not enable nss tests if nss-systemd is not enabled
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- src/test/meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/test/meson.build b/src/test/meson.build
-index 7da7e3a22..7b7c257ff 100644
---- a/src/test/meson.build
-+++ b/src/test/meson.build
-@@ -645,7 +645,7 @@ tests += [
-         [['src/test/test-nss.c'],
-          [],
-          [libdl],
--         '', 'manual'],
-+         'ENABLE_NSS_SYSTEMD', 'manual'],
- 
-         [['src/test/test-umount.c',
-           'src/core/mount-setup.c',
--- 
-2.11.0
-
diff --git a/meta/recipes-core/systemd/systemd/0009-add-missing-FTW_-macros-for-musl.patch b/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch
similarity index 50%
rename from meta/recipes-core/systemd/systemd/0009-add-missing-FTW_-macros-for-musl.patch
rename to meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch
index 95287cce..d5f2349 100644
--- a/meta/recipes-core/systemd/systemd/0009-add-missing-FTW_-macros-for-musl.patch
+++ b/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch
@@ -1,7 +1,7 @@
-From acc2c08082795802011e3c5f8626d63210021489 Mon Sep 17 00:00:00 2001
+From 6cd17c753d2c0a90fc791f69bbc694cbc8556a4f Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
-Date: Wed, 28 Feb 2018 21:36:32 -0800
-Subject: [PATCH 09/19] add missing FTW_ macros for musl
+Date: Mon, 25 Feb 2019 15:00:06 +0800
+Subject: [PATCH 08/24] add missing FTW_ macros for musl
 
 This is to avoid build failures like below for musl.
 
@@ -11,17 +11,18 @@ Upstream-Status: Inappropriate [musl specific]
 
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 ---
- src/basic/missing.h | 20 ++++++++++++++++++++
+ src/basic/missing_type.h | 20 ++++++++++++++++++++
  1 file changed, 20 insertions(+)
 
-diff --git a/src/basic/missing.h b/src/basic/missing.h
-index 02397f1b6..6dc750eba 100644
---- a/src/basic/missing.h
-+++ b/src/basic/missing.h
-@@ -189,6 +189,26 @@ struct sockaddr_vm {
- #define BTRFS_QGROUP_LEVEL_SHIFT 48
+diff --git a/src/basic/missing_type.h b/src/basic/missing_type.h
+index c487e65..23602eb 100644
+--- a/src/basic/missing_type.h
++++ b/src/basic/missing_type.h
+@@ -19,3 +19,23 @@ typedef int (*comparison_fn_t)(const void *, const void *);
+ #define __COMPAR_FN_T
+ typedef int (*__compar_fn_t)(const void *, const void *);
  #endif
- 
++
 +#ifndef FTW_ACTIONRETVAL
 +#define FTW_ACTIONRETVAL 16
 +#endif
@@ -41,10 +42,6 @@ index 02397f1b6..6dc750eba 100644
 +#ifndef FTW_SKIP_SIBLINGS
 +#define FTW_SKIP_SIBLINGS 3
 +#endif
-+
- #if ! HAVE_LINUX_BTRFS_H
- #define BTRFS_IOC_QGROUP_ASSIGN _IOW(BTRFS_IOCTL_MAGIC, 41, \
-                                struct btrfs_ioctl_qgroup_assign_args)
 -- 
-2.11.0
+2.7.4
 
diff --git a/meta/recipes-core/systemd/systemd/0009-nss-mymachines-Build-conditionally-when-ENABLE_MYHOS.patch b/meta/recipes-core/systemd/systemd/0009-nss-mymachines-Build-conditionally-when-ENABLE_MYHOS.patch
deleted file mode 100644
index a635fa9..0000000
--- a/meta/recipes-core/systemd/systemd/0009-nss-mymachines-Build-conditionally-when-ENABLE_MYHOS.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From f9625b5f3fd5dac3f3591dbeeb24dc9d6fda790d Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Tue, 27 Feb 2018 12:56:21 +0800
-Subject: [PATCH 9/9] nss-mymachines: Build conditionally when
- ENABLE_MYHOSTNAME is set
-
-Fixes build failures when building with --disable-myhostname
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- meson.build | 11 +++++++----
- 1 file changed, 7 insertions(+), 4 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index 3bb087fef..73bd70b0b 100644
---- a/meson.build
-+++ b/meson.build
-@@ -1371,12 +1371,15 @@ test_dlopen = executable(
-         link_with : [libbasic],
-         dependencies : [libdl])
- 
--foreach tuple : [['myhostname', 'ENABLE_MYHOSTNAME'],
--                 ['systemd',    'ENABLE_NSS_SYSTEMD'],
--                 ['mymachines', 'ENABLE_MACHINED'],
--                 ['resolve',    'ENABLE_RESOLVE']]
-+foreach tuple : [['myhostname', 'ENABLE_MYHOSTNAME',  ''],
-+                 ['systemd',    'ENABLE_NSS_SYSTEMD', ''],
-+                 ['mymachines', 'ENABLE_MACHINED',    'ENABLE_MYHOSTNAME'],
-+                 ['resolve',    'ENABLE_RESOLVE',     '']]
- 
-         condition = tuple[1] == '' or conf.get(tuple[1]) == 1
-+        if tuple[2] != '' and condition
-+                condition = conf.get(tuple[2]) == 1
-+        endif
-         if condition
-                 module = tuple[0]
- 
--- 
-2.11.0
-
diff --git a/meta/recipes-core/systemd/systemd/0010-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch b/meta/recipes-core/systemd/systemd/0009-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch
similarity index 80%
rename from meta/recipes-core/systemd/systemd/0010-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch
rename to meta/recipes-core/systemd/systemd/0009-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch
index 1654798..57cb5f3 100644
--- a/meta/recipes-core/systemd/systemd/0010-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch
+++ b/meta/recipes-core/systemd/systemd/0009-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch
@@ -1,7 +1,7 @@
-From a0bd587300744dbb8e9cfbb043233670ce781c98 Mon Sep 17 00:00:00 2001
+From 6a2cadd6b70cb40ac74fc0d0f8557b914bd38ac2 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 2 Jul 2018 13:22:41 +0800
-Subject: [PATCH 10/19] socket-util: don't fail if libc doesn't support IDN
+Subject: [PATCH 09/24] socket-util: don't fail if libc doesn't support IDN
 
 Upstream-Status: Inappropriate [musl specific]
 
@@ -13,10 +13,10 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 10 insertions(+)
 
 diff --git a/src/basic/socket-util.c b/src/basic/socket-util.c
-index a913102e1..0d0154805 100644
+index 91bf801..c445fea 100644
 --- a/src/basic/socket-util.c
 +++ b/src/basic/socket-util.c
-@@ -32,6 +32,16 @@
+@@ -33,6 +33,16 @@
  #include "utf8.h"
  #include "util.h"
  
@@ -34,5 +34,5 @@ index a913102e1..0d0154805 100644
  #  define IDN_FLAGS NI_IDN
  #else
 -- 
-2.11.0
+2.7.4
 
diff --git a/meta/recipes-core/systemd/systemd/0012-fix-missing-of-__register_atfork-for-non-glibc-build.patch b/meta/recipes-core/systemd/systemd/0010-fix-missing-of-__register_atfork-for-non-glibc-build.patch
similarity index 75%
rename from meta/recipes-core/systemd/systemd/0012-fix-missing-of-__register_atfork-for-non-glibc-build.patch
rename to meta/recipes-core/systemd/systemd/0010-fix-missing-of-__register_atfork-for-non-glibc-build.patch
index d41bc4a..8bacd02 100644
--- a/meta/recipes-core/systemd/systemd/0012-fix-missing-of-__register_atfork-for-non-glibc-build.patch
+++ b/meta/recipes-core/systemd/systemd/0010-fix-missing-of-__register_atfork-for-non-glibc-build.patch
@@ -1,7 +1,7 @@
-From 1fadf805cb391e3bcbd9a0286a9e4b7adb9e7427 Mon Sep 17 00:00:00 2001
+From f1f4b4f9684fed185bfa8b9ed409cdf241657e99 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
-Date: Mon, 2 Jul 2018 13:34:09 +0800
-Subject: [PATCH 12/19] fix missing of __register_atfork for non-glibc builds
+Date: Mon, 25 Feb 2019 15:03:47 +0800
+Subject: [PATCH 10/24] fix missing of __register_atfork for non-glibc builds
 
 Upstream-Status: Inappropriate [musl specific]
 
@@ -11,7 +11,7 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 7 insertions(+)
 
 diff --git a/src/basic/process-util.c b/src/basic/process-util.c
-index 0a4f917cb..3543bc045 100644
+index 78ce43b..aec2daf 100644
 --- a/src/basic/process-util.c
 +++ b/src/basic/process-util.c
 @@ -22,6 +22,9 @@
@@ -24,7 +24,7 @@ index 0a4f917cb..3543bc045 100644
  
  #include "alloc-util.h"
  #include "architecture.h"
-@@ -1150,11 +1153,15 @@ void reset_cached_pid(void) {
+@@ -1160,11 +1163,15 @@ void reset_cached_pid(void) {
          cached_pid = CACHED_PID_UNSET;
  }
  
@@ -32,8 +32,8 @@ index 0a4f917cb..3543bc045 100644
  /* We use glibc __register_atfork() + __dso_handle directly here, as they are not included in the glibc
   * headers. __register_atfork() is mostly equivalent to pthread_atfork(), but doesn't require us to link against
   * libpthread, as it is part of glibc anyway. */
- extern int __register_atfork(void (*prepare) (void), void (*parent) (void), void (*child) (void), void * __dso_handle);
- extern void* __dso_handle __attribute__ ((__weak__));
+ extern int __register_atfork(void (*prepare) (void), void (*parent) (void), void (*child) (void), void *dso_handle);
+ extern void* __dso_handle _weak_;
 +#else
 +#define __register_atfork(prepare,parent,child,dso) pthread_atfork(prepare,parent,child)
 +#endif
@@ -41,5 +41,5 @@ index 0a4f917cb..3543bc045 100644
  pid_t getpid_cached(void) {
          static bool installed = false;
 -- 
-2.11.0
+2.7.4
 
diff --git a/meta/recipes-core/systemd/systemd/0013-Use-uintmax_t-for-handling-rlim_t.patch b/meta/recipes-core/systemd/systemd/0011-Use-uintmax_t-for-handling-rlim_t.patch
similarity index 62%
rename from meta/recipes-core/systemd/systemd/0013-Use-uintmax_t-for-handling-rlim_t.patch
rename to meta/recipes-core/systemd/systemd/0011-Use-uintmax_t-for-handling-rlim_t.patch
index 69b3c15..d6eda9c 100644
--- a/meta/recipes-core/systemd/systemd/0013-Use-uintmax_t-for-handling-rlim_t.patch
+++ b/meta/recipes-core/systemd/systemd/0011-Use-uintmax_t-for-handling-rlim_t.patch
@@ -1,7 +1,7 @@
-From a0ac0cfd90af6431c64d1b276f422a2092d569b3 Mon Sep 17 00:00:00 2001
+From e3f847bd0338d27aff3335b42661d8a4b66b965e Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
-Date: Mon, 2 Jul 2018 13:44:21 +0800
-Subject: [PATCH 13/19] Use uintmax_t for handling rlim_t
+Date: Mon, 25 Feb 2019 15:12:41 +0800
+Subject: [PATCH 11/24] Use uintmax_t for handling rlim_t
 
 PRIu{32,64} is not right format to represent rlim_t type
 therefore use %ju and typecast the rlim_t variables to
@@ -18,18 +18,19 @@ execute.c:3446:36: error: format '%lu' expects argument of type 'long unsigned i
 Upstream-Status: Denied [https://github.com/systemd/systemd/pull/7199]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+[Rebased for v241]
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 ---
- src/basic/format-util.h | 8 --------
- src/basic/rlimit-util.c | 8 ++++----
- src/core/execute.c      | 8 ++++----
- 3 files changed, 8 insertions(+), 16 deletions(-)
+ src/basic/format-util.h |  8 +-------
+ src/basic/rlimit-util.c | 10 +++++-----
+ src/core/execute.c      |  4 ++--
+ 3 files changed, 8 insertions(+), 14 deletions(-)
 
 diff --git a/src/basic/format-util.h b/src/basic/format-util.h
-index 160550cd6..61245d1e3 100644
+index dece5d3..dbb87bc 100644
 --- a/src/basic/format-util.h
 +++ b/src/basic/format-util.h
-@@ -43,14 +43,6 @@
+@@ -42,13 +42,7 @@
  #  define PRI_TIMEX "li"
  #endif
  
@@ -40,51 +41,57 @@ index 160550cd6..61245d1e3 100644
 -#else
 -#  error Unknown rlim_t size
 -#endif
--
++#define RLIM_FMT "%ju"
+ 
  #if SIZEOF_DEV_T == 8
  #  define DEV_FMT "%" PRIu64
- #elif SIZEOF_DEV_T == 4
 diff --git a/src/basic/rlimit-util.c b/src/basic/rlimit-util.c
-index be1ba615e..e328ce499 100644
+index 74b3a02..b02c03c 100644
 --- a/src/basic/rlimit-util.c
 +++ b/src/basic/rlimit-util.c
-@@ -299,13 +299,13 @@ int rlimit_format(const struct rlimit *rl, char **ret) {
+@@ -307,13 +307,13 @@ int rlimit_format(const struct rlimit *rl, char **ret) {
          if (rl->rlim_cur >= RLIM_INFINITY && rl->rlim_max >= RLIM_INFINITY)
                  s = strdup("infinity");
          else if (rl->rlim_cur >= RLIM_INFINITY)
 -                (void) asprintf(&s, "infinity:" RLIM_FMT, rl->rlim_max);
-+                (void) asprintf(&s, "infinity:%ju", (uintmax_t)rl->rlim_max);
++                (void) asprintf(&s, "infinity:" RLIM_FMT, (uintmax_t)rl->rlim_max);
          else if (rl->rlim_max >= RLIM_INFINITY)
 -                (void) asprintf(&s, RLIM_FMT ":infinity", rl->rlim_cur);
-+                (void) asprintf(&s, "%ju:infinity", (uintmax_t)rl->rlim_cur);
++                (void) asprintf(&s, RLIM_FMT ":infinity", (uintmax_t)rl->rlim_cur);
          else if (rl->rlim_cur == rl->rlim_max)
 -                (void) asprintf(&s, RLIM_FMT, rl->rlim_cur);
-+                (void) asprintf(&s, "%ju", (uintmax_t)rl->rlim_cur);
++                (void) asprintf(&s, RLIM_FMT, (uintmax_t)rl->rlim_cur);
          else
 -                (void) asprintf(&s, RLIM_FMT ":" RLIM_FMT, rl->rlim_cur, rl->rlim_max);
-+                (void) asprintf(&s, "%ju:%ju", (uintmax_t)rl->rlim_cur, (uintmax_t)rl->rlim_max);
++                (void) asprintf(&s, RLIM_FMT ":" RLIM_FMT, (uintmax_t)rl->rlim_cur, (uintmax_t)rl->rlim_max);
  
          if (!s)
                  return -ENOMEM;
+@@ -404,7 +404,7 @@ int rlimit_nofile_safe(void) {
+ 
+         rl.rlim_cur = FD_SETSIZE;
+         if (setrlimit(RLIMIT_NOFILE, &rl) < 0)
+-                return log_debug_errno(errno, "Failed to lower RLIMIT_NOFILE's soft limit to " RLIM_FMT ": %m", rl.rlim_cur);
++                return log_debug_errno(errno, "Failed to lower RLIMIT_NOFILE's soft limit to " RLIM_FMT ": %m", (uintmax_t)rl.rlim_cur);
+ 
+         return 1;
+ }
 diff --git a/src/core/execute.c b/src/core/execute.c
-index 8ac69d1a0..efedf3842 100644
+index a708231..e2b8748 100644
 --- a/src/core/execute.c
 +++ b/src/core/execute.c
-@@ -3976,10 +3976,10 @@ void exec_context_dump(const ExecContext *c, FILE* f, const char *prefix) {
- 
+@@ -4220,9 +4220,9 @@ void exec_context_dump(const ExecContext *c, FILE* f, const char *prefix) {
          for (i = 0; i < RLIM_NLIMITS; i++)
                  if (c->rlimit[i]) {
--                        fprintf(f, "Limit%s%s: " RLIM_FMT "\n",
+                         fprintf(f, "%sLimit%s: " RLIM_FMT "\n",
 -                                prefix, rlimit_to_string(i), c->rlimit[i]->rlim_max);
--                        fprintf(f, "Limit%s%sSoft: " RLIM_FMT "\n",
--                                prefix, rlimit_to_string(i), c->rlimit[i]->rlim_cur);
-+                        fprintf(f, "Limit%s%s: %ju\n",
 +                                prefix, rlimit_to_string(i), (uintmax_t)c->rlimit[i]->rlim_max);
-+                        fprintf(f, "Limit%s%sSoft: %ju\n",
+                         fprintf(f, "%sLimit%sSoft: " RLIM_FMT "\n",
+-                                prefix, rlimit_to_string(i), c->rlimit[i]->rlim_cur);
 +                                prefix, rlimit_to_string(i), (uintmax_t)c->rlimit[i]->rlim_cur);
                  }
  
          if (c->ioprio_set) {
 -- 
-2.11.0
+2.7.4
 
diff --git a/meta/recipes-core/systemd/systemd/0011-src-basic-missing.h-check-for-missing-__compar_fn_t-.patch b/meta/recipes-core/systemd/systemd/0011-src-basic-missing.h-check-for-missing-__compar_fn_t-.patch
deleted file mode 100644
index 1a22ffd..0000000
--- a/meta/recipes-core/systemd/systemd/0011-src-basic-missing.h-check-for-missing-__compar_fn_t-.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 045f205fd21e5e380edf813de04fcfbf5a487219 Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Mon, 2 Jul 2018 13:28:25 +0800
-Subject: [PATCH 11/19] src/basic/missing.h: check for missing __compar_fn_t
- typedef
-
-include missing.h for missing __compar_fn_t
-
-Upstream-Status: Inappropriate [musl specific]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- src/basic/missing.h | 5 +++++
- src/basic/strbuf.c  | 1 +
- 2 files changed, 6 insertions(+)
-
-diff --git a/src/basic/missing.h b/src/basic/missing.h
-index 6dc750eba..cd1cc109f 100644
---- a/src/basic/missing.h
-+++ b/src/basic/missing.h
-@@ -1179,6 +1179,11 @@ struct input_mask {
- #define RENAME_NOREPLACE (1 << 0)
- #endif
- 
-+#ifndef __COMPAR_FN_T
-+#define __COMPAR_FN_T
-+typedef int (*__compar_fn_t)(const void *, const void *);
-+#endif
-+
- #ifndef KCMP_FILE
- #define KCMP_FILE 0
- #endif
-diff --git a/src/basic/strbuf.c b/src/basic/strbuf.c
-index e2ed776a0..4d3ebec4c 100644
---- a/src/basic/strbuf.c
-+++ b/src/basic/strbuf.c
-@@ -7,6 +7,7 @@
- #include "alloc-util.h"
- #include "strbuf.h"
- #include "util.h"
-+#include "missing.h"
- 
- /*
-  * Strbuf stores given strings in a single continuous allocated memory
--- 
-2.11.0
-
diff --git a/meta/recipes-core/systemd/systemd/0012-fix-missing-ULONG_LONG_MAX-definition-in-case-of-mus.patch b/meta/recipes-core/systemd/systemd/0012-fix-missing-ULONG_LONG_MAX-definition-in-case-of-mus.patch
new file mode 100644
index 0000000..dbaae4f
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0012-fix-missing-ULONG_LONG_MAX-definition-in-case-of-mus.patch
@@ -0,0 +1,27 @@
+From aa6cd19ae428769a38fe7d95f98db0a9c19ae90a Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Mon, 25 Feb 2019 15:14:49 +0800
+Subject: [PATCH 12/24] fix missing ULONG_LONG_MAX definition in case of musl
+
+Upstream-Status: Inappropriate [musl]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/basic/missing_type.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/basic/missing_type.h b/src/basic/missing_type.h
+index 23602eb..7d7c1e4 100644
+--- a/src/basic/missing_type.h
++++ b/src/basic/missing_type.h
+@@ -39,3 +39,7 @@ typedef int (*__compar_fn_t)(const void *, const void *);
+ #ifndef FTW_SKIP_SIBLINGS
+ #define FTW_SKIP_SIBLINGS 3
+ #endif
++
++#ifndef ULONG_LONG_MAX
++#define ULONG_LONG_MAX ULLONG_MAX
++#endif
+-- 
+2.7.4
+
diff --git a/meta/recipes-core/systemd/systemd/0015-test-hexdecoct.c-Include-missing.h-for-strndupa.patch b/meta/recipes-core/systemd/systemd/0013-test-hexdecoct.c-Include-missing.h-for-strndupa.patch
similarity index 78%
rename from meta/recipes-core/systemd/systemd/0015-test-hexdecoct.c-Include-missing.h-for-strndupa.patch
rename to meta/recipes-core/systemd/systemd/0013-test-hexdecoct.c-Include-missing.h-for-strndupa.patch
index c7ca9cd..874c17c 100644
--- a/meta/recipes-core/systemd/systemd/0015-test-hexdecoct.c-Include-missing.h-for-strndupa.patch
+++ b/meta/recipes-core/systemd/systemd/0013-test-hexdecoct.c-Include-missing.h-for-strndupa.patch
@@ -1,7 +1,7 @@
-From b11109ecc41110c518a98b6ac39611ff86477021 Mon Sep 17 00:00:00 2001
+From e5a48f84db58ffb9128383eaefc123b5829523e5 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 23 Oct 2017 12:33:22 -0700
-Subject: [PATCH 15/19] test-hexdecoct.c: Include missing.h for strndupa
+Subject: [PATCH 13/24] test-hexdecoct.c: Include missing.h for strndupa
 
 Upstream-Status: Inappropriate [musl specific]
 
@@ -12,7 +12,7 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/src/test/test-hexdecoct.c b/src/test/test-hexdecoct.c
-index da9f3008b..7ff2dfe0c 100644
+index 5221742..a05e778 100644
 --- a/src/test/test-hexdecoct.c
 +++ b/src/test/test-hexdecoct.c
 @@ -6,6 +6,7 @@
@@ -24,5 +24,5 @@ index da9f3008b..7ff2dfe0c 100644
  static void test_hexchar(void) {
          assert_se(hexchar(0xa) == 'a');
 -- 
-2.11.0
+2.7.4
 
diff --git a/meta/recipes-core/systemd/systemd/0014-fix-missing-ULONG_LONG_MAX-definition-in-case-of-mus.patch b/meta/recipes-core/systemd/systemd/0014-fix-missing-ULONG_LONG_MAX-definition-in-case-of-mus.patch
deleted file mode 100644
index 258a631..0000000
--- a/meta/recipes-core/systemd/systemd/0014-fix-missing-ULONG_LONG_MAX-definition-in-case-of-mus.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From cb59b3af54fb3bbd4d8264fef919810af8d08d16 Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Tue, 27 Feb 2018 14:01:30 +0800
-Subject: [PATCH 14/19] fix missing ULONG_LONG_MAX definition in case of musl
-
-Upstream-Status: Inappropriate [musl]
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- src/basic/missing.h | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/basic/missing.h b/src/basic/missing.h
-index cd1cc109f..144058a1a 100644
---- a/src/basic/missing.h
-+++ b/src/basic/missing.h
-@@ -54,6 +54,10 @@ struct sockaddr_vm {
- };
- #endif /* !HAVE_LINUX_VM_SOCKETS_H */
- 
-+#ifndef ULONG_LONG_MAX
-+#define ULONG_LONG_MAX ULLONG_MAX
-+#endif
-+
- #ifndef RLIMIT_RTTIME
- #define RLIMIT_RTTIME 15
- #endif
--- 
-2.11.0
-
diff --git a/meta/recipes-core/systemd/systemd/0016-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch b/meta/recipes-core/systemd/systemd/0014-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
similarity index 78%
rename from meta/recipes-core/systemd/systemd/0016-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
rename to meta/recipes-core/systemd/systemd/0014-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
index c06a370..914589d 100644
--- a/meta/recipes-core/systemd/systemd/0016-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
+++ b/meta/recipes-core/systemd/systemd/0014-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
@@ -1,7 +1,7 @@
-From c4bbf3efefffe0a4efadbf4e3f0adb54d76fe0e7 Mon Sep 17 00:00:00 2001
+From d3d65d4036670cbd5129fe55c09ca391286ef4b3 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Wed, 28 Feb 2018 21:25:22 -0800
-Subject: [PATCH 16/19] test-sizeof.c: Disable tests for missing typedefs in
+Subject: [PATCH 14/24] test-sizeof.c: Disable tests for missing typedefs in
  musl
 
 Upstream-Status: Inappropriate [musl specific]
@@ -13,10 +13,10 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 4 insertions(+)
 
 diff --git a/src/test/test-sizeof.c b/src/test/test-sizeof.c
-index 7a1e496ed..386b314d5 100644
+index 35b0876..e78e7ca 100644
 --- a/src/test/test-sizeof.c
 +++ b/src/test/test-sizeof.c
-@@ -40,8 +40,10 @@ int main(void) {
+@@ -41,8 +41,10 @@ int main(void) {
          info(unsigned);
          info(long unsigned);
          info(long long unsigned);
@@ -27,7 +27,7 @@ index 7a1e496ed..386b314d5 100644
  
          info(float);
          info(double);
-@@ -59,7 +61,9 @@ int main(void) {
+@@ -60,7 +62,9 @@ int main(void) {
          info(ssize_t);
          info(time_t);
          info(usec_t);
@@ -38,5 +38,5 @@ index 7a1e496ed..386b314d5 100644
          info(uid_t);
          info(gid_t);
 -- 
-2.11.0
+2.7.4
 
diff --git a/meta/recipes-core/systemd/systemd/0017-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch b/meta/recipes-core/systemd/systemd/0015-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
similarity index 95%
rename from meta/recipes-core/systemd/systemd/0017-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
rename to meta/recipes-core/systemd/systemd/0015-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
index 8e47c6f5..fd407f6 100644
--- a/meta/recipes-core/systemd/systemd/0017-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
+++ b/meta/recipes-core/systemd/systemd/0015-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
@@ -1,7 +1,7 @@
-From 91bb4f5c9c11464468e8d3fa4746d98d59997264 Mon Sep 17 00:00:00 2001
+From 48c628f532f6025c2d1646b6819cd81eb789d7fb Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Tue, 10 Oct 2017 14:33:30 -0700
-Subject: [PATCH 17/19] don't pass AT_SYMLINK_NOFOLLOW flag to faccessat()
+Subject: [PATCH 15/24] don't pass AT_SYMLINK_NOFOLLOW flag to faccessat()
 
 Avoid using AT_SYMLINK_NOFOLLOW flag. It doesn't seem like the right
 thing to do and it's not portable (not supported by musl). See:
@@ -31,7 +31,7 @@ Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
  2 files changed, 24 insertions(+), 4 deletions(-)
 
 diff --git a/src/basic/fs-util.h b/src/basic/fs-util.h
-index 28566773c..14b864cc5 100644
+index 7ad030b..d4cb1e9 100644
 --- a/src/basic/fs-util.h
 +++ b/src/basic/fs-util.h
 @@ -32,7 +32,27 @@ int fchmod_opath(int fd, mode_t m);
@@ -64,7 +64,7 @@ index 28566773c..14b864cc5 100644
  int touch_file(const char *path, bool parents, usec_t stamp, uid_t uid, gid_t gid, mode_t mode);
  int touch(const char *path);
 diff --git a/src/shared/base-filesystem.c b/src/shared/base-filesystem.c
-index 89d7a7d59..34b4ad53a 100644
+index 89d7a7d..34b4ad5 100644
 --- a/src/shared/base-filesystem.c
 +++ b/src/shared/base-filesystem.c
 @@ -53,7 +53,7 @@ int base_filesystem_create(const char *root, uid_t uid, gid_t gid) {
@@ -95,5 +95,5 @@ index 89d7a7d59..34b4ad53a 100644
                                  }
  
 -- 
-2.11.0
+2.7.4
 
diff --git a/meta/recipes-core/systemd/systemd/0018-Define-glibc-compatible-basename-for-non-glibc-syste.patch b/meta/recipes-core/systemd/systemd/0016-Define-glibc-compatible-basename-for-non-glibc-syste.patch
similarity index 82%
rename from meta/recipes-core/systemd/systemd/0018-Define-glibc-compatible-basename-for-non-glibc-syste.patch
rename to meta/recipes-core/systemd/systemd/0016-Define-glibc-compatible-basename-for-non-glibc-syste.patch
index 1bd0d60..d556569 100644
--- a/meta/recipes-core/systemd/systemd/0018-Define-glibc-compatible-basename-for-non-glibc-syste.patch
+++ b/meta/recipes-core/systemd/systemd/0016-Define-glibc-compatible-basename-for-non-glibc-syste.patch
@@ -1,7 +1,7 @@
-From 97fed07132533a1b2bce9c60e305a5d09aee2e9b Mon Sep 17 00:00:00 2001
+From af76c973e41929360a6e021f2ff9a7fc1d7994e9 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 27 May 2018 08:36:44 -0700
-Subject: [PATCH 18/19] Define glibc compatible basename() for non-glibc
+Subject: [PATCH 16/24] Define glibc compatible basename() for non-glibc
  systems
 
 Fixes builds with musl, even though systemd is adamant about
@@ -15,7 +15,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 4 insertions(+)
 
 diff --git a/src/machine/machine-dbus.c b/src/machine/machine-dbus.c
-index 7f41465cc..cee8a5d43 100644
+index 7a558df..eca7d4b 100644
 --- a/src/machine/machine-dbus.c
 +++ b/src/machine/machine-dbus.c
 @@ -11,6 +11,10 @@
@@ -30,5 +30,5 @@ index 7f41465cc..cee8a5d43 100644
  #include "bus-common-errors.h"
  #include "bus-internal.h"
 -- 
-2.11.0
+2.7.4
 
diff --git a/meta/recipes-core/systemd/systemd/0019-Do-not-disable-buffering-when-writing-to-oom_score_a.patch b/meta/recipes-core/systemd/systemd/0017-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
similarity index 82%
rename from meta/recipes-core/systemd/systemd/0019-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
rename to meta/recipes-core/systemd/systemd/0017-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
index 942f4c0..05e6ded 100644
--- a/meta/recipes-core/systemd/systemd/0019-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
+++ b/meta/recipes-core/systemd/systemd/0017-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
@@ -1,7 +1,7 @@
-From 8440348bcac34249cdf6ac2dcae9ac66d3c727db Mon Sep 17 00:00:00 2001
+From c7a4efb8bccb52e1714c151929c23e12bde59b82 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Wed, 4 Jul 2018 15:00:44 +0800
-Subject: [PATCH 19/19] Do not disable buffering when writing to oom_score_adj
+Subject: [PATCH 17/24] Do not disable buffering when writing to oom_score_adj
 
 On musl, disabling buffering when writing to oom_score_adj will
 cause the following error.
@@ -22,10 +22,10 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/basic/process-util.c b/src/basic/process-util.c
-index 3543bc045..d0572e034 100644
+index aec2daf..7b4aabf 100644
 --- a/src/basic/process-util.c
 +++ b/src/basic/process-util.c
-@@ -1473,7 +1473,7 @@ int set_oom_score_adjust(int value) {
+@@ -1538,7 +1538,7 @@ int set_oom_score_adjust(int value) {
          sprintf(t, "%i", value);
  
          return write_string_file("/proc/self/oom_score_adj", t,
@@ -35,5 +35,5 @@ index 3543bc045..d0572e034 100644
  
  static const char *const ioprio_class_table[] = {
 -- 
-2.11.0
+2.7.4
 
diff --git a/meta/recipes-core/systemd/systemd/0020-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch b/meta/recipes-core/systemd/systemd/0018-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
similarity index 87%
rename from meta/recipes-core/systemd/systemd/0020-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
rename to meta/recipes-core/systemd/systemd/0018-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
index 5c78cab..5901772 100644
--- a/meta/recipes-core/systemd/systemd/0020-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
+++ b/meta/recipes-core/systemd/systemd/0018-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
@@ -1,7 +1,7 @@
-From dd53dc9b9542cbd2c39a39096941dfed70d06506 Mon Sep 17 00:00:00 2001
+From fffb2810611b4a26f5c6c0958093b5b3b7d4cd99 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Tue, 10 Jul 2018 15:40:17 +0800
-Subject: [PATCH 20/20] distinguish XSI-compliant strerror_r from GNU-specifi
+Subject: [PATCH 18/24] distinguish XSI-compliant strerror_r from GNU-specifi
  strerror_r
 
 XSI-compliant strerror_r and GNU-specifi strerror_r are different.
@@ -24,7 +24,7 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  2 files changed, 10 insertions(+)
 
 diff --git a/src/journal/journal-send.c b/src/journal/journal-send.c
-index 65bcbcd2e..aef80dd8f 100644
+index 3fea912..4f1e592 100644
 --- a/src/journal/journal-send.c
 +++ b/src/journal/journal-send.c
 @@ -337,7 +337,12 @@ static int fill_iovec_perror_and_send(const char *message, int skip, struct iove
@@ -41,10 +41,10 @@ index 65bcbcd2e..aef80dd8f 100644
                          char error[STRLEN("ERRNO=") + DECIMAL_STR_MAX(int) + 1];
  
 diff --git a/src/libsystemd/sd-bus/bus-error.c b/src/libsystemd/sd-bus/bus-error.c
-index ec359ac13..d2aa86cea 100644
+index dc95237..bdda30f 100644
 --- a/src/libsystemd/sd-bus/bus-error.c
 +++ b/src/libsystemd/sd-bus/bus-error.c
-@@ -362,7 +362,12 @@ static void bus_error_strerror(sd_bus_error *e, int error) {
+@@ -379,7 +379,12 @@ static void bus_error_strerror(sd_bus_error *e, int error) {
                          return;
  
                  errno = 0;
@@ -58,5 +58,5 @@ index ec359ac13..d2aa86cea 100644
                          free(m);
                          k *= 2;
 -- 
-2.11.0
+2.7.4
 
diff --git a/meta/recipes-core/systemd/systemd/0021-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch b/meta/recipes-core/systemd/systemd/0019-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch
similarity index 49%
rename from meta/recipes-core/systemd/systemd/0021-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch
rename to meta/recipes-core/systemd/systemd/0019-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch
index 668f273..35cc66f 100644
--- a/meta/recipes-core/systemd/systemd/0021-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch
+++ b/meta/recipes-core/systemd/systemd/0019-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch
@@ -1,34 +1,35 @@
-From 687a5af8dc5d38f918a6ce08fed5297234bf8346 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 2 Mar 2018 18:00:17 -0800
-Subject: [PATCH] Hide __start_BUS_ERROR_MAP and __stop_BUS_ERROR_MAP
+From 969ab9e68249fd383f4b513b1c9306bdac4ae9b2 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Mon, 25 Feb 2019 15:18:00 +0800
+Subject: [PATCH 19/24] Hide __start_BUS_ERROR_MAP and __stop_BUS_ERROR_MAP
 
 for currently unknown reasons they get exported to the shared libries
 even without being listed in the sym file
 
+Upstream-Status: Pending
+
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+[Rebased for v241]
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 ---
-
-Upstream-Status: Pending [ Conditional on master needing this, 239 does need it ]
-
  src/libsystemd/sd-bus/bus-error.c | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/libsystemd/sd-bus/bus-error.c b/src/libsystemd/sd-bus/bus-error.c
-index 378f7a377..49d797abd 100644
+index bdda30f..e21853c 100644
 --- a/src/libsystemd/sd-bus/bus-error.c
 +++ b/src/libsystemd/sd-bus/bus-error.c
-@@ -71,8 +71,8 @@ BUS_ERROR_MAP_ELF_REGISTER const sd_bus_error_map bus_standard_errors[] = {
+@@ -54,8 +54,8 @@ BUS_ERROR_MAP_ELF_REGISTER const sd_bus_error_map bus_standard_errors[] = {
  };
  
  /* GCC maps this magically to the beginning and end of the BUS_ERROR_MAP section */
--extern const sd_bus_error_map __start_BUS_ERROR_MAP[];
--extern const sd_bus_error_map __stop_BUS_ERROR_MAP[];
-+extern const sd_bus_error_map __start_BUS_ERROR_MAP[] _hidden_;
-+extern const sd_bus_error_map __stop_BUS_ERROR_MAP[] _hidden_;
+-extern const sd_bus_error_map __start_SYSTEMD_BUS_ERROR_MAP[];
+-extern const sd_bus_error_map __stop_SYSTEMD_BUS_ERROR_MAP[];
++extern const sd_bus_error_map __start_SYSTEMD_BUS_ERROR_MAP[] _hidden_;
++extern const sd_bus_error_map __stop_SYSTEMD_BUS_ERROR_MAP[] _hidden_;
  
  /* Additional maps registered with sd_bus_error_add_map() are in this
   * NULL terminated array */
 -- 
-2.16.2
+2.7.4
 
diff --git a/meta/recipes-core/systemd/systemd/0020-missing_type.h-add-__compar_d_fn_t-definition.patch b/meta/recipes-core/systemd/systemd/0020-missing_type.h-add-__compar_d_fn_t-definition.patch
new file mode 100644
index 0000000..753d511
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0020-missing_type.h-add-__compar_d_fn_t-definition.patch
@@ -0,0 +1,30 @@
+From 75c06e3e2a4760b36fffd95cdf5535b8ad73c481 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Mon, 25 Feb 2019 15:27:54 +0800
+Subject: [PATCH 20/24] missing_type.h: add __compar_d_fn_t definition
+
+Fix the following compile failure:
+src/basic/util.h:71:18: error: unknown type name '__compar_d_fn_t'; did you mean '__compar_fn_t'?
+
+Upstream-Status: Inappropriate [musl specific]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/basic/missing_type.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/basic/missing_type.h b/src/basic/missing_type.h
+index 7d7c1e4..85902ab 100644
+--- a/src/basic/missing_type.h
++++ b/src/basic/missing_type.h
+@@ -13,6 +13,7 @@
+ 
+ #ifndef __GLIBC__
+ typedef int (*comparison_fn_t)(const void *, const void *);
++typedef int (*__compar_d_fn_t) (const void *, const void *, void *);
+ #endif
+ 
+ #ifndef __COMPAR_FN_T
+-- 
+2.7.4
+
diff --git a/meta/recipes-core/systemd/systemd/0021-avoid-redefinition-of-prctl_mm_map-structure.patch b/meta/recipes-core/systemd/systemd/0021-avoid-redefinition-of-prctl_mm_map-structure.patch
new file mode 100644
index 0000000..a8c53c9
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0021-avoid-redefinition-of-prctl_mm_map-structure.patch
@@ -0,0 +1,47 @@
+From 3fbf61d54b82fc9bf21d8039bfd89dc9efc5bbcd Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Mon, 25 Feb 2019 15:44:54 +0800
+Subject: [PATCH 21/24] avoid redefinition of prctl_mm_map structure
+
+Fix the following compile failure:
+error: redefinition of 'struct prctl_mm_map'
+
+Upstream-Status: Inappropriate [musl specific]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/basic/missing_prctl.h | 2 ++
+ src/basic/util.h          | 3 ++-
+ 2 files changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/src/basic/missing_prctl.h b/src/basic/missing_prctl.h
+index f80cd17..47e4893 100644
+--- a/src/basic/missing_prctl.h
++++ b/src/basic/missing_prctl.h
+@@ -1,7 +1,9 @@
+ /* SPDX-License-Identifier: LGPL-2.1+ */
+ #pragma once
+ 
++#ifdef __GLIBC__
+ #include <linux/prctl.h>
++#endif
+ 
+ /* 58319057b7847667f0c9585b9de0e8932b0fdb08 (4.3) */
+ #ifndef PR_CAP_AMBIENT
+diff --git a/src/basic/util.h b/src/basic/util.h
+index 2c5dc32..f721184 100644
+--- a/src/basic/util.h
++++ b/src/basic/util.h
+@@ -26,7 +26,8 @@
+ #include "format-util.h"
+ #include "macro.h"
+ #include "time-util.h"
+-#include "missing.h"
++#include "missing_stdlib.h"
++#include "missing_type.h"
+ 
+ size_t page_size(void) _pure_;
+ #define PAGE_ALIGN(l) ALIGN_TO((l), page_size())
+-- 
+2.7.4
+
diff --git a/meta/recipes-core/systemd/systemd/0022-Use-if-instead-of-ifdef-for-ENABLE_GSHADOW.patch b/meta/recipes-core/systemd/systemd/0022-Use-if-instead-of-ifdef-for-ENABLE_GSHADOW.patch
deleted file mode 100644
index a9c1c9c..0000000
--- a/meta/recipes-core/systemd/systemd/0022-Use-if-instead-of-ifdef-for-ENABLE_GSHADOW.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 4f07ffa8f5ab85011422bb7114f1cddf49d4923d Mon Sep 17 00:00:00 2001
-From: ChenQi1989 <40684930+ChenQi1989@users.noreply.github.com>
-Date: Fri, 29 Jun 2018 06:54:07 +0000
-Subject: Use #if instead of #ifdef for ENABLE_GSHADOW
-
-ENABLE_GSHADOW is defined to be 0 or 1. So #if should be used instead of #ifdef.
-
-Upstream-Status: Backport [https://github.com/systemd/systemd/commit/4f07ffa8f5ab85011422bb7114f1cddf49d4923d]
----
- src/basic/user-util.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/basic/user-util.h b/src/basic/user-util.h
-index b74f16885..b2f198c89 100644
---- a/src/basic/user-util.h
-+++ b/src/basic/user-util.h
-@@ -102,7 +102,7 @@ int fgetgrent_sane(FILE *stream, struct group **gr);
- int putpwent_sane(const struct passwd *pw, FILE *stream);
- int putspent_sane(const struct spwd *sp, FILE *stream);
- int putgrent_sane(const struct group *gr, FILE *stream);
--#ifdef ENABLE_GSHADOW
-+#if ENABLE_GSHADOW
- int fgetsgent_sane(FILE *stream, struct sgrp **sg);
- int putsgent_sane(const struct sgrp *sg, FILE *stream);
- #endif
--- 
-2.18.1
-
diff --git a/meta/recipes-core/systemd/systemd/0022-build-sys-Detect-whether-struct-statx-is-defined-in-.patch b/meta/recipes-core/systemd/systemd/0022-build-sys-Detect-whether-struct-statx-is-defined-in-.patch
deleted file mode 100644
index 962463f..0000000
--- a/meta/recipes-core/systemd/systemd/0022-build-sys-Detect-whether-struct-statx-is-defined-in-.patch
+++ /dev/null
@@ -1,109 +0,0 @@
-From 75720bff62a84896e9a0654afc7cf9408cf89a38 Mon Sep 17 00:00:00 2001
-From: Filipe Brandenburger <filbranden@google.com>
-Date: Sun, 15 Jul 2018 22:43:35 -0700
-Subject: [PATCH] build-sys: Detect whether struct statx is defined in
- sys/stat.h
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Starting with glibc 2.27.9000-36.fc29, include file sys/stat.h will have a
-definition for struct statx, in which case include file linux/stat.h should be
-avoided, in order to prevent a duplicate definition.
-
-    In file included from ../src/basic/missing.h:18,
-		     from ../src/basic/util.h:28,
-		     from ../src/basic/hashmap.h:10,
-		     from ../src/shared/bus-util.h:12,
-		     from ../src/libsystemd/sd-bus/bus-creds.c:11:
-    /usr/include/linux/stat.h:99:8: error: redefinition of ‘struct statx’
-     struct statx {
-	    ^~~~~
-    In file included from /usr/include/sys/stat.h:446,
-		     from ../src/basic/util.h:19,
-		     from ../src/basic/hashmap.h:10,
-		     from ../src/shared/bus-util.h:12,
-		     from ../src/libsystemd/sd-bus/bus-creds.c:11:
-    /usr/include/bits/statx.h:36:8: note: originally defined here
-     struct statx
-	    ^~~~~
-
-Extend our meson.build to look for struct statx when only sys/stat.h is
-included and, in that case, do not include linux/stat.h anymore.
-
-Tested that systemd builds correctly when using a glibc version that includes a
-definition for struct statx.
-
-glibc Fedora RPM update:
-https://src.fedoraproject.org/rpms/glibc/c/28cb5d31fc1e5887912283c889689c47076278ae
-
-glibc upstream commit:
-https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=fd70af45528d59a00eb3190ef6706cb299488fcd
----
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
- meson.build            | 5 +++++
- src/basic/missing.h    | 5 ++++-
- src/basic/xattr-util.c | 1 -
- 3 files changed, 9 insertions(+), 2 deletions(-)
-
-Index: git/meson.build
-===================================================================
---- git.orig/meson.build
-+++ git/meson.build
-@@ -432,6 +432,7 @@ decl_headers = '''
- #include <sys/stat.h>
- '''
- # FIXME: key_serial_t is only defined in keyutils.h, this is bound to fail
-+# FIXME: these should use -D_GNU_SOURCE, since that is defined at build time
- 
- foreach decl : ['char16_t',
-                 'char32_t',
-@@ -446,6 +447,10 @@ foreach decl : ['char16_t',
-         conf.set10('HAVE_' + decl.underscorify().to_upper(), have)
- endforeach
- 
-+conf.set10('HAVE_STRUCT_STATX_IN_SYS_STAT_H', cc.sizeof('struct statx', prefix : '''
-+#include <sys/stat.h>
-+''', args : '-D_GNU_SOURCE') > 0)
-+
- foreach decl : [['IFLA_INET6_ADDR_GEN_MODE',         'linux/if_link.h'],
-                 ['IN6_ADDR_GEN_MODE_STABLE_PRIVACY', 'linux/if_link.h'],
-                 ['IFLA_VRF_TABLE',                   'linux/if_link.h'],
-Index: git/src/basic/missing.h
-===================================================================
---- git.orig/src/basic/missing.h
-+++ git/src/basic/missing.h
-@@ -15,7 +15,6 @@
- #include <linux/neighbour.h>
- #include <linux/oom.h>
- #include <linux/rtnetlink.h>
--#include <linux/stat.h>
- #include <net/ethernet.h>
- #include <stdlib.h>
- #include <sys/resource.h>
-@@ -25,6 +24,10 @@
- #include <uchar.h>
- #include <unistd.h>
- 
-+#if !HAVE_STRUCT_STATX_IN_SYS_STAT_H
-+#include <linux/stat.h>
-+#endif
-+
- #if HAVE_AUDIT
- #include <libaudit.h>
- #endif
-Index: git/src/basic/xattr-util.c
-===================================================================
---- git.orig/src/basic/xattr-util.c
-+++ git/src/basic/xattr-util.c
-@@ -2,7 +2,6 @@
- 
- #include <errno.h>
- #include <fcntl.h>
--#include <linux/stat.h>
- #include <stdint.h>
- #include <stdlib.h>
- #include <string.h>
diff --git a/meta/recipes-core/systemd/systemd/0022-include-sys-wait.h-to-avoid-compile-failure.patch b/meta/recipes-core/systemd/systemd/0022-include-sys-wait.h-to-avoid-compile-failure.patch
new file mode 100644
index 0000000..47212bc
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0022-include-sys-wait.h-to-avoid-compile-failure.patch
@@ -0,0 +1,33 @@
+From 6c5364736f5afd1106ac240f03806af53979cc60 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Mon, 25 Feb 2019 15:56:50 +0800
+Subject: [PATCH 22/24] include sys/wait.h to avoid compile failure
+
+Fix the following error:
+src/udev/udev-event.c:581:53: error: 'WEXITED' undeclared (first use in this function); did you mean 'WIFEXITED'?
+
+Upstream-Status: Inappropriate [musl specific]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/udev/udev-event.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/udev/udev-event.c b/src/udev/udev-event.c
+index 07b7365..e532bb7 100644
+--- a/src/udev/udev-event.c
++++ b/src/udev/udev-event.c
+@@ -8,7 +8,9 @@
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <unistd.h>
+-
++#ifndef __GLIBC__
++#include <sys/wait.h>
++#endif
+ #include "sd-event.h"
+ 
+ #include "alloc-util.h"
+-- 
+2.7.4
+
diff --git a/meta/recipes-core/systemd/systemd/0023-resolvconf-fixes-for-the-compatibility-interface.patch b/meta/recipes-core/systemd/systemd/0023-resolvconf-fixes-for-the-compatibility-interface.patch
deleted file mode 100644
index 2f3e776..0000000
--- a/meta/recipes-core/systemd/systemd/0023-resolvconf-fixes-for-the-compatibility-interface.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-systemd-239: fixes for the compatibility interface
-
-[No upstream tracking] -- https://github.com/systemd/systemd/issues/9423
-
-resolvconf-compat: use compat_main() when called as `resolvconf`,
-since the interface is closer to that of `systemd-resolve`.
-
-Use a heap allocated string to set arg_ifname, since a stack allocated
-one would be lost after the function returns. (This last one broke the
-case where an interface name was suffixed with a dot, such as in
-`resolvconf -a tap0.dhcp`.)
-
-Tested:
-  $ build/resolvconf -a nonexistent.abc </etc/resolv.conf
-  Unknown interface 'nonexistent': No such device
-
-Upstream-Status: Backport [https://github.com/systemd/systemd/commit/5a01b3f35d7b6182c78b6973db8d99bdabd4f9c3]
-bug: 9423
-Signed-off-by: Simon Ausserlechner <simon.ausserlechner@siemens.com>
-
-diff --git a/src/resolve/resolvconf-compat.c b/src/resolve/resolvconf-compat.c
-index d7e68003e..072345894 100644
---- a/src/resolve/resolvconf-compat.c
-+++ b/src/resolve/resolvconf-compat.c
-@@ -53,6 +53,8 @@ static int parse_nameserver(const char *string) {
- 
-                 if (strv_push(&arg_set_dns, word) < 0)
-                         return log_oom();
-+
-+                word = NULL;
-         }
- 
-         return 0;
-@@ -202,7 +204,7 @@ int resolvconf_parse_argv(int argc, char *argv[]) {
- 
-         dot = strchr(argv[optind], '.');
-         if (dot) {
--                iface = strndupa(argv[optind], dot - argv[optind]);
-+                iface = strndup(argv[optind], dot - argv[optind]);
-                 log_debug("Ignoring protocol specifier '%s'.", dot + 1);
-         } else
-                 iface = argv[optind];
-diff --git a/src/resolve/resolvectl.c b/src/resolve/resolvectl.c
-index e96c13fea..e9e395e3e 100644
---- a/src/resolve/resolvectl.c
-+++ b/src/resolve/resolvectl.c
-@@ -3092,7 +3092,7 @@ int main(int argc, char **argv) {
-                 goto finish;
-         }
- 
--        if (streq(program_invocation_short_name, "systemd-resolve"))
-+        if (STR_IN_SET(program_invocation_short_name, "systemd-resolve", "resolvconf"))
-                 r = compat_main(argc, argv, bus);
-         else
-                 r = native_main(argc, argv, bus);
--- 
-2.11.0
-
diff --git a/meta/recipes-core/systemd/systemd/0023-socket-util.h-include-string.h.patch b/meta/recipes-core/systemd/systemd/0023-socket-util.h-include-string.h.patch
new file mode 100644
index 0000000..22186b8
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0023-socket-util.h-include-string.h.patch
@@ -0,0 +1,30 @@
+From 93e6b81b721d9eb966a257bfdf7df6e8280b885c Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Mon, 25 Feb 2019 16:37:19 +0800
+Subject: [PATCH 23/24] socket-util.h: include string.h
+
+Fix the following compile error:
+src/basic/socket-util.h:187:30: error: implicit declaration of function 'strnlen'; did you mean 'strlen'? [-Werror=implicit-function-declaration]
+
+Upstream-Status: Pending
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/basic/socket-util.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/basic/socket-util.h b/src/basic/socket-util.h
+index 574d2b7..097aa4d 100644
+--- a/src/basic/socket-util.h
++++ b/src/basic/socket-util.h
+@@ -12,6 +12,7 @@
+ #include <sys/socket.h>
+ #include <sys/types.h>
+ #include <sys/un.h>
++#include <string.h>
+ 
+ #include "macro.h"
+ #include "missing_socket.h"
+-- 
+2.7.4
+
diff --git a/meta/recipes-core/systemd/systemd/0024-journald-do-not-store-the-iovec-entry-for-process-co.patch b/meta/recipes-core/systemd/systemd/0024-journald-do-not-store-the-iovec-entry-for-process-co.patch
deleted file mode 100644
index c2f78be..0000000
--- a/meta/recipes-core/systemd/systemd/0024-journald-do-not-store-the-iovec-entry-for-process-co.patch
+++ /dev/null
@@ -1,208 +0,0 @@
-From 9cb07e7d82c7c4f28bbaa1478e1387e8ea3d03dd Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
-Date: Wed, 5 Dec 2018 18:38:39 +0100
-Subject: [PATCH] journald: do not store the iovec entry for process
- commandline on stack
-
-This fixes a crash where we would read the commandline, whose length is under
-control of the sending program, and then crash when trying to create a stack
-allocation for it.
-
-CVE-2018-16864
-https://bugzilla.redhat.com/show_bug.cgi?id=1653855
-
-The message actually doesn't get written to disk, because
-journal_file_append_entry() returns -E2BIG.
-
-Patch backported from systemd master at
-084eeb865ca63887098e0945fb4e93c852b91b0f.
-
-CVE: CVE-2018-16864
-Upstream-Status: Backport
-Signed-off-by: Marcus Cooper <marcusc@axis.com>
----
- src/basic/io-util.c           | 10 ++++++++++
- src/basic/io-util.h           |  2 ++
- src/coredump/coredump.c       | 31 +++++++++++--------------------
- src/journal/journald-server.c | 25 +++++++++++++++----------
- 4 files changed, 38 insertions(+), 30 deletions(-)
-
-diff --git a/src/basic/io-util.c b/src/basic/io-util.c
-index 1f64cc933b..575398fbe6 100644
---- a/src/basic/io-util.c
-+++ b/src/basic/io-util.c
-@@ -8,6 +8,7 @@
- #include <unistd.h>
- 
- #include "io-util.h"
-+#include "string-util.h"
- #include "time-util.h"
- 
- int flush_fd(int fd) {
-@@ -252,3 +253,12 @@ ssize_t sparse_write(int fd, const void *p, size_t sz, size_t run_length) {
- 
-         return q - (const uint8_t*) p;
- }
-+
-+char* set_iovec_string_field(struct iovec *iovec, size_t *n_iovec, const char *field, const char *value) {
-+        char *x;
-+
-+        x = strappend(field, value);
-+        if (x)
-+                iovec[(*n_iovec)++] = IOVEC_MAKE_STRING(x);
-+        return x;
-+}
-diff --git a/src/basic/io-util.h b/src/basic/io-util.h
-index ed189b5820..792a64ad5e 100644
---- a/src/basic/io-util.h
-+++ b/src/basic/io-util.h
-@@ -71,3 +71,5 @@ static inline bool FILE_SIZE_VALID_OR_INFINITY(uint64_t l) {
- #define IOVEC_MAKE(base, len) (struct iovec) IOVEC_INIT(base, len)
- #define IOVEC_INIT_STRING(string) IOVEC_INIT((char*) string, strlen(string))
- #define IOVEC_MAKE_STRING(string) (struct iovec) IOVEC_INIT_STRING(string)
-+
-+char* set_iovec_string_field(struct iovec *iovec, size_t *n_iovec, const char *field, const char *value);
-diff --git a/src/coredump/coredump.c b/src/coredump/coredump.c
-index 20a1cbdd45..18e4f61d72 100644
---- a/src/coredump/coredump.c
-+++ b/src/coredump/coredump.c
-@@ -1053,19 +1053,10 @@ static int send_iovec(const struct iovec iovec[], size_t n_iovec, int input_fd)
-         return 0;
- }
- 
--static char* set_iovec_field(struct iovec *iovec, size_t *n_iovec, const char *field, const char *value) {
--        char *x;
--
--        x = strappend(field, value);
--        if (x)
--                iovec[(*n_iovec)++] = IOVEC_MAKE_STRING(x);
--        return x;
--}
--
- static char* set_iovec_field_free(struct iovec *iovec, size_t *n_iovec, const char *field, char *value) {
-         char *x;
- 
--        x = set_iovec_field(iovec, n_iovec, field, value);
-+        x = set_iovec_string_field(iovec, n_iovec, field, value);
-         free(value);
-         return x;
- }
-@@ -1115,36 +1106,36 @@ static int gather_pid_metadata(
-                         disable_coredumps();
-                 }
- 
--                set_iovec_field(iovec, n_iovec, "COREDUMP_UNIT=", context[CONTEXT_UNIT]);
-+                set_iovec_string_field(iovec, n_iovec, "COREDUMP_UNIT=", context[CONTEXT_UNIT]);
-         }
- 
-         if (cg_pid_get_user_unit(pid, &t) >= 0)
-                 set_iovec_field_free(iovec, n_iovec, "COREDUMP_USER_UNIT=", t);
- 
-         /* The next few are mandatory */
--        if (!set_iovec_field(iovec, n_iovec, "COREDUMP_PID=", context[CONTEXT_PID]))
-+        if (!set_iovec_string_field(iovec, n_iovec, "COREDUMP_PID=", context[CONTEXT_PID]))
-                 return log_oom();
- 
--        if (!set_iovec_field(iovec, n_iovec, "COREDUMP_UID=", context[CONTEXT_UID]))
-+        if (!set_iovec_string_field(iovec, n_iovec, "COREDUMP_UID=", context[CONTEXT_UID]))
-                 return log_oom();
- 
--        if (!set_iovec_field(iovec, n_iovec, "COREDUMP_GID=", context[CONTEXT_GID]))
-+        if (!set_iovec_string_field(iovec, n_iovec, "COREDUMP_GID=", context[CONTEXT_GID]))
-                 return log_oom();
- 
--        if (!set_iovec_field(iovec, n_iovec, "COREDUMP_SIGNAL=", context[CONTEXT_SIGNAL]))
-+        if (!set_iovec_string_field(iovec, n_iovec, "COREDUMP_SIGNAL=", context[CONTEXT_SIGNAL]))
-                 return log_oom();
- 
--        if (!set_iovec_field(iovec, n_iovec, "COREDUMP_RLIMIT=", context[CONTEXT_RLIMIT]))
-+        if (!set_iovec_string_field(iovec, n_iovec, "COREDUMP_RLIMIT=", context[CONTEXT_RLIMIT]))
-                 return log_oom();
- 
--        if (!set_iovec_field(iovec, n_iovec, "COREDUMP_HOSTNAME=", context[CONTEXT_HOSTNAME]))
-+        if (!set_iovec_string_field(iovec, n_iovec, "COREDUMP_HOSTNAME=", context[CONTEXT_HOSTNAME]))
-                 return log_oom();
- 
--        if (!set_iovec_field(iovec, n_iovec, "COREDUMP_COMM=", context[CONTEXT_COMM]))
-+        if (!set_iovec_string_field(iovec, n_iovec, "COREDUMP_COMM=", context[CONTEXT_COMM]))
-                 return log_oom();
- 
-         if (context[CONTEXT_EXE] &&
--            !set_iovec_field(iovec, n_iovec, "COREDUMP_EXE=", context[CONTEXT_EXE]))
-+            !set_iovec_string_field(iovec, n_iovec, "COREDUMP_EXE=", context[CONTEXT_EXE]))
-                 return log_oom();
- 
-         if (sd_pid_get_session(pid, &t) >= 0)
-@@ -1212,7 +1203,7 @@ static int gather_pid_metadata(
-                 iovec[(*n_iovec)++] = IOVEC_MAKE_STRING(t);
- 
-         if (safe_atoi(context[CONTEXT_SIGNAL], &signo) >= 0 && SIGNAL_VALID(signo))
--                set_iovec_field(iovec, n_iovec, "COREDUMP_SIGNAL_NAME=SIG", signal_to_string(signo));
-+                set_iovec_string_field(iovec, n_iovec, "COREDUMP_SIGNAL_NAME=SIG", signal_to_string(signo));
- 
-         return 0; /* we successfully acquired all metadata */
- }
-diff --git a/src/journal/journald-server.c b/src/journal/journald-server.c
-index 4f1550ec5b..31be085c6b 100644
---- a/src/journal/journald-server.c
-+++ b/src/journal/journald-server.c
-@@ -753,6 +753,7 @@ static void dispatch_message_real(
-                 pid_t object_pid) {
- 
-         char source_time[sizeof("_SOURCE_REALTIME_TIMESTAMP=") + DECIMAL_STR_MAX(usec_t)];
-+        _cleanup_free_ char *cmdline1 = NULL, *cmdline2 = NULL;
-         uid_t journal_uid;
-         ClientContext *o;
- 
-@@ -769,20 +770,23 @@ static void dispatch_message_real(
-                 IOVEC_ADD_NUMERIC_FIELD(iovec, n, c->uid, uid_t, uid_is_valid, UID_FMT, "_UID");
-                 IOVEC_ADD_NUMERIC_FIELD(iovec, n, c->gid, gid_t, gid_is_valid, GID_FMT, "_GID");
- 
--                IOVEC_ADD_STRING_FIELD(iovec, n, c->comm, "_COMM");
--                IOVEC_ADD_STRING_FIELD(iovec, n, c->exe, "_EXE");
--                IOVEC_ADD_STRING_FIELD(iovec, n, c->cmdline, "_CMDLINE");
--                IOVEC_ADD_STRING_FIELD(iovec, n, c->capeff, "_CAP_EFFECTIVE");
-+                IOVEC_ADD_STRING_FIELD(iovec, n, c->comm, "_COMM"); /* At most TASK_COMM_LENGTH (16 bytes) */
-+                IOVEC_ADD_STRING_FIELD(iovec, n, c->exe, "_EXE"); /* A path, so at most PATH_MAX (4096 bytes) */
- 
--                IOVEC_ADD_SIZED_FIELD(iovec, n, c->label, c->label_size, "_SELINUX_CONTEXT");
-+                if (c->cmdline)
-+                        /* At most _SC_ARG_MAX (2MB usually), which is too much to put on stack.
-+                         * Let's use a heap allocation for this one. */
-+                        cmdline1 = set_iovec_string_field(iovec, &n, "_CMDLINE=", c->cmdline);
- 
-+                IOVEC_ADD_STRING_FIELD(iovec, n, c->capeff, "_CAP_EFFECTIVE"); /* Read from /proc/.../status */
-+                IOVEC_ADD_SIZED_FIELD(iovec, n, c->label, c->label_size, "_SELINUX_CONTEXT");
-                 IOVEC_ADD_NUMERIC_FIELD(iovec, n, c->auditid, uint32_t, audit_session_is_valid, "%" PRIu32, "_AUDIT_SESSION");
-                 IOVEC_ADD_NUMERIC_FIELD(iovec, n, c->loginuid, uid_t, uid_is_valid, UID_FMT, "_AUDIT_LOGINUID");
- 
--                IOVEC_ADD_STRING_FIELD(iovec, n, c->cgroup, "_SYSTEMD_CGROUP");
-+                IOVEC_ADD_STRING_FIELD(iovec, n, c->cgroup, "_SYSTEMD_CGROUP"); /* A path */
-                 IOVEC_ADD_STRING_FIELD(iovec, n, c->session, "_SYSTEMD_SESSION");
-                 IOVEC_ADD_NUMERIC_FIELD(iovec, n, c->owner_uid, uid_t, uid_is_valid, UID_FMT, "_SYSTEMD_OWNER_UID");
--                IOVEC_ADD_STRING_FIELD(iovec, n, c->unit, "_SYSTEMD_UNIT");
-+                IOVEC_ADD_STRING_FIELD(iovec, n, c->unit, "_SYSTEMD_UNIT"); /* Unit names are bounded by UNIT_NAME_MAX */
-                 IOVEC_ADD_STRING_FIELD(iovec, n, c->user_unit, "_SYSTEMD_USER_UNIT");
-                 IOVEC_ADD_STRING_FIELD(iovec, n, c->slice, "_SYSTEMD_SLICE");
-                 IOVEC_ADD_STRING_FIELD(iovec, n, c->user_slice, "_SYSTEMD_USER_SLICE");
-@@ -803,13 +807,14 @@ static void dispatch_message_real(
-                 IOVEC_ADD_NUMERIC_FIELD(iovec, n, o->uid, uid_t, uid_is_valid, UID_FMT, "OBJECT_UID");
-                 IOVEC_ADD_NUMERIC_FIELD(iovec, n, o->gid, gid_t, gid_is_valid, GID_FMT, "OBJECT_GID");
- 
-+                /* See above for size limits, only ->cmdline may be large, so use a heap allocation for it. */
-                 IOVEC_ADD_STRING_FIELD(iovec, n, o->comm, "OBJECT_COMM");
-                 IOVEC_ADD_STRING_FIELD(iovec, n, o->exe, "OBJECT_EXE");
--                IOVEC_ADD_STRING_FIELD(iovec, n, o->cmdline, "OBJECT_CMDLINE");
--                IOVEC_ADD_STRING_FIELD(iovec, n, o->capeff, "OBJECT_CAP_EFFECTIVE");
-+                if (o->cmdline)
-+                        cmdline2 = set_iovec_string_field(iovec, &n, "OBJECT_CMDLINE=", o->cmdline);
- 
-+                IOVEC_ADD_STRING_FIELD(iovec, n, o->capeff, "OBJECT_CAP_EFFECTIVE");
-                 IOVEC_ADD_SIZED_FIELD(iovec, n, o->label, o->label_size, "OBJECT_SELINUX_CONTEXT");
--
-                 IOVEC_ADD_NUMERIC_FIELD(iovec, n, o->auditid, uint32_t, audit_session_is_valid, "%" PRIu32, "OBJECT_AUDIT_SESSION");
-                 IOVEC_ADD_NUMERIC_FIELD(iovec, n, o->loginuid, uid_t, uid_is_valid, UID_FMT, "OBJECT_AUDIT_LOGINUID");
- 
--- 
-2.11.0
-
diff --git a/meta/recipes-core/systemd/systemd/0024-test-json.c-define-M_PIl.patch b/meta/recipes-core/systemd/systemd/0024-test-json.c-define-M_PIl.patch
new file mode 100644
index 0000000..c2ae2bb
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0024-test-json.c-define-M_PIl.patch
@@ -0,0 +1,33 @@
+From 902412c271e0c5d9cb93b10ec0fb5b119b393474 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Mon, 25 Feb 2019 16:53:06 +0800
+Subject: [PATCH 24/24] test-json.c: define M_PIl
+
+Fix the following compile failure:
+src/test/test-json.c:305:50: error: 'M_PIl' undeclared (first use in this function); did you mean 'M_PI'?
+
+Upstream-Status: Inappropriate [musl specific]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/test/test-json.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/test/test-json.c b/src/test/test-json.c
+index fdf1b4f..fa541f8 100644
+--- a/src/test/test-json.c
++++ b/src/test/test-json.c
+@@ -10,6 +10,10 @@
+ #include "strv.h"
+ #include "util.h"
+ 
++#ifndef M_PIl
++#define M_PIl 3.141592653589793238462643383279502884L
++#endif
++
+ static void test_tokenizer(const char *data, ...) {
+         unsigned line = 0, column = 0;
+         void *state = NULL;
+-- 
+2.7.4
+
diff --git a/meta/recipes-core/systemd/systemd/0025-journald-set-a-limit-on-the-number-of-fields.patch b/meta/recipes-core/systemd/systemd/0025-journald-set-a-limit-on-the-number-of-fields.patch
deleted file mode 100644
index ae9ef5d..0000000
--- a/meta/recipes-core/systemd/systemd/0025-journald-set-a-limit-on-the-number-of-fields.patch
+++ /dev/null
@@ -1,139 +0,0 @@
-From 7cad044b72406cbadf048da432c29afea74c3c10 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
-Date: Wed, 5 Dec 2018 22:45:02 +0100
-Subject: [PATCH] journald: set a limit on the number of fields
-
-The fix for CVE-2018-16865 is plucked from two commits that have
-been pushed to systemd master.
-
-journald: set a limit on the number of fields (1k)
-
-We allocate a iovec entry for each field, so with many short entries,
-our memory usage and processing time can be large, even with a relatively
-small message size. Let's refuse overly long entries.
-
-CVE-2018-16865
-https://bugzilla.redhat.com/show_bug.cgi?id=1653861
-
-What from I can see, the problem is not from an alloca, despite what the CVE
-description says, but from the attack multiplication that comes from creating
-many very small iovecs: (void* + size_t) for each three bytes of input message.
-
-Patch backported from systemd master at
-052c57f132f04a3cf4148f87561618da1a6908b4.
-
-journal-remote: set a limit on the number of fields in a message
-
-Existing use of E2BIG is replaced with ENOBUFS (entry too long), and E2BIG is
-reused for the new error condition (too many fields).
-
-This matches the change done for systemd-journald, hence forming the second
-part of the fix for CVE-2018-16865
-(https://bugzilla.redhat.com/show_bug.cgi?id=1653861).
-
-Patch backported from systemd master at
-ef4d6abe7c7fab6cbff975b32e76b09feee56074.
-with the changes applied by 7fdb237f5473cb8fc2129e57e8a0039526dcb4fd
-removed.
-
-CVE: CVE-2018-16865
-Upstream-Status: Backport
-Signed-off-by: Marcus Cooper <marcusc@axis.com>
----
- src/basic/journal-importer.c             | 5 ++++-
- src/basic/journal-importer.h             | 3 +++
- src/journal-remote/journal-remote-main.c | 7 ++++++-
- src/journal-remote/journal-remote.c      | 5 ++++-
- src/journal/journald-native.c            | 5 +++++
- 5 files changed, 22 insertions(+), 3 deletions(-)
-
-diff --git a/src/basic/journal-importer.c b/src/basic/journal-importer.c
-index ca203bbbfc..3ac55a66d9 100644
---- a/src/basic/journal-importer.c
-+++ b/src/basic/journal-importer.c
-@@ -23,6 +23,9 @@ enum {
- };
- 
- static int iovw_put(struct iovec_wrapper *iovw, void* data, size_t len) {
-+        if (iovw->count >= ENTRY_FIELD_COUNT_MAX)
-+                return -E2BIG;
-+
-         if (!GREEDY_REALLOC(iovw->iovec, iovw->size_bytes, iovw->count + 1))
-                 return log_oom();
- 
-@@ -98,7 +101,7 @@ static int get_line(JournalImporter *imp, char **line, size_t *size) {
-                 imp->scanned = imp->filled;
-                 if (imp->scanned >= DATA_SIZE_MAX) {
-                         log_error("Entry is bigger than %u bytes.", DATA_SIZE_MAX);
--                        return -E2BIG;
-+                        return -ENOBUFS;
-                 }
- 
-                 if (imp->passive_fd)
-diff --git a/src/basic/journal-importer.h b/src/basic/journal-importer.h
-index f49ce734a1..c4ae45d32d 100644
---- a/src/basic/journal-importer.h
-+++ b/src/basic/journal-importer.h
-@@ -16,6 +16,9 @@
- #define DATA_SIZE_MAX (1024*1024*768u)
- #define LINE_CHUNK 8*1024u
- 
-+/* The maximum number of fields in an entry */
-+#define ENTRY_FIELD_COUNT_MAX 1024
-+
- struct iovec_wrapper {
-         struct iovec *iovec;
-         size_t size_bytes;
-diff --git a/src/journal-remote/journal-remote-main.c b/src/journal-remote/journal-remote-main.c
-index 8fda9d1499..3a01fef646 100644
---- a/src/journal-remote/journal-remote-main.c
-+++ b/src/journal-remote/journal-remote-main.c
-@@ -212,7 +212,12 @@ static int process_http_upload(
-                         break;
-                 else if (r < 0) {
-                         log_warning("Failed to process data for connection %p", connection);
--                        if (r == -E2BIG)
-+                        if (r == -ENOBUFS)
-+                                return mhd_respondf(connection,
-+                                                    r, MHD_HTTP_PAYLOAD_TOO_LARGE,
-+                                                    "Entry is above the maximum of %u, aborting connection %p.",
-+                                                    DATA_SIZE_MAX, connection);
-+                        else if (r == -E2BIG)
-                                 return mhd_respondf(connection,
-                                                     r, MHD_HTTP_PAYLOAD_TOO_LARGE,
-                                                     "Entry is too large, maximum is " STRINGIFY(DATA_SIZE_MAX) " bytes.");
-diff --git a/src/journal-remote/journal-remote.c b/src/journal-remote/journal-remote.c
-index beb75a1cb4..67e3a70c06 100644
---- a/src/journal-remote/journal-remote.c
-+++ b/src/journal-remote/journal-remote.c
-@@ -408,7 +408,10 @@ int journal_remote_handle_raw_source(
-                 log_debug("%zu active sources remaining", s->active);
-                 return 0;
-         } else if (r == -E2BIG) {
--                log_notice_errno(E2BIG, "Entry too big, skipped");
-+                log_notice("Entry with too many fields, skipped");
-+                return 1;
-+        } else if (r == -ENOBUFS) {
-+                log_notice("Entry too big, skipped");
-                 return 1;
-         } else if (r == -EAGAIN) {
-                 return 0;
-diff --git a/src/journal/journald-native.c b/src/journal/journald-native.c
-index 5ff22a10af..951d092053 100644
---- a/src/journal/journald-native.c
-+++ b/src/journal/journald-native.c
-@@ -140,6 +140,11 @@ static int server_process_entry(
-                 }
- 
-                 /* A property follows */
-+                if (n > ENTRY_FIELD_COUNT_MAX) {
-+                        log_debug("Received an entry that has more than " STRINGIFY(ENTRY_FIELD_COUNT_MAX) " fields, ignoring entry.");
-+                        r = 1;
-+                        goto finish;
-+                }
- 
-                 /* n existing properties, 1 new, +1 for _TRANSPORT */
-                 if (!GREEDY_REALLOC(iovec, m,
--- 
-2.11.0
-
diff --git a/meta/recipes-core/systemd/systemd/0026-journal-fix-out-of-bounds-read-CVE-2018-16866.patch b/meta/recipes-core/systemd/systemd/0026-journal-fix-out-of-bounds-read-CVE-2018-16866.patch
deleted file mode 100644
index 3925a4a..0000000
--- a/meta/recipes-core/systemd/systemd/0026-journal-fix-out-of-bounds-read-CVE-2018-16866.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From ebd06c37d4311db9851f4d3fdd023de3dd590de0 Mon Sep 17 00:00:00 2001
-From: Filipe Brandenburger <filbranden@google.com>
-Date: Thu, 10 Jan 2019 14:53:33 -0800
-Subject: [PATCH] journal: fix out-of-bounds read CVE-2018-16866
-
-The original code didn't account for the fact that strchr() would match on the
-'\0' character, making it read past the end of the buffer if no non-whitespace
-character was present.
-
-This bug was introduced in commit ec5ff4445cca6a which was first released in
-systemd v221 and later fixed in commit 8595102d3ddde6 which was released in
-v240, so versions in the range [v221, v240) are affected.
-
-Patch backported from systemd-stable at f005e73d3723d62a39be661931fcb6347119b52b
-also includes a change from systemd master which removes a heap buffer overflow
-a6aadf4ae0bae185dc4c414d492a4a781c80ffe5.
-
-CVE: CVE-2018-16866
-Upstream-Status: Backport
-Signed-off-by: Marcus Cooper <marcusc@axis.com>
----
- src/journal/journald-syslog.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/journal/journald-syslog.c b/src/journal/journald-syslog.c
-index 9dea116722..809b318c06 100644
---- a/src/journal/journald-syslog.c
-+++ b/src/journal/journald-syslog.c
-@@ -194,7 +194,7 @@ size_t syslog_parse_identifier(const char **buf, char **identifier, char **pid)
-         e = l;
-         l--;
- 
--        if (p[l-1] == ']') {
-+        if (l > 0 && p[l-1] == ']') {
-                 size_t k = l-1;
- 
-                 for (;;) {
-@@ -219,7 +219,7 @@ size_t syslog_parse_identifier(const char **buf, char **identifier, char **pid)
-         if (t)
-                 *identifier = t;
- 
--        if (strchr(WHITESPACE, p[e]))
-+        if (p[e] != '\0' && strchr(WHITESPACE, p[e]))
-                 e++;
-         *buf = p + e;
-         return e;
--- 
-2.11.0
-
diff --git a/meta/recipes-core/systemd/systemd/CVE-2019-6454.patch b/meta/recipes-core/systemd/systemd/CVE-2019-6454.patch
deleted file mode 100644
index 80170dac..0000000
--- a/meta/recipes-core/systemd/systemd/CVE-2019-6454.patch
+++ /dev/null
@@ -1,210 +0,0 @@
-Description: sd-bus: enforce a size limit for dbus paths, and don't allocate
- them on the stacka
-Forwarded: no
-
-Patch from: systemd_239-7ubuntu10.8
-
-For information see:
-https://usn.ubuntu.com/3891-1/
-https://git.launchpad.net/ubuntu/+source/systemd/commit/?id=f8e75d5634904c8e672658856508c3a02f349adb
-
-CVE: CVE-2019-6454
-Upstream-Status: Backport
-
-Signed-off-by: George McCollister <george.mccollister@gmail.com>
-
---- a/src/libsystemd/sd-bus/bus-internal.c
-+++ b/src/libsystemd/sd-bus/bus-internal.c
-@@ -45,7 +45,7 @@
-         if (slash)
-                 return false;
-
--        return true;
-+        return (q - p) <= BUS_PATH_SIZE_MAX;
- }
-
- char* object_path_startswith(const char *a, const char *b) {
---- a/src/libsystemd/sd-bus/bus-internal.h
-+++ b/src/libsystemd/sd-bus/bus-internal.h
-@@ -333,6 +333,10 @@
-
- #define BUS_MESSAGE_SIZE_MAX (128*1024*1024)
- #define BUS_AUTH_SIZE_MAX (64*1024)
-+/* Note that the D-Bus specification states that bus paths shall have no size limit. We enforce here one
-+ * anyway, since truly unbounded strings are a security problem. The limit we pick is relatively large however,
-+ * to not clash unnecessarily with real-life applications. */
-+#define BUS_PATH_SIZE_MAX (64*1024)
-
- #define BUS_CONTAINER_DEPTH 128
-
---- a/src/libsystemd/sd-bus/bus-objects.c
-+++ b/src/libsystemd/sd-bus/bus-objects.c
-@@ -1134,7 +1134,8 @@
-                 const char *path,
-                 sd_bus_error *error) {
-
--        char *prefix;
-+        _cleanup_free_ char *prefix = NULL;
-+        size_t pl;
-         int r;
-
-         assert(bus);
-@@ -1150,7 +1151,12 @@
-                 return 0;
-
-         /* Second, add fallback vtables registered for any of the prefixes */
--        prefix = alloca(strlen(path) + 1);
-+        pl = strlen(path);
-+        assert(pl <= BUS_PATH_SIZE_MAX);
-+        prefix = new(char, pl + 1);
-+        if (!prefix)
-+                return -ENOMEM;
-+
-         OBJECT_PATH_FOREACH_PREFIX(prefix, path) {
-                 r = object_manager_serialize_path(bus, reply, prefix, path, true, error);
-                 if (r < 0)
-@@ -1346,6 +1352,7 @@
- }
-
- int bus_process_object(sd_bus *bus, sd_bus_message *m) {
-+        _cleanup_free_ char *prefix = NULL;
-         int r;
-         size_t pl;
-         bool found_object = false;
-@@ -1370,9 +1377,12 @@
-         assert(m->member);
-
-         pl = strlen(m->path);
--        do {
--                char prefix[pl+1];
-+        assert(pl <= BUS_PATH_SIZE_MAX);
-+        prefix = new(char, pl + 1);
-+        if (!prefix)
-+                return -ENOMEM;
-
-+        do {
-                 bus->nodes_modified = false;
-
-                 r = object_find_and_run(bus, m, m->path, false, &found_object);
-@@ -1499,9 +1509,15 @@
-
-         n = hashmap_get(bus->nodes, path);
-         if (!n) {
--                char *prefix;
-+                _cleanup_free_ char *prefix = NULL;
-+                size_t pl;
-+
-+                pl = strlen(path);
-+                assert(pl <= BUS_PATH_SIZE_MAX);
-+                prefix = new(char, pl + 1);
-+                if (!prefix)
-+                        return -ENOMEM;
-
--                prefix = alloca(strlen(path) + 1);
-                 OBJECT_PATH_FOREACH_PREFIX(prefix, path) {
-                         n = hashmap_get(bus->nodes, prefix);
-                         if (n)
-@@ -2091,8 +2107,9 @@
-                 char **names) {
-
-         BUS_DONT_DESTROY(bus);
-+        _cleanup_free_ char *prefix = NULL;
-         bool found_interface = false;
--        char *prefix;
-+        size_t pl;
-         int r;
-
-         assert_return(bus, -EINVAL);
-@@ -2111,6 +2128,12 @@
-         if (names && names[0] == NULL)
-                 return 0;
-
-+        pl = strlen(path);
-+        assert(pl <= BUS_PATH_SIZE_MAX);
-+        prefix = new(char, pl + 1);
-+        if (!prefix)
-+                return -ENOMEM;
-+
-         do {
-                 bus->nodes_modified = false;
-
-@@ -2120,7 +2143,6 @@
-                 if (bus->nodes_modified)
-                         continue;
-
--                prefix = alloca(strlen(path) + 1);
-                 OBJECT_PATH_FOREACH_PREFIX(prefix, path) {
-                         r = emit_properties_changed_on_interface(bus, prefix, path, interface, true, &found_interface, names);
-                         if (r != 0)
-@@ -2252,7 +2274,8 @@
-
- static int object_added_append_all(sd_bus *bus, sd_bus_message *m, const char *path) {
-         _cleanup_set_free_ Set *s = NULL;
--        char *prefix;
-+        _cleanup_free_ char *prefix = NULL;
-+        size_t pl;
-         int r;
-
-         assert(bus);
-@@ -2297,7 +2320,12 @@
-         if (bus->nodes_modified)
-                 return 0;
-
--        prefix = alloca(strlen(path) + 1);
-+        pl = strlen(path);
-+        assert(pl <= BUS_PATH_SIZE_MAX);
-+        prefix = new(char, pl + 1);
-+        if (!prefix)
-+                return -ENOMEM;
-+
-         OBJECT_PATH_FOREACH_PREFIX(prefix, path) {
-                 r = object_added_append_all_prefix(bus, m, s, prefix, path, true);
-                 if (r < 0)
-@@ -2436,7 +2464,8 @@
-
- static int object_removed_append_all(sd_bus *bus, sd_bus_message *m, const char *path) {
-         _cleanup_set_free_ Set *s = NULL;
--        char *prefix;
-+        _cleanup_free_ char *prefix = NULL;
-+        size_t pl;
-         int r;
-
-         assert(bus);
-@@ -2468,7 +2497,12 @@
-         if (bus->nodes_modified)
-                 return 0;
-
--        prefix = alloca(strlen(path) + 1);
-+        pl = strlen(path);
-+        assert(pl <= BUS_PATH_SIZE_MAX);
-+        prefix = new(char, pl + 1);
-+        if (!prefix)
-+                return -ENOMEM;
-+
-         OBJECT_PATH_FOREACH_PREFIX(prefix, path) {
-                 r = object_removed_append_all_prefix(bus, m, s, prefix, path, true);
-                 if (r < 0)
-@@ -2618,7 +2652,8 @@
-                 const char *path,
-                 const char *interface) {
-
--        char *prefix;
-+        _cleanup_free_ char *prefix = NULL;
-+        size_t pl;
-         int r;
-
-         assert(bus);
-@@ -2632,7 +2667,12 @@
-         if (bus->nodes_modified)
-                 return 0;
-
--        prefix = alloca(strlen(path) + 1);
-+        pl = strlen(path);
-+        assert(pl <= BUS_PATH_SIZE_MAX);
-+        prefix = new(char, pl + 1);
-+        if (!prefix)
-+                return -ENOMEM;
-+
-         OBJECT_PATH_FOREACH_PREFIX(prefix, path) {
-                 r = interfaces_added_append_one_prefix(bus, m, prefix, path, interface, true);
-                 if (r != 0)
diff --git a/meta/recipes-core/systemd/systemd/sd-bus-if-we-receive-an-invalid-dbus-message-ignore-.patch b/meta/recipes-core/systemd/systemd/sd-bus-if-we-receive-an-invalid-dbus-message-ignore-.patch
deleted file mode 100644
index 57311fa..0000000
--- a/meta/recipes-core/systemd/systemd/sd-bus-if-we-receive-an-invalid-dbus-message-ignore-.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-Description: sd-bus: if we receive an invalid dbus message, ignore and
- proceeed
- .
- dbus-daemon might have a slightly different idea of what a valid msg is
- than us (for example regarding valid msg and field sizes). Let's hence
- try to proceed if we can and thus drop messages rather than fail the
- connection if we fail to validate a message.
- .
- Hopefully the differences in what is considered valid are not visible
- for real-life usecases, but are specific to exploit attempts only.
-Author: Lennart Poettering <lennart@poettering.net>
-Forwarded: other,https://github.com/systemd/systemd/pull/11708/
-
-Patch from: systemd_239-7ubuntu10.8
-
-For information see:
-https://usn.ubuntu.com/3891-1/
-https://git.launchpad.net/ubuntu/+source/systemd/commit/?id=f8e75d5634904c8e672658856508c3a02f349adb
-
-CVE: CVE-2019-6454
-Upstream-Status: Backport
-
-Signed-off-by: George McCollister <george.mccollister@gmail.com>
-
-diff --git a/src/libsystemd/sd-bus/bus-socket.c b/src/libsystemd/sd-bus/bus-socket.c
-index 30d6455b6f..441b4a816f 100644
---- a/src/libsystemd/sd-bus/bus-socket.c
-+++ b/src/libsystemd/sd-bus/bus-socket.c
-@@ -1072,7 +1072,7 @@ static int bus_socket_read_message_need(sd_bus *bus, size_t *need) {
- }
-
- static int bus_socket_make_message(sd_bus *bus, size_t size) {
--        sd_bus_message *t;
-+        sd_bus_message *t = NULL;
-         void *b;
-         int r;
-
-@@ -1097,7 +1097,9 @@ static int bus_socket_make_message(sd_bus *bus, size_t size) {
-                                     bus->fds, bus->n_fds,
-                                     NULL,
-                                     &t);
--        if (r < 0) {
-+        if (r == -EBADMSG)
-+                log_debug_errno(r, "Received invalid message from connection %s, dropping.", strna(bus->description));
-+        else if (r < 0) {
-                 free(b);
-                 return r;
-         }
-@@ -1108,7 +1110,8 @@ static int bus_socket_make_message(sd_bus *bus, size_t size) {
-         bus->fds = NULL;
-         bus->n_fds = 0;
-
--        bus->rqueue[bus->rqueue_size++] = t;
-+        if (t)
-+                bus->rqueue[bus->rqueue_size++] = t;
-
-         return 1;
- }
---
-2.17.1
-
diff --git a/meta/recipes-core/systemd/systemd_239.bb b/meta/recipes-core/systemd/systemd_241.bb
similarity index 89%
rename from meta/recipes-core/systemd/systemd_239.bb
rename to meta/recipes-core/systemd/systemd_241.bb
index 7af2972..44a132a 100644
--- a/meta/recipes-core/systemd/systemd_239.bb
+++ b/meta/recipes-core/systemd/systemd_241.bb
@@ -21,60 +21,38 @@ SRC_URI += "file://touchscreen.rules \
            file://0002-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch \
            file://0003-implment-systemd-sysv-install-for-OE.patch \
            file://0004-rules-whitelist-hd-devices.patch \
-           file://0005-Make-root-s-home-directory-configurable.patch \
-           file://0006-remove-nobody-user-group-checking.patch \
-           file://0007-rules-watch-metadata-changes-in-ide-devices.patch \
-           file://0008-Do-not-enable-nss-tests-if-nss-systemd-is-not-enable.patch \
-           file://0009-nss-mymachines-Build-conditionally-when-ENABLE_MYHOS.patch \
-           file://0001-login-use-parse_uid-when-unmounting-user-runtime-dir.patch \
-           file://0001-sd-bus-make-BUS_DEFAULT_TIMEOUT-configurable.patch \
-           file://0022-build-sys-Detect-whether-struct-statx-is-defined-in-.patch \
-           file://0023-resolvconf-fixes-for-the-compatibility-interface.patch \
-           file://0001-core-when-deserializing-state-always-use-read_line-L.patch \
-           file://0001-chown-recursive-let-s-rework-the-recursive-logic-to-.patch \
-           file://0001-dhcp6-make-sure-we-have-enough-space-for-the-DHCP6-o.patch \
-           file://0001-Revert-sysctl.d-request-ECN-on-both-in-and-outgoing-.patch \
-           file://0001-timesync-changes-type-of-drift_freq-to-int64_t.patch \
-           file://0001-sysctl-Don-t-pass-null-directive-argument-to-s.patch \
-           file://0002-core-Fix-use-after-free-case-in-load_from_path.patch \
-           file://0001-meson-rename-Ddebug-to-Ddebug-extra.patch \
-           file://0024-journald-do-not-store-the-iovec-entry-for-process-co.patch \
-           file://0025-journald-set-a-limit-on-the-number-of-fields.patch \
-           file://0026-journal-fix-out-of-bounds-read-CVE-2018-16866.patch \
-           file://CVE-2019-6454.patch \
-           file://sd-bus-if-we-receive-an-invalid-dbus-message-ignore-.patch \
+           file://0005-rules-watch-metadata-changes-in-ide-devices.patch \
            "
 
-# patches made for musl are only applied on TCLIBC is musl
+# patches needed by musl
 SRC_URI += "${SRC_URI_MUSL}"
 SRC_URI_MUSL = "file://0001-Use-getenv-when-secure-versions-are-not-available.patch \
                file://0002-don-t-use-glibc-specific-qsort_r.patch \
-               file://0003-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch \
+               file://0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch \
                file://0004-add-fallback-parse_printf_format-implementation.patch \
-               file://0005-basic-user-util-properly-protect-use-of-gshadow.patch \
-               file://0006-src-basic-missing.h-check-for-missing-strndupa.patch \
-               file://0007-Include-netinet-if_ether.h.patch \
-               file://0008-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch \
-               file://0009-add-missing-FTW_-macros-for-musl.patch \
-               file://0010-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch \
-               file://0011-src-basic-missing.h-check-for-missing-__compar_fn_t-.patch \
-               file://0012-fix-missing-of-__register_atfork-for-non-glibc-build.patch \
-               file://0013-Use-uintmax_t-for-handling-rlim_t.patch \
-               file://0014-fix-missing-ULONG_LONG_MAX-definition-in-case-of-mus.patch \
-               file://0015-test-hexdecoct.c-Include-missing.h-for-strndupa.patch \
-               file://0016-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch \
-               file://0017-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch \
-               file://0018-Define-glibc-compatible-basename-for-non-glibc-syste.patch \
-               file://0019-Do-not-disable-buffering-when-writing-to-oom_score_a.patch \
-               file://0020-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch \
-               file://0021-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch \
-               file://0022-Use-if-instead-of-ifdef-for-ENABLE_GSHADOW.patch \
+               file://0005-src-basic-missing.h-check-for-missing-strndupa.patch \
+               file://0006-Include-netinet-if_ether.h.patch \
+               file://0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not.patch \
+               file://0008-add-missing-FTW_-macros-for-musl.patch \
+               file://0009-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch \
+               file://0010-fix-missing-of-__register_atfork-for-non-glibc-build.patch \
+               file://0011-Use-uintmax_t-for-handling-rlim_t.patch \
+               file://0012-fix-missing-ULONG_LONG_MAX-definition-in-case-of-mus.patch \
+               file://0013-test-hexdecoct.c-Include-missing.h-for-strndupa.patch \
+               file://0014-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch \
+               file://0015-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch \
+               file://0016-Define-glibc-compatible-basename-for-non-glibc-syste.patch \
+               file://0017-Do-not-disable-buffering-when-writing-to-oom_score_a.patch \
+               file://0018-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch \
+               file://0019-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch \
+               file://0020-missing_type.h-add-__compar_d_fn_t-definition.patch \
+               file://0021-avoid-redefinition-of-prctl_mm_map-structure.patch \
+               file://0022-include-sys-wait.h-to-avoid-compile-failure.patch \
+               file://0023-socket-util.h-include-string.h.patch \
+               file://0024-test-json.c-define-M_PIl.patch \
+               file://0001-do-not-disable-buffer-in-writing-files.patch \
                "
 
-# Workaround undefined reference to `__stack_chk_fail_local' on qemux86 and qemuppc for musl
-SRC_URI_append_libc-musl_qemux86 = " file://0001-Remove-fstack-protector-flags-to-workaround-musl-bui.patch"
-SRC_URI_append_libc-musl_qemuppc = " file://0001-Remove-fstack-protector-flags-to-workaround-musl-bui.patch"
-
 PAM_PLUGINS = " \
     pam-plugin-unix \
     pam-plugin-loginuid \
@@ -100,6 +78,8 @@ PACKAGECONFIG ??= " \
     myhostname \
     networkd \
     nss \
+    nss-mymachines \
+    nss-resolve \
     quotacheck \
     randomseed \
     resolved \
@@ -117,6 +97,8 @@ PACKAGECONFIG_remove_libc-musl = " \
     localed \
     myhostname \
     nss \
+    nss-mymachines \
+    nss-resolve \
     resolved \
     selinux \
     smack \
@@ -161,9 +143,11 @@ PACKAGECONFIG[lz4] = "-Dlz4=true,-Dlz4=false,lz4"
 PACKAGECONFIG[machined] = "-Dmachined=true,-Dmachined=false"
 PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false,libxslt-native xmlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
 PACKAGECONFIG[microhttpd] = "-Dmicrohttpd=true,-Dmicrohttpd=false,libmicrohttpd"
-PACKAGECONFIG[myhostname] = "-Dmyhostname=true,-Dmyhostname=false"
+PACKAGECONFIG[myhostname] = "-Dnss-myhostname=true,-Dnss-myhostname=false"
 PACKAGECONFIG[networkd] = "-Dnetworkd=true,-Dnetworkd=false"
 PACKAGECONFIG[nss] = "-Dnss-systemd=true,-Dnss-systemd=false"
+PACKAGECONFIG[nss-mymachines] = "-Dnss-mymachines=true,-Dnss-mymachines=false"
+PACKAGECONFIG[nss-resolve] = "-Dnss-resolve=true,-Dnss-resolve=false"
 PACKAGECONFIG[pam] = "-Dpam=true,-Dpam=false,libpam,${PAM_PLUGINS}"
 PACKAGECONFIG[polkit] = "-Dpolkit=true,-Dpolkit=false"
 PACKAGECONFIG[portabled] = "-Dportabled=true,-Dportabled=false"
@@ -203,7 +187,6 @@ EXTRA_OEMESON += "-Dlink-udev-shared=false"
 
 EXTRA_OEMESON += "-Dnobody-user=nobody \
                   -Dnobody-group=nobody \
-                  -Droothomedir=${ROOT_HOME} \
                   -Drootlibdir=${rootlibdir} \
                   -Drootprefix=${rootprefix} \
                   -Dsysvrcnd-path=${sysconfdir} \
-- 
1.9.1


