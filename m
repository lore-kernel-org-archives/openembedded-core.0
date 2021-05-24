Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web08.20624.1621847647124533866
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 May 2021 02:14:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nLQomPEY;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id r11so31012484edt.13
        for <openembedded-core@lists.openembedded.org>; Mon, 24 May 2021 02:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VuW3P8sABx7hhX9k7TVTPQ1vE3LVKaYK8rHFnzJjhMw=;
        b=nLQomPEYv1D/UaKAHMpO7Yp09UoVjppKBcfaz9mW9PToSLJzbVyy7MbHKVzYGK9jaB
         Wz19cpls5BMVRbJjAklr++Obg24mUNRMjQ0FPnkFWEPZhPCIWT1gqWxmyrzBz3rom5G9
         YMdsnpegMONumi4BQMcqNYeMXmWv8IaDGE/8IyR1gwcS8fnSrChMpV/7pGGjQfX+x8iI
         BXPVHNM6BB6NGUgs0WvCtp6oP6OK/ZYYAWN/H8NH6TOU+38HZcL5CPbfcDFwUc7DnJEa
         1/0HUIpK2tYLaUJvXCjK9ymLYDHHV07oAEG5WPfFH4pa4ZvsLN8QzFrwktIcHu8DmxqP
         34jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VuW3P8sABx7hhX9k7TVTPQ1vE3LVKaYK8rHFnzJjhMw=;
        b=RHui4FdVSMhRYlv/+XnnETeJqgbgsJSf16gLF12xAxokKA4HSqV1zmrYgFKLEJjvm6
         mCoJw77LhREiNW/En/FiX2omtM0BUxJy1gEzTp4+uddPWn+LfMHNPzjaJs2d6ddg58PB
         cMn+SRjk2R0aZjm8gEe1I+DmJRFdlU3BQtr8Oi9OQzufMoyUtntLx2D9SAov9P2zaxVq
         xYWzPQjFwccVBaPN8bh6JIa07/K38suKKMFrHipcV3JCr7O8BkxtjfThcMnzjYF/nfSF
         FkZ0AhwWRef4PRDBfyccTgDbAyW2qpsFCSAI3ASWgv3j6+xBrWvqsz+MucdB7yVmRYXt
         WH1g==
X-Gm-Message-State: AOAM533MTBWmh0JyA8VxNBYeHaCmLLptc/pOLetm3Vbjz6s+JdcjxzTu
	3hOHzaLM8/kOqeKCIt4e/AXVCBgKYlo=
X-Google-Smtp-Source: ABdhPJyYkSej+R0lQA+7Y1l0jZFB8FXnNwdqHZtXzYH9EFu+1R/HnRZCP84vY8Xzh5C6/5+JJgC3dw==
X-Received: by 2002:a05:6402:1158:: with SMTP id g24mr24228539edw.134.1621847644733;
        Mon, 24 May 2021 02:14:04 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id h9sm8673490ede.93.2021.05.24.02.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 02:14:04 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 02/21] systemd: update 247.6 -> 248.3
Date: Mon, 24 May 2021 11:13:28 +0200
Message-Id: <20210524091347.419253-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210524091347.419253-1-alex.kanavin@gmail.com>
References: <20210524091347.419253-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop backports:
48fff0a2af3f62acd446ebec8081b039b72caad8.patch
7c5fd25119a495009ea62f79e5daec34cc464628.patch
0001-analyze-resolve-executable-path-if-it-is-relative.patch
0001-analyze-resolve-executable-path-if-it-is-relative.patch

Drop 0027-proc-dont-trigger-mount-error-with-invalid-options-o.patch
as difficult to rebase; please resend if you feel strongly that
it is needed.

Rebase the big pile of musl patches.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...f0a2af3f62acd446ebec8081b039b72caad8.patch | 179 --------------
 ...d25119a495009ea62f79e5daec34cc464628.patch |  53 ----
 ...md-boot_247.6.bb => systemd-boot_248.3.bb} |   0
 meta/recipes-core/systemd/systemd.inc         |   6 +-
 ...ve-executable-path-if-it-is-relative.patch |  39 ---
 ...chvt-as-non-root-user-without-polkit.patch | 227 ------------------
 ...002-don-t-use-glibc-specific-qsort_r.patch |  29 ++-
 ...dd-__compare_fn_t-and-comparison_fn_.patch |  26 +-
 ...k-parse_printf_format-implementation.patch |  46 ++--
 ...missing.h-check-for-missing-strndupa.patch | 204 ++++++++++++----
 .../0006-Include-netinet-if_ether.h.patch     |  56 +++--
 ...OB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch |  17 +-
 ...008-add-missing-FTW_-macros-for-musl.patch |   8 +-
 ..._register_atfork-for-non-glibc-build.patch |  12 +-
 ...10-Use-uintmax_t-for-handling-rlim_t.patch |  18 +-
 ...sable-tests-for-missing-typedefs-in-.patch |   9 +-
 ...T_SYMLINK_NOFOLLOW-flag-to-faccessat.patch |  19 +-
 ...patible-basename-for-non-glibc-syste.patch |  11 +-
 ...uffering-when-writing-to-oom_score_a.patch |  12 +-
 ...compliant-strerror_r-from-GNU-specif.patch |  46 ++--
 ...S_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch |   8 +-
 ...ype.h-add-__compar_d_fn_t-definition.patch |   8 +-
 ...definition-of-prctl_mm_map-structure.patch |   8 +-
 .../systemd/0019-Handle-missing-LOCK_EX.patch |  10 +-
 ...ible-pointer-type-struct-sockaddr_un.patch |  12 +-
 .../0021-test-json.c-define-M_PIl.patch       |   8 +-
 ...-not-disable-buffer-in-writing-files.patch | 116 ++++-----
 .../0025-Handle-__cpu_mask-usage.patch        |   8 +-
 .../systemd/0026-Handle-missing-gshadow.patch |  20 +-
 ...r-mount-error-with-invalid-options-o.patch |  97 --------
 ...l.h-Define-MIPS-ABI-defines-for-musl.patch |  16 +-
 .../{systemd_247.6.bb => systemd_248.3.bb}    |  11 +-
 32 files changed, 388 insertions(+), 951 deletions(-)
 delete mode 100644 meta/recipes-core/systemd/files/48fff0a2af3f62acd446ebec8081b039b72caad8.patch
 delete mode 100644 meta/recipes-core/systemd/files/7c5fd25119a495009ea62f79e5daec34cc464628.patch
 rename meta/recipes-core/systemd/{systemd-boot_247.6.bb => systemd-boot_248.3.bb} (100%)
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-analyze-resolve-executable-path-if-it-is-relative.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-logind-Restore-chvt-as-non-root-user-without-polkit.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0027-proc-dont-trigger-mount-error-with-invalid-options-o.patch
 rename meta/recipes-core/systemd/{systemd_247.6.bb => systemd_248.3.bb} (99%)

diff --git a/meta/recipes-core/systemd/files/48fff0a2af3f62acd446ebec8081b039b72caad8.patch b/meta/recipes-core/systemd/files/48fff0a2af3f62acd446ebec8081b039b72caad8.patch
deleted file mode 100644
index e3ce296741..0000000000
--- a/meta/recipes-core/systemd/files/48fff0a2af3f62acd446ebec8081b039b72caad8.patch
+++ /dev/null
@@ -1,179 +0,0 @@
-From 48fff0a2af3f62acd446ebec8081b039b72caad8 Mon Sep 17 00:00:00 2001
-From: Daan De Meyer <daan.j.demeyer@gmail.com>
-Date: Fri, 12 Mar 2021 22:09:44 +0000
-Subject: [PATCH] boot: Move console declarations to missing_efi.h
-
-These were added to eficonex.h in gnu-efi 3.0.13. Let's move them
-to missing_efi.h behind an appropriate guard to fix the build with
-recent versions of gnu-efi.
-
-(cherry picked from commit 95ba433a5f34baf92921fb58051bc8241f908c0e)
-
-Upstream-Status: Backport
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- src/boot/efi/console.c     | 57 --------------------------------
- src/boot/efi/console.h     |  6 +---
- src/boot/efi/missing_efi.h | 67 ++++++++++++++++++++++++++++++++++++++
- 3 files changed, 68 insertions(+), 62 deletions(-)
-
-diff --git a/src/boot/efi/console.c b/src/boot/efi/console.c
-index 2dd4543d51..1d6dfeeea2 100644
---- a/src/boot/efi/console.c
-+++ b/src/boot/efi/console.c
-@@ -9,63 +9,6 @@
- #define SYSTEM_FONT_WIDTH 8
- #define SYSTEM_FONT_HEIGHT 19
- 
--#define EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL_GUID \
--        { 0xdd9e7534, 0x7762, 0x4698, { 0x8c, 0x14, 0xf5, 0x85, 0x17, 0xa6, 0x25, 0xaa } }
--
--struct _EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL;
--
--typedef EFI_STATUS (EFIAPI *EFI_INPUT_RESET_EX)(
--        struct _EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL *This,
--        BOOLEAN ExtendedVerification
--);
--
--typedef UINT8 EFI_KEY_TOGGLE_STATE;
--
--typedef struct {
--        UINT32 KeyShiftState;
--        EFI_KEY_TOGGLE_STATE KeyToggleState;
--} EFI_KEY_STATE;
--
--typedef struct {
--        EFI_INPUT_KEY Key;
--        EFI_KEY_STATE KeyState;
--} EFI_KEY_DATA;
--
--typedef EFI_STATUS (EFIAPI *EFI_INPUT_READ_KEY_EX)(
--        struct _EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL *This,
--        EFI_KEY_DATA *KeyData
--);
--
--typedef EFI_STATUS (EFIAPI *EFI_SET_STATE)(
--        struct _EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL *This,
--        EFI_KEY_TOGGLE_STATE *KeyToggleState
--);
--
--typedef EFI_STATUS (EFIAPI *EFI_KEY_NOTIFY_FUNCTION)(
--        EFI_KEY_DATA *KeyData
--);
--
--typedef EFI_STATUS (EFIAPI *EFI_REGISTER_KEYSTROKE_NOTIFY)(
--        struct _EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL *This,
--        EFI_KEY_DATA KeyData,
--        EFI_KEY_NOTIFY_FUNCTION KeyNotificationFunction,
--        VOID **NotifyHandle
--);
--
--typedef EFI_STATUS (EFIAPI *EFI_UNREGISTER_KEYSTROKE_NOTIFY)(
--        struct _EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL *This,
--        VOID *NotificationHandle
--);
--
--typedef struct _EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL {
--        EFI_INPUT_RESET_EX Reset;
--        EFI_INPUT_READ_KEY_EX ReadKeyStrokeEx;
--        EFI_EVENT WaitForKeyEx;
--        EFI_SET_STATE SetState;
--        EFI_REGISTER_KEYSTROKE_NOTIFY RegisterKeyNotify;
--        EFI_UNREGISTER_KEYSTROKE_NOTIFY UnregisterKeyNotify;
--} EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL;
--
- EFI_STATUS console_key_read(UINT64 *key, BOOLEAN wait) {
-         EFI_GUID EfiSimpleTextInputExProtocolGuid = EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL_GUID;
-         static EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL *TextInputEx;
-diff --git a/src/boot/efi/console.h b/src/boot/efi/console.h
-index 41df3a406e..2c69af552a 100644
---- a/src/boot/efi/console.h
-+++ b/src/boot/efi/console.h
-@@ -1,11 +1,7 @@
- /* SPDX-License-Identifier: LGPL-2.1-or-later */
- #pragma once
- 
--#define EFI_SHIFT_STATE_VALID           0x80000000
--#define EFI_RIGHT_CONTROL_PRESSED       0x00000004
--#define EFI_LEFT_CONTROL_PRESSED        0x00000008
--#define EFI_RIGHT_ALT_PRESSED           0x00000010
--#define EFI_LEFT_ALT_PRESSED            0x00000020
-+#include "missing_efi.h"
- 
- #define EFI_CONTROL_PRESSED             (EFI_RIGHT_CONTROL_PRESSED|EFI_LEFT_CONTROL_PRESSED)
- #define EFI_ALT_PRESSED                 (EFI_RIGHT_ALT_PRESSED|EFI_LEFT_ALT_PRESSED)
-diff --git a/src/boot/efi/missing_efi.h b/src/boot/efi/missing_efi.h
-index 1b838af2a4..b6aae1eb5b 100644
---- a/src/boot/efi/missing_efi.h
-+++ b/src/boot/efi/missing_efi.h
-@@ -53,3 +53,70 @@ typedef struct _EFI_RNG_PROTOCOL {
- } EFI_RNG_PROTOCOL;
- 
- #endif
-+
-+#ifndef EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL_GUID
-+
-+#define EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL_GUID \
-+        { 0xdd9e7534, 0x7762, 0x4698, { 0x8c, 0x14, 0xf5, 0x85, 0x17, 0xa6, 0x25, 0xaa } }
-+
-+#define EFI_SHIFT_STATE_VALID           0x80000000
-+#define EFI_RIGHT_CONTROL_PRESSED       0x00000004
-+#define EFI_LEFT_CONTROL_PRESSED        0x00000008
-+#define EFI_RIGHT_ALT_PRESSED           0x00000010
-+#define EFI_LEFT_ALT_PRESSED            0x00000020
-+
-+struct _EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL;
-+
-+typedef EFI_STATUS (EFIAPI *EFI_INPUT_RESET_EX)(
-+        struct _EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL *This,
-+        BOOLEAN ExtendedVerification
-+);
-+
-+typedef UINT8 EFI_KEY_TOGGLE_STATE;
-+
-+typedef struct {
-+        UINT32 KeyShiftState;
-+        EFI_KEY_TOGGLE_STATE KeyToggleState;
-+} EFI_KEY_STATE;
-+
-+typedef struct {
-+        EFI_INPUT_KEY Key;
-+        EFI_KEY_STATE KeyState;
-+} EFI_KEY_DATA;
-+
-+typedef EFI_STATUS (EFIAPI *EFI_INPUT_READ_KEY_EX)(
-+        struct _EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL *This,
-+        EFI_KEY_DATA *KeyData
-+);
-+
-+typedef EFI_STATUS (EFIAPI *EFI_SET_STATE)(
-+        struct _EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL *This,
-+        EFI_KEY_TOGGLE_STATE *KeyToggleState
-+);
-+
-+typedef EFI_STATUS (EFIAPI *EFI_KEY_NOTIFY_FUNCTION)(
-+        EFI_KEY_DATA *KeyData
-+);
-+
-+typedef EFI_STATUS (EFIAPI *EFI_REGISTER_KEYSTROKE_NOTIFY)(
-+        struct _EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL *This,
-+        EFI_KEY_DATA KeyData,
-+        EFI_KEY_NOTIFY_FUNCTION KeyNotificationFunction,
-+        VOID **NotifyHandle
-+);
-+
-+typedef EFI_STATUS (EFIAPI *EFI_UNREGISTER_KEYSTROKE_NOTIFY)(
-+        struct _EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL *This,
-+        VOID *NotificationHandle
-+);
-+
-+typedef struct _EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL {
-+        EFI_INPUT_RESET_EX Reset;
-+        EFI_INPUT_READ_KEY_EX ReadKeyStrokeEx;
-+        EFI_EVENT WaitForKeyEx;
-+        EFI_SET_STATE SetState;
-+        EFI_REGISTER_KEYSTROKE_NOTIFY RegisterKeyNotify;
-+        EFI_UNREGISTER_KEYSTROKE_NOTIFY UnregisterKeyNotify;
-+} EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL;
-+
-+#endif
diff --git a/meta/recipes-core/systemd/files/7c5fd25119a495009ea62f79e5daec34cc464628.patch b/meta/recipes-core/systemd/files/7c5fd25119a495009ea62f79e5daec34cc464628.patch
deleted file mode 100644
index ae449791f1..0000000000
--- a/meta/recipes-core/systemd/files/7c5fd25119a495009ea62f79e5daec34cc464628.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 7c5fd25119a495009ea62f79e5daec34cc464628 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
-Date: Mon, 12 Apr 2021 14:03:32 +0200
-Subject: [PATCH] meson: do not fail if rsync is not installed with meson
- 0.57.2
-
-https://github.com/mesonbuild/meson/issues/8641
-
-Our CI started to fail. Even if the change is reverted in meson,
-we need a quick workaround here.
-
-Upstream-Status: Backport
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- man/meson.build | 25 ++++++++++++++-----------
- 1 file changed, 14 insertions(+), 11 deletions(-)
-
-diff --git a/man/meson.build b/man/meson.build
-index 3cae8446cda..f9c4b83dc81 100644
---- a/man/meson.build
-+++ b/man/meson.build
-@@ -184,17 +184,20 @@ html = custom_target(
-         depends : html_pages,
-         command : ['echo'])
- 
--run_target(
--        'doc-sync',
--        depends : man_pages + html_pages,
--        command : ['rsync', '-rlv',
--                   '--delete-excluded',
--                   '--include=man',
--                   '--include=*.html',
--                   '--exclude=*',
--                   '--omit-dir-times',
--                   meson.current_build_dir(),
--                   get_option('www-target')])
-+rsync = find_program('rsync', required : false)
-+if rsync.found()
-+        run_target(
-+                'doc-sync',
-+                depends : man_pages + html_pages,
-+                command : [rsync, '-rlv',
-+                           '--delete-excluded',
-+                           '--include=man',
-+                           '--include=*.html',
-+                           '--exclude=*',
-+                           '--omit-dir-times',
-+                           meson.current_build_dir(),
-+                           get_option('www-target')])
-+endif
- 
- ############################################################
- 
diff --git a/meta/recipes-core/systemd/systemd-boot_247.6.bb b/meta/recipes-core/systemd/systemd-boot_248.3.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_247.6.bb
rename to meta/recipes-core/systemd/systemd-boot_248.3.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 88dddb309c..0524a25008 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -14,11 +14,9 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "17472dca0160cbe7b807ca648475fd70d0d62fe5"
-SRCBRANCH = "v247-stable"
+SRCREV = "37c4cfde0ce613f0f00544d3f4e2e72bf93d9c76"
+SRCBRANCH = "v248-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=git;branch=${SRCBRANCH} \
-           file://7c5fd25119a495009ea62f79e5daec34cc464628.patch \
-           file://48fff0a2af3f62acd446ebec8081b039b72caad8.patch \
 "
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-core/systemd/systemd/0001-analyze-resolve-executable-path-if-it-is-relative.patch b/meta/recipes-core/systemd/systemd/0001-analyze-resolve-executable-path-if-it-is-relative.patch
deleted file mode 100644
index fd7f94a61d..0000000000
--- a/meta/recipes-core/systemd/systemd/0001-analyze-resolve-executable-path-if-it-is-relative.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From b9b7a8e3825f0433e120f7a6d7d5d635a839cab9 Mon Sep 17 00:00:00 2001
-From: Mingli Yu <mingli.yu@windriver.com>
-Date: Thu, 21 Jan 2021 06:19:44 +0000
-Subject: [PATCH] analyze: resolve executable path if it is relative
-
-Upstream-Status: Backport [https://github.com/systemd/systemd/commit/f1fb046a985521f7d4a662f02546686ff20b7e5d]
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- src/analyze/analyze-verify.c | 7 +++++--
- 1 file changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/src/analyze/analyze-verify.c b/src/analyze/analyze-verify.c
-index a9c89173bf..969523df18 100644
---- a/src/analyze/analyze-verify.c
-+++ b/src/analyze/analyze-verify.c
-@@ -115,14 +115,17 @@ static int verify_socket(Unit *u) {
- }
- 
- int verify_executable(Unit *u, const ExecCommand *exec) {
-+        int r;
-+
-         if (!exec)
-                 return 0;
- 
-         if (exec->flags & EXEC_COMMAND_IGNORE_FAILURE)
-                 return 0;
- 
--        if (access(exec->path, X_OK) < 0)
--                return log_unit_error_errno(u, errno, "Command %s is not executable: %m", exec->path);
-+        r = find_executable_full(exec->path, false, NULL);
-+        if (r < 0)
-+                return log_unit_error_errno(u, r, "Command %s is not executable: %m", exec->path);
- 
-         return 0;
- }
--- 
-2.26.2
-
diff --git a/meta/recipes-core/systemd/systemd/0001-logind-Restore-chvt-as-non-root-user-without-polkit.patch b/meta/recipes-core/systemd/systemd/0001-logind-Restore-chvt-as-non-root-user-without-polkit.patch
deleted file mode 100644
index 89ef39bc3e..0000000000
--- a/meta/recipes-core/systemd/systemd/0001-logind-Restore-chvt-as-non-root-user-without-polkit.patch
+++ /dev/null
@@ -1,227 +0,0 @@
-From 150d9cade6d475570395cb418b824524dead9577 Mon Sep 17 00:00:00 2001
-From: Joshua Watt <JPEWhacker@gmail.com>
-Date: Fri, 30 Oct 2020 08:15:43 -0500
-Subject: [PATCH] logind: Restore chvt as non-root user without polkit
-
-4acf0cfd2f ("logind: check PolicyKit before allowing VT switch") broke
-the ability to write user sessions that run graphical sessions (e.g.
-weston/X11). This was partially amended in 19bb87fbfa ("login: allow
-non-console sessions to change vt") by changing the default PolicyKit
-policy so that non-root users are again allowed to switch the VT. This
-makes the policy when PolKit is not enabled (as on many embedded
-systems) match the default PolKit policy and allows launching graphical
-sessions as a non-root user.
-
-Closes #17473
----
- src/login/logind-dbus.c         | 11 ++-------
- src/login/logind-polkit.c       | 26 +++++++++++++++++++++
- src/login/logind-polkit.h       | 10 ++++++++
- src/login/logind-seat-dbus.c    | 41 ++++-----------------------------
- src/login/logind-session-dbus.c | 11 ++-------
- src/login/meson.build           |  1 +
- 6 files changed, 46 insertions(+), 54 deletions(-)
- create mode 100644 src/login/logind-polkit.c
- create mode 100644 src/login/logind-polkit.h
-
-diff --git a/src/login/logind-dbus.c b/src/login/logind-dbus.c
-index 0f83ed99bc..a3765d88ba 100644
---- a/src/login/logind-dbus.c
-+++ b/src/login/logind-dbus.c
-@@ -30,6 +30,7 @@
- #include "format-util.h"
- #include "fs-util.h"
- #include "logind-dbus.h"
-+#include "logind-polkit.h"
- #include "logind-seat-dbus.h"
- #include "logind-session-dbus.h"
- #include "logind-user-dbus.h"
-@@ -1047,15 +1048,7 @@ static int method_activate_session_on_seat(sd_bus_message *message, void *userda
-                 return sd_bus_error_setf(error, BUS_ERROR_SESSION_NOT_ON_SEAT,
-                                          "Session %s not on seat %s", session_name, seat_name);
- 
--        r = bus_verify_polkit_async(
--                        message,
--                        CAP_SYS_ADMIN,
--                        "org.freedesktop.login1.chvt",
--                        NULL,
--                        false,
--                        UID_INVALID,
--                        &m->polkit_registry,
--                        error);
-+        r = check_polkit_chvt(message, m, error);
-         if (r < 0)
-                 return r;
-         if (r == 0)
-diff --git a/src/login/logind-polkit.c b/src/login/logind-polkit.c
-new file mode 100644
-index 0000000000..9072570cc6
---- /dev/null
-+++ b/src/login/logind-polkit.c
-@@ -0,0 +1,26 @@
-+/* SPDX-License-Identifier: LGPL-2.1+ */
-+
-+#include "bus-polkit.h"
-+#include "logind-polkit.h"
-+#include "missing_capability.h"
-+#include "user-util.h"
-+
-+int check_polkit_chvt(sd_bus_message *message, Manager *manager, sd_bus_error *error) {
-+#if ENABLE_POLKIT
-+        return bus_verify_polkit_async(
-+                        message,
-+                        CAP_SYS_ADMIN,
-+                        "org.freedesktop.login1.chvt",
-+                        NULL,
-+                        false,
-+                        UID_INVALID,
-+                        &manager->polkit_registry,
-+                        error);
-+#else
-+        /* Allow chvt when polkit is not present. This allows a service to start a graphical session as a
-+         * non-root user when polkit is not compiled in, matching the default polkit policy */
-+        return 1;
-+#endif
-+}
-+
-+
-diff --git a/src/login/logind-polkit.h b/src/login/logind-polkit.h
-new file mode 100644
-index 0000000000..476c077a8a
---- /dev/null
-+++ b/src/login/logind-polkit.h
-@@ -0,0 +1,10 @@
-+/* SPDX-License-Identifier: LGPL-2.1+ */
-+#pragma once
-+
-+#include "sd-bus.h"
-+
-+#include "bus-object.h"
-+#include "logind.h"
-+
-+int check_polkit_chvt(sd_bus_message *message, Manager *manager, sd_bus_error *error);
-+
-diff --git a/src/login/logind-seat-dbus.c b/src/login/logind-seat-dbus.c
-index a945132284..f22e9e2734 100644
---- a/src/login/logind-seat-dbus.c
-+++ b/src/login/logind-seat-dbus.c
-@@ -9,6 +9,7 @@
- #include "bus-polkit.h"
- #include "bus-util.h"
- #include "logind-dbus.h"
-+#include "logind-polkit.h"
- #include "logind-seat-dbus.h"
- #include "logind-seat.h"
- #include "logind-session-dbus.h"
-@@ -179,15 +180,7 @@ static int method_activate_session(sd_bus_message *message, void *userdata, sd_b
-         if (session->seat != s)
-                 return sd_bus_error_setf(error, BUS_ERROR_SESSION_NOT_ON_SEAT, "Session %s not on seat %s", name, s->id);
- 
--        r = bus_verify_polkit_async(
--                        message,
--                        CAP_SYS_ADMIN,
--                        "org.freedesktop.login1.chvt",
--                        NULL,
--                        false,
--                        UID_INVALID,
--                        &s->manager->polkit_registry,
--                        error);
-+        r = check_polkit_chvt(message, s->manager, error);
-         if (r < 0)
-                 return r;
-         if (r == 0)
-@@ -215,15 +208,7 @@ static int method_switch_to(sd_bus_message *message, void *userdata, sd_bus_erro
-         if (to <= 0)
-                 return sd_bus_error_setf(error, SD_BUS_ERROR_INVALID_ARGS, "Invalid virtual terminal");
- 
--        r = bus_verify_polkit_async(
--                        message,
--                        CAP_SYS_ADMIN,
--                        "org.freedesktop.login1.chvt",
--                        NULL,
--                        false,
--                        UID_INVALID,
--                        &s->manager->polkit_registry,
--                        error);
-+        r = check_polkit_chvt(message, s->manager, error);
-         if (r < 0)
-                 return r;
-         if (r == 0)
-@@ -243,15 +228,7 @@ static int method_switch_to_next(sd_bus_message *message, void *userdata, sd_bus
-         assert(message);
-         assert(s);
- 
--        r = bus_verify_polkit_async(
--                        message,
--                        CAP_SYS_ADMIN,
--                        "org.freedesktop.login1.chvt",
--                        NULL,
--                        false,
--                        UID_INVALID,
--                        &s->manager->polkit_registry,
--                        error);
-+        r = check_polkit_chvt(message, s->manager, error);
-         if (r < 0)
-                 return r;
-         if (r == 0)
-@@ -271,15 +248,7 @@ static int method_switch_to_previous(sd_bus_message *message, void *userdata, sd
-         assert(message);
-         assert(s);
- 
--        r = bus_verify_polkit_async(
--                        message,
--                        CAP_SYS_ADMIN,
--                        "org.freedesktop.login1.chvt",
--                        NULL,
--                        false,
--                        UID_INVALID,
--                        &s->manager->polkit_registry,
--                        error);
-+        r = check_polkit_chvt(message, s->manager, error);
-         if (r < 0)
-                 return r;
-         if (r == 0)
-diff --git a/src/login/logind-session-dbus.c b/src/login/logind-session-dbus.c
-index ccc5ac8df2..57c8a4e900 100644
---- a/src/login/logind-session-dbus.c
-+++ b/src/login/logind-session-dbus.c
-@@ -11,6 +11,7 @@
- #include "fd-util.h"
- #include "logind-brightness.h"
- #include "logind-dbus.h"
-+#include "logind-polkit.h"
- #include "logind-seat-dbus.h"
- #include "logind-session-dbus.h"
- #include "logind-session-device.h"
-@@ -192,15 +193,7 @@ int bus_session_method_activate(sd_bus_message *message, void *userdata, sd_bus_
-         assert(message);
-         assert(s);
- 
--        r = bus_verify_polkit_async(
--                        message,
--                        CAP_SYS_ADMIN,
--                        "org.freedesktop.login1.chvt",
--                        NULL,
--                        false,
--                        UID_INVALID,
--                        &s->manager->polkit_registry,
--                        error);
-+        r = check_polkit_chvt(message, s->manager, error);
-         if (r < 0)
-                 return r;
-         if (r == 0)
-diff --git a/src/login/meson.build b/src/login/meson.build
-index 0a7d3d5440..7e46be2add 100644
---- a/src/login/meson.build
-+++ b/src/login/meson.build
-@@ -26,6 +26,7 @@ liblogind_core_sources = files('''
-         logind-device.h
-         logind-inhibit.c
-         logind-inhibit.h
-+        logind-polkit.c
-         logind-seat-dbus.c
-         logind-seat-dbus.h
-         logind-seat.c
--- 
-2.28.0
-
diff --git a/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch b/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch
index d856bcb583..4cdf66e767 100644
--- a/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch
+++ b/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch
@@ -1,7 +1,7 @@
-From 66ece0b870b3a34fdabc48b88437e6cc354e9fce Mon Sep 17 00:00:00 2001
+From 159c53612444ec1df492bae528a5a88a275b93bf Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 13:41:41 +0800
-Subject: [PATCH 02/26] don't use glibc-specific qsort_r
+Subject: [PATCH] don't use glibc-specific qsort_r
 
 Upstream-Status: Inappropriate [musl specific]
 
@@ -12,6 +12,7 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
 [Rebased for v247]
 Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
+
 ---
  src/basic/sort-util.h              | 14 ------------
  src/libsystemd/sd-hwdb/hwdb-util.c | 19 +++++++++++-----
@@ -19,14 +20,13 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  3 files changed, 38 insertions(+), 31 deletions(-)
 
 diff --git a/src/basic/sort-util.h b/src/basic/sort-util.h
-index 1d194a1f04..3394c9eb72 100644
+index 49586a4a24..d92a5ab0ed 100644
 --- a/src/basic/sort-util.h
 +++ b/src/basic/sort-util.h
-@@ -54,17 +54,3 @@ static inline void _qsort_safe(void *base, size_t nmemb, size_t size, __compar_f
-                 int (*_func_)(const typeof(p[0])*, const typeof(p[0])*) = func; \
+@@ -55,18 +55,4 @@ static inline void _qsort_safe(void *base, size_t nmemb, size_t size, __compar_f
                  _qsort_safe((p), (n), sizeof((p)[0]), (__compar_fn_t) _func_); \
          })
--
+ 
 -static inline void qsort_r_safe(void *base, size_t nmemb, size_t size, __compar_d_fn_t compar, void *userdata) {
 -        if (nmemb <= 1)
 -                return;
@@ -40,11 +40,13 @@ index 1d194a1f04..3394c9eb72 100644
 -                int (*_func_)(const typeof(p[0])*, const typeof(p[0])*, typeof(userdata)) = func; \
 -                qsort_r_safe((p), (n), sizeof((p)[0]), (__compar_d_fn_t) _func_, userdata); \
 -        })
+-
+ int cmp_int(const int *a, const int *b);
 diff --git a/src/libsystemd/sd-hwdb/hwdb-util.c b/src/libsystemd/sd-hwdb/hwdb-util.c
-index 4c94ba9c88..95495dba6d 100644
+index fd45ff0f54..ac4b63c49b 100644
 --- a/src/libsystemd/sd-hwdb/hwdb-util.c
 +++ b/src/libsystemd/sd-hwdb/hwdb-util.c
-@@ -126,9 +126,13 @@ static void trie_free(struct trie *trie) {
+@@ -126,9 +126,13 @@ static struct trie* trie_free(struct trie *trie) {
  
  DEFINE_TRIVIAL_CLEANUP_FUNC(struct trie*, trie_free);
  
@@ -85,10 +87,10 @@ index 4c94ba9c88..95495dba6d 100644
  }
  
 diff --git a/src/shared/format-table.c b/src/shared/format-table.c
-index a13a198b7a..bce10bc607 100644
+index dccb796b26..c3ab8ac296 100644
 --- a/src/shared/format-table.c
 +++ b/src/shared/format-table.c
-@@ -1243,30 +1243,32 @@ static int cell_data_compare(TableData *a, size_t index_a, TableData *b, size_t
+@@ -1290,30 +1290,32 @@ static int cell_data_compare(TableData *a, size_t index_a, TableData *b, size_t
          return CMP(index_a, index_b);
  }
  
@@ -131,7 +133,7 @@ index a13a198b7a..bce10bc607 100644
          }
  
          /* Order identical lines by the order there were originally added in */
-@@ -1844,7 +1846,12 @@ int table_print(Table *t, FILE *f) {
+@@ -1952,7 +1954,12 @@ int table_print(Table *t, FILE *f) {
                  for (size_t i = 0; i < n_rows; i++)
                          sorted[i] = i * t->n_columns;
  
@@ -145,7 +147,7 @@ index a13a198b7a..bce10bc607 100644
          }
  
          if (t->display_map)
-@@ -2440,7 +2447,12 @@ int table_to_json(Table *t, JsonVariant **ret) {
+@@ -2580,7 +2587,12 @@ int table_to_json(Table *t, JsonVariant **ret) {
                  for (size_t i = 0; i < n_rows; i++)
                          sorted[i] = i * t->n_columns;
  
@@ -159,6 +161,3 @@ index a13a198b7a..bce10bc607 100644
          }
  
          if (t->display_map)
--- 
-2.27.0
-
diff --git a/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch b/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch
index f43a22aa8b..9b1768d9ca 100644
--- a/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch
+++ b/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch
@@ -1,7 +1,7 @@
-From 9f0d5996bbb2db3679a4075fa8301750b786c03b Mon Sep 17 00:00:00 2001
+From 4afb8adc83348bf75964fc10af7902e04dd62637 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 13:55:12 +0800
-Subject: [PATCH 03/26] missing_type.h: add __compare_fn_t and comparison_fn_t
+Subject: [PATCH] missing_type.h: add __compare_fn_t and comparison_fn_t
 
 Make it work with musl where comparison_fn_t and __compare_fn_t
 is not provided.
@@ -13,11 +13,12 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 [Rebased for v242]
 Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
+
 ---
- src/basic/missing_type.h | 9 +++++++++
- src/basic/sort-util.h    | 1 +
- src/core/kmod-setup.c    | 1 +
- src/journal/catalog.c    | 1 +
+ src/basic/missing_type.h            | 9 +++++++++
+ src/basic/sort-util.h               | 1 +
+ src/core/kmod-setup.c               | 1 +
+ src/libsystemd/sd-journal/catalog.c | 1 +
  4 files changed, 12 insertions(+)
 
 diff --git a/src/basic/missing_type.h b/src/basic/missing_type.h
@@ -38,7 +39,7 @@ index f6233090a9..aeaf6ad5ec 100644
 +typedef int (*__compar_fn_t)(const void *, const void *);
 +#endif
 diff --git a/src/basic/sort-util.h b/src/basic/sort-util.h
-index 3394c9eb72..d9cb2aecb6 100644
+index d92a5ab0ed..a63867c716 100644
 --- a/src/basic/sort-util.h
 +++ b/src/basic/sort-util.h
 @@ -4,6 +4,7 @@
@@ -61,10 +62,10 @@ index 8a7f82812a..a56f12f47f 100644
  
  #if HAVE_KMOD
  #include "module-util.h"
-diff --git a/src/journal/catalog.c b/src/journal/catalog.c
-index 0f6ad8a29e..4e1077ade4 100644
---- a/src/journal/catalog.c
-+++ b/src/journal/catalog.c
+diff --git a/src/libsystemd/sd-journal/catalog.c b/src/libsystemd/sd-journal/catalog.c
+index aea3241d18..75e6c56a28 100644
+--- a/src/libsystemd/sd-journal/catalog.c
++++ b/src/libsystemd/sd-journal/catalog.c
 @@ -28,6 +28,7 @@
  #include "string-util.h"
  #include "strv.h"
@@ -73,6 +74,3 @@ index 0f6ad8a29e..4e1077ade4 100644
  
  const char * const catalog_file_dirs[] = {
          "/usr/local/lib/systemd/catalog/",
--- 
-2.27.0
-
diff --git a/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch b/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch
index bdd64a0252..dc40a2fe8d 100644
--- a/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch
+++ b/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch
@@ -1,7 +1,7 @@
-From f3dbe29f7620a063af4d8eb3ea7c48ecd410200d Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Mon, 25 Feb 2019 14:04:21 +0800
-Subject: [PATCH 04/26] add fallback parse_printf_format implementation
+From 6c18e5f9373da3e3b38f2c5727e2aefe07fcbbd9 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Sat, 22 May 2021 20:26:24 +0200
+Subject: [PATCH] [PATCH] add fallback parse_printf_format implementation
 
 Upstream-Status: Inappropriate [musl specific]
 
@@ -11,21 +11,21 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 [rebased for systemd 243]
 Signed-off-by: Scott Murray <scott.murray@konsulko.com>
 ---
- meson.build                     |   1 +
- src/basic/meson.build           |   5 +
- src/basic/parse-printf-format.c | 273 ++++++++++++++++++++++++++++++++
- src/basic/parse-printf-format.h |  57 +++++++
- src/basic/stdio-util.h          |   2 +-
- src/journal/journal-send.c      |   2 +-
+ meson.build                              |   1 +
+ src/basic/meson.build                    |   5 +
+ src/basic/parse-printf-format.c          | 273 +++++++++++++++++++++++
+ src/basic/parse-printf-format.h          |  57 +++++
+ src/basic/stdio-util.h                   |   2 +-
+ src/libsystemd/sd-journal/journal-send.c |   2 +-
  6 files changed, 338 insertions(+), 2 deletions(-)
  create mode 100644 src/basic/parse-printf-format.c
  create mode 100644 src/basic/parse-printf-format.h
 
 diff --git a/meson.build b/meson.build
-index f406d595e6..6aa47fc755 100644
+index 27186d63a3..2abb7b3188 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -646,6 +646,7 @@ endif
+@@ -675,6 +675,7 @@ endif
  foreach header : ['crypt.h',
                    'linux/memfd.h',
                    'linux/vm_sockets.h',
@@ -34,21 +34,21 @@ index f406d595e6..6aa47fc755 100644
                    'valgrind/memcheck.h',
                    'valgrind/valgrind.h',
 diff --git a/src/basic/meson.build b/src/basic/meson.build
-index 1183ea83ad..aa5c958850 100644
+index 60ef801a25..aba2172edd 100644
 --- a/src/basic/meson.build
 +++ b/src/basic/meson.build
-@@ -322,6 +322,11 @@ foreach item : [['af',     af_list_txt,     'af',         ''],
- endforeach
+@@ -341,6 +341,11 @@ endforeach
  
  basic_sources += generated_gperf_headers
-+
+ 
 +if conf.get('HAVE_PRINTF_H') != 1
 +        basic_sources += [files('parse-printf-format.c')]
 +endif
 +
- basic_gcrypt_sources = files(
-         'gcrypt-util.c',
-         'gcrypt-util.h')
++
+ ############################################################
+ 
+ arch_list = [
 diff --git a/src/basic/parse-printf-format.c b/src/basic/parse-printf-format.c
 new file mode 100644
 index 0000000000..49437e5445
@@ -410,10 +410,10 @@ index 6dc1e72312..cea76b36cf 100644
  
  #define snprintf_ok(buf, len, fmt, ...) \
          ((size_t) snprintf(buf, len, fmt, __VA_ARGS__) < (len))
-diff --git a/src/journal/journal-send.c b/src/journal/journal-send.c
+diff --git a/src/libsystemd/sd-journal/journal-send.c b/src/libsystemd/sd-journal/journal-send.c
 index fd3fd7ef9c..e8e6ad555b 100644
---- a/src/journal/journal-send.c
-+++ b/src/journal/journal-send.c
+--- a/src/libsystemd/sd-journal/journal-send.c
++++ b/src/libsystemd/sd-journal/journal-send.c
 @@ -2,7 +2,6 @@
  
  #include <errno.h>
@@ -431,5 +431,5 @@ index fd3fd7ef9c..e8e6ad555b 100644
  #define SNDBUF_SIZE (8*1024*1024)
  
 -- 
-2.27.0
+2.24.0
 
diff --git a/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch b/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
index d63e3c0d09..a0d757b3f3 100644
--- a/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
+++ b/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
@@ -1,7 +1,7 @@
-From 5aeae0ea89f5af74ed5d95bed1d87a03b3801ff0 Mon Sep 17 00:00:00 2001
+From 6b0732ac7164914ce16e231e35980b849bdfc4c8 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 14:18:21 +0800
-Subject: [PATCH 05/26] src/basic/missing.h: check for missing strndupa
+Subject: [PATCH] src/basic/missing.h: check for missing strndupa
 
 include missing.h  for definition of strndupa
 
@@ -17,6 +17,7 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
 [rebased for systemd 244]
 [Rebased for v247]
 Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
+
 ---
  meson.build                                |  1 +
  src/backlight/backlight.c                  |  1 +
@@ -25,6 +26,7 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  src/basic/log.c                            |  1 +
  src/basic/missing_stdlib.h                 | 12 ++++++++++++
  src/basic/mkdir.c                          |  1 +
+ src/basic/mountpoint-util.c                |  1 +
  src/basic/parse-util.c                     |  1 +
  src/basic/path-lookup.c                    |  1 +
  src/basic/proc-cmdline.c                   |  1 +
@@ -41,12 +43,12 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  src/coredump/coredump-vacuum.c             |  1 +
  src/journal-remote/journal-remote-main.c   |  1 +
  src/journal/journalctl.c                   |  1 +
- src/journal/sd-journal.c                   |  1 +
  src/libsystemd/sd-bus/bus-message.c        |  1 +
  src/libsystemd/sd-bus/bus-objects.c        |  1 +
  src/libsystemd/sd-bus/bus-socket.c         |  1 +
  src/libsystemd/sd-bus/sd-bus.c             |  1 +
  src/libsystemd/sd-bus/test-bus-benchmark.c |  1 +
+ src/libsystemd/sd-journal/sd-journal.c     |  1 +
  src/locale/keymap-util.c                   |  1 +
  src/login/pam_systemd.c                    |  1 +
  src/network/generator/network-generator.c  |  1 +
@@ -68,18 +70,22 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  src/udev/udev-builtin-path_id.c            |  1 +
  src/udev/udev-event.c                      |  1 +
  src/udev/udev-rules.c                      |  1 +
- 50 files changed, 61 insertions(+)
+ 51 files changed, 62 insertions(+)
 
+diff --git a/meson.build b/meson.build
+index 2abb7b3188..c97f09062b 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -535,6 +535,7 @@ foreach ident : [
-                                  #include <sys/wait.h>'''],
-         ['mallinfo',          '''#include <malloc.h>'''],
+@@ -550,6 +550,7 @@ foreach ident : [
+         ['execveat',          '''#include <unistd.h>'''],
          ['close_range',       '''#include <unistd.h>'''],
+         ['epoll_pwait2',      '''#include <sys/epoll.h>'''],
 +        ['strndupa' ,         '''#include <string.h>'''],
  ]
  
          have = cc.has_function(ident[0], prefix : ident[1], args : '-D_GNU_SOURCE')
+diff --git a/src/backlight/backlight.c b/src/backlight/backlight.c
+index 86927be62e..a34be158a0 100644
 --- a/src/backlight/backlight.c
 +++ b/src/backlight/backlight.c
 @@ -19,6 +19,7 @@
@@ -90,6 +96,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  static int help(void) {
          _cleanup_free_ char *link = NULL;
+diff --git a/src/basic/cgroup-util.c b/src/basic/cgroup-util.c
+index 8dd3f8cd95..50c1ae1b2b 100644
 --- a/src/basic/cgroup-util.c
 +++ b/src/basic/cgroup-util.c
 @@ -38,6 +38,7 @@
@@ -100,9 +108,11 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  static int cg_enumerate_items(const char *controller, const char *path, FILE **_f, const char *item) {
          _cleanup_free_ char *fs = NULL;
+diff --git a/src/basic/env-util.c b/src/basic/env-util.c
+index c110a750a5..e1f091b01e 100644
 --- a/src/basic/env-util.c
 +++ b/src/basic/env-util.c
-@@ -15,6 +15,7 @@
+@@ -18,6 +18,7 @@
  #include "string-util.h"
  #include "strv.h"
  #include "utf8.h"
@@ -110,6 +120,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  /* We follow bash for the character set. Different shells have different rules. */
  #define VALID_BASH_ENV_NAME_CHARS               \
+diff --git a/src/basic/log.c b/src/basic/log.c
+index 595db0c395..daff8eb68a 100644
 --- a/src/basic/log.c
 +++ b/src/basic/log.c
 @@ -36,6 +36,7 @@
@@ -120,6 +132,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  #define SNDBUF_SIZE (8*1024*1024)
  
+diff --git a/src/basic/missing_stdlib.h b/src/basic/missing_stdlib.h
+index 8c76f93eb2..9068bfb4f0 100644
 --- a/src/basic/missing_stdlib.h
 +++ b/src/basic/missing_stdlib.h
 @@ -11,3 +11,15 @@
@@ -138,6 +152,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
 +    (char *)memcpy(__new, __old, __len); \
 +  })
 +#endif
+diff --git a/src/basic/mkdir.c b/src/basic/mkdir.c
+index f91f8f7a08..fb31596216 100644
 --- a/src/basic/mkdir.c
 +++ b/src/basic/mkdir.c
 @@ -14,6 +14,7 @@
@@ -148,9 +164,23 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  int mkdir_safe_internal(
                  const char *path,
+diff --git a/src/basic/mountpoint-util.c b/src/basic/mountpoint-util.c
+index 1d617e87b2..346f9a47d7 100644
+--- a/src/basic/mountpoint-util.c
++++ b/src/basic/mountpoint-util.c
+@@ -12,6 +12,7 @@
+ #include "missing_stat.h"
+ #include "missing_syscall.h"
+ #include "mkdir.h"
++#include "missing_stdlib.h"
+ #include "mountpoint-util.h"
+ #include "parse-util.h"
+ #include "path-util.h"
+diff --git a/src/basic/parse-util.c b/src/basic/parse-util.c
+index b79c885dfd..6dabda5691 100644
 --- a/src/basic/parse-util.c
 +++ b/src/basic/parse-util.c
-@@ -22,6 +22,7 @@
+@@ -19,6 +19,7 @@
  #include "stat-util.h"
  #include "string-util.h"
  #include "strv.h"
@@ -158,6 +188,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  int parse_boolean(const char *v) {
          if (!v)
+diff --git a/src/basic/path-lookup.c b/src/basic/path-lookup.c
+index e53c2302b1..ca1d40ccbe 100644
 --- a/src/basic/path-lookup.c
 +++ b/src/basic/path-lookup.c
 @@ -15,6 +15,7 @@
@@ -168,6 +200,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  int xdg_user_runtime_dir(char **ret, const char *suffix) {
          const char *e;
+diff --git a/src/basic/proc-cmdline.c b/src/basic/proc-cmdline.c
+index 410b8a3eb5..f2c4355609 100644
 --- a/src/basic/proc-cmdline.c
 +++ b/src/basic/proc-cmdline.c
 @@ -15,6 +15,7 @@
@@ -178,6 +212,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  int proc_cmdline(char **ret) {
          const char *e;
+diff --git a/src/basic/procfs-util.c b/src/basic/procfs-util.c
+index ccab71f7d2..8f9eee8d36 100644
 --- a/src/basic/procfs-util.c
 +++ b/src/basic/procfs-util.c
 @@ -11,6 +11,7 @@
@@ -188,6 +224,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  int procfs_tasks_get_limit(uint64_t *ret) {
          _cleanup_free_ char *value = NULL;
+diff --git a/src/basic/selinux-util.c b/src/basic/selinux-util.c
+index ee9e34ed47..96c1e9362d 100644
 --- a/src/basic/selinux-util.c
 +++ b/src/basic/selinux-util.c
 @@ -27,6 +27,7 @@
@@ -197,7 +235,9 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
 +#include "missing_stdlib.h"
  
  #if HAVE_SELINUX
- DEFINE_TRIVIAL_CLEANUP_FUNC(context_t, context_free);
+ DEFINE_TRIVIAL_CLEANUP_FUNC_FULL(context_t, context_free, NULL);
+diff --git a/src/basic/time-util.c b/src/basic/time-util.c
+index 78d0390a00..47c38ca691 100644
 --- a/src/basic/time-util.c
 +++ b/src/basic/time-util.c
 @@ -27,6 +27,7 @@
@@ -208,6 +248,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  static clockid_t map_clock_id(clockid_t c) {
  
+diff --git a/src/boot/bless-boot.c b/src/boot/bless-boot.c
+index 97ad1e0cb5..9d60f3cc79 100644
 --- a/src/boot/bless-boot.c
 +++ b/src/boot/bless-boot.c
 @@ -18,6 +18,7 @@
@@ -218,16 +260,20 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  static char **arg_path = NULL;
  
+diff --git a/src/core/dbus-cgroup.c b/src/core/dbus-cgroup.c
+index 04d2ba34f3..651ca9412e 100644
 --- a/src/core/dbus-cgroup.c
 +++ b/src/core/dbus-cgroup.c
-@@ -16,6 +16,7 @@
- #include "fileio.h"
+@@ -17,6 +17,7 @@
  #include "limits-util.h"
  #include "path-util.h"
+ #include "percent-util.h"
 +#include "missing_stdlib.h"
  
  BUS_DEFINE_PROPERTY_GET(bus_property_get_tasks_max, "t", TasksMax, tasks_max_resolve);
  
+diff --git a/src/core/dbus-execute.c b/src/core/dbus-execute.c
+index 5239c41d67..0f604efe98 100644
 --- a/src/core/dbus-execute.c
 +++ b/src/core/dbus-execute.c
 @@ -41,6 +41,7 @@
@@ -238,9 +284,11 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  BUS_DEFINE_PROPERTY_GET_ENUM(bus_property_get_exec_output, exec_output, ExecOutput);
  static BUS_DEFINE_PROPERTY_GET_ENUM(property_get_exec_input, exec_input, ExecInput);
+diff --git a/src/core/dbus-util.c b/src/core/dbus-util.c
+index 44a2ccfca0..3926ccfa4a 100644
 --- a/src/core/dbus-util.c
 +++ b/src/core/dbus-util.c
-@@ -7,6 +7,7 @@
+@@ -9,6 +9,7 @@
  #include "unit-printf.h"
  #include "user-util.h"
  #include "unit.h"
@@ -248,16 +296,20 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  int bus_property_get_triggered_unit(
                  sd_bus *bus,
+diff --git a/src/core/execute.c b/src/core/execute.c
+index 922913e7af..f82fc294c0 100644
 --- a/src/core/execute.c
 +++ b/src/core/execute.c
 @@ -96,6 +96,7 @@
- #include "unit.h"
+ #include "unit-serialize.h"
  #include "user-util.h"
  #include "utmp-wtmp.h"
 +#include "missing_stdlib.h"
  
  #define IDLE_TIMEOUT_USEC (5*USEC_PER_SEC)
  #define IDLE_TIMEOUT2_USEC (1*USEC_PER_SEC)
+diff --git a/src/core/kmod-setup.c b/src/core/kmod-setup.c
+index a56f12f47f..6b8729ef67 100644
 --- a/src/core/kmod-setup.c
 +++ b/src/core/kmod-setup.c
 @@ -11,6 +11,7 @@
@@ -268,6 +320,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  #if HAVE_KMOD
  #include "module-util.h"
+diff --git a/src/core/service.c b/src/core/service.c
+index 4c5bfb17fb..8c05f36119 100644
 --- a/src/core/service.c
 +++ b/src/core/service.c
 @@ -41,6 +41,7 @@
@@ -278,6 +332,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  static const UnitActiveState state_translation_table[_SERVICE_STATE_MAX] = {
          [SERVICE_DEAD] = UNIT_INACTIVE,
+diff --git a/src/coredump/coredump-vacuum.c b/src/coredump/coredump-vacuum.c
+index 95c3fca661..d4a9f27b08 100644
 --- a/src/coredump/coredump-vacuum.c
 +++ b/src/coredump/coredump-vacuum.c
 @@ -16,6 +16,7 @@
@@ -288,9 +344,11 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  #define DEFAULT_MAX_USE_LOWER (uint64_t) (1ULL*1024ULL*1024ULL)           /* 1 MiB */
  #define DEFAULT_MAX_USE_UPPER (uint64_t) (4ULL*1024ULL*1024ULL*1024ULL)   /* 4 GiB */
+diff --git a/src/journal-remote/journal-remote-main.c b/src/journal-remote/journal-remote-main.c
+index ae1d43756a..24de98c9f3 100644
 --- a/src/journal-remote/journal-remote-main.c
 +++ b/src/journal-remote/journal-remote-main.c
-@@ -22,6 +22,7 @@
+@@ -24,6 +24,7 @@
  #include "stat-util.h"
  #include "string-table.h"
  #include "strv.h"
@@ -298,9 +356,11 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  #define PRIV_KEY_FILE CERTIFICATE_ROOT "/private/journal-remote.pem"
  #define CERT_FILE     CERTIFICATE_ROOT "/certs/journal-remote.pem"
+diff --git a/src/journal/journalctl.c b/src/journal/journalctl.c
+index 76d05c1eee..0beb77b2e5 100644
 --- a/src/journal/journalctl.c
 +++ b/src/journal/journalctl.c
-@@ -73,6 +73,7 @@
+@@ -72,6 +72,7 @@
  #include "unit-name.h"
  #include "user-util.h"
  #include "varlink.h"
@@ -308,19 +368,11 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  #define DEFAULT_FSS_INTERVAL_USEC (15*USEC_PER_MINUTE)
  #define PROCESS_INOTIFY_INTERVAL 1024   /* Every 1,024 messages processed */
---- a/src/journal/sd-journal.c
-+++ b/src/journal/sd-journal.c
-@@ -40,6 +40,7 @@
- #include "string-util.h"
- #include "strv.h"
- #include "syslog-util.h"
-+#include "missing_stdlib.h"
- 
- #define JOURNAL_FILES_MAX 7168
- 
+diff --git a/src/libsystemd/sd-bus/bus-message.c b/src/libsystemd/sd-bus/bus-message.c
+index b25064b672..b3bbe63a91 100644
 --- a/src/libsystemd/sd-bus/bus-message.c
 +++ b/src/libsystemd/sd-bus/bus-message.c
-@@ -21,6 +21,7 @@
+@@ -20,6 +20,7 @@
  #include "strv.h"
  #include "time-util.h"
  #include "utf8.h"
@@ -328,9 +380,11 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  static int message_append_basic(sd_bus_message *m, char type, const void *p, const void **stored);
  
+diff --git a/src/libsystemd/sd-bus/bus-objects.c b/src/libsystemd/sd-bus/bus-objects.c
+index bfd42aea7d..daefc56e3e 100644
 --- a/src/libsystemd/sd-bus/bus-objects.c
 +++ b/src/libsystemd/sd-bus/bus-objects.c
-@@ -13,6 +13,7 @@
+@@ -12,6 +12,7 @@
  #include "set.h"
  #include "string-util.h"
  #include "strv.h"
@@ -338,6 +392,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  static int node_vtable_get_userdata(
                  sd_bus *bus,
+diff --git a/src/libsystemd/sd-bus/bus-socket.c b/src/libsystemd/sd-bus/bus-socket.c
+index 832526cc1b..7bff701806 100644
 --- a/src/libsystemd/sd-bus/bus-socket.c
 +++ b/src/libsystemd/sd-bus/bus-socket.c
 @@ -28,6 +28,7 @@
@@ -348,29 +404,47 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  #define SNDBUF_SIZE (8*1024*1024)
  
+diff --git a/src/libsystemd/sd-bus/sd-bus.c b/src/libsystemd/sd-bus/sd-bus.c
+index e719c74370..ac2a605680 100644
 --- a/src/libsystemd/sd-bus/sd-bus.c
 +++ b/src/libsystemd/sd-bus/sd-bus.c
 @@ -41,6 +41,7 @@
- #include "process-util.h"
  #include "string-util.h"
  #include "strv.h"
+ #include "user-util.h"
 +#include "missing_stdlib.h"
  
  #define log_debug_bus_message(m)                                         \
          do {                                                             \
+diff --git a/src/libsystemd/sd-bus/test-bus-benchmark.c b/src/libsystemd/sd-bus/test-bus-benchmark.c
+index 13c08fe295..9aae83486e 100644
 --- a/src/libsystemd/sd-bus/test-bus-benchmark.c
 +++ b/src/libsystemd/sd-bus/test-bus-benchmark.c
 @@ -14,6 +14,7 @@
- #include "missing_resource.h"
+ #include "string-util.h"
  #include "time-util.h"
  #include "util.h"
 +#include "missing_stdlib.h"
  
  #define MAX_SIZE (2*1024*1024)
  
+diff --git a/src/libsystemd/sd-journal/sd-journal.c b/src/libsystemd/sd-journal/sd-journal.c
+index c90b4c926e..0efdccff5d 100644
+--- a/src/libsystemd/sd-journal/sd-journal.c
++++ b/src/libsystemd/sd-journal/sd-journal.c
+@@ -40,6 +40,7 @@
+ #include "string-util.h"
+ #include "strv.h"
+ #include "syslog-util.h"
++#include "missing_stdlib.h"
+ 
+ #define JOURNAL_FILES_MAX 7168
+ 
+diff --git a/src/locale/keymap-util.c b/src/locale/keymap-util.c
+index d2f0566dbc..3b7746557e 100644
 --- a/src/locale/keymap-util.c
 +++ b/src/locale/keymap-util.c
-@@ -21,6 +21,7 @@
+@@ -24,6 +24,7 @@
  #include "string-util.h"
  #include "strv.h"
  #include "tmpfile-util.h"
@@ -378,6 +452,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  static bool startswith_comma(const char *s, const char *prefix) {
          s = startswith(s, prefix);
+diff --git a/src/login/pam_systemd.c b/src/login/pam_systemd.c
+index 2021c31bd5..58eb09808d 100644
 --- a/src/login/pam_systemd.c
 +++ b/src/login/pam_systemd.c
 @@ -31,6 +31,7 @@
@@ -388,6 +464,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "pam-util.h"
  #include "parse-util.h"
  #include "path-util.h"
+diff --git a/src/network/generator/network-generator.c b/src/network/generator/network-generator.c
+index ae673ddf5b..a79e5114ca 100644
 --- a/src/network/generator/network-generator.c
 +++ b/src/network/generator/network-generator.c
 @@ -13,6 +13,7 @@
@@ -398,6 +476,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  /*
    # .network
+diff --git a/src/nspawn/nspawn-settings.c b/src/nspawn/nspawn-settings.c
+index d4619bead5..0e832fd994 100644
 --- a/src/nspawn/nspawn-settings.c
 +++ b/src/nspawn/nspawn-settings.c
 @@ -16,6 +16,7 @@
@@ -408,19 +488,23 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  Settings *settings_new(void) {
          Settings *s;
+diff --git a/src/nss-mymachines/nss-mymachines.c b/src/nss-mymachines/nss-mymachines.c
+index 44715bb3e5..bc1e688b5e 100644
 --- a/src/nss-mymachines/nss-mymachines.c
 +++ b/src/nss-mymachines/nss-mymachines.c
-@@ -19,6 +19,7 @@
+@@ -21,6 +21,7 @@
  #include "nss-util.h"
  #include "signal-util.h"
  #include "string-util.h"
 +#include "missing_stdlib.h"
  
- NSS_GETHOSTBYNAME_PROTOTYPES(mymachines);
- NSS_GETPW_PROTOTYPES(mymachines);
+ static void setup_logging(void) {
+         /* We need a dummy function because log_parse_environment is a macro. */
+diff --git a/src/portable/portable.c b/src/portable/portable.c
+index f201f52531..c78ad0f471 100644
 --- a/src/portable/portable.c
 +++ b/src/portable/portable.c
-@@ -31,6 +31,7 @@
+@@ -32,6 +32,7 @@
  #include "strv.h"
  #include "tmpfile-util.h"
  #include "user-util.h"
@@ -428,9 +512,11 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  static const char profile_dirs[] = CONF_PATHS_NULSTR("systemd/portable/profile");
  
+diff --git a/src/resolve/resolvectl.c b/src/resolve/resolvectl.c
+index 52bbae3293..4ccbae09c4 100644
 --- a/src/resolve/resolvectl.c
 +++ b/src/resolve/resolvectl.c
-@@ -37,6 +37,7 @@
+@@ -41,6 +41,7 @@
  #include "terminal-util.h"
  #include "utf8.h"
  #include "verbs.h"
@@ -438,6 +524,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  static int arg_family = AF_UNSPEC;
  static int arg_ifindex = 0;
+diff --git a/src/shared/bus-get-properties.c b/src/shared/bus-get-properties.c
+index feb6d3807f..eb11d29e50 100644
 --- a/src/shared/bus-get-properties.c
 +++ b/src/shared/bus-get-properties.c
 @@ -4,6 +4,7 @@
@@ -448,6 +536,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  int bus_property_get_bool(
                  sd_bus *bus,
+diff --git a/src/shared/bus-unit-procs.c b/src/shared/bus-unit-procs.c
+index b76125e551..2e0892242f 100644
 --- a/src/shared/bus-unit-procs.c
 +++ b/src/shared/bus-unit-procs.c
 @@ -10,6 +10,7 @@
@@ -458,9 +548,11 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  struct CGroupInfo {
          char *cgroup_path;
+diff --git a/src/shared/bus-unit-util.c b/src/shared/bus-unit-util.c
+index a75178068b..3de06e2bd5 100644
 --- a/src/shared/bus-unit-util.c
 +++ b/src/shared/bus-unit-util.c
-@@ -44,6 +44,7 @@
+@@ -45,6 +45,7 @@
  #include "unit-def.h"
  #include "user-util.h"
  #include "utf8.h"
@@ -468,6 +560,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  int bus_parse_unit_info(sd_bus_message *message, UnitInfo *u) {
          assert(message);
+diff --git a/src/shared/bus-util.c b/src/shared/bus-util.c
+index 64ca67993c..31e3d148ea 100644
 --- a/src/shared/bus-util.c
 +++ b/src/shared/bus-util.c
 @@ -21,6 +21,7 @@
@@ -478,6 +572,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  static int name_owner_change_callback(sd_bus_message *m, void *userdata, sd_bus_error *ret_error) {
          sd_event *e = userdata;
+diff --git a/src/shared/dns-domain.c b/src/shared/dns-domain.c
+index e43aa12882..cec9b413c1 100644
 --- a/src/shared/dns-domain.c
 +++ b/src/shared/dns-domain.c
 @@ -17,6 +17,7 @@
@@ -488,6 +584,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  int dns_label_unescape(const char **name, char *dest, size_t sz, DNSLabelFlags flags) {
          const char *n;
+diff --git a/src/shared/journal-importer.c b/src/shared/journal-importer.c
+index b2785f0552..5f00902882 100644
 --- a/src/shared/journal-importer.c
 +++ b/src/shared/journal-importer.c
 @@ -14,6 +14,7 @@
@@ -498,6 +596,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  enum {
          IMPORTER_STATE_LINE = 0,    /* waiting to read, or reading line */
+diff --git a/src/shared/logs-show.c b/src/shared/logs-show.c
+index e63c59bd94..dd9773c009 100644
 --- a/src/shared/logs-show.c
 +++ b/src/shared/logs-show.c
 @@ -41,6 +41,7 @@
@@ -508,6 +608,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  /* up to three lines (each up to 100 characters) or 300 characters, whichever is less */
  #define PRINT_LINE_THRESHOLD 3
+diff --git a/src/shared/pager.c b/src/shared/pager.c
+index 4bbad7e37b..eefcdd068c 100644
 --- a/src/shared/pager.c
 +++ b/src/shared/pager.c
 @@ -26,6 +26,7 @@
@@ -518,6 +620,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  static pid_t pager_pid = 0;
  
+diff --git a/src/shared/uid-range.c b/src/shared/uid-range.c
+index 5d5bf7f21d..f1002ffa6c 100644
 --- a/src/shared/uid-range.c
 +++ b/src/shared/uid-range.c
 @@ -9,6 +9,7 @@
@@ -528,6 +632,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  static bool uid_range_intersect(UidRange *range, uid_t start, uid_t nr) {
          assert(range);
+diff --git a/src/socket-proxy/socket-proxyd.c b/src/socket-proxy/socket-proxyd.c
+index 6e3ee0d76b..7727e33d95 100644
 --- a/src/socket-proxy/socket-proxyd.c
 +++ b/src/socket-proxy/socket-proxyd.c
 @@ -26,6 +26,7 @@
@@ -538,6 +644,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  #define BUFFER_SIZE (256 * 1024)
  
+diff --git a/src/test/test-hexdecoct.c b/src/test/test-hexdecoct.c
+index c9d318b8d1..fcb8d40805 100644
 --- a/src/test/test-hexdecoct.c
 +++ b/src/test/test-hexdecoct.c
 @@ -6,6 +6,7 @@
@@ -548,19 +656,23 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  static void test_hexchar(void) {
          assert_se(hexchar(0xa) == 'a');
+diff --git a/src/udev/udev-builtin-path_id.c b/src/udev/udev-builtin-path_id.c
+index 09cc1c3bd8..8a7d3152a7 100644
 --- a/src/udev/udev-builtin-path_id.c
 +++ b/src/udev/udev-builtin-path_id.c
 @@ -22,6 +22,7 @@
- #include "strv.h"
  #include "sysexits.h"
  #include "udev-builtin.h"
+ #include "udev-util.h"
 +#include "missing_stdlib.h"
  
  _printf_(2,3)
  static void path_prepend(char **path, const char *fmt, ...) {
+diff --git a/src/udev/udev-event.c b/src/udev/udev-event.c
+index 12597194a9..208b2458b5 100644
 --- a/src/udev/udev-event.c
 +++ b/src/udev/udev-event.c
-@@ -34,6 +34,7 @@
+@@ -33,6 +33,7 @@
  #include "udev-util.h"
  #include "udev-watch.h"
  #include "user-util.h"
@@ -568,9 +680,11 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  typedef struct Spawn {
          sd_device *device;
+diff --git a/src/udev/udev-rules.c b/src/udev/udev-rules.c
+index 57ede6a197..dc59857765 100644
 --- a/src/udev/udev-rules.c
 +++ b/src/udev/udev-rules.c
-@@ -30,6 +30,7 @@
+@@ -31,6 +31,7 @@
  #include "udev-rules.h"
  #include "user-util.h"
  #include "virt.h"
@@ -578,13 +692,3 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  #define RULES_DIRS (const char* const*) CONF_PATHS_STRV("udev/rules.d")
  
---- a/src/basic/mountpoint-util.c
-+++ b/src/basic/mountpoint-util.c
-@@ -10,6 +10,7 @@
- #include "fs-util.h"
- #include "missing_stat.h"
- #include "missing_syscall.h"
-+#include "missing_stdlib.h"
- #include "mountpoint-util.h"
- #include "parse-util.h"
- #include "path-util.h"
diff --git a/meta/recipes-core/systemd/systemd/0006-Include-netinet-if_ether.h.patch b/meta/recipes-core/systemd/systemd/0006-Include-netinet-if_ether.h.patch
index a978558b42..54d714266e 100644
--- a/meta/recipes-core/systemd/systemd/0006-Include-netinet-if_ether.h.patch
+++ b/meta/recipes-core/systemd/systemd/0006-Include-netinet-if_ether.h.patch
@@ -1,7 +1,7 @@
-From d3ed0da271738fd0fc3d3e4d82d6f5810334b05e Mon Sep 17 00:00:00 2001
+From 2069f0b0d5ab8f869aeba635a347e0b11d362b30 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 26 Oct 2017 22:10:42 -0700
-Subject: [PATCH 06/26] Include netinet/if_ether.h
+Subject: [PATCH] Include netinet/if_ether.h
 
 Fixes
 /path/to/systemd/recipe-sysroot/usr/include/netinet/if_ether.h:101:8: error: redefinition of 'struct ethhdr'
@@ -31,6 +31,7 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 Signed-off-by: Scott Murray <scott.murray@konsulko.com>
 [rebased for systemd 247]
 Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
+
 ---
  src/libsystemd-network/sd-dhcp6-client.c  | 1 -
  src/libsystemd/sd-netlink/netlink-types.c | 1 +
@@ -56,7 +57,7 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  21 files changed, 26 insertions(+), 8 deletions(-)
 
 diff --git a/src/libsystemd-network/sd-dhcp6-client.c b/src/libsystemd-network/sd-dhcp6-client.c
-index 66f87c4b95..de1264ae46 100644
+index 410bfda10e..e70ed8be92 100644
 --- a/src/libsystemd-network/sd-dhcp6-client.c
 +++ b/src/libsystemd-network/sd-dhcp6-client.c
 @@ -5,7 +5,6 @@
@@ -68,7 +69,7 @@ index 66f87c4b95..de1264ae46 100644
  
  #include "sd-dhcp6-client.h"
 diff --git a/src/libsystemd/sd-netlink/netlink-types.c b/src/libsystemd/sd-netlink/netlink-types.c
-index 6fb6c147d9..8eda02d202 100644
+index ed7b9a8cd1..112c0b09e4 100644
 --- a/src/libsystemd/sd-netlink/netlink-types.c
 +++ b/src/libsystemd/sd-netlink/netlink-types.c
 @@ -3,6 +3,7 @@
@@ -80,7 +81,7 @@ index 6fb6c147d9..8eda02d202 100644
  #include <linux/netlink.h>
  #include <linux/rtnetlink.h>
 diff --git a/src/machine/machine-dbus.c b/src/machine/machine-dbus.c
-index bb67beb665..f5780f1aec 100644
+index e7c4ed3c7c..3a1e4f9072 100644
 --- a/src/machine/machine-dbus.c
 +++ b/src/machine/machine-dbus.c
 @@ -3,6 +3,7 @@
@@ -92,7 +93,7 @@ index bb67beb665..f5780f1aec 100644
  /* When we include libgen.h because we need dirname() we immediately
   * undefine basename() since libgen.h defines it as a macro to the POSIX
 diff --git a/src/network/netdev/bond.c b/src/network/netdev/bond.c
-index e27f36067b..8868f1da5d 100644
+index cf7ca88d6f..34ab468191 100644
 --- a/src/network/netdev/bond.c
 +++ b/src/network/netdev/bond.c
 @@ -1,5 +1,6 @@
@@ -103,7 +104,7 @@ index e27f36067b..8868f1da5d 100644
  #include "bond.h"
  #include "bond-util.h"
 diff --git a/src/network/netdev/bridge.c b/src/network/netdev/bridge.c
-index 1f59cd8b42..5fdbae7e99 100644
+index 38432f1578..79ccfe578e 100644
 --- a/src/network/netdev/bridge.c
 +++ b/src/network/netdev/bridge.c
 @@ -1,5 +1,6 @@
@@ -114,7 +115,7 @@ index 1f59cd8b42..5fdbae7e99 100644
  
  #include "bridge.h"
 diff --git a/src/network/netdev/macsec.c b/src/network/netdev/macsec.c
-index 82e71c3920..fbae86e216 100644
+index 77c5f8c4e7..04be1b4ab2 100644
 --- a/src/network/netdev/macsec.c
 +++ b/src/network/netdev/macsec.c
 @@ -1,5 +1,6 @@
@@ -125,19 +126,19 @@ index 82e71c3920..fbae86e216 100644
  #include <linux/if_ether.h>
  #include <linux/if_macsec.h>
 diff --git a/src/network/netdev/netdev-gperf.gperf b/src/network/netdev/netdev-gperf.gperf
-index 4e89761f2c..91251fa6ec 100644
+index 8abe044890..3c54c58928 100644
 --- a/src/network/netdev/netdev-gperf.gperf
 +++ b/src/network/netdev/netdev-gperf.gperf
-@@ -2,6 +2,7 @@
+@@ -3,6 +3,7 @@
  #if __GNUC__ >= 7
  _Pragma("GCC diagnostic ignored \"-Wimplicit-fallthrough\"")
  #endif
 +#include <netinet/if_ether.h>
  #include <stddef.h>
  #include "bareudp.h"
- #include "bond.h"
+ #include "batadv.h"
 diff --git a/src/network/netdev/netdev.c b/src/network/netdev/netdev.c
-index 9f390b5781..62aeafb1e4 100644
+index b31f0fa81a..c80e1ff537 100644
 --- a/src/network/netdev/netdev.c
 +++ b/src/network/netdev/netdev.c
 @@ -1,5 +1,6 @@
@@ -148,7 +149,7 @@ index 9f390b5781..62aeafb1e4 100644
  #include <netinet/in.h>
  #include <unistd.h>
 diff --git a/src/network/networkd-brvlan.c b/src/network/networkd-brvlan.c
-index e53c73c30c..9bf0771b84 100644
+index 2847b336c9..4d6af8c642 100644
 --- a/src/network/networkd-brvlan.c
 +++ b/src/network/networkd-brvlan.c
 @@ -4,6 +4,7 @@
@@ -160,7 +161,7 @@ index e53c73c30c..9bf0771b84 100644
  #include <stdbool.h>
  
 diff --git a/src/network/networkd-dhcp-common.c b/src/network/networkd-dhcp-common.c
-index 9f58121350..554d006cb8 100644
+index 00d055cf8d..65821c1d31 100644
 --- a/src/network/networkd-dhcp-common.c
 +++ b/src/network/networkd-dhcp-common.c
 @@ -1,7 +1,8 @@
@@ -171,9 +172,9 @@ index 9f58121350..554d006cb8 100644
 +#include <net/if_arp.h>
 +#include <net/if.h>
  
+ #include "bus-error.h"
  #include "dhcp-internal.h"
- #include "dhcp6-internal.h"
-@@ -10,6 +11,7 @@
+@@ -11,6 +12,7 @@
  #include "networkd-dhcp-common.h"
  #include "networkd-link.h"
  #include "networkd-manager.h"
@@ -182,7 +183,7 @@ index 9f58121350..554d006cb8 100644
  #include "parse-util.h"
  #include "socket-util.h"
 diff --git a/src/network/networkd-dhcp-server.c b/src/network/networkd-dhcp-server.c
-index cf279c640d..bae541029b 100644
+index 5cdf432c27..93cffb9863 100644
 --- a/src/network/networkd-dhcp-server.c
 +++ b/src/network/networkd-dhcp-server.c
 @@ -1,8 +1,8 @@
@@ -197,7 +198,7 @@ index cf279c640d..bae541029b 100644
  #include "sd-dhcp-server.h"
  
 diff --git a/src/network/networkd-dhcp4.c b/src/network/networkd-dhcp4.c
-index f3c1e5f609..e4ef6eca63 100644
+index 23dc3a45db..7ae6c2467a 100644
 --- a/src/network/networkd-dhcp4.c
 +++ b/src/network/networkd-dhcp4.c
 @@ -1,9 +1,9 @@
@@ -212,7 +213,7 @@ index f3c1e5f609..e4ef6eca63 100644
  #include "escape.h"
  #include "alloc-util.h"
 diff --git a/src/network/networkd-dhcp6.c b/src/network/networkd-dhcp6.c
-index 5c077c1ec8..fa98042aa5 100644
+index aa077d6219..4f6ce22059 100644
 --- a/src/network/networkd-dhcp6.c
 +++ b/src/network/networkd-dhcp6.c
 @@ -3,9 +3,9 @@
@@ -227,7 +228,7 @@ index 5c077c1ec8..fa98042aa5 100644
  #include "sd-dhcp6-client.h"
  
 diff --git a/src/network/networkd-link.c b/src/network/networkd-link.c
-index 3bfe636691..e0c68c8ad3 100644
+index 8219d95b0d..c92230453b 100644
 --- a/src/network/networkd-link.c
 +++ b/src/network/networkd-link.c
 @@ -1,8 +1,8 @@
@@ -241,7 +242,7 @@ index 3bfe636691..e0c68c8ad3 100644
  #include <unistd.h>
  
 diff --git a/src/network/networkd-network.c b/src/network/networkd-network.c
-index 3254641461..f0ada419fd 100644
+index e5ffd35b6f..871ebb32c6 100644
 --- a/src/network/networkd-network.c
 +++ b/src/network/networkd-network.c
 @@ -1,5 +1,6 @@
@@ -252,7 +253,7 @@ index 3254641461..f0ada419fd 100644
  #include <netinet/in.h>
  #include <linux/netdevice.h>
 diff --git a/src/network/networkd-route.c b/src/network/networkd-route.c
-index 0ed89584ef..e7e157c201 100644
+index a74541a6c9..a10549b336 100644
 --- a/src/network/networkd-route.c
 +++ b/src/network/networkd-route.c
 @@ -1,7 +1,10 @@
@@ -268,7 +269,7 @@ index 0ed89584ef..e7e157c201 100644
  #include "alloc-util.h"
  #include "netlink-util.h"
 diff --git a/src/network/test-network-tables.c b/src/network/test-network-tables.c
-index 475cac7527..9bae6eda16 100644
+index ce34449554..0b5dc01182 100644
 --- a/src/network/test-network-tables.c
 +++ b/src/network/test-network-tables.c
 @@ -1,5 +1,6 @@
@@ -279,7 +280,7 @@ index 475cac7527..9bae6eda16 100644
  #include "dhcp6-internal.h"
  #include "dhcp6-protocol.h"
 diff --git a/src/shared/ethtool-util.c b/src/shared/ethtool-util.c
-index e6fab262f2..41dd3d7df7 100644
+index 654d36a83a..f4ed42d543 100644
 --- a/src/shared/ethtool-util.c
 +++ b/src/shared/ethtool-util.c
 @@ -1,5 +1,6 @@
@@ -290,7 +291,7 @@ index e6fab262f2..41dd3d7df7 100644
  #include <sys/ioctl.h>
  #include <linux/ethtool.h>
 diff --git a/src/shared/ethtool-util.h b/src/shared/ethtool-util.h
-index f94b3e15bf..08a7e4fa09 100644
+index 11e2906681..a171df0737 100644
 --- a/src/shared/ethtool-util.h
 +++ b/src/shared/ethtool-util.h
 @@ -3,6 +3,7 @@
@@ -302,7 +303,7 @@ index f94b3e15bf..08a7e4fa09 100644
  
  #include "conf-parser.h"
 diff --git a/src/udev/net/link-config.c b/src/udev/net/link-config.c
-index d12fd0e299..636806dc23 100644
+index 31e5d0cd67..f25f821364 100644
 --- a/src/udev/net/link-config.c
 +++ b/src/udev/net/link-config.c
 @@ -1,5 +1,6 @@
@@ -323,6 +324,3 @@ index 87e1fb133e..13876029d0 100644
  #include "alloc-util.h"
  #include "device-util.h"
  #include "errno-util.h"
--- 
-2.25.1
-
diff --git a/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch b/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
index 6865421586..2ff08c7fae 100644
--- a/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
+++ b/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
@@ -1,8 +1,7 @@
-From 87a14dde13c8fa68239a4ab62914a093062b3b29 Mon Sep 17 00:00:00 2001
+From bca73ff2fbff2dc311040a87a4f536f89af07ad6 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 14:56:21 +0800
-Subject: [PATCH 07/26] don't fail if GLOB_BRACE and GLOB_ALTDIRFUNC is not
- defined
+Subject: [PATCH] don't fail if GLOB_BRACE and GLOB_ALTDIRFUNC is not defined
 
 If the standard library doesn't provide brace
 expansion users just won't get it.
@@ -17,6 +16,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 [rebased for systemd 243]
 Signed-off-by: Scott Murray <scott.murray@konsulko.com>
+
 ---
  src/basic/glob-util.c     | 12 ++++++++++++
  src/test/test-glob-util.c | 16 ++++++++++++++++
@@ -115,10 +115,10 @@ index df6444c433..79a692046e 100644
  
          (void) rm_rf(template, REMOVE_ROOT|REMOVE_PHYSICAL);
 diff --git a/src/tmpfiles/tmpfiles.c b/src/tmpfiles/tmpfiles.c
-index 9906c70eef..5eb63b1d57 100644
+index 6b73d1e6d5..26b3b74275 100644
 --- a/src/tmpfiles/tmpfiles.c
 +++ b/src/tmpfiles/tmpfiles.c
-@@ -63,6 +63,12 @@
+@@ -66,6 +66,12 @@
  #include "umask-util.h"
  #include "user-util.h"
  
@@ -131,7 +131,7 @@ index 9906c70eef..5eb63b1d57 100644
  /* This reads all files listed in /etc/tmpfiles.d/?*.conf and creates
   * them in the file system. This is intended to be used to create
   * properly owned directories beneath /tmp, /var/tmp, /run, which are
-@@ -1936,7 +1942,9 @@ finish:
+@@ -1947,7 +1953,9 @@ finish:
  
  static int glob_item(Item *i, action_t action) {
          _cleanup_globfree_ glob_t g = {
@@ -141,7 +141,7 @@ index 9906c70eef..5eb63b1d57 100644
          };
          int r = 0, k;
          char **fn;
-@@ -1956,7 +1964,9 @@ static int glob_item(Item *i, action_t action) {
+@@ -1967,7 +1975,9 @@ static int glob_item(Item *i, action_t action) {
  
  static int glob_item_recursively(Item *i, fdaction_t action) {
          _cleanup_globfree_ glob_t g = {
@@ -151,6 +151,3 @@ index 9906c70eef..5eb63b1d57 100644
          };
          int r = 0, k;
          char **fn;
--- 
-2.27.0
-
diff --git a/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch b/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch
index 94cdc2efde..142ca01345 100644
--- a/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch
+++ b/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch
@@ -1,7 +1,7 @@
-From 8caea3fe87d55fd16de7d1b8266239fa954cb498 Mon Sep 17 00:00:00 2001
+From e0d1912f0246c97e5e7b4177691363d2d077e11d Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:00:06 +0800
-Subject: [PATCH 08/26] add missing FTW_ macros for musl
+Subject: [PATCH] add missing FTW_ macros for musl
 
 This is to avoid build failures like below for musl.
 
@@ -10,6 +10,7 @@ This is to avoid build failures like below for musl.
 Upstream-Status: Inappropriate [musl specific]
 
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+
 ---
  src/basic/missing_type.h | 20 ++++++++++++++++++++
  1 file changed, 20 insertions(+)
@@ -42,6 +43,3 @@ index aeaf6ad5ec..3df1084ef2 100644
 +#ifndef FTW_SKIP_SIBLINGS
 +#define FTW_SKIP_SIBLINGS 3
 +#endif
--- 
-2.27.0
-
diff --git a/meta/recipes-core/systemd/systemd/0009-fix-missing-of-__register_atfork-for-non-glibc-build.patch b/meta/recipes-core/systemd/systemd/0009-fix-missing-of-__register_atfork-for-non-glibc-build.patch
index 76cc75cf6a..53f0a1ba62 100644
--- a/meta/recipes-core/systemd/systemd/0009-fix-missing-of-__register_atfork-for-non-glibc-build.patch
+++ b/meta/recipes-core/systemd/systemd/0009-fix-missing-of-__register_atfork-for-non-glibc-build.patch
@@ -1,17 +1,18 @@
-From d8e4f0aa1760e4c7bb8476beecd35025c9cbb95a Mon Sep 17 00:00:00 2001
+From bb41fe773881a8f1d9615d388320b9c6fc47bfe5 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:03:47 +0800
-Subject: [PATCH 09/26] fix missing of __register_atfork for non-glibc builds
+Subject: [PATCH] fix missing of __register_atfork for non-glibc builds
 
 Upstream-Status: Inappropriate [musl specific]
 
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+
 ---
  src/basic/process-util.c | 7 +++++++
  1 file changed, 7 insertions(+)
 
 diff --git a/src/basic/process-util.c b/src/basic/process-util.c
-index 0851613fc9..4417101569 100644
+index 7d4301eadb..caa9dfe3a3 100644
 --- a/src/basic/process-util.c
 +++ b/src/basic/process-util.c
 @@ -18,6 +18,9 @@
@@ -24,7 +25,7 @@ index 0851613fc9..4417101569 100644
  
  #include "alloc-util.h"
  #include "architecture.h"
-@@ -1143,11 +1146,15 @@ void reset_cached_pid(void) {
+@@ -1121,11 +1124,15 @@ void reset_cached_pid(void) {
          cached_pid = CACHED_PID_UNSET;
  }
  
@@ -40,6 +41,3 @@ index 0851613fc9..4417101569 100644
  
  pid_t getpid_cached(void) {
          static bool installed = false;
--- 
-2.27.0
-
diff --git a/meta/recipes-core/systemd/systemd/0010-Use-uintmax_t-for-handling-rlim_t.patch b/meta/recipes-core/systemd/systemd/0010-Use-uintmax_t-for-handling-rlim_t.patch
index aeacd865ae..af1a6bb053 100644
--- a/meta/recipes-core/systemd/systemd/0010-Use-uintmax_t-for-handling-rlim_t.patch
+++ b/meta/recipes-core/systemd/systemd/0010-Use-uintmax_t-for-handling-rlim_t.patch
@@ -1,7 +1,7 @@
-From e45bb02174812e4935214f42a18725be320770d5 Mon Sep 17 00:00:00 2001
+From dc40487e0ac26e3ca317429b9c3e8f01772de60a Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:12:41 +0800
-Subject: [PATCH 10/26] Use uintmax_t for handling rlim_t
+Subject: [PATCH] Use uintmax_t for handling rlim_t
 
 PRIu{32,64} is not right format to represent rlim_t type
 therefore use %ju and typecast the rlim_t variables to
@@ -20,6 +20,7 @@ Upstream-Status: Denied [https://github.com/systemd/systemd/pull/7199]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 [Rebased for v241]
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+
 ---
  src/basic/format-util.h |  8 +-------
  src/basic/rlimit-util.c | 10 +++++-----
@@ -46,10 +47,10 @@ index b7e18768e3..3195ab205d 100644
  #if SIZEOF_DEV_T == 8
  #  define DEV_FMT "%" PRIu64
 diff --git a/src/basic/rlimit-util.c b/src/basic/rlimit-util.c
-index 880976312c..9e1b61cd4a 100644
+index 23d108d5df..94373c9422 100644
 --- a/src/basic/rlimit-util.c
 +++ b/src/basic/rlimit-util.c
-@@ -306,13 +306,13 @@ int rlimit_format(const struct rlimit *rl, char **ret) {
+@@ -308,13 +308,13 @@ int rlimit_format(const struct rlimit *rl, char **ret) {
          if (rl->rlim_cur >= RLIM_INFINITY && rl->rlim_max >= RLIM_INFINITY)
                  s = strdup("infinity");
          else if (rl->rlim_cur >= RLIM_INFINITY)
@@ -67,7 +68,7 @@ index 880976312c..9e1b61cd4a 100644
  
          if (!s)
                  return -ENOMEM;
-@@ -403,7 +403,7 @@ int rlimit_nofile_safe(void) {
+@@ -405,7 +405,7 @@ int rlimit_nofile_safe(void) {
  
          rl.rlim_cur = FD_SETSIZE;
          if (setrlimit(RLIMIT_NOFILE, &rl) < 0)
@@ -77,10 +78,10 @@ index 880976312c..9e1b61cd4a 100644
          return 1;
  }
 diff --git a/src/core/execute.c b/src/core/execute.c
-index 89632e0582..335283776c 100644
+index f82fc294c0..4696d055a8 100644
 --- a/src/core/execute.c
 +++ b/src/core/execute.c
-@@ -5288,9 +5288,9 @@ void exec_context_dump(const ExecContext *c, FILE* f, const char *prefix) {
+@@ -5370,9 +5370,9 @@ void exec_context_dump(const ExecContext *c, FILE* f, const char *prefix) {
          for (unsigned i = 0; i < RLIM_NLIMITS; i++)
                  if (c->rlimit[i]) {
                          fprintf(f, "%sLimit%s: " RLIM_FMT "\n",
@@ -92,6 +93,3 @@ index 89632e0582..335283776c 100644
                  }
  
          if (c->ioprio_set) {
--- 
-2.27.0
-
diff --git a/meta/recipes-core/systemd/systemd/0011-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch b/meta/recipes-core/systemd/systemd/0011-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
index 6d7fdbcb64..b1d782719c 100644
--- a/meta/recipes-core/systemd/systemd/0011-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
+++ b/meta/recipes-core/systemd/systemd/0011-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
@@ -1,13 +1,13 @@
-From d1db531ddd3bbf94d5e764b7917bcc8684ff6357 Mon Sep 17 00:00:00 2001
+From f8be7b283309e4332eedc088774daac637afef7b Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Wed, 28 Feb 2018 21:25:22 -0800
-Subject: [PATCH 11/26] test-sizeof.c: Disable tests for missing typedefs in
- musl
+Subject: [PATCH] test-sizeof.c: Disable tests for missing typedefs in musl
 
 Upstream-Status: Inappropriate [musl specific]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+
 ---
  src/test/test-sizeof.c | 4 ++++
  1 file changed, 4 insertions(+)
@@ -37,6 +37,3 @@ index 3c9dc180fa..e1a59d408c 100644
          info(pid_t);
          info(uid_t);
          info(gid_t);
--- 
-2.27.0
-
diff --git a/meta/recipes-core/systemd/systemd/0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch b/meta/recipes-core/systemd/systemd/0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
index c15b6e7d82..5f2178734d 100644
--- a/meta/recipes-core/systemd/systemd/0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
+++ b/meta/recipes-core/systemd/systemd/0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
@@ -1,7 +1,7 @@
-From 03e89da266edf70121a19ffc32a78cc3b97585ef Mon Sep 17 00:00:00 2001
+From 06915b70735caa66987af758ebdc4207757ae758 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Tue, 10 Oct 2017 14:33:30 -0700
-Subject: [PATCH 12/26] don't pass AT_SYMLINK_NOFOLLOW flag to faccessat()
+Subject: [PATCH] don't pass AT_SYMLINK_NOFOLLOW flag to faccessat()
 
 Avoid using AT_SYMLINK_NOFOLLOW flag. It doesn't seem like the right
 thing to do and it's not portable (not supported by musl). See:
@@ -25,20 +25,22 @@ just historical and not actually necessary or desired behaviour?
 Upstream-Status: Inappropriate [musl specific]
 
 Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+
 ---
- src/basic/fs-util.h          | 22 +++++++++++++++++++++-
+ src/basic/fs-util.h          | 23 +++++++++++++++++++++--
  src/shared/base-filesystem.c |  6 +++---
- 2 files changed, 24 insertions(+), 4 deletions(-)
+ 2 files changed, 24 insertions(+), 5 deletions(-)
 
 diff --git a/src/basic/fs-util.h b/src/basic/fs-util.h
-index 5dc8853eac..0491b3dae2 100644
+index 027037f7a7..16eb379caf 100644
 --- a/src/basic/fs-util.h
 +++ b/src/basic/fs-util.h
-@@ -43,7 +43,27 @@ int futimens_opath(int fd, const struct timespec ts[2]);
+@@ -44,8 +44,27 @@ int futimens_opath(int fd, const struct timespec ts[2]);
  int fd_warn_permissions(const char *path, int fd);
  int stat_warn_permissions(const char *path, const struct stat *st);
  
--#define laccess(path, mode) faccessat(AT_FDCWD, (path), (mode), AT_SYMLINK_NOFOLLOW)
+-#define laccess(path, mode)                                             \
+-        (faccessat(AT_FDCWD, (path), (mode), AT_SYMLINK_NOFOLLOW) < 0 ? -errno : 0)
 +/*
 +   Avoid using AT_SYMLINK_NOFOLLOW flag. It doesn't seem like the right thing to
 +   do and it's not portable (not supported by musl). See:
@@ -94,6 +96,3 @@ index 1d05409086..1ed06c31ab 100644
                                                  continue;
                                  }
  
--- 
-2.27.0
-
diff --git a/meta/recipes-core/systemd/systemd/0013-Define-glibc-compatible-basename-for-non-glibc-syste.patch b/meta/recipes-core/systemd/systemd/0013-Define-glibc-compatible-basename-for-non-glibc-syste.patch
index 89736bcfde..51b145729d 100644
--- a/meta/recipes-core/systemd/systemd/0013-Define-glibc-compatible-basename-for-non-glibc-syste.patch
+++ b/meta/recipes-core/systemd/systemd/0013-Define-glibc-compatible-basename-for-non-glibc-syste.patch
@@ -1,8 +1,7 @@
-From dd134880e9a16595ab473934577e873c748e9c7a Mon Sep 17 00:00:00 2001
+From 0c44af262cfa07c57db4b32de1f7610af47797f4 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 27 May 2018 08:36:44 -0700
-Subject: [PATCH 13/26] Define glibc compatible basename() for non-glibc
- systems
+Subject: [PATCH] Define glibc compatible basename() for non-glibc systems
 
 Fixes builds with musl, even though systemd is adamant about
 using non-posix basename implementation, we have a way out
@@ -10,12 +9,13 @@ using non-posix basename implementation, we have a way out
 Upstream-Status: Inappropriate [musl specific]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  src/machine/machine-dbus.c | 5 +++++
  1 file changed, 5 insertions(+)
 
 diff --git a/src/machine/machine-dbus.c b/src/machine/machine-dbus.c
-index f5780f1aec..aec5825b3e 100644
+index 3a1e4f9072..ab87b9882c 100644
 --- a/src/machine/machine-dbus.c
 +++ b/src/machine/machine-dbus.c
 @@ -11,6 +11,11 @@
@@ -30,6 +30,3 @@ index f5780f1aec..aec5825b3e 100644
  #include "alloc-util.h"
  #include "bus-common-errors.h"
  #include "bus-get-properties.h"
--- 
-2.27.0
-
diff --git a/meta/recipes-core/systemd/systemd/0014-Do-not-disable-buffering-when-writing-to-oom_score_a.patch b/meta/recipes-core/systemd/systemd/0014-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
index e95d2ae078..7444d4375f 100644
--- a/meta/recipes-core/systemd/systemd/0014-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
+++ b/meta/recipes-core/systemd/systemd/0014-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
@@ -1,7 +1,7 @@
-From 55af446156da863b5b36a1109845858956a4c274 Mon Sep 17 00:00:00 2001
+From 0f4b60e34a806055c678eb97a7ec7e21291bcf48 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Wed, 4 Jul 2018 15:00:44 +0800
-Subject: [PATCH 14/26] Do not disable buffering when writing to oom_score_adj
+Subject: [PATCH] Do not disable buffering when writing to oom_score_adj
 
 On musl, disabling buffering when writing to oom_score_adj will
 cause the following error.
@@ -19,15 +19,16 @@ Upstream-Status: Inappropriate [musl specific]
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 [rebased for systemd 243]
 Signed-off-by: Scott Murray <scott.murray@konsulko.com>
+
 ---
  src/basic/process-util.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/basic/process-util.c b/src/basic/process-util.c
-index 4417101569..556dab8ebf 100644
+index caa9dfe3a3..6101f43db5 100644
 --- a/src/basic/process-util.c
 +++ b/src/basic/process-util.c
-@@ -1536,7 +1536,7 @@ int set_oom_score_adjust(int value) {
+@@ -1523,7 +1523,7 @@ int set_oom_score_adjust(int value) {
          sprintf(t, "%i", value);
  
          return write_string_file("/proc/self/oom_score_adj", t,
@@ -36,6 +37,3 @@ index 4417101569..556dab8ebf 100644
  }
  
  int pidfd_get_pid(int fd, pid_t *ret) {
--- 
-2.27.0
-
diff --git a/meta/recipes-core/systemd/systemd/0015-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch b/meta/recipes-core/systemd/systemd/0015-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
index 5cdcf84dc1..90cc70d216 100644
--- a/meta/recipes-core/systemd/systemd/0015-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
+++ b/meta/recipes-core/systemd/systemd/0015-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
@@ -1,7 +1,7 @@
-From e382845aed90cfe4496a8351d57d4466dd2e9a9c Mon Sep 17 00:00:00 2001
+From c30ab62d18ce88187f5eb6c236e0977c9337f68d Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Tue, 10 Jul 2018 15:40:17 +0800
-Subject: [PATCH 15/26] distinguish XSI-compliant strerror_r from GNU-specifi
+Subject: [PATCH] distinguish XSI-compliant strerror_r from GNU-specifi
  strerror_r
 
 XSI-compliant strerror_r and GNU-specifi strerror_r are different.
@@ -18,28 +18,12 @@ assigned to (char *) variable, resulting in segment fault.
 Upstream-Status: Inappropriate [musl specific]
 
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+
 ---
- src/journal/journal-send.c        | 5 +++++
- src/libsystemd/sd-bus/bus-error.c | 5 +++++
+ src/libsystemd/sd-bus/bus-error.c        | 5 +++++
+ src/libsystemd/sd-journal/journal-send.c | 5 +++++
  2 files changed, 10 insertions(+)
 
-diff --git a/src/journal/journal-send.c b/src/journal/journal-send.c
-index e8e6ad555b..8ca5271d02 100644
---- a/src/journal/journal-send.c
-+++ b/src/journal/journal-send.c
-@@ -348,7 +348,12 @@ static int fill_iovec_perror_and_send(const char *message, int skip, struct iove
-                 char* j;
- 
-                 errno = 0;
-+#ifndef __GLIBC__
-+                strerror_r(_saved_errno_, buffer + 8 + k, n - 8 - k);
-+                j = buffer + 8 + k;
-+#else
-                 j = strerror_r(_saved_errno_, buffer + 8 + k, n - 8 - k);
-+#endif
-                 if (errno == 0) {
-                         char error[STRLEN("ERRNO=") + DECIMAL_STR_MAX(int) + 1];
- 
 diff --git a/src/libsystemd/sd-bus/bus-error.c b/src/libsystemd/sd-bus/bus-error.c
 index 8da2024a50..9605a9b869 100644
 --- a/src/libsystemd/sd-bus/bus-error.c
@@ -57,6 +41,20 @@ index 8da2024a50..9605a9b869 100644
                  if (errno == ERANGE || strlen(x) >= k - 1) {
                          free(m);
                          k *= 2;
--- 
-2.27.0
-
+diff --git a/src/libsystemd/sd-journal/journal-send.c b/src/libsystemd/sd-journal/journal-send.c
+index e8e6ad555b..8ca5271d02 100644
+--- a/src/libsystemd/sd-journal/journal-send.c
++++ b/src/libsystemd/sd-journal/journal-send.c
+@@ -348,7 +348,12 @@ static int fill_iovec_perror_and_send(const char *message, int skip, struct iove
+                 char* j;
+ 
+                 errno = 0;
++#ifndef __GLIBC__
++                strerror_r(_saved_errno_, buffer + 8 + k, n - 8 - k);
++                j = buffer + 8 + k;
++#else
+                 j = strerror_r(_saved_errno_, buffer + 8 + k, n - 8 - k);
++#endif
+                 if (errno == 0) {
+                         char error[STRLEN("ERRNO=") + DECIMAL_STR_MAX(int) + 1];
+ 
diff --git a/meta/recipes-core/systemd/systemd/0016-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch b/meta/recipes-core/systemd/systemd/0016-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch
index 9a125de638..de7f9ecfa2 100644
--- a/meta/recipes-core/systemd/systemd/0016-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch
+++ b/meta/recipes-core/systemd/systemd/0016-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch
@@ -1,7 +1,7 @@
-From 0c7af5f288231a8c0545e169e01ba5ee173cafe7 Mon Sep 17 00:00:00 2001
+From fa86e5578256dddb296fd30128929ea7c4b792a4 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:18:00 +0800
-Subject: [PATCH 16/26] Hide __start_BUS_ERROR_MAP and __stop_BUS_ERROR_MAP
+Subject: [PATCH] Hide __start_BUS_ERROR_MAP and __stop_BUS_ERROR_MAP
 
 for currently unknown reasons they get exported to the shared libries
 even without being listed in the sym file
@@ -11,6 +11,7 @@ Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 [Rebased for v241]
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+
 ---
  src/libsystemd/sd-bus/bus-error.c | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
@@ -30,6 +31,3 @@ index 9605a9b869..38b6cf90c3 100644
  
  /* Additional maps registered with sd_bus_error_add_map() are in this
   * NULL terminated array */
--- 
-2.27.0
-
diff --git a/meta/recipes-core/systemd/systemd/0017-missing_type.h-add-__compar_d_fn_t-definition.patch b/meta/recipes-core/systemd/systemd/0017-missing_type.h-add-__compar_d_fn_t-definition.patch
index 31747c6b40..d9ef2b8a47 100644
--- a/meta/recipes-core/systemd/systemd/0017-missing_type.h-add-__compar_d_fn_t-definition.patch
+++ b/meta/recipes-core/systemd/systemd/0017-missing_type.h-add-__compar_d_fn_t-definition.patch
@@ -1,7 +1,7 @@
-From 32dd7a47b87793cd836ab4bb776d1524f24c2d58 Mon Sep 17 00:00:00 2001
+From 11e730694706fa354a0e43c588ef66677a777d9a Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:27:54 +0800
-Subject: [PATCH 17/26] missing_type.h: add __compar_d_fn_t definition
+Subject: [PATCH] missing_type.h: add __compar_d_fn_t definition
 
 Fix the following compile failure:
 src/basic/util.h:71:18: error: unknown type name '__compar_d_fn_t'; did you mean '__compar_fn_t'?
@@ -9,6 +9,7 @@ src/basic/util.h:71:18: error: unknown type name '__compar_d_fn_t'; did you mean
 Upstream-Status: Inappropriate [musl specific]
 
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+
 ---
  src/basic/missing_type.h | 1 +
  1 file changed, 1 insertion(+)
@@ -25,6 +26,3 @@ index 3df1084ef2..697aa7f58a 100644
  #endif
  
  #ifndef __COMPAR_FN_T
--- 
-2.27.0
-
diff --git a/meta/recipes-core/systemd/systemd/0018-avoid-redefinition-of-prctl_mm_map-structure.patch b/meta/recipes-core/systemd/systemd/0018-avoid-redefinition-of-prctl_mm_map-structure.patch
index 56d361a213..3b60854233 100644
--- a/meta/recipes-core/systemd/systemd/0018-avoid-redefinition-of-prctl_mm_map-structure.patch
+++ b/meta/recipes-core/systemd/systemd/0018-avoid-redefinition-of-prctl_mm_map-structure.patch
@@ -1,7 +1,7 @@
-From bfc3416edeb69082ac9b9c9e844f12d7b45bb006 Mon Sep 17 00:00:00 2001
+From 45bae28d3da6607d33d54f4b30a500f5249aadde Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:44:54 +0800
-Subject: [PATCH 18/26] avoid redefinition of prctl_mm_map structure
+Subject: [PATCH] avoid redefinition of prctl_mm_map structure
 
 Fix the following compile failure:
 error: redefinition of 'struct prctl_mm_map'
@@ -9,6 +9,7 @@ error: redefinition of 'struct prctl_mm_map'
 Upstream-Status: Inappropriate [musl specific]
 
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+
 ---
  src/basic/missing_prctl.h | 2 ++
  1 file changed, 2 insertions(+)
@@ -27,6 +28,3 @@ index ab851306ba..5547cad875 100644
  
  /* 58319057b7847667f0c9585b9de0e8932b0fdb08 (4.3) */
  #ifndef PR_CAP_AMBIENT
--- 
-2.27.0
-
diff --git a/meta/recipes-core/systemd/systemd/0019-Handle-missing-LOCK_EX.patch b/meta/recipes-core/systemd/systemd/0019-Handle-missing-LOCK_EX.patch
index 6ca196489b..7d6433f317 100644
--- a/meta/recipes-core/systemd/systemd/0019-Handle-missing-LOCK_EX.patch
+++ b/meta/recipes-core/systemd/systemd/0019-Handle-missing-LOCK_EX.patch
@@ -1,16 +1,17 @@
-From e427f03de2c56e868bb0f24aa231315b2dae1b71 Mon Sep 17 00:00:00 2001
+From 6e593ff2afbe4bfe15eee2ec34e51490a38462f5 Mon Sep 17 00:00:00 2001
 From: Alex Kiernan <alex.kiernan@gmail.com>
 Date: Fri, 7 Aug 2020 15:19:27 +0000
-Subject: [PATCH 19/26] Handle missing LOCK_EX
+Subject: [PATCH] Handle missing LOCK_EX
 
 Upstream-Status: Inappropriate [musl specific]
 Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+
 ---
  src/partition/makefs.c | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/src/partition/makefs.c b/src/partition/makefs.c
-index fd924d2231..b97580fdcc 100644
+index 7c94fbfedb..42f966722d 100644
 --- a/src/partition/makefs.c
 +++ b/src/partition/makefs.c
 @@ -6,6 +6,7 @@
@@ -21,6 +22,3 @@ index fd924d2231..b97580fdcc 100644
  
  #include "alloc-util.h"
  #include "blockdev-util.h"
--- 
-2.27.0
-
diff --git a/meta/recipes-core/systemd/systemd/0020-Fix-incompatible-pointer-type-struct-sockaddr_un.patch b/meta/recipes-core/systemd/systemd/0020-Fix-incompatible-pointer-type-struct-sockaddr_un.patch
index f74de43849..1faee1c055 100644
--- a/meta/recipes-core/systemd/systemd/0020-Fix-incompatible-pointer-type-struct-sockaddr_un.patch
+++ b/meta/recipes-core/systemd/systemd/0020-Fix-incompatible-pointer-type-struct-sockaddr_un.patch
@@ -1,7 +1,7 @@
-From 9abbc5e69e21aef0d4d4567e69302fa660b76c53 Mon Sep 17 00:00:00 2001
+From ac579b296aa29c2f1dad9425c6d795e154ec8f7c Mon Sep 17 00:00:00 2001
 From: Alex Kiernan <alex.kiernan@gmail.com>
 Date: Fri, 7 Aug 2020 15:20:17 +0000
-Subject: [PATCH 20/26] Fix incompatible pointer type struct sockaddr_un *
+Subject: [PATCH] Fix incompatible pointer type struct sockaddr_un *
 
 | ../../../../../../workspace/sources/systemd/src/nspawn/nspawn.c: In function 'cant_be_in_netns':
 | ../../../../../../workspace/sources/systemd/src/nspawn/nspawn.c:4893:25: error: passing argument 2 of 'connect' from incompatible pointer type [-Werror=incompatible-pointer-types]
@@ -18,15 +18,16 @@ Subject: [PATCH 20/26] Fix incompatible pointer type struct sockaddr_un *
 
 Upstream-Status: Inappropriate [musl specific]
 Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+
 ---
  src/nspawn/nspawn.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/nspawn/nspawn.c b/src/nspawn/nspawn.c
-index 0842731c18..3528b7ff14 100644
+index a4ac8ed2bb..0c41a48d4b 100644
 --- a/src/nspawn/nspawn.c
 +++ b/src/nspawn/nspawn.c
-@@ -5084,7 +5084,7 @@ static int cant_be_in_netns(void) {
+@@ -5125,7 +5125,7 @@ static int cant_be_in_netns(void) {
          if (fd < 0)
                  return log_error_errno(errno, "Failed to allocate udev control socket: %m");
  
@@ -35,6 +36,3 @@ index 0842731c18..3528b7ff14 100644
  
                  if (errno == ENOENT || ERRNO_IS_DISCONNECT(errno))
                          return log_error_errno(SYNTHETIC_ERRNO(EOPNOTSUPP),
--- 
-2.27.0
-
diff --git a/meta/recipes-core/systemd/systemd/0021-test-json.c-define-M_PIl.patch b/meta/recipes-core/systemd/systemd/0021-test-json.c-define-M_PIl.patch
index fa6652a5bf..14c8ff73a0 100644
--- a/meta/recipes-core/systemd/systemd/0021-test-json.c-define-M_PIl.patch
+++ b/meta/recipes-core/systemd/systemd/0021-test-json.c-define-M_PIl.patch
@@ -1,7 +1,7 @@
-From 1f5bc54bed0b365e7e448c26f6c792dbe8b3b198 Mon Sep 17 00:00:00 2001
+From 6bc78df50adb48d24a2abfdf65b44b932cc5a571 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 16:53:06 +0800
-Subject: [PATCH 21/26] test-json.c: define M_PIl
+Subject: [PATCH] test-json.c: define M_PIl
 
 Fix the following compile failure:
 src/test/test-json.c:305:50: error: 'M_PIl' undeclared (first use in this function); did you mean 'M_PI'?
@@ -9,6 +9,7 @@ src/test/test-json.c:305:50: error: 'M_PIl' undeclared (first use in this functi
 Upstream-Status: Inappropriate [musl specific]
 
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+
 ---
  src/test/test-json.c | 4 ++++
  1 file changed, 4 insertions(+)
@@ -28,6 +29,3 @@ index 1d4b11945e..572c8cf9d0 100644
  static void test_tokenizer(const char *data, ...) {
          unsigned line = 0, column = 0;
          void *state = NULL;
--- 
-2.27.0
-
diff --git a/meta/recipes-core/systemd/systemd/0022-do-not-disable-buffer-in-writing-files.patch b/meta/recipes-core/systemd/systemd/0022-do-not-disable-buffer-in-writing-files.patch
index 675fd20f11..bd627c51e9 100644
--- a/meta/recipes-core/systemd/systemd/0022-do-not-disable-buffer-in-writing-files.patch
+++ b/meta/recipes-core/systemd/systemd/0022-do-not-disable-buffer-in-writing-files.patch
@@ -1,7 +1,7 @@
-From 564dba5ad0cd884e3f69fa19ca64095413578ea5 Mon Sep 17 00:00:00 2001
+From 7cb6579572b50ef44bc0a321a4c73cce55b0c2f2 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Fri, 1 Mar 2019 15:22:15 +0800
-Subject: [PATCH 22/26] do not disable buffer in writing files
+Subject: [PATCH] do not disable buffer in writing files
 
 Do not disable buffer in writing files, otherwise we get
 failure at boot for musl like below.
@@ -18,10 +18,12 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
 [rebased for systemd 243]
 Signed-off-by: Scott Murray <scott.murray@konsulko.com>
+
 ---
  src/basic/cgroup-util.c                 | 10 +++++-----
  src/basic/procfs-util.c                 |  4 ++--
  src/basic/smack-util.c                  |  2 +-
+ src/basic/sysctl-util.c                 |  2 +-
  src/basic/util.c                        |  2 +-
  src/binfmt/binfmt.c                     |  6 +++---
  src/core/main.c                         |  4 ++--
@@ -32,18 +34,15 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  src/nspawn/nspawn-cgroup.c              |  2 +-
  src/nspawn/nspawn.c                     |  6 +++---
  src/shared/cgroup-setup.c               |  4 ++--
- src/shared/sysctl-util.c                |  2 +-
  src/sleep/sleep.c                       |  8 ++++----
- src/udev/udevadm-trigger.c              |  2 +-
- src/udev/udevd.c                        |  2 +-
  src/vconsole/vconsole-setup.c           |  2 +-
- 18 files changed, 35 insertions(+), 35 deletions(-)
+ 16 files changed, 33 insertions(+), 33 deletions(-)
 
 diff --git a/src/basic/cgroup-util.c b/src/basic/cgroup-util.c
-index bb960f183c..cb804c5f4b 100644
+index 50c1ae1b2b..5b40e92163 100644
 --- a/src/basic/cgroup-util.c
 +++ b/src/basic/cgroup-util.c
-@@ -759,7 +759,7 @@ int cg_install_release_agent(const char *controller, const char *agent) {
+@@ -765,7 +765,7 @@ int cg_install_release_agent(const char *controller, const char *agent) {
  
          sc = strstrip(contents);
          if (isempty(sc)) {
@@ -52,7 +51,7 @@ index bb960f183c..cb804c5f4b 100644
                  if (r < 0)
                          return r;
          } else if (!path_equal(sc, agent))
-@@ -777,7 +777,7 @@ int cg_install_release_agent(const char *controller, const char *agent) {
+@@ -783,7 +783,7 @@ int cg_install_release_agent(const char *controller, const char *agent) {
  
          sc = strstrip(contents);
          if (streq(sc, "0")) {
@@ -61,7 +60,7 @@ index bb960f183c..cb804c5f4b 100644
                  if (r < 0)
                          return r;
  
-@@ -804,7 +804,7 @@ int cg_uninstall_release_agent(const char *controller) {
+@@ -810,7 +810,7 @@ int cg_uninstall_release_agent(const char *controller) {
          if (r < 0)
                  return r;
  
@@ -70,7 +69,7 @@ index bb960f183c..cb804c5f4b 100644
          if (r < 0)
                  return r;
  
-@@ -814,7 +814,7 @@ int cg_uninstall_release_agent(const char *controller) {
+@@ -820,7 +820,7 @@ int cg_uninstall_release_agent(const char *controller) {
          if (r < 0)
                  return r;
  
@@ -79,7 +78,7 @@ index bb960f183c..cb804c5f4b 100644
          if (r < 0)
                  return r;
  
-@@ -1646,7 +1646,7 @@ int cg_set_attribute(const char *controller, const char *path, const char *attri
+@@ -1650,7 +1650,7 @@ int cg_set_attribute(const char *controller, const char *path, const char *attri
          if (r < 0)
                  return r;
  
@@ -121,11 +120,24 @@ index 3362ee3924..80c0f2a52e 100644
          if (r < 0)
                  return r;
  
+diff --git a/src/basic/sysctl-util.c b/src/basic/sysctl-util.c
+index c96b5cd77f..d2476d9665 100644
+--- a/src/basic/sysctl-util.c
++++ b/src/basic/sysctl-util.c
+@@ -93,7 +93,7 @@ int sysctl_write_ip_property(int af, const char *ifname, const char *property, c
+ 
+         log_debug("Setting '%s' to '%s'", p, value);
+ 
+-        return write_string_file(p, value, WRITE_STRING_FILE_VERIFY_ON_FAILURE | WRITE_STRING_FILE_DISABLE_BUFFER);
++        return write_string_file(p, value, WRITE_STRING_FILE_VERIFY_ON_FAILURE | 0);
+ }
+ 
+ int sysctl_read(const char *property, char **ret) {
 diff --git a/src/basic/util.c b/src/basic/util.c
-index f98ecf3858..13e0f7431f 100644
+index 955b18bd2a..6d89c90176 100644
 --- a/src/basic/util.c
 +++ b/src/basic/util.c
-@@ -267,7 +267,7 @@ void disable_coredumps(void) {
+@@ -234,7 +234,7 @@ void disable_coredumps(void) {
          if (detect_container() > 0)
                  return;
  
@@ -135,7 +147,7 @@ index f98ecf3858..13e0f7431f 100644
                  log_debug_errno(r, "Failed to turn off coredumps, ignoring: %m");
  }
 diff --git a/src/binfmt/binfmt.c b/src/binfmt/binfmt.c
-index 43ed2f385b..37a6f578f7 100644
+index f6b72e0bae..e9fd4d06be 100644
 --- a/src/binfmt/binfmt.c
 +++ b/src/binfmt/binfmt.c
 @@ -48,7 +48,7 @@ static int delete_rule(const char *rule) {
@@ -156,7 +168,7 @@ index 43ed2f385b..37a6f578f7 100644
          if (r < 0)
                  return log_error_errno(r, "Failed to add binary format: %m");
  
-@@ -223,7 +223,7 @@ static int run(int argc, char *argv[]) {
+@@ -222,7 +222,7 @@ static int run(int argc, char *argv[]) {
                  }
  
                  /* Flush out all rules */
@@ -166,10 +178,10 @@ index 43ed2f385b..37a6f578f7 100644
                  STRV_FOREACH(f, files) {
                          k = apply_file(*f, true);
 diff --git a/src/core/main.c b/src/core/main.c
-index a280b756ff..334532cd42 100644
+index 3ee8d0a869..ec36e3e80f 100644
 --- a/src/core/main.c
 +++ b/src/core/main.c
-@@ -1382,7 +1382,7 @@ static int bump_unix_max_dgram_qlen(void) {
+@@ -1401,7 +1401,7 @@ static int bump_unix_max_dgram_qlen(void) {
          if (v >= DEFAULT_UNIX_MAX_DGRAM_QLEN)
                  return 0;
  
@@ -178,7 +190,7 @@ index a280b756ff..334532cd42 100644
          if (r < 0)
                  return log_full_errno(IN_SET(r, -EROFS, -EPERM, -EACCES) ? LOG_DEBUG : LOG_WARNING, r,
                                        "Failed to bump AF_UNIX datagram queue length, ignoring: %m");
-@@ -1666,7 +1666,7 @@ static void initialize_core_pattern(bool skip_setup) {
+@@ -1678,7 +1678,7 @@ static void initialize_core_pattern(bool skip_setup) {
          if (getpid_cached() != 1)
                  return;
  
@@ -188,7 +200,7 @@ index a280b756ff..334532cd42 100644
                  log_warning_errno(r, "Failed to write '%s' to /proc/sys/kernel/core_pattern, ignoring: %m", arg_early_core_pattern);
  }
 diff --git a/src/core/smack-setup.c b/src/core/smack-setup.c
-index 1fe592af70..603942a000 100644
+index 8cc1696a4f..ab7b4ba2c3 100644
 --- a/src/core/smack-setup.c
 +++ b/src/core/smack-setup.c
 @@ -325,17 +325,17 @@ int mac_smack_setup(bool *loaded_policy) {
@@ -214,7 +226,7 @@ index 1fe592af70..603942a000 100644
                  log_warning_errno(r, "Failed to set SMACK netlabel rule \"127.0.0.1 -CIPSO\": %m");
  #endif
 diff --git a/src/hibernate-resume/hibernate-resume.c b/src/hibernate-resume/hibernate-resume.c
-index d8f91f4e66..a088e6e2d8 100644
+index 58e35e403e..1d0beb4008 100644
 --- a/src/hibernate-resume/hibernate-resume.c
 +++ b/src/hibernate-resume/hibernate-resume.c
 @@ -45,7 +45,7 @@ int main(int argc, char *argv[]) {
@@ -227,20 +239,20 @@ index d8f91f4e66..a088e6e2d8 100644
                  log_error_errno(r, "Failed to write '%s' to /sys/power/resume: %m", major_minor);
                  return EXIT_FAILURE;
 diff --git a/src/libsystemd/sd-device/sd-device.c b/src/libsystemd/sd-device/sd-device.c
-index d06f90ce1d..43d0a58750 100644
+index d82f01a164..b8fd63346c 100644
 --- a/src/libsystemd/sd-device/sd-device.c
 +++ b/src/libsystemd/sd-device/sd-device.c
-@@ -1976,7 +1976,7 @@ _public_ int sd_device_set_sysattr_value(sd_device *device, const char *sysattr,
+@@ -1987,7 +1987,7 @@ _public_ int sd_device_set_sysattr_value(sd_device *device, const char *sysattr,
          if (!value)
                  return -ENOMEM;
  
 -        r = write_string_file(path, value, WRITE_STRING_FILE_DISABLE_BUFFER | WRITE_STRING_FILE_NOFOLLOW);
 +        r = write_string_file(path, value, 0 | WRITE_STRING_FILE_NOFOLLOW);
          if (r < 0) {
-                 if (r == -ELOOP)
-                         return -EINVAL;
+                 /* On failure, clear cache entry, as we do not know how it fails. */
+                 device_remove_cached_sysattr_value(device, sysattr);
 diff --git a/src/login/logind-dbus.c b/src/login/logind-dbus.c
-index 7d757aa286..a5d9da5b7e 100644
+index 3bc424b83b..5f5eef0843 100644
 --- a/src/login/logind-dbus.c
 +++ b/src/login/logind-dbus.c
 @@ -1330,7 +1330,7 @@ static int trigger_device(Manager *m, sd_device *d) {
@@ -266,10 +278,10 @@ index cb01b25bc6..e92051268b 100644
                  log_error_errno(r, "Failed to move process: %m");
                  goto finish;
 diff --git a/src/nspawn/nspawn.c b/src/nspawn/nspawn.c
-index 3528b7ff14..11b0c20f95 100644
+index 0c41a48d4b..9c893b18e4 100644
 --- a/src/nspawn/nspawn.c
 +++ b/src/nspawn/nspawn.c
-@@ -2667,7 +2667,7 @@ static int reset_audit_loginuid(void) {
+@@ -2695,7 +2695,7 @@ static int reset_audit_loginuid(void) {
          if (streq(p, "4294967295"))
                  return 0;
  
@@ -278,7 +290,7 @@ index 3528b7ff14..11b0c20f95 100644
          if (r < 0) {
                  log_error_errno(r,
                                  "Failed to reset audit login UID. This probably means that your kernel is too\n"
-@@ -3920,13 +3920,13 @@ static int setup_uid_map(pid_t pid) {
+@@ -3948,13 +3948,13 @@ static int setup_uid_map(pid_t pid) {
  
          xsprintf(uid_map, "/proc/" PID_FMT "/uid_map", pid);
          xsprintf(line, UID_FMT " " UID_FMT " " UID_FMT "\n", 0, arg_uid_shift, arg_uid_range);
@@ -316,21 +328,8 @@ index f197f715c7..077f893177 100644
                          if (r < 0) {
                                  log_debug_errno(r, "Failed to %s controller %s for %s (%s): %m",
                                                  FLAGS_SET(mask, bit) ? "enable" : "disable", n, p, fs);
-diff --git a/src/shared/sysctl-util.c b/src/shared/sysctl-util.c
-index 670c33108b..7c7c3dcfb6 100644
---- a/src/shared/sysctl-util.c
-+++ b/src/shared/sysctl-util.c
-@@ -93,7 +93,7 @@ int sysctl_write_ip_property(int af, const char *ifname, const char *property, c
- 
-         log_debug("Setting '%s' to '%s'", p, value);
- 
--        return write_string_file(p, value, WRITE_STRING_FILE_VERIFY_ON_FAILURE | WRITE_STRING_FILE_DISABLE_BUFFER);
-+        return write_string_file(p, value, WRITE_STRING_FILE_VERIFY_ON_FAILURE | 0);
- }
- 
- int sysctl_read(const char *property, char **content) {
 diff --git a/src/sleep/sleep.c b/src/sleep/sleep.c
-index 39ab554290..d0e566645d 100644
+index 262d4cea66..0523e8dc9b 100644
 --- a/src/sleep/sleep.c
 +++ b/src/sleep/sleep.c
 @@ -48,7 +48,7 @@ static int write_hibernate_location_info(const HibernateLocation *hibernate_loca
@@ -369,34 +368,8 @@ index 39ab554290..d0e566645d 100644
                  if (k >= 0)
                          return 0;
                  log_debug_errno(k, "Failed to write '%s' to /sys/power/state: %m", *state);
-diff --git a/src/udev/udevadm-trigger.c b/src/udev/udevadm-trigger.c
-index 5c74184c33..65f528314e 100644
---- a/src/udev/udevadm-trigger.c
-+++ b/src/udev/udevadm-trigger.c
-@@ -43,7 +43,7 @@ static int exec_list(sd_device_enumerator *e, const char *action, Set **settle_s
-                 if (!filename)
-                         return log_oom();
- 
--                r = write_string_file(filename, action, WRITE_STRING_FILE_DISABLE_BUFFER);
-+                r = write_string_file(filename, action, 0);
-                 if (r < 0) {
-                         bool ignore = IN_SET(r, -ENOENT, -ENODEV);
- 
-diff --git a/src/udev/udevd.c b/src/udev/udevd.c
-index d24b8d4398..d123a43904 100644
---- a/src/udev/udevd.c
-+++ b/src/udev/udevd.c
-@@ -1192,7 +1192,7 @@ static int synthesize_change_one(sd_device *dev, const char *syspath) {
- 
-         filename = strjoina(syspath, "/uevent");
-         log_device_debug(dev, "device is closed, synthesising 'change' on %s", syspath);
--        r = write_string_file(filename, "change", WRITE_STRING_FILE_DISABLE_BUFFER);
-+        r = write_string_file(filename, "change", 0);
-         if (r < 0)
-                 return log_device_debug_errno(dev, r, "Failed to write 'change' to %s: %m", filename);
-         return 0;
 diff --git a/src/vconsole/vconsole-setup.c b/src/vconsole/vconsole-setup.c
-index b28e2853e1..115b7233a0 100644
+index d1c3febdd5..1cc68694d1 100644
 --- a/src/vconsole/vconsole-setup.c
 +++ b/src/vconsole/vconsole-setup.c
 @@ -116,7 +116,7 @@ static int toggle_utf8_vc(const char *name, int fd, bool utf8) {
@@ -408,6 +381,3 @@ index b28e2853e1..115b7233a0 100644
          if (r < 0)
                  return log_warning_errno(r, "Failed to %s sysfs UTF-8 flag: %m", enable_disable(utf8));
  
--- 
-2.27.0
-
diff --git a/meta/recipes-core/systemd/systemd/0025-Handle-__cpu_mask-usage.patch b/meta/recipes-core/systemd/systemd/0025-Handle-__cpu_mask-usage.patch
index 1cc3985d12..7d1bd60255 100644
--- a/meta/recipes-core/systemd/systemd/0025-Handle-__cpu_mask-usage.patch
+++ b/meta/recipes-core/systemd/systemd/0025-Handle-__cpu_mask-usage.patch
@@ -1,7 +1,7 @@
-From bbda4a48a34662393117fc677c3a678d4ce4c2ec Mon Sep 17 00:00:00 2001
+From d73755cc60f401f0f20f357752e45aeeeef8e83f Mon Sep 17 00:00:00 2001
 From: Scott Murray <scott.murray@konsulko.com>
 Date: Fri, 13 Sep 2019 19:26:27 -0400
-Subject: [PATCH 25/26] Handle __cpu_mask usage
+Subject: [PATCH] Handle __cpu_mask usage
 
 Fixes errors:
 
@@ -18,6 +18,7 @@ add a typedef to cpu-set-util.h defining __cpu_mask appropriately.
 Upstream-Status: Inappropriate [musl specific]
 
 Signed-off-by: Scott Murray <scott.murray@konsulko.com>
+
 ---
  src/shared/cpu-set-util.h | 2 ++
  src/test/test-sizeof.c    | 2 +-
@@ -55,6 +56,3 @@ index e1a59d408c..c269ea6e8c 100644
  
  /* Print information about various types. Useful when diagnosing
   * gcc diagnostics on an unfamiliar architecture. */
--- 
-2.27.0
-
diff --git a/meta/recipes-core/systemd/systemd/0026-Handle-missing-gshadow.patch b/meta/recipes-core/systemd/systemd/0026-Handle-missing-gshadow.patch
index 4180afb08e..068600fa44 100644
--- a/meta/recipes-core/systemd/systemd/0026-Handle-missing-gshadow.patch
+++ b/meta/recipes-core/systemd/systemd/0026-Handle-missing-gshadow.patch
@@ -1,7 +1,7 @@
-From 47bf88f74717b417e4adbcc04256334b2335c873 Mon Sep 17 00:00:00 2001
+From 04e94f9a15101daa8f65a9af269d26cda2a24056 Mon Sep 17 00:00:00 2001
 From: Alex Kiernan <alex.kiernan@gmail.com>
 Date: Tue, 10 Mar 2020 11:05:20 +0000
-Subject: [PATCH 26/26] Handle missing gshadow
+Subject: [PATCH] Handle missing gshadow
 
 gshadow usage is now present in the userdb code. Mask all uses of it to
 allow compilation on musl
@@ -10,6 +10,7 @@ Upstream-Status: Inappropriate [musl specific]
 Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
 [Rebased for v247]
 Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
+
 ---
  src/shared/user-record-nss.c | 20 ++++++++++++++++++++
  src/shared/user-record-nss.h |  4 ++++
@@ -138,10 +139,10 @@ index 22ab04d6ee..4e52e7a911 100644
  #include <shadow.h>
  
 diff --git a/src/shared/userdb.c b/src/shared/userdb.c
-index 2d480283d1..0d19764f2e 100644
+index 613350bd46..5c821d28cd 100644
 --- a/src/shared/userdb.c
 +++ b/src/shared/userdb.c
-@@ -929,13 +929,16 @@ int groupdb_iterator_get(UserDBIterator *iterator, GroupRecord **ret) {
+@@ -938,13 +938,16 @@ int groupdb_iterator_get(UserDBIterator *iterator, GroupRecord **ret) {
                  if (gr) {
                          _cleanup_free_ char *buffer = NULL;
                          bool incomplete = false;
@@ -155,10 +156,10 @@ index 2d480283d1..0d19764f2e 100644
                                  iterator->synthesize_nobody = false;
  
 +#if ENABLE_GSHADOW
-                         r = nss_sgrp_for_group(gr, &sgrp, &buffer);
-                         if (r < 0) {
-                                 log_debug_errno(r, "Failed to acquire shadow entry for group %s, ignoring: %m", gr->gr_name);
-@@ -943,6 +946,9 @@ int groupdb_iterator_get(UserDBIterator *iterator, GroupRecord **ret) {
+                         if (!FLAGS_SET(iterator->flags, USERDB_AVOID_SHADOW)) {
+                                 r = nss_sgrp_for_group(gr, &sgrp, &buffer);
+                                 if (r < 0) {
+@@ -957,6 +960,9 @@ int groupdb_iterator_get(UserDBIterator *iterator, GroupRecord **ret) {
                          }
  
                          r = nss_group_to_group_record(gr, r >= 0 ? &sgrp : NULL, ret);
@@ -168,6 +169,3 @@ index 2d480283d1..0d19764f2e 100644
                          if (r < 0)
                                  return r;
  
--- 
-2.27.0
-
diff --git a/meta/recipes-core/systemd/systemd/0027-proc-dont-trigger-mount-error-with-invalid-options-o.patch b/meta/recipes-core/systemd/systemd/0027-proc-dont-trigger-mount-error-with-invalid-options-o.patch
deleted file mode 100644
index 94a4c307b5..0000000000
--- a/meta/recipes-core/systemd/systemd/0027-proc-dont-trigger-mount-error-with-invalid-options-o.patch
+++ /dev/null
@@ -1,97 +0,0 @@
-From 297aba739cd689e4dc9f43bb1422ec88d481099a Mon Sep 17 00:00:00 2001
-From: Paul Gortmaker <paul.gortmaker@windriver.com>
-Date: Wed, 13 Jan 2021 21:09:33 +0000
-Subject: [PATCH] proc: dont trigger mount error with invalid options on old
- kernels
-
-As of commit 4e39995371738b04d98d27b0d34ea8fe09ec9fab ("core: introduce
-ProtectProc= and ProcSubset= to expose hidepid= and subset= procfs
-mount options") kernels older than v5.8 generate multple warnings at
-boot, as seen in this Yocto build from today:
-
-     qemux86-64 login: root
-     [   65.829009] proc: Bad value for 'hidepid'
-     root@qemux86-64:~# dmesg|grep proc:
-     [   16.990706] proc: Bad value for 'hidepid'
-     [   28.060178] proc: Bad value for 'hidepid'
-     [   28.874229] proc: Bad value for 'hidepid'
-     [   32.685107] proc: Bad value for 'hidepid'
-     [   65.829009] proc: Bad value for 'hidepid'
-     root@qemux86-64:~#
-
-The systemd maintainer has dismissed this as something people should
-simply ignore[1] and has no interest in trying to avoid it by
-proactively checking the kernel version, so people can safely assume
-that they will never see this version check commit upstream.
-
-However, as can be seen above, telling people to just ignore it is not
-an option, as we'll end up answering the same question and dealing with
-the same bug over and over again.
-
-The commit that triggers this is systemd v247-rc1~378^2~3 -- so any
-systemd 247 and above plus kernel v5.7 or older will need this.
-
-[1] https://github.com/systemd/systemd/issues/16896
-
-Upstream-Status: Denied [https://github.com/systemd/systemd/issues/16896]
-Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
-
-Index: git/src/core/namespace.c
-===================================================================
---- git.orig/src/core/namespace.c
-+++ git/src/core/namespace.c
-@@ -4,7 +4,9 @@
- #include <linux/loop.h>
- #include <sched.h>
- #include <stdio.h>
-+#include <stdlib.h>
- #include <sys/mount.h>
-+#include <sys/utsname.h>
- #include <unistd.h>
- #include <linux/fs.h>
- 
-@@ -860,13 +862,32 @@ static int mount_sysfs(const MountEntry
- 
- static int mount_procfs(const MountEntry *m, const NamespaceInfo *ns_info) {
-         const char *entry_path;
--        int r;
-+        int r, major, minor;
-+        struct utsname uts;
-+        bool old = false;
- 
-         assert(m);
-         assert(ns_info);
- 
-         entry_path = mount_entry_path(m);
- 
-+        /* If uname says that the system is older than v5.8, then the textual hidepid= stuff is not
-+         * supported by the kernel, and thus the per-instance hidepid= neither, which means we
-+         * really don't want to use it, since it would affect our host's /proc * mount. Hence let's
-+         * gracefully fallback to a classic, unrestricted version. */
-+
-+        r = uname(&uts);
-+        if (r < 0)
-+               return errno;
-+
-+        major = atoi(uts.release);
-+        minor = atoi(strchr(uts.release, '.') + 1);
-+
-+        if (major < 5 || (major == 5 && minor < 8)) {
-+                log_debug("Pre v5.8 kernel detected [v%d.%d] - skipping hidepid=", major, minor);
-+                old = true;
-+        }
-+
-         /* Mount a new instance, so that we get the one that matches our user namespace, if we are running in
-          * one. i.e we don't reuse existing mounts here under any condition, we want a new instance owned by
-          * our user namespace and with our hidepid= settings applied. Hence, let's get rid of everything
-@@ -875,8 +896,8 @@ static int mount_procfs(const MountEntry
-         (void) mkdir_p_label(entry_path, 0755);
-         (void) umount_recursive(entry_path, 0);
- 
--        if (ns_info->protect_proc != PROTECT_PROC_DEFAULT ||
--            ns_info->proc_subset != PROC_SUBSET_ALL) {
-+        if (!old && (ns_info->protect_proc != PROTECT_PROC_DEFAULT ||
-+            ns_info->proc_subset != PROC_SUBSET_ALL)) {
-                 _cleanup_free_ char *opts = NULL;
- 
-                 /* Starting with kernel 5.8 procfs' hidepid= logic is truly per-instance (previously it
diff --git a/meta/recipes-core/systemd/systemd/0028-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch b/meta/recipes-core/systemd/systemd/0028-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch
index bbee6e6b28..2289404d8d 100644
--- a/meta/recipes-core/systemd/systemd/0028-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch
+++ b/meta/recipes-core/systemd/systemd/0028-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch
@@ -1,4 +1,4 @@
-From 7b32582c066549fea0f7180a6c575e7fa37a867f Mon Sep 17 00:00:00 2001
+From 366cd28f5f93ba7c861cd32a718251770d74830e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 12 Apr 2021 23:44:53 -0700
 Subject: [PATCH] missing_syscall.h: Define MIPS ABI defines for musl
@@ -10,15 +10,16 @@ them here in case they are undefined
 Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  src/basic/missing_syscall.h | 6 ++++++
  1 file changed, 6 insertions(+)
 
 diff --git a/src/basic/missing_syscall.h b/src/basic/missing_syscall.h
-index 0594a1b930..495d161334 100644
+index 1384324804..0202d00372 100644
 --- a/src/basic/missing_syscall.h
 +++ b/src/basic/missing_syscall.h
-@@ -15,6 +15,12 @@
+@@ -20,6 +20,12 @@
  #include <asm/sgidefs.h>
  #endif
  
@@ -28,9 +29,6 @@ index 0594a1b930..495d161334 100644
 +#define _MIPS_SIM_ABI64		3
 +#endif
 +
- #if defined(__x86_64__) && defined(__ILP32__)
- #  define systemd_SC_arch_bias(x) ((x) | /* __X32_SYSCALL_BIT */ 0x40000000)
- #elif defined(__ia64__)
--- 
-2.31.1
-
+ #include "missing_keyctl.h"
+ #include "missing_stat.h"
+ #include "missing_syscall_def.h"
diff --git a/meta/recipes-core/systemd/systemd_247.6.bb b/meta/recipes-core/systemd/systemd_248.3.bb
similarity index 99%
rename from meta/recipes-core/systemd/systemd_247.6.bb
rename to meta/recipes-core/systemd/systemd_248.3.bb
index ce6ac7ebaa..b241330d96 100644
--- a/meta/recipes-core/systemd/systemd_247.6.bb
+++ b/meta/recipes-core/systemd/systemd_248.3.bb
@@ -14,7 +14,8 @@ inherit useradd pkgconfig meson perlnative update-rc.d update-alternatives qemu
 # that we don't build both udev and systemd in world builds.
 REQUIRED_DISTRO_FEATURES = "systemd"
 
-SRC_URI += "file://touchscreen.rules \
+SRC_URI += " \
+           file://touchscreen.rules \
            file://00-create-volatile.conf \
            ${@bb.utils.contains('PACKAGECONFIG', 'polkit_hostnamed_fallback', 'file://org.freedesktop.hostname1_no_polkit.conf', '', d)} \
            ${@bb.utils.contains('PACKAGECONFIG', 'polkit_hostnamed_fallback', 'file://00-hostnamed-network-user.conf', '', d)} \
@@ -24,9 +25,6 @@ SRC_URI += "file://touchscreen.rules \
            file://0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
            file://0003-implment-systemd-sysv-install-for-OE.patch \
            file://0001-systemd.pc.in-use-ROOTPREFIX-without-suffixed-slash.patch \
-           file://0001-logind-Restore-chvt-as-non-root-user-without-polkit.patch \
-           file://0027-proc-dont-trigger-mount-error-with-invalid-options-o.patch \
-           file://0001-analyze-resolve-executable-path-if-it-is-relative.patch \
            "
 
 # patches needed by musl
@@ -474,6 +472,7 @@ FILES_${PN}-container = "${sysconfdir}/dbus-1/system.d/org.freedesktop.import1.c
                          ${rootlibexecdir}/systemd/systemd-machined \
                          ${rootlibexecdir}/systemd/systemd-pull \
                          ${exec_prefix}/lib/tmpfiles.d/systemd-nspawn.conf \
+                         ${exec_prefix}/lib/tmpfiles.d/README \
                          ${systemd_system_unitdir}/systemd-nspawn@.service \
                          ${libdir}/libnss_mymachines.so.2 \
                          ${datadir}/dbus-1/system-services/org.freedesktop.import1.service \
@@ -605,6 +604,7 @@ FILES_${PN} = " ${base_bindir}/* \
                 ${exec_prefix}/lib/environment.d \
                 ${localstatedir} \
                 ${rootlibexecdir}/modprobe.d/systemd.conf \
+                ${rootlibexecdir}/modprobe.d/README \
                 ${datadir}/dbus-1/system.d/org.freedesktop.timedate1.conf \
                 ${datadir}/dbus-1/system.d/org.freedesktop.locale1.conf \
                 ${datadir}/dbus-1/system.d/org.freedesktop.network1.conf \
@@ -647,6 +647,7 @@ FILES_udev += "${base_sbindir}/udevd \
                ${rootlibexecdir}/udev/ata_id \
                ${rootlibexecdir}/udev/cdrom_id \
                ${rootlibexecdir}/udev/collect \
+               ${rootlibexecdir}/udev/dmi_memory_id \
                ${rootlibexecdir}/udev/fido_id \
                ${rootlibexecdir}/udev/findkeyboards \
                ${rootlibexecdir}/udev/keyboard-force-release.sh \
@@ -674,6 +675,7 @@ FILES_udev += "${base_sbindir}/udevd \
                ${rootlibexecdir}/udev/rules.d/61-autosuspend-manual.rules \
                ${rootlibexecdir}/udev/rules.d/64-btrfs.rules \
                ${rootlibexecdir}/udev/rules.d/70-joystick.rules \
+               ${rootlibexecdir}/udev/rules.d/70-memory.rules \
                ${rootlibexecdir}/udev/rules.d/70-mouse.rules \
                ${rootlibexecdir}/udev/rules.d/70-power-switch.rules \
                ${rootlibexecdir}/udev/rules.d/70-touchpad.rules \
@@ -683,6 +685,7 @@ FILES_udev += "${base_sbindir}/udevd \
                ${rootlibexecdir}/udev/rules.d/80-drivers.rules \
                ${rootlibexecdir}/udev/rules.d/80-net-setup-link.rules \
                ${rootlibexecdir}/udev/rules.d/90-vconsole.rules \
+               ${rootlibexecdir}/udev/rules.d/README \
                ${sysconfdir}/udev \
                ${sysconfdir}/init.d/systemd-udevd \
                ${systemd_unitdir}/system/*udev* \
-- 
2.31.1

